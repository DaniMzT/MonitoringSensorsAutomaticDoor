<?php 
session_start(); //use this wherever we share variables between files. 
//SESSION only works with Cookies. Not working from Postman (array(0)) or cross-domain requests, for example
?>
<?php include 'sendEmail.php'; ?>
<?php     
    //reading from POST request,at the beginning to work with them before sending alarm to database
    //MAKE SURE enable_post_data_reading = On !!!
    //$valuespost = $_POST;
    //echo microtime(true); //start
    $t = $_POST['T'];
    $h = $_POST['H'];
    $c = $_POST['C'];
    $p = $_POST['P'];
    $s = $_POST['S'];
    $d = $_POST['D'];
    $posta = $_POST['A']; //add new cycle
    $emstop = $_POST['E']; //emergency stop active in the test bench. Receiving 0 or 1
    $ee = $_POST['EL']; //in case of encoder error

    //echo $t.$h.$c.$p.$s.$d.$posta;
    //Alarm is created in fromDatabase.php, as I think $_SESSION['currentAlarm'] won't work as POST creates new sessions
    //echo microtime(true); //start 
?>

<!-- CONNECTION TO ARDUINO TO GET ITS DATA AND SEND IT TO DB-->
<?php   
    try { 
        //require_once('database_connection.php'); //it takes 2 extra tenths to call the file, 7 tenths in total. Instead:
        $hostdb = '127.0.0.1'; //it is FAST! localhost takes 2 seconds instead
        $userdb = 'root';
        $passdb = 'passDB';
        $namedb = 'iot_database';
        $connectdb = new mysqli($hostdb,$userdb,$passdb,$namedb);//connecting with the database
        //checking connection
        if ($connectdb->connect_error){
            echo $error -> $connectdb->connect_error;
        }
        //echo microtime(true); //start

        /*****************************define alarms. 'No' by default*********************************/
        $alarm = '';
        /*obtain limits*/
        $lastLimitsCommand= "SELECT * FROM limits_1 ORDER BY idlimit DESC LIMIT 1";
        $lastLimits = mysqli_query($connectdb,$lastLimitsCommand); //request to the selection
        while ($lastRow = mysqli_fetch_array($lastLimits)){
            $limitP =  $lastRow['LimitPos'];
            $limitC =  $lastRow['LimitCur'];
            $limitS =  $lastRow['LimitSp'];
            $limitT =  $lastRow['LimitTemp'];
        }
        //echo microtime(true); //

        /*create alarms*/
        //Alarm of encoder error if Arduino has sent 'true'
        if (($ee == 'true') || ($ee == '1')){
            $alarm = 'encoder lost.';
        }
        else{
            $alarm = '';
        }
        if ($p > $limitP){
            $alarm .= 'Pos>OW.'; //point added in case there are more alarms
        }
        if($c > $limitC){
            $alarm .= 'Current too high.'; //.= means concatenation
        }
        if($t > $limitT){
            $alarm .= 'Motor too hot.';
        }
        if($s > $limitS){
            $alarm .= 'Too fast.';
        }

        /*********** Get last alarm and cycles ****************************************************************/
        $previousDataCommand= "SELECT * FROM testdata_1 ORDER BY id DESC LIMIT 1";
        $previousData = mysqli_query($connectdb,$previousDataCommand); //request to the selection
        while ($lastRow = mysqli_fetch_array($previousData)){
            $numbercycles =  $lastRow['Cycles'];
            $previousAlarm =  $lastRow['Alarm'];
        }
        //echo microtime(true); //time check. 1.1 ms
        /**************************************************************************************************** */
        //Add a cycle if Arduino has sent 'true'
        if (($posta == 'true') || ($posta == '1')){
            $cycles = $numbercycles+1;
        }
        else{
            $cycles = $numbercycles;
        }

        //insert values into the table
        $insertcommand = "INSERT INTO testdata_1(Temperature,Humidity,Current,Position,Speed,Alarm,Cycles,CycleDuration,StopActive) VALUES('$t','$h','$c','$p','$s','$alarm','$cycles','$d','$emstop')";
        
        //executing the insertion with query
        mysqli_query($connectdb,$insertcommand); 

        /********************************SEND EMAIL IF NEW ALARM *******************************************/
        /*for the email alerts, see alarms.php and sendEmail.php*/
        if (($alarm != $previousAlarm) && ($alarm !='')) {
            sendEmail($alarm,$connectdb);
        }

        /************************************ IMPORTANT TO CLOSE!! **********************************************/
        mysqli_close($connectdb);
    }
    catch (Exception $exc) { // \Exception?
        echo $exc->getMessage();
    }
    //echo microtime(true); //time check. 110 ms

    
?>
