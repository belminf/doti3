#!/usr/bin/env bash

# CONFIGURATION

# Laptop display
LAPTOP_DISPLAY='eDP1'

# Where to place DP, right or left
DP_PLACEMENT='right'


# DISCOVERY

# Find connected DP display
DP_DISPLAY="$(xrandr --query | sed -En 's/^(DP[0-9\-]+) connected.*/\1/p' | head -n 1 | tr -d '\n')"

# Find current primary
PRIMARY_DISPLAY="$(xrandr --query | sed -En 's/^([A-Za-z0-9\-]+) connected primary .*$/\1/p' | head -n 1 | tr -d '\n')"

# How to set background image
CMD_POST_DISPLAY="${HOME}/.fehbg; i3-msg restart"


# APPLY SETTINGS

# We have a DP display that isn't primary
if [ -n "$DP_DISPLAY" -a "$PRIMARY_DISPLAY" != "$DP_DISPLAY" ]
then
  
  # Turn off to reset
  xrandr --output $DP_DISPLAY --off

  # Now set to primary
  xrandr --output $DP_DISPLAY --preferred --primary --${DP_PLACEMENT}-of ${LAPTOP_DISPLAY} --auto
   
  # Set background image
  eval ${CMD_POST_DISPLAY}

# We have no DP and laptop isn't primary
elif [ -z "$DP_DISPLAY" -a "$PRIMARY_DISPLAY" != "$LAPTOP_DISPLAY" ]
then

  # Set laptop to primary
  xrandr --output $LAPTOP_DISPLAY --preferred --primary --auto


  # Turn off all other displays
  for d in $(xrandr | sed -En 's/^([a-zA-Z0-9-]+).*/\1/p' | tail -n +2)
  do

    # Only disable non-laptop display
    [ "$d" != "$LAPTOP_DISPLAY" ] && xrandr --output $d --off

  done

  # Set background image
  eval ${CMD_POST_DISPLAY}

fi
