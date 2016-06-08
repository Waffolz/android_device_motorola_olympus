# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/motorola/olympus/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := olympus
TARGET_BOARD_PLATFORM_GPU := tegra
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t20
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_CPU_VARIANT := tegra2
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true

#Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/motorola/olympus/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/motorola/olympus/recovery/recovery_ui.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
#TARGET_PREBUILT_RECOVERY_KERNEL :=
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_SCREEN_WIDTH:=540
TARGET_SCREEN_HEIGHT:=960
DEVICE_RESOLUTION := 540x960

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
TARGET_BOOTANIMATION_USE_RGB565 := true

# Kernel configuration for inline building
TARGET_KERNEL_CONFIG := tegra_olympus_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/olympus/
#TARGET_PREBUILT_KERNEL := vendor/motorola/olympus/kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800

#storage
TARGET_NO_KERNEL := false
TARGET_NO_BOOT := false
TARGET_NO_RECOVERY := false
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_JANKY_BACKBUFFER := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8355840
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 407772160
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_VOLD_MAX_PARTITIONS := 19
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

#UMS, MTP
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun0/file

# WiFi
BOARD_LEGACY_NL80211_STA_EVENTS:=true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/vendor/firmware/fw_bcmdhd.bin nvram_path=/system/etc/nvram.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/vendor/firmware/fw_bcmdhd_apsta.bin nvram_path=/system/etc/nvram.txt"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/vendor/firmware/fw_bcmdhd_p2p.bin"
-include hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/motorola/olympus/config/bluetooth/vnd_olympus.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/motorola/olympus/config/bluetooth
BOARD_BLUETOOTH_LIBBT_VNDCFG := device/motorola/olympus/config/bluetooth/bt_vendor.conf
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := true

#EGL
BOARD_EGL_CFG := device/motorola/olympus/config/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_GL_VENDOR_EXTENSIONS := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_NEEDS_FNW := true
BOARD_EGL_NEEDS_LEGACY_FB := true
MAX_EGL_CACHE_KEY_SIZE := 4096
MAX_EGL_CACHE_SIZE := 2146304
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_EGL_SKIP_FIRST_DEQUEUE := true

#Camera
USE_CAMERA_STUB := true
BOARD_VENDOR_USE_NV_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DHAVE_ISO -DNEEDS_VECTORIMPL_SYMBOLS

#Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_AUDIO_LEGACY := true
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB
TARGET_PROVIDES_LIBAUDIO := false
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
BOARD_OMX_NEEDS_LEGACY_AUDIO := true
USE_LEGACY_AUDIO_POLICY := 1

#Ril
BOARD_MOBILEDATA_INTERFACE_NAME := "ppp0"


BOARD_USE_MOTO_DOCK_HACK := true
COMMON_GLOBAL_CFLAGS += -DMOTOROLA_UIDS -DDISABLE_HW_ID_MATCH_CHECK -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL -DREFBASE_JB_MR1_COMPAT_SYMBOLS -DALLOW_DISABLE_SELINUX=1


BOARD_SKIP_ANDROID_DOC_BUILD := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
