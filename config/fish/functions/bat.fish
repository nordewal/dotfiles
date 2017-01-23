function bat
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 |egrep "percent|time"
  upower -i /org/freedesktop/UPower/devices/battery_BAT1 |egrep "percent|time"
  return 0
end
