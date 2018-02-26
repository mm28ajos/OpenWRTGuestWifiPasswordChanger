#!/bin/ash
GUEST_WIFI_SSID="ssid"

PWD=`head /dev/urandom | tr -dc "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX!.,+#?*%&/()=" | head -c15`

# # assumes that guest wifi has id 2
if [ `uci get wireless.@wifi-iface[2].ssid` = $GUEST_WIFI_SSID ]; then
  uci set wireless.@wifi-iface[2].key=$PWD
  uci commit wireless
  wifi
  QR_WIFI_STRING="WIFI:S:$GUEST_WIFI_SSID;T:WPA2;P:$PWD;;"
  qrencode -t svg -l h -o /www/general-cgi-resources/current_guest_wifi_pw_andorid_qr.svg $QR_WIFI_STRING
fi

