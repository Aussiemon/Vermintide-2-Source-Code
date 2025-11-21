-- chunkname: @scripts/settings/dlcs/gotwf/weapon_skins_gotwf_2025.lua

local skins = {
	{
		name = "dr_deus_01_skin_03_runed_05",
		data = {
			ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03",
			ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_03/wpn_dr_deus_projectile_03_3p",
			description = "dr_deus_01_skin_03_runed_05_description",
			display_name = "dr_deus_01_skin_03_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_trollhammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dr_deus_01_skin_03_runed_05",
			left_hand_unit = "units/weapons/player/wpn_dr_deus_03/wpn_dr_deus_03_runed",
			rarity = "unique",
			template = "dr_deus_01_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "dw_1h_hammer_shield_skin_04_runed_05",
		data = {
			description = "dw_1h_hammer_shield_skin_04_runed_05_description",
			display_name = "dw_1h_hammer_shield_skin_04_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_shield_hammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_1h_hammer_shield_skin_04_runed_05",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_02_t1/wpn_dw_shield_02_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t2/wpn_dw_hammer_02_t2_runed_01",
			template = "one_handed_hammer_shield_template_2",
			left_hand_unit_override = {
				dr_engineer = "units/weapons/player/wpn_dw_shield_02_t1/wpn_dw_e_shield_02_runed_01",
			},
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "we_deus_01_skin_02_runed_05",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02",
			ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_02_3p",
			description = "we_deus_01_skin_02_runed_05_description",
			display_name = "we_deus_01_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_bow",
			inventory_icon = "icon_wpn_we_deus_01_skin_02_runed_05",
			left_hand_unit = "units/weapons/player/wpn_we_deus_02/wpn_we_deus_02_runed",
			rarity = "unique",
			template = "we_deus_01_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "we_sword_skin_05_runed_05",
		data = {
			description = "we_sword_skin_05_runed_05_description",
			display_name = "we_sword_skin_05_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_1h_swords_wood_elf",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_sword_skin_05_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_02_t2/wpn_we_sword_02_t2_runed_01",
			template = "we_one_hand_sword_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "es_deus_01_skin_01_runed_05",
		data = {
			description = "es_deus_01_skin_01_runed_05_description",
			display_name = "es_deus_01_skin_01_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_shield_sword",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_es_deus_01_skin_01_runed_05",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_es_deus_spear_01/wpn_es_deus_spear_01_runed",
			template = "es_deus_01_template",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "es_longbow_skin_04_runed_05",
		data = {
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			description = "es_longbow_skin_04_runed_05_description",
			display_name = "es_longbow_skin_04_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_longbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_es_longbow_skin_04_runed_05",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_04/wpn_emp_bow_04_runed_01",
			rarity = "unique",
			template = "longbow_empire_template",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "bw_ghost_scythe_skin_02_runed_05",
		data = {
			description = "bw_ghost_scythe_skin_02_runed_05_description",
			display_name = "bw_ghost_scythe_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_bw_ghost_scythe_skin_02_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_runed_01",
			template = "staff_scythe",
			right_hand_unit_override = {
				bw_adept = "units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_runed_01_fire",
				bw_scholar = "units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_runed_01_fire",
				bw_unchained = "units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_runed_01_fire",
			},
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "bw_beam_staff_skin_04_runed_05",
		data = {
			description = "bw_beam_staff_skin_04_runed_05_description",
			display_name = "bw_beam_staff_skin_04_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_bw_beam_staff_skin_04_runed_05",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_04/wpn_brw_beam_staff_04_runed_01",
			template = "staff_blast_beam_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "wh_hammer_book_skin_02_runed_05",
		data = {
			description = "wh_hammer_book_skin_02_runed_05_description",
			display_name = "wh_hammer_book_skin_02_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_hammer_book",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_wh_hammer_book_skin_02_runed_05",
			left_hand_unit = "units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_runed",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_book_02/wpn_wh_book_02_runed",
			template = "one_handed_hammer_book_priest_template",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
	{
		name = "wh_2h_sword_skin_05_runed_05",
		data = {
			description = "wh_2h_sword_skin_05_runed_05_description",
			display_name = "wh_2h_sword_skin_05_runed_05_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			hud_icon = "weapon_generic_icon_sword",
			inventory_icon = "icon_wpn_wh_2h_sword_skin_05_runed_05",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_05_t1/wpn_2h_sword_05_t1_runed_01",
			template = "two_handed_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
		},
	},
}
local skin_combinations = {
	dr_deus_01_skins = {
		unique = {
			"dr_deus_01_skin_03_runed_05",
		},
	},
	dr_shield_hammer_skins = {
		unique = {
			"dw_1h_hammer_shield_skin_04_runed_05",
		},
	},
	we_deus_01_skins = {
		unique = {
			"we_deus_01_skin_02_runed_05",
		},
	},
	we_1h_sword_skins = {
		unique = {
			"we_sword_skin_05_runed_05",
		},
	},
	es_deus_01_skins = {
		unique = {
			"es_deus_01_skin_01_runed_05",
		},
	},
	es_longbow_skins = {
		unique = {
			"es_longbow_skin_04_runed_05",
		},
	},
	bw_ghost_scythe_skins = {
		unique = {
			"bw_ghost_scythe_skin_02_runed_05",
		},
	},
	bw_skullstaff_beam_skins = {
		unique = {
			"bw_beam_staff_skin_04_runed_05",
		},
	},
	wh_hammer_book_skins = {
		unique = {
			"wh_hammer_book_skin_02_runed_05",
		},
	},
	wh_2h_sword_skins = {
		unique = {
			"wh_2h_sword_skin_05_runed_05",
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
