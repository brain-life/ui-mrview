
FROM ubuntu:14.04
MAINTAINER Soichi Hayashis <hayashis@iu.edu>

EXPOSE 5900

# Install LXDE 
ENV DEBIAN_FRONTEND=noninteractive
#X11VNC_PASSWORD="letitbe"

RUN apt-get update && apt-get install -y \
    xvfb x11vnc vim \
    lxde-core lxde-icon-theme lxterminal \
    mrtrix mesa-utils libgl1-mesa-dri

# Copy VNC script that handles restarts
ADD vnc.sh /opt
CMD ["/opt/vnc.sh"]

# Install autostart file for fslview
RUN mkdir -p /root/.config/autostart
ADD app.desktop /root/.config/autostart

