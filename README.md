# OrangeFox X6886

Unofficial OrangeFox device tree.

| Device | `X6886` (Infinix) |
|---|---|
| Platform | MT6789 |
| Firmware | 155P15 |
| Android | Android 16 |

## Layout

| Path | Purpose |
|---|---|
| `BoardConfig.mk`, `device.mk`, `system.prop`, `vendorsetup.sh` | Board config (incl. TWRP `TW_*` and OrangeFox `OF_*` flags), product packages + vendor ramdisk rules, build env + patch loader. |
| `fox_X6886.mk`, `AndroidProducts.mk` | Product makefile (`lunch fox_X6886-*`). |
| `create_pl_dev/` | Native module: preloader symlinks. |
| `patches/` | Source patches applied by `vendorsetup.sh`. |
| `prebuilt/` | `dtb` and `modules/` (stock `.ko` + `modules.load/.dep/.alias/.softdep` for the vendor ramdisk). |
| `recovery/root/` | Recovery ramdisk overlay: init rc, vintf, TEE blobs/firmware, `lib/modules/{touch,flashlight}`. |
| `recovery/root/first_stage_ramdisk/` | `fstab.mt6789` (default) and `fstab.mt6789lk` (LK variant, installed as `fstab.mt6789` by CI). |
| `tools/` | `unpack_vendor_boot.py`, `make_vendor_boot.py` (swap only the recovery fragment of a stock `vendor_boot.img`). Not copied by CI. |
| `.github/workflows/Build.yml` | Builder. Syncs the OrangeFox manifest, then copies **this repo** to `DEVICE_PATH` (no device-tree clone). |

## Build

1. Fork this repository.
2. `Actions` > `Build Orangefox` > `Run workflow`. Manifest inputs (`SYNC_URL`, `MANIFEST_BRANCH`) stay as before; `DEVICE_PATH` defaults to `device/infinix/X6886`.
3. CI builds two images (matrix): **default** and **LK** (`...-vendor_boot-LK.img`, for Fenrir-LKPatch users). Both are published as a pre-release together with `SHA256SUMS.txt`.

```bash
fastboot flash vendor_boot_a OrangeFox-X6886-<date>-<sha>-vendor_boot.img
fastboot flash vendor_boot_b OrangeFox-X6886-<date>-<sha>-vendor_boot.img
```

## Credits
1. Helper https://github.com/Andrikurn
And other contribute to this repo

## Donate for coffee
https://sociabuzz.com/hirateam
