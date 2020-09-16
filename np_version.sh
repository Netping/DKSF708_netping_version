#!/bin/sh

PROJECT_NAME="DKSF708"
MAJOR_VERSION="1"
MINOR_VERSION="0"
DEVICE_NAME="NetPing SMS708"
OPENWRT_VERSION="19"
BUILD_VERSION_FILE="/etc/build_ver"
CONFIG_PARAMS="dhcp, ssh, luci"

display_info() {
  echo "Project name: $PROJECT_NAME"
  echo "Project version: $MAJOR_VERSION.$MINOR_VERSION"
  echo "Device name: $DEVICE_NAME"
  echo "OpenWrt version: $OPENWRT_VERSION"
  if test -f "$BUILD_VERSION_FILE"; then
    build_ver=$(cat "$BUILD_VERSION_FILE")
    echo "Build version: $build_ver"
  else
    echo "Build version: not found!"
  fi
  echo "Configuration parameters: $CONFIG_PARAMS"
}
