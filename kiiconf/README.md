# Input Club KiiConf web configurator for Whitefox

> EXPERIMENTAL! USE AT OWN RISK

This is an experimetnal container that runs the KiiConf web interface to allow you configure and build various firmware for [Input Club keyboards](https://input.club/) (ala my current keyboard, a Whitefox).

If you're just looking for the online configurator, see https://configurator.inputclub.com/.

## How to use

```sh
$ docker build -t justinribeiro/kiiconf .
$ docker run -it -p 9999:80 justinribeiro/kiiconf
```

Once the container is running, open the web interface at localhost:9999 and start making some keymaps!
