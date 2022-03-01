# <p align="center">Hackintosh: Intel i5 10400F & Asrock B460 Steel Legend</p>

<p align="center"><img width="698" alt="Screen Shot 2022-02-24 at 8 51 59 PM" src="https://user-images.githubusercontent.com/72515939/155527979-c0f57c37-826d-43e8-9571-3d062dce01de.png"></p>

## Information

**Processor:**

- [Intel® Core™ i5-10400F Processor](https://www.intel.com/content/www/us/en/products/sku/199278/intel-core-i510400f-processor-12m-cache-up-to-4-30-ghz/specifications.html)

**Motherboard:**

- [Asrock B460M Steel Legend](https://www.asrock.com/mb/Intel/B460M%20Steel%20Legend/)

**DGPU:**

- [MSI Radeon RX 5500 XT Mech OC 4GB](https://www.msi.com/Graphics-Card/radeon-rx-5500-xt-mech-4g-oc)

**IGPU:**

- None

**PCIe Card:**

- [BCM4360 802.11ac Wireless Network Adapter](https://www.amazon.com/BCM94360CD-802-11ac-Wireless-Accessory-Broadcom/dp/B08LNBJVZR)
- [ASM2142 USB 3.0 XHCI Controller](https://shopee.com.my/PCIe-to-USB-3-2-Gen-2-Card-with-20Gbps-Bandwidth-5-Port-i.191431968.15231983955?gclid=Cj0KCQiAmeKQBhDvARIsAHJ7mF5_-v6Q-AnoQ3yGaKPBUAwOTxGRuGKZ7ZWc5d9YJydtv-iuQYpq-QUaAk3wEALw_wcB)

**Memory:**

- [XLR8 DDR4 3200MHz Desktop Memory](https://www.pny.com.tw/en/products-detail/XLR8-DDR4-3200MHz-Desktop-Memory-32GB/)

**Storage:**

- 1 x Silicon Power 500GB NVMe M.2 PCIe Gen3x4 (Maxio Chipset)
  
- 1 x Silicon Power 250GB NVMe M.2 PCIe Gen3x4 (Phison Chipset)
  

- 1 x Silicon Power 500GB Solid State Disk
  
- 2 x Western Digital 500GB WD5000AAKX HDD
  

**OS Tested:**

- [x] macOS `Catalina`
  
- [x] macOS `Big Sur`
  
- [x] macOS `Monterey`
  

**SMBIOS:**

- [x] `iMacPro1,1` (No IGPU)
  

## Tree

```tree
├── BOOT
│   └── BOOTx64.efi
└── OC
    ├── ACPI
    │   ├── SSDT-ACPI.aml             
    ├── Drivers
    │   ├── HfsPlus.efi
    │   ├── OpenCanopy.efi
    │   └── OpenRuntime.efi
    ├── Kexts
    │   ├── AGPMInjector.kext
    │   ├── AppleALC.kext
    │   ├── Lilu.kext
    │   ├── LucyRTL8125Ethernet.kext
    │   ├── Moussey.kext
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

### 1.0 - ACPI

- **Add** | **Delete** | **Patch** | **Quirks**
  

```xml
<key>ACPI</key>
	<dict>
		<key>Add</key>
		<array>
			<dict>
				<key>Comment</key>
				<string></string>
				<key>Enabled</key>
				<true/>
				<key>Path</key>
				<string>SSDT-ACPI.aml</string>
			</dict>
		</array>
		<key>Delete</key>
		<array/>
		<key>Patch</key>
		<array/>
		<key>Quirks</key>
		<dict>
			<key>FadtEnableReset</key>
			<false/>
			<key>NormalizeHeaders</key>
			<false/>
			<key>RebaseRegions</key>
			<false/>
			<key>ResetHwSig</key>
			<false/>
			<key>ResetLogoStatus</key>
			<false/>
			<key>SyncTableIds</key>
			<false/>
		</dict>
	</dict>
```

### 1.1 - SSDT:

| Device | Information |
| --- | --- |
| AWAC | To fix the `System Clocks` found on newer hardware |
| PLUG | To allow the kernel's `XCPM (XNU's CPU Power Management)` to manage CPU's power management |
| EC  | `Fake Embedded Controller` (EC) drivers since `CML` don't have native support EC |
| DMAC | Actually, this was `MCHC` which compiled with `SBUS`. Known as `SSDT-SBUS-MCHC.aml` and renamed as `DMAC`.  (Rename `MCHC` to `DMAC`). Remark: `MCHC` and `SBUS` code is `splitted` |
| GFX0 | `Dedicated Graphic Processor Unit (DGPU)`.  This `SSDT` contain all `Navi 14` patch information.  Contain: `Framebuffer`: `ATY,Keelback`, `CFG,CFG_USE_AGDC` to overcome wake issue using `DGPU`, `_SUN` information is added to reveal proper `slot number` and added `agdpmod=pikera` in data format `70696B657261`. `boot-args` injection via `NVRAM` is `not required`
| HDAU | `High Definition Audio` through `HDMI` patch. `_SUN` information is added to reveal proper `slot number` |
| HDEF | `High Definition Audio System` aka (`HDAS`) in actual `DSDT`, renamed with `HDEF` and injected with `alcid=1`/`layout id/data/01000000` |
| PMCR | Classed as `Memory Controller` and known as `PPMC` in `Comet Lake (CML)` platform. This `SSDT` renamed `PPMC` as `PMCR` with compatible `AppleIntelPCHPMC` support `pci8086,a2a1`, which is identical to `CML` `pci8086,a3a1` |
| TSUB | Nothing fancy, just` Thermal Subsystem` rename which is not identical using `ioreg`. Rename `pci8086,a3b1` to `TSUB` |
| RTLK | Rename `RTL8125 2.5GbE Controller` device as `RP04,PXSX` to `RP04,RTLK` |
| XHC0 | Rename PCIe`ASM2142 USB 3.1 Host Controller` device as `RP05,PXSX` to `RP05,XHC0` and added `acpi-wake-type` to overcome wake issue using USB device. |
| XHC1 | Rename PCIe`Comet Lake PCH-V USB Controller` device as `XHC` to `XHC1` and added `acpi-wake-type` to overcome wake issue using USB device. |
| ANS0 | Rename `RP09,PXSX` to `RP09,ANS0` and spoof `NVMe` as `Apple SSD Controller` .`_SUN` information is added to reveal proper `slot number` |
| ANS1 | Rename `RP021,PXSX` to `RP21,ANS1` and spoof `NVMe` as `Apple SSD Controller`. `_SUN` information is added to reveal proper `slot number` |
| ARPT | Rename `RP20,PXSX` to `RP20,ARPT` and adding `_SUN` information to reveal proper `slot number` |
| SATA | Rename SATA to SAT0 with additional information and spoof `400 Series Chipset Family SATA AHCI Controller` to `Intel 11 Series Chipset Controler` |
| SBUS | To fixing `AppleSMBus` support in macOS.  Eg: `AppleSMBusController`, `AppleSMBusPCI`, `Memory Reporting` and `etc` |
| USBX | To supply USB power properties for Skylake and newer. Nothing fancy here. |

### 1.2 - Code

```aml
/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLpxUPvF.aml, Tue Mar  1 08:23:47 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001CDA (7386)
 *     Revision         0x02
 *     Checksum         0x45
 *     OEM ID           "Apple"
 *     OEM Table ID     "ACPI"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210930 (539035952)
 */
DefinitionBlock ("", "SSDT", 2, "Apple", "ACPI", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.DMAC, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PPMC, DeviceObj)
    External (_SB_.PCI0.RP04, DeviceObj)
    External (_SB_.PCI0.RP04.PXSX, DeviceObj)
    External (_SB_.PCI0.RP04.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.RP09, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX, DeviceObj)
    External (_SB_.PCI0.RP09.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.RP20, DeviceObj)
    External (_SB_.PCI0.RP20.PXSX, DeviceObj)
    External (_SB_.PCI0.RP20.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.RP21, DeviceObj)
    External (_SB_.PCI0.RP21.PXSX, DeviceObj)
    External (_SB_.PCI0.RP21.PXSX._STA, UnknownObj)
    External (_SB_.PCI0.SAT0, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.TSUB, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PR00, ProcessorObj)
    External (_SB_.USBX, DeviceObj)
    External (STAS, IntObj)

    Scope (\_SB)
    {
        Method (_INI, 0, Serialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                STAS = One
            }
        }

        Scope (PR00)
        {
            If (_OSI ("Darwin"))
            {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (!Arg2)
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x02)
                    {
                        "plugin-type", 
                        One
                    })
                }
            }
        }

        Scope (PCI0)
        {
            Scope (LPCB)
            {
                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_STR, Unicode ("Embedded Controller Device"))  // _STR: Description String
                    Method (_STA, 0, Serialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Scope (HDAS)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x0C)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "device_type", 
                        Buffer (0x0D)
                        {
                            "Audio device"
                        }, 

                        "hda-gfx", 
                        Buffer (0x0A)
                        {
                            "onboard-2"
                        }, 

                        "layout-id", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "model", 
                        Buffer (0x16)
                        {
                            "Comet Lake PCH-V cAVS"
                        }, 

                        "name", 
                        Buffer (0x05)
                        {
                            "HDEF"
                        }
                    })
                }
            }

            Device (DMAC)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_STR, Unicode ("Comet Lake-S 6c Host Bridge/DRAM Controller"))  // _STR: Description String
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x08)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "built-in", 
                        Buffer (0x17)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "device_type", 
                        Buffer (0x0C)
                        {
                            "Host bridge"
                        }, 

                        "model", 
                        Buffer (0x2C)
                        {
                            "Comet Lake-S 6c Host Bridge/DRAM Controller"
                        }
                    })
                }
            }

            Scope (PEG0)
            {
                Scope (PEGP)
                {
                    Name (_STR, Unicode ("6th-10th Gen Core Processor PCIe Controller (x16)"))  // _STR: Description String
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (EGP0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Navi 10 XL Upstream Port of PCI Express Switch"))  // _STR: Description String
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Device (EGP1)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (_STR, Unicode ("Navi 10 XL Downstream Port of PCI Express Switch"))  // _STR: Description String
                        Device (GFX0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Name (_STR, Unicode ("Navi 14 [Radeon RX 5500/5500M / Pro 5500M"))  // _STR: Description String
                            Name (_SUN, One)  // _SUN: Slot User Number
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x24)
                                {
                                    "AAPL00,DualLink", 
                                    Buffer (0x1B)
                                    {
                                         0x01, 0x00, 0x00, 0x00                           // ....
                                    }, 

                                    "AAPL,slot-name", 
                                    Buffer (0x1B)
                                    {
                                        "Internal@0,1,0/0,0/0,0/0,0"
                                    }, 

                                    "ATY,copyright", 
                                    Buffer (0x31)
                                    {
                                        /* 0000 */  0x43, 0x6F, 0x70, 0x79, 0x72, 0x69, 0x67, 0x68,  // Copyrigh
                                        /* 0008 */  0x74, 0x20, 0x41, 0x4D, 0x44, 0x20, 0x49, 0x6E,  // t AMD In
                                        /* 0010 */  0x63, 0x2E, 0x20, 0x41, 0x6C, 0x6C, 0x20, 0x52,  // c. All R
                                        /* 0018 */  0x69, 0x67, 0x68, 0x74, 0x73, 0x20, 0x52, 0x65,  // ights Re
                                        /* 0020 */  0x73, 0x65, 0x72, 0x76, 0x65, 0x64, 0x2E, 0x20,  // served. 
                                        /* 0028 */  0x32, 0x30, 0x30, 0x35, 0x2D, 0x32, 0x30, 0x31,  // 2005-201
                                        /* 0030 */  0x39                                             // 9
                                    }, 

                                    "ATY,EFIEnabledMode", 
                                    Buffer (One)
                                    {
                                         0x01                                             // .
                                    }, 

                                    "ATY,EFIVersion", 
                                    Buffer (0x07)
                                    {
                                         0x33, 0x2E, 0x32, 0x2E, 0x31, 0x33, 0x30         // 3.2.130
                                    }, 

                                    "ATY,EFIVersionB", 
                                    Buffer (0x12)
                                    {
                                        /* 0000 */  0x31, 0x31, 0x33, 0x2D, 0x4D, 0x53, 0x49, 0x54,  // 113-MSIT
                                        /* 0008 */  0x56, 0x33, 0x38, 0x32, 0x4D, 0x48, 0x2E, 0x31,  // V382MH.1
                                        /* 0010 */  0x36, 0x31                                       // 61
                                    }, 

                                    "agdpmod", 
                                    Buffer (0x07)
                                    {
                                         0x70, 0x69, 0x6B, 0x65, 0x72, 0x61               // pikera
                                    }, 

                                    "device_type", 
                                    Buffer (One)
                                    {
                                        /* 0000 */  0x0D, 0x41, 0x54, 0x59, 0x2C, 0x50, 0x79, 0x74,  // .ATY,Pyt
                                        /* 0008 */  0x68, 0x6F, 0x6E, 0x50, 0x61, 0x72, 0x65, 0x6E,  // honParen
                                        /* 0010 */  0x74, 0x00                                       // t.
                                    }, 

                                    "CFG,CFG_USE_AGDC", 
                                    Buffer (One)
                                    {
                                         0x01                                             // .
                                    }, 

                                    "hda-gfx", 
                                    Buffer (0x0A)
                                    {
                                        "onboard-1"
                                    }, 

                                    "name", 
                                    Buffer (0x08)
                                    {
                                        "ATY_GPU"
                                    }, 

                                    "PP_PhmSoftPowerPlayTable", 
                                    Buffer (0x068A)
                                    {
                                        /* 0000 */  0x8A, 0x06, 0x0C, 0x00, 0x01, 0xE2, 0x01, 0x1D,  // ........
                                        /* 0008 */  0x09, 0x00, 0x00, 0x7E, 0x3A, 0x00, 0x00, 0x7D,  // ...~:..}
                                        /* 0010 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00,  // ........
                                        /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0020 */  0x71, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // q.......
                                        /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                                        /* 0030 */  0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x6C, 0x07,  // ......l.
                                        /* 0038 */  0x00, 0x00, 0xF3, 0x04, 0x00, 0x00, 0x3E, 0x04,  // ......>.
                                        /* 0040 */  0x00, 0x00, 0xF3, 0x04, 0x00, 0x00, 0xF3, 0x04,  // ........
                                        /* 0048 */  0x00, 0x00, 0x6B, 0x03, 0x00, 0x00, 0xF3, 0x04,  // ..k.....
                                        /* 0050 */  0x00, 0x00, 0x04, 0x05, 0x00, 0x00, 0x04, 0x05,  // ........
                                        /* 0058 */  0x00, 0x00, 0x2A, 0x03, 0x00, 0x00, 0x00, 0x00,  // ..*.....
                                        /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0070 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x01,  // ......,.
                                        /* 0078 */  0x00, 0x00, 0x30, 0x01, 0x00, 0x00, 0x30, 0x01,  // ..0...0.
                                        /* 0080 */  0x00, 0x00, 0x30, 0x01, 0x00, 0x00, 0x30, 0x01,  // ..0...0.
                                        /* 0088 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x30, 0x01,  // ..d...0.
                                        /* 0090 */  0x00, 0x00, 0x34, 0x01, 0x00, 0x00, 0x2C, 0x01,  // ..4...,.
                                        /* 0098 */  0x00, 0x00, 0x2C, 0x01, 0x00, 0x00, 0x00, 0x00,  // ..,.....
                                        /* 00A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00,  // ........
                                        /* 00B8 */  0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x1E, 0x00,  // ........
                                        /* 00C0 */  0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,  // ........
                                        /* 00C8 */  0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,  // ........
                                        /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00E0 */  0x00, 0x00, 0x98, 0x08, 0x00, 0x00, 0x98, 0x08,  // ........
                                        /* 00E8 */  0x00, 0x00, 0x98, 0x08, 0x00, 0x00, 0x7E, 0x04,  // ......~.
                                        /* 00F0 */  0x00, 0x00, 0x98, 0x08, 0x00, 0x00, 0x7E, 0x04,  // ......~.
                                        /* 00F8 */  0x00, 0x00, 0x98, 0x08, 0x00, 0x00, 0x7E, 0x04,  // ......~.
                                        /* 0100 */  0x00, 0x00, 0xA2, 0x03, 0x00, 0x00, 0x14, 0x00,  // ........
                                        /* 0108 */  0x00, 0x00, 0x10, 0x0E, 0x00, 0x00, 0x10, 0x0E,  // ........
                                        /* 0110 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x69, 0x00,  // ..d...i.
                                        /* 0118 */  0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                                        /* 0120 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                                        /* 0128 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x64, 0x00,  // ......d.
                                        /* 0130 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00,  // ..d...d.
                                        /* 0138 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00,  // ..d...d.
                                        /* 0140 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00,  // ..d...d.
                                        /* 0148 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00,  // ..d...d.
                                        /* 0150 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..d.....
                                        /* 0158 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0160 */  0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0x20, 0x03,  // .. ... .
                                        /* 0168 */  0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0xBC, 0x02,  // .. .....
                                        /* 0170 */  0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0xBC, 0x02,  // .. .....
                                        /* 0178 */  0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0xBC, 0x02,  // .. .....
                                        /* 0180 */  0x00, 0x00, 0x71, 0x02, 0x00, 0x00, 0x32, 0x00,  // ..q...2.
                                        /* 0188 */  0x00, 0x00, 0x84, 0x03, 0x00, 0x00, 0x84, 0x03,  // ........
                                        /* 0190 */  0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x32, 0x00,  // ......2.
                                        /* 0198 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x00,  // ........
                                        /* 01B0 */  0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x19, 0x00,  // ..#.....
                                        /* 01B8 */  0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x19, 0x00,  // ..#.....
                                        /* 01C0 */  0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x19, 0x00,  // ..#.....
                                        /* 01C8 */  0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x19, 0x00,  // ..#.....
                                        /* 01D0 */  0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..#.....
                                        /* 01D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01E0 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0xFB, 0xEF,  // ........
                                        /* 01E8 */  0xFF, 0xA7, 0x23, 0x06, 0x00, 0x00, 0x82, 0x00,  // ..#.....
                                        /* 01F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x82, 0x00,  // ........
                                        /* 0200 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0208 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00,  // ........
                                        /* 0210 */  0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x6E, 0x00,  // ......n.
                                        /* 0218 */  0x69, 0x00, 0x69, 0x00, 0x73, 0x00, 0x73, 0x00,  // i.i.s.s.
                                        /* 0220 */  0x73, 0x00, 0x73, 0x00, 0x00, 0x00, 0x00, 0x00,  // s.s.....
                                        /* 0228 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0230 */  0x00, 0x00, 0xFC, 0x70, 0x00, 0x00, 0xFF, 0x01,  // ...p....
                                        /* 0238 */  0x00, 0x00, 0x4B, 0x00, 0x4B, 0x00, 0x00, 0x00,  // ..K.K...
                                        /* 0240 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA5, 0x0A,  // ........
                                        /* 0248 */  0xA5, 0x0A, 0xF0, 0x0A, 0xF0, 0x0A, 0xF8, 0x11,  // ........
                                        /* 0250 */  0x68, 0x10, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,  // h.......
                                        /* 0258 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0260 */  0x00, 0x00, 0x0D, 0xE0, 0x4D, 0x3E, 0xFC, 0xDE,  // ....M>..
                                        /* 0268 */  0xA6, 0xBD, 0x74, 0x98, 0x27, 0x3F, 0x00, 0x00,  // ..t.'?..
                                        /* 0270 */  0x02, 0x00, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00,  // .....?..
                                        /* 0278 */  0x00, 0x00, 0x0C, 0xE5, 0x24, 0x3E, 0x8C, 0xDB,  // ....$>..
                                        /* 0280 */  0x08, 0x3E, 0xE1, 0x45, 0x07, 0x3F, 0x01, 0x01,  // .>.E.?..
                                        /* 0288 */  0x04, 0x00, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00,  // .....?..
                                        /* 0290 */  0x00, 0x00, 0x0C, 0xE5, 0x24, 0x3E, 0x8C, 0xDB,  // ....$>..
                                        /* 0298 */  0x08, 0x3E, 0xE1, 0x45, 0x07, 0x3F, 0x01, 0x00,  // .>.E.?..
                                        /* 02A0 */  0x02, 0x00, 0x22, 0x89, 0x92, 0x3F, 0xBD, 0x35,  // .."..?.5
                                        /* 02A8 */  0xB0, 0x3C, 0xF7, 0x75, 0x20, 0xBE, 0x27, 0x31,  // .<.u .'1
                                        /* 02B0 */  0x80, 0x3F, 0x1D, 0x38, 0xE7, 0x3D, 0x01, 0x00,  // .?.8.=..
                                        /* 02B8 */  0x02, 0x00, 0x33, 0x1B, 0x64, 0x3F, 0xC8, 0xEF,  // ..3.d?..
                                        /* 02C0 */  0x0D, 0x3E, 0x00, 0x00, 0x00, 0x00, 0x4A, 0x7B,  // .>....J{
                                        /* 02C8 */  0x03, 0x3F, 0xDA, 0xAC, 0xBA, 0x3E, 0x01, 0x00,  // .?...>..
                                        /* 02D0 */  0x02, 0x00, 0xBA, 0xDA, 0x5A, 0x3F, 0x9C, 0xE1,  // ....Z?..
                                        /* 02D8 */  0x46, 0x3E, 0x76, 0x4F, 0xAE, 0x3F, 0xE8, 0x6A,  // F>vO.?.j
                                        /* 02E0 */  0x03, 0xC0, 0x31, 0x99, 0xC2, 0x3F, 0x01, 0x00,  // ..1..?..
                                        /* 02E8 */  0x02, 0x00, 0x7B, 0xA0, 0x5D, 0x3F, 0xBB, 0x0F,  // ..{.]?..
                                        /* 02F0 */  0x00, 0x3E, 0x39, 0x45, 0xC7, 0x3D, 0x78, 0x0B,  // .>9E.=x.
                                        /* 02F8 */  0xA4, 0x3E, 0x00, 0x00, 0xC0, 0x3E, 0x02, 0x00,  // .>...>..
                                        /* 0300 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0308 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0310 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,  // ........
                                        /* 0318 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0320 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0328 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0x01,  // ......,.
                                        /* 0330 */  0x6C, 0x07, 0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03,  // l.......
                                        /* 0338 */  0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03,  // ........
                                        /* 0340 */  0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03,  // ........
                                        /* 0348 */  0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03, 0x30, 0x01,  // ......0.
                                        /* 0350 */  0xF3, 0x04, 0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03,  // ........
                                        /* 0358 */  0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03, 0x30, 0x01,  // ......0.
                                        /* 0360 */  0x3E, 0x04, 0xB0, 0x04, 0xB0, 0x04, 0xB0, 0x04,  // >.......
                                        /* 0368 */  0xB0, 0x04, 0xB0, 0x04, 0xB0, 0x04, 0x30, 0x01,  // ......0.
                                        /* 0370 */  0xF3, 0x04, 0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03,  // ........
                                        /* 0378 */  0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03, 0x64, 0x00,  // ......d.
                                        /* 0380 */  0xF4, 0x01, 0x71, 0x02, 0x6B, 0x03, 0x30, 0x01,  // ..q.k.0.
                                        /* 0388 */  0xF3, 0x04, 0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03,  // ........
                                        /* 0390 */  0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03, 0x34, 0x01,  // ......4.
                                        /* 0398 */  0x04, 0x05, 0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03,  // ........
                                        /* 03A0 */  0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03, 0x2C, 0x01,  // ......,.
                                        /* 03A8 */  0x04, 0x05, 0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03,  // ........
                                        /* 03B0 */  0xE8, 0x03, 0xE8, 0x03, 0xE8, 0x03, 0x2C, 0x01,  // ......,.
                                        /* 03B8 */  0x2A, 0x03, 0x20, 0x03, 0x20, 0x03, 0x20, 0x03,  // *. . . .
                                        /* 03C0 */  0x20, 0x03, 0x20, 0x03, 0x20, 0x03, 0xD0, 0x01,  //  . . ...
                                        /* 03C8 */  0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01,  // ........
                                        /* 03D0 */  0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01,  // ........
                                        /* 03D8 */  0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01,  // ........
                                        /* 03E0 */  0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01,  // ........
                                        /* 03E8 */  0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01,  // ........
                                        /* 03F0 */  0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01,  // ........
                                        /* 03F8 */  0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01,  // ........
                                        /* 0400 */  0xD0, 0x01, 0xD0, 0x01, 0xD0, 0x01, 0x6C, 0x07,  // ......l.
                                        /* 0408 */  0xF3, 0x04, 0x6B, 0x03, 0x3E, 0x04, 0xF3, 0x04,  // ..k.>...
                                        /* 0410 */  0xF3, 0x04, 0x04, 0x05, 0x04, 0x05, 0x2A, 0x03,  // ......*.
                                        /* 0418 */  0xD0, 0x01, 0x00, 0x03, 0x03, 0x03, 0x30, 0x01,  // ......0.
                                        /* 0420 */  0xFB, 0x01, 0xF0, 0x0A, 0xF0, 0x0A, 0x28, 0x0A,  // ......(.
                                        /* 0428 */  0x48, 0x0D, 0x48, 0x0D, 0x48, 0x0D, 0x88, 0x13,  // H.H.H...
                                        /* 0430 */  0x18, 0x15, 0x18, 0x15, 0x18, 0x15, 0xF4, 0x01,  // ........
                                        /* 0438 */  0xF4, 0x01, 0xF4, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0440 */  0xD0, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00,  // ........
                                        /* 0448 */  0x5B, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03,  // [.......
                                        /* 0450 */  0x04, 0x04, 0x51, 0x00, 0x6B, 0x02, 0x00, 0x00,  // ..Q.k...
                                        /* 0458 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x00,  // ......2.
                                        /* 0460 */  0x3C, 0x00, 0x00, 0x00, 0x90, 0x01, 0x90, 0x01,  // <.......
                                        /* 0468 */  0x90, 0x01, 0x90, 0x01, 0x90, 0x01, 0x90, 0x01,  // ........
                                        /* 0470 */  0x90, 0x01, 0x90, 0x01, 0x90, 0x01, 0x0F, 0x00,  // ........
                                        /* 0478 */  0xD0, 0x07, 0x98, 0x08, 0x10, 0x0E, 0x50, 0x00,  // ......P.
                                        /* 0480 */  0xDC, 0x05, 0x01, 0x00, 0x01, 0x02, 0x00, 0x00,  // ........
                                        /* 0488 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0490 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0498 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 04A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 04A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 04B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC, 0x4C,  // .......L
                                        /* 04B8 */  0xA1, 0x3C, 0x6E, 0xC0, 0xE7, 0x3C, 0x81, 0x78,  // .<n..<.x
                                        /* 04C0 */  0x5D, 0x3D, 0x73, 0x63, 0x7A, 0x3D, 0x58, 0x39,  // ]=scz=X9
                                        /* 04C8 */  0x34, 0xBC, 0x13, 0x61, 0xC3, 0x3C, 0x00, 0x00,  // 4..a.<..
                                        /* 04D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 04D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 04E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 04E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 04F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x01,  // ........
                                        /* 04F8 */  0x0C, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0500 */  0x00, 0x00, 0x0C, 0x01, 0x0C, 0x01, 0x00, 0x02,  // ........
                                        /* 0508 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0510 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0518 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0520 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0528 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0530 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0538 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1E, 0x00,  // ........
                                        /* 0540 */  0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // F.......
                                        /* 0548 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0550 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0558 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0560 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0568 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCB, 0x00,  // ........
                                        /* 0570 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0578 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0580 */  0x00, 0x00, 0x19, 0x00, 0x19, 0x00, 0x00, 0x00,  // ........
                                        /* 0588 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0590 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0598 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 05F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0600 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0608 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0610 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0618 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0620 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0628 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0630 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0638 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0640 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0648 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0650 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0658 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0660 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0668 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0670 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0678 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0680 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0688 */  0x00, 0x00                                       // ..
                                    }, 

                                    "@0,name", 
                                    Buffer (0x0D)
                                    {
                                        "ATY,Keelback"
                                    }, 

                                    "@1,name", 
                                    Buffer (0x0D)
                                    {
                                        "ATY,Keelback"
                                    }, 

                                    "@2,name", 
                                    Buffer (0x0D)
                                    {
                                        "ATY,Keelback"
                                    }, 

                                    "@3,name", 
                                    Buffer (0x0D)
                                    {
                                        "ATY,Keelback"
                                    }, 

                                    "@0,AAPL,boot-display", 
                                    Buffer (0x04)
                                    {
                                         0x01, 0x00, 0x00, 0x00                           // ....
                                    }, 

                                    "@0,ATY,EFIDisplay", 
                                    Buffer (0x04)
                                    {
                                        "DP1"
                                    }
                                })
                            }
                        }

                        Device (HDAU)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_STR, Unicode ("Navi 10 HDMI Audio"))  // _STR: Description String
                            Name (_SUN, One)  // _SUN: Slot User Number
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x0A)
                                {
                                    "AAPL,slot-name", 
                                    Buffer (0x1B)
                                    {
                                        "Internal@0,1,0/0,0/0,0/0,1"
                                    }, 

                                    "device_type", 
                                    Buffer (0x1D)
                                    {
                                        "High Definition Audio device"
                                    }, 

                                    "hda-gfx", 
                                    Buffer (0x0A)
                                    {
                                        "onboard-1"
                                    }, 

                                    "model", 
                                    Buffer (0x21)
                                    {
                                        "AMD Radeon RX 5500 XT HDMI Audio"
                                    }, 

                                    "name", 
                                    Buffer (0x05)
                                    {
                                        "HDAU"
                                    }
                                })
                            }
                        }
                    }
                }
            }

            Scope (PPMC)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (PMCR)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                Name (_STR, Unicode ("Memory controller"))  // _STR: Description String
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x0E)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "built-in", 
                        Buffer (0x17)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "compatible", 
                        Buffer (0x0D)
                        {
                            "pci8086,a2a1"
                        }, 

                        "device_type", 
                        Buffer (0x12)
                        {
                            "Memory controller"
                        }, 

                        "IOPCIMSIMode", 
                        Buffer (One)
                        {
                             0x01                                             // .
                        }, 

                        "model", 
                        Buffer (0x23)
                        {
                            "Comet Lake PCH-V Memory Controller"
                        }, 

                        "name", 
                        Buffer (0x05)
                        {
                            "PMCR"
                        }
                    })
                }
            }

            Device (TSUB)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                Name (_STR, Unicode ("Comet Lake PCH-V Thermal Subsystem"))  // _STR: Description String
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x08)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "built-in", 
                        Buffer (0x17)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "device_type", 
                        Buffer (0x1D)
                        {
                            "Signal processing controller"
                        }, 

                        "model", 
                        Buffer (0x25)
                        {
                            "Comet Lake-S PCH-V Thermal Subsystem"
                        }
                    })
                }
            }

            Scope (RP04)
            {
                Scope (PXSX)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (RTLK)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("RTL8125 2.5GbE Controller"))  // _STR: Description String
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x0A)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x09)
                            {
                                "Internal"
                            }, 

                            "built-in", 
                            Buffer (0x17)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x14)
                            {
                                "Ethernet controller"
                            }, 

                            "model", 
                            Buffer (0x1A)
                            {
                                "RTL8125 2.5GbE Controller"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "ETH0"
                            }
                        })
                    }
                }
            }

            Scope (RP05)
            {
                Scope (PXSX)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (XHC0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("ASM2142 USB 3.1 Host Controller"))  // _STR: Description String
                    Name (_SUN, 0x04)  // _SUN: Slot User Number
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x0C)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x14)
                            {
                                "Internal@0,28,4/0,0"
                            }, 

                            "acpi-wake-type", 
                            Buffer (One)
                            {
                                 0x01                                             // .
                            }, 

                            "built-in", 
                            Buffer (0x17)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device-id", 
                            Buffer (0x17)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x0F)
                            {
                                "USB controller"
                            }, 

                            "model", 
                            Buffer (0x20)
                            {
                                "ASM2142 USB 3.1 Host Controller"
                            }
                        })
                    }
                }
            }

            Scope (RP09)
            {
                Scope (PXSX)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (ANS0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("NVMe SSD Controller MAP1001"))  // _STR: Description String
                    Name (_SUN, Zero)  // _SUN: Slot User Number
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x0E)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x14)
                            {
                                "Internal@0,29,0/0,0"
                            }, 

                            "built-in", 
                            Buffer (0x17)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device-id", 
                            Buffer (0x17)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x1F)
                            {
                                "Non-Volatile memory controller"
                            }, 

                            "model", 
                            Buffer (0x14)
                            {
                                "SPCC M.2 NVMe-Maxio"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "NVM0"
                            }, 

                            "vendor-id", 
                            Buffer (0x17)
                            {
                                 0x4D, 0x14, 0x00, 0x00                           // M...
                            }
                        })
                    }
                }
            }

            Scope (RP20)
            {
                Scope (PXSX)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (ARPT)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("BCM4360 802.11ac Wireless Network Adapter"))  // _STR: Description String
                    Name (_SUN, 0x03)  // _SUN: Slot User Number
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x0A)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x14)
                            {
                                "Internal@0,27,0/0,0"
                            }, 

                            "built-in", 
                            Buffer (0x17)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x13)
                            {
                                "Network controller"
                            }, 

                            "model", 
                            Buffer (0x2A)
                            {
                                "BCM4360 802.11ac Wireless Network Adapter"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "WLAN"
                            }
                        })
                    }
                }
            }

            Scope (RP21)
            {
                Scope (PXSX)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (ANS1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("PS5013 E13 NVMe Controller"))  // _STR: Description String
                    Name (_SUN, 0x02)  // _SUN: Slot User Number
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x0E)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x14)
                            {
                                "Internal@0,27,4/0,0"
                            }, 

                            "built-in", 
                            Buffer (0x17)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device-id", 
                            Buffer (0x17)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x1F)
                            {
                                "Non-Volatile memory controller"
                            }, 

                            "model", 
                            Buffer (0x15)
                            {
                                "SPCC M.2 NVMe-Phison"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "NVM1"
                            }, 

                            "vendor-id", 
                            Buffer (0x17)
                            {
                                 0x4D, 0x14, 0x00, 0x00                           // M...
                            }
                        })
                    }
                }
            }

            Scope (SAT0)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (SATA)
            {
                Name (_ADR, 0x00170000)  // _ADR: Address
                Name (_STR, Unicode ("400 Series Chipset Family SATA AHCI Controller"))  // _STR: Description String
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x0E)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "built-in", 
                        Buffer (0x17)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "compatible", 
                        Buffer (0x10)
                        {
                            "pci8086,a352"
                        }, 

                        "device_type", 
                        Buffer (0x10)
                        {
                            "SATA controller"
                        }, 

                        "IOPCIMSIMode", 
                        Buffer (One)
                        {
                             0x01                                             // .
                        }, 

                        "model", 
                        Buffer (0x22)
                        {
                            "Intel 11 Series Chipset Controler"
                        }, 

                        "name", 
                        Buffer (0x05)
                        {
                            "SATA"
                        }
                    })
                }
            }

            Scope (SBUS)
            {
                Device (BUS0)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_ADR, 0x001F0004)  // _ADR: Address
                    Name (_STR, Unicode ("Comet Lake PCH-V SMBus Host Controller "))  // _STR: Description String
                    Device (BLC0)
                    {
                        Name (_ADR, 0x57)  // _ADR: Address
                        Name (_STR, Unicode ("AppleSMBusControllerICH"))  // _STR: Description String
                        Name (_CID, "smbus-blc")  // _CID: Compatible ID
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            If (!Arg2)
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }

                            Return (Package (0x02)
                            {
                                "address", 
                                Zero
                            })
                        }
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Scope (XHC)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (XHC1)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                Name (_STR, Unicode ("Comet Lake PCH-V USB Controller"))  // _STR: Description String
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x02)
                    {
                        "acpi-wake-type", 
                        Buffer (0x17)
                        {
                             0x01                                             // .
                        }
                    })
                }
            }
        }

        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_STR, Unicode ("PXSX/XHC Power Control"))  // _STR: Description String
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply", 
                    0x13EC, 
                    "kUSBSleepPortCurrentLimit", 
                    0x0834, 
                    "kUSBWakePowerSupply", 
                    0x13EC, 
                    "kUSBWakePortCurrentLimit", 
                    0x0834
                })
            }
        }
    }
}
```
<p align="center"><img width="1405" alt="Screen Shot 2022-02-25 at 9 51 15 PM" src="https://user-images.githubusercontent.com/72515939/155726770-b850f956-9676-4ac8-9cdc-05ec3a3b884d.png"><p/>

<p align="center"><img width="1405" alt="Screen Shot 2022-02-25 at 9 51 53 PM" src="https://user-images.githubusercontent.com/72515939/155726776-df0830cf-eb5c-4c11-b2a7-17393ee87aa1.png"><p/>


### 3.0 - DeviceProperties

- **Add** | **Delete** |

1. `PciRoot(0x0)/Pci(0x14,0x0)` just a patch are only used for display information related to the `CML PCH-V USB Controller` via `About This Mac/System Report/PCI`). Without this patch, information related to the device is working but not displayed. It's Optional.
  
2. `PciRoot(0x0)/Pci(0x1F,0x4)` just a patch are only used for display information related to the `Comet Lake PCH-V SMBus Host Controllerr` via `About This Mac/System Report/PCI`). Without this patch, information related to the device is working but not displayed. It's Optional.
  

```xml
</dict>
	<key>DeviceProperties</key>
	<dict>
		<key>Add</key>
		<dict>
			<key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1,0x0)/Pci(0x0,0x0)/Pci(0x0,0x0)/Pci(0x0,0x1)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x14,0x0)</key>
			<dict>
				<key>AAPL,slot-name</key>
				<string>Internal</string>
				<key>device_type</key>
				<string>USB controller</string>
				<key>model</key>
				<string>Comet Lake PCH-V USB Controller</string>
			</dict>
			<key>PciRoot(0x0)/Pci(0x17,0x0)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1B,0x4)/Pci(0x0,0x0)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1C,0x0)/Pci(0x0,0x0)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1C,0x4)/Pci(0x0,0x0)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1D,0x0)/Pci(0x0,0x0)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1F,0x2)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1F,0x3)</key>
			<dict/>
			<key>PciRoot(0x0)/Pci(0x1F,0x4)</key>
			<dict>
				<key>AAPL,slot-name</key>
				<string>Internal</string>
				<key>IOPCIMSIMode</key>
				<integer>1</integer>
				<key>built-in</key>
				<data>
				AQ==
				</data>
				<key>device_type</key>
				<string>SMBus</string>
				<key>model</key>
				<string>Comet Lake PCH-V SMBus Host Controller</string>
				<key>name</key>
				<string>SBUS</string>
			</dict>
		</dict>
		<key>Delete</key>
		<dict/>
	</dict>
```
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 56 07 PM" src="https://user-images.githubusercontent.com/72515939/155727382-5ebb3a2c-167b-4315-9d79-70e073eb4888.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 23 50 PM" src="https://user-images.githubusercontent.com/72515939/155723321-50ab188d-5eb7-48a4-b646-6c5221e7d316.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 23 55 PM" src="https://user-images.githubusercontent.com/72515939/155723344-c35c57b1-0d8d-433b-8a10-a12f44838072.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 23 59 PM" src="https://user-images.githubusercontent.com/72515939/155723351-60a00513-3fcb-4d3c-9fc6-593b304a9e1a.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 24 07 PM" src="https://user-images.githubusercontent.com/72515939/155723355-aff97499-a4c9-484f-a759-3b157951b931.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 24 12 PM" src="https://user-images.githubusercontent.com/72515939/155723926-d6cea777-f0bb-4d88-8a89-fd374488ca41.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 24 18 PM" src="https://user-images.githubusercontent.com/72515939/155723375-14b14d0c-87bd-4fb4-ae44-66d4b1e16612.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 24 23 PM" src="https://user-images.githubusercontent.com/72515939/155723385-4f6e69f6-7a21-41ec-8e46-e60121b54357.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 24 27 PM" src="https://user-images.githubusercontent.com/72515939/155723392-90eee8b0-724a-4776-b213-de7f7cc23959.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 24 40 PM" src="https://user-images.githubusercontent.com/72515939/155723398-dfa6a99a-2c65-4602-ac88-3cfc587e5cdf.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 24 54 PM" src="https://user-images.githubusercontent.com/72515939/155723407-05dc9c4d-f5d8-4493-922a-b0e197e3244c.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 25 03 PM" src="https://user-images.githubusercontent.com/72515939/155723414-58fbfe77-fbc3-44c4-972e-548a354b0a6a.png"><p/>
<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 30 41 PM" src="https://user-images.githubusercontent.com/72515939/155723661-9cbe4969-2d44-4329-b509-af6b6b67f67b.png"><p/>


### 4.0 - Kernel

- **Add** | **Block** | **Emulate** | **Force** | **Patch** | **Quirks** | **Scheme**
  

| Kext | Information |
| --- | --- |
| Lilu | `Arbitrary kext` and `process patching` on macOS |
| VirtualSMC | `System Management Controller` (SMC) emulator layer |
| AppleALC | An `open source kernel extension` enabling `native macOS HD audio` for `not officially supported codecs` without any filesystem modifications |
| Whatevergreen | `Various patches` necessary for certain `ATI`/`AMD`/`Intel`/`Nvidia` GPUs |
| SMCProcessor | Additional support for `VirtualSMC`. Used for monitoring `CPU` temperature |
| SMCSuperIO | Additional support for `VirtualSMC`. Used for monitoring `FAN` speed |
| SMCRadeonGPU | Based on `FakeSMCs` `RadeonMonitor` to provide `GPU` temperature to a dedicated gadget `without relying` on `FakeSMC` being installed and can therefore be used with `VirtualSMC` instead |
| RadeonSensor | To read the `GPU` temperature. `Lilu` is required. |
| LucyRTL8125Ethernet | `Realtek RTL8125 2.5GBit Ethernet Controllers` driver |
| AGPMInjector | `Apple Graphics Power Management` (AGPM). Only need when selected `SMBIOS` is `not freatured` with certain selected `DGPU`. Patch:`AGPM`/`Machines`/`iMacPro1,1`/`Vendor1002Device7340.`Require [AGPMinjector](https://github.com/Pavo-IM/AGPMInjector) |
| USBMap | Kext to `route` selected `USB ports`. This is `compulsory to handle` `15 port limit` requirements by macOS. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool) |
| Moussey | My `modified` kext based from late [FakeAppleWirelessMouse.kext](https://github.com/ArchCryptonIO/Kext-Collection) |

```xml
</dict>
	<key>Kernel</key>
	<dict>
		<key>Add</key>
		<array>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>Lilu.kext</string>
				<key>Comment</key>
				<string>V1.6.0</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/Lilu</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>VirtualSMC.kext</string>
				<key>Comment</key>
				<string>V1.2.8</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/VirtualSMC</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>AppleALC.kext</string>
				<key>Comment</key>
				<string>V1.6.9</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/AppleALC</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>WhateverGreen.kext</string>
				<key>Comment</key>
				<string>V1.5.7</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/WhateverGreen</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>SMCProcessor.kext</string>
				<key>Comment</key>
				<string>V1.2.8</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/SMCProcessor</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>SMCSuperIO.kext</string>
				<key>Comment</key>
				<string>V1.2.8</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/SMCSuperIO</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>SMCRadeonGPU.kext</string>
				<key>Comment</key>
				<string>V0.3.1</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/SMCRadeonGPU</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>RadeonSensor.kext</string>
				<key>Comment</key>
				<string>V0.3.1</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/RadeonSensor</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>LucyRTL8125Ethernet.kext</string>
				<key>Comment</key>
				<string>V1.1.0d12</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string>Contents/MacOS/LucyRTL8125Ethernet</string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>AGPMInjector.kext</string>
				<key>Comment</key>
				<string>V127</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string></string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>USBMap.kext</string>
				<key>Comment</key>
				<string>V1.0</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string></string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string>19.0.0</string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>BundlePath</key>
				<string>Moussey.kext</string>
				<key>Comment</key>
				<string>V999</string>
				<key>Enabled</key>
				<true/>
				<key>ExecutablePath</key>
				<string></string>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>PlistPath</key>
				<string>Contents/Info.plist</string>
			</dict>
		</array>
		<key>Block</key>
		<array/>
		<key>Emulate</key>
		<dict>
			<key>Cpuid1Data</key>
			<data>
			</data>
			<key>Cpuid1Mask</key>
			<data>
			</data>
			<key>DummyPowerManagement</key>
			<false/>
			<key>MaxKernel</key>
			<string></string>
			<key>MinKernel</key>
			<string></string>
		</dict>
		<key>Force</key>
		<array/>
		<key>Patch</key>
		<array>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>Base</key>
				<string></string>
				<key>Comment</key>
				<string>USB Port limit patch #1/2 10.15.x (credit DalianSky) | Catalina</string>
				<key>Count</key>
				<integer>0</integer>
				<key>Enabled</key>
				<false/>
				<key>Find</key>
				<data>
				g/sPDw==
				</data>
				<key>Identifier</key>
				<string>com.apple.iokit.IOUSBHostFamily</string>
				<key>Limit</key>
				<integer>0</integer>
				<key>Mask</key>
				<data>
				</data>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>Replace</key>
				<data>
				g/s/Dw==
				</data>
				<key>ReplaceMask</key>
				<data>
				</data>
				<key>Skip</key>
				<integer>0</integer>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>Base</key>
				<string></string>
				<key>Comment</key>
				<string>USB Port limit patch #2/2 10.15.x (credit DalianSky) | Catalina</string>
				<key>Count</key>
				<integer>0</integer>
				<key>Enabled</key>
				<false/>
				<key>Find</key>
				<data>
				g/kPDw==
				</data>
				<key>Identifier</key>
				<string>com.apple.driver.usb.AppleUSBXHCI</string>
				<key>Limit</key>
				<integer>0</integer>
				<key>Mask</key>
				<data>
				</data>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>Replace</key>
				<data>
				g/k/Dw==
				</data>
				<key>ReplaceMask</key>
				<data>
				</data>
				<key>Skip</key>
				<integer>0</integer>
			</dict>
			<dict>
				<key>Arch</key>
				<string>x86_64</string>
				<key>Base</key>
				<string></string>
				<key>Comment</key>
				<string>Enable TRIM for SSD</string>
				<key>Count</key>
				<integer>0</integer>
				<key>Enabled</key>
				<true/>
				<key>Find</key>
				<data>
				AEFQUExFIFNTRAA=
				</data>
				<key>Identifier</key>
				<string>com.apple.iokit.IOAHCIBlockStorage</string>
				<key>Limit</key>
				<integer>0</integer>
				<key>Mask</key>
				<data>
				</data>
				<key>MaxKernel</key>
				<string></string>
				<key>MinKernel</key>
				<string></string>
				<key>Replace</key>
				<data>
				AAAAAAAAAAAAAAA=
				</data>
				<key>ReplaceMask</key>
				<data>
				</data>
				<key>Skip</key>
				<integer>0</integer>
			</dict>
		</array>
		<key>Quirks</key>
		<dict>
			<key>AppleCpuPmCfgLock</key>
			<false/>
			<key>AppleXcpmCfgLock</key>
			<false/>
			<key>AppleXcpmExtraMsrs</key>
			<false/>
			<key>AppleXcpmForceBoost</key>
			<false/>
			<key>CustomSMBIOSGuid</key>
			<false/>
			<key>DisableIoMapper</key>
			<true/>
			<key>DisableLinkeditJettison</key>
			<true/>
			<key>DisableRtcChecksum</key>
			<false/>
			<key>ExtendBTFeatureFlags</key>
			<false/>
			<key>ExternalDiskIcons</key>
			<false/>
			<key>ForceSecureBootScheme</key>
			<false/>
			<key>IncreasePciBarSize</key>
			<false/>
			<key>LapicKernelPanic</key>
			<false/>
			<key>LegacyCommpage</key>
			<false/>
			<key>PanicNoKextDump</key>
			<true/>
			<key>PowerTimeoutKernelPanic</key>
			<true/>
			<key>ProvideCurrentCpuInfo</key>
			<false/>
			<key>SetApfsTrimTimeout</key>
			<integer>-1</integer>
			<key>ThirdPartyDrives</key>
			<false/>
			<key>XhciPortLimit</key>
			<false/>
		</dict>
		<key>Scheme</key>
		<dict>
			<key>CustomKernel</key>
			<false/>
			<key>FuzzyMatch</key>
			<true/>
			<key>KernelArch</key>
			<string>x86_64</string>
			<key>KernelCache</key>
			<string>Auto</string>
		</dict>
	</dict>
```

### 5.0 - Misc

- **BlessOverride** | **Boot** | **Debug** | **Entries** | **Patch** | **Security** | **Tools**

#### 5.1 Feature

1. `PickerMode` Enabled (Require `OpenCanopy.efi`) in `Boot` section
  
2. All `Error` and `Warning` log is disable in `Debug` section
  

```xml
</dict>
	<key>Misc</key>
	<dict>
		<key>BlessOverride</key>
		<array/>
		<key>Boot</key>
		<dict>
			<key>ConsoleAttributes</key>
			<integer>0</integer>
			<key>HibernateMode</key>
			<string>Auto</string>
			<key>HideAuxiliary</key>
			<true/>
			<key>LauncherOption</key>
			<string>Full</string>
			<key>LauncherPath</key>
			<string>Default</string>
			<key>PickerAttributes</key>
			<integer>17</integer>
			<key>PickerAudioAssist</key>
			<false/>
			<key>PickerMode</key>
			<string>External</string>
			<key>PickerVariant</key>
			<string>Acidanthera\GoldenGate</string>
			<key>PollAppleHotKeys</key>
			<false/>
			<key>ShowPicker</key>
			<true/>
			<key>TakeoffDelay</key>
			<integer>0</integer>
			<key>Timeout</key>
			<integer>5</integer>
		</dict>
		<key>Debug</key>
		<dict>
			<key>AppleDebug</key>
			<false/>
			<key>ApplePanic</key>
			<false/>
			<key>DisableWatchDog</key>
			<false/>
			<key>DisplayDelay</key>
			<integer>0</integer>
			<key>DisplayLevel</key>
			<integer>0</integer>
			<key>SerialInit</key>
			<false/>
			<key>SysReport</key>
			<false/>
			<key>Target</key>
			<integer>0</integer>
		</dict>
		<key>Entries</key>
		<array/>
		<key>Security</key>
		<dict>
			<key>AllowNvramReset</key>
			<true/>
			<key>AllowSetDefault</key>
			<true/>
			<key>AllowToggleSip</key>
			<true/>
			<key>ApECID</key>
			<integer>0</integer>
			<key>AuthRestart</key>
			<false/>
			<key>BlacklistAppleUpdate</key>
			<true/>
			<key>DmgLoading</key>
			<string>Signed</string>
			<key>EnablePassword</key>
			<false/>
			<key>ExposeSensitiveData</key>
			<integer>6</integer>
			<key>HaltLevel</key>
			<integer>2147483648</integer>
			<key>PasswordHash</key>
			<data>
			</data>
			<key>PasswordSalt</key>
			<data>
			</data>
			<key>ScanPolicy</key>
			<integer>2690819</integer>
			<key>SecureBootModel</key>
			<string>Default</string>
			<key>Vault</key>
			<string>Optional</string>
		</dict>
		<key>Tools</key>
		<array>
			<dict>
				<key>Arguments</key>
				<string></string>
				<key>Auxiliary</key>
				<true/>
				<key>Comment</key>
				<string>CleanNvram.efi</string>
				<key>Enabled</key>
				<true/>
				<key>Flavour</key>
				<string>Auto</string>
				<key>Name</key>
				<string>CleanNvram.efi</string>
				<key>Path</key>
				<string>CleanNvram.efi</string>
				<key>RealPath</key>
				<false/>
				<key>TextMode</key>
				<false/>
			</dict>
		</array>
	</dict>
```
#### 5.2 Csrutil  

<p align="center"><img width="697" alt="Screen Shot 2022-02-25 at 9 11 05 PM" src="https://user-images.githubusercontent.com/72515939/155721342-b2ca1831-5ec2-4d6e-8554-838554e8d6c4.png"><p/>


### 6.0 - NVRAM

- No `boot-args` is require

```xml
<key>NVRAM</key>
	<dict>
		<key>Add</key>
		<dict>
			<key>4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14</key>
			<dict>
				<key>DefaultBackgroundColor</key>
				<data>
				AAAAAA==
				</data>
				<key>UIScale</key>
				<data>
				AQ==
				</data>
			</dict>
			<key>4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102</key>
			<dict>
				<key>rtc-blacklist</key>
				<data>
				</data>
			</dict>
			<key>7C436110-AB2A-4BBB-A880-FE41995C9F82</key>
			<dict>
				<key>ForceDisplayRotationInEFI</key>
				<integer>0</integer>
				<key>SystemAudioVolume</key>
				<data>
				Rg==
				</data>
				<key>boot-args</key>
				<string></string>
				<key>csr-active-config</key>
				<data>
				AAAAAA==
				</data>
				<key>prev-lang:kbd</key>
				<data>
				ZW4tVVM6MA==
				</data>
				<key>run-efi-updater</key>
				<string>No</string>
			</dict>
		</dict>
		<key>Delete</key>
		<dict>
			<key>4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14</key>
			<array>
				<string>UIScale</string>
				<string>DefaultBackgroundColor</string>
			</array>
			<key>4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102</key>
			<array>
				<string>rtc-blacklist</string>
			</array>
			<key>7C436110-AB2A-4BBB-A880-FE41995C9F82</key>
			<array>
				<string>boot-args</string>
			</array>
		</dict>
		<key>LegacyEnable</key>
		<false/>
		<key>LegacyOverwrite</key>
		<false/>
		<key>LegacySchema</key>
		<dict>
			<key>7C436110-AB2A-4BBB-A880-FE41995C9F82</key>
			<array>
				<string>EFILoginHiDPI</string>
				<string>EFIBluetoothDelay</string>
				<string>LocationServicesEnabled</string>
				<string>SystemAudioVolume</string>
				<string>SystemAudioVolumeDB</string>
				<string>SystemAudioVolumeSaved</string>
				<string>bluetoothActiveControllerInfo</string>
				<string>bluetoothInternalControllerInfo</string>
				<string>flagstate</string>
				<string>fmm-computer-name</string>
				<string>fmm-mobileme-token-FMM</string>
				<string>fmm-mobileme-token-FMM-BridgeHasAccount</string>
				<string>nvda_drv</string>
				<string>prev-lang:kbd</string>
			</array>
			<key>8BE4DF61-93CA-11D2-AA0D-00E098032B8C</key>
			<array>
				<string>Boot0080</string>
				<string>Boot0081</string>
				<string>Boot0082</string>
				<string>BootNext</string>
				<string>BootOrder</string>
			</array>
		</dict>
		<key>WriteFlash</key>
		<true/>
	</dict>
```
<p align="center"><img width="1636" alt="Screen Shot 2022-02-25 at 9 17 07 PM" src="https://user-images.githubusercontent.com/72515939/155721615-fd029f19-26a1-4e31-898f-f7d0784340bf.png">
<p/>


### 7.0 - PlatformInfo

- `iMacPro1,1` SMBIOS

```xml
</dict>
	<key>PlatformInfo</key>
	<dict>
		<key>Automatic</key>
		<true/>
		<key>CustomMemory</key>
		<false/>
		<key>Generic</key>
		<dict>
			<key>AdviseFeatures</key>
			<false/>
			<key>MLB</key>
			<string>00000000000000000</string>
			<key>MaxBIOSVersion</key>
			<false/>
			<key>ProcessorType</key>
			<integer>0</integer>
			<key>ROM</key>
			<data>
			wEPIYNlY
			</data>
			<key>SpoofVendor</key>
			<true/>
			<key>SystemMemoryStatus</key>
			<string>Auto</string>
			<key>SystemProductName</key>
			<string>iMacPro1,1</string>
			<key>SystemSerialNumber</key>
			<string>000000000000</string>
			<key>SystemUUID</key>
			<string>00000000-0000-0000-0000-000000000000</string>
		</dict>
		<key>UpdateDataHub</key>
		<true/>
		<key>UpdateNVRAM</key>
		<true/>
		<key>UpdateSMBIOS</key>
		<true/>
		<key>UpdateSMBIOSMode</key>
		<string>Create</string>
		<key>UseRawUuidEncoding</key>
		<false/>
	</dict>
```

<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 9 18 14 PM" src="https://user-images.githubusercontent.com/72515939/155721828-8fe6d6da-037c-40e1-a154-3e2c3db0a3c8.png"><p/>


### 8.0 - UEFI

- **APFS** | **AppleInput** | **Audio** | **ConnectedDrivers** | **Drivers** | **Input** | **Output** | **ProtocolOverrides** | **Quirks** | **ReserveMemory**

**8.1 - APFS**

- [x] Catalina require `MinDate -1` & `MinVersion -1`
  
- [x] Big Sur require `MinDate -0` & `MinVersion -0`
  
- [x] Monterey require `MinDate -0` & `MinVersion -0`
  

**8.2 - Drivers**

- [x] HfsPlus.efi - Needed for seeing `HFS` volumes
  
- [x] OpenCanopy.efi - `OpenCore Beauty Treatment` extension
  
- [x] OpenRuntime.efi - Extension for `OpenCore` to help with patching `boot.efi `for `NVRAM` fixes and better `memory management`

```xml
</dict>
	<key>UEFI</key>
	<dict>
		<key>APFS</key>
		<dict>
			<key>EnableJumpstart</key>
			<true/>
			<key>GlobalConnect</key>
			<false/>
			<key>HideVerbose</key>
			<true/>
			<key>JumpstartHotPlug</key>
			<false/>
			<key>MinDate</key>
			<integer>0</integer>
			<key>MinVersion</key>
			<integer>0</integer>
		</dict>
		<key>AppleInput</key>
		<dict>
			<key>AppleEvent</key>
			<string>Builtin</string>
			<key>CustomDelays</key>
			<false/>
			<key>GraphicsInputMirroring</key>
			<true/>
			<key>KeyInitialDelay</key>
			<integer>0</integer>
			<key>KeySubsequentDelay</key>
			<integer>5</integer>
			<key>PointerPollMask</key>
			<integer>-1</integer>
			<key>PointerPollMax</key>
			<integer>80</integer>
			<key>PointerPollMin</key>
			<integer>10</integer>
			<key>PointerSpeedDiv</key>
			<integer>1</integer>
			<key>PointerSpeedMul</key>
			<integer>1</integer>
		</dict>
		<key>Audio</key>
		<dict>
			<key>AudioCodec</key>
			<integer>0</integer>
			<key>AudioDevice</key>
			<string>PciRoot(0x0)/Pci(0x1F,0x3)</string>
			<key>AudioOutMask</key>
			<integer>1</integer>
			<key>AudioSupport</key>
			<false/>
			<key>DisconnectHda</key>
			<false/>
			<key>MaximumGain</key>
			<integer>-15</integer>
			<key>MinimumAssistGain</key>
			<integer>-30</integer>
			<key>MinimumAudibleGain</key>
			<integer>-55</integer>
			<key>PlayChime</key>
			<string>Auto</string>
			<key>ResetTrafficClass</key>
			<false/>
			<key>SetupDelay</key>
			<integer>0</integer>
		</dict>
		<key>ConnectDrivers</key>
		<true/>
		<key>Drivers</key>
		<array>
			<dict>
				<key>Arguments</key>
				<string></string>
				<key>Comment</key>
				<string>HfsPlus.efi</string>
				<key>Enabled</key>
				<true/>
				<key>Path</key>
				<string>HfsPlus.efi</string>
			</dict>
			<dict>
				<key>Arguments</key>
				<string></string>
				<key>Comment</key>
				<string>OpenCanopy.efi</string>
				<key>Enabled</key>
				<true/>
				<key>Path</key>
				<string>OpenCanopy.efi</string>
			</dict>
			<dict>
				<key>Arguments</key>
				<string></string>
				<key>Comment</key>
				<string>OpenRuntime.efi</string>
				<key>Enabled</key>
				<true/>
				<key>Path</key>
				<string>OpenRuntime.efi</string>
			</dict>
		</array>
		<key>Input</key>
		<dict>
			<key>KeyFiltering</key>
			<false/>
			<key>KeyForgetThreshold</key>
			<integer>5</integer>
			<key>KeySupport</key>
			<true/>
			<key>KeySupportMode</key>
			<string>Auto</string>
			<key>KeySwap</key>
			<false/>
			<key>PointerSupport</key>
			<false/>
			<key>PointerSupportMode</key>
			<string>ASUS</string>
			<key>TimerResolution</key>
			<integer>50000</integer>
		</dict>
		<key>Output</key>
		<dict>
			<key>ClearScreenOnModeSwitch</key>
			<false/>
			<key>ConsoleMode</key>
			<string></string>
			<key>DirectGopRendering</key>
			<false/>
			<key>ForceResolution</key>
			<false/>
			<key>GopPassThrough</key>
			<string>Disabled</string>
			<key>IgnoreTextInGraphics</key>
			<false/>
			<key>ProvideConsoleGop</key>
			<true/>
			<key>ReconnectGraphicsOnConnect</key>
			<false/>
			<key>ReconnectOnResChange</key>
			<false/>
			<key>ReplaceTabWithSpace</key>
			<false/>
			<key>Resolution</key>
			<string>Max</string>
			<key>SanitiseClearScreen</key>
			<false/>
			<key>TextRenderer</key>
			<string>BuiltinGraphics</string>
			<key>UIScale</key>
			<integer>-1</integer>
			<key>UgaPassThrough</key>
			<false/>
		</dict>
		<key>ProtocolOverrides</key>
		<dict>
			<key>AppleAudio</key>
			<false/>
			<key>AppleBootPolicy</key>
			<false/>
			<key>AppleDebugLog</key>
			<false/>
			<key>AppleEg2Info</key>
			<false/>
			<key>AppleFramebufferInfo</key>
			<false/>
			<key>AppleImageConversion</key>
			<false/>
			<key>AppleImg4Verification</key>
			<false/>
			<key>AppleKeyMap</key>
			<false/>
			<key>AppleRtcRam</key>
			<false/>
			<key>AppleSecureBoot</key>
			<false/>
			<key>AppleSmcIo</key>
			<false/>
			<key>AppleUserInterfaceTheme</key>
			<false/>
			<key>DataHub</key>
			<false/>
			<key>DeviceProperties</key>
			<false/>
			<key>FirmwareVolume</key>
			<true/>
			<key>HashServices</key>
			<false/>
			<key>OSInfo</key>
			<false/>
			<key>UnicodeCollation</key>
			<false/>
		</dict>
		<key>Quirks</key>
		<dict>
			<key>ActivateHpetSupport</key>
			<false/>
			<key>DisableSecurityPolicy</key>
			<false/>
			<key>EnableVectorAcceleration</key>
			<true/>
			<key>EnableVmx</key>
			<false/>
			<key>ExitBootServicesDelay</key>
			<integer>0</integer>
			<key>ForceOcWriteFlash</key>
			<false/>
			<key>ForgeUefiSupport</key>
			<false/>
			<key>IgnoreInvalidFlexRatio</key>
			<false/>
			<key>ReleaseUsbOwnership</key>
			<false/>
			<key>ReloadOptionRoms</key>
			<false/>
			<key>RequestBootVarRouting</key>
			<true/>
			<key>ResizeGpuBars</key>
			<integer>-1</integer>
			<key>TscSyncTimeout</key>
			<integer>0</integer>
			<key>UnblockFsConnect</key>
			<false/>
		</dict>
		<key>ReservedMemory</key>
		<array>
			<dict>
				<key>Address</key>
				<integer>569344</integer>
				<key>Comment</key>
				<string>Fix black screen on wake from hibernation for Lenovo Thinkpad T490</string>
				<key>Enabled</key>
				<false/>
				<key>Size</key>
				<integer>4096</integer>
				<key>Type</key>
				<string>RuntimeCode</string>
			</dict>
			<dict>
				<key>Address</key>
				<integer>268435456</integer>
				<key>Comment</key>
				<string>HD3000: IGPU memory corruption errata</string>
				<key>Enabled</key>
				<false/>
				<key>Size</key>
				<integer>268435456</integer>
				<key>Type</key>
				<string>Reserved</string>
			</dict>
		</array>
	</dict>
</dict>
```

### 9.0 - Results

#### 9.1 - Working:
- All Device

**Refresh Rate: ProMotion**

What is ProMotion?
<p align="justify">While a standard refresh rate will update a display 60 times a second (60Hz), the ProMotion’s adaptive 120Hz screen works at twice this speed. This results in smoother scrolling, improved responsiveness and better gaming performance.<p/>
<p align="center"><img width="780" alt="Screen Shot 2022-02-26 at 10 56 57 PM" src="https://user-images.githubusercontent.com/72515939/155847708-82cf3e91-382d-49e6-8daa-5c91a2b818a8.png"><p/>

**System Preferences**
<p align="center"><img width="780" alt="Screen Shot 2022-02-26 at 11 00 04 PM" src="https://user-images.githubusercontent.com/72515939/155847817-a54b080b-66c5-48ab-ac3e-35ba4cf13e4f.png"><p/>

**Hardware Acceleration**
<p align="center"><img width="1576" alt="Screen Shot 2022-02-26 at 11 01 05 PM" src="https://user-images.githubusercontent.com/72515939/155848009-6eec0d59-100d-4d0b-87c1-b4454f455c7b.png"><p/>
<p align="center"><img width="697" alt="Screen Shot 2022-02-26 at 11 03 25 PM" src="https://user-images.githubusercontent.com/72515939/155848011-901fea49-870e-479e-89e1-b9320eba4227.png"><p/>
<p align="center"><img width="1436" alt="Screen Shot 2022-02-26 at 11 20 39 PM" src="https://user-images.githubusercontent.com/72515939/155848626-6dc58cb6-82cb-49d7-86bb-cccaa6113694.png"><p/>
<p align="center"><img width="656" alt="Screen Shot 2022-02-26 at 11 20 48 PM" src="https://user-images.githubusercontent.com/72515939/155848627-ea380db3-beea-47a9-a093-6145cdf9028f.png"><p/>
<p align="center"><img width="658" alt="Screen Shot 2022-02-26 at 11 20 45 PM" src="https://user-images.githubusercontent.com/72515939/155848666-c5e0cf30-f3e6-45fd-a6df-606eeb7215e7.png"><p/>

**DGPU Benchmark**
<p align="center"><img width="1088" alt="Screen Shot 2022-02-26 at 11 28 14 PM" src="https://user-images.githubusercontent.com/72515939/155848856-1b1b1314-007a-419a-b0df-edde1afd89ee.png"><p/>
<p align="center"><img width="1088" alt="Screen Shot 2022-02-26 at 11 29 07 PM" src="https://user-images.githubusercontent.com/72515939/155848857-0edf37eb-f942-4ee1-97b8-c5834151b477.png"><p/>
Remark: PowerPlay injection may increase Metal, sometimes decrease OpenGL scores. Benchmarking the CPU and GPU through BigSur/Monterey is not a good idea since both are bloated with M1 Processor code. The best way to check Metal and OpenGL is through Catalina while the OS was Intel optimized.

#### 9.2 - Not Working/Issue:

- No `apst` (`Autonomous Power State Transition`) profile via `ioreg`in `NVMe`. `NVMe` still working fine with `trim` support (without 3rd party app/kext). `NVMeFix.kext` will cause `KP` with `SPCC M.2 NVMe (Phison Chipset)`. Please Refer: [Acidanthera Bugtracker #1752](https://github.com/acidanthera/bugtracker/issues/1752) for more info.

#### 10.0 - BIOS/UEFI Settings

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

I would like to thanks all folks in Hackintosh Community/ [Hackintosh Malaysia](https://www.facebook.com/groups/HackintoshMalaysia/about/)/ [r/Hackintosh](https://www.reddit.com/r/hackintosh/). Without their idea, question and answer, my hack is not possible.

