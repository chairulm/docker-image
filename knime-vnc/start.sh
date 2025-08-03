#!/bin/bash

# Start VNC server
vncserver $DISPLAY -geometry $VNC_RESOLUTION -depth $VNC_COL_DEPTH -localhost no :1

# Write VNC xstartup
cat > ~/.vnc/xstartup <<EOF
#!/bin/sh
xrdb $HOME/.Xresources
startxfce4 &
EOF
chmod +x ~/.vnc/xstartup

# Set index.html for noVNC
cd /opt/novnc && ln -sf vnc.html index.html

# Start noVNC
websockify --web=/opt/novnc --wrap-mode=ignore 6080 localhost:5901 &

# Wait for desktop
sleep 3

# Disable lock-related features
xset s off
xset -dpms
xset s noblank

# Launch KNIME
/opt/knime/knime
