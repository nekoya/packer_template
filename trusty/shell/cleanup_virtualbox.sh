# Virtualbox
mount -o loop VBoxGuestAdditions.iso /media/cdrom
sh /media/cdrom/VBoxLinuxAdditions.run
umount /media/cdrom
rm VBoxGuestAdditions.iso

# APT cleaning
apt-get -y autoremove
apt-get clean

# remove dhcp leases
rm /var/lib/dhcp/*

# cleaning up udev rules
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
