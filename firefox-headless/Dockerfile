# Run Firefox Headless in a container
#
#
# To run (without seccomp):
# docker run -d -p 6000:6000 --cap-add=SYS_ADMIN justinribeiro/firefox-headless
#

# Base docker image
FROM debian:sid
LABEL name="firefox-headless" \
			maintainer="Justin Ribeiro <justin@justinribeiro.com>" \
			version="1.4" \
			description="Firefox Headless in a container"

# Install deps + add Chrome Stable + purge all the things
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
  gnupg \
	--no-install-recommends \
  && apt-get update && apt-get install -y \
	firefox \
	--no-install-recommends \
	&& apt-get purge --auto-remove -y curl gnupg \
	&& rm -rf /var/lib/apt/lists/*

# Add firefox as a user
RUN groupadd -r firefox && useradd -r -g firefox -G audio,video firefox \
    && mkdir -p /home/firefox && chown -R firefox:firefox /home/firefox \
    && mkdir -p /home/firefox/.mozilla \
    && chown -R firefox:firefox /home/firefox/.mozilla

# Run firefox non-privileged
USER firefox

# Expose port 6000
EXPOSE 6000

# Autorun chrome headless with no GPU
ENTRYPOINT [ "firefox" ]
CMD [ "--start-debugger-server=6000", "-headless" ]
