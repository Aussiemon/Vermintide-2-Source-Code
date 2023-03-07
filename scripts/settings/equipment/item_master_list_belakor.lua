require("scripts/settings/dlcs/morris/tweak_data/buff_tweak_data")

local item_master_list = {
	belakor_crystal = {
		temporary_template = "belakor_crystal",
		slot_type = "healthkit",
		is_local = true,
		inventory_icon = "icons_placeholder",
		left_hand_unit = "units/weapons/player/wpn_belakor_crystal/wpn_belakor_crystal",
		rarity = "plentiful",
		gamepad_hud_icon = "consumables_icon_defence",
		hud_icon = "consumables_icon_defence",
		item_type = "inventory_item",
		can_wield = CanWieldAllItemTemplates
	},
	frame_deus_portrait_belakor = {
		description = "frame_deus_portrait_belakor_description",
		temporary_template = "frame_deus_portrait_belakor",
		display_name = "frame_deus_portrait_belakor_name",
		hud_icon = "unit_frame_02",
		inventory_icon = "deus_icon_portrait_belakor",
		slot_type = "frame",
		information_text = "information_text_frame",
		rarity = "promo",
		item_type = "frame",
		can_wield = CanWieldAllItemTemplates
	}
}

table.merge(ItemMasterList, item_master_list)
