# Base docker image
FROM ubuntu:16.04
MAINTAINER Justin Ribeiro <justin@justinribeiro.com>

#
# Experimental! 
#
# Step 1:
# docker run -it -v ~/your-local-dir:/opt/reports --net host justinribeiro/lighthouse
# 
# Step 2: Once in shell, start headless_shell in background
# headless_shell --no-sandbox --remote-debugging-port=9222 &>1 &
#
# Step 3: Run lighthouse
# lighthouse https://www.your-url.com/
#
# Step 4: Make web faster, file tickets. :-)
#

# Pull my chrome-headless build
ADD https://storage.googleapis.com/chrome-builds/headless/chrome-headless.deb /src/chrome-headless.deb

# Setup deps, install chrome-headless
RUN apt-get update && apt-get install -y \
  software-properties-common \
  ca-certificates \
  gconf-service \
  libcurl3 \
  libexif-dev \
  libgconf-2-4 \
  libglib2.0-0 \ 
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libnspr4 \
  libnss3 \
  libpango1.0-0 \
  libv4l-0 \
  libxss1 \
  libxtst6 \
  libxrender1 \ 
  libx11-6 \ 
  libxft2 \ 
  libfreetype6 \ 
  libc6 \ 
  zlib1g \ 
  libpng12-0 \
  wget \
  xdg-utils \
  curl \
  --no-install-recommends && \
  dpkg -i '/src/chrome-headless.deb'

# Get and install node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs

# Install lighthouse
RUN npm install -g lighthouse

# Make life easier to run headless_shell
RUN chmod -R 777 /opt/stickmanventures/chrome-headless
ENV PATH "$PATH:/opt/stickmanventures/chrome-headless"

# some place we can mount and view lighthouse reports
VOLUME /opt/reports
WORKDIR /opt/reports

# Drop to cli
CMD ["/bin/bash"]
