chown -R mumble: /var/lib/mumble-server

touch /var/lib/mumble-server

SUPW=`pwgen -c -n -1 15`

echo "Superuser Password: $SUPW"

#exec sumurmurd -ini /etc/mumble-server.ini -supw $SUPW
#exec sudo -u mumble murmurd -ini /etc/mumble-server.ini -fg

/usr/sbin/murmurd -supw $SUPW
/usr/sbin/murmurd -fg

#/usr/bin/murmurd -ini /etc/mumble-server.ini -fg
#murmurd -ini /etc/mumble-server.ini -supw $SUPW -fg
#/usr/sbin/murmurd -fg -supw $SUPW

