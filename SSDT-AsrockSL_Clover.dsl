/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/mohdismailmatasin/Desktop/SSDT-AsrockSL.aml, Wed Apr  6 23:20:38 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00001F07 (7943)
 *     Revision         0x02
 *     Checksum         0x1F
 *     OEM ID           "Hack"
 *     OEM Table ID     "AsrockSL"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Hack", "AsrockSL", 0x00000000)
{
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.ALS0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.HDAS, DeviceObj)
    External (_SB_.PCI0.HECI, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.ARTC, DeviceObj)
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
            Name (_STR, Unicode ("Processor"))  // _STR: Description String
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

                    Return (Package (0x0E)
                    {
                        "AAPL,ig-platform-id", 
                        Buffer (0x04)
                        {
                             0x03, 0x00, 0xC8, 0x9B                           // ....
                        }, 

                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
                        }, 

                        "device-id", 
                        Buffer (0x04)
                        {
                             0x9B, 0x3E, 0x00, 0x00                           // .>..
                        }, 

                        "enable-metal", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "igfxfw", 
                        Buffer (0x04)
                        {
                             0x02, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "igfxonln", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                           // ....
                        }, 

                        "iommu-selection", 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x00                           // ....
                        }
                    })
                }
            }

            Scope (LPCB)
            {
                Name (_STR, Unicode ("Low Pin Count BUS"))  // _STR: Description String
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

                    Return (Package (0x08)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
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

                    Return (Package (0x08)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
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
                                    Buffer (0x08)
                                    {
                                        "Slot- 1"
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
                                    Buffer (0x08)
                                    {
                                        "Slot- 1"
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
                                    Buffer (0x1D)
                                    {
                                        "Radeon RX 5500 XT HDMI Audio"
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

                    Return (Package (0x0C)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
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
                        Buffer (0x3D)
                        {
                            "Comet Lake PCH Power Management Controller/Memory Controller"
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
                            Buffer (0x06)
                            {
                                "M2- 3"
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

                        Return (Package (0x08)
                        {
                            "AAPL,slot-name", 
                            Buffer (0x09)
                            {
                                "Ethernet"
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
                            Buffer (0x08)
                            {
                                "Slot- 3"
                            }, 

                            "acpi-wake-type", 
                            Buffer (One)
                            {
                                 0x01                                             // .
                            }, 

                            "device_type", 
                            Buffer (0x0F)
                            {
                                "USB controller"
                            }, 

                            "model", 
                            Buffer (0x2B)
                            {
                                "ASMedia USB 3.1 eXtensible Host Controller"
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
                            Buffer (0x06)
                            {
                                "M2- 1"
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

                Device (ANS2)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Standard NVM Express Controller"))  // _STR: Description String
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
                            Buffer (0x08)
                            {
                                "Slot- 2"
                            }, 

                            "built-in", 
                            Buffer (0x08)
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
                            Buffer (0x1F)
                            {
                                "Silicon Power MAP1001 NVMe SSD"
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

            Scope (RP21)
            {
                Scope (PXSX)
                {
                    Name (_STA, Zero)  // _STA: Status
                }

                Device (ANS1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_STR, Unicode ("Standard NVM Express Controller"))  // _STR: Description String
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
                            Buffer (0x06)
                            {
                                "M2- 2"
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

            Scope (SAT0)
            {
                Name (_STA, Zero)  // _STA: Status
            }

            Device (SATA)
            {
                Name (_ADR, 0x00170000)  // _ADR: Address
                Name (_STR, Unicode ("Storage Spaces Controller"))  // _STR: Description String
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

                    Return (Package (0x08)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Internal"
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

                    Return (Package (0x0A)
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

                        "device_type", 
                        Buffer (0x0F)
                        {
                            "USB controller"
                        }, 

                        "model", 
                        Buffer (0x2A)
                        {
                            "Intel USB 3.0 eXtensible Host Controller "
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

