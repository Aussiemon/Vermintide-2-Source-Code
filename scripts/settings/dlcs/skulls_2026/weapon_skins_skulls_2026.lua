-- chunkname: @scripts/settings/dlcs/skulls_2026/weapon_skins_skulls_2026.lua

local skins = {
	{
		name = "dw_crossbow_skin_02_runed_04",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			description = "dw_crossbow_skin_02_runed_04_description",
			display_name = "dw_crossbow_skin_02_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_crossbow_skin_02_runed_04",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_01_t2/wpn_dw_xbow_01_t2_runed_01",
			material_settings_name = "deep_crimson",
			rarity = "unique",
			template = "crossbow_template_1",
		},
	},
	{
		name = "we_longbow_skin_05_runed_04",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			description = "we_longbow_skin_05_runed_04_description",
			display_name = "we_longbow_skin_05_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_longbow_skin_05_runed_04",
			left_hand_unit = "units/weapons/player/wpn_we_bow_03_t1/wpn_we_bow_03_t1_runed_01",
			material_settings_name = "deep_crimson",
			rarity = "unique",
			template = "longbow_template_1",
		},
	},
	{
		name = "es_blunderbuss_skin_04_runed_04",
		data = {
			description = "es_blunderbuss_skin_04_runed_04_description",
			display_name = "es_blunderbuss_skin_04_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_blunderbusses",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_es_blunderbuss_skin_04_runed_04",
			material_settings_name = "deep_crimson",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_t2/wpn_empire_blunderbuss_t2_runed_01",
			template = "blunderbuss_template_1",
			action_anim_overrides = {
				animation_variation_id = 0,
			},
		},
	},
	{
		name = "es_1h_flail_skin_05_runed_04",
		data = {
			description = "es_1h_flail_skin_05_runed_04_description",
			display_name = "es_1h_flail_skin_05_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_1h_flail",
			hud_icon = "weapon_generic_icon_mace",
			inventory_icon = "icon_wpn_es_1h_flail_skin_05_runed_04",
			material_settings_name = "deep_crimson",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_05_t1/wpn_emp_flail_05_t1_runed_01",
			template = "one_handed_flail_template_1",
		},
	},
	{
		name = "bw_dagger_skin_05_runed_04",
		data = {
			description = "bw_dagger_skin_05_runed_04_description",
			display_name = "bw_dagger_skin_05_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_1h_dagger_wizard",
			hud_icon = "weapon_generic_icon_daggers",
			inventory_icon = "icon_wpn_bw_dagger_skin_05_runed_04",
			material_settings_name = "deep_crimson",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_05/wpn_brw_dagger_05_runed_01",
			template = "one_handed_daggers_template_1",
		},
	},
}
local skin_combinations = {
	dr_crossbow_skins = {
		unique = {
			"dw_crossbow_skin_02_runed_04",
		},
	},
	we_longbow_skins = {
		unique = {
			"we_longbow_skin_05_runed_04",
		},
	},
	es_blunderbuss_skins = {
		unique = {
			"es_blunderbuss_skin_04_runed_04",
		},
	},
	es_1h_flail_skins = {
		unique = {
			"es_1h_flail_skin_05_runed_04",
		},
	},
	bw_dagger_skins = {
		unique = {
			"bw_dagger_skin_05_runed_04",
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
