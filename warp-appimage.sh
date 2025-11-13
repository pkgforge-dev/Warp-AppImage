#!/bin/sh

set -eux

ARCH="$(uname -m)"
VERSION="$(cat ~/version)"
SHARUN="https://raw.githubusercontent.com/pkgforge-dev/Anylinux-AppImages/refs/heads/main/useful-tools/quick-sharun.sh"

# Variables used by quick-sharun
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export OUTNAME=Warp-"$VERSION"-anylinux-"$ARCH".AppImage
export DESKTOP=/usr/share/applications/app.drey.Warp.desktop
export ICON=/usr/share/icons/hicolor/scalable/apps/app.drey.Warp.svg
export DEPLOY_OPENGL=1
export DEPLOY_PIPEWIRE=1 # For camera portal
export STARTUPWMCLASS=warp # For Wayland, this is 'app.drey.Warp', so this needs to be changed in desktop file manually by the user in that case until some potential automatic fix exists for this

# Trace and deploy all files and directories needed for the application (including binaries, libraries and others)
wget --retry-connrefused --tries=30 "$SHARUN" -O ./quick-sharun
chmod +x ./quick-sharun
./quick-sharun /usr/bin/warp

## Copy help files for Help section to work
langs=$(find /usr/share/help/*/warp/ -type f | awk -F'/' '{print $5}' | sort | uniq)
for lang in $langs; do
  mkdir -p ./AppDir/share/help/$lang/warp/
  cp -vr /usr/share/help/$lang/warp/* ./AppDir/share/help/$lang/warp/
done

# Make the AppImage with uruntime
./quick-sharun --make-appimage

# Prepare the AppImage for release
mkdir -p ./dist
mv -v ./*.AppImage* ./dist
mv -v ~/version     ./dist
