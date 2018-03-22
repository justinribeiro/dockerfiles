# Run polymer-cli in a docker container

Because the workstation build is failing and a container for this solves my immediate problem. Yeah, that's how I roll sometimes.

```
alias polymer='docker run --rm -it -p 8081:8081 -v $(pwd):/code
justinribeiro/polymer '
```