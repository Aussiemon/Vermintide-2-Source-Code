ItemMasterListPatch = ItemMasterListPatch or {}
ItemMasterListPatch.we_2h_sword_0002 = {
	description = "dlc1_4_description_plentiful_wood_elf_ww_2h_axe",
	rarity = "unique",
	right_hand_unit = "units/weapons/player/wpn_we_2h_sword_04_t1/wpn_we_2h_sword_04_t1",
	inventory_icon = "icon_wpn_we_2h_axe_04_t1_01",
	slot_type = "melee",
	display_name = "dlc1_4_display_name_plentiful_wood_elf_ww_2h_axe",
	template = "two_handed_swords_wood_elf_template",
	hud_icon = "weapon_generic_icon_elf_axe2h",
	item_type = "ww_2h_axe",
	can_wield = {
		"wood_elf"
	}
}
ItemMasterListPatch.dr_drakegun_0001 = {
	description = "drakegun",
	rarity = "unique",
	right_hand_unit = "units/weapons/player/wpn_dw_iron_drake_01/wpn_dw_iron_drake_01_t1",
	inventory_icon = "icon_wpn_dw_iron_drake_01_04",
	slot_type = "ranged",
	display_name = "drakegun",
	template = "drakegun_template_1",
	hud_icon = "weapon_generic_icon_drakegun",
	item_type = "dr_1h_axes",
	can_wield = {
		"dr_ironbreaker"
	},
	traits = {}
}
ItemMasterListPatch.dr_dual_wield_axes_0001 = {
	description = "description_plentiful_dwarf_ranger_dr_1h_axes",
	rarity = "unique",
	right_hand_unit = "units/weapons/player/wpn_dw_axe_01_t1/wpn_dw_axe_01_t1",
	inventory_icon = "icon_wpn_dw_axe_01_t1_01",
	left_hand_unit = "units/weapons/player/wpn_dw_axe_01_t1/wpn_dw_axe_01_t1",
	template = "dual_wield_axes_template_1_t2",
	display_name = "display_name_plentiful_dwarf_ranger_dr_1h_axes",
	slot_type = "melee",
	hud_icon = "weapon_generic_icon_axe1h",
	item_type = "dr_1h_axes",
	can_wield = {
		"dwarf_ranger"
	},
	traits = {}
}
ItemMasterListPatch.bw_flame_sword_spell_0001 = {
	description = "description_rare_bright_wizard_bw_flame_sword",
	rarity = "unique",
	right_hand_unit = "units/weapons/player/wpn_brw_sword_02_t2/wpn_brw_flaming_sword_02_t2",
	inventory_icon = "bw_flame_sword",
	slot_type = "melee",
	display_name = "display_name_rare_bright_wizard_bw_flame_sword",
	template = "flaming_sword_spell_template_1",
	hud_icon = "weapon_generic_icon_flaming_sword",
	item_type = "bw_flame_sword",
	can_wield = {
		"bw_scholar",
		"bw_adept",
		"bw_unchained"
	}
}
ItemMasterListPatch.bw_flame_dagger_spell_0001 = {
	description = "description_rare_bright_wizard_bw_flame_sword",
	rarity = "unique",
	right_hand_unit = "units/weapons/player/wpn_brw_dagger_01/wpn_brw_dagger_01",
	inventory_icon = "bw_flame_sword",
	slot_type = "melee",
	display_name = "display_name_rare_bright_wizard_bw_flame_sword",
	template = "one_handed_daggers_template_1",
	hud_icon = "weapon_generic_icon_flaming_sword",
	item_type = "bw_flame_sword",
	can_wield = {
		"bw_scholar",
		"bw_adept",
		"bw_unchained"
	}
}
ItemMasterListPatch.bw_skullstaff_flamethrower_0001 = {
	description = "flamethrower_staff",
	rarity = "plentiful",
	right_hand_unit = "units/weapons/player/wpn_brw_flame_staff_01/wpn_brw_flame_staff_01",
	inventory_icon = "bw_staff_beam",
	left_hand_unit = "units/weapons/player/wpn_fireball/wpn_fireball",
	template = "staff_flamethrower_template",
	display_name = "flamethrower_staff",
	slot_type = "ranged",
	hud_icon = "weapon_generic_icon_staff_4",
	item_type = "bw_staff_beam",
	can_wield = {
		"bw_scholar",
		"bw_adept",
		"bw_unchained"
	}
}

return ItemMasterListPatch
