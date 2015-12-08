echo 'APT::Get::force-yes "true";' > /etc/apt/apt.conf.d/90forceyes
apt-get install -y curl
