TODO
========================


CHECKLIST
========================
main.c			NO		Remove unused flags !? VCC check before !? Organize resets. ResetSensor and UpdateLight Fix. Reset config review.

altitude.c		NO		Remove !?
battery.c		NO		Remove low battery cycle !?
clock.c			OK
distance.c		OK
light.c			NO		Improve update light status
menu.c			OK
rfbike.c		NO		Implement
rfsimpliciti.c	NO		Delete
sensor.c		OK
speed.c			OK		Fix Measurement


NOTES
========================
Temperature measurement:
- start_altitude_measurement();
- temperature = sAlt.temperature_C;