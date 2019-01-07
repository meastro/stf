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
	|| OwnError "####### Failed to add Node.js PPA"

echo "Installing Node.js"
sudo apt-get install nodejs \
	|| OwnError "####### Failed to install Node.js"

echo "Checking Node.js Version"
node -v \
	|| OwnError "####### Failed to check Node.js version"

# ADB
echo "Installing ADB"
sudo apt-get install adb \
	|| OwnError "####### Failed to install ADB"

# RethinkDB
echo "Installing RethinkDB"
source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list \
	|| OwnError "####### Failed to add RethinkDB PPA Source "

echo "Installing PPA Key"
wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -a \
	|| OwnError "####### Failed to add RethinkDB PPA Key"

echo "Updating Package Repository"
sudo apt-get update \
	|| OwnError "####### Failed to update package repository"

echo "Installing RethinkDB"
sudo apt-get install rethinkdb \
	|| OwnError "####### Failed to install RethinkDB"

#GraphicsMagick
echo "Installing GraphicsMagick"
sudo apt-get install graphicsmagick \
	|| OwnError "####### Failed to Install GraphicsMagick"

#ZeroMq
echo "add Zeromq repository"
echo "deb http://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/ ./" | sudo tee /etc/apt/sources.list.d/zeromq.list \
	|| OwnError "####### Failed to setup repository"

wget https://download.opensuse.org/repositories/network:/messaging:/zeromq:/release-stable/Debian_9.0/Release.key -O- | sudo apt-key add
sudo apt-get install libzmq3-dev \
        || OwnError "####### Failed to install Zeromq libraries"
