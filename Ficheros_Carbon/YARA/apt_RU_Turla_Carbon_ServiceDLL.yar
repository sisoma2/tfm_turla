rule apt_RU_Turla_Carbon_ServiceDLL : apt {

meta:
	author = "@sisoma2"
	date = "27/08/2020"
	desc = "Detects the Turla Carbon Service DLL"
	hash = "67e400d026e50f18599b2beeda2c565d"
	hash = "35f4f185e3d827fd02ee76a54ed9827a"
	version = "0.1"
	
strings:
	$strgrp_1 = "OnDemandStart" nocase wide ascii
	$strgrp_2 = "OnDemandStop" nocase wide ascii
	$strgrp_3 = "*.inf" nocase wide ascii
	$strgrp_4 = "DestinationDirs" nocase wide ascii
	
	
	$code_x86_1 = { 68 00 08 00 00 C7 [1-6] FF D? 68 00 08 00 00 8B [1-6] FF D? 83 C4 ?? 8B [1-6] 85 ?? 0F 84 [4] 85 ?? 0F 84 [4] 68 00 08 00 00 6A 00 5? E8 [4] 68 00 08 00 00 6A 00 5? E8 }
	$code_x86_2 = { 68 08 02 00 00 8D [1-6] 5? 68 [4] FF 15 [4] 85 C0 0F 84 [4] 0F B7 [1-6] 5? 8D [1-6] 5? 8D [1-6] 5? FF 15 [4] 83 C4 ?? 6A 28 8D [1-6] 5? 8D [1-6] 5? 8D [1-6] 5? 8D [1-6] 5? 68 08 02 00 00 8D [1-6] 5? 8D [1-6] 5? FF 15 }
	
	$code_x64 = { 41 B8 08 02 00 00 48 8D [1-6] 48 8D [1-6] FF 15 [4] 85 C0 75 ?? 33 C? E9 [4] 0F B7 [1-6] 44 8B [1-6] 48 8D [1-6] 48 8D [1-6] FF 15 [4] C7 [1-10] 48 8D [1-6] 48 89 [1-6] 48 8D [1-6] 48 89 [1-6] 48 8D [1-6] 48 89 [1-6] 4C 8D [1-6] 41 B8 08 02 00 00 48 8D [1-6] 48 8D [1-6] FF 15 }
	
condition:
	filesize < 30KB
	and 1 of ($code*)
	and any of ($strgrp_*)
}