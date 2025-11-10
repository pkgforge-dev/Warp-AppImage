# Warp-AppImage

WIP

## Known quirks

- QR code camera scanning doesn't work.  
  Application requires the freedesktop camera portal for scanning the QR code. Old distros don't have this and some new ones, but it doesn't work even on distros which have it.
- If portable `.config` and `.home` directory is used, app fails to detect `XDG_DOWNLOAD_DIR` when receiving the file.  
  This part should be patched to handle it:  
  https://gitlab.gnome.org/World/warp/-/blob/main/src/ui/fs.rs#L11-20  
