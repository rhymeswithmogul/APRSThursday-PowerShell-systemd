#!/bin/sh
install -m 0755 Send-APRSThursdayCheckin.ps1 /usr/local/bin
install -m 0644 aprs-thursday.service /etc/systemd/system/
install -m 0644 aprs-thursday.timer /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now aprs-thursday.timer
