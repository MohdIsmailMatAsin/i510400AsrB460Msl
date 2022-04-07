# Hackintosh: Intel i5 10400 & Asrock B460M Steel Legend

## Hardware Information

| Info               | Details                                                |
| ------------------ | ------------------------------------------------------ |
| Operating System 1 | Microsoft Windows 11 Pro                               |
| Operating System 2 | MacOS Catalina 10.15.7                                 |
| Processor          | Intel® Core(TM) i5-10400 CPU @ 2.90GHz                 |
| Graphics Card      | Radeon RX 5500 XT 4GB / Intel® UHD Graphics 630  1GB   |
| Memory             | PNY XLR8 Gaming X Memory 3200MHz (XMP: 2666MHz)        |
| Monitor            | Samsung U28E590 4K                                     |
| Audio 1            | 7.1 CH HD Audio (Realtek ALC1200 Audio Codec)          |
| Audio 2            | U-Phoria UM2 USB Audio Device                          |
| Motherboard        | ASRock (B460M Steel Legend)                            |
| PCI 1              | BCM94360 WiFi & Bluetooth                              |
| PCI 2              | ASM2142 USB 3.1 Host Controller with USB Type C        |
| Storage 1          | 500GB Kingston A2000 NVMe                              |
| Storage 2          | 500GB Kingston A2000 NVMe                              |


**OS Tested:**

- [x] MacOS Catalina requirement:<br>`Mindate: 20200306`|`MinVersion: 1412101001000000`|`SetApfsTrimTimeout: Blank (Trim is Native)`|`SecureBootModel: Disable`.
- [x] MacOS BigSur requirement:<br>`Mindate: 0`| `MinVersion: 0`|`SetApfsTrimTimeout: Blank (Trim is Native)`|`SecureBootModel: Default`.
- [x] MacOS Monterey requirement:<br>`Mindate: 0`|`MinVersion: 0`|`SetApfsTrimTimeout: Blank (Trim is Native)`|`SecureBootModel: Default`.

<p align="justify">Remark: Quirk must set as processor codename. Refer OpenCore Getting Started] and head to Configs. For easy settings, use OCAuxiliaryTools. However, i will not recommend this tools. Any error occur to  config.plist, it is your own responsibility. Please make a backup before using it. Link can be refer below.</p>

**Link**

- [OpenCore Getting Started](https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html)

