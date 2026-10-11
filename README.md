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
fastboot flash vendor_boot OrangeFox-X6886-<date>-vendor_boot.img
