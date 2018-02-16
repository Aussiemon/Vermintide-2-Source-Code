require("scripts/settings/keep_decoration_settings")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceKeepDecorationsPlayFab = class(BackendInterfaceKeepDecorationsPlayFab)
local BACKEND_PREFIX = "keep_decoration_"
BackendInterfaceKeepDecorationsPlayFab.init = function (self, backend_mirror)
	self._decoration_data = {}
	self._decoration_data_to_save = {}
	self._backend_mirror = backend_mirror
	local keys = {}

	for _, settings in pairs(KeepDecorationSettings) do
		local prefixed_key = BACKEND_PREFIX .. settings.backend_key
		keys[#keys + 1] = prefixed_key
	end

	local request = {
		Keys = keys
	}

	local function on_complete(result)
		if result.Error then
			table.dump(result, "PlayFabError", math.huge)
			fassert(false, "Error loading player read only data")

			self._initialized = true
		else
			for key, entry in pairs(result.Data) do
				self._decoration_data[key] = entry.Value
			end

			self._initialized = true

			print("Player read only data loaded!")
		end

		return 
	end

	PlayFabClientApi.GetUserReadOnlyData(request, on_complete)

	return 
end
BackendInterfaceKeepDecorationsPlayFab.ready = function (self)
	return self._initialized
end
BackendInterfaceKeepDecorationsPlayFab.update = function (self, dt)
	return 
end
BackendInterfaceKeepDecorationsPlayFab.get = function (self, key)
	local prefixed_key = BACKEND_PREFIX .. key

	return self._decoration_data[prefixed_key]
end
BackendInterfaceKeepDecorationsPlayFab.set = function (self, key, value)
	fassert(value ~= nil, "Trying to set a keep decoration to nil, don't do this")

	local prefixed_key = BACKEND_PREFIX .. key
	local current_value = self._decoration_data[prefixed_key]

	if current_value == value then
		return 
	end

	self._decoration_data[prefixed_key] = value
	self._decoration_data_to_save[prefixed_key] = value

	return 
end
BackendInterfaceKeepDecorationsPlayFab.save = function (self, save_callback)
	local data_to_save = self._decoration_data_to_save

	if table.is_empty(data_to_save) then
		print("No modified keep decorations to save...")

		return false
	end

	local request = {
		FunctionName = "updateKeepDecorations",
		FunctionParameter = {
			keep_decorations = data_to_save
		}
	}

	local function on_complete(result)
		if result.Error then
			Application.warning("Error saving Keep Decorations!")
			table.dump(result, "PlayFabError", math.huge)
			save_callback(false)
		else
			print("Keep Decorations saved!")
			table.clear(data_to_save)
			save_callback(true)
		end

		return 
	end

	PlayFabClientApi.ExecuteCloudScript(request, on_complete)

	return true
end

return 
