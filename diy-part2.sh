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
if [ "${1}" = "X86" ]; then
  echo "IP_ADDRESS=192.168.5.1" >> $GITHUB_ENV
  sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
else
  echo "IP_ADDRESS=192.168.8.1" >> $GITHUB_ENV
  sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate
fi    


# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# 清除默认登录密码
sed -i 's/$1$5mjCdAB1$Uk1sNbwoqfHxUmzRIeuZK1:0/:/g' package/base-files/files/etc/shadow

# ttyd 自动登录
sed -i "s?/bin/login?/usr/libexec/login.sh?g" package/feeds/packages/ttyd/files/ttyd.config

# 添加自定义软件包
# echo '
# CONFIG_PACKAGE_luci-app-mosdns=y
# CONFIG_PACKAGE_luci-app-adguardhome=y
# CONFIG_PACKAGE_luci-app-openclash=y
# ' >> .config

# 移除网卡驱动
sed -i 's/CONFIG_PACKAGE_kmod-ath=y/CONFIG_PACKAGE_kmod-ath=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-ath10k=y/CONFIG_PACKAGE_kmod-ath10k=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-board-qca9888=y/CONFIG_PACKAGE_ath10k-board-qca9888=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-board-qca988x=y/CONFIG_PACKAGE_ath10k-board-qca988x=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-board-qca9984=y/CONFIG_PACKAGE_ath10k-board-qca9984=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca9888=y/CONFIG_PACKAGE_ath10k-firmware-qca9888=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca988x=y/CONFIG_PACKAGE_ath10k-firmware-qca988x=n/' .config
sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca9984=y/CONFIG_PACKAGE_ath10k-firmware-qca9984=n/' .config

sed -i 's/CONFIG_PACKAGE_iw=y/CONFIG_PACKAGE_iw=n/' .config
sed -i 's/CONFIG_PACKAGE_iwinfo=y/CONFIG_PACKAGE_iwinfo=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-iwlwifi=y/CONFIG_PACKAGE_kmod-iwlwifi=n/' .config
sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax101=y/CONFIG_PACKAGE_iwlwifi-firmware-ax101=n/' .config
sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax200=y/CONFIG_PACKAGE_iwlwifi-firmware-ax200=n/' .config
sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax201=y/CONFIG_PACKAGE_iwlwifi-firmware-ax201=n/' .config
sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax210=y/CONFIG_PACKAGE_iwlwifi-firmware-ax210=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8192c-common=y/CONFIG_PACKAGE_kmod-rtl8192c-common=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8192cu=y/CONFIG_PACKAGE_kmod-rtl8192cu=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8192de=y/CONFIG_PACKAGE_kmod-rtl8192de=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8192se=y/CONFIG_PACKAGE_kmod-rtl8192se=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8812au-ct=y/CONFIG_PACKAGE_kmod-rtl8812au-ct=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8821ae=y/CONFIG_PACKAGE_kmod-rtl8821ae=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtl8xxxu=y/CONFIG_PACKAGE_kmod-rtl8xxxu=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi=y/CONFIG_PACKAGE_kmod-rtlwifi=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=y/CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-pci=y/CONFIG_PACKAGE_kmod-rtlwifi-pci=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-usb=y/CONFIG_PACKAGE_kmod-rtlwifi-usb=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-rtw88=y/CONFIG_PACKAGE_kmod-rtw88=n/' .config

sed -i 's/CONFIG_PACKAGE_kmod-mt7915e=y/CONFIG_PACKAGE_kmod-mt7915e=n/' .config

sed -i 's/CONFIG_PACKAGE_kmod-mt7921-common=y/CONFIG_PACKAGE_kmod-mt7921-common=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-mt7921-firmware=y/CONFIG_PACKAGE_kmod-mt7921-firmware=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-mt7921e=y/CONFIG_PACKAGE_kmod-mt7921e=n/' .config
sed -i 's/CONFIG_PACKAGE_kmod-mt7921u=y/CONFIG_PACKAGE_kmod-mt7921u=n/' .config
