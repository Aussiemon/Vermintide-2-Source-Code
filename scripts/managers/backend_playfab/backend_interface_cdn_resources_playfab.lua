local json = require("PlayFab.json")
BackendInterfaceCdnResourcesPlayFab = class(BackendInterfaceCdnResourcesPlayFab)
local RESOURCE_URL_SECONDS_TO_LIVE = 3000
local RESOURCE_URL_REQUEST_LIMIT = 10
local LOCALIZATION_STATUSES = {
	failed = 2,
	loaded = 1
}

BackendInterfaceCdnResourcesPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._url_cache = {}
	self._localization_status = {}
end

BackendInterfaceCdnResourcesPlayFab.ready = function (self)
	return true
end

BackendInterfaceCdnResourcesPlayFab.load_backend_localizations = function (self, language_id, external_cb)
	local backend_resource_ids = {}
	local localizations_to_load = {}

	for _, dlc_settings in pairs(DLCSettings) do
		local backend_localizations = dlc_settings.backend_localizations

		if backend_localizations then
			for key, localizations_by_language in pairs(backend_localizations) do
				local resource_id = localizations_by_language[language_id] or localizations_by_language.en
				backend_resource_ids[#backend_resource_ids + 1] = resource_id
				localizations_to_load[resource_id] = key
			end
		end
	end

	self:get_resource_urls(backend_resource_ids, callback(self, "_cb_localization_urls_loaded", localizations_to_load, external_cb))
end

BackendInterfaceCdnResourcesPlayFab._cb_localization_urls_loaded = function (self, localizations_to_load, external_cb, result)
	for resource_id, key in pairs(localizations_to_load) do
		local url = result[resource_id]

		if url then
			if IS_WINDOWS or IS_LINUX then
				Managers.curl:get(url, {}, callback(self, "_cb_localization_loaded", key, external_cb), nil, {})
			else
				Managers.rest_transport:get(url, {}, callback(self, "_cb_localization_loaded", key, external_cb), nil, nil)
			end
		else
			self._localization_status[key] = LOCALIZATION_STATUSES.failed
		end
	end
end

BackendInterfaceCdnResourcesPlayFab._cb_localization_loaded = function (self, key, external_cb, success, code, headers, data)
	if success then
		local _, response = pcall(json.decode, data)

		if response and type(response) == "table" then
			self._localization_status[key] = LOCALIZATION_STATUSES.loaded
			local localizations = {}

			for string_id, value in pairs(response) do
				if value ~= "" then
					localizations[string_id] = value
				end
			end

			external_cb(localizations)

			return
		end
	end

	self._localization_status[key] = LOCALIZATION_STATUSES.failed
end

local function chunk_array(t, chunk_size)
	local result = {}

	for i = 1, #t, chunk_size do
		result[#result + 1] = table.slice(t, i, chunk_size)
	end

	return result
end

BackendInterfaceCdnResourcesPlayFab.has_localization_loaded = function (self, key)
	return self._localization_status[key] == LOCALIZATION_STATUSES.loaded
end

BackendInterfaceCdnResourcesPlayFab.has_localization_failed = function (self, key)
	return self._localization_status[key] == LOCALIZATION_STATUSES.failed
end

BackendInterfaceCdnResourcesPlayFab.get_resource_urls = function (self, resource_ids, external_cb)
	local result_table = {}
	local resource_ids_to_request = {}

	for i = 1, #resource_ids do
		local resource_id = resource_ids[i]
		local cached_url = self:_get_url_from_cache(resource_id)

		if cached_url then
			result_table[resource_id] = cached_url
		else
			resource_ids_to_request[#resource_ids_to_request + 1] = resource_id
		end
	end

	if #resource_ids_to_request == 0 then
		external_cb(result_table)

		return
	end

	local resource_id_chunks = chunk_array(resource_ids_to_request, RESOURCE_URL_REQUEST_LIMIT)

	self:_request_resource_urls(resource_id_chunks, result_table, external_cb)
end

BackendInterfaceCdnResourcesPlayFab._request_resource_urls = function (self, resource_id_chunks, result_table, external_cb)
	local resource_ids = table.remove(resource_id_chunks)
	local request = {
		FunctionName = "getResourceURL",
		FunctionParameter = {
			identifiers = resource_ids
		}
	}
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue(request, callback(self, "_request_resource_urls_cb", resource_id_chunks, result_table, external_cb), false)
end

BackendInterfaceCdnResourcesPlayFab._request_resource_urls_cb = function (self, resource_id_chunks, result_table, external_cb, response)
	local function_result = response.FunctionResult

	for resource_id, url in pairs(function_result) do
		self:_add_url_to_cache(resource_id, url, RESOURCE_URL_SECONDS_TO_LIVE)

		result_table[resource_id] = url
	end

	if #resource_id_chunks == 0 then
		external_cb(result_table)
	else
		self:_request_resource_urls(resource_id_chunks, result_table, external_cb)
	end
end

BackendInterfaceCdnResourcesPlayFab._add_url_to_cache = function (self, resource_id, url, seconds_to_live)
	local expire_time = nil

	if seconds_to_live then
		expire_time = os.time() + seconds_to_live
	end

	self._url_cache[resource_id] = {
		url = url,
		expire_time = expire_time
	}
end

BackendInterfaceCdnResourcesPlayFab._get_url_from_cache = function (self, resource_id)
	local cache = self._url_cache
	local cache_entry = cache[resource_id]

	if not cache_entry then
		return nil
	end

	local expire_time = cache_entry.expire_time

	if expire_time and expire_time < os.time() then
		cache[resource_id] = nil

		return nil
	end

	return cache_entry.url
end
