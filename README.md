# Hackintosh: Intel i5 10400 & Asrock B460M Steel Legend

###### **Reminder:** 

###### <p align="justify">This is not 100% official method. All the information displayed is based on actual hardware and experimental basis. Half of the information is taken from [Dortania](https://dortania.github.io/OpenCore-Install-Guide/), while others were taken from several known sources. This is an informative explanation related to [OpenCore](https://github.com/acidanthera/OpenCorePkg). For [Clover](https://github.com/CloverHackyColor/CloverBootloader), please refer to [Clover Crate](https://github.com/5T33Z0/Clover-Crate) by [5T33Z0](https://github.com/5T33Z0)</p>

## Information 

| Info      | Details                          | Info        | Details                                       |
| --------- | -------------------------------- | ----------- | --------------------------------------------- |
| OS 1      | Microsoft Windows 11 Pro         | Audio 1     | 7.1 CH HD Audio (Realtek ALC1200 Audio Codec) |
| OS 2      | MacOS Catalina 10.15.7           | Audio 2     | U-Phoria UM2 USB Audio Device                 |
| Processor | Intel® Core(TM) i5-10400         | Motherboard | ASRock (B460M Steel Legend)                   |
| GFX0      | Radeon RX 5500 XT 4GB            | PCI 1       | BCM94360 WiFi & Bluetooth                     |
| IGPU      | Intel® UHD Graphics 630  1GB     | PCI 2       | VIA USB 3.0 eXtensible Host Controller        |
| Memory    | PNY XLR8 Gaming X Memory 3200MHz | Storage 1   | 500GB Kingston A2000 NVMe                     |
| Monitor   | Samsung U28E590 4K               | Storage 2   | 500GB Kingston A2000 NVMe                     |
| SMBIOS    | iMac20,1                         | Board ID    | Mac-CFF7D910A743CAAF                          |

<br>

## APFS Changes

| MacOS     | Mindate   | MinVersion       | SetApfsTrimTimeout | SecureBootModel       |
|-----------|-----------|------------------|--------------------|-----------------------|
| Catalina  | 20200306  | 1412101001000000 | Blank  (Native)    | j185-10.15.6 (19G2005)|
| BigSur    | 0         | 0                | 0                  | j185-10.15.6 (19G2005)|
| Monterey  | 0         | 0                | 0                  | j185-10.15.6 (19G2005)|

**Remark:** <p align="justify">Settings above may not the same as the recommended settings by Dortania. To find out more please check [Dortania, Apple Secure Boot](https://dortania.github.io/OpenCore-Post-Install/universal/security/applesecureboot.html#securebootmodel) for more.</p> 

<br>

## Introduction

**What is `BIOS`?**

<p align="justify">BIOS stands for Basic Input/Output System, stored on an EPROM (Erasable Programmable Read-Only Memory), allowing the manufacturer to push out updates easily. It provides many helper functions that allow reading boot sectors of attached storage and printing things on screen. Asrock Motherboard can access BIOS during the initial phases of the boot procedure by pressing Del, F11 (Enter Setup).</p>

**What is `EFI`?**

<p align="justify">Stand for Extensible Firmware Interface. The EFI system partition (ESP), a small partition formatted with FAT32, is usually around 100MB for Windows and around 200MB for MacOS, this is where the EFI boot loaders and applications used by the firmware at system during start-up are stored. If your hard drive is in the GUID Partition table (GPT) partition style, it will automatically generate an EFI system partition after you have installed your operating systems. Both Windows and Mac operating systems are supported.</p>

![efi-system-partition](https://user-images.githubusercontent.com/72515939/161425316-cb229e60-b2ad-4538-9b68-bbabb89a88a8.png)

**What is `UEFI`?**

<p align="justify">UEFI stands for "Unified Extensible Firmware Interface." The UEFI Specification defines a new model for the interface between personal-computer operating systems and platform firmware. The interface consists of data tables that contain platform-related information, plus boot and runtime service calls that are available to the operating system and its loader. Together, these provide a standard environment for booting an operating system and running pre-boot applications.</p>

**What is `Boot-loader`?**

<p align="justify">A boot-loader, also known as a boot program or bootstrap loader, is a special operating system software that loads into the working memory of a computer after start-up. For this purpose, immediately after a device starts, a boot-loader is generally launched by a bootable medium like a hard drive, a CD/DVD or a USB stick. The boot medium receives information from the computer’s firmware (e.g. BIOS) about where the boot-loader is. The whole process is also described as “booting”. OpenCore, Clover, rEFInd, reEFIt, Chameleon, and a few other names is known as boot-loaders. Mosts of these boot-loaders are capable as chain-loader/chain-loading. Chain-loader is similar to the use of overlays. Unlike overlays, chain-loader replaces the currently executing program in its entirety. Overlays usually replace only a portion of the running program. Like the use of overlays, the use of chain-loading increases the I/O load of an application.</p>

<br>

## Partitioning

- **Windows**

<p align="center"><img width="827" alt="Screenshot 2022-04-03 133920" src="https://user-images.githubusercontent.com/72515939/161430959-f530d4a2-812f-43ec-9b78-6b54522f3a50.png"></p>

- **MacOS**

<p align="center"><img width="830" alt="Screenshot 2022-04-03 134003" src="https://user-images.githubusercontent.com/72515939/161430979-9b890a71-a348-439b-98df-0e53e6a49da8.png"></p>

- **OpenCore**

<p align="center"><img width="830" alt="Screenshot 2022-04-03 134003" src="https://user-images.githubusercontent.com/72515939/161431087-8fadbe79-bdc6-49fc-8721-eb149db7ede0.png"></p>

<p align="justify">OpenCore is what we refer to as a boot-loader and also as chain-loader at the same time; it is a complex piece of software that we use to prepare our systems for MacOS, specifically by injecting new data for MacOS such as SMBIOS, ACPI tables, and kexts.</p>

<br>

## EFI Structure

The basic OpenCore folder structure. This folder contain several sub files and folders.

```tree
% cd /Volumes/EFI
↓
% tree
.
└── EFI
    ├── BOOT
    │   └── BOOTx64.efi
    └── OC
        ├── ACPI
        │   └── SSDT-B460M-SL.aml
        ├── Drivers
        │   ├── HfsPlus.efi
        │   └── OpenRuntime.efi
        ├── Kexts
        │   ├── AppleALC.kext
        │   ├── Lilu.kext
        │   ├── LucyRTL8125Ethernet.kext
        │   ├── RadeonSensor.kext
        │   ├── SMCLightSensor.kext
        │   ├── SMCProcessor.kext
        │   ├── SMCRadeonGPU.kext
        │   ├── SMCSuperIO.kext
        │   ├── USBMap.kext
        │   ├── VirtualSMC.kext
        │   └── WhateverGreen.kext
        ├── OpenCore.efi
        ├── Resources
        │   ├── Audio
        │   ├── Font
        │   ├── Image
        │   │   └── Acidanthera
        │   │       ├── Chardonnay
        │   │       ├── GoldenGate
        │   │       └── Syrah
        │   └── Label
        ├── Tools
        │   └── CleanNvram.efi
        └── config.plist
```
**Remark:** Generally best to debug systems without* `OpenCanopy.efi`, if required make sure this file is from `DEBUG` else there will be virtually no debug information. `Picker` mode use `Built-In` menu.

<br>

### 1.0 - EFI\BOOT

<p align="justify">Fallback boot-loader path. This is the only boot-loader pathname that the UEFI firmware on 64-bit X86 systems will look for without any pre-existing NVRAM boot settings, so this is what you want to use on removable media. As a failsafe method, most firmware includes these drivers to prevent certain boot issues. There are 2 types of fallback. Details below explain the temporary and permanent methods, mostly used by specified UEFI firmware and operating system implementation.</p>

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

<p align="justify">While OpenCore is just a boot-loader, this type of boot-loader is included with their own firmware, along with additional quirks for booting the MacOS partition. Furthermore, OpenCore has portable features that enable the chain-loader option to be used with other operating systems.</p>

<p align="center"><img width="1032" alt="Screen Shot 2022-04-22 at 12 19 09 AM" src="https://user-images.githubusercontent.com/72515939/164505934-60134e65-66ad-4168-99da-1c3f99ceda88.png"></p>
<img width="1032" alt="Screen Shot 2022-04-22 at 12 19 13 AM" src="https://user-images.githubusercontent.com/72515939/164505945-eb9215b3-2c92-456d-a2b5-d9e89d2025af.png"></p>
<img width="1032" alt="Screen Shot 2022-04-22 at 12 19 19 AM" src="https://user-images.githubusercontent.com/72515939/164505951-825429c4-fd91-4f15-931d-4c98df824010.png"></p>
<img width="1032" alt="Screen Shot 2022-04-22 at 12 19 23 AM" src="https://user-images.githubusercontent.com/72515939/164505961-3b67bf7d-0d94-485a-9969-f8babfc8a8d4.png"></p>

<br>

### 2.0 - OC\ACPI

**What is `DSDT`?**

<p align="justify">Differentiated System Description Table. It Is a major ACPI table and is used to describe what peripherals the machine has. Also holds information on PCI IRQ mappings and power management.</p>

<p align="center"><img width="1111" alt="Screen Shot 2022-04-22 at 12 22 32 AM" src="https://user-images.githubusercontent.com/72515939/164506898-66804fd4-987d-4b3d-886e-1312604f5991.png"></p>

**What is `SSDT`?**

<p align="justify">Secondary System Description Table. It is encoded in AML which is exactly the same way as the DSDT. It acts as a additional table to the DSDT. 

<p align="center"><img width="1160" alt="Screen Shot 2022-04-22 at 12 22 49 AM" src="https://user-images.githubusercontent.com/72515939/164506930-3ea0b1d6-65ed-4f05-9724-11cf51b07adf.png"></p>  

Full information on DSDT and SSDT can be found at the link provided. Refer:</p>

- [DSDT](https://wiki.osdev.org/DSDT#:~:text=DSDT%20stands%20for%20Differentiated%20System,IRQ%20mappings%20and%20power%20management.)
- [SSDT](https://wiki.osdev.org/SSDT#:~:text=The%20SSDT%20is%20an%20ACPI,a%20supplement%20to%20the%20DSDT.)

**DSDT vs SSDT Patching**

<p align="justify">As documented by Dortania, "Do not add your DSDT to OpenCore; it's already in your firmware. If you are unsure what this is referring to, go back to the OpenCore guide and select your configuration based on the architecture of your CPU".</p>

**Refer:** [Dortania](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-easy.html#running-ssdttime)

<p align="justify">DSDT patching should be avoided. There are various reasons why DSDT patching is not recommended. Some forums/webpages (i.e., Olarila) state that it is a major solution. As a matter of knowledge, DSDT is the main table while SSDT is the secondary table (additional table). The difference is that DSDT cannot be tampered with or touched. Because it is the primary code to handle your machine with various devices. Meanwhile, SSDT is the secondary table, where we can change (modify), add, and drop. Although the language (code) used is the same, it has a different task or method. Reason? I'll explain why.</p>

**DSDT Patching** may cause 

1. Broken motherboard BIOS, or
2. Inefficient device with the wrong injection, or
3. Cause malfunction device, or
4. PC unable to boot properly due to an incorrect patch (difficult to reverse).

**SSDT Patching** may affect

<p align="justify">ACPI Injection to Windows/Linux. Mostly, these issue may affect dual booting (Windows + MacOS). Luckily, there are settings via config.plist to prevent both issues, but this is only experimental. Do not assume this settings will work 100% on your machine. Settings is explained via table below:</p>

| Path         | Path       | Path             | Mode   |
| ------------ | ---------- | ---------------- | ------ |
| PlatformInfo | SerialInfo | UpdateSMBIOSMode | Custom |
| Kernel       | Quirks     | CustomSMBIOSGuid | True   |

<p align="justify">From here, SSDT patching is the better solution and more reasonable. Any addition or modification does not affect your machine. If an error occurs, it is easy to revert back to the original state. The SSDT concept is only a patch of information and does not affect the existing hardware.</p>
<p align="justify">Thanks to CorpNewt SSDTTime for the easy process. The entire SSDT has been merged into one file (i.e., SSDT-B460M-SL.dsl). There are also several other sources of properties that are injected to reduce the kext workload. For instance, renaming GFX0 to an IGPU that is managed by Whatevergreen.kext. The following is a list of devices that have been injected with specific properties:</p>

| Device | Information                                                  |
| ------ | ------------------------------------------------------------ |
| AWAC   | To fix the `System Clocks` found on newer hardware           |
| ALS0   | Optional/Not Needed. Normally, real `iMac` is include this device information. **Patch:** `smc-als` and `AppleLMUController`). These patch is only `Cosmetics`, nothing much we can do |
| PLUG   | To allow the kernel's `XCPM / XNU's CPU Power Management` to manage CPU's power management |
| EC     | Fake Embedded Controller / EC drivers since `CML` don't have native support EC |
| IGPU   | An Intel® Intergrated Graphics Unit device.`GFX0` to `IGPU` rename |
| IMEI   | An Intel® Management Engine Interface.`HECI` to `IMEI` rename |
| MCHC   | Come with `SBUS` patch to aids with correct temperature, fan, voltage, ICH, etc readings and proper memory reporting |
| GFX0   | Display Output from `Dedicated Graphic Processor Unit / DGPU`. `_SUN` is added to get proper PCI Slot Number |
| HDAU   | Audio Output device through HDMI, called as `High Definition Audio`. `_SUN` is added to get proper PCI Slot Number |
| HDEF   | Audio device, known as `High Definition Audio System / HDAS` in actual `DSDT`, renamed with `HDEF` |
| LPCB   | Path of `Low Pin Count Bus` which is corresponding to Embed Controller/EC |
| PPMC   | Classed as `Memory Controller` in `Comet Lake (CML)` platform. **Patch:** Compatible `AppleIntelPCHPMC` support `pci8086,a2a1`, identical to `CML` device `pci8086,a3a1` |
| TSUB   | Known as `Thermal Subsystem` rename which is not identical using `ioreg`. Rename `pci8086,a3b1` to `TSUB` |
| XHC    | Board `Comet Lake PCH-V USB Controller` device               |
| ARPT   | Rename Broadcom device, BCM94360 `RP03,PXSX` to `RP03,ARPT`. Device is pointed to `M2- 3` Wifi Slot |
| RTL0   | Rename `RTL8125 2.5GbE Controller` device as `RP04,PXSX` to `RP04,RTL0` |
| PXSX   | PCIe USB card, `VIA USB 3.0 eXtensible Host Controller` device |
| ANS0   | Rename Kingston A2000 NVMe, `RP09,PXSX` to `RP09,ANS0`. Device is pointed to `M2- 1` Slot. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| ANS2   | Rename Silicon Power MAP1001 NVMe, `RP20,PXSX` to `RP20,ANS2`. Device is pointed to `Slot- 2`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| ANS1   | Rename Kingston A2000 NVMe, `RP21,PXSX` to `RP21,ANS1`. Device is pointed to `M2- 2` Slot. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| SATA   | Serial ATA Device. Rename `SATA` to `SAT0`                   |
| SBUS   | Fix `AppleSMBus` support in MacOS.  i.e: `AppleSMBusController`, `AppleSMBusPCI`, `Memory Reporting` and `etc |
| USBX   | USB `Power Properties` for Skylake and newer motherboard generation |

**Refer:** OpenCore [SSDT-B460M-SL.dsl](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-B460M-SL.dsl)

<p align="center"><img width="1015" alt="Screen Shot 2022-04-21 at 11 56 42 PM" src="https://user-images.githubusercontent.com/72515939/164502200-d2e8d65c-fc4f-486f-9e66-c83d4013c870.png"></p>

<br>

### 3.0 - OC\Drivers

<p align="justify">Only use 2 basic driver types. HfsPlus.efi and OpenRuntime.efi. Both files are essentially basic things to get driver support. Usage information is as follows:</p>

| Driver          | Information                                                  |
| --------------- | ------------------------------------------------------------ |
| HfsPlus.efi     | Official `HFS+ Driver` Support for Apple MacOS               |
| OpenRuntime.efi | `AptioMemoryFix.efi` (Clover Boot-loader) replacement. Used as an extension for OpenCore to help with patching boot.efi for NVRAM fixes and better memory management |

<p align="center"><img width="1032" alt="Screen Shot 2022-04-22 at 12 02 22 AM" src="https://user-images.githubusercontent.com/72515939/164503478-e15e3795-6811-4197-8a20-7492e0a27151.png"></p>


<br>

### 4.0 - OC\Kext

<p align="justify">Kernel extensions (kexts) let developers load code directly into the MacOS kernel. However, the kext used is not an official kext. This is some community effort for the use of Hackintosh users. The kext used is mostly a layer emulator, driver, and sensor. The rest is to improve other needed function. The table below contains some kexts used to properly boot MacOS through OpenCore</p>

| Kext                | Information                                                  |
| ------------------- | ------------------------------------------------------------ |
| Lilu                | `Arbitrary kext` and `process patching` on MacOS             |
| VirtualSMC          | `System Management Controller` (SMC) emulator layer          |
| AppleALC            | Enabling `native MacOS HD audio` for unofficial codecs       |
| Whatevergreen       | `Various patches` necessary for certain `ATI`/`AMD`/`Intel`/`Nvidia` GPUs |
| SMCProcessor        | Additional support for `VirtualSMC`. Used for monitoring `CPU` temperature |
| SMCSuperIO          | Additional support for `VirtualSMC`. Used for monitoring `FAN` speed |
| SMCRadeonGPU        | Based on `FakeSMCs`, `RadeonMonitor` to provide `GPU` temperature to a dedicated gadget |
| RadeonSensor        | To read the `GPU` temperature. `Lilu` is required            |
| LucyRTL8125Ethernet | Ethernet device, `Realtek RTL8125 2.5G bit Ethernet Controllers` driver |
| USBMap              | Kext to `route` selected `USB ports` to `Physical Ports` via USB port address. This is `compulsory to handle` `15 port limit` requirements by MacOS |

**Remark:** All kext used are `DEBUG` versions.

<p align="center"><img width="1032" alt="Screen Shot 2022-04-22 at 12 06 44 AM" src="https://user-images.githubusercontent.com/72515939/164503777-fce8443a-a61f-4e83-aacf-58b288d93cd7.png"></p>

**Sort by Priorities:** All kext need to be arranged/sort in priority in order to give the impression of a better injection for the system.

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 07 16 AM" src="https://user-images.githubusercontent.com/72515939/164503788-601ae833-9f59-47a2-a19b-3f32c2852446.png"></p>


**Additional:** `IOAHCIBlockStorage` patch for SSD to enable `Trim` option via `Kernel\Patch`. Refer [config.plist](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/dbg-monterey-bigsur_config.plist).

<p align="center"><img width="1015" alt="Screen Shot 2022-04-20 at 12 28 18 AM" src="https://user-images.githubusercontent.com/72515939/164051402-d2743892-2cec-41aa-8415-4b3f41892fdc.png"></p>


<br>

### 5.0 - OC\OpenCore.efi

An OpenCore Extensible Firmware Interface (.efi) format. Normally this file is include with [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg/releases/) and it is compulsory.

<br>

### 6.0 - OC\Resources

<p align="justify">This folder is related to OpenCore Beauty Treatment and is used with the OpenCanopy.efi driver. It is up to you to do your own research for a custom boot menu.</p>

**Refer:** [OC Binary Resource](https://github.com/acidanthera/OcBinaryData)

<br>

### 7.0 - OC\Tools

<p align="justify">Nothing fancy, just additional tool "CleanNvram.efi" which is ResetNVRAM alternative bundled as a standalone tool, available when included into Tools folder and config.plist. This tool is hiding via "hide auxiliary". Use "Spacebar" to reveal the function. I just include this tools as failsafe.</p>

<br>

### 8.0 - OC\config.plist

<p align="justify">Property list based on xml code. Structured OpenCore/Clover method and upgraded injection function. An Apple.Inc plist is a MacOS preference, also a file for the application that it holds the preference settings for. By trashing and then relaunching an application you are getting rid of old user set preferences that may have become corrupt. OpenCore use this kind of file to inject (match, overcome and manipulate) specicied information to unsupport hardware/device. 
Besides, a plist is often used to correct problems that a user may be having with an application.</p>

**Refer:**

- OpenCore [Catalina](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/catalina_config.plist)
- OpenCore [Monterey/BigSur-Debug](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/dbg-monterey-bigsur_config.plist)
- OpenCore [Monterey/BigSur](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/monterey-bigsur_config.plist)
- Clover [Catalina](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/clover_config.plist) (Note: may not work on Monterey/BigSur)

<br>

## Quirks Check

<p align="justify">Quirks must set as processor codename. Refer OpenCore Getting Started and head to Configs. For easy settings, use OCAuxiliaryTools. However, this is not recommended. Any error occur to config.plist is by your own responsibility. Manual setup is encourage. Please make a backup before using it. Link can be refer below:</p>

- [OpenCore Getting Started](https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html) - Recommended
- [OCAuxilliaryTools](https://github.com/ic005k/OCAuxiliaryTools) - Easy Setup (Not Recommended)

<p align="justify">The list below is the Quirk settings for Comet Lake Processor:</p>

**ACPI\Quirks**

- None

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 14 41 AM" src="https://user-images.githubusercontent.com/72515939/164505309-65fb3904-a0ea-4c58-95a1-b786a793b726.png"></p>

**Booter\Quirks**

- AvoidRuntimeDefrag
- DevirtualiseMmio
- EnableSafeModeSlide
- ProtectUefiServices
- ProviceCustomSlide
- RebuildAppleMemoryMap
- SyncRuntimePermissions
- ProvideMaxSlide = `0`
- ResizeAppleGpuBars = `-1`

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 15 05 AM" src="https://user-images.githubusercontent.com/72515939/164505410-32911711-727d-40f9-9d2a-f542700b5dcc.png"></p>

**Kernel\Quirks**

- CustomSMBIOSGuid
- DisableIoMapper
- DisableLinkeditJettison
- PanicNoKextDump
- PowerTimeoutKernelPanic
- SetApfsTimeout = `0`

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 15 48 AM" src="https://user-images.githubusercontent.com/72515939/164505506-bc2e3705-8225-407d-a486-0b232f4a5fed.png"></p>

**UEFI\Quirks**

- EnableVectorAcceleration
- RequestBootVarRouting
- ExitBootServiceDelay = `0`
- ResizeGPUBars = `-1`
- TscSyncTimeout = `0`

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 15 26 AM" src="https://user-images.githubusercontent.com/72515939/164505602-4cf5069b-bdf2-4017-8a54-336f82464ad4.png"></p>

<br>

## Headless UHD Graphics 630 Settings

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>DeviceProperties</key>
	<dict>
		<key>Add</key>
		<dict>
			<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
			<dict>
				<key>AAPL,ig-platform-id</key>
				<data>
				AwDFmw==
				</data>
				<key>AAPL,slot-name</key>
				<string>Internal</string>
				<key>device_type</key>
				<string>Display controller</string>
				<key>enable-metal</key>
				<data>
				AQAAAA==
				</data>
				<key>hda-gfx</key>
				<string>onboard-1</string>
				<key>igfxfw</key>
				<data>
				AgAAAA==
				</data>
				<key>igfxonln</key>
				<data>
				AQAAAA==
				</data>
				<key>iommu-selection</key>
				<data>
				AAAAAA==
				</data>
				<key>rps-control</key>
				<data>
				AQAAAA==
				</data>
				<key>shikigva</key>
				<integer>80</integer>
			</dict>
		</dict>
	</dict>
</dict>
</plist>
```
**4k Youtube Test via Safari**

<p align="center"><img width="1072" alt="Screen Shot 2022-04-22 at 10 42 16 PM" src="https://user-images.githubusercontent.com/72515939/164738809-cb236c03-d749-41b1-b7cd-e40e31af9a38.png"></p>

<p align="center"><img width="1973" alt="Screen Shot 2022-04-22 at 10 42 27 PM" src="https://user-images.githubusercontent.com/72515939/164739320-c938df8d-6121-4842-a619-042117ec5d31.png"></p>

<br>

## BIOS/UEFI Settings

1. Disable `CSM/ Enable UEFI`
2. Disable `Secure Boot`
3. Set `SATA` as `AHCI` (Do not install MacOS through `Rapid Storage Technology/RST`)
4. Disable `CFG Lock`
5. Disable `Fast Boot`
6. Disable `Intel Virtualization Technology`
7. Disable `VT-D`
8. Enable` XHCI Hand-off`
9. Disable `Legacy USB Support` (If Needed)

<br>

## Results

<p align="center"><img width="697" alt="Screen Shot 2022-04-21 at 11 51 26 PM" src="https://user-images.githubusercontent.com/72515939/164501037-d74cc18f-05d2-4707-aa47-35957e5b283b.png"></p>
<p align="center"><img width="549" alt="Screen Shot 2022-04-22 at 12 13 10 AM" src="https://user-images.githubusercontent.com/72515939/164504863-484cfd77-b5a6-472d-8b51-5a99d7e85521.png"></p>
<p align="center"><img width="2560" alt="Screen Shot 2022-04-21 at 11 51 19 PM-min" src="https://user-images.githubusercontent.com/72515939/164502014-03a9f631-69b5-4035-b571-70a28c576ca2.png"></p>

<br>

## Ioreg

[iMac20,1-Hack](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/iMac20%2C1-Hack.ioreg)

<br>

## Debug Log

[OpenCore Debug Log](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/opencore-2022-04-19-153310.txt)

<br>

## Acknowledgements

I would like to thanks all folks in Hackintosh Community especially:

- [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for a great guide
- [Acidanthera](https://github.com/acidanthera) for [OpenCore](https://github.com/acidanthera/OpenCorePkg) Boot-loader. KUDOS for them
- [CorpNewt](https://github.com/corpnewt) for developing simple [USBmap](https://github.com/corpnewt/USBMap) tools
- [dhinakg](https://github.com/USBToolBox/tool) for developing easy Windows based USBmap, [USBToolBox](https://github.com/USBToolBox/tool) which inspired by CorpNewt USBMap
- [Hackintosh Malaysia](https://www.facebook.com/groups/HackintoshMalaysia/about/) for knowledge sharing
- [r/Hackintosh](https://www.reddit.com/r/hackintosh/) for an easy undocumented references
- [daliansky](https://github.com/daliansky) for publishing his own [OpenCore](https://github.com/acidanthera/OpenCorePkg) [ACPI](https://kb.iu.edu/d/ahvl) method, known as [OC-Little](https://github.com/daliansky/OC-little)
- [5T33Z0](https://github.com/5T33Z0/OC-Little-Translated) for translating [daliansky](https://github.com/daliansky) [OC-Little](https://github.com/daliansky/OC-little) which known as [OC-Little Translate](https://github.com/5T33Z0/OC-Little-Translated). Also informative [Clover Crate](https://github.com/5T33Z0/Clover-Crate) for [Clover-bootloader](https://github.com/CloverHackyColor/CloverBootloader)
- [rusty-bits](https://github.com/rusty-bits) for an easy [cross platform](https://en.wikipedia.org/wiki/Cross-platform_software) OS EFI update , known as [octool](https://github.com/rusty-bits/octool)
