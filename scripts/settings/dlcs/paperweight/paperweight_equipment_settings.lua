-- chunkname: @scripts/settings/dlcs/paperweight/paperweight_equipment_settings.lua

local settings = DLCSettings.paperweight

settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_paperweight",
}
settings.weapon_skins_file_names = {
	"scripts/settings/equipment/weapon_skins_paperweight",
}
settings.weapon_template_file_names = {
	"scripts/settings/equipment/weapon_templates/1h_axes_wood_elf",
	"scripts/settings/equipment/weapon_templates/1h_crowbills",
	"scripts/settings/equipment/weapon_templates/dual_wield_axe_falchion",
	"scripts/settings/equipment/weapon_templates/dual_wield_hammer_sword",
	"scripts/settings/equipment/weapon_templates/dual_wield_hammers",
}
settings.inventory_package_list = {
	"units/weapons/player/wpn_we_axe_01_t1/wpn_we_axe_01_t1",
	"units/weapons/player/wpn_we_axe_01_t1/wpn_we_axe_01_t1_3p",
	"units/weapons/player/wpn_we_axe_01_t2/wpn_we_axe_01_t2",
	"units/weapons/player/wpn_we_axe_01_t2/wpn_we_axe_01_t2_3p",
	"units/weapons/player/wpn_we_axe_02_t1/wpn_we_axe_02_t1",
	"units/weapons/player/wpn_we_axe_02_t1/wpn_we_axe_02_t1_3p",
	"units/weapons/player/wpn_we_axe_02_t2/wpn_we_axe_02_t2",
	"units/weapons/player/wpn_we_axe_02_t2/wpn_we_axe_02_t2_3p",
	"units/weapons/player/wpn_we_axe_01_t2/wpn_we_axe_01_t2_runed_01",
	"units/weapons/player/wpn_we_axe_01_t2/wpn_we_axe_01_t2_runed_01_3p",
	"units/weapons/player/wpn_we_axe_03_t1/wpn_we_axe_03_t1",
	"units/weapons/player/wpn_we_axe_03_t1/wpn_we_axe_03_t1_3p",
	"units/weapons/player/wpn_we_axe_03_t1/wpn_we_axe_03_t1_runed_01",
	"units/weapons/player/wpn_we_axe_03_t1/wpn_we_axe_03_t1_runed_01_3p",
	"units/weapons/player/wpn_we_axe_03_t2/wpn_we_axe_03_t2",
	"units/weapons/player/wpn_we_axe_03_t2/wpn_we_axe_03_t2_3p",
	"units/weapons/player/wpn_brw_crowbill_01/wpn_brw_crowbill_01",
	"units/weapons/player/wpn_brw_crowbill_01/wpn_brw_crowbill_01_3p",
	"units/weapons/player/wpn_brw_crowbill_02/wpn_brw_crowbill_02",
	"units/weapons/player/wpn_brw_crowbill_02/wpn_brw_crowbill_02_3p",
	"units/weapons/player/wpn_brw_crowbill_02/wpn_brw_crowbill_02_runed_01",
	"units/weapons/player/wpn_brw_crowbill_02/wpn_brw_crowbill_02_runed_01_3p",
	"units/weapons/player/wpn_emp_sword_06_t1/wpn_emp_sword_06_t1",
	"units/weapons/player/wpn_emp_sword_06_t1/wpn_emp_sword_06_t1_3p",
	"units/weapons/player/wpn_emp_sword_06_t1/wpn_emp_sword_06_t1_runed_01",
	"units/weapons/player/wpn_emp_sword_06_t1/wpn_emp_sword_06_t1_runed_01_3p",
	"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2",
	"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_3p",
	"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_runed_01",
	"units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_runed_01_3p",
}
settings.default_items = {
	we_1h_axe = {
		description = "description_default_holly_weapons",
		display_name = "display_name_default_we_1h_axe",
		inventory_icon = "icon_we_1h_axe_01",
	},
	bw_1h_crowbill = {
		description = "description_default_holly_weapons",
		display_name = "display_name_default_bw_1h_crowbill",
		inventory_icon = "icon_bw_1h_crowbill_01",
	},
	wh_dual_wield_axe_falchion = {
		description = "description_default_holly_weapons",
		display_name = "display_name_default_wh_dual_wield_axe_falchion",
		inventory_icon = "icon_wh_dual_wield_axe_falchion_01",
	},
	dr_dual_wield_hammers = {
		description = "description_default_holly_weapons",
		display_name = "display_name_default_dr_dual_wield_hammers",
		inventory_icon = "icon_dr_dual_wield_hammers_01",
	},
	es_dual_wield_hammer_sword = {
		description = "description_default_holly_weapons",
		display_name = "display_name_default_es_dual_wield_hammer_sword",
		inventory_icon = "icon_es_dual_wield_hammer_sword_01",
	},
}
