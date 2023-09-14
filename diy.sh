#修改默认登录地址
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

#修改wifi信息
sed -i 's/OpenWrt/qqq/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/none/psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i '/psk2/a\set wireless.default_radio${devidx}.key='123456789'' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#添加定时重启插件
sed -i '/luci-lib-fs/a \	luci-app-autoreboot \\' include/target.mk
sed -i 's/option week '3'/option week '7'/g' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot
sed -i 's/option enable '0'/option enable '1'/g' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot

#关闭flow offload
sed -i 's/option syn_flood	1/option syn_flood	0/g' feeds/luci/applications/luci-app-autoreboot/root/etc/config/autoreboot

#添加主题
sed -i '/+luci-light/a \	++luci-theme-argon \\' feeds/luci/collections/luci/Makefile
