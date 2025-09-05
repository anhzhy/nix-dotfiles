#!/usr/bin/env bash

SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME=$HOME
USERNAME=$(echo $USER)
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
ACTION="$(tput setaf 6)[ACTION]$(tput sgr0)"
RESET="$(tput sgr0)"

echo "Choose your device type:"
echo "1) Laptop"
echo "2) Desktop"
read -p "$ACTION Enter choice [1-2]: " OPTIONS

case $OPTIONS in
  1) DEVICE="laptop" ;;
  2) DEVICE="desktop" ;;
  *) echo "Error: Invalid choice" >&2; exit 1 ;;
esac

read -rp "$ACTION Enter Your New Hostname: " HOSTNAME
if [ -z "$HOSTNAME" ]; then
  echo -e "${ERROR} You Need To Enter Your Hostname${RESET}" >&2
  exit 1
else
  sudo nixos-generate-config --show-hardware-config > "$SOURCE/hosts/$DEVICE/hardware-configuration.nix" 2>/dev/null
  sed -i 's/username\s*=\s*"\([^"]*\)"/username = "'"$USERNAME"'"/' ./flake.nix 
  sed -i 's/hostname\s*=\s*"\([^"]*\)"/hostname = "'"$HOSTNAME"'"/' ./flake.nix
  git add .
fi

DOCUMENTS="Documents"
DOWNLOADS="Downloads"
MUSIC="Music"
PICTURES="Pictures"
VIDEOS="Videos"
WORKSPACE="Workspace"

mkdir -p ~/${DOCUMENTS}
mkdir -p ~/${DOWNLOADS}
mkdir -p ~/${MUSIC}
mkdir -p ~/${PICTURES}
mkdir -p ~/${VIDEOS}
mkdir -p ~/${WORKSPACE}

mkdir -p ~/${PICTURES}/wallpapers
cp -r assets/wallpapers/* ~/${PICTURES}/wallpapers

find ~/.config -type f -name '*.hm-backup' -exec rm -f {} +

sudo nixos-rebuild switch --flake $SOURCE/#"${DEVICE}"