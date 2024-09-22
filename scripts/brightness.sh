#!/bin/sh

# Read current brightness
brightness=$(cat /sys/class/backlight/nvidia_0/brightness)

# Read maximum brightness
max_brightness=$(cat /sys/class/backlight/nvidia_0/max_brightness)

# Calculate brightness percentage
brightness_perc=$((brightness * 100 / max_brightness))

# Output the brightness percentage
echo "$brightness_perc"

