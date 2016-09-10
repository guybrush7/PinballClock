EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:jonalib
LIBS:DisplayBoard-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 2
Title "Clock Display Board"
Date "Saturday, March 21, 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 7447A U2
U 1 1 550E39C0
P 2200 3250
F 0 "U2" H 2200 2750 60  0000 C CNN
F 1 "7447A" H 2200 3750 60  0000 C CNN
F 2 "Sockets_DIP:DIP-16__300" H 2050 3400 60  0001 C CNN
F 3 "" H 2050 3400 60  0000 C CNN
	1    2200 3250
	1    0    0    -1  
$EndComp
$Comp
L SA10-21SRWA U1
U 1 1 550E3E7B
P 2150 1550
F 0 "U1" V 2550 1550 60  0000 C CNN
F 1 "SA10-21SRWA" V 1800 1550 60  0000 C CNN
F 2 "DispBoard:SA10-21SRWA" H 2150 1550 60  0001 C CNN
F 3 "" H 2150 1550 60  0000 C CNN
	1    2150 1550
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR01
U 1 1 550E4161
P 1500 2500
F 0 "#PWR01" H 1500 2350 60  0001 C CNN
F 1 "VCC" H 1500 2650 60  0000 C CNN
F 2 "" H 1500 2500 60  0000 C CNN
F 3 "" H 1500 2500 60  0000 C CNN
	1    1500 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 550E4177
P 1650 3650
F 0 "#PWR02" H 1650 3400 60  0001 C CNN
F 1 "GND" H 1650 3500 60  0000 C CNN
F 2 "" H 1650 3650 60  0000 C CNN
F 3 "" H 1650 3650 60  0000 C CNN
	1    1650 3650
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 550E41BC
P 2800 2750
F 0 "R2" V 2880 2750 50  0000 C CNN
F 1 "270" V 2807 2751 50  0000 C CNN
F 2 "Discret:R4" V 2730 2750 30  0001 C CNN
F 3 "" H 2800 2750 30  0000 C CNN
	1    2800 2750
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 550E44D0
P 3000 2750
F 0 "R4" V 3080 2750 50  0000 C CNN
F 1 "270" V 3007 2751 50  0000 C CNN
F 2 "Discret:R4" V 2930 2750 30  0001 C CNN
F 3 "" H 3000 2750 30  0000 C CNN
	1    3000 2750
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 550E4540
P 3200 2750
F 0 "R6" V 3280 2750 50  0000 C CNN
F 1 "270" V 3207 2751 50  0000 C CNN
F 2 "Discret:R4" V 3130 2750 30  0001 C CNN
F 3 "" H 3200 2750 30  0000 C CNN
	1    3200 2750
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 550E4546
P 3400 2750
F 0 "R7" V 3480 2750 50  0000 C CNN
F 1 "270" V 3407 2751 50  0000 C CNN
F 2 "Discret:R4" V 3330 2750 30  0001 C CNN
F 3 "" H 3400 2750 30  0000 C CNN
	1    3400 2750
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 550E470C
P 2700 1650
F 0 "R1" V 2780 1650 50  0000 C CNN
F 1 "270" V 2707 1651 50  0000 C CNN
F 2 "Discret:R4" V 2630 1650 30  0001 C CNN
F 3 "" H 2700 1650 30  0000 C CNN
	1    2700 1650
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 550E4712
P 2900 1650
F 0 "R3" V 2980 1650 50  0000 C CNN
F 1 "270" V 2907 1651 50  0000 C CNN
F 2 "Discret:R4" V 2830 1650 30  0001 C CNN
F 3 "" H 2900 1650 30  0000 C CNN
	1    2900 1650
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 550E4718
P 3100 1650
F 0 "R5" V 3200 1650 50  0000 C CNN
F 1 "270" V 3107 1651 50  0000 C CNN
F 2 "Discret:R4" V 3030 1650 30  0001 C CNN
F 3 "" H 3100 1650 30  0000 C CNN
	1    3100 1650
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR03
U 1 1 550E559C
P 1650 700
F 0 "#PWR03" H 1650 550 60  0001 C CNN
F 1 "+9V" H 1650 840 60  0000 C CNN
F 2 "" H 1650 700 60  0000 C CNN
F 3 "" H 1650 700 60  0000 C CNN
	1    1650 700 
	1    0    0    -1  
$EndComp
Text Label 1250 2900 0    60   ~ 0
A1
Text Label 1250 3000 0    60   ~ 0
A2
Text Label 1250 3400 0    60   ~ 0
A3
Text Label 1250 3500 0    60   ~ 0
A0
Text Label 1250 3200 0    60   ~ 0
BLANK
$Comp
L BARREL_JACK CON1
U 1 1 550E6AE1
P 900 7650
F 0 "CON1" H 900 7900 60  0000 C CNN
F 1 "BARREL_JACK" H 850 7450 60  0000 C CNN
F 2 "DispBoard:Switch_RAPC722X" H 900 7650 60  0001 C CNN
F 3 "" H 900 7650 60  0000 C CNN
	1    900  7650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 550E6D3C
P 1550 7750
F 0 "#PWR04" H 1550 7500 60  0001 C CNN
F 1 "GND" H 1550 7600 60  0000 C CNN
F 2 "" H 1550 7750 60  0000 C CNN
F 3 "" H 1550 7750 60  0000 C CNN
	1    1550 7750
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 550E6D82
P 1550 7550
F 0 "#PWR05" H 1550 7400 60  0001 C CNN
F 1 "VCC" H 1550 7700 60  0000 C CNN
F 2 "" H 1550 7550 60  0000 C CNN
F 3 "" H 1550 7550 60  0000 C CNN
	1    1550 7550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 550E6DA0
