# Hackintosh: Intel I5 10400 & Asrock B460M Steel Legend

![Artboard 1](https://user-images.githubusercontent.com/72515939/166086285-c5c771ed-e4d4-409a-b2d5-2e3f4c4325ea.png)

> _**Reminder:**<div align="justify">This is not an **official** method. All the information displayed is based on actual hardware and an experimental basis. Half of the information is taken from [Dortania](https://dortania.github.io/OpenCore-Install-Guide/), while others are taken from several well-known sources. This is an informative explanation related to [OpenCore](https://github.com/acidanthera/OpenCorePkg). For [Clover](https://github.com/CloverHackyColor/CloverBootloader), Refer to [Clover Crate](https://github.com/5T33Z0/Clover-Crate) by [5T33Z0](https://github.com/5T33Z0)</div>_

</br>

## Hardware and Device

| **INFO**  | **DETAIL**                                                                                                          | **INFO**    | **DETAIL**                                    |
| --------- | ------------------------------------------------------------------------------------------------------------------- | ----------- | --------------------------------------------- |
| OS 1      | Microsoft Windows 11 Pro                                                                                            | Audio 1     | 7.1 CH HD Audio (Realtek ALC1200 Audio Codec) |
| OS 2      | MacOS Monterey 12.3.1                                                                                               | Audio 2     | U-Phoria UM2 USB Audio Device                 |
| Processor | [Intel Core(TM) i5-10400](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/CPUInfo.txt) | Motherboard | ASRock (B460M Steel Legend)                   |
| GFX0      | Radeon RX 5500 XT 4GB                                                                                               | PCI 1       | BCM94360 WiFi & Bluetooth                     |
| IGPU      | Intel UHD Graphics 630 1GB                                                                                          | PCI 2       | VIA USB 3.0 eXtensible Host Controller        |
| Memory    | PNY XLR8 Gaming X Memory 3200MHz                                                                                    | Storage 1   | 500GB Kingston A2000 NVMe                     |
| Monitor   | Samsung U28E590 4K                                                                                                  | Storage 2   | 500GB Kingston A2000 NVMe                     |
| SMBIOS    | [iMac20,1](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/info.txt)                   | Board ID    | Mac-CFF7D910A743CAAF                          |

</br>

## APFS Changes

| **MacOS** | **Mindate** | **MinVersion**   | **SetApfsTrimTimeout** | **SecureBootModel**    |
| --------- | ----------- | ---------------- | ---------------------- | ---------------------- |
| Catalina  | 20200306    | 1412101001000000 | 0                      | j185-10.15.6 (19G2005) |
| BigSur    | 0           | 0                | 0                      | j185-10.15.6 (19G2005) |
| Monterey  | 0           | 0                | 0                      | j185-10.15.6 (19G2005) |

> _**Remark:**<div align="justify">The settings above may not be the same as the recommended settings by Dortania. To find out more, please check [OpenCore Configuration](https://dortania.github.io/docs/release/Configuration.html), [Acidanthera Update : August 2021](https://dortania.github.io/hackintosh/updates/2021/08/02/acidanthera-august.html) and [Dortania, Apple Secure Boot](https://dortania.github.io/OpenCore-Post-Install/universal/security/applesecureboot.html#securebootmodel) for SecureBootModel selection.</div>_

</br>

## BIOS

**Legacy BIOS**<div align="justify">Legacy Boot refers to the BIOS firmware's boot mechanism for initialising hardware devices. As the computer executes the Post-Test during the boot process, the Legacy boot has a selection of installed devices that are initialised. The legacy boot will look for the Master Boot Record (MBR), which is normally found in the first sector of a disc, on all connected devices. When Legacy is unable to locate a bootloader among the devices, it moves on to the next device in the list and repeats the procedure until it locates a bootloader or returns an error.</div>

</br>

**Modern BIOS (UEFI)**<div align="justify">
The Unified Extensible Firmware Interface, or UEFI, is a new approach to the boot process. UEFI is identical to Legacy, however instead of firmware, the boot data is kept in an.efi file. A unique key is required to access most UEFIs. A common key for certain motherboard manufacturers is listed below:</div>

| **MANUFACTURER** | **BIOS KEY** | **MANUFACTURER** | **BIOS KEY** |
| ---------------- | ------------ | ---------------- | ------------ |
| ASUS             | F8           | Asrock           | F11          |
| EVGA             | F7           | Gigabyte         | F12          |
| Intel            | F10          | MSI              | F11          |

> _**Remark:**<div align="justify">BIOS key in the table above is not entirely correct. The key is depending on how the manufacturer designs the board. Please pay attention. This is basic knowledge to understand how your motherboard works. It is better to refer to any source, especially your motherboard manufacturer, for a better understanding.</div>_

</br>

**Legacy vs Modern**

| **LEGACY**                                                                                                                        | **MODERN**                                                                                                                                                            |
| --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Legacy Boot mode is traditional and very basic                                                                                    | UEFI provides a better User interface                                                                                                                                 |
| Legacy uses the MBR partition scheme                                                                                              | It uses the GPT partitioning scheme                                                                                                                                   |
| It is slower compared to UEFI                                                                                                     | UEFI provides faster boot time                                                                                                                                        |
| The MBR portioning scheme used by Legacy only supports up to 2 TB storage devices                                                 | Since UEFI uses the GPT partitioning scheme, it can support up to 9 zettabytes of storage devices.                                                                    |
| Legacy runs in 16-bit mode that only supports keyboard navigation                                                                 | UEFI runs in 32-bit and 64-bit, allowing support for mouse and touch navigation                                                                                       |
| It does not provide a secure boot method, which allows for the loading of unauthorized applications, making dual-booting possible | It allows a secure boot that prevents the loading of unauthorized applications. It may also hinder dual boot because it treats operating systems (OS) as applications |
| It is more complex compared to UEFI                                                                                               | It has an easier update process                                                                                                                                       |

</br>

**EFI**<div align="justify">The Extensible Firmware Interface system partition, or ESP, is a partition on a data storage device (typically a hard disc drive or solid-state drive) used by computers that support the Unified Extensible Firmware Interface (UEFI). When a computer is turned on, the UEFI firmware loads files from the ESP to launch the operating system and other applications. The ESP contains the boot loaders or kernel images for all installed operating systems (which are contained in other partitions), device driver files for hardware devices in a computer that are used by the firmware at boot time, system utility programmes that are intended to be run before an operating system is booted, and data files like error logs.</div>

![efi-system-partition](https://user-images.githubusercontent.com/72515939/161425316-cb229e60-b2ad-4538-9b68-bbabb89a88a8.png)

</br>

**Boot-Loader**<div align="justify">The term [bootstrap loader](https://www.ionos.com/digitalguide/server/configuration/what-is-a-bootloader/) is a shorter form of the words. The phrase comes from the fact that the boot manager is a critical component in beginning the computer, and it can be compared to the help provided by a bootstrap when putting on a boot. It is a type of operating system software that loads into a computer's working memory when it boots up. A boot-loader is often launched shortly after a device starts, via a bootable medium such as a hard disc, a CD/DVD, or a USB stick. The boot medium receives information about the boot-location loader's from the computer's firmware (e.g. BIOS). The entire procedure is known as booting.</div>

</br>

## Partitioning

**Windows**<p align="center"><img width="827" alt="Screenshot 2022-04-03 133920" src="https://user-images.githubusercontent.com/72515939/161430959-f530d4a2-812f-43ec-9b78-6b54522f3a50.png"></div>

</br>

**MacOS**<p align="center"><img width="830" alt="Screenshot 2022-04-03 134003" src="https://user-images.githubusercontent.com/72515939/161430979-9b890a71-a348-439b-98df-0e53e6a49da8.png"></div>

> _**Remark:**<div align="justify">For dual or triple booting PCs, this application is very useful to manage Windows + MacOS or Windows + MacOS + Linux partition. [DiskGenius](https://www.diskgenius.com) or previously [Partition Guru](https://www.partitionguru.com) is a versatile program packed with comprehensive functions for partition recovery, file recovery, disk management, data backup, disk utilities, etc. It manages storage space with high efficiency, recovers data lost due to disk corruption, formatting, deletion, virus attack, etc. In other mean, DiskGenius is a simple tool that allows users to manage the partitions on hard drive and to format them, create new ones, or delete. This utility is compatible and works well with virtual hard drives like VMware, VirtualBox and Virtual PC in addition to supporting SCSI, IDE, SATA and USB flash drives or memory cards. The best thing is, this app capable to view and manage EFI/ESP partition which made managing partition so easily if any file required to be edit, especially [OpenCore](https://github.com/acidanthera/OpenCorePkg) or [Clover](https://github.com/CloverHackyColor/CloverBootloader) config.plist. However, APFS and HFS+ is not fully supported. That's the weak spot of this application. To use APFS and HFS+ formats on windows, [Paragon Hard Disk Manager??? Community Edition](https://www.paragon-software.com/free/pm-express/?msclkid=b2537d35cbb811ecbee6e7525f1ca4a9) is adequate. Both combination support may improve user experience.</div>_

![Artboard 1](https://user-images.githubusercontent.com/72515939/166097226-b35e84ab-0498-419a-a3e6-0cf6e9c276e5.png)

</br>

## OpenCore Package & Preparation

**What is OpenCore**<div align="justify">Referred to as a package of boot-loader and also a [chain-loading](https://en.wikipedia.org/wiki/Chainloadings) software. It is a complex software program, used to call the operating systems MacOS, Linux, and Windows. In addition, it also has the ability to inject new data into MacOS operating systems such as SMBIOS, Advanced Configuration Table and Power Interface (ACPI), and Kernel Extension (Kext). The package contains additional UEFI support common libraries shared by other projects in [Acidanthera](https://github.com/acidanthera). The primary purpose of the library set is to provide supplemental functionality for Apple-specific UEFI drivers. Key features:</div>

- Apple disk image loading support
- Apple keyboard input aggregation
- Apple PE image signature verification
- Apple UEFI secure boot supplemental code
- Audio management with screen reading support
- Basic ACPI and SMBIOS manipulation
- CPU information gathering with timer support
- Cryptographic primitives (SHA-256, RSA, etc.)
- Decompression primitives (zlib, lzss, lzvn, etc.)
- Helper code for ACPI reads and modifications
- Higher level abstractions for files, strings, UEFI variables
- Overflow checking arithmetics
- PE image loading with no UEFI Secure Boot conflict
- Plist configuration format parsing
- PNG image manipulation
- -Text output and graphics output implementations
- XNU kernel driver injection and patch engine

**Package**

- [OpenCore v0.8.0 - Debug](https://github.com/acidanthera/OpenCorePkg/releases/download/0.8.0/OpenCore-0.8.0-DEBUG.zip)
- [OpenCore v0.8.0 - Release](https://github.com/acidanthera/OpenCorePkg/releases/download/0.8.0/OpenCore-0.8.0-RELEASE.zip)
- [OpenCore Mod v0.8.1 - Debug](https://github.com/MohdIsmailMatAsin/i510400AsrB460Msl/files/8698330/OpenCore-Mod-0.8.1-DEBUG.zip)
- [OpenCore Mod v0.8.1 - Release](https://github.com/MohdIsmailMatAsin/i510400AsrB460Msl/files/8698332/OpenCore-Mod-0.8.1-RELEASE.zip)


**Change Log:**

- Added support for early log preservation
- Switched to Python 3 in scripts (use python /path/to/script to force Python 2)
- Added ForceAquantiaEthernet for Aquantia AQtion AQC-107s based 10GbE network cards support, thx @Mieze and @Shikumo
- Updated builtin firmware versions for SMBIOS and the rest
- Added Misc -> Serial section to customise serial port properties
- Added CustomPciSerialDevice quirk for XNU to correctly recognise customised external serial devices

</br>

**OpenCore Structure**

Below are the base OpenCore files and folders used for this project:

<p align="center"><img width="611" alt="Screenshot 2022-05-11 193014" src="https://user-images.githubusercontent.com/72515939/167839236-87ef154a-5f72-45d1-a408-f272eda616ab.png"></p>

> _**Remark:** For the [debugging](https://economictimes.indiatimes.com/definition/debugging) process, it is best not to use [OpenCanopy.efi](https://dortania.github.io/OpenCore-Post-Install/cosmetic/gui.html)._

</br>

### OC\EFI

**Boot**<div align="justify">Fallback boot-loader path. This is the only boot-loader pathname that the UEFI firmware on 64-bit X86 systems will look for without any pre-existing NVRAM boot settings. Booting is a term used to refer to the initial loading process when we turn on the computer. BOOTx64.efi is a special file for the boot process that aims to link the boot-loader checked by the BIOS before the computer can be used. The boot programme and OpenCore.efi will be searched by the BIOS for UEFI on 64-bit X86 systems without any existing NVRAM boot settings.</div>

**Secure Boot**<div align="justify">Basically MacOS implements the same boot instruction as any other Operating System. But, secure boot works in a different approach. Mac computers equipped with a [T2 chip](https://en.wikipedia.org/wiki/AppleT2) have an added feature called secure boot. It prevents unsigned operating systems from running on your Mac. Secure boot helps protect against bootkits, or malware that infects the master boot record (MBR) on your computer. Please refer [Apple Support](https://support.apple.com/en-us/HT208862) for more info.</div>

**Chain-Loader**<div align="justify">OpenCore capable of some other additional features. It has another mobile feature called chain-loader, which aims to call different operating systems.</div>

![Artboard X](https://user-images.githubusercontent.com/72515939/166086925-5b6b1cae-d80e-4fcd-a18b-6d907f5d1b9a.png)

</br>

### OC\ACPI

> _**Refer:** [ACPI Data Tables and Table Definition Language](https://uefi.org/specs/ACPI/6.4/21ACPIDataTablesandTableDefLanguage/ACPIDataTables.html#acpi-data-tables-and-table-definition-language)_

</br>

**DSDT**<div align="justify">Differentiated System Description Table. It Is a major ACPI table and is used to describe what peripherals the machine has. Also holds information on PCI IRQ mappings and power management. In other mean, an OEM must supply a DSDT to an ACPI-compatible OS. The DSDT contains the Differentiated Definition Block, which supplies the implementation and configuration information about the base system. The OS always inserts the DSDT information into the ACPI Namespace at system boot time and never removes it.</div>

<p align="center"><img width="1109" alt="ScreenShot2022-04-30at34129PM" src="https://user-images.githubusercontent.com/72515939/166096869-e6b7fe84-c465-4504-ab89-14b8887561ac.png"></div>

</br>

**SSDT**<div align="justify">In ACPI, peripheral devices and system hardware features on the platform are described in the Differentiated System Description Table (DSDT), which is loaded at boot, or in Secondary System Description Tables (SSDTs), which are loaded at boot or loaded dynamically at run time. For SoCs (System on Chip), the platform configuration is typically static, so the DSDT might be sufficient, although SSDTs can also be used to improve the modularity of the platform description. Secondary System Description Table (SSDT) are a continuation of the DSDT. Multiple SSDTs can be used as part of a platform description. After the DSDT is loaded into the ACPI Namespace, each secondary description table listed in the RSDT/XSDT with a unique OEM Table ID is loaded. This allows the OEM to provide the base support in one table, while adding smaller system options in other tables. Refer [Differentiated System Description Table](https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-system-description-tables#differentiated-system-description-table-dsdt) for more info.</div>

<p align="center">
<img width="1111" alt="ScreenShot2022-04-30at34056PM" src="https://user-images.githubusercontent.com/72515939/166096876-9d9d956e-80ed-477c-b7c3-0897d7c47abe.png">
</div>

> _**Refer:** [Definition of Terms](https://uefi.org/specs/ACPI/6.4/02DefinitionofTerms/DefinitionofTerms.html). For full information on DSDT and SSDT, see [ACPI Specification](https://uefi.org/specs/ACPI/6.4/index.html)_

</br>

**Input Files**<div align="justify">The AML Disassembler accepts binary ACPI tables that contain valid AML code. These tables are the DSDT and any SSDTs. These files may be obtained via the acpidump/acpixtract utilities, or some other host-specific tools.</div>

**Output Files**<div align="justify">The output is disassembled (or de-compiled) ASL code. The file extension used for these output files is .DSL, meaning ???disassembled ASL???. As opposed to original ASL source code files which typically have the extension **.ASL**.</div>

> _**Refer:** [ASL Compiler](https://acpica.org/sites/acpica/files/aslcompiler_10.pdf) for more info._

**AML Disassembler**<div align="justify">The AML Disassembler has the capability of reverse translating any binary AML table back to nearly the original ASL code. These are typically DSDTs and SSDTs. It can also disassemble and format all other known non-AML data tables.</div>

**ACPI Machine Language**<div align="justify">Pseudo-code for a virtual machine supported by an ACPI-compatible OS and in which ACPI control methods and objects are written. The AML encoding definition is provided in section 19, [ACPI Machine Language (AML) Specification](https://uefi.org/specs/ACPI/6.4/20AMLSpecification/AMLSpecification.html). The converted ASL source code .**DSL** files which typically have the extension **.AML**.</div>

</br>

**DSDT or SSDT?**<div align="justify">As documented by [Dortania](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-easy.html#running-ssdttime) , _"Do not add your DSDT to OpenCore; it's already in your firmware. If you are unsure what this is referring to, go back to the OpenCore guide and select your configuration based on the architecture of your CPU"_. Some computers come with a broken DSDT. It is usually not recommended to patch/override DSDT. Patching DSDT with garbage can do physical harm to computer. DSDT patches should be avoided. Some forums/websites (i.e., Olarila) state that it is a major solution. But, that reality isn't true. Since DSDT is the primary table, SSDT is the best way to make hackintosh PCs near as Mac. SSDT can be patched, modified (adding and dropping) the hardware properties which hook inside the machine. There are various reasons why DSDT patching is not recommended.</div>

</br>

**DSDT Patch** may cause

- ?????? Broken motherboard BIOS, or
- ?????? Inefficient device with the wrong injection, or
- ?????? Cause malfunction device, or
- ?????? PC unable to boot properly due to an incorrect patch (difficult to reverse).

</br>

**SSDT Patch** may affect

- ??? ACPI Injection to Windows/Linux.

</br>

**On Other Operating Systems, Avoid ACPI Injection**<div align="justify">Most of these issues may affect dual booting (Windows + MacOS). Luckily, there are settings via config.plist to prevent this issue, but this is only experimental. Do not assume these settings will work ???? on your machine. Certain users report the settings are not working, but some report the settings work as well. These settings are actually used only for Dell machines. But it is worth a try. Settings are explained via the table below.</div>

- UpdateSMBIOSMode = `Create`<div align="justify">Replace the tables with newly allocated EfiReservedMemoryType, use Custom on Dell laptops requiring CustomSMBIOSGuid quirk. Setting to Custom with CustomSMBIOSGuid quirk enabled can also disable SMBIOS injection into "non-Apple" OSes however we do not endorse this method as it breaks Bootcamp compatibility. Use at your own risk.</div>

</br>

- CustomSMBIOSGuid = `Yes`<div align="justify">Performs GUID patching for UpdateSMBIOSMode set to Custom. Usually relevant for Dell laptops. Enabling this quirk with UpdateSMBIOSMode. Custom mode can also disable SMBIOS injection into "non-Apple" OSes however we do not endorse this method as it breaks Bootcamp compatibility. Use at your own risk.</div>

</br>

**OpenCoreMod**<div align="justify">Another option is to use the OpenCore Mod version. It is not encouraged, but the best approach to develop EFI is using a resource package. This is an example based on [OpenCore v0.8.0](https://github.com/MohdIsmailMatAsin/i510400AsrB460Msl/files/8697131/oc_v0.8.0-mod.zip). The difference with official release is `Enable for All` option and `SkipCustomEntryCheck`. This option prevents modded/patched ACPI from being injected into other operating systems ie; Windows or Linux. The difficulty is that you have to build this EFI from source.</div>

- Enable for All = `No`
- SkipCustomEntryCheck = `Yes`

</br>

**Solution**<div align="justify">SSDT patch is the better solution and more reasonable. Any addition or modification does not affect your machine. If an error occurs, it is easy to revert back to the original state. SSDT patch is minor modification and not affect the actual hardware performance. Using openCore debug, there are several other tables that work with OpenCore. However, modifications to other tables are not necessary. The purpose of the SSDT is designed as described in this section. Be reminded, only SSDT can be modified. The rest is no.</div>

</br>

**Patch Applied**<div align="justify">Thanks to CorpNewt cross platform SSDTTime hotpatch tool. In this project, various SSDT's has been merged into [one](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/PCIInfo.txt). i.e., [SSDT-B460M-SL.dsl](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-B460M-SL.dsl). With several other sources, additional code is injected to reduce the kext workload. Below are the patches applied:</div>

</br>

**Patch**

- **ALS0**<div align="justify">???? Normally, a real iMac20,1 includes compatibility with `smc-als` and `AppleLMUController`. These patches are only cosmetics on regular PC's</div>
- **ANS0**<div align="justify">???? Rename KINGSTON SA2000M8500G NVme, `RP09,PXSX` to `RP09,ANS0` and pointed to Slot: `M2- 1`. Patch `Generic NVMe` to spoof as `Apple SSD Controller`</div>
- **ANS1**<div align="justify">????Rename KINGSTON SA2000M8500G NVme, `RP21,PXSX` to `RP21,ANS1` and pointed to Slot: `M2- 2`. Patch `Generic NVMe` to spoof as `Apple SSD Controller`</div>
- **ANS2**<div align="justify">???? Rename Maxio MAP1001 NVMe SSD, `RP20,PXSX` to `RP20,ANS2` and pointed to Slot: `Slot- 2`. Patch `Generic NVMe` to spoof as `Apple SSD Controller` as built-in</div>
- **ARPT**<div align="justify">???? Rename Broadcom BCM94360, `RP03,PXSX` to `RP03,ARPT `and pointed to Slot: `M2_Wifi`. Since the device works **OOB**, no additional patches have been applied</div>
- **AWAC**<div align="justify">???? AWAC/RTC0 purpose is to fix the `system clocks` found on newer hardware. Mostly on 300 Series, 400 Series, 495 Series(Ice Lake), X99 and X299 Motherboard</div>
- **DRAM**<div align="justify">???? Host bridge (DRAM) or mostly known to Memory Controller Hub `MCHC`, is one of two chips comprising the `core logic chipset` architecture on a PC motherboard</div>
- **EC**<div align="justify">???? Patched `Embedded Controller` or `EC`. An EC is a microcontroller in computers that handles various system tasks that the operating system does not handle. Most generic PC motherboards lack native EC support since Apple Macs require `boot-ec` not `PNP0C09`</div>
- **GFX0**<div align="justify">???? Display out from a Dedicated Graphic Processor Unit (DGPU). Patch `_SUN` enabled Slot Number and `agdpmod=pikera` with `other improvement config`</div>
- **HDAU**<div align="justify">???? High Definition Audio. Patch `_SUN` enabled Slot Number and `layout-id` data</div>
- **HDEF**<div align="justify">???? Another High Definition Audio device with `AC'97` support. Renamed `HDAS` to `HDEF`</div>
- **IGPU**<div align="justify">???? Intel Intergrated Graphics Unit device renamed from `GFX0` to `IGPU` with other `required patches` as `Headless` graphic support</div>
- **IMEI**<div align="justify">???? Intel Management Engine Interface. Rename `HECI` to `IMEI` with other required info</div>
- **LPCB**<div align="justify">???? Low Pin Count Bus, may also work as `PPC`. An interface allows the legacy I/O motherboard components, typically integrated in a `Super I/O` chip ie; `Nuvoton NCT6796D-E`, to migrate from the `ISA/X-bus` to the `LPC Interface`</div>
- **PLUG**<div align="justify">???? To allow the kernel's `XCPM` / XNU's CPU Power Management to manage CPU's power management</div>
- **PPMC**<div align="justify">???? Classed as Memory Controller in Comet Lake (CML) platform. Patch compatible supported Comet Lake `pci8086,a3a1` on `AppleIntelPCHPMC`, which is identical to Intel 200 Series/Z370 Chipset Family Power Management Controller `pci8086,a2a1`</div>
- **PXSX**<div align="justify">???? VIA USB 3.0 eXtensible PCIe Host Controller. Pointed to Slot: `Slot- 3`</div>
- **PNLF**<div align="justify">???? Fake backlight device for macOS to play with, specifically one with a hardware ID of `APP0002`. Normally, a real iMac20,1 includes compatibility. This is only a cosmetic patch with zero config.</div>
- **RPn**<div align="justify">???? Root Port `RPn` (`n` = numeric) and added simple information</div>
- **RTLK**<div align="justify">???? Rename RTL8125 2.5GbE Controller, rename `RP04,PXSX` to `RP04,RTLK`</div>
- **SATA**<div align="justify">???? Serial ATA Device, SATA. Rename `SATA` to `SAT0` and patch compatibe 400 Series SATA Family to `pci8086,a352` iMac's compatible (cosmetics)</div>
- **SBUS**<div align="justify">???? ACPI Method to fix Sistem Management Bus `AppleSMBus`, `AppleSMBusController`, `AppleSMBusPCI`, `Memory Reporting` (BLCK/BLC0 - `smc-blc` or DVL0 - `diagsvault`), etc</div>
- **THSS**<div align="justify">???? Thermal Subsystem. Fix unrecognize `pciXXXX,XXXX` which not identical properly on Mac's. Rename `pci8086,a3b1` to `THSS`. Only for Ioreg</div>
- **USBX**<div align="justify">???? USB Power Properties on Skylake motherboard and new generation</div>
- **XHC**<div align="justify">???? The `Platform Controller Hub` (PCH) for Intel Comet Lake family single-chip chipsets known as `Intel Comet Lake PCH-V USB Controller`. Because this build has two different USB Host Controllers</div>

<p align="center"><img width="1115" alt="Screen Shot 2022-05-16 at 12 44 52 PM" src="https://user-images.githubusercontent.com/72515939/168521417-7d17f33e-85a0-45ce-ae77-ca639b218658.png"></div>

</br>

**Tools used:**

- [SSDTTime](https://github.com/corpnewt/SSDTTime) > Cross Platform (Mac/Linux/Windows)
- [MaciASL](https://github.com/acidanthera/MaciASL) > MacOS
- [Xiasl](https://github.com/ic005k/Xiasl) > Cross Platform (Mac/Linux/Windows)

</br>

### OC\Drivers

**Basic Drivers**<div align="justify">Only 2 basic driver types are needed here using the debug package. OpenRuntime.efi and HfsPlus.efi. Both files are essentially basic drivers to make this project work. Usage information is as follows:</div>

| Driver          | Information                                                                                                                                                        |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| HfsPlus.efi     | Official HFS+ Driver Support for Apple MacOS                                                                                                                       |
| OpenRuntime.efi | AptioMemoryFix.efi (Clover Boot-loader) replacement. Used as an extension for OpenCore to help with patching boot.efi for NVRAM fixes and better memory management |

<p align="center"><img width="1036" alt="ScreenShot2022-04-25at24137PM" src="https://user-images.githubusercontent.com/72515939/165034935-9e54e24e-87fc-4d4a-93cd-79621119b41c.png"></div>

</br>

### OC\Kext

**Kernel Extensions**<div align="justify">Apple regularly introduces innovative solutions and improvements to macOS. However, not all improved tools can fully replace their predecessors. This is what happened with kernel extensions and their successors, System Extensions and DriverKit. Kernel extensions (kexts) let users or developers load code directly into the MacOS kernel. The table below contains some kexts in this project used to properly boot MacOS through OpenCore.</div>

| Kext                | Information                                                                                                                               |
| ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Lilu                | Arbitrary kext and process patching on MacOS                                                                                              |
| VirtualSMC          | System Management Controller (SMC) emulator layer                                                                                         |
| AppleALC            | Enabling native MacOS HD audio for unofficial codecs                                                                                      |
| Whatevergreen       | Various patches necessary for certain ATI/AMD/Intel/Nvidia GPUs                                                                           |
| SMCProcessor        | Additional support for VirtualSMC. Used for monitoring CPU temperature                                                                    |
| SMCSuperIO          | Additional support for VirtualSMC. Used for monitoring `FAN` speed                                                                        |
| SMCRadeonGPU        | Based on FakeSMCs, RadeonMonitor to provide GPU temperature to a dedicated gadget                                                         |
| RadeonSensor        | To read the GPU temperature. Lilu is required                                                                                             |
| LucyRTL8125Ethernet | Ethernet device, Realtek RTL8125 2.5G bit Ethernet Controllers driver                                                                     |
| USBMap              | Kext to route selected USB ports to Physical Ports via USB port address. This is compulsory to handle 15 port limit requirements by MacOS |

<p align="center"><img width="1032" alt="ScreenShot2022-04-25at30024PM" src="https://user-images.githubusercontent.com/72515939/165037853-94893f7d-7950-447a-a57f-745e93fe9ce8.png"></div>

</br>

> _**Remark:**<div align="justify">The order of kexts is important, they are loaded in this order. Plugins for other kexts should always come after the main kext. Lilu should be first, then Lilu plugins like WhateverGreen and VirtualSMC. Sort in priority to get a better kext injection.</div>_

<p align="center"><img width="1356" alt="ScreenShot2022-04-25at30908PM" src="https://user-images.githubusercontent.com/72515939/165038719-33ac2cca-1cf5-4aae-85de-7caa88c3ccff.png"></div>

</br>

### OC\OpenCore.efi

**Firmware Interface**<div align="justify">An Extensive Firmware Interface (.efi) file is a system file used by Intel-based computer systems and computer devices such as AppleTVs. It contains system-level data that executes between the operating system and the firmware. An OpenCore Extensible Firmware Interface files are used for staging firmware updates, booting operating systems, and running pre-boot programs. Normally this file is include with OpenCorePkg and it is compulsory </div>

<p align="center"><img width="882" alt="Screen Shot 2022-04-25 at 1 10 05 PM" src="https://user-images.githubusercontent.com/72515939/165024487-a626140e-fbf4-41b6-806f-7d1df76a95ec.png"></div>

</br>

### OC\Resources

**Audio, Font, Image & Label**<div align="justify">An OpenCore theme folder which is related to beauty treatment, contain audio (boot-chime), image (wallpaper/icon), font, and label for boot menu GUI experience. These files and folders only work with the OpenCanopy.efi driver. For a more detailed guide, see [OpenCore Beauty treatment](https://github.com/dortania/OpenCore-Post-Install/blob/master/cosmetic/gui.md). This section can be skipped and can be done post-install. The package can be download [here](https://github.com/acidanthera/OcBinaryData).</div>

<p align="center"><img width="882" alt="Screen Shot 2022-04-25 at 1 18 08 PM" src="https://user-images.githubusercontent.com/72515939/165025116-3361c542-d1bb-4730-8792-bc247e83f543.png"></div>

</br>

### OC\Tools

**Auxiliary**<div align="justify">An additional auxiliary tool for OpenCore. Most of the tools are available in OpenCore packages. It is up to the user to figure out how to make the most of the tools provided. The tools are in .efi format. Here, CleanNvram.efi, which is a ResetNVRAM alternative bundled as a standalone tool, is used as an example. This tool will likely be used to remove any corruption of data in the NVRAM, whilst the resetnvram is used to wipe and clear (empty) the NVRAM. Other tools are designed according to a specific purpose. **Reminder:** Press spacebar on the boot menu to use CleanNvram.efi since it is set as an auxiliary (hidden).</div>

<p align="center"><img width="882" alt="Screen Shot 2022-04-25 at 1 18 58 PM" src="https://user-images.githubusercontent.com/72515939/165025190-86dd61a2-ebe6-4ad9-bec6-73da1f1ef9bc.png"></div>

</br>

### OC\Config.plist

**Configuration**<div align="justify">A plist file is a settings file, also known as a properties file, used by MacOS applications. It contains properties and configuration settings for various programs. Based on Apple's Core Foundation DTD**, OpenCore/Clover benefit **.plist\*\* to inject MacOS preference, also an information for the application that it holds the preference settings. Other than that, it's a markup language that shares a lot of similarities with HTML. Few different data types available, and most of the structure revolves around keeping track of opening and closing tags. Besides, a plist is often used to correct problems that a user may be having with an application or devices.</div>

<p align="center"><img width="959" alt="Screen Shot 2022-04-25 at 1 19 39 PM" src="https://user-images.githubusercontent.com/72515939/165025284-c442cf30-0099-4f94-8634-19b9877d153a.png"></div>

**Example:** Below is an example of config.plist:

- OpenCore [Monterey/BigSur-Debug](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/configdebug.plist)
- OpenCore [Monterey/BigSur-Release](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/configrelease.plist)
- Clover [Monterey/BigSur-Release](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/configclover.plist)

**Tools for editing:**

- [ProperTree](https://github.com/corpnewt/ProperTree) > Cross Platform (Mac/Linux/Windows)
- [Xplist](https://github.com/ic005k/Xplist) > Cross Platform (Mac/Linux/Windows)

</br>

# Others: Additional Info

## Quirks Check

**Read and Settings**<div align="justify">Quirks is depending on processor type (codename). Different type has different settings. Refer to OpenCore Getting Started and head to Configs. For easy settings, use OCAuxiliaryTools. However, this is not recommended. Any error that occurs in config.plist is your own responsibility. Manual setup is encouraged. Please make a backup before using it. While the quirks are set by processor code name, please read [OpenCore Getting Started](https://dortania.github.io/OpenCore-Install-Guide/prerequisites.html) for recommendations. Use [ProperTree](https://github.com/corpnewt/ProperTree) or [Xplist](https://github.com/ic005k/Xplist) to manually edit quirks settings via config.plist. There is an easy way by using [OCAuxilliaryTools](https://github.com/ic005k/OCAuxiliaryTools). However, it is not recommended and may break the .plist.</div>

</br>

**ACPI\Quirks**

- None

<p align="center">
<img width="1227" alt="Screen Shot 2022-04-22 at 12 14 41 AM" src="https://user-images.githubusercontent.com/72515939/164505309-65fb3904-a0ea-4c58-95a1-b786a793b726.png"></div>

</br>

**Booter\Quirks**

- AvoidRuntimeDefrag
- DevirtualiseMmio
- EnableSafeModeSlide
- ProtectUefiServices
- ProviceCustomSlide
- RebuildAppleMemoryMap
- SyncRuntimePermissions
- ProvideMaxSlide = **0**
- ResizeAppleGpuBars = **`-1`**

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 15 05 AM" src="https://user-images.githubusercontent.com/72515939/164505410-32911711-727d-40f9-9d2a-f542700b5dcc.png"></div>

</br>

**Kernel\Quirks**

- CustomSMBIOSGuid
- DisableIoMapper
- DisableLinkeditJettison
- PanicNoKextDump
- PowerTimeoutKernelPanic
- SetApfsTimeout = **`0`**

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 15 48 AM" src="https://user-images.githubusercontent.com/72515939/164505506-bc2e3705-8225-407d-a486-0b232f4a5fed.png"></div>

</br>

**UEFI\Quirks**

- EnableVectorAcceleration
- RequestBootVarRouting
- ExitBootServiceDelay = **`0`**
- ResizeGPUBars = **`-1`**
- TscSyncTimeout = **`0`**

<p align="center"><img width="1227" alt="Screen Shot 2022-04-22 at 12 15 26 AM" src="https://user-images.githubusercontent.com/72515939/164505602-4cf5069b-bdf2-4017-8a54-336f82464ad4.png"></div>

</br>

## Additional Framebuffer for AMD Navi GPU's

**Framebuffers** available in **AMDRadeonX6000Framebuffer.kext >> Contents >> Info.plist**.

**5700 - Navi 10**

> **AMDRadeonNavi10Controller**
>
> > **device-id:** 0x73101002 0x73121002 0x73181002 0x73191002 0x731A1002 0x731B1002 0x731F1002 0x73BF1002
> >
> > > **framebuffer:** `ATY,Adder / ATY,Ikaheka`

**5600 - Navi 12**

> **AMDRadeonNavi12Controller**
>
> > **device-id:** 0x73601002 0x73621002
> >
> > > **framebuffer:** `ATY,Sunbeam`

**5500 - Navi 14**

> **AMDRadeonNavi14Controller**
>
> > **device-id:** 0x73401002 0x73411002 0x73431002 0x73471002 0x734F1002
> >
> > > **framebuffer:** `ATY,Python / ATY,Keelback / ATY,Boa`

**6800 and 6900 - Navi 21**

> **AMDRadeonNavi21Controller**
>
> > **device-id:** 0x73A01002 0x73A21002 0x73A31002 0x73AB1002 0x73AE1002 0x73AF1002 0x73BF1002
> >
> > > **framebuffer:** `ATY,Belknap / ATY,Carswell / ATY,Deepbay`

**6600 - Navi 23**

> **AMDRadeonNavi23Controller**
>
> > **device-id:** 0x73E31002 0x73FF1002 0x73E01002
> >
> > > **framebuffer:** `ATY,Henbury`

</br>

**ATY,GPU (DGPU)**

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

**ATY,Keelback:**

<img width="1479" alt="Screen Shot 2022-05-08 at 8 12 17 AM" src="https://user-images.githubusercontent.com/72515939/167276264-d10d2986-aba5-4e99-b639-ea3a8c09d3ac.png">

</br>

**AGDP (Apple Graphics Device Policy)**

**agdpmod=pikera**<div align="justify">Renames **board-id** to **board-ix** effectively disabling boardID checks, this is based of [Pike.R.A's](https://github.com/Piker-Alpha)[work](https://pikeralpha.wordpress.com/2015/11/23/patching-applegraphicsdevicepolicy-kext/). Most **AMD Navi GPUs** require this patch to overcome the [black screen issue](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/kernel-issues.html#black-screen-after-ioconsoleusers-gioscreenlock-on-navi) on boot. There are two methods, the first is through **boot-args**, while the second is via **DeviceProperties**. Below is a description regarding this patch:</div>

- Hex = `70696B65726100`
- Base64 = `cGlrZXJhAA==`
- ASCII = pikera

</br>

**Method 1 (Temporary)**<div align="justify">Require [Whatevergreen.kext](https://github.com/acidanthera/WhateverGreen). This boot-arg must be added to **config.plist** through the **NVRAM** section. Below is an example:</div>

> NVRAM
>
> > Add
> >
> > > 7C436110-AB2A-4BBB-A880-FE41995C9F82
> > >
> > > > boot-args
> > > >
> > > > > `agdpmod=pikera`

</br>

**Method 2 (Permanent)**<div align="justify">Require [Whatevergreen.kext](https://github.com/acidanthera/WhateverGreen). Hex information is required to inject through the **DeviceProperties** section. The required format is:</div>

> DeviceProperties
> PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)
>
> > agdpmod
> >
> > > data
> > >
> > > > `70696B65726100`

</br>

**Full Example**<div align="justify">Below is an example **ATY,Keelback** framebuffer patch:</div>

```xml
<key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)</key>
<dict>
	<key>@0,AAPL,boot-display</key>
	<data>AQAAAA==</data>
	<key>@0,ATY,EFIDisplay</key>
	<string>DP1</string>
	<key>@0,name</key>
	<string>ATY,Keelback</string>
	<key>@1,name</key>
	<string>ATY,Keelback</string>
	<key>@2,name</key>
	<string>ATY,Keelback</string>
	<key>@3,name</key>
	<string>ATY,Keelback</string>
	<key>AAPL,slot-name</key>
	<string>Slot- 1</string>
	<key>AAPL00,DualLink</key>
	<data>AQAAAA==</data>
	<key>ATY,EFIEnabledMode</key>
	<data>AQ==</data>
	<key>ATY,EFIVersion</key>
	<data>MzAuMC4xMDEuMTM0MA==</data>
	<key>ATY,EFIVersionB</key>
	<data>MDE3LjAwMi4wMDAuMDAwLjAzNzYzNg==</data>
	<key>ATY,copyright</key>
	<data>Q29weXJpZ2h0IEFNRCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuIDIwMDUtMjAxOQ==</data>
	<key>CFG,CFG_USE_AGDC</key>
	<data>AQ==</data>
	<key>device_type</key>
	<string>VGA compatible controller</string>
	<key>hda-gfx</key>
	<string>onboard-2</string>
</dict>

```

</br>

## UHD Graphics 630 (Headless)

**AAPL,ig-platform-id**<div align="justify">This is an important part. The keyword for the best headless settings for desktop is **mobile**. For desktop **(iMac SMBIOS)**, the framebuffer setting for the **mobile** variant is not needed. Open **Hackintool > Patch > Platform ID** option. Find any setting which is not related to the mobile **(Mobile = No)**. This guide is to find a proper **AAPL,ig-platform-id** for Desktop. In this case, **0x3E910003** in hexadecimal, which is equal to **0300913E**, 4 byte data hex swapped. Below is an example:</div>

- 0x3E910003 = `0300913E`
- AAPL,ig-platform-id = `0300913E`

<p align="center"><img width="1176" alt="ScreenShot2022-05-02at51003PM" src="https://user-images.githubusercontent.com/72515939/166212509-9f300b98-66c5-43f0-abf9-e14dd5e610a2.png"></div>

</br>

**device-id**<div align="justify">To get the proper main card platform as `headless` injection, `device-id` is required to get the device name. On `Intel 10th Gen` processor, it is not necessary, but sometimes this patch may fix certain IGPU issues. As an example, find **Activity Monitor > Window > GPU History** or **Activity Monitor > GPU** extra tab, IGPU will display as **Intel KBL Unknown**. Checkout **[Issues #1905](https://github.com/acidanthera/bugtracker/issues/1905)**. To proper rename, use **Hackintool** as a guide by finding the appropriate **device-id**, not in mobile mode (Mobile = No). In this case, GPU Hexadecimal device-id **0x3E9B8086** which is equal to 4 byte data hex swapped **9B3E0000** is injected via config.plist in IGPU DeviceProperties section. Below is an example:</div>

- 0x3E9B8086 = `9B3E8086`
- 9B3E8086 = `9B3E0000` (8086 to 0000)
- device-id = `9B3E0000`

<p align="center"><img width="1172" alt="ScreenShot2022-05-02at52716PM" src="https://user-images.githubusercontent.com/72515939/166213623-407d87dd-5368-4430-b8e0-5fc87eb97be1.png"></div>

</br>

**Inject**<div align="justify">Other additional information to be inject:</div>

**AAPL,ig-platform-id:** Property used by macOS to determine the framebuffer profile with Ivy Bridge and newer

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`AAPL,ig-platform-id`**
> > >
> > > > **data**
> > > >
> > > > > **`0300913E`**

**AAPL,slot-name:** To show/set PCI Cards on System Profiler

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`AAPL,slot-name`**
> > >
> > > > **string**
> > > >
> > > > > **`Internal`**

**device-id:** Device id number

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`device-id`**
> > >
> > > > **data**
> > > >
> > > > > **`9B3E0000`**

**igfxonln:** To force-online device property or to force online status on all displays

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`igfxonln`**
> > >
> > > > **data**
> > > >
> > > > > **`01000000`**

**devicetype:** Type of device

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`devicetype`**
> > >
> > > > **string**
> > > >
> > > > > **`Display controller`**

**enable-metal:** To enable-metal property or force enable Metal support on Intel for offline rendering

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`enable-metal`**
> > >
> > > > **data**
> > > >
> > > > > **`01000000`**

**iommu-selection:** Allows VMs to directly use peripheral devices through direct memory access (DMA). Value 01000000 may enable IOMMU. Refer: [Apple Platform Security](https://support.apple.com/lt-lt/guide/security/seca4960c2b5/web)

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`iommu-selection`**
> > >
> > > > **data**
> > > >
> > > > > **`00000000`**

**rps-control:** To enable RPS control patch (improves IGPU performance)

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`rps-control`**
> > >
> > > > **data**
> > > >
> > > > > **`01000000`**

**igfxfw:** To force loading of Apple GuC firmware

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`igfxfw`**
> > >
> > > > **data**
> > > >
> > > > > **`02000000`**

**hda-gfx:** An onboard properties to HDAU, IGPU, HDEF objects

> **DeviceProperties**
>
> > **PciRoot(0x0)/Pci(0x2,0x0)**
> >
> > > **`hda-gfx`**
> > >
> > > > **string**
> > > >
> > > > > **`onboard-1`**

**From the original iMac20,1 ioreg:**

<img width="1183" alt="Screen Shot 2022-05-08 at 8 19 19 AM" src="https://user-images.githubusercontent.com/72515939/167276417-15a5344e-60bf-4c63-a1e0-aeb8e89a337d.png">

**Patched:**

<img width="1183" alt="Screen Shot 2022-05-08 at 8 19 38 AM" src="https://user-images.githubusercontent.com/72515939/167276420-fe056c83-0c07-425a-9eaa-02f950a49be7.png">

**GPU Tab**<div align="justify">Now, new additional GPU tabs on the MacOS Activity Monitor is added. And, the result is....</div>

<img width="1656" alt="Screen Shot 2022-05-02 at 5 01 41 PM" src="https://user-images.githubusercontent.com/72515939/166213796-e008aa77-c372-4aac-8ff2-45b8b06bc0d8.png">

<p align="center"><img width="1365" alt="ScreenShot2022-05-02at50207PM" src="https://user-images.githubusercontent.com/72515939/166215851-6690a3c6-366d-4308-9dbd-04a9c709025f.png"></div>

<p align="center"><img width="549" alt="Screen Shot 2022-05-02 at 5 33 59 PM" src="https://user-images.githubusercontent.com/72515939/166214463-17182b3a-99f3-48a5-bd58-70d4720971e3.png"></div>

**DRM Test**

- ?????? AppleTV ???? working
- ??? [Fairplay Test](https://drive.google.com/file/d/12pQ5FFpdHdGOVV6jvbqEq2wmkpMKxsOF/view) Refer: [Issues #131](https://github.com/osy/HaC-Mini/issues/131)
- ?????? Netflix ???? working

**com.apple.WebKit.GPU dump** [link](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/Sample%20of%20com.apple.WebKit.GPU.txt)

**IQSV Test** Checkout this [link](https://youtu.be/dd3SwAZ3Sw)

> _**Remark:** All patches is done without [Shiki](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.Shiki.en.md) via [Whatevergreen](https://github.com/acidanthera/WhateverGreen). Shiki patch only applicable via Catalina and below._</br>

</br>

**Boot Without Whatevergreen**<div align="justify">There are several ways to boot without Whatevergreen.kext. However, only native DGPU and IGPU are capable. Here, the explanation is quite simple. If the settings above (using Whatevergreen.kext) are successful, try removing/disabling it. This method will handle **agdpmod=pikera** directly using AppleGraphiceDevicePolicy.kext.

1. Do not remove **agdpmod=pikera** info on DGPU properties.
2. If **Headless UHD630 IGPU** exists in config.plist, delete some other information. **Below** is an example:

```xml
<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
<dict>
	<key>AAPL,ig-platform-id</key>
	<data>AwCRPg==</data>
	<key>AAPL,slot-name</key>
	<string>Display</string>
	<key>built-in</key>
	<data>AQ==</data>
	<key>device-id</key>
	<data>mz4AAA==</data>
	<key>device_type</key>
	<string>Display controller</string>
	<key>enable-metal</key>
	<data>AQAAAA==</data>
	<key>hda-gfx</key>
	<string>onboard-1</string>
	<key>igfxfw</key>
	<data>AgAAAA==</data>
	<key>igfxonln</key>
	<data>AQAAAA==</data>
	<key>iommu-selection</key>
	<data>AAAAAA==</data>
	<key>rps-control</key>
	<data>AQAAAA==</data>
</dict>
```

3.Save the config.plist and reboot. Additional **GPU tabs** will no longer be available after this.

> _**Refer:** Proper headless IGPUs will appear as original iMac 20.1 with CFL framebuffer._

<p align="center"><img width="1105" alt="Screen Shot 2022-05-11 at 7 39 15 AM" src="https://user-images.githubusercontent.com/72515939/167741812-18910d7d-939c-4404-add1-115fd911d7d1.png"></p>

<p align="center"><img width="559" alt="Screen Shot 2022-05-11 at 7 39 24 AM" src="https://user-images.githubusercontent.com/72515939/167741758-aea42364-7d1c-4da2-ac8e-ab18cea1fc9c.png"></p>

**From the original iMac20,1 ioreg:**

<img width="1183" alt="Screen Shot 2022-05-08 at 8 19 19 AM" src="https://user-images.githubusercontent.com/72515939/167276417-15a5344e-60bf-4c63-a1e0-aeb8e89a337d.png">

</br>

**Patched:**

<p align="center"><img width="1182" alt="Screen Shot 2022-05-11 at 7 43 12 AM" src="https://user-images.githubusercontent.com/72515939/167742032-f9a623e4-4bf5-42a6-a0c4-2288b4e739ed.png"></p>
	
3. Now, ready to boot MacOS without Whatevergreen.kext. If any issue occur, back to the previous state (with Whatevergreen.kext)

</br>

## Power

**Reset via Hackintool**<div align="justify">If there is a problem with power, use [Hackintool](https://github.com/headkaze/Hackintool) to reset. The picture below shows how to do this:</div>

<p align="center"><img width="1108" alt="ScreenShot2022-04-25at40132PM" src="https://user-images.githubusercontent.com/72515939/165046653-bdd95d61-c4eb-4f8b-bd8b-e13b3413af41.png"></div>

</br>

## BIOS/UEFI Configuration

**Disable**

- `Fast Boot` > Feature in BIOS that reduces your computer boot time.
- `Secure Boot` > Secure boot is a security standard developed by members of the PC industry
- `Serial/COM Port` > Serial port is a serial communication interface
- `Parallel Port`> An interface allowing a personal computer (PC) to transmit or receive data down multiple bundled cables to a peripheral device such as a printer
- `Intel Virtualization Technology (VT-d)` > Allows user to direct passthrough of devices. This option can be enabled if you set DisableIoMapper to `YES`
- `Compatibility Support Module (CSM)` > Compatibility Support Module
- `Thunderbolt` > New technology that supports high-resolution displays and high-performance data through one single port. For initial install, as Thunderbolt can cause issues if not setup correctly
- `Intel Software Guard Extensions (SGX)` > A set of security-related instruction codes that are built into some Intel central processing units (CPUs)
- `Intel Platform Trust (TPM)`> Trusted Platform Module, improves the security of your PC by securely creating and storing cryptographic keys. Proper dual-boot with Windows 11 require TPM to be enable. **Refer:** [InsanelyMac Discussions](https://www.insanelymac.com/forum/topic/348202-how-to-opencore-070-071-differences/)
- `Config Lock (CFG Lock)` > Setting in your BIOS that allows for a specific register (in this case the MSR 0xE2) to be written to
- `Intel Rapid Storage Technology` (RST) > Windows-based application that provides improved performance and reliability for computers that are equipped with SATA disks for desktop, mobile, and server platforms

</br>

**Enable**

- `Intel Virtualization Technology (VT-x)` > An actual hardware virtualisation assistance.
- `Above 4G decoding` > When enabling Above4G, Resizable BAR Support may become an available on some Z490 and newer motherboards. Please ensure that **Booter > Quirks > ResizeAppleGpuBars** is set to 0 if this is enabled
- `Hyper-Threading` > An Intel hardware innovation that allows multiple threads to run on each core, this means more work can be done in parallel
- `Execute Disable Bit` > An Intel hardware-based security component.
- `EHCI/XHCI Hand-off` > USB functions are handled by the OS
- `OS type` > Windows 8.1/10 UEFI Mode
- `DVMT Pre` > The Intel HD/UHD Graphics driver for Windows. Please allocated (iGPU Memory) to 64MB / Auto
- `SATA Mode` > Advanced Host Controller Interface or AHCI

</br>

## Trim Support

**NVMe:** Kingston A2000 NVMe trim support is working **native**.

<img width="1239" alt="ScreenShot2022-04-30at104505AM" src="https://user-images.githubusercontent.com/72515939/166087551-e52f35db-1e52-47e9-8455-e70a81fdbf20.png">

**SSD:** IOAHCIBlockStorage patch for SSD to enable Trim support via **Kernel\Patch**. Refer [config.plist](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/configdebug.plist).

![Artboard1](https://user-images.githubusercontent.com/72515939/166087859-0511b56c-82a5-4ce3-8dbc-7d876b2925be.png)

</br>

## Debug

> **[v0.8.0](https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/commit/521f387a8bbfe912c0168be196ac6029dc96fe3d)**
>
> > **Result:** Pass
> >
> > > **Time:** 1535PM
> > >
> > > > **Date:** 7th May 2022

</br>

## Update

**OCTool**<div align="justify"> A small project from the **Rust** language provides better OpenCore update features. Users can build from the included source by running **cargo build** --release or use the **binary** from the releases section on GitHub. This tool does not automatically update itself to the latest version. Watch [octool](https://github.com/rusty-bits/octool) guide via [Youtube](https://www.youtube.com/watch?v=5KNzD08Hkxs&t=4s)</div>

Input:

`./octool` [options] `-o x.y.z` [config.plist]

`-d` to use debug versions for EFI instead of release versions

`-h` to print help/usage message

`-o x.y.z` is to select OpenCore version. e.g. `-o 0.7.4`

Without this option **octool** will make a "quick guess" as to which version to use based on the INPUT config.plist, if no INPUT config.plist is provided, **octool** will default to the latest version of OpenCore. Read more on [rusty-bits/octool](https://github.com/rusty-bits/octool)

</br>

## Real Time Clock and Coordinated Universal Time (Windows + MacOS)

**How to fix this issus?**<div align="justify">There is a time maintained by the system board called the **RTC** (Real Time Clock). This is the clock that is maintained by the small battery present on your motherboard. **Windows** expects this time to indicate local time, whereas MacOS expects this time to represent **UTC**. For all practical purposes, **GMT** and **UTC** are the same and local times are a time relative to **GMT/UTC**. The **RealTimeIsUniversal** simply causes **Windows** to treat the **BIOS/RTC** time as **UTC**, just like **MacOS**.</div>

**GMT:** `Greenwich Mean Time`
**UTC:** `Coordinated Universal Time`

<div align="justify">Think of UTC time as a way to represent the current time based on a standard location irrespective of local conventions (irrespective of local time, daylight savings time, etc).</div>

</br>

> _**Refer:** See here for further descriptions: [GMT](http://en.wikipedia.org/wiki/Greenwich_Mean_Time) & [UTC](http://en.wikipedia.org/wiki/Coordinated_Universal_Time)_

<div align="justify">Although many technical people think it is silly that by default Windows expects BIOS time to be local time, it is retained for backward compatibility and the 99.9% of people that don't dual boot and would be confused by BIOS showing UTC vs. Windows showing local time.</div>
	
</br>

**Step 1:**<div align="justify"> It's quite simple really. All you need to do is set **Windows** to use **UTC** instead of **GMT**. To do this, we need to perform a simple registry edit. Go perform this, hold down the Windows button, and at the same time **Win + R** this will bring up a new window titled **RUN**.</div>

**Step 2:**<div align="justify">In this window type the command **regedit**. **UAC** will popup asking for admin permission. Click accept and the registry editor will open. Now that were in regedit, navigate to...</div>

</br>

`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation`

**Step 3:**<div align="justify"> Left click on **TimeZoneInformation** and on the left it will display all the current values attributed to this registry key. On the left right click anywhere and choose Create new **`D-WORD`**. You will now see a new entry at the bottom of the list</div>

**Step 4:**<div align="justify"> Right click on this new entry and choose Modify. Rename the key RealTimeIsUniversal and change it's value to **`1`**. Click **save**, and now the entry should say **RealTimeIsUniversal** - **`0x0000001`**. **Reboot**, and sync the windows clock.</div>

</br>

# Acknowlegement

I would like to thanks all folks in Hackintosh Community especially:

???? **[Dortania](https://dortania.github.io/OpenCore-Install-Guide/)**

- `https://dortania.github.io/OpenCore-Install-Guide/` MacOS Install Guide via OpenCore Boot-loader

???? **[acidanthera](https://github.com/acidanthera)**

- `https://github.com/acidanthera/OpenCorePkg` Boot-loader
- `https://github.com/acidanthera/MaciASL` Powerful ACPI Compiler

???? **[corpNewt](https://github.com/corpnewt)**

- `https://github.com/corpnewt/USBMap` MacOS USB Mapping Tool
- `https://github.com/corpnewt/ProperTree` Cross Platform Plist Editor

???? **[dhinakg](https://github.com/USBToolBox/tool)**

- `USBToolBox](https://github.com/USBToolBox/tool` Windows based USBmap

???? **[headkaze](https://github.com/headkaze)**

- `https://github.com/headkaze/Hackintool` The Swiss Army Knife of Vanilla Hackintoshing
- `https://github.com/headkaze/EFI-Agent` EFI Mounter

???? **[Facebook](https://www.facebook.com)**

- `https://www.facebook.com/groups/HackintoshMalaysia/about/` An Official Malaysia Hackintosh Community

???? **[reddit](https://www.reddit.com)**

- `https://www.reddit.com/r/hackintosh/` Hackintosh Discussion Platform

???? **[daliansky](https://github.com/daliansky)**

- `https://github.com/daliansky/OC-little` ACPI Guide (Chinese Language)

???? **[5T33Z0](https://github.com/5T33Z0/OC-Little-Translated)**

- `https://github.com/5T33Z0/OC-Little-Translated` An English [OC-Little](https://github.com/daliansky/OC-little) Translation
- `https://github.com/CloverHackyColor/CloverBootloader)` Clover Guide

???? **[rusty-bits](https://github.com/rusty-bits)**

- `https://github.com/rusty-bits/octool` Cross Platform OpenCore Update Tool

???? **[ic005k](https://github.com/ic005k)**

- `https://github.com/ic005k/Xiasl` Cross Platform ACPI Compiler
- `https://github.com/ic005k/OCAuxiliaryTools)` Cross Platform OpenCore OCAuxiliary Tool
- `https://github.com/ic005k/Xplist` Cross Platform Plist Editor

???? **[k33yb0rd](https://github.com/k33yb0rd/k33yb0rd)**

- `https://github.com/MohdIsmailMatAsin/i510400AsrockB460MSteelLegend/blob/main/SSDT-B460M-SL.dsl` Fix certain ACPI method

</br>

# Find Me

?????? **[reddit](https://www.reddit.com)**

- `https://www.reddit.com/user/mohdismailmatasin` @ u/mohdismailmatasin

<!---------------------------
Intel i5 10400 & Asrock B460M Steel Legend.md


Created by Mohd Ismail Mat Asin on 06/05/2022.
---------------------------->
