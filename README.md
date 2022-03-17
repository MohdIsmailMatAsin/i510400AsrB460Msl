# Hackintosh: Intel i5 10400 & Asrock B460M Steel Legend

![Last Update](https://img.shields.io/badge/Last_Update_(yy/mm/dd):-22.03.16-blueviolet.svg)

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

- [x] **Catalina** require `Mindate:-1` , `MinVersion:-1` and `SetApfsTimeout:-1`
  
- [x] **BigSur** require `Mindate:0` , `MinVersion:0` and `SetApfsTimeout:-1`
  
- [x] **Monterey** require `Mindate:0` , `MinVersion:0` and `SetApfsTimeout:0`
  

**SMBIOS:**

- [x] `iMac19,2`

**Tree:**

```tree
.
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

###

### 1.1 - SSDT-Mac.aml

```aml
/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLl0hdGJ.aml, Wed Mar 16 19:31:32 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00002093 (8339)
 *     Revision         0x02
 *     Checksum         0x99
 *     OEM ID           "Apple"
 *     OEM Table ID     "Mac"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Apple", "Mac", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.ALS0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.HECI, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.MCHC, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PPMC, DeviceObj)
    External (_SB_.PCI0.RP03, DeviceObj)
    External (_SB_.PCI0.RP03.PXSX, DeviceObj)
    External (_SB_.PCI0.RP03.PXSX._STA, UnknownObj)
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
    External (LHIH, IntObj)
    External (LLOW, IntObj)
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
            Device (ALS0)
            {
                Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
                Name (_CID, "smc-als")  // _CID: Compatible ID
                Method (_ALI, 0, NotSerialized)  // _ALI: Ambient Light Illuminance
                {
                    Return (((LHIH << 0x08) | LLOW))
                }

                Name (_ALR, Package (0x05)  // _ALR: Ambient Light Response
                {
                    Package (0x02)
                    {
                        0x46, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0x49, 
                        0x0A
                    }, 

                    Package (0x02)
                    {
                        0x55, 
                        0x50
                    }, 

                    Package (0x02)
                    {
                        0x64, 
                        0x012C
                    }, 

                    Package (0x02)
                    {
                        0x96, 
                        0x03E8
                    }
                })
            }

            Scope (GFX0)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Name (_STR, Unicode ("Display Controller"))  // _STR: Description String
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x10)
                    {
                        "AAPL,ig-platform-id", 
                        Buffer (0x04)
                        {
                             0x03, 0x00, 0xC5, 0x9B                           // ....
                        }, 

                        "built-in", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "class-code", 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x03, 0x00                           // ....
                        }, 

                        "device-id", 
                        Buffer (0x04)
                        {
                             0x9B, 0x3E, 0x00, 0x00                           // .>..
                        }, 

                        "iommu-selection", 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "subsystem-id", 
                        Buffer (0x04)
                        {
                             0xFF, 0xFF, 0x00, 0x00                           // ....
                        }, 

                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0x6B, 0x10, 0x00, 0x00                           // k...
                        }, 

                        "vendor-id", 
                        Buffer (0x04)
                        {
                             0x86, 0x80, 0x00, 0x00                           // ....
                        }
                    })
                }
            }

            Scope (LPCB)
            {
                Device (EC)
                {
                    Name (_HID, "PNP0C09" /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_STR, Unicode ("Embedded Controller"))  // _STR: Description String
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
                Name (_STR, Unicode ("Audio Endpoint"))  // _STR: Description String
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
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "device_type", 
                        Buffer (0x0D)
                        {
                            "Audio device"
                        }, 

                        "hda-gfx", 
                        Buffer (0x0A)
                        {
                            "onboard-1"
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

            Scope (HECI)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (IMEI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Name (_STR, Unicode ("PCI Simple Communication Controller"))  // _STR: Description String
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
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "device_type", 
                        Buffer (0x19)
                        {
                            "Communication controller"
                        }, 

                        "model", 
                        Buffer (0x21)
                        {
                            "Comet Lake PCH-V HECI Controller"
                        }, 

                        "name", 
                        Buffer (0x05)
                        {
                            "IMEI"
                        }
                    })
                }
            }

            Device (MCHC)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_STR, Unicode ("Bridge"))  // _STR: Description String
                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    If (_OSI ("Darwin"))
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
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "device-id", 
                        Buffer (0x04)
                        {
                             0x53, 0x9B, 0x00, 0x00                           // S...
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
                    Name (_STR, Unicode ("Bridge"))  // _STR: Description String
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
                        Name (_STR, Unicode ("Bridge"))  // _STR: Description String
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

                        Device (GFX0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Name (_STR, Unicode ("Video Controller"))  // _STR: Description String
                            Name (_SUN, Zero)  // _SUN: Slot User Number
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
                                    Buffer (0x04)
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
                                    Buffer (0x0D)
                                    {
                                        /* 0000 */  0x33, 0x30, 0x2E, 0x30, 0x2E, 0x31, 0x30, 0x31,  // 30.0.101
                                        /* 0008 */  0x2E, 0x31, 0x33, 0x34, 0x30                     // .1340
                                    }, 

                                    "ATY,EFIVersionB", 
                                    Buffer (0x16)
                                    {
                                        /* 0000 */  0x30, 0x31, 0x37, 0x2E, 0x30, 0x30, 0x32, 0x2E,  // 017.002.
                                        /* 0008 */  0x30, 0x30, 0x30, 0x2E, 0x30, 0x30, 0x30, 0x2E,  // 000.000.
                                        /* 0010 */  0x30, 0x33, 0x37, 0x36, 0x33, 0x36               // 037636
                                    }, 

                                    "device_type", 
                                    Buffer (One)
                                    {
                                        /* 0000 */  0x41, 0x54, 0x59, 0x2C, 0x4B, 0x65, 0x65, 0x6C,  // ATY,Keel
                                        /* 0008 */  0x62, 0x61, 0x63, 0x6B, 0x50, 0x61, 0x72, 0x65,  // backPare
                                        /* 0010 */  0x6E, 0x74                                       // nt
                                    }, 

                                    "CFG,CFG_USE_AGDC", 
                                    Buffer (One)
                                    {
                                         0x01                                             // .
                                    }, 

                                    "hda-gfx", 
                                    Buffer (0x0A)
                                    {
                                        "onboard-2"
                                    }, 

                                    "name", 
                                    Buffer (0x08)
                                    {
                                        "ATY_GPU"
                                    }, 

                                    "PP_PhmSoftPowerPlayTable", 
                                    Buffer (0x068A)
                                    {
                                        /* 0000 */  0x8A, 0x06, 0x0C, 0x00, 0x01, 0xE2, 0x01, 0x3D,  // .......=
                                        /* 0008 */  0x09, 0x00, 0x00, 0x94, 0x3B, 0x00, 0x00, 0x7D,  // ....;..}
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
                                        /* 00C8 */  0x01, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01,  // ........
                                        /* 00D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 00E0 */  0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0xD0, 0x07,  // ........
                                        /* 00E8 */  0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0x7E, 0x04,  // ......~.
                                        /* 00F0 */  0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0x7E, 0x04,  // ......~.
                                        /* 00F8 */  0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0x7E, 0x04,  // ......~.
                                        /* 0100 */  0x00, 0x00, 0xA2, 0x03, 0x00, 0x00, 0x0A, 0x00,  // ........
                                        /* 0108 */  0x00, 0x00, 0x80, 0x0C, 0x00, 0x00, 0x80, 0x0C,  // ........
                                        /* 0110 */  0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x69, 0x00,  // ..P...i.
                                        /* 0118 */  0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0120 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                                        /* 0128 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x64, 0x00,  // ......d.
                                        /* 0130 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00,  // ..d...d.
                                        /* 0138 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00,  // ..d...d.
                                        /* 0140 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00,  // ..d...d.
                                        /* 0148 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00,  // ..d...d.
                                        /* 0150 */  0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..d.....
                                        /* 0158 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0160 */  0x00, 0x00, 0xF4, 0x01, 0x00, 0x00, 0xF4, 0x01,  // ........
                                        /* 0168 */  0x00, 0x00, 0xF4, 0x01, 0x00, 0x00, 0xBC, 0x02,  // ........
                                        /* 0170 */  0x00, 0x00, 0xF4, 0x01, 0x00, 0x00, 0xBC, 0x02,  // ........
                                        /* 0178 */  0x00, 0x00, 0xF4, 0x01, 0x00, 0x00, 0xBC, 0x02,  // ........
                                        /* 0180 */  0x00, 0x00, 0x71, 0x02, 0x00, 0x00, 0x32, 0x00,  // ..q...2.
                                        /* 0188 */  0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0xE8, 0x03,  // ........
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
                                        /* 01E8 */  0xFF, 0xA7, 0x23, 0x06, 0x00, 0x00, 0x7D, 0x00,  // ..#...}.
                                        /* 01F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 01F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7D, 0x00,  // ......}.
                                        /* 0200 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                        /* 0208 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00,  // ........
                                        /* 0210 */  0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x6E, 0x00,  // ......n.
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
                                        /* 0470 */  0x90, 0x01, 0x90, 0x01, 0x90, 0x01, 0x19, 0x00,  // ........
                                        /* 0478 */  0x60, 0x09, 0xF0, 0x0A, 0x80, 0x0C, 0x50, 0x00,  // `.....P.
                                        /* 0480 */  0xDC, 0x05, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00,  // ........
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
                                        /* 0580 */  0x00, 0x00, 0x19, 0x00, 0x19, 0x00, 0x6F, 0x06,  // ......o.
                                        /* 0588 */  0x00, 0x00, 0xC5, 0x06, 0x00, 0x00, 0x35, 0x07,  // ......5.
                                        /* 0590 */  0x00, 0x00, 0x6F, 0x06, 0x00, 0x00, 0xC5, 0x06,  // ..o.....
                                        /* 0598 */  0x00, 0x00, 0x35, 0x07, 0x00, 0x00, 0x00, 0x00,  // ..5.....
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

                                    "shikigva", 
                                    Buffer (One)
                                    {
                                         0x80                                             // .
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
                            Name (_STR, Unicode ("Audio Endpoint"))  // _STR: Description String
                            Name (_SUN, Zero)  // _SUN: Slot User Number
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
                                    Buffer (0x19)
                                    {
                                        "Slot-0@0,1,0/0,0/0,0/0,1"
                                    }, 

                                    "device_type", 
                                    Buffer (0x1D)
                                    {
                                        "High Definition Audio device"
                                    }, 

                                    "hda-gfx", 
                                    Buffer (0x0A)
                                    {
                                        "onboard-2"
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
                Name (_STR, Unicode ("PCI Memory Controller"))  // _STR: Description String
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
                        Buffer (0x04)
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

            Scope (RP03)
            {
                Scope (PXSX)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (ARPT)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Network Adapters"))  // _STR: Description String
                    Name (_SUN, One)  // _SUN: Slot User Number
                    Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                    {
                        ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 
                        Package (0x01)
                        {
                            Package (0x02)
                            {
                                "StorageD3Enable", 
                                One
                            }
                        }
                    })
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
                            "AAPL,slot-name", 
                            Buffer (0x07)
                            {
                                "Slot-1"
                            }, 

                            "device_type", 
                            Buffer (0x13)
                            {
                                "Network controller"
                            }, 

                            "model", 
                            Buffer (0x11)
                            {
                                "Wireless-AC 9260"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "ARPT"
                            }
                        })
                    }
                }
            }

            Scope (RP04)
            {
                Scope (PXSX)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (RTL0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Network Adapters"))  // _STR: Description String
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
                            Buffer (0x04)
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
                    Name (_STR, Unicode ("Universal Serial Bus Controller"))  // _STR: Description String
                    Name (_SUN, 0x02)  // _SUN: Slot User Number
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
                            Buffer (0x07)
                            {
                                "Slot-2"
                            }, 

                            "acpi-wake-type", 
                            Buffer (One)
                            {
                                 0x01                                             // .
                            }, 

                            "built-in", 
                            Buffer (0x04)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x0F)
                            {
                                "USB controller"
                            }, 

                            "model", 
                            Buffer (0x22)
                            {
                                "VL805/806 xHCI USB 3.0 Controller"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "XHC0"
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
                    Name (_STR, Unicode ("Standard NVM Express Controller"))  // _STR: Description String
                    Name (_SUN, 0x03)  // _SUN: Slot User Number
                    Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                    {
                        ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 
                        Package (0x01)
                        {
                            Package (0x02)
                            {
                                "StorageD3Enable", 
                                One
                            }
                        }
                    })
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
                            Buffer (0x07)
                            {
                                "Slot-3"
                            }, 

                            "built-in", 
                            Buffer (0x04)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x1F)
                            {
                                "Non-Volatile memory controller"
                            }, 

                            "model", 
                            Buffer (0x18)
                            {
                                "Kingston A2000 NVMe SSD"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "ANS0"
                            }, 

                            "vendor-id", 
                            Buffer (0x04)
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

                Device (ANS1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Standard NVM Express Controller"))  // _STR: Description String
                    Name (_SUN, 0x04)  // _SUN: Slot User Number
                    Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                    {
                        ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 
                        Package (0x01)
                        {
                            Package (0x02)
                            {
                                "StorageD3Enable", 
                                One
                            }
                        }
                    })
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
                            Buffer (0x09)
                            {
                                "Slot-4"
                            }, 

                            "built-in", 
                            Buffer (0x04)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x1F)
                            {
                                "Non-Volatile memory controller"
                            }, 

                            "model", 
                            Buffer (0x1B)
                            {
                                "PS5013 E13 NVMe Controller"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "ANS1"
                            }, 

                            "vendor-id", 
                            Buffer (0x04)
                            {
                                 0x4D, 0x14, 0x00, 0x00                           // M...
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

                Device (ANS2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Standard NVM Express Controller"))  // _STR: Description String
                    Name (_SUN, 0x05)  // _SUN: Slot User Number
                    Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                    {
                        ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 
                        Package (0x01)
                        {
                            Package (0x02)
                            {
                                "StorageD3Enable", 
                                One
                            }
                        }
                    })
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
                            Buffer (0x07)
                            {
                                "Slot-5"
                            }, 

                            "built-in", 
                            Buffer (0x04)
                            {
                                 0x01, 0x00, 0x00, 0x00                           // ....
                            }, 

                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "device_type", 
                            Buffer (0x1F)
                            {
                                "Non-Volatile memory controller"
                            }, 

                            "model", 
                            Buffer (0x18)
                            {
                                "Kingston A2000 NVMe SSD"
                            }, 

                            "name", 
                            Buffer (0x05)
                            {
                                "ANS2"
                            }, 

                            "vendor-id", 
                            Buffer (0x04)
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
                Name (_STR, Unicode ("Storage Spaces Controller"))  // _STR: Description String
                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("5025030f-842f-4ab4-a561-99a5189762d0") /* Unknown UUID */, 
                    Package (0x01)
                    {
                        Package (0x02)
                        {
                            "StorageD3Enable", 
                            One
                        }
                    }
                })
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
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "compatible", 
                        Buffer (0x0D)
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
                        Buffer (0x2F)
                        {
                            "400 Series Chipset Family SATA AHCI Controller"
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
                    Name (_STR, Unicode ("Universal Serial Bus Controller"))  // _STR: Description String
                    Name (_ADR, 0x001F0004)  // _ADR: Address
                    Device (BLC0)
                    {
                        Name (_ADR, 0x57)  // _ADR: Address
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

            Device (TSUB)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                Name (_STR, Unicode ("Thermal Subsystem"))  // _STR: Description String
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (_OSI ("Darwin"))
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
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "device_type", 
                        Buffer (0x1D)
                        {
                            "Signal processing controller"
                        }, 

                        "model", 
                        Buffer (0x23)
                        {
                            "Comet Lake PCH-V Thermal Subsystem"
                        }, 

                        "name", 
                        Buffer (0x05)
                        {
                            "TSUB"
                        }
                    })
                }
            }

            Scope (XHC)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (XHC1)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                Name (_STR, Unicode ("Universal Serial Bus Controller"))  // _STR: Description String
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

                        "acpi-wake-type", 
                        Buffer (One)
                        {
                             0x01                                             // .
                        }, 

                        "built-in", 
                        Buffer (0x04)
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
                            "Comet Lake PCH-V USB Controller"
                        }, 

                        "name", 
                        Buffer (0x05)
                        {
                            "XHC1"
                        }
                    })
                }
            }
        }

        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_STR, Unicode ("USB Power Controller"))  // _STR: Description String
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

