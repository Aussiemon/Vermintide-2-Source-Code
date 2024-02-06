-- chunkname: @scripts/settings/crafting/crafting_data.lua

CraftingData = {}
CraftingData.dust_material_names = {
	"crafting_material_dust_1",
	"crafting_material_dust_2",
	"crafting_material_dust_3",
}
CraftingData.act_materials = {
	"crafting_material_act_1",
	"crafting_material_act_2",
	"crafting_material_act_3",
}
CraftingData.item_materials = {
	"crafting_material_weapon",
	"crafting_material_jewellery",
}
CraftingData.weapon_slot_types = {
	"ranged",
	"melee",
}
CraftingData.jewellery_slot_types = {
	"ring",
	"necklace",
	"trinket",
}
CraftingData.weapon_skin_slot_types = {
	"weapon_skin",
}
CraftingData.equipment_slot_types = {
	"ranged",
	"melee",
	"ring",
	"necklace",
	"trinket",
}
CraftingData.salvage_data = {
	materials_from_rarity = {
		plentiful = {
			{
				amount = 1,
				name = "crafting_material_scrap",
			},
		},
		common = {
			{
				amount = 2,
				name = "crafting_material_scrap",
			},
			{
				amount = 1,
				name = "crafting_material_dust_1",
			},
		},
		rare = {
			{
				amount = 3,
				name = "crafting_material_scrap",
			},
			{
				amount = 1,
				name = "crafting_material_dust_2",
			},
		},
		exotic = {
			{
				amount = 4,
				name = "crafting_material_scrap",
			},
			{
				amount = 1,
				name = "crafting_material_dust_3",
			},
		},
		unique = {
			{
				amount = 5,
				name = "crafting_material_scrap",
			},
			{
				amount = 3,
				name = "crafting_material_dust_3",
			},
		},
	},
	materials_from_slot_type = {
		ring = {
			{
				amount = 1,
				chance = 0.2,
				name = "crafting_material_jewellery",
			},
		},
		necklace = {
			{
				amount = 1,
				chance = 0.2,
				name = "crafting_material_jewellery",
			},
		},
		trinket = {
			{
				amount = 1,
				chance = 0.2,
				name = "crafting_material_jewellery",
			},
		},
		ranged = {
			{
				amount = 1,
				chance = 0.2,
				name = "crafting_material_weapon",
			},
		},
		melee = {
			{
				amount = 1,
				chance = 0.2,
				name = "crafting_material_weapon",
			},
		},
	},
}
CraftingData.craft_jewellery_data = {
	rarity_weights = {
		common = 7,
		exotic = 2,
		plentiful = 10,
		rare = 4,
	},
	items = {
		necklace = {
			plentiful = {
				"necklace",
			},
			common = {
				"necklace",
			},
			rare = {
				"necklace",
			},
			exotic = {
				"necklace",
			},
		},
		ring = {
			plentiful = {
				"ring",
			},
			common = {
				"ring",
			},
			rare = {
				"ring",
			},
			exotic = {
				"ring",
			},
		},
		trinket = {
			plentiful = {
				"trinket",
			},
			common = {
				"trinket",
			},
			rare = {
				"trinket",
			},
			exotic = {
				"trinket",
			},
		},
	},
}
CraftingData.craft_weapon_data = {
	rarity_weights = {
		common = 7,
		exotic = 1,
		plentiful = 10,
		rare = 2,
	},
	items = {},
}
