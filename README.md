# FanGPIO
A small script to turn your fan on and off via GPIO and PWM

## How does it work?
FanGPIO starts when your pi boots up and runs in the background to adjust the pi's fan speed to your needs

 - At 40°C the Fan turns on spinning at 25%RPM
 - At 50°C the Fan goes up to 50%RPM
 - At 60°C the Fan goes up to 75%RPM
 - At 70°C the Fan fan is set to full 100%RPM
 - The Fan wont turn back off until it cools down to 38°C (this keeps it from turning on and off if your at that 40°C threshold)

## Will this hurt my RetroPie performance?
FanGPIO is a super small script written in C to avoid any additional stress on your pi. I have not completed thorough tests yet however so far the max CPU usage I have noticed is 0.9% across one of the 4 CPU threads.
## Instructions:
**Do not** use this directly connected to a fan, you will likely **blow** your gpio pin! (read below)

### How to install the script:
To install this simple script on your raspberry pi copy and paste the following

```
git clone https://github.com/soulgriever/FanGPIO
cd FanGPIO
sudo sh install.sh
```

Reboot your pi and the script is installed, yup its that simple!

### How to wire up the Pi:
I recommend using either a Logic Level Power Mosfet such as the one [Here](https://www.adafruit.com/product/355),
or using a transistor such as a TIP31C.

- Identify the base, collector, and emitter pins of your transistor/power mosfet.
- Attach the **Base** Pin on the transistor to Pin 12 or GPIO18.
- Attach the **Collector** to your common ground (Any ground pin on your GPIO or an external power supply).
- Attach the **Emitter** to the negative terminal on your fan.
- Finally attach the positive terminal of your fan to the 5v pin of your pi or external power supply