P 2800 7750
F 0 "#PWR06" H 2800 7500 60  0001 C CNN
F 1 "GND" H 2800 7600 60  0000 C CNN
F 2 "" H 2800 7750 60  0000 C CNN
F 3 "" H 2800 7750 60  0000 C CNN
	1    2800 7750
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR07
U 1 1 550E6DBE
P 2800 7550
F 0 "#PWR07" H 2800 7400 60  0001 C CNN
F 1 "+9V" H 2800 7690 60  0000 C CNN
F 2 "" H 2800 7550 60  0000 C CNN
F 3 "" H 2800 7550 60  0000 C CNN
	1    2800 7550
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK CON2
U 1 1 550E6FC0
P 2150 7650
F 0 "CON2" H 2150 7900 60  0000 C CNN
F 1 "BARREL_JACK" H 2100 7450 60  0000 C CNN
F 2 "DispBoard:Switch_RAPC722X" H 2150 7650 60  0001 C CNN
F 3 "" H 2150 7650 60  0000 C CNN
	1    2150 7650
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG08
U 1 1 550E953C
P 7150 6300
F 0 "#FLG08" H 7150 6395 30  0001 C CNN
F 1 "PWR_FLAG" H 7150 6480 30  0000 C CNN
F 2 "" H 7150 6300 60  0000 C CNN
F 3 "" H 7150 6300 60  0000 C CNN
	1    7150 6300
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG09
U 1 1 550E9568
P 6900 6300
F 0 "#FLG09" H 6900 6395 30  0001 C CNN
F 1 "PWR_FLAG" H 6900 6480 30  0000 C CNN
F 2 "" H 6900 6300 60  0000 C CNN
F 3 "" H 6900 6300 60  0000 C CNN
	1    6900 6300
	1    0    0    1   
$EndComp
$Comp
L CONN_02X20 P1
U 1 1 55163CF6
P 1850 5850
F 0 "P1" H 1850 6900 50  0000 C CNN
F 1 "CONN_02X20" V 1850 5850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20" H 1850 4900 60  0001 C CNN
F 3 "" H 1850 4900 60  0000 C CNN
	1    1850 5850
	1    0    0    1   
$EndComp
$Comp
L GND #PWR010
U 1 1 5516FEB0
P 1500 6900
F 0 "#PWR010" H 1500 6650 60  0001 C CNN
F 1 "GND" H 1500 6750 60  0000 C CNN
F 2 "" H 1500 6900 60  0000 C CNN
F 3 "" H 1500 6900 60  0000 C CNN
	1    1500 6900
	1    0    0    -1  
$EndComp
Text Label 2250 6800 0    60   ~ 0
VCC
Text Label 2250 6700 0    60   ~ 0
3V3
Text Label 1100 6100 2    60   ~ 0
A1
Text Label 1100 6000 2    60   ~ 0
A2
Text Label 1100 5900 2    60   ~ 0
A3
Text Label 1100 5800 2    60   ~ 0
A0
Text Label 1400 6200 2    60   ~ 0
B0
Text Label 1400 6300 2    60   ~ 0
B3
Text Label 1400 6400 2    60   ~ 0
B2
Text Label 1400 6500 2    60   ~ 0
B1
Text Label 2800 6400 0    60   ~ 0
C0
Text Label 2800 6200 0    60   ~ 0
C2
Text Label 2800 6100 0    60   ~ 0
C1
Text Label 2300 6000 0    60   ~ 0
D0
Text Label 2300 5900 0    60   ~ 0
D3
Text Label 2300 5800 0    60   ~ 0
D2
Text Label 2600 5600 2    60   ~ 0
E0
Text Label 2300 5700 0    60   ~ 0
D1
Text Label 2600 5500 2    60   ~ 0
E3
Text Label 2600 5400 2    60   ~ 0
E2
Text Label 2600 5300 2    60   ~ 0
E1
Text Label 2300 5200 2    60   ~ 0
F0
Text Label 2300 4900 2    60   ~ 0
F1
Text Label 2300 5000 2    60   ~ 0
F2
Text Label 2300 5100 2    60   ~ 0
F3
Text Label 2750 6500 2    60   ~ 0
BLANK
Text Label 850  5500 0    60   ~ 0
SWITCH
Text Label 850  5400 0    60   ~ 0
BUTTON1
Text Label 850  5300 0    60   ~ 0
BUTTON2
Text Label 850  5200 0    60   ~ 0
BUTTON3
$Comp
L CONN_02X07 P2
U 1 1 55172F58
P 5350 7300
F 0 "P2" H 5350 7700 50  0000 C CNN
F 1 "CONN_02X07" V 5350 7300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x07" H 5350 6100 60  0001 C CNN
F 3 "" H 5350 6100 60  0000 C CNN
	1    5350 7300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 55173049
P 5700 7800
F 0 "#PWR011" H 5700 7550 60  0001 C CNN
F 1 "GND" H 5700 7650 60  0000 C CNN
F 2 "" H 5700 7800 60  0000 C CNN
F 3 "" H 5700 7800 60  0000 C CNN
	1    5700 7800
	1    0    0    -1  
