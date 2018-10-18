require("scripts/managers/backend_playfab/backend_interface_crafting_base")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceCraftingPlayfab = class(BackendInterfaceCraftingPlayfab, BackendInterfaceCraftingBase)

BackendInterfaceCraftingPlayfab.init = function (self, backend_mirror)
	BackendInterfaceCraftingPlayfab.super.init(self)

	self.is_local = false
	self._backend_mirror = backend_mirror
	self._last_id = 0
	self._craft_requests = {}
end

BackendInterfaceCraftingPlayfab.ready = function (self)
	return true
end

BackendInterfaceCraftingPlayfab.update = function (self, dt)
	return
end

BackendInterfaceCraftingPlayfab._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

BackendInterfaceCraftingPlayfab.craft = function (self, career_name, item_backend_ids, recipe_override)
	local recipe, item_backend_ids_and_amounts = self:_get_valid_recipe(item_backend_ids, recipe_override)
	local hero_name = CareerSettings[career_name].profile_name

	if recipe and recipe.result_function_playfab then
		local id = self:_new_id()
		local craft_request = {
			FunctionName = recipe.result_function_playfab,
			FunctionParameter = {
				item_backend_ids_and_amounts = item_backend_ids_and_amounts,
				hero_name = hero_name
			}
		}
		local success_callback = callback(self, "craft_request_cb", id)
		local request_queue = self._backend_mirror:request_queue()

		request_queue:enqueue(craft_request, success_callback, true)

		return id, recipe
	end

	return nil
end

BackendInterfaceCraftingPlayfab.craft_request_cb = function (self, id, result)
	local backend_manager = Managers.backend
	local item_interface = backend_manager:get_interface("items")
	local backend_mirror = self._backend_mirror
	local function_result = result.FunctionResult
	local items = function_result.items
	local consumed_items = function_result.consumed_items
	local modified_items = function_result.modified_items
	local unlocked_weapon_skins = function_result.unlocked_weapon_skins
	local result = {}

	if items then
		for i = 1, #items, 1 do
			local item = items[i]
			local backend_id = item.ItemInstanceId
			local amount = item.UsesIncrementedBy or 1

			backend_mirror:add_item(backend_id, item)

			result[i] = {
				backend_id,
				[3] = amount
			}
		end
	end

	if consumed_items then
		for i = 1, #consumed_items, 1 do
			local item = consumed_items[i]
			local backend_id = item.ItemInstanceId
			local remaining_uses = item.RemainingUses

			if remaining_uses > 0 then
				backend_mirror:update_item_field(backend_id, "RemainingUses", remaining_uses)
			else
				backend_mirror:remove_item(backend_id)
			end
		end
	end

	if modified_items then
		for i = 1, #modified_items, 1 do
			local item = modified_items[i]
			local backend_id = item.ItemInstanceId

			backend_mirror:update_item(backend_id, item)
		end
	end

	if unlocked_weapon_skins then
		for i = 1, #unlocked_weapon_skins, 1 do
			local weapon_skin = unlocked_weapon_skins[i]

			backend_mirror:add_unlocked_weapon_skin(weapon_skin)
		end
	end

	backend_manager:dirtify_interfaces()

	self._craft_requests[id] = result
end

BackendInterfaceCraftingPlayfab.is_craft_complete = function (self, id)
	local craft_request = self._craft_requests[id]

	if craft_request then
		return true
	end

	return false
end

BackendInterfaceCraftingPlayfab.get_craft_result = function (self, id)
	return self._craft_requests[id]
end

BackendInterfaceCraftingPlayfab.get_unlocked_weapon_skins = function (self)
	local mirror = self._backend_mirror

	return mirror:get_unlocked_weapon_skins()
end

return
