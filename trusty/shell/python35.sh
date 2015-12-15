wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz
tar zxf Python-3.5.0.tgz
cd Python-3.5.0
./configure --disable-ipv6 --prefix=/opt/Python-3.5.0
make
sudo make install