$EndComp
Text Label 3250 7000 0    60   ~ 0
SWITCH
Text Label 3250 7100 0    60   ~ 0
BUTTON1
Text Label 3250 7200 0    60   ~ 0
BUTTON2
Text Label 3250 7300 0    60   ~ 0
BUTTON3
Text Label 3250 7400 0    60   ~ 0
INPUT1
Text Label 3250 7500 0    60   ~ 0
INPUT2
Text Label 3250 7600 0    60   ~ 0
INPUT3
$Comp
L R R14
U 1 1 55173C20
P 5000 6650
F 0 "R14" V 5080 6650 50  0000 C CNN
F 1 "10K" V 5007 6651 50  0000 C CNN
F 2 "Discret:R4" V 4930 6650 30  0001 C CNN
F 3 "" H 5000 6650 30  0000 C CNN
	1    5000 6650
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 55173CE3
P 4800 6650
F 0 "R13" V 4880 6650 50  0000 C CNN
F 1 "10K" V 4807 6651 50  0000 C CNN
F 2 "Discret:R4" V 4730 6650 30  0001 C CNN
F 3 "" H 4800 6650 30  0000 C CNN
	1    4800 6650
	1    0    0    -1  
$EndComp
$Comp
L R R12
U 1 1 55173DF3
P 4600 6650
F 0 "R12" V 4680 6650 50  0000 C CNN
F 1 "10K" V 4607 6651 50  0000 C CNN
F 2 "Discret:R4" V 4530 6650 30  0001 C CNN
F 3 "" H 4600 6650 30  0000 C CNN
	1    4600 6650
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 55173E1B
P 4400 6650
F 0 "R11" V 4480 6650 50  0000 C CNN
F 1 "10K" V 4407 6651 50  0000 C CNN
F 2 "Discret:R4" V 4330 6650 30  0001 C CNN
F 3 "" H 4400 6650 30  0000 C CNN
	1    4400 6650
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 55173E44
P 4200 6650
F 0 "R10" V 4280 6650 50  0000 C CNN
F 1 "10K" V 4207 6651 50  0000 C CNN
F 2 "Discret:R4" V 4130 6650 30  0001 C CNN
F 3 "" H 4200 6650 30  0000 C CNN
	1    4200 6650
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 55173E72
P 4000 6650
F 0 "R9" V 4080 6650 50  0000 C CNN
F 1 "10K" V 4007 6651 50  0000 C CNN
F 2 "Discret:R4" V 3930 6650 30  0001 C CNN
F 3 "" H 4000 6650 30  0000 C CNN
	1    4000 6650
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 55173F4A
P 3800 6650
F 0 "R8" V 3880 6650 50  0000 C CNN
F 1 "10K" V 3807 6651 50  0000 C CNN
F 2 "Discret:R4" V 3730 6650 30  0001 C CNN
F 3 "" H 3800 6650 30  0000 C CNN
	1    3800 6650
	1    0    0    -1  
$EndComp
Text Label 3500 6300 0    60   ~ 0
3V3
Text Label 850  5100 0    60   ~ 0
INPUT1
Text Label 850  5000 0    60   ~ 0
INPUT2
Text Label 850  4900 0    60   ~ 0
INPUT3
$Comp
L CONN_01X07 P4
U 1 1 55175959
P 9400 6100
F 0 "P4" H 9400 6500 50  0000 C CNN
F 1 "CONN_01X07" V 9500 6100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07" H 9400 6100 60  0001 C CNN
F 3 "" H 9400 6100 60  0000 C CNN
	1    9400 6100
	1    0    0    -1  
$EndComp
Text Label 8500 6400 0    60   ~ 0
SPI_SS
Text Label 8500 6300 0    60   ~ 0
SPI_MOSI
Text Label 8500 6200 0    60   ~ 0
SPI_MISO
Text Label 8500 6100 0    60   ~ 0
SPI_CLK
Text Label 8500 5900 0    60   ~ 0
3V3
Text Label 8500 5800 0    60   ~ 0
GND
$Comp
L CONN_01X01 P3
U 1 1 5517643E
P 8300 6000
F 0 "P3" H 8300 6100 50  0000 C CNN
F 1 "CONN_01X01" V 8400 6000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01" H 8300 6000 60  0001 C CNN
F 3 "" H 8300 6000 60  0000 C CNN
	1    8300 6000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1650 3650 1650 3600
Wire Wire Line
	1650 3600 1750 3600
Wire Wire Line
	2650 3000 2800 3000
Wire Wire Line
	2650 3100 3000 3100
Wire Wire Line
	3000 3100 3000 3000
Wire Wire Line
	2650 3200 3200 3200
Wire Wire Line
	3200 3200 3200 3000
Wire Wire Line
	2650 3300 3400 3300
Wire Wire Line
	3400 3300 3400 3000
Wire Wire Line
	2650 3400 3550 3400
Wire Wire Line
	3650 3500 2650 3500
Wire Wire Line
	3650 2200 3650 3500
Wire Wire Line
	3800 3600 2650 3600
Wire Wire Line
	3800 2150 3800 3600
Wire Wire Line
	2800 2500 2250 2500
Wire Wire Line
	2250 2500 2250 2250
Wire Wire Line
	3000 2500 3000 2450
Wire Wire Line
	3000 2450 2350 2450
Wire Wire Line
	2350 2450 2350 2250
Wire Wire Line
	3200 2500 3200 2400
Wire Wire Line
	3200 2400 2050 2400
Wire Wire Line
	2050 2400 2050 2250
Wire Wire Line
	3400 2500 3400 2350
Wire Wire Line
	3400 2350 1950 2350
Wire Wire Line
	1950 2350 1950 2250
Wire Wire Line
	3550 3400 3550 2250
Wire Wire Line
	3550 2250 2700 2250
Wire Wire Line
	2700 2250 2700 1900
