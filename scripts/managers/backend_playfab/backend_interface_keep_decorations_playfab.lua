require("scripts/settings/keep_decoration_settings")

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceKeepDecorationsPlayFab = class(BackendInterfaceKeepDecorationsPlayFab)
local BACKEND_PREFIX = "keep_decoration_"

BackendInterfaceKeepDecorationsPlayFab.init = function (self, backend_mirror)
	self._decoration_data = {}
	self._decoration_data_to_save = {}
	self._backend_mirror = backend_mirror
	local all_keys = {}

	for _, settings in pairs(KeepDecorationSettings) do
		local prefixed_key = BACKEND_PREFIX .. settings.backend_key
		all_keys[#all_keys + 1] = prefixed_key
	end

	local request_size = 10
	local requests = {}

	for ii = 1, #all_keys, 1 do
		local request_index = math.ceil(ii / request_size)
		local request = requests[request_index]

		if not request then
			request = {
				Keys = {}
			}
			requests[request_index] = request
		end

		local keys = request.Keys
		keys[#keys + 1] = all_keys[ii]
	end

	local num_requests = #requests
	local num_responses = 0

	local function on_complete(result)
		for key, entry in pairs(result.Data) do
			self._decoration_data[key] = entry.Value
		end

		num_responses = num_responses + 1

		if num_responses == num_requests then
			self._initialized = true

			print("Keep decoration player data loaded!")
		end
	end

	for i = 1, num_requests, 1 do
		local request = requests[i]

		PlayFabClientApi.GetUserReadOnlyData(request, on_complete)
	end
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

	local function request_callback(on_complete, result)
		print("Keep Decorations saved!")
		table.clear(data_to_save)
		save_callback(on_complete, true)
	end

	return {
		payload = table.clone(request),
		callback = function (payload, on_complete)
			PlayFabClientApi.ExecuteCloudScript(payload, callback(request_callback, on_complete))
		end
	}
end

return
