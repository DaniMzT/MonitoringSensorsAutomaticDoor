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
L Regulator_Switching:LM2575-5.0BT U2
U 1 1 60AE2706
P 1700 5450
F 0 "U2" H 1700 5817 50  0000 C CNN
F 1 "LM2575-5.0BT" H 1700 5726 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-5_Vertical" H 1700 5200 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/lm2575.pdf" H 1700 5450 50  0001 C CNN
	1    1700 5450
	1    0    0    -1  
$EndComp
Text GLabel 1150 5350 1    50   Input ~ 0
24V
$Comp
L power:GNDREF #PWR05
U 1 1 60AE7307
P 1700 5800
F 0 "#PWR05" H 1700 5550 50  0001 C CNN
F 1 "GNDREF" H 1705 5627 50  0000 C CNN
F 2 "" H 1700 5800 50  0001 C CNN
F 3 "" H 1700 5800 50  0001 C CNN
	1    1700 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR02
U 1 1 60AE7808
P 1200 5550
F 0 "#PWR02" H 1200 5300 50  0001 C CNN
F 1 "GNDREF" H 1205 5377 50  0000 C CNN
F 2 "" H 1200 5550 50  0001 C CNN
F 3 "" H 1200 5550 50  0001 C CNN
	1    1200 5550
	1    0    0    -1  
$EndComp
Text GLabel 2100 4350 1    50   Input ~ 0
3.3V
$Comp
L Device:C C2
U 1 1 60AE83B3
P 950 4500
F 0 "C2" H 1065 4546 50  0000 L CNN
F 1 "0.47uF" H 1065 4455 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 988 4350 50  0001 C CNN
F 3 "~" H 950 4500 50  0001 C CNN
	1    950  4500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 60AE95F6
P 2350 4500
F 0 "C3" H 2468 4546 50  0000 L CNN
F 1 "33uF" H 2468 4455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 2388 4350 50  0001 C CNN
F 3 "~" H 2350 4500 50  0001 C CNN
	1    2350 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  4300 950  4350
$Comp
L power:GNDREF #PWR04
U 1 1 60AEA98E
P 1650 4700
F 0 "#PWR04" H 1650 4450 50  0001 C CNN
F 1 "GNDREF" H 1655 4527 50  0000 C CNN
F 2 "" H 1650 4700 50  0001 C CNN
F 3 "" H 1650 4700 50  0001 C CNN
	1    1650 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  4650 1650 4650
Wire Wire Line
	1650 4650 1650 4600
Connection ~ 1650 4650
Wire Wire Line
	1650 4650 1650 4700
Wire Wire Line
	1700 5750 1700 5800
$Comp
L Device:CP C1
U 1 1 60AED5FD
P 700 5500
F 0 "C1" H 818 5546 50  0000 L CNN
F 1 "100uF" H 818 5455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 738 5350 50  0001 C CNN
F 3 "~" H 700 5500 50  0001 C CNN
	1    700  5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  5350 1200 5350
Wire Wire Line
	700  5650 700  5800
Wire Wire Line
	700  5800 1700 5800
Connection ~ 1700 5800
$Comp
L Device:L L1
U 1 1 60AEEB63
P 2650 5550
F 0 "L1" V 2840 5550 50  0000 C CNN
F 1 "330uH" V 2749 5550 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_D16.8mm_P12.70mm_Vishay_IHB-1" H 2650 5550 50  0001 C CNN
F 3 "~" H 2650 5550 50  0001 C CNN
	1    2650 5550
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 60AEF3F6
P 2400 5750
F 0 "D1" V 2354 5830 50  0000 L CNN
F 1 "1N5822" V 2445 5830 50  0000 L CNN
F 2 "Diode_THT:D_DO-201_P12.70mm_Horizontal" H 2400 5750 50  0001 C CNN
F 3 "~" H 2400 5750 50  0001 C CNN
	1    2400 5750
	0    1    1    0   
$EndComp
$Comp
L Device:CP C4
U 1 1 60AF3349
P 2900 5700
F 0 "C4" H 3018 5746 50  0000 L CNN
F 1 "330uF" H 3018 5655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 2938 5550 50  0001 C CNN
F 3 "~" H 2900 5700 50  0001 C CNN
	1    2900 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 5550 2400 5550
Wire Wire Line
	2800 5550 2900 5550
Wire Wire Line
	2400 5600 2400 5550
Connection ~ 2400 5550
Wire Wire Line
	2400 5550 2500 5550
Wire Wire Line
	2900 5850 2900 5900
Wire Wire Line
	2900 5900 2400 5900
Wire Wire Line
	1700 5900 1700 5800
Wire Wire Line
	2900 5550 2900 5350
Wire Wire Line
	2900 5350 2200 5350
Connection ~ 2900 5550
Text GLabel 2900 5500 2    50   Input ~ 0
5V
Wire Wire Line
	1700 5800 2250 5800
Wire Wire Line
	2250 5800 2250 5900
Wire Wire Line
	2250 5900 2400 5900
Connection ~ 2400 5900
$Comp
L Device:R R4
U 1 1 60AEDF68
P 7100 2550
F 0 "R4" V 6893 2550 50  0000 C CNN
F 1 "4.7k" V 6984 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7030 2550 50  0001 C CNN
F 3 "~" H 7100 2550 50  0001 C CNN
	1    7100 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 60AF3A81
