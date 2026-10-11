# OrangeFox X6886

Unofficial OrangeFox device tree + GitHub Actions builder in a single repository.

| Device | `X6886` (Infinix) |
|---|---|
| Platform | MT6789 |
| Firmware | Android 16 |

## Layout

| Path | Purpose |
|---|---|
| `.github/workflows/Build.yml` | Builder. Syncs the OrangeFox manifest, then copies **this repo** to `DEVICE_PATH` (no device-tree clone). |
| `tools/` | `unpack_vendor_boot.py`, `make_vendor_boot.py` (swap only the recovery fragment of a stock `vendor_boot.img`). |
| `recovery/root/lib/modules/` | Stock kernel modules + `modules.load/.dep/.alias/.softdep`. `touch/` holds recovery-only touch modules. |
| `prebuilt/dtb` | Prebuilt DTB. |
| `patches/` | Source patches applied by `vendorsetup.sh`. |

## Build

1. Fork this repository.
2. `Actions` > `Build Orangefox` > `Run workflow`. Manifest inputs (`SYNC_URL`, `MANIFEST_BRANCH`) stay as before; `DEVICE_PATH` defaults to `device/infinix/X6886`.
3. The image is published as a pre-release together with `SHA256SUMS.txt`.

```
fastboot flash vendor_boot OrangeFox-X6886-<date>-vendor_boot.img
```

Back up before flashing.
