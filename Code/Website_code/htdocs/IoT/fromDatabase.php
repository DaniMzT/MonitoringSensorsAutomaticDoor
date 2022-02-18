<?php 
    session_start(); //use this wherever we share variables between files
?>
<?php //include 'sendEmail.php'; ?>
<!-- CONNECTION TO DATABASE TO GET DATA -->
<?php   
    $lastStop = '0';
    try { 
        //require_once('database_connection.php'); //in fromArduino, it takes 2 extra tenths to call the file.Instead:
        $hostdb = '127.0.0.1'; //it is FAST! localhost takes 2 seconds instead
        $userdb = 'root';
        $passdb = 'passDB';
        $namedb = 'iot_database';
        $connectdb = new mysqli($hostdb,$userdb,$passdb,$namedb);//connecting with the database
        //checking connection
        if ($connectdb->connect_error){
            echo $error -> $connectdb->connect_error;
        }

        //read last values from data base
        $lastValuesCommand = "SELECT * FROM testdata_1 ORDER BY id DESC LIMIT 1";
        $lastValuesResult = mysqli_query($connectdb,$lastValuesCommand); //request to the selection 
        while ($lastValuesRow = mysqli_fetch_array($lastValuesResult)){
            $_SESSION["lastT"]=$lastValuesRow['Temperature'];
            $_SESSION["lastH"]=$lastValuesRow['Humidity'];
            $_SESSION["lastC"]=$lastValuesRow['Current'];
            $_SESSION["lastP"]=$lastValuesRow['Position'];
            $_SESSION["lastS"]=$lastValuesRow['Speed'];
            $_SESSION["lastD"]=$lastValuesRow['CycleDuration'];
            $_SESSION["lastNC"]=$lastValuesRow['Cycles'];
            $_SESSION["lastStop"]=$lastValuesRow['StopActive'];
            $lastStop = $_SESSION["lastStop"];
            $alarm=$lastValuesRow['Alarm'];
        } 
        /************************************************* */
        $from_date_minmax = $_SESSION['date_from_minmax_session'];//extra variable because query fails with ""of SESSION
        $to_date_minmax = $_SESSION['date_to_minmax_session'];//extra variable because query fails with ""of SESSION
        
        // read max temperature from data base
        $maxTemp = "SELECT MAX(Temperature) AS maxtemp FROM testdata_1 where Date_Time BETWEEN '$from_date_minmax' and '$to_date_minmax'"; // select
        $result = mysqli_query($connectdb,$maxTemp); //request to the selection 
        while($row = mysqli_fetch_array($result)){;
            $_SESSION["maxTemp_session"] = $row["maxtemp"];
        }
        // read max current from data base
        $maxCur = "SELECT MAX(Current) AS maxcur FROM testdata_1 where Date_Time BETWEEN '$from_date_minmax' and '$to_date_minmax'"; // select
        $result = mysqli_query($connectdb,$maxCur); //request to the selection 
        while($row = mysqli_fetch_array($result)){;
            $_SESSION["maxCur_session"] = $row["maxcur"];
        }
        // read min current from data base
        $minCur = "SELECT MIN(Current) AS mincur FROM testdata_1 where Date_Time BETWEEN '$from_date_minmax' and '$to_date_minmax'"; // select
        $result = mysqli_query($connectdb,$minCur); //request to the selection 
        while($row = mysqli_fetch_array($result)){;
            $_SESSION["minCur_session"] = $row["mincur"];
        }
        // read max speed from data base
        $maxSpeed = "SELECT MAX(Speed) AS maxsp FROM testdata_1 where Date_Time BETWEEN '$from_date_minmax' and '$to_date_minmax'"; // select
        $result = mysqli_query($connectdb,$maxSpeed); //request to the selection 
        while($row = mysqli_fetch_array($result)){;
            $_SESSION["maxSpeed_session"] = $row["maxsp"];
        }
        // read min speed from data base
        $minSpeed = "SELECT MIN(Speed) AS minsp FROM testdata_1 where Date_Time BETWEEN '$from_date_minmax' and '$to_date_minmax'"; // select
        $result = mysqli_query($connectdb,$minSpeed); //request to the selection 
        while($row = mysqli_fetch_array($result)){;
            $_SESSION["minSpeed_session"] = $row["minsp"];
        }

        //important to close
        mysqli_close($connectdb);
    }
    catch (Exception $exc) { // \Exception?
        echo $exc->getMessage();
    }    
?>
<?php
    echo "<div>";
    echo '<h2 class="title_status">CURRENT STATUS</h2>';
    echo '<div class="status">'; //div for Alarm
    //DISPLAY STATUS
    if ($alarm == '') { 
        echo '<div class="statusContent">';  
        echo '<div class="LEDgreen">';
        echo '</div>'; 
        echo '<p class="running_description">'."Running ".'</p>';
        echo '</div>'; 
    } 
    else { 
        echo '<div class="statusContent">'; 
        echo '<div class="LEDred">';
        echo '</div>'; 
        echo '<p class="alarm_description">'.$alarm." ".'</p>'; 
        echo '</div>'; 
    } 
    if ($lastStop == '1') { 
        echo '<div class="statusContent">'; 
        echo '<div class="LEDorange">';
        echo '</div>'; 
        echo '<p class="stop_description">'."Emergency Stop active".'</p>';
        echo '</div>'; 
    }  
    echo "</div>"; //status
    echo "</div>";

    //DISPLAY VALUES FROM DATABASE
    echo "<div>";

    echo '<h2 class="title_display"> LAST DATA, MAX, MIN</h2>';
    echo "<div class='sensors'>"; //div for sensors

    echo "<div class='sensor-column'>";
    echo "<h3>Temperature [ºC] </h3>";
    echo "<p>" . $_SESSION['lastT'] . "</p>";
    echo "<p>" . "Max:" . $_SESSION["maxTemp_session"] . "</p>";
    echo "</div>";

    echo "<div class='sensor-column'>";
    echo "<h3>Humidity [%]</h3>";
    echo "<p>" . $_SESSION['lastH'] . "</p>";
    echo "</div>";

    echo "<div class='sensor-column'>";
    echo "<h3>Current [mA]</h3>";
    echo "<p>" . $_SESSION['lastC'] . "</p>";
    echo "<p>" . "Max:" . $_SESSION["maxCur_session"] . "</p>";
    echo "<p>" . "Min:" . $_SESSION["minCur_session"] . "</p>";
    echo "</div>";

    echo "<div class='sensor-column'>";
    echo "<h3>Position [mm]</h3>";
    echo "<p>" . $_SESSION['lastP'] . "</p>";
    echo "</div>";

    echo "<div class='sensor-column'>";
    echo "<h3>Speed [mm/s]</h3>";
    echo "<p>" . $_SESSION['lastS'] . "</p>";
    echo "<p>" . "Max:" . $_SESSION["maxSpeed_session"] . "</p>";
    echo "<p>" . "Min:" . $_SESSION["minSpeed_session"] . "</p>";
    echo "</div>";

    echo "<div class='sensor-column'>";
    echo "<h3>Cycle duration [s]</h3>";
    echo "<p>" . $_SESSION["lastD"] . "</p>";
    echo "</div>";

    echo "<div class='sensor-column'>";
    echo "<h3>Number of Cycles</h3>";
    echo "<p>" . $_SESSION["lastNC"] . "</p>";
    echo "</div>";

    echo "</div>"; //end of class sensors

    echo "<div>";
?>    