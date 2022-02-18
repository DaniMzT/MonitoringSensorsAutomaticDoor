//in case of using Platformio or other which are not Arduino IDE --> #include <Arduino.h>
//for ESP8266
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h> //for the HTTP requests like GET or POST, with ESP8266 being client
#include <ESP8266WebServer.h> //for dealing with ESP8266 as a server

#include <SoftwareSerial.h> //for software serial communication Arduino-NodeMCU. CANNOT TRANSMIT AND RECEIVE SIMULTANEOUSLY

//Libraries for I2C, which we use for ADC transmission
#include <Wire.h>
#include <Adafruit_ADS1X15.h>

//ADC
Adafruit_ADS1115 adc; //object of the class for the ADC.ADDR connected to GND (0x48)
bool adc_begin; 

const int loop_wait = 200; //ms of wait between loop iterations. 200 used to work

//SW SERIAL
SoftwareSerial swSerial(12,14); //communication SW serial Arduino-NodeMCU. 12(D6)=RXnode=TXard(3); 14(D5)=TXnode=RXard(2)

  
//HTTP REQUESTS
const char* ssid = "ssidName"; //WiFi network. const char* is the same as const char *ssid, a pointer to char variable 
const char* password = "ssidPass"; //WiFi password

const char* host = "http://192.168.1.49/IoT/fromArduino.php";

//Port where ESP8266 will listen
ESP8266WebServer ESPserver(5000); //default:80.use 5000 to avoid issues,as defined in port forwarding.But when clicking the button, a warning window will appear

//SENSORS. PINMODE --> GPIO number, no D1,D2...
const int pinCURRENT = 0; //pin of ADS1115 for sensor of current. Notation used in readADC_SingleEnded()
const int pinTEMP = 2; //pin of ADS1115 for temperature sensor. Notation used in readADC_SingleEnded()
const int pinHUM = 1; //pin of ADS1115 for humidity sensor. Notation used in readADC_SingleEnded()
const int pinSTOP_out = 2; //pin D4 GPIO2 for STOP relay managed from web
const int pinKB = 13; //pin D7 GPIO13 for KB, managed from web
const int pinSTOP = 3; //pin of ADS1115 for emergency stop button activated in the test site

const float adc_res = 0.125;
const float sensitivity_Current = adc_res*300/33;//Fluke i30 sensitivity current/ADC resolution = (30000mA/3000mV)*(3000mV/3300mV)*0.125mV/bitADC
const int offset_Current = 0;//offset current given in mA
const int offset_OAc = 0; //offset current due to operational amplifier, given in bits
float current = 0; //mA
const float sensitivity_Temp = adc_res*5/313; //sensitivity temp/ADC resolution = ((50-(0))/10000mV)*(10000mV/3130mV)*0.125mV/bitADC
const int offset_Temp = 0; //offset temperature due to sensor
const int offset_OAt = 0; //-3600.offset temperature due to operational amplifier, given in bits
float temperature = 0;
const float sensitivity_Hum = adc_res*9/313; //sensitivity hum/ADC resolution = (90/10000mV)*(10000mV/3300mV)*0.125mV/bitADC
const int offset_Hum = 5; //offset humidity due to sensor
const int offset_OAh = 0; //-3456 offset humidity due to operational amplifier, given in bits
unsigned int humidity = 0;
int EmergencyStop_active = LOW; //signal from Emergency Stop button
//raw values ADC
int16_t rawT = 0; 
int16_t rawH = 0;
int16_t rawC = 0;
int16_t rawE = 0;
const float sensitivity_Em = adc_res/1000;

bool addCycle = false; //true if new cycle. the number of cycles is stored in database. bool size=1 byte; int size = 2 bytes (if I wanted to use 1 or 0 instead of true or false)
float duration_cycle = 0.0; //duration of the current cycle in seconds.
bool encoder_lost = false; //if encoder reading makes no sense (encoder error, either due to the sensor or to wrong reading because of too slow sampling, etc)
int current_position = 0; //positioning/speed will start when position==0. SHOULD BE SIGNED IF THE POSITIONING SYSTEM IS CORRECT
float current_speed = 0.0;

bool outKB = false; //used in manageOutputs
bool outSTOP = false;

//used for reading SWserial
const byte maxBuffer = 64; //64 bytes max?
bool message_begun = false;
bool message_finished = false;
char currentMessage[maxBuffer]; //avoid using String in Arduino
char tempMessage[maxBuffer];
const char startMarker = '<';
const char endMarker = '>';
char currentChar;
byte posChar = 0;
char * strtok_indexPointer; // this is used by strtok() as an index
bool swserial_available = false;
const unsigned int limit_ArdNode = 1000; //limit Arduino-Node communication; better const byte = 250 (ms, byte up to 255) ?
unsigned int time_ArdNode = 0;
bool ack_Ard = false;

int arduino_iteration = 0;

/*********************************************************************************************************************************************************************************/

