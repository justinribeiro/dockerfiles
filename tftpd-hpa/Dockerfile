# Little overkill on the image don't ya think?
FROM ubuntu:15.04
MAINTAINER Justin Ribeiro <justin@justinribeiro.com>

#
# Because sometimes hardware updates need some tftp
#
#   docker run -d \
#           --net host 
#           -p 69:69 
#           -v /my/tftp/files:/var/lib/tftpboot 
#           --name tftp_server 
#           justinribeiro/tftpd-hpa
#

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tftpd-hpa

# where the files exist
VOLUME /var/lib/tftpboot

# low number ports are fun
EXPOSE 69

# Start in foreground, be verbose, set address
CMD /usr/sbin/in.tftpd -L -p -v -u tftp -a 0.0.0.0:69 -s /var/lib/tftpboot
