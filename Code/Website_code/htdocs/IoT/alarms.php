
<?php 
    //THIS PHP HAS THE EMAIL REGISTRATION AND UPLOADS TO DATABASE
    session_start(); //use this wherever we share variables between files
?>
<?php include 'sendEmail.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alarms</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div class="header_container">
            <h1>IoT-Monitoring</h1>
            <nav class="header_nav">
                <ul>
                    <li> <a href="/IoT/index.php"> Main </a> </li>
                    <li> <a href="/IoT/cam.php"> Cam </a> </li>  
                    <li> <a href="/IoT/activations.php"> Activations </a> </li> 
                    <li> <a href="/IoT/limits.php"> Limits </a> </li>
                    <li> <a href="/IoT/register.php"> Register </a> </li>
                </ul>
                
            </nav>
        </div>
    </header> 
    <main>
        <!-- start alert messages from sendEmail.php-->
        <?php echo $alert; ?>
        <!-- end alert messages-->
        <section class="box_alarms_form">
            <h2 class="alarm_question">Do you want to receive an email in case of an alarm?</h2>
            <form action="" method="post">
                <fieldset>
                    <label for="name">Name:</label>
                    <input type="text" name="name" placeholder="Your name" value = "<?php echo isset($_POST['name']) ? $_POST['name'] : $_SESSION['name_session']  ?>" required>
                    <label for="email">Email:</label>
                    <input type="email" name="recipient" placeholder="Your email address" value = "<?php echo isset($_POST['recipient']) ? $_POST['recipient'] : $_SESSION['recipient_session']  ?>" required>
                </fieldset>
                <input type="submit" name = "submit_alarms" value="OK">
            </form>
        </section>
        
        <?php
            if(isset($_POST['submit_alarms'])){ 
                $recipient = $_POST['recipient'];
                $person = $_POST['name'];
                $_SESSION['recipient_session'] = $recipient;
                $_SESSION['name_session'] = $person;
                /************************ UPLOAD EMAIL ADDRESS TO DATABASE ****************/   
                try { 
                    require_once('database_connection.php');
                    
                    //add address only if it is not already included in the database
                    $emailCommand= "SELECT * FROM alarmsemails_1";
                    $emailQuery = mysqli_query($connectdb,$emailCommand); //request the selection
                    $found=false;
                    while (($found==false) && ($lastRow = ($emailQuery->fetch_assoc()))){ //fetch_assoc:fetch 1st element data got by the query
                        $address =  $lastRow['Email'];
                        if ($address == $recipient) {
                            $found=true;
                            //alert("This address is already in the database");
                        }
                    }
                    if ($found==false){
                        $insertcommand = "INSERT INTO alarmsemails_1(Person,Email) VALUES('$person','$recipient')";
                        //executing the insertion with query
                        mysqli_query($connectdb,$insertcommand); 
                    }

                    //important to close
                    mysqli_close($connectdb);
                }
                catch (Exception $exc) { // \Exception?
                    echo $exc->getMessage();
                }
                
            }
        ?>

        <!-- UNSUBSCRIBE -->
        <section class="box_alarms_form">
            <h2 class="unsubscribe_question">Do you want to stop receiving alarms?</h2>
            <form action="" method="post">
                <fieldset>
                    <label for="name">Name:</label>
                    <input type="text" name="name_uns" placeholder="Your name" value = "<?php echo isset($_POST['name_uns']) ? $_POST['name_uns'] : $_SESSION['name_session_uns']  ?>" required>
                    <label for="email">Email:</label>
                    <input type="email" name="recipient_uns" placeholder="Your email address" value = "<?php echo isset($_POST['recipient_uns']) ? $_POST['recipient_session_uns'] : $_SESSION['recipient_session_uns']  ?>" required>
                </fieldset>
                <input type="submit" name = "submit_unsubscribe" value="OK">
            </form>
        </section>

        <?php
            if(isset($_POST['submit_unsubscribe'])){ 
                $recipient_uns = $_POST['recipient_uns'];
                $person_uns = $_POST['name_uns'];
                $_SESSION['recipient_session_uns'] = $recipient_uns;
                $_SESSION['name_session_uns'] = $person_uns;
                /************************ UPLOAD EMAIL ADDRESS TO DATABASE ****************/   
                try { 
                    require_once('database_connection.php');
                    
                    //check if required input is in database (if we add extra security)

                    //so far, direct unsubscribe, nothing requested
                    $deleteCommand = "DELETE FROM alarmsemails_1 WHERE Email='$recipient_uns'";
                    mysqli_query($connectdb,$deleteCommand);
                    

                    //important to close
                    mysqli_close($connectdb);
                }
                catch (Exception $exc) { // \Exception?
                    echo $exc->getMessage();
                }
                
            }
        ?>

        <!-- JS function to stop form resubmission,email sent, when refreshing page -->
        <script type="text/javascript">
        if(window.history.replaceState){
            window.history.replaceState(null, null, window.location.href);
        }
        </script>
        <!-- end of the JS function-->

    </main> 
</body>
</html>