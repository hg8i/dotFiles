#xmodmap ~/.Xmodmap_t470s

PATH="$HOME/scrips:$PATH"

sudo systemctl start tempCheck.timer
sudo systemctl start batteryCheck.timer
sudo systemctl start NetworkManager
sudo systemctl start sshd.socket
sudo systemctl start sshd@.service
sudo systemctl start ippointer.timer
sudo systemctl start ntpd.service
sudo systemctl start acpid.service
# 
#start widgits
nm-applet &
redshift-gtk &
# /home/prime/scripts/mountManager/mountmanager &
# 
# # I want mount manager to get added last, so give the others some time to load
# sleep 0.1
# mountmanager &
# # sleep 0.1
# i3QuitShortcut &
# 
#run xresources on launch
sysresources=$HOME/.Xresources
if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi
# 
# #battery warning in loop
# watch -n 300 /home/prime/scripts/batteryWatch.sh &
# 
# #remap capslock as escape for short press!
# xcape -e 'Control_L=Escape'
# 
#turn off mysterious touch surface at bottom of laptop
# look at: sudo xinput list
# if not working
# xinput set-prop 11 "Device Enabled" 0
# 
#start gnome keyring (this is for skypeforlinux, doesn't seem to work)
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
export SSH_AUTH_SOCK
# 
#xmodmap
xmodmap ~/.Xmodmap_hhkb
#remap capslock as escape for short press!
xcape -e 'Control_L=Escape'
#control for middle mouse button
xbindkeys
# 
# #mark last window with "_last" id. Useful for my workspace command

# /home/prime/scripts/toggleTrackpad.sh off

# disable screen timer off
xset s off

# env TERMINAL=st # no! I'm setting this in config
exec i3

