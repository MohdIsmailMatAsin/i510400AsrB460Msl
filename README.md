<img width="698" alt="Screen Shot 2022-02-24 at 8 51 59 PM" src="https://user-images.githubusercontent.com/72515939/155527979-c0f57c37-826d-43e8-9571-3d062dce01de.png">

**Processor:**

- Intel® Core™ `i5-10400F` Processor
  
**Motherboard:**

- Asrock `B460` Steel Legend

**DGPU:**

- MSI Radeon `RX 5500` XT Mech OC 4GB

**IGPU:**

- None

**PCIe Card:**

- BCM4360 802.11ac Wireless Network Adapter
- ASM2142 USB 3.0 XHCI Controller (`4` x Companion `USB2.0/3.0 Type A` port, `1` x `USB2.0/3.0 Type C`)
  
**Memory:**

- XLR8 32 GB DDR4 RAM 
  

**Storage:**

- 1 x SPCC M.2 NVMe-Maxio   500GB
  
- 1 x SPCC M.2 NVMe-Phison  250GB
  
- 1 x SPCC Solid State Disk 500GB

- 2 x WDC WD5000AAKX HDD    500GB
  

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

Additional Kext Info: 

- AGPMInjector.kext   (`AGPM`/`Machines`/`iMacPro1,1`/`Vendor1002Device7340`) 

<img width="1118" alt="Screen Shot 2022-02-24 at 9 23 55 PM" src="https://user-images.githubusercontent.com/72515939/155532265-5bbb6159-db1a-4efc-98e4-9dc84b73bd74.png">

- Moussey.kext        (`Apple Wireless Mouse Interface`/`ProductID:100`/`VendorID:7847`)

<img width="780" alt="Screen Shot 2022-02-24 at 9 10 54 PM" src="https://user-images.githubusercontent.com/72515939/155530287-29686499-0bad-4979-87e1-a3d8249b1ccd.png">

- USBMap.kext         (`15 Port` without `USB3.0 Type C`. Remark: Only use `2 x USB3.0 Type C` via `PCI`)

<img width="704" alt="Screen Shot 2022-02-24 at 9 13 13 PM" src="https://user-images.githubusercontent.com/72515939/155531328-ea6da084-7901-4705-b18f-4792fdba5260.png">

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

**Non Working:**
None

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
