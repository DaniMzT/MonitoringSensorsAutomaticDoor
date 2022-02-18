#include <SoftwareSerial.h> //for software serial communication Arduino-NodeMCU
#include <StreamUtils.h>

const int pinCOUNTER = 4 ; //pin D4 GPIO4 limit switch used as a cycles counter
const int pinLEDA = 6; //pin D6 GPIO6 for LED A used for the encoder
const int pinLEDB = 7; //pin D7 GPIO7 for LED B used for the encoder

bool addCycle = true; //true if new cycle. the number of cycles is stored in database. bool size=1 byte; int size = 2 bytes (if I wanted to use 1 or 0 instead of true or false)
int lastCounter = LOW; //last state of the limit switch. HIGH/LOW from digitalRead is type int
int currentCounter = LOW; //current state of the limit switch
unsigned long time_cycle_begin = millis(); //time when cycle starts. millis() is type unsigned long
unsigned long time_cycle_previous = millis(); //time reading in the previous iteration
unsigned long time_cycle_current = millis(); //current time
float duration_cycle; //duration of the current cycle in seconds.
bool encoder_lost = false; //if encoder reading makes no sense (encoder error, either due to the sensor or to wrong reading because of too slow sampling, etc)
int LEDA; //signal LED A
int LEDB; //signal LED B
unsigned int last_Encoder_state = 4; //last encoder reading.state = 0 if{HIGH,LOW};1 if{LOW,HIGH};2 if{LOW,LOW};3 if{HIGH,HIGH};4=to access case:default first time in readEncoder
const int resolution_position = 3; //displacement in mm in every transition
int previous_position = -1; //positioning/speed will start when position==0. BETTER UNSIGNED! if the installation is correct, signed will work
int current_position = -1; //positioning/speed will start when position==0. BETTER UNSIGNED! if the installation is correct, signed will work
float current_speed = -1.0;
bool initialized = false;

//pins SW serial
const int RXard = 2; //GPIO2
const int TXard = 3; //GPIO3
SoftwareSerial swSerial(2,3); //communication SW serial Arduino-NodeMCU

//int iteration = 0;
bool ack_Node = false;
const byte limit_wait = 10; //limit to wait for the permission from Node. As short as possible to keep encoder running
unsigned int time_ArdNode = 0;

const int loop_wait = 1; //ms of wait between loop iterations
char rubbish;

void setup() {
  Serial.begin(115200); //serial port (real port)
  // Using the lowest possible data rate to reduce error ratio
  swSerial.begin(4800);//4800. 9600 was proved to work
  pinMode(pinLEDA,INPUT); //configuration digital input
  pinMode(pinLEDB,INPUT); //configuration digital input
  pinMode(pinCOUNTER,INPUT); //configuration digital input
  delay(5000);
  while (swSerial.available()!=0) {
    //setup.swSerial != 0
    rubbish = swSerial.read();
  }
  //setup.swSerial empty
  swSerial.print('N');
  
}

void loop() {
  readCounter(pinCOUNTER); //check if there is a new cycle by reading limit switch
  readEncoder(pinLEDA, pinLEDB); //position and speed calculated after reading from encoder
  ack_Node = false;
  time_ArdNode = millis();
  //send as long as Node allows ('y' received)
  while ((swSerial.available()>0)&&(ack_Node == false)&&((millis()-time_ArdNode)<limit_wait)){
    if (swSerial.read()=='S'){
      ack_Node = true;
    }
  }
  if (ack_Node == true) {
    swSerial.print('Y');//yes
    swSerial.print('<'); //start marker: <
    swSerial.print(current_position);
    swSerial.print(';');
    swSerial.print(current_speed);
    swSerial.print(';');
    swSerial.print(duration_cycle);
    swSerial.print(';');
    swSerial.print(addCycle);
    swSerial.print(';');
    swSerial.print(encoder_lost);
    swSerial.print('>');//end marker: >
  }
  
  delay(loop_wait);
}

