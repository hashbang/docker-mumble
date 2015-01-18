chown -R mumble /var/lib/mumble-server

SUPW=`pwgen -c -n -1 15`

echo "Superuser Password: $SUPW"

exec sudo -u mumble murmurd -ini /etc/mumble-server.ini -supw $SUPW
