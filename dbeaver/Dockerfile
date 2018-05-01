# This is a little heavy handed, but works in a pinch when I need to handle DB
# things
#
# docker run --name dbeaver \
#  -v $HOME/.dbeaver4:/root/.dbeaver4 \
#  -v $HOME/.dbeaver-drivers:/root/.dbeaver-drivers \
#  -v /tmp/.X11-unix:/tmp/.X11-unix \
#  -e DISPLAY=$DISPLAY \
#  --net=host \
#  --name dbeaver \
#  justinribeiro/dbeaver
#
FROM java:openjdk-8-jre
LABEL name="dbbeaver" \
			maintainer="Justin Ribeiro <justin@justinribeiro.com>" \
			version="1.0" \
			description="DBeaver database tooling in a container"

ADD https://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb .
RUN apt-get update && apt-get install -y \
  libswt-gtk-3-jni \
  libswt-gtk-3-java \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*
RUN dpkg -i dbeaver-ce_latest_amd64.deb

CMD dbeaver
