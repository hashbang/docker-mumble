#!/bin/sh
chown -R mumble: /var/lib/mumble-server

touch /var/lib/mumble-server


if [ -z "$SUPW" ]; then
    SUPW=`pwgen -c -n -1 15`
fi

echo "Superuser Password: $SUPW"

#exec sumurmurd -ini /etc/mumble-server.ini -supw $SUPW
#exec sudo -u mumble murmurd -ini /etc/mumble-server.ini -fg

/usr/sbin/murmurd -supw $SUPW
/usr/sbin/murmurd -fg

#/usr/bin/murmurd -ini /etc/mumble-server.ini -fg
#murmurd -ini /etc/mumble-server.ini -supw $SUPW -fg
#/usr/sbin/murmurd -fg -supw $SUPW

