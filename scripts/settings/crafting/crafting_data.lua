CraftingData = {
	dust_material_names = {
		"crafting_material_dust_1",
		"crafting_material_dust_2",
		"crafting_material_dust_3"
	},
	act_materials = {
		"crafting_material_act_1",
		"crafting_material_act_2",
		"crafting_material_act_3"
	},
	item_materials = {
		"crafting_material_weapon",
		"crafting_material_jewellery"
	},
	weapon_slot_types = {
		"ranged",
		"melee"
	},
	jewellery_slot_types = {
		"ring",
		"necklace",
		"trinket"
	},
	weapon_skin_slot_types = {
		"weapon_skin"
	},
	salvage_data = {
		materials_from_rarity = {
			plentiful = {
				{
					amount = 1,
					name = "crafting_material_scrap"
				}
			},
			common = {
				{
					amount = 2,
					name = "crafting_material_scrap"
				},
				{
					amount = 1,
					name = "crafting_material_dust_1"
				}
			},
			rare = {
				{
					amount = 3,
					name = "crafting_material_scrap"
				},
				{
					amount = 1,
					name = "crafting_material_dust_2"
				}
			},
			exotic = {
				{
					amount = 4,
					name = "crafting_material_scrap"
				},
				{
					amount = 1,
					name = "crafting_material_dust_3"
				}
			},
			unique = {
				{
					amount = 5,
					name = "crafting_material_scrap"
				},
				{
					amount = 3,
					name = "crafting_material_dust_3"
				}
			}
		},
		materials_from_slot_type = {
			ring = {
				{
					chance = 0.5,
					name = "crafting_material_jewellery",
					amount = 1
				}
			},
			necklace = {
				{
					chance = 0.5,
					name = "crafting_material_jewellery",
					amount = 1
				}
			},
			trinket = {
				{
					chance = 0.5,
					name = "crafting_material_jewellery",
					amount = 1
				}
			},
			ranged = {
				{
					chance = 0.5,
					name = "crafting_material_weapon",
					amount = 1
				}
			},
			melee = {
				{
					chance = 0.5,
					name = "crafting_material_weapon",
					amount = 1
				}
			}
		}
	},
	craft_jewellery_data = {
		rarity_weights = {
			common = 7,
			plentiful = 10,
			rare = 4,
			exotic = 2
		},
		items = {
			necklace = {
				plentiful = {
					"necklace"
				},
				common = {
					"necklace"
				},
				rare = {
					"necklace"
				},
				exotic = {
					"necklace"
				}
			},
			ring = {
				plentiful = {
					"ring"
				},
				common = {
					"ring"
				},
				rare = {
					"ring"
				},
				exotic = {
					"ring"
				}
			},
			trinket = {
				plentiful = {
					"trinket"
				},
				common = {
					"trinket"
				},
				rare = {
					"trinket"
				},
				exotic = {
					"trinket"
				}
			}
		}
	},
	craft_weapon_data = {
		rarity_weights = {
			common = 7,
			plentiful = 10,
			rare = 2,
			exotic = 1
		},
		items = {}
	}
}

return 
