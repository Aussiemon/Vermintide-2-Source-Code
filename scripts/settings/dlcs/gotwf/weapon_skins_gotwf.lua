local skins = {
	{
		name = "dr_steam_pistol_skin_02_runed_05",
		data = {
			description = "dr_steam_pistol_skin_02_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_steam_pistol_01_t2/wpn_dw_steam_pistol_01_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_steam_pistol_01_t2_runed_03",
			display_name = "dr_steam_pistol_skin_02_runed_05_name",
			template = "heavy_steam_pistol_template_1",
			display_unit = "units/weapons/weapon_display/display_pistols",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
			action_anim_overrides = {
				animation_variation_id = 1
			}
		}
	},
	{
		name = "we_javelin_skin_02_runed_05",
		data = {
			description = "we_javelin_skin_02_runed_05_description",
			ammo_unit = "units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_runed",
			right_hand_unit = "units/weapons/player/wpn_invisible_weapon",
			rarity = "unique",
			inventory_icon = "icon_wpn_we_javelin_02_runed_02_03",
			left_hand_unit = "units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_runed",
			display_name = "we_javelin_skin_02_runed_05_name",
			template = "javelin_template",
			hud_icon = "icons_placeholder",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			projectile_units_template = "javelin_02_runed",
			material_settings = WeaponMaterialSettingsTemplates.life_green
		}
	},
	{
		name = "bw_deus_01_skin_02_runed_05",
		data = {
			description = "bw_deus_01_skin_02_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed",
			display_name = "bw_deus_01_skin_02_runed_05_name",
			inventory_icon = "icon_wpn_brw_magmastaff_t2_runed_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "bw_deus_01_template",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff",
			right_hand_unit_override = {
				bw_necromancer = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_runed_baelfire"
			},
			material_settings = WeaponMaterialSettingsTemplates.life_green
		}
	},
	{
		name = "es_dual_wield_hammer_sword_skin_02_runed_05",
		data = {
			description = "es_dual_wield_hammer_sword_skin_02_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_05_t2/wpn_emp_mace_05_t2_runed_01",
			template = "dual_wield_hammer_sword_template",
			inventory_icon = "icon_es_dual_wield_hammer_sword_02_runed_02",
			left_hand_unit = "units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_runed_01",
			display_name = "es_dual_wield_hammer_sword_skin_02_runed_05_name",
			hud_icon = "weapon_generic_icon_falken",
			material_settings = WeaponMaterialSettingsTemplates.life_green
		}
	},
	{
		name = "wh_deus_01_skin_03_runed_05",
		data = {
			description = "wh_deus_01_skin_03_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_runed",
			display_name = "wh_deus_01_skin_03_runed_05_name",
			inventory_icon = "icon_wpn_emp_duckfoot_t3_runed_02",
			left_hand_unit = "units/weapons/player/wpn_wh_deus_03/wpn_wh_deus_03_runed",
			template = "wh_deus_01_template_1",
			hud_icon = "weapon_generic_icon_bow",
			display_unit = "units/weapons/weapon_display/display_drakefire_pistols",
			material_settings = WeaponMaterialSettingsTemplates.life_green
		}
	},
	{
		name = "dw_2h_hammer_skin_01_runed_05",
		data = {
			description = "dw_2h_hammer_skin_01_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_01_t1/wpn_dw_2h_hammer_01_t1_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "dw_2h_hammer_01_t1_runed_02",
			display_name = "dw_2h_hammer_skin_01_runed_05_name",
			template = "two_handed_hammers_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_hammers",
			material_settings = WeaponMaterialSettingsTemplates.life_green
		}
	},
	{
		name = "es_handgun_skin_02_runed_05",
		data = {
			description = "es_handgun_skin_02_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "empire_handgun_02_t2_runed_02",
			display_name = "es_handgun_skin_02_runed_05_name",
			template = "handgun_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_handguns",
			material_settings = WeaponMaterialSettingsTemplates.life_green,
			action_anim_overrides = {
				animation_variation_id = 1
			}
		}
	},
	{
		name = "we_dual_dagger_skin_02_runed_05",
		data = {
			description = "we_dual_dagger_skin_02_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			display_name = "we_dual_dagger_skin_02_runed_05_name",
			inventory_icon = "we_dagger_01_t2_dual_runed_02",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_dual_daggers",
			material_settings = WeaponMaterialSettingsTemplates.life_green
		}
	},
	{
		name = "bw_1h_flaming_sword_skin_01_runed_05",
		data = {
			description = "bw_1h_flaming_sword_skin_01_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t1/wpn_brw_flaming_sword_01_t1_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_flaming_sword_01_t1_runed_02",
			display_name = "bw_1h_flaming_sword_skin_01_runed_05_name",
			template = "flaming_sword_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_swords_wizard",
			material_settings = WeaponMaterialSettingsTemplates.life_green
		}
	},
	{
		name = "wh_brace_of_pistols_skin_03_runed_05",
		data = {
			description = "wh_brace_of_pistols_skin_03_runed_05_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2_runed_01",
			display_name = "wh_brace_of_pistols_skin_03_runed_05_name",
			inventory_icon = "icon_wpn_emp_pistol_02_t2_runed_02",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2_runed_01",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			material_settings = WeaponMaterialSettingsTemplates.life_green
		}
	}
}
local skin_combinations = {
	dr_steam_pistol_skins = {
		unique = {
			"dr_steam_pistol_skin_02_runed_05"
		}
	},
	we_javelin_skins = {
		unique = {
			"we_javelin_skin_02_runed_05"
		}
	},
	bw_deus_01_skins = {
		unique = {
			"bw_deus_01_skin_02_runed_05"
		}
	},
	es_dual_wield_hammer_sword_skins = {
		unique = {
			"es_dual_wield_hammer_sword_skin_02_runed_05"
		}
	},
	wh_deus_01_skins = {
		unique = {
			"wh_deus_01_skin_03_runed_05"
		}
	},
	dr_2h_hammer_skins = {
		unique = {
			"dw_2h_hammer_skin_01_runed_05"
		}
	},
	es_handgun_skins = {
		unique = {
			"es_handgun_skin_02_runed_05"
		}
	},
	we_dual_wield_daggers_skins = {
		unique = {
			"we_dual_dagger_skin_02_runed_05"
		}
	},
	bw_flame_sword_skins = {
		unique = {
			"bw_1h_flaming_sword_skin_01_runed_05"
		}
	},
	wh_brace_of_pistols_skins = {
		unique = {
			"wh_brace_of_pistols_skin_03_runed_05"
		}
	}
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