P 7550 2700
F 0 "R6" H 7620 2746 50  0000 L CNN
F 1 "680" H 7620 2655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7480 2700 50  0001 C CNN
F 3 "~" H 7550 2700 50  0001 C CNN
	1    7550 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:D D4
U 1 1 60AF4021
P 7800 2700
F 0 "D4" V 7846 2620 50  0000 R CNN
F 1 "D" V 7755 2620 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7800 2700 50  0001 C CNN
F 3 "~" H 7800 2700 50  0001 C CNN
	1    7800 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 2350 7800 2350
Wire Wire Line
	7800 2350 7800 1950
Wire Wire Line
	7800 1950 9000 1950
Wire Wire Line
	9000 1950 9000 2450
Wire Wire Line
	9000 2450 8600 2450
Wire Wire Line
	7250 2550 7550 2550
Wire Wire Line
	7550 2550 7800 2550
Connection ~ 7550 2550
Wire Wire Line
	8000 2550 7800 2550
Connection ~ 7800 2550
$Comp
L power:GNDREF #PWR019
U 1 1 60AFD612
P 8300 2150
F 0 "#PWR019" H 8300 1900 50  0001 C CNN
F 1 "GNDREF" V 8305 2022 50  0000 R CNN
F 2 "" H 8300 2150 50  0001 C CNN
F 3 "" H 8300 2150 50  0001 C CNN
	1    8300 2150
	0    -1   -1   0   
$EndComp
Text GLabel 6950 2550 0    50   Input ~ 0
Stop_from_DCU
$Comp
L power:GNDREF #PWR017
U 1 1 60B00A2F
P 7550 2850
F 0 "#PWR017" H 7550 2600 50  0001 C CNN
F 1 "GNDREF" H 7555 2677 50  0000 C CNN
F 2 "" H 7550 2850 50  0001 C CNN
F 3 "" H 7550 2850 50  0001 C CNN
	1    7550 2850
	1    0    0    -1  
$EndComp
Text GLabel 7800 2850 3    50   Input ~ 0
3.3V
$Comp
L Device:R R3
U 1 1 60B07FA0
P 7100 1300
F 0 "R3" V 6893 1300 50  0000 C CNN
F 1 "1.8k" V 6984 1300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7030 1300 50  0001 C CNN
F 3 "~" H 7100 1300 50  0001 C CNN
	1    7100 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 60B07FA6
P 7550 1450
F 0 "R5" H 7620 1496 50  0000 L CNN
F 1 "820" H 7620 1405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7480 1450 50  0001 C CNN
F 3 "~" H 7550 1450 50  0001 C CNN
	1    7550 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:D D3
U 1 1 60B07FAC
P 7800 1450
F 0 "D3" V 7846 1370 50  0000 R CNN
F 1 "D" V 7755 1370 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 7800 1450 50  0001 C CNN
F 3 "~" H 7800 1450 50  0001 C CNN
	1    7800 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 1100 7800 1100
Wire Wire Line
	7800 1100 7800 700 
Wire Wire Line
	7250 1300 7550 1300
Wire Wire Line
	7550 1300 7800 1300
Connection ~ 7550 1300
Wire Wire Line
	8000 1300 7800 1300
Connection ~ 7800 1300
Text GLabel 6950 1300 0    50   Input ~ 0
Temperature_sensor
$Comp
L power:GNDREF #PWR016
U 1 1 60B07FBA
P 7550 1600
F 0 "#PWR016" H 7550 1350 50  0001 C CNN
F 1 "GNDREF" H 7555 1427 50  0000 C CNN
F 2 "" H 7550 1600 50  0001 C CNN
F 3 "" H 7550 1600 50  0001 C CNN
	1    7550 1600
	1    0    0    -1  
$EndComp
Text GLabel 7800 1600 3    50   Input ~ 0
3.3V
Wire Wire Line
	7800 700  9050 700 
Wire Wire Line
	9050 700  9050 1200
Wire Wire Line
	9050 1200 8600 1200
$Comp
L power:GNDREF #PWR018
U 1 1 60B0B02F
P 8300 900
F 0 "#PWR018" H 8300 650 50  0001 C CNN
F 1 "GNDREF" V 8305 772 50  0000 R CNN
F 2 "" H 8300 900 50  0001 C CNN
F 3 "" H 8300 900 50  0001 C CNN
	1    8300 900 
	0    -1   -1   0   
$EndComp
Text GLabel 8300 2750 2    50   Input ~ 0
3.3V
$Comp
L Device:R R1
U 1 1 60B18345
P 2650 1300
F 0 "R1" V 2443 1300 50  0000 C CNN
F 1 "1.8k" V 2534 1300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2580 1300 50  0001 C CNN
F 3 "~" H 2650 1300 50  0001 C CNN
	1    2650 1300
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 60B1834B
P 3100 1450
F 0 "R2" H 3170 1496 50  0000 L CNN
F 1 "820" H 3170 1405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3030 1450 50  0001 C CNN
F 3 "~" H 3100 1450 50  0001 C CNN
	1    3100 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 60B18351
P 3350 1450
F 0 "D2" V 3396 1370 50  0000 R CNN
F 1 "D" V 3305 1370 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3350 1450 50  0001 C CNN
F 3 "~" H 3350 1450 50  0001 C CNN
	1    3350 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2800 1300 3100 1300
Connection ~ 3100 1300
Wire Wire Line
	3550 1300 3350 1300
