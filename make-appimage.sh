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
quick-sharun /usr/bin/warp

## Copy help files for Help section to work
langs=$(find /usr/share/help/*/warp/ -type f | awk -F'/' '{print $5}' | sort | uniq)
for lang in $langs; do
  mkdir -p ./AppDir/share/help/$lang/warp/
  cp -vr /usr/share/help/$lang/warp/* ./AppDir/share/help/$lang/warp/
done

# Turn AppDir into AppImage
quick-sharun --make-appimage
