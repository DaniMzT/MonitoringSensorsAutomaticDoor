EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_UNO_R3 A1
U 1 1 60ECC421
P 3250 3550
F 0 "A1" H 3250 4731 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 3250 4640 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3_WithMountingHoles" H 3250 3550 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 3250 3550 50  0001 C CNN
	1    3250 3550
	1    0    0    -1  
$EndComp
Text GLabel 2750 3150 0    50   Input ~ 0
TXard
Text GLabel 2750 3250 0    50   Input ~ 0
RXard
Text GLabel 2750 3350 0    50   Input ~ 0
LimitSwitch
Text GLabel 2750 3550 0    50   Input ~ 0
LEDa
Text GLabel 2750 3650 0    50   Input ~ 0
LEDb
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 60ECF20E
P 4300 2850
F 0 "J2" H 4408 3031 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4408 2940 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 4300 2850 50  0001 C CNN
F 3 "~" H 4300 2850 50  0001 C CNN
	1    4300 2850
	1    0    0    -1  
$EndComp
Text GLabel 4500 2850 2    50   Input ~ 0
5V
$Comp
L power:GNDREF #PWR01
U 1 1 60ECF90C
P 4500 2950
F 0 "#PWR01" H 4500 2700 50  0001 C CNN
F 1 "GNDREF" V 4505 2822 50  0000 R CNN
F 2 "" H 4500 2950 50  0001 C CNN
F 3 "" H 4500 2950 50  0001 C CNN
	1    4500 2950
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 60ED0652
P 4250 3550
F 0 "J1" H 4358 3731 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4358 3640 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 4250 3550 50  0001 C CNN
F 3 "~" H 4250 3550 50  0001 C CNN
	1    4250 3550
	1    0    0    -1  
$EndComp
Text GLabel 4450 3550 2    50   Input ~ 0
5V
Text GLabel 4450 3650 2    50   Input ~ 0
LimitSwitch
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 610D8BBD
P 4300 4700
F 0 "J4" H 4408 4881 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4408 4790 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 4300 4700 50  0001 C CNN
F 3 "~" H 4300 4700 50  0001 C CNN
	1    4300 4700
	1    0    0    -1  
$EndComp
Text GLabel 4500 4800 2    50   Input ~ 0
TXard
Text GLabel 4500 4700 2    50   Input ~ 0
RXard
Text GLabel 3450 2550 1    50   Input ~ 0
5V
$Comp
L power:GNDREF #PWR0101
U 1 1 610E3155
P 3350 4650
F 0 "#PWR0101" H 3350 4400 50  0001 C CNN
F 1 "GNDREF" V 3355 4522 50  0000 R CNN
F 2 "" H 3350 4650 50  0001 C CNN
F 3 "" H 3350 4650 50  0001 C CNN
	1    3350 4650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 615D615A
P 4750 4100
F 0 "J3" H 4858 4381 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4858 4290 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_4-G-3.5_1x04_P3.50mm_Horizontal" H 4750 4100 50  0001 C CNN
F 3 "~" H 4750 4100 50  0001 C CNN
	1    4750 4100
	-1   0    0    -1  
$EndComp
Text GLabel 4550 4300 0    50   Input ~ 0
5V
Text GLabel 4550 4000 0    50   Input ~ 0
LEDa
Text GLabel 4550 4100 0    50   Input ~ 0
LEDb
$Comp
L power:GNDREF #PWR02
U 1 1 60ED2CC1
P 4550 4200
F 0 "#PWR02" H 4550 3950 50  0001 C CNN
F 1 "GNDREF" V 4555 4072 50  0000 R CNN
F 2 "" H 4550 4200 50  0001 C CNN
F 3 "" H 4550 4200 50  0001 C CNN
	1    4550 4200
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR0102
U 1 1 615DED07
P 3250 4650
F 0 "#PWR0102" H 3250 4400 50  0001 C CNN
F 1 "GNDREF" V 3255 4522 50  0000 R CNN
F 2 "" H 3250 4650 50  0001 C CNN
F 3 "" H 3250 4650 50  0001 C CNN
	1    3250 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0103
U 1 1 615DEE18
P 3150 4650
F 0 "#PWR0103" H 3150 4400 50  0001 C CNN
F 1 "GNDREF" V 3155 4522 50  0000 R CNN
F 2 "" H 3150 4650 50  0001 C CNN
F 3 "" H 3150 4650 50  0001 C CNN
	1    3150 4650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
