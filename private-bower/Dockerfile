# Run private-bower in a really odd way, because I have a really really specific
# situation where this makes sense.
#
# YOU SHOULD NOT RUN THIS IN PROD - LOCAL USE ONLY
# SERIOUSLY DO NOT RUN OR PUBLISH IN THE OPEN
#
# docker run -it -v /work/sourcecode/acc-mirror:/mirror \
#           -p 8081:8081 \
#           -p 6789:6789 \
#           -p 7891:7891 \
#           justinribeiro/private-bower
#
FROM node:alpine
LABEL name="private-bower" \
			maintainer="Justin Ribeiro <justin@justinribeiro.com>" \
			version="1.0" \
			description="prviate bower mirror in a container"

RUN apk update && \
	apk add --no-cache git openssh && \
	npm install -g -s --no-progress private-bower --unsafe-perm && \
	npm cache clean --force && \
	npm uninstall -g npm

WORKDIR /root

# This is a really specific hack that you should not do in prod but that works
# okay when in a bind on a local machine
ADD ./readonly_key /root/.ssh/id_rsa
ADD ./start.sh /root/start.sh

RUN chmod 600 /root/.ssh/id_rsa
RUN chmod +x /root/start.sh
RUN touch /root/.ssh/known_hosts && \
	ssh-keygen -R github.com

# Not standard ports because ugh
EXPOSE 6789 7891 8081
VOLUME /mirror

CMD [ "./start.sh" ]
