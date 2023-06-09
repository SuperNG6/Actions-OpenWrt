#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i '$a src-git openclash https://github.com/vernesong/OpenClash' feeds.conf.default
git clone https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design


# 修改内核为4.19
# sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_TESTING_PATCHVER:=5.10/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
