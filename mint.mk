#
# Copyright (C) 2011 The CyanogenMod Project
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
#

# Inherit the blue-common definitions
$(call inherit-product, device/sony/blue-common/blue.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/mint/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Configuration scripts
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/flashled_calc_parameters.cfg:system/etc/flashled_calc_parameters.cfg \
   $(LOCAL_PATH)/config/sensors.conf:system/etc/sensors.conf \
   $(LOCAL_PATH)/prebuilt/pre_hw_config.sh:system/etc/pre_hw_config.sh \
   $(LOCAL_PATH)/prebuilt/hw_config.sh:system/etc/hw_config.sh

# USB function switching
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/init.sony.usb.rc:root/init.sony.usb.rc

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab \
   $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

# Recovery bootstrap (device-specific part)
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/recovery/bootrec-device:root/sbin/bootrec-device \
   $(LOCAL_PATH)/recovery.fstab:root/recovery.fstab

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/clearpad.idc:system/usr/idc/clearpad.idc \
   $(LOCAL_PATH)/config/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
   $(LOCAL_PATH)/config/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
   $(LOCAL_PATH)/config/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
   $(LOCAL_PATH)/config/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl \
   $(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/sony/mint/mint-vendor.mk)