Connection ~ 3350 1300
Text GLabel 2500 1300 0    50   Input ~ 0
Humidity_sensor
$Comp
L power:GNDREF #PWR09
U 1 1 60B1835D
P 3100 1600
F 0 "#PWR09" H 3100 1350 50  0001 C CNN
F 1 "GNDREF" H 3105 1427 50  0000 C CNN
F 2 "" H 3100 1600 50  0001 C CNN
F 3 "" H 3100 1600 50  0001 C CNN
	1    3100 1600
	1    0    0    -1  
$EndComp
Text GLabel 3350 1600 3    50   Input ~ 0
3.3V
$Comp
L power:GNDREF #PWR011
U 1 1 60B19A10
P 3850 900
F 0 "#PWR011" H 3850 650 50  0001 C CNN
F 1 "GNDREF" V 3855 772 50  0000 R CNN
F 2 "" H 3850 900 50  0001 C CNN
F 3 "" H 3850 900 50  0001 C CNN
	1    3850 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3550 1100 3450 1100
Wire Wire Line
	3450 1100 3450 750 
Wire Wire Line
	3450 750  4550 750 
Wire Wire Line
	4550 750  4550 1200
Text GLabel 8300 1500 2    50   Input ~ 0
3.3V
Text GLabel 2600 2700 2    50   Input ~ 0
3.3V
Text GLabel 6400 3700 2    50   Input ~ 0
SCL
Text GLabel 6400 3800 2    50   Input ~ 0
SDA
$Comp
L board_withoutEncoder-rescue:NodeMCU_1.0_(ESP-12E)-ESP8266 U4
U 1 1 60AD6F50
P 5600 4300
F 0 "U4" H 5600 5387 60  0000 C CNN
F 1 "NodeMCU_1.0_(ESP-12E)" H 5600 5281 60  0000 C CNN
F 2 "ESP8266_related:NodeMCU1.0(12-E)" H 5000 3450 60  0001 C CNN
F 3 "" H 5000 3450 60  0000 C CNN
	1    5600 4300
	1    0    0    -1  
$EndComp
Text GLabel 2150 3000 0    50   Input ~ 0
SDA
Text GLabel 4550 1000 0    50   Input ~ 0
humidity
Text GLabel 9050 1000 0    50   Input ~ 0
temperature
Text GLabel 9000 2300 0    50   Input ~ 0
stop_in
Text GLabel 2150 3600 0    50   Input ~ 0
stop_in
Text GLabel 6400 4000 2    50   Input ~ 0
stop_out
Text GLabel 6400 4500 2    50   Input ~ 0
KB_out
Text GLabel 2150 3300 0    50   Input ~ 0
current
Text GLabel 2150 3500 0    50   Input ~ 0
temperature
Text GLabel 2150 3400 0    50   Input ~ 0
humidity
$Comp
L Transistor_FET:BS170 Q1
U 1 1 60B51EFB
P 8000 4250
F 0 "Q1" H 8204 4296 50  0000 L CNN
F 1 "BS170" H 8204 4205 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8200 4175 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BS170-D.PDF" H 8000 4250 50  0001 L CNN
	1    8000 4250
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BS170 Q3
U 1 1 60B538CC
P 10350 4300
F 0 "Q3" H 10554 4346 50  0000 L CNN
F 1 "BS170" H 10554 4255 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 10550 4225 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BS170-D.PDF" H 10350 4300 50  0001 L CNN
	1    10350 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 60B59069
P 7800 4650
F 0 "R7" V 7593 4650 50  0000 C CNN
F 1 "1k" V 7684 4650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7730 4650 50  0001 C CNN
F 3 "~" H 7800 4650 50  0001 C CNN
	1    7800 4650
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 60B5D8DC
P 10200 4700
F 0 "R9" V 9993 4700 50  0000 C CNN
F 1 "39k" V 10084 4700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10130 4700 50  0001 C CNN
F 3 "~" H 10200 4700 50  0001 C CNN
	1    10200 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	8100 3900 8100 3950
Wire Wire Line
	8100 4450 8100 4650
Wire Wire Line
	8100 4650 7950 4650
Wire Wire Line
	10450 4500 10450 4700
Wire Wire Line
	10450 4700 10350 4700
Wire Wire Line
	10450 3950 10450 4100
Wire Wire Line
	7650 4650 7650 4250
Wire Wire Line
	7650 4250 7800 4250
Wire Wire Line
	10050 4700 10050 4300
Wire Wire Line
	10050 4300 10150 4300
Text GLabel 8100 3150 0    50   Input ~ 0
5V
Text GLabel 10450 3200 0    50   Input ~ 0
5V
Wire Wire Line
	8100 3150 8100 3250
Text GLabel 7650 4250 0    50   Input ~ 0
KB_out
Text GLabel 10050 4300 0    50   Input ~ 0
stop_out
Text GLabel 8100 4050 2    50   Input ~ 0
KB_relay
Text GLabel 10450 4050 2    50   Input ~ 0
stop_relay
Text GLabel 4900 6600 2    50   Input ~ 0
24V
Text GLabel 4800 5000 0    50   Input ~ 0
5V
Text GLabel 6400 4400 2    50   Input ~ 0
RXnode
Text GLabel 6400 4300 2    50   Input ~ 0
RXard
$Comp
L Transistor_FET:BS170 Q2
U 1 1 60ED314A
P 7300 5800
F 0 "Q2" H 7504 5846 50  0000 L CNN
F 1 "BS170" H 7504 5755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7500 5725 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BS170-D.PDF" H 7300 5800 50  0001 L CNN
	1    7300 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 60ED3150
