# Warp-AppImage

WIP

## Known quirks

- QR code camera and screenshot scanning only works if camera and screenshot portal is installed on the host.
- If portable `.config` and/or `.home` directory is used, app fails to detect `XDG_DOWNLOAD_DIR` when receiving the file.  
  This part should be patched to handle it:  
  https://gitlab.gnome.org/World/warp/-/blob/main/src/ui/fs.rs#L11-20  
