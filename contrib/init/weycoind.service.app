# It is not recommended to modify this file in-place, because it will
# be overwritten during package upgrades. If you want to add further
# options or overwrite existing ones then use
# $ systemctl edit weycoind.service
# See "man systemd.service" for details.

# Note that almost all daemon options could be specified in
# /etc/weycoin/weycoin.conf

[Unit]
Description=Weycoin daemon
After=network.target

[Service]
ExecStart=/usr/bin/weycoind -daemon -conf=/etc/weycoin/weycoin.conf -pid=/run/weycoind/weycoind.pid
# Creates /run/weycoind owned by weycoin
RuntimeDirectory=weycoind
User=weycoin
Type=forking
PIDFile=/run/weycoind/weycoind.pid
Restart=on-failure
PrivateTmp=true

[Install]
WantedBy=multi-user.target
