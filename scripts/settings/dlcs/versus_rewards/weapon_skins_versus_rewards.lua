-- chunkname: @scripts/settings/dlcs/versus_rewards/weapon_skins_versus_rewards.lua

local skins = {
	{
		name = "es_2h_sword_exe_skin_03_magic_02",
		data = {
			description = "es_2h_sword_exe_skin_03_magic_02_description",
			display_name = "es_2h_sword_exe_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords_executioner",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_emp_sword_exe_03_t1_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_exe_03_t1/wpn_emp_sword_exe_03_t1_magic_01",
			template = "two_handed_swords_executioner_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_2h_sword_skin_03_magic_02",
		data = {
			description = "es_2h_sword_skin_03_magic_02_description",
			display_name = "es_2h_sword_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_2h_sword_skin_03_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_03_t1/wpn_2h_sword_03_t1_magic_01",
			template = "two_handed_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_2h_sword_skin_04_magic_02",
		data = {
			description = "wh_2h_sword_skin_04_magic_02_description",
			display_name = "wh_2h_sword_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			hud_icon = "weapon_generic_icon_sword",
			inventory_icon = "icon_wh_2h_sword_skin_04_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_sword_04_t2/wpn_2h_sword_04_t2_magic_01",
			template = "two_handed_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_2h_hammer_skin_02_magic_02",
		data = {
			description = "es_2h_hammer_skin_02_magic_02_description",
			display_name = "es_2h_hammer_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_hammers",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_2h_hammer_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_2h_hammer_01_t2/wpn_2h_hammer_01_t2_magic_01",
			template = "two_handed_hammers_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_spear_skin_02_magic_02",
		data = {
			description = "we_spear_skin_02_magic_02_description",
			display_name = "we_spear_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_spears_wood_elf",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_spear_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_spear_02/wpn_we_spear_02_magic_01",
			template = "two_handed_spears_elf_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_1h_flail_skin_04_magic_02",
		data = {
			description = "es_1h_flail_skin_04_magic_02_description",
			display_name = "es_1h_flail_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_flail",
			hud_icon = "weapon_generic_icon_mace",
			inventory_icon = "icon_es_1h_flail_skin_04_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_04_t1/wpn_emp_flail_04_t1_magic_01",
			template = "one_handed_flail_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_1h_sword_skin_04_magic_02",
		data = {
			description = "es_1h_sword_skin_04_magic_02_description",
			display_name = "es_1h_sword_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_1h_sword_skin_04_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_03_t2/wpn_emp_sword_03_t2_magic_01",
			template = "one_handed_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_2h_axe_skin_03_magic_02",
		data = {
			description = "we_2h_axe_skin_03_magic_02_description",
			display_name = "we_2h_axe_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_2h_axe_02_t1_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_2h_axe_02_t1/wpn_we_2h_axe_02_t1_magic_01",
			template = "two_handed_axes_template_2",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_1h_axe_skin_02_magic_02",
		data = {
			description = "we_1h_axe_skin_02_magic_02_description",
			display_name = "we_1h_axe_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_axes",
			hud_icon = "weapon_generic_icon_falken",
			inventory_icon = "icon_we_1h_axe_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_axe_03_t2/wpn_we_axe_03_t2_magic_01",
			slot_type = "melee",
			template = "we_one_hand_axe_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_2h_sword_skin_08_magic_02",
		data = {
			description = "we_2h_sword_skin_08_magic_02_description",
			display_name = "we_2h_sword_skin_08_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords_wood_elf",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_2h_sword_04_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_2h_sword_04_t2/wpn_we_2h_sword_04_t2_magic_01",
			template = "two_handed_swords_wood_elf_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_dual_dagger_skin_07_magic_02",
		data = {
			description = "we_dual_dagger_skin_07_magic_02_description",
			display_name = "we_dual_dagger_skin_07_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_dual_daggers",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_dagger_03_t2_magic_01_we_dagger_03_t2_magic_01",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_03_t2/wpn_we_dagger_03_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_dagger_03_t2/wpn_we_dagger_03_t2_magic_01",
			template = "dual_wield_daggers_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_dual_sword_dagger_skin_07_magic_02",
		data = {
			description = "we_dual_sword_dagger_skin_07_magic_02_description",
			display_name = "we_dual_sword_dagger_skin_07_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_dual_weapons",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_dual_sword_dagger_skin_07_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_dagger_03_t2/wpn_we_dagger_03_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1_magic_01",
			template = "dual_wield_sword_dagger_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_dual_sword_skin_06_magic_02",
		data = {
			description = "we_dual_sword_skin_06_magic_02_description",
			display_name = "we_dual_sword_skin_06_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_dual_weapons",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_dual_sword_skin_06_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1_magic_01",
			template = "dual_wield_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_sword_skin_06_magic_02",
		data = {
			description = "we_sword_skin_06_magic_02_description",
			display_name = "we_sword_skin_06_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_sword_skin_06_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_sword_03_t1/wpn_we_sword_03_t1_magic_01",
			template = "we_one_hand_sword_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_longbow_skin_02_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			description = "we_longbow_skin_02_magic_02_description",
			display_name = "we_longbow_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_longbow_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_bow_01_t2/wpn_we_bow_01_t2_magic_01",
			rarity = "unique",
			template = "longbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_1h_falchion_skin_04_magic_02",
		data = {
			description = "wh_1h_falchion_skin_04_magic_02_description",
			display_name = "wh_1h_falchion_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_falchions",
			hud_icon = "weapon_generic_icon_falken",
			inventory_icon = "icon_wh_1h_falchion_skin_04_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_05_t2/wpn_emp_sword_05_t2_magic_01",
			template = "one_hand_falchion_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_dual_wield_axe_falchion_skin_01_magic_02",
		data = {
			description = "wh_dual_wield_axe_falchion_skin_01_magic_02_description",
			display_name = "wh_dual_wield_axe_falchion_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/dual_wield_axe_falchion",
			hud_icon = "weapon_generic_icon_falken",
			inventory_icon = "icon_wh_dual_wield_axe_falchion_skin_01_magic_02",
			left_hand_unit = "units/weapons/player/wpn_emp_sword_05_t2/wpn_emp_sword_05_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_axe_hatchet_t2/wpn_axe_hatchet_t2_magic_01",
			slot_type = "melee",
			template = "dual_wield_axe_falchion_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_1h_axe_skin_06_magic_02",
		data = {
			description = "wh_1h_axe_skin_06_magic_02_description",
			display_name = "wh_1h_axe_skin_06_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_axes",
			hud_icon = "weapon_generic_icon_axe1h",
			inventory_icon = "icon_wh_1h_axe_skin_06_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_axe_hatchet_t2/wpn_axe_hatchet_t2_magic_01",
			template = "one_hand_axe_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_dual_wield_hammer_sword_skin_02_magic_02",
		data = {
			description = "es_dual_wield_hammer_sword_skin_02_magic_02_description",
			display_name = "es_dual_wield_hammer_sword_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_dual_weapons",
			hud_icon = "weapon_generic_icon_falken",
			inventory_icon = "icon_es_dual_wield_hammer_sword_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_emp_sword_06_t2/wpn_emp_sword_06_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_04_t3/wpn_emp_mace_04_t3_magic_01",
			slot_type = "melee",
			template = "dual_wield_hammer_sword_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_1h_mace_skin_05_magic_02",
		data = {
			description = "es_1h_mace_skin_05_magic_02_description",
			display_name = "es_1h_mace_skin_05_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_hammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_1h_mace_skin_05_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_03_t2/wpn_emp_mace_03_t2_magic_01",
			template = "one_handed_hammer_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_crossbow_skin_01_magic_02",
		data = {
			description = "we_crossbow_skin_01_magic_02_description",
			display_name = "we_crossbow_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_repeater_crossbow_t1_magic_01",
			left_hand_unit = "units/weapons/player/wpn_we_repeater_crossbow_t1/wpn_we_repeater_crossbow_t1_magic_01",
			rarity = "unique",
			template = "repeating_crossbow_elf_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_longbow_skin_04_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_emp_arrows/wpn_es_arrow_t1",
			description = "es_longbow_skin_04_magic_02_description",
			display_name = "es_longbow_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_longbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_longbow_skin_04_magic_02",
			left_hand_unit = "units/weapons/player/wpn_emp_bow_04/wpn_emp_bow_04_magic_01",
			rarity = "unique",
			template = "longbow_empire_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_halberd_skin_03_magic_02",
		data = {
			description = "es_halberd_skin_03_magic_02_description",
			display_name = "es_halberd_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_halberds",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_halberd_skin_03_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_halberd_03/wpn_wh_halberd_03_magic_01",
			template = "two_handed_halberds_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_shortbow_skin_02_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_arrow_t1",
			description = "we_shortbow_skin_02_magic_02_description",
			display_name = "we_shortbow_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_shortbow_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_02/wpn_we_bow_short_02_magic_01",
			rarity = "unique",
			template = "shortbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_shortbow_hagbane_skin_02_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_poison_arrow_t1",
			description = "we_shortbow_hagbane_skin_02_magic_02_description",
			display_name = "we_shortbow_hagbane_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_shortbow_hagbane_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_bow_short_02/wpn_we_bow_short_02_magic_01",
			rarity = "unique",
			template = "shortbow_hagbane_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_2h_axe_skin_02_magic_02",
		data = {
			description = "dw_2h_axe_skin_02_magic_02_description",
			display_name = "dw_2h_axe_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_2h_axe_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_axe_01_t2/wpn_dw_2h_axe_01_t2_magic_01",
			template = "two_handed_axes_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_2h_hammer_skin_03_magic_02",
		data = {
			description = "dw_2h_hammer_skin_03_magic_02_description",
			display_name = "dw_2h_hammer_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_hammers",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_2h_hammer_skin_03_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_2h_hammer_02_t1/wpn_dw_2h_hammer_02_t1_magic_01",
			template = "two_handed_hammers_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_1h_axe_skin_04_magic_02",
		data = {
			description = "dw_1h_axe_skin_04_magic_02_description",
			display_name = "dw_1h_axe_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_1h_axe_skin_04_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2_magic_01",
			template = "one_hand_axe_shield_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_dual_axe_skin_04_magic_02",
		data = {
			description = "dw_dual_axe_skin_04_magic_02_description",
			display_name = "dw_dual_axe_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_dual_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_dual_axe_skin_04_magic_02",
			left_hand_unit = "units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2_magic_01",
			template = "dual_wield_axes_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_1h_hammer_skin_03_magic_02",
		data = {
			description = "dw_1h_hammer_skin_03_magic_02_description",
			display_name = "dw_1h_hammer_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_hammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_1h_hammer_skin_03_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1_magic_01",
			template = "one_handed_hammer_template_2",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dr_dual_wield_hammers_skin_01_magic_02",
		data = {
			description = "dr_dual_wield_hammers_skin_01_magic_02_description",
			display_name = "dr_dual_wield_hammers_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_dual_weapons",
			hud_icon = "weapon_generic_icon_falken",
			inventory_icon = "icon_dr_dual_wield_hammers_skin_01_magic_02",
			left_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1_magic_01",
			slot_type = "melee",
			template = "dual_wield_axe_falchion_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_2h_pick_skin_02_magic_02",
		data = {
			description = "dw_2h_pick_skin_02_magic_02_description",
			display_name = "dw_2h_pick_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_picks",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_2h_pick_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_pick_01_t2/wpn_dw_pick_01_t2_magic_01",
			template = "two_handed_picks_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_1h_axe_shield_skin_04_magic_02",
		data = {
			description = "dw_1h_axe_shield_skin_04_magic_02_description",
			display_name = "dw_1h_axe_shield_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_1h_axe_shield_skin_04_magic_02",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_04_t1/wpn_dw_shield_04_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_axe_02_t2/wpn_dw_axe_02_t2_magic_01",
			template = "one_hand_axe_shield_template_1",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_1h_hammer_shield_skin_04_magic_02",
		data = {
			description = "dw_1h_hammer_shield_skin_04_magic_02_description",
			display_name = "dw_1h_hammer_shield_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_1h_hammer_shield_skin_04_magic_02",
			left_hand_unit = "units/weapons/player/wpn_dw_shield_04_t1/wpn_dw_shield_04_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_hammer_02_t1/wpn_dw_hammer_02_t1_magic_01",
			template = "one_handed_hammer_shield_template_2",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_repeating_handgun_skin_01_magic_02",
		data = {
			description = "es_repeating_handgun_skin_01_magic_02_description",
			display_name = "es_repeating_handgun_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_repeating_handguns",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_repeating_handgun_skin_01_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_handgun_repeater_t1/wpn_emp_handgun_repeater_t1_magic_01",
			template = "repeating_handgun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_brace_of_pistols_skin_05_magic_02",
		data = {
			description = "wh_brace_of_pistols_skin_05_magic_02_description",
			display_name = "wh_brace_of_pistols_skin_05_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_pistols",
			hud_icon = "weapon_generic_icon_brace_of_pistol",
			inventory_icon = "icon_wh_brace_of_pistols_skin_05_magic_02",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_magic_01",
			template = "brace_of_pistols_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_repeating_pistol_skin_05_magic_02",
		data = {
			description = "wh_repeating_pistol_skin_05_magic_02_description",
			display_name = "wh_repeating_pistol_skin_05_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_repeating_handguns",
			hud_icon = "weapon_generic_icon_repeating_pistol",
			inventory_icon = "icon_wh_repeating_pistol_skin_05_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_pistol_repeater_02/wpn_empire_pistol_repeater_02_t2_magic_01",
			template = "repeating_pistol_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_1h_mace_shield_skin_04_magic_02",
		data = {
			description = "es_1h_mace_shield_skin_04_magic_02_description",
			display_name = "es_1h_mace_shield_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield_hammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_1h_mace_shield_skin_04_magic_02",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_04/wpn_emp_shield_04_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_mace_03_t2/wpn_emp_mace_03_t2_magic_01",
			template = "one_handed_hammer_shield_template_1",
			action_anim_overrides = {
				action_two = {
					default = {
						anim_event = "parry_pose_02",
						anim_event_3p = "parry_pose",
					},
				},
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_1h_sword_shield_skin_04_magic_02",
		data = {
			description = "es_1h_sword_shield_skin_04_magic_02_description",
			display_name = "es_1h_sword_shield_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield_sword",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_1h_sword_shield_skin_04_magic_02",
			left_hand_unit = "units/weapons/player/wpn_empire_shield_04/wpn_emp_shield_04_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_sword_03_t2/wpn_emp_sword_03_t2_magic_01",
			template = "one_handed_sword_shield_template_1",
			action_anim_overrides = {
				action_two = {
					default = {
						anim_event = "parry_pose_02",
						anim_event_3p = "parry_pose",
					},
				},
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_fencing_sword_skin_07_magic_02",
		data = {
			description = "wh_fencing_sword_skin_07_magic_02_description",
			display_name = "wh_fencing_sword_skin_07_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_fencing_swords",
			hud_icon = "weapon_generic_icon_fencing_sword",
			inventory_icon = "icon_wh_fencing_sword_skin_07_magic_02",
			left_hand_unit = "units/weapons/player/wpn_emp_pistol_03_t2/wpn_emp_pistol_03_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_fencingsword_04_t2/wpn_fencingsword_04_t2_magic_01",
			template = "fencing_sword_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_crossbow_skin_06_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			description = "wh_crossbow_skin_06_magic_02_description",
			display_name = "wh_crossbow_skin_06_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_crossbow",
			inventory_icon = "icon_wh_crossbow_skin_06_magic_02",
			left_hand_unit = "units/weapons/player/wpn_empire_crossbow_t2/wpn_empire_crossbow_tier2_magic_01",
			rarity = "unique",
			template = "crossbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_crossbow_skin_03_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_crossbow_quiver/wpn_crossbow_bolt",
			description = "dw_crossbow_skin_03_magic_02_description",
			display_name = "dw_crossbow_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_crossbow_skin_03_magic_02",
			left_hand_unit = "units/weapons/player/wpn_dw_xbow_02_t1/wpn_dw_xbow_02_t1_magic_01",
			rarity = "unique",
			template = "crossbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_blunderbuss_skin_01_magic_02",
		data = {
			description = "es_blunderbuss_skin_01_magic_02_description",
			display_name = "es_blunderbuss_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_blunderbusses",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_blunderbuss_skin_01_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_blunderbuss_02_t1/wpn_empire_blunderbuss_02_t1_magic_01",
			template = "blunderbuss_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_handgun_skin_02_magic_02",
		data = {
			description = "es_handgun_skin_02_magic_02_description",
			display_name = "es_handgun_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_handguns",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_handgun_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2_magic_01",
			template = "handgun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_drake_pistol_skin_01_magic_02",
		data = {
			description = "dw_drake_pistol_skin_01_magic_02_description",
			display_name = "dw_drake_pistol_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_drakefire_pistols",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_drake_pistol_skin_01_magic_02",
			left_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_01_t1/wpn_dw_drake_pistol_01_t1_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_drake_pistol_01_t1/wpn_dw_drake_pistol_01_t1_magic_01",
			template = "brace_of_drakefirepistols_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_handgun_skin_03_magic_02",
		data = {
			description = "dw_handgun_skin_03_magic_02_description",
			display_name = "dw_handgun_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_handguns",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_handgun_skin_03_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_handgun_02_t1/wpn_dw_handgun_02_t1_magic_01",
			template = "handgun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_drakegun_skin_02_magic_02",
		data = {
			description = "dw_drakegun_skin_02_magic_02_description",
			display_name = "dw_drakegun_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_drakegun",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_drakegun_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_02/wpn_dw_iron_drake_02_magic_01",
			template = "drakegun_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dw_grudge_raker_skin_03_magic_02",
		data = {
			description = "dw_grudge_raker_skin_03_magic_02_description",
			display_name = "dw_grudge_raker_skin_03_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_grudge_raker",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dw_grudge_raker_skin_03_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_rakegun_t3/wpn_dw_rakegun_t3_magic_01",
			template = "grudge_raker_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_1h_sword_skin_06_magic_02",
		data = {
			description = "bw_1h_sword_skin_06_magic_02_description",
			display_name = "bw_1h_sword_skin_06_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_swords_wizard",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_1h_sword_skin_06_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_03_t2/wpn_brw_sword_03_t2_magic_01",
			template = "one_handed_swords_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_1h_flaming_sword_skin_06_magic_02",
		data = {
			description = "bw_1h_flaming_sword_skin_06_magic_02_description",
			display_name = "bw_1h_flaming_sword_skin_06_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_weapon",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_1h_flaming_sword_skin_06_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_sword_03_t2/wpn_brw_flaming_sword_03_t2_magic_01",
			template = "flaming_sword_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_1h_mace_skin_02_magic_02",
		data = {
			description = "bw_1h_mace_skin_02_magic_02_description",
			display_name = "bw_1h_mace_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_hammer_wizard",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_1h_mace_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_mace_02/wpn_brw_mace_02_magic_01",
			template = "one_handed_hammer_wizard_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_1h_crowbill_skin_01_magic_02",
		data = {
			description = "bw_1h_crowbill_skin_01_magic_02_description",
			display_name = "bw_1h_crowbill_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_crowbills",
			hud_icon = "weapon_generic_icon_falken",
			inventory_icon = "icon_bw_1h_crowbill_skin_01_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_crowbill_01/wpn_brw_crowbill_01_magic_01",
			slot_type = "melee",
			template = "one_handed_crowbill",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_beam_staff_skin_02_magic_02",
		data = {
			description = "bw_beam_staff_skin_02_magic_02_description",
			display_name = "bw_beam_staff_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_beam_staff_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_beam_staff_02/wpn_brw_beam_staff_02_magic_01",
			template = "staff_blast_beam_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_dagger_skin_02_magic_02",
		data = {
			description = "bw_dagger_skin_02_magic_02_description",
			display_name = "bw_dagger_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_dagger_wizard",
			hud_icon = "weapon_generic_icon_daggers",
			inventory_icon = "icon_bw_dagger_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_dagger_02/wpn_brw_dagger_02_magic_01",
			template = "one_handed_daggers_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_repeating_crossbow_skin_02_magic_02",
		data = {
			description = "wh_repeating_crossbow_skin_02_magic_02_description",
			display_name = "wh_repeating_crossbow_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_crossbow",
			hud_icon = "weapon_generic_icon_fencing_sword",
			inventory_icon = "icon_wh_repeating_crossbow_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_wh_repeater_crossbow_t2/wpn_wh_repeater_crossbow_t2_magic_01",
			rarity = "unique",
			template = "repeating_crossbow_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_conflagration_staff_skin_01_magic_02",
		data = {
			description = "bw_conflagration_staff_skin_01_magic_02_description",
			display_name = "bw_conflagration_staff_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_conflagration_staff_skin_01_magic_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_03/wpn_brw_staff_03_magic_01",
			template = "staff_fireball_geiser_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_flamethrower_staff_skin_04_magic_02",
		data = {
			description = "bw_flamethrower_staff_skin_04_magic_02_description",
			display_name = "bw_flamethrower_staff_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_flamethrower_staff_skin_04_magic_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_04/wpn_brw_flame_staff_04_magic_01",
			template = "staff_flamethrower_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_spear_staff_skin_05_magic_02",
		data = {
			description = "bw_spear_staff_skin_05_magic_02_description",
			display_name = "bw_spear_staff_skin_05_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_spear_staff_skin_05_magic_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_spear_staff_05/wpn_brw_spear_staff_05_magic_01",
			template = "staff_spark_spear_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_fireball_staff_skin_02_magic_02",
		data = {
			description = "bw_fireball_staff_skin_02_magic_02_description",
			display_name = "bw_fireball_staff_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_fireball_staff_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_staff_05/wpn_brw_staff_05_magic_01",
			template = "staff_fireball_fireball_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_1h_flail_flaming_skin_02_magic_02",
		data = {
			description = "bw_1h_flail_flaming_skin_02_magic_02_description",
			display_name = "bw_1h_flail_flaming_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_flail",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_1h_flail_flaming_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_brw_flaming_flail_02/wpn_brw_flaming_flail_02_magic_01",
			template = "one_handed_flails_flaming_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dr_1h_throwing_axes_skin_02_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_dw_thrown_axe_01_t2/wpn_dw_thrown_axe_01_t2_magic_01",
			description = "dr_1h_throwing_axes_skin_02_magic_02_description",
			display_name = "dr_1h_throwing_axes_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_throwing_axes",
			hud_icon = "weapon_generic_icon_falken",
			inventory_icon = "icon_dr_1h_throwing_axes_skin_02_magic_02",
			is_ammo_weapon = true,
			link_pickup_template_name = "link_ammo_throwing_axe_01_t2_magic_01",
			pickup_template_name = "ammo_throwing_axe_01_t2_magic_01",
			projectile_units_template = "throwing_axe_01_t2_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_invisible_weapon",
			template = "one_handed_throwing_axes_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_2h_heavy_spear_skin_02_magic_02",
		data = {
			description = "es_2h_heavy_spear_skin_02_magic_02_description",
			display_name = "es_2h_heavy_spear_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_heavy_spears",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_2h_heavy_spear_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_boar_spear_02/wpn_emp_boar_spear_02_magic_01",
			template = "two_handed_heavy_spears_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_1h_spears_shield_skin_02_magic_02",
		data = {
			description = "we_1h_spears_shield_skin_02_magic_02_description",
			display_name = "we_1h_spears_shield_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_we_1h_spears_shield_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_shield_02/wpn_we_shield_02_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_we_spear_02/wpn_we_spear_02_magic_01",
			template = "one_handed_spears_shield_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_2h_billhook_skin_02_magic_02",
		data = {
			description = "wh_2h_billhook_skin_02_magic_02_description",
			display_name = "wh_2h_billhook_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_billhooks",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wh_2h_billhook_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_billhook_02/wpn_wh_billhook_02_magic_01",
			template = "two_handed_billhooks_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_1h_hammer_skin_02_magic_02",
		data = {
			description = "wh_1h_hammer_skin_02_magic_02_description",
			display_name = "wh_1h_hammer_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_1h_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wh_1h_hammer_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_magic",
			template = "one_handed_hammer_priest_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_2h_hammer_skin_02_magic_02",
		data = {
			description = "wh_2h_hammer_skin_02_magic_02_description",
			display_name = "wh_2h_hammer_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_hammers",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wh_2h_hammer_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_2h_hammer_02/wpn_wh_2h_hammer_02_magic",
			template = "one_handed_hammer_priest_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_hammer_shield_skin_02_magic_02",
		data = {
			description = "wh_hammer_shield_skin_02_magic_02_description",
			display_name = "wh_hammer_shield_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield_hammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wh_hammer_shield_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_wh_shield_01/wpn_wh_shield_01_t1_magic",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_magic",
			template = "one_handed_hammer_shield_priest_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_dual_hammer_skin_02_magic_02",
		data = {
			description = "wh_dual_hammer_skin_02_magic_02_description",
			display_name = "wh_dual_hammer_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_dual_axes",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wh_dual_hammer_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_magic",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_magic",
			template = "dual_wield_hammers_priest_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_hammer_book_skin_02_magic_02",
		data = {
			description = "wh_hammer_book_skin_02_magic_02_description",
			display_name = "wh_hammer_book_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_hammer_book",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wh_hammer_book_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_wh_1h_hammer_02/wpn_wh_1h_hammer_02_magic",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_book_02/wpn_wh_book_02_magic",
			template = "one_handed_hammer_book_priest_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_flail_shield_skin_02_magic_02",
		data = {
			description = "wh_flail_shield_skin_02_magic_02_description",
			display_name = "wh_flail_shield_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield_hammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_wh_flail_shield_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_wh_shield_01/wpn_wh_shield_01_t1_magic",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_flail_04_t1/wpn_emp_flail_04_t1_magic_01",
			template = "one_handed_flail_shield_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_javelin_skin_02_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_magic",
			description = "we_javelin_skin_02_magic_02_description",
			display_name = "we_javelin_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			hud_icon = "icons_placeholder",
			inventory_icon = "icon_we_javelin_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_javelin_02/wpn_we_javelin_02_magic",
			projectile_units_template = "javelin_02_magic",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_invisible_weapon",
			template = "javelin_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_life_staff_skin_02_magic_02",
		data = {
			description = "we_life_staff_skin_02_magic_02_description",
			display_name = "we_life_staff_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "icons_placeholder",
			inventory_icon = "icon_we_life_staff_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_life_staff_02/wpn_we_life_staff_02_magic",
			rarity = "unique",
			template = "staff_life",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_bastard_sword_skin_04_magic_02",
		data = {
			description = "es_bastard_sword_skin_04_magic_02_description",
			display_name = "es_bastard_sword_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_swords",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_bastard_sword_skin_04_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_gk_sword_02_t2/wpn_emp_gk_sword_02_t2_magic_01",
			template = "bastard_sword_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_sword_shield_breton_skin_04_magic_02",
		data = {
			description = "es_sword_shield_breton_skin_04_magic_02_description",
			display_name = "es_sword_shield_breton_skin_04_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield_sword",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_sword_shield_breton_skin_04_magic_02",
			left_hand_unit = "units/weapons/player/wpn_emp_gk_shield_01/wpn_emp_gk_shield_01_magic_01",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_emp_gk_sword_02_t2/wpn_emp_gk_sword_02_t2_magic_01",
			template = "one_handed_sword_shield_template_2",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dr_2h_cog_hammer_skin_02_magic_02",
		data = {
			description = "dr_2h_cog_hammer_skin_02_magic_02_description",
			display_name = "dr_2h_cog_hammer_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_2h_hammers",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dr_2h_cog_hammer_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_coghammer_01_t2/wpn_dw_coghammer_01_t2_magic",
			template = "two_handed_cog_hammers_template_1",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dr_steam_pistol_skin_02_magic_02",
		data = {
			description = "dr_steam_pistol_skin_02_magic_02_description",
			display_name = "dr_steam_pistol_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_drakefire_pistols",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dr_steam_pistol_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_dw_steam_pistol_01_t2/wpn_dw_steam_pistol_01_t2_magic_01",
			template = "heavy_steam_pistol_template_1",
			action_anim_overrides = {
				animation_variation_id = 1,
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_ghost_scythe_skin_02_magic_02",
		data = {
			description = "bw_ghost_scythe_skin_02_magic_02_description",
			display_name = "bw_ghost_scythe_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_ghost_scythe_skin_02_magic_02",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_magic_01",
			template = "staff_scythe",
			right_hand_unit_override = {
				bw_adept = "units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_magic_01_fire",
				bw_scholar = "units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_magic_01_fire",
				bw_unchained = "units/weapons/player/wpn_bw_ghost_scythe_02/wpn_bw_ghost_scythe_02_magic_01_fire",
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_necromancy_staff_skin_02_magic_02",
		data = {
			description = "bw_necromancy_staff_skin_02_magic_02_description",
			display_name = "bw_necromancy_staff_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "hud_icon_default",
			inventory_icon = "icon_bw_necromancy_staff_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_invisible_weapon",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_bw_necromancy_staff_02/wpn_bw_necromancy_staff_02_magic_01",
			template = "staff_death",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "wh_deus_skin_02_magic_02",
		data = {
			description = "wh_deus_skin_02_magic_02_desciption",
			display_name = "wh_deus_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_drakefire_pistols",
			hud_icon = "weapon_generic_icon_bow",
			inventory_icon = "icon_wh_deus_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_wh_deus_02/wpn_wh_deus_02_magic",
			template = "wh_deus_01_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "we_deus_skin_01_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01",
			ammo_unit_3p = "units/weapons/player/wpn_we_quiver_t1/wpn_we_deus_arrow_01_3p",
			description = "we_deus_skin_01_magic_02_description",
			display_name = "we_deus_skin_01_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_bow",
			hud_icon = "weapon_generic_icon_bow",
			inventory_icon = "icon_we_deus_skin_01_magic_02",
			left_hand_unit = "units/weapons/player/wpn_we_deus_01/wpn_we_deus_01_magic",
			rarity = "unique",
			template = "we_deus_01_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "bw_deus_skin_02_magic_02",
		data = {
			description = "bw_deus_skin_02_magic_02_description",
			display_name = "bw_deus_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_staff",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_bw_deus_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic",
			template = "bw_deus_01_template_1",
			right_hand_unit_override = {
				bw_necromancer = "units/weapons/player/wpn_bw_deus_02/wpn_bw_deus_02_magic_baelfire",
			},
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "es_deus_skin_02_magic_02",
		data = {
			description = "es_deus_skin_02_magic_02_description",
			display_name = "es_deus_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_shield_sword",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_es_deus_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_es_deus_shield_02/wpn_es_deus_shield_02_magic",
			rarity = "unique",
			right_hand_unit = "units/weapons/player/wpn_es_deus_spear_02/wpn_es_deus_spear_02_magic",
			template = "es_deus_01_template",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
	{
		name = "dr_deus_skin_02_magic_02",
		data = {
			ammo_unit = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02",
			ammo_unit_3p = "units/weapons/player/wpn_dr_deus_projectile_02/wpn_dr_deus_projectile_02_3p",
			description = "dr_deus_skin_02_magic_02_description",
			display_name = "dr_deus_skin_02_magic_02_name",
			display_unit = "units/weapons/weapon_display/display_trollhammer",
			hud_icon = "weapon_generic_icon_staff_3",
			inventory_icon = "icon_dr_deus_skin_02_magic_02",
			left_hand_unit = "units/weapons/player/wpn_dr_deus_02/wpn_dr_deus_02_magic",
			rarity = "unique",
			template = "dr_deus_01_template_1",
			material_settings = WeaponMaterialSettingsTemplates.versus,
		},
	},
}
local skin_combinations = {
	wh_deus_01_skins = {
		unique = {
			"wh_deus_skin_02_magic_02",
		},
	},
	we_deus_01_skins = {
		unique = {
			"we_deus_skin_01_magic_02",
		},
	},
	bw_deus_01_skins = {
		unique = {
			"bw_deus_skin_02_magic_02",
		},
	},
	es_deus_01_skins = {
		unique = {
			"es_deus_skin_02_magic_02",
		},
	},
	dr_deus_01_skins = {
		unique = {
			"dr_deus_skin_02_magic_02",
		},
	},
	bw_necromancy_staff_skins = {
		unique = {
			"bw_necromancy_staff_skin_02_magic_02",
		},
	},
	bw_ghost_scythe_skins = {
		unique = {
			"bw_ghost_scythe_skin_02_magic_02",
		},
	},
	dr_2h_cog_hammer_skins = {
		unique = {
			"dr_2h_cog_hammer_skin_02_magic_02",
		},
	},
	dr_steam_pistol_skins = {
		unique = {
			"dr_steam_pistol_skin_02_magic_02",
		},
	},
	es_bastard_sword_skins = {
		unique = {
			"es_bastard_sword_skin_04_magic_02",
		},
	},
	es_sword_shield_breton_skins = {
		unique = {
			"es_sword_shield_breton_skin_04_magic_02",
		},
	},
	we_javelin_skins = {
		unique = {
			"we_javelin_skin_02_magic_02",
		},
	},
	life_staff_skins = {
		unique = {
			"we_life_staff_skin_02_magic_02",
		},
	},
	wh_1h_hammer_skins = {
		unique = {
			"wh_1h_hammer_skin_02_magic_02",
		},
	},
	wh_2h_hammer_skins = {
		unique = {
			"wh_2h_hammer_skin_02_magic_02",
		},
	},
	wh_hammer_shield_skins = {
		unique = {
			"wh_hammer_shield_skin_02_magic_02",
		},
	},
	wh_dual_hammer_skins = {
		unique = {
			"wh_dual_hammer_skin_02_magic_02",
		},
	},
	wh_hammer_book_skins = {
		unique = {
			"wh_hammer_book_skin_02_magic_02",
		},
	},
	wh_flail_shield_skins = {
		unique = {
			"wh_flail_shield_skin_02_magic_02",
		},
	},
	bw_1h_flail_flaming_skins = {
		unique = {
			"bw_1h_flail_flaming_skin_02_magic_02",
		},
	},
	dr_1h_throwing_axes_skins = {
		unique = {
			"dr_1h_throwing_axes_skin_02_magic_02",
		},
	},
	es_2h_heavy_spear_skins = {
		unique = {
			"es_2h_heavy_spear_skin_02_magic_02",
		},
	},
	we_1h_spears_shield_skins = {
		unique = {
			"we_1h_spears_shield_skin_02_magic_02",
		},
	},
	wh_2h_billhook_skins = {
		unique = {
			"wh_2h_billhook_skin_02_magic_02",
		},
	},
	we_1h_axe_skins = {
		unique = {
			"we_1h_axe_skin_02_magic_02",
		},
	},
	bw_1h_crowbill_skins = {
		unique = {
			"bw_1h_crowbill_skin_01_magic_02",
		},
	},
	wh_dual_wield_axe_falchion_skins = {
		unique = {
			"wh_dual_wield_axe_falchion_skin_01_magic_02",
		},
	},
	dr_dual_wield_hammers_skins = {
		unique = {
			"dr_dual_wield_hammers_skin_01_magic_02",
		},
	},
	es_dual_wield_hammer_sword_skins = {
		unique = {
			"es_dual_wield_hammer_sword_skin_02_magic_02",
		},
	},
	wh_1h_axe_skins = {
		unique = {
			"wh_1h_axe_skin_06_magic_02",
		},
	},
	es_1h_sword_skins = {
		unique = {
			"es_1h_sword_skin_04_magic_02",
		},
	},
	es_1h_mace_skins = {
		unique = {
			"es_1h_mace_skin_05_magic_02",
		},
	},
	es_2h_sword_executioner_skins = {
		unique = {
			"es_2h_sword_exe_skin_03_magic_02",
		},
	},
	es_2h_sword_skins = {
		unique = {
			"es_2h_sword_skin_03_magic_02",
		},
	},
	es_2h_hammer_skins = {
		unique = {
			"es_2h_hammer_skin_02_magic_02",
		},
	},
	es_sword_shield_skins = {
		unique = {
			"es_1h_sword_shield_skin_04_magic_02",
		},
	},
	es_mace_shield_skins = {
		unique = {
			"es_1h_mace_shield_skin_04_magic_02",
		},
	},
	es_halberd_skins = {
		unique = {
			"es_halberd_skin_03_magic_02",
		},
	},
	es_longbow_skins = {
		unique = {
			"es_longbow_skin_04_magic_02",
		},
	},
	es_blunderbuss_skins = {
		unique = {
			"es_blunderbuss_skin_01_magic_02",
		},
	},
	es_handgun_skins = {
		unique = {
			"es_handgun_skin_02_magic_02",
		},
	},
	es_repeating_handgun_skins = {
		unique = {
			"es_repeating_handgun_skin_01_magic_02",
		},
	},
	we_spear_skins = {
		unique = {
			"we_spear_skin_02_magic_02",
		},
	},
	we_dual_wield_daggers_skins = {
		unique = {
			"we_dual_dagger_skin_07_magic_02",
		},
	},
	we_dual_wield_swords_skins = {
		unique = {
			"we_dual_sword_skin_06_magic_02",
		},
	},
	we_1h_sword_skins = {
		unique = {
			"we_sword_skin_06_magic_02",
		},
	},
	we_dual_wield_sword_dagger_skins = {
		unique = {
			"we_dual_sword_dagger_skin_07_magic_02",
		},
	},
	we_shortbow_skins = {
		unique = {
			"we_shortbow_skin_02_magic_02",
		},
	},
	we_shortbow_hagbane_skins = {
		unique = {
			"we_shortbow_hagbane_skin_02_magic_02",
		},
	},
	we_longbow_skins = {
		unique = {
			"we_longbow_skin_02_magic_02",
		},
	},
	we_2h_axe_skins = {
		unique = {
			"we_2h_axe_skin_03_magic_02",
		},
	},
	we_2h_sword_skins = {
		unique = {
			"we_2h_sword_skin_08_magic_02",
		},
	},
	we_crossbow_repeater_skins = {
		unique = {
			"we_crossbow_skin_01_magic_02",
		},
	},
	bw_1h_mace_skins = {
		unique = {
			"bw_1h_mace_skin_02_magic_02",
		},
	},
	bw_dagger_skins = {
		unique = {
			"bw_dagger_skin_02_magic_02",
		},
	},
	bw_sword_skins = {
		unique = {
			"bw_1h_sword_skin_06_magic_02",
		},
	},
	bw_flame_sword_skins = {
		unique = {
			"bw_1h_flaming_sword_skin_06_magic_02",
		},
	},
	bw_skullstaff_fireball_skins = {
		unique = {
			"bw_fireball_staff_skin_02_magic_02",
		},
	},
	bw_skullstaff_beam_skins = {
		unique = {
			"bw_beam_staff_skin_02_magic_02",
		},
	},
	bw_skullstaff_geiser_skins = {
		unique = {
			"bw_conflagration_staff_skin_01_magic_02",
		},
	},
	bw_skullstaff_spear_skins = {
		unique = {
			"bw_spear_staff_skin_05_magic_02",
		},
	},
	bw_skullstaff_flamethrower_skins = {
		unique = {
			"bw_flamethrower_staff_skin_04_magic_02",
		},
	},
	dr_1h_axe_skins = {
		unique = {
			"dw_1h_axe_skin_04_magic_02",
		},
	},
	dr_dual_wield_axes_skins = {
		unique = {
			"dw_dual_axe_skin_04_magic_02",
		},
	},
	dr_2h_axe_skins = {
		unique = {
			"dw_2h_axe_skin_02_magic_02",
		},
	},
	dr_crossbow_skins = {
		unique = {
			"dw_crossbow_skin_03_magic_02",
		},
	},
	dr_2h_hammer_skins = {
		unique = {
			"dw_2h_hammer_skin_03_magic_02",
		},
	},
	dr_1h_hammer_skins = {
		unique = {
			"dw_1h_hammer_skin_03_magic_02",
		},
	},
	dr_shield_axe_skins = {
		unique = {
			"dw_1h_axe_shield_skin_04_magic_02",
		},
	},
	dr_shield_hammer_skins = {
		unique = {
			"dw_1h_hammer_shield_skin_04_magic_02",
		},
	},
	dr_rakegun_skins = {
		unique = {
			"dw_grudge_raker_skin_03_magic_02",
		},
	},
	dr_handgun_skins = {
		unique = {
			"dw_handgun_skin_03_magic_02",
		},
	},
	dr_drake_pistol_skins = {
		unique = {
			"dw_drake_pistol_skin_01_magic_02",
		},
	},
	dr_drakegun_skins = {
		unique = {
			"dw_drakegun_skin_02_magic_02",
		},
	},
	dr_2h_pick_skins = {
		unique = {
			"dw_2h_pick_skin_02_magic_02",
		},
	},
	wh_2h_sword_skins = {
		unique = {
			"wh_2h_sword_skin_04_magic_02",
		},
	},
	wh_fencing_sword_skins = {
		unique = {
			"wh_fencing_sword_skin_07_magic_02",
		},
	},
	wh_brace_of_pistols_skins = {
		unique = {
			"wh_brace_of_pistols_skin_05_magic_02",
		},
	},
	wh_repeating_pistols_skins = {
		unique = {
			"wh_repeating_pistol_skin_05_magic_02",
		},
	},
	wh_crossbow_repeater_skins = {
		unique = {
			"wh_repeating_crossbow_skin_02_magic_02",
		},
	},
	wh_crossbow_skins = {
		unique = {
			"wh_crossbow_skin_06_magic_02",
		},
	},
	wh_1h_falchion_skins = {
		unique = {
			"wh_1h_falchion_skin_04_magic_02",
		},
	},
	es_1h_flail_skins = {
		unique = {
			"es_1h_flail_skin_04_magic_02",
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
