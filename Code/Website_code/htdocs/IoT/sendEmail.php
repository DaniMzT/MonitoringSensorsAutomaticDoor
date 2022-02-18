<?php
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    require_once 'phpmailer/Exception.php';
    require_once 'phpmailer/PHPMailer.php';
    require_once 'phpmailer/SMTP.php';

    function sendEmail($inputAlarm,$inputConnectDB){
        //session_start(); //use this wherever we share variables between files
        //BETTER TO AVOID $_SESSION;OTHERWISE, NOT VALID WORKING IF WEB NOT OPENED IN THE BROWSER OF THE RECIPIENT

        //Maybe need to turn on Less Secure App Access in Gmail
        //NOT WORKING WITH mail(), maybe due to SMTP protocol
        //Using PHPMailer
        
        
        $email = new PHPMailer(true);
        $alert = '';
        /***********Retrieve emails from database *****************************************/
        try {
            //require_once('database_connection.php'); //not necessary because we've called it in fromArduino. It works
            
            //just last email address
            //$emailCommand= "SELECT * FROM alarmsemails_1 ORDER BY idalarm DESC LIMIT 1";

            //for all addresses:
            $emailCommand= "SELECT * FROM alarmsemails_1";
            $emailQuery = mysqli_query($inputConnectDB,$emailCommand); //request the selection
            //while ($lastRow = mysqli_fetch_array($emailQuery)){
            while ($lastRow = ($emailQuery->fetch_assoc())){ //fetch_assoc:fetch 1st element data got by the query
                $emailDB =  $lastRow['Email'];
                $personDB =  $lastRow['Person'];
                //send email
                if ($emailDB !='') {
                    $message = 'New alarm triggered in the bench: ' . $inputAlarm;
                    try {
                        //Settings for SMTP
                        $email->isSMTP();
                        $email->Host = 'smtp.gmail.com';
                        $email->SMTPAuth = true;
                        $email->Username = 'email@gmail.com'; //  address to use as SMTP server
                        $email->Password = 'pass'; //  address password
                        $email->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                        $email->Port = '587';
    
                        //Email settings
                        $email->clearAddresses(); //without clearAddresses,previous addresses are not cleared (repeatitive)
                        $email->setFrom('email@gmail.com'); //email STM server
                        $email->addAddress($emailDB); // address where emails are received 
                        $email->isHTML(true);
                        $email->Subject = 'New alarm';
                        $email->Body = "<h3>Name : $personDB <br>Email: $emailDB <br>Message : $message </h3>";
    
                        $email->send();
                        //$alert = '<div class="alert-success"> <span>Message Notification sent! </span> </div>';
                    } 
                    catch (Exception $e) {
                        //$alert = '<div class="alert-error"> <span>'.$e->getMessage().'</span> </div>';
                    }
                    
                }
            }
        }
        catch (Exception $exc) { // \Exception?
            echo $exc->getMessage();
        }
    }
?>
