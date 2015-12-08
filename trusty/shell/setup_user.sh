# setup vagrant user
install -d -m 700 /home/vagrant/.ssh
wget -qO- https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
echo 'StrictHostKeyChecking no' > /home/vagrant/.ssh/config
chown -R vagrant:vagrant /home/vagrant/.ssh

echo '%vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

usermod -aG docker vagrant
