#!/bin/sh
xinput set-button-map "Logitech USB Trackball" 1 9 3 4 5 6 7 8 2
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 8 8
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation Axes" 8 6 7 4 5
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation X Axis" 8 6
# xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation Timeout" 8 200
xinput set-int-prop "Logitech USB Trackball" "Evdev Drag Lock Buttons" 8 0
