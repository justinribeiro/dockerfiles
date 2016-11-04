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