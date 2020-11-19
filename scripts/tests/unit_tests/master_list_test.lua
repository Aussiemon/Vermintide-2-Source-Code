local schema = Schema.define
local ITEM_MASTER_LIST_SCHEMA = schema({
	type = "table",
	table_values = {
		strict = true,
		type = "table",
		map = {
			display_name = {
				type = "string"
			},
			description = {
				type = "string"
			},
			name = {
				type = "string"
			},
			inventory_icon = {
				type = "string"
			},
			hud_icon = {
				type = "string"
			},
			item_type = {
				type = "string"
			},
			temporary_template = {
				type = "string"
			},
			can_wield = {
				type = "table",
				table_array = {
					type = "string",
					enum = CanWieldAllItemTemplates
				}
			},
			skin_type = {
				type = "string"
			},
			slot_type = {
				type = "string"
			},
			rarity = {
				type = "string"
			},
			information_text = {
				type = "string"
			},
			required_unlock_item = {
				type = "string"
			},
			right_hand_unit = {
				type = "string"
			},
			left_hand_unit = {
				type = "string"
			},
			ammo_unit = {
				type = "string"
			},
			ammo_unit_3p = {
				type = "string"
			},
			template = {
				type = "string"
			},
			has_power_level = {
				type = "boolean"
			},
			skin_combination_table = {
				type = "string"
			},
			property_table_name = {
				type = "string"
			},
			trait_table_name = {
				type = "string"
			},
			required_dlc = {
				type = "string"
			},
			base_skin_item = {
				type = "boolean"
			},
			is_local = {
				type = "boolean"
			},
			item_units_to_replace = {
				type = "table"
			},
			slot_to_use = {
				type = "string"
			},
			gamepad_hud_icon = {
				type = "string"
			},
			mutators = {
				type = "table"
			},
			rewards = {
				type = "table"
			},
			level_keys = {
				type = "table"
			},
			difficulties = {
				type = "table"
			},
			display_unit = {
				type = "string"
			},
			matching_item_key = {
				type = "string"
			},
			unit = {
				type = "string"
			},
			dlc_name = {
				type = "string"
			},
			bundle = {
				type = "table"
			},
			consumable = {
				type = "table"
			},
			steam_itemdefid = {
				type = "number"
			},
			item_preview_environment = {
				type = "string"
			},
			item_preview_object_set_name = {
				type = "string"
			},
			content_key = {
				type = "string"
			},
			power_level_key = {
				type = "string"
			},
			rarity_key = {
				type = "string"
			},
			chest_tier = {
				type = "number"
			},
			chest_category = {
				type = "string"
			},
			chest_sort_order = {
				type = "number"
			},
			can_stack = {
				type = "boolean"
			},
			deed_key = {
				type = "string"
			},
			info_text_box_text_id = {
				type = "string"
			},
			mechanisms = {
				type = "table",
				table_array = {
					type = "string"
				}
			},
			is_ammo_weapon = {
				type = "boolean"
			},
			projectile_units_template = {
				type = "string"
			},
			pickup_template_name = {
				type = "string"
			},
			link_pickup_template_name = {
				type = "string"
			}
		}
	}
})

Schema.validate(ITEM_MASTER_LIST_SCHEMA, ItemMasterList, "ItemMasterList")

return
