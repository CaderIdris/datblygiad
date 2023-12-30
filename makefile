.DEFAULT_GOAL := build

build:
	podman build . -t datblygiad
	distrobox create --image datblygiad --name datblygiad --home ~/Containers/datblygiad/
	distrobox enter --no-workdir datblygiad -e tmux
