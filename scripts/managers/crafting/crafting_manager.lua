CraftingManager = class(CraftingManager)
CraftingManager.NAME = "CraftingManager"

CraftingManager.init = function (self)
	local crafting_interface = Managers.backend:get_interface("crafting")
	self._crafting_interface = crafting_interface
end

CraftingManager.update = function (self, dt)
	return
end

CraftingManager.get_recipes = function (self)
	return self._crafting_interface:get_recipes()
end

CraftingManager.get_recipes_lookup = function (self)
	return self._crafting_interface:get_recipes_lookup()
end

CraftingManager.are_recipes_dirty = function (self)
	local crafting_interface = self._crafting_interface
	local dirty_reason = crafting_interface:are_recipes_dirty()

	return dirty_reason
end

CraftingManager.destroy = function (self)
	return
end

CraftingManager.craft = function (self, items, recipe_override)
	local crafting_interface = self._crafting_interface
	local item_backend_ids = {}

	for _, backend_id in pairs(items) do
		item_backend_ids[#item_backend_ids + 1] = backend_id
	end

	local player_manager = Managers.player
	local player = player_manager:local_player()
	local profile_index = player:profile_index()
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_index = player:career_index()
	local career = careers[career_index]
	local career_name = career.name
	local craft_id, recipe = crafting_interface:craft(career_name, item_backend_ids, recipe_override)

	if craft_id and recipe then
		local stats_id = player:stats_id()
		local statistics_db = player_manager:statistics_db()

		if recipe.name == "salvage" then
			local salvaged_items = statistics_db:get_persistent_stat(stats_id, "salvaged_items")
			salvaged_items = salvaged_items + #items

			statistics_db:set_stat(stats_id, "salvaged_items", salvaged_items)
		else
			statistics_db:increment_stat(stats_id, "crafted_items")
		end

		Managers.backend:commit()
	end

	return craft_id
end

CraftingManager.debug_set_crafted_items_stat = function (self, value)
	local player_manager = Managers.player
	local player = player_manager:local_player()
	local stats_id = player:stats_id()
	local statistics_db = player_manager:statistics_db()

	statistics_db:set_stat(stats_id, "crafted_items", value)
	Managers.backend:commit()
	print("Number of crafted items set to", value)
end

CraftingManager.debug_set_salvaged_items_stat = function (self, value)
	local player_manager = Managers.player
	local player = player_manager:local_player()
	local stats_id = player:stats_id()
	local statistics_db = player_manager:statistics_db()

	statistics_db:set_stat(stats_id, "salvaged_items", value)
	Managers.backend:commit()
	print("Number of salvaged items set to", value)
end

return
