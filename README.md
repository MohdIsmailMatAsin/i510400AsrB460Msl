# HACKINTOSH: INTEL i5 10400 & ASROCK B460M STEEL LEGEND

![Website](https://img.shields.io/website?down_color=Grey&down_message=Broken&up_color=blue&up_message=Online&url=https%3A%2F%2Fgithub.com%2FMohdIsmailMatAsin%2Fi510400AsrockB460MSteelLegend)

![Artboard 1](https://user-images.githubusercontent.com/72515939/166086285-c5c771ed-e4d4-409a-b2d5-2e3f4c4325ea.png)

**Reminder:**<p align="justify">
This is not an **official** method. All the information displayed is based on actual hardware and an experimental basis. Half of the information is taken from [Dortania](https://dortania.github.io/OpenCore-Install-Guide/), while others are taken from several well-known sources. This is an informative explanation related to [OpenCore](https://github.com/acidanthera/OpenCorePkg). For [Clover](https://github.com/CloverHackyColor/CloverBootloader), please refer to [Clover Crate](https://github.com/5T33Z0/Clover-Crate) by [5T33Z0](https://github.com/5T33Z0)
</p>

</br>

## INFORMATION

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

</br>

## APFS CHANGES

| MacOS     | Mindate   | MinVersion       | SetApfsTrimTimeout | SecureBootModel       |
|-----------|-----------|------------------|--------------------|-----------------------|
| Catalina  | 20200306  | 1412101001000000 | 0		        | j185-10.15.6 (19G2005)|
| BigSur    | 0         | 0                | 0                  | j185-10.15.6 (19G2005)|
| Monterey  | 0         | 0                | 0                  | j185-10.15.6 (19G2005)|

**Remark:**<p align="justify">
The settings above may not be the same as the recommended settings by Dortania. To find out more, please check [OpenCore Configuration](https://dortania.github.io/docs/release/Configuration.html) and [Dortania, Apple Secure Boot](https://dortania.github.io/OpenCore-Post-Install/universal/security/applesecureboot.html#securebootmodel) for SecureBootModel selection.
</p> 

</br>

## INTRODUCTION

### Legacy BIOS

<p align="justify">
📌	Legacy Boot refers to the boot process used by the BIOS firmware to initialize hardware devices. The Legacy boot contains a selection of installed devices that get initialized as the computer performs the POST test during the boot process. The legacy boot will check for all connected devices for the Master Boot Record (MBR), usually in the first sector of a disk. When it can’t find a bootloader in the devices, Legacy switches to the next device in the list and keeps repeating this process until it finds a boot-loader, or if not, returns an error.
</p>

</br>

### Modern BIOS (UEFI)

<p align="justify">
📌	UEFI, or Unified Extensible Firmware Interface, is a modern way of handling the boot process. UEFI is similar to Legacy, but the boot data is stored in a .efi file rather than the firmware. Most UEFIs can be entered by a special key.
</p>

| Manufacturer | BIOS Key  | Manufacturer  | BIOS Key |
|--------------|-----------|---------------|----------|
| ASUS         | F8  	   | Intel         | F10      |
| Gigabyte     | F12       | Asrock        | F11      |
| MSI          | F11       | EVGA          | F7       |

</br>

### UEFI vs Legacy

| UEFI BOOT MODE                       	| LEGACY BOOT MODE                               |   
|---------------------------------------|------------------------------------------------|	
| UEFI provides a better User interface | Legacy Boot mode is traditional and very basic |   
| It uses the GPT partitioning scheme | Legacy uses the MBR partition scheme |  
| UEFI provides faster boot time | It is slower compared to UEFI |  
| Since UEFI uses the GPT partitioning scheme, it can support up to 9 zettabytes of storage devices.| The MBR portioning scheme used by Legacy only supports up to 2 TB storage devices |  
| UEFI runs in 32-bit and 64-bit, allowing support for mouse and touch navigation | Legacy runs in 16-bit mode that only supports keyboard navigation |  
| It allows a secure boot that prevents the loading of unauthorized applications. It may also hinder dual boot because it treats operating systems (OS) as applications.| Legacy runs in 16-bit mode that only supports keyboard navigation |   
| It has an easier update process | It is more complex compared to UEFI |

</br>

### EFI

<p align="justify">
📌	The EFI (Extensible Firmware Interface) system partition, or ESP, is a partition on a data storage device (usually a hard disc drive or solid-state drive) that is used by computers having the Unified Extensible Firmware Interface (UEFI). When a computer is booted, UEFI firmware loads files stored on the ESP to start the installed operating systems and various utilities. The ESP contains the boot loaders or kernel images for all installed operating systems (which are contained in other partitions), device driver files for hardware devices present in a computer and used by the firmware at boot time, system utility programs that are intended to be run before an operating system is booted, and data files such as error logs.
</p>

![efi-system-partition](https://user-images.githubusercontent.com/72515939/161425316-cb229e60-b2ad-4538-9b68-bbabb89a88a8.png)

</br>

### Boot-Loader

<p align="justify">
📌	The term "boot-loader" is a shortened form of the words “bootstrap loader”. The term stems from the fact that the boot manager is the key component in starting up the computer, so it can be likened to the support of a bootstrap when putting a boot on. It is a special operating-system software that loads into the working memory of a computer after start-up. For this purpose, immediately after a device starts, a boot-loader is generally launched by a bootable medium like a hard drive, a CD/DVD or a USB stick. The boot medium receives information from the computer’s firmware (e.g. BIOS) about where the boot-loader is. The whole process is also described as “booting”.
</p>

</br>

### OpenCore

<p align="justify">
📌	OpenCore is referred to as a "boot-loader" and also a "chain-loader". At the same time, it is a complex software program, used to call the operating systems MacOS, Linux, and Windows. In addition, it also has the ability to inject new data into MacOS operating systems such as SMBIOS, Advanced Configuration Table and Power Interface (ACPI), and Kernel Extension (Kext).
</p>

</br>

## PARTITIONING

### Windows

<p align="center">
<img width="827" alt="Screenshot 2022-04-03 133920" src="https://user-images.githubusercontent.com/72515939/161430959-f530d4a2-812f-43ec-9b78-6b54522f3a50.png">
</p>

</br>

### MacOS

<p align="center">
<img width="830" alt="Screenshot 2022-04-03 134003" src="https://user-images.githubusercontent.com/72515939/161430979-9b890a71-a348-439b-98df-0e53e6a49da8.png">
</p>

**Remark:** <p align="justify">
For dual or triple booting PCs, this application is very useful to manage "Windows + MacOS" or "Windows + MacOS + Linux" partition. [DiskGenius](https://www.diskgenius.com) or currently [Partition Guru](https://www.partitionguru.com) is a versatile program packed with comprehensive functions for partition recovery, file recovery, disk management, data backup, disk utilities, etc. It manages storage space with high efficiency, recovers data lost due to disk corruption, formatting, deletion, virus attack, etc. In other mean, "DiskGenius/PartitionGuru" is a simple tool that allows users to manage the partitions on hard drive and to format them, create new ones, or delete. This utility is compatible and works well with virtual hard drives like VMware, VirtualBox and Virtual PC in addition to supporting SCSI, IDE, SATA and USB flash drives or memory cards. The best thing is, this app capable to view and manage EFI/ESP partition which made managing partition so easily if any file required to be edit, especially [OpenCore](https://github.com/acidanthera/OpenCorePkg) or [Clover](https://github.com/CloverHackyColor/CloverBootloader) "config.plist". However, "APFS" and "HFS+" is not fully supported. That's the weak spot of this application. To use APFS and HFS+ formats, [Paragon Hard Disk Manager™ Community Edition](https://www.paragon-software.com/free/pm-express/?msclkid=b2537d35cbb811ecbee6e7525f1ca4a9) can be used. Both combination support may improve user experience.
</p> 

![Artboard 1](https://user-images.githubusercontent.com/72515939/166097226-b35e84ab-0498-419a-a3e6-0cf6e9c276e5.png)

</br>

## OPENCORE PACKAGE & PREPARATION

### Preparation Package (OpenCore v0.8.0)

- 💿	[OpenCore v0.8.0 - Debug](https://github.com/acidanthera/OpenCorePkg/releases/download/0.8.0/OpenCore-0.8.0-DEBUG.zip)
- 💿	[OpenCore v0.8.0 - Release](https://github.com/acidanthera/OpenCorePkg/releases/download/0.8.0/OpenCore-0.8.0-RELEASE.zip)

**Changes:**

- 📢	Added support for `early log preservation`
- 📢	Switched to `Python 3` in scripts (use python /path/to/script to force Python 2)
- 📢	Added `ForceAquantiaEthernet` for Aquantia AQtion AQC-107s based 10GbE network cards support, thx @Mieze and @Shikumo
- 📢	Updated builtin firmware versions for SMBIOS and the rest
- 📢	Added `Misc -> Serial` section to customise serial port properties
- 📢	Added `CustomPciSerialDevice` quirk for XNU to correctly recognise customised `external serial devices`

</br>

### Structure

📌	Below are the basic OpenCore folders and files used for this project:

```zsh
.
└── EFI
	├── BOOT
	│   └── BOOTx64.efi
	└── OC
		├── ACPI
		│   └── SSDT-B460M-SL.aml
		├── Drivers
		│   ├── HfsPlus.efi
		│   ├── OpenCanopy.efi (Disable/Removed on Debug)
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
**Remark:** For the **debugging** process, it is best not to use **OpenCanopy.efi**.

</br>

### 1.0 - EFI\BOOT

<p align="justify">
📌	Fallback boot-loader path. This is the only boot-loader pathname that the UEFI firmware on 64-bit X86 systems will look for without any pre-existing NVRAM boot settings. "Booting" is a term used to refer to the initial loading process when we turn on the computer. BOOTx64.efi is a special file for the boot process that aims to link the "boot-loader" checked by the BIOS before the computer can be used. The boot programme and OpenCore.efi will be searched by the BIOS for UEFI on 64-bit X86 systems without any existing NVRAM boot settings. There are 2 boot types settings, temporary and permanent. The details below describe the files involved in the process.
</p>

</br>

**Temporary vs Permanent:**

💾	Temporary

1. Can be ported to other GUID Partition
2. As a solution to boot certain OS (Depending on Firmware i.e., OpenCore, Clover and rEFInd)

💾	Permanent

1. Cannot be ported due to GUID info binding.
2. Hard to modify

</br>

**Windows & Linux Implementation**

💾	Windows

1. Temporary: `EFI\boot\bootx64.efi` via EFI (USB)
2. Permanent: `EFI\Microsoft\Boot\bootmgfw.efi` (Windows Boot Manager/UEFI which contain a GUID reference) via EFI (HDD/SSD/NVMe)

💾	Linux

1. Temporary: `EFI\boot\bootx64.efi`
2. Permanent: `EFI\Ubuntu\grubx64.efi` (No Secure Boot Support)
3. Permanent: `EFI\Ubuntu\shimx64.efi` (Secure Boot Support)

</br>

**OpenCore Implementation**

💾	OpenCore

1. Temporary: `EFI\BOOT\BOOTx64.efi` via USB Drive (Installation Device)
2. Permanent: `EFI\BOOT\BOOTx64.efi` via HDD/SSD/NVMe (MacOS Drive)

<p align="justify">
📌	While OpenCore is a "boot-loader", it is also capable of some other additional features. It has another mobile feature called "chain-loader," which aims to call different operating systems.
</p>

![Artboard X](https://user-images.githubusercontent.com/72515939/166086925-5b6b1cae-d80e-4fcd-a18b-6d907f5d1b9a.png)

</br>

### 2.0 - OC\ACPI

**Refer:** [ACPI Data Tables and Table Definition Language](https://uefi.org/specs/ACPI/6.4/21_ACPI_Data_Tables_and_Table_Def_Language/ACPI_Data_Tables.html#acpi-data-tables-and-table-definition-language)

</br>

**DSDT**

<p align="justify">
📌	Differentiated System Description Table. It Is a major ACPI table and is used to describe what peripherals the machine has. Also holds information on PCI IRQ mappings and power management. In other mean, an OEM must supply a DSDT to an ACPI-compatible OS. The DSDT contains the Differentiated Definition Block, which supplies the implementation and configuration information about the base system. The OS always inserts the DSDT information into the ACPI Namespace at system boot time and never removes it.
</p>

<p align="center">
<img width="1109" alt="Screen_Shot_2022-04-30_at_3_41_29_PM" src="https://user-images.githubusercontent.com/72515939/166096869-e6b7fe84-c465-4504-ab89-14b8887561ac.png">
</p>

</br>

**SSDT**

<p align="justify">
📌	Secondary System Description Table. SSDTs are a continuation of the DSDT. Multiple SSDTs can be used as part of a platform description. After the DSDT is loaded into the ACPI Namespace, each secondary description table listed in the RSDT/XSDT with a unique OEM Table ID is loaded. This allows the OEM to provide the base support in one table, while adding smaller system options in other tables.
</p>

<p align="center">
<img width="1111" alt="Screen_Shot_2022-04-30_at_3_40_56_PM" src="https://user-images.githubusercontent.com/72515939/166096876-9d9d956e-80ed-477c-b7c3-0897d7c47abe.png">
</p> 

**Refer:** [Definition of Terms](https://uefi.org/specs/ACPI/6.4/02_Definition_of_Terms/Definition_of_Terms.html). For full information on DSDT and SSDT, see [ACPI Specification](https://uefi.org/specs/ACPI/6.4/index.html)

</br>

**ACPI Machine Language (AML)**

<p align="justify">
📌	Pseudo-code for a virtual machine supported by an ACPI-compatible OS and in which ACPI control methods and objects are written. The AML encoding definition is provided in section 19.
</p> 

**Refer:** [ACPI Machine Language (AML) Specification](https://uefi.org/specs/ACPI/6.4/20_AML_Specification/AML_Specification.html)

</br>

**DSDT vs SSDT Patching**

<p align="justify">
📌	As documented by Dortania, "Do not add your DSDT to OpenCore; it's already in your firmware. If you are unsure what this is referring to, go back to the OpenCore guide and select your configuration based on the architecture of your CPU".
</p>

**Refer:** [Dortania](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-easy.html#running-ssdttime)

<p align="justify">
📌	Some computers come with a broken DSDT. It is usually not recommended to patch/override DSDT. Overriding DSDT with garbage can do physical harm to computer. DSDT patches or sometimes called as override should be avoided. Some forums/webpages (i.e., Olarila) state that it is a major solution. While DSDT is the primary table, SSDT can be patched, modified (adding and dropping) the hardware properties which hook inside the machine. There are various reasons why DSDT patching is not recommended.
</p>

</br>

**DSDT Patch** may cause  

- ⚠️	Broken motherboard BIOS, or
- ⚠️	Inefficient device with the wrong injection, or
- ⚠️	Cause malfunction device, or
- ⚠️	PC unable to boot properly due to an incorrect patch (difficult to reverse).

</br>

**SSDT Patch** may affect

- ⚡	ACPI Injection to Windows/Linux. 

<p align="justify">
📌	Mostly, these issue may affect dual booting (Windows + MacOS). Luckily, there are settings via config.plist to prevent both issues, but this is only experimental. Do not assume this settings will work 100% on your machine. Settings is explained via table below:
</p>

| Path         | Path       | Path             | Mode   |
| ------------ | ---------- | ---------------- | ------ |
| PlatformInfo | SerialInfo | UpdateSMBIOSMode | Custom |
| Kernel       | Quirks     | CustomSMBIOSGuid | True   |


<p align="justify">
📌	SSDT patch is the better solution and more reasonable. Any addition or modification does not affect your machine. If an error occurs, it is easy to revert back to the original state. SSDT patch is minor modification and not affect the actual hardware performance.
</p>

</br>

**Patch Applied**

<p align="justify">
📌	Thanks to CorpNewt cross platform SSDTTime hotpatch tool. In this project, various SSDT's has been merged into one (i.e., SSDT-B460M-SL.dsl). With several other sources, additional code is injected to reduce the kext workload. As example, GFX0 to an IGPU rename which handled by Whatevergreen.kext.
</p>


| Device | Information                                                  |
| ------ | ------------------------------------------------------------ |
| ALS0   | Optional/Not Needed. Normally, real `iMac` is include this device information. **Patch:** `smc-als` and `AppleLMUController`. These patch is only `Cosmetics` for Desktop, nothing much we can do |
| ANS0   | Rename Kingston A2000 NVMe, `RP09,PXSX` to `RP09,ANS0`. Device is pointed to `M2- 1` Slot. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| ANS2   | Rename Silicon Power MAP1001 NVMe, `RP20,PXSX` to `RP20,ANS2`. Device is pointed to `Slot- 2`. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| ANS1   | Rename Kingston A2000 NVMe, `RP21,PXSX` to `RP21,ANS1`. Device is pointed to `M2- 2` Slot. **Patch:** Spoof `Generic NVMe` as `Apple SSD Controller` |
| ARPT   | Rename Broadcom device, BCM94360 `RP03,PXSX` to `RP03,ARPT`. Device is pointed to `M2- 3` Wifi Slot |
| AWAC   | To fix the `System Clocks` found on newer hardware           |
| DRAM   | Host bridge (DRAM), or Memory Controller Hub (MCHC). One of two chips comprising the core logic chipset architecture on a PC motherboard |
| EC     | Fake Embedded Controller / EC drivers since `CML` don't have native support EC |
| GFX0   | Display Output from `Dedicated Graphic Processor Unit / DGPU`. `_SUN` is added to get proper PCI Slot Number |
| HDAU   | Audio Output device through HDMI, called as `High Definition Audio`. `_SUN` is added to get proper PCI Slot Number |
| HDEF   | Audio device, known as `High Definition Audio System / HDAS` in actual `DSDT`, renamed with `HDEF` |
| IGPU   | An Intel® Intergrated Graphics Unit device.`GFX0` to `IGPU` rename |
| IMEI   | An Intel® Management Engine Interface.`HECI` to `IMEI` rename |
| LPCB   | Path of `Low Pin Count Bus` which is corresponding to Embed Controller/EC |
| PLUG   | To allow the kernel's `XCPM / XNU's CPU Power Management` to manage CPU's power management |
| PPMC   | Classed as `Memory Controller` in `Comet Lake (CML)` platform. **Patch:** Compatible `AppleIntelPCHPMC` support `pci8086,a2a1`, identical to `CML` device `pci8086,a3a1` |
| PXSX   | PCIe USB card, `VIA USB 3.0 eXtensible Host Controller` device |
| RTL0   | Rename `RTL8125 2.5GbE Controller` device as `RP04,PXSX` to `RP04,RTL0` |
| SBUS   | Fix `AppleSMBus` support in MacOS.  i.e: `AppleSMBusController`, `AppleSMBusPCI`, `Memory Reporting` and `etc |
| SATA   | Serial ATA Device. Rename `SATA` to `SAT0`                   |
| TSUB/THSS   | Known as `Thermal Subsystem`. This device is renamed due to no identical/compatible data using `ioreg`. Rename `pci8086,a3b1` to `TSUB/THSS`. **Patch:** Compatible `AppleIntelPCHPMC` support `pci8086,a2a1`, identical to `CML` device `pci8086,a3a1`. Patch can be added either on `PPMC` or `TSUB/THSS`. `Both` is possible via testing. Remain only one `AppleIntelPCHPMC` patch. Via `PPMC` is better. By default, `TSUB/THSS` is removed via my `config.plist` |
| USBX   | USB `Power Properties` for Skylake and newer motherboard generation |
| XHC    | Board `Comet Lake PCH-V USB Controller` device               |

**Refer:** OpenCore [SSDT-B460M-SL.dsl](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-B460M-SL.dsl)

<p align="center">
<img width="1239" alt="Screen Shot 2022-04-30 at 10 31 53 AM" src="https://user-images.githubusercontent.com/72515939/166087058-3f4572be-a047-41bd-859a-5da51220af26.png">
</p>

</br>

🔧	Tools: 

- 🔨	[SSDTTime](https://github.com/corpnewt/SSDTTime) > Cross Platform (Mac/Linux/Windows)
- 🔨	[MaciASL](https://github.com/acidanthera/MaciASL) > MacOS
- 🔨	[Xiasl](https://github.com/ic005k/Xiasl) > Cross Platform (Mac/Linux/Windows)

</br>

### 3.0 - OC\DRIVERS

<p align="justify">
📌	Only use 2 basic driver types. HfsPlus.efi and OpenRuntime.efi. Both files are essentially basic things to get driver support. Usage information is as follows:
</p>

| Driver          | Information                                                  |
| --------------- | ------------------------------------------------------------ |
| HfsPlus.efi     | Official `HFS+ Driver` Support for Apple MacOS              |
| OpenRuntime.efi | `AptioMemoryFix.efi` (Clover Boot-loader) replacement. Used as an extension for OpenCore to help with patching boot.efi for NVRAM fixes and better memory management |

<p align="center">
<img width="1036" alt="Screen_Shot_2022-04-25_at_2_41_37_PM" src="https://user-images.githubusercontent.com/72515939/165034935-9e54e24e-87fc-4d4a-93cd-79621119b41c.png">
</p>

</br>

### 4.0 - OC\KEXT

<p align="justify">
📌	Kernel extensions (kexts) let users or developers load code directly into the MacOS kernel. However, the kext used is not an official kext. This is some community effort for the use of Hackintosh users. The kext used is mostly a layer emulator, driver, and sensor. The rest is to improve other needed functions. The table below contains some kexts used to properly boot MacOS through OpenCore.
</p>

| Kext                | Information                                                  |
| ------------------- | ------------------------------------------------------------ |
| Lilu                | `Arbitrary kext` and `process patching` on MacOS             |
| VirtualSMC          | `System Management Controller` (SMC) emulator layer          |
| AppleALC            | Enabling `native MacOS HD audio` for unofficial codecs       |
| Whatevergreen       | `Various patches` necessary for certain `ATI`/`AMD`/`Intel®`/`Nvidia` GPUs |
| SMCProcessor        | Additional support for `VirtualSMC`. Used for monitoring `CPU` temperature |
| SMCSuperIO          | Additional support for `VirtualSMC`. Used for monitoring `FAN` speed |
| SMCRadeonGPU        | Based on `FakeSMCs`, `RadeonMonitor` to provide `GPU` temperature to a dedicated gadget |
| RadeonSensor        | To read the `GPU` temperature. `Lilu` is required            |
| LucyRTL8125Ethernet | Ethernet device, `Realtek RTL8125 2.5G bit Ethernet Controllers` driver |
| USBMap              | Kext to `route` selected `USB ports` to `Physical Ports` via USB port address. This is `compulsory to handle` `15 port limit` requirements by MacOS |

**Remark:** All kext used are `DEBUG` versions.

<p align="center">
<img width="1032" alt="Screen_Shot_2022-04-25_at_3_00_24_PM" src="https://user-images.githubusercontent.com/72515939/165037853-94893f7d-7950-447a-a57f-745e93fe9ce8.png">
</p>

</br>

**Sort by Priorities:** Select which kext, sort in priority to get better kext injection.

<p align="center">
<img width="1356" alt="Screen_Shot_2022-04-25_at_3_09_08_PM" src="https://user-images.githubusercontent.com/72515939/165038719-33ac2cca-1cf5-4aae-85de-7caa88c3ccff.png">
</p>

</br>

### 5.0 - OC\OPENCORE.EFI

<p align="justify">
📌	An OpenCore Extensible Firmware Interface ".efi" format. Normally this file is include with OpenCorePkg and it is compulsory.
</p>

<p align="center">
<img width="882" alt="Screen Shot 2022-04-25 at 1 10 05 PM" src="https://user-images.githubusercontent.com/72515939/165024487-a626140e-fbf4-41b6-806f-7d1df76a95ec.png">
</p>

</br>

### 6.0 - OC\RESOURCES

<p align="justify">
📌	This folder is related to OpenCore Beauty Treatment and is used with the OpenCanopy.efi driver. It is up to you to do your own research for a custom boot menu.
</p>

<p align="center">
<img width="882" alt="Screen Shot 2022-04-25 at 1 18 08 PM" src="https://user-images.githubusercontent.com/72515939/165025116-3361c542-d1bb-4730-8792-bc247e83f543.png">
</p>

**Refer:** [OC Binary Resource](https://github.com/acidanthera/OcBinaryData)

</br>

### 7.0 - OC\TOOLS

<p align="justify">
📌	Just additional tool "CleanNvram.efi" which is ResetNVRAM alternative bundled as a standalone tool, available when included into Tools folder and config.plist. This tool is hiding via "hide auxiliary". Use "Spacebar" to reveal the function. I just include this tools as failsafe.
</p>

<p align="center">
<img width="882" alt="Screen Shot 2022-04-25 at 1 18 58 PM" src="https://user-images.githubusercontent.com/72515939/165025190-86dd61a2-ebe6-4ad9-bec6-73da1f1ef9bc.png">
</p>

</br>

### 8.0 - OC\CONFIG.PLIST

<p align="justify">
📌	Property list based on xml code. Structured OpenCore/Clover method and upgraded injection function. An Apple.Inc plist is a MacOS preference, also a file for the application that it holds the preference settings for. By trashing and then relaunching an application you are getting rid of old user set preferences that may have become corrupt. OpenCore use this kind of file to inject (match, overcome and manipulate) specified information to unsupport hardware/device. 
Besides, a plist is often used to correct problems that a user may be having with an application.
</p>

<p align="center">
<img width="959" alt="Screen Shot 2022-04-25 at 1 19 39 PM" src="https://user-images.githubusercontent.com/72515939/165025284-c442cf30-0099-4f94-8634-19b9877d153a.png">
</p>

**Refer:**

- 💿	OpenCore [Monterey/BigSur-Debug](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config_debug.plist)
- 💿	OpenCore [Monterey/BigSur-Release](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config_release.plist)
- 💿	Clover [Monterey/BigSur-Release](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config_clover.plist) 

</br>

🔧	Tools:

- 🔨	[ProperTree](https://github.com/corpnewt/ProperTree) > `Cross Platform (Mac/Linux/Windows)`
- 🔨	[Xplist](https://github.com/ic005k/Xplist) > `Cross Platform (Mac/Linux/Windows)`

</br>

## QUIRKS CHECK

<p align="justify">
📌	Quirks must set as processor codename. Refer OpenCore Getting Started and head to Configs. For easy settings, use OCAuxiliaryTools. However, this is not recommended. Any error occur to config.plist is by your own responsibility. Manual setup is encourage. Please make a backup before using it. Link can be refer below:
</p>

- 🔨	[OpenCore Getting Started](https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html) > `Recommended`
- 🔨	[OCAuxilliaryTools](https://github.com/ic005k/OCAuxiliaryTools) -> `Not Recommended`

<p align="justify">
📌	The list below is the Quirk settings for Comet Lake Processor:
</p>

</br>

**ACPI\Quirks**

- None

<p align="center">
<img width="1227" alt="Screen Shot 2022-04-22 at 12 14 41 AM" src="https://user-images.githubusercontent.com/72515939/164505309-65fb3904-a0ea-4c58-95a1-b786a793b726.png">
</p>

</br>

**Booter\Quirks**

- 🚀	AvoidRuntimeDefrag
- 🚀	DevirtualiseMmio
- 🚀	EnableSafeModeSlide
- 🚀	ProtectUefiServices
- 🚀	ProviceCustomSlide
- 🚀	RebuildAppleMemoryMap
- 🚀	SyncRuntimePermissions
- 🚀	ProvideMaxSlide = `0`
- 🚀	ResizeAppleGpuBars = `-1`

<p align="center">
<img width="1227" alt="Screen Shot 2022-04-22 at 12 15 05 AM" src="https://user-images.githubusercontent.com/72515939/164505410-32911711-727d-40f9-9d2a-f542700b5dcc.png">
</p>

</br>

**Kernel\Quirks**

- 🚀	CustomSMBIOSGuid
- 🚀	DisableIoMapper
- 🚀	DisableLinkeditJettison
- 🚀	PanicNoKextDump
- 🚀	PowerTimeoutKernelPanic
- 🚀	SetApfsTimeout = `0`

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 15 48 AM" src="https://user-images.githubusercontent.com/72515939/164505506-bc2e3705-8225-407d-a486-0b232f4a5fed.png"></p>

</br>

**UEFI\Quirks**

- 🚀	EnableVectorAcceleration
- 🚀	RequestBootVarRouting
- 🚀	ExitBootServiceDelay = `0`
- 🚀	ResizeGPUBars = `-1`
- 🚀	TscSyncTimeout = `0`

<p align="center">
<img width="1227" alt="Screen Shot 2022-04-22 at 12 15 26 AM" src="https://user-images.githubusercontent.com/72515939/164505602-4cf5069b-bdf2-4017-8a54-336f82464ad4.png">
</p>

</br>

## ADDITIONAL FRAMEBUFFER FOR AMD NAVI GPU's

### Framebuffers available in AMDRadeonX6000Framebuffer.kext >> Contents >> Info.plist.

**5700 - Navi 10**
- 🔑	AMDRadeonNavi10Controller
- 🔑	device-id: 0x73101002 0x73121002 0x73181002 0x73191002 0x731A1002 0x731B1002 0x731F1002 0x73BF1002
- 🔑	framebuffer: `ATY,Adder` / `ATY,Ikaheka`

**5600 - Navi 12**
- 🔑	AMDRadeonNavi12Controller
- 🔑	device-id: 0x73601002 0x73621002
- 🔑	framebuffer: `ATY,Sunbeam`

**5500 - Navi 14**
- 🔑	AMDRadeonNavi14Controller
- 🔑	device-id: 0x73401002 0x73411002 0x73431002 0x73471002 0x734F1002
- 🔑	framebuffer: `ATY,Python` / `ATY,Keelback` / `ATY,Boa`

**6800 and 6900 - Navi 21**
- 🔑	AMDRadeonNavi21Controller
- 🔑	device-id: 0x73A01002 0x73A21002 0x73A31002 0x73AB1002 0x73AE1002 0x73AF1002 0x73BF1002
- 🔑	framebuffer: `ATY,Belknap` / `ATY,Carswell` / `ATY,Deepbay`

**6600 - Navi 23**
- 🔑	AMDRadeonNavi23Controller
- 🔑	device-id: 0x73E31002 0x73FF1002 0x73E01002
- 🔑	framebuffer: `ATY,Henbury`

</br>

### Device Properties sample settings

```xml
<key>DeviceProperties</key>
<dict>
	<key>Add</key>
	<dict>
		<key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)</key>
		<dict>
			<key>@0,name</key>
			<string>ATY,Henbury</string>
			<key>@1,name</key>
			<string>ATY,Henbury</string>
			<key>@2,name</key>
			<string>ATY,Henbury</string>
			<key>@3,name</key>
			<string>ATY,Henbury</string>
		</dict>
	</dict>
	<key>Delete</key>
	<dict/>
</dict>
```

</br>

## UHD GRAPHICS 630 HEADLESS MODE

### AAPL,ig-platform-id

<p align="justify">
📌	The keyword for the best headless settings for desktop is "mobile". For desktop (iMac SMBIOS), the framebuffer setting for the "mobile" variant is not required. Open "Hackintool > Patch > Platform ID" option. Find any setting that is not related to the mobile (Mobile = No). The purpose is to find a proper "AAPL,ig-platform-id" for Desktop (iMac SMBIOS). In this case, "0x3E910003" in hexadecimal, which is equal to "0300913E", 4 byte data hex swapped. Below is an example:
</p>

- 📍	0x3E910003 = 0300913E
- 📍	AAPL,ig-platform-id = 0300913E

<p align="center">
<img width="1176" alt="Screen_Shot_2022-05-02_at_5_10_03_PM" src="https://user-images.githubusercontent.com/72515939/166212509-9f300b98-66c5-43f0-abf9-e14dd5e610a2.png">
</p>

</br>

### device-id

<p align="justify">
📌	To get the proper main card platform as headless injection, "device-id" is required to get the device name. On Intel 10th Gen is not necessary, but sometimes this patch may fix certain IGPU issues. As an example, find "Activity Monitor > Window > GPU History" or "Activity Monitor > GPU" extra tab, IGPU will display as "Intel® KBL Unknown".</p>
	
**Refer:** [Issues #1905](https://github.com/acidanthera/bugtracker/issues/1905).
	
<p align="justify">
📌	To proper rename, use "Hackintool" as a guide by finding the appropriate device-id, not in "mobile" mode (Mobile = No). In this case, GPU Hexadecimal "device-id" "0x3E9B8086" which is equal to 4 byte data hex swapped "9B3E0000" is injected via "config.plist" in IGPU "DeviceProperties" section. Below is an example:
</p>

- 📍	0x3E9B8086 = 9B3E8086
- 📍	9B3E8086 = 9B3E0000 (8086 to 0000)
- 📍	device-id = 9B3E0000

<p align="center">
<img width="1172" alt="Screen_Shot_2022-05-02_at_5_27_16_PM" src="https://user-images.githubusercontent.com/72515939/166213623-407d87dd-5368-4430-b8e0-5fc87eb97be1.png">
</p>

</br>

<p align="justify">
📹	4K Video Test is made via Safari on Monterey. Use "Launchpad > Other > ActivityMonitor" as our observation tool. Do note, additional data is needed via "config.plist". The purpose is to leave headless IGPU state to always being online and proper rename IGPU via Activity Monitior instead as "Intel KBL Unknown".
</p>
	
💁	Add additional info based on information below:	

</br>
	
**Inject:**
	
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `AAPL,ig-platform-id` > data > `0300913E`	
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `AAPL,slot-name` > string > `Internal`
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `device-id` > data > `9B3E0000`
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `igfxonln` > data > `01000000`
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `device_type` > string > `Display controller`
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `enable-metal` > data > `01000000`
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `iommu-selection` > data > `00000000`
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `rps-control` > data > `01000000`
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `igfxfw` > data > `02000000`
- 📍	DeviceProperties > PciRoot(0x0)/Pci(0x2,0x0) = `hda-gfx` > string > `onboard-1`

📌	Now, new additional "GPU tabs" on the MacOS "Activity Monitor" is added.

</br>

<p align="justify">
📌 And, the result is....
</p>

<img width="1656" alt="Screen Shot 2022-05-02 at 5 01 41 PM" src="https://user-images.githubusercontent.com/72515939/166213796-e008aa77-c372-4aac-8ff2-45b8b06bc0d8.png">

<p align="center">
<img width="1365" alt="Screen_Shot_2022-05-02_at_5_02_07_PM" src="https://user-images.githubusercontent.com/72515939/166215851-6690a3c6-366d-4308-9dbd-04a9c709025f.png">
</p>

<p align="center">
<img width="549" alt="Screen Shot 2022-05-02 at 5 33 59 PM" src="https://user-images.githubusercontent.com/72515939/166214463-17182b3a-99f3-48a5-bd58-70d4720971e3.png">
</p>

🎥	IQSV Test: [Youtube](https://youtu.be/dd3SwAZ3S_w)
	
</br>	

### IGPU Info

<p align="center">
<img width="1239" alt="Screen_Shot_2022-04-27_at_1_05_05_AM" src="https://user-images.githubusercontent.com/72515939/165354830-6cdc4953-3081-44a0-812c-11b5b0bead78.png">
</p>

</br>

### DGPU Info

<p align="center"><img width="1239" alt="Screen Shot 2022-04-27 at 1 00 41 AM" src="https://user-images.githubusercontent.com/72515939/165354288-3be11774-1c5b-4a76-a55f-f8f7e100bba8.png"></p>

</br>

## POWER ISSUES

<p align="justify">
🔌	If there is a problem with power, use Hackintool to reset. The picture below shows how to do this:</p>

<p align="center">
<img width="1108" alt="Screen_Shot_2022-04-25_at_4_01_32_PM" src="https://user-images.githubusercontent.com/72515939/165046653-bdd95d61-c4eb-4f8b-bd8b-e13b3413af41.png">
</p>

🔧	Tools: [Hackintool](https://github.com/headkaze/Hackintool)

</br>

## BIOS/UEFI CONFIGURATION

### Disable

- 💻	Fast Boot ➡️ Feature in BIOS that `reduces` your computer boot time.
- 💻	Secure Boot ➡️ Secure boot is a `security standard` developed by members of the PC industry
- 💻	Serial/COM Port ➡️ Serial port is a `serial communication interface`
- 💻	Parallel Port ➡️ An interface allowing a personal computer (PC) to `transmit` or `receive` data down multiple bundled cables to a peripheral device such as a printer
- 💻	Intel® Virtualization Technology (VT-d) ➡️ Allows user to `direct passthrough of devices`. This option can be enabled if you set `DisableIoMapper` to `YES`
- 💻	Compatibility Support Module (CSM) ➡️ Compatibility Support Module
- 💻	Thunderbolt ➡️ New technology that supports `high-resolution displays` and `high-performance data` through one `single port`. For initial install, as Thunderbolt can cause issues if not setup correctly
- 💻	Intel® Software Guard Extensions (SGX) ➡️ A set of `security-related instruction codes` that are built into some Intel® central processing units (CPUs)
- 💻	Intel® Platform Trust (TPM) ➡️ Trusted Platform Module, `improves the security` of your PC by securely creating and storing cryptographic keys. (`Linux` and `Windows 10`.  Proper `dual-boot` with `Windows 11` require TPM to be enable. **Refer:** [InsanelyMac Discussions](https://www.insanelymac.com/forum/topic/348202-how-to-opencore-070-071-differences/))
- 💻 Config Lock (CFG Lock) ➡️ Setting in your BIOS that allows for a `specific register` (in this case the MSR 0xE2) to be written to
- 💻 Intel® Rapid Storage Technology (RST) ➡️ Windows-based application that provides `improved performance` and `reliability` for computers that are equipped with `SATA` disks for desktop, mobile, and server platforms

</br>

### Enable

- 💻	Intel® Virtualization Technology (VT-x) ➡️ An `actual hardware virtualisation assistance`.
- 💻	Above 4G decoding ➡️ When enabling Above4G, Resizable BAR Support may become an available on some Z490 and newer motherboards. Please ensure that `Booter -> Quirks -> ResizeAppleGpuBars` is set to `0` if this is enabled
- 💻	Hyper-Threading ➡️ An `Intel®` hardware innovation that allows multiple threads to run on each core, this means more work can be done in parallel
- 💻	Execute Disable Bit ➡️ An `Intel®` hardware-based security component.
- 💻	EHCI/XHCI Hand-off ➡️ USB functions are handled by the OS
- 💻	OS type ➡️ `Windows 8.1/10` UEFI Mode
- 💻	DVMT Pre ➡️ The `Intel® HD/UHD Graphics driver` for `Windows`. Please allocated (iGPU Memory) to `64MB` / `Auto`
- 💻	SATA Mode ➡️ Advanced Host Controller Interface or `AHCI`

</br>

## DRM TESTING

- ✔️ AppleTV 💯 working
- ❌ [Fairplay Test](https://drive.google.com/file/d/12pQ5FFpdHdGOVV6jvbqEq2wmkpMKxsOF/view)
- ✔️ Netflix 💯 working

**Remark:** All patches is done without [Shiki](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.Shiki.en.md) via [Whatevergreen](https://github.com/acidanthera/WhateverGreen). Shiki only applicable via Catalina and below.

</br>

## TRIM

📌	NVMe: `Kingston A2000 NVMe` trim support is working native. 

<img width="1239" alt="Screen_Shot_2022-04-30_at_10_45_05_AM" src="https://user-images.githubusercontent.com/72515939/166087551-e52f35db-1e52-47e9-8455-e70a81fdbf20.png">

📌	SSD: `IOAHCIBlockStorage` patch for SSD to enable `Trim` support via `Kernel\Patch`. Refer [config.plist](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/config_debug.plist).

![Artboard_1](https://user-images.githubusercontent.com/72515939/166087859-0511b56c-82a5-4ce3-8dbc-7d876b2925be.png)

</br>

## IOREG

📀	[iMac20,1-Hack](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/iMac20%2C1-Hack.ioreg)

</br>

## DEBUG LOG

📀	[OpenCore Debug Log](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/opencore-2022-04-19-153310.txt)

</br>

## UPDATING EFI USING OCTOOL

📀	Watch [rusty-bits/octool](https://github.com/rusty-bits/octool) guide via [Youtube](https://www.youtube.com/watch?v=5KNzD08Hkxs&t=4s)

</br>

## FINAL RESULTS

<p align="center">
<img width="2560" alt="Screen Shot 2022-04-30 at 12 37 23 AM" src="https://user-images.githubusercontent.com/72515939/165986968-f6debb0f-8b5b-474b-850f-972afcc78621.png">
</p>

🎪	Like this wallpaper? Grab [here](https://www.mediafire.com/file/ik570ko7cz8qyxs/Space.jpeg/file)

</br>

## ACKNOWLEGEMENT

📌	I would like to thanks all folks in Hackintosh Community especially:

- 💠	[Dortania](https://dortania.github.io/OpenCore-Install-Guide/) 😍 a great guide
- 💠	[acidanthera](https://github.com/acidanthera) 😊 [OpenCore](https://github.com/acidanthera/OpenCorePkg) Boot-loader and powerful ACPI compiler, [MaciASL](https://github.com/acidanthera/MaciASL)
- 💠	[corpNewt](https://github.com/corpnewt) 😁 developing simple [USBmap](https://github.com/corpnewt/USBMap) tools and [ProperTree](https://github.com/corpnewt/ProperTree) 
- 💠	[dhinakg](https://github.com/USBToolBox/tool) 😄 developing easy Windows based USBmap, [USBToolBox](https://github.com/USBToolBox/tool) which inspired by [corpNewt](https://github.com/corpnewt) [USBmap](https://github.com/corpnewt/USBMap)
- 💠	[Hackintosh Malaysia](https://www.facebook.com/groups/HackintoshMalaysia/about/) 😉 an official [Facebook](https://www.facebook.com) community for Hackintosh
- 💠	[headkaze](https://github.com/headkaze) 😁 the Swiss Army Knife of Vanilla Hackintoshing, known as [Hackintool](https://github.com/headkaze/Hackintool) and awesome EFI Mounter called as [EFIAgent](https://github.com/headkaze/EFI-Agent)
- 💠	[r/Hackintosh](https://www.reddit.com/r/hackintosh/) 😘 my favourite [reddit](https://www.reddit.com) Hackintosh discussion platform
- 💠	[daliansky](https://github.com/daliansky) ☺️ publishing his own [OpenCore](https://github.com/acidanthera/OpenCorePkg) [ACPI](https://kb.iu.edu/d/ahvl) method, known as [OC-Little](https://github.com/daliansky/OC-little)
- 💠	[5T33Z0](https://github.com/5T33Z0/OC-Little-Translated) 😆 translating [daliansky](https://github.com/daliansky) [OC-Little](https://github.com/daliansky/OC-little) which known as [OC-Little Translate](https://github.com/5T33Z0/OC-Little-Translated) + informative [Clover Crate](https://github.com/5T33Z0/Clover-Crate) for [Clover-bootloader](https://github.com/CloverHackyColor/CloverBootloader)
- 💠	[rusty-bits](https://github.com/rusty-bits) 😁 [cross platform](https://en.wikipedia.org/wiki/Cross-platform_software) OpenCore EFI update , known as [octool](https://github.com/rusty-bits/octool)
- 💠	[ic005k](https://github.com/ic005k) 😗 develop [Xiasl](https://github.com/ic005k/Xiasl), [OCAuxiliaryTools](https://github.com/ic005k/OCAuxiliaryTools), and [Xplist](https://github.com/ic005k/Xplist)

</br>

## FOLLOW ME

- ❤️	[reddit](https://www.reddit.com) ⭐ [u/mohdismailmatasin](https://www.reddit.com/user/mohdismailmatasin)
