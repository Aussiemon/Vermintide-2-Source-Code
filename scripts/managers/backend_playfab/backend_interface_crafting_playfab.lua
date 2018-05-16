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
		local data = {
			hero_name = hero_name,
			item_backend_ids_and_amounts = item_backend_ids_and_amounts,
			result_function_playfab = recipe.result_function_playfab,
			id = id
		}
		local generate_challenge_request = {
			FunctionName = "generateChallenge"
		}
		local craft_challenge_request_cb = callback(self, "craft_challenge_request_cb", data)

		PlayFabClientApi.ExecuteCloudScript(generate_challenge_request, craft_challenge_request_cb, craft_challenge_request_cb)

		return id, recipe
	end

	return nil
end

BackendInterfaceCraftingPlayfab.craft_challenge_request_cb = function (self, data, result)
	if result.Error then
		table.dump(result, nil, 5)
		fassert(false, "craft_challenge_request_cb: it failed!")
	else
		local function_result = result.FunctionResult
		local challenge = function_result.challenge
		local eac_response, response = nil

		if challenge then
			eac_response, response = self:_get_eac_response(challenge)
		end

		if not challenge then
			print("EAC disabled on backend")
			self:_craft(data)
		elseif not eac_response then
			print("EAC disabled on client")
			Managers.backend:playfab_eac_error()
		else
			print("EAC Enabled!")
			self:_craft(data, response)
		end
	end
end

BackendInterfaceCraftingPlayfab._craft = function (self, data, response)
	local result_function = data.result_function_playfab
	local craft_request = {
		FunctionName = result_function,
		FunctionParameter = {
			item_backend_ids_and_amounts = data.item_backend_ids_and_amounts,
			hero_name = data.hero_name,
			response = response
		}
	}
	local id = data.id
	local craft_request_cb = callback(self, "craft_request_cb", id)

	PlayFabClientApi.ExecuteCloudScript(craft_request, craft_request_cb, craft_request_cb)
end

BackendInterfaceCraftingPlayfab.craft_request_cb = function (self, id, result)
	if result.Error then
		table.dump(result, nil, 5)
		fassert(false, "craft_request_cb: it failed!")
	else
		local backend_manager = Managers.backend
		local item_interface = backend_manager:get_interface("items")
		local backend_mirror = self._backend_mirror
		local function_result = result.FunctionResult
		local eac_failed = function_result.eac_failed_verification

		if eac_failed then
			Managers.backend:playfab_eac_error()

			return
		end

		local items = function_result.items
		local consumed_items = function_result.consumed_items
		local modified_items = function_result.modified_items
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

		backend_manager:dirtify_interfaces()

		self._craft_requests[id] = result
	end
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

BackendInterfaceCraftingPlayfab._get_eac_response = function (self, challenge)
	local i = 0
	local str = ""

	while challenge[tostring(i)] do
		str = str .. string.char(challenge[tostring(i)])
		i = i + 1
	end

	local eac_response = EAC.challenge_response(str)
	local response = nil

	if eac_response then
		local index = 1
		response = {}

		while string.byte(eac_response, index, index) do
			local byte_value = string.byte(eac_response, index, index)
			response[tostring(index - 1)] = byte_value
			index = index + 1
		end
	end

	return eac_response, response
end

return
