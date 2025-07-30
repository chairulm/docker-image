#!/bin/bash
# start.sh

# Start VNC server
vncserver $DISPLAY -geometry $VNC_RESOLUTION -depth $VNC_COL_DEPTH -localhost no :1

# Set default to vnc.html
cd /opt/novnc && ln -sf vnc.html index.html

# Start noVNC
websockify --web=/opt/novnc --wrap-mode=ignore 6080 localhost:5901 &

# Start desktop session
xfce4-session &
sleep 2

# Launch KNIME
/opt/knime/knime