Wire Wire Line
	3650 2200 2900 2200
Wire Wire Line
	2900 2200 2900 1900
Wire Wire Line
	3800 2150 3100 2150
Wire Wire Line
	3100 2150 3100 1900
Wire Wire Line
	2700 1400 2700 800 
Wire Wire Line
	2700 800  2050 800 
Wire Wire Line
	2050 800  2050 850 
Wire Wire Line
	2900 1400 2900 750 
Wire Wire Line
	2900 750  2250 750 
Wire Wire Line
	2250 750  2250 850 
Wire Wire Line
	3100 1400 3100 700 
Wire Wire Line
	3100 700  2350 700 
Wire Wire Line
	2350 700  2350 850 
Wire Wire Line
	1650 700  1650 2500
Wire Wire Line
	1650 2500 2150 2500
Wire Wire Line
	2150 2500 2150 2250
Wire Wire Line
	1650 700  2150 700 
Wire Wire Line
	2150 700  2150 850 
Wire Wire Line
	1750 2900 1250 2900
Wire Wire Line
	1750 3000 1250 3000
Wire Wire Line
	1750 3400 1250 3400
Wire Wire Line
	1750 3500 1250 3500
Wire Wire Line
	2650 2650 2650 2900
Wire Wire Line
	1500 2650 2650 2650
Wire Wire Line
	1500 2650 1500 2500
Wire Wire Line
	1600 2650 1600 3300
Wire Wire Line
	1600 3100 1750 3100
Connection ~ 1600 2650
Wire Wire Line
	1600 3300 1750 3300
Connection ~ 1600 3100
Wire Wire Line
	1750 3200 1250 3200
Wire Wire Line
	1200 7750 1550 7750
Wire Wire Line
	1200 7550 1550 7550
Wire Wire Line
	2450 7550 2800 7550
Wire Wire Line
	2450 7750 2800 7750
Wire Wire Line
	2450 7650 2450 7750
Wire Wire Line
	1200 7650 1200 7750
Wire Wire Line
	1500 6700 1500 6900
Wire Wire Line
	1500 6800 1600 6800
Wire Wire Line
	1600 6700 1500 6700
Connection ~ 1500 6800
Wire Wire Line
	2100 6800 2250 6800
Wire Wire Line
	2100 6700 2250 6700
Wire Wire Line
	1600 6100 1100 6100
Wire Wire Line
	1600 6000 1100 6000
Wire Wire Line
	1600 5900 1100 5900
Wire Wire Line
	1600 5800 1100 5800
Wire Wire Line
	1600 6200 1400 6200
Wire Wire Line
	1600 6300 1400 6300
Wire Wire Line
	1600 6400 1400 6400
Wire Wire Line
	1600 6500 1400 6500
Wire Wire Line
	2100 6400 2800 6400
Wire Wire Line
	2100 6300 2800 6300
Wire Wire Line
	2100 6200 2800 6200
Wire Wire Line
	2100 6100 2800 6100
Wire Wire Line
	2100 6000 2500 6000
Wire Wire Line
	2100 5900 2500 5900
Wire Wire Line
	2100 5800 2500 5800
Wire Wire Line
	2100 5700 2500 5700
Wire Wire Line
	2700 5300 2100 5300
Wire Wire Line
	2700 5400 2100 5400
Wire Wire Line
	2700 5500 2100 5500
Wire Wire Line
	2700 5600 2100 5600
Wire Wire Line
	2100 5200 2300 5200
Wire Wire Line
	2100 4900 2300 4900
Wire Wire Line
	2100 5000 2300 5000
Wire Wire Line
	2100 5100 2300 5100
Wire Wire Line
	2850 6500 2100 6500
Wire Wire Line
	1600 5500 850  5500
Wire Wire Line
	1600 5400 850  5400
Wire Wire Line
	1600 5300 850  5300
Wire Wire Line
	1600 5200 850  5200
Wire Wire Line
	1600 5100 850  5100
Wire Wire Line
	1600 5000 850  5000
Wire Wire Line
	5600 7000 5700 7000
Wire Wire Line
	5700 7000 5700 7800
Wire Wire Line
	5600 7100 5700 7100
Connection ~ 5700 7100
Wire Wire Line
	5600 7200 5700 7200
Connection ~ 5700 7200
Wire Wire Line
	5600 7300 5700 7300
Connection ~ 5700 7300
Wire Wire Line
	5600 7400 5700 7400
Connection ~ 5700 7400
Wire Wire Line
	5600 7500 5700 7500
Connection ~ 5700 7500
Wire Wire Line
	5600 7600 5700 7600
Connection ~ 5700 7600
Wire Wire Line
	3250 7000 5100 7000
Wire Wire Line
	3250 7100 5100 7100
Wire Wire Line
	3250 7200 5100 7200
Wire Wire Line
	3250 7300 5100 7300
Wire Wire Line
	3250 7400 5100 7400
Wire Wire Line
	3250 7500 5100 7500
Wire Wire Line
	3250 7600 5100 7600
Wire Wire Line
	5000 7000 5000 6900
Connection ~ 5000 7000
Wire Wire Line
	4800 6900 4800 7100
Connection ~ 4800 7100
Wire Wire Line
	4600 6900 4600 7200
Connection ~ 4600 7200
Wire Wire Line
	4400 6900 4400 7300
Connection ~ 4400 7300
Wire Wire Line
	4200 6900 4200 7400
Connection ~ 4200 7400
Wire Wire Line
	4000 6900 4000 7500
Connection ~ 4000 7500
Wire Wire Line
	3800 6900 3800 7600
