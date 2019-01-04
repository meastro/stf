#/bin/bash


function OwnError()
{
	echo -e "[ 'date' ] $(tput setaf1)$@$(tput sgr0)"
	exit $2
}

# Node JS Install - LTS PPA
echo "LETS INSTALL NODE JS - LTS PPA"
echo "Adding Node.js PPA"
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash - \
	|| OwnError "Failed to add Node.js PPA"

echo "Installing Node.js"
sudo apt-get install nodejs \
	|| OwnError "Failed to install Node.js"

echo "Checking Node.js Version"
node -v \
	|| OwnError "Failed to check Node.js version"

# ADB
echo "Installing ADB"
sudo apt-get install adb \
	|| OwnError "Failed to install ADB"
#########################################################################
#
# THIS SECTION COMMENTED OUT UNTIL RETHINKDB HAS AN PACKAGE FOR BIONIC
#
## RethinkDB
#echo "Installing RethinkDB"
#source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list \
#	|| OwnError "Failed to add RethinkDB PPA Source "

#echo "Installing PPA Key"
#wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -a \
#	|| OwnError "Failed to add RethinkDB PPA Key"

#echo "Updating Package Repository"
#sudo apt-get update \
#	|| OwnError "Failed to update package repository"

#echo "Installing RethinkDB"
#sudo apt-get install rethinkdb \
#	|| OwnError "Failed to install RethinkDB"
#
#  END COMMENTED OUT SECTION
########################################################################

# Rethink DB
echo "Installing RethinkDB FROM SOURCE"
echo "Installing dependencies"
sudo apt-get install build-essential protobuf-compiler python libprotobuf-dev libcurl4-openssl-dev libboost-all-dev libncurses5-dev libjemalloc-dev wget m4 \
	|| OwnError "Failed to install dependencies"

echo "Retrieve RethinkDB Source Code"
sudo wget wget https://download.rethinkdb.com/dist/rethinkdb-2.3.6.tgz -O /usr/local/src/rethinkdb-2.3.6.tgz
cd /usr/local/src
sudo tar -xf rethinkdb-2.3.6.tgz
cd /usr/local/src/rethinkdb-2.3.6
sudo ./configure --allow-fetch
sudo make
sudo make install

#GraphicsMagick
echo "Installing GraphicsMagick"
sudo apt-get install graphicsmagick \
	|| OwnError "Failed to Install GraphicsMagick"

#ZeroMq
echo "add Zeromq repository"
echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/ ./" >> /etc/apt/sources.list \
	|| OwnError "Failed to setup repository"

wget https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/Release.key -O- | sudo apt-key add
apt-get install libzmq3-dev
