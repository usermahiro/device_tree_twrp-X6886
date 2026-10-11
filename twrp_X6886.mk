#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Alias: `lunch twrp_X6886-*` tetap jalan. Isi lengkap ada di fox_X6886.mk.
$(call inherit-product, device/infinix/X6886/fox_X6886.mk)

# Product Specifics
PRODUCT_NAME := twrp_X6886
PRODUCT_DEVICE := X6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6886
PRODUCT_MANUFACTURER := INFINIX

PRODUCT_GMS_CLIENTID_BASE := android-transsion
