<?php 
    session_start(); //use this wherever we share variables between files
?>
<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>IoT-Monitoring</title>
      <link rel="stylesheet" href="style.css">
      <script type="text/javascript" src="jquery_folder/jquery.js"> </script>
      <script type="text/javascript" src="js/jquery.ajax-cross-origin.min.js"></script>
  </head>
  <body>
    <header>
        <div class="header_container">
            <h1>IoT-Monitoring</a></h1>
            <nav class="header_nav">
                <ul>
                    <li> <a href="/IoT/index.php"> Main </a> </li>
                    <li> <a href="/IoT/alarms.php"> Alarms </a> </li>
                    <li> <a href="/IoT/cam.php"> Cam </a> </li>    
                    <li> <a href="/IoT/register.php"> Register </a> </li>
                    <li> <a href="/IoT/limits.php"> Limits </a> </li>
                </ul>
                
            </nav>
        </div>
    </header>  
    
    <main>    
      <section class="gridactivations">
        <div class="containerActivations">
          <img src="/IoT/images/kb.jpg" alt="Open door" width="50%" height="60%">
        </div>
        <div class="containerActivations">
          <form  id="kbAform" name="kbAform">
              <input type="submit" value="Activate KB" />
          </form>
        </div>
        <div class="containerActivations">
          <form  id="kbIform" name="kbIform">
              <input type="submit" value="Deactivate KB" />
          </form>
        </div>
        <div class="containerActivations">
          <img src="/IoT/images/emStop.jpg" alt="Stop door" width="50%" height="60%">
        </div>
        <div class="containerActivations">
          <form  id="stopAform" name="stopAform">
              <input type="submit" value="Activate STOP" />
          </form>
        </div>
        <div class="containerActivations">
          <form  id="stopIform" name="stopIform">
              <input type="submit" value="Deactivate STOP" />
          </form>
        </div>
      </section>
    </main>

    <script type="text/javascript"> 
        $(document).ready(function(){ //$(function() { is jQuery short-hand for $(document).ready(function() { ... });
            //$("#kbform").on("submit", function(e) {
            $("#kbAform").submit(function(e) {
              e.preventDefault();
              $.ajax({
                  //crossOrigin: true,
                  //url: $("#kbAform").attr("action"),

                  url:"http://192.168.1.51:5000/KBactive",
                  //url:"http://example.ddns.net:5000/KBactive",
                  type: "POST",
                  data: $("#kbAform").serialize(),
                  success: function(data) {
                      console.log('ok');
                  }
              });
                
            });
        });
    </script>

    <script type="text/javascript"> 
      $(document).ready(function(){ //$(function() { is jQuery short-hand for $(document).ready(function() { ... });
          //$("#kbform").on("submit", function(e) {
          $("#kbIform").submit(function(e) {
            e.preventDefault();
            $.ajax({
                //crossOrigin: true,
                //url: $("#kbIform").attr("action"),

                url:"http://192.168.1.51:5000/KBinactive",
                //url:"http://example.ddns.net:5000/KBinactive",
                type: "POST",
                data: $("#kbIform").serialize(),
                success: function(data) {
                    console.log('ok');
                }
            });
              
          });
      });
    </script>

    <script type="text/javascript"> 
      $(document).ready(function(){ 
          $("#stopAform").submit(function(e) {
            e.preventDefault();
            $.ajax({
                url: "http://192.168.1.51:5000/STOPactive",
                //url: "http://example.ddns.net:5000/STOPactive",
                type: "POST",
                data: $("#stopAform").serialize(),
                success: function(data) {
                  console.log('ok');
                }
            });
              
          });
      });
    </script>
    
    <script type="text/javascript"> 
      $(document).ready(function(){ 
          $("#stopIform").submit(function(e) {
            e.preventDefault();
            $.ajax({
                url: "http://192.168.1.51:5000/STOPinactive",
                //url: "http://iotgeze.ddns.net:5000/STOPinactive",
                type: "POST",
                data: $("#stopIform").serialize(),
                success: function(data) {
                  console.log('ok');
                }
            });
              
          });
      });
    </script>

  </body>
</html>