P 7400 5300
F 0 "R10" H 7470 5346 50  0000 L CNN
F 1 "1k" H 7470 5255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7330 5300 50  0001 C CNN
F 3 "~" H 7400 5300 50  0001 C CNN
	1    7400 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 60ED3156
P 7100 6200
F 0 "R8" V 6893 6200 50  0000 C CNN
F 1 "1k" V 6984 6200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7030 6200 50  0001 C CNN
F 3 "~" H 7100 6200 50  0001 C CNN
	1    7100 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 5450 7400 5600
Wire Wire Line
	7400 6000 7400 6200
Wire Wire Line
	7400 6200 7250 6200
Wire Wire Line
	6950 6200 6950 5800
Wire Wire Line
	6950 5800 7100 5800
Text GLabel 7400 5050 0    50   Input ~ 0
5V
Text GLabel 6950 6000 0    50   Input ~ 0
3.3V
Wire Wire Line
	7400 5050 7400 5150
Text GLabel 7400 6150 2    50   Input ~ 0
RXnode
Text GLabel 7400 5500 0    50   Input ~ 0
TXard
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 60EE86CB
P 5350 7250
F 0 "J8" H 5458 7431 50  0000 C CNN
F 1 "Conn_01x02_Male" H 5458 7340 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 5350 7250 50  0001 C CNN
F 3 "~" H 5350 7250 50  0001 C CNN
	1    5350 7250
	0    -1   -1   0   
$EndComp
Text GLabel 5350 7050 1    50   Input ~ 0
TXard
Text GLabel 5450 7050 1    50   Input ~ 0
RXard
Text GLabel 2900 7250 1    50   Input ~ 0
5V
$Comp
L power:GNDREF #PWR08
U 1 1 60F3D4AC
P 2800 7250
F 0 "#PWR08" H 2800 7000 50  0001 C CNN
F 1 "GNDREF" H 2805 7077 50  0000 C CNN
F 2 "" H 2800 7250 50  0001 C CNN
F 3 "" H 2800 7250 50  0001 C CNN
	1    2800 7250
	1    0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR06
U 1 1 60F308B0
P 2450 7250
F 0 "#PWR06" H 2450 7000 50  0001 C CNN
F 1 "GNDREF" H 2455 7077 50  0000 C CNN
F 2 "" H 2450 7250 50  0001 C CNN
F 3 "" H 2450 7250 50  0001 C CNN
	1    2450 7250
	1    0    0    1   
$EndComp
Text GLabel 2350 7250 1    50   Input ~ 0
Current_Fluke
$Comp
L power:GNDREF #PWR03
U 1 1 60F13DF3
P 10450 4700
F 0 "#PWR03" H 10450 4450 50  0001 C CNN
F 1 "GNDREF" H 10455 4527 50  0000 C CNN
F 2 "" H 10450 4700 50  0001 C CNN
F 3 "" H 10450 4700 50  0001 C CNN
	1    10450 4700
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR01
U 1 1 60F1059E
P 8100 4650
F 0 "#PWR01" H 8100 4400 50  0001 C CNN
F 1 "GNDREF" H 8105 4477 50  0000 C CNN
F 2 "" H 8100 4650 50  0001 C CNN
F 3 "" H 8100 4650 50  0001 C CNN
	1    8100 4650
	-1   0    0    -1  
$EndComp
Text GLabel 1950 7250 1    50   Input ~ 0
Stop_from_DCU
Text GLabel 1350 7300 1    50   Input ~ 0
stop_relay
Text GLabel 950  7250 1    50   Input ~ 0
KB_relay
Text GLabel 3350 7200 1    50   Input ~ 0
Humidity_sensor
Text GLabel 3450 7200 1    50   Input ~ 0
Temperature_sensor
Wire Wire Line
	2350 4650 1700 4650
$Comp
L board_withoutEncoder-rescue:LM3940IT-3.3-eec_LM3940 U1
U 1 1 60ADFCC3
P 1200 4350
F 0 "U1" H 1700 4615 50  0000 C CNN
F 1 "LM3940IT-3.3" H 1700 4524 50  0000 C CNN
F 2 "LM3940:TI_National_Semiconductor-LM3940IT-3.3-Manufacturer_Recommended" H 1200 4750 50  0001 L CNN
F 3 "" H 1200 4850 50  0001 L CNN
F 4 "" H 1200 4950 50  0001 L CNN "Code  IPC"
F 5 "" H 1200 5050 50  0001 L CNN "Code  JEDEC"
F 6 "" H 1200 5150 50  0001 L CNN "Code  JEITA"
F 7 "LDO IC" H 1200 5250 50  0001 L CNN "Comp Type"
F 8 "Datasheet URL" H 1200 5350 50  0001 L CNN "Component Link 1 Description"
F 9 "http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=LM3940&fileType=pdf" H 1200 5450 50  0001 L CNN "Component Link 1 URL"
F 10 "" H 1200 5550 50  0001 L CNN "High  Reliability"
F 11 "TO-220, Molded, 3 Lead, Straight" H 1200 5650 50  0001 L CNN "Package Description"
F 12 "NSUZXYTTE#*LM3940IT*-3.3 P+" H 1200 5750 50  0001 L CNN "Package Top Marking"
F 13 "3" H 1200 5850 50  0001 L CNN "Pin Count"
F 14 "N" H 1200 5950 50  0001 L CNN "Power Wise"
F 15 "IC" H 1200 6050 50  0001 L CNN "category"
F 16 "1170640" H 1200 6150 50  0001 L CNN "ciiva ids"
F 17 "20ca9a87bde61fc1" H 1200 6250 50  0001 L CNN "library id"
F 18 "TI National Semiconductor" H 1200 6350 50  0001 L CNN "manufacturer"
F 19 "NDE0003A" H 1200 6450 50  0001 L CNN "package"
F 20 "1464077220" H 1200 6550 50  0001 L CNN "release date"
F 21 "No" H 1200 6650 50  0001 L CNN "rohs"
F 22 "C63C0EB0-D65C-4178-97EF-FC8788BAEF5D" H 1200 6750 50  0001 L CNN "vault revision"
F 23 "yes" H 1200 6850 50  0001 L CNN "imported"
	1    1200 4350
	1    0    0    -1  
