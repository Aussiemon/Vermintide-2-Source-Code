-- chunkname: @scripts/settings/dlcs/geheimnisnacht_2026/weapon_skins_geheimnisnacht_2026.lua

local skins = {
	{
		name = "dw_drake_pistol_skin_04_runed_03",
		data = {
			description = "dw_drake_pistol_skin_04_runed_03_description",
			display_name = "dw_drake_pistol_skin_04_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_drakefire_pistols",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icons_placeholder",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t2/wpn_dw_drake_pistol_02_t2_runed_01",
			material_settings_name = "golden_glow",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t2/wpn_dw_drake_pistol_02_t2_runed_01",
			template = "brace_of_drakefirepistols_template_1",
		},
	},
	{
		name = "we_dual_sword_skin_05_runed_03",
		data = {
			description = "we_dual_sword_skin_05_runed_03_description",
			display_name = "we_dual_sword_skin_05_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_dual_weapons",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icons_placeholder",
			left_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			material_settings_name = "golden_glow",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			template = "dual_wield_swords_template_1",
		},
	},
	{
		name = "es_longbow_skin_05_runed_03",
		data = {
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			description = "es_longbow_skin_05_runed_03_description",
			display_name = "es_longbow_skin_05_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_longbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icons_placeholder",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_05/wpn_emp_bow_05_runed_01",
			material_settings_name = "golden_glow",
			rarity = "unique",
			template = "longbow_empire_template",
		},
	},
	{
		name = "wh_brace_of_pistols_skin_05_runed_03",
		data = {
			description = "wh_brace_of_pistols_skin_05_runed_03_description",
			display_name = "wh_brace_of_pistols_skin_05_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_pistols",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			inventory_icon = "icons_placeholder",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_runed_01",
			material_settings_name = "golden_glow",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_runed_01",
			template = "brace_of_pistols_template_1",
		},
	},
	{
		name = "bw_1h_sword_skin_02_runed_03",
		data = {
			description = "bw_1h_sword_skin_02_runed_03_description",
			display_name = "bw_1h_sword_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_swords_wizard",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icons_placeholder",
			material_settings_name = "golden_glow",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t2/wpn_brw_sword_01_t2_runed_01",
			template = "one_handed_swords_template_1",
		},
	},
}
local skin_combinations = {
	dr_drake_pistol_skins = {
		unique = {
			"dw_drake_pistol_skin_04_runed_03",
		},
	},
	we_dual_wield_swords_skins = {
		unique = {
			"we_dual_sword_skin_05_runed_03",
		},
	},
	es_longbow_skins = {
		unique = {
			"es_longbow_skin_05_runed_03",
		},
	},
	wh_brace_of_pistols_skins = {
		unique = {
			"wh_brace_of_pistols_skin_05_runed_03",
		},
	},
	bw_sword_skins = {
		unique = {
			"bw_1h_sword_skin_02_runed_03",
		},
	},
}

for _, skin in ipairs(skins) do
	WeaponSkins.skins[skin.name] = skin.data
end

for weapon_name, skin_data in pairs(skin_combinations) do
	if not WeaponSkins.skin_combinations[weapon_name] then
		WeaponSkins.skin_combinations[weapon_name] = {}
	end

	for weapon_rarity, skin_names in pairs(skin_data) do
		if not WeaponSkins.skin_combinations[weapon_name][weapon_rarity] then
			WeaponSkins.skin_combinations[weapon_name][weapon_rarity] = {}
		end

		for _, skin_name in ipairs(skin_names) do
			WeaponSkins.skin_combinations[weapon_name][weapon_rarity][#WeaponSkins.skin_combinations[weapon_name][weapon_rarity] + 1] = skin_name
		end
	end
end
