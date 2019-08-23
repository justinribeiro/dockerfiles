# Run Lighthouse w/ Chrome Headless in a container
#
# Lighthouse is a tool that allows auditing, performance metrics, and best
# practices for Progressive Web Apps.
#
# What's New
#
# 1. Allows cache busting so you always get the latest lighthouse.
# 1. Pulls from Chrome M59+ for headless support.
# 2. You can now use the ever-awesome Jessie Frazelle seccomp profile for Chrome.
#     wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json
#
#
# To run (without seccomp):
# docker run -it ~/your-local-dir:/opt/reports --net host justinribeiro/lighthouse
#
# To run (with seccomp):
# docker run -it ~/your-local-dir:/opt/reports --security-opt seccomp=$HOME/chrome.json --net host justinribeiro/lighthouse
#

FROM debian:jessie
LABEL name="lighthouse" \
      maintainer="Justin Ribeiro <justin@justinribeiro.com>" \
      version="2.1" \
      description="Lighthouse analyzes web apps and web pages, collecting modern performance metrics and insights on developer best practices."

# Install deps + add Chrome Stable + purge all the things
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    --no-install-recommends \
    && curl -sSL https://deb.nodesource.com/setup_12.x | bash - \
    && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y \
    google-chrome-stable \
    nodejs \
    --no-install-recommends
#&& apt-get purge --auto-remove -y curl gnupg \
#&& rm -rf /var/lib/apt/lists/*

ARG CACHEBUST=1
RUN npm install -g lighthouse

# Add Chrome as a user
RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome \
    && mkdir -p /home/chrome/reports && chown -R chrome:chrome /home/chrome

# some place we can mount and view lighthouse reports
VOLUME /home/chrome/reports
WORKDIR /home/chrome/reports

# Run Chrome non-privileged
USER chrome

# Drop to cli
CMD ["/bin/bash"]
