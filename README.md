# Hackintosh: Intel i5 10400F & Asrock B460 Steel Legend

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
  

```aml
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
| EC  | Fake Embedded Controller (EC) drivers since CML don't have native support |
| DMAC | Actually, this was `MCHC` which compiled with `SBUS`. Known as `SSDT-SBUS-MCHC.aml` and renamed as `DMAC`.  (Rename `MCHC` to `DMAC`) |
| GFX0 | `Dedicated Graphic Processor Unit (DGPU)`.  This `SSDT` contain all `Navi 14` patch information.  Contain: `Framebuffer`: `ATY,Keelback`, `CFG,CFG_USE_AGDC` to overcome wake issue using `DGPU`, `_SUN` information is added to reveal proper `slot number` and added `agdpmod=pikera` in data format `70696B657261`. `boot-args` injection via `NVRAM` is `not required`
| HDAU | `High Defiition Audio` through `HDMI` patch. `_SUN` information is added to reveal proper `slot number` |
| PMCR | Classed as `Memory Controller` and known as `PPMC` in `Comet Lake (CML)` platform. This `SSDT` renamed `PPMC` as `PMCR` with compatible `AppleIntelPCHPMC` support `pci8086,a2a1`, which is identical to `CML` `pci8086,a3a1` |
| TSUB | Nothing fancy, just` Thermal Subsystem` rename which is not identical using `ioreg`. Rename `pci8086,a3b1` to `TSUB` |
| RTLK | Rename `RTL8125 2.5GbE Controller` device as `RP04,PXSX` to `RP04,RTLK` |
| USB0 | Rename PCIe`ASM2142 USB 3.1 Host Controller` device as `RP05,PXSX` to `RP05,USB0` and added `acpi-wake-type` to overcome wake issue using USB device. |
| USB1 | Rename PCIe`Comet Lake PCH-V USB Controller` device as `XHC` to `USB1` and added `acpi-wake-type` to overcome wake issue using USB device. |
| ANS0 | Rename `RP09,PXSX` to `RP09,ANS0` and spoof `NVMe` as `Apple SSD Controller` .`_SUN` information is added to reveal proper `slot number` |
| ANS1 | Rename `RP021,PXSX` to `RP21,ANS1` and spoof `NVMe` as `Apple SSD Controller`. `_SUN` information is added to reveal proper `slot number` |
| ARPT | Rename `RP20,PXSX` to `RP20,ARPT` and adding `_SUN` information to reveal proper `slot number` |
| SATA | Rename SATA to SAT0 with additiopnal information and spoof `400 Series Chipset Family SATA AHCI Controller` to `Intel 11 Series Chipset Controler` |
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
 * Disassembly of iASLaCB7ls.aml, Fri Feb 25 17:53:36 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001502 (5378)
 *     Revision         0x02
 *     Checksum         0x63
 *     OEM ID           "Apple"
 *     OEM Table ID     "ACPI"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
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

                                Return (Package (0x1A)
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

                                    "agdpmod", 
                                    Buffer (0x07)
                                    {
                                         0x70, 0x69, 0x6B, 0x65, 0x72, 0x61               // pikera
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

## 2.0 - Booter

- **MmioWhitelist** | **Patch | Quirks** | **Delete**
  

```aml
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
```

### 3.0 - DeviceProperties

- **Add** | **Delete** |

1. `PciRoot(0x0)/Pci(0x14,0x0)` just a patch are only used for display information related to the `CML PCH-V USB Controller` via `About This Mac/System Report/PCI`). Without this patch, information related to the device is working but not displayed. It's Optional.
  
2. `PciRoot(0x0)/Pci(0x1F,0x3)`is a patch are only used to enable working audio device related to the`Comet Lake PCH-V cAVS` via `About This Mac/System Report/PCI`). This patch is compulsory to allow working audio (`HDEF`). Boot-args `alcid=1` is not require.
  
3. `PciRoot(0x0)/Pci(0x1F,0x4)` just a patch are only used for display information related to the `Comet Lake PCH-V SMBus Host Controllerr` via `About This Mac/System Report/PCI`). Without this patch, information related to the device is working but not displayed. It's Optional.
  

```aml
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
```

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
| SMCRadeonGPU | Based on F`akeSMCs` `RadeonMonitor` to provide `GPU` temperature to a dedicated gadget `without relying` on `FakeSMC` being installed and can therefore be used with `VirtualSMC` instead |
| RadeonSensor | To read the `GPU` temperature. `Lilu` is required. |
| LucyRTL8125Ethernet | `Realtek RTL8125 2.5GBit Ethernet Controllers` driver |
| AGPMInjector | `Apple Graphics Power Management` (AGPM). Only need when selected `SMBIOS` is `not freatured` with certain selected `DGPU`. Patch:`AGPM`/`Machines`/`iMacPro1,1`/`Vendor1002Device7340.`Require [AGPMinjector](https://github.com/Pavo-IM/AGPMInjector) |
| USBMap | Kext to `route` selected `USB ports`. This is `compulsory to handle` `15 port limit` requirements by macOS. Require [USBMap](https://github.com/corpnewt/USBMap) or [USBToolbox](https://github.com/USBToolBox/tool) |
| Moussey | My `modified` kext based from late [FakeAppleWirelessMouse.kext](https://github.com/ArchCryptonIO/Kext-Collection) |

```aml
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

- **BlessOverride** | **Boot | Debug** | **Entries** | **Patch** | **Security** | **Tools**

**Feature:**

1. `PickerMode` Enabled (Require `OpenCanopy.efi`) in `Boot` section
  
2. All `Error` and `Warning` log is disable in `Debug` section
  

```aml
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

### 6.0 - Tools

- Only **CleanNvram.efi** is added. Nothing fancy

```aml
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
  

### 7.0 - NVRAM

- No `boot-args` is require

```aml
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


### 8.0 - PlatformInfo

- `iMacPro1,1` SMBIOS

```aml
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


### 9.0 - UEFI

**APFS** | **AppleInput** | **Audio** | **ConnectedDrivers** | **Drivers** | **Input** | **Output** | **ProtocolOverrides** | **Quirks** | **ReserveMemory**

**9.1 - APFS**

- [x] Catalina require `MinDate -1` & `MinVersion -1`
  
- [x] Big Sur require `MinDate -0`&`MinVersion -0`
  
- [x] Monterey require `MinDate -0`&`MinVersion -0`
  

**9.2 - Drivers**

- [x] HfsPlus.efi - Needed for seeing `HFS` volumes
  
- [x] OpenCanopy.efi - `OpenCore Beauty Treatment` extension
  
- [x] OpenRuntime.efi - Extension for `OpenCore` to help with patching `boot.efi `for `NVRAM` fixes and better `memory management`

```aml
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
  

### 10.0 - BIOS/UEFI Settings

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
