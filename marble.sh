#!/bin/sh
xinput set-button-map "Logitech USB Trackball" 1 2 3 4 5 6 7 2 2
# xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Axes" 8 6 7 4 5
# xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation X Axis" 7 6
# xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Timeout" 8 200
# xinput set-prop "Logitech USB Trackball" "Evdev Drag Lock Buttons" 8 0
xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 8
xinput set-prop "Logitech USB Trackball" "Evdev Third Button Emulation" "true"
