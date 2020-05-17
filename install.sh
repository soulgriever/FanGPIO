#!/bin/bash
echo Installing FanGPIO - by soulgriever - https://github.com/soulgriever
mkdir /home/pi/.FanGPIO
cp FanGPIO.c /home/pi/.FanGPIO/
cd /home/pi/.FanGPIO
echo Installing wiringPi dependency - http://wiringpi.com/
git clone "https://github.com/WiringPi/WiringPi"
cd wiringPi
sh build
cd ..
echo Compiling FanGPIO
gcc -Wall -o FanGPIO FanGPIO.c -lwiringPi
echo FanGPIO Compiled
echo adding FanGPIO to systemd service
cp /home/pi/FanGPIO/FanGPIO.service /etc/systemd/system/FanGPIO.service
echo starting FanGPIO service
systemctl enable FanGPIO.service
rm /home/pi/.FanGPIO/FanGPIO.c
echo "FINISHED reboot for changes to take effect"
