#!/bin/ash
CHANGE=0
SSID="ssid"
GUEST_NETWORK_NAME="guest"
PWD=`head /dev/urandom | tr -dc "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX!.,+#?*%&/()=" | head -c15`

if [ `uci get wireless.@wifi-iface[2].network` = $GUEST_NETWORK_NAME ]; then
  uci set wireless.@wifi-iface[2].key=$PWD
  CHANGE=1
fi
if [ $CHANGE -eq 1 ]; then
  uci commit wireless
  wifi
  QR_WIFI_STRING="WIFI:S:$SSID;T:WPA2;P:$PWD;;"
  qrencode -t svg -l h -o /path/to/file/current_guest_wifi_pw_andorid_qr.svg $QR_WIFI_STRING
  echo $PWD > /path/to/file/CurrentGuestPW.txt
fi

