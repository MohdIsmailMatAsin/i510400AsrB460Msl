# Hackintosh: Intel i5 10400 & Asrock B460M Steel Legend

![Last Update](https://img.shields.io/badge/Last_Update_(yy/mm/dd):-22.03.16-blueviolet.svg)

<p align="center"><img width="698" alt="Screen Shot 2022-03-16 at 9 32 33 PM" src="https://user-images.githubusercontent.com/72515939/158737697-36fe343e-f013-4342-bfa7-d1e3b46c2866.png"></p>

## Information

**Processor:**

- [Intel® Core™ i5-10400 Processor](https://ark.intel.com/content/www/us/en/ark/products/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz.html)

**Motherboard:**

- [Asrock B460M Steel Legend](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/)

**DGPU:**

- [MSI Radeon RX 5500 XT Mech OC 4GB](https://www.msi.com/Graphics-Card/radeon-rx-5500-xt-mech-4g-oc)

**IGPU:**

- [Intel® UHD Graphics 630](https://ark.intel.com/content/www/us/en/ark/products/graphics/126790/intel-uhd-graphics-630.html)

**Additional PCI Card:**

- [Intel® Wireless AC 9620](https://www.intel.com/content/www/us/en/products/sku/99445/intel-wirelessac-9260/specifications.html)
- [VL805/806 xHCI USB 3.0 Controller](https://www.via-labs.com/product_show.php?id=48)

**Memory:**

- [PNY XLR8 Gaming Epic-X RGB DDR4 Memory 3200MHz](https://www.pny.com.tw/en/products-detail/XLR8-DDR4-3200MHz-Desktop-Memory-32GB/)

**Storage:**

| Value | Disk Type | Product | Size |
| --- | --- | --- | --- |
| 2   | M.2 NVMe | [Kingston A2000 NVMe (500GB)](https://shopee.com.my/Kingston-A2000-NV1-NVMe-PCIe-Gen-3x4-M.2-2280-Internal-Solid-State-Drives-SSD-SA2000-SNVS-(250GB-500GB-1TB-2TB)-i.15417888.1248954996) | 500 GB |
| 1   | M.2 NVMe | [Silicon Power PS5013 E13 NVMe](https://shopee.com.my/Silicon-Power-NVMe-PCIe-Gen3x4-M.2-2280-SSD-(256GB-512GB-1TB)-A80-P34-Solid-State-Drives-i.137317911.2095142026) | 500 GB |
| 1   | SATA SSD | [San Disk SSD Plus](https://www.westerndigital.com/en-ap/products/internal-drives/sandisk-ssd-plus-sata-iii-ssd) | 480 GB |
| 1   | SATA SSD | [San Disk SSD Plus](https://www.westerndigital.com/en-ap/products/internal-drives/sandisk-ssd-plus-sata-iii-ssd) | 240 GB |
| 2   | SATA HDD | [Western Digital WDC WD5000AAKX-001CA0](https://products.wdc.com/library/SpecSheet/ENG/2879-701277.pdf) | 500 GB |
| 1   | SATA HDD | [Hitachi HDT721016SLA380](https://www.hdsentinel.com/storageinfo_details.php?lang=en&model=HITACHI%20HDT721016SLA380) | 160 GB |

**OS Tested:**

- [x] **Catalina** require `Mindate:-1` , `MinVersion:-1` and `SetApfsTrimTimeout:-1`
  
- [x] **BigSur** require `Mindate:0` , `MinVersion:0` and `SetApfsTrimTimeout:-1`
  
- [x] **Monterey** require `Mindate:0` , `MinVersion:0` and `SetApfsTrimTimeout:0`

**Current OS**

- [x] **macOS Monterey** v 12.2
- [x] **Windows 11**

**Remark:**
Separate Drive OS. 

**Dual boot requirement:** 
- `UpdateSMBIOSMode` = Custom
- `CustomSMBIOSGuid` = True

**SMBIOS:**

- [x] `iMac19,2`

**OpenCore v0.7.9:**

```tree
EFI
├── BOOT
│   └── BOOTx64.efi
└── OC
    ├── ACPI
    │   └── SSDT-Mac.aml
    ├── Drivers
    │   ├── HfsPlus.efi
    │   ├── OpenCanopy.efi
    │   └── OpenRuntime.efi
    ├── Kexts
    │   ├── AirportItlwm.kext
    │   ├── AppleALC.kext
    │   ├── BlueToolFixup.kext
    │   ├── IntelBluetoothFirmware.kext
    │   ├── Lilu.kext
    │   ├── LucyRTL8125Ethernet.kext
    │   ├── RadeonSensor.kext
    │   ├── SMCProcessor.kext
    │   ├── SMCRadeonGPU.kext
    │   ├── SMCSuperIO.kext
    │   ├── USBMap.kext
    │   ├── VirtualSMC.kext
    │   └── WhateverGreen.kext
    ├── OpenCore.efi
    ├── Resources
    │   ├── Audio
    │   ├── Font
    │   ├── Image
    │   │   └── Acidanthera
    │   │       ├── Chardonnay
    │   │       ├── GoldenGate
    │   │       └── Syrah
    │   └── Label
    ├── Tools
    │   └── CleanNvram.efi
    └── config.plist
```

### 1.0 - SSDT

<p align="justify">The SSDT I use is a combination of various sources from SSDTTime. Thanks to CorpNewt SSDTTime for the easy process. The entire SSDT has been merged into one file i.e. `SSDT-Mac.aml`. There are also several other sources of properties that are injected to reduce the kext workload. As example, renaming `GFX0` to an `IGPU` that goes through `Whatevergreen.kext`. The following is a list of devices that have been injected with specific properties.</p>

| Device | Information |
| --- | --- |
| AWAC | To fix the `System Clocks` found on newer hardware |
| ALS0 | Not needed. However, real `iMac` have these device properties. **Patch:** smc-als and AppleLMUController`) |
| PLUG | To allow the kernel's `XCPM / XNU's CPU Power Management` to manage CPU's power management |
| EC  | Fake Embedded Controller / EC drivers since `CML` don't have native support EC |
| MCHC | Come with `SBUS` patch to aids with correct temperature, fan, voltage, ICH, etc readings and proper memory reporting |
| GFX0 | `Dedicated Graphic Processor Unit / DGPU`.  This `SSDT` contain all `Navi 14` patch information. **Patch:** `ATY,Keelback` framebuffer and `CFG,CFG_USE_AGDC` properties to overcome wake issue using `DGPU`, `_SUN` information |
| HDAU | `High Definition Audio` through `HDMI` patch. `_SUN` information is added to reveal proper `slot number` |
| HDEF | `High Definition Audio System / HDAS` in actual `DSDT`, renamed with `HDEF` . **Patch:**`layout id/data/01000000` which is equal to `alcid=1` |
| PMCR | Classed as `Memory Controller` and known as `PPMC` in `Comet Lake (CML)` platform. This `SSDT` renamed `PPMC` as `PMCR` with compatible `AppleIntelPCHPMC` support `pci8086,a2a1`, which is identical to `CML` `pci8086,a3a1` |
| TSUB | `Thermal Subsystem` rename which is not identical using `ioreg`. Rename `pci8086,a3b1` to `TSUB` |
| XHC1 | Rename PCIe`Comet Lake PCH-V USB Controller` device as `XHC` to `XHC1` .** Patch:** `acpi-wake-type` to overcome wake issue using USB device. |
| ARPT | Rename `RP03,PXSX` to `RP03,ARPT` and adding `_SUN` information to reveal proper `slot number` |
| RTL0 | Rename `RTL8125 2.5GbE Controller` device as `RP04,PXSX` to `RP04,RTL0` |
| XHC0 | Rename `ASM2142 USB 3.1 Host Controller` device as `RP05,PXSX` to `RP05,XHC0`. **Patch:** `acpi-wake-type` to overcome wake issue using USB device. |
| ANS0 | Rename `RP09,PXSX` to `RP09,ANS0`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` with additional`_SUN` information,  to reveal proper `slot number` |
| ANS1 | Rename `RP20,PXSX` to `RP20,ANS1`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` with additional`_SUN` information,  to reveal proper `slot number` |
| ANS2 | Rename `RP21,PXSX` to `RP21,ANS2`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` with additional`_SUN` information,  to reveal proper `slot number` |
| SATA | Rename SATA to SAT0 with additional information. **Patch:** Spoof `400 Series Chipset Family SATA AHCI Controller` to `Intel 11 Series Chipset Controler` |
| SBUS | Fix `AppleSMBus` support in macOS.  i.e: `AppleSMBusController`, `AppleSMBusPCI`, `Memory Reporting` and `etc` |
| USBX | To supply `USB Power Properties` for Skylake and newer motherboard generation. |

#### 1.1 - SSDT-Mac.aml

**Refer:**  [SSDT-Mac.aml](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-Mac.dsl)

### 2.0 - Config.plist

<p align="justify">My config.plist is based on the selected hardware. Suitability is dependent on SMBIOS. Quirk selected was according to Intel 10th Gen suitability at random</p>

**Refer:**  [config.plist](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config.plist)

### 3.0 - Kernel Extension

| Kext | Information |
| --- | --- |
| Lilu | `Arbitrary kext` and `process patching` on macOS |
| VirtualSMC | `System Management Controller` (SMC) emulator layer |
| AppleALC | An `open source kernel extension` enabling `native macOS HD audio` for `not officially supported codecs` without any filesystem modifications |
| Whatevergreen | `Various patches` necessary for certain `ATI`/`AMD`/`Intel`/`Nvidia` GPUs |
| SMCProcessor | Additional support for `VirtualSMC`. Used for monitoring `CPU` temperature |
| SMCSuperIO | Additional support for `VirtualSMC`. Used for monitoring `FAN` speed |
| SMCRadeonGPU | Based on `FakeSMCs`, `RadeonMonitor` to provide `GPU` temperature to a dedicated gadget `without relying` on `FakeSMC` being installed and can therefore be used with `VirtualSMC` instead |
| RadeonSensor | To read the `GPU` temperature. `Lilu` is required. |
| LucyRTL8125Ethernet | `Realtek RTL8125 2.5GBit Ethernet Controllers` driver |
| AirportItlwm | An `Intel Wi-Fi Adapter` Kernel Extension for macOS, based on the OpenBSD Project |
| IntelBluetoothFirmware | `Kext` that uploads `Intel Wireless Bluetooth Firmware` to provide `native Bluetooth` in macOS. The firmware binary files are from the `Linux Open Source Project` |
| BluetoolFixup | Apple `macOS Monterey` has changed parts of the `Bluetooth` stack from `kernel-space` to `user-space`. Note: Required when bluetooth not working properly in macOS 12. |
| USBMap | Kext to `route` selected `USB ports`. This is `compulsory to handle` `15 port limit` requirements by macOS. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool) |

### 4.0 - Results

<p align="center"><img width="697" alt="Screen Shot 2022-03-16 at 9 40 10 PM" src="https://user-images.githubusercontent.com/72515939/158741247-7cd3bdbd-b9a0-4e50-8e4b-4e90b99229f1.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-03-16 at 9 43 08 PM" src="https://user-images.githubusercontent.com/72515939/158739299-acd27c5b-839d-4d6c-a335-19d976a5cf79.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-03-16 at 9 42 41 PM" src="https://user-images.githubusercontent.com/72515939/158741435-7b7c9766-6b27-4ece-9999-60219a1bdba7.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-03-16 at 9 42 44 PM" src="https://user-images.githubusercontent.com/72515939/158741452-0d41a713-3016-46bf-ba13-641527e07ded.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-03-16 at 9 42 48 PM" src="https://user-images.githubusercontent.com/72515939/158741714-49368356-88bb-4164-8952-8d3d0ba9f2bb.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-03-16 at 9 42 34 PM" src="https://user-images.githubusercontent.com/72515939/158741848-92e75717-5809-4926-b713-7c02031bba1f.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-03-16 at 9 42 22 PM" src="https://user-images.githubusercontent.com/72515939/158741814-ada8ec4c-3f7f-4d25-9d72-1c47c3d425dc.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-03-16 at 9 42 15 PM" src="https://user-images.githubusercontent.com/72515939/158741829-37f15929-4436-44d7-9b2c-453ff1d5763f.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-03-16 at 9 42 28 PM" src="https://user-images.githubusercontent.com/72515939/158748040-f6dee057-1cef-4355-bd89-01a0d56d504b.png"></p>

<p align="center"><img width="1238" alt="Screen Shot 2022-03-16 at 9 41 50 PM" src="https://user-images.githubusercontent.com/72515939/158748760-32d5342c-edba-4c30-9ed6-60d3a8876857.png"></p>

<p align="center"><img width="656" alt="Screen Shot 2022-03-16 at 9 39 01 PM" src="https://user-images.githubusercontent.com/72515939/158748806-ad730a31-19e9-4049-afa9-201b44dd0cd3.png"></p>

<p align="center"><img width="656" alt="Screen Shot 2022-03-16 at 9 38 48 PM" src="https://user-images.githubusercontent.com/72515939/158748838-43b831dd-f8c8-4f7b-829e-636d6f4a40e7.png"></p>

<p align="center"><img width="1157" alt="Screen Shot 2022-03-16 at 9 39 50 PM" src="https://user-images.githubusercontent.com/72515939/158748867-55531a1c-0af1-428e-847d-2613b2fa233a.png"></p>

### 5.0 - BIOS/UEFI Settings

- Disable `CSM/ Enable UEFI`
- Disable `Secure Boot`
- Set SATA as `AHCI` (Do not install macOS through RST)
- Disable `CFG Lock`
- Disable `Fast Boot`
- Disable `Intel Virtualization Technology`
- Disable `VT-D`
- Enable` XHCI Hand-off`
- Disable `Legacy USB Support` (If Needed)

Copyright : `MohdIsmailMatAsin`

Date : `24 Feb 2022`

# Acknowledgements

I would like to thanks all folks in Hackintosh Community, [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for great guide, [Acidanthera](https://github.com/acidanthera) for great work, [CorpNewt](https://github.com/corpnewt) for great tools, [Hackintosh Malaysia](https://www.facebook.com/groups/HackintoshMalaysia/about/) for great knowledge sharing, [r/Hackintosh](https://www.reddit.com/r/hackintosh/) for great undocumented refereces, [daliansky](https://github.com/daliansky) for great ACPI method, [5T33Z0](https://github.com/5T33Z0/OC-Little-Translated) for translating daliansky work. Thanks a lot Community! 
