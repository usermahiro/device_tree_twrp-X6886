# OrangeFox X6886

Unofficial OrangeFox device tree.

| Device | `X6886` (Infinix) |
|---|---|
| Platform | MT6789 |
| Firmware | 145SP08 |
| Android | Android 16 |

## Layout

| Path | Purpose |
|---|---|
| `.github/workflows/Build.yml` | Builder. Syncs the OrangeFox manifest, then copies **this repo** to `DEVICE_PATH` (no device-tree clone). |
| `tools/` | `unpack_vendor_boot.py`, `make_vendor_boot.py` (swap only the recovery fragment of a stock `vendor_boot.img`). |
| `prebuilt/modules/` | Stock platform kernel modules (`.ko`) + `modules.load/.dep/.alias/.softdep` for vendor ramdisk. |
| `prebuilt/dtb` | Prebuilt DTB. |
| `recovery/root/lib/modules/touch/` | Recovery touch modules loaded via init rc. |
| `patches/` | Source patches applied by `vendorsetup.sh`. |

## Build

1. Fork this repository.
2. `Actions` > `Build Orangefox` > `Run workflow`. Manifest inputs (`SYNC_URL`, `MANIFEST_BRANCH`) stay as before; `DEVICE_PATH` defaults to `device/infinix/X6886`.
3. The image is published as a pre-release together with `SHA256SUMS.txt`.

```bash
fastboot flash vendor_boot_a OrangeFox-X6886-<date>-<sha>-vendor_boot.img
fastboot flash vendor_boot_b OrangeFox-X6886-<date>-<sha>-vendor_boot.img
```

Flash both slots: the device is A/B, so a single slot loses the recovery when the other slot becomes active.

## SELinux

The enforcing recovery patches are dropped; the recovery uses the stock policy. `common/mt6789-vendor16/sepolicy/` is not compiled and is kept only for reference.
