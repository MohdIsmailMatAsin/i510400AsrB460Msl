# i510400FAsrockB460SteelLegend

<p align="center"><img width="698" alt="Screen Shot 2022-02-24 at 8 51 59 PM" src="https://user-images.githubusercontent.com/72515939/155527979-c0f57c37-826d-43e8-9571-3d062dce01de.png"></p>

**Processor:**

- Intel® Core™ `i5-10400F` Processor

<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 12 06 55 AM" src="https://user-images.githubusercontent.com/72515939/155562143-98bd9483-8c34-43f2-95b4-d34e8c4675c7.png"></p>
  
**Motherboard:**

- Asrock `B460M` Steel Legend

![B460M_Steel_Legend-3](https://user-images.githubusercontent.com/72515939/155562844-fcc62df8-68e4-4b36-84f1-ce636bae81ec.png)

**DGPU:**

- MSI Radeon `RX 5500` XT Mech OC 4GB

<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 12 07 00 AM" src="https://user-images.githubusercontent.com/72515939/155562166-62aedf1d-ab2d-48ca-99fa-62974d4e5f1b.png"></p>

**ATY, Framebuffer:** 

- `ATY,Keelback`

<p align="center"><img width="1405" alt="Screen Shot 2022-02-25 at 12 20 55 AM" src="https://user-images.githubusercontent.com/72515939/155564774-a93a1eb4-4ca4-4414-a414-065fd6cf916d.png"></p>

**IGPU:**

- None

**PCIe Card:**

- BCM4360 802.11ac Wireless Network Adapter
- ASM2142 USB 3.0 XHCI Controller (`4` x Companion `USB2.0/3.0 Type A` port, `1` x `USB2.0/3.0 Type C`)

<p align="center"><img width="1527" alt="Screen Shot 2022-02-25 at 12 09 21 AM" src="https://user-images.githubusercontent.com/72515939/155562367-ec366c68-3b3d-4011-a5cb-3bf176c78121.png"></p>
  
**Memory:**

- XLR8 32 GB DDR4 RAM 

<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 12 08 44 AM" src="https://user-images.githubusercontent.com/72515939/155562263-a3f8de51-d1a8-4fc0-b600-90edbe33a220.png"></p>

**Storage:**

- 1 x SPCC M.2 NVMe-Maxio   500GB (Spoof as Apple SSD Controller)
  
- 1 x SPCC M.2 NVMe-Phison  250GB (Spoof as Apple SSD Controller)

<p align="center"><img width="1118" alt="Screen Shot 2022-02-24 at 9 38 31 PM" src="https://user-images.githubusercontent.com/72515939/155534666-3227b229-8797-47c6-bc87-6c54ee869db5.png"></p>

- 1 x SPCC Solid State Disk 500GB (Spoof to use Intel 11 Series Chipset)

- 2 x WDC WD5000AAKX HDD    500GB (Spoof to use Intel 11 Series Chipset)

<p align="center"><img width="1118" alt="Screen Shot 2022-02-24 at 9 36 53 PM" src="https://user-images.githubusercontent.com/72515939/155534612-33239277-dc78-4344-8a88-01101a24799f.png"></p>

**OS Tested:**

- [x] macOS Catalina  (Require MinDate: -1 | MinVersion: -1)
  
- [x] macOS Big Sur   (Require MinDate: 0 | MinVersion: 0)
  
- [x] macOS Monterey  (Require MinDate: 0 | MinVersion: 0)


**Tree:**

```tree
.
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

**Info:**

SSDT-ACPI:

- Modded SSDT: AWAC, PLUG, EC, DMAC (MCHC), GFX0 (ATY,Keelback), HDAU, PMCR (PPMC), TSUB, RTLK, USB0 (PXSX), USB1 (XHC), ANS0 (NVME), ANS1 (NVME), ARPT (WLAN), SATA (SAT0), SBUS, and USBX.
- Added `"CFG,CFG_USE_AGDC"` on `GFX0` to fix wake issues
- Added `"acpi-wake-type"` on both `PXSX (USB0)` and `XHC (USB1)` to fix wake issues

```aml
/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL7sE4LT.aml, Fri Feb 25 00:55:42 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000014FC (5372)
 *     Revision         0x02
 *     Checksum         0x50
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
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.HECI, DeviceObj)
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

                                Return (Package (0x18)
                                {
                                    "AAPL,slot-name", 
                                    Buffer (0x1B)
                                    {
                                        "Internal@0,1,0/0,0/0,0/0,0"
                                    }, 

                                    "@0,ATY,EFIDisplay", 
                                    Buffer (0x04)
                                    {
                                        "DP1"
                                    }, 

                                    "ATY,EFIVersionB", 
                                    Buffer (0x12)
                                    {
                                        /* 0000 */  0x31, 0x31, 0x33, 0x2D, 0x4D, 0x53, 0x49, 0x54,  // 113-MSIT
                                        /* 0008 */  0x56, 0x33, 0x38, 0x32, 0x4D, 0x48, 0x2E, 0x31,  // V382MH.1
                                        /* 0010 */  0x36, 0x31                                       // 61
                                    }, 

                                    "CFG,CFG_USE_AGDC", 
                                    Buffer (One)
                                    {
                                         0x01                                             // .
                                    }, 

                                    "@0,name", 
                                    Buffer (0x0D)
                                    {
                                        "ATY,Keelback"
                                    }, 

                                    "@0,AAPL,boot-display", 
                                    Buffer (0x04)
                                    {
                                         0x01, 0x00, 0x00, 0x00                           // ....
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

                                    "ATY,copyright", 
                                    Buffer (0x31){}, 
                                    "hda-gfx", 
                                    Buffer (0x0A)
                                    {
                                        "onboard-1"
                                    }, 

                                    "name", 
                                    Buffer (0x08)
                                    {
                                        "ATY_GPU"
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
                                "ETH1"
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

                Device (USB0)
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

            Device (USB1)
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

Additional Kext Info: 

- AppleALC.kext   (Boot Arg: `alcid=1` | DeviceProperties: `layout-id`/`Data`/`01000000`) 

<img width="1788" alt="Screen Shot 2022-02-25 at 12 46 14 AM" src="https://user-images.githubusercontent.com/72515939/155569051-5d1e9ebd-6c96-4cf3-bd64-bd8c3cb9309b.png">

- AGPMInjector.kext   (`AGPM`/`Machines`/`iMacPro1,1`/`Vendor1002Device7340`) 

<p align="center"><img width="1118" alt="Screen Shot 2022-02-24 at 9 23 55 PM" src="https://user-images.githubusercontent.com/72515939/155532265-5bbb6159-db1a-4efc-98e4-9dc84b73bd74.png"></p>

- Moussey.kext        (`Apple Wireless Mouse Interface`/`ProductID:100`/`VendorID:7847`)

<p align="center"><img width="780" alt="Screen Shot 2022-02-24 at 9 10 54 PM" src="https://user-images.githubusercontent.com/72515939/155530287-29686499-0bad-4979-87e1-a3d8249b1ccd.png"></p>

- USBMap.kext         (`15 Port` disable motherboard `1` x `USB3.0 Type C`. Remark: `2` x `USB3.0 Type C` via `PCI` available)

<p align="center"><img width="1405" alt="Screen Shot 2022-02-25 at 12 17 02 AM" src="https://user-images.githubusercontent.com/72515939/155563782-82326ee1-e775-45a7-9cba-b8166723fc7d.png"></p>

<p align="center"><img width="1784" alt="Screen Shot 2022-02-25 at 12 14 12 AM" src="https://user-images.githubusercontent.com/72515939/155563332-36464363-c068-4abf-ac72-b4047ac5d37d.png"></p>

<p align="center"><img width="1118" alt="Screen Shot 2022-02-25 at 12 14 25 AM" src="https://user-images.githubusercontent.com/72515939/155563350-1dee3d26-574a-4c6f-8b3c-9dacbe48a33f.png"></p>

- Whatevergreen.kext   (Boot Arg | NVRAM: `agdpmod=pikera`) 

<img width="1788" alt="Screen Shot 2022-02-25 at 12 54 55 AM" src="https://user-images.githubusercontent.com/72515939/155570613-6a2e3ca0-203c-46ac-bdad-0c86c2fcdb9b.png">

**Tools:**

- Editing Plist : [OCAuxilliaryTools](https://github.com/ic005k/OCAuxiliaryTools)
- Editing SSDT  : [Xiasl](https://github.com/ic005k/Xiasl)

**Settings (config.plist):**

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
			<dict>
				<key>AAPL,slot-name</key>
				<string>Internal</string>
				<key>device_type</key>
				<string>Audio device</string>
				<key>hda-gfx</key>
				<string>onboard-1</string>
				<key>layout-id</key>
				<data>
				AQAAAA==
				</data>
				<key>model</key>
				<string>Comet Lake PCH-V cAVS</string>
				<key>name</key>
				<string>HDEF</string>
			</dict>
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
				<string>agdpmod=pikera applbkl=3</string>
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
			<string>XXXXXXXXXXXXXXXXX</string>
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
			<string>XXXXXXXXXXXX</string>
			<key>SystemUUID</key>
			<string>XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX</string>
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

**Working:**

All Device

<p align="center"><img width="1118" alt="Screen Shot 2022-02-24 at 9 28 49 PM" src="https://user-images.githubusercontent.com/72515939/155534249-aadb413e-761e-46cd-86da-44b274df3752.png">

**Non Working:**

NVMeFix.kext not support `SPCC M.2 NVMe` (`Phison Chipset`). Reminder: This kext will cause `Kernel Panic` (KP). Please Refer: Acidanthera [Bugtracker #1752](https://github.com/acidanthera/bugtracker/issues/1752)

**Ioreg:**

```ioreg
+-o Root  <class IORegistryEntry, id 0x100000100, retain 18>
  +-o iMacPro1,1  <class IOPlatformExpertDevice, id 0x100000116, registered, ma$
    +-o AppleACPIPlatformExpert  <class AppleACPIPlatformExpert, id 0x100000117$
    | +-o IOSystemStateNotification  <class IOSystemStateNotification, id 0x100$
    | +-o IOPMrootDomain  <class IOPMrootDomain, id 0x10000011c, registered, ma$
    | | +-o IORootParent  <class IORootParent, id 0x10000011d, !registered, !ma$
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000451, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000453, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000045b, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000045c, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000045d, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000045e, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000461, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000482, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000484, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000485, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000486, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000488, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000489, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000048c, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000048e, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000496, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000599, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000005a5, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000005b3, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000005b9, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000005ba, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000616, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000617, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000632, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000006ad, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000006b7, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000711, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000720, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000722, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000758, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000075b, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000075c, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000762, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000767, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000769, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000076f, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000773, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000774, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000775, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000776, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000784, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000786, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000792, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000793, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000796, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000798, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000799, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000079a, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000079b, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007a7, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007a9, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007aa, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007ab, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007ac, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007b4, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007b5, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007b7, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007b8, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007bd, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007cc, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007cf, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007d0, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007d4, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000007d5, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000872, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000873, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000878, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x10000087c, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000008bc, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000008c0, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000008c1, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000008c3, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000008c4, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000008c9, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x1000008e5, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000957, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000a04, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000a9b, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000c90, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000cfb, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000eb5, $
    | | +-o RootDomainUserClient  <class RootDomainUserClient, id 0x100000ed6, $
    | +-o IOPCIMessagedInterruptController  <class IOPCIMessagedInterruptContro$
    | +-o cpus  <class IOPlatformDevice, id 0x100000139, registered, matched, a$
    | +-o PR00@0  <class IOACPIPlatformDevice, id 0x10000013a, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x100000147, registered, matc$
    | | | +-o AppleACPICPUInterruptController  <class AppleACPICPUInterruptCont$
    | | | +-o X86PlatformPlugin  <class X86PlatformPlugin, id 0x1000004ae, regi$
    | | |   +-o IOPlatformEnabler  <class IOPlatformPluginDevice, id 0x10000056$
    | | |   | +-o ApplePlatformEnabler  <class ApplePlatformEnabler, id 0x10000$
    | | |   +-o AGPMEnabler  <class IOPlatformPluginDevice, id 0x100000568, reg$
    | | |   | +-o AGPMController  <class AGPMController, id 0x10000056b, !regis$
    | | |   +-o X86PlatformShim  <class X86PlatformShim, id 0x10000056a, !regis$
    | | +-o SMCProcessor  <class SMCProcessor, id 0x100000148, !registered, !ma$
    | +-o PR01@2  <class IOACPIPlatformDevice, id 0x10000013b, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x100000149, registered, matc$
    | +-o PR02@4  <class IOACPIPlatformDevice, id 0x10000013c, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x10000014a, registered, matc$
    | +-o PR03@6  <class IOACPIPlatformDevice, id 0x10000013d, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x10000014b, registered, matc$
    | +-o PR04@8  <class IOACPIPlatformDevice, id 0x10000013e, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x10000014c, registered, matc$
    | +-o PR05@A  <class IOACPIPlatformDevice, id 0x10000013f, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x10000014d, registered, matc$
    | +-o PR06@1  <class IOACPIPlatformDevice, id 0x100000140, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x10000014e, registered, matc$
    | +-o PR07@3  <class IOACPIPlatformDevice, id 0x100000141, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x10000014f, registered, matc$
    | +-o PR08@5  <class IOACPIPlatformDevice, id 0x100000142, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x100000150, registered, matc$
    | +-o PR09@7  <class IOACPIPlatformDevice, id 0x100000143, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x100000151, registered, matc$
    | +-o PR10@9  <class IOACPIPlatformDevice, id 0x100000144, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x100000152, registered, matc$
    | +-o PR11@B  <class IOACPIPlatformDevice, id 0x100000145, registered, matc$
    | | +-o AppleACPICPU  <class AppleACPICPU, id 0x100000153, registered, matc$
    | +-o PR12  <class IOACPIPlatformDevice, id 0x100000146, registered, matche$
    | +-o PR13  <class IOACPIPlatformDevice, id 0x100000155, registered, matche$
    | +-o PR14  <class IOACPIPlatformDevice, id 0x100000157, registered, matche$
    | +-o PR15  <class IOACPIPlatformDevice, id 0x100000158, registered, matche$
    | +-o PR16  <class IOACPIPlatformDevice, id 0x100000159, registered, matche$
    | +-o PR17  <class IOACPIPlatformDevice, id 0x10000015a, registered, matche$
    | +-o PR18  <class IOACPIPlatformDevice, id 0x10000015b, registered, matche$
    | +-o PR19  <class IOACPIPlatformDevice, id 0x10000015c, registered, matche$
    | +-o io-apic@fec00000  <class IOACPIPlatformDevice, id 0x10000015d, regist$
    | | +-o AppleAPICInterruptController  <class AppleAPICInterruptController, $
    | +-o AppleACPIEventController  <class AppleACPIEventController, id 0x10000$
    | +-o bios  <class IOPlatformDevice, id 0x100000168, registered, matched, a$
    | | +-o AppleSMBIOS  <class AppleSMBIOS, id 0x100000169, registered, matche$
    | +-o PCI0@0  <class IOACPIPlatformDevice, id 0x10000016e, registered, matc$
    | | +-o AppleACPIPCI  <class AppleACPIPCI, id 0x100000255, registered, matc$
    | |   +-o DMAC@0  <class IOPCIDevice, id 0x100000250, registered, matched, $
    | |   +-o PEG0@1  <class IOPCIDevice, id 0x100000205, registered, matched, $
    | |   | +-o IOPP  <class IOPCI2PCIBridge, id 0x100000267, registered, match$
    | |   |   +-o EGP0@0  <class IOPCIDevice, id 0x100000206, registered, match$
    | |   |     +-o IOPP  <class IOPCI2PCIBridge, id 0x100000287, registered, m$
    | |   |       +-o EGP1@0  <class IOPCIDevice, id 0x100000207, registered, m$
    | |   |         +-o IOPP  <class IOPCI2PCIBridge, id 0x10000028f, registere$
    | |   |           +-o GFX0@0  <class IOPCIDevice, id 0x100000208, registere$
    | |   |           | +-o AMDSupport  <class AMDSupport, id 0x1000004df, regi$
    | |   |           | +-o AMDRadeonX6000_AmdGpuWrangler  <class AMDRadeonX600$
    | |   |           | | +-o AppleGraphicsDeviceControlClient  <class AppleGra$
    | |   |           | +-o AMDRadeonX6000_AMDRadeonHWServicesNavi  <class AMDR$
    | |   |           | | +-o AMDRadeonX6200_AMDRadeonHWLibsX6200  <class AMDRa$
    | |   |           | +-o AMDRadeonX6000_AmdRadeonControllerNavi14  <class AM$
    | |   |           | | +-o ATY,Keelback@0  <class AMDRadeonX6000_AmdRadeonFr$
    | |   |           | | | +-o AppleMCCSControlModule  <class AppleMCCSControl$
    | |   |           | | | | +-o AppleMCCSParameterHandler  <class AppleMCCSPa$
    | |   |           | | | +-o AppleUpstreamUserClientDriver  <class AppleUpst$
    | |   |           | | | +-o AGPM  <class AGPM, id 0x10000056d, registered, $
    | |   |           | | | | +-o AGPMClient  <class AGPMClient, id 0x100000a41$
    | |   |           | | | +-o IOFramebufferI2CInterface  <class IOFramebuffer$
    | |   |           | | | +-o IOFramebufferUserClient  <class IOFramebufferUs$
    | |   |           | | | +-o IOFramebufferSharedUserClient  <class IOFramebu$
    | |   |           | | | +-o display0  <class IODisplayConnect, id 0x1000006$
    | |   |           | | |   +-o AppleDisplay  <class AppleDisplay, id 0x10000$
    | |   |           | | +-o ATY,Keelback@1  <class AMDRadeonX6000_AmdRadeonFr$
    | |   |           | | | +-o AppleMCCSControlModule  <class AppleMCCSControl$
    | |   |           | | | | +-o AppleMCCSParameterHandler  <class AppleMCCSPa$
    | |   |           | | | +-o AppleUpstreamUserClientDriver  <class AppleUpst$
    | |   |           | | | +-o IOFramebufferI2CInterface  <class IOFramebuffer$
    | |   |           | | | +-o IOFramebufferUserClient  <class IOFramebufferUs$
    | |   |           | | +-o ATY,Keelback@2  <class AMDRadeonX6000_AmdRadeonFr$
    | |   |           | | | +-o AppleMCCSControlModule  <class AppleMCCSControl$
    | |   |           | | | | +-o AppleMCCSParameterHandler  <class AppleMCCSPa$
    | |   |           | | | +-o AppleUpstreamUserClientDriver  <class AppleUpst$
    | |   |           | | | +-o IOFramebufferI2CInterface  <class IOFramebuffer$
    | |   |           | | | +-o IOFramebufferUserClient  <class IOFramebufferUs$
    | |   |           | | +-o ATY,Keelback@3  <class AMDRadeonX6000_AmdRadeonFr$
    | |   |           | |   +-o AppleMCCSControlModule  <class AppleMCCSControl$
    | |   |           | |   | +-o AppleMCCSParameterHandler  <class AppleMCCSPa$
    | |   |           | |   +-o AppleUpstreamUserClientDriver  <class AppleUpst$
    | |   |           | |   +-o IOFramebufferI2CInterface  <class IOFramebuffer$
    | |   |           | |   +-o IOFramebufferUserClient  <class IOFramebufferUs$
    | |   |           | +-o AMDRadeonX6000_AMDNavi14GraphicsAccelerator  <class$
    | |   |           | | +-o AMDRadeonX6000_AMDAccel2DContext  <class AMDRadeo$
    | |   |           | | +-o IOAccelDisplayPipeUserClient2  <class IOAccelDisp$
    | |   |           | | +-o AMDRadeonX6000_AMDAccel2DContext  <class AMDRadeo$
    | |   |           | | +-o IOAccelDisplayPipeUserClient2  <class IOAccelDisp$
    | |   |           | | +-o AMDRadeonX6000_AMDAccel2DContext  <class AMDRadeo$
    | |   |           | | +-o IOAccelDisplayPipeUserClient2  <class IOAccelDisp$
    | |   |           | | +-o AMDRadeonX6000_AMDAccel2DContext  <class AMDRadeo$
    | |   |           | | +-o IOAccelDisplayPipeUserClient2  <class IOAccelDisp$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSurface  <class AMDRadeonX$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelDevice  <class AMDRadeonX6$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelSharedUserClient  <class A$
    | |   |           | | +-o AMDRadeonX6000_AMDAccelCommandQueue  <class AMDRa$
    | |   |           | +-o AMDRadeonX6000_AmdAgdcServices  <class AMDRadeonX60$
    | |   |           |   +-o AppleGraphicsDevicePolicy  <class AppleGraphicsDe$
    | |   |           |   | +-o AGDPClientControl  <class AGDPClientControl, id$
    | |   |           |   |   +-o AGDPUserClient  <class AGDPUserClient, id 0x1$
    | |   |           |   |   +-o AGDPUserClient  <class AGDPUserClient, id 0x1$
    | |   |           |   +-o AppleGraphicsDeviceControlClient  <class AppleGra$
    | |   |           |   +-o AppleGraphicsDeviceControlClient  <class AppleGra$
    | |   |           |   +-o AppleGraphicsDeviceControlClient  <class AppleGra$
    | |   |           |   +-o AppleGraphicsDeviceControlClient  <class AppleGra$
    | |   |           |   +-o AppleGraphicsDeviceControlClient  <class AppleGra$
    | |   |           +-o HDAU@0,1  <class IOPCIDevice, id 0x100000209, registe$
    | |   |             +-o AppleGFXHDAEGController@0,1  <class AppleGFXHDAEGCo$
    | |   |               +-o AppleGFXHDADriver@0,1,0  <class AppleGFXHDADriver$
    | |   |                 +-o AppleGFXHDAEngineOutputDP  <class AppleGFXHDAEn$
    | |   |                   +-o AppleGFXHDAStream  <class AppleGFXHDAStream, $
    | |   |                   +-o AppleGFXHDAAudioSelectorControlDP  <class App$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   +-o IOAudioSelectorControl  <class IOAudioSelecto$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |                   +-o AudioAUUCDriver  <class AudioAUUCDriver, id 0$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |                   +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   +-o USB1@14  <class IOPCIDevice, id 0x100000254, registered, matched,$
    | |   | +-o USB1@14000000  <class AppleUSBXHCISPT, id 0x10000026d, register$
    | |   |   +-o HS01@14100000  <class AppleUSB20XHCIPort, id 0x1000002ff, reg$
    | |   |   | +-o USB2.0 Hub@14100000  <class IOUSBHostDevice, id 0x10000039f$
    | |   |   |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacyClient$
    | |   |   |   +-o AppleUSB20Hub@14100000  <class AppleUSB20Hub, id 0x100000$
    | |   |   |   | +-o AppleUSB20HubPort@14110000  <class AppleUSB20HubPort, i$
    | |   |   |   | | +-o BRCM20702 Hub@14110000  <class IOUSBHostDevice, id 0x$
    | |   |   |   | |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacy$
    | |   |   |   | |   +-o AppleUSB20Hub@14110000  <class AppleUSB20Hub, id 0x$
    | |   |   |   | |   | +-o AppleUSB20HubPort@14111000  <class AppleUSB20HubP$
    | |   |   |   | |   | +-o AppleUSB20HubPort@14112000  <class AppleUSB20HubP$
    | |   |   |   | |   | +-o AppleUSB20HubPort@14113000  <class AppleUSB20HubP$
    | |   |   |   | |   |   +-o Bluetooth USB Host Controller@14113000  <class $
    | |   |   |   | |   |     +-o AppleUSBHostLegacyClient  <class AppleUSBHost$
    | |   |   |   | |   |     +-o bluetoothd  <class AppleUSBHostDeviceUserClie$
    | |   |   |   | |   |     +-o IOUSBHostInterface@0  <class IOUSBHostInterfa$
    | |   |   |   | |   |     | +-o bluetoothd  <class AppleUSBHostInterfaceUse$
    | |   |   |   | |   |     +-o IOUSBHostInterface@1  <class IOUSBHostInterfa$
    | |   |   |   | |   |     | +-o bluetoothd  <class AppleUSBHostInterfaceUse$
    | |   |   |   | |   |     +-o IOUSBHostInterface@2  <class IOUSBHostInterfa$
    | |   |   |   | |   |     +-o IOUSBHostInterface@3  <class IOUSBHostInterfa$
    | |   |   |   | |   +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id$
    | |   |   |   | +-o AppleUSB20HubPort@14120000  <class AppleUSB20HubPort, i$
    | |   |   |   | +-o AppleUSB20HubPort@14130000  <class AppleUSB20HubPort, i$
    | |   |   |   | +-o AppleUSB20HubPort@14140000  <class AppleUSB20HubPort, i$
    | |   |   |   +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id 0x100$
    | |   |   +-o HS02@14200000  <class AppleUSB20XHCIPort, id 0x100000300, reg$
    | |   |   | +-o USB2.0 Hub@14200000  <class IOUSBHostDevice, id 0x100000373$
    | |   |   |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacyClient$
    | |   |   |   +-o AppleUSB20Hub@14200000  <class AppleUSB20Hub, id 0x100000$
    | |   |   |   | +-o AppleUSB20HubPort@14210000  <class AppleUSB20HubPort, i$
    | |   |   |   | +-o AppleUSB20HubPort@14220000  <class AppleUSB20HubPort, i$
    | |   |   |   | +-o AppleUSB20HubPort@14230000  <class AppleUSB20HubPort, i$
    | |   |   |   | | +-o HD Web Camera@14230000  <class IOUSBHostDevice, id 0x$
    | |   |   |   | |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacy$
    | |   |   |   | |   +-o AppleUSBHostCompositeDevice  <class AppleUSBHostCom$
    | |   |   |   | |   +-o HD Web Camera@0  <class IOUSBHostInterface, id 0x10$
    | |   |   |   | |   | +-o UVCAssistant@14230000  <class AppleUSBHostFramewo$
    | |   |   |   | |   +-o IOUSBHostInterface@1  <class IOUSBHostInterface, id$
    | |   |   |   | |   | +-o UVCAssistant@14230000  <class AppleUSBHostFramewo$
    | |   |   |   | |   +-o HD Web Camera@2  <class IOUSBHostInterface, id 0x10$
    | |   |   |   | |   | +-o AppleUSBAudioDevice  <class AppleUSBAudioDevice, $
    | |   |   |   | |   |   +-o AppleUSBAudioEngine  <class AppleUSBAudioEngine$
    | |   |   |   | |   |     +-o AppleUSBAudioStream  <class AppleUSBAudioStre$
    | |   |   |   | |   |     +-o IOAudioLevelControl  <class IOAudioLevelContr$
    | |   |   |   | |   |     | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |   |   | |   |     +-o IOAudioToggleControl  <class IOAudioToggleCon$
    | |   |   |   | |   |     | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |   |   | |   |     +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |   |   | |   +-o IOUSBHostInterface@3  <class IOUSBHostInterface, id$
    | |   |   |   | |     +-o AppleUSBAudioStream  <class AppleUSBAudioStream, $
    | |   |   |   | +-o AppleUSB20HubPort@14240000  <class AppleUSB20HubPort, i$
    | |   |   |   |   +-o USB Audio CODEC @14240000  <class IOUSBHostDevice, id$
    | |   |   |   |     +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacy$
    | |   |   |   |     +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id$
    | |   |   |   |     | +-o AppleUSBAudioDevice  <class AppleUSBAudioDevice, $
    | |   |   |   |     |   +-o AppleUSBAudioEngine  <class AppleUSBAudioEngine$
    | |   |   |   |     |   | +-o AppleUSBAudioStream  <class AppleUSBAudioStre$
    | |   |   |   |     |   | +-o IOAudioLevelControl  <class IOAudioLevelContr$
    | |   |   |   |     |   | | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |   |   |     |   | +-o IOAudioLevelControl  <class IOAudioLevelContr$
    | |   |   |   |     |   | | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |   |   |     |   | +-o IOAudioToggleControl  <class IOAudioToggleCon$
    | |   |   |   |     |   | | +-o IOAudioControlUserClient  <class IOAudioCon$
    | |   |   |   |     |   | +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |   |   |     |   +-o AppleUSBAudioEngine  <class AppleUSBAudioEngine$
    | |   |   |   |     |     +-o AppleUSBAudioStream  <class AppleUSBAudioStre$
    | |   |   |   |     |     +-o IOAudioEngineUserClient  <class IOAudioEngine$
    | |   |   |   |     +-o IOUSBHostInterface@1  <class IOUSBHostInterface, id$
    | |   |   |   |     | +-o AppleUSBAudioStream  <class AppleUSBAudioStream, $
    | |   |   |   |     +-o IOUSBHostInterface@2  <class IOUSBHostInterface, id$
    | |   |   |   |     | +-o AppleUSBAudioStream  <class AppleUSBAudioStream, $
    | |   |   |   |     +-o IOUSBHostInterface@3  <class IOUSBHostInterface, id$
    | |   |   |   |     | +-o AppleUserUSBHostHIDDevice  <class AppleUserHIDDev$
    | |   |   |   |     |   +-o IOHIDInterface  <class IOHIDInterface, id 0x100$
    | |   |   |   |     |     +-o AppleUserHIDEventDriver  <class AppleUserHIDE$
    | |   |   |   |     |       +-o IOHIDEventServiceUserClient  <class IOHIDEv$
    | |   |   |   |     +-o AppleUSBHostCompositeDevice  <class AppleUSBHostCom$
    | |   |   |   +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id 0x100$
    | |   |   +-o HS03@14300000  <class AppleUSB20XHCIPort, id 0x100000301, reg$
    | |   |   | +-o Keystation Mini 32 MK3@14300000  <class IOUSBHostDevice, id$
    | |   |   |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacyClient$
    | |   |   |   +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id 0x100$
    | |   |   |   +-o IOUSBHostInterface@1  <class IOUSBHostInterface, id 0x100$
    | |   |   |   +-o AppleUSBHostCompositeDevice  <class AppleUSBHostComposite$
    | |   |   +-o HS04@14400000  <class AppleUSB20XHCIPort, id 0x100000302, reg$
    | |   |   +-o HS05@14500000  <class AppleUSB20XHCIPort, id 0x100000303, reg$
    | |   |   +-o HS06@14600000  <class AppleUSB20XHCIPort, id 0x100000304, reg$
    | |   |   +-o HS07@14700000  <class AppleUSB20XHCIPort, id 0x100000305, reg$
    | |   |   +-o HS08@14800000  <class AppleUSB20XHCIPort, id 0x100000306, reg$
    | |   |   | +-o USB Keyboard@14800000  <class IOUSBHostDevice, id 0x1000003$
    | |   |   |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacyClient$
    | |   |   |   +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id 0x100$
    | |   |   |   | +-o AppleUserUSBHostHIDDevice  <class AppleUserHIDDevice, i$
    | |   |   |   |   +-o IOHIDInterface  <class IOHIDInterface, id 0x100000525$
    | |   |   |   |     +-o AppleHIDKeyboardEventDriver  <class AppleHIDKeyboar$
    | |   |   |   |       +-o IOHIDEventServiceUserClient  <class IOHIDEventSer$
    | |   |   |   +-o IOUSBHostInterface@1  <class IOUSBHostInterface, id 0x100$
    | |   |   |   | +-o AppleUserUSBHostHIDDevice  <class AppleUserHIDDevice, i$
    | |   |   |   |   +-o IOHIDInterface  <class IOHIDInterface, id 0x100000541$
    | |   |   |   |     +-o AppleUserHIDEventDriver  <class AppleUserHIDEventSe$
    | |   |   |   |       +-o IOHIDEventServiceUserClient  <class IOHIDEventSer$
    | |   |   |   +-o AppleUSBHostCompositeDevice  <class AppleUSBHostComposite$
    | |   |   +-o HS09@14900000  <class AppleUSB20XHCIPort, id 0x100000307, reg$
    | |   |   | +-o 2.4G Mouse@14900000  <class IOUSBHostDevice, id 0x1000003b4$
    | |   |   |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacyClient$
    | |   |   |   +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id 0x100$
    | |   |   |   | +-o AppleUserUSBHostHIDDevice  <class AppleUserHIDDevice, i$
    | |   |   |   |   +-o IOHIDInterface  <class IOHIDInterface, id 0x100000539$
    | |   |   |   |     +-o IOHIDEventDriver  <class IOHIDEventDriver, id 0x100$
    | |   |   |   |       +-o IOHIDEventServiceUserClient  <class IOHIDEventSer$
    | |   |   |   +-o AppleUSBHostCompositeDevice  <class AppleUSBHostComposite$
    | |   |   +-o SS01@14a00000  <class AppleUSB30XHCIPort, id 0x100000308, reg$
    | |   |   | +-o USB3.0 Hub@14a00000  <class IOUSBHostDevice, id 0x10000035d$
    | |   |   |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacyClient$
    | |   |   |   +-o AppleUSB30GLHub@14a00000  <class AppleUSB30GLHub, id 0x10$
    | |   |   |   | +-o AppleUSB30HubPort@14a10000  <class AppleUSB30HubPort, i$
    | |   |   |   | +-o AppleUSB30HubPort@14a20000  <class AppleUSB30HubPort, i$
    | |   |   |   | +-o AppleUSB30HubPort@14a30000  <class AppleUSB30HubPort, i$
    | |   |   |   | +-o AppleUSB30HubPort@14a40000  <class AppleUSB30HubPort, i$
    | |   |   |   +-o GenesysLogic@0  <class IOUSBHostInterface, id 0x100000369$
    | |   |   +-o SS02@14b00000  <class AppleUSB30XHCIPort, id 0x100000309, reg$
    | |   |   +-o SS03@14c00000  <class AppleUSB30XHCIPort, id 0x10000030a, reg$
    | |   |   +-o SS04@14d00000  <class AppleUSB30XHCIPort, id 0x10000030b, reg$
    | |   |   +-o SS05@14e00000  <class AppleUSB30XHCIPort, id 0x10000030c, reg$
    | |   |   +-o SS06@14f00000  <class AppleUSB30XHCIPort, id 0x10000030d, reg$
    | |   +-o TSUB@14,2  <class IOPCIDevice, id 0x100000252, registered, matche$
    | |   +-o IMEI@16  <class IOPCIDevice, id 0x10000024f, registered, matched,$
    | |   +-o SATA@17  <class IOPCIDevice, id 0x100000253, registered, matched,$
    | |   | +-o AppleIntelPchSeriesAHCI  <class AppleIntelPchSeriesAHCI, id 0x1$
    | |   |   +-o PRT0@0  <class AppleIntelPchSeriesAHCIPort, id 0x1000002a0, r$
    | |   |   +-o PRT1@1  <class AppleIntelPchSeriesAHCIPort, id 0x100000417, r$
    | |   |   +-o PRT2@2  <class AppleIntelPchSeriesAHCIPort, id 0x100000419, r$
    | |   |   | +-o IOAHCIDevice@0  <class IOAHCIDevice, id 0x10000041b, regist$
    | |   |   |   +-o AppleAHCIDiskDriver  <class AppleAHCIDiskDriver, id 0x100$
    | |   |   |     +-o IOAHCIBlockStorageDevice  <class IOAHCIBlockStorageDevi$
    | |   |   |       +-o IOBlockStorageDriver  <class IOBlockStorageDriver, id$
    | |   |   |         +-o WDC WD5000AAKX-00ERMA0 Media  <class IOMedia, id 0x$
    | |   |   |           +-o IOMediaBSDClient  <class IOMediaBSDClient, id 0x1$
    | |   |   |           +-o IOFDiskPartitionScheme  <class IOFDiskPartitionSc$
    | |   |   |             +-o Untitled 1@1  <class IOMedia, id 0x10000043b, r$
    | |   |   |               +-o IOMediaBSDClient  <class IOMediaBSDClient, id$
    | |   |   +-o PRT3@3  <class AppleIntelPchSeriesAHCIPort, id 0x10000041c, r$
    | |   |   | +-o IOAHCIDevice@0  <class IOAHCIDevice, id 0x10000041e, regist$
    | |   |   |   +-o AppleAHCIDiskDriver  <class AppleAHCIDiskDriver, id 0x100$
    | |   |   |     +-o IOAHCIBlockStorageDevice  <class IOAHCIBlockStorageDevi$
    | |   |   |       +-o IOBlockStorageDriver  <class IOBlockStorageDriver, id$
    | |   |   |         +-o SPCC Solid State Disk Media  <class IOMedia, id 0x1$
    | |   |   |           +-o IOMediaBSDClient  <class IOMediaBSDClient, id 0x1$
    | |   |   |           +-o IOFDiskPartitionScheme  <class IOFDiskPartitionSc$
    | |   |   |             +-o Untitled 1@1  <class IOMedia, id 0x100000435, r$
    | |   |   |               +-o IOMediaBSDClient  <class IOMediaBSDClient, id$
    | |   |   +-o PRT4@4  <class AppleIntelPchSeriesAHCIPort, id 0x10000041f, r$
    | |   |   +-o PRT5@5  <class AppleIntelPchSeriesAHCIPort, id 0x10000043e, r$
    | |   |     +-o IOAHCIDevice@0  <class IOAHCIDevice, id 0x100000440, regist$
    | |   |       +-o AppleAHCIDiskDriver  <class AppleAHCIDiskDriver, id 0x100$
    | |   |         +-o IOAHCIBlockStorageDevice  <class IOAHCIBlockStorageDevi$
    | |   |           +-o IOBlockStorageDriver  <class IOBlockStorageDriver, id$
    | |   |             +-o WDC WD5000AAKX-001CA0 Media  <class IOMedia, id 0x1$
    | |   |               +-o IOMediaBSDClient  <class IOMediaBSDClient, id 0x1$
    | |   |               +-o IOFDiskPartitionScheme  <class IOFDiskPartitionSc$
    | |   |                 +-o Untitled 1@1  <class IOMedia, id 0x10000044d, r$
    | |   |                   +-o IOMediaBSDClient  <class IOMediaBSDClient, id$
    | |   +-o RP20@1B  <class IOPCIDevice, id 0x100000235, registered, matched,$
    | |   | +-o IOPP  <class IOPCI2PCIBridge, id 0x100000275, registered, match$
    | |   |   +-o ARPT@0  <class IOPCIDevice, id 0x100000236, registered, match$
    | |   |     +-o AirPort_BrcmNIC  <class AirPort_BrcmNIC, id 0x10000028e, re$
    | |   |       +-o CCLogPipe  <class CCLogPipe, id 0x1000002de, registered, $
    | |   |       | +-o CCIOReporterLogStream  <class CCIOReporterLogStream, id$
    | |   |       +-o CCLogPipe  <class CCLogPipe, id 0x1000002ee, registered, $
    | |   |       | +-o CCLogStream  <class CCLogStream, id 0x1000002ef, regist$
    | |   |       | +-o CCLogStream  <class CCLogStream, id 0x1000002f0, regist$
    | |   |       +-o CCDataPipe  <class CCDataPipe, id 0x1000002f1, registered$
    | |   |       | +-o CCDataStream  <class CCDataStream, id 0x1000002f2, regi$
    | |   |       |   +-o CCFaultReporter  <class CCFaultReporter, id 0x1000002$
    | |   |       +-o CCLogPipe  <class CCLogPipe, id 0x10000033b, registered, $
    | |   |       | +-o CCLogStream  <class CCLogStream, id 0x10000033c, regist$
    | |   |       +-o CCDataPipe  <class CCDataPipe, id 0x10000033d, registered$
    | |   |       | +-o CCDataStream  <class CCDataStream, id 0x10000033e, regi$
    | |   |       +-o en1  <class AirPort_BrcmNIC_Interface, id 0x10000033f, re$
    | |   |       | +-o IONetworkStack  <class IONetworkStack, id 0x1000002d5, $
    | |   |       |   +-o IONetworkStackUserClient  <class IONetworkStackUserCl$
    | |   |       +-o CCDataPipe  <class CCDataPipe, id 0x100000464, registered$
    | |   |       | +-o CCIOReporterDataStream  <class CCIOReporterDataStream, $
    | |   |       +-o AirPort_BrcmNIC_P2PInterface  <class AirPort_BrcmNIC_P2PI$
    | |   |       +-o CCLogPipe  <class CCLogPipe, id 0x1000005a8, registered, $
    | |   |       | +-o CCLogStream  <class CCLogStream, id 0x1000005a9, regist$
    | |   |       +-o AirPort_BrcmNIC_P2PInterface  <class AirPort_BrcmNIC_P2PI$
    | |   |       +-o AirPort_Brcm43xxLLSkywalkInterface  <class AirPort_Brcm43$
    | |   |         +-o IOSkywalkNetworkBSDClient  <class IOSkywalkNetworkBSDCl$
    | |   +-o RP21@1B,4  <class IOPCIDevice, id 0x100000237, registered, matche$
    | |   | +-o IOPP  <class IOPCI2PCIBridge, id 0x100000279, registered, match$
    | |   |   +-o ANS1@0  <class IOPCIDevice, id 0x100000238, registered, match$
    | |   |     +-o IONVMeController  <class IONVMeController, id 0x10000029a, $
    | |   |       +-o IONVMeBlockStorageDevice@1  <class IONVMeBlockStorageDevi$
    | |   |         +-o IOBlockStorageDriver  <class IOBlockStorageDriver, id 0$
    | |   |           +-o SPCC M.2 PCIe SSD Media  <class IOMedia, id 0x1000002$
    | |   |             +-o IOMediaBSDClient  <class IOMediaBSDClient, id 0x100$
    | |   |             +-o IOGUIDPartitionScheme  <class IOGUIDPartitionScheme$
    | |   |               +-o EFI System Partition@1  <class IOMedia, id 0x1000$
    | |   |               | +-o IOMediaBSDClient  <class IOMediaBSDClient, id 0$
    | |   |               +-o Untitled 2@2  <class IOMedia, id 0x1000002e1, reg$
    | |   |                 +-o IOMediaBSDClient  <class IOMediaBSDClient, id 0$
    | |   |                 +-o AppleAPFSContainerScheme  <class AppleAPFSConta$
    | |   |                   +-o AppleAPFSMedia  <class AppleAPFSMedia, id 0x1$
    | |   |                     +-o AppleAPFSMediaBSDClient  <class AppleAPFSMe$
    | |   |                     +-o AppleAPFSContainer  <class AppleAPFSContain$
    | |   |                       +-o macOS - Data@1  <class AppleAPFSVolume, i$
    | |   |                       | +-o AppleAPFSVolumeBSDClient  <class AppleA$
    | |   |                       +-o Preboot@2  <class AppleAPFSVolume, id 0x1$
    | |   |                       | +-o AppleAPFSVolumeBSDClient  <class AppleA$
    | |   |                       +-o Recovery@3  <class AppleAPFSVolume, id 0x$
    | |   |                       | +-o AppleAPFSVolumeBSDClient  <class AppleA$
    | |   |                       +-o VM@4  <class AppleAPFSVolume, id 0x100000$
    | |   |                       | +-o AppleAPFSVolumeBSDClient  <class AppleA$
    | |   |                       +-o macOS@5  <class AppleAPFSVolume, id 0x100$
    | |   |                       | +-o AppleAPFSVolumeBSDClient  <class AppleA$
    | |   |                       | +-o com.apple.os.update-9D831579E656FF2E36B$
    | |   |                       |   +-o IOMediaBSDClient  <class IOMediaBSDCl$
    | |   |                       +-o Update@6  <class AppleAPFSVolume, id 0x10$
    | |   |                         +-o AppleAPFSVolumeBSDClient  <class AppleA$
    | |   +-o RP04@1C  <class IOPCIDevice, id 0x100000215, registered, matched,$
    | |   | +-o IOPP  <class IOPCI2PCIBridge, id 0x100000273, registered, match$
    | |   |   +-o RTLK@0  <class IOPCIDevice, id 0x100000216, registered, match$
    | |   |     +-o LucyRTL8125  <class LucyRTL8125, id 0x100000290, !registere$
    | |   |       +-o en0  <class IOEthernetInterface, id 0x10000039d, register$
    | |   |         +-o IONetworkStack  <class IONetworkStack, id 0x1000002d5, $
    | |   |           +-o IONetworkStackUserClient  <class IONetworkStackUserCl$
    | |   +-o RP05@1C,4  <class IOPCIDevice, id 0x100000217, registered, matche$
    | |   | +-o IOPP  <class IOPCI2PCIBridge, id 0x100000283, registered, match$
    | |   |   +-o USB0@0  <class IOPCIDevice, id 0x100000218, registered, match$
    | |   |     +-o USB0@00000000  <class AppleASMediaUSBXHCI, id 0x100000293, $
    | |   |       +-o SS01@00100000  <class AppleUSB30XHCIPort, id 0x100000333,$
    | |   |       +-o SS02@00200000  <class AppleUSB30XHCIPort, id 0x100000334,$
    | |   |       | +-o USB3.1 Hub             @00200000  <class IOUSBHostDevic$
    | |   |       |   +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacyCl$
    | |   |       |   +-o AppleUSB30Hub@00200000  <class AppleUSB30Hub, id 0x10$
    | |   |       |   | +-o AppleUSB30HubPort@00210000  <class AppleUSB30HubPor$
    | |   |       |   | +-o AppleUSB30HubPort@00220000  <class AppleUSB30HubPor$
    | |   |       |   | +-o AppleUSB30HubPort@00230000  <class AppleUSB30HubPor$
    | |   |       |   | +-o AppleUSB30HubPort@00240000  <class AppleUSB30HubPor$
    | |   |       |   +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id 0$
    | |   |       +-o HS01@00300000  <class AppleUSB20XHCIPort, id 0x100000335,$
    | |   |       +-o HS02@00400000  <class AppleUSB20XHCIPort, id 0x100000336,$
    | |   |         +-o USB2.0 Hub             @00400000  <class IOUSBHostDevic$
    | |   |           +-o AppleUSBHostLegacyClient  <class AppleUSBHostLegacyCl$
    | |   |           +-o AppleUSB20Hub@00400000  <class AppleUSB20Hub, id 0x10$
    | |   |           | +-o AppleUSB20HubPort@00410000  <class AppleUSB20HubPor$
    | |   |           | +-o AppleUSB20HubPort@00420000  <class AppleUSB20HubPor$
    | |   |           | +-o AppleUSB20HubPort@00430000  <class AppleUSB20HubPor$
    | |   |           | +-o AppleUSB20HubPort@00440000  <class AppleUSB20HubPor$
    | |   |           +-o IOUSBHostInterface@0  <class IOUSBHostInterface, id 0$
    | |   +-o RP09@1D  <class IOPCIDevice, id 0x10000021f, registered, matched,$
    | |   | +-o IOPP  <class IOPCI2PCIBridge, id 0x10000027e, registered, match$
    | |   |   +-o ANS0@0  <class IOPCIDevice, id 0x100000220, registered, match$
    | |   |     +-o IONVMeController  <class IONVMeController, id 0x100000298, $
    | |   |       +-o IONVMeBlockStorageDevice@1  <class IONVMeBlockStorageDevi$
    | |   |         +-o IOBlockStorageDriver  <class IOBlockStorageDriver, id 0$
    | |   |           +-o SPCC M.2 PCIe SSD Media  <class IOMedia, id 0x1000002$
    | |   |             +-o IOMediaBSDClient  <class IOMediaBSDClient, id 0x100$
    | |   |             +-o IOFDiskPartitionScheme  <class IOFDiskPartitionSche$
    | |   |               +-o Untitled 1@1  <class IOMedia, id 0x1000002df, reg$
    | |   |                 +-o IOMediaBSDClient  <class IOMediaBSDClient, id 0$
    | |   +-o LPCB@1F  <class IOPCIDevice, id 0x10000020e, registered, matched,$
    | |   | +-o SMCSuperIO  <class SMCSuperIO, id 0x100000282, !registered, !ma$
    | |   +-o PMCR@1F,2  <class IOPCIDevice, id 0x100000251, registered, matche$
    | |   | +-o AppleIntelPCHPMC  <class AppleIntelPCHPMC, id 0x1000004b3, regi$
    | |   +-o HDEF@1F,3  <class IOPCIDevice, id 0x100000244, registered, matche$
    | |   | +-o AppleHDAController@1F,3  <class AppleHDAController, id 0x100000$
    | |   |   +-o IOHDACodecDevice@1F,3,0  <class IOHDACodecDevice, id 0x100000$
    | |   |     +-o IOHDACodecDriver  <class IOHDACodecDriver, id 0x1000004fa, $
    | |   |       +-o IOHDACodecFunction@1F,3,0,1  <class IOHDACodecFunction, i$
    | |   |         +-o AppleHDACodecGeneric  <class AppleHDACodecGeneric, id 0$
    | |   |           +-o AppleHDADriver  <class AppleHDADriver, id 0x100000517$
    | |   |             +-o AppleHDAEngineInput@1F,3,0,1,0  <class AppleHDAEngi$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |             | +-o IOAudioSelectorControl  <class IOAudioSelectorCon$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             +-o AppleHDAEngineInput@1F,3,0,1,1  <class AppleHDAEngi$
    | |   |             | +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |             | +-o IOAudioSelectorControl  <class IOAudioSelectorCon$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             +-o AppleHDAEngineOutput@1F,3,0,1,2  <class AppleHDAEng$
    | |   |             | +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |             | +-o IOAudioSelectorControl  <class IOAudioSelectorCon$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o AudioAUUCDriver  <class AudioAUUCDriver, id 0x100$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             +-o AppleHDAEngineOutput@1F,3,0,1,3  <class AppleHDAEng$
    | |   |             | +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |             | +-o IOAudioSelectorControl  <class IOAudioSelectorCon$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o AudioAUUCDriver  <class AudioAUUCDriver, id 0x100$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             +-o AppleHDAEngineOutput@1F,3,0,1,4  <class AppleHDAEng$
    | |   |             | +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |             | +-o IOAudioSelectorControl  <class IOAudioSelectorCon$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioLevelControl  <class IOAudioLevelControl, $
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |             | | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |             | +-o AudioAUUCDriver  <class AudioAUUCDriver, id 0x100$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             | +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |             +-o AppleHDAEngineOutput@1F,3,0,1,5  <class AppleHDAEng$
    | |   |               +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |               +-o IOAudioToggleControl  <class IOAudioToggleControl$
    | |   |               | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |               +-o AppleHDAStream  <class AppleHDAStream, id 0x10000$
    | |   |               +-o IOAudioSelectorControl  <class IOAudioSelectorCon$
    | |   |               | +-o IOAudioControlUserClient  <class IOAudioControl$
    | |   |               +-o AudioAUUCDriver  <class AudioAUUCDriver, id 0x100$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   |               +-o IOAudioEngineUserClient  <class IOAudioEngineUser$
    | |   +-o SBUS@1F,4  <class IOPCIDevice, id 0x10000023f, registered, matche$
    | |     +-o AppleSMBusPCI  <class AppleSMBusPCI, id 0x1000004de, registered$
    | |       +-o BUS0@1f0004  <class IOACPIPlatformDevice, id 0x1000001c9, reg$
    | |         +-o AppleSMBusControllerICH  <class AppleSMBusControllerICH, id$
    | |           +-o BLC0  <class AppleSMBusDevice, id 0x10000050d, registered$
    | +-o SRRE  <class IOACPIPlatformDevice, id 0x10000016f, registered, matche$
    | +-o SIO1  <class IOACPIPlatformDevice, id 0x10000018d, registered, matche$
    | +-o HPET  <class IOACPIPlatformDevice, id 0x10000018e, registered, matche$
    | | +-o AppleHPET  <class AppleHPET, id 0x100000256, !registered, !matched,$
    | +-o IPIC  <class IOACPIPlatformDevice, id 0x10000018f, registered, matche$
    | +-o MATH  <class IOACPIPlatformDevice, id 0x100000190, registered, matche$
    | +-o LDRC  <class IOACPIPlatformDevice, id 0x100000191, registered, matche$
    | +-o RTC  <class IOACPIPlatformDevice, id 0x100000192, registered, matched$
    | | +-o AppleRTC  <class AppleRTC, id 0x10000025c, registered, matched, act$
    | |   +-o AppleRTCUserClient  <class AppleRTCUserClient, id 0x1000002a1, !r$
    | |   +-o AppleRTCUserClient  <class AppleRTCUserClient, id 0x1000002a2, !r$
    | +-o TIMR  <class IOACPIPlatformDevice, id 0x100000193, registered, matche$
    | +-o CWDT  <class IOACPIPlatformDevice, id 0x100000194, registered, matche$
    | +-o EC  <class IOACPIPlatformDevice, id 0x100000195, registered, matched,$
    | +-o PRRE  <class IOACPIPlatformDevice, id 0x1000001c6, registered, matche$
    | +-o IOTR  <class IOACPIPlatformDevice, id 0x1000001c7, registered, matche$
    | +-o GPI0  <class IOACPIPlatformDevice, id 0x1000001ce, registered, matche$
    | +-o UCMX  <class IOACPIPlatformDevice, id 0x1000001d3, registered, matche$
    | +-o PDRC  <class IOACPIPlatformDevice, id 0x1000001db, registered, matche$
    | +-o URSC  <class IOACPIPlatformDevice, id 0x1000001e1, registered, matche$
    | +-o WMTF  <class IOACPIPlatformDevice, id 0x1000001e2, registered, matche$
    | +-o EPC  <class IOACPIPlatformDevice, id 0x1000001e3, registered, matched$
    | +-o SLPB  <class IOACPIPlatformDevice, id 0x1000001e4, registered, matche$
    | | +-o AppleACPIButton  <class AppleACPIButton, id 0x10000025a, registered$
    | |   +-o IOHIDEventServiceUserClient  <class IOHIDEventServiceUserClient, $
    | +-o WFDE  <class IOACPIPlatformDevice, id 0x1000001e5, registered, matche$
    | +-o WFTE  <class IOACPIPlatformDevice, id 0x1000001e6, registered, matche$
    | +-o PWRB  <class IOACPIPlatformDevice, id 0x1000001ef, registered, matche$
    | | +-o AppleACPIButton  <class AppleACPIButton, id 0x10000025d, registered$
    | |   +-o IOHIDEventServiceUserClient  <class IOHIDEventServiceUserClient, $
    | +-o TPM  <class IOACPIPlatformDevice, id 0x1000001f0, registered, matched$
    | +-o SMC  <class VirtualSMC, id 0x100000258, registered, matched, active, $
    | | +-o AppleSMC  <class AppleSMC, id 0x1000002b3, registered, matched, act$
    | |   +-o SMCWatchDogTimer  <class SMCWatchDogTimer, id 0x1000002b5, regist$
    | |   | +-o IOWatchdogUserClient  <class IOWatchdogUserClient, id 0x1000004$
    | |   +-o KextAudit  <class KextAudit, id 0x1000002b6, registered, matched,$
    | |   | +-o KextAuditUserClient  <class KextAuditUserClient, id 0x100000487$
    | |   +-o AppleSMCClient  <class AppleSMCClient, id 0x10000070b, !registere$
    | |   +-o AppleSMCClient  <class AppleSMCClient, id 0x100000710, !registere$
    | +-o AppleEFIRuntime  <class AppleEFIRuntime, id 0x100000259, registered, $
    |   +-o AppleEFINVRAM  <class AppleEFINVRAM, id 0x1000002a7, registered, ma$
    +-o IOResources  <class IOResources, id 0x100000119, registered, matched, a$
    | +-o AppleCredentialManager  <class AppleCredentialManager, id 0x10000011f$
    | | +-o AppleCredentialManagerUserClient  <class AppleCredentialManagerUser$
    | | +-o AppleCredentialManagerUserClient  <class AppleCredentialManagerUser$
    | | +-o AppleCredentialManagerUserClient  <class AppleCredentialManagerUser$
    | +-o AppleFDEKeyStore  <class AppleFDEKeyStore, id 0x100000120, registered$
    | +-o AppleKeyStore  <class AppleKeyStore, id 0x100000121, registered, matc$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | | +-o AppleKeyStoreUserClient  <class AppleKeyStoreUserClient, id 0x10000$
    | +-o AppleSSE  <class AppleSSE, id 0x100000122, registered, matched, activ$
    | +-o CoreAnalyticsHub  <class CoreAnalyticsHub, id 0x100000123, registered$
    | | +-o CoreAnalyticsUserClient  <class CoreAnalyticsUserClient, id 0x10000$
    | +-o Dont_Steal_Mac_OS_X  <class Dont_Steal_Mac_OS_X, id 0x100000124, !reg$
    | +-o EndpointSecurityDriver  <class EndpointSecurityDriver, id 0x100000125$
    | | +-o EndpointSecurityDriverClient  <class EndpointSecurityDriverClient, $
    | +-o IOBluetoothHCIController  <class IOBluetoothHCIController, id 0x10000$
    | | +-o IOBluetoothACPIMethods  <class IOBluetoothACPIMethods, id 0x1000001$
    | | +-o IOBluetoothHCIUserClient  <class IOBluetoothHCIUserClient, id 0x100$
    | | +-o IOBluetoothDevice  <class IOBluetoothDevice, id 0x10000079c, regist$
    | |   +-o IOUserBluetoothSerialDriver  <class IOUserService, id 0x10000079d$
    | |     +-o IOUserBluetoothSerialClient  <class IOUserUserClient, id 0x1000$
    | |     +-o IOUserPseudoSerial  <class IOUserSerial, id 0x1000007a1, regist$
    | |       +-o IOSerialBSDClient  <class IOSerialBSDClient, id 0x1000007a2, $
    | |       +-o IOUserPseudoSerialUserClient  <class IOUserUserClient, id 0x1$
    | +-o IOHDIXController  <class IOHDIXController, id 0x100000127, registered$
    | +-o IOKitRegistryCompatibility  <class IOKitRegistryCompatibility, id 0x1$
    | | +-o display  <class IOServiceCompatibility, id 0x100000133, registered,$
    | | | +-o IOFB  <class IOServiceCompatibility, id 0x100000134, registered, $
    | | | +-o IOAccelerator  <class IOServiceCompatibility, id 0x100000135, reg$
    | | +-o memory  <class IOServiceCompatibility, id 0x100000136, registered, $
    | +-o IOReportHub  <class IOReportHub, id 0x100000129, registered, matched,$
    | | +-o IOReportUserClient  <class IOReportUserClient, id 0x10000070a, !reg$
    | | +-o IOReportUserClient  <class IOReportUserClient, id 0x100000721, !reg$
    | | +-o IOReportUserClient  <class IOReportUserClient, id 0x100000738, !reg$
    | +-o IOTimeSyncClockManager  <class IOTimeSyncClockManager, id 0x10000012a$
    | | +-o IOTimeSyncTranslationMach  <class IOTimeSyncTranslationMach, id 0x1$
    | | | +-o IOTimeSyncUserClient  <class IOTimeSyncUserClient, id 0x100000494$
    | | +-o IOTimeSyncClockManagerUserClient  <class IOTimeSyncClockManagerUser$
    | +-o IOUSBMassStorageResource  <class IOUSBMassStorageResource, id 0x10000$
    | +-o AppleALC  <class AppleALC, id 0x10000012c, !registered, !matched, act$
    | +-o WhateverGreen  <class WhateverGreen, id 0x10000012d, !registered, !ma$
    | +-o AppleUSBHostResources  <class AppleUSBHostResources, id 0x1000002a4, $
    | | +-o AppleUSBLegacyRoot  <class AppleUSBLegacyRoot, id 0x1000002b9, regi$
    | |   +-o AppleUSBXHCI@00000000  <class AppleUSBController, id 0x100000343,$
    | |   | +-o AppleUSBXHCI Root Hub Simulation@00000000  <class AppleUSBRootH$
    | |   | +-o USB3.1 Hub             @00200000  <class AppleUSBDevice, id 0x1$
    | |   | | +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x10000034e$
    | |   | +-o USB2.0 Hub             @00400000  <class AppleUSBDevice, id 0x1$
    | |   |   +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x100000395$
    | |   +-o AppleUSBXHCI@14000000  <class AppleUSBController, id 0x100000351,$
    | |     +-o AppleUSBXHCI Root Hub Simulation@14000000  <class AppleUSBRootH$
    | |     +-o Keystation Mini 32 MK3@14300000  <class AppleUSBDevice, id 0x10$
    | |     | +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x10000035c$
    | |     | +-o AppleUSBInterface@1  <class AppleUSBInterface, id 0x10000035f$
    | |     +-o USB3.0 Hub@14a00000  <class AppleUSBDevice, id 0x100000360, reg$
    | |     | +-o GenesysLogic@0  <class AppleUSBInterface, id 0x10000036a, !re$
    | |     +-o USB2.0 Hub@14200000  <class AppleUSBDevice, id 0x100000379, reg$
    | |     | +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x100000380$
    | |     +-o USB2.0 Hub@14100000  <class AppleUSBDevice, id 0x1000003a1, reg$
    | |     | +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x1000003a7$
    | |     +-o 2.4G Mouse@14900000  <class AppleUSBDevice, id 0x1000003b6, reg$
    | |     | +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x1000003bd$
    | |     +-o USB Keyboard@14800000  <class AppleUSBDevice, id 0x1000003c0, r$
    | |     | +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x1000003c8$
    | |     | +-o AppleUSBInterface@1  <class AppleUSBInterface, id 0x1000003c9$
    | |     +-o HD Web Camera@14230000  <class AppleUSBDevice, id 0x1000003cd, $
    | |     | +-o HD Web Camera@0  <class AppleUSBInterface, id 0x1000003d7, re$
    | |     | +-o AppleUSBInterface@1  <class AppleUSBInterface, id 0x1000003d8$
    | |     | +-o HD Web Camera@2  <class AppleUSBInterface, id 0x1000003d9, re$
    | |     | +-o AppleUSBInterface@3  <class AppleUSBInterface, id 0x1000003da$
    | |     +-o USB Audio CODEC @14240000  <class AppleUSBDevice, id 0x1000003d$
    | |     | +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x1000003e7$
    | |     | +-o AppleUSBInterface@1  <class AppleUSBInterface, id 0x1000003e8$
    | |     | +-o AppleUSBInterface@2  <class AppleUSBInterface, id 0x1000003e9$
    | |     | +-o AppleUSBInterface@3  <class AppleUSBInterface, id 0x1000003ea$
    | |     +-o BRCM20702 Hub@14110000  <class AppleUSBDevice, id 0x1000003ed, $
    | |     | +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x1000003f4$
    | |     +-o Bluetooth USB Host Controller@14113000  <class AppleUSBDevice, $
    | |       +-o AppleUSBInterface@0  <class AppleUSBInterface, id 0x100000590$
    | |       +-o AppleUSBInterface@1  <class AppleUSBInterface, id 0x100000592$
    | |       +-o AppleUSBInterface@2  <class AppleUSBInterface, id 0x100000593$
    | |       +-o AppleUSBInterface@3  <class AppleUSBInterface, id 0x100000594$
    | +-o RadeonSensor  <class RadeonSensor, id 0x1000002b8, registered, matche$
    | | +-o RadeonSensorUserClient  <class RadeonSensorUserClient, id 0x1000007$
    | +-o com_apple_AppleFSCompression_AppleFSCompressionTypeDataless  <class c$
    | +-o com_apple_AppleFSCompression_AppleFSCompressionTypeZlib  <class com_a$
    | +-o AppleImage4  <class AppleImage4, id 0x1000002cd, registered, matched,$
    | +-o AppleMobileFileIntegrity  <class AppleMobileFileIntegrity, id 0x10000$
    | +-o AppleSystemPolicy  <class AppleSystemPolicy, id 0x1000002cf, register$
    | | +-o AppleSystemPolicyUserClient  <class AppleSystemPolicyUserClient, id$
    | +-o com_apple_BootCache  <class com_apple_BootCache, id 0x1000002d0, !reg$
    | +-o com_apple_filesystems_hfs  <class com_apple_filesystems_hfs, id 0x100$
    | +-o com_apple_filesystems_hfs_encodings  <class com_apple_filesystems_hfs$
    | +-o IOHIDResource  <class IOHIDResource, id 0x1000002d3, registered, matc$
    | +-o IOHIDSystem  <class IOHIDSystem, id 0x1000002d4, registered, matched,$
    | | +-o IOHIDUserClient  <class IOHIDUserClient, id 0x100000576, !registere$
    | | +-o IOHIDEventSystemUserClient  <class IOHIDEventSystemUserClient, id 0$
    | | +-o IOHIDParamUserClient  <class IOHIDParamUserClient, id 0x100000602, $
    | | +-o IOHIDParamUserClient  <class IOHIDParamUserClient, id 0x100000618, $
    | | +-o IOHIDParamUserClient  <class IOHIDParamUserClient, id 0x10000073a, $
    | | +-o IOHIDParamUserClient  <class IOHIDParamUserClient, id 0x100000760, $
    | | +-o IOHIDParamUserClient  <class IOHIDParamUserClient, id 0x100000a3b, $
    | +-o IONetworkStack  <class IONetworkStack, id 0x1000002d5, registered, ma$
    | | +-o IONetworkStackUserClient  <class IONetworkStackUserClient, id 0x100$
    | +-o IOSurfaceRoot  <class IOSurfaceRoot, id 0x1000002d6, registered, matc$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | | +-o IOSurfaceRootUserClient  <class IOSurfaceRootUserClient, id 0x10000$
    | +-o com_apple_filesystems_lifs  <class com_apple_filesystems_lifs, id 0x1$
    | +-o AppleBSDKextStarterTMPFS  <class AppleBSDKextStarter, id 0x1000002d8,$
    | +-o Lilu  <class Lilu, id 0x1000002d9, !registered, !matched, active, bus$
    | +-o AppleSCSISubsystemGlobals  <class AppleSCSISubsystemGlobals, id 0x100$
    | +-o AppleIntelSlowAdaptiveClockingManager  <class AppleIntelSlowAdaptiveC$
    | +-o AppleGPUWrangler  <class AppleGPUWrangler, id 0x1000004b6, registered$
    | | +-o AppleGraphicsDeviceControlPlugin  <class AppleGraphicsDeviceControl$
    | | | +-o AGDCPluginDisplayMetrics  <class AGDCPluginDisplayMetrics, id 0x1$
    | | +-o AppleGPUWranglerClient  <class AppleGPUWranglerClient, id 0x1000004$
    | | +-o AppleGPUWranglerClient  <class AppleGPUWranglerClient, id 0x1000005$
    | | +-o AppleGPUWranglerClient  <class AppleGPUWranglerClient, id 0x1000006$
    | | +-o AppleGPUWranglerClient  <class AppleGPUWranglerClient, id 0x1000007$
    | +-o AppleDiskImagesController  <class AppleDiskImagesController, id 0x100$
    | +-o AppleHV  <class AppleHV, id 0x1000004b9, registered, matched, active,$
    | +-o AppleIPAppender  <class AppleIPAppender, id 0x1000004ba, registered, $
    | +-o BroadcomBluetooth20703USBTransport  <class BroadcomBluetooth20703USBT$
    | +-o BroadcomBluetoothHostControllerUSBTransport  <class BroadcomBluetooth$
    | +-o CSRBluetoothHostControllerUSBTransport  <class CSRBluetoothHostContro$
    | +-o IOAVBNub  <class IOAVBNub, id 0x1000004bf, registered, matched, activ$
    | +-o IOBluetoothHostControllerPCIeTransport  <class IOBluetoothHostControl$
    | +-o IOBluetoothHostControllerTransport  <class IOBluetoothHostControllerT$
    | +-o IOBluetoothHostControllerUARTTransport  <class IOBluetoothHostControl$
    | +-o IOBluetoothHostControllerUSBTransport  <class IOBluetoothHostControll$
    | +-o IOBluetoothPacketLogger  <class IOBluetoothPacketLogger, id 0x1000004$
    | +-o IOBluetoothSerialManager  <class IOBluetoothSerialManager, id 0x10000$
    | +-o IODisplayWrangler  <class IODisplayWrangler, id 0x1000004c6, register$
    | | +-o IOGDiagnosticGTraceClient  <class IOGDiagnosticGTraceClient, id 0x1$
    | | +-o IOAccelerationUserClient  <class IOAccelerationUserClient, id 0x100$
    | +-o AppleUSBUserHCIResources  <class AppleUSBUserHCIResources, id 0x10000$
    | +-o IOUserEthernetResource  <class IOUserEthernetResource, id 0x1000004c8$
    | +-o com_apple_driver_pmtelemetry  <class com_apple_driver_pmtelemetry, id$
    | +-o AMDRadeonServiceManager  <class AMDRadeonServiceManager, id 0x1000005$
    +-o IOUserResources  <class IOUserResources, id 0x10000011a, registered, ma$
    +-o AppleIntelMCEInterruptController  <class AppleIntelMCEInterruptControll$
    +-o AppleIntelMCEInterruptNub  <class AppleIntelMCEInterruptNub, id 0x10000$
    | +-o AppleIntelMCEReporter  <class AppleIntelMCEReporter, id 0x1000004b1, $
    +-o IOUserServer(com.apple.driverkit.AppleUserHIDDrivers-0x1000004da)  <cla$
    +-o IOUserServer(com.apple.IOUserBluetoothSerialDriver-0x10000079d)  <class$
```  
										 
**Support Coverage:**										 
										 
<p align="center"><img width="1276" alt="Screen Shot 2022-02-25 at 12 42 24 AM" src="https://user-images.githubusercontent.com/72515939/155568519-5f373cff-862f-458c-92b1-b86afac436a8.png"><p/>
	
**My Layout:**	
										 
![Screen Shot 2022-02-24 at 10 02 52 PM](https://user-images.githubusercontent.com/72515939/155539110-a79c2426-16c3-4182-acda-886adfe92230.jpg)

**BIOS/UEFI Settings:**

- Disable CSM/ Enable UEFI
- Disable Secure Boot
- Set SATA as AHCI (Do not installation macOS through Rapid Storage Technology)
- Disable CFG Lock
- Disable Intel Virtualization Technology
- Disable VT-D
- Enable XHCI Hand-off
- Disable Legacy USB Support (If Needed)

Copyright 	: MohdIsmailMatAsin

Date		: 24 Feb 2022
