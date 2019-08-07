require("scripts/settings/equipment/weapon_material_settings_templates")
require("scripts/settings/equipment/projectile_units")
require("scripts/settings/equipment/pickups")

WeaponSkins = WeaponSkins or {}
WeaponSkins.skins = {
	{
		name = "wh_1h_axe_skin_01",
		data = {
			description = "wh_1h_axe_skin_01_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_axe1h",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_axe_02_t1",
			display_name = "wh_1h_axe_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_axe_02_t1/wpn_axe_02_t1",
			template = "one_hand_axe_template_1"
		}
	},
	{
		name = "wh_1h_axe_skin_02",
		data = {
			description = "wh_1h_axe_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_axe1h",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_axe_02_t2",
			display_name = "wh_1h_axe_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_axe_02_t2/wpn_axe_02_t2",
			template = "one_hand_axe_template_1"
		}
	},
	{
		name = "wh_1h_axe_skin_02_runed_01",
		data = {
			description = "wh_1h_axe_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_axe1h",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_axe_02_t2",
			display_name = "wh_1h_axe_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_axe_02_t2/wpn_axe_02_t2_runed_01",
			template = "one_hand_axe_template_1"
		}
	},
	{
		name = "wh_1h_axe_skin_03",
		data = {
			description = "wh_1h_axe_skin_03_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_axe1h",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_axe_03_t1",
			display_name = "wh_1h_axe_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_axe_03_t1/wpn_axe_03_t1",
			template = "one_hand_axe_template_1"
		}
	},
	{
		name = "wh_1h_axe_skin_04",
		data = {
			description = "wh_1h_axe_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_axe1h",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_axe_03_t2",
			display_name = "wh_1h_axe_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_axe_03_t2/wpn_axe_03_t2",
			template = "one_hand_axe_template_1"
		}
	},
	{
		name = "wh_1h_axe_skin_04_runed_01",
		data = {
			description = "wh_1h_axe_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_axe1h",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_axe_03_t2",
			display_name = "wh_1h_axe_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_axe_03_t2/wpn_axe_03_t2_runed_01",
			template = "one_hand_axe_template_1"
		}
	},
	{
		name = "wh_1h_axe_skin_04_runed_02",
		data = {
			description = "wh_1h_axe_skin_04_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_axe_03_t2/wpn_axe_03_t2_runed_01",
			hud_icon = "weapon_generic_icon_axe1h",
			inventory_icon = "icon_wpn_axe_03_t2",
			display_name = "wh_1h_axe_skin_04_runed_02_name",
			template = "one_hand_axe_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "wh_1h_axe_skin_05",
		data = {
			description = "wh_1h_axe_skin_05_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_axe1h",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_axe_hatchet_t1",
			display_name = "wh_1h_axe_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_axe_hatchet_t1/wpn_axe_hatchet_t1",
			template = "one_hand_axe_template_1"
		}
	},
	{
		name = "wh_1h_axe_skin_06",
		data = {
			description = "wh_1h_axe_skin_06_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_axe1h",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_axe_hatchet_t2",
			display_name = "wh_1h_axe_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_axe_hatchet_t2/wpn_axe_hatchet_t2",
			template = "one_hand_axe_template_1"
		}
	},
	{
		name = "wh_crossbow_skin_01",
		data = {
			description = "wh_crossbow_skin_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_01_name",
			rarity = "common",
			inventory_icon = "icon_wpn_emp_crossbow_02_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_02_t1/wpn_emp_crossbow_02_t1",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_crossbow_skin_02",
		data = {
			description = "wh_crossbow_skin_02_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_02_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_emp_crossbow_02_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_02_t2/wpn_emp_crossbow_02_t2",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_crossbow_skin_02_runed_01",
		data = {
			description = "wh_crossbow_skin_02_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_02_runed_01_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_emp_crossbow_02_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_02_t2/wpn_emp_crossbow_02_t2_runed_01",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_crossbow_skin_03",
		data = {
			description = "wh_crossbow_skin_03_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_03_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_emp_crossbow_03_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_03_t1/wpn_emp_crossbow_03_t1",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_crossbow_skin_04",
		data = {
			description = "wh_crossbow_skin_04_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_04_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_emp_crossbow_03_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_03_t2/wpn_emp_crossbow_03_t2",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_crossbow_skin_04_runed_01",
		data = {
			description = "wh_crossbow_skin_04_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_04_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_emp_crossbow_03_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_03_t2/wpn_emp_crossbow_03_t2_runed_01",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_crossbow_skin_04_runed_02",
		data = {
			description = "wh_crossbow_skin_04_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_04_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_emp_crossbow_03_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_03_t2/wpn_emp_crossbow_03_t2_runed_01",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "wh_crossbow_skin_05",
		data = {
			description = "wh_crossbow_skin_05_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_05_name",
			rarity = "plentiful",
			inventory_icon = "icon_wpn_empire_crossbow_t1",
			left_hand_unit = "units/weapons/player/wpn_empire_crossbow_t1/wpn_empire_crossbow_tier1",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_crossbow_skin_06",
		data = {
			description = "wh_crossbow_skin_06_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_06_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_empire_crossbow_t2",
			left_hand_unit = "units/weapons/player/wpn_empire_crossbow_t2/wpn_empire_crossbow_tier2",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_crossbow_skin_07",
		data = {
			description = "wh_crossbow_skin_07_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "wh_crossbow_skin_07_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_empire_crossbow_t3",
			left_hand_unit = "units/weapons/player/wpn_empire_crossbow_t3/wpn_empire_crossbow_tier3",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_crossbow",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "es_1h_flail_skin_01",
		data = {
			description = "es_1h_flail_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_mace",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_flail_01_t1",
			display_name = "es_1h_flail_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_01_t1/wpn_emp_flail_01_t1",
			template = "one_handed_flail_template_1"
		}
	},
	{
		name = "es_1h_flail_skin_02",
		data = {
			description = "es_1h_flail_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_mace",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_flail_02_t1",
			display_name = "es_1h_flail_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_02_t1/wpn_emp_flail_02_t1",
			template = "one_handed_flail_template_1"
		}
	},
	{
		name = "es_1h_flail_skin_02_runed_01",
		data = {
			description = "es_1h_flail_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_mace",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_flail_02_t1",
			display_name = "es_1h_flail_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_02_t1/wpn_emp_flail_02_t1_runed_01",
			template = "one_handed_flail_template_1"
		}
	},
	{
		name = "es_1h_flail_skin_03",
		data = {
			description = "es_1h_flail_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_mace",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_flail_03_t1",
			display_name = "es_1h_flail_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_03_t1/wpn_emp_flail_03_t1",
			template = "one_handed_flail_template_1"
		}
	},
	{
		name = "es_1h_flail_skin_04",
		data = {
			description = "es_1h_flail_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_mace",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_flail_04_t1",
			display_name = "es_1h_flail_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_04_t1/wpn_emp_flail_04_t1",
			template = "one_handed_flail_template_1"
		}
	},
	{
		name = "es_1h_flail_skin_05",
		data = {
			description = "es_1h_flail_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_mace",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_flail_05_t1",
			display_name = "es_1h_flail_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_05_t1/wpn_emp_flail_05_t1",
			template = "one_handed_flail_template_1"
		}
	},
	{
		name = "es_1h_flail_skin_05_runed_01",
		data = {
			description = "es_1h_flail_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_mace",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_flail_05_t1",
			display_name = "es_1h_flail_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_05_t1/wpn_emp_flail_05_t1_runed_01",
			template = "one_handed_flail_template_1"
		}
	},
	{
		name = "es_1h_flail_skin_05_runed_02",
		data = {
			description = "es_1h_flail_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_05_t1/wpn_emp_flail_05_t1_runed_01",
			hud_icon = "weapon_generic_icon_mace",
			inventory_icon = "icon_wpn_emp_flail_05_t1",
			display_name = "es_1h_flail_skin_05_runed_02_name",
			template = "one_handed_flail_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "wh_brace_of_pistols_skin_01",
		data = {
			description = "wh_brace_of_pistols_skin_01_description",
			rarity = "plentiful",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1",
			display_name = "wh_brace_of_pistols_skin_01_name",
			inventory_icon = "icon_wpn_emp_pistol_01_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "wh_brace_of_pistols_skin_02",
		data = {
			description = "wh_brace_of_pistols_skin_02_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2",
			display_name = "wh_brace_of_pistols_skin_02_name",
			inventory_icon = "icon_wpn_emp_pistol_02_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "wh_brace_of_pistols_skin_03",
		data = {
			description = "wh_brace_of_pistols_skin_03_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2",
			display_name = "wh_brace_of_pistols_skin_03_name",
			inventory_icon = "icon_wpn_emp_pistol_02_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "wh_brace_of_pistols_skin_03_runed_01",
		data = {
			description = "wh_brace_of_pistols_skin_03_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2_runed_01",
			display_name = "wh_brace_of_pistols_skin_03_runed_01_name",
			inventory_icon = "icon_wpn_emp_pistol_02_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2_runed_01",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "wh_brace_of_pistols_skin_03_runed_02",
		data = {
			description = "wh_brace_of_pistols_skin_03_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2_runed_01",
			display_name = "wh_brace_of_pistols_skin_03_runed_02_name",
			inventory_icon = "icon_wpn_emp_pistol_02_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2_runed_01",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "wh_brace_of_pistols_skin_04",
		data = {
			description = "wh_brace_of_pistols_skin_04_description",
			rarity = "common",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t1/wpn_emp_pistol_03_t1",
			display_name = "wh_brace_of_pistols_skin_04_name",
			inventory_icon = "icon_wpn_emp_pistol_03_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t1/wpn_emp_pistol_03_t1",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "wh_brace_of_pistols_skin_05",
		data = {
			description = "wh_brace_of_pistols_skin_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2",
			display_name = "wh_brace_of_pistols_skin_05_name",
			inventory_icon = "icon_wpn_emp_pistol_03_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "wh_brace_of_pistols_skin_05_runed_01",
		data = {
			description = "wh_brace_of_pistols_skin_05_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_runed_01",
			display_name = "wh_brace_of_pistols_skin_05_runed_01_name",
			inventory_icon = "icon_wpn_emp_pistol_03_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_runed_01",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "wh_1h_falchion_skin_01",
		data = {
			description = "wh_1h_falchion_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_falken",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_04_t1",
			display_name = "wh_1h_falchion_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_04_t1/wpn_emp_sword_04_t1",
			template = "one_hand_falchion_template_1"
		}
	},
	{
		name = "wh_1h_falchion_skin_01_runed_01",
		data = {
			description = "wh_1h_falchion_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_falken",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_04_t1",
			display_name = "wh_1h_falchion_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_04_t1/wpn_emp_sword_04_t1_runed_01",
			template = "one_hand_falchion_template_1"
		}
	},
	{
		name = "wh_1h_falchion_skin_02",
		data = {
			description = "wh_1h_falchion_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_falken",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_04_t2",
			display_name = "wh_1h_falchion_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_04_t2/wpn_emp_sword_04_t2",
			template = "one_hand_falchion_template_1"
		}
	},
	{
		name = "wh_1h_falchion_skin_02_runed_01",
		data = {
			description = "wh_1h_falchion_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_falken",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_04_t2",
			display_name = "wh_1h_falchion_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_04_t2/wpn_emp_sword_04_t2_runed_01",
			template = "one_hand_falchion_template_1"
		}
	},
	{
		name = "wh_1h_falchion_skin_02_runed_02",
		data = {
			description = "wh_1h_falchion_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_04_t2/wpn_emp_sword_04_t2_runed_01",
			hud_icon = "weapon_generic_icon_falken",
			inventory_icon = "icon_wpn_emp_sword_04_t2",
			display_name = "wh_1h_falchion_skin_02_runed_02_name",
			template = "one_hand_falchion_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "wh_1h_falchion_skin_03",
		data = {
			description = "wh_1h_falchion_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_falken",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_05_t1",
			display_name = "wh_1h_falchion_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_05_t1/wpn_emp_sword_05_t1",
			template = "one_hand_falchion_template_1"
		}
	},
	{
		name = "wh_1h_falchion_skin_04",
		data = {
			description = "wh_1h_falchion_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_falken",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_05_t2",
			display_name = "wh_1h_falchion_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_05_t2/wpn_emp_sword_05_t2",
			template = "one_hand_falchion_template_1"
		}
	},
	{
		name = "wh_2h_sword_skin_01",
		data = {
			description = "wh_2h_sword_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_sword",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_02_t1",
			display_name = "wh_2h_sword_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_02_t1/wpn_2h_sword_02_t1",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "wh_2h_sword_skin_02",
		data = {
			description = "wh_2h_sword_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_sword",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_02_t2",
			display_name = "wh_2h_sword_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_02_t2/wpn_2h_sword_02_t2",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "wh_2h_sword_skin_02_runed_01",
		data = {
			description = "wh_2h_sword_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_sword",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_02_t2",
			display_name = "wh_2h_sword_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_02_t2/wpn_2h_sword_02_t2_runed_01",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "wh_2h_sword_skin_03",
		data = {
			description = "wh_2h_sword_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_sword",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_02_t3",
			display_name = "wh_2h_sword_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_02_t3/wpn_2h_sword_02_t3",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "wh_2h_sword_skin_04",
		data = {
			description = "wh_2h_sword_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_sword",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_04_t2",
			display_name = "wh_2h_sword_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_04_t2/wpn_2h_sword_04_t2",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "wh_2h_sword_skin_05",
		data = {
			description = "wh_2h_sword_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_sword",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_05_t1",
			display_name = "wh_2h_sword_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_05_t1/wpn_2h_sword_05_t1",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "wh_2h_sword_skin_05_runed_01",
		data = {
			description = "wh_2h_sword_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_sword",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_05_t1",
			display_name = "wh_2h_sword_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_05_t1/wpn_2h_sword_05_t1_runed_01",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "wh_2h_sword_skin_05_runed_02",
		data = {
			description = "wh_2h_sword_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_05_t1/wpn_2h_sword_05_t1_runed_01",
			hud_icon = "weapon_generic_icon_sword",
			inventory_icon = "icon_wpn_empire_2h_sword_05_t1",
			display_name = "wh_2h_sword_skin_05_runed_02_name",
			template = "two_handed_swords_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "wh_repeating_pistol_skin_01",
		data = {
			description = "wh_repeating_pistol_skin_01_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			inventory_icon = "icon_wpn_empire_pistol_repeater_t1",
			display_name = "wh_repeating_pistol_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater/wpn_empire_pistol_repeater_t1",
			template = "repeating_pistol_template_1"
		}
	},
	{
		name = "wh_repeating_pistol_skin_02",
		data = {
			description = "wh_repeating_pistol_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			inventory_icon = "icon_wpn_empire_pistol_repeater_t2",
			display_name = "wh_repeating_pistol_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater/wpn_empire_pistol_repeater_t2",
			template = "repeating_pistol_template_1"
		}
	},
	{
		name = "wh_repeating_pistol_skin_02_runed_01",
		data = {
			description = "wh_repeating_pistol_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			inventory_icon = "icon_wpn_empire_pistol_repeater_t2",
			display_name = "wh_repeating_pistol_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater/wpn_empire_pistol_repeater_t2_runed_01",
			template = "repeating_pistol_template_1"
		}
	},
	{
		name = "wh_repeating_pistol_skin_02_runed_02",
		data = {
			description = "wh_repeating_pistol_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater/wpn_empire_pistol_repeater_t2_runed_01",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			inventory_icon = "icon_wpn_empire_pistol_repeater_t2",
			display_name = "wh_repeating_pistol_skin_02_runed_02_name",
			template = "repeating_pistol_template_1",
			display_unit = "units/weapons/weapon_display/display_pistols",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "wh_repeating_pistol_skin_03",
		data = {
			description = "wh_repeating_pistol_skin_03_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			inventory_icon = "icon_wpn_empire_pistol_repeater_t3",
			display_name = "wh_repeating_pistol_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater/wpn_empire_pistol_repeater_t3",
			template = "repeating_pistol_template_1"
		}
	},
	{
		name = "wh_repeating_pistol_skin_04",
		data = {
			description = "wh_repeating_pistol_skin_04_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			inventory_icon = "icon_wpn_empire_pistol_repeater_02_t1",
			display_name = "wh_repeating_pistol_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater_02/wpn_empire_pistol_repeater_02_t1",
			template = "repeating_pistol_template_1"
		}
	},
	{
		name = "wh_repeating_pistol_skin_04_runed_01",
		data = {
			description = "wh_repeating_pistol_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			inventory_icon = "icon_wpn_empire_pistol_repeater_02_t1",
			display_name = "wh_repeating_pistol_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater_02/wpn_empire_pistol_repeater_02_t1_runed_01",
			template = "repeating_pistol_template_1"
		}
	},
	{
		name = "wh_repeating_pistol_skin_05",
		data = {
			description = "wh_repeating_pistol_skin_05_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			inventory_icon = "icon_wpn_empire_pistol_repeater_02_t2",
			display_name = "wh_repeating_pistol_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater_02/wpn_empire_pistol_repeater_02_t2",
			template = "repeating_pistol_template_1"
		}
	},
	{
		name = "wh_fencing_sword_skin_01",
		data = {
			description = "wh_fencing_sword_skin_01_description",
			rarity = "plentiful",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_01_t1/wpn_fencingsword_01_t1",
			display_name = "wh_fencing_sword_skin_01_name",
			inventory_icon = "icon_wpn_fencingsword_01_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_fencing_sword_skin_01_runed_01",
		data = {
			description = "wh_fencing_sword_skin_01_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_01_t1/wpn_fencingsword_01_t1_runed_01",
			display_name = "wh_fencing_sword_skin_01_runed_01_name",
			inventory_icon = "icon_wpn_fencingsword_01_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_fencing_sword_skin_01_runed_02",
		data = {
			description = "wh_fencing_sword_skin_01_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_01_t1/wpn_fencingsword_01_t1_runed_01",
			display_name = "wh_fencing_sword_skin_01_runed_02_name",
			inventory_icon = "icon_wpn_fencingsword_01_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "wh_fencing_sword_skin_02",
		data = {
			description = "wh_fencing_sword_skin_02_description",
			rarity = "common",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_02_t1/wpn_fencingsword_02_t1",
			display_name = "wh_fencing_sword_skin_02_name",
			inventory_icon = "icon_wpn_fencingsword_02_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_fencing_sword_skin_03",
		data = {
			description = "wh_fencing_sword_skin_03_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_02_t2/wpn_fencingsword_02_t2",
			display_name = "wh_fencing_sword_skin_03_name",
			inventory_icon = "icon_wpn_fencingsword_02_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_fencing_sword_skin_04",
		data = {
			description = "wh_fencing_sword_skin_04_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_03_t1/wpn_fencingsword_03_t1",
			display_name = "wh_fencing_sword_skin_04_name",
			inventory_icon = "icon_wpn_fencingsword_03_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_fencing_sword_skin_05",
		data = {
			description = "wh_fencing_sword_skin_05_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_03_t2/wpn_fencingsword_03_t2",
			display_name = "wh_fencing_sword_skin_05_name",
			inventory_icon = "icon_wpn_fencingsword_03_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_fencing_sword_skin_06",
		data = {
			description = "wh_fencing_sword_skin_06_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_04_t1/wpn_fencingsword_04_t1",
			display_name = "wh_fencing_sword_skin_06_name",
			inventory_icon = "icon_wpn_fencingsword_04_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_fencing_sword_skin_07",
		data = {
			description = "wh_fencing_sword_skin_07_description",
			rarity = "common",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_04_t2/wpn_fencingsword_04_t2",
			display_name = "wh_fencing_sword_skin_07_name",
			inventory_icon = "icon_wpn_fencingsword_04_t2",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_01_t1/wpn_emp_pistol_01_t1",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_fencing_sword_skin_08",
		data = {
			description = "wh_fencing_sword_skin_08_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_t1/wpn_fencingsword_t1",
			display_name = "wh_fencing_sword_skin_08_name",
			inventory_icon = "icon_wpn_fencingsword_t1",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2",
			template = "fencing_sword_template_1",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "wh_repeating_crossbow_skin_01",
		data = {
			description = "wh_repeating_crossbow_skin_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "wh_repeating_crossbow_skin_01_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_wh_repeater_crossbow_t1",
			left_hand_unit = "units/weapons/player/wpn_wh_repeater_crossbow_t1/wpn_wh_repeater_crossbow_t1",
			template = "repeating_crossbow_template_1",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_repeating_crossbow_skin_02",
		data = {
			description = "wh_repeating_crossbow_skin_02_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "wh_repeating_crossbow_skin_02_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_wh_repeater_crossbow_t2",
			left_hand_unit = "units/weapons/player/wpn_wh_repeater_crossbow_t2/wpn_wh_repeater_crossbow_t2",
			template = "repeating_crossbow_template_1",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_repeating_crossbow_skin_03",
		data = {
			description = "wh_repeating_crossbow_skin_03_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "wh_repeating_crossbow_skin_03_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_wh_repeater_crossbow_t3",
			left_hand_unit = "units/weapons/player/wpn_wh_repeater_crossbow_t3/wpn_wh_repeater_crossbow_t3",
			template = "repeating_crossbow_template_1",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_repeating_crossbow_skin_03_runed_01",
		data = {
			description = "wh_repeating_crossbow_skin_03_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "wh_repeating_crossbow_skin_03_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_wh_repeater_crossbow_t3",
			left_hand_unit = "units/weapons/player/wpn_wh_repeater_crossbow_t3/wpn_wh_repeater_crossbow_t3_runed_01",
			template = "repeating_crossbow_template_1",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "wh_repeating_crossbow_skin_03_runed_02",
		data = {
			description = "wh_repeating_crossbow_skin_03_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "wh_repeating_crossbow_skin_03_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_wh_repeater_crossbow_t3",
			left_hand_unit = "units/weapons/player/wpn_wh_repeater_crossbow_t3/wpn_wh_repeater_crossbow_t3_runed_01",
			template = "repeating_crossbow_template_1",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_fencing_sword",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_dagger_skin_01",
		data = {
			description = "bw_dagger_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_daggers",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_dagger_01",
			display_name = "bw_dagger_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_01/wpn_brw_dagger_01",
			template = "one_handed_daggers_template_1"
		}
	},
	{
		name = "bw_dagger_skin_02",
		data = {
			description = "bw_dagger_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_daggers",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_dagger_02",
			display_name = "bw_dagger_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_02/wpn_brw_dagger_02",
			template = "one_handed_daggers_template_1"
		}
	},
	{
		name = "bw_dagger_skin_03",
		data = {
			description = "bw_dagger_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_daggers",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_dagger_03",
			display_name = "bw_dagger_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_03/wpn_brw_dagger_03",
			template = "one_handed_daggers_template_1"
		}
	},
	{
		name = "bw_dagger_skin_03_runed_01",
		data = {
			description = "bw_dagger_skin_03_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_daggers",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_dagger_03",
			display_name = "bw_dagger_skin_03_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_03/wpn_brw_dagger_03_runed_01",
			template = "one_handed_daggers_template_1"
		}
	},
	{
		name = "bw_dagger_skin_04",
		data = {
			description = "bw_dagger_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_daggers",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_dagger_04",
			display_name = "bw_dagger_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_04/wpn_brw_dagger_04",
			template = "one_handed_daggers_template_1"
		}
	},
	{
		name = "bw_dagger_skin_04_runed_01",
		data = {
			description = "bw_dagger_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_daggers",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_dagger_04",
			display_name = "bw_dagger_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_04/wpn_brw_dagger_04_runed_01",
			template = "one_handed_daggers_template_1"
		}
	},
	{
		name = "bw_dagger_skin_05",
		data = {
			description = "bw_dagger_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_daggers",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_dagger_05",
			display_name = "bw_dagger_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_05/wpn_brw_dagger_05",
			template = "one_handed_daggers_template_1"
		}
	},
	{
		name = "bw_dagger_skin_05_runed_01",
		data = {
			description = "bw_dagger_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_daggers",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_dagger_05",
			display_name = "bw_dagger_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_05/wpn_brw_dagger_05_runed_01",
			template = "one_handed_daggers_template_1"
		}
	},
	{
		name = "bw_dagger_skin_05_runed_02",
		data = {
			description = "bw_dagger_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_05/wpn_brw_dagger_05_runed_01",
			hud_icon = "weapon_generic_icon_daggers",
			inventory_icon = "icon_wpn_brw_dagger_05",
			display_name = "bw_dagger_skin_05_runed_02_name",
			template = "one_handed_daggers_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_flamethrower_staff_skin_01",
		data = {
			description = "bw_flamethrower_staff_skin_01_description",
			rarity = "plentiful",
			display_name = "bw_flamethrower_staff_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_01/wpn_brw_flame_staff_01",
			inventory_icon = "icon_wpn_brw_flame_staff_01",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_flamethrower_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_flamethrower_staff_skin_02",
		data = {
			description = "bw_flamethrower_staff_skin_02_description",
			rarity = "common",
			display_name = "bw_flamethrower_staff_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_02/wpn_brw_flame_staff_02",
			inventory_icon = "icon_wpn_brw_flame_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_flamethrower_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_flamethrower_staff_skin_02_runed_01",
		data = {
			description = "bw_flamethrower_staff_skin_02_runed_01_description",
			rarity = "unique",
			display_name = "bw_flamethrower_staff_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_02/wpn_brw_flame_staff_02_runed_01",
			inventory_icon = "icon_wpn_brw_flame_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_flamethrower_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_flamethrower_staff_skin_03",
		data = {
			description = "bw_flamethrower_staff_skin_03_description",
			rarity = "rare",
			display_name = "bw_flamethrower_staff_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_03/wpn_brw_flame_staff_03",
			inventory_icon = "icon_wpn_brw_flame_staff_03",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_flamethrower_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_flamethrower_staff_skin_04",
		data = {
			description = "bw_flamethrower_staff_skin_04_description",
			rarity = "exotic",
			display_name = "bw_flamethrower_staff_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_04/wpn_brw_flame_staff_04",
			inventory_icon = "icon_wpn_brw_flame_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_flamethrower_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_flamethrower_staff_skin_05",
		data = {
			description = "bw_flamethrower_staff_skin_05_description",
			rarity = "unique",
			display_name = "bw_flamethrower_staff_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_05/wpn_brw_flame_staff_05",
			inventory_icon = "icon_wpn_brw_flame_staff_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_flamethrower_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_flamethrower_staff_skin_05_runed_01",
		data = {
			description = "bw_flamethrower_staff_skin_05_runed_01_description",
			rarity = "unique",
			display_name = "bw_flamethrower_staff_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_05/wpn_brw_flame_staff_05_runed_01",
			inventory_icon = "icon_wpn_brw_flame_staff_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_flamethrower_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_flamethrower_staff_skin_05_runed_02",
		data = {
			description = "bw_flamethrower_staff_skin_05_runed_02_description",
			rarity = "unique",
			display_name = "bw_flamethrower_staff_skin_05_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_05/wpn_brw_flame_staff_05_runed_01",
			inventory_icon = "icon_wpn_brw_flame_staff_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_flamethrower_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_1h_mace_skin_01",
		data = {
			description = "bw_1h_mace_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_mace_01",
			display_name = "bw_1h_mace_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_01/wpn_brw_mace_01",
			template = "one_handed_hammer_wizard_template_1"
		}
	},
	{
		name = "bw_1h_mace_skin_01_runed_01",
		data = {
			description = "bw_1h_mace_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_mace_01",
			display_name = "bw_1h_mace_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_01/wpn_brw_mace_01_runed_01",
			template = "one_handed_hammer_wizard_template_1"
		}
	},
	{
		name = "bw_1h_mace_skin_02",
		data = {
			description = "bw_1h_mace_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_mace_02",
			display_name = "bw_1h_mace_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_02/wpn_brw_mace_02",
			template = "one_handed_hammer_wizard_template_1"
		}
	},
	{
		name = "bw_1h_mace_skin_03",
		data = {
			description = "bw_1h_mace_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_mace_03",
			display_name = "bw_1h_mace_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_03/wpn_brw_mace_03",
			template = "one_handed_hammer_wizard_template_1"
		}
	},
	{
		name = "bw_1h_mace_skin_04",
		data = {
			description = "bw_1h_mace_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_mace_04",
			display_name = "bw_1h_mace_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_04/wpn_brw_mace_04",
			template = "one_handed_hammer_wizard_template_1"
		}
	},
	{
		name = "bw_1h_mace_skin_05",
		data = {
			description = "bw_1h_mace_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_mace_05",
			display_name = "bw_1h_mace_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_05/wpn_brw_mace_05",
			template = "one_handed_hammer_wizard_template_1"
		}
	},
	{
		name = "bw_1h_mace_skin_05_runed_01",
		data = {
			description = "bw_1h_mace_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_mace_05",
			display_name = "bw_1h_mace_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_05/wpn_brw_mace_05_runed_01",
			template = "one_handed_hammer_wizard_template_1"
		}
	},
	{
		name = "bw_1h_mace_skin_05_runed_02",
		data = {
			description = "bw_1h_mace_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_05/wpn_brw_mace_05_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_mace_05",
			display_name = "bw_1h_mace_skin_05_runed_02_name",
			template = "one_handed_hammer_wizard_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_spear_staff_skin_01",
		data = {
			description = "bw_spear_staff_skin_01_description",
			rarity = "plentiful",
			display_name = "bw_spear_staff_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_01/wpn_brw_spear_staff_01",
			inventory_icon = "icon_wpn_brw_spear_staff_01",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_spark_spear_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_spear_staff_skin_02",
		data = {
			description = "bw_spear_staff_skin_02_description",
			rarity = "common",
			display_name = "bw_spear_staff_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_02/wpn_brw_spear_staff_02",
			inventory_icon = "icon_wpn_brw_spear_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_spark_spear_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_spear_staff_skin_02_runed_01",
		data = {
			description = "bw_spear_staff_skin_02_runed_01_description",
			rarity = "unique",
			display_name = "bw_spear_staff_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_02/wpn_brw_spear_staff_02_runed_01",
			inventory_icon = "icon_wpn_brw_spear_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_spark_spear_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_spear_staff_skin_03",
		data = {
			description = "bw_spear_staff_skin_03_description",
			rarity = "rare",
			display_name = "bw_spear_staff_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_03/wpn_brw_spear_staff_03",
			inventory_icon = "icon_wpn_brw_spear_staff_03",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_spark_spear_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_spear_staff_skin_04",
		data = {
			description = "bw_spear_staff_skin_04_description",
			rarity = "exotic",
			display_name = "bw_spear_staff_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_04/wpn_brw_spear_staff_04",
			inventory_icon = "icon_wpn_brw_spear_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_spark_spear_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_spear_staff_skin_04_runed_01",
		data = {
			description = "bw_spear_staff_skin_04_runed_01_description",
			rarity = "unique",
			display_name = "bw_spear_staff_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_04/wpn_brw_spear_staff_04_runed_01",
			inventory_icon = "icon_wpn_brw_spear_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_spark_spear_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_spear_staff_skin_04_runed_02",
		data = {
			description = "bw_spear_staff_skin_04_runed_02_description",
			rarity = "unique",
			display_name = "bw_spear_staff_skin_04_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_04/wpn_brw_spear_staff_04_runed_01",
			inventory_icon = "icon_wpn_brw_spear_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_spark_spear_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_spear_staff_skin_05",
		data = {
			description = "bw_spear_staff_skin_05_description",
			rarity = "unique",
			display_name = "bw_spear_staff_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_05/wpn_brw_spear_staff_05",
			inventory_icon = "icon_wpn_brw_spear_staff_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_spark_spear_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_beam_staff_skin_01",
		data = {
			description = "bw_beam_staff_skin_01_description",
			rarity = "plentiful",
			display_name = "bw_beam_staff_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_01/wpn_brw_beam_staff_01",
			inventory_icon = "icon_wpn_brw_beam_staff_01",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_blast_beam_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_beam_staff_skin_02",
		data = {
			description = "bw_beam_staff_skin_02_description",
			rarity = "common",
			display_name = "bw_beam_staff_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_02/wpn_brw_beam_staff_02",
			inventory_icon = "icon_wpn_brw_beam_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_blast_beam_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_beam_staff_skin_03",
		data = {
			description = "bw_beam_staff_skin_03_description",
			rarity = "rare",
			display_name = "bw_beam_staff_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_03/wpn_brw_beam_staff_03",
			inventory_icon = "icon_wpn_brw_beam_staff_03",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_blast_beam_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_beam_staff_skin_04",
		data = {
			description = "bw_beam_staff_skin_04_description",
			rarity = "exotic",
			display_name = "bw_beam_staff_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_04/wpn_brw_beam_staff_04",
			inventory_icon = "icon_wpn_brw_beam_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_blast_beam_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_beam_staff_skin_04_runed_01",
		data = {
			description = "bw_beam_staff_skin_04_runed_01_description",
			rarity = "unique",
			display_name = "bw_beam_staff_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_04/wpn_brw_beam_staff_04_runed_01",
			inventory_icon = "icon_wpn_brw_beam_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_blast_beam_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_beam_staff_skin_05",
		data = {
			description = "bw_beam_staff_skin_05_description",
			rarity = "unique",
			display_name = "bw_beam_staff_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_05/wpn_brw_beam_staff_05",
			inventory_icon = "icon_wpn_brw_beam_staff_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_blast_beam_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_beam_staff_skin_05_runed_01",
		data = {
			description = "bw_beam_staff_skin_05_runed_01_description",
			rarity = "unique",
			display_name = "bw_beam_staff_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_05/wpn_brw_beam_staff_05_runed_01",
			inventory_icon = "icon_wpn_brw_beam_staff_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_blast_beam_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_beam_staff_skin_05_runed_02",
		data = {
			description = "bw_beam_staff_skin_05_runed_02_description",
			rarity = "unique",
			display_name = "bw_beam_staff_skin_05_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_05/wpn_brw_beam_staff_05_runed_01",
			inventory_icon = "icon_wpn_brw_beam_staff_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_blast_beam_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_fireball_staff_skin_01",
		data = {
			description = "bw_fireball_staff_skin_01_description",
			rarity = "common",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_02/wpn_brw_staff_02",
			display_name = "bw_fireball_staff_skin_01_name",
			inventory_icon = "icon_wpn_brw_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_fireball_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_fireball_staff_skin_01_runed_01",
		data = {
			description = "bw_fireball_staff_skin_01_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_02/wpn_brw_staff_02_runed_01",
			display_name = "bw_fireball_staff_skin_01_runed_01_name",
			inventory_icon = "icon_wpn_brw_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_fireball_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_fireball_staff_skin_01_runed_02",
		data = {
			description = "bw_fireball_staff_skin_01_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_02/wpn_brw_staff_02_runed_01",
			display_name = "bw_fireball_staff_skin_01_runed_02_name",
			inventory_icon = "icon_wpn_brw_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_fireball_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_fireball_staff_skin_02",
		data = {
			description = "bw_fireball_staff_skin_02_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_05/wpn_brw_staff_05",
			display_name = "bw_fireball_staff_skin_02_name",
			inventory_icon = "icon_wpn_brw_staff_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_fireball_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_conflagration_staff_skin_01",
		data = {
			description = "bw_conflagration_staff_skin_01_description",
			rarity = "common",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_03/wpn_brw_staff_03",
			display_name = "bw_conflagration_staff_skin_01_name",
			inventory_icon = "icon_wpn_brw_staff_03",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_geiser_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_conflagration_staff_skin_02",
		data = {
			description = "bw_conflagration_staff_skin_02_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_04/wpn_brw_staff_04",
			display_name = "bw_conflagration_staff_skin_02_name",
			inventory_icon = "icon_wpn_brw_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_geiser_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_conflagration_staff_skin_02_runed_01",
		data = {
			description = "bw_conflagration_staff_skin_02_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_04/wpn_brw_staff_04_runed_01",
			display_name = "bw_conflagration_staff_skin_02_runed_01_name",
			inventory_icon = "icon_wpn_brw_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_geiser_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff"
		}
	},
	{
		name = "bw_conflagration_staff_skin_02_runed_02",
		data = {
			description = "bw_conflagration_staff_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_04/wpn_brw_staff_04_runed_01",
			display_name = "bw_conflagration_staff_skin_02_runed_02_name",
			inventory_icon = "icon_wpn_brw_staff_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_geiser_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_1h_sword_skin_01",
		data = {
			description = "bw_1h_sword_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_01_t1",
			display_name = "bw_1h_sword_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t1/wpn_brw_sword_01_t1",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_01_runed_01",
		data = {
			description = "bw_1h_sword_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_01_t1",
			display_name = "bw_1h_sword_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t1/wpn_brw_sword_01_t1_runed_01",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_02",
		data = {
			description = "bw_1h_sword_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_01_t2",
			display_name = "bw_1h_sword_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t2/wpn_brw_sword_01_t2",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_02_runed_01",
		data = {
			description = "bw_1h_sword_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_01_t2",
			display_name = "bw_1h_sword_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t2/wpn_brw_sword_01_t2_runed_01",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_02_runed_02",
		data = {
			description = "bw_1h_sword_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t2/wpn_brw_sword_01_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_sword_01_t2",
			display_name = "bw_1h_sword_skin_02_runed_02_name",
			template = "one_handed_swords_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_1h_sword_skin_03",
		data = {
			description = "bw_1h_sword_skin_03_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_02_t1",
			display_name = "bw_1h_sword_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_02_t1/wpn_brw_sword_02_t1",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_04",
		data = {
			description = "bw_1h_sword_skin_04_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_02_t2",
			display_name = "bw_1h_sword_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_02_t2/wpn_brw_sword_02_t2",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_05",
		data = {
			description = "bw_1h_sword_skin_05_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_03_t1",
			display_name = "bw_1h_sword_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_03_t1/wpn_brw_sword_03_t1",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_06",
		data = {
			description = "bw_1h_sword_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_03_t2",
			display_name = "bw_1h_sword_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_03_t2/wpn_brw_sword_03_t2",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_07",
		data = {
			description = "bw_1h_sword_skin_07_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_04_t1",
			display_name = "bw_1h_sword_skin_07_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_04_t1/wpn_brw_sword_04_t1",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_sword_skin_08",
		data = {
			description = "bw_1h_sword_skin_08_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_sword_04_t2",
			display_name = "bw_1h_sword_skin_08_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_04_t2/wpn_brw_sword_04_t2",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_01",
		data = {
			description = "bw_1h_flaming_sword_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_01_t1",
			display_name = "bw_1h_flaming_sword_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t1/wpn_brw_flaming_sword_01_t1",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_01_runed_01",
		data = {
			description = "bw_1h_flaming_sword_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_01_t1",
			display_name = "bw_1h_flaming_sword_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t1/wpn_brw_flaming_sword_01_t1_runed_01",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_02",
		data = {
			description = "bw_1h_flaming_sword_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_01_t2",
			display_name = "bw_1h_flaming_sword_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t2/wpn_brw_flaming_sword_01_t2",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_02_runed_01",
		data = {
			description = "bw_1h_flaming_sword_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_01_t2",
			display_name = "bw_1h_flaming_sword_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t2/wpn_brw_flaming_sword_01_t2_runed_01",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_02_runed_02",
		data = {
			description = "bw_1h_flaming_sword_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t2/wpn_brw_flaming_sword_01_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_flaming_sword_01_t2",
			display_name = "bw_1h_flaming_sword_skin_02_runed_02_name",
			template = "flaming_sword_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_03",
		data = {
			description = "bw_1h_flaming_sword_skin_03_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_02_t1",
			display_name = "bw_1h_flaming_sword_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_02_t1/wpn_brw_flaming_sword_02_t1",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_04",
		data = {
			description = "bw_1h_flaming_sword_skin_04_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_02_t2",
			display_name = "bw_1h_flaming_sword_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_02_t2/wpn_brw_flaming_sword_02_t2",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_05",
		data = {
			description = "bw_1h_flaming_sword_skin_05_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_03_t1",
			display_name = "bw_1h_flaming_sword_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_03_t1/wpn_brw_flaming_sword_03_t1",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_06",
		data = {
			description = "bw_1h_flaming_sword_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_03_t2",
			display_name = "bw_1h_flaming_sword_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_03_t2/wpn_brw_flaming_sword_03_t2",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_07",
		data = {
			description = "bw_1h_flaming_sword_skin_07_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_04_t1",
			display_name = "bw_1h_flaming_sword_skin_07_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_04_t1/wpn_brw_flaming_sword_04_t1",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_08",
		data = {
			description = "bw_1h_flaming_sword_skin_08_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_brw_flaming_sword_04_t2",
			display_name = "bw_1h_flaming_sword_skin_08_name",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_04_t2/wpn_brw_flaming_sword_04_t2",
			template = "flaming_sword_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_01",
		data = {
			description = "dw_2h_axe_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_axe_01_t1",
			display_name = "dw_2h_axe_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_01_t1/wpn_dw_2h_axe_01_t1",
			template = "two_handed_axes_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_02",
		data = {
			description = "dw_2h_axe_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_axe_01_t2",
			display_name = "dw_2h_axe_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_01_t2/wpn_dw_2h_axe_01_t2",
			template = "two_handed_axes_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_03",
		data = {
			description = "dw_2h_axe_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_axe_02_t1",
			display_name = "dw_2h_axe_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_02_t1/wpn_dw_2h_axe_02_t1",
			template = "two_handed_axes_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_04",
		data = {
			description = "dw_2h_axe_skin_04_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_axe_02_t2",
			display_name = "dw_2h_axe_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_02_t2/wpn_dw_2h_axe_02_t2",
			template = "two_handed_axes_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_05",
		data = {
			description = "dw_2h_axe_skin_05_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_axe_02_t2",
			display_name = "dw_2h_axe_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_03_t1/wpn_dw_2h_axe_03_t1",
			template = "two_handed_axes_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_05_runed_01",
		data = {
			description = "dw_2h_axe_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_axe_02_t2",
			display_name = "dw_2h_axe_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_03_t1/wpn_dw_2h_axe_03_t1_runed_01",
			template = "two_handed_axes_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_06",
		data = {
			description = "dw_2h_axe_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_axe_02_t2",
			display_name = "dw_2h_axe_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_03_t2/wpn_dw_2h_axe_03_t2",
			template = "two_handed_axes_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_06_runed_01",
		data = {
			description = "dw_2h_axe_skin_06_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_axe_03_t2",
			display_name = "dw_2h_axe_skin_06_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_03_t2/wpn_dw_2h_axe_03_t2_runed_01",
			template = "two_handed_axes_template_1"
		}
	},
	{
		name = "dw_2h_axe_skin_06_runed_02",
		data = {
			description = "dw_2h_axe_skin_06_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_03_t2/wpn_dw_2h_axe_03_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_2h_axe_03_t2",
			display_name = "dw_2h_axe_skin_06_runed_02_name",
			template = "two_handed_axes_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_2h_hammer_skin_01",
		data = {
			description = "dw_2h_hammer_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_hammer_01_t1",
			display_name = "dw_2h_hammer_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_01_t1/wpn_dw_2h_hammer_01_t1",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "dw_2h_hammer_skin_01_runed_01",
		data = {
			description = "dw_2h_hammer_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_hammer_01_t1",
			display_name = "dw_2h_hammer_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_01_t1/wpn_dw_2h_hammer_01_t1_runed_01",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "dw_2h_hammer_skin_02",
		data = {
			description = "dw_2h_hammer_skin_02_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_hammer_01_t2",
			display_name = "dw_2h_hammer_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_01_t2/wpn_dw_2h_hammer_01_t2",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "dw_2h_hammer_skin_03",
		data = {
			description = "dw_2h_hammer_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_hammer_02_t1",
			display_name = "dw_2h_hammer_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_02_t1/wpn_dw_2h_hammer_02_t1",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "dw_2h_hammer_skin_04",
		data = {
			description = "dw_2h_hammer_skin_04_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_hammer_02_t2",
			display_name = "dw_2h_hammer_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_02_t2/wpn_dw_2h_hammer_02_t2",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "dw_2h_hammer_skin_04_runed_01",
		data = {
			description = "dw_2h_hammer_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_hammer_02_t2",
			display_name = "dw_2h_hammer_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_02_t2/wpn_dw_2h_hammer_02_t2_runed_01",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "dw_2h_hammer_skin_04_runed_02",
		data = {
			description = "dw_2h_hammer_skin_04_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_02_t2/wpn_dw_2h_hammer_02_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_2h_hammer_02_t2",
			display_name = "dw_2h_hammer_skin_04_runed_02_name",
			template = "two_handed_hammers_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_2h_hammer_skin_05",
		data = {
			description = "dw_2h_hammer_skin_05_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_hammer_03_t1",
			display_name = "dw_2h_hammer_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_03_t1/wpn_dw_2h_hammer_03_t1",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "dw_2h_hammer_skin_06",
		data = {
			description = "dw_2h_hammer_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_2h_hammer_03_t2",
			display_name = "dw_2h_hammer_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_03_t2/wpn_dw_2h_hammer_03_t2",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_01",
		data = {
			description = "dw_1h_axe_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_01_t1",
			display_name = "dw_1h_axe_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_01_t1/wpn_dw_axe_01_t1",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_02",
		data = {
			description = "dw_1h_axe_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_01_t2",
			display_name = "dw_1h_axe_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_01_t2/wpn_dw_axe_01_t2",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_03",
		data = {
			description = "dw_1h_axe_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_02_t1",
			display_name = "dw_1h_axe_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t1/wpn_dw_axe_02_t1",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_04",
		data = {
			description = "dw_1h_axe_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_02_t2",
			display_name = "dw_1h_axe_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_05",
		data = {
			description = "dw_1h_axe_skin_05_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_03_t1",
			display_name = "dw_1h_axe_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t1/wpn_dw_axe_03_t1",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_06",
		data = {
			description = "dw_1h_axe_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_03_t2",
			display_name = "dw_1h_axe_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_06_runed_01",
		data = {
			description = "dw_1h_axe_skin_06_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_03_t2",
			display_name = "dw_1h_axe_skin_06_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_06_runed_02",
		data = {
			description = "dw_1h_axe_skin_06_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_axe_03_t2",
			display_name = "dw_1h_axe_skin_06_runed_02_name",
			template = "one_hand_axe_shield_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_1h_axe_skin_07",
		data = {
			description = "dw_1h_axe_skin_07_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_04_t1",
			display_name = "dw_1h_axe_skin_07_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_04_t1/wpn_dw_axe_04_t1",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_1h_axe_skin_07_runed_01",
		data = {
			description = "dw_1h_axe_skin_07_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_axe_04_t1",
			display_name = "dw_1h_axe_skin_07_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_04_t1/wpn_dw_axe_04_t1_runed_01",
			template = "one_hand_axe_shield_template_1"
		}
	},
	{
		name = "dw_dual_axe_skin_01",
		data = {
			description = "dw_dual_axe_skin_01_description",
			rarity = "common",
			display_name = "dw_dual_axe_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_01_t1/wpn_dw_axe_01_t1",
			inventory_icon = "icon_wpn_dw_axe_01_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_01_t1/wpn_dw_axe_01_t1",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_dual_axe_skin_02",
		data = {
			description = "dw_dual_axe_skin_02_description",
			rarity = "exotic",
			display_name = "dw_dual_axe_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_01_t2/wpn_dw_axe_01_t2",
			inventory_icon = "icon_wpn_dw_axe_01_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_01_t2/wpn_dw_axe_01_t2",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_dual_axe_skin_03",
		data = {
			description = "dw_dual_axe_skin_03_description",
			rarity = "rare",
			display_name = "dw_dual_axe_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t1/wpn_dw_axe_02_t1",
			inventory_icon = "icon_wpn_dw_axe_02_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_02_t1/wpn_dw_axe_02_t1",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_dual_axe_skin_04",
		data = {
			description = "dw_dual_axe_skin_04_description",
			rarity = "exotic",
			display_name = "dw_dual_axe_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2",
			inventory_icon = "icon_wpn_dw_axe_02_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_dual_axe_skin_05",
		data = {
			description = "dw_dual_axe_skin_05_description",
			rarity = "plentiful",
			display_name = "dw_dual_axe_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t1/wpn_dw_axe_03_t1",
			inventory_icon = "icon_wpn_dw_axe_03_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_03_t1/wpn_dw_axe_03_t1",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_dual_axe_skin_06",
		data = {
			description = "dw_dual_axe_skin_06_description",
			rarity = "unique",
			display_name = "dw_dual_axe_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2",
			inventory_icon = "icon_wpn_dw_axe_03_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_dual_axe_skin_06_runed_01",
		data = {
			description = "dw_dual_axe_skin_06_runed_01_description",
			rarity = "unique",
			display_name = "dw_dual_axe_skin_06_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			inventory_icon = "icon_wpn_dw_axe_03_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_dual_axe_skin_06_runed_02",
		data = {
			description = "dw_dual_axe_skin_06_runed_02_description",
			rarity = "unique",
			display_name = "dw_dual_axe_skin_06_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			inventory_icon = "icon_wpn_dw_axe_03_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_dual_axe_skin_07",
		data = {
			description = "dw_dual_axe_skin_07_description",
			rarity = "rare",
			display_name = "dw_dual_axe_skin_07_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_04_t1/wpn_dw_axe_04_t1",
			inventory_icon = "icon_wpn_dw_axe_04_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_04_t1/wpn_dw_axe_04_t1",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_dual_axe_skin_07_runed_01",
		data = {
			description = "dw_dual_axe_skin_07_runed_01_description",
			rarity = "unique",
			display_name = "dw_dual_axe_skin_07_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_04_t1/wpn_dw_axe_04_t1_runed_01",
			inventory_icon = "icon_wpn_dw_axe_04_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_04_t1/wpn_dw_axe_04_t1_runed_01",
			template = "dual_wield_axes_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "dw_1h_axe_shield_skin_01",
		data = {
			description = "dw_1h_axe_shield_skin_01_description",
			rarity = "plentiful",
			display_name = "dw_1h_axe_shield_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_01_t1/wpn_dw_axe_01_t1",
			inventory_icon = "icon_wpn_dw_shield_01_axe",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_01_t1/wpn_dw_shield_01",
			template = "one_hand_axe_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_axe_shield_skin_02",
		data = {
			description = "dw_1h_axe_shield_skin_02_description",
			rarity = "common",
			display_name = "dw_1h_axe_shield_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_01_t2/wpn_dw_axe_01_t2",
			inventory_icon = "icon_wpn_dw_shield_02_axe",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_02_t1/wpn_dw_shield_02",
			template = "one_hand_axe_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_axe_shield_skin_02_runed_01",
		data = {
			description = "dw_1h_axe_shield_skin_02_runed_01_description",
			rarity = "unique",
			display_name = "dw_1h_axe_shield_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			inventory_icon = "icon_wpn_dw_shield_02_axe",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_02_t1/wpn_dw_shield_02_runed_01",
			template = "one_hand_axe_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_axe_shield_skin_03",
		data = {
			description = "dw_1h_axe_shield_skin_03_description",
			rarity = "rare",
			display_name = "dw_1h_axe_shield_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t1/wpn_dw_axe_02_t1",
			inventory_icon = "icon_wpn_dw_shield_03_axe",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_03_t1/wpn_dw_shield_03",
			template = "one_hand_axe_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_axe_shield_skin_04",
		data = {
			description = "dw_1h_axe_shield_skin_04_description",
			rarity = "exotic",
			display_name = "dw_1h_axe_shield_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2",
			inventory_icon = "icon_wpn_dw_shield_04_axe",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_04_t1/wpn_dw_shield_04",
			template = "one_hand_axe_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_axe_shield_skin_05",
		data = {
			description = "dw_1h_axe_shield_skin_05_description",
			rarity = "unique",
			display_name = "dw_1h_axe_shield_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t1/wpn_dw_axe_03_t1",
			inventory_icon = "icon_wpn_dw_shield_05_axe",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_05_t1/wpn_dw_shield_05",
			template = "one_hand_axe_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_axe_shield_skin_05_runed_01",
		data = {
			description = "dw_1h_axe_shield_skin_05_runed_01_description",
			rarity = "unique",
			display_name = "dw_1h_axe_shield_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			inventory_icon = "icon_wpn_dw_shield_05_axe",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_05_t1/wpn_dw_shield_05_runed_01",
			template = "one_hand_axe_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_axe_shield_skin_05_runed_02",
		data = {
			description = "dw_1h_axe_shield_skin_05_runed_02_description",
			rarity = "unique",
			display_name = "dw_1h_axe_shield_skin_05_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			inventory_icon = "icon_wpn_dw_shield_05_axe",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_05_t1/wpn_dw_shield_05_runed_01",
			template = "one_hand_axe_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_drake_pistol_skin_01",
		data = {
			description = "dw_drake_pistol_skin_01_description",
			rarity = "plentiful",
			display_name = "dw_drake_pistol_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_01_t1/wpn_dw_drake_pistol_01_t1",
			inventory_icon = "icon_wpn_dw_drake_pistol_01_t1",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_01_t1/wpn_dw_drake_pistol_01_t1",
			template = "brace_of_drakefirepistols_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "dw_drake_pistol_skin_02",
		data = {
			description = "dw_drake_pistol_skin_02_description",
			rarity = "rare",
			display_name = "dw_drake_pistol_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_01_t2/wpn_dw_drake_pistol_01_t2",
			inventory_icon = "icon_wpn_dw_drake_pistol_01_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_01_t2/wpn_dw_drake_pistol_01_t2",
			template = "brace_of_drakefirepistols_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "dw_drake_pistol_skin_03",
		data = {
			description = "dw_drake_pistol_skin_03_description",
			rarity = "common",
			display_name = "dw_drake_pistol_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t1/wpn_dw_drake_pistol_02_t1",
			inventory_icon = "icon_wpn_dw_drake_pistol_02_t1",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t1/wpn_dw_drake_pistol_02_t1",
			template = "brace_of_drakefirepistols_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "dw_drake_pistol_skin_03_runed_01",
		data = {
			description = "dw_drake_pistol_skin_03_runed_01_description",
			rarity = "unique",
			display_name = "dw_drake_pistol_skin_03_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t1/wpn_dw_drake_pistol_02_t1_runed_01",
			inventory_icon = "icon_wpn_dw_drake_pistol_02_t1",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t1/wpn_dw_drake_pistol_02_t1_runed_01",
			template = "brace_of_drakefirepistols_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "dw_drake_pistol_skin_04",
		data = {
			description = "dw_drake_pistol_skin_04_description",
			rarity = "exotic",
			display_name = "dw_drake_pistol_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t2/wpn_dw_drake_pistol_02_t2",
			inventory_icon = "icon_wpn_dw_drake_pistol_02_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t2/wpn_dw_drake_pistol_02_t2",
			template = "brace_of_drakefirepistols_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "dw_drake_pistol_skin_04_runed_01",
		data = {
			description = "dw_drake_pistol_skin_04_runed_01_description",
			rarity = "unique",
			display_name = "dw_drake_pistol_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t2/wpn_dw_drake_pistol_02_t2_runed_01",
			inventory_icon = "icon_wpn_dw_drake_pistol_02_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t2/wpn_dw_drake_pistol_02_t2_runed_01",
			template = "brace_of_drakefirepistols_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_pistols"
		}
	},
	{
		name = "dw_drake_pistol_skin_04_runed_02",
		data = {
			description = "dw_drake_pistol_skin_04_runed_02_description",
			rarity = "unique",
			display_name = "dw_drake_pistol_skin_04_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t2/wpn_dw_drake_pistol_02_t2_runed_01",
			inventory_icon = "icon_wpn_dw_drake_pistol_02_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t2/wpn_dw_drake_pistol_02_t2_runed_01",
			template = "brace_of_drakefirepistols_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_pistols",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_1h_hammer_skin_01",
		data = {
			description = "dw_1h_hammer_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_hammer_01_t1",
			display_name = "dw_1h_hammer_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_01_t1/wpn_dw_hammer_01_t1",
			template = "one_handed_hammer_template_2"
		}
	},
	{
		name = "dw_1h_hammer_skin_02",
		data = {
			description = "dw_1h_hammer_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_hammer_01_t2",
			display_name = "dw_1h_hammer_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_01_t2/wpn_dw_hammer_01_t2",
			template = "one_handed_hammer_template_2"
		}
	},
	{
		name = "dw_1h_hammer_skin_02_runed_01",
		data = {
			description = "dw_1h_hammer_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_hammer_01_t2",
			display_name = "dw_1h_hammer_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_01_t2/wpn_dw_hammer_01_t2_runed_01",
			template = "one_handed_hammer_template_2"
		}
	},
	{
		name = "dw_1h_hammer_skin_03",
		data = {
			description = "dw_1h_hammer_skin_03_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_hammer_02_t1",
			display_name = "dw_1h_hammer_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1",
			template = "one_handed_hammer_template_2"
		}
	},
	{
		name = "dw_1h_hammer_skin_04",
		data = {
			description = "dw_1h_hammer_skin_04_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_hammer_02_t2",
			display_name = "dw_1h_hammer_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t2/wpn_dw_hammer_02_t2",
			template = "one_handed_hammer_template_2"
		}
	},
	{
		name = "dw_1h_hammer_skin_04_runed_01",
		data = {
			description = "dw_1h_hammer_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_hammer_02_t2",
			display_name = "dw_1h_hammer_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t2/wpn_dw_hammer_02_t2_runed_01",
			template = "one_handed_hammer_template_2"
		}
	},
	{
		name = "dw_1h_hammer_skin_04_runed_02",
		data = {
			description = "dw_1h_hammer_skin_04_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t2/wpn_dw_hammer_02_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_hammer_02_t2",
			display_name = "dw_1h_hammer_skin_04_runed_02_name",
			template = "one_handed_hammer_template_2",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_1h_hammer_skin_05",
		data = {
			description = "dw_1h_hammer_skin_05_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_hammer_03_t1",
			display_name = "dw_1h_hammer_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_03_t1/wpn_dw_hammer_03_t1",
			template = "one_handed_hammer_template_2"
		}
	},
	{
		name = "dw_1h_hammer_skin_06",
		data = {
			description = "dw_1h_hammer_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_dw_hammer_03_t2",
			display_name = "dw_1h_hammer_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_03_t2/wpn_dw_hammer_03_t2",
			template = "one_handed_hammer_template_2"
		}
	},
	{
		name = "dw_1h_hammer_shield_skin_01",
		data = {
			description = "dw_1h_hammer_shield_skin_01_description",
			rarity = "plentiful",
			display_name = "dw_1h_hammer_shield_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_01_t1/wpn_dw_hammer_01_t1",
			inventory_icon = "icon_wpn_dw_shield_01_hammer",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_01_t1/wpn_dw_shield_01",
			template = "one_handed_hammer_shield_template_2",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_hammer_shield_skin_02",
		data = {
			description = "dw_1h_hammer_shield_skin_02_description",
			rarity = "common",
			display_name = "dw_1h_hammer_shield_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_01_t2/wpn_dw_hammer_01_t2",
			inventory_icon = "icon_wpn_dw_shield_02_hammer",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_02_t1/wpn_dw_shield_02",
			template = "one_handed_hammer_shield_template_2",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_hammer_shield_skin_02_runed_01",
		data = {
			description = "dw_1h_hammer_shield_skin_02_runed_01_description",
			rarity = "unique",
			display_name = "dw_1h_hammer_shield_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_01_t2/wpn_dw_hammer_01_t2_runed_01",
			inventory_icon = "icon_wpn_dw_shield_02_hammer",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_02_t1/wpn_dw_shield_02_runed_01",
			template = "one_handed_hammer_shield_template_2",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_hammer_shield_skin_03",
		data = {
			description = "dw_1h_hammer_shield_skin_03_description",
			rarity = "rare",
			display_name = "dw_1h_hammer_shield_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1",
			inventory_icon = "icon_wpn_dw_shield_03_hammer",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_03_t1/wpn_dw_shield_03",
			template = "one_handed_hammer_shield_template_2",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_hammer_shield_skin_04",
		data = {
			description = "dw_1h_hammer_shield_skin_04_description",
			rarity = "exotic",
			display_name = "dw_1h_hammer_shield_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t2/wpn_dw_hammer_02_t2",
			inventory_icon = "icon_wpn_dw_shield_04_hammer",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_04_t1/wpn_dw_shield_04",
			template = "one_handed_hammer_shield_template_2",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_hammer_shield_skin_04_runed_01",
		data = {
			description = "dw_1h_hammer_shield_skin_04_runed_01_description",
			rarity = "unique",
			display_name = "dw_1h_hammer_shield_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t2/wpn_dw_hammer_02_t2_runed_01",
			inventory_icon = "icon_wpn_dw_shield_06_hammer",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_05_t1/wpn_dw_shield_05_runed_01",
			template = "one_handed_hammer_shield_template_2",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_1h_hammer_shield_skin_04_runed_02",
		data = {
			description = "dw_1h_hammer_shield_skin_04_runed_02_description",
			rarity = "unique",
			display_name = "dw_1h_hammer_shield_skin_04_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t2/wpn_dw_hammer_02_t2_runed_01",
			inventory_icon = "icon_wpn_dw_shield_06_hammer",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_05_t1/wpn_dw_shield_05_runed_01",
			template = "one_handed_hammer_shield_template_2",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_1h_hammer_shield_skin_05",
		data = {
			description = "dw_1h_hammer_shield_skin_05_description",
			rarity = "unique",
			display_name = "dw_1h_hammer_shield_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_03_t1/wpn_dw_hammer_03_t1",
			inventory_icon = "icon_wpn_dw_shield_05_hammer",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_05_t1/wpn_dw_shield_05",
			template = "one_handed_hammer_shield_template_2",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "dw_handgun_skin_01",
		data = {
			description = "dw_handgun_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_handgun_01_t1",
			display_name = "dw_handgun_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_01_t1/wpn_dw_handgun_01_t1",
			template = "handgun_template_1"
		}
	},
	{
		name = "dw_handgun_skin_02",
		data = {
			description = "dw_handgun_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_handgun_01_t2",
			display_name = "dw_handgun_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_01_t2/wpn_dw_handgun_01_t2",
			template = "handgun_template_1"
		}
	},
	{
		name = "dw_handgun_skin_02_runed_01",
		data = {
			description = "dw_handgun_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_handgun_01_t2",
			display_name = "dw_handgun_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_01_t2/wpn_dw_handgun_01_t2_runed_01",
			template = "handgun_template_1"
		}
	},
	{
		name = "dw_handgun_skin_03",
		data = {
			description = "dw_handgun_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_handgun_02_t1",
			display_name = "dw_handgun_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_02_t1/wpn_dw_handgun_02_t1",
			template = "handgun_template_1"
		}
	},
	{
		name = "dw_handgun_skin_04",
		data = {
			description = "dw_handgun_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_handgun_02_t2",
			display_name = "dw_handgun_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_02_t2/wpn_dw_handgun_02_t2",
			template = "handgun_template_1"
		}
	},
	{
		name = "dw_handgun_skin_05",
		data = {
			description = "dw_handgun_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_handgun_02_t3",
			display_name = "dw_handgun_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_02_t3/wpn_dw_handgun_02_t3",
			template = "handgun_template_1"
		}
	},
	{
		name = "dw_handgun_skin_05_runed_01",
		data = {
			description = "dw_handgun_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_handgun_02_t3",
			display_name = "dw_handgun_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_02_t3/wpn_dw_handgun_02_t3_runed_01",
			template = "handgun_template_1"
		}
	},
	{
		name = "dw_handgun_skin_05_runed_02",
		data = {
			description = "dw_handgun_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_02_t3/wpn_dw_handgun_02_t3_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_handgun_02_t3",
			display_name = "dw_handgun_skin_05_runed_02_name",
			template = "handgun_template_1",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_drakegun_skin_01",
		data = {
			description = "dw_drakegun_skin_01_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_drakegun",
			inventory_icon = "icon_wpn_dw_iron_drake_01_t1",
			display_name = "dw_drakegun_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_01/wpn_dw_iron_drake_01_t1",
			template = "drakegun_template_1"
		}
	},
	{
		name = "dw_drakegun_skin_01_runed_01",
		data = {
			description = "dw_drakegun_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_drakegun",
			inventory_icon = "icon_wpn_dw_iron_drake_01_t1",
			display_name = "dw_drakegun_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_01/wpn_dw_iron_drake_01_t1_runed_01",
			template = "drakegun_template_1"
		}
	},
	{
		name = "dw_drakegun_skin_02",
		data = {
			description = "dw_drakegun_skin_02_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_drakegun",
			inventory_icon = "icon_wpn_dw_iron_drake_02",
			display_name = "dw_drakegun_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_02/wpn_dw_iron_drake_02",
			template = "drakegun_template_1"
		}
	},
	{
		name = "dw_drakegun_skin_03",
		data = {
			description = "dw_drakegun_skin_03_description",
			rarity = "exotic",
			hud_icon = "wrareeric_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_drakegun",
			inventory_icon = "icon_wpn_dw_iron_drake_03",
			display_name = "dw_drakegun_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_03/wpn_dw_iron_drake_03",
			template = "drakegun_template_1"
		}
	},
	{
		name = "dw_drakegun_skin_03_runed_01",
		data = {
			description = "dw_drakegun_skin_03_runed_01_description",
			rarity = "unique",
			hud_icon = "wrareeric_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_drakegun",
			inventory_icon = "icon_wpn_dw_iron_drake_03",
			display_name = "dw_drakegun_skin_03_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_03/wpn_dw_iron_drake_03_runed_01",
			template = "drakegun_template_1"
		}
	},
	{
		name = "dw_drakegun_skin_03_runed_02",
		data = {
			description = "dw_drakegun_skin_03_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_03/wpn_dw_iron_drake_03_runed_01",
			hud_icon = "wrareeric_icon_staff_3",
			inventory_icon = "icon_wpn_dw_iron_drake_03",
			display_name = "dw_drakegun_skin_03_runed_02_name",
			template = "drakegun_template_1",
			display_unit = "units/weapons/weapon_display/display_drakegun",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_2h_pick_skin_01",
		data = {
			description = "dw_2h_pick_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_pick_01_t1",
			display_name = "dw_2h_pick_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t1/wpn_dw_pick_01_t1",
			template = "two_handed_picks_template_1"
		}
	},
	{
		name = "dw_2h_pick_skin_02",
		data = {
			description = "dw_2h_pick_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_pick_01_t2",
			display_name = "dw_2h_pick_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t2/wpn_dw_pick_01_t2",
			template = "two_handed_picks_template_1"
		}
	},
	{
		name = "dw_2h_pick_skin_03",
		data = {
			description = "dw_2h_pick_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_pick_01_t3",
			display_name = "dw_2h_pick_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t3/wpn_dw_pick_01_t3",
			template = "two_handed_picks_template_1"
		}
	},
	{
		name = "dw_2h_pick_skin_03_runed_01",
		data = {
			description = "dw_2h_pick_skin_03_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_pick_01_t3",
			display_name = "dw_2h_pick_skin_03_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t3/wpn_dw_pick_01_t3_runed_01",
			template = "two_handed_picks_template_1"
		}
	},
	{
		name = "dw_2h_pick_skin_04",
		data = {
			description = "dw_2h_pick_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_pick_01_t4",
			display_name = "dw_2h_pick_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t4/wpn_dw_pick_01_t4",
			template = "two_handed_picks_template_1"
		}
	},
	{
		name = "dw_2h_pick_skin_04_runed_01",
		data = {
			description = "dw_2h_pick_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_dw_pick_01_t4",
			display_name = "dw_2h_pick_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t4/wpn_dw_pick_01_t4_runed_01",
			template = "two_handed_picks_template_1"
		}
	},
	{
		name = "dw_2h_pick_skin_04_runed_02",
		data = {
			description = "dw_2h_pick_skin_04_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t4/wpn_dw_pick_01_t4_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_pick_01_t4",
			display_name = "dw_2h_pick_skin_04_runed_02_name",
			template = "two_handed_picks_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_grudge_raker_skin_01",
		data = {
			description = "dw_grudge_raker_skin_01_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_rakegun_t1",
			display_name = "dw_grudge_raker_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_rakegun_t1/wpn_dw_rakegun_t1",
			template = "grudge_raker_template_1"
		}
	},
	{
		name = "dw_grudge_raker_skin_01_runed_01",
		data = {
			description = "dw_grudge_raker_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_rakegun_t1",
			display_name = "dw_grudge_raker_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_rakegun_t1/wpn_dw_rakegun_t1_runed_01",
			template = "grudge_raker_template_1"
		}
	},
	{
		name = "dw_grudge_raker_skin_02",
		data = {
			description = "dw_grudge_raker_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_rakegun_t2",
			display_name = "dw_grudge_raker_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_dw_rakegun_t2/wpn_dw_rakegun_t2",
			template = "grudge_raker_template_1"
		}
	},
	{
		name = "dw_grudge_raker_skin_02_runed_01",
		data = {
			description = "dw_grudge_raker_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_rakegun_t2",
			display_name = "dw_grudge_raker_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_dw_rakegun_t2/wpn_dw_rakegun_t2_runed_01",
			template = "grudge_raker_template_1"
		}
	},
	{
		name = "dw_grudge_raker_skin_02_runed_02",
		data = {
			description = "dw_grudge_raker_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_rakegun_t2/wpn_dw_rakegun_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_rakegun_t2",
			display_name = "dw_grudge_raker_skin_02_runed_02_name",
			template = "grudge_raker_template_1",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_grudge_raker_skin_03",
		data = {
			description = "dw_grudge_raker_skin_03_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_dw_rakegun_t3",
			display_name = "dw_grudge_raker_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_dw_rakegun_t3/wpn_dw_rakegun_t3",
			template = "grudge_raker_template_1"
		}
	},
	{
		name = "dw_crossbow_skin_01",
		data = {
			description = "dw_crossbow_skin_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "dw_crossbow_skin_01_name",
			rarity = "plentiful",
			inventory_icon = "icon_wpn_dw_xbox_01_t1",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_01_t1/wpn_dw_xbow_01_t1",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "dw_crossbow_skin_02",
		data = {
			description = "dw_crossbow_skin_02_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "dw_crossbow_skin_02_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_dw_xbox_01_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_01_t2/wpn_dw_xbow_01_t2",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "dw_crossbow_skin_02_runed_01",
		data = {
			description = "dw_crossbow_skin_02_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "dw_crossbow_skin_02_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_dw_xbox_01_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_01_t2/wpn_dw_xbow_01_t2_runed_01",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "dw_crossbow_skin_03",
		data = {
			description = "dw_crossbow_skin_03_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "dw_crossbow_skin_03_name",
			rarity = "common",
			inventory_icon = "icon_wpn_dw_xbox_02_t1",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_02_t1/wpn_dw_xbow_02_t1",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "dw_crossbow_skin_04",
		data = {
			description = "dw_crossbow_skin_04_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "dw_crossbow_skin_04_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_dw_xbox_02_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_02_t2/wpn_dw_xbow_02_t2",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "dw_crossbow_skin_04_runed_01",
		data = {
			description = "dw_crossbow_skin_04_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "dw_crossbow_skin_04_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_dw_xbox_02_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_02_t2/wpn_dw_xbow_02_t2_runed_01",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "dw_crossbow_skin_04_runed_02",
		data = {
			description = "dw_crossbow_skin_04_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "dw_crossbow_skin_04_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_dw_xbox_02_t2",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_02_t2/wpn_dw_xbow_02_t2_runed_01",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "dw_crossbow_skin_05",
		data = {
			description = "dw_crossbow_skin_05_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			display_name = "dw_crossbow_skin_05_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_dw_xbox_02_t3",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_02_t3/wpn_dw_xbow_02_t3",
			template = "crossbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "es_repeating_handgun_skin_01",
		data = {
			description = "es_repeating_handgun_skin_01_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_emp_handgun_repeater_t1",
			display_name = "es_repeating_handgun_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t1/wpn_emp_handgun_repeater_t1",
			template = "repeating_handgun_template_1"
		}
	},
	{
		name = "es_repeating_handgun_skin_02",
		data = {
			description = "es_repeating_handgun_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_emp_handgun_repeater_t2",
			display_name = "es_repeating_handgun_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t2/wpn_emp_handgun_repeater_t2",
			template = "repeating_handgun_template_1"
		}
	},
	{
		name = "es_repeating_handgun_skin_02_runed_01",
		data = {
			description = "es_repeating_handgun_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_emp_handgun_repeater_t2",
			display_name = "es_repeating_handgun_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t2/wpn_emp_handgun_repeater_t2_runed_01",
			template = "repeating_handgun_template_1"
		}
	},
	{
		name = "es_repeating_handgun_skin_03",
		data = {
			description = "es_repeating_handgun_skin_03_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_emp_handgun_repeater_t3",
			display_name = "es_repeating_handgun_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t3/wpn_emp_handgun_repeater_t3",
			template = "repeating_handgun_template_1"
		}
	},
	{
		name = "es_repeating_handgun_skin_03_runed_01",
		data = {
			description = "es_repeating_handgun_skin_03_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_emp_handgun_repeater_t3",
			display_name = "es_repeating_handgun_skin_03_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t3/wpn_emp_handgun_repeater_t3_runed_01",
			template = "repeating_handgun_template_1"
		}
	},
	{
		name = "es_repeating_handgun_skin_03_runed_02",
		data = {
			description = "es_repeating_handgun_skin_03_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t3/wpn_emp_handgun_repeater_t3_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_handgun_repeater_t3",
			display_name = "es_repeating_handgun_skin_03_runed_02_name",
			template = "repeating_handgun_template_1",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_1h_mace_skin_01",
		data = {
			description = "es_1h_mace_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_mace_02_t1",
			display_name = "es_1h_mace_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t1/wpn_emp_mace_02_t1",
			template = "one_handed_hammer_template_1"
		}
	},
	{
		name = "es_1h_mace_skin_02",
		data = {
			description = "es_1h_mace_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_mace_02_t2",
			display_name = "es_1h_mace_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t2/wpn_emp_mace_02_t2",
			template = "one_handed_hammer_template_1"
		}
	},
	{
		name = "es_1h_mace_skin_02_runed_01",
		data = {
			description = "es_1h_mace_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_mace_02_t2",
			display_name = "es_1h_mace_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t2/wpn_emp_mace_02_t2_runed_01",
			template = "one_handed_hammer_template_1"
		}
	},
	{
		name = "es_1h_mace_skin_02_runed_02",
		data = {
			description = "es_1h_mace_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t2/wpn_emp_mace_02_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_mace_02_t2",
			display_name = "es_1h_mace_skin_02_runed_02_name",
			template = "one_handed_hammer_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_1h_mace_skin_03",
		data = {
			description = "es_1h_mace_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_mace_02_t3",
			display_name = "es_1h_mace_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t3/wpn_emp_mace_02_t3",
			template = "one_handed_hammer_template_1"
		}
	},
	{
		name = "es_1h_mace_skin_04",
		data = {
			description = "es_1h_mace_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_mace_03_t1",
			display_name = "es_1h_mace_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_03_t1/wpn_emp_mace_03_t1",
			template = "one_handed_hammer_template_1"
		}
	},
	{
		name = "es_1h_mace_skin_05",
		data = {
			description = "es_1h_mace_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_mace_03_t2",
			display_name = "es_1h_mace_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_03_t2/wpn_emp_mace_03_t2",
			template = "one_handed_hammer_template_1"
		}
	},
	{
		name = "es_1h_mace_shield_skin_01",
		data = {
			description = "es_1h_mace_shield_skin_01_description",
			rarity = "rare",
			display_name = "es_1h_mace_shield_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t1/wpn_emp_mace_02_t1",
			inventory_icon = "icon_wpn_empire_shield_01_t1_mace",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_01_t1/wpn_emp_shield_01_t1",
			template = "one_handed_hammer_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_mace_shield_skin_02",
		data = {
			description = "es_1h_mace_shield_skin_02_description",
			rarity = "plentiful",
			display_name = "es_1h_mace_shield_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t2/wpn_emp_mace_02_t2",
			inventory_icon = "icon_wpn_empire_shield_02_mace",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02",
			template = "one_handed_hammer_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_mace_shield_skin_02_runed_01",
		data = {
			description = "es_1h_mace_shield_skin_02_runed_01_description",
			rarity = "unique",
			display_name = "es_1h_mace_shield_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t2/wpn_emp_mace_02_t2_runed_01",
			inventory_icon = "icon_wpn_empire_shield_02_mace",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02_runed_01",
			template = "one_handed_hammer_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_mace_shield_skin_03",
		data = {
			description = "es_1h_mace_shield_skin_03_description",
			rarity = "common",
			display_name = "es_1h_mace_shield_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t3/wpn_emp_mace_02_t3",
			inventory_icon = "icon_wpn_empire_shield_03_mace",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_03/wpn_emp_shield_03",
			template = "one_handed_hammer_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_mace_shield_skin_03_runed_01",
		data = {
			description = "es_1h_mace_shield_skin_03_runed_01_description",
			rarity = "unique",
			display_name = "es_1h_mace_shield_skin_03_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t2/wpn_emp_mace_02_t2_runed_01",
			inventory_icon = "icon_wpn_empire_shield_03_mace",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_03/wpn_emp_shield_03_runed_01",
			template = "one_handed_hammer_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_mace_shield_skin_03_runed_02",
		data = {
			description = "es_1h_mace_shield_skin_03_runed_02_description",
			rarity = "unique",
			display_name = "es_1h_mace_shield_skin_03_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t2/wpn_emp_mace_02_t2_runed_01",
			inventory_icon = "icon_wpn_empire_shield_03_mace",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_03/wpn_emp_shield_03_runed_01",
			template = "one_handed_hammer_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_1h_mace_shield_skin_04",
		data = {
			description = "es_1h_mace_shield_skin_04_description",
			rarity = "exotic",
			display_name = "es_1h_mace_shield_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_03_t1/wpn_emp_mace_03_t1",
			inventory_icon = "icon_wpn_empire_shield_04_mace",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_04/wpn_emp_shield_04",
			template = "one_handed_hammer_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_mace_shield_skin_05",
		data = {
			description = "es_1h_mace_shield_skin_05_description",
			rarity = "unique",
			display_name = "es_1h_mace_shield_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_03_t2/wpn_emp_mace_03_t2",
			inventory_icon = "icon_wpn_empire_shield_05_mace",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_05/wpn_emp_shield_05",
			template = "one_handed_hammer_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_sword_skin_01",
		data = {
			description = "es_1h_sword_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_02_t1",
			display_name = "es_1h_sword_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t1/wpn_emp_sword_02_t1",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "es_1h_sword_skin_01_runed_01",
		data = {
			description = "es_1h_sword_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_02_t1",
			display_name = "es_1h_sword_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t1/wpn_emp_sword_02_t1_runed_01",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "es_1h_sword_skin_01_runed_02",
		data = {
			description = "es_1h_sword_skin_01_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t1/wpn_emp_sword_02_t1_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_sword_02_t1",
			display_name = "es_1h_sword_skin_01_runed_02_name",
			template = "one_handed_swords_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_1h_sword_skin_02",
		data = {
			description = "es_1h_sword_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_02_t2",
			display_name = "es_1h_sword_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t2/wpn_emp_sword_02_t2",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "es_1h_sword_skin_02_runed_01",
		data = {
			description = "es_1h_sword_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_02_t2",
			display_name = "es_1h_sword_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t2/wpn_emp_sword_02_t2_runed_01",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "es_1h_sword_skin_03",
		data = {
			description = "es_1h_sword_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_03_t1",
			display_name = "es_1h_sword_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_03_t1/wpn_emp_sword_03_t1",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "es_1h_sword_skin_04",
		data = {
			description = "es_1h_sword_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_emp_sword_03_t2",
			display_name = "es_1h_sword_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_03_t2/wpn_emp_sword_03_t2",
			template = "one_handed_swords_template_1"
		}
	},
	{
		name = "es_1h_sword_shield_skin_01",
		data = {
			description = "es_1h_sword_shield_skin_01_description",
			rarity = "rare",
			display_name = "es_1h_sword_shield_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t1/wpn_emp_sword_02_t1",
			inventory_icon = "icon_wpn_empire_shield_01_t1_sword",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_01_t1/wpn_emp_shield_01_t1",
			template = "one_handed_sword_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_sword_shield_skin_02",
		data = {
			description = "es_1h_sword_shield_skin_02_description",
			rarity = "plentiful",
			display_name = "es_1h_sword_shield_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t2/wpn_emp_sword_02_t2",
			inventory_icon = "icon_wpn_empire_shield_02_sword",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02",
			template = "one_handed_sword_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_sword_shield_skin_02_runed_01",
		data = {
			description = "es_1h_sword_shield_skin_02_runed_01_description",
			rarity = "unique",
			display_name = "es_1h_sword_shield_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t2/wpn_emp_sword_02_t2_runed_01",
			inventory_icon = "icon_wpn_empire_shield_02_sword",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02_runed_01",
			template = "one_handed_sword_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_sword_shield_skin_03",
		data = {
			description = "es_1h_sword_shield_skin_03_description",
			rarity = "common",
			display_name = "es_1h_sword_shield_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_03_t1/wpn_emp_sword_03_t1",
			inventory_icon = "icon_wpn_empire_shield_03_sword",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_03/wpn_emp_shield_03",
			template = "one_handed_sword_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_sword_shield_skin_03_runed_01",
		data = {
			description = "es_1h_sword_shield_skin_03_runed_01_description",
			rarity = "unique",
			display_name = "es_1h_sword_shield_skin_03_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t2/wpn_emp_sword_02_t2_runed_01",
			inventory_icon = "icon_wpn_empire_shield_03_sword",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_03/wpn_emp_shield_03_runed_01",
			template = "one_handed_sword_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_sword_shield_skin_03_runed_02",
		data = {
			description = "es_1h_sword_shield_skin_03_runed_02_description",
			rarity = "unique",
			display_name = "es_1h_sword_shield_skin_03_runed_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t2/wpn_emp_sword_02_t2_runed_01",
			inventory_icon = "icon_wpn_empire_shield_03_sword",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_03/wpn_emp_shield_03_runed_01",
			template = "one_handed_sword_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_1h_sword_shield_skin_04",
		data = {
			description = "es_1h_sword_shield_skin_04_description",
			rarity = "exotic",
			display_name = "es_1h_sword_shield_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_03_t2/wpn_emp_sword_03_t2",
			inventory_icon = "icon_wpn_empire_shield_04_sword",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_04/wpn_emp_shield_04",
			template = "one_handed_sword_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_1h_sword_shield_skin_05",
		data = {
			description = "es_1h_sword_shield_skin_05_description",
			rarity = "unique",
			display_name = "es_1h_sword_shield_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_03_t2/wpn_emp_sword_03_t2",
			inventory_icon = "icon_wpn_empire_shield_05_sword",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_05/wpn_emp_shield_05",
			template = "one_handed_sword_shield_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_shield"
		}
	},
	{
		name = "es_2h_sword_exe_skin_01",
		data = {
			description = "es_2h_sword_exe_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_emp_sword_exe_01_t1",
			display_name = "es_2h_sword_exe_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_01_t1/wpn_emp_sword_exe_01_t1",
			template = "two_handed_swords_executioner_template_1"
		}
	},
	{
		name = "es_2h_sword_exe_skin_02",
		data = {
			description = "es_2h_sword_exe_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_emp_sword_exe_02_t1",
			display_name = "es_2h_sword_exe_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_02_t1/wpn_emp_sword_exe_02_t1",
			template = "two_handed_swords_executioner_template_1"
		}
	},
	{
		name = "es_2h_sword_exe_skin_03",
		data = {
			description = "es_2h_sword_exe_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_emp_sword_exe_03_t1",
			display_name = "es_2h_sword_exe_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_03_t1/wpn_emp_sword_exe_03_t1",
			template = "two_handed_swords_executioner_template_1"
		}
	},
	{
		name = "es_2h_sword_exe_skin_04",
		data = {
			description = "es_2h_sword_exe_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_emp_sword_exe_04_t1",
			display_name = "es_2h_sword_exe_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_04_t1/wpn_emp_sword_exe_04_t1",
			template = "two_handed_swords_executioner_template_1"
		}
	},
	{
		name = "es_2h_sword_exe_skin_04_runed_01",
		data = {
			description = "es_2h_sword_exe_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_emp_sword_exe_04_t1",
			display_name = "es_2h_sword_exe_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_04_t1/wpn_emp_sword_exe_04_t1_runed_01",
			template = "two_handed_swords_executioner_template_1"
		}
	},
	{
		name = "es_2h_sword_exe_skin_05",
		data = {
			description = "es_2h_sword_exe_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_emp_sword_exe_05_t1",
			display_name = "es_2h_sword_exe_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_05_t1/wpn_emp_sword_exe_05_t1",
			template = "two_handed_swords_executioner_template_1"
		}
	},
	{
		name = "es_2h_sword_exe_skin_05_runed_01",
		data = {
			description = "es_2h_sword_exe_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_emp_sword_exe_05_t1",
			display_name = "es_2h_sword_exe_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_05_t1/wpn_emp_sword_exe_05_t1_runed_01",
			template = "two_handed_swords_executioner_template_1"
		}
	},
	{
		name = "es_2h_sword_exe_skin_05_runed_02",
		data = {
			description = "es_2h_sword_exe_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_05_t1/wpn_emp_sword_exe_05_t1_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_sword_exe_05_t1",
			display_name = "es_2h_sword_exe_skin_05_runed_02_name",
			template = "two_handed_swords_executioner_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_2h_hammer_skin_01",
		data = {
			description = "es_2h_hammer_skin_01_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_hammer_01_t1",
			display_name = "es_2h_hammer_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_01_t1/wpn_2h_hammer_01_t1",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "es_2h_hammer_skin_02",
		data = {
			description = "es_2h_hammer_skin_02_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_hammer_01_t2",
			display_name = "es_2h_hammer_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_01_t2/wpn_2h_hammer_01_t2",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "es_2h_hammer_skin_03",
		data = {
			description = "es_2h_hammer_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_hammer_02_t1",
			display_name = "es_2h_hammer_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_02_t1/wpn_2h_hammer_02_t1",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "es_2h_hammer_skin_04",
		data = {
			description = "es_2h_hammer_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_hammer_02_t2",
			display_name = "es_2h_hammer_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_02_t2/wpn_2h_hammer_02_t2",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "es_2h_hammer_skin_04_runed_01",
		data = {
			description = "es_2h_hammer_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_hammer_02_t2",
			display_name = "es_2h_hammer_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_02_t2/wpn_2h_hammer_02_t2_runed_01",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "es_2h_hammer_skin_04_runed_02",
		data = {
			description = "es_2h_hammer_skin_04_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_02_t2/wpn_2h_hammer_02_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_empire_2h_hammer_02_t2",
			display_name = "es_2h_hammer_skin_04_runed_02_name",
			template = "two_handed_hammers_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_2h_hammer_skin_05",
		data = {
			description = "es_2h_hammer_skin_05_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_hammer_03_t1",
			display_name = "es_2h_hammer_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_03_t1/wpn_2h_hammer_03_t1",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "es_2h_hammer_skin_06",
		data = {
			description = "es_2h_hammer_skin_06_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_hammer_03_t2",
			display_name = "es_2h_hammer_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_03_t2/wpn_2h_hammer_03_t2",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "es_2h_hammer_skin_06_runed_01",
		data = {
			description = "es_2h_hammer_skin_06_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_hammer_03_t2",
			display_name = "es_2h_hammer_skin_06_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_03_t2/wpn_2h_hammer_03_t2_runed_01",
			template = "two_handed_hammers_template_1"
		}
	},
	{
		name = "es_2h_sword_skin_01",
		data = {
			description = "es_2h_sword_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_01_t1",
			display_name = "es_2h_sword_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_01_t1/wpn_2h_sword_01_t1",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "es_2h_sword_skin_02",
		data = {
			description = "es_2h_sword_skin_02_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_01_t2",
			display_name = "es_2h_sword_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_01_t2/wpn_2h_sword_01_t2",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "es_2h_sword_skin_02_runed_01",
		data = {
			description = "es_2h_sword_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_01_t2",
			display_name = "es_2h_sword_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_01_t2/wpn_2h_sword_01_t2_runed_01",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "es_2h_sword_skin_03",
		data = {
			description = "es_2h_sword_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_03_t1",
			display_name = "es_2h_sword_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_03_t1/wpn_2h_sword_03_t1",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "es_2h_sword_skin_04",
		data = {
			description = "es_2h_sword_skin_04_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_03_t2",
			display_name = "es_2h_sword_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_03_t2/wpn_2h_sword_03_t2",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "es_2h_sword_skin_04_runed_01",
		data = {
			description = "es_2h_sword_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_03_t2",
			display_name = "es_2h_sword_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_03_t2/wpn_2h_sword_03_t2_runed_01",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "es_2h_sword_skin_04_runed_02",
		data = {
			description = "es_2h_sword_skin_04_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_03_t2/wpn_2h_sword_03_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_empire_2h_sword_03_t2",
			display_name = "es_2h_sword_skin_04_runed_02_name",
			template = "two_handed_swords_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_2h_sword_skin_05",
		data = {
			description = "es_2h_sword_skin_05_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_empire_2h_sword_04_t1",
			display_name = "es_2h_sword_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_04_t1/wpn_2h_sword_04_t1",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "es_2h_sword_skin_06",
		data = {
			description = "es_2h_sword_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_greatsword",
			display_name = "es_2h_sword_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_greatsword/wpn_greatsword",
			template = "two_handed_swords_template_1"
		}
	},
	{
		name = "es_blunderbuss_skin_01",
		data = {
			description = "es_blunderbuss_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_blunderbuss_02_t1",
			display_name = "es_blunderbuss_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_02_t1/wpn_empire_blunderbuss_02_t1",
			template = "blunderbuss_template_1"
		}
	},
	{
		name = "es_blunderbuss_skin_02",
		data = {
			description = "es_blunderbuss_skin_02_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_blunderbuss_02_t2",
			display_name = "es_blunderbuss_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_02_t2/wpn_empire_blunderbuss_02_t2",
			template = "blunderbuss_template_1"
		}
	},
	{
		name = "es_blunderbuss_skin_02_runed_01",
		data = {
			description = "es_blunderbuss_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_blunderbuss_02_t2",
			display_name = "es_blunderbuss_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_02_t2/wpn_empire_blunderbuss_02_t2_runed_01",
			template = "blunderbuss_template_1"
		}
	},
	{
		name = "es_blunderbuss_skin_02_runed_02",
		data = {
			description = "es_blunderbuss_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_02_t2/wpn_empire_blunderbuss_02_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_empire_blunderbuss_02_t2",
			display_name = "es_blunderbuss_skin_02_runed_02_name",
			template = "blunderbuss_template_1",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_blunderbuss_skin_03",
		data = {
			description = "es_blunderbuss_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_blunderbuss_t1",
			display_name = "es_blunderbuss_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_t1/wpn_empire_blunderbuss_t1",
			template = "blunderbuss_template_1"
		}
	},
	{
		name = "es_blunderbuss_skin_04",
		data = {
			description = "es_blunderbuss_skin_04_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_blunderbuss_t2",
			display_name = "es_blunderbuss_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_t2/wpn_empire_blunderbuss_t2",
			template = "blunderbuss_template_1"
		}
	},
	{
		name = "es_blunderbuss_skin_04_runed_01",
		data = {
			description = "es_blunderbuss_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_blunderbuss_t2",
			display_name = "es_blunderbuss_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_t2/wpn_empire_blunderbuss_t2_runed_01",
			template = "blunderbuss_template_1"
		}
	},
	{
		name = "es_blunderbuss_skin_05",
		data = {
			description = "es_blunderbuss_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_blunderbuss_t3",
			display_name = "es_blunderbuss_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_t3/wpn_empire_blunderbuss_t3",
			template = "blunderbuss_template_1"
		}
	},
	{
		name = "es_longbow_skin_01",
		data = {
			description = "es_longbow_skin_01_description",
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			display_name = "es_longbow_skin_01_name",
			rarity = "plentiful",
			inventory_icon = "icon_wpn_emp_bow_01",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_01/wpn_emp_bow_01",
			template = "longbow_empire_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "es_longbow_skin_02",
		data = {
			description = "es_longbow_skin_02_description",
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			display_name = "es_longbow_skin_02_name",
			rarity = "common",
			inventory_icon = "icon_wpn_emp_bow_02",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_02/wpn_emp_bow_02",
			template = "longbow_empire_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "es_longbow_skin_03",
		data = {
			description = "es_longbow_skin_03_description",
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			display_name = "es_longbow_skin_03_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_emp_bow_03",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_03/wpn_emp_bow_03",
			template = "longbow_empire_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "es_longbow_skin_04",
		data = {
			description = "es_longbow_skin_04_description",
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			display_name = "es_longbow_skin_04_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_emp_bow_04",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_04/wpn_emp_bow_04",
			template = "longbow_empire_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "es_longbow_skin_04_runed_01",
		data = {
			description = "es_longbow_skin_04_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			display_name = "es_longbow_skin_04_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_emp_bow_04",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_04/wpn_emp_bow_04_runed_01",
			template = "longbow_empire_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "es_longbow_skin_05",
		data = {
			description = "es_longbow_skin_05_description",
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			display_name = "es_longbow_skin_05_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_emp_bow_05",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_05/wpn_emp_bow_05",
			template = "longbow_empire_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "es_longbow_skin_05_runed_01",
		data = {
			description = "es_longbow_skin_05_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			display_name = "es_longbow_skin_05_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_emp_bow_05",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_05/wpn_emp_bow_05_runed_01",
			template = "longbow_empire_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "es_longbow_skin_05_runed_02",
		data = {
			description = "es_longbow_skin_05_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			display_name = "es_longbow_skin_05_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_emp_bow_05",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_05/wpn_emp_bow_05_runed_01",
			template = "longbow_empire_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_handgun_skin_01",
		data = {
			description = "es_handgun_skin_01_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_handgun_02_t1",
			display_name = "es_handgun_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_02_t1/wpn_empire_handgun_02_t1",
			template = "handgun_template_1"
		}
	},
	{
		name = "es_handgun_skin_01_runed_01",
		data = {
			description = "es_handgun_skin_01_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_handgun_02_t1",
			display_name = "es_handgun_skin_01_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_02_t1/wpn_empire_handgun_02_t1_runed_01",
			template = "handgun_template_1"
		}
	},
	{
		name = "es_handgun_skin_02",
		data = {
			description = "es_handgun_skin_02_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_handgun_02_t2",
			display_name = "es_handgun_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2",
			template = "handgun_template_1"
		}
	},
	{
		name = "es_handgun_skin_02_runed_01",
		data = {
			description = "es_handgun_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_handgun_02_t2",
			display_name = "es_handgun_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2_runed_01",
			template = "handgun_template_1"
		}
	},
	{
		name = "es_handgun_skin_02_runed_02",
		data = {
			description = "es_handgun_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_empire_handgun_02_t2",
			display_name = "es_handgun_skin_02_runed_02_name",
			template = "handgun_template_1",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "es_handgun_skin_03",
		data = {
			description = "es_handgun_skin_03_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_handgun_t1",
			display_name = "es_handgun_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_t1/wpn_empire_handgun_t1",
			template = "handgun_template_1"
		}
	},
	{
		name = "es_handgun_skin_04",
		data = {
			description = "es_handgun_skin_04_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_handgun_t2",
			display_name = "es_handgun_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_t2/wpn_empire_handgun_t2",
			template = "handgun_template_1"
		}
	},
	{
		name = "es_handgun_skin_05",
		data = {
			description = "es_handgun_skin_05_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			inventory_icon = "icon_wpn_empire_handgun_t3",
			display_name = "es_handgun_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_t3/wpn_empire_handgun_t3",
			template = "handgun_template_1"
		}
	},
	{
		name = "es_halberd_skin_01",
		data = {
			description = "es_halberd_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_wh_halberd_01",
			display_name = "es_halberd_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_wh_halberd_01/wpn_wh_halberd_01",
			template = "two_handed_halberds_template_1"
		}
	},
	{
		name = "es_halberd_skin_02",
		data = {
			description = "es_halberd_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_wh_halberd_02",
			display_name = "es_halberd_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_wh_halberd_02/wpn_wh_halberd_02",
			template = "two_handed_halberds_template_1"
		}
	},
	{
		name = "es_halberd_skin_03",
		data = {
			description = "es_halberd_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_wh_halberd_03",
			display_name = "es_halberd_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_wh_halberd_03/wpn_wh_halberd_03",
			template = "two_handed_halberds_template_1"
		}
	},
	{
		name = "es_halberd_skin_04",
		data = {
			description = "es_halberd_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_wh_halberd_04",
			display_name = "es_halberd_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_wh_halberd_04/wpn_wh_halberd_04",
			template = "two_handed_halberds_template_1"
		}
	},
	{
		name = "es_halberd_skin_04_runed_01",
		data = {
			description = "es_halberd_skin_04_runed_01_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_wh_halberd_04",
			display_name = "es_halberd_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_wh_halberd_04/wpn_wh_halberd_04_runed_01",
			template = "two_handed_halberds_template_1"
		}
	},
	{
		name = "es_halberd_skin_04_runed_02",
		data = {
			description = "es_halberd_skin_04_runed_02_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_wh_halberd_04/wpn_wh_halberd_04_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_wh_halberd_04",
			display_name = "es_halberd_skin_04_runed_02_name",
			template = "two_handed_halberds_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_2h_axe_skin_01",
		data = {
			description = "we_2h_axe_skin_07_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_01_t1",
			display_name = "we_2h_axe_skin_07_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_01_t1/wpn_we_2h_axe_01_t1",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_02",
		data = {
			description = "we_2h_axe_skin_02_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_01_t2",
			display_name = "we_2h_axe_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_01_t2/wpn_we_2h_axe_01_t2",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_03",
		data = {
			description = "we_2h_axe_skin_03_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_02_t1",
			display_name = "we_2h_axe_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_02_t1/wpn_we_2h_axe_02_t1",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_04",
		data = {
			description = "we_2h_axe_skin_04_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_02_t2",
			display_name = "we_2h_axe_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_02_t2/wpn_we_2h_axe_02_t2",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_05",
		data = {
			description = "we_2h_axe_skin_05_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_03_t1",
			display_name = "we_2h_axe_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_03_t1/wpn_we_2h_axe_03_t1",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_05_runed_01",
		data = {
			description = "we_2h_axe_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_03_t1",
			display_name = "we_2h_axe_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_03_t1/wpn_we_2h_axe_03_t1_runed_01",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_05_runed_02",
		data = {
			description = "we_2h_axe_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_03_t1/wpn_we_2h_axe_03_t1_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_2h_axe_03_t1",
			display_name = "we_2h_axe_skin_05_runed_02_name",
			template = "two_handed_axes_template_2",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_2h_axe_skin_06",
		data = {
			description = "we_2h_axe_skin_06_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_03_t2",
			display_name = "we_2h_axe_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_03_t2/wpn_we_2h_axe_03_t2",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_07",
		data = {
			description = "we_2h_axe_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_04_t1",
			display_name = "we_2h_axe_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_04_t1/wpn_we_2h_axe_04_t1",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_07_runed_01",
		data = {
			description = "we_2h_axe_skin_07_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_04_t1",
			display_name = "we_2h_axe_skin_07_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_04_t1/wpn_we_2h_axe_04_t1_runed_01",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_axe_skin_08",
		data = {
			description = "we_2h_axe_skin_08_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_axe_04_t2",
			display_name = "we_2h_axe_skin_08_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_04_t2/wpn_we_2h_axe_04_t2",
			template = "two_handed_axes_template_2"
		}
	},
	{
		name = "we_2h_sword_skin_01",
		data = {
			description = "we_2h_sword_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_01_t1",
			display_name = "we_2h_sword_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_01_t1/wpn_we_2h_sword_01_t1",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_02",
		data = {
			description = "we_2h_sword_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_01_t2",
			display_name = "we_2h_sword_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_01_t2/wpn_we_2h_sword_01_t2",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_03",
		data = {
			description = "we_2h_sword_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_02_t1",
			display_name = "we_2h_sword_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_02_t1/wpn_we_2h_sword_02_t1",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_04",
		data = {
			description = "we_2h_sword_skin_04_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_02_t2",
			display_name = "we_2h_sword_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_02_t2/wpn_we_2h_sword_02_t2",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_05",
		data = {
			description = "we_2h_sword_skin_05_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_03_t1",
			display_name = "we_2h_sword_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_03_t1/wpn_we_2h_sword_03_t1",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_05_runed_01",
		data = {
			description = "we_2h_sword_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_03_t1",
			display_name = "we_2h_sword_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_03_t1/wpn_we_2h_sword_03_t1_runed_01",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_06",
		data = {
			description = "we_2h_sword_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_03_t2",
			display_name = "we_2h_sword_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_03_t2/wpn_we_2h_sword_03_t2",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_06_runed_01",
		data = {
			description = "we_2h_sword_skin_06_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_03_t2",
			display_name = "we_2h_sword_skin_06_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_03_t2/wpn_we_2h_sword_03_t2_runed_01",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_06_runed_02",
		data = {
			description = "we_2h_sword_skin_06_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_03_t2/wpn_we_2h_sword_03_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_2h_sword_03_t2",
			display_name = "we_2h_sword_skin_06_runed_02_name",
			template = "two_handed_swords_wood_elf_template",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_2h_sword_skin_07",
		data = {
			description = "we_2h_sword_skin_07_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_04_t1",
			display_name = "we_2h_sword_skin_07_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_04_t1/wpn_we_2h_sword_04_t1",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_08",
		data = {
			description = "we_2h_sword_skin_08_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_04_t2",
			display_name = "we_2h_sword_skin_08_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_04_t2/wpn_we_2h_sword_04_t2",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_09",
		data = {
			description = "we_2h_sword_skin_09_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_05_t1",
			display_name = "we_2h_sword_skin_09_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_05_t1/wpn_we_2h_sword_05_t1",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_2h_sword_skin_10",
		data = {
			description = "we_2h_sword_skin_10_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_2h_sword_05_t2",
			display_name = "we_2h_sword_skin_10_name",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_05_t2/wpn_we_2h_sword_05_t2",
			template = "two_handed_swords_wood_elf_template"
		}
	},
	{
		name = "we_crossbow_skin_01",
		data = {
			description = "we_crossbow_skin_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "we_crossbow_skin_01_name",
			rarity = "common",
			inventory_icon = "icon_wpn_we_repeater_crossbow_t1",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t1/wpn_we_repeater_crossbow_t1",
			template = "repeating_crossbow_elf_template",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "we_crossbow_skin_02",
		data = {
			description = "we_crossbow_skin_02_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "we_crossbow_skin_02_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_we_repeater_crossbow_t2",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t2/wpn_we_repeater_crossbow_t2",
			template = "repeating_crossbow_elf_template",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "we_crossbow_skin_02_runed_01",
		data = {
			description = "we_crossbow_skin_02_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "we_crossbow_skin_02_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_repeater_crossbow_t2",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t2/wpn_we_repeater_crossbow_t2_runed_01",
			template = "repeating_crossbow_elf_template",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "we_crossbow_skin_03",
		data = {
			description = "we_crossbow_skin_03_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "we_crossbow_skin_03_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_we_repeater_crossbow_t3",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t3/wpn_we_repeater_crossbow_t3",
			template = "repeating_crossbow_elf_template",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "we_crossbow_skin_03_runed_01",
		data = {
			description = "we_crossbow_skin_03_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "we_crossbow_skin_03_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_repeater_crossbow_t3",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t3/wpn_we_repeater_crossbow_t3_runed_01",
			template = "repeating_crossbow_elf_template",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle"
		}
	},
	{
		name = "we_crossbow_skin_03_runed_02",
		data = {
			description = "we_crossbow_skin_03_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			display_name = "we_crossbow_skin_03_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_repeater_crossbow_t3",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t3/wpn_we_repeater_crossbow_t3_runed_01",
			template = "repeating_crossbow_elf_template",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_rifle",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_longbow_skin_01",
		data = {
			description = "we_longbow_skin_05_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_05_name",
			rarity = "plentiful",
			inventory_icon = "icon_wpn_we_bow_01_t1",
			left_hand_unit = "units/weapons/player/wpn_we_bow_01_t1/wpn_we_bow_01_t1",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_02",
		data = {
			description = "we_longbow_skin_02_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_02_name",
			rarity = "common",
			inventory_icon = "icon_wpn_we_bow_01_t2",
			left_hand_unit = "units/weapons/player/wpn_we_bow_01_t2/wpn_we_bow_01_t2",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_03",
		data = {
			description = "we_longbow_skin_03_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_03_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_we_bow_02_t1",
			left_hand_unit = "units/weapons/player/wpn_we_bow_02_t1/wpn_we_bow_02_t1",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_04",
		data = {
			description = "we_longbow_skin_04_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_04_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_we_bow_02_t2",
			left_hand_unit = "units/weapons/player/wpn_we_bow_02_t2/wpn_we_bow_02_t2",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_05",
		data = {
			description = "we_longbow_skin_01_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_01_name",
			rarity = "common",
			inventory_icon = "icon_wpn_we_bow_03_t1",
			left_hand_unit = "units/weapons/player/wpn_we_bow_03_t1/wpn_we_bow_03_t1",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_06",
		data = {
			description = "we_longbow_skin_06_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_06_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_03_t2",
			left_hand_unit = "units/weapons/player/wpn_we_bow_03_t2/wpn_we_bow_03_t2",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_06_runed_01",
		data = {
			description = "we_longbow_skin_06_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_06_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_03_t2",
			left_hand_unit = "units/weapons/player/wpn_we_bow_03_t2/wpn_we_bow_03_t2_runed_01",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_06_runed_02",
		data = {
			description = "we_longbow_skin_06_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_06_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_03_t2",
			left_hand_unit = "units/weapons/player/wpn_we_bow_03_t2/wpn_we_bow_03_t2_runed_01",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_longbow_skin_07",
		data = {
			description = "we_longbow_skin_07_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_07_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_we_bow_04_t1",
			left_hand_unit = "units/weapons/player/wpn_we_bow_04_t1/wpn_we_bow_04_t1",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_08",
		data = {
			description = "we_longbow_skin_08_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_08_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_we_bow_04_t2",
			left_hand_unit = "units/weapons/player/wpn_we_bow_04_t2/wpn_we_bow_04_t2",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_longbow_skin_09",
		data = {
			description = "we_longbow_skin_09_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_longbow_skin_09_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_we_bow_05_t1",
			left_hand_unit = "units/weapons/player/wpn_we_bow_05_t1/wpn_we_bow_05_t1",
			template = "longbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_shortbow_skin_01",
		data = {
			description = "we_shortbow_skin_01_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_shortbow_skin_01_name",
			rarity = "plentiful",
			inventory_icon = "icon_wpn_we_bow_short_01",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_01/wpn_we_bow_short_01",
			template = "shortbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_shortbow_skin_01_runed_01",
		data = {
			description = "we_shortbow_skin_01_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_shortbow_skin_01_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_01",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_01/wpn_we_bow_short_01_runed_01",
			template = "shortbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_shortbow_skin_02",
		data = {
			description = "we_shortbow_skin_02_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_shortbow_skin_02_name",
			rarity = "common",
			inventory_icon = "icon_wpn_we_bow_short_02",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_02/wpn_we_bow_short_02",
			template = "shortbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_shortbow_skin_03",
		data = {
			description = "we_shortbow_skin_03_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_shortbow_skin_03_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_we_bow_short_03",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_03/wpn_we_bow_short_03",
			template = "shortbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_shortbow_skin_04",
		data = {
			description = "we_shortbow_skin_04_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_shortbow_skin_04_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_we_bow_short_04",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_04/wpn_we_bow_short_04",
			template = "shortbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_shortbow_skin_04_runed_01",
		data = {
			description = "we_shortbow_skin_04_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_shortbow_skin_04_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_04",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_04/wpn_we_bow_short_04_runed_01",
			template = "shortbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_shortbow_skin_04_runed_02",
		data = {
			description = "we_shortbow_skin_04_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_shortbow_skin_04_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_04",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_04/wpn_we_bow_short_04_runed_01",
			template = "shortbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_shortbow_skin_05",
		data = {
			description = "we_shortbow_skin_05_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			display_name = "we_shortbow_skin_05_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_05",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_05/wpn_we_bow_short_05",
			template = "shortbow_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_hagbane_skin_01",
		data = {
			description = "we_hagbane_skin_01_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_01_name",
			rarity = "plentiful",
			inventory_icon = "icon_wpn_we_bow_short_01",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_01/wpn_we_bow_short_01",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_hagbane_skin_01_runed_01",
		data = {
			description = "we_hagbane_skin_01_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_01_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_01",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_01/wpn_we_bow_short_01_runed_01",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_hagbane_skin_01_runed_02",
		data = {
			description = "we_hagbane_skin_01_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_01_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_01",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_01/wpn_we_bow_short_01_runed_01",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_hagbane_skin_02",
		data = {
			description = "we_hagbane_skin_02_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_02_name",
			rarity = "common",
			inventory_icon = "icon_wpn_we_bow_short_02",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_02/wpn_we_bow_short_02",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_hagbane_skin_03",
		data = {
			description = "we_hagbane_skin_03_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_03_name",
			rarity = "rare",
			inventory_icon = "icon_wpn_we_bow_short_03",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_03/wpn_we_bow_short_03",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_hagbane_skin_04",
		data = {
			description = "we_hagbane_skin_04_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_04_name",
			rarity = "exotic",
			inventory_icon = "icon_wpn_we_bow_short_04",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_04/wpn_we_bow_short_04",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_hagbane_skin_04_runed_01",
		data = {
			description = "we_hagbane_skin_04_runed_01_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_04_runed_01_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_04",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_04/wpn_we_bow_short_04_runed_01",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_hagbane_skin_04_runed_02",
		data = {
			description = "we_hagbane_skin_04_runed_02_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_04_runed_02_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_04",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_04/wpn_we_bow_short_04_runed_01",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_hagbane_skin_05",
		data = {
			description = "we_hagbane_skin_05_description",
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			display_name = "we_hagbane_skin_05_name",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_bow_short_05",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_05/wpn_we_bow_short_05",
			template = "shortbow_hagbane_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_bow"
		}
	},
	{
		name = "we_dual_dagger_skin_01",
		data = {
			description = "we_dual_dagger_skin_01_description",
			rarity = "plentiful",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1",
			display_name = "we_dual_dagger_skin_01_name",
			inventory_icon = "icon_wpn_we_dagger_01_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_dagger_skin_01_runed_01",
		data = {
			description = "we_dual_dagger_skin_01_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01",
			display_name = "we_dual_dagger_skin_01_runed_01_name",
			inventory_icon = "icon_wpn_we_dagger_01_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_dagger_skin_02",
		data = {
			description = "we_dual_dagger_skin_02_description",
			rarity = "runed",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2",
			display_name = "we_dual_dagger_skin_02_name",
			inventory_icon = "icon_wpn_we_dagger_01_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_dagger_skin_02_runed_01",
		data = {
			description = "we_dual_dagger_skin_02_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			display_name = "we_dual_dagger_skin_02_runed_01_name",
			inventory_icon = "icon_wpn_we_dagger_01_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_dagger_skin_02_runed_02",
		data = {
			description = "we_dual_dagger_skin_02_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			display_name = "we_dual_dagger_skin_02_runed_02_name",
			inventory_icon = "icon_wpn_we_dagger_01_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_dual_dagger_skin_03",
		data = {
			description = "we_dual_dagger_skin_03_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_02_t1/wpn_we_dagger_02_t1",
			display_name = "we_dual_dagger_skin_03_name",
			inventory_icon = "icon_wpn_we_dagger_02_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_02_t1/wpn_we_dagger_02_t1",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_dagger_skin_04",
		data = {
			description = "we_dual_dagger_skin_04_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_02_t2/wpn_we_dagger_02_t2",
			display_name = "we_dual_dagger_skin_04_name",
			inventory_icon = "icon_wpn_we_dagger_02_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_02_t2/wpn_we_dagger_02_t2",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_dagger_skin_05",
		data = {
			description = "we_dual_dagger_skin_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_02_t3/wpn_we_dagger_02_t3",
			display_name = "we_dual_dagger_skin_05_name",
			inventory_icon = "icon_wpn_we_dagger_02_t3_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_02_t3/wpn_we_dagger_02_t3",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_dagger_skin_06",
		data = {
			description = "we_dual_dagger_skin_06_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_03_t1/wpn_we_dagger_03_t1",
			display_name = "we_dual_dagger_skin_06_name",
			inventory_icon = "icon_wpn_we_dagger_03_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_03_t1/wpn_we_dagger_03_t1",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_dagger_skin_07",
		data = {
			description = "we_dual_dagger_skin_07_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_03_t2/wpn_we_dagger_03_t2",
			display_name = "we_dual_dagger_skin_07_name",
			inventory_icon = "icon_wpn_we_dagger_03_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_03_t2/wpn_we_dagger_03_t2",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_01",
		data = {
			description = "we_dual_sword_skin_01_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t1/wpn_we_sword_02_t1",
			display_name = "we_dual_sword_skin_01_name",
			inventory_icon = "icon_wpn_we_sword_02_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_02_t1/wpn_we_sword_02_t1",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_02",
		data = {
			description = "we_dual_sword_skin_02_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2",
			display_name = "we_dual_sword_skin_02_name",
			inventory_icon = "icon_wpn_we_sword_01_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_02_runed_01",
		data = {
			description = "we_dual_sword_skin_02_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_runed_01",
			display_name = "we_dual_sword_skin_02_runed_01_name",
			inventory_icon = "icon_wpn_we_sword_01_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_runed_01",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_03",
		data = {
			description = "we_dual_sword_skin_03_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t3/wpn_we_sword_01_t3",
			display_name = "we_dual_sword_skin_03_name",
			inventory_icon = "icon_wpn_we_sword_01_t3_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_01_t3/wpn_we_sword_01_t3",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_04",
		data = {
			description = "we_dual_sword_skin_04_description",
			rarity = "plentiful",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t1/wpn_we_sword_01_t1",
			display_name = "we_dual_sword_skin_04_name",
			inventory_icon = "icon_wpn_we_sword_01_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_01_t1/wpn_we_sword_01_t1",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_04_runed_01",
		data = {
			description = "we_dual_sword_skin_04_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t1/wpn_we_sword_02_t1_runed_01",
			display_name = "we_dual_sword_skin_04_runed_01_name",
			inventory_icon = "icon_wpn_we_sword_02_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_02_t1/wpn_we_sword_02_t1_runed_01",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_05",
		data = {
			description = "we_dual_sword_skin_05_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2",
			display_name = "we_dual_sword_skin_05_name",
			inventory_icon = "icon_wpn_we_sword_02_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_05_runed_01",
		data = {
			description = "we_dual_sword_skin_05_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			display_name = "we_dual_sword_skin_05_runed_01_name",
			inventory_icon = "icon_wpn_we_sword_02_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_05_runed_02",
		data = {
			description = "we_dual_sword_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			display_name = "we_dual_sword_skin_05_runed_02_name",
			inventory_icon = "icon_wpn_we_sword_02_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_dual_sword_skin_06",
		data = {
			description = "we_dual_sword_skin_06_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1",
			display_name = "we_dual_sword_skin_06_name",
			inventory_icon = "icon_wpn_we_sword_03_t1_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_skin_07",
		data = {
			description = "we_dual_sword_skin_07_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t2/wpn_we_sword_03_t2",
			display_name = "we_dual_sword_skin_07_name",
			inventory_icon = "icon_wpn_we_sword_03_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_we_sword_03_t2/wpn_we_sword_03_t2",
			template = "dual_wield_swords_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_sword_skin_01",
		data = {
			description = "we_sword_skin_01_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_01_t1",
			display_name = "we_sword_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t1/wpn_we_sword_01_t1",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_02",
		data = {
			description = "we_sword_skin_02_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_01_t2",
			display_name = "we_sword_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_02_runed_01",
		data = {
			description = "we_sword_skin_02_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_01_t2",
			display_name = "we_sword_skin_02_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_runed_01",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_03",
		data = {
			description = "we_sword_skin_03_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_01_t3",
			display_name = "we_sword_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t3/wpn_we_sword_01_t3",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_04",
		data = {
			description = "we_sword_skin_04_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_02_t1",
			display_name = "we_sword_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t1/wpn_we_sword_02_t1",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_04_runed_01",
		data = {
			description = "we_sword_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_02_t1",
			display_name = "we_sword_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t1/wpn_we_sword_02_t1_runed_01",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_05",
		data = {
			description = "we_sword_skin_05_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_02_t2",
			display_name = "we_sword_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_05_runed_01",
		data = {
			description = "we_sword_skin_05_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_02_t2",
			display_name = "we_sword_skin_05_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_05_runed_02",
		data = {
			description = "we_sword_skin_05_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_sword_02_t2",
			display_name = "we_sword_skin_05_runed_02_name",
			template = "we_one_hand_sword_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_sword_skin_06",
		data = {
			description = "we_sword_skin_06_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_03_t1",
			display_name = "we_sword_skin_06_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_sword_skin_07",
		data = {
			description = "we_sword_skin_07_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			inventory_icon = "icon_wpn_we_sword_03_t2",
			display_name = "we_sword_skin_07_name",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t2/wpn_we_sword_03_t2",
			template = "we_one_hand_sword_template_1"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_01",
		data = {
			description = "we_dual_sword_dagger_skin_01_description",
			rarity = "common",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t1/wpn_we_sword_02_t1",
			display_name = "we_dual_sword_dagger_skin_01_name",
			inventory_icon = "icon_wpn_we_sword_02_t1_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_02_t1/wpn_we_dagger_02_t1",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_01_runed_01",
		data = {
			description = "we_dual_sword_dagger_skin_01_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			display_name = "we_dual_sword_dagger_skin_01_runed_01_name",
			inventory_icon = "icon_wpn_we_sword_01_t1_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_01_runed_02",
		data = {
			description = "we_dual_sword_dagger_skin_01_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			display_name = "we_dual_sword_dagger_skin_01_runed_02_name",
			inventory_icon = "icon_wpn_we_sword_01_t1_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_dual_sword_dagger_skin_02",
		data = {
			description = "we_dual_sword_dagger_skin_02_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2",
			display_name = "we_dual_sword_dagger_skin_02_name",
			inventory_icon = "icon_wpn_we_sword_01_t2_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_02_runed_01",
		data = {
			description = "we_dual_sword_dagger_skin_02_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_runed_01",
			display_name = "we_dual_sword_dagger_skin_02_runed_01_name",
			inventory_icon = "icon_wpn_we_sword_01_t2_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_04",
		data = {
			description = "we_dual_sword_dagger_skin_04_description",
			rarity = "plentiful",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t1/wpn_we_sword_01_t1",
			display_name = "we_dual_sword_dagger_skin_04_name",
			inventory_icon = "icon_wpn_we_sword_01_t1_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_04_runed_01",
		data = {
			description = "we_dual_sword_dagger_skin_04_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t1/wpn_we_sword_02_t1_runed_01",
			display_name = "we_dual_sword_dagger_skin_04_runed_01_name",
			inventory_icon = "icon_wpn_we_sword_02_t1_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_05",
		data = {
			description = "we_dual_sword_dagger_skin_05_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2",
			display_name = "we_dual_sword_dagger_skin_05_name",
			inventory_icon = "icon_wpn_we_sword_02_t2_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_02_t2/wpn_we_dagger_02_t2",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_05_runed_01",
		data = {
			description = "we_dual_sword_dagger_skin_05_runed_01_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			display_name = "we_dual_sword_dagger_skin_05_runed_01_name",
			inventory_icon = "icon_wpn_we_sword_02_t2_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_06",
		data = {
			description = "we_dual_sword_dagger_skin_06_description",
			rarity = "rare",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1",
			display_name = "we_dual_sword_dagger_skin_06_name",
			inventory_icon = "icon_wpn_we_sword_03_t1_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_03_t1/wpn_we_dagger_03_t1",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_dual_sword_dagger_skin_07",
		data = {
			description = "we_dual_sword_dagger_skin_07_description",
			rarity = "exotic",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t2/wpn_we_sword_03_t2",
			display_name = "we_dual_sword_dagger_skin_07_name",
			inventory_icon = "icon_wpn_we_sword_03_t2_dagger_dual",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_03_t2/wpn_we_dagger_03_t2",
			template = "dual_wield_sword_dagger_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_1h_weapon"
		}
	},
	{
		name = "we_spear_skin_01",
		data = {
			description = "we_spear_skin_01_description",
			rarity = "common",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_spear_01",
			display_name = "we_spear_skin_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_spear_01/wpn_we_spear_01",
			template = "two_handed_spears_elf_template_1"
		}
	},
	{
		name = "we_spear_skin_02",
		data = {
			description = "we_spear_skin_02_description",
			rarity = "rare",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_spear_02",
			display_name = "we_spear_skin_02_name",
			right_hand_unit = "units/weapons/player/wpn_we_spear_02/wpn_we_spear_02",
			template = "two_handed_spears_elf_template_1"
		}
	},
	{
		name = "we_spear_skin_03",
		data = {
			description = "we_spear_skin_03_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_spear_03",
			display_name = "we_spear_skin_03_name",
			right_hand_unit = "units/weapons/player/wpn_we_spear_03/wpn_we_spear_03",
			template = "two_handed_spears_elf_template_1"
		}
	},
	{
		name = "we_spear_skin_03_runed_01",
		data = {
			description = "we_spear_skin_03_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_spear_03",
			display_name = "we_spear_skin_03_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_spear_03/wpn_we_spear_03_runed_01",
			template = "two_handed_spears_elf_template_1"
		}
	},
	{
		name = "we_spear_skin_03_runed_02",
		data = {
			description = "we_spear_skin_03_runed_02_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_spear_03/wpn_we_spear_03_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_spear_03",
			display_name = "we_spear_skin_03_runed_02_name",
			template = "two_handed_spears_elf_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			material_settings = WeaponMaterialSettingsTemplates.purple_glow
		}
	},
	{
		name = "we_spear_skin_04",
		data = {
			description = "we_spear_skin_04_description",
			rarity = "plentiful",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_spear_04",
			display_name = "we_spear_skin_04_name",
			right_hand_unit = "units/weapons/player/wpn_we_spear_04/wpn_we_spear_04",
			template = "two_handed_spears_elf_template_1"
		}
	},
	{
		name = "we_spear_skin_04_runed_01",
		data = {
			description = "we_spear_skin_04_runed_01_description",
			rarity = "unique",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_spear_04",
			display_name = "we_spear_skin_04_runed_01_name",
			right_hand_unit = "units/weapons/player/wpn_we_spear_04/wpn_we_spear_04_runed_01",
			template = "two_handed_spears_elf_template_1"
		}
	},
	{
		name = "we_spear_skin_05",
		data = {
			description = "we_spear_skin_05_description",
			rarity = "exotic",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_2h_weapon",
			inventory_icon = "icon_wpn_we_spear_05",
			display_name = "we_spear_skin_05_name",
			right_hand_unit = "units/weapons/player/wpn_we_spear_05/wpn_we_spear_05",
			template = "two_handed_spears_elf_template_1"
		}
	}
}
WeaponSkins.skin_combinations = {
	wh_1h_axe_skins = {
		common = {
			"wh_1h_axe_skin_01",
			"wh_1h_axe_skin_06"
		},
		rare = {
			"wh_1h_axe_skin_01",
			"wh_1h_axe_skin_03",
			"wh_1h_axe_skin_06"
		},
		exotic = {
			"wh_1h_axe_skin_01",
			"wh_1h_axe_skin_03",
			"wh_1h_axe_skin_02",
			"wh_1h_axe_skin_04"
		},
		unique = {
			"wh_1h_axe_skin_02_runed_01",
			"wh_1h_axe_skin_04_runed_01"
		},
		bogenhafen = {
			"wh_1h_axe_skin_04_runed_02"
		}
	},
	es_1h_sword_skins = {
		common = {
			"es_1h_sword_skin_03"
		},
		rare = {
			"es_1h_sword_skin_03",
			"es_1h_sword_skin_02"
		},
		exotic = {
			"es_1h_sword_skin_03",
			"es_1h_sword_skin_02",
			"es_1h_sword_skin_04"
		},
		unique = {
			"es_1h_sword_skin_02_runed_01",
			"es_1h_sword_skin_01_runed_01"
		},
		bogenhafen = {
			"es_1h_sword_skin_01_runed_02"
		}
	},
	es_1h_mace_skins = {
		common = {
			"es_1h_mace_skin_02"
		},
		rare = {
			"es_1h_mace_skin_02",
			"es_1h_mace_skin_03"
		},
		exotic = {
			"es_1h_mace_skin_02",
			"es_1h_mace_skin_03",
			"es_1h_mace_skin_04",
			"es_1h_mace_skin_05"
		},
		unique = {
			"es_1h_mace_skin_02_runed_01"
		},
		bogenhafen = {
			"es_1h_mace_skin_02_runed_02"
		}
	},
	es_2h_sword_executioner_skins = {
		common = {
			"es_2h_sword_exe_skin_02",
			"es_2h_sword_exe_skin_03"
		},
		rare = {
			"es_2h_sword_exe_skin_02",
			"es_2h_sword_exe_skin_03",
			"es_2h_sword_exe_skin_04"
		},
		exotic = {
			"es_2h_sword_exe_skin_02",
			"es_2h_sword_exe_skin_03",
			"es_2h_sword_exe_skin_04",
			"es_2h_sword_exe_skin_05"
		},
		unique = {
			"es_2h_sword_exe_skin_04_runed_01",
			"es_2h_sword_exe_skin_05_runed_01"
		},
		bogenhafen = {
			"es_2h_sword_exe_skin_05_runed_02"
		}
	},
	es_2h_sword_skins = {
		common = {
			"es_2h_sword_skin_03"
		},
		rare = {
			"es_2h_sword_skin_03",
			"es_2h_sword_skin_05"
		},
		exotic = {
			"es_2h_sword_skin_03",
			"es_2h_sword_skin_04",
			"es_2h_sword_skin_05",
			"es_2h_sword_skin_06",
			"es_2h_sword_skin_02"
		},
		unique = {
			"es_2h_sword_skin_02_runed_01",
			"es_2h_sword_skin_04_runed_01"
		},
		bogenhafen = {
			"es_2h_sword_skin_04_runed_02"
		}
	},
	es_2h_hammer_skins = {
		common = {
			"es_2h_hammer_skin_03",
			"es_2h_hammer_skin_02"
		},
		rare = {
			"es_2h_hammer_skin_03",
			"es_2h_hammer_skin_01",
			"es_2h_hammer_skin_02"
		},
		exotic = {
			"es_2h_hammer_skin_03",
			"es_2h_hammer_skin_01",
			"es_2h_hammer_skin_04",
			"es_2h_hammer_skin_02",
			"es_2h_hammer_skin_06"
		},
		unique = {
			"es_2h_hammer_skin_04_runed_01",
			"es_2h_hammer_skin_06_runed_01"
		},
		bogenhafen = {
			"es_2h_hammer_skin_04_runed_02"
		}
	},
	es_sword_shield_skins = {
		common = {
			"es_1h_sword_shield_skin_03",
			"es_1h_sword_shield_skin_02"
		},
		rare = {
			"es_1h_sword_shield_skin_03",
			"es_1h_sword_shield_skin_01"
		},
		exotic = {
			"es_1h_sword_shield_skin_03",
			"es_1h_sword_shield_skin_01",
			"es_1h_sword_shield_skin_04",
			"es_1h_sword_shield_skin_05"
		},
		unique = {
			"es_1h_sword_shield_skin_03_runed_01",
			"es_1h_sword_shield_skin_02_runed_01"
		},
		bogenhafen = {
			"es_1h_sword_shield_skin_03_runed_02"
		}
	},
	es_mace_shield_skins = {
		common = {
			"es_1h_mace_shield_skin_03",
			"es_1h_mace_shield_skin_04"
		},
		rare = {
			"es_1h_mace_shield_skin_03",
			"es_1h_mace_shield_skin_04",
			"es_1h_mace_shield_skin_01"
		},
		exotic = {
			"es_1h_mace_shield_skin_03",
			"es_1h_mace_shield_skin_01",
			"es_1h_mace_shield_skin_04",
			"es_1h_mace_shield_skin_05"
		},
		unique = {
			"es_1h_mace_shield_skin_03_runed_01",
			"es_1h_mace_shield_skin_02_runed_01"
		},
		bogenhafen = {
			"es_1h_mace_shield_skin_03_runed_02"
		}
	},
	es_halberd_skins = {
		common = {
			"es_halberd_skin_02",
			"es_halberd_skin_03"
		},
		rare = {
			"es_halberd_skin_02",
			"es_halberd_skin_03",
			"es_halberd_skin_04"
		},
		exotic = {
			"es_halberd_skin_02",
			"es_halberd_skin_03",
			"es_halberd_skin_04"
		},
		unique = {
			"es_halberd_skin_04_runed_01"
		},
		bogenhafen = {
			"es_halberd_skin_04_runed_02"
		}
	},
	es_longbow_skins = {
		common = {
			"es_longbow_skin_02",
			"es_longbow_skin_03"
		},
		rare = {
			"es_longbow_skin_02",
			"es_longbow_skin_03",
			"es_longbow_skin_04"
		},
		exotic = {
			"es_longbow_skin_02",
			"es_longbow_skin_03",
			"es_longbow_skin_04",
			"es_longbow_skin_05"
		},
		unique = {
			"es_longbow_skin_04_runed_01",
			"es_longbow_skin_05_runed_01"
		},
		bogenhafen = {
			"es_longbow_skin_05_runed_02"
		}
	},
	es_blunderbuss_skins = {
		common = {
			"es_blunderbuss_skin_01",
			"es_blunderbuss_skin_04"
		},
		rare = {
			"es_blunderbuss_skin_01",
			"es_blunderbuss_skin_04",
			"es_blunderbuss_skin_02"
		},
		exotic = {
			"es_blunderbuss_skin_01",
			"es_blunderbuss_skin_04",
			"es_blunderbuss_skin_02",
			"es_blunderbuss_skin_05"
		},
		unique = {
			"es_blunderbuss_skin_04_runed_01",
			"es_blunderbuss_skin_02_runed_01"
		},
		bogenhafen = {
			"es_blunderbuss_skin_02_runed_02"
		}
	},
	es_handgun_skins = {
		common = {
			"es_handgun_skin_01",
			"es_handgun_skin_02"
		},
		rare = {
			"es_handgun_skin_01",
			"es_handgun_skin_02",
			"es_handgun_skin_05"
		},
		exotic = {
			"es_handgun_skin_01",
			"es_handgun_skin_02",
			"es_handgun_skin_05",
			"es_handgun_skin_04"
		},
		unique = {
			"es_handgun_skin_01_runed_01",
			"es_handgun_skin_02_runed_01"
		},
		bogenhafen = {
			"es_handgun_skin_02_runed_02"
		}
	},
	es_repeating_handgun_skins = {
		common = {
			"es_repeating_handgun_skin_02"
		},
		rare = {
			"es_repeating_handgun_skin_02",
			"es_repeating_handgun_skin_03"
		},
		exotic = {
			"es_repeating_handgun_skin_02",
			"es_repeating_handgun_skin_03"
		},
		unique = {
			"es_repeating_handgun_skin_02_runed_01",
			"es_repeating_handgun_skin_03_runed_01"
		},
		bogenhafen = {
			"es_repeating_handgun_skin_03_runed_02"
		}
	},
	we_spear_skins = {
		common = {
			"we_spear_skin_02",
			"we_spear_skin_03"
		},
		rare = {
			"we_spear_skin_02",
			"we_spear_skin_03",
			"we_spear_skin_04"
		},
		exotic = {
			"we_spear_skin_02",
			"we_spear_skin_03",
			"we_spear_skin_04",
			"we_spear_skin_05"
		},
		unique = {
			"we_spear_skin_03_runed_01",
			"we_spear_skin_04_runed_01"
		},
		bogenhafen = {
			"we_spear_skin_03_runed_02"
		}
	},
	we_dual_wield_daggers_skins = {
		common = {
			"we_dual_dagger_skin_04",
			"we_dual_dagger_skin_06",
			"we_dual_dagger_skin_05"
		},
		rare = {
			"we_dual_dagger_skin_04",
			"we_dual_dagger_skin_06",
			"we_dual_dagger_skin_05",
			"we_dual_dagger_skin_02"
		},
		exotic = {
			"we_dual_dagger_skin_04",
			"we_dual_dagger_skin_05",
			"we_dual_dagger_skin_06",
			"we_dual_dagger_skin_02",
			"we_dual_dagger_skin_07",
			"we_dual_dagger_skin_03"
		},
		unique = {
			"we_dual_dagger_skin_01_runed_01",
			"we_dual_dagger_skin_02_runed_01"
		},
		bogenhafen = {
			"we_dual_dagger_skin_02_runed_02"
		}
	},
	we_dual_wield_swords_skins = {
		common = {
			"we_dual_sword_skin_01",
			"we_dual_sword_skin_02",
			"we_dual_sword_skin_05"
		},
		rare = {
			"we_dual_sword_skin_01",
			"we_dual_sword_skin_02",
			"we_dual_sword_skin_06",
			"we_dual_sword_skin_05"
		},
		exotic = {
			"we_dual_sword_skin_01",
			"we_dual_sword_skin_02",
			"we_dual_sword_skin_06",
			"we_dual_sword_skin_05",
			"we_dual_sword_skin_03",
			"we_dual_sword_skin_07"
		},
		unique = {
			"we_dual_sword_skin_02_runed_01",
			"we_dual_sword_skin_04_runed_01",
			"we_dual_sword_skin_05_runed_01"
		},
		bogenhafen = {
			"we_dual_sword_skin_05_runed_02"
		}
	},
	we_1h_sword_skins = {
		common = {
			"we_sword_skin_05",
			"we_sword_skin_02",
			"we_sword_skin_03"
		},
		rare = {
			"we_sword_skin_02",
			"we_sword_skin_06",
			"we_sword_skin_05",
			"we_sword_skin_03"
		},
		exotic = {
			"we_sword_skin_02",
			"we_sword_skin_06",
			"we_sword_skin_05",
			"we_sword_skin_07",
			"we_sword_skin_03",
			"we_sword_skin_04"
		},
		unique = {
			"we_sword_skin_02_runed_01",
			"we_sword_skin_05_runed_01",
			"we_sword_skin_04_runed_01"
		},
		bogenhafen = {
			"we_sword_skin_05_runed_02"
		}
	},
	we_dual_wield_sword_dagger_skins = {
		common = {
			"we_dual_sword_dagger_skin_01",
			"we_dual_sword_dagger_skin_02",
			"we_dual_sword_dagger_skin_06"
		},
		rare = {
			"we_dual_sword_dagger_skin_01",
			"we_dual_sword_dagger_skin_02",
			"we_dual_sword_dagger_skin_06",
			"we_dual_sword_dagger_skin_05"
		},
		exotic = {
			"we_dual_sword_dagger_skin_01",
			"we_dual_sword_dagger_skin_02",
			"we_dual_sword_dagger_skin_06",
			"we_dual_sword_dagger_skin_05",
			"we_dual_sword_dagger_skin_07"
		},
		unique = {
			"we_dual_sword_dagger_skin_01_runed_01",
			"we_dual_sword_dagger_skin_02_runed_01",
			"we_dual_sword_dagger_skin_05_runed_01",
			"we_dual_sword_dagger_skin_04_runed_01"
		},
		bogenhafen = {
			"we_dual_sword_dagger_skin_01_runed_02"
		}
	},
	we_shortbow_skins = {
		common = {
			"we_shortbow_skin_02",
			"we_shortbow_skin_03"
		},
		rare = {
			"we_shortbow_skin_02",
			"we_shortbow_skin_03",
			"we_shortbow_skin_04"
		},
		exotic = {
			"we_shortbow_skin_02",
			"we_shortbow_skin_03",
			"we_shortbow_skin_04",
			"we_shortbow_skin_05"
		},
		unique = {
			"we_shortbow_skin_01_runed_01",
			"we_shortbow_skin_04_runed_01"
		},
		bogenhafen = {
			"we_shortbow_skin_04_runed_02"
		}
	},
	we_shortbow_hagbane_skins = {
		common = {
			"we_hagbane_skin_02",
			"we_hagbane_skin_03"
		},
		rare = {
			"we_hagbane_skin_02",
			"we_hagbane_skin_03",
			"we_hagbane_skin_04"
		},
		exotic = {
			"we_hagbane_skin_02",
			"we_hagbane_skin_03",
			"we_hagbane_skin_04",
			"we_hagbane_skin_05"
		},
		unique = {
			"we_hagbane_skin_04_runed_01",
			"we_hagbane_skin_01_runed_01"
		},
		bogenhafen = {
			"we_hagbane_skin_04_runed_02"
		}
	},
	we_longbow_skins = {
		common = {
			"we_longbow_skin_02",
			"we_longbow_skin_03",
			"we_longbow_skin_04"
		},
		rare = {
			"we_longbow_skin_02",
			"we_longbow_skin_04",
			"we_longbow_skin_03",
			"we_longbow_skin_05",
			"we_longbow_skin_07"
		},
		exotic = {
			"we_longbow_skin_02",
			"we_longbow_skin_04",
			"we_longbow_skin_03",
			"we_longbow_skin_05",
			"we_longbow_skin_07",
			"we_longbow_skin_06",
			"we_longbow_skin_08",
			"we_longbow_skin_09"
		},
		unique = {
			"we_longbow_skin_06_runed_01"
		},
		bogenhafen = {
			"we_longbow_skin_06_runed_02"
		}
	},
	we_2h_axe_skins = {
		common = {
			"we_2h_axe_skin_03",
			"we_2h_axe_skin_02",
			"we_2h_axe_skin_04"
		},
		rare = {
			"we_2h_axe_skin_03",
			"we_2h_axe_skin_02",
			"we_2h_axe_skin_04",
			"we_2h_axe_skin_05"
		},
		exotic = {
			"we_2h_axe_skin_03",
			"we_2h_axe_skin_02",
			"we_2h_axe_skin_04",
			"we_2h_axe_skin_05",
			"we_2h_axe_skin_06",
			"we_2h_axe_skin_07",
			"we_2h_axe_skin_08"
		},
		unique = {
			"we_2h_axe_skin_05_runed_01",
			"we_2h_axe_skin_07_runed_01"
		},
		bogenhafen = {
			"we_2h_axe_skin_05_runed_02"
		}
	},
	we_2h_sword_skins = {
		common = {
			"we_2h_sword_skin_03",
			"we_2h_sword_skin_02",
			"we_2h_sword_skin_04"
		},
		rare = {
			"we_2h_sword_skin_03",
			"we_2h_sword_skin_02",
			"we_2h_sword_skin_04",
			"we_2h_sword_skin_09",
			"we_2h_sword_skin_07"
		},
		exotic = {
			"we_2h_sword_skin_03",
			"we_2h_sword_skin_02",
			"we_2h_sword_skin_04",
			"we_2h_sword_skin_05",
			"we_2h_sword_skin_06",
			"we_2h_sword_skin_07",
			"we_2h_sword_skin_08",
			"we_2h_sword_skin_09",
			"we_2h_sword_skin_10"
		},
		unique = {
			"we_2h_sword_skin_05_runed_01",
			"we_2h_sword_skin_06_runed_01"
		},
		bogenhafen = {
			"we_2h_sword_skin_06_runed_02"
		}
	},
	we_crossbow_repeater_skins = {
		common = {
			"we_crossbow_skin_02"
		},
		rare = {
			"we_crossbow_skin_02",
			"we_crossbow_skin_03"
		},
		exotic = {
			"we_crossbow_skin_02",
			"we_crossbow_skin_03"
		},
		unique = {
			"we_crossbow_skin_02_runed_01",
			"we_crossbow_skin_03_runed_01"
		},
		bogenhafen = {
			"we_crossbow_skin_03_runed_02"
		}
	},
	bw_1h_mace_skins = {
		common = {
			"bw_1h_mace_skin_02",
			"bw_1h_mace_skin_03"
		},
		rare = {
			"bw_1h_mace_skin_02",
			"bw_1h_mace_skin_03",
			"bw_1h_mace_skin_04"
		},
		exotic = {
			"bw_1h_mace_skin_02",
			"bw_1h_mace_skin_03",
			"bw_1h_mace_skin_04",
			"bw_1h_mace_skin_05"
		},
		unique = {
			"bw_1h_mace_skin_01_runed_01",
			"bw_1h_mace_skin_05_runed_01"
		},
		bogenhafen = {
			"bw_1h_mace_skin_05_runed_02"
		}
	},
	bw_dagger_skins = {
		common = {
			"bw_dagger_skin_02",
			"bw_dagger_skin_03"
		},
		rare = {
			"bw_dagger_skin_02",
			"bw_dagger_skin_03",
			"bw_dagger_skin_04"
		},
		exotic = {
			"bw_dagger_skin_02",
			"bw_dagger_skin_03",
			"bw_dagger_skin_04",
			"bw_dagger_skin_05"
		},
		unique = {
			"bw_dagger_skin_03_runed_01",
			"bw_dagger_skin_04_runed_01",
			"bw_dagger_skin_05_runed_01"
		},
		bogenhafen = {
			"bw_dagger_skin_05_runed_02"
		}
	},
	bw_sword_skins = {
		common = {
			"bw_1h_sword_skin_03",
			"bw_1h_sword_skin_02",
			"bw_1h_sword_skin_05"
		},
		rare = {
			"bw_1h_sword_skin_03",
			"bw_1h_sword_skin_02",
			"bw_1h_sword_skin_05",
			"bw_1h_sword_skin_06"
		},
		exotic = {
			"bw_1h_sword_skin_03",
			"bw_1h_sword_skin_02",
			"bw_1h_sword_skin_05",
			"bw_1h_sword_skin_04",
			"bw_1h_sword_skin_06",
			"bw_1h_sword_skin_07",
			"bw_1h_sword_skin_08"
		},
		unique = {
			"bw_1h_sword_skin_01_runed_01",
			"bw_1h_sword_skin_02_runed_01"
		},
		bogenhafen = {
			"bw_1h_sword_skin_02_runed_02"
		}
	},
	bw_flame_sword_skins = {
		common = {
			"bw_1h_flaming_sword_skin_03",
			"bw_1h_flaming_sword_skin_02",
			"bw_1h_flaming_sword_skin_05"
		},
		rare = {
			"bw_1h_flaming_sword_skin_03",
			"bw_1h_flaming_sword_skin_02",
			"bw_1h_flaming_sword_skin_05",
			"bw_1h_flaming_sword_skin_06"
		},
		exotic = {
			"bw_1h_flaming_sword_skin_03",
			"bw_1h_flaming_sword_skin_02",
			"bw_1h_flaming_sword_skin_05",
			"bw_1h_flaming_sword_skin_04",
			"bw_1h_flaming_sword_skin_06",
			"bw_1h_flaming_sword_skin_07",
			"bw_1h_flaming_sword_skin_08"
		},
		unique = {
			"bw_1h_flaming_sword_skin_01_runed_01",
			"bw_1h_flaming_sword_skin_02_runed_01"
		},
		bogenhafen = {
			"bw_1h_flaming_sword_skin_02_runed_02"
		}
	},
	bw_skullstaff_fireball_skins = {
		common = {
			"bw_fireball_staff_skin_02"
		},
		rare = {
			"bw_fireball_staff_skin_02"
		},
		exotic = {
			"bw_fireball_staff_skin_02"
		},
		unique = {
			"bw_fireball_staff_skin_01_runed_01"
		},
		bogenhafen = {
			"bw_fireball_staff_skin_01_runed_02"
		}
	},
	bw_skullstaff_beam_skins = {
		common = {
			"bw_beam_staff_skin_02",
			"bw_beam_staff_skin_03"
		},
		rare = {
			"bw_beam_staff_skin_02",
			"bw_beam_staff_skin_03",
			"bw_beam_staff_skin_04"
		},
		exotic = {
			"bw_beam_staff_skin_02",
			"bw_beam_staff_skin_03",
			"bw_beam_staff_skin_04",
			"bw_beam_staff_skin_05"
		},
		unique = {
			"bw_beam_staff_skin_04_runed_01",
			"bw_beam_staff_skin_05_runed_01"
		},
		bogenhafen = {
			"bw_beam_staff_skin_05_runed_02"
		}
	},
	bw_skullstaff_geiser_skins = {
		common = {
			"bw_conflagration_staff_skin_02"
		},
		rare = {
			"bw_conflagration_staff_skin_02"
		},
		exotic = {
			"bw_conflagration_staff_skin_02"
		},
		unique = {
			"bw_conflagration_staff_skin_02_runed_01"
		},
		bogenhafen = {
			"bw_conflagration_staff_skin_02_runed_02"
		}
	},
	bw_skullstaff_spear_skins = {
		common = {
			"bw_spear_staff_skin_02",
			"bw_spear_staff_skin_03"
		},
		rare = {
			"bw_spear_staff_skin_02",
			"bw_spear_staff_skin_03",
			"bw_spear_staff_skin_04"
		},
		exotic = {
			"bw_spear_staff_skin_02",
			"bw_spear_staff_skin_03",
			"bw_spear_staff_skin_04",
			"bw_spear_staff_skin_05"
		},
		unique = {
			"bw_spear_staff_skin_04_runed_01",
			"bw_spear_staff_skin_02_runed_01"
		},
		bogenhafen = {
			"bw_spear_staff_skin_04_runed_02"
		}
	},
	bw_skullstaff_flamethrower_skins = {
		common = {
			"bw_flamethrower_staff_skin_02",
			"bw_flamethrower_staff_skin_03"
		},
		rare = {
			"bw_flamethrower_staff_skin_02",
			"bw_flamethrower_staff_skin_03",
			"bw_flamethrower_staff_skin_04"
		},
		exotic = {
			"bw_flamethrower_staff_skin_02",
			"bw_flamethrower_staff_skin_03",
			"bw_flamethrower_staff_skin_04",
			"bw_flamethrower_staff_skin_05"
		},
		unique = {
			"bw_flamethrower_staff_skin_02_runed_01",
			"bw_flamethrower_staff_skin_05_runed_01"
		},
		bogenhafen = {
			"bw_flamethrower_staff_skin_05_runed_02"
		}
	},
	dr_1h_axe_skins = {
		common = {
			"dw_1h_axe_skin_02",
			"dw_1h_axe_skin_03",
			"dw_1h_axe_skin_07"
		},
		rare = {
			"dw_1h_axe_skin_02",
			"dw_1h_axe_skin_03",
			"dw_1h_axe_skin_04",
			"dw_1h_axe_skin_07"
		},
		exotic = {
			"dw_1h_axe_skin_03",
			"dw_1h_axe_skin_07",
			"dw_1h_axe_skin_02",
			"dw_1h_axe_skin_04",
			"dw_1h_axe_skin_05",
			"dw_1h_axe_skin_06"
		},
		unique = {
			"dw_1h_axe_skin_07_runed_01",
			"dw_1h_axe_skin_06_runed_01"
		},
		bogenhafen = {
			"dw_1h_axe_skin_06_runed_02"
		}
	},
	dr_dual_wield_axes_skins = {
		common = {
			"dw_dual_axe_skin_02",
			"dw_dual_axe_skin_03",
			"dw_dual_axe_skin_07"
		},
		rare = {
			"dw_dual_axe_skin_02",
			"dw_dual_axe_skin_03",
			"dw_dual_axe_skin_04",
			"dw_dual_axe_skin_07"
		},
		exotic = {
			"dw_dual_axe_skin_02",
			"dw_dual_axe_skin_03",
			"dw_dual_axe_skin_04",
			"dw_dual_axe_skin_05",
			"dw_dual_axe_skin_06",
			"dw_dual_axe_skin_07"
		},
		unique = {
			"dw_dual_axe_skin_07_runed_01",
			"dw_dual_axe_skin_06_runed_01"
		},
		bogenhafen = {
			"dw_dual_axe_skin_06_runed_02"
		}
	},
	dr_2h_axe_skins = {
		common = {
			"dw_2h_axe_skin_03",
			"dw_2h_axe_skin_02"
		},
		rare = {
			"dw_2h_axe_skin_03",
			"dw_2h_axe_skin_02",
			"dw_2h_axe_skin_04"
		},
		exotic = {
			"dw_2h_axe_skin_03",
			"dw_2h_axe_skin_02",
			"dw_2h_axe_skin_06",
			"dw_2h_axe_skin_04",
			"dw_2h_axe_skin_05"
		},
		unique = {
			"dw_2h_axe_skin_06_runed_01",
			"dw_2h_axe_skin_05_runed_01"
		},
		bogenhafen = {
			"dw_2h_axe_skin_06_runed_02"
		}
	},
	dr_crossbow_skins = {
		common = {},
		rare = {
			"dw_crossbow_skin_02"
		},
		exotic = {
			"dw_crossbow_skin_02",
			"dw_crossbow_skin_03",
			"dw_crossbow_skin_04",
			"dw_crossbow_skin_05"
		},
		unique = {
			"dw_crossbow_skin_02_runed_01",
			"dw_crossbow_skin_04_runed_01"
		},
		bogenhafen = {
			"dw_crossbow_skin_04_runed_02"
		}
	},
	dr_2h_hammer_skins = {
		common = {
			"dw_2h_hammer_skin_02",
			"dw_2h_hammer_skin_03"
		},
		rare = {
			"dw_2h_hammer_skin_02",
			"dw_2h_hammer_skin_03",
			"dw_2h_hammer_skin_04"
		},
		exotic = {
			"dw_2h_hammer_skin_04",
			"dw_2h_hammer_skin_05",
			"dw_2h_hammer_skin_06",
			"dw_2h_hammer_skin_02",
			"dw_2h_hammer_skin_03"
		},
		unique = {
			"dw_2h_hammer_skin_01_runed_01",
			"dw_2h_hammer_skin_04_runed_01"
		},
		bogenhafen = {
			"dw_2h_hammer_skin_04_runed_02"
		}
	},
	dr_1h_hammer_skins = {
		common = {},
		rare = {
			"dw_1h_hammer_skin_02"
		},
		exotic = {
			"dw_1h_hammer_skin_02",
			"dw_1h_hammer_skin_03",
			"dw_1h_hammer_skin_04",
			"dw_1h_hammer_skin_05",
			"dw_1h_hammer_skin_06"
		},
		unique = {
			"dw_1h_hammer_skin_02_runed_01",
			"dw_1h_hammer_skin_04_runed_01"
		},
		bogenhafen = {
			"dw_1h_hammer_skin_04_runed_02"
		}
	},
	dr_shield_axe_skins = {
		common = {
			"dw_1h_axe_shield_skin_02",
			"dw_1h_axe_shield_skin_03"
		},
		rare = {
			"dw_1h_axe_shield_skin_02",
			"dw_1h_axe_shield_skin_03",
			"dw_1h_axe_shield_skin_04"
		},
		exotic = {
			"dw_1h_axe_shield_skin_02",
			"dw_1h_axe_shield_skin_03",
			"dw_1h_axe_shield_skin_04",
			"dw_1h_axe_shield_skin_05"
		},
		unique = {
			"dw_1h_axe_shield_skin_02_runed_01",
			"dw_1h_axe_shield_skin_05_runed_01"
		},
		bogenhafen = {
			"dw_1h_axe_shield_skin_05_runed_02"
		}
	},
	dr_shield_hammer_skins = {
		common = {
			"dw_1h_hammer_shield_skin_02",
			"dw_1h_hammer_shield_skin_03"
		},
		rare = {
			"dw_1h_hammer_shield_skin_02",
			"dw_1h_hammer_shield_skin_03",
			"dw_1h_hammer_shield_skin_04"
		},
		exotic = {
			"dw_1h_hammer_shield_skin_02",
			"dw_1h_hammer_shield_skin_03",
			"dw_1h_hammer_shield_skin_04",
			"dw_1h_hammer_shield_skin_05"
		},
		unique = {
			"dw_1h_hammer_shield_skin_02_runed_01",
			"dw_1h_hammer_shield_skin_04_runed_01"
		},
		bogenhafen = {
			"dw_1h_hammer_shield_skin_04_runed_02"
		}
	},
	dr_rakegun_skins = {
		common = {
			"dw_grudge_raker_skin_02"
		},
		rare = {
			"dw_grudge_raker_skin_02",
			"dw_grudge_raker_skin_03"
		},
		exotic = {
			"dw_grudge_raker_skin_02",
			"dw_grudge_raker_skin_03"
		},
		unique = {
			"dw_grudge_raker_skin_01_runed_01",
			"dw_grudge_raker_skin_02_runed_01"
		},
		bogenhafen = {
			"dw_grudge_raker_skin_02_runed_02"
		}
	},
	dr_handgun_skins = {
		common = {
			"dw_handgun_skin_03",
			"dw_handgun_skin_02"
		},
		rare = {
			"dw_handgun_skin_03",
			"dw_handgun_skin_02",
			"dw_handgun_skin_04"
		},
		exotic = {
			"dw_handgun_skin_03",
			"dw_handgun_skin_02",
			"dw_handgun_skin_04",
			"dw_handgun_skin_05"
		},
		unique = {
			"dw_handgun_skin_05_runed_01",
			"dw_handgun_skin_02_runed_01"
		},
		bogenhafen = {
			"dw_handgun_skin_05_runed_02"
		}
	},
	dr_drake_pistol_skins = {
		common = {
			"dw_drake_pistol_skin_02"
		},
		rare = {
			"dw_drake_pistol_skin_02",
			"dw_drake_pistol_skin_03"
		},
		exotic = {
			"dw_drake_pistol_skin_02",
			"dw_drake_pistol_skin_03",
			"dw_drake_pistol_skin_04"
		},
		unique = {
			"dw_drake_pistol_skin_03_runed_01",
			"dw_drake_pistol_skin_04_runed_01"
		},
		bogenhafen = {
			"dw_drake_pistol_skin_04_runed_02"
		}
	},
	dr_drakegun_skins = {
		common = {},
		rare = {
			"dw_drakegun_skin_01"
		},
		exotic = {
			"dw_drakegun_skin_01",
			"dw_drakegun_skin_03"
		},
		unique = {
			"dw_drakegun_skin_01_runed_01",
			"dw_drakegun_skin_03_runed_01"
		},
		bogenhafen = {
			"dw_drakegun_skin_03_runed_02"
		}
	},
	dr_2h_pick_skins = {
		common = {
			"dw_2h_pick_skin_02"
		},
		rare = {
			"dw_2h_pick_skin_02",
			"dw_2h_pick_skin_03"
		},
		exotic = {
			"dw_2h_pick_skin_02",
			"dw_2h_pick_skin_03",
			"dw_2h_pick_skin_04"
		},
		unique = {
			"dw_2h_pick_skin_03_runed_01",
			"dw_2h_pick_skin_04_runed_01"
		},
		bogenhafen = {
			"dw_2h_pick_skin_04_runed_02"
		}
	},
	wh_2h_sword_skins = {
		common = {
			"wh_2h_sword_skin_03",
			"wh_2h_sword_skin_02"
		},
		rare = {
			"wh_2h_sword_skin_03",
			"wh_2h_sword_skin_02",
			"wh_2h_sword_skin_04"
		},
		exotic = {
			"wh_2h_sword_skin_03",
			"wh_2h_sword_skin_02",
			"wh_2h_sword_skin_04",
			"wh_2h_sword_skin_05"
		},
		unique = {
			"wh_2h_sword_skin_02_runed_01",
			"wh_2h_sword_skin_05_runed_01"
		},
		bogenhafen = {
			"wh_2h_sword_skin_05_runed_02"
		}
	},
	wh_fencing_sword_skins = {
		common = {
			"wh_fencing_sword_skin_02",
			"wh_fencing_sword_skin_08",
			"wh_fencing_sword_skin_03"
		},
		rare = {
			"wh_fencing_sword_skin_02",
			"wh_fencing_sword_skin_08",
			"wh_fencing_sword_skin_03",
			"wh_fencing_sword_skin_06"
		},
		exotic = {
			"wh_fencing_sword_skin_02",
			"wh_fencing_sword_skin_08",
			"wh_fencing_sword_skin_07",
			"wh_fencing_sword_skin_03",
			"wh_fencing_sword_skin_06",
			"wh_fencing_sword_skin_04",
			"wh_fencing_sword_skin_05"
		},
		unique = {
			"wh_fencing_sword_skin_01_runed_01"
		},
		bogenhafen = {
			"wh_fencing_sword_skin_01_runed_02"
		}
	},
	wh_brace_of_pistols_skins = {
		common = {
			"wh_brace_of_pistols_skin_04",
			"wh_brace_of_pistols_skin_02"
		},
		rare = {
			"wh_brace_of_pistols_skin_04",
			"wh_brace_of_pistols_skin_02",
			"wh_brace_of_pistols_skin_05"
		},
		exotic = {
			"wh_brace_of_pistols_skin_04",
			"wh_brace_of_pistols_skin_05",
			"wh_brace_of_pistols_skin_02",
			"wh_brace_of_pistols_skin_03"
		},
		unique = {
			"wh_brace_of_pistols_skin_03_runed_01",
			"wh_brace_of_pistols_skin_05_runed_01"
		},
		bogenhafen = {
			"wh_brace_of_pistols_skin_03_runed_02"
		}
	},
	wh_repeating_pistols_skins = {
		common = {
			"wh_repeating_pistol_skin_02",
			"wh_repeating_pistol_skin_03"
		},
		rare = {
			"wh_repeating_pistol_skin_02",
			"wh_repeating_pistol_skin_03",
			"wh_repeating_pistol_skin_04"
		},
		exotic = {
			"wh_repeating_pistol_skin_02",
			"wh_repeating_pistol_skin_03",
			"wh_repeating_pistol_skin_04",
			"wh_repeating_pistol_skin_05"
		},
		unique = {
			"wh_repeating_pistol_skin_02_runed_01",
			"wh_repeating_pistol_skin_04_runed_01"
		},
		bogenhafen = {
			"wh_repeating_pistol_skin_02_runed_02"
		}
	},
	wh_crossbow_repeater_skins = {
		common = {},
		rare = {
			"wh_repeating_crossbow_skin_02"
		},
		exotic = {
			"wh_repeating_crossbow_skin_02",
			"wh_repeating_crossbow_skin_03"
		},
		unique = {
			"wh_repeating_crossbow_skin_03_runed_01"
		},
		bogenhafen = {
			"wh_repeating_crossbow_skin_03_runed_02"
		}
	},
	wh_crossbow_skins = {
		common = {
			"wh_crossbow_skin_01",
			"wh_crossbow_skin_02",
			"wh_crossbow_skin_03"
		},
		rare = {
			"wh_crossbow_skin_01",
			"wh_crossbow_skin_02",
			"wh_crossbow_skin_03",
			"wh_crossbow_skin_04"
		},
		exotic = {
			"wh_crossbow_skin_01",
			"wh_crossbow_skin_02",
			"wh_crossbow_skin_03",
			"wh_crossbow_skin_04",
			"wh_crossbow_skin_06",
			"wh_crossbow_skin_07"
		},
		unique = {
			"wh_crossbow_skin_04_runed_01",
			"wh_crossbow_skin_02_runed_01"
		},
		bogenhafen = {
			"wh_crossbow_skin_04_runed_02"
		}
	},
	wh_1h_falchion_skins = {
		common = {
			"wh_1h_falchion_skin_02"
		},
		rare = {
			"wh_1h_falchion_skin_02",
			"wh_1h_falchion_skin_03"
		},
		exotic = {
			"wh_1h_falchion_skin_02",
			"wh_1h_falchion_skin_03",
			"wh_1h_falchion_skin_04"
		},
		unique = {
			"wh_1h_falchion_skin_01_runed_01",
			"wh_1h_falchion_skin_02_runed_01"
		},
		bogenhafen = {
			"wh_1h_falchion_skin_02_runed_02"
		}
	},
	es_1h_flail_skins = {
		common = {
			"es_1h_flail_skin_02",
			"es_1h_flail_skin_03"
		},
		rare = {
			"es_1h_flail_skin_02",
			"es_1h_flail_skin_03",
			"es_1h_flail_skin_04"
		},
		exotic = {
			"es_1h_flail_skin_02",
			"es_1h_flail_skin_03",
			"es_1h_flail_skin_04",
			"es_1h_flail_skin_05"
		},
		unique = {
			"es_1h_flail_skin_02_runed_01",
			"es_1h_flail_skin_05_runed_01"
		},
		bogenhafen = {
			"es_1h_flail_skin_05_runed_02"
		}
	}
}
WeaponSkins.skin_weights = {
	common = 10,
	default = 1,
	exotic = 50,
	plentiful = 1,
	rare = 20,
	unique = 100
}
WeaponSkins.default_skins = {
	bw_skullstaff_fireball = "bw_fireball_staff_skin_01",
	bw_flame_sword = "bw_1h_flaming_sword_skin_01",
	es_blunderbuss = "es_blunderbuss_skin_03",
	wh_1h_falchion = "wh_1h_falchion_skin_01",
	we_shortbow_hagbane = "we_hagbane_skin_01",
	we_spear = "we_spear_skin_01",
	we_dual_wield_daggers = "we_dual_dagger_skin_01",
	we_crossbow_repeater = "we_crossbow_skin_01",
	we_2h_sword = "we_2h_sword_skin_01",
	bw_skullstaff_flamethrower = "bw_flamethrower_staff_skin_01",
	bw_sword = "bw_1h_sword_skin_01",
	we_1h_sword = "we_sword_skin_01",
	dr_1h_axe = "dw_1h_axe_skin_01",
	dr_crossbow = "dw_crossbow_skin_01",
	bw_1h_mace = "bw_1h_mace_skin_01",
	es_1h_mace = "es_1h_mace_skin_01",
	we_2h_axe = "we_2h_axe_skin_01",
	es_handgun = "es_handgun_skin_03",
	es_2h_sword_executioner = "es_2h_sword_exe_skin_01",
	dr_1h_hammer = "dw_1h_hammer_skin_01",
	dr_shield_axe = "dw_1h_axe_shield_skin_01",
	dr_rakegun = "dw_grudge_raker_skin_01",
	we_dual_wield_swords = "we_dual_sword_skin_04",
	wh_2h_sword = "wh_2h_sword_skin_01",
	dr_drake_pistol = "dw_drake_pistol_skin_01",
	dr_2h_pick = "dw_2h_pick_skin_01",
	bw_skullstaff_geiser = "bw_conflagration_staff_skin_01",
	dr_handgun = "dw_handgun_skin_01",
	wh_fencing_sword = "wh_fencing_sword_skin_01",
	bw_skullstaff_beam = "bw_beam_staff_skin_01",
	es_2h_hammer = "es_2h_hammer_skin_05",
	wh_repeating_pistols = "wh_repeating_pistol_skin_01",
	we_dual_wield_sword_dagger = "we_dual_sword_dagger_skin_04",
	es_mace_shield = "es_1h_mace_shield_skin_02",
	dr_2h_axe = "dw_2h_axe_skin_01",
	es_1h_flail = "es_1h_flail_skin_01",
	es_sword_shield = "es_1h_sword_shield_skin_02",
	we_shortbow = "we_shortbow_skin_01",
	es_longbow = "es_longbow_skin_01",
	dr_shield_hammer = "dw_1h_hammer_shield_skin_01",
	es_2h_sword = "es_2h_sword_skin_01",
	es_halberd = "es_halberd_skin_01",
	we_longbow = "we_longbow_skin_01",
	wh_brace_of_pistols = "wh_brace_of_pistols_skin_01",
	wh_crossbow = "wh_crossbow_skin_05",
	wh_crossbow_repeater = "wh_repeating_crossbow_skin_01",
	es_1h_sword = "es_1h_sword_skin_01",
	wh_1h_axe = "wh_1h_axe_skin_05",
	es_repeating_handgun = "es_repeating_handgun_skin_01",
	dr_2h_hammer = "dw_2h_hammer_skin_01",
	bw_dagger = "bw_dagger_skin_01",
	bw_skullstaff_spear = "bw_spear_staff_skin_01",
	dr_dual_wield_axes = "dw_dual_axe_skin_01",
	dr_drakegun = "dw_drakegun_skin_02"
}
local skins = {}
local duplicate_skins = {}

for _, skin in pairs(WeaponSkins.skins) do
	if not skins[skin.name] then
		skins[skin.name] = skin.data
	else
		duplicate_skins[#duplicate_skins + 1] = skin.name
	end
end

WeaponSkins.skins = skins

for _, dlc in pairs(DLCSettings) do
	local file_names = dlc.weapon_skins_file_names

	if file_names then
		for _, file_name in ipairs(file_names) do
			require(file_name)
		end
	end
end

WeaponSkins.item_has_skin_table = function (item_master_list_key)
	return WeaponSkins.skins[item_master_list_key] ~= nil
end

WeaponSkins.will_have_skin = function (rarity)
	local item_rarity = rarity
	local weight = WeaponSkins.skin_weights[item_rarity]
	local rand = math.random(1, 100)

	return rand < weight
end

WeaponSkins.is_matching_skin = function (weapon_name, skin_name)
	local item_data = ItemMasterList[weapon_name]
	local skin_combination_table = item_data.skin_combination_table
	local skin_tables = WeaponSkins.skin_combinations[skin_combination_table]

	for _, skin_table in pairs(skin_tables) do
		if table.contains(skin_table, skin_name) then
			return true
		end
	end

	for item_name, default_skin_name in pairs(WeaponSkins.default_skins) do
		if skin_name == default_skin_name then
			for inner_item_name, inner_item_data in pairs(ItemMasterList) do
				if inner_item_data.slot_type == "weapon_skin" and inner_item_data.matching_item_key == item_name then
					return true
				end
			end
		end
	end

	return false
end

WeaponSkins.matching_weapon_skin_item_key = function (skin_name)
	for item_name, item_data in pairs(ItemMasterList) do
		if item_data.skin_combination_table then
			local skin_tables = WeaponSkins.skin_combinations[item_data.skin_combination_table]

			for rarity, skin_table in pairs(skin_tables) do
				if table.contains(skin_table, skin_name) then
					for inner_item_name, inner_item_data in pairs(ItemMasterList) do
						if inner_item_data.slot_type == "weapon_skin" and inner_item_data.matching_item_key == item_name then
							return inner_item_name, rarity
						end
					end
				end
			end
		end
	end

	for item_name, default_skin_name in pairs(WeaponSkins.default_skins) do
		if skin_name == default_skin_name then
			for inner_item_name, inner_item_data in pairs(ItemMasterList) do
				if inner_item_data.slot_type == "weapon_skin" and inner_item_data.matching_item_key == item_name then
					return inner_item_name, inner_item_data.rarity
				end
			end
		end
	end
end

return
