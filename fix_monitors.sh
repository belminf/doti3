#!/bin/bash

## Install
# Add the following to `/etc/udev/rules.d/98-monitor-hotplug.rules`:
# 
# KERNEL=="card0", SUBSYSTEM=="drm", ACTION=="change", ENV{DISPLAY}=":0.0", ENV{XUSER}="<USER>", RUN+="/bin/bash <SCRIPT PATH>" 

set -o pipefail

# X11 config
export XAUTHORITY=/home/${XUSER}/.Xauthority

# Display config
new_display_config="--primary --right-of eDP1"
wallpaper_path="/home/$XUSER/.wallpaper.jpg"

function set_primary(){
  
  # Set new primary
  xrandr --output $1 --primary

  # Restart i3
  i3-msg restart

  # Move all workspaces
  for ws in $(i3-msg -t get_workspaces | jq '.[].num')
  do
    i3-msg "workspace $ws; move workspace to primary"
  done

  # Log
  logger -t udev-monitor-script "$1 set as primary"

}


function configure_display(){
  
  # Cycling through clears any inconsistent status
  xrandr --output $1 --off
  sleep 3
  xrandr --output $1 --auto ${new_display_config}

  # Reset wallpaper
  feh --bg-scale ${wallpaper_path}

  # Restart i3
  i3-msg restart
  
  # Log
  logger -t udev-monitor-script "$1 now connected"
}

# Log it
logger -t udev-monitor-script "running script"


# Get current status
outputs=$(xrandr --query)


# Get primary that is disconnected
is_primary_disconnected=$(echo ${outputs} | egrep "(disconnected|unknown connection) primary")

# Fix disconnected primary
if [[ ! -z "${is_primary_disconnected// }" ]]
then

  # Get first connnected and set it as primary
  first_connected=$(xrandr --query | sed -n '0,/ connected / s/^\([A-Za-z0-9\-]\+\) connected .*$/\1/p')

  # Set new primary
  set_primary $first_connected
fi


# Get unconfigured connected outputs
unconfigured_output=$(echo "${outputs}" | egrep "^[A-Z0-9-]+ connected (primary )?\(" | awk -F' ' '{print $1}')

# Configure a connected output
if [[ ! -z "${unconfigured_output// }" ]]; then
  logger -t udev-monitor-script "unconfigured display detected: [${unconfigured_output}]"

  # Configure display
  configure_display $unconfigured_output
fi
