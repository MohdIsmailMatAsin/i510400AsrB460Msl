/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLyOx21s.aml, Fri May 13 17:08:40 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001A66 (6758)
 *     Revision         0x02
 *     Checksum         0xAF
 *     OEM ID           "Asrock"
 *     OEM Table ID     "B460MSL"
 *     OEM Revision     0x42343630 (1110718000)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Asrock", "B460MSL", 0x42343630)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.ALS0, DeviceObj)
    External (_SB_.PCI0.DRAM, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.HECI, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP.EGP1, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP.EGP1.GFX0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP.EGP1.GFX0.PNLF, DeviceObj)
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
        Name (_STR, Unicode ("Asrock B460M System Bus"))  // _STR: Description String
        Method (_INI, 0, Serialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                STAS = One
            }
        }

        Scope (PR00)
        {
            Name (_STR, Unicode ("HexaCore Intel Core i5-10400, 872 MHz (40 x 22)"))  // _STR: Description String
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
            Name (_STR, Unicode ("Asrock B460M PCI Express Bus"))  // _STR: Description String
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x04)
                {
                    "device_type", 
                    Buffer (0x1D)
                    {
                        "PCI Express Bus"
                    }, 

                    "model", 
                    Buffer (0x1D)
                    {
                        "Asrock B460M PCI Express Bus"
                    }
                })
            }

            Device (ALS0)
            {
                Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
                Name (_CID, "smc-als")  // _CID: Compatible ID
                Name (_STR, Unicode ("Intel Comet Lake Ambient Light Sensor"))  // _STR: Description String
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

            Device (DRAM)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_STR, Unicode ("Intel Comet Lake-S 6C - Host Bridge/DRAM Controller"))  // _STR: Description String
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
                        "Internal", 
                        "device_type", 
                        "Host bridge", 
                        "model", 
                        "Intel Comet Lake-S 6C - Host Bridge/DRAM Controller", 
                        "name", 
                        "DRAM"
                    })
                }
            }

            Scope (GFX0)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Name (_STR, Unicode ("Intel Comet Lake-S GT2 - Integrated Graphics Controller [P0/P1/Q0]"))  // _STR: Description String
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x16)
                    {
                        "AAPL,slot-name", 
                        "Graphics", 
                        "device_type", 
                        "Display controller", 
                        "hda-gfx", 
                        "onboard-1", 
                        "model", 
                        "Intel Graphics UHD 630", 
                        "enable-metal", 
                        One, 
                        "igfxfw", 
                        0x02, 
                        "igfxonln", 
                        One, 
                        "iommu-selection", 
                        Zero, 
                        "rps-control", 
                        One, 
                        "AAPL,ig-platform-id", 
                        Buffer (0x04)
                        {
                             0x03, 0x00, 0x91, 0x3E                           // ...>
                        }, 

                        "device-id", 
                        Buffer (0x04)
                        {
                             0x9B, 0x3E, 0x00, 0x00                           // .>..
                        }
                    })
                }
            }

            Scope (HDAS)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                Name (_STR, Unicode ("Intel Comet Point-V PCH - cAVS (Audio, Voice, Speech)"))  // _STR: Description String
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
                        "Audio", 
                        "device_type", 
                        "Audio device", 
                        "model", 
                        "Intel Comet Point-V PCH - cAVS (Audio, Voice, Speech)", 
                        "name", 
                        "HDEF", 
                        "layout-id", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
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
                Name (_STR, Unicode ("Intel Comet Point-V PCH - CSME: HECI Controller 1"))  // _STR: Description String
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
                        "Internal", 
                        "device_type", 
                        "Communication controller", 
                        "model", 
                        "Intel Comet Point-V PCH - CSME: HECI Controller", 
                        "name", 
                        "IMEI"
                    })
                }
            }

            Scope (LPCB)
            {
                Name (_STR, Unicode ("Intel B460M Chipset - LPC/eSPI Controller"))  // _STR: Description String
                Device (EC)
                {
                    Name (_HID, "PNP0C09" /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_STR, Unicode ("Intel B460M Embedded Controller"))  // _STR: Description String
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x06)
                        {
                            "device_type", 
                            "Embedded controller", 
                            "model", 
                            "Intel B460M Embedded Controller", 
                            "name", 
                            "EC"
                        })
                    }
                }
            }

            Scope (PEG0)
            {
                Scope (PEGP)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (EGP0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("AMD Navi 10 - PCI Express Upstream Switch Port"))  // _STR: Description String
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
                            "Slot- 1", 
                            "device_type", 
                            "PCI bridge", 
                            "model", 
                            "AMD Navi 10 - PCI Express Upstream Switch Port", 
                            "name", 
                            "EGP0"
                        })
                    }

                    Device (EGP1)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (_STR, Unicode ("AMD Navi 10 - PCI Express Downstream Switch Port"))  // _STR: Description String
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
                                "Slot- 1", 
                                "device_type", 
                                "PCI bridge", 
                                "model", 
                                "AMD Navi 10 - PCI Express Downstream Switch Port", 
                                "name", 
                                "EGP1"
                            })
                        }

                        Device (GFX0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Name (_STR, Unicode ("MSI RX 5500 XT (MS-V382) Video Adapter"))  // _STR: Description String
                            Name (_SUN, One)  // _SUN: Slot User Number
                            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
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
                                    "agdpmod", 
                                    Buffer (0x07)
                                    {
                                        "pikera"
                                    }
                                })
                            }

                            Device (PNLF)
                            {
                                Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                                Name (_CID, "backlight")  // _CID: Compatible ID
                                Name (_UID, Zero)  // _UID: Unique ID
                                Name (_STA, Zero)  // _STA: Status
                            }
                        }

                        Device (HDAU)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Name (_STR, Unicode ("AMD Navi 10 - High Definition Audio Controller"))  // _STR: Description String
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

                                Return (Package (0x08)
                                {
                                    "AAPL,slot-name", 
                                    "Slot- 1", 
                                    "device_type", 
                                    "Audio device", 
                                    "model", 
                                    "AMD Navi 10 - High Definition Audio Controller", 
                                    "name", 
                                    "HDAU"
                                })
                            }
                        }
                    }
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
                    Name (_STR, Unicode ("Broadcom BCM4360 802.11ac Wireless Network Adapter"))  // _STR: Description String
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
                            "M2_Wifi", 
                            "device_type", 
                            "Wireless netwok controller", 
                            "model", 
                            "Broadcom BCM4360 802.11ac Wireless Network Adapter", 
                            "name", 
                            "ARPT"
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

                Device (RTLK)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Realtek Gaming 2.5GbE Family Controller"))  // _STR: Description String
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
                            "Internal", 
                            "device_type", 
                            "Ethernet controller", 
                            "model", 
                            "Realtek Gaming 2.5GbE Family Controller", 
                            "name", 
                            "RTLK"
                        })
                    }
                }
            }

            Scope (RP05)
            {
                Scope (PXSX)
                {
                    Name (_STR, Unicode ("VIA USB 3.0 eXtensible Host Controller"))  // _STR: Description String
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
                    Name (_STR, Unicode ("Kingston PCIe 3.0 x4 NVMe 1.3 SSD Controller"))  // _STR: Description String
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
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
                            "M2_1", 
                            "device_type", 
                            "Non-Volatile memory controller", 
                            "model", 
                            "KINGSTON SA2000M8500G", 
                            "name", 
                            "ANS0", 
                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
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

                Device (ANS2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Maxio MAP1001 NVMe SSD Controller"))  // _STR: Description String
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

                        Return (Package (0x0E)
                        {
                            "AAPL,slot-name", 
                            "Slot- 2", 
                            "device_type", 
                            "Non-Volatile memory controller", 
                            "model", 
                            "Maxio MAP1001 NVMe SSD Controllerr", 
                            "name", 
                            "ANS2", 
                            "built-in", 
                            One, 
                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
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

                Device (ANS1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Kingston PCIe 3.0 x4 NVMe 1.3 SSD Controller"))  // _STR: Description String
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
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
                            "M2_2", 
                            "device_type", 
                            "Non-Volatile memory controller", 
                            "model", 
                            "KINGSTON SA2000M8500G", 
                            "name", 
                            "ANS1", 
                            "device-id", 
                            Buffer (0x04)
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
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
                Name (_STR, Unicode ("Intel Comet Point-V PCH - SATA AHCI Controller"))  // _STR: Description String
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
                        "SATA3", 
                        "compatibe", 
                        "pci8086,a352", 
                        "device_type", 
                        "SATA Controller", 
                        "model", 
                        "Intel Comet Point-V PCH - SATA AHCI Controller", 
                        "name", 
                        "SATA", 
                        "IOPCIMSIMode", 
                        One
                    })
                }
            }

            Scope (SBUS)
            {
                Device (BUS0)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_STR, Unicode ("Intel Comet Point-V PCH - SMBus Controller"))  // _STR: Description String
                    Name (_ADR, 0x001F0004)  // _ADR: Address
                    Device (BLCK)
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

            Device (THSS)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                Name (_STR, Unicode ("Intel Comet Point-V PCH - Thermal Controller"))  // _STR: Description String
            }

            Scope (XHC)
            {
                Name (_STR, Unicode ("Intel Comet Point-V PCH - USB 3.2 Gen 1x1 (5 Gb/s) xHCI Host Controller"))  // _STR: Description String
            }
        }

        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_STR, Unicode ("Intel Comet Point-V PCH - USB 3.2 Gen 1x1 xHCI Power Controller"))  // _STR: Description String
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package ()
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