Connection ~ 3800 7600
Wire Wire Line
	5000 6300 5000 6400
Wire Wire Line
	3500 6300 5000 6300
Wire Wire Line
	3800 6300 3800 6400
Wire Wire Line
	4000 6400 4000 6300
Connection ~ 4000 6300
Wire Wire Line
	4200 6400 4200 6300
Connection ~ 4200 6300
Wire Wire Line
	4400 6400 4400 6300
Connection ~ 4400 6300
Wire Wire Line
	4600 6400 4600 6300
Connection ~ 4600 6300
Wire Wire Line
	4800 6400 4800 6300
Connection ~ 4800 6300
Connection ~ 3800 6300
Wire Wire Line
	1600 4900 850  4900
Wire Wire Line
	9200 6400 8500 6400
Wire Wire Line
	9200 6300 8500 6300
Wire Wire Line
	9200 6200 8500 6200
Wire Wire Line
	9200 6100 8500 6100
Wire Wire Line
	9200 5900 8500 5900
Wire Wire Line
	9200 5800 8500 5800
Wire Wire Line
	9200 6000 8500 6000
Wire Wire Line
	1600 5600 1100 5600
Wire Wire Line
	2100 6600 2600 6600
Wire Wire Line
	1600 6600 1100 6600
Wire Wire Line
	1600 5700 1100 5700
Text Label 1100 6600 0    60   ~ 0
SPI_MOSI
Text Label 1100 5700 0    60   ~ 0
SPI_MISO
Text Label 2600 6600 2    60   ~ 0
SPI_SS
Text Label 1100 5600 0    60   ~ 0
SPI_CLK
$Comp
L PWR_FLAG #FLG012
U 1 1 550E9589
P 6650 6300
F 0 "#FLG012" H 6650 6395 30  0001 C CNN
F 1 "PWR_FLAG" H 6650 6480 30  0000 C CNN
F 2 "" H 6650 6300 60  0000 C CNN
F 3 "" H 6650 6300 60  0000 C CNN
	1    6650 6300
	1    0    0    1   
$EndComp
$Comp
L 7447A U4
U 1 1 5517B87E
P 5300 3250
F 0 "U4" H 5300 2750 60  0000 C CNN
F 1 "7447A" H 5300 3750 60  0000 C CNN
F 2 "Sockets_DIP:DIP-16__300" H 5150 3400 60  0001 C CNN
F 3 "" H 5150 3400 60  0000 C CNN
	1    5300 3250
	1    0    0    -1  
$EndComp
$Comp
L SA10-21SRWA U3
U 1 1 5517B884
P 5250 1550
F 0 "U3" V 5650 1550 60  0000 C CNN
F 1 "SA10-21SRWA" V 4900 1550 60  0000 C CNN
F 2 "DispBoard:SA10-21SRWA" H 5250 1550 60  0001 C CNN
F 3 "" H 5250 1550 60  0000 C CNN
	1    5250 1550
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR013
U 1 1 5517B88A
P 4600 2500
F 0 "#PWR013" H 4600 2350 60  0001 C CNN
F 1 "VCC" H 4600 2650 60  0000 C CNN
F 2 "" H 4600 2500 60  0000 C CNN
F 3 "" H 4600 2500 60  0000 C CNN
	1    4600 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5517B890
P 4750 3650
F 0 "#PWR014" H 4750 3400 60  0001 C CNN
F 1 "GND" H 4750 3500 60  0000 C CNN
F 2 "" H 4750 3650 60  0000 C CNN
F 3 "" H 4750 3650 60  0000 C CNN
	1    4750 3650
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 5517B896
P 5900 2750
F 0 "R16" V 5980 2750 50  0000 C CNN
F 1 "270" V 5907 2751 50  0000 C CNN
F 2 "Discret:R4" V 5830 2750 30  0001 C CNN
F 3 "" H 5900 2750 30  0000 C CNN
	1    5900 2750
	1    0    0    -1  
$EndComp
$Comp
L R R18
U 1 1 5517B89C
P 6100 2750
F 0 "R18" V 6180 2750 50  0000 C CNN
F 1 "270" V 6107 2751 50  0000 C CNN
F 2 "Discret:R4" V 6030 2750 30  0001 C CNN
F 3 "" H 6100 2750 30  0000 C CNN
	1    6100 2750
	1    0    0    -1  
$EndComp
$Comp
L R R20
U 1 1 5517B8A2
P 6300 2750
F 0 "R20" V 6380 2750 50  0000 C CNN
F 1 "270" V 6307 2751 50  0000 C CNN
F 2 "Discret:R4" V 6230 2750 30  0001 C CNN
F 3 "" H 6300 2750 30  0000 C CNN
	1    6300 2750
	1    0    0    -1  
$EndComp
$Comp
L R R21
U 1 1 5517B8A8
P 6500 2750
F 0 "R21" V 6580 2750 50  0000 C CNN
F 1 "270" V 6507 2751 50  0000 C CNN
F 2 "Discret:R4" V 6430 2750 30  0001 C CNN
F 3 "" H 6500 2750 30  0000 C CNN
	1    6500 2750
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 5517B8AE
P 5800 1650
F 0 "R15" V 5880 1650 50  0000 C CNN
F 1 "270" V 5807 1651 50  0000 C CNN
F 2 "Discret:R4" V 5730 1650 30  0001 C CNN
F 3 "" H 5800 1650 30  0000 C CNN
	1    5800 1650
	1    0    0    -1  
