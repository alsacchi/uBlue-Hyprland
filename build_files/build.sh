#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1
dnf5 -y copr enable lionheartp/Hyprland
# this installs a package from fedora repos
dnf5 install -y \
    hyprland \
    xdg-desktop-portal-hyprland \
    hyprpolkitagent \
    greetd \
    tuigreet \
    kitty \
    zsh \
    thunar \
    zathura \
    zathura-pdf-poppler \
    imv \
    mpv \
    waybar \
    wofi \
    mako \
    wl-clipboard \
    tmux

dnf5 -y copr disable lionheartp/Hyprland
# Enabling services
systemctl enable greetd.service
