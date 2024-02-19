<h1 align="center">
	datblygiad
</h1>

[![Publish image](https://github.com/CaderIdris/datblygiad/actions/workflows/build.yml/badge.svg)](https://github.com/CaderIdris/datblygiad/actions/workflows/build.yml)

---

## Table of Contents

1. [Summary](##summary)
2. [Packages](##packages)
    1. [Utility](###utility)
    1. [Programming Languages](###programming-languages)
    1. [Documents](###documents)
    1. [Customisation](###customisation)
    1. [Containers](###containers)

---

## Summary

Datblygiad (EN: development) is an Arch Linux based container designed to be used in a development environment.
It installs multiple packages from the Arch repositories, PyPI (via pipx) and npm.
It also uses packages from the AUR by using yay.
It is intended to be used with distrobox but can be used as a docker or podman container as well.

---

## Packages

### Utility

|Name|Repository|Use|
|---|---|---|
|neovim|pacman|Text editor|
|zsh|pacman|Shell|
|tmux|pacman|Add tabs to terminal|
|curl|pacman|Download files using command line|
|git|pacman|Version control|
|bat|pacman|Display text files in terminal with formatting|
|exa|pacman|Replacement for ls|
|npm|pacman|Download packages from npm|
|ripgrep|pacman|Replacement for grep|
|lf|pacman|CLI file browser|
|libnotify|pacman|Sends notifications to host|
|python-pipx|pacman|Package manager for PyPI|
|tldr|pacman|Short man pages|
|ctags|pacman|Used to get tags from scripts|
|unixodbc|pacman|ODBC drivers|
|bottom|pacman|CLI process/system monitor with graphs|
|zathura|pacman|PDF viewer|
|zathura-pdf-poppler|pacman|PDF plugin for Zathura|
|kitty|pacman|Terminal|
|sqlitebrowser|pacman|View sqlite files|
|direnv|pacman|Automatically loads environmental variables from whitelisted .env files when switching directories in terminal|
|just|pacman|Alternative to make|
|ruff-lsp|pacman|LSP for python linting|
|nushell|pacman|Alternative shell, great for reading data files|
|zoxide|pacman|Terminal navigation|
|jq|pacman|Parses json files|
|yq|pacman|Parses yaml, toml and xml files|
|qemu-full|pacman|VM backend|
|samba|pacman|File sharing|
|vscodium-bin|aur|Open version of VSCode|
|azure-cli|aur|Interact with azure services from CLI|
|azure-functions-core-tools-bin|aur|Build, test and publish azure functions from CLI|
|msodbcsql17|aur|SQL Server driver|
|ctpv-git|aur|Image previews for lf|
|quickgui-bin|aur|VM manager|
|asciinema|PyPI|Record terminal to file for playback|
|cookiecutter|PyPI|Create directories with templates|
|pipenv|PyPI|Python virtual environments with built-in dependency management|
|jrnl|PyPI|Simple journal app for command line|
|termtosvg|PyPI|Output terminal to svg file|
|azurite|npm|Emulate azure storage|

### Programming Languages

|Name|Repository|Use|
|---|---|---|
|python|pacman|Python|
|rustup|pacman|Rust|
|lua|pacman|Lua|
|powershell-bin|aur|Powershell scripting language|
|processing|aur|Processing 4 + IDE|
|python39|pacman|Python 3.9|
|python310|pacman|Python 3.10|
|python312|pacman|Python 3.12|

## Documents
|Name|Repository|Use|
|---|---|---|
|texlive-meta|pacman|LaTeX and multiple packages|
|biber|pacman|LaTeX reference tool|
|pandoc|pacman|Text file converter|
|pandoc-crossref|pacman|Cross reference filter|
|jabref-bin|aur|Bibliography manager|
|@marp-team/marp-cli|npm|Presentations from markdown files|
|markdown-preview|npm|Show markdown file in browser|
|browser-sync|npm|Host html file locally|

### Customisation

|Name|Repository|Use|
|---|---|---|
|starship|pacman|Shell prompt|
|figlet|pacman|Text to ascii art|
|chezmoi|pacman|Manage dotfiles|
|neofetch|pacman|Display system info|
|lolcat|pacman|Colour text in terminal|
|cowsay|pacman|Style text in terminal|
|ttf-linux-libertine|pacman|Libertine font for LaTeX|
|otf-comicshanns-nerd|pacman|ComicShanns font for terminal|
|ttf-jetbrains-mono-nerd|pacman|JetBrains Mono font for LaTeX/terminal|
|toilet|aur|Text to coloured ascii art|


### Containers

|Name|Repository|Use|
|---|---|---|
|docker|pacman|Docker commands. Will not work in container, communicates with host|
|docker-buildx|pacman|Docker-buildx commands. Will not work in container, communicates with host|
|podman|pacman|Podman commands. Will not work in container, communicates with host|




