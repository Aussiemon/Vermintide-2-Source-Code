-- chunkname: @scripts/settings/dlcs/geheimnisnacht_2021/weapon_skins_geheimnisnacht_2021.lua

local skins = {
	{
		name = "dw_grudge_raker_skin_01_runed_03",
		data = {
			description = "dw_grudge_raker_skin_01_runed_03_description",
			display_name = "dw_grudge_raker_skin_01_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_grudge_raker",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_rakegun_t1_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_rakegun_t1/wpn_dw_rakegun_t1_runed_01",
			template = "grudge_raker_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "es_handgun_skin_02_runed_03",
		data = {
			description = "es_handgun_skin_02_runed_03_description",
			display_name = "es_handgun_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_handguns",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_empire_handgun_02_t2_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2_runed_01",
			template = "handgun_template_1",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "wh_repeating_pistol_skin_02_runed_03",
		data = {
			description = "wh_repeating_pistol_skin_02_runed_03_description",
			display_name = "wh_repeating_pistol_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_repeating_handguns",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			inventory_icon = "icon_wpn_empire_pistol_repeater_t2_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater/wpn_empire_pistol_repeater_t2_runed_01",
			template = "repeating_pistol_template_1",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "bw_fireball_staff_skin_01_runed_03",
		data = {
			description = "bw_fireball_staff_skin_01_runed_03_description",
			display_name = "bw_fireball_staff_skin_01_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_staff_02_runed_03",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_02/wpn_brw_staff_02_runed_01",
			template = "staff_fireball_fireball_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "we_crossbow_skin_02_runed_03",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			description = "we_crossbow_skin_02_runed_03_description",
			display_name = "we_crossbow_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_repeater_crossbow_t2_runed_03",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t2/wpn_we_repeater_crossbow_t2_runed_01",
			rarity = "unique",
			template = "repeating_crossbow_elf_template",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "we_longbow_skin_06_runed_03",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			description = "we_longbow_skin_06_runed_03_description",
			display_name = "we_longbow_skin_06_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_bow_03_t2_runed_03",
			left_hand_unit = "units/weapons/player/wpn_we_bow_03_t2/wpn_we_bow_03_t2_runed_01",
			rarity = "unique",
			template = "longbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "wh_crossbow_skin_04_runed_03",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			description = "wh_crossbow_skin_04_runed_03_description",
			display_name = "wh_crossbow_skin_04_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_crossbow",
			inventory_icon = "icon_wpn_emp_crossbow_03_t2_runed_03",
			left_hand_unit = "units/weapons/player/wpn_emp_crossbow_03_t2/wpn_emp_crossbow_03_t2_runed_01",
			rarity = "unique",
			template = "crossbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "bw_spear_staff_skin_04_runed_03",
		data = {
			description = "bw_spear_staff_skin_04_runed_03_description",
			display_name = "bw_spear_staff_skin_04_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_spear_staff_04_runed_03",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_04/wpn_brw_spear_staff_04_runed_01",
			template = "staff_spark_spear_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "dw_handgun_skin_02_runed_03",
		data = {
			description = "dw_handgun_skin_02_runed_03_description",
			display_name = "dw_handgun_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_handguns",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_handgun_01_t2_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_01_t2/wpn_dw_handgun_01_t2_runed_01",
			template = "handgun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "es_repeating_handgun_skin_02_runed_03",
		data = {
			description = "es_repeating_handgun_skin_02_runed_03_description",
			display_name = "es_repeating_handgun_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_repeating_handguns",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_handgun_repeater_t2_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t2/wpn_emp_handgun_repeater_t2_runed_01",
			template = "repeating_handgun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "bw_1h_flaming_sword_skin_01_runed_03",
		data = {
			description = "bw_1h_flaming_sword_skin_01_runed_03_description",
			display_name = "bw_1h_flaming_sword_skin_01_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_swords_wizard",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_flaming_sword_01_t1_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t1/wpn_brw_flaming_sword_01_t1_runed_01",
			template = "flaming_sword_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "we_dual_sword_dagger_skin_02_runed_03",
		data = {
			description = "we_dual_sword_dagger_skin_02_runed_03_description",
			display_name = "we_dual_sword_dagger_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_dual_weapons",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_sword_01_t2_dagger_dual_runed_01",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_runed_01",
			template = "dual_wield_sword_dagger_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "dw_1h_axe_shield_skin_05_runed_03",
		data = {
			description = "dw_1h_axe_shield_skin_05_runed_03_description",
			display_name = "dw_1h_axe_shield_skin_05_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_shield",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_1h_axe_shield_skin_05_runed_03",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_05_t1/wpn_dw_shield_05_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			template = "one_hand_axe_shield_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
			action_anim_overrides = {
				animation_variation_id = 1,
			},
		},
	},
	{
		name = "wh_fencing_sword_skin_01_runed_03",
		data = {
			description = "wh_fencing_sword_skin_01_runed_03_description",
			display_name = "wh_fencing_sword_skin_01_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_fencing_swords",
			hud_icon = "weapon_generic_icon_fencing_sword",
			inventory_icon = "icon_wpn_fencingsword_01_t1_runed_01",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_01_t1/wpn_fencingsword_01_t1_runed_01",
			template = "fencing_sword_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "es_1h_sword_shield_skin_03_runed_03",
		data = {
			description = "es_1h_sword_shield_skin_03_runed_03_description",
			display_name = "es_1h_sword_shield_skin_03_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_shield_sword",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_empire_shield_03_sword_runed_01",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_03/wpn_emp_shield_03_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_02_t2/wpn_emp_sword_02_t2_runed_01",
			template = "one_handed_sword_shield_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "es_2h_sword_skin_02_runed_03",
		data = {
			description = "es_2h_sword_skin_02_runed_03_description",
			display_name = "es_2h_sword_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_2h_sword_01_t2_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_01_t2/wpn_2h_sword_01_t2_runed_01",
			template = "two_handed_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "dw_2h_axe_skin_05_runed_03",
		data = {
			description = "dw_2h_axe_skin_05_runed_03_description",
			display_name = "dw_2h_axe_skin_05_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_2h_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_2h_axe_03_t1_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_03_t1/wpn_dw_2h_axe_03_t1_runed_01",
			template = "two_handed_axes_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "bw_dagger_skin_04_runed_03",
		data = {
			description = "bw_dagger_skin_04_runed_03_description",
			display_name = "bw_dagger_skin_04_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_dagger_wizard",
			hud_icon = "weapon_generic_icon_daggers",
			inventory_icon = "icon_wpn_brw_dagger_04_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_04/wpn_brw_dagger_04_runed_01",
			template = "one_handed_daggers_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "we_2h_axe_skin_07_runed_03",
		data = {
			description = "we_2h_axe_skin_07_runed_03_description",
			display_name = "we_2h_axe_skin_07_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_2h_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_2h_axe_04_t1_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_04_t1/wpn_we_2h_axe_04_t1_runed_01",
			template = "two_handed_axes_template_2",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
	{
		name = "es_1h_flail_skin_02_runed_03",
		data = {
			description = "es_1h_flail_skin_02_runed_03_description",
			display_name = "es_1h_flail_skin_02_runed_03_name",
			display_unit = "units/weapons/weapon_display/display_1h_flail",
			hud_icon = "weapon_generic_icon_mace",
			inventory_icon = "icon_wpn_emp_flail_02_t1_runed_03",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_02_t1/wpn_emp_flail_02_t1_runed_01",
			template = "one_handed_flail_template_1",
			material_settings = WeaponMaterialSettingsTemplates.golden_glow,
		},
	},
}
local skin_combinations = {
	dr_rakegun_skins = {
		unique = {
			"dw_grudge_raker_skin_01_runed_03",
		},
	},
	es_handgun_skins = {
		unique = {
			"es_handgun_skin_02_runed_03",
		},
	},
	wh_repeating_pistols_skins = {
		unique = {
			"wh_repeating_pistol_skin_02_runed_03",
		},
	},
	bw_skullstaff_fireball_skins = {
		unique = {
			"bw_fireball_staff_skin_01_runed_03",
		},
	},
	we_crossbow_repeater_skins = {
		unique = {
			"we_crossbow_skin_02_runed_03",
		},
	},
	we_longbow_skins = {
		unique = {
			"we_longbow_skin_06_runed_03",
		},
	},
	wh_crossbow_skins = {
		unique = {
			"wh_crossbow_skin_04_runed_03",
		},
	},
	bw_skullstaff_spear_skins = {
		unique = {
			"bw_spear_staff_skin_04_runed_03",
		},
	},
	dr_handgun_skins = {
		unique = {
			"dw_handgun_skin_02_runed_03",
		},
	},
	es_repeating_handgun_skins = {
		unique = {
			"es_repeating_handgun_skin_02_runed_03",
		},
	},
	dr_shield_axe_skins = {
		unique = {
			"dw_1h_axe_shield_skin_05_runed_03",
		},
	},
	we_dual_wield_sword_dagger_skins = {
		unique = {
			"we_dual_sword_dagger_skin_02_runed_03",
		},
	},
	bw_flame_sword_skins = {
		unique = {
			"bw_1h_flaming_sword_skin_01_runed_03",
		},
	},
	wh_fencing_sword_skins = {
		unique = {
			"wh_fencing_sword_skin_01_runed_03",
		},
	},
	es_sword_shield_skins = {
		unique = {
			"es_1h_sword_shield_skin_03_runed_03",
		},
	},
	es_2h_sword_skins = {
		unique = {
			"es_2h_sword_skin_02_runed_03",
		},
	},
	dr_2h_axe_skins = {
		unique = {
			"dw_2h_axe_skin_05_runed_03",
		},
	},
	bw_dagger_skins = {
		unique = {
			"bw_dagger_skin_04_runed_03",
		},
	},
	we_2h_axe_skins = {
		unique = {
			"we_2h_axe_skin_07_runed_03",
		},
	},
	es_1h_flail_skins = {
		unique = {
			"es_1h_flail_skin_02_runed_03",
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
