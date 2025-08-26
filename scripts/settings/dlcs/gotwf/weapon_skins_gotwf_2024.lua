-- chunkname: @scripts/settings/dlcs/gotwf/weapon_skins_gotwf_2024.lua

local skins = {
	{
		name = "bw_necromancy_staff_skin_02_runed_05",
		data = {
			description = "bw_necromancy_staff_skin_02_runed_05_description",
			display_name = "bw_necromancy_staff_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_necromancy_staff_skin_02_runed_05",
			left_hand_unit = "units/weapons/player/wpn_invisible_weapon",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_bw_necromancy_staff_02/wpn_bw_necromancy_staff_02_runed_01",
			template = "staff_death",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "bw_1h_sword_skin_01_runed_05",
		data = {
			description = "bw_1h_sword_skin_01_runed_05_description",
			display_name = "bw_1h_sword_skin_01_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_1h_swords_wizard",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_1h_sword_skin_01_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t1/wpn_brw_sword_01_t1_runed_01",
			template = "one_handed_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "dr_2h_cog_hammer_skin_02_runed_05",
		data = {
			description = "dr_2h_cog_hammer_skin_02_runed_05_description",
			display_name = "dr_2h_cog_hammer_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_2h_hammers",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dr_2h_cog_hammer_skin_02_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_coghammer_01_t2/wpn_dw_coghammer_01_t2_runed",
			template = "two_handed_cog_hammers_template_1",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "dw_drakegun_skin_03_runed_05",
		data = {
			description = "dw_drakegun_skin_03_runed_05_description",
			display_name = "dw_drakegun_skin_03_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_drakegun",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_drakegun_skin_03_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_03/wpn_dw_iron_drake_03_runed_01",
			template = "drakegun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "es_bastard_sword_skin_03_runed_05",
		data = {
			description = "es_bastard_sword_skin_03_runed_05_description",
			display_name = "es_bastard_sword_skin_03_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_bastard_sword_skin_03_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_gk_sword_02_t1/wpn_emp_gk_sword_02_t1_runed_01",
			template = "bastard_sword_template",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "es_blunderbuss_skin_02_runed_05",
		data = {
			description = "es_blunderbuss_skin_02_runed_05_description",
			display_name = "es_blunderbuss_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_blunderbusses",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_blunderbuss_skin_02_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_02_t2/wpn_empire_blunderbuss_02_t2_runed_01",
			template = "blunderbuss_template_1",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "we_life_staff_skin_02_runed_05",
		data = {
			description = "we_life_staff_skin_02_runed_05_description",
			display_name = "we_life_staff_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "icons_placeholder",
			inventory_icon = "icon_we_life_staff_skin_02_runed_05",
			left_hand_unit = "units/weapons/player/wpn_we_life_staff_02/wpn_we_life_staff_02_runed",
			rarity = "unique",
			template = "staff_life",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "we_dual_sword_skin_02_runed_05",
		data = {
			description = "we_dual_sword_skin_02_runed_05_description",
			display_name = "we_dual_sword_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_dual_weapons",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_dual_sword_skin_02_runed_05",
			left_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_runed_01",
			template = "dual_wield_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "wh_2h_hammer_skin_02_runed_05",
		data = {
			description = "wh_2h_hammer_skin_02_runed_05_description",
			display_name = "wh_2h_hammer_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_2h_hammers",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wh_2h_hammer_skin_02_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_2h_hammer_02/wpn_wh_2h_hammer_02_runed",
			template = "one_handed_hammer_priest_template",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "wh_crossbow_skin_02_runed_05",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			description = "wh_crossbow_skin_02_runed_05_description",
			display_name = "wh_crossbow_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_crossbow",
			inventory_icon = "icon_wh_crossbow_skin_02_runed_05",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_02_t2/wpn_emp_crossbow_02_t2_runed_01",
			rarity = "unique",
			template = "crossbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
}
local skin_combinations = {
	bw_necromancy_staff_skins = {
		unique = {
			"bw_necromancy_staff_skin_02_runed_05",
		},
	},
	bw_sword_skins = {
		unique = {
			"bw_1h_sword_skin_01_runed_05",
		},
	},
	dr_2h_cog_hammer_skins = {
		unique = {
			"dr_2h_cog_hammer_skin_02_runed_05",
		},
	},
	dr_drakegun_skins = {
		unique = {
			"dw_drakegun_skin_03_runed_05",
		},
	},
	es_bastard_sword_skins = {
		unique = {
			"es_bastard_sword_skin_03_runed_05",
		},
	},
	es_blunderbuss_skins = {
		unique = {
			"es_blunderbuss_skin_02_runed_05",
		},
	},
	life_staff_skins = {
		unique = {
			"we_life_staff_skin_02_runed_05",
		},
	},
	we_dual_wield_swords_skins = {
		unique = {
			"we_dual_sword_skin_02_runed_05",
		},
	},
	wh_2h_hammer_skins = {
		unique = {
			"wh_2h_hammer_skin_02_runed_05",
		},
	},
	wh_crossbow_skins = {
		unique = {
			"wh_crossbow_skin_02_runed_05",
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
