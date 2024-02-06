-- chunkname: @scripts/settings/equipment/loot_chest_settings_1.lua

LootChestSettings = LootChestSettings or {}
LootChestSettings.standard_loot_chest = {
	default = {
		{
			slot_type = "melee",
			weight = 4,
		},
		{
			slot_type = "ranged",
			weight = 4,
		},
		{
			slot_type = "trinket",
			weight = 1,
		},
		{
			slot_type = "ring",
			weight = 1,
		},
		{
			slot_type = "necklace",
			weight = 1,
		},
	},
	bonus_item_1 = {
		{
			slot_type = "melee",
			weight = 1,
		},
		{
			slot_type = "ranged",
			weight = 1,
		},
		{
			slot_type = "trinket",
			weight = 4,
		},
		{
			slot_type = "ring",
			weight = 4,
		},
		{
			slot_type = "necklace",
			weight = 4,
		},
		{
			slot_type = "crafting_material",
			weight = 2,
		},
		{
			slot_type = "deed",
			weight = 0.33,
		},
	},
	bonus_item_2 = {
		{
			slot_type = "trinket",
			weight = 1,
		},
		{
			slot_type = "ring",
			weight = 1,
		},
		{
			slot_type = "necklace",
			weight = 1,
		},
		{
			slot_type = "melee",
			weight = 1,
		},
		{
			slot_type = "ranged",
			weight = 1,
		},
		{
			slot_type = "crafting_material",
			weight = 4,
		},
		{
			slot_type = "deed",
			weight = 0.33,
		},
	},
}
LootChestSettings.debug = {
	default = {
		{
			slot_type = "deed",
			weight = 0.33,
		},
	},
	bonus_item_1 = {
		{
			slot_type = "deed",
			weight = 0.33,
		},
	},
	bonus_item_2 = {
		{
			slot_type = "deed",
			weight = 0.33,
		},
	},
}

for name, token_data in pairs(LootChestSettings) do
	token_data.name = name
end
