local skins = {
	{
		name = "es_2h_sword_exe_skin_05_runed_04",
		data = {
			description = "es_2h_sword_exe_skin_05_runed_04_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_05_t1/wpn_emp_sword_exe_05_t1_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_sword_exe_05_t1_runed_04",
			display_name = "es_2h_sword_exe_skin_05_runed_04_name",
			template = "two_handed_swords_executioner_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_swords_executioner",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson
		}
	},
	{
		name = "bw_fireball_staff_skin_01_runed_04",
		data = {
			description = "bw_fireball_staff_skin_01_runed_04_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_02/wpn_brw_staff_02_runed_01",
			display_name = "bw_fireball_staff_skin_01_runed_04_name",
			inventory_icon = "icon_wpn_bw_fireball_staff_01_runed_04",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			template = "staff_fireball_fireball_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_staff",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson
		}
	},
	{
		name = "wh_brace_of_pistols_skin_05_runed_04",
		data = {
			description = "wh_brace_of_pistols_skin_05_runed_04_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_runed_01",
			display_name = "wh_brace_of_pistols_skin_05_runed_04_name",
			inventory_icon = "icon_wpn_emp_pistol_02_t2_runed_04",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_runed_01",
			template = "brace_of_pistols_template_1",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			display_unit = "units/weapons/weapon_display/display_pistols",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson
		}
	},
	{
		name = "we_dual_dagger_skin_01_runed_04",
		data = {
			description = "we_dual_dagger_skin_01_runed_04_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01",
			display_name = "we_dual_dagger_skin_01_runed_04_name",
			inventory_icon = "icon_wpn_we_dagger_01_t1_dual_runed_04",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01",
			template = "dual_wield_daggers_template_1",
			hud_icon = "weapon_generic_icon_staff_3",
			display_unit = "units/weapons/weapon_display/display_dual_daggers",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson
		}
	},
	{
		name = "dw_handgun_skin_02_runed_04",
		data = {
			description = "dw_handgun_skin_02_runed_04_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_02_t3/wpn_dw_handgun_02_t3_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_handgun_01_t2_runed_04",
			display_name = "dw_handgun_skin_02_runed_04_name",
			template = "handgun_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_handguns",
			material_settings = WeaponMaterialSettingsTemplates.deep_crimson
		}
	}
}
local skin_combinations = {
	es_2h_sword_executioner_skins = {
		unique = {
			"es_2h_sword_exe_skin_05_runed_04"
		}
	},
	bw_skullstaff_fireball_skins = {
		unique = {
			"bw_fireball_staff_skin_01_runed_04"
		}
	},
	wh_brace_of_pistols_skins = {
		unique = {
			"wh_brace_of_pistols_skin_05_runed_04"
		}
	},
	we_dual_wield_daggers_skins = {
		unique = {
			"we_dual_dagger_skin_01_runed_04"
		}
	},
	dr_handgun_skins = {
		unique = {
			"dw_handgun_skin_02_runed_04"
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