$EndComp
$Comp
L R R17
U 1 1 5517B8B4
P 6000 1650
F 0 "R17" V 6080 1650 50  0000 C CNN
F 1 "270" V 6007 1651 50  0000 C CNN
F 2 "Discret:R4" V 5930 1650 30  0001 C CNN
F 3 "" H 6000 1650 30  0000 C CNN
	1    6000 1650
	1    0    0    -1  
$EndComp
$Comp
L R R19
U 1 1 5517B8BA
P 6200 1650
F 0 "R19" V 6300 1650 50  0000 C CNN
F 1 "270" V 6207 1651 50  0000 C CNN
F 2 "Discret:R4" V 6130 1650 30  0001 C CNN
F 3 "" H 6200 1650 30  0000 C CNN
	1    6200 1650
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR015
U 1 1 5517B8C0
P 4750 700
F 0 "#PWR015" H 4750 550 60  0001 C CNN
F 1 "+9V" H 4750 840 60  0000 C CNN
F 2 "" H 4750 700 60  0000 C CNN
F 3 "" H 4750 700 60  0000 C CNN
	1    4750 700 
	1    0    0    -1  
$EndComp
Text Label 4350 2900 0    60   ~ 0
B1
Text Label 4350 3000 0    60   ~ 0
B2
Text Label 4350 3400 0    60   ~ 0
B3
Text Label 4350 3500 0    60   ~ 0
B0
Text Label 4350 3200 0    60   ~ 0
BLANK
Wire Wire Line
	4750 3650 4750 3600
Wire Wire Line
	4750 3600 4850 3600
Wire Wire Line
	5750 3000 5900 3000
Wire Wire Line
	5750 3100 6100 3100
Wire Wire Line
	6100 3100 6100 3000
Wire Wire Line
	5750 3200 6300 3200
Wire Wire Line
	6300 3200 6300 3000
Wire Wire Line
	5750 3300 6500 3300
Wire Wire Line
	6500 3300 6500 3000
Wire Wire Line
	5750 3400 6650 3400
Wire Wire Line
	6750 3500 5750 3500
Wire Wire Line
	6750 2200 6750 3500
Wire Wire Line
	6900 3600 5750 3600
Wire Wire Line
	6900 2150 6900 3600
Wire Wire Line
	5900 2500 5350 2500
Wire Wire Line
	5350 2500 5350 2250
Wire Wire Line
	6100 2500 6100 2450
Wire Wire Line
	6100 2450 5450 2450
Wire Wire Line
	5450 2450 5450 2250
Wire Wire Line
	6300 2500 6300 2400
Wire Wire Line
	6300 2400 5150 2400
Wire Wire Line
	5150 2400 5150 2250
Wire Wire Line
	6500 2500 6500 2350
Wire Wire Line
	6500 2350 5050 2350
Wire Wire Line
	5050 2350 5050 2250
Wire Wire Line
	6650 3400 6650 2250
Wire Wire Line
	6650 2250 5800 2250
Wire Wire Line
	5800 2250 5800 1900
Wire Wire Line
	6750 2200 6000 2200
Wire Wire Line
	6000 2200 6000 1900
Wire Wire Line
	6900 2150 6200 2150
Wire Wire Line
	6200 2150 6200 1900
Wire Wire Line
	5800 1400 5800 800 
Wire Wire Line
	5800 800  5150 800 
Wire Wire Line
	5150 800  5150 850 
Wire Wire Line
	6000 1400 6000 750 
Wire Wire Line
	6000 750  5350 750 
Wire Wire Line
	5350 750  5350 850 
Wire Wire Line
	6200 1400 6200 700 
Wire Wire Line
	6200 700  5450 700 
Wire Wire Line
	5450 700  5450 850 
Wire Wire Line
	4750 700  4750 2500
Wire Wire Line
	4750 2500 5250 2500
Wire Wire Line
	5250 2500 5250 2250
Wire Wire Line
	4750 700  5250 700 
Wire Wire Line
	5250 700  5250 850 
Wire Wire Line
	4850 2900 4350 2900
Wire Wire Line
	4850 3000 4350 3000
Wire Wire Line
	4850 3400 4350 3400
Wire Wire Line
	4850 3500 4350 3500
Wire Wire Line
	5750 2650 5750 2900
Wire Wire Line
	4600 2650 5750 2650
Wire Wire Line
	4600 2650 4600 2500
Wire Wire Line
	4700 2650 4700 3300
Wire Wire Line
	4700 3100 4850 3100
Connection ~ 4700 2650
Wire Wire Line
	4700 3300 4850 3300
Connection ~ 4700 3100
Wire Wire Line
	4850 3200 4350 3200
$Comp
L 7447A U6
U 1 1 5517BD4F
P 8300 3250
F 0 "U6" H 8300 2750 60  0000 C CNN
F 1 "7447A" H 8300 3750 60  0000 C CNN
F 2 "Sockets_DIP:DIP-16__300" H 8150 3400 60  0001 C CNN
F 3 "" H 8150 3400 60  0000 C CNN
	1    8300 3250
	1    0    0    -1  
$EndComp
$Comp
L SA10-21SRWA U5
U 1 1 5517BD55
P 8250 1550
F 0 "U5" V 8650 1550 60  0000 C CNN
F 1 "SA10-21SRWA" V 7900 1550 60  0000 C CNN
F 2 "DispBoard:SA10-21SRWA" H 8250 1550 60  0001 C CNN
F 3 "" H 8250 1550 60  0000 C CNN
	1    8250 1550
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR016
U 1 1 5517BD5B
P 7600 2500
F 0 "#PWR016" H 7600 2350 60  0001 C CNN
F 1 "VCC" H 7600 2650 60  0000 C CNN
F 2 "" H 7600 2500 60  0000 C CNN
F 3 "" H 7600 2500 60  0000 C CNN
	1    7600 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5517BD61
