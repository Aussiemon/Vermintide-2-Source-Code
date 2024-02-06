-- chunkname: @scripts/settings/dlcs/lake/lake_equipment_settings.lua

local settings = DLCSettings.lake

settings.item_master_list_file_names = {
	"scripts/settings/dlcs/lake/item_master_list_lake",
}
settings.weapon_skins_file_names = {
	"scripts/settings/equipment/weapon_skins_lake",
}
settings.cosmetics_files = {
	"scripts/settings/dlcs/lake/cosmetics_lake",
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/markus_questingknight_career_skill",
	"scripts/settings/equipment/weapon_templates/bastard_swords",
	"scripts/settings/equipment/weapon_templates/1h_swords_shield_breton",
}
settings.default_items = {
	es_bastard_sword = {
		description = "description_default_witch_hunter_wh_1h_falchions",
		display_name = "es_bastard_sword_blacksmith_name",
		inventory_icon = "icon_wpn_emp_gk_sword_01_t1",
	},
	es_sword_shield_breton = {
		description = "description_default_witch_hunter_wh_1h_falchions",
		display_name = "es_1h_sword_shield_breton_blacksmith_name",
		inventory_icon = "icon_wpn_emp_gk_sword_01_t1_wpn_emp_gk_shield_03",
	},
}
settings.damage_profile_template_files_names = {
	"scripts/settings/equipment/damage_profile_templates_dlc_lake",
}
settings.attack_template_files_names = {}
settings.action_template_file_names = {
	"scripts/settings/dlcs/lake/action_career_es_questingknight",
}
settings.action_classes_lookup = {
	career_es_four = "ActionCareerESQuestingKnight",
}
settings.inventory_package_list = {
	"resource_packages/careers/es_questingknight",
	"units/beings/player/empire_soldier_breton/first_person_base/chr_first_person_mesh",
	"units/beings/player/empire_soldier_breton/third_person_base/chr_third_person_mesh",
	"units/beings/player/empire_soldier_breton/skins/black_and_gold/chr_empire_soldier_breton_black_and_gold",
	"units/beings/player/empire_soldier_breton/skins/black_and_yellow/chr_empire_soldier_breton_black_and_yellow",
	"units/beings/player/empire_soldier_breton/skins/blue_and_white/chr_empire_soldier_breton_blue_and_white",
	"units/beings/player/empire_soldier_breton/skins/yellow_and_white/chr_empire_soldier_breton_yellow_and_white",
	"units/beings/player/empire_soldier_breton/skins/white/chr_empire_soldier_breton_white",
	"units/weapons/player/wpn_emp_gk_sword_01_t1/wpn_emp_gk_sword_01_t1",
	"units/weapons/player/wpn_emp_gk_sword_01_t1/wpn_emp_gk_sword_01_t1_3p",
	"units/weapons/player/wpn_emp_gk_sword_01_t2/wpn_emp_gk_sword_01_t2",
	"units/weapons/player/wpn_emp_gk_sword_01_t2/wpn_emp_gk_sword_01_t2_3p",
	"units/weapons/player/wpn_emp_gk_sword_02_t1/wpn_emp_gk_sword_02_t1",
	"units/weapons/player/wpn_emp_gk_sword_02_t1/wpn_emp_gk_sword_02_t1_3p",
	"units/weapons/player/wpn_emp_gk_sword_02_t1/wpn_emp_gk_sword_02_t1_runed_01",
	"units/weapons/player/wpn_emp_gk_sword_02_t1/wpn_emp_gk_sword_02_t1_runed_01_3p",
	"units/weapons/player/wpn_emp_gk_sword_02_t2/wpn_emp_gk_sword_02_t2",
	"units/weapons/player/wpn_emp_gk_sword_02_t2/wpn_emp_gk_sword_02_t2_3p",
	"units/weapons/player/wpn_emp_gk_sword_02_t2/wpn_emp_gk_sword_02_t2_magic_01",
	"units/weapons/player/wpn_emp_gk_sword_02_t2/wpn_emp_gk_sword_02_t2_magic_01_3p",
	"units/weapons/player/wpn_emp_gk_sword_03_t1/wpn_emp_gk_sword_03_t1",
	"units/weapons/player/wpn_emp_gk_sword_03_t1/wpn_emp_gk_sword_03_t1_3p",
	"units/weapons/player/wpn_emp_gk_sword_ability/wpn_emp_gk_sword_ability",
	"units/weapons/player/wpn_emp_gk_sword_ability/wpn_emp_gk_sword_ability_3p",
	"units/weapons/player/wpn_emp_gk_shield_01/wpn_emp_gk_shield_01",
	"units/weapons/player/wpn_emp_gk_shield_01/wpn_emp_gk_shield_01_3p",
	"units/weapons/player/wpn_emp_gk_shield_01/wpn_emp_gk_shield_01_magic_01",
	"units/weapons/player/wpn_emp_gk_shield_01/wpn_emp_gk_shield_01_magic_01_3p",
	"units/weapons/player/wpn_emp_gk_shield_02/wpn_emp_gk_shield_02",
	"units/weapons/player/wpn_emp_gk_shield_02/wpn_emp_gk_shield_02_3p",
	"units/weapons/player/wpn_emp_gk_shield_02/wpn_emp_gk_shield_02_runed_01",
	"units/weapons/player/wpn_emp_gk_shield_02/wpn_emp_gk_shield_02_runed_01_3p",
	"units/weapons/player/wpn_emp_gk_shield_03/wpn_emp_gk_shield_03",
	"units/weapons/player/wpn_emp_gk_shield_03/wpn_emp_gk_shield_03_3p",
	"units/weapons/player/wpn_emp_gk_shield_04/wpn_emp_gk_shield_04",
	"units/weapons/player/wpn_emp_gk_shield_04/wpn_emp_gk_shield_04_3p",
	"units/weapons/player/wpn_emp_gk_shield_05/wpn_emp_gk_shield_05",
	"units/weapons/player/wpn_emp_gk_shield_05/wpn_emp_gk_shield_05_3p",
	"units/beings/player/empire_soldier_breton/headpiece/es_gk_hat_01",
	"units/beings/player/empire_soldier_breton/headpiece/es_gk_hat_02",
	"units/beings/player/empire_soldier_breton/headpiece/es_gk_hat_03",
}
