# Hackintosh: Intel i5 10400 & Asrock B460M Steel Legend

![Last Update](https://img.shields.io/badge/Last_Update_(yy/mm/dd):-22.03.16-blueviolet.svg)

## Hardware Information

**Processor:**

- [Intel® Core™ i5-10400 Processor](https://ark.intel.com/content/www/us/en/ark/products/199271/intel-core-i510400-processor-12m-cache-up-to-4-30-ghz.html)

**Motherboard:**

- [Asrock B460M Steel Legend](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/)

**DGPU:**

- [MSI Radeon RX 5500 XT Mech OC 4GB](https://www.msi.com/Graphics-Card/radeon-rx-5500-xt-mech-4g-oc)

**IGPU:**

- [Intel® UHD Graphics 630](https://ark.intel.com/content/www/us/en/ark/products/graphics/126790/intel-uhd-graphics-630.html)

**Additional PCI Card:**

- [BCM94360 WiFi & Bluetooth](https://shopee.com.my/product/328098260/8609545085?smtt=0.65290281-1648740799.9) + [Mini PCIe to M.2 Adapter](https://s.lazada.com.my/s.ewFm4)
- [ASM2142 USB 3.1 Host Controller with USB Type C](https://shopee.com.my/product/182112974/12539214940?smtt=0.65290281-1648742968.9)

**Memory:**

- [32GB (8+8+8+8) PNY XLR8 Gaming Epic-X RGB DDR4 Memory 3200MHz](https://www.pny.com.tw/en/products-detail/XLR8-DDR4-3200MHz-Desktop-Memory-32GB/)

**Storage:**

| Value | Disk Type | Product | Size |
| --- | --- | --- | --- |
| 2   | M.2 NVMe | [Kingston A2000 NVMe](https://shopee.com.my/Kingston-A2000-NV1-NVMe-PCIe-Gen-3x4-M.2-2280-Internal-Solid-State-Drives-SSD-SA2000-SNVS-(250GB-500GB-1TB-2TB)-i.15417888.1248954996) | 500 GB |
| 1   | M.2 NVMe | [Silicon Power MAP1001 NVMe SSD](https://shopee.com.my/Silicon-Power-NVMe-PCIe-Gen3x4-M.2-2280-SSD-(256GB-512GB-1TB)-A80-P34-Solid-State-Drives-i.137317911.2095142026) | 256 GB |
| 1   | SATA SSD | [San Disk SSD Plus](https://www.westerndigital.com/en-ap/products/internal-drives/sandisk-ssd-plus-sata-iii-ssd) | 480 GB |
| 1   | SATA SSD | [San Disk SSD Plus](https://www.westerndigital.com/en-ap/products/internal-drives/sandisk-ssd-plus-sata-iii-ssd) | 240 GB |
| 2   | SATA HDD | [Western Digital WDC WD5000AAKX-001CA0](https://products.wdc.com/library/SpecSheet/ENG/2879-701277.pdf) | 500 GB |
| 1   | SATA HDD | [Hitachi HDT721016SLA380](https://www.hdsentinel.com/storageinfo_details.php?lang=en&model=HITACHI%20HDT721016SLA380) | 160 GB |

**OS Tested:**

- [x] MacOS Catalina requirement: `Mindate: 20200306`|`MinVersion: 1412101001000000`|`SetApfsTrimTimeout:-1`|`SecureBootModel: Disable`.
  
- [x] MacOS BigSur requirement: `Mindate: 0`| `MinVersion: 0`|`SetApfsTrimTimeout:-1`|`SecureBootModel: Default`.
  
- [x] MacOS Monterey requirement: `Mindate: 0`|`MinVersion: 0`|`SetApfsTrimTimeout:0`|`SecureBootModel: Default`.

<p align="justify">Remark: Quirk must set as processor codename. Refer OpenCore Getting Started] and head to Configs. For easy settings, use OCAuxiliaryTools. However, i will not recommend this tools. Any error occur to  config.plist, it is your own responsibility. Please make a backup before using it. Link can be refer below.</p>

**Link**

- [OpenCore Getting Started](https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html)

- [OCAuxilliaryTools](https://github.com/ic005k/OCAuxiliaryTools)

**Current OS**

- [x] `MacOS Monterey` v12.3
- [x] `Windows` 11

<p align="justify">Remark: Operating System is installed in separated drive.</p>

**SMBIOS:**

- [x] `iMac19,2`

# Introduction

**What is BIOS?**

- **BIOS** = Basic Input/Output System

<p align="justify">BIOS stands for Basic Input/Output System, the firmware we talked about in the above boot procedure. It is stored on an EPROM (Erasable Programmable Read-Only Memory), allowing the manufacturer to push out updates easily. It provides many helper functions that allow reading boot sectors of attached storage and printing things on screen. You can access BIOS during the initial phases of the boot procedure by pressing del, F2 or F10.</p>

**What is EFI?**

- **EFI** = Extensible Firmware Interface

<p align="justify">The EFI system partition (ESP), a small partition formatted with FAT32, is usually around 100MB, this is where the EFI boot loaders and applications used by the firmware at system during start-up are stored. If your hard drive is in the GUID Partition table (GPT) partition style, it will automatically generate an EFI system partition after you have installed your operating systems. Both Windows and Mac operating systems are supported.</p>

![efi-system-partition](https://user-images.githubusercontent.com/72515939/161425316-cb229e60-b2ad-4538-9b68-bbabb89a88a8.png)

**What is UEFI?**

- **UEFI** = Unified Extensible Firmware Interface

<p align="justify">UEFI stands for "Unified Extensible Firmware Interface." The UEFI Specification defines a new model for the interface between personal-computer operating systems and platform firmware. The interface consists of data tables that contain platform-related information, plus boot and runtime service calls that are available to the operating system and its loader. Together, these provide a standard environment for booting an operating system and running pre-boot applications.</p>

**OpenCore**

<p align="justify">OpenCore is what we refer to as a "boot loader"; it is a complex piece of software that we use to prepare our systems for MacOS, specifically by injecting new data for MacOS such as SMBIOS, ACPI tables, and kexts.</p>

**Refer:** [OpenCore](https://dortania.github.io/OpenCore-Install-Guide/)

<p align="justify">There is the basic OpenCore folder, which is EFI. This folder contain several other files and folders. Please refer to the diagram below for better understanding.</p>

**OpenCore v0.7.9:**

```tree

\---EFI
    +---BOOT
    |       BOOTx64.efi
    |
    \---OC
        |   config.plist
        |   OpenCore.efi
        |
        +---ACPI
        |       SSDT-Mac.aml
        |
        +---Drivers
        |       HfsPlus.efi
        |       OpenCanopy.efi
        |       OpenRuntime.efi
        |
        +---Kexts
        |   +---AppleALC.kext
        |   |
        |   +---Lilu.kext
        |   |
        |   +---LucyRTL8125Ethernet.kext
        |   |
        |   +---RadeonSensor.kext
        |   |
        |   +---SMCLightSensor.kext
        |   |
        |   +---SMCProcessor.kext
        |   |
        |   +---SMCRadeonGPU.kext
        |   |
        |   +---SMCSuperIO.kext
        |   |
        |   +---USBMap.kext
        |   |
        |   +---USBMapFull.kext
        |   |
        |   +---VirtualSMC.kext
        |   |
        |   \---WhateverGreen.kext
        |
        +---Resources
        |   +---Audio
        |   |
        |   +---Font
        |   |
        |   +---Image
        |   |   \---Acidanthera
        |   |       +---Chardonnay
        |   |       |
        |   |       +---GoldenGate
        |   |       |
        |   |       +---Syrah
        |   |
        |   \---Label
        |
        \---Tools
                CleanNvram.efi
                
```

### 1.0 - BOOT

<p align="justify">Fallback bootloader path. This is the only bootloader pathname that the UEFI firmware on 64-bit X86 systems will look for without any pre-existing NVRAM boot settings, so this is what you want to use on removable media. As a failsafe method, most firmware includes these drivers to prevent certain boot issues. There are 2 types of fallback. Details below explain the temporary and permanent methods, mostly used by specified UEFI firmware and operating system implementation.</p>

**Temporary vs Permanent:**

`Temporary`

- Can be ported to other GUID Partition
- As a solution to boot certain OS (Depending on Firmware i.e., OpenCore, Clover and rEFInd)

`Permanent`

- Cannot be ported due to GUID info binding.

**Other Operating System (OS) Implementation**

`Windows`

- Temporary: `EFI\boot\bootx64.efi`
- Permanent: `EFI\Microsoft\Boot\bootmgfw.efi` (Windows Boot Manager/UEFI which contain a GUID reference)

`Linux`

- Temporary: `EFI\boot\bootx64.efi`
- Permanent: `EFI\Ubuntu\grubx64.efi` (No Secure Boot Support)
- Permanent: `EFI\Ubuntu\shimx64.efi` (Secure Boot Support)

**OpenCore Implementation**

`OpenCore`

- Temporary: `EFI\BOOT\BOOTx64.efi`

<p align="justify">While OpenCore is just a bootloader, this type of bootloader is included with their own firmware, along with additional quirks for booting the MacOS partition. Furthermore, OpenCore has portable features that enable the chainloader option to be used with other operating systems.</p>


### 2.0 - ACPI

**DSDT vs SSDT Patching**

<p align="justify">As documented by Dortania, "Do not add your DSDT to OpenCore; it's already in your firmware. If you are unsure what this is referring to, go back to the OpenCore guide and select your configuration based on the architecture of your CPU".</p>

**Refer:** [Dortania](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-easy.html#running-ssdttime)

<p align="justify">DSDT patching should be avoided. There are various reasons why DSDT patching is not recommended. Some forums/webpages (i.e., Olarila) state that it is a major solution. As a matter of knowledge, DSDT is the main table while SSDT is the secondary table (additional table). The difference is that DSDT cannot be tampered with or touched. Because it is the main.aml code to handle your machine with various devices. Meanwhile, SSDT is the secondary table, where we can change (modify), add, and drop. Although the language (code) used is the same, it has a different task or method. Reason? I'll explain why.</p>

**DSDT Patching** may cause

- Broken motherboard BIOS, or
  
- Inefficient device with the wrong injection, or
  
- Cause malfunction device, or
  
- PC unable to boot properly due to an incorrect patch (difficult to reverse).


**SSDT Patching** may cause

- Broken Windows if `dual booting` (can be solve by `OpenCore Quirks Settings`).
 
<p align="justify">Broken Windows can be fixed via quirks settings in config.plist. This quirks option allows OpenCore not to use ACPI injection entirely. The information is as below:</p>

<p align="justify">From here, SSDT patching is the better solution and more reasonable. Any addition or modification does not affect your machine. If an error occurs, it is easy to revert back to the original state. The SSDT concept is only a patch of information and does not affect the existing hardware.</p>

<p align="justify">The SSDT I use is a combination of various sources from SSDTTime. Thanks to CorpNewt SSDTTime for the easy process. The entire SSDT has been merged into one file (i.e., SSDT-Mac.aml). There are also several other sources of properties that are injected to reduce the kext workload. For instance, renaming GFX0 to an IGPU that is managed by Whatevergreen.kext.The following is a list of devices that have been injected with specific properties:</p>

**Additional: ACPI Quirks for Dual Booting via config.plist**

1. PlatformInfo\SerialInfo\UpdateSMBIOSMode = `Custom`
  
2. Kernel\Quirks\CustomSMBIOSGuid = `True` 

##### 2.1 - SSDT-Mac.aml

**What is the content inside SSDT.Mac.aml?**
- All possible SSDT based patch according to the compatoble device.

| Device | Information |
| --- | --- |
| AWAC | To fix the `System Clocks` found on newer hardware. `_INI` Method is implemented |
| ALS0 | Optional/Not Needed. However, real `iMac` have these device information via IOREG. **Patch:** `smc-als` and `AppleLMUController`). These patch is only `Cosmetics`|
| PLUG | To allow the kernel's `XCPM / XNU's CPU Power Management` to manage CPU's power management |
| EC  | Fake Embedded Controller / EC drivers since `CML` don't have native support EC |
| IGPU | `GFX0` to `IGPU` rename. Other rename method via `SSDT` for `Intergrated Graphics Unit / IGPU` which can be handled by `Whatevergreen.kext`. Additional info related to `Intel UHD 630` is added as `headless` built-in graphics module |
| IMEI | `HECI` to `IMEI` rename via `SSDT` |
| MCHC | Come with `SBUS` patch to aids with correct temperature, fan, voltage, ICH, etc readings and proper memory reporting |
| GFX0 | `Dedicated Graphic Processor Unit / DGPU`.  This `SSDT` contain all `Navi 14` patch information. **Patch:** `ATY,Keelback` framebuffer and `CFG,CFG_USE_AGDC` properties to overcome wake issue using `DGPU`|
| HDAU | `High Definition Audio` through `HDMI` patch.|
| HDEF | `High Definition Audio System / HDAS` in actual `DSDT`, renamed with `HDEF` . **Patch:** `layout id/data/01000000` which is equal to `alcid=1` |
| LPCB | Just regular `Low Pin Count Bus` path corresponding to Embed Controller / EC |
| PMCR | Classed as `Memory Controller` and known as `PPMC` in `Comet Lake (CML)` platform. This `SSDT` renamed `PPMC` as `PMCR` with compatible `AppleIntelPCHPMC` support `pci8086,a2a1`, which is identical to `CML` `pci8086,a3a1` |
| TSUB | `Thermal Subsystem` rename which is not identical using `ioreg`. Rename `pci8086,a3b1` to `TSUB` |
| XHC1 | Rename PCIe`Comet Lake PCH-V USB Controller` device as `XHC` to `XHC1`. **Patch:**`acpi-wake-type` to overcome wake issue using USB device. |
| ARPT | Rename `RP03,PXSX` to `RP03,ARPT` |
| RTL0 | Rename `RTL8125 2.5GbE Controller` device as `RP04,PXSX` to `RP04,RTL0` |
| XHC0 | Rename `ASM2142 USB 3.1 Host Controller` device as `RP05,PXSX` to `RP05,XHC0`. **Patch:** `acpi-wake-type` to overcome wake issue using USB device. |
| ANS0 | Rename `RP09,PXSX` to `RP09,ANS0`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| ANS1 | Rename `RP20,PXSX` to `RP20,ANS1`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| ANS2 | Rename `RP21,PXSX` to `RP21,ANS2`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| SATA | Rename SATA to SAT0 with additional information. **Patch:** Spoof `400 Series Chipset Family SATA AHCI Controller` to `Intel 11 Series Chipset Controler`|
| SBUS | Fix `AppleSMBus` support in MacOS.  i.e: `AppleSMBusController`, `AppleSMBusPCI`, `Memory Reporting` and `etc` |
| USBX | To supply `USB Power Properties` for Skylake and newer motherboard generation. |

**Refer:** 

- [SSDT-Mac.aml](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-Mac.dsl)


### 3.0 - Drivers

<p align="justify">Only use 3 basic driver types. HfsPlus.efi, OpenCanopy.efi and OpenRuntime.efi. These three files are essentially basic things to get driver support. Usage information is as follows:</p>

| Driver | Information |
| --- | --- |
| HfsPlus.efi | Official `HFS+ Driver` Support for Apple MacOS |
| OpenCanopy.efi | OpenCore `Cosmetics Driver` for OpenCore boot menu |
| OpenRuntime.efi | `AptioMemoryFix.efi` (Clover Bootloader) replacement. Used as an extension for OpenCore to help with patching boot.efi for NVRAM fixes and better memory management |

### 4.0 - Kernel Extension

<p align="justify">Kernel extensions (kexts) let developers load code directly into the MacOS kernel. However, the kext used is not an official kext. This is some community effort for the use of Hackintosh users. The kext used is mostly a layer emulator, driver, and sensor. The rest is to improve other needed function. The table below contains some kexts used to properly boot MacOS through OpenCore</p>

| Kext | Information |
| --- | --- |
| Lilu | `Arbitrary kext` and `process patching` on MacOS |
| VirtualSMC | `System Management Controller` (SMC) emulator layer |
| AppleALC | An `open source kernel extension` enabling `native MacOS HD audio` for `not officially supported codecs` without any filesystem modifications |
| Whatevergreen | `Various patches` necessary for certain `ATI`/`AMD`/`Intel`/`Nvidia` GPUs |
| SMCProcessor | Additional support for `VirtualSMC`. Used for monitoring `CPU` temperature |
| SMCSuperIO | Additional support for `VirtualSMC`. Used for monitoring `FAN` speed |
| SMCRadeonGPU | Based on `FakeSMCs`, `RadeonMonitor` to provide `GPU` temperature to a dedicated gadget `without relying` on `FakeSMC` being installed and can therefore be used with `VirtualSMC` instead |
| RadeonSensor | To read the `GPU` temperature. `Lilu` is required. |
| LucyRTL8125Ethernet | `Realtek RTL8125 2.5GBit Ethernet Controllers` driver |
| USBMap | Kext to `route` selected `USB ports`. This is `compulsory to handle` `15 port limit` requirements by MacOS. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool) |


### 5.0 - OpenCore.efi

OpenCore firmware. Include with [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg/releases/). This file is compulsory.


### 6.0 - Resources

<p align="justify">This folder is related to OpenCore Beauty Treatment and is used with the OpenCanopy.efi driver. It is up to you to do your own research for a custom boot menu.</p>

**Refer:** [OC Binary Resource](https://github.com/acidanthera/OcBinaryData)


### 7.0 - Tools

<p align="justify">Nothing fancy, just additional tool "CleanNvram.efi" which is ResetNVRAM alternative bundled as a standalone tool, available when included into Tools folder and config.plist. This tool is hiding via "hide auxilliary". Use "Spacebar" to reveal the function. I just include this tools as failsafe.</p>


### 8.0 - Config.plist

<p align="justify">Knowledge + Hardware + Effort = Stability. Honestly, the process of preparing this file took a long time.  Still, I am thankful that I have over 20 years of experience using computers.  I am not too clumsy to understand the concept even though I am not from programming and technology field. Quirk selected was according to Intel 10th Gen `Comet Lake` recommend settings via Dortania. It has taken me several years to understand the Vanilla Hackintosh concept.  Starting with Clover, it was a bit confusing for me because of the scattered setting and arrangement of each part.  OpenCore concept is easier to understand and compiled every part to improve hardware, device and the OS stability. I also provide examples, and expose some important settings for OpenCore config.plist.</p>

**Refer:** [config.plist](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config.plist)


### 9.0 - BIOS/UEFI Settings

- Disable `CSM/ Enable UEFI`
- Disable `Secure Boot`
- Set SATA as `AHCI` (Do not install MacOS through RST)
- Disable `CFG Lock`
- Disable `Fast Boot`
- Disable `Intel Virtualization Technology`
- Disable `VT-D`
- Enable` XHCI Hand-off`
- Disable `Legacy USB Support` (If Needed)

### 10.0 - My Experience Rating Test

| MacOS | Rating 10/10 | Review |
| --- | --- | --- |
| Monterey | 8/10 | Stable |
| BigSur | 6/10 | Stable |
| Catalina | 10/10 | Stable & Fast |


### 11.0 - Windows

<img width="640" alt="Windows Info" src="https://user-images.githubusercontent.com/72515939/161429239-6b9c41c8-aec9-4090-bb69-a6c6a6256ade.png">

<img width="1920" alt="Windows" src="https://user-images.githubusercontent.com/72515939/161429244-0a4af658-e1d6-44b2-8c73-8a66fae152cf.png">


### 12.0 - MacOS

<img width="697" alt="Screenshot 2022-04-02 at 8 51 45 PM" src="https://user-images.githubusercontent.com/72515939/161410582-fe3b95ea-34f6-409e-9c58-4f570e6fd608.png">

<img width="1356" alt="Screenshot 2022-04-02 at 8 50 21 PM" src="https://user-images.githubusercontent.com/72515939/161410563-bf844fa2-75f3-4f42-8e43-4a6c74441460.png">

Written by `MohdIsmailMatAsin`


# Acknowledgements

I would like to thanks all folks in Hackintosh Community especially:

- [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for a great guide.
  
- [Acidanthera](https://github.com/acidanthera) for a great work. KUDOS for them.
  
- [CorpNewt](https://github.com/corpnewt) for developing simple USB mapping tools.
  
- [dhinakg](https://github.com/USBToolBox/tool) for developing easy Windows based USB mapping tools inspired by CorpNewt USBMap.
  
- [Hackintosh Malaysia](https://www.facebook.com/groups/HackintoshMalaysia/about/) for knowledge sharing.
  
- [r/Hackintosh](https://www.reddit.com/r/hackintosh/) for an easy undocumented refereces.
  
- [daliansky](https://github.com/daliansky) for publishing his own OpenCore ACPI method (OC-Little) and implementation.
  
- [5T33Z0](https://github.com/5T33Z0/OC-Little-Translated) for translating daliansky OC-Little.
  
- [rusty-bits](https://github.com/rusty-bits) for an easy EFI update using windows "cmdprompt", linux and MacOS Terminal.
