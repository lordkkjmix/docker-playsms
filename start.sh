#!/bin/bash
. `pwd`.env

cd /app

INSTALLCONF="./install.conf"

. $INSTALLCONF


echo 'ENABLESSL' $ENABLESSL

# ========================================
# DO NOT CHANGE ANYTHING BELOW THIS LINE #
# UNLESS YOU KNOW WHAT YOU'RE DOING      #
# ========================================


echo -n "Start"
echo -n .
mkdir -p /etc $PATHBIN
echo -n .
touch /etc/playsmsd.conf
echo -n .
echo "PLAYSMS_PATH=\"$PATHWEB\"" > /etc/playsmsd.conf
echo "PLAYSMS_LIB=\"$PATHLIB\"" >> /etc/playsmsd.conf
echo "PLAYSMS_BIN=\"$PATHBIN\"" >> /etc/playsmsd.conf
echo "PLAYSMS_LOG=\"$PATHLOG\"" >> /etc/playsmsd.conf
echo "DAEMON_SLEEP=\"1\"" >> /etc/playsmsd.conf
echo "ERROR_REPORTING=\"E_ALL ^ (E_NOTICE | E_WARNING)\"" >> /etc/playsmsd.conf
echo -n .
cp -rR daemon/linux/bin/playsmsd.php $PATHBIN/playsmsd
chmod +x $PATHBIN/playsmsd
echo -n .
echo "end"
echo
$PATHBIN/playsmsd check
sleep 3
echo
$PATHBIN/playsmsd start
sleep 3
echo
$PATHBIN/playsmsd status
sleep 3
echo

echo
echo "playSMS has been started on your system"
echo

cp install.conf install.conf.backup >/dev/null 2>&1

echo

exit 0
