# Chrome Headless

[![Docker Pulls](https://img.shields.io/docker/pulls/justinribeiro/chrome-headless.svg)](https://hub.docker.com/r/justinribeiro/chrome-headless/)

> NOTE: This build is specific to ARM64, particularly to support Apple's M1 silicon. HOWEVER, Chromium is vastly out of date in Debian (6 majors at the time of this writing), and should be considered a security concern at this point. Use at your own risk.

What was once a container using the experimental build of headless_shell from tip, this container now runs and exposes Chrome headless via chromium --headless.

## What's New

1. Pulls Chromium
2. You can now use the ever-awesome Jessie Frazelle seccomp profile for Chrome.
`wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json`

## To run (without seccomp):
`docker run -d -p 9222:9222 --cap-add=SYS_ADMIN justinribeiro/chrome-headless`

## To run a better way (with seccomp):
`docker run -d -p 9222:9222 --security-opt seccomp=$HOME/chrome.json justinribeiro/chrome-headless`

## Using In DevTools
Open Chrome and browse to `http://localhost:9222/`.

## Information on Chrome headless

* [Getting Started with Chrome Headless](https://developers.google.com/web/updates/2017/04/headless-chrome)
* [Chromium tracker](https://bugs.chromium.org/p/chromium/issues/list?q=label:Proj-Headless)
* [Headless Chromium README](https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md)
* [headless-dev mailing list](https://groups.google.com/a/chromium.org/forum/#!forum/headless-dev)

## General Use
`docker run -d -p 9222:9222 justinribeiro/chrome-headless`

## Using In DevTools
Open Chrome and browse to `http://localhost:9222/`.

#Known issues

## Unsafe Scripts
You may have to _Load unsafe scripts_ from the omnibox shield icon to allow connecting to the insecure websocket endpoint `ws://localhost:9222`:

![image](https://cloud.githubusercontent.com/assets/39191/21593324/b3e92618-d0ca-11e6-9472-d07b9b9df2c9.png)

## Red herrings
Depending on the current build, if you run the container interactively you may see things like this on the console:
```sh
[0501/162901.033074:WARNING:audio_manager.cc(295)] Multiple instances of AudioManager detected
[0501/162901.033169:WARNING:audio_manager.cc(254)] Multiple instances of AudioManager detected
```
In most cases, these messages can be safely ignored. They will sometimes change and eventually as things are updated in the source tree, resolved.

## Building and Pushing

To build, `./build.sh <tag>`, for example ./build.sh justinbeiro/chrome-headless:20211007-chromium

To push, `./build.sh <tag>`, for example `./push.sh justinbeiro/chrome-headless:20211007-chromium`. This will push both amd64 and arm64 images.