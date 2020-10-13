rule apt_RU_Turla_Carbon_Orchestrator : apt {

meta:
	author = "@sisoma2"
	date = "27/08/2020"
	desc = "Detects the Turla Carbon Orchestrator"
	hash = "750ed2ff73374bac96aa389f1450469e"
	hash = "3b10f20729d79ca3a92510674ff037c2"
	version = "0.1"
	
strings:
	$strgrp1_1 = "backet sorting ..." nocase wide ascii
	$strgrp1_2 = "Proxy task %d for obj %s ACTIVE fail robj=%s" nocase wide ascii
	$strgrp1_3 = "SYSTEM\\CurrentControlSet\\Control\\LSA" nocase wide ascii
	$strgrp1_4 = "SYSTEM\\CurrentControlSet\\Services\\lanmanserver\\parameters" nocase wide ascii
	
	$strgrp2_1 = "DestinationDirs" nocase wide ascii
	$strgrp2_2 = "*.inf" nocase wide ascii
	$strgrp2_3 = "A;OICIID;GA" nocase wide ascii
	$strgrp2_4 = "run_task_system" nocase wide ascii
	$strgrp2_5 = "frag_size=32768" nocase wide ascii
	$strgrp2_6 = "frag.tcp" nocase wide ascii
	
	$strgrp3_1 = /W\|-2\|%d\|%s\|.{1,50}\n/ nocase wide ascii 
	$strgrp3_2 = /(L|S|A|P|INJ)\|-1\|.{1,50}\n/ nocase wide ascii
	$strgrp3_3 = /AS_(G|CUR_USER|USER):.{1,50}\(\):%d\n/ nocase wide ascii
	
condition:
	filesize < 300KB
	and 2 of ($strgrp1_*)
	and 3 of ($strgrp2_*)
	and any of ($strgrp3_*)
}