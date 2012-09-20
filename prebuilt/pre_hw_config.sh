# LMU AS3676 Configuration before chargemon
dev=/sys/class/leds/led_1-lcd/device/
echo 0 > $dev/als_on  #Sensor on/off. 1 = on, reg 90h
echo 0x07=0x0e > $dev/debug
echo 1 > /sys/class/leds/led_1-lcd/use_dls
echo 1 > /sys/class/leds/led_2-lcd/use_dls
echo 0x2c=0x80 > $dev/debug #2ch : 0x80 (step_up_fb_pwm on) : gpio current
echo 1 > $dev/als_gain #meaning gain=1/2  90h[2:1] : 0b10 (1)
