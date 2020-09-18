#!/usr/bin/env bash

echo "Waiting for NetworkManager to start..."
/usr/bin/nm-online --wait-for-startup

echo "Waiting for network connection for 5s."
/usr/bin/nm-online --timeout 10
NETWORK_STATUS=$?
echo "nm-online exit code: ${NETWORK_STATUS}"

# If NetworkManager is not connected, then run wifi-connect
if (( $NETWORK_STATUS > 0 ))
then
  echo "No internet connection."
  echo "Starting wifi-connect to create wifi access point..."
  cd /home/pi/wifi-connect-setup/
  # Start a password-protected wifi access point
  sudo wifi-connect \
       --portal-ssid "rpi-admin" \
       --portal-passphrase "wificonnect"
fi

echo "Internet connection established"
