FROM quay.io/centos/centos:stream8
MAINTAINER Jiri Stransky <jistr@jistr.com>

RUN dnf clean expire-cache && dnf -y update && dnf clean all

COPY build.sh /root/build.sh
RUN /root/build.sh

COPY files /

CMD ["/usr/local/bin/container-element-web"]
