FROM quay.io/toolbx-images/archlinux-toolbox

# Create temp user for unpriveledged operations
RUN useradd --no-create-home --shell=/bin/false build && usermod -L build && echo "build ALL = NOPASSWD: /usr/bin/pacman" >> /etc/sudoers 

# Copy package lists
COPY *.pkg /tmp/

# Upgrade packages
RUN \
	pacman -Syu --noconfirm
RUN \
	while IFS= read -r pkg; do pacman -S --verbose --noconfirm $pkg; done < /tmp/pacman.pkg
# Copy scripts
COPY ./scripts/ /tmp/scripts

# Install yay as temp user and install packages
RUN mkdir -p /home/build/{.gnupg,.config/pacman} && chown -R build:users /home/build
USER build
RUN \
	bash /tmp/scripts/install_yay.sh
RUN \
	while IFS= read -r pkg; do yay -S --noconfirm $pkg; done < /tmp/yay.pkg

USER root
# Install pipx packages
RUN \
	while IFS= read -r pkg; do PIPX_HOME=/opt/pipx PIPX_BIN_DIR=/usr/local/bin pipx install $pkg; done < /tmp/pipx.pkg


# Install npm packages
RUN \
	while IFS= read -r pkg; do npm install -g $pkg; done < /tmp/npm.pkg

# Delete temp user
RUN userdel build
