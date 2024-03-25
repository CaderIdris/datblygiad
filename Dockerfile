FROM quay.io/toolbx-images/archlinux-toolbox

LABEL summary="Datblygiad (EN: development) is an Arch Linux based container designed to be used in a development environment. It installs multiple packages from the Arch repositories, PyPI (via pipx) and npm. It also uses packages from the AUR by using yay. It is intended to be used with distrobox but can be used as a docker or podman container as well." \
	usage="To be used with distrobox" \
	version="1.0" \
	org.opencontainers.image.description="Datblygiad (EN: development) is an Arch Linux based container designed to be used in a development environment. It installs multiple packages from the Arch repositories, PyPI (via pipx) and npm. It also uses packages from the AUR by using yay. It is intended to be used with distrobox but can be used as a docker or podman container as well."

# Create temp user for unpriveledged operations
RUN \
	cp /etc/sudoers /tmp/sudoers && \
	useradd --no-create-home --shell=/bin/false build && \
	usermod -L build && \
	echo "build ALL = NOPASSWD: /usr/bin/pacman" >> /etc/sudoers 

# Copy files lists
COPY files/ /

# Upgrade packages
RUN \
	pacman -Syu --noconfirm
RUN \
	while IFS= read -r pkg; do pacman -S --verbose --noconfirm $pkg; done < /tmp/packages/pacman.pkg

# Install yay as temp user and install packages
RUN mkdir -p /home/build/{.gnupg,.config/pacman} && chown -R build:users /home/build
USER build
RUN \
	bash /tmp/scripts/install_yay.sh
RUN \
	while IFS= read -r pkg; do yay -S --noconfirm $pkg; done < /tmp/packages/yay.pkg

USER root
# Install pipx packages
RUN \
	while IFS= read -r pkg; do PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx install $pkg; done < /tmp/packages/pipx.pkg


# Install npm packages
RUN \
	while IFS= read -r pkg; do npm install -g $pkg; done < /tmp/packages/npm.pkg

# Delete temp user
RUN \
	userdel build && \
	mv /tmp/sudoers /etc/sudoers
