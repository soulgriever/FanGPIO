#!/bin/bash
echo Installing FanGPIO - by soulgriever - https://github.com/soulgriever
mkdir /home/pi/.FanGPIO
cp FanGPIO.c /home/pi/.FanGPIO/
cd /home/pi/.FanGPIO
echo Installing wiringPi dependency - http://wiringpi.com/
git clone "git://git.drogon.net/wiringPi"
cd wiringPi
sh build
cd ..
echo Compiling FanGPIO
gcc -Wall -o FanGPIO FanGPIO.c -lwiringPi
echo FanGPIO Compiled
echo adding FanGPIO to startup
sudo chmod u+x /home/pi/.FanGPIO/FanGPIO
echo "/home/pi/.FanGPIO/FanGPIO" >> /etc/rc.local
rm /home/pi/.FanGPIO/FanGPIO.c
echo "FINISHED reboot for changes to take effect"
