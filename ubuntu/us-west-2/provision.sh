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
# Pull down jpegleg repos - uncomment to check out copies of the jpegleg repos in the AMI (example)
#git clone https://github.com/jpegleg/jpegleg-lib
#cd jpegleg-lib
#bash clone.sh
sudo systemctl enable ssh
sudo systemctl restart ssh

# WARNING: ufw to be enabled separately "ufw enable; ufw reload" as enable and reload don't actually work correctly here so far
# When ufw is enabled, the rules are there at least.

# Design note: enforce ufw with a state enforcing mechanism (daemon, agent, function, etc)
