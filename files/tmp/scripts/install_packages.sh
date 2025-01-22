#!/bin/bash

set -eou pipefail

PKGS_YML_PATH=/tmp/packages.yml

# PACMAN
echo "Installing packages from pacman"
PACMAN_PKG_GROUPS=$(yq -r '.pacman | keys | @sh' $PKGS_YML_PATH | tr -d \')

echo $PACMAN_PKG_GROUPS
for grp in $PACMAN_PKG_GROUPS
do
	echo "Group: ${grp}"
	packages=$(yq -r ".pacman.${grp} | keys | @sh"  $PKGS_YML_PATH | tr -d \'\")
	pacman -S --verbose --noconfirm $packages
done
echo "Pacman packages installed"
echo "---"

# NPM
echo "Installing packages from npm"
NPM_PKG_GROUPS=$(yq -r '.npm | keys | @sh' $PKGS_YML_PATH | tr -d \')
for grp in $NPM_PKG_GROUPS
do
	echo "Group: ${grp}"
	packages=$(yq -r ".npm.${grp} | keys | @sh"  $PKGS_YML_PATH | tr -d \'\")
	npm install -g $packages
done
echo "npm packages installed"
echo "---"

PYPI_PKG_GROUPS=$(yq -r '.pypi | keys | @sh' $PKGS_YML_PATH)
for grp in $PYPI_PKG_GROUPS
do
	echo "Group: ${grp}"
	packages=$(yq -r ".pypi.${grp} | keys | @sh"  $PKGS_YML_PATH | tr -d \'\")
	PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx install $packages
done
echo "PyPI packages installed"
echo "---"

AUR_PKG_GROUPS=$(yq -r '.aur | keys | @sh' $PKGS_YML_PATH)
# Create temporary build user to install yay
echo "Setting up build user"
cp /etc/sudoers /etc/sudoers.bak
useradd --no-create-home --shell=/bin/false build
usermod -L build
echo "build ALL = NOPASSWD: /usr/bin/pacman" >> /etc/sudoers
mkdir -p /home/build/{.gnupg,.config/pacman}
chown -R build:users /home/build

echo "Installing yay"
sudo -u build bash /tmp/scripts/install_yay.sh

echo "Installing packages from AUR"
for grp in $AUR_PKG_GROUPS
do
	echo "Group: ${grp}"
	packages=$(yq -r ".aur.${grp} | keys | @sh"  $PKGS_YML_PATH | tr -d \'\")
	sudo -u build yay -S --noconfirm $packages
done
echo "aur packages installed"

echo "Deleting build user"
userdel build
mv /etc/sudoers.bak /etc/sudoers
echo "---"

