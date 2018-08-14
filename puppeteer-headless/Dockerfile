# Run Puppeteer Headless in a container
#
# What's New
#
# 1. Runs with Chrome Stable
# 2. Uses the ever-awesome Jessie Frazelle seccomp profile for Chrome.
#     wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json
# 3. Define `/output` to be used with `--mount` for easy file output
#
# To run with seccomp:
# echo example.js | docker run -i --rm --security-opt seccomp=$HOME/chrome.json \
#    --mount type=bind,source="$(pwd)"/output,target=/output \
#    --name puppeteer-headless \
#    justinribeiro/puppeteer-headless \
#    node -e "`cat $_`"
#
FROM node:8-slim
LABEL name="puppeteer-headless" \
			maintainer="Justin Ribeiro <justin@justinribeiro.com>" \
			version="1.0" \
			description="puppeteer in a container"

RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        --no-install-recommends \
    && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y \
        google-chrome-stable \
        fonts-ipafont-gothic \
        fonts-wqy-zenhei \
        fonts-thai-tlwg \
        fonts-kacst \
        ttf-freefont \
        --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /src/*.deb

RUN npm i puppeteer

RUN groupadd -r puppeteer && useradd -r -g puppeteer -G audio,video puppeteer \
    && mkdir -p /home/puppeteer && chown -R puppeteer:puppeteer /home/puppeteer \
    && chown -R puppeteer:puppeteer /node_modules \
    && mkdir -p /output && chown -R puppeteer:puppeteer /output

# Use via --mount for output
VOLUME /output
WORKDIR /output

# Run everything non-privileged
USER puppeteer

CMD ["google-chrome-stable"]
