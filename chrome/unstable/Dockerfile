# Base docker image
FROM ubuntu:15.04
MAINTAINER Justin Ribeiro <justin@justinribeiro.com>

#
# Based on jfrazelle's: https://github.com/jfrazelle/dockerfiles/blob/master/chrome/beta/Dockerfile
#
# Changes are to run on my 15.04 + GTX 970 setup; your mileage will vary (fair warning)
#
#        docker run -d \
#                --memory 4gb
#                --net host
#                -v /etc/localtime:/etc/localtime:ro
#                -v="/tmp/.X11-unix:/tmp/.X11-unix:rw"
#                -e DISPLAY=unix$DISPLAY
#                -v $HOME/Downloads:/root/Downloads
#                -v $HOME/.chrome:/data
#                --device /dev/dri/card0
#                --device /dev/snd
#                --device /dev/video0
#                --device /dev/nvidia0
#                --device /dev/nvidiactl
#                justinribeiro/chrome:unstable --user-data-dir=/data --force-device-scale-factor=1

# pull chrome beta
ADD https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb /src/google-talkplugin_current_amd64.deb
ADD https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb /src/google-chrome-unstable_current_amd64.deb

# Install Chrome Beta
RUN mkdir -p /usr/share/icons/hicolor && \
	apt-get update && apt-get install -y \
	software-properties-common \
	ca-certificates \
	gconf-service \
	hicolor-icon-theme \
	libappindicator1 \
	libasound2 \
	libcanberra-gtk-module \
	libcurl3 \
	libexif-dev \
	libgconf-2-4 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libnspr4 \
	libnss3 \
	libpango1.0-0 \
	libv4l-0 \
	libxss1 \
	libxtst6 \
	wget \
	xdg-utils \
	--no-install-recommends && \
	dpkg -i '/src/google-chrome-beta_current_amd64.deb' && \
	dpkg -i '/src/google-talkplugin_current_amd64.deb' \
	&& rm -rf /var/lib/apt/lists/*

# It's about to get ugly
RUN add-apt-repository ppa:graphics-drivers/ppa
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	nvidia-355 

COPY local.conf /etc/fonts/local.conf

# Autorun chrome
ENTRYPOINT [ "/usr/bin/google-chrome" ]
CMD [ "--user-data-dir=/data" ]
