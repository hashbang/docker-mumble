FROM debian:jessie

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        mumble-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd mumble

ADD bitlbee.conf /etc/bitlbee/bitlbee.conf
ADD stunnel.conf /etc/stunnel/stunnel.conf
ADD run.sh /tmp/run.sh

VOLUME /var/lib/mumble-server

EXPOSE 64738

# Default command to run on boot

CMD ["bash","/tmp/run.sh"]
