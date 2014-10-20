CUR_PATH := device/rockchip/rk31board/bluetooth/common

ifeq ($(strip $(BLUETOOTH_USE_BPLUS)),true)
PRODUCT_PACKAGES += \
	libbt-client-api \
	com.broadcom.bt \
	com.broadcom.bt.xml
endif

PRODUCT_COPY_FILES += \
    device/rockchip/rk31board/bluetooth/common/realtek/bt/firmware/rtl8723au/rtk8723a:system/etc/firmware/rtk8723a \
    device/rockchip/rk31board/bluetooth/common/realtek/bt/firmware/rtl8723au/rtk8723_bt_config:system/etc/firmware/rtk8723_bt_config \
    device/rockchip/rk31board/bluetooth/common/lib/modules_smp/rtk_btusb.ko:system/lib/modules/rtk_btusb.ko \
    device/rockchip/rk31board/bluetooth/common/lib/vendor/lib/libbt-vendor.so:system/vendor/lib/libbt-vendor.so \
    device/rockchip/rk31board/bluetooth/common/lib/vendor/lib/libbt-vendor-rtl.so:system/vendor/lib/libbt-vendor-rtl.so

BT_FIRMWARE_FILES := $(shell ls $(CUR_PATH)/lib/firmware)
PRODUCT_COPY_FILES += \
    $(foreach file, $(BT_FIRMWARE_FILES), $(CUR_PATH)/lib/firmware/$(file):system/vendor/firmware/$(file))

include device/rockchip/rk31board/bluetooth/common/console_start_bt/console_start_bt.mk

