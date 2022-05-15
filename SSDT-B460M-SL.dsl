/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of D:/Storage/Tools/Windows/OpenCore/OC_v0.8.0-Mod/EFI/OC/ACPI/SSDT-B460MASL.aml, Mon May 16 00:17:26 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001D14 (7444)
 *     Revision         0x02
 *     Checksum         0x73
 *     OEM ID           "Asrock"
 *     OEM Table ID     "B460MSL"
 *     OEM Revision     0x42343630 (1110718000)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20210930 (539035952)
 */
DefinitionBlock ("", "SSDT", 2, "Asrock", "B460MSL", 0x00000000)
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
                        Return (Buffer ()
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package ()
                    {
                        "plugin-type", 
                        One
                    })
                }
            }
        }

        Scope (PCI0)
        {
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer ()
                    {
                         0x03                                             // .
                    })
                }

                Return (Package ()
                {
                    "device_type", 
                    Buffer (0x1D)
                    {
                        "PCIe Bus"
                    }, 

                    "model", 
                    Buffer ()
                    {
                        "Asrock B460M Steel Legend PCIe Bus"
                    }
                })
            }

            Device (ALS0)
            {
                Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
                Name (_CID, "smc-als")  // _CID: Compatible ID
                Method (_ALI, 0, NotSerialized)  // _ALI: Ambient Light Illuminance
                {
                    Return (((LHIH << 0x08) | LLOW))
                }

                Name (_ALR, Package ()  // _ALR: Ambient Light Response
                {
                    Package ()
                    {
                        0x46, 
                        Zero
                    }, 

                    Package ()
                    {
                        0x49, 
                        0x0A
                    }, 

                    Package ()
                    {
                        0x55, 
                        0x50
                    }, 

                    Package ()
                    {
                        0x64, 
                        0x012C
                    }, 

                    Package ()
                    {
                        0x96, 
                        0x03E8
                    }
                })
            }

            Device (DRAM)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer ()
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package ()
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
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer ()
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package ()
                    {
                        "AAPL,slot-name", 
                        "Display", 
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
                        Buffer ()
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
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer ()
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package ()
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
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer ()
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package ()
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
                Device (EC)
                {
                    Name (_HID, "PNP0C09" /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
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

            Scope (PEG0)
            {
				Scope (PEGP)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (EGP0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer ()
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package ()
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
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            If ((Arg2 == Zero))
                            {
                                Return (Buffer ()
                                {
                                     0x03                                             // .
                                })
                            }

                            Return (Package ()
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
                            Name (_SUN, One)  // _SUN: Slot User Number
                            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer ()
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package ()
                                {
                                    "agdpmod", 
                                    "pikera", 
                                    "@0,name", 
                                    "ATY,Keelback", 
                                    "@1,name", 
                                    "ATY,Keelback", 
                                    "@2,name", 
                                    "ATY,Keelback", 
                                    "@3,name", 
                                    "ATY,Keelback", 
                                    "AAPL,slot-name", 
                                    "Slot- 1", 
                                    "device_type", 
                                    "VGA compatible controller", 
                                    "hda-gfx", 
                                    "onboard-2", 
                                    "@0,AAPL,boot-display", 
                                    Buffer (0x04)
                                    {
                                         0x01, 0x00, 0x00, 0x00                           // ....
                                    }, 

                                    "@0,ATY,EFIDisplay", 
                                    Buffer (0x04)
                                    {
                                        "DP1"
                                    }, 

                                    "AAPL00,DualLink", 
                                    Buffer (0x04)
                                    {
                                         0x01, 0x00, 0x00, 0x00                           // ....
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

                                    "ATY,EFIEnabledMode", 
                                    One, 
                                    "CFG,CFG_USE_AGDC", 
                                    Zero
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
                            Name (_SUN, One)  // _SUN: Slot User Number
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer ()
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package ()
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
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer ()
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package ()
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
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer ()
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package ()
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
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (XHC1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer ()
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package ()
                        {
                            "AAPL,slot-name", 
                            "Slot- 3", 
                            "device_type", 
                            "USB controller", 
                            "model", 
                            "VIA USB 3.0 eXtensible Host Controller", 
                            "name", 
                            "XHC1", 
                            "acpi-wake-type", 
                            One
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
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
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
                            "AAPL,slot-name", 
                            "M2_1", 
                            "device_type", 
                            "Non-Volatile memory controller", 
                            "model", 
                            "KINGSTON SA2000M8500G", 
                            "name", 
                            "ANS0", 
                            "device-id", 
                            Buffer ()
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "vendor-id", 
                            Buffer ()
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
                    Name (_SUN, 0x02)  // _SUN: Slot User Number
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer ()
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package ()
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
                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer ()
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package ()
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
                            Buffer ()
                            {
                                 0x06, 0xA8, 0x00, 0x00                           // ....
                            }, 

                            "vendor-id", 
                            Buffer ()
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
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer ()
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package ()
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
                    Name (_ADR, 0x001F0004)  // _ADR: Address
                    Device (DVL0)
                    {
                        Name (_ADR, 0x57)  // _ADR: Address
                        Name (_CID, "diagsvault")  // _CID: Compatible ID
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            If (!Arg2)
                            {
                                Return (Buffer ()
                                {
                                     0x03                                             // .
                                })
                            }

                            Return (Package ()
                            {
                                "address", 
                                Zero
                            })
                        }
                    }
                }
            }

            Device (THSS)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
            }

            Scope (XHC)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (XHC0)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer ()
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package ()
                    {
                        "AAPL,slot-name", 
                        "USB", 
                        "device_type", 
                        "USB controller", 
                        "model", 
                        "Intel Comet Point-V PCH - USB 3.2 Gen 1x1 (5 Gb/s) xHCI Host Controller", 
                        "name", 
                        "XHC0", 
                        "acpi-wake-type", 
                        One
                    })
                }
            }
        }

        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
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