$EndComp
Text GLabel 1300 4350 1    50   Input ~ 0
5V
Connection ~ 950  4350
Wire Wire Line
	950  4350 1300 4350
Connection ~ 1700 4650
Wire Wire Line
	1700 4650 1650 4650
Wire Wire Line
	2350 4350 2100 4350
$Comp
L board_withoutEncoder-rescue:694106301002-eec_WurthDCJack J7
U 1 1 61130B95
P 4900 6600
F 0 "J7" H 4693 6795 50  0000 C CNN
F 1 "694106301002" H 4693 6704 50  0000 C CNN
F 2 "WurthDCJack:Wurth-694106301002-0-0-0" H 4900 7000 50  0001 L CNN
F 3 "http://katalog.we-online.de/em/datasheet/6941xx301002.pdf" H 4900 7100 50  0001 L CNN
F 4 "Conn" H 4900 7200 50  0001 L CNN "category"
F 5 "Gold,Tin" H 4900 7300 50  0001 L CNN "contact material"
F 6 "5A" H 4900 7400 50  0001 L CNN "current rating"
F 7 "Connectors" H 4900 7500 50  0001 L CNN "device class L1"
F 8 "Power Connectors" H 4900 7600 50  0001 L CNN "device class L2"
F 9 "unset" H 4900 7700 50  0001 L CNN "device class L3"
F 10 "CONN PWR JACK 2.1X5.5MM SOLDER" H 4900 7800 50  0001 L CNN "digikey description"
F 11 "732-5930-ND" H 4900 7900 50  0001 L CNN "digikey part number"
F 12 "11mm" H 4900 8000 50  0001 L CNN "height"
F 13 "yes" H 4900 8100 50  0001 L CNN "lead free"
F 14 "ce728101cd49c6a4" H 4900 8200 50  0001 L CNN "library id"
F 15 "Wurth" H 4900 8300 50  0001 L CNN "manufacturer"
F 16 "710-694106301002" H 4900 8400 50  0001 L CNN "mouser part number"
F 17 "3" H 4900 8500 50  0001 L CNN "number of contacts"
F 18 "CONN_JACK_14MM5_9MM0" H 4900 8600 50  0001 L CNN "package"
F 19 "yes" H 4900 8700 50  0001 L CNN "rohs"
F 20 "+85??C" H 4900 8800 50  0001 L CNN "temperature range high"
F 21 "-40??C" H 4900 8900 50  0001 L CNN "temperature range low"
F 22 "24V" H 4900 9000 50  0001 L CNN "voltage rating"
	1    4900 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR014
U 1 1 60B58FD8
P 4900 6800
F 0 "#PWR014" H 4900 6550 50  0001 C CNN
F 1 "GNDREF" H 4905 6627 50  0000 C CNN
F 2 "" H 4900 6800 50  0001 C CNN
F 3 "" H 4900 6800 50  0001 C CNN
	1    4900 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR013
U 1 1 6113F2D6
P 4850 6700
F 0 "#PWR013" H 4850 6450 50  0001 C CNN
F 1 "GNDREF" H 4855 6527 50  0000 C CNN
F 2 "" H 4850 6700 50  0001 C CNN
F 3 "" H 4850 6700 50  0001 C CNN
	1    4850 6700
	0    -1   -1   0   
$EndComp
$Comp
L board_withoutEncoder-rescue:LP324N-eec_LP324N U3
U 2 1 6115504E
P 7900 1100
F 0 "U3" H 8644 1091 50  0000 L CNN
F 1 "LP324N" H 8644 1000 50  0001 L CNN
F 2 "LP324N:Texas_Instruments-LP324N-Manufacturer_Recommended" H 8644 909 50  0001 L CNN
F 3 "" H 7900 1700 50  0001 L CNN
F 4 "Amplifiers" H 7900 2000 50  0001 L CNN "Comp Type"
F 5 "Datasheet URL" H 7900 2100 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=LP324&fileType=pdf" H 7900 2200 50  0001 L CNN "Component Link 1 URL"
F 7 "MDIP, .750 x .250 x.130in, 14 Lead, .100in Pitch" H 7900 2400 50  0001 L CNN "Package Description"
F 8 "N0014A" H 7900 2500 50  0001 L CNN "Package Reference"
F 9 "NSUZXYYTTE#*LP324N" H 7900 2600 50  0001 L CNN "Package Top Marking"
F 10 "14" H 7900 2700 50  0001 L CNN "Pin Count"
F 11 "N" H 7900 2800 50  0001 L CNN "Power Wise"
F 12 "IC" H 7900 2900 50  0001 L CNN "category"
F 13 "19300388" H 7900 3000 50  0001 L CNN "ciiva ids"
F 14 "fb1969704b14c33c" H 7900 3100 50  0001 L CNN "library id"
F 15 "Texas Instruments" H 7900 3200 50  0001 L CNN "manufacturer"
F 16 "MS-001-AA" H 7900 3300 50  0001 L CNN "package"
F 17 "1464069106" H 7900 3400 50  0001 L CNN "release date"
F 18 "No" H 7900 3500 50  0001 L CNN "rohs"
F 19 "9E53945F-DD90-4D7F-8DFD-FAB2FEF4275D" H 7900 3600 50  0001 L CNN "vault revision"
F 20 "yes" H 7900 3700 50  0001 L CNN "imported"
	2    7900 1100
	1    0    0    -1  
