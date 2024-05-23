-- chunkname: @scripts/settings/dlcs/morris_2024/weapon_skins_morris_2024.lua

local skins = {
	{
		name = "we_dual_dagger_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "we_dual_dagger_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_dual_daggers",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_dagger_01_t2_dual_runed_06",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_runed_01",
			template = "dual_wield_daggers_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "es_longbow_skin_05_runed_06",
		data = {
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "es_longbow_skin_05_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_longbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_bow_05_runed_06",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_05/wpn_emp_bow_05_runed_01",
			rarity = "unique",
			template = "longbow_empire_template",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "dw_handgun_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "dw_handgun_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_1h_handguns",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_handgun_01_t2_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_01_t2/wpn_dw_handgun_01_t2_runed_01",
			template = "handgun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "bw_conflagration_staff_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "bw_conflagration_staff_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_staff_04_runed_06",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_04/wpn_brw_staff_04_runed_01",
			template = "staff_fireball_geiser_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "wh_2h_sword_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "wh_2h_sword_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			hud_icon = "weapon_generic_icon_sword",
			inventory_icon = "icon_wpn_empire_2h_sword_02_t2_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_02_t2/wpn_2h_sword_02_t2_runed_01",
			template = "two_handed_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "we_hagbane_skin_04_runed_06",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "we_hagbane_skin_04_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_bow_short_04_runed_06",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_04/wpn_we_bow_short_04_runed_01",
			rarity = "unique",
			template = "shortbow_hagbane_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "es_2h_sword_exe_skin_04_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "es_2h_sword_exe_skin_04_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords_executioner",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_sword_exe_04_t1_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_04_t1/wpn_emp_sword_exe_04_t1_runed_01",
			template = "two_handed_swords_executioner_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "dw_1h_hammer_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "dw_1h_hammer_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_1h_hammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_hammer_01_t2_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_01_t2/wpn_dw_hammer_01_t2_runed_01",
			template = "one_handed_hammer_template_2",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "bw_spear_staff_skin_04_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "bw_spear_staff_skin_04_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_spear_staff_04_runed_06",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_04/wpn_brw_spear_staff_04_runed_01",
			template = "staff_spark_spear_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "wh_repeating_crossbow_skin_03_runed_06",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "wh_repeating_crossbow_skin_03_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_fencing_sword",
			inventory_icon = "icon_wpn_wh_repeater_crossbow_t3_runed_06",
			left_hand_unit = "units/weapons/player/wpn_wh_repeater_crossbow_t3/wpn_wh_repeater_crossbow_t3_runed_01",
			rarity = "unique",
			template = "repeating_crossbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "we_spear_skin_04_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "we_spear_skin_04_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_2h_spears_wood_elf",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_spear_04_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_spear_04/wpn_we_spear_04_runed_01",
			template = "two_handed_spears_elf_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "es_blunderbuss_skin_04_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "es_blunderbuss_skin_04_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_blunderbusses",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_empire_blunderbuss_t2_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_t2/wpn_empire_blunderbuss_t2_runed_01",
			template = "blunderbuss_template_1",
			action_anim_overrides = {
				animation_variation_id = 0,
			},
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "dw_1h_axe_shield_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "dw_1h_axe_shield_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_shield",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_shield_02_axe_runed_06",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_02_t1/wpn_dw_shield_02_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_03_t2/wpn_dw_axe_03_t2_runed_01",
			template = "one_hand_axe_shield_template_1",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "bw_1h_mace_skin_05_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "bw_1h_mace_skin_05_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_1h_hammer_wizard",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_mace_05_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_05/wpn_brw_mace_05_runed_01",
			template = "one_handed_hammer_wizard_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "wh_brace_of_pistols_skin_05_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "wh_brace_of_pistols_skin_05_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_pistols",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			inventory_icon = "icon_wpn_emp_pistol_03_t2_runed_06",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_runed_01",
			template = "brace_of_pistols_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "we_crossbow_skin_03_runed_06",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_pile",
			ammo_unit_3p = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt_3p",
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "we_crossbow_skin_03_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_repeater_crossbow_t3_runed_06",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t3/wpn_we_repeater_crossbow_t3_runed_01",
			rarity = "unique",
			template = "repeating_crossbow_elf_template",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "es_repeating_handgun_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "es_repeating_handgun_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_repeating_handguns",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_emp_handgun_repeater_t2_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t2/wpn_emp_handgun_repeater_t2_runed_01",
			template = "repeating_handgun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "dw_2h_pick_skin_03_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "dw_2h_pick_skin_03_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_2h_picks",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_pick_01_t3_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t3/wpn_dw_pick_01_t3_runed_01",
			template = "two_handed_picks_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "bw_1h_flaming_sword_skin_01_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "bw_1h_flaming_sword_skin_01_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_1h_swords_wizard",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_flaming_sword_01_t1_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_01_t1/wpn_brw_flaming_sword_01_t1_runed_01",
			template = "flaming_sword_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "wh_1h_axe_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "wh_1h_axe_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_1h_axes",
			hud_icon = "weapon_generic_icon_axe1h",
			inventory_icon = "icon_wpn_axe_02_t2_runed_06",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_axe_02_t2/wpn_axe_02_t2_runed_01",
			template = "one_hand_axe_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "we_longbow_skin_06_runed_06",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "we_longbow_skin_06_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_we_bow_03_t2_runed_06",
			left_hand_unit = "units/weapons/player/wpn_we_bow_03_t2/wpn_we_bow_03_t2_runed_01",
			rarity = "unique",
			template = "longbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "es_1h_mace_shield_skin_02_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "es_1h_mace_shield_skin_02_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_shield_hammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_empire_shield_02_mace_runed_06",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_02/wpn_emp_shield_02_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_02_t2/wpn_emp_mace_02_t2_runed_01",
			template = "one_handed_hammer_shield_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "dw_drake_pistol_skin_03_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "dw_drake_pistol_skin_03_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_drakefire_pistols",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_dw_drake_pistol_02_t1_runed_06",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t1/wpn_dw_drake_pistol_02_t1_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_02_t1/wpn_dw_drake_pistol_02_t1_runed_01",
			template = "brace_of_drakefirepistols_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "bw_flamethrower_staff_skin_05_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "bw_flamethrower_staff_skin_05_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wpn_brw_flame_staff_05_runed_06",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_05/wpn_brw_flame_staff_05_runed_01",
			template = "staff_flamethrower_template",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
	{
		name = "wh_fencing_sword_skin_01_runed_06",
		data = {
			description = "chaos_wastes_weapon_skin_runed_06_description",
			display_name = "wh_fencing_sword_skin_01_runed_06_name",
			display_unit = "units/weapons/weapon_display/display_fencing_swords",
			hud_icon = "weapon_generic_icon_fencing_sword",
			inventory_icon = "icon_wpn_fencingsword_01_t1_runed_06",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_02_t2/wpn_emp_pistol_02_t2_runed_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_01_t1/wpn_fencingsword_01_t1_runed_01",
			template = "fencing_sword_template_1",
			material_settings = WeaponMaterialSettingsTemplates.lileath,
		},
	},
}
local skin_combinations = {
	we_dual_wield_daggers_skins = {
		unique = {
			"we_dual_dagger_skin_02_runed_06",
		},
	},
	es_longbow_skins = {
		unique = {
			"es_longbow_skin_05_runed_06",
		},
	},
	dr_handgun_skins = {
		unique = {
			"dw_handgun_skin_02_runed_06",
		},
	},
	bw_skullstaff_geiser_skins = {
		unique = {
			"bw_conflagration_staff_skin_02_runed_06",
		},
	},
	wh_2h_sword_skins = {
		unique = {
			"wh_2h_sword_skin_02_runed_06",
		},
	},
	we_shortbow_hagbane_skins = {
		unique = {
			"we_hagbane_skin_04_runed_06",
		},
	},
	es_2h_sword_executioner_skins = {
		unique = {
			"es_2h_sword_exe_skin_04_runed_06",
		},
	},
	dr_1h_hammer_skins = {
		unique = {
			"dw_1h_hammer_skin_02_runed_06",
		},
	},
	bw_skullstaff_spear_skins = {
		unique = {
			"bw_spear_staff_skin_04_runed_06",
		},
	},
	wh_crossbow_repeater_skins = {
		unique = {
			"wh_repeating_crossbow_skin_03_runed_06",
		},
	},
	we_spear_skins = {
		unique = {
			"we_spear_skin_04_runed_06",
		},
	},
	es_blunderbuss_skins = {
		unique = {
			"es_blunderbuss_skin_04_runed_06",
		},
	},
	dr_shield_axe_skins = {
		unique = {
			"dw_1h_axe_shield_skin_02_runed_06",
		},
	},
	bw_1h_mace_skins = {
		unique = {
			"bw_1h_mace_skin_05_runed_06",
		},
	},
	wh_brace_of_pistols_skins = {
		unique = {
			"wh_brace_of_pistols_skin_05_runed_06",
		},
	},
	we_crossbow_repeater_skins = {
		unique = {
			"we_crossbow_skin_03_runed_06",
		},
	},
	es_repeating_handgun_skins = {
		unique = {
			"es_repeating_handgun_skin_02_runed_06",
		},
	},
	dr_2h_pick_skins = {
		unique = {
			"dw_2h_pick_skin_03_runed_06",
		},
	},
	bw_flame_sword_skins = {
		unique = {
			"bw_1h_flaming_sword_skin_01_runed_06",
		},
	},
	wh_1h_axe_skins = {
		unique = {
			"wh_1h_axe_skin_02_runed_06",
		},
	},
	we_longbow_skins = {
		unique = {
			"we_longbow_skin_06_runed_06",
		},
	},
	es_mace_shield_skins = {
		unique = {
			"es_1h_mace_shield_skin_02_runed_06",
		},
	},
	dr_drake_pistol_skins = {
		unique = {
			"dw_drake_pistol_skin_03_runed_06",
		},
	},
	bw_skullstaff_flamethrower_skins = {
		unique = {
			"bw_flamethrower_staff_skin_05_runed_06",
		},
	},
	wh_fencing_sword_skins = {
		unique = {
			"wh_fencing_sword_skin_01_runed_06",
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
