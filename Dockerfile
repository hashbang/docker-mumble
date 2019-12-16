ARG DEBIAN_DIGEST=sha256:fea737064e4143c3400289f76d759d6a98a69c308032022ef34e31e01555ca97
ARG DEBIAN_VERSION=buster-slim
FROM debian:${DEBIAN_VERSION}@${DEBIAN_DIGEST}

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        mumble-server=1.3.0~git20190125.440b173+dfsg-2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd mumble -m -d /home/mumble
ADD mumble-server.ini  /home/mumble/.murmurd/murmur.ini

USER mumble
WORKDIR /home/mumble
RUN touch /home/mumble/mumble.log /home/mumble/mumble.sqlite
EXPOSE 64738/tcp 64738/udp
ENTRYPOINT ["/usr/sbin/murmurd"]
CMD ["-fg"]
