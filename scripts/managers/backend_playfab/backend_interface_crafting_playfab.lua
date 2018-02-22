require("scripts/managers/backend_playfab/backend_interface_crafting_base")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceCraftingPlayfab = class(BackendInterfaceCraftingPlayfab, BackendInterfaceCraftingBase)
BackendInterfaceCraftingPlayfab.init = function (self, backend_mirror)
	BackendInterfaceCraftingPlayfab.super.init(self)

	self.is_local = false
	self._backend_mirror = backend_mirror

	return 
end
BackendInterfaceCraftingPlayfab.ready = function (self)
	return true
end
BackendInterfaceCraftingPlayfab.update = function (self, dt)
	return 
end
BackendInterfaceCraftingPlayfab.craft = function (self, career_name, item_backend_ids, callback_function)
	local recipe, item_backend_ids_and_amounts = self._get_valid_recipe(self, item_backend_ids)
	local hero_name = CareerSettings[career_name].profile_name

	if recipe and recipe.result_function_playfab then
		local result_function = recipe.result_function_playfab
		local craft_request = {
			FunctionName = result_function,
			FunctionParameter = {
				item_backend_ids_and_amounts = item_backend_ids_and_amounts,
				hero_name = hero_name
			}
		}
		local craft_request_cb = callback(self, "craft_request_cb", callback_function)

		PlayFabClientApi.ExecuteCloudScript(craft_request, craft_request_cb, craft_request_cb)

		return true
	end

	return false
end
BackendInterfaceCraftingPlayfab.craft_request_cb = function (self, callback_function, result)
	if result.Error then
		table.dump(result, nil, 5)
		fassert(false, "loot_chest_rewards_request_cb: it failed!")
	else
		local backend_manager = Managers.backend
		local item_interface = backend_manager.get_interface(backend_manager, "items")
		local backend_mirror = self._backend_mirror
		local function_result = result.FunctionResult
		local items = function_result.items
		local consumed_items = function_result.consumed_items
		local modified_items = function_result.modified_items
		local result = {}

		if items then
			for i = 1, #items, 1 do
				local item = items[i]
				local backend_id = item.ItemInstanceId
				local amount = item.UsesIncrementedBy or 1

				backend_mirror.add_item(backend_mirror, backend_id, item)

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

				if 0 < remaining_uses then
					backend_mirror.update_item_field(backend_mirror, backend_id, "RemainingUses", remaining_uses)
				else
					backend_mirror.remove_item(backend_mirror, backend_id)
				end
			end
		end

		if modified_items then
			for i = 1, #modified_items, 1 do
				local item = modified_items[i]
				local backend_id = item.ItemInstanceId

				backend_mirror.update_item(backend_mirror, backend_id, item)
			end
		end

		backend_manager.dirtify_interfaces(backend_manager)
		callback_function(result, nil, nil)
	end

	return 
end

return 
