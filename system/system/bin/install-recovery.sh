#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:c67d2a46574abfb623d14faf8667591da6a7b612; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:dae9c162311e64dbb6cfe03d8c6afff6bde1938c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:c67d2a46574abfb623d14faf8667591da6a7b612 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
