#!/bin/sh
xinput set-button-map 'Logitech USB Trackball' 1 2 3 4 5 6 7 2 8

# xinput set-prop 'Logitech USB Trackball' 'Evdev Third Button Emulation' 1
xinput set-prop 'Logitech USB Trackball' 'Evdev Middle Button Emulation' 1

xinput set-prop 'Logitech USB Trackball' 'Evdev Wheel Emulation' 8
xinput set-prop 'Logitech USB Trackball' 'Evdev Wheel Emulation Button' 8
xinput set-prop 'Logitech USB Trackball' 'Evdev Drag Lock Buttons'  0
