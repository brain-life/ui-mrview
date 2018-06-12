FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER Soichi Hayashis <hayashis@iu.edu>

EXPOSE 5900
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    vim mesa-utils tightvncserver xfce4 

#install neurodebian and mrtrix
RUN wget -O- http://neuro.debian.net/lists/xenial.us-tn.full | tee /etc/apt/sources.list.d/neurodebian.sources.list
RUN apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9
RUN apt-get update && apt-get install -y mrtrix
RUN apt-get install -y wmctrl

ADD virtualgl_2.5.2_amd64.deb /
RUN dpkg -i /virtualgl_2.5.2_amd64.deb

# Copy VNC script that handles restarts
ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ENV USER=root X11VNC_PASSWORD=override

CMD ["/startvnc.sh"]

