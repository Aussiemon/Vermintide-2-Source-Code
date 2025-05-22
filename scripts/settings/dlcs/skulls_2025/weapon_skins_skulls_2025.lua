-- chunkname: @scripts/settings/dlcs/skulls_2025/weapon_skins_skulls_2025.lua

local skins = {
	{
		name = "dw_dual_axe_skin_06_runed_04",
		data = {
			description = "dw_dual_axe_skin_06_runed_04_description",
			display_name = "dw_dual_axe_skin_06_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_dual_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_axe_03_t2_dual",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			template = "dual_wield_axes_template_1",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson,
		},
	},
	{
		name = "we_spear_skin_03_runed_04",
		data = {
			description = "we_spear_skin_03_runed_04_description",
			display_name = "we_spear_skin_03_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_2h_spears_wood_elf",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_spear_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_spear_03/wpn_we_spear_03_runed_01",
			template = "two_handed_spears_elf_template_1",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson,
		},
	},
	{
		name = "es_halberd_skin_04_runed_04",
		data = {
			description = "es_halberd_skin_04_runed_04_description",
			display_name = "es_halberd_skin_04_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_2h_halberds",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_wh_halberd_04",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_halberd_04/wpn_wh_halberd_04_runed_01",
			template = "two_handed_halberds_template_1",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson,
		},
	},
	{
		name = "bw_flamethrower_staff_skin_02_runed_04",
		data = {
			description = "bw_flamethrower_staff_skin_02_runed_04_description",
			display_name = "bw_flamethrower_staff_skin_02_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_flame_staff_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_02/wpn_brw_flame_staff_02_runed_01",
			template = "staff_flamethrower_template",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson,
		},
	},
	{
		name = "wh_repeating_crossbow_skin_03_runed_04",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			description = "wh_repeating_crossbow_skin_03_runed_04_description",
			display_name = "wh_repeating_crossbow_skin_03_runed_04_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_fencing_sword",
			inventory_icon = "icon_wpn_wh_repeater_crossbow_t3",
			left_hand_unit = "units/weapons/player/wpn_wh_repeater_crossbow_t3/wpn_wh_repeater_crossbow_t3_runed_01",
			rarity = "unique",
			template = "repeating_crossbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson,
		},
	},
}
local skin_combinations = {
	dr_dual_wield_axes_skins = {
		unique = {
			"dw_dual_axe_skin_06_runed_04",
		},
	},
	we_spear_skins = {
		unique = {
			"we_spear_skin_03_runed_04",
		},
	},
	es_halberd_skins = {
		unique = {
			"es_halberd_skin_04_runed_04",
		},
	},
	bw_skullstaff_flamethrower_skins = {
		unique = {
			"bw_flamethrower_staff_skin_02_runed_04",
		},
	},
	wh_crossbow_repeater_skins = {
		unique = {
			"wh_repeating_crossbow_skin_03_runed_04",
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
