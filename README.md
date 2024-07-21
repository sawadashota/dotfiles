# .files

## Donwload

Download zip file from GitHub, then place it in `~/.config` directory.

## NixOS

### Installation

https://nixos.org/download/

```
sh <(curl -L https://nixos.org/nix/install)
```

Install home-manager

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

### Set Up brew

1. set up XCode
2. install brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Brew Packages

```bash
brew install --cask 1password 1password-cli cmd-eikana google-japanese-ime firefox google-chrome iterm2 slack visual-studio-code zoom jetbrains-toolbox figma keybase
```

## asdf

```bash
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

asdf plugin add python
asdf install python latest
asdf global python latest

asdf plugin add yarn
asdf install yarn latest
asdf global yarn latest
```
