# doti3
My i3wm configuration

## Setup
### Udev display update
 Add the following to `/etc/udev/rules.d/98-monitor-hotplug.rules`:

```
KERNEL=="card0", SUBSYSTEM=="drm", ACTION=="change", ENV{DISPLAY}=":0.0", ENV{XUSER}="<USER>", RUN+="/bin/bash <SCRIPT PATH>" 

``` 

## Keys:
Without leader key:

* <kbd>Capslock</kbd>: Start `rofi` (launcher) for Desktop apps
* <kbd>Ctrl</kbd><kbd>Capslock</kbd>: Start rofi (launcher) for Terminal commands
* <kbd>Shift</kbd><kbd>Capslock</kbd>: Make `xpad` visible

* <kbd>F11</kbd>: Launch audio configuration
* <kbd>F12</kbd>: Launch WiFi configuration

With leader key (<kbd>R-Window</kbd>):

* General:
  * <kbd>Shift</kbd><kbd>R</kbd>: Restart i3 and reload config
  * <kbd>End</kbd>: Bring up power menu (e.g., shutdown, restart, etc.)
  * <kbd>Shift</kbd><kbd>End</kbd>: Lock screen
  * <kbd>Q</kbd>: Quit window
  * <kbd>V</kbd>: Launch clipboard manager
* Application shortcuts:
  * <kbd>Enter</kbd>: Launch terminal (`tmux` in `termite`)
  * <kbd>Space</kbd>: Launch `chromium`
  * <kbd>W</kbd>: Launch WhatsApp
  * <kbd>M</kbd>: Launch Google Play Music
  * <kbd>C</kbd>: Launch Google Calendar
  * <kbd>T</kbd>: Launch Todoist
  * <kbd>=</kbd>: Launch Calculator
* Screenshot (with `xfce4-screenshooter`)
  * <kbd>Print</kbd>: Save in clipboard
  * <kbd>Shift+Print</kbd>: Save in ~/Screenshots
* Workspace movement:
  * <kbd>Alt</kbd><kbd>&leftarrow;</kbd>: Move current workspace to the left 
  * <kbd>Alt</kbd><kbd>&rightarrow;</kbd>: Move current workspace to the right 
  * <kbd>(Workspace Number)</kbd>: Move focus to a workspace
  * <kbd>\`</kbd>: Cycle workspaces in current display
  * <kbd>Shift</kbd><kbd>\`</kbd>: Create a new workspace in current display
* Window layout:
  * <kbd>Shift</kbd><kbd>T</kbd>: Tabbed layout
  * <kbd>Shift</kbd><kbd>\\</kbd> (`|`): Split horizontal
  * <kbd>Shift</kbd><kbd>-<kbd> (`_`): Split vertical
  * <kbd>F</kbd>: Go fullscreen
* Window focus:
  * <kbd>Tab</kbd>: Toggle focus between floating and tiled windows
  * <kbd>Shift</kbd><kbd>Tab</kbd>: Toggle floating for a window
  * <kbd>H</kbd>/<kbd>&leftarrow;</kbd>: Focus window on left 
  * <kbd>L</kbd>/<kbd>&rightarrow;</kbd>: Focus window on right 
  * <kbd>J</kbd>/<kbd>&downarrow;</kbd>: Focus window below
  * <kbd>K</kbd>/<kbd>&uparrow;</kbd>: Focus window above
* Window movement:
  * <kbd>Shift</kbd><kbd>H</kbd>/<kbd>Shift</kbd><kbd>&leftarrow;</kbd>: Move current window left 
  * <kbd>Shift</kbd><kbd>L</kbd>/<kbd>Shift</kbd><kbd>&rightarrow;</kbd>: Move current window right 
  * <kbd>Shift</kbd><kbd>J</kbd>/<kbd>Shift</kbd><kbd>&downarrow;</kbd>: Move current window down 
  * <kbd>Shift</kbd><kbd>K</kbd>/<kbd>Shift</kbd><kbd>&uparrow;</kbd>: Move current window up 
  * <kbd>Shift</kbd><kbd>(Workspace Number)</kbd>: Move current window to a workspace
* Window resizing:
  * <kbd>R</kbd>: Enable resize mode
  * <kbd>H</kbd>/<kbd>&leftarrow;</kbd>: Shrink window width
  * <kbd>L</kbd>/<kbd>&rightarrow;</kbd>: Grow window width
  * <kbd>J</kbd>/<kbd>&downarrow;</kbd>: Shrink window height
  * <kbd>K</kbd>/<kbd>&uparrow;</kbd>: Grow window height
