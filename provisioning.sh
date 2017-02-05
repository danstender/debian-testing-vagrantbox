#!/bin/sh

# build guest additions

apt-get install -y linux-headers-$(uname -r) build-essential
mount /home/vagrant/VBoxGuestAdditions.iso -o loop /mnt
cd /mnt
sh VBoxLinuxAdditions.run --nox11
# cat /var/log/VBoxGuestAdditions.log

# supply SSH starter key

if [ ! -d /home/vagrant/.ssh ]; then
    mkdir -p /home/vagrant/.ssh
    chown vagrant:vagrant /home/vagrant/.ssh;
fi

if [ ! -f /home/vagrant/.ssh/authorized_keys ]; then
    wget --no-check-certificate https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub \
         -O /home/vagrant/.ssh/authorized_keys
    chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys;
fi

# create sudo access

echo "vagrant ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers
