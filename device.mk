# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# default is nosdcard, S/W button enabled in resource
DEVICE_PACKAGE_OVERLAYS := device/rockchip/rk31board/overlay
PRODUCT_CHARACTERISTICS := tablet
BLUETOOTH_USE_BPLUS := true
BOARD_CODEC_RT5631 := true
BOARD_BP_AUTO := true

# Copy prebuilt apps
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/app,system/app)

# Copy prebuilt bins
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/bin,system/bin)

# Copy prebuilt etcs
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/etc,system/etc)

# Copy prebuilt init.d scripts
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/etc/init.d,system/etc/init.d)

# Copy prebuilt ppp files
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/etc/ppp,system/etc/ppp)

# Copy prebuilt usb_modeswitch.d files
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/etc/usb_modeswitch.d,system/etc/usb_modeswitch.d)


# Copy Vendor firmware
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/etc/firmware,system/etc/firmware)

# Copy prebuilt hw libs
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/lib/hw,system/lib/hw)

# Copy prebuilt egl libs
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/lib/egl,system/lib/egl)

# Copy every prebuilt libs
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/lib,system/lib)

# Copy prebuilt modules
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/lib/modules,system/lib/modules)

# Copy keylayouts
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/usr/keylayout,system/usr/keylayout)

# Copy touchscreen idcs
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/prebuilt/usr/idc,system/usr/idc)

# Copy temporary use prebuilt files for HW-Acceleration
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/hw_acc,system/lib)

# Copy ramdisk files
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/ramdisk,root)

# copy Rktools
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk31board/rktools,rktools)

# copy the builder 
PRODUCT_COPY_FILES += \
	device/rockchip/rk31board/custom_boot.sh:custom_boot.sh

# These are the hardware-specific feature permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

# Bluetooth
#BT_FIRMWARE_FILES := $(shell ls $(LOCAL_PATH)/bluetooth/firmware)
#PRODUCT_COPY_FILES += \
#   $(foreach file, $(BT_FIRMWARE_FILES), $(LOCAL_PATH)/bluetooth/firmware/$(file):system/vendor/firmware/$(file))

#RODUCT_COPY_FILES += \
#	system/bluetooth/data/main.nonsmartphone.le.conf:system/etc/bluetooth/main.conf\
#        $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Build.prop 
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Europe/Berlin \
    persist.sys.language=de \
    persist.sys.country=DE \
    ro.sf.lcd_density=264 \
    ro.sf.lcdc_composer=1 \
    ro.sf.fakerotation=false \
    ro.sf.hwrotation=0 \
    ro.camera.front.orientation=0 \
    ro.camera.back.orientation=0 \
    ro.rk.systembar.voiceicon=true \
    ro.kernel.android.checkjni=0 \
    persist.sys.ui.hw=true \
    sys.hwc.compose_policy=0 \
    ro.opengles.version=131072 \
    hwui.render_dirty_regions=false \
    qemu.hw.mainkeys=0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    persist.sys.usb.config=mass_storage

# Camera
PRODUCT_PACKAGES += \
    Camera \
    camera.rk30board

# Audio
PRODUCT_PACKAGES += \
   	audio.primary.default \
	audio.primary.rk30board \
	audio_policy.default \
	tinyplay \
   	tinycap \
    tinymix \
	audio.a2dp.default \
    audio.usb.default \
    libtinyalsa \
    libaudioutils

# Hal modules
PRODUCT_PACKAGES += \
	lights.rk30board \
   	power.rk30board \
    sensors.rk30board

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# VPU Libs
PRODUCT_PACKAGES += \
	libapedec \
	libjpeghwdec \
	libjpeghwenc \
	libOMX_Core \
	libomxvpu_dec \
	libomxvpu_enc \
	librk_demux \
	librkwmapro \
	libffmpeg \
	librk_on2 \
        libvpu

# Filesystem management tools    
PRODUCT_PACKAGES += \
        make_ext4fs \
        setup_fs \
        static_busybox \
        utility_make_ext4fs \
        libstagefrighthw

# Fix for dalvik-cache
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-data-only=1

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        service.adb.root=1 \
        ro.secure=0 \
        ro.allow.mock.location=1 \
        ro.debuggable=1 \
        persist.sys.usb.config=mtp

# charger
PRODUCT_PACKAGES += \
	charger \
#	charger_res_images

# Copy other charger images
#PRODUCT_COPY_FILES += \
#	$(call find-copy-subdir-files,*,device/rockchip/rk31board/ramdisk/res/images/charger,root/res/images/charger)

# 3G
PRODUCT_PACKAGES += \
    rild \
    chat \
    Mms \
    Stk

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=true

PRODUCT_PROPERTY_OVERRIDES += \
                ril.function.dataonly=0
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath1=/system/lib/libreference-ril-mt6229.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath2=/system/lib/libreference-ril-mu509.so 
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath4=/system/lib/libreference-ril-mw100.so 
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath6=/system/lib/libreference-ril-sc6610.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath7=/system/lib/libreference-ril-m51.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath8=/system/lib/libreference-ril-mt6250.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath9=/system/lib/libreference-ril-c66a.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath10=/system/lib/libreference-ril-sew290.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath11=/system/lib/libreference-ril-u5501.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath12=/system/lib/libreference-ril-u7501.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath14=/system/lib/libreference-ril-a85xx.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath15=/system/lib/libreference-ril-e1230s.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild1.libpath=/system/lib/libreference-ril-sc6610-1.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild3.libpath=/system/lib/libril-rk29-dataonly.so
    ADDITIONAL_DEFAULT_PROPERTIES += rild.libpath13=/system/lib/libreference-ril-aw706.so
# End 3G

# Bluetooth
include device/rockchip/rk31board/bluetooth/common/rk30_bt.mk

# android core stuff
$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base.mk)

