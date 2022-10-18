#!/usr/bin/env bash
# template/reference for ubuntu jammy that includes java and python support

sudo apt-get -y update || exit 1
sudo apt-get install ufw tcpdump vim apparmor openssl gnupg2 -y || exit 1
sudo apt-get update # update again...
sudo apt-get install openjdk-11-jre haproxy docker.io docker-compose git python3-venv -y || exit 1
sudo /usr/sbin/ufw enable 
sudo /usr/sbin/ufw default allow outgoing
sudo /usr/sbin/ufw default deny incoming
sudo /usr/sbin/ufw allow 22/tcp
sudo /usr/sbin/ufw allow 443/tcp
yes | sudo systemctl enable ufw
# If we reload too quickly after the above, it will fail...
# it still might fail to enable and reload ufw.
# I am also having a separate program enforce ufw, not included here.
sleep 2
yes | sudo /usr/sbin/ufw reload
# Pull down jpegleg repos
git clone https://github.com/jpegleg/jpegleg-lib
cd jpegleg-lib
bash clone.sh
sudo systemctl enable ssh
sudo systemctl restart ssh
