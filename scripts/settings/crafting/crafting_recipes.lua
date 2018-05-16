local crafting_recipes = {
	{
		validation_function = "salvage_validation_func",
		name = "salvage",
		display_name = "crafting_recipe_salvage",
		lore_text = "recipe_salvage_lore_text",
		result_function_playfab = "craftingSalvage",
		hero_specific_filter = true,
		item_filter = "can_salvage and not is_equipped",
		description_text = "description_crafting_recipe_salvage",
		result_function = "salvage_result_func",
		salvagable_slot_types = {
			ring = true,
			melee = true,
			necklace = true,
			trinket = true,
			ranged = true,
			hat = true
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_2_rarity_order < item_1_rarity_order
				end
			else
				return item_1_power_level < item_2_power_level
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "craft_random_item",
		display_name = "crafting_recipe_craft_item",
		lore_text = "crafting_recipe_random_item_lore_text",
		result_function_playfab = "craftingRandomItem",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_item",
		result_function = "craft_random_item_result_func",
		ingredients = {
			{
				amount = 10,
				name = "crafting_material_scrap"
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_type_1 = Localize(item_data_1.item_type)
			local item_type_2 = Localize(item_data_2.item_type)

			if item_type_1 == item_type_2 then
				local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
				local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

				return Localize(item_name_1) < Localize(item_name_2)
			else
				return item_type_1 < item_type_2
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "craft_jewellery",
		display_name = "crafting_recipe_craft_jewellery",
		lore_text = "crafting_recipe_jewellery_lore_text",
		result_function_playfab = "craftingSpecificItem",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_jewellery",
		result_function = "craft_jewellery_result_func",
		ingredients = {
			{
				amount = 1,
				name = "crafting_material_jewellery"
			},
			{
				amount = 10,
				name = "crafting_material_scrap"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "jewellery_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_type_1 = Localize(item_data_1.item_type)
			local item_type_2 = Localize(item_data_2.item_type)

			if item_type_1 == item_type_2 then
				local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
				local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

				return Localize(item_name_1) < Localize(item_name_2)
			else
				return item_type_1 < item_type_2
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "craft_random_jewellery",
		display_name = "crafting_recipe_craft_jewellery",
		lore_text = "crafting_recipe_random_jewellery_lore_text",
		result_function_playfab = "craftingRandomJewellery",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_jewellery_random",
		result_function = "craft_random_jewellery_result_func",
		ingredients = {
			{
				amount = 1,
				name = "crafting_material_jewellery"
			},
			{
				amount = 10,
				name = "crafting_material_scrap"
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_type_1 = Localize(item_data_1.item_type)
			local item_type_2 = Localize(item_data_2.item_type)

			if item_type_1 == item_type_2 then
				local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
				local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

				return Localize(item_name_1) < Localize(item_name_2)
			else
				return item_type_1 < item_type_2
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "craft_weapon",
		display_name = "crafting_recipe_craft_weapon",
		lore_text = "crafting_recipe_weapon_lore_text",
		result_function_playfab = "craftingSpecificItem",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_weapon",
		result_function = "craft_weapon_result_func",
		ingredients = {
			{
				amount = 1,
				name = "crafting_material_weapon"
			},
			{
				amount = 10,
				name = "crafting_material_scrap"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "weapon_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_type_1 = Localize(item_data_1.item_type)
			local item_type_2 = Localize(item_data_2.item_type)

			if item_type_1 == item_type_2 then
				local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
				local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

				return Localize(item_name_1) < Localize(item_name_2)
			else
				return item_type_1 < item_type_2
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "craft_random_weapon",
		display_name = "crafting_recipe_craft_weapon_random",
		lore_text = "crafting_recipe_random_weapon_lore_text",
		result_function_playfab = "craftingRandomWeapon",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_weapon_random",
		result_function = "craft_random_weapon_result_func",
		ingredients = {
			{
				amount = 1,
				name = "crafting_material_weapon"
			},
			{
				amount = 10,
				name = "crafting_material_scrap"
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_type_1 = Localize(item_data_1.item_type)
			local item_type_2 = Localize(item_data_2.item_type)

			if item_type_1 == item_type_2 then
				local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
				local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

				return Localize(item_name_1) < Localize(item_name_2)
			else
				return item_type_1 < item_type_2
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "reroll_weapon_properties",
		display_name = "crafting_recipe_weapon_reroll_properties",
		lore_text = "crafting_recipe_reroll_weapon_properties_lore_text",
		result_function_playfab = "craftingRerollProperties",
		hero_specific_filter = true,
		item_filter = "has_properties",
		description_text = "description_crafting_recipe_weapon_reroll_properties",
		result_function = "reroll_weapon_properties_result_func",
		ingredients = {
			{
				amount = 1,
				name = "crafting_material_dust_1"
			},
			{
				amount = 1,
				name = "crafting_material_dust_2"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "weapon_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_1_rarity_order < item_2_rarity_order
				end
			else
				return item_2_power_level < item_1_power_level
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "reroll_jewellery_properties",
		display_name = "crafting_recipe_jewellery_reroll_properties",
		lore_text = "crafting_recipe_reroll_jewellery_properties_lore_text",
		result_function_playfab = "craftingRerollProperties",
		hero_specific_filter = true,
		item_filter = "has_properties",
		description_text = "description_crafting_recipe_jewellery_reroll_properties",
		result_function = "reroll_jewellery_properties_result_func",
		ingredients = {
			{
				amount = 1,
				name = "crafting_material_dust_1"
			},
			{
				amount = 1,
				name = "crafting_material_dust_2"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "jewellery_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_1_rarity_order < item_2_rarity_order
				end
			else
				return item_2_power_level < item_1_power_level
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "reroll_weapon_traits",
		display_name = "crafting_recipe_weapon_reroll_traits",
		lore_text = "crafting_recipe_reroll_weapon_traits_lore_text",
		result_function_playfab = "craftingRerollTraits",
		hero_specific_filter = true,
		item_filter = "has_traits",
		description_text = "description_crafting_recipe_weapon_reroll_traits",
		result_function = "reroll_weapon_traits_result_func",
		ingredients = {
			{
				amount = 1,
				name = "crafting_material_dust_3"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "weapon_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_1_rarity_order < item_2_rarity_order
				end
			else
				return item_2_power_level < item_1_power_level
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "reroll_jewellery_traits",
		display_name = "crafting_recipe_jewellery_reroll_traits",
		lore_text = "crafting_recipe_reroll_jewellery_traits_lore_text",
		result_function_playfab = "craftingRerollTraits",
		hero_specific_filter = true,
		item_filter = "has_traits",
		description_text = "description_crafting_recipe_jewellery_reroll_traits",
		result_function = "reroll_jewellery_traits_result_func",
		ingredients = {
			{
				amount = 1,
				name = "crafting_material_dust_3"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "jewellery_slot_types"
				}
			}
		}
	},
	{
		validation_function = "craft_validation_func",
		name = "extract_weapon_skin",
		display_name = "crafting_recipe_extract_weapon_skin",
		lore_text = "crafting_recipe_reroll_extract_weapon_skin",
		result_function_playfab = "craftingExtractSkin",
		hero_specific_filter = true,
		item_filter = "has_applied_skin and not is_equipped",
		description_text = "description_crafting_recipe_extract_weapon_skin",
		result_function = "extract_weapon_skin_result_func",
		ingredients = {
			{
				multiple_check_func = "check_has_skin",
				catergory = {
					item_value = "slot_type",
					category_table = "weapon_slot_types"
				}
			},
			{
				amount = 20,
				name = "crafting_material_scrap"
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_1_rarity_order < item_2_rarity_order
				end
			else
				return item_2_power_level < item_1_power_level
			end
		end
	},
	{
		validation_function = "weapon_skin_application_validation_func",
		name = "apply_weapon_skin",
		display_name = "crafting_recipe_apply_weapon_skin",
		lore_text = "crafting_recipe_reroll_apply_weapon_skin",
		result_function_playfab = "craftingApplySkin",
		hero_specific_filter = true,
		item_filter = "can_apply_skin and not is_equipped",
		description_text = "description_crafting_recipe_apply_weapon_skin",
		result_function = "apply_weapon_skin_result_func",
		ingredients = {
			{
				catergory = {
					item_value = "slot_type",
					category_table = "weapon_slot_types"
				}
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "weapon_skin_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_1_rarity_order < item_2_rarity_order
				end
			else
				return item_2_power_level < item_1_power_level
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "upgrade_item_rarity_common",
		display_name = "crafting_recipe_upgrade_item_rarity_common",
		lore_text = "crafting_recipe_upgrade_item_rarity_common_lore_text",
		result_function_playfab = "craftingUpgradeRarity",
		hero_specific_filter = true,
		item_filter = "can_upgrade and not is_equipped",
		description_text = "description_crafting_upgrade_item_rarity_common",
		result_function = "upgrade_item_rarity_result_func",
		ingredients = {
			{
				amount = 20,
				name = "crafting_material_scrap"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "equipment_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_1_rarity_order < item_2_rarity_order
				end
			else
				return item_2_power_level < item_1_power_level
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "upgrade_item_rarity_rare",
		display_name = "crafting_recipe_upgrade_item_rarity_common",
		lore_text = "crafting_recipe_upgrade_item_rarity_rare_lore_text",
		result_function_playfab = "craftingUpgradeRarity",
		hero_specific_filter = true,
		item_filter = "can_upgrade and not is_equipped",
		description_text = "description_crafting_upgrade_item_rarity_common",
		result_function = "upgrade_item_rarity_result_func",
		ingredients = {
			{
				amount = 30,
				name = "crafting_material_scrap"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "equipment_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_1_rarity_order < item_2_rarity_order
				end
			else
				return item_2_power_level < item_1_power_level
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "upgrade_item_rarity_exotic",
		display_name = "crafting_recipe_upgrade_item_rarity_common",
		lore_text = "crafting_recipe_upgrade_item_rarity_exotic_lore_text",
		result_function_playfab = "craftingUpgradeRarity",
		hero_specific_filter = true,
		item_filter = "can_upgrade and not is_equipped",
		description_text = "description_crafting_upgrade_item_rarity_common",
		result_function = "upgrade_item_rarity_result_func",
		ingredients = {
			{
				amount = 50,
				name = "crafting_material_scrap"
			},
			{
				catergory = {
					item_value = "slot_type",
					category_table = "equipment_slot_types"
				}
			}
		},
		item_sort_func = function (item_1, item_2)
			local item_data_1 = item_1.data
			local item_data_2 = item_2.data
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0

			if item_1_power_level == item_2_power_level then
				local item_1_rarity = item_1.rarity or item_data_1.rarity
				local item_2_rarity = item_2.rarity or item_data_2.rarity
				local item_rarity_order = UISettings.item_rarity_order
				local item_1_rarity_order = item_rarity_order[item_1_rarity]
				local item_2_rarity_order = item_rarity_order[item_2_rarity]

				if item_1_rarity_order == item_2_rarity_order then
					local item_type_1 = Localize(item_data_1.item_type)
					local item_type_2 = Localize(item_data_2.item_type)

					if item_type_1 == item_type_2 then
						local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
						local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

						return Localize(item_name_1) < Localize(item_name_2)
					else
						return item_type_1 < item_type_2
					end
				else
					return item_1_rarity_order < item_2_rarity_order
				end
			else
				return item_2_power_level < item_1_power_level
			end
		end
	}
}
local crafting_recipes_lookup = {}
local crafting_recipes_by_name = {}

for i, recipe_data in ipairs(crafting_recipes) do
	local name = recipe_data.name
	crafting_recipes_lookup[i] = name
	crafting_recipes_by_name[name] = recipe_data
end

return crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup
