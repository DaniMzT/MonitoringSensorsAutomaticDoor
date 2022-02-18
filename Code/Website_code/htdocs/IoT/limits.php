<?php 
    session_start(); //use this wherever we share variables between files
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Define limits</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div class="header_container">
            <h1>IoT-Monitoring</h1>
            <nav class="header_nav">
                <ul>
                    <li> <a href="/IoT/index.php"> Main </a> </li>
                    <li> <a href="/IoT/activations.php"> Activations </a> </li>
                    <li> <a href="/IoT/alarms.php"> Alarms </a> </li>
                    <li> <a href="/IoT/cam.php"> Cam </a> </li> 
                    <li> <a href="/IoT/register.php"> Register </a> </li>
                </ul>
                
            </nav>
        </div>
    </header>  
    <main>
        <div class="box_limits_form">    
            <h2 class="limits_header">Define the limits for the acceptance of the test</h2>
            <form action="" method = "POST">
                <fieldset>
                    <label for="opening_width">Opening width in mm</label>
                    <input type="number" id="opening_width" name="OW" min="0" max="5000" step="1" value = "<?php echo isset($_POST['OW']) ? $_POST['OW'] : $_SESSION['limit_position'] ?>" required>
                    <label for="peak_current">Peak current in mA</label>
                    <input type="number" id="peak_current" name="Peak" min="0" max="50000" step="1" value = "<?php echo isset($_POST['Peak']) ? $_POST['Peak'] : $_SESSION['limit_peak'] ?>" required>
                    <label for="speed">Max speed in cm/s</label>
                    <input type="number" id="speed" name="Speed" min="0" max="400" step="1" value = "<?php echo isset($_POST['Speed']) ? $_POST['Speed'] : $_SESSION['limit_speed'] ?>" required>
                    <label for="motor_temp">Motor temperature in ºC</label>
                    <input type="number" id="motor_temp" name="MotTemp" min="0" max="150" step="1" value = "<?php echo isset($_POST['MotTemp']) ? $_POST['MotTemp'] : $_SESSION['limit_motor_temp'] ?>" required>
                </fieldset>
                <input type="submit" name="submit_limits" value="OK">
            </form>
        </div>
        <?php 
            //saving into PHP variables thanks to post method in form
            if(isset($_POST['submit_limits'])){ //only working if there is a name="submit"
                //saving variables into session variables to be shared with other files
                $_SESSION['limit_position'] = $_POST['OW'];
                $_SESSION['limit_peak'] = $_POST['Peak'];
                $_SESSION['limit_speed'] = $_POST['Speed'];
                $_SESSION['limit_motor_temp'] = $_POST['MotTemp'];

                //upload to table Limits in database
                  
                try { 
                    require_once('database_connection.php');

                    //obtain last cycle and add it if Arduino has sent 'true'
                    $lp = $_POST['OW'];
                    $lc = $_POST['Peak'];
                    $ls = $_POST['Speed'];
                    $lt = $_POST['MotTemp'];
                    //insert values into the table limits_1
                    $insertcommand = "INSERT INTO limits_1(LimitPos,LimitCur,LimitSp,LimitTemp) VALUES('$lp','$lc','$ls','$lt)";
                    
                    //executing the insertion with query
                    mysqli_query($connectdb,$insertcommand); 
                    
                    //important to close
                    mysqli_close($connectdb);
                }
                catch (Exception $exc) { // \Exception?
                    echo $exc->getMessage();
                }

            }
        ?>
    </main>
</body>
</html>