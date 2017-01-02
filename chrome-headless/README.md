# Experimental build for Chrome Headless

Experimental! Use at own risk. No warrenty. Et cetera.

This is from the tip of the Chromium source tree; pulls a DEB file I built, installs it and exposes dev tools debugging on port 9222.

Use:
```
docker run -d --net host justinribeiro/chrome-headless
```

Access in Chrome at:
```
http://localhost:9222/
```
You may have to _Load unsafe scripts_ from the omnibox shield icon to allow connecting to the insecure websocket endpoint `ws://localhost:9222`:
<center>
![image](https://cloud.githubusercontent.com/assets/39191/21593324/b3e92618-d0ca-11e6-9472-d07b9b9df2c9.png)
</center>
