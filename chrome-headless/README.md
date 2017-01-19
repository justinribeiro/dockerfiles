# Experimental build for Chrome Headless

Experimental! Use at own risk. No warranty. Et cetera.

This is from the tip of the Chromium source tree; pulls a DEB file I built, installs it and exposes dev tools debugging on port 9222.

## Information on Chrome headless

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
[0119/175523.510224:WARNING:resource_bundle.cc(327)] locale_file_path.empty() for locale 
[0119/175523.518835:WARNING:resource_bundle.cc(327)] locale_file_path.empty() for locale 
[0119/175523.534345:WARNING:resource_bundle.cc(327)] locale_file_path.empty() for locale 
```
In most cases, these messages can be safely ignored. They will sometimes change and eventually as things are updated in the source tree, resolved.