$EndComp
$Comp
L board_withoutEncoder-rescue:ADS1115_ADC_Module-Charleslabs_Parts A1
U 1 1 6118C926
P 2600 3200
F 0 "A1" H 3094 3221 50  0000 L CNN
F 1 "ADS1115_ADC_Module" H 3094 3130 50  0000 L CNN
F 2 "ADS1115_footprint:ADC1115_ADC_Module" H 2250 3600 50  0001 C CNN
F 3 "" H 2250 3600 50  0001 C CNN
	1    2600 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 611A9766
P 950 7450
F 0 "J1" H 1058 7631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1058 7540 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 950 7450 50  0001 C CNN
F 3 "~" H 950 7450 50  0001 C CNN
	1    950  7450
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 611AC3C4
P 1350 7500
F 0 "J2" H 1458 7681 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1458 7590 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 1350 7500 50  0001 C CNN
F 3 "~" H 1350 7500 50  0001 C CNN
	1    1350 7500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 611ADB58
P 1850 7450
F 0 "J3" H 1958 7631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1958 7540 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 1850 7450 50  0001 C CNN
F 3 "~" H 1850 7450 50  0001 C CNN
	1    1850 7450
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 611AF441
P 2350 7450
F 0 "J4" H 2458 7631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2458 7540 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 2350 7450 50  0001 C CNN
F 3 "~" H 2350 7450 50  0001 C CNN
	1    2350 7450
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 611B0BDA
P 2800 7450
F 0 "J5" H 2908 7631 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2908 7540 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 2800 7450 50  0001 C CNN
F 3 "~" H 2800 7450 50  0001 C CNN
	1    2800 7450
	0    -1   -1   0   
$EndComp
Text GLabel 3550 7200 1    50   Input ~ 0
24V
$Comp
L Connector:Conn_01x04_Male J6
U 1 1 611011FE
P 3350 7400
F 0 "J6" V 3504 7112 50  0000 R CNN
F 1 "Conn_01x04_Male" V 3413 7112 50  0000 R CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_4-G-3.5_1x04_P3.50mm_Horizontal" H 3350 7400 50  0001 C CNN
F 3 "~" H 3350 7400 50  0001 C CNN
	1    3350 7400
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR010
U 1 1 60F1192C
P 3250 7200
F 0 "#PWR010" H 3250 6950 50  0001 C CNN
F 1 "GNDREF" H 3255 7027 50  0000 C CNN
F 2 "" H 3250 7200 50  0001 C CNN
F 3 "" H 3250 7200 50  0001 C CNN
	1    3250 7200
	1    0    0    1   
$EndComp
Wire Wire Line
	3100 1300 3350 1300
Wire Wire Line
	4550 1200 4150 1200
Text GLabel 3850 1500 2    50   Input ~ 0
3.3V
$Comp
L board_withoutEncoder-rescue:LP324N-eec_LP324N U3
U 1 1 61151DC8
P 3450 1100
F 0 "U3" H 4194 1091 50  0000 L CNN
F 1 "LP324N" H 4194 1000 50  0001 L CNN
F 2 "LP324N:Texas_Instruments-LP324N-Manufacturer_Recommended" H 4194 909 50  0001 L CNN
F 3 "" H 3450 1700 50  0001 L CNN
F 4 "Amplifiers" H 3450 2000 50  0001 L CNN "Comp Type"
F 5 "Datasheet URL" H 3450 2100 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=LP324&fileType=pdf" H 3450 2200 50  0001 L CNN "Component Link 1 URL"
F 7 "MDIP, .750 x .250 x.130in, 14 Lead, .100in Pitch" H 3450 2400 50  0001 L CNN "Package Description"
F 8 "N0014A" H 3450 2500 50  0001 L CNN "Package Reference"
F 9 "NSUZXYYTTE#*LP324N" H 3450 2600 50  0001 L CNN "Package Top Marking"
F 10 "14" H 3450 2700 50  0001 L CNN "Pin Count"
F 11 "N" H 3450 2800 50  0001 L CNN "Power Wise"
F 12 "IC" H 3450 2900 50  0001 L CNN "category"
F 13 "19300388" H 3450 3000 50  0001 L CNN "ciiva ids"
F 14 "fb1969704b14c33c" H 3450 3100 50  0001 L CNN "library id"
F 15 "Texas Instruments" H 3450 3200 50  0001 L CNN "manufacturer"
F 16 "MS-001-AA" H 3450 3300 50  0001 L CNN "package"
F 17 "1464069106" H 3450 3400 50  0001 L CNN "release date"
F 18 "No" H 3450 3500 50  0001 L CNN "rohs"
F 19 "9E53945F-DD90-4D7F-8DFD-FAB2FEF4275D" H 3450 3600 50  0001 L CNN "vault revision"
F 20 "yes" H 3450 3700 50  0001 L CNN "imported"
	1    3450 1100
	1    0    0    -1  
