<?php 
    session_start(); //use this wherever we share variables between files
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Data Register</title>
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
                        <li> <a href="/IoT/limits.php"> Limits </a> </li> 
                    </ul>
                    
                </nav>
            </div>
        </header>  
        <main>
            <div class="register_limits_form">    
                <h2 class="register_header">Download custom data</h2>
                <form method="post" class="register_text" action="excel_register.php">
                    <fieldset>
                        <label for="from">From:</label>
                        <input type="datetime-local" id="from" name="date_from" placeholder="yyyy-mm-dd hh:mm:ss" required>
                        <label for="to">To:</label>
                        <input type="datetime-local" id="to" name="date_to" placeholder="yyyy-mm-dd hh:mm:ss" required>
                    </fieldset>
                    <fieldset>
                        <legend>Magnitudes to be saved:</legend>
                        <label for="temperature">Temperature</label>
                        <input type="checkbox" id="temperature" name='columns[]' value="Temperature">
                        <label for="humidity">Humidity</label>
                        <input type="checkbox" id="humidity" name='columns[]' value="Humidity">
                        <label for="inst_current">Current</label>
                        <input type="checkbox" id="inst_current" name='columns[]' value="Current">
                        <label for="rms_current">RMS current</label>
                        <input type="checkbox" id="rms_current" name='columns[]' value="rms_current">
                        <label for="position">Position</label>
                        <input type="checkbox" id="position" name='columns[]' value="Position">
                        <label for="speed">Speed</label>
                        <input type="checkbox" id="speed" name='columns[]' value="Speed">
                        <label for="alarms">Alarms</label>
                        <input type="checkbox" id="alarms" name='columns[]' value="Alarm">
                    </fieldset>
                    <input type="submit" name="download_report" value="Download">
                </form>
                
            </div>
        </main>

    </body>
    
</html>