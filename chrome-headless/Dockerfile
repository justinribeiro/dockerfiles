# Run chromium Headless in a container
#
# What was once a container using the experimental build of headless_shell from
# tip, this container now runs and exposes stable chromium headless via
# google-chome --headless.
#
# What's New
#
# 1. Pulls from chromium Stable
# 2. You can now use the ever-awesome Jessie Frazelle seccomp profile for Chrome.
#     wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json
#
#
# To run (without seccomp):
# docker run -d -p 9222:9222 --cap-add=SYS_ADMIN justinribeiro/chrome-headless
#
# To run a better way (with seccomp):
# docker run -d -p 9222:9222 --security-opt seccomp=$HOME/chrome.json justinribeiro/chrome-headless
#
# Basic use: open chromium, navigate to http://localhost:9222/
#

# Base docker image
FROM debian:buster-slim
LABEL name="chrome-headless" \
	maintainer="Justin Ribeiro <justin@justinribeiro.com>" \
	version="3.0" \
	description="Chromium Headless in a container"

# Install deps + add Chrome Stable + purge all the things
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	--no-install-recommends \
	&& apt-get update && apt-get install -y \
	chromium \
	chromium-sandbox \
	fontconfig \
	fonts-ipafont-gothic \
	fonts-wqy-zenhei \
	fonts-thai-tlwg \
	fonts-kacst \
	fonts-symbola \
	fonts-noto \
	fonts-freefont-ttf \
	--no-install-recommends \
	&& apt-get purge --auto-remove -y curl gnupg \
	&& rm -rf /var/lib/apt/lists/*

# Add chromium as a user
RUN groupadd -r chromium && useradd -r -g chromium -G audio,video chromium \
	&& mkdir -p /home/chromium && chown -R chromium:chromium /home/chromium

# Run chromium non-privileged
USER chromium

# Expose port 9222
EXPOSE 9222

# Autorun chromium headless with no GPU
ENTRYPOINT [ "chromium" ]
CMD [ "--headless", "--disable-gpu", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222" ]
