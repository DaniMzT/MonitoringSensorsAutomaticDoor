# MonitoringSensorsAutomaticDoor
This project is a university thesis carried out in the company GEZE, focused on the automatic sliding doors tested in the laboratory. 
However, it can be extended to generic monitoring projects.
The targets of the project are:
- To acquire data from external sensors (current, temperature, humidity, position, speed and cycles)
- To save the data into a database
- To display live data and maximum/minimum values on a website, as well as providing other functionalities for the test engineers like:
  - Notification of alarms (based on the limits set by the engineers on the website) on the website and by email (email accounts registered on the website)
  - Download some specific data of tests from a specified date range 
  - Watch live streaming of the test benches (FOSCAM IP camera)
  - Perform remote activations on the bench (open/stop)

A NodeMCU is the main controller, acquiring the sensors data and sending the processed data via WiFi to a database (with a PHP file as a bridge).
There is an Arduino UNO for the acquisition of position, speed (both acquired with a home-made encoder: 2 micro photosensors,emitting to and receiving from a zebra band on the door) and limit switch activations (for door cycles).
The communication between NodeMCU and Arduino UNO is via SoftwareSerial --> not very reliable, it is the main issue to be fixed.
Database and website: based on Bitnami WAMP (package for Windows, Apache, MySQL and PHP)

Files in the project:
- Code: website, micros (NodeMCU and Arduino UNO) and database (MySQL)
- KiCAD files (to be added): schematic and printed boards

ISSUES TO BE FIXED:
- Communication between NodeMCU and Arduino UNO. SoftwareSerial is not reliable, I am afraid it is not due to my code. 
I will try to switch ports so that I can use SPI communication (currently, the SPI ports are used as GPIOs)
- Website security is weak. I have been self-learning web programming on the fly --> User identifications, work with JavaScript to process the forms, etc.
