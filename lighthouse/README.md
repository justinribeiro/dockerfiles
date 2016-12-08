# Lighthouse in a box

Experimental! Use at own risk. No warrenty. Et cetera.

This allows you to run an interactive shell and play with both headless_shell and [lighthouse](https://github.com/GoogleChrome/lighthouse).

Step 1:
```
docker run -it ~/your-local-dir:/opt/reports --net host justinribeiro/lighthouse
```

Step 2: Once in shell, start headless_shell in background
```
headless_shell --no-sandbox --remote-debugging-port=9222 &>1 &
```

Step 3: Run lighthouse
```
lighthouse https://www.your-url.com/
```

Step 4: Make web faster, file bugs accordingly. :-)

## I just want to run headless_shell on 9222!

Use my other [chrome-headless container](https://hub.docker.com/r/justinribeiro/chrome-headless/) for that.

## Why Lighthouse 1.1.6?

Because of changes in the way Lighthouse connects, until `Target.createTarget` becomes available in headless, newer versions won't work. This is a known issue and both [Chromium](https://bugs.chromium.org/p/chromium/issues/detail?id=666865) and [Lighthouse](https://github.com/GoogleChrome/lighthouse/issues/970) tickets exist to address it.