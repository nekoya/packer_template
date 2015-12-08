cat <<EOF >> /etc/sysctl.conf
net.core.somaxconn = 4096
net.ipv6.conf.all.disable_ipv6 = 1
EOF
sysctl -p