P 7750 3650
F 0 "#PWR017" H 7750 3400 60  0001 C CNN
F 1 "GND" H 7750 3500 60  0000 C CNN
F 2 "" H 7750 3650 60  0000 C CNN
F 3 "" H 7750 3650 60  0000 C CNN
	1    7750 3650
	1    0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 5517BD67
P 8900 2750
F 0 "R23" V 8980 2750 50  0000 C CNN
F 1 "270" V 8907 2751 50  0000 C CNN
F 2 "Discret:R4" V 8830 2750 30  0001 C CNN
F 3 "" H 8900 2750 30  0000 C CNN
	1    8900 2750
	1    0    0    -1  
$EndComp
$Comp
L R R25
U 1 1 5517BD6D
P 9100 2750
F 0 "R25" V 9180 2750 50  0000 C CNN
F 1 "270" V 9107 2751 50  0000 C CNN
F 2 "Discret:R4" V 9030 2750 30  0001 C CNN
F 3 "" H 9100 2750 30  0000 C CNN
	1    9100 2750
	1    0    0    -1  
$EndComp
$Comp
L R R27
U 1 1 5517BD73
P 9300 2750
F 0 "R27" V 9380 2750 50  0000 C CNN
F 1 "270" V 9307 2751 50  0000 C CNN
F 2 "Discret:R4" V 9230 2750 30  0001 C CNN
F 3 "" H 9300 2750 30  0000 C CNN
	1    9300 2750
	1    0    0    -1  
$EndComp
$Comp
L R R28
U 1 1 5517BD79
P 9500 2750
F 0 "R28" V 9580 2750 50  0000 C CNN
F 1 "270" V 9507 2751 50  0000 C CNN
F 2 "Discret:R4" V 9430 2750 30  0001 C CNN
F 3 "" H 9500 2750 30  0000 C CNN
	1    9500 2750
	1    0    0    -1  
$EndComp
$Comp
L R R22
U 1 1 5517BD7F
P 8800 1650
F 0 "R22" V 8880 1650 50  0000 C CNN
F 1 "270" V 8807 1651 50  0000 C CNN
F 2 "Discret:R4" V 8730 1650 30  0001 C CNN
F 3 "" H 8800 1650 30  0000 C CNN
	1    8800 1650
	1    0    0    -1  
$EndComp
$Comp
L R R24
U 1 1 5517BD85
P 9000 1650
F 0 "R24" V 9080 1650 50  0000 C CNN
F 1 "270" V 9007 1651 50  0000 C CNN
F 2 "Discret:R4" V 8930 1650 30  0001 C CNN
F 3 "" H 9000 1650 30  0000 C CNN
	1    9000 1650
	1    0    0    -1  
$EndComp
$Comp
L R R26
U 1 1 5517BD8B
P 9200 1650
F 0 "R26" V 9300 1650 50  0000 C CNN
F 1 "270" V 9207 1651 50  0000 C CNN
F 2 "Discret:R4" V 9130 1650 30  0001 C CNN
F 3 "" H 9200 1650 30  0000 C CNN
	1    9200 1650
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR018
U 1 1 5517BD91
P 7750 700
F 0 "#PWR018" H 7750 550 60  0001 C CNN
F 1 "+9V" H 7750 840 60  0000 C CNN
F 2 "" H 7750 700 60  0000 C CNN
F 3 "" H 7750 700 60  0000 C CNN
	1    7750 700 
	1    0    0    -1  
$EndComp
Text Label 7350 2900 0    60   ~ 0
C1
Text Label 7350 3000 0    60   ~ 0
C2
Text Label 7350 3400 0    60   ~ 0
C3
Text Label 7350 3500 0    60   ~ 0
C0
Text Label 7350 3200 0    60   ~ 0
BLANK
Wire Wire Line
	7750 3650 7750 3600
Wire Wire Line
	7750 3600 7850 3600
Wire Wire Line
	8750 3000 8900 3000
Wire Wire Line
	8750 3100 9100 3100
Wire Wire Line
	9100 3100 9100 3000
Wire Wire Line
	8750 3200 9300 3200
Wire Wire Line
	9300 3200 9300 3000
Wire Wire Line
	8750 3300 9500 3300
Wire Wire Line
	9500 3300 9500 3000
Wire Wire Line
	8750 3400 9650 3400
Wire Wire Line
	9750 3500 8750 3500
Wire Wire Line
	9750 2200 9750 3500
Wire Wire Line
	9900 3600 8750 3600
Wire Wire Line
	9900 2150 9900 3600
Wire Wire Line
	8900 2500 8350 2500
Wire Wire Line
	8350 2500 8350 2250
Wire Wire Line
	9100 2500 9100 2450
Wire Wire Line
	9100 2450 8450 2450
Wire Wire Line
	8450 2450 8450 2250
Wire Wire Line
	9300 2500 9300 2400
Wire Wire Line
	9300 2400 8150 2400
Wire Wire Line
	8150 2400 8150 2250
Wire Wire Line
	9500 2500 9500 2350
Wire Wire Line
	9500 2350 8050 2350
Wire Wire Line
	8050 2350 8050 2250
Wire Wire Line
	9650 3400 9650 2250
Wire Wire Line
	9650 2250 8800 2250
Wire Wire Line
	8800 2250 8800 1900