### 1.2 - Config.plist

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>ACPI</key>
        <dict>
            <key>Add</key>
            <array>
                <dict>
                    <key>Comment</key>
                    <string>SSDT-Mac.aml</string>
                    <key>Enabled</key>
                    <true/>
                    <key>Path</key>
                    <string>SSDT-Mac.aml</string>
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
        <key>Booter</key>
        <dict>
            <key>MmioWhitelist</key>
            <array/>
            <key>Patch</key>
            <array/>
            <key>Quirks</key>
            <dict>
                <key>AllowRelocationBlock</key>
                <false/>
                <key>AvoidRuntimeDefrag</key>
                <true/>
                <key>DevirtualiseMmio</key>
                <true/>
                <key>DisableSingleUser</key>
                <false/>
                <key>DisableVariableWrite</key>
                <false/>
                <key>DiscardHibernateMap</key>
                <false/>
                <key>EnableSafeModeSlide</key>
                <true/>
                <key>EnableWriteUnprotector</key>
                <false/>
                <key>ForceBooterSignature</key>
                <false/>
                <key>ForceExitBootServices</key>
                <false/>
                <key>ProtectMemoryRegions</key>
                <false/>
                <key>ProtectSecureBoot</key>
                <false/>
                <key>ProtectUefiServices</key>
                <true/>
                <key>ProvideCustomSlide</key>
                <true/>
                <key>ProvideMaxSlide</key>
                <integer>0</integer>
                <key>RebuildAppleMemoryMap</key>
                <true/>
                <key>ResizeAppleGpuBars</key>
                <integer>-1</integer>
                <key>SetupVirtualMap</key>
                <false/>
                <key>SignalAppleOS</key>
                <false/>
                <key>SyncRuntimePermissions</key>
                <true/>
            </dict>
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
                <dict/>
                <key>PciRoot(0x0)/Pci(0x16,0x0)</key>
                <dict/>
                <key>PciRoot(0x0)/Pci(0x17,0x0)</key>
                <dict/>
                <key>PciRoot(0x0)/Pci(0x1B,0x0)/Pci(0x0,0x0)</key>
                <dict/>
                <key>PciRoot(0x0)/Pci(0x1B,0x4)/Pci(0x0,0x0)</key>
                <dict/>
                <key>PciRoot(0x0)/Pci(0x1C,0x0)/Pci(0x0,0x0)</key>
                <dict/>
                <key>PciRoot(0x0)/Pci(0x1C,0x3)/Pci(0x0,0x0)</key>
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
                    <key>device_type</key>
                    <string>SMBus</string>
                    <key>model</key>
                    <string>Comet Lake PCH-V SMBus Host Controller</string>
                    <key>name</key>
                    <string>SBUS</string>
                </dict>
                <key>PciRoot(0x0)/Pci(0x2,0x0)</key>
                <dict/>
            </dict>
            <key>Delete</key>
            <dict/>
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
                    <string>V1.6.0 | Lilu.kext</string>
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
                    <string>V1.2.9</string>
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
                    <string>V1.7.0 | AppleALC.kext</string>
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
                    <string>SMCProcessor.kext</string>
                    <key>Comment</key>
                    <string>V1.2.9 | SMCProcessor.kext</string>
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
                    <string>V1.2.9 | SMCSuperIO.kext</string>
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
                    <string>V0.3.1 | SMCRadeonGPU.kext</string>
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
                    <string>V0.3.1 | RadeonSensor.kext</string>
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
                    <string>IntelBluetoothFirmware.kext</string>
                    <key>Comment</key>
                    <string>V2.1.0 | IntelBluetoothFirmware.kext</string>
                    <key>Enabled</key>
                    <true/>
                    <key>ExecutablePath</key>
                    <string>Contents/MacOS/IntelBluetoothFirmware</string>
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
                    <string>V1.1.0d12 | LucyRTL8125Ethernet.kext</string>
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
                    <string>AirportItlwm.kext</string>
                    <key>Comment</key>
                    <string>V2.1.0 | AirportItlwm.kext</string>
                    <key>Enabled</key>
                    <true/>
                    <key>ExecutablePath</key>
                    <string>Contents/MacOS/AirportItlwm</string>
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
                    <string>BlueToolFixup.kext</string>
                    <key>Comment</key>
                    <string>V2.6.1 | BlueToolFixup.kext</string>
                    <key>Enabled</key>
                    <true/>
                    <key>ExecutablePath</key>
                    <string>Contents/MacOS/BlueToolFixup</string>
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
                    <string>V1.1 | USBMap.kext</string>
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
                    <string>WhateverGreen.kext</string>
                    <key>Comment</key>
                    <string>V1.5.8 | WhateverGreen.kext</string>
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
            </array>
            <key>Block</key>
            <array/>
            <key>Emulate</key>
            <dict>
                <key>Cpuid1Data</key>
                <data></data>
                <key>Cpuid1Mask</key>
                <data></data>
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
            <array/>
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
                <true/>
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
                <integer>0</integer>
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
                <key>LogModules</key>
                <string>*</string>
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
                <data></data>
                <key>PasswordSalt</key>
                <data></data>
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
        <key>NVRAM</key>
        <dict>
            <key>Add</key>
            <dict>
                <key>4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14</key>
                <dict>
                    <key>DefaultBackgroundColor</key>
                    <data>AAAAAA==</data>
                    <key>UIScale</key>
                    <data>AQ==</data>
                </dict>
                <key>4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102</key>
                <dict>
                    <key>rtc-blacklist</key>
                    <data></data>
                </dict>
                <key>7C436110-AB2A-4BBB-A880-FE41995C9F82</key>
                <dict>
                    <key>ForceDisplayRotationInEFI</key>
                    <integer>0</integer>
                    <key>SystemAudioVolume</key>
                    <data>Rg==</data>
                    <key>boot-args</key>
                    <string>agdpmod=pikera -igfxfw=2 igfxmetal=1</string>
                    <key>csr-active-config</key>
                    <data>AAAAAA==</data>
                    <key>prev-lang:kbd</key>
                    <data>ZW4tVVM6MA==</data>
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
                <string>XXXXXXXXXXXXXX</string>
                <key>MaxBIOSVersion</key>
                <false/>
                <key>ProcessorType</key>
                <integer>0</integer>
                <key>ROM</key>
                <data>2LvBAZOm</data>
                <key>SpoofVendor</key>
                <true/>
                <key>SystemMemoryStatus</key>
                <string>Auto</string>
                <key>SystemProductName</key>
                <string>iMac19,2</string>
                <key>SystemSerialNumber</key>
                <string>XXXXXXXXXXXXX</string>
                <key>SystemUUID</key>
                <string>XXXXXXXX-XXXX-XXXX-XXXXX-XXXXXXX</string>
            </dict>
            <key>UpdateDataHub</key>
            <true/>
            <key>UpdateNVRAM</key>
            <true/>
            <key>UpdateSMBIOS</key>
            <true/>
            <key>UpdateSMBIOSMode</key>
            <string>Custom</string>
            <key>UseRawUuidEncoding</key>
            <false/>
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
</plist>
```

### 2.0 - Kernel Extension

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
| AirportItlwm | An `Intel Wi-Fi Adapter` Kernel Extension for macOS, based on the OpenBSD Project |
| IntelBluetoothFirmware | `Kext` that uploads `Intel Wireless Bluetooth Firmware` to provide `native Bluetooth` in macOS. The firmware binary files are from the `Linux Open Source Project` |
| BluetoolFixup | Apple `macOS Monterey` has changed parts of the `Bluetooth` stack from `kernel-space` to `user-space`. Note: Required when bluetooth not working properly in macOS 12. |
| USBMap | Kext to `route` selected `USB ports`. This is `compulsory to handle` `15 port limit` requirements by macOS. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool) |

#### 3.0 - BIOS/UEFI Settings

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

I would like to thanks all folks in Hackintosh Community, [Dortania](https://dortania.github.io/OpenCore-Install-Guide/) for great guide, [Acidanthera](https://github.com/acidanthera) for great work, [CorpNewt](https://github.com/corpnewt) for great tools, [Hackintosh Malaysia](https://www.facebook.com/groups/HackintoshMalaysia/about/) for great knowledge sharing/ [r/Hackintosh](https://www.reddit.com/r/hackintosh/) for great undocumented refereces, [daliansky](https://github.com/daliansky) for great ACPI method, [5T33Z0](https://github.com/5T33Z0/OC-Little-Translated) for translating daliansky work. Thanks a lot Community!