void setup() {
  delay(10);
  Serial.begin(115200); //serial port (real port)
  // Using the lowest possible data rate to reduce error ratio
  swSerial.begin(4800); //put the same in Arduino.9600 used to work in tests. 4800 when using JSON.
  pinMode(pinSTOP, INPUT); //configuration digital input
  pinMode(pinSTOP_out, OUTPUT); //configuration digital output
  pinMode(pinKB, OUTPUT); //configuration digital output

  adc.setGain(GAIN_ONE); //15 bits ADS1115.Critical:current.GAIN_ONE=(4.096/2^15)*sensitCurrent = 0.125mV*20A/20000mV=0.125 mA
  adc_begin = adc.begin(0x48);//start ADS1115.  //adc_begin = adc.begin()
  delay(1);

  WiFi.mode(WIFI_OFF);        //Prevents reconnection issue (taking too long to connect)
  delay(1000);
  WiFi.mode(WIFI_STA);        //This line hides the viewing of ESP as wifi hotspot

  //Serial.println();
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) { //I can improve it with a time limit
    delay(500);
  }

  //define the responses from the server according to the path received
  ESPserver.on("/KBactive", activeKB); //when the ESP receives request with pressKB on the root, the server will trigger activeKB
  ESPserver.on("/KBinactive", inactiveKB);
  ESPserver.on("/STOPactive", activeSTOP);//active on LOW! because GPIO2 (D4) needs to be HIGH during boot (there is a pull-up)
  ESPserver.on("/STOPinactive", inactiveSTOP);

  //start ESP8266 as server
  ESPserver.begin();
  manageOutputs(pinSTOP_out, pinKB, false, false); //activating another emergency stop and KB from website

}
/******************************************************************************************************************************************************************************************/

void loop() {
  if (WiFi.status() == WL_CONNECTED) { //if connection is lost, ESP will reconnect to last used access point by Wi-Fi library

    //ESP8266 AS CLIENT,STARTING CONNECTION TO SEND DATA
    readPositionSpeed();//read position, speed, cycle duration, new cycle, encoder lost (error)
    readAnalogue(pinCURRENT, pinTEMP, pinHUM, pinSTOP); //reading current sensors and input stop

    //data to be sent. DO NOT USE '?'in front,it seems http.POST already takes it into account
    String data = "T=" + String(temperature) + "&H=" + String(humidity) + "&C=" + String(current) + "&P=" + String(current_position) + "&S=" + String(current_speed);
    data += "&D=" + String(duration_cycle) + "&A=" + String(addCycle) + "&E=" + String(EmergencyStop_active) + "&EL=" + String(encoder_lost);
    Serial.print("data post:");
    Serial.println(data);

    HTTPClient http; //invoking the library. object of class HTTPClient to create and send HTTP requests
    http.begin(host);
    http.addHeader("Content-Type", "application/x-www-form-urlencoded"); //Specify content-type header
    int code_post = http.POST(data); //POST request, which returns a code

    if (code_post > 0) {
      String response = http.getString();
    }

    http.end(); //release resources

    //ESP8266 AS SERVER,AS WEBSITE STARTS COMMUNICATION
    ESPserver.handleClient(); //handling the incoming requests
  }

  delay(loop_wait);
}
/*************************************************************************************************************************************************************************************/

