<?php 
    session_start(); //use this wherever we share variables between files
?>
<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <title>IP camera using Unreal Media Server WebRTC player</title>
    <link rel="stylesheet" href="style.css">
    
    <script src="Unrealwebrtcplayer/webrtcadapter.js"></script>
    <script src="Unrealwebrtcplayer/unrealwebrtcplayer.js"></script>

      <script type="text/javascript">

        var webrtcPlayer = null;

      </script>

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
                    <li> <a href="/IoT/register.php"> Register </a> </li>
                    <li> <a href="/IoT/limits.php"> Limits </a> </li>  
                </ul>
                
            </nav>
        </div>
    </header>
    
    <div id="container" align="center">
      
      <video style="background-color:black" id="remoteVideo" width="800" height="450" autoplay playsinline controls muted></video>

      <script type="text/javascript">

          //Parameters:

          //1. ID of video element.
          //2. Alias of the live broadcast; video encoding supported: H264(AVC1), VP8, VP9; audio encoding supported: opus, G.711(PCMA/PCMU).
          //3. Secure token for session based authentication, leave empty if none. Should not be used unless Media Server and Web Server run on different 
          //domains.
          //4. IP address of Unreal Media Server. If you specify domain name (domain name must be used for signaling over secure websocket) 
          //AND your server is behind NAT, then you need to make a change in unrealwebrtcplayer.js, described in 
          //http://www.umediaserver.net/phpBB3/viewtopic.php?f=29&t=3563
          //5. Main port of Unreal Media Server for signaling over websocket (by default, 5119 for unsecure webscokets / 443 for secure websockets). 
          //Make sure these ports are open in the firewall.
          //6. Use secure websocket for signaling; if true, make sure to set the port to secure port (443 by default) and configure SSL certificate 
          //in Unreal Media Server. If this parameter is false and this webpage is loaded under https:// then browsers will display "mixed content" warning; 
          //you will need to allow mixed content in your browser.
          //7. Use single central port for actual WebRTC ICE connection. If true, the web browser will receive streaming media from predefined single port 
          //in Unreal Media Server, dedicated to WebRTC connections (by default 5135). If true, you only need to open port 5135 in firewall/NAT router for 
          //Unreal Media Server (together with signaling ports, 5119 or 443). If false, the WebRTC connection will be made over a random port; you will need 
          //to open all ports in the firewall, or add Unreal Media Server as an allowed app in the firewall.
          //8. WebRTC transport protocol. Set to "udp" or "tcp". The central port can be used for both udp and tcp.

          /*LOCAL
          webrtcPlayer = new UnrealWebRTCPlayer("remoteVideo", "name_in_camera", "", "192.168.1.49", "5119", false, true, "tcp");*/

          /*EXTERNAL*/
          //so far, working when setting public IP, not domain name
          webrtcPlayer = new UnrealWebRTCPlayer("remoteVideo", "name_in_camera", "", "example.ddns.net", "5119", false, true, "tcp");

          //Comment out next line not to start playing when webpage loads. Then user will need to click on Play button to play; you may want to use a 
          //video element with overlayed Play button - check out our SDK for sample webpages.
          webrtcPlayer.Play();    //Start playing automatically when webpage loads. Notice that video element has a "muted" attribute; 
          //this is video-only stream anyway. A muted attribute helps to overcome Chrome's autoplay policy, and is not always needed, as described in http://www.umediaserver.net/phpBB3/viewtopic.php?f=29&t=3578

      </script>

    </div>


  </body>
</html>
