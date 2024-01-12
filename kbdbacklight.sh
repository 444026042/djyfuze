_brightness=$(cat /sys/class/leds/chromeos::kbd_backlight/brightness)

if [ $# -ge 1 ] && [ $1 -eq 0 ]
  then
    _brightness=$((${_brightness}-10))
    if [ ${_brightness} -lt 0 ]
      then
        _brightness=0
    fi
else
    _brightness=$((${_brightness}+10))
    if [ ${_brightness} -gt 100 ]
      then
        _brightness=100
    fi
fi
echo "miss" |sudo -S  echo ${_brightness} > /sys/class/leds/chromeos::kbd_backlight/brightness
