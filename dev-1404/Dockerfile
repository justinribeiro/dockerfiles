FROM ubuntu:14.04
MAINTAINER Justin Ribeiro <justin@justinribeiro.com>

#
#   docker run -it  \
#      --privileged \
#      -v /dev/bus/usb:/dev/bus/usb \ 
#      --device=/dev/ttyUSB0 \
#      -v ~/sourcecode:/opt/sourcecode \
#      -n dev_1404 \ 
#      justinribeiro/dev_1404
#

RUN apt-get update && apt-get install -y \
  software-properties-common \
  ca-certificates \
  git-core \
  gnupg \
  flex \
  bison \
  gperf \
  build-essential \
  zip \ 
  curl \ 
  zlib1g-dev \
  gcc-multilib \
  g++-multilib \
  libc6-dev-i386 \
  bc \
  python \
  wget \
  openjdk-7-jdk \
  nano \
  libxml2-utils

# where the files exist
VOLUME /opt/sourcecode

CMD ["/bin/bash"]
