#include <unistd.h>
#include <stdio.h>
#include <wiringPi.h>
#include <softPwm.h>


int main (void)
{
  wiringPiSetup () ;
  pinMode (1, OUTPUT) ;
  softPwmCreate (1, 0, 100) ;
  for (;;)
  {
	usleep(50000);
	FILE *temperatureFile;
		double T;
		temperatureFile = fopen ("/sys/class/thermal/thermal_zone0/temp", "r");
		fscanf (temperatureFile, "%lf", &T);
		if (T < 38000){
			softPwmWrite (1, 0);
		}
		if (T >= 40000 && T <50000){
			softPwmWrite (1, 25);
		}
		if (T >= 50000 && T <60000){
			softPwmWrite (1, 50);
		}
		if (T >= 60000 && T <70000){
			softPwmWrite (1, 75);
		}
		if (T >= 70000){
			softPwmWrite (1, 100);
		}
		fclose (temperatureFile);
  }
  return 0 ;
}