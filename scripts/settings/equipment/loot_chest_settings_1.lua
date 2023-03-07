LootChestSettings = LootChestSettings or {}
LootChestSettings.standard_loot_chest = {
	default = {
		{
			weight = 4,
			slot_type = "melee"
		},
		{
			weight = 4,
			slot_type = "ranged"
		},
		{
			weight = 1,
			slot_type = "trinket"
		},
		{
			weight = 1,
			slot_type = "ring"
		},
		{
			weight = 1,
			slot_type = "necklace"
		}
	},
	bonus_item_1 = {
		{
			weight = 1,
			slot_type = "melee"
		},
		{
			weight = 1,
			slot_type = "ranged"
		},
		{
			weight = 4,
			slot_type = "trinket"
		},
		{
			weight = 4,
			slot_type = "ring"
		},
		{
			weight = 4,
			slot_type = "necklace"
		},
		{
			weight = 2,
			slot_type = "crafting_material"
		},
		{
			weight = 0.33,
			slot_type = "deed"
		}
	},
	bonus_item_2 = {
		{
			weight = 1,
			slot_type = "trinket"
		},
		{
			weight = 1,
			slot_type = "ring"
		},
		{
			weight = 1,
			slot_type = "necklace"
		},
		{
			weight = 1,
			slot_type = "melee"
		},
		{
			weight = 1,
			slot_type = "ranged"
		},
		{
			weight = 4,
			slot_type = "crafting_material"
		},
		{
			weight = 0.33,
			slot_type = "deed"
		}
	}
}
LootChestSettings.debug = {
	default = {
		{
			weight = 0.33,
			slot_type = "deed"
		}
	},
	bonus_item_1 = {
		{
			weight = 0.33,
			slot_type = "deed"
		}
	},
	bonus_item_2 = {
		{
			weight = 0.33,
			slot_type = "deed"
		}
	}
}

for name, token_data in pairs(LootChestSettings) do
	token_data.name = name
end
