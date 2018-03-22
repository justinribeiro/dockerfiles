# Run polymer-cli in a docker container
#
# Because the workstation build is failing and a container for this solves my
# immediate problem. Yeah, that's how I roll sometimes.
#
# alias polymer='docker run --rm -it -p 8081:8081 -v $(pwd):/code
# justinribeiro/polymer '
#
FROM node:alpine
LABEL name="polymer-cli" \
			maintainer="Justin Ribeiro <justin@justinribeiro.com>" \
			version="1.0" \
			description="polymer-cli in a container"

RUN mkdir -p /code
WORKDIR /code
ADD . /code

RUN apk update && \
    apk add git && \
    npm install -g -s --no-progress bower polymer-cli --unsafe-perm

EXPOSE 8081

ENTRYPOINT ["polymer"]
