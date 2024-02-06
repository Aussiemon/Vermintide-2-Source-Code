﻿-- chunkname: @scripts/managers/backend_playfab/backend_interface_crafting_base.lua

require("scripts/settings/crafting/crafting_data")

BackendInterfaceCraftingBase = class(BackendInterfaceCraftingBase)

local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")

BackendInterfaceCraftingBase.init = function (self)
	self._crafting_recipes = crafting_recipes
	self._crafting_recipes_by_name = crafting_recipes_by_name
	self._crafting_recipes_lookup = crafting_recipes_lookup
end

BackendInterfaceCraftingBase.get_recipes = function (self)
	return self._crafting_recipes
end

BackendInterfaceCraftingBase.get_recipe_by_name = function (self, name)
	return self._crafting_recipes_by_name[name]
end

BackendInterfaceCraftingBase.get_recipes_lookup = function (self)
	return self._crafting_recipes_lookup
end

BackendInterfaceCraftingBase._get_valid_recipe = function (self, item_backend_ids, recipe_override)
	local crafting_recipes = self._crafting_recipes

	if recipe_override then
		local recipe = crafting_recipes_by_name[recipe_override]
		local validation_function = recipe.validation_function
		local valid, item_backend_ids_and_amounts = self[validation_function](self, recipe, item_backend_ids)

		if valid then
			return recipe, item_backend_ids_and_amounts
		end

		return
	end

	for i = 1, #crafting_recipes do
		local recipe = crafting_recipes[i]
		local validation_function = recipe.validation_function
		local valid, item_backend_ids_and_amounts = self[validation_function](self, recipe, item_backend_ids)

		if valid then
			return recipe, item_backend_ids_and_amounts
		end
	end
end

local valid_item_ids = {}

BackendInterfaceCraftingBase.salvage_validation_func = function (self, recipe, item_backend_ids)
	local backend_items = Managers.backend:get_interface("items")
	local salvagable_slot_types = recipe.salvagable_slot_types

	table.clear(valid_item_ids)

	for i = 1, #item_backend_ids do
		local backend_id = item_backend_ids[i]
		local masterlist_data = backend_items:get_item_masterlist_data(backend_id)
		local slot_type = masterlist_data and masterlist_data.slot_type

		if slot_type and not salvagable_slot_types[slot_type] then
			return false
		end

		if masterlist_data then
			valid_item_ids[#valid_item_ids + 1] = {
				amount = 1,
				backend_id = backend_id,
			}
		end
	end

	if #valid_item_ids == 0 then
		return false
	end

	return true, valid_item_ids
end

