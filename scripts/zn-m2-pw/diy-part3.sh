#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part3.sh
# Description: OpenWrt DIY script part 3 (After Install feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

#修改版本信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt IPQ6000 ZN-M2 (build time: $(date +%Y%m%d))'/g"  package/base-files/files/etc/openwrt_release
# 替换golang版本为1.25
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang

# design修改proxy链接
sed -i -r "s#navbar_proxy = 'openclash'#navbar_proxy = 'passwall'#g" feeds/luci/themes/luci-theme-design/luasrc/view/themes/design/header.htm
#更新集客AC
rm -rf feeds/luci/applications/luci-app-gecoosac
rm -rf feeds/packages/net/gecoosac
#git clone https://github.com/lwb1978/openwrt-gecoosac
git clone https://github.com/laipeng668/luci-app-gecoosac
mv luci-app-gecoosac/luci-app-gecoosac feeds/luci/applications/luci-app-gecoosac
mv luci-app-gecoosac/gecoosac feeds/packages/net/gecoosac
rm -rf luci-app-gecoosac
