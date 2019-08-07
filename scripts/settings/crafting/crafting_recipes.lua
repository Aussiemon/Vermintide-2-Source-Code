local crafting_recipes = {
	{
		result_function = "salvage_result_func",
		name = "salvage",
		display_name = "crafting_recipe_salvage",
		lore_text = "recipe_salvage_lore_text",
		validation_function = "salvage_validation_func",
		result_function_playfab = "craftingSalvage",
		hero_specific_filter = true,
		item_filter = "can_salvage and not is_equipped",
		description_text = "description_crafting_recipe_salvage",
		display_icon_console = "console_crafting_recipe_icon_salvage",
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
			local item_1_power_level = item_1.power_level or math.huge
			local item_2_power_level = item_2.power_level or math.huge
			local item_1_item_type = item_data_1.item_type
			local item_2_item_type = item_data_2.item_type
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
				if item_1_power_level == item_2_power_level then
					local item_1_rarity = item_1.rarity or item_data_1.rarity
					local item_2_rarity = item_2.rarity or item_data_2.rarity
					local item_rarity_order = UISettings.item_rarity_order
					local item_1_rarity_order = item_rarity_order[item_1_rarity]
					local item_2_rarity_order = item_rarity_order[item_2_rarity]
					local cosmetics_sorting_order = UISettings.cosmetics_sorting_order
					local item_1_cosmetic_order = cosmetics_sorting_order[item_1_item_type] or 0
					local item_2_cosmetic_order = cosmetics_sorting_order[item_2_item_type] or 0
					local item_1_is_cosmetic = item_1_item_type == "skin" or item_1_item_type == "hat"
					local item_2_is_cosmetic = item_2_item_type == "skin" or item_2_item_type == "hat"

					if item_1_cosmetic_order == item_2_cosmetic_order then
						if item_1_rarity_order == item_2_rarity_order then
							local item_type_1 = Localize(item_1_item_type)
							local item_type_2 = Localize(item_1_item_type)

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
						return item_1_cosmetic_order < item_2_cosmetic_order
					end
				else
					return item_1_power_level < item_2_power_level
				end
			elseif item_1_favorited then
				return false
			else
				return true
			end
		end
	},
	{
		result_function = "craft_random_item_result_func",
		name = "craft_random_item",
		display_name = "crafting_recipe_craft_item",
		lore_text = "crafting_recipe_random_item_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingRandomItem",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_item",
		display_icon_console = "console_crafting_recipe_icon_craft",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
				if item_type_1 == item_type_2 then
					local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
					local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

					return Localize(item_name_1) < Localize(item_name_2)
				else
					return item_type_1 < item_type_2
				end
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "craft_jewellery_result_func",
		name = "craft_jewellery",
		display_name = "crafting_recipe_craft_jewellery",
		lore_text = "crafting_recipe_jewellery_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingSpecificItem",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_jewellery",
		display_icon_console = "console_crafting_recipe_icon_craft",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
				if item_type_1 == item_type_2 then
					local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
					local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

					return Localize(item_name_1) < Localize(item_name_2)
				else
					return item_type_1 < item_type_2
				end
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "craft_random_jewellery_result_func",
		name = "craft_random_jewellery",
		display_name = "crafting_recipe_craft_jewellery",
		lore_text = "crafting_recipe_random_jewellery_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingRandomJewellery",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_jewellery_random",
		display_icon_console = "console_crafting_recipe_icon_craft",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
				if item_type_1 == item_type_2 then
					local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
					local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

					return Localize(item_name_1) < Localize(item_name_2)
				else
					return item_type_1 < item_type_2
				end
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "craft_weapon_result_func",
		name = "craft_weapon",
		display_name = "crafting_recipe_craft_weapon",
		lore_text = "crafting_recipe_weapon_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingSpecificItem",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_weapon",
		display_icon_console = "console_crafting_recipe_icon_craft",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
				if item_type_1 == item_type_2 then
					local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
					local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

					return Localize(item_name_1) < Localize(item_name_2)
				else
					return item_type_1 < item_type_2
				end
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "craft_random_weapon_result_func",
		name = "craft_random_weapon",
		display_name = "crafting_recipe_craft_weapon_random",
		lore_text = "crafting_recipe_random_weapon_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingRandomWeapon",
		hero_specific_filter = true,
		item_filter = "can_craft_with",
		description_text = "description_crafting_recipe_craft_weapon_random",
		display_icon_console = "console_crafting_recipe_icon_craft",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
				if item_type_1 == item_type_2 then
					local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
					local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

					return Localize(item_name_1) < Localize(item_name_2)
				else
					return item_type_1 < item_type_2
				end
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "reroll_weapon_properties_result_func",
		name = "reroll_weapon_properties",
		display_name = "crafting_recipe_weapon_reroll_properties",
		lore_text = "crafting_recipe_reroll_weapon_properties_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingRerollProperties",
		hero_specific_filter = true,
		item_filter = "has_properties and item_rarity ~= magic",
		description_text = "description_crafting_recipe_weapon_reroll_properties",
		display_icon_console = "console_crafting_recipe_icon_properties",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "reroll_jewellery_properties_result_func",
		name = "reroll_jewellery_properties",
		display_name = "crafting_recipe_jewellery_reroll_properties",
		lore_text = "crafting_recipe_reroll_jewellery_properties_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingRerollProperties",
		hero_specific_filter = true,
		item_filter = "has_properties and item_rarity ~= magic",
		description_text = "description_crafting_recipe_jewellery_reroll_properties",
		display_icon_console = "console_crafting_recipe_icon_properties",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "reroll_weapon_traits_result_func",
		name = "reroll_weapon_traits",
		display_name = "crafting_recipe_weapon_reroll_traits",
		lore_text = "crafting_recipe_reroll_weapon_traits_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingRerollTraits",
		hero_specific_filter = true,
		item_filter = "has_traits and item_rarity ~= magic",
		description_text = "description_crafting_recipe_weapon_reroll_traits",
		display_icon_console = "console_crafting_recipe_icon_trait",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "reroll_jewellery_traits_result_func",
		name = "reroll_jewellery_traits",
		display_name = "crafting_recipe_jewellery_reroll_traits",
		lore_text = "crafting_recipe_reroll_jewellery_traits_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingRerollTraits",
		hero_specific_filter = true,
		item_filter = "has_traits and item_rarity ~= magic",
		description_text = "description_crafting_recipe_jewellery_reroll_traits",
		display_icon_console = "console_crafting_recipe_icon_trait",
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
		result_function = "extract_weapon_skin_result_func",
		name = "extract_weapon_skin",
		display_name = "crafting_recipe_extract_weapon_skin",
		lore_text = "crafting_recipe_reroll_extract_weapon_skin",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingExtractSkin",
		hero_specific_filter = true,
		item_filter = "has_applied_skin and item_rarity ~= magic and not is_equipped",
		description_text = "description_crafting_recipe_extract_weapon_skin",
		display_icon_console = "console_crafting_recipe_icon_extract",
		ingredients = {
			{
				multiple_check_func = "check_has_skin",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "apply_weapon_skin_result_func",
		name = "apply_weapon_skin",
		display_name = "crafting_recipe_apply_weapon_skin",
		lore_text = "crafting_recipe_reroll_apply_weapon_skin",
		validation_function = "weapon_skin_application_validation_func",
		result_function_playfab = "craftingApplySkin2",
		hero_specific_filter = true,
		item_filter = "can_apply_skin and item_rarity ~= magic and not is_equipped",
		description_text = "description_crafting_recipe_apply_weapon_skin",
		display_icon_console = "console_crafting_recipe_icon_apply",
		ingredients = {
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
			local item_1_power_level = item_1.power_level or 0
			local item_2_power_level = item_2.power_level or 0
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "upgrade_item_rarity_result_func",
		name = "upgrade_item_rarity_common",
		display_name = "crafting_recipe_upgrade_item_rarity_common",
		lore_text = "crafting_recipe_upgrade_item_rarity_common_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingUpgradeRarity",
		hero_specific_filter = true,
		item_filter = "can_upgrade and not is_equipped",
		description_text = "description_crafting_upgrade_item_rarity_common",
		display_icon_console = "console_crafting_recipe_icon_upgrade",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "upgrade_item_rarity_result_func",
		name = "upgrade_item_rarity_rare",
		display_name = "crafting_recipe_upgrade_item_rarity_common",
		lore_text = "crafting_recipe_upgrade_item_rarity_rare_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingUpgradeRarity",
		hero_specific_filter = true,
		item_filter = "can_upgrade and not is_equipped",
		description_text = "description_crafting_upgrade_item_rarity_common",
		display_icon_console = "console_crafting_recipe_icon_upgrade",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "upgrade_item_rarity_result_func",
		name = "upgrade_item_rarity_exotic",
		display_name = "crafting_recipe_upgrade_item_rarity_common",
		lore_text = "crafting_recipe_upgrade_item_rarity_exotic_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingUpgradeRarity",
		hero_specific_filter = true,
		item_filter = "can_upgrade and not is_equipped",
		description_text = "description_crafting_upgrade_item_rarity_common",
		display_icon_console = "console_crafting_recipe_icon_upgrade",
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		result_function = "upgrade_item_rarity_result_func",
		name = "upgrade_item_rarity_unique",
		display_name = "crafting_recipe_upgrade_item_rarity_common",
		lore_text = "crafting_recipe_upgrade_item_rarity_unique_lore_text",
		validation_function = "craft_validation_func",
		result_function_playfab = "craftingUpgradeRarity",
		hero_specific_filter = true,
		item_filter = "can_upgrade and not is_equipped",
		description_text = "description_crafting_upgrade_item_rarity_common",
		display_icon_console = "console_crafting_recipe_icon_upgrade",
		ingredients = {
			{
				amount = 5,
				name = "crafting_material_dust_4"
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
			local item_1_backend_id = item_1.backend_id
			local item_2_backend_id = item_2.backend_id
			local item_1_favorited = ItemHelper.is_favorite_backend_id(item_1_backend_id)
			local item_2_favorited = ItemHelper.is_favorite_backend_id(item_2_backend_id)

			if item_1_favorited == item_2_favorited then
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
			elseif item_1_favorited then
				return true
			else
				return false
			end
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "convert_blue_dust",
		display_name = "crafting_recipe_convert_dust",
		lore_text = "",
		result_function_playfab = "craftingDowngradeDust",
		hero_specific_filter = false,
		result_function = "upgrade_item_rarity_result_func",
		item_filter = "item_key == crafting_material_dust_2 or item_key == crafting_material_dust_3",
		description_text = "description_crafting_recipe_convert_dust",
		display_icon_console = "console_crafting_recipe_icon_dust",
		ingredients = {
			{
				amount = 10,
				name = "crafting_material_dust_2"
			}
		},
		presentation_ingredients = {
			{
				amount = 10,
				name = "crafting_material_dust_2"
			},
			{
				amount = 10,
				name = "crafting_material_dust_1"
			}
		},
		item_sort_func = function (item_1, item_2)
			local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
			local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

			return item_name_1 < item_name_2
		end
	},
	{
		validation_function = "craft_validation_func",
		name = "convert_orange_dust",
		display_name = "crafting_recipe_convert_dust",
		lore_text = "",
		result_function_playfab = "craftingDowngradeDust",
		hero_specific_filter = false,
		result_function = "upgrade_item_rarity_result_func",
		item_filter = "item_key == crafting_material_dust_2 or item_key == crafting_material_dust_3",
		description_text = "description_crafting_recipe_convert_dust",
		display_icon_console = "console_crafting_recipe_icon_dust",
		ingredients = {
			{
				amount = 10,
				name = "crafting_material_dust_3"
			}
		},
		presentation_ingredients = {
			{
				amount = 10,
				name = "crafting_material_dust_3"
			},
			{
				amount = 10,
				name = "crafting_material_dust_2"
			}
		},
		item_sort_func = function (item_1, item_2)
			local _, item_name_1 = UIUtils.get_ui_information_from_item(item_1)
			local _, item_name_2 = UIUtils.get_ui_information_from_item(item_2)

			return item_name_1 < item_name_2
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