BackendInterfaceCraftingBase.craft_validation_func = function (self, recipe, item_backend_ids)
	local ingredients = recipe.ingredients
	local cloned_backend_ids = table.clone(item_backend_ids)
	local num_valid_ingredients = 0

	table.clear(valid_item_ids)

	for i = 1, #ingredients do
		local ingredient = ingredients[i]
		local amount = ingredient.amount
		local valid, ingredient_ids = self:_validate_ingredient(ingredient, cloned_backend_ids)
		local multiple_check_func = ingredient.multiple_check_func

		if valid and multiple_check_func then
			valid = self[multiple_check_func](self, ingredient_ids)
		end

		if valid then
			num_valid_ingredients = num_valid_ingredients + 1

			for _, data in ipairs(ingredient_ids) do
				valid_item_ids[#valid_item_ids + 1] = data
			end
		end
	end

	if num_valid_ingredients ~= #ingredients or #cloned_backend_ids > 0 then
		return false
	end

	return true, valid_item_ids
end

local ingredient_ids = {}

BackendInterfaceCraftingBase._validate_ingredient = function (self, ingredient, item_backend_ids)
	local backend_items = Managers.backend:get_interface("items")
	local ingredient_name = ingredient.name
	local ingredient_category = ingredient.catergory
	local has_variable = ingredient.has_variable
	local amount = ingredient.amount or 1
	local total_found_ingredients = 0

	table.clear(ingredient_ids)

	for i = 1, #item_backend_ids do
		repeat
			local item_backend_id = item_backend_ids[i]
			local masterlist_data = backend_items:get_item_masterlist_data(item_backend_id)
			local item_name = masterlist_data and masterlist_data.name

			if not item_name or ingredient_name and ingredient_name ~= item_name then
				break
			end

			if ingredient_category then
				local category_table = CraftingData[ingredient_category.category_table]
				local item_value = masterlist_data[ingredient_category.item_value]

				if not table.contains(category_table, item_value) then
					break
				end
			end

			if has_variable and not item_data[has_variable] then
				break
			end

			local can_stack = masterlist_data.can_stack
			local amount_from_item
			local item_amount = backend_items:get_item_amount(item_backend_id)

			if can_stack and item_amount < amount then
				break
			else
				amount_from_item = not can_stack and 1 or amount
			end

			total_found_ingredients = total_found_ingredients + amount_from_item
			ingredient_ids[#ingredient_ids + 1] = {
				backend_id = item_backend_id,
				amount = amount_from_item,
			}

			if total_found_ingredients == amount then
				for j = 1, #ingredient_ids do
					local data = ingredient_ids[j]
					local backend_id = data.backend_id
					local index = table.find(item_backend_ids, backend_id)

					table.remove(item_backend_ids, index)
				end

				return true, ingredient_ids
			end
		until true
	end

	return false
end

BackendInterfaceCraftingBase.weapon_skin_application_validation_func = function (self, recipe, item_backend_ids)
	local ingredients = recipe.ingredients
	local backend_items = Managers.backend:get_interface("items")
	local cloned_backend_ids = table.clone(item_backend_ids)

	table.clear(valid_item_ids)

	local weapon_name, skin_name

	for i = 1, #cloned_backend_ids do
		local backend_id = cloned_backend_ids[i]
		local item = backend_items:get_item_from_id(backend_id)
		local item_data = item.data
		local item_slot_type = item_data.slot_type

		if table.find(CraftingData.weapon_slot_types, item_slot_type) then
			weapon_name = item_data.name
			valid_item_ids[#valid_item_ids + 1] = {
				amount = 1,
				backend_id = backend_id,
			}
		end

		if table.find(CraftingData.weapon_skin_slot_types, item_slot_type) then
			skin_name = item.skin
			valid_item_ids[#valid_item_ids + 1] = {
				skin_name = skin_name,
			}
		end

		if item_slot_type == "crafting_material" then
			for _, ingredient in ipairs(ingredients) do
				if ingredient.name and ingredient.amount and ingredient.name == item.ItemId then
					valid_item_ids[#valid_item_ids + 1] = {
						backend_id = backend_id,
						amount = ingredient.amount,
					}
				end
			end
		end
	end

	if #valid_item_ids ~= 2 then
		return false
	end

	if not weapon_name or not skin_name then
		return false
	end

	if not WeaponSkins.is_matching_skin(weapon_name, skin_name) then
		return false
	end

	return true, valid_item_ids
end

BackendInterfaceCraftingBase.check_same_item_func = function (self, item_backend_ids)
	local backend_items = Managers.backend:get_interface("items")
	local name

	for _, data in ipairs(item_backend_ids) do
		local item_backend_id = data.backend_id
		local masterlist_data = backend_items:get_item_masterlist_data(item_backend_id)
		local item_name = masterlist_data.name

		name = name or item_name

		if name ~= item_name then
			return false
		end
	end

	return true
end

BackendInterfaceCraftingBase.check_has_skin = function (self, item_backend_ids)
	local backend_items = Managers.backend:get_interface("items")
	local data = item_backend_ids[1]
	local item_backend_id = data.backend_id
	local item_data = backend_items:get_item_from_id(item_backend_id)

	if item_data.skin then
		return true
	end

	return false
end
