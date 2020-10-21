#!/bin/sh

SETTINGS_FILE="/etc/config/netping-settings"
BUILD_VERSION_FILE="/etc/build_ver"

if test -f "$BUILD_VERSION_FILE"; then
  build_ver=$(cat "$BUILD_VERSION_FILE")
  uci set netping-settings.software.build_time=$build_ver
  uci commit
else
  uci set netping-settings.software.build_time="unknown"
  uci commit
fi

if [ $# -eq 0 ]; then
  exit 0
fi

if [ "$1" == "--init" ]; then
  #option device_serial_num '0000001'
  serial_num=$(head -c 2 /dev/random | hexdump -e '16/1 "%04d""\n"')
  uci set netping-settings.hardware.device_serial_num=$serial_num
  uci commit
else
  echo "Unknown command line argument!"
fi

