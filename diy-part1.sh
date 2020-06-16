#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

#1. Modify default IP
sed -i 's/192.168.1.1/192.168.1.10/g' openwrt/package/base-files/files/bin/config_generate