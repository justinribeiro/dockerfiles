# Base docker image
FROM ubuntu:16.04
MAINTAINER Justin Ribeiro <justin@justinribeiro.com>

# Experimental! 
#
# To run:
# docker run -d -p 9222:9222 justinribeiro/chrome-headless
# 
# Access:
# http://localhost:9222/

# Pull my chrome-headless build
ADD https://storage.googleapis.com/chrome-builds/headless/chrome-headless.deb /src/chrome-headless.deb

# Setup deps, install chrome-headless
RUN apt-get update && apt-get install -y \
  software-properties-common \
  ca-certificates \
  gconf-service \
  libgconf-2-4 \
  libglib2.0-0 \ 
  libnspr4 \
  libnss3 \
  libxss1 \
  libxtst6 \
  libxrender1 \ 
  libfreetype6 \ 
  libfontconfig1 \
  libxrandr2 \
  libc6 \ 
  zlib1g \ 
  xdg-utils \
  --no-install-recommends && \
  dpkg -i '/src/chrome-headless.deb' && \
  rm -rf /var/lib/apt/lists/*

# expose 9222 so we can connect to it
EXPOSE 9222

# Autorun chrome-headless without the sandbox
ENTRYPOINT [ "/opt/stickmanventures/chrome-headless/headless_shell" ]
CMD [ "--no-sandbox", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222" ]