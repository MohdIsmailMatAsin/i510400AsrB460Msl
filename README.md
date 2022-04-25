# Hackintosh: Intel i5 10400 & Asrock B460M Steel Legend

<p align="center"><img width="698" alt="Screen_Shot_2022-04-25_at_2_37_12_PM" src="https://user-images.githubusercontent.com/72515939/165034862-e026562b-ff8e-4ac0-b6ce-26c2b763443b.png"></p>

###### **Reminder:** 

###### <p align="justify">This is not an official method. All the information displayed is based on actual hardware and an experimental basis. Half of the information is taken from [Dortania](https://dortania.github.io/OpenCore-Install-Guide/), while others are taken from several well-known sources. This is an informative explanation related to [OpenCore](https://github.com/acidanthera/OpenCorePkg). For [Clover](https://github.com/CloverHackyColor/CloverBootloader), please refer to [Clover Crate](https://github.com/5T33Z0/Clover-Crate) by [5T33Z0](https://github.com/5T33Z0)</p>

## Information 

| Info      | Details                          | Info        | Details                                       |
| --------- | -------------------------------- | ----------- | --------------------------------------------- |
| OS 1      | Microsoft Windows 11 Pro         | Audio 1     | 7.1 CH HD Audio (Realtek ALC1200 Audio Codec) |
| OS 2      | MacOS Monterey 12.3.1            | Audio 2     | U-Phoria UM2 USB Audio Device                 |
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

**Remark:** <p align="justify">The settings above may not be the same as the recommended settings by Dortania. To find out more, please check [OpenCore Configuration](https://dortania.github.io/docs/release/Configuration.html) and [Dortania, Apple Secure Boot](https://dortania.github.io/OpenCore-Post-Install/universal/security/applesecureboot.html#securebootmodel) for SecureBootModel selection.</p> 

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

<p align="justify">A boot-loader, also known as a boot programme or bootstrap loader, is a special operating system software that loads into the working memory of a computer after start-up. For this purpose, immediately after a device starts, a boot-loader is generally launched by a bootable medium like a hard drive, a CD/DVD, or a USB stick. The boot medium receives information from the computer’s firmware (e.g., BIOS) about where the boot-loader is. The whole process is also described as "booting". OpenCore, Clover, rEFInd, reEFIt, Chameleon, and a few other names are known as boot-loaders. Most of these boot-loaders are capable of being chain-loaders or chain-loading. A chain-loader is similar to the use of overlays. Unlike overlays, chain-loaders replace the currently executing programme in its entirety. Overlays usually replace only a portion of the running program. Like the use of overlays, the use of chain-loading increases the I/O load of an application.</p>

<br>

## Partitioning

- **Windows**

<p align="center"><img width="827" alt="Screenshot 2022-04-03 133920" src="https://user-images.githubusercontent.com/72515939/161430959-f530d4a2-812f-43ec-9b78-6b54522f3a50.png"></p>

- **MacOS**

<p align="center"><img width="830" alt="Screenshot 2022-04-03 134003" src="https://user-images.githubusercontent.com/72515939/161430979-9b890a71-a348-439b-98df-0e53e6a49da8.png"></p>

- **OpenCore**

<p align="center"><img width="830" alt="Screenshot 2022-04-03 134003" src="https://user-images.githubusercontent.com/72515939/161431087-8fadbe79-bdc6-49fc-8721-eb149db7ede0.png"></p>

<p align="justify">OpenCore is what we refer to as a boot-loader and also a chain-loader at the same time; it is a complex piece of software that we use to prepare our systems for MacOS, specifically by injecting new data for MacOS such as SMBIOS, ACPI tables, and kexts.</p>

**Remark:** <p align="justify">As an alternative, we can use [DiskGenius] (https://www.diskgenius.com) to identify the storage structure. [DiskGenius] (https://www.diskgenius.com)  is an application for Windows only, and it is very useful for manipulating drives and for various other purposes. You can select and click on the EFI partition to see the contents contained in the partition.</p> 

<p align="center"><img width="928" alt="Screenshot_2022-04-25_154348" src="https://user-images.githubusercontent.com/72515939/165044631-18ae41ca-e03a-4623-96af-a4549f1401f3.png"></p>
<p align="center"><img width="927" alt="Screenshot_2022-04-25_154415" src="https://user-images.githubusercontent.com/72515939/165045187-c73b1669-016c-45c8-8fa0-10bbd741c423.png"></p>
<p align="center"><img width="912" alt="Screenshot 2022-04-25 154456" src="https://user-images.githubusercontent.com/72515939/165045206-5be20c3a-f490-4409-8cbd-4743013e35c5.png"></p>

<br>

## EFI Structure

The basic OpenCore folder structure. This folder contain several sub files and folders.

```zsh
mohdismailmatasin@Mohds-iMac ~ % cd /Volumes/EFI 
mohdismailmatasin@Mohds-iMac EFI % tree
.
└── EFI
    ├── BOOT
    │   └── BOOTx64.efi
    └── OC
        ├── ACPI
        │   └── SSDT-B460M-SL.aml
        ├── Drivers
        │   ├── HfsPlus.efi
        │   ├── OpenCanopy.efi (Disable on Debug)
        │   └── OpenRuntime.efi
        ├── Kexts
        │   ├── AppleALC.kext
        │   ├── Lilu.kext
        │   ├── LucyRTL8125Ethernet.kext
        │   ├── RadeonSensor.kext
        │   ├── SMCLightSensor.kext
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
**Remark:** Generally best to debug systems without `OpenCanopy.efi`, if required make sure this file is from `DEBUG` else there will be virtually no debug information. `Picker` mode use `Built-In` menu.

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

**Windows & Linux Implementation**

`Windows`

1. Temporary: `EFI\boot\bootx64.efi`

<p align="center"><img width="1032" alt="Screen Shot 2022-04-25 at 2 49 56 PM" src="https://user-images.githubusercontent.com/72515939/165035398-e1f47b62-3dc5-4dd4-9fb8-22e740950d52.png">
<p align="center"><img width="1032" alt="Screen Shot 2022-04-25 at 2 50 01 PM" src="https://user-images.githubusercontent.com/72515939/165035430-d2384e0a-8971-4aac-bad1-de9d2c616b7e.png">
<p align="center"><img width="1032" alt="Screen Shot 2022-04-25 at 2 50 06 PM" src="https://user-images.githubusercontent.com/72515939/165035435-9b882eb2-dfc4-4101-85a4-10d37d700dd1.png">

2. Permanent: `EFI\Microsoft\Boot\bootmgfw.efi` (Windows Boot Manager/UEFI which contain a GUID reference)
	
<p align="center"><img width="1032" alt="Screen Shot 2022-04-25 at 2 51 41 PM" src="https://user-images.githubusercontent.com/72515939/165035559-0f2fd41d-d143-4514-8ac6-cbdbe9a9fe72.png"></p>
<p align="center"><img width="1032" alt="Screen_Shot_2022-04-25_at_2_51_46_PM" src="https://user-images.githubusercontent.com/72515939/165035929-1bad4e02-ca12-4394-9ce5-837f19ce8453.png"></p>

`Linux`

1. Temporary: `EFI\boot\bootx64.efi`
2. Permanent: `EFI\Ubuntu\grubx64.efi` (No Secure Boot Support)
3. Permanent: `EFI\Ubuntu\shimx64.efi` (Secure Boot Support)

**OpenCore Implementation**

`OpenCore`

1. Temporary: `EFI\BOOT\BOOTx64.efi` via USB Drive (Installation Device)
2. Permanent: `EFI\BOOT\BOOTx64.efi` via HDD/SSD/NVMe (MacOS Drive)

<p align="justify">While OpenCore is just a boot-loader, this type of boot-loader is included with their own firmware, along with additional quirks for booting the MacOS partition. It is so special isn't it? Furthermore, OpenCore has portable features that enable the chain-loader option to be used with other operating systems.</p>

<p align="center"><img width="1032" alt="Screen Shot 2022-04-25 at 2 56 11 PM" src="https://user-images.githubusercontent.com/72515939/165036295-62968fcf-135c-4979-85db-9a71e9db4b09.png"></p>
<p align="center"><img width="1032" alt="Screen Shot 2022-04-25 at 2 56 14 PM" src="https://user-images.githubusercontent.com/72515939/165036304-fb3a0561-70b0-4a71-b2c6-65cff8e2200e.png"></p>
<p align="center"><img width="1032" alt="Screen Shot 2022-04-25 at 2 56 17 PM" src="https://user-images.githubusercontent.com/72515939/165036309-1a46324c-1011-4b00-867a-493cc89ed049.png"></p>
<p align="center"><img width="1032" alt="Screen_Shot_2022-04-25_at_2_56_27_PM" src="https://user-images.githubusercontent.com/72515939/165036613-5667f4ad-e43f-4529-baed-0b326d8e13f1.png"></p>

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
| ALS0   | Optional/Not Needed. Normally, real `iMac` is include this device information. **Patch:** `smc-als` and `AppleLMUController`. These patch is only `Cosmetics`, nothing much we can do |
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

<p align="center"><img width="1036" alt="Screen_Shot_2022-04-25_at_2_41_37_PM" src="https://user-images.githubusercontent.com/72515939/165034935-9e54e24e-87fc-4d4a-93cd-79621119b41c.png"></p>


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

<p align="center"><img width="1032" alt="Screen_Shot_2022-04-25_at_3_00_24_PM" src="https://user-images.githubusercontent.com/72515939/165037853-94893f7d-7950-447a-a57f-745e93fe9ce8.png"></p>

**Sort by Priorities:** Select which kext, sort in priority to get better kext injection.

<p align="center"><img width="1356" alt="Screen_Shot_2022-04-25_at_3_09_08_PM" src="https://user-images.githubusercontent.com/72515939/165038719-33ac2cca-1cf5-4aae-85de-7caa88c3ccff.png"></p>

**Additional:** `IOAHCIBlockStorage` patch for SSD to enable `Trim` option via `Kernel\Patch`. Refer [config.plist](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config_debug.plist).

<p align="center"><img width="1426" alt="Screen Shot 2022-04-25 at 1 00 18 PM" src="https://user-images.githubusercontent.com/72515939/165023853-616c5d80-dda3-4e94-b0e8-fbba3d226fcb.png"></p>

<p align="center"><img width="1015" alt="Screen Shot 2022-04-20 at 12 28 18 AM" src="https://user-images.githubusercontent.com/72515939/164051402-d2743892-2cec-41aa-8415-4b3f41892fdc.png"></p>

<br>

### 5.0 - OC\OpenCore.efi

An OpenCore Extensible Firmware Interface (.efi) format. Normally this file is include with [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg/releases/) and it is compulsory.

<p align="center"><img width="882" alt="Screen Shot 2022-04-25 at 1 10 05 PM" src="https://user-images.githubusercontent.com/72515939/165024487-a626140e-fbf4-41b6-806f-7d1df76a95ec.png"></p>

**Remark:** `OpenCore.efi` is an extension based on `version value`. `Different versions` may not work with `different config.plist`.

<br>

### 6.0 - OC\Resources

<p align="justify">This folder is related to OpenCore Beauty Treatment and is used with the OpenCanopy.efi driver. It is up to you to do your own research for a custom boot menu.</p>

<p align="center"><img width="882" alt="Screen Shot 2022-04-25 at 1 18 08 PM" src="https://user-images.githubusercontent.com/72515939/165025116-3361c542-d1bb-4730-8792-bc247e83f543.png"></p>

**Refer:** [OC Binary Resource](https://github.com/acidanthera/OcBinaryData)

<br>

### 7.0 - OC\Tools

<p align="justify">Nothing fancy, just additional tool "CleanNvram.efi" which is ResetNVRAM alternative bundled as a standalone tool, available when included into Tools folder and config.plist. This tool is hiding via "hide auxiliary". Use "Spacebar" to reveal the function. I just include this tools as failsafe.</p>

<p align="center"><img width="882" alt="Screen Shot 2022-04-25 at 1 18 58 PM" src="https://user-images.githubusercontent.com/72515939/165025190-86dd61a2-ebe6-4ad9-bec6-73da1f1ef9bc.png"></p>

<br>

### 8.0 - OC\config.plist

<p align="justify">Property list based on xml code. Structured OpenCore/Clover method and upgraded injection function. An Apple.Inc plist is a MacOS preference, also a file for the application that it holds the preference settings for. By trashing and then relaunching an application you are getting rid of old user set preferences that may have become corrupt. OpenCore use this kind of file to inject (match, overcome and manipulate) specified information to unsupport hardware/device. 
Besides, a plist is often used to correct problems that a user may be having with an application.</p>

<p align="center"><img width="959" alt="Screen Shot 2022-04-25 at 1 19 39 PM" src="https://user-images.githubusercontent.com/72515939/165025284-c442cf30-0099-4f94-8634-19b9877d153a.png"></p>

**Refer:**

- OpenCore [Monterey/BigSur-Debug](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config_debug.plist)
- OpenCore [Monterey/BigSur-Release](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config_release.plist)
- Clover [Monterey/BigSur-Release](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config_clover.plist) 

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

**XML**

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

**PLIST**

<p align="center"><img width="477" alt="Screen Shot 2022-04-24 at 11 29 58 PM" src="https://user-images.githubusercontent.com/72515939/164984010-95cbbf14-17e4-46ee-991b-e244b4a012da.png"></p>

	
<br>	

**IGPU and DGPU Test. Is both Optimized? 4k Youtube Test via Safari**

<p align="justify">We will conduct a 4K test via Safari (BigSur & Monterey). Use Launchpad > Other > ActivityMonitor. The use of boot-arg igfxonline = 1 or properties of the IGPU, i.e., igfxonline > data > 01000000, is to leave the IGPU in a state of always being online. To open additional GPU tabs on the activity monitor, igfxmetal = 1 or device properties on IGPU enable-metal > data > 01000000, AAPL, ig-platform-id, and AAPL, slot-name are required. Next, we can start the test as shown in the picture.</p>

<p align="center"><img width="1072" alt="Screen_Shot_2022-04-25_at_3_16_43_PM" src="https://user-images.githubusercontent.com/72515939/165040712-2b0e8ccb-59ad-4bca-ac4c-e9e453f5132a.png"></p>
<p align="center"><img width="1329" alt="Screen_Shot_2022-04-25_at_3_17_33_PM" src="https://user-images.githubusercontent.com/72515939/165040238-e6f9c55f-dfdc-40a9-9893-9fe45f331fe3.png"></p>

<br>

## Power Issues

<p align="justify">If there is a problem with power, use Hackintool to reset. The diagram below shows how to do this:</p>

Tool: [Hackintool](https://github.com/headkaze/Hackintool)

<img width="1140" alt="Screen Shot 2022-04-23 at 4 54 13 PM" src="https://user-images.githubusercontent.com/72515939/164887926-4ddbd9e1-e673-49a1-9066-e4f04053db5a.png">

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
<p align="center"><img width="2560" alt="Screen Shot 2022-04-23 at 4 28 52 PM" src="https://user-images.githubusercontent.com/72515939/164886899-69d7b602-1ac0-4d15-afe1-63eb31958516.png"></p>

<br>

## DRM Test

- [✓] AppleTV
- [✕] OpenCore [Fairplay Test](https://drive.google.com/file/d/12pQ5FFpdHdGOVV6jvbqEq2wmkpMKxsOF/view)
- [✓] Netflix

**Remark:** Without shikigva patch.


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
- [acidanthera](https://github.com/acidanthera) for [OpenCore](https://github.com/acidanthera/OpenCorePkg) Boot-loader and powerful ACPI compiler, [MaciASL](https://github.com/acidanthera/MaciASL)
- [corpNewt](https://github.com/corpnewt) for developing simple [USBmap](https://github.com/corpnewt/USBMap) tools
- [dhinakg](https://github.com/USBToolBox/tool) for developing easy Windows based USBmap, [USBToolBox](https://github.com/USBToolBox/tool) which inspired by [corpNewt](https://github.com/corpnewt) [USBmap](https://github.com/corpnewt/USBMap)
- [Hackintosh Malaysia](https://www.facebook.com/groups/HackintoshMalaysia/about/)
- [headkaze](https://github.com/headkaze) for the Swiss Army Knife of Vanilla Hackintoshing, known as [Hackintool](https://github.com/headkaze/Hackintool) and [EFIAgent](https://github.com/headkaze/EFI-Agent)
- [r/Hackintosh](https://www.reddit.com/r/hackintosh/)
- [daliansky](https://github.com/daliansky) for publishing his own [OpenCore](https://github.com/acidanthera/OpenCorePkg) [ACPI](https://kb.iu.edu/d/ahvl) method, known as [OC-Little](https://github.com/daliansky/OC-little)
- [5T33Z0](https://github.com/5T33Z0/OC-Little-Translated) for translating [daliansky](https://github.com/daliansky) [OC-Little](https://github.com/daliansky/OC-little) which known as [OC-Little Translate](https://github.com/5T33Z0/OC-Little-Translated). Also informative [Clover Crate](https://github.com/5T33Z0/Clover-Crate) for [Clover-bootloader](https://github.com/CloverHackyColor/CloverBootloader)
- [rusty-bits](https://github.com/rusty-bits) for [cross platform](https://en.wikipedia.org/wiki/Cross-platform_software) OpenCore EFI update , known as [octool](https://github.com/rusty-bits/octool)
