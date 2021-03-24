#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:102760448:01f35d49a83bc6b9582ad48c4dd8490d4825a18f; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/spmfw:34288:2bb4772163710333684e90af0c31dbd8017c2f86 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:102760448:01f35d49a83bc6b9582ad48c4dd8490d4825a18f && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