$EndComp
$Comp
L board_withoutEncoder-rescue:LP324N-eec_LP324N U3
U 3 1 61157296
P 7900 2350
F 0 "U3" H 8644 2341 50  0000 L CNN
F 1 "LP324N" H 8644 2250 50  0001 L CNN
F 2 "LP324N:Texas_Instruments-LP324N-Manufacturer_Recommended" H 8644 2159 50  0001 L CNN
F 3 "" H 7900 2950 50  0001 L CNN
F 4 "Amplifiers" H 7900 3250 50  0001 L CNN "Comp Type"
F 5 "Datasheet URL" H 7900 3350 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=LP324&fileType=pdf" H 7900 3450 50  0001 L CNN "Component Link 1 URL"
F 7 "MDIP, .750 x .250 x.130in, 14 Lead, .100in Pitch" H 7900 3650 50  0001 L CNN "Package Description"
F 8 "N0014A" H 7900 3750 50  0001 L CNN "Package Reference"
F 9 "NSUZXYYTTE#*LP324N" H 7900 3850 50  0001 L CNN "Package Top Marking"
F 10 "14" H 7900 3950 50  0001 L CNN "Pin Count"
F 11 "N" H 7900 4050 50  0001 L CNN "Power Wise"
F 12 "IC" H 7900 4150 50  0001 L CNN "category"
F 13 "19300388" H 7900 4250 50  0001 L CNN "ciiva ids"
F 14 "fb1969704b14c33c" H 7900 4350 50  0001 L CNN "library id"
F 15 "Texas Instruments" H 7900 4450 50  0001 L CNN "manufacturer"
F 16 "MS-001-AA" H 7900 4550 50  0001 L CNN "package"
F 17 "1464069106" H 7900 4650 50  0001 L CNN "release date"
F 18 "No" H 7900 4750 50  0001 L CNN "rohs"
F 19 "9E53945F-DD90-4D7F-8DFD-FAB2FEF4275D" H 7900 4850 50  0001 L CNN "vault revision"
F 20 "yes" H 7900 4950 50  0001 L CNN "imported"
	3    7900 2350
	1    0    0    -1  
$EndComp
Connection ~ 8100 4650
Connection ~ 10450 4700
$Comp
L Device:D D5
U 1 1 6139AAE9
P 8450 3400
F 0 "D5" V 8496 3320 50  0000 R CNN
F 1 "D" V 8405 3320 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 8450 3400 50  0001 C CNN
F 3 "~" H 8450 3400 50  0001 C CNN
	1    8450 3400
	0    1    1    0   
$EndComp
$Comp
L Device:D D6
U 1 1 6139C496
P 10900 3450
F 0 "D6" V 10946 3370 50  0000 R CNN
F 1 "D" V 10855 3370 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 10900 3450 50  0001 C CNN
F 3 "~" H 10900 3450 50  0001 C CNN
	1    10900 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 3900 8100 3900
Wire Wire Line
	8450 3250 8100 3250
Wire Wire Line
	10450 3200 10450 3300
Wire Wire Line
	10900 3300 10450 3300
Wire Wire Line
	10900 3950 10450 3950
$Comp
L Relay:G5V-1 #K1
U 1 1 613ABEF3
P 7900 3650
F 0 "#K1" H 8330 3604 50  0000 L CNN
F 1 "G5V-1" H 8330 3695 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_Omron_G5V-1" H 9030 3620 50  0001 C CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_1.pdf" H 7900 3650 50  0001 C CNN
	1    7900 3650
	-1   0    0    1   
$EndComp
$Comp
L Relay:G5V-1 #K2
U 1 1 613AD49B
P 10250 3650
F 0 "#K2" H 10680 3604 50  0000 L CNN
F 1 "G5V-1" H 10680 3695 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_Omron_G5V-1" H 11380 3620 50  0001 C CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_1.pdf" H 10250 3650 50  0001 C CNN
	1    10250 3650
	-1   0    0    1   
$EndComp
Connection ~ 8100 3950
Wire Wire Line
	8100 3950 8100 4050
Connection ~ 10450 3950
Wire Wire Line
	8100 3250 8100 3350
Connection ~ 8100 3250
Wire Wire Line
	8450 3550 8450 3900
Wire Wire Line
	10450 3350 10450 3300
Connection ~ 10450 3300
Wire Wire Line
	10900 3600 10900 3950
Text GLabel 1050 7250 1    50   Input ~ 0
5V
Text GLabel 1450 7300 1    50   Input ~ 0
5V
$Comp
L power:GNDREF #PWR0101
U 1 1 613DFB6B
P 4700 4900
F 0 "#PWR0101" H 4700 4650 50  0001 C CNN
F 1 "GNDREF" H 4705 4727 50  0000 C CNN
F 2 "" H 4700 4900 50  0001 C CNN
F 3 "" H 4700 4900 50  0001 C CNN
	1    4700 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 4900 4800 4900
$Comp
L power:GNDREF #PWR0102
U 1 1 613E202A
P 6500 4200
F 0 "#PWR0102" H 6500 3950 50  0001 C CNN
F 1 "GNDREF" V 6505 4027 50  0000 C CNN
F 2 "" H 6500 4200 50  0001 C CNN
F 3 "" H 6500 4200 50  0001 C CNN
	1    6500 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6500 4200 6400 4200
Wire Wire Line
	6350 4900 6400 4900
