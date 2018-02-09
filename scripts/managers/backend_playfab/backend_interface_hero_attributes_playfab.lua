local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceHeroAttributesPlayFab = class(BackendInterfaceHeroAttributesPlayFab)
local DEFAULT_ATTRIBUTES = {
	dwarf_ranger_career = 1,
	empire_soldier_tutorial_career = 1,
	wood_elf_experience = 0,
	dwarf_ranger_experience = 0,
	bright_wizard_prestige = 0,
	dwarf_ranger_prestige = 0,
	empire_soldier_prestige = 0,
	bright_wizard_experience = 0,
	witch_hunter_prestige = 0,
	empire_soldier_tutorial_prestige = 0,
	wood_elf_career = 1,
	empire_soldier_career = 1,
	wood_elf_prestige = 0,
	witch_hunter_career = 1,
	bright_wizard_career = 1,
	witch_hunter_experience = 0,
	empire_soldier_experience = 0,
	empire_soldier_tutorial_experience = 0
}
BackendInterfaceHeroAttributesPlayFab.init = function (self, backend_mirror)
	self._attributes = {}
	self._backend_mirror = backend_mirror
	local request = {
		Keys = table.keys(DEFAULT_ATTRIBUTES)
	}

	local function on_complete(result)
		if result.Error then
			table.dump(result, "PlayFabError", math.huge)
			fassert(false, "Error loading player read only data")

			self._initialized = true
		else
			for key, entry in pairs(result.Data) do
				self._attributes[key] = tonumber(entry.Value)
			end

			self._initialized = true

			print("Player read only data loaded!")
		end

		return 
	end

	PlayFabClientApi.GetUserReadOnlyData(request, on_complete)

	return 
end
BackendInterfaceHeroAttributesPlayFab.ready = function (self)
	return self._initialized
end
BackendInterfaceHeroAttributesPlayFab.update = function (self, dt)
	return 
end
BackendInterfaceHeroAttributesPlayFab.get = function (self, hero, attribute)
	local key = hero .. "_" .. attribute

	return self._attributes[key] or DEFAULT_ATTRIBUTES[key]
end
BackendInterfaceHeroAttributesPlayFab.set = function (self, hero, attribute, value)
	fassert(value ~= nil, "Trying to set a hero attribute to nil, don't do this")

	local key = hero .. "_" .. attribute
	self._attributes[key] = value
	local request = {
		FunctionName = "updateHeroAttributes",
		FunctionParameter = {
			hero_attributes = {
				[key] = value
			}
		}
	}

	local function on_complete(result)
		if result.Error then
			Application.warning("Error saving hero attributes!")
			table.dump(result, "PlayFabError", math.huge)
		else
			print("Hero attributes saved!")
		end

		return 
	end

	PlayFabClientApi.ExecuteCloudScript(request, on_complete)

	return 
end
BackendInterfaceHeroAttributesPlayFab.prestige = function (self, hero_name, callback_function)
	local request = {
		FunctionName = "prestigeHero",
		FunctionParameter = {
			hero_name = hero_name
		}
	}
	local prestige_request_cb = callback(self, "prestige_request_cb", hero_name, callback_function)

	PlayFabClientApi.ExecuteCloudScript(request, prestige_request_cb, prestige_request_cb)

	return 
end
BackendInterfaceHeroAttributesPlayFab.prestige_request_cb = function (self, hero_name, callback_function, result)
	if result.Error then
		table.dump(result, "PlayFabError", math.huge)
		fassert(false, "Error trying to prestige hero")
	else
		local function_result = result.FunctionResult
		local success = function_result.success
		local error = "Prestige Failed, incorrect level or already max prestige"
		local rewarded_items = {}

		if success then
			local items = function_result.items
			local new_prestige_level = function_result.new_prestige_level
			local num_items = #items

			for i = 1, num_items, 1 do
				local item = items[i]
				local backend_id = item.ItemInstanceId

				self._backend_mirror:add_item(backend_id, item)

				rewarded_items[#rewarded_items + 1] = backend_id
			end

			self._attributes[hero_name .. "_prestige"] = new_prestige_level
			self._attributes[hero_name .. "_experience"] = 0
			local career_data_changes = function_result.character_data_changes

			for career_name, data_changes in pairs(career_data_changes) do
				for key, value in pairs(data_changes) do
					self._backend_mirror:update_career_data(career_name, key, value)
				end
			end

			Managers.backend:dirtify_interfaces()

			error = nil
		end

		if callback_function then
			callback_function(success, error, rewarded_items)
		end
	end

	return 
end

return 
