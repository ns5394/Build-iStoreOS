#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改openwrt登陆地址,把下面的 192.168.10.1 修改成你想要的就可以了
# sed -i 's/192.168.100.1/192.168.8.1/g' package/base-files/files/bin/config_generate

if [ "${{ matrix.ARCHITECTURE }}" = "X86" ]; then
  echo "IP_ADDRESS=192.168.5.1" >> $GITHUB_ENV
  sed -i 's/192.168.100.1/192.168.5.1/g' package/base-files/files/bin/config_generate
else
  echo "IP_ADDRESS=192.168.8.1" >> $GITHUB_ENV
  sed -i 's/192.168.100.1/192.168.8.1/g' package/base-files/files/bin/config_generate
  exit 1
fi    


# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# 清除默认登录密码
sed -i 's/$1$5mjCdAB1$Uk1sNbwoqfHxUmzRIeuZK1:0/:/g' package/base-files/files/etc/shadow

# ttyd 自动登录
sed -i "s?/bin/login?/usr/libexec/login.sh?g" package/feeds/packages/ttyd/files/ttyd.config

# 更改分区大小
sed -i 's/^CONFIG_TARGET_KERNEL_PARTSIZE.*/CONFIG_TARGET_KERNEL_PARTSIZE=32/' .config
sed -i 's/^CONFIG_TARGET_ROOTFS_PARTSIZE.*/CONFIG_TARGET_ROOTFS_PARTSIZE=480/' .config


# 添加自定义软件包
# echo '
# CONFIG_PACKAGE_luci-app-mosdns=y
# CONFIG_PACKAGE_luci-app-adguardhome=y
# CONFIG_PACKAGE_luci-app-openclash=y
# ' >> .config
