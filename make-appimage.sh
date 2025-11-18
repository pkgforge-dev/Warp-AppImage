#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q warp | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/app.drey.Warp.svg
export DESKTOP=/usr/share/applications/app.drey.Warp.desktop
export DEPLOY_OPENGL=1
export DEPLOY_PIPEWIRE=1 # For camera portal
export STARTUPWMCLASS=warp # For Wayland, this is 'app.drey.Warp', so this needs to be changed in desktop file manually by the user in that case until some potential automatic fix exists for this

# Trace and deploy all files and directories needed for the application (including binaries, libraries and others)
quick-sharun /usr/bin/warp \
             /usr/share/help/*/warp

# Turn AppDir into AppImage
quick-sharun --make-appimage
