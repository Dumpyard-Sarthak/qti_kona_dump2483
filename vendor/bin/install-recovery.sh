#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:e81208824eb9330c3e616dd206cd4621bc7c8639; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:3467dccf61f668d9a2544a80f92c17490930f1a5 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:e81208824eb9330c3e616dd206cd4621bc7c8639 && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
