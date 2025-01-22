FROM archlinux:latest

LABEL summary="Datblygiad (EN: development) is an Arch Linux based container designed to be used in a development environment. It installs multiple packages from the Arch repositories, PyPI (via pipx) and npm. It also uses packages from the AUR by using yay. It is intended to be used with distrobox but can be used as a docker or podman container as well." \
	usage="To be used with distrobox" \
	version="1.0" \
	org.opencontainers.image.description="Datblygiad (EN: development) is an Arch Linux based container designed to be used in a development environment. It installs multiple packages from the Arch repositories, PyPI (via pipx) and npm. It also uses packages from the AUR by using yay. It is intended to be used with distrobox but can be used as a docker or podman container as well."

RUN pacman-key --init

# Copy files lists
COPY files/ /

# Upgrade packages
RUN \
	pacman -Syu --verbose --noconfirm && pacman -S --verbose --noconfirm sudo base-devel yq git
	# sudo is needed to run yay build and aur package installs as build user
	# base-devel needed to build aur packages 
	# yq is installed to parse the packages.yml file
	# git needed to install yay

RUN \
	bash /tmp/scripts/install_packages.sh