//SENSORS RELATED FUNCTIONS
void readPositionSpeed() {
  posChar = 0;
  message_begun = false;
  message_finished = false;
  ack_Ard = false;
  //check transmission from Arduino
  if (swSerial.available()>0) {
    time_ArdNode = millis(); //time start
    swserial_available = true;
    Serial.println("swserial IS available: ");
    Serial.println(swSerial.available());
    //allowing Arduino to send
    swSerial.print('S');//yes
    Serial.println("ok sent to Arduino");
    //WAITING RESPONSE ACK FROM ARDUINO
    while ((swSerial.available()>0)&&(ack_Ard == false)&&((millis()-time_ArdNode)<limit_ArdNode)){
      if (swSerial.read()=='Y'){
        ack_Ard = true;
        Serial.print("Y received from Arduino");
      }
    }
    if (ack_Ard == true) { //ready to read after ok from Arduino
      while ((swSerial.available()>0)&&(message_finished == false)&&((millis()-time_ArdNode)<limit_ArdNode)){ 
        currentChar = swSerial.read();
        Serial.print("currentChar: ");
        Serial.println(currentChar);
        if (message_begun == true){ //message starts with <,see else if.But it could be that there is a z in the middle of a message, so message_begun==true has priority over currentChar==startMarker
          if (currentChar != endMarker) {
            currentMessage[posChar] = currentChar;
            posChar++;
            if (posChar>=maxBuffer){ //undesired situation in which we get to the last char without end marker '>' 
              message_begun = false; //if we want to consider it as an invalid message, exit function with a return 
              //ALREADY IN FIRST LINES OF THE FUNCTION posChar = 0;
              return;
            }
          }
          else { //end marker
            currentMessage[posChar] = '\0'; //finish the string
            strcpy(tempMessage, currentMessage);// this temporary copy is necessary to protect the original data because strtok() replaces the commas with \0
            message_finished = true;
            message_begun = false;
            //ALREADY IN FIRST LINES OF THE FUNCTION posChar = 0;
            //in order to process the values for the HTTP POST request, we need to tokenize
            strtok_indexPointer = strtok(tempMessage,";"); // get everything until first ';', that is, current_position
            current_position = atoi(strtok_indexPointer); //conversion to integer 
            strtok_indexPointer = strtok(NULL,";"); // position the pointer where last strtok, that is, from \0. We get the next part: current_speed
            current_speed = atof(strtok_indexPointer); //conversion to float
            strtok_indexPointer = strtok(NULL,";"); // position the pointer where last strtok, that is, from \0. We get the next part: duration_cycle
            duration_cycle = atof(strtok_indexPointer); //conversion to float
            strtok_indexPointer = strtok(NULL,";"); // position the pointer where last strtok, that is, from \0. We get the next part: add_cycle
            addCycle = atoi(strtok_indexPointer); 
            strtok_indexPointer = strtok(NULL,";"); // position the pointer where last strtok, that is, from \0. We get the next part: encodder_lost
            encoder_lost = atoi(strtok_indexPointer);
    
            break;
          }
        }
        else if (currentChar == startMarker) { //a real new message starts
          posChar = 0;
          message_begun = true;
          Serial.println("Message begins");
        }
      }
    }
    
    
  }

  else {
    swserial_available = false;
    Serial.println("swserial NOT available: ");
    Serial.println(swSerial.available());
  }
}
/*******************************************************************************************************************************************************************************************/

void readAnalogue(int pinC, int pinT, int pinH, int pinE) {
  if (adc_begin) { //In the past, if ADS1115 is not connected, there is a watchdog timer problem (WDT reset) 
    rawC = adc.readADC_SingleEnded(pinC);
    rawH = adc.readADC_SingleEnded(pinH);
    rawT = adc.readADC_SingleEnded(pinT);
    rawE = adc.readADC_SingleEnded(pinE);
    current = (rawC + offset_OAc) * sensitivity_Current + offset_Current; //sensitivity in mA/resolution bits
    temperature = (rawT + offset_OAt) * sensitivity_Temp + offset_Temp ;
    humidity = (rawH + offset_OAh) * sensitivity_Hum + offset_Hum ;
    if ((rawE * sensitivity_Em) > 2.0) {
      EmergencyStop_active = HIGH;
    }
    else {
      EmergencyStop_active = LOW;
    }
  }
  else {
    rawC = -1;
    rawH = -1;
    rawT =-1;
    current = -1; //error
    temperature = -1; //error
    humidity = 101; //error
    adc_begin = adc.begin();//start ADS1115
  }
}

/*******************************************************************************************************************************************************************************************/

void manageOutputs (int pinOut1, int pinOut2, bool out1, bool out2) { //Out1: STOP; Out2:KB
  if (out1 == true) {
    digitalWrite(pinOut1, LOW); //active on LOW! because GPIO2 (D4) needs to be HIGH during boot (there is a pull-up)
  }
  else {
    digitalWrite(pinOut1, HIGH);
  }

  if (out2 == true) {
    digitalWrite(pinOut2, HIGH);
  }
  else {
    digitalWrite(pinOut2, LOW);
  }
}

/*******************************************************************************************************************************************************************************************/

//HTTP RELATED FUNCTIONS
void activeKB() {
  ESPserver.sendHeader("Access-Control-Allow-Origin", "*"); //for the Cross Domain HTTPS-HTTP
  ESPserver.send(200, "text/plain", "active KB"); //just a message from ESP
  outKB = true;
  manageOutputs(pinSTOP_out, pinKB, outSTOP, outKB); //activating another emergency stop and KB from website
}
void inactiveKB() {
  ESPserver.sendHeader("Access-Control-Allow-Origin", "*");
  ESPserver.send(200, "text/plain", "inactive KB");
  outKB = false;
  manageOutputs(pinSTOP_out, pinKB, outSTOP, outKB); //activating another emergency stop and KB from website
}
void activeSTOP() {
  ESPserver.sendHeader("Access-Control-Allow-Origin", "*");
  ESPserver.send(200, "text/plain", "active STOP");
  outSTOP = true;
  manageOutputs(pinSTOP_out, pinKB, outSTOP, outKB); //activating another emergency stop and KB from website
}
void inactiveSTOP() {
  ESPserver.sendHeader("Access-Control-Allow-Origin", "*");
  ESPserver.send(200, "text/plain", "inactive STOP");
  outSTOP = false;
  manageOutputs(pinSTOP_out, pinKB, outSTOP, outKB); //activating another emergency stop and KB from website
}