- [OCAuxilliaryTools](https://github.com/ic005k/OCAuxiliaryTools)

**Current OS**

- [x] `MacOS Monterey` v12.3
- [x] `Windows` 11

<p align="justify">Remark: Operating System is installed in separated drive.</p>

**SMBIOS:**

- [x] `iMac20,1`

# Introduction

**What is BIOS?**

BIOS = Basic Input/Output System

- <p align="justify">BIOS stands for Basic Input/Output System, the firmware we talked about in the above boot procedure. It is stored on an EPROM (Erasable Programmable Read-Only Memory), allowing the manufacturer to push out updates easily. It provides many helper functions that allow reading boot sectors of attached storage and printing things on screen. Asrock Motherboard can access BIOS during the initial phases of the boot procedure by pressing Del, F11 (Enter Setup).</p>

**What is EFI?**

EFI = Extensible Firmware Interface

- <p align="justify">The EFI system partition (ESP), a small partition formatted with FAT32, is usually around 100MB for Windows and around 200MB for MacOS, this is where the EFI boot loaders and applications used by the firmware at system during start-up are stored. If your hard drive is in the GUID Partition table (GPT) partition style, it will automatically generate an EFI system partition after you have installed your operating systems. Both Windows and Mac operating systems are supported.</p>

![efi-system-partition](https://user-images.githubusercontent.com/72515939/161425316-cb229e60-b2ad-4538-9b68-bbabb89a88a8.png)

**What is UEFI?**

UEFI = Unified Extensible Firmware Interface

- <p align="justify">UEFI stands for "Unified Extensible Firmware Interface." The UEFI Specification defines a new model for the interface between personal-computer operating systems and platform firmware. The interface consists of data tables that contain platform-related information, plus boot and runtime service calls that are available to the operating system and its loader. Together, these provide a standard environment for booting an operating system and running pre-boot applications.</p>

**What is Bootloader**

- <p align="justify">A boot-loader, also known as a boot program or bootstrap loader, is a special operating system software that loads into the working memory of a computer after start-up. For this purpose, immediately after a device starts, a boot-loader is generally launched by a bootable medium like a hard drive, a CD/DVD or a USB stick. The boot medium receives information from the computer’s firmware (e.g. BIOS) about where the boot-loader is. The whole process is also described as “booting”. OpenCore, Clover, rEFInd, reEFIt, Chameleon, and a few other names is known as boot-loaders. Mosts of these boot-loaders are capable as chain-loader/chain-loading. Chain-loader is similar to the use of overlays. Unlike overlays, chain-loader replaces the currently executing program in its entirety. Overlays usually replace only a portion of the running program. Like the use of overlays, the use of chain-loading increases the I/O load of an application.</p>

**My Partition**

- **Windows**

<img width="827" alt="Screenshot 2022-04-03 133920" src="https://user-images.githubusercontent.com/72515939/161430959-f530d4a2-812f-43ec-9b78-6b54522f3a50.png">

- **MacOS**

<img width="830" alt="Screenshot 2022-04-03 134003" src="https://user-images.githubusercontent.com/72515939/161430979-9b890a71-a348-439b-98df-0e53e6a49da8.png">

<img width="1399" alt="Screenshot 2022-04-03 at 10 47 56 PM" src="https://user-images.githubusercontent.com/72515939/161433665-d12eb9b1-5893-4831-96f6-05f2b28bc4a1.png">

**OpenCore**

- <p align="justify">OpenCore is what we refer to as a "boot-loader" and also as "chain-loader" at the same time; it is a complex piece of software that we use to prepare our systems for MacOS, specifically by injecting new data for MacOS such as SMBIOS, ACPI tables, and kexts.</p>

<img width="830" alt="Screenshot 2022-04-03 134003" src="https://user-images.githubusercontent.com/72515939/161431087-8fadbe79-bdc6-49fc-8721-eb149db7ede0.png">

<p align="justify">Remark: OpenCore EFI position inside USB Installer is the same as the picture above. The EFI folder (include content) must be in a USB volume either ESP/EFI which is a FAT32 format volume. Post MacOS install, OpenCore EFI must be in MacOS ESP/EFI which also as FAT32 format volume.</p>

**Refer:** [OpenCore](https://dortania.github.io/OpenCore-Install-Guide/)

- <p align="justify">There is the basic OpenCore folder, which is EFI. This folder contain several other files and folders. Please refer to the diagram below for better understanding.</p>

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

Remark: This information is dumped via Windows Command Prompt. Refer [Tree Syntax via Windows](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tree)

### 1.0 - BOOT

- <p align="justify">Fallback boot-loader path. This is the only boot-loader pathname that the UEFI firmware on 64-bit X86 systems will look for without any pre-existing NVRAM boot settings, so this is what you want to use on removable media. As a failsafe method, most firmware includes these drivers to prevent certain boot issues. There are 2 types of fallback. Details below explain the temporary and permanent methods, mostly used by specified UEFI firmware and operating system implementation.</p>

**Temporary vs Permanent:**

`Temporary`

1. Can be ported to other GUID Partition
2. As a solution to boot certain OS (Depending on Firmware i.e., OpenCore, Clover and rEFInd)

`Permanent`

1. Cannot be ported due to GUID info binding.
2. Hard to modify

**Other Operating System (OS) Implementation**

`Windows`

1. Temporary: `EFI\boot\bootx64.efi`
2. Permanent: `EFI\Microsoft\Boot\bootmgfw.efi` (Windows Boot Manager/UEFI which contain a GUID reference)

`Linux`

1. Temporary: `EFI\boot\bootx64.efi`
2. Permanent: `EFI\Ubuntu\grubx64.efi` (No Secure Boot Support)
3. Permanent: `EFI\Ubuntu\shimx64.efi` (Secure Boot Support)

**OpenCore Implementation**

`OpenCore`

1. Temporary: `EFI\BOOT\BOOTx64.efi` via USB Drive (Installation Device)
2. Permanent: `EFI\BOOT\BOOTx64.efi` via HDD/SSD/NVMe (MacOS Drive)

- <p align="justify">While OpenCore is just a boot-loader, this type of boot-loader is included with their own firmware, along with additional quirks for booting the MacOS partition. Furthermore, OpenCore has portable features that enable the chain-loader option to be used with other operating systems.</p>

### 2.0 - ACPI

**What is DSDT?**

- <p align="justify">DSDT stands for Differentiated System Description Table. It Is a major ACPI table and is used to describe what peripherals the machine has. Also holds information on PCI IRQ mappings and power management.</p>

**What is SSDT?**

- <p align="justify">The SSDT is an ACPI descriptor table. It is encoded in AML in exactly the same way as the DSDT. It acts as a supplement to the DSDT.</p>

- Full information on DSDT and SSDT can be found at the link provided. Refer [DSDT](https://wiki.osdev.org/DSDT#:~:text=DSDT%20stands%20for%20Differentiated%20System,IRQ%20mappings%20and%20power%20management.) and [SSDT](https://wiki.osdev.org/SSDT#:~:text=The%20SSDT%20is%20an%20ACPI,a%20supplement%20to%20the%20DSDT.) for more info.

**DSDT vs SSDT Patching**

- <p align="justify">As documented by Dortania, "Do not add your DSDT to OpenCore; it's already in your firmware. If you are unsure what this is referring to, go back to the OpenCore guide and select your configuration based on the architecture of your CPU".</p>

**Refer:** [Dortania](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-easy.html#running-ssdttime)

- <p align="justify">DSDT patching should be avoided. There are various reasons why DSDT patching is not recommended. Some forums/webpages (i.e., Olarila) state that it is a major solution. As a matter of knowledge, DSDT is the main table while SSDT is the secondary table (additional table). The difference is that DSDT cannot be tampered with or touched. Because it is the primary code to handle your machine with various devices. Meanwhile, SSDT is the secondary table, where we can change (modify), add, and drop. Although the language (code) used is the same, it has a different task or method. Reason? I'll explain why.</p>

**DSDT Patching** may cause

1. Broken motherboard BIOS, or
2. Inefficient device with the wrong injection, or
3. Cause malfunction device, or
4. PC unable to boot properly due to an incorrect patch (difficult to reverse).

**SSDT Patching** may cause

1. ACPI Injection via OpenCore
2. Broken Windows update

- <p align="justify">Mostly, these issue may affect dual booting (Windows + MacOS). Luckily, there are settings via config.plist to prevent both issues, but this is only experimental. Do not assume this settings will work 100% on your machine. Settings explained below:</p>

1. PlatformInfo\SerialInfo\UpdateSMBIOSMode = `Custom`
2. Kernel\Quirks\CustomSMBIOSGuid = `True`

- <p align="justify">From here, SSDT patching is the better solution and more reasonable. Any addition or modification does not affect your machine. If an error occurs, it is easy to revert back to the original state. The SSDT concept is only a patch of information and does not affect the existing hardware.</p>

- <p align="justify">The SSDT I use is a combination of various sources from SSDTTime. Thanks to CorpNewt SSDTTime for the easy process. The entire SSDT has been merged into one file (i.e., SSDT-AsrockSL.aml). There are also several other sources of properties that are injected to reduce the kext workload. For instance, renaming GFX0 to an IGPU that is managed by Whatevergreen.kext. The following is a list of devices that have been injected with specific properties:</p>

| Device | Information                                                                                                                                                                                                                             |
| ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AWAC   | To fix the `System Clocks` found on newer hardware.                                                                                                                                                                                     |
| ALS0   | Optional/Not Needed. Normally, real `iMac` is include this device information. **Patch:** `smc-als` and `AppleLMUController`). These patch is only `Cosmetics`, nothing much we can do                                                  |
| PLUG   | To allow the kernel's `XCPM / XNU's CPU Power Management` to manage CPU's power management                                                                                                                                              |
| EC     | Fake Embedded Controller / EC drivers since `CML` don't have native support EC                                                                                                                                                          |
| IGPU   | An Intel® Intergrated Graphics Unit device.`GFX0` to `IGPU` rename. Other rename method via `SSDT` for `Intergrated Graphics Unit / IGPU` which can be handled by `Whatevergreen.kext`. Additional info related to `Intel UHD 630` is added as `headless` built-in graphics module |
| IMEI   | An Intel® Management Engine Interface.`HECI` to `IMEI` rename via `SSDT`                                                                                                                                                                |
| MCHC   | Come with `SBUS` patch to aids with correct temperature, fan, voltage, ICH, etc readings and proper memory reporting                                                                                                                    |
| GFX0   | Display Output from `Dedicated Graphic Processor Unit / DGPU`.  This `SSDT` contain all `Navi 14` patch information. **Patch:** `ATY,Keelback` frame-buffer and `CFG,CFG_USE_AGDC` properties to overcome wake issue using `DGPU`. `_SUN` is added to get proper PCI Slot Number|
| HDAU   | Audio Output device through HDMI, called as `High Definition Audio`. `_SUN` is added to get proper PCI Slot Number                                                                                                                      |
| HDEF   | Audio device, known as `High Definition Audio System / HDAS` in actual `DSDT`, renamed with `HDEF` . **Patch:** `layout id/data/01000000` which is equal to `alcid=1`                                                                   |
| LPCB   | Just regular `Low Pin Count Bus` path corresponding to Embed Controller / EC                                                                                                                                                            |
| PMCR   | Classed as `Memory Controller` and known as `PPMC` in `Comet Lake (CML)` platform. This `SSDT` renamed `PPMC` as `PMCR` with compatible `AppleIntelPCHPMC` support `pci8086,a2a1`, which is identical to `CML` `pci8086,a3a1`           |
| TSUB   | Known as `Thermal Subsystem` rename which is not identical using `ioreg`. Rename `pci8086,a3b1` to `TSUB`                                                                                                                               |
| XHC1   | Rename PCIe`Comet Lake PCH-V USB Controller` device as `XHC` to `XHC1`. **Patch:**`acpi-wake-type` to overcome wake issue using USB device.                                                                                             |
| ARPT   | Rename `RP03,PXSX` to `RP03,ARPT`. Device is pointed to `M2- 3` Slot                                                                                                                                                                    |
| RTL0   | Rename `RTL8125 2.5GbE Controller` device as `RP04,PXSX` to `RP04,RTL0`                                                                                                                                                                 |
| XHC0   | Rename ASMedia USB device, `ASM2142 USB 3.1 Host Controller` device as `RP05,PXSX` to `RP05,XHC0`. Device is pointed to `Slot- 3`. **Patch:** `acpi-wake-type` to overcome wake issue using USB device                                  |
| ANS0   | Rename `RP09,PXSX` to `RP09,ANS0`. Device is pointed to `M2- 1` Slot. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller`                                                                                                         |
| ANS2   | Rename `RP20,PXSX` to `RP20,ANS2`. Device is pointed to `Slot- 2`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller`                                                                                                            |
| ANS1   | Rename `RP21,PXSX` to `RP21,ANS1`. Device is pointed to `M2- 2` Slot. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller`                                                                                                         |
| SATA   | Rename SATA to SAT0 with additional information. **Patch:** Spoof `400 Series Chipset Family SATA AHCI Controller` to `Intel 11 Series Chipset Controler`                                                                               |
| SBUS   | Fix `AppleSMBus` support in MacOS.  i.e: `AppleSMBusController`, `AppleSMBusPCI`, `Memory Reporting` and `etc`                                                                                                                          |
| USBX   | Known as `USB Power Properties` for Skylake and newer motherboard generation.                                                                                                                                                           |

**Refer:** 

- OpenCore [SSDT-Asrock.dsl](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-AsrockSL.dsl)
- Clover [SSDT-Asrock_Clover.dsl](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-AsrockSL_Clover.dsl)

Remark: Do note,`_SUN` injection may affect differently in PCI slot via OpenCore and Clover.

### 3.0 - Drivers

- <p align="justify">Only use 3 basic driver types. HfsPlus.efi, OpenCanopy.efi and OpenRuntime.efi. These three files are essentially basic things to get driver support. Usage information is as follows:</p>

| Driver          | Information                                                                                                                                                          |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| HfsPlus.efi     | Official `HFS+ Driver` Support for Apple MacOS                                                                                                                       |
| OpenCanopy.efi  | OpenCore `Cosmetics Driver` for OpenCore boot menu                                                                                                                   |
| OpenRuntime.efi | `AptioMemoryFix.efi` (Clover Boot-loader) replacement. Used as an extension for OpenCore to help with patching boot.efi for NVRAM fixes and better memory management |

### 4.0 - Kernel Extension

- <p align="justify">Kernel extensions (kexts) let developers load code directly into the MacOS kernel. However, the kext used is not an official kext. This is some community effort for the use of Hackintosh users. The kext used is mostly a layer emulator, driver, and sensor. The rest is to improve other needed function. The table below contains some kexts used to properly boot MacOS through OpenCore</p>

| Kext                | Information                                                                                                                                                                                                          |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Lilu                | `Arbitrary kext` and `process patching` on MacOS                                                                                                                                                                     |
| VirtualSMC          | `System Management Controller` (SMC) emulator layer                                                                                                                                                                  |
| AppleALC            | An `open source kernel extension` enabling `native MacOS HD audio` for `not officially supported codecs` without any filesystem modifications                                                                        |
| Whatevergreen       | `Various patches` necessary for certain `ATI`/`AMD`/`Intel`/`Nvidia` GPUs                                                                                                                                            |
| SMCProcessor        | Additional support for `VirtualSMC`. Used for monitoring `CPU` temperature                                                                                                                                           |
| SMCSuperIO          | Additional support for `VirtualSMC`. Used for monitoring `FAN` speed                                                                                                                                                 |
| SMCRadeonGPU        | Based on `FakeSMCs`, `RadeonMonitor` to provide `GPU` temperature to a dedicated gadget `without relying` on `FakeSMC` being installed and can therefore be used with `VirtualSMC` instead                           |
| RadeonSensor        | To read the `GPU` temperature. `Lilu` is required.                                                                                                                                                                   |
| LucyRTL8125Ethernet | Ethernet device, `Realtek RTL8125 2.5GBit Ethernet Controllers` driver                                                                                                                                               |
| USBMap              | Kext to `route` selected `USB ports` to `Physical Ports` via USB port address. This is `compulsory to handle` `15 port limit` requirements by MacOS. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool)|

### 5.0 - OpenCore.efi

- An OpenCore Extensible Firmware Interface (.efi) format. Normally this file is include with [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg/releases/). This file is compulsory.

### 6.0 - Resources

- <p align="justify">This folder is related to OpenCore Beauty Treatment and is used with the OpenCanopy.efi driver. It is up to you to do your own research for a custom boot menu.</p>

**Refer:** [OC Binary Resource](https://github.com/acidanthera/OcBinaryData)

### 7.0 - Tools

- <p align="justify">Nothing fancy, just additional tool "CleanNvram.efi" which is ResetNVRAM alternative bundled as a standalone tool, available when included into Tools folder and config.plist. This tool is hiding via "hide auxiliary". Use "Spacebar" to reveal the function. I just include this tools as failsafe.</p>

### 8.0 - Config.plist

- <p align="justify">Knowledge + Hardware + Effort = Stability. Honestly, the process of preparing this file took a long time.  Still, I am thankful that I have over 20 years of experience using computers.  I am not too clumsy to understand the concept even though I am not from programming and technology field. Quirk selected was according to Intel 10th Generation `Comet Lake` recommend settings via Dortania. It has taken me several years to understand the Vanilla Hackintosh concept.  Starting with Clover, it was a bit confusing for me because of the scattered setting and arrangement of each part.  OpenCore concept is easier to understand and compiled every part to improve hardware, device and the OS stability. I also provide examples, and expose some important settings for OpenCore config.plist.

**Refer:** [config.plist](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config.plist)

### 9.0 - BIOS/UEFI Settings

1. Disable `CSM/ Enable UEFI`
2. Disable `Secure Boot`
3. Set SATA as `AHCI` (Do not install MacOS through RST)
4. Disable `CFG Lock`
5. Disable `Fast Boot`
6. Disable `Intel Virtualization Technology`
7. Disable `VT-D`
8. Enable` XHCI Hand-off`
9. Disable `Legacy USB Support` (If Needed)

### 10.0 - My Experience Rating Test

| MacOS    | Rating 10/10 | Review        |
| -------- | ------------ | ------------- |
| Monterey | 8/10         | Stable        |
| BigSur   | 6/10         | Stable        |
| Catalina | 10/10        | Stable & Fast |

### 11.0 - Windows

<img width="640" alt="Windows Info" src="https://user-images.githubusercontent.com/72515939/161429239-6b9c41c8-aec9-4090-bb69-a6c6a6256ade.png">

### 12.0 - MacOS

<img width="697" alt="Screenshot 2022-04-06 at 1 54 31 AM" src="https://user-images.githubusercontent.com/72515939/161819681-d04170c0-f1ad-4258-b002-89d51c372689.png">

<img width="1356" alt="Screenshot 2022-04-06 at 1 55 37 AM" src="https://user-images.githubusercontent.com/72515939/161819701-ca09f51f-8230-4753-a86e-9e3a42d3c75e.png">

<img width="1356" alt="Screenshot 2022-04-06 at 1 55 47 AM" src="https://user-images.githubusercontent.com/72515939/161819713-bed7141a-4ff4-4fcf-8aef-0b373f2a0ced.png">

<img width="1356" alt="Screenshot 2022-04-06 at 1 55 54 AM" src="https://user-images.githubusercontent.com/72515939/161819724-4d3228aa-18ba-4493-8bae-6af4324b42af.png">

<img width="1356" alt="Screenshot 2022-04-06 at 1 56 08 AM" src="https://user-images.githubusercontent.com/72515939/161819740-d555a5fb-9a11-4906-9d8b-237fe7cb6372.png">

<img width="1356" alt="Screenshot 2022-04-06 at 1 56 13 AM" src="https://user-images.githubusercontent.com/72515939/161819756-32142247-2b18-4de8-a743-41d5d2c03dcc.png">
	
 
### 13.0 - IQSV + Navi Issue

- <p align = "justify">Intel® UHD630 is currently not compatible with the AMD Navi -based GPU.  Various experiments were performed with several combinations of headless IGPUs from the KBL and CFL series.  Here the UHD630 is headless while the RX 5500 XT 4GB will be the display.  The iMac20.1 SMBIOS was chosen but due to the plug -in coding and decoding performance of the AMD Navi being better than the IQSV, overwriting occurred and the IQSV was unable to perform the encoding as well as decoding functions.  For information, most average hackintosh users state that a stable IQSV can only be used with a combination of AMD Polaris-based GPUs such as the AMD RX580.  The RX 5500 XT is the first RDNA series and it is the macOS trial driver for the AMD Navi series.  I still haven't done any tests on the AMD Navi GPU type RDNA2 </p>

**Refer:** [SSDT-Mac.dsl](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-Mac.dsl) (check GFX0 properties using MacIASL.app)

- <p align="justify">Picture below is the proof IQSV and Navi Based GPU is working. Test is made via Apple TV.</p>

<img width="1054" alt="Screenshot 2022-04-06 at 1 42 24 AM" src="https://user-images.githubusercontent.com/72515939/161819118-ef5f01d2-9406-4d31-8781-085c2e36224c.png">

### 14.0 - Download

- [Clover](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/files/8428324/EFI_CLv5146.zip)
- [OpenCore](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/files/8428314/EFI_OCv0.7.9.zip)

**Remark:** Clover Boot Loader is include with same output as OpenCore.

**Note:** Any issues is not my responsible, please generate same SMBIOS with different serial.

### 15.0 - Ioreg

- [Mohd's Ioreg](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/Mohd%E2%80%99s%20iMac.ioreg)

**Note:** [Ioreg](https://github.com/MohdIsmailMatAsin/AdditionalTools4Xcode13.2/blob/main/IORegistryExplorer.zip) is required to view the details.

# Acknowledgements

I would like to thanks all folks in Hackintosh Community especially:

- [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for a great guide.
- [Acidanthera](https://github.com/acidanthera) for a great work. KUDOS for them.
- [CorpNewt](https://github.com/corpnewt) for developing simple USB mapping tools.
- [dhinakg](https://github.com/USBToolBox/tool) for developing easy Windows based USB mapping tools inspired by CorpNewt USBMap.
- [Hackintosh Malaysia](https://www.facebook.com/groups/HackintoshMalaysia/about/) for knowledge sharing.
- [r/Hackintosh](https://www.reddit.com/r/hackintosh/) for an easy undocumented references.
- [daliansky](https://github.com/daliansky) for publishing his own OpenCore ACPI method (OC-Little) and implementation.
- [5T33Z0](https://github.com/5T33Z0/OC-Little-Translated) for translating daliansky OC-Little.
- [rusty-bits](https://github.com/rusty-bits) for an easy EFI update using windows "Cmd-Prompt", linux and MacOS Terminal.
