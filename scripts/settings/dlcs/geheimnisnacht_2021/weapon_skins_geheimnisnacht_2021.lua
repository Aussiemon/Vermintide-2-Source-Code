local skins = {
	{
		name = "es_2h_sword_skin_02_runed_03",
		data = {
			description = "es_2h_sword_skin_02_runed_03_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_01_t2/wpn_2h_sword_01_t2_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_2h_sword_01_t2_runed_03",
			display_name = "es_2h_sword_skin_02_runed_03_name",
			template = "two_handed_swords_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow
		}
	},
	{
		name = "dw_2h_axe_skin_05_runed_03",
		data = {
			description = "dw_2h_axe_skin_05_runed_03_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_03_t1/wpn_dw_2h_axe_03_t1_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_2h_axe_03_t1_runed_03",
			display_name = "dw_2h_axe_skin_05_runed_03_name",
			template = "two_handed_axes_template_1",
			display_unit = "units/weapons/weapon_display/display_2h_axes",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow
		}
	},
	{
		name = "bw_dagger_skin_04_runed_03",
		data = {
			description = "bw_dagger_skin_04_runed_03_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_04/wpn_brw_dagger_04_runed_01",
			hud_icon = "weapon_generic_icon_daggers",
			inventory_icon = "icon_wpn_brw_dagger_04_runed_03",
			display_name = "bw_dagger_skin_04_runed_03_name",
			template = "one_handed_daggers_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_dagger_wizard",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow
		}
	},
	{
		name = "we_2h_axe_skin_07_runed_03",
		data = {
			description = "we_2h_axe_skin_07_runed_03_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_04_t1/wpn_we_2h_axe_04_t1_runed_01",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_2h_axe_04_t1_runed_03",
			display_name = "we_2h_axe_skin_07_runed_03_name",
			template = "two_handed_axes_template_2",
			display_unit = "units/weapons/weapon_display/display_2h_axes",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow
		}
	},
	{
		name = "es_1h_flail_skin_02_runed_03",
		data = {
			description = "es_1h_flail_skin_02_runed_03_description",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_02_t1/wpn_emp_flail_02_t1_runed_01",
			hud_icon = "weapon_generic_icon_mace",
			inventory_icon = "icon_wpn_emp_flail_02_t1_runed_03",
			display_name = "es_1h_flail_skin_02_runed_03_name",
			template = "one_handed_flail_template_1",
			display_unit = "units/weapons/weapon_display/display_1h_flail",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow
		}
	}
}
local skin_combinations = {
	es_2h_sword_skins = {
		geheimnisnacht = {
			"es_2h_sword_skin_02_runed_03"
		}
	},
	dr_2h_axe_skins = {
		geheimnisnacht = {
			"dw_2h_axe_skin_05_runed_03"
		}
	},
	bw_dagger_skins = {
		geheimnisnacht = {
			"bw_dagger_skin_04_runed_03"
		}
	},
	we_2h_axe_skins = {
		geheimnisnacht = {
			"we_2h_axe_skin_07_runed_03"
		}
	},
	es_1h_flail_skins = {
		geheimnisnacht = {
			"es_1h_flail_skin_02_runed_03"
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

return
