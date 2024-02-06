-- chunkname: @scripts/settings/equipment/item_master_list_belakor.lua

require("scripts/settings/dlcs/morris/tweak_data/buff_tweak_data")

local item_master_list = {
	belakor_crystal = {
		gamepad_hud_icon = "consumables_icon_defence",
		hud_icon = "consumables_icon_defence",
		inventory_icon = "icons_placeholder",
		is_local = true,
		item_type = "inventory_item",
		left_hand_unit = "units/weapons/player/wpn_belakor_crystal/wpn_belakor_crystal",
		rarity = "plentiful",
		slot_type = "healthkit",
		temporary_template = "belakor_crystal",
		can_wield = CanWieldAllItemTemplates,
	},
	frame_deus_portrait_belakor = {
		description = "frame_deus_portrait_belakor_description",
		display_name = "frame_deus_portrait_belakor_name",
		hud_icon = "unit_frame_02",
		information_text = "information_text_frame",
		inventory_icon = "deus_icon_portrait_belakor",
		item_type = "frame",
		rarity = "promo",
		slot_type = "frame",
		temporary_template = "frame_deus_portrait_belakor",
		can_wield = CanWieldAllItemTemplates,
	},
}

table.merge(ItemMasterList, item_master_list)
