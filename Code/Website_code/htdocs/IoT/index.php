<?php 
    session_start(); //use this wherever we share variables between files
?>

<?php include 'sendEmail.php'; ?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>IoT-Monitoring</title>
        <link rel="stylesheet" href="style.css">
        
    </head>
    <body>
        <header>
            <div class="header_container">
                <h1>IoT-Monitoring</a></h1>
                <nav class="header_nav">
                    <ul>
                        <li> <a href="/IoT/activations.php"> Activations </a> </li>
                        <li> <a href="/IoT/alarms.php"> Alarms </a> </li>
                        <li> <a href="/IoT/cam.php"> Cam </a> </li>    
                        <li> <a href="/IoT/register.php"> Register </a> </li>
                        <li> <a href="/IoT/limits.php"> Limits </a> </li>
                    </ul>
                    
                </nav>
            </div>
        </header>  
        
        <main>
        
            <!-- DISPLAY SECTION -->
            <div class="display">
                <div>
                    <h2 class="title_select"> SELECT DATE RANGE MINIMUMS AND MAXIMUMS</h2>
                    
                    <!-- FORM TO DEFINE DATES RANGE TO DISPLAY MIN AND MAX VALUES -->
                    <form action="index.php" method="post">
                        <label for="from_minmax">From:</label>
                        <input type="datetime-local" id="from_minmax" name="date_from_minmax" placeholder="yyyy-mm-dd hh:mm:ss" value = "<?php echo isset($_POST['date_from_minmax']) ? $_POST['date_from_minmax'] : $_SESSION['date_from_minmax_session'] ?>" >
                        <label for="to_minmax">To:</label>
                        <input type="datetime-local" id="to_minmax" name="date_to_minmax" placeholder="yyyy-mm-dd hh:mm:ss" value = "<?php echo isset($_POST['date_to_minmax']) ? $_POST['date_to_minmax'] : $_SESSION['date_to_minmax_session'] ?>" >
                        <input type="submit" name="submit_minmax" value="Submit">
                    </form>
                    <?php
                        if(isset($_POST['submit_minmax'])){ 
                            $_SESSION['date_from_minmax_session'] = $_POST['date_from_minmax'];
                            $_SESSION['date_to_minmax_session'] = $_POST['date_to_minmax'];
                        }
                        $from_date_minmax = $_SESSION['date_from_minmax_session'];//extra variable because query fails with ""of SESSION
                        $to_date_minmax = $_SESSION['date_to_minmax_session'];//extra variable because query fails with ""of SESSION
                        //initialization
                        if ($from_date_minmax =='') {
                            //$from_date_minmax = "2020-12-01 00:00:00"; //Firefox
                            $from_date_minmax = "01/12/2020 00:00 AM"; //Chrome
                        }
                        if ($to_date_minmax =='') {
                            //$to_date_minmax = "2030-12-01 00:00:00"; //Firefox
                            $to_date_minmax = "01/12/2030 00:00 AM"; //Chrome
                        }
                    ?>
                </div>
                <!-- DISPLAY-->
                <div id="load_display">
                </div>
            </div>
        </main>
        
        <!-- CONNECTION WITH DATABASE TO SEND AND GET PERIODICALLY -->
        <script type="text/javascript" src="jquery_folder/jquery.js"> </script>
        <script type="text/javascript"> 
            $(document).ready(function() {
                setInterval(function(){
                    $("#load_display").load("fromDatabase.php");
                    
                },50);//50ms
            });
        </script>
        
    </body>
</html>