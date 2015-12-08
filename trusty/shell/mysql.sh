#
# MySQL
#
echo "*** Install MySQL ***"

# install
echo "mysql-server-5.6 mysql-server/root_password password dbdbdb" | debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password dbdbdb" | debconf-set-selections
apt-get install -y mysql-server-5.6 libmysqlclient-dev

# apparmor settings prepare for MySQL on tmpfs
sed -i "/\/var\/lib\/mysql\/\*\* rwk,/a\ \ /run/shm/mysql/ r,\n\ \ /run/shm/mysql/** rwk," /etc/apparmor.d/usr.sbin.mysqld

# my.cnf for development
cat <<EOF > /etc/mysql/conf.d/dev.cnf
[mysqld]
character-set-server=utf8
max_connections = 2048
sql_mode = TRADITIONAL,NO_AUTO_VALUE_ON_ZERO

[mysql]
default-character-set=utf8

[client]
default-character-set=utf8
EOF

# root .my.cnf
cat <<EOF > /root/.my.cnf
[client]
password = dbdbdb
EOF

# apply config
service mysql restart

# create operation account
mysql -pdbdbdb -e 'grant create, select, insert, update, delete, alter, drop, index, lock tables, process, show databases, replication client on *.* to admin identified by "dbdbdb"'

# .my.cnf
cat <<EOF > /home/vagrant/.my.cnf
[client]
user = admin
password = dbdbdb
EOF
chown vagrant:vagrant /home/vagrant/.my.cnf
