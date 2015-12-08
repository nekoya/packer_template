#
# Set timezone (default:JST)
#
TZ=${1:-"Asia/Tokyo"}
echo "$TZ\n" > /etc/timezone
/usr/sbin/dpkg-reconfigure -f noninteractive tzdata
