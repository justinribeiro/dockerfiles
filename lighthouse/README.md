# Lighthouse in a container

[![Docker Pulls](https://img.shields.io/docker/pulls/justinribeiro/lighthouse.svg)](https://hub.docker.com/r/justinribeiro/lighthouse/)

[Lighthouse](https://github.com/justinribeiro/dockerfiles/tree/master/lighthouse) analyzes web apps and web pages, collecting modern performance metrics and insights on developer best practices. This container allows you to use lighthouse in conjunction with the `--headless` option of Chrome M59+.

## How to Use

## Step 1: Run the container

```
docker run -itv ~/your-local-dir:/home/chrome/reports --cap-add=SYS_ADMIN justinribeiro/lighthouse
```

## Step 1 Improved: A better way with SECCOMP

Using the ever-awesome [Jessie Frazelle](https://twitter.com/jessfraz) SECCOMP profile for Chrome, we don't have to use the hammer that is SYS_ADMIN:

```
$ wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json
$ docker run -itv ~/your-local-dir:/home/chrome/reports --security-opt seccomp=$HOME/chrome.json justinribeiro/lighthouse
```

## Step 2: Run Lighthouse with `--chrome-flags`

Once you're in the container, using the `--chrome-flags` option available in lighthouse, we can automatically start Chrome in headless mode within the container light so:

```
lighthouse --chrome-flags="--headless --disable-gpu" https://justinribeiro.com
```

## I just want to run Chrome headless on 9222 within a container!

Use my other [chrome-headless container](https://hub.docker.com/r/justinribeiro/chrome-headless/) for that.