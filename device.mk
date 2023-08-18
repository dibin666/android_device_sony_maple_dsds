### PLATFORM
$(call inherit-product, device/sony/yoshino-common/platform.mk)
### PROPRIETARY VENDOR FILES
$(call inherit-product, vendor/sony/maple_dsds/maple_dsds-vendor.mk)
### WPS
$(call inherit-product-if-exists, device/xiaomi/wps/config.mk)

ifeq ($(WITH_FDROID),true)
$(call inherit-product, vendor/fdroid/fdroid-vendor.mk)
endif

DEVICE_PATH := device/sony/maple_dsds

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

include $(DEVICE_PATH)/device/*.mk
