# Run Puppeteer Headless in a container

## What's New

1. Runs with Chrome Stable
2. Uses the ever-awesome Jessie Frazelle seccomp profile for Chrome.
```sh
wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json
```
3. Define `/output` to be used with `--mount` for easy file output

## To run with seccomp
```sh
cat example.js | docker run -i --rm --security-opt seccomp=$HOME/chrome.json \
    --mount type=bind,source="$(pwd)"/output,target=/output \
    --name puppeteer-headless \
    justinribeiro/puppeteer-headless \
    node -e "`cat $_`"
```
