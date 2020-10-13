rule apt_RU_Turla_Carbon_CommunicationLibrary : apt {

meta:
	author = "@sisoma2"
	date = "27/08/2020"
	desc = "Detects the Turla Carbon Comms Library"
	hash = "0868a27ef0aa512cbae82f4251767f4b"
	hash = "e5a90e7e63ededbdd5ee13219bc93fce"
	version = "0.1"
	
strings:
	$strgrp1_1 = "backet sorting ..." nocase wide ascii
	$strgrp1_2 = "/javascript/view.php" nocase wide ascii
	$strgrp1_3 = "Proxy task %d obj %s ACTIVE fail robj %s" nocase wide ascii
	
	$strgrp2_1 = "check_lastconnect" nocase wide ascii
	$strgrp2_2 = "lastsuccon" nocase wide ascii
	$strgrp2_3 = "rendezvous_point" nocase wide ascii 
	$strgrp2_4 = "configlastsend" nocase wide ascii
	$strgrp2_5 = "DestinationDirs" nocase wide ascii
	$strgrp2_6 = "*.inf" nocase wide ascii
	
	$strgrp3_1 = /W\|(0|1|-1)\|%d\|%s:%s\|.{1,50}\n/ nocase wide ascii 
	$strgrp3_2 = /(W|P).{1,10}\|%s:%s\|%d\|%d\|\n/ nocase wide ascii
	$strgrp3_3 = "%s: http://%s%s" nocase wide ascii
	$strgrp3_4 = /(TS|ST|CR|PV|TP|SL|WP|IA|RP)\|%d\|\n/ nocase wide ascii
	
condition:
	filesize < 200KB
	and 1 of ($strgrp1_*)
	and 2 of ($strgrp2_*)
	and 3 of ($strgrp3_*)
}