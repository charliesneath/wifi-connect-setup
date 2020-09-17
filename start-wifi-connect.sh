#!/usr/bin/env bash

echo "Waiting for NetworkManager to start..."
/usr/bin/nm-online --wait-for-startup

echo "Waiting for network connection for 5s."
/usr/bin/nm-online --timeout 10
NETWORK_STATUS=$?
echo "nm-online exit code: ${NETWORK_STATUS}"

if (( $NETWORK_STATUS > 0 ))
then
  echo "No internet connect, starting wifi-connect to create access point..."
  cd /home/pi/wifi-connect/
  sudo wifi-connect --portal-ssid "rpi-admin"
fi

echo "Internet connection established"
