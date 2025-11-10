# Warp-AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/pkgforge-dev/Warp-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/pkgforge-dev/Warp-AppImage/releases/latest)
[![CI Build Status](https://github.com//pkgforge-dev/Warp-AppImage/actions/workflows/blank.yml/badge.svg)](https://github.com/pkgforge-dev/Warp-AppImage/releases/latest)

* [Latest Stable Release](https://github.com/pkgforge-dev/Warp-AppImage/releases/latest)

---

AppImage made using [sharun](https://github.com/VHSgunzo/sharun), which makes it extremely easy to turn any binary into a portable package without using containers or similar tricks. 

**This AppImage bundles everything and should work on any linux distro, even on musl based ones.**

It is possible that this appimage may fail to work with appimagelauncher, I recommend these alternatives instead: 

* [AM](https://github.com/ivan-hc/AM) `am -i warp` or `appman -i warp`

* [dbin](https://github.com/xplshn/dbin) `dbin install warp.appimage`

* [soar](https://github.com/pkgforge/soar) `soar install warp`

This appimage works without fuse2 as it can use fuse3 instead, it can also work without fuse at all thanks to the [uruntime](https://github.com/VHSgunzo/uruntime)

<details>
  <summary><b><i>raison d'être</i></b></summary>
    <img src="https://github.com/user-attachments/assets/d40067a6-37d2-4784-927c-2c7f7cc6104b" alt="Inspiration Image">
  </a>
</details>

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)

---

## Known quirks

- QR code camera and screenshot scanning for the receiver only works if the camera and screenshot freedesktop portal is installed on the host (same as upstream).
- If portable `.config` and/or `.home` directory is used, app fails to detect `XDG_DOWNLOAD_DIR` when receiving the file.  
  This part should be patched to handle it:  
  https://gitlab.gnome.org/World/warp/-/blob/main/src/ui/fs.rs#L11-20  
  - Meanwhile, without those 2 portable folders, only `${XDG_CONFIG_HOME}/warp/config.json` would be made on the host, which you can delete after the app uninstallation.
