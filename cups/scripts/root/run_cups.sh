#!/bin/sh
set -e
set -x

/usr/sbin/avahi-daemon --daemonize
/root/printer-update.sh &
exec /usr/sbin/cupsd -f
