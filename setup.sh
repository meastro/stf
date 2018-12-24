
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install git htop apt-transport-https docker docker-compose

sudo echo "deb https://deb.torproject.org/torproject.org stretch main" >> /etc/apt/sources

gpg2 --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
gpg2 --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -

apt-get update
apt install tor deb.torproject.org-keyring
