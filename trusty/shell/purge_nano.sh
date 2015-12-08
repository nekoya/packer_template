#
# Set vim as default editor and purge nano
#
if dpkg -l | grep nano >/dev/null;then
    apt-get purge -y nano
    rm /etc/alternatives/editor
    ln -s /usr/bin/vim /etc/alternatives/editor
fi
