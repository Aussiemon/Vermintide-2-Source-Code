﻿-- chunkname: @scripts/settings/dlcs/scorpion/scorpion_equipment_settings.lua

local settings = DLCSettings.scorpion

settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_scorpion",
}
settings.weapon_skins_file_names = {
	"scripts/settings/equipment/weapon_skins_scorpion",
}
settings.inventory_package_list = {
	"units/weapons/player/wpn_emp_sword_exe_03_t1/wpn_emp_sword_exe_03_t1_magic_01",
	"units/weapons/player/wpn_emp_sword_exe_03_t1/wpn_emp_sword_exe_03_t1_magic_01_3p",
	"units/weapons/player/wpn_empire_2h_sword_03_t1/wpn_2h_sword_03_t1_magic_01",
	"units/weapons/player/wpn_empire_2h_sword_03_t1/wpn_2h_sword_03_t1_magic_01_3p",
	"units/weapons/player/wpn_empire_2h_sword_04_t2/wpn_2h_sword_04_t2_magic_01",
	"units/weapons/player/wpn_empire_2h_sword_04_t2/wpn_2h_sword_04_t2_magic_01_3p",
	"units/weapons/player/wpn_empire_2h_hammer_01_t2/wpn_2h_hammer_01_t2_magic_01",
	"units/weapons/player/wpn_empire_2h_hammer_01_t2/wpn_2h_hammer_01_t2_magic_01_3p",
	"units/weapons/player/wpn_we_spear_02/wpn_we_spear_02_magic_01",
	"units/weapons/player/wpn_we_spear_02/wpn_we_spear_02_magic_01_3p",
	"units/weapons/player/wpn_emp_flail_04_t1/wpn_emp_flail_04_t1_magic_01",
	"units/weapons/player/wpn_emp_flail_04_t1/wpn_emp_flail_04_t1_magic_01_3p",
	"units/weapons/player/wpn_emp_sword_03_t2/wpn_emp_sword_03_t2_magic_01",
	"units/weapons/player/wpn_emp_sword_03_t2/wpn_emp_sword_03_t2_magic_01_3p",
	"units/weapons/player/wpn_we_2h_axe_02_t1/wpn_we_2h_axe_02_t1_magic_01",
	"units/weapons/player/wpn_we_2h_axe_02_t1/wpn_we_2h_axe_02_t1_magic_01_3p",
	"units/weapons/player/wpn_we_2h_sword_04_t2/wpn_we_2h_sword_04_t2_magic_01",
	"units/weapons/player/wpn_we_2h_sword_04_t2/wpn_we_2h_sword_04_t2_magic_01_3p",
	"units/weapons/player/wpn_we_dagger_03_t2/wpn_we_dagger_03_t2_magic_01",
	"units/weapons/player/wpn_we_dagger_03_t2/wpn_we_dagger_03_t2_magic_01_3p",
	"units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1_magic_01",
	"units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1_magic_01_3p",
	"units/weapons/player/wpn_we_bow_01_t2/wpn_we_bow_01_t2_magic_01",
	"units/weapons/player/wpn_we_bow_01_t2/wpn_we_bow_01_t2_magic_01_3p",
	"units/weapons/player/wpn_emp_sword_05_t2/wpn_emp_sword_05_t2_magic_01",
	"units/weapons/player/wpn_emp_sword_05_t2/wpn_emp_sword_05_t2_magic_01_3p",
	"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_magic_01",
	"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_magic_01_3p",
	"units/weapons/player/wpn_emp_mace_03_t2/wpn_emp_mace_03_t2_magic_01",
	"units/weapons/player/wpn_emp_mace_03_t2/wpn_emp_mace_03_t2_magic_01_3p",
	"units/weapons/player/wpn_we_repeater_crossbow_t1/wpn_we_repeater_crossbow_t1_magic_01",
	"units/weapons/player/wpn_we_repeater_crossbow_t1/wpn_we_repeater_crossbow_t1_magic_01_3p",
	"units/weapons/player/wpn_axe_hatchet_t2/wpn_axe_hatchet_t2_magic_01",
	"units/weapons/player/wpn_axe_hatchet_t2/wpn_axe_hatchet_t2_magic_01_3p",
	"units/weapons/player/wpn_emp_bow_04/wpn_emp_bow_04_magic_01",
	"units/weapons/player/wpn_emp_bow_04/wpn_emp_bow_04_magic_01_3p",
	"units/weapons/player/wpn_wh_halberd_03/wpn_wh_halberd_03_magic_01",
	"units/weapons/player/wpn_wh_halberd_03/wpn_wh_halberd_03_magic_01_3p",
	"units/weapons/player/wpn_we_bow_short_02/wpn_we_bow_short_02_magic_01",
	"units/weapons/player/wpn_we_bow_short_02/wpn_we_bow_short_02_magic_01_3p",
	"units/weapons/player/wpn_dw_2h_axe_01_t2/wpn_dw_2h_axe_01_t2_magic_01",
	"units/weapons/player/wpn_dw_2h_axe_01_t2/wpn_dw_2h_axe_01_t2_magic_01_3p",
	"units/weapons/player/wpn_dw_2h_hammer_02_t1/wpn_dw_2h_hammer_02_t1_magic_01",
	"units/weapons/player/wpn_dw_2h_hammer_02_t1/wpn_dw_2h_hammer_02_t1_magic_01_3p",
	"units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2_magic_01",
	"units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2_magic_01_3p",
	"units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1_magic_01",
	"units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1_magic_01_3p",
	"units/weapons/player/wpn_dw_pick_01_t2/wpn_dw_pick_01_t2_magic_01",
	"units/weapons/player/wpn_dw_pick_01_t2/wpn_dw_pick_01_t2_magic_01_3p",
	"units/weapons/player/wpn_dw_shield_04_t1/wpn_dw_shield_04_magic_01",
	"units/weapons/player/wpn_dw_shield_04_t1/wpn_dw_shield_04_magic_01_3p",
	"units/weapons/player/wpn_emp_handgun_repeater_t1/wpn_emp_handgun_repeater_t1_magic_01",
	"units/weapons/player/wpn_emp_handgun_repeater_t1/wpn_emp_handgun_repeater_t1_magic_01_3p",
	"units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_magic_01",
	"units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_magic_01_3p",
	"units/weapons/player/wpn_empire_pistol_repeater_02/wpn_empire_pistol_repeater_02_t2_magic_01",
	"units/weapons/player/wpn_empire_pistol_repeater_02/wpn_empire_pistol_repeater_02_t2_magic_01_3p",
	"units/weapons/player/wpn_empire_shield_04/wpn_emp_shield_04_magic_01",
	"units/weapons/player/wpn_empire_shield_04/wpn_emp_shield_04_magic_01_3p",
	"units/weapons/player/wpn_fencingsword_04_t2/wpn_fencingsword_04_t2_magic_01",
	"units/weapons/player/wpn_fencingsword_04_t2/wpn_fencingsword_04_t2_magic_01_3p",
	"units/weapons/player/wpn_empire_crossbow_t2/wpn_empire_crossbow_tier2_magic_01",
	"units/weapons/player/wpn_empire_crossbow_t2/wpn_empire_crossbow_tier2_magic_01_3p",
	"units/weapons/player/wpn_emp_mace_04_t3/wpn_emp_mace_04_t3_magic_01",
	"units/weapons/player/wpn_emp_mace_04_t3/wpn_emp_mace_04_t3_magic_01_3p",
	"units/weapons/player/wpn_dw_xbow_02_t1/wpn_dw_xbow_02_t1_magic_01",
	"units/weapons/player/wpn_dw_xbow_02_t1/wpn_dw_xbow_02_t1_magic_01_3p",
	"units/weapons/player/wpn_empire_blunderbuss_02_t1/wpn_empire_blunderbuss_02_t1_magic_01",
	"units/weapons/player/wpn_empire_blunderbuss_02_t1/wpn_empire_blunderbuss_02_t1_magic_01_3p",
	"units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2_magic_01",
	"units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2_magic_01_3p",
	"units/weapons/player/wpn_dw_drake_pistol_01_t1/wpn_dw_drake_pistol_01_t1_magic_01",
	"units/weapons/player/wpn_dw_drake_pistol_01_t1/wpn_dw_drake_pistol_01_t1_magic_01_3p",
	"units/weapons/player/wpn_dw_handgun_02_t1/wpn_dw_handgun_02_t1_magic_01",
	"units/weapons/player/wpn_dw_handgun_02_t1/wpn_dw_handgun_02_t1_magic_01_3p",
	"units/weapons/player/wpn_dw_iron_drake_02/wpn_dw_iron_drake_02_magic_01",
	"units/weapons/player/wpn_dw_iron_drake_02/wpn_dw_iron_drake_02_magic_01_3p",
	"units/weapons/player/wpn_dw_rakegun_t3/wpn_dw_rakegun_t3_magic_01",
	"units/weapons/player/wpn_dw_rakegun_t3/wpn_dw_rakegun_t3_magic_01_3p",
	"units/weapons/player/wpn_brw_sword_03_t2/wpn_brw_sword_03_t2_magic_01",
	"units/weapons/player/wpn_brw_sword_03_t2/wpn_brw_sword_03_t2_magic_01_3p",
	"units/weapons/player/wpn_brw_sword_03_t2/wpn_brw_flaming_sword_03_t2_magic_01",
	"units/weapons/player/wpn_brw_sword_03_t2/wpn_brw_flaming_sword_03_t2_magic_01_3p",
	"units/weapons/player/wpn_brw_mace_02/wpn_brw_mace_02_magic_01",
	"units/weapons/player/wpn_brw_mace_02/wpn_brw_mace_02_magic_01_3p",
	"units/weapons/player/wpn_brw_beam_staff_02/wpn_brw_beam_staff_02_magic_01",
	"units/weapons/player/wpn_brw_beam_staff_02/wpn_brw_beam_staff_02_magic_01_3p",
	"units/weapons/player/wpn_brw_dagger_02/wpn_brw_dagger_02_magic_01",
	"units/weapons/player/wpn_brw_dagger_02/wpn_brw_dagger_02_magic_01_3p",
	"units/weapons/player/wpn_wh_repeater_crossbow_t2/wpn_wh_repeater_crossbow_t2_magic_01",
	"units/weapons/player/wpn_wh_repeater_crossbow_t2/wpn_wh_repeater_crossbow_t2_magic_01_3p",
	"units/weapons/player/wpn_brw_staff_05/wpn_brw_staff_05_magic_01",
	"units/weapons/player/wpn_brw_staff_05/wpn_brw_staff_05_magic_01_3p",
	"units/weapons/player/wpn_brw_staff_03/wpn_brw_staff_03_magic_01",
	"units/weapons/player/wpn_brw_staff_03/wpn_brw_staff_03_magic_01_3p",
	"units/weapons/player/wpn_brw_spear_staff_05/wpn_brw_spear_staff_05_magic_01",
	"units/weapons/player/wpn_brw_spear_staff_05/wpn_brw_spear_staff_05_magic_01_3p",
	"units/weapons/player/wpn_brw_flame_staff_04/wpn_brw_flame_staff_04_magic_01",
	"units/weapons/player/wpn_brw_flame_staff_04/wpn_brw_flame_staff_04_magic_01_3p",
	"units/weapons/player/wpn_brw_crowbill_01/wpn_brw_crowbill_01_magic_01",
	"units/weapons/player/wpn_brw_crowbill_01/wpn_brw_crowbill_01_magic_01_3p",
	"units/weapons/player/wpn_we_axe_03_t2/wpn_we_axe_03_t2_magic_01",
	"units/weapons/player/wpn_we_axe_03_t2/wpn_we_axe_03_t2_magic_01_3p",
	"units/weapons/player/wpn_brw_flaming_flail_02/wpn_brw_flaming_flail_02_magic_01",
	"units/weapons/player/wpn_brw_flaming_flail_02/wpn_brw_flaming_flail_02_magic_01_3p",
	"units/weapons/player/wpn_emp_boar_spear_02/wpn_emp_boar_spear_02_magic_01",
	"units/weapons/player/wpn_emp_boar_spear_02/wpn_emp_boar_spear_02_magic_01_3p",
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/wpn_dw_thrown_axe_01_t2_magic_01",
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/wpn_dw_thrown_axe_01_t2_magic_01_3p",
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/prj_dw_thrown_axe_01_t2_magic_01_3ps",
	"units/weapons/player/wpn_dw_thrown_axe_01_t2/pup_dw_thrown_axe_01_t2_magic_01",
	"units/weapons/player/wpn_we_shield_02/wpn_we_shield_02_magic_01",
	"units/weapons/player/wpn_we_shield_02/wpn_we_shield_02_magic_01_3p",
	"units/weapons/player/wpn_wh_billhook_02/wpn_wh_billhook_02_magic_01",
	"units/weapons/player/wpn_wh_billhook_02/wpn_wh_billhook_02_magic_01_3p",
}
settings.projectile_units = {
	throwing_axe_01_t2_magic_01 = {
		dummy_linker_unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t2/prj_dw_thrown_axe_01_t2_magic_01_3ps",
		projectile_unit_name = "units/weapons/player/wpn_dw_thrown_axe_01_t2/prj_dw_thrown_axe_01_t2_magic_01_3ps",
	},
}
