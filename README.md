# OpenWRTGuestWifiPasswordChanger
Some scripts to change a wifi's, e.g. guest wifi, password aka PSK on OpenWrt via uci, e.g. every night, and to display the random password via CGI in browser with QR-Code.

## Dependencies
Install 'qrencode' package.
```
opkg update
opkg install qrencode
```
## Copy Files
Move change script of wifi e.g. to /root. Move CGI script to /www/cgi-bin/

```
mv scripts/ChangeGuestWifiPW.sh /root
mv cgi/guestpw /www/cgi-bin/
```

## Create Folder for Resources (QR-Code)
```
mkdir /www/general-cgi-resources
```
## Add Cronjob
For example, add a cronjob changing the PSK every night at 4 a.m.
```
0 4 * * * /root/ChangeGuestWifiPW.sh >/dev/null 2>&1
```

Finally, modify the id and ssid of your guest wifi in the ChangeGuestWifiPW.sh script and access your guest PSK page by http(s)://xxx.xxx.xxx.xxx/cgi-bin/guestpw