$Comp
L power:GNDREF #PWR0103
U 1 1 613EE217
P 2150 3100
F 0 "#PWR0103" H 2150 2850 50  0001 C CNN
F 1 "GNDREF" V 2155 2927 50  0000 C CNN
F 2 "" H 2150 3100 50  0001 C CNN
F 3 "" H 2150 3100 50  0001 C CNN
	1    2150 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 4500 4800 4500
$Comp
L power:GNDREF #PWR015
U 1 1 60AF921C
P 4700 4500
F 0 "#PWR015" H 4700 4250 50  0001 C CNN
F 1 "GNDREF" H 4705 4327 50  0000 C CNN
F 2 "" H 4700 4500 50  0001 C CNN
F 3 "" H 4700 4500 50  0001 C CNN
	1    4700 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 4900 6400 4900
$Comp
L power:GNDREF #PWR0104
U 1 1 613E6A45
P 6500 4900
F 0 "#PWR0104" H 6500 4650 50  0001 C CNN
F 1 "GNDREF" H 6505 4727 50  0000 C CNN
F 2 "" H 6500 4900 50  0001 C CNN
F 3 "" H 6500 4900 50  0001 C CNN
	1    6500 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR07
U 1 1 60B3A991
P 2600 3750
F 0 "#PWR07" H 2600 3500 50  0001 C CNN
F 1 "GNDREF" H 2605 3622 50  0000 R CNN
F 2 "" H 2600 3750 50  0001 C CNN
F 3 "" H 2600 3750 50  0001 C CNN
	1    2600 3750
	1    0    0    -1  
$EndComp
Text GLabel 2150 2900 0    50   Input ~ 0
SCL
Connection ~ 5050 2100
Wire Wire Line
	5000 2100 5050 2100
Text GLabel 5050 2400 3    50   Input ~ 0
3.3V
$Comp
L Device:D D7
U 1 1 61BF002A
P 5050 2250
F 0 "D7" V 5096 2170 50  0000 R CNN
F 1 "D" V 5005 2170 50  0000 R CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5050 2250 50  0001 C CNN
F 3 "~" H 5050 2250 50  0001 C CNN
	1    5050 2250
	0    -1   -1   0   
$EndComp
Text GLabel 5000 2100 0    50   Input ~ 0
Current_Fluke
$Comp
L board_withoutEncoder-rescue:LP324N-eec_LP324N U3
U 4 1 611597F6
P 4950 1900
F 0 "U3" H 5694 1891 50  0000 L CNN
F 1 "LP324N" H 5694 1800 50  0001 L CNN
F 2 "LP324N:Texas_Instruments-LP324N-Manufacturer_Recommended" H 5694 1709 50  0001 L CNN
F 3 "" H 4950 2500 50  0001 L CNN
F 4 "Amplifiers" H 4950 2800 50  0001 L CNN "Comp Type"
F 5 "Datasheet URL" H 4950 2900 50  0001 L CNN "Component Link 1 Description"
F 6 "http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=LP324&fileType=pdf" H 4950 3000 50  0001 L CNN "Component Link 1 URL"
F 7 "MDIP, .750 x .250 x.130in, 14 Lead, .100in Pitch" H 4950 3200 50  0001 L CNN "Package Description"
F 8 "N0014A" H 4950 3300 50  0001 L CNN "Package Reference"
F 9 "NSUZXYYTTE#*LP324N" H 4950 3400 50  0001 L CNN "Package Top Marking"
F 10 "14" H 4950 3500 50  0001 L CNN "Pin Count"
F 11 "N" H 4950 3600 50  0001 L CNN "Power Wise"
F 12 "IC" H 4950 3700 50  0001 L CNN "category"
F 13 "19300388" H 4950 3800 50  0001 L CNN "ciiva ids"
F 14 "fb1969704b14c33c" H 4950 3900 50  0001 L CNN "library id"
F 15 "Texas Instruments" H 4950 4000 50  0001 L CNN "manufacturer"
F 16 "MS-001-AA" H 4950 4100 50  0001 L CNN "package"
F 17 "1464069106" H 4950 4200 50  0001 L CNN "release date"
F 18 "No" H 4950 4300 50  0001 L CNN "rohs"
F 19 "9E53945F-DD90-4D7F-8DFD-FAB2FEF4275D" H 4950 4400 50  0001 L CNN "vault revision"
F 20 "yes" H 4950 4500 50  0001 L CNN "imported"
	4    4950 1900
	1    0    0    -1  
$EndComp
Text GLabel 6050 1850 0    50   Input ~ 0
current
$Comp
L power:GNDREF #PWR012
U 1 1 60B1F5FE
P 5350 1700
F 0 "#PWR012" H 5350 1450 50  0001 C CNN
F 1 "GNDREF" V 5355 1572 50  0000 R CNN
F 2 "" H 5350 1700 50  0001 C CNN
F 3 "" H 5350 1700 50  0001 C CNN
	1    5350 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 2000 5650 2000
Wire Wire Line
	6050 1600 6050 2000
Wire Wire Line
	4850 1600 6050 1600
Wire Wire Line
	4850 1900 4850 1600
Wire Wire Line
	5050 1900 4850 1900
Text GLabel 5350 2300 2    50   Input ~ 0
3.3V
Text Notes 8700 7500 0    50   ~ 10
NodeMCU connections
Text Notes 8700 6900 0    50   ~ 10
Daniel Mart??nez Turmo
$EndSCHEMATC
