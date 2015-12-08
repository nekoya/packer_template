ntpdate ntp.nict.jp
apt-get install -y ntp

cat <<EOF > /etc/ntp.conf
tinker panic 0
driftfile /var/lib/ntp/ntp.drift

statistics loopstats peerstats clockstats
filegen loopstats file loopstats type day enable
filegen peerstats file peerstats type day enable
filegen clockstats file clockstats type day enable

restrict -4 default kod notrap nomodify nopeer noquery
restrict -6 default kod notrap nomodify nopeer noquery

restrict 127.0.0.1

server ntp.nict.jp
EOF


# allow running ntpd on container
rm /etc/apparmor.d/usr.sbin.ntpd

service ntp restart
