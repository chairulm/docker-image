FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV KNIME_VERSION=5.2.3
ENV DISPLAY=:1
ENV VNC_RESOLUTION=1280x800
ENV VNC_COL_DEPTH=24

# Install core tools
RUN apt-get update && apt-get install -y \
    wget unzip curl ca-certificates gnupg2 sudo git \
    xfce4 xfce4-terminal tigervnc-standalone-server \
    novnc websockify supervisor x11vnc net-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install KNIME
RUN mkdir -p /opt/knime && \
    wget -O /tmp/knime.zip https://download.knime.org/analytics-platform/linux/knime-latest-linux.gtk.x86_64.tar.gz && \
    tar -xzf /tmp/knime.zip -C /opt/knime --strip-components=1 && \
    rm /tmp/knime.zip

# Setup user
RUN useradd -ms /bin/bash knime && echo "knime:knime" | chpasswd && \
    mkdir -p /home/knime/.vnc && chown -R knime:knime /home/knime

# Set VNC password
RUN echo knime | vncpasswd -f > /home/knime/.vnc/passwd && \
    chmod 600 /home/knime/.vnc/passwd && \
    chown knime:knime /home/knime/.vnc/passwd

# Set noVNC manually
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose ports
EXPOSE 5901 6080

USER knime
CMD ["/start.sh"]