void readCounter(int pin) {
  currentCounter = digitalRead(pin);
  addCycle = false;
  if ((currentCounter == HIGH) && (lastCounter == LOW)) { //rising edge
    initialized = true;
    //current_position = 0;
    /*Not desired to do current_position=0. If limit switch active, current pos GIVEN BY ENCODER CALCULATION should be 0.otherwise, encoder may be faulty, but we want to know encoder
      is faulty by comparing curr pos and limit switch.As well,maybe position is close to 0 but not 0 when limit switch active.If we wanted to do current_position=0,anyway we should
      modify readEncoder because currently current_position=previous_position(w/o +-resolution)*/
    addCycle = true;
    time_cycle_begin = millis();
    duration_cycle = 0;
  }
  lastCounter = currentCounter;
}

void readEncoder(int pinA, int pinB) {
  if (initialized == true) { //initialized once we know the zero position.From then, we can know absolute position.
    //switch-case only can work with integers or enumerations.
    //if statements working element by element, not array_variable == {value1,value2...} but array_variable[0]==value1 && array_variable[1]==value2 ...
    //only read encoder if last reading was not defective or,if defective,restart after every new cycle
    if ((encoder_lost == false) || ((encoder_lost == true) && (addCycle == true))) {
      encoder_lost = false; //clear encoder error
      LEDA = digitalRead(pinA);
      LEDB = digitalRead(pinB);
      time_cycle_current = millis();
      //machine of encoder states according to LED A and LED B signals
      if ((LEDA == HIGH) && (LEDB == LOW)) { //state 0
        switch (last_Encoder_state) {
          case 0:
            current_position = previous_position;
            break;
          case 2:
            current_position = previous_position + resolution_position;
            break;
          case 3:
            current_position = previous_position - resolution_position;
            break;
          case 1: //encoder lost
            encoder_lost = true;
          default:
            current_position = previous_position;
            break;
        }
        last_Encoder_state = 0;
      }
      else if ((LEDA == LOW) && (LEDB == HIGH)) { //state 1
        switch (last_Encoder_state) {
          case 1:
            current_position = previous_position;
            break;
          case 3:
            current_position = previous_position + resolution_position;
            break;
          case 2:
            current_position = previous_position - resolution_position;
            break;
          case 0: //encoder lost
            encoder_lost = true;
          default:
            current_position = previous_position;
            break;
        }
        last_Encoder_state = 1;
      }
      else if ((LEDA == LOW) && (LEDB == LOW)) { //state 2
        switch (last_Encoder_state) {
          case 2:
            current_position = previous_position;
            break;
          case 1:
            current_position = previous_position + resolution_position;
            break;
          case 0:
            current_position = previous_position - resolution_position;
            break;
          case 3: //encoder lost
            encoder_lost = true;
          default:
            current_position = previous_position;
            break;
        }
        last_Encoder_state = 2;
      }
      else if ((LEDA == HIGH) && (LEDB == HIGH)) { //state 3
        switch (last_Encoder_state) {
          case 3:
            current_position = previous_position;
            break;
          case 0:
            current_position = previous_position + resolution_position;
            break;
          case 1:
            current_position = previous_position - resolution_position;
            break;
          case 2: //encoder lost
            encoder_lost = true;
          default:
            current_position = previous_position;
            break;
        }
        last_Encoder_state = 3;
      }
      duration_cycle = (time_cycle_current - time_cycle_begin ) / 1000.0; // converted into seconds, as millis() are given in ms
      current_speed = (float(current_position) - float(previous_position)) * 1000.0 / (float(time_cycle_current - time_cycle_previous)); //substraction unsigned int returns an unsigned int
      time_cycle_previous = time_cycle_current;
      previous_position = current_position;
    }
  }
  else {
    time_cycle_previous = millis(); //for the first time in readEncoder
  }
}
