-- chunkname: @scripts/settings/equipment/item_master_list_mutators_batch_02.lua

local item_master_list = {
	mutator_statue_01 = {
		gamepad_hud_icon = "consumables_icon_defence",
		hud_icon = "consumables_icon_defence",
		inventory_icon = "icons_placeholder",
		item_type = "inventory_item",
		left_hand_unit = "units/weapons/player/pup_mutator_statue_01/wpn_mutator_statue_01",
		rarity = "plentiful",
		slot_type = "healthkit",
		temporary_template = "mutator_statue_01",
		can_wield = CanWieldAllItemTemplates,
	},
}

table.merge_recursive(ItemMasterList, item_master_list)