Wire Wire Line
	9750 2200 9000 2200
Wire Wire Line
	9000 2200 9000 1900
Wire Wire Line
	9900 2150 9200 2150
Wire Wire Line
	9200 2150 9200 1900
Wire Wire Line
	8800 1400 8800 800 
Wire Wire Line
	8800 800  8150 800 
Wire Wire Line
	8150 800  8150 850 
Wire Wire Line
	9000 1400 9000 750 
Wire Wire Line
	9000 750  8350 750 
Wire Wire Line
	8350 750  8350 850 
Wire Wire Line
	9200 1400 9200 700 
Wire Wire Line
	9200 700  8450 700 
Wire Wire Line
	8450 700  8450 850 
Wire Wire Line
	7750 700  7750 2500
Wire Wire Line
	7750 2500 8250 2500
Wire Wire Line
	8250 2500 8250 2250
Wire Wire Line
	7750 700  8250 700 
Wire Wire Line
	8250 700  8250 850 
Wire Wire Line
	7850 2900 7350 2900
Wire Wire Line
	7850 3000 7350 3000
Wire Wire Line
	7850 3400 7350 3400
Wire Wire Line
	7850 3500 7350 3500
Wire Wire Line
	8750 2650 8750 2900
Wire Wire Line
	7600 2650 8750 2650
Wire Wire Line
	7600 2650 7600 2500
Wire Wire Line
	7700 2650 7700 3300
Wire Wire Line
	7700 3100 7850 3100
Connection ~ 7700 2650
Wire Wire Line
	7700 3300 7850 3300
Connection ~ 7700 3100
Wire Wire Line
	7850 3200 7350 3200
NoConn ~ 8050 850 
NoConn ~ 5050 850 
NoConn ~ 1950 850 
$Sheet
S 4900 4450 1200 550 
U 5517EA1A
F0 "Display Board Sheet 2" 60
F1 "DispBrd_Sheet2.sch" 60
$EndSheet
Text GLabel 2500 5700 2    60   Input ~ 0
D1
Text GLabel 2500 5800 2    60   Input ~ 0
D2
Text GLabel 2500 5900 2    60   Input ~ 0
D3
Text GLabel 2500 6000 2    60   Input ~ 0
D0
Text GLabel 2300 5100 2    60   Input ~ 0
F3
Text GLabel 2300 5000 2    60   Input ~ 0
F2
Text GLabel 2300 4900 2    60   Input ~ 0
F1
Text GLabel 2300 5200 2    60   Input ~ 0
F0
Text GLabel 2700 5300 2    60   Input ~ 0
E1
Text GLabel 2700 5400 2    60   Input ~ 0
E2
Text GLabel 2700 5500 2    60   Input ~ 0
E3
Text GLabel 2700 5600 2    60   Input ~ 0
E0
Text GLabel 2850 6500 2    60   Input ~ 0
BLANK
$Comp
L VCC #PWR019
U 1 1 5518D5E7
P 6650 6300
F 0 "#PWR019" H 6650 6150 60  0001 C CNN
F 1 "VCC" H 6650 6450 60  0000 C CNN
F 2 "" H 6650 6300 60  0000 C CNN
F 3 "" H 6650 6300 60  0000 C CNN
	1    6650 6300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 5518D61A
P 7150 6300
F 0 "#PWR020" H 7150 6050 60  0001 C CNN
F 1 "GND" H 7150 6150 60  0000 C CNN
F 2 "" H 7150 6300 60  0000 C CNN
F 3 "" H 7150 6300 60  0000 C CNN
	1    7150 6300
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR021
U 1 1 5518E959
P 6900 6300
F 0 "#PWR021" H 6900 6150 60  0001 C CNN
F 1 "+9V" H 6900 6440 60  0000 C CNN
F 2 "" H 6900 6300 60  0000 C CNN
F 3 "" H 6900 6300 60  0000 C CNN
	1    6900 6300
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P5
U 1 1 5539A6A1
P 9450 4450
F 0 "P5" H 9450 4550 50  0000 C CNN
F 1 "CONN_01X01" V 9550 4450 50  0000 C CNN
F 2 "DispBoard:Mounting_hole_1-8" H 9450 4450 60  0001 C CNN
F 3 "" H 9450 4450 60  0000 C CNN
	1    9450 4450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P7
U 1 1 553A477A
P 9900 4450
F 0 "P7" H 9900 4550 50  0000 C CNN
F 1 "CONN_01X01" V 10000 4450 50  0000 C CNN
F 2 "DispBoard:Mounting_hole_1-8" H 9900 4450 60  0001 C CNN
F 3 "" H 9900 4450 60  0000 C CNN
	1    9900 4450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P8
U 1 1 553A4874
P 9900 5000
F 0 "P8" H 9900 5100 50  0000 C CNN
F 1 "CONN_01X01" V 10000 5000 50  0000 C CNN
F 2 "DispBoard:Mounting_hole_1-8" H 9900 5000 60  0001 C CNN
F 3 "" H 9900 5000 60  0000 C CNN
	1    9900 5000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P6
U 1 1 553A48D9
P 9450 5000
F 0 "P6" H 9450 5100 50  0000 C CNN
F 1 "CONN_01X01" V 9550 5000 50  0000 C CNN
F 2 "DispBoard:Mounting_hole_1-8" H 9450 5000 60  0001 C CNN
F 3 "" H 9450 5000 60  0000 C CNN
	1    9450 5000
	1    0    0    -1  
$EndComp
Text Label 2800 6300 0    60   ~ 0
C3
$EndSCHEMATC