local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceMOTDPlayfab = class(BackendInterfaceMOTDPlayfab)

BackendInterfaceMOTDPlayfab.init = function (self, mirror)
	self._initialized = false
	self._image_urls = {}
	self._mirror = mirror
	self._request_queue = mirror:request_queue()

	self:_refresh()
end

BackendInterfaceMOTDPlayfab._refresh = function (self)
	self._dirty = true
	local success_cb = callback(self, "_getMOTD_callback")
	local request = {
		FunctionName = "getMOTD"
	}

	self._request_queue:enqueue(request, success_cb)
end

BackendInterfaceMOTDPlayfab._getMOTD_callback = function (self, result)
	self._dirty = false
	self._initialized = true
	local function_result = result.FunctionResult
	local current_motd_images = function_result.current_motd_images
	self._image_urls = {}
	self._already_viewed_images = {}

	for _, url in ipairs(current_motd_images) do
		if self:_has_viewed_url(url) then
			self._already_viewed_images[#self._already_viewed_images + 1] = url
		else
			self._image_urls[#self._image_urls + 1] = url
		end
	end
end

BackendInterfaceMOTDPlayfab._has_viewed_url = function (self, url)
	local viewed_images = PlayerData.viewed_motd_urls or {}

	for _, viewed_url in ipairs(viewed_images) do
		if url == viewed_url then
			return true
		end
	end

	return false
end

BackendInterfaceMOTDPlayfab.mark_url_as_viewed = function (self, url)
	for index, image_url in ipairs(self._image_urls) do
		if image_url == url then
			self._already_viewed_images[#self._already_viewed_images + 1] = url

			table.swap_delete(self._image_urls, index)

			break
		end
	end

	PlayerData.viewed_motd_urls = self._already_viewed_images

	Managers.save:auto_save(SaveFileName, SaveData)
end

BackendInterfaceMOTDPlayfab.get_new_image_urls = function (self)
	return self._image_urls
end

BackendInterfaceMOTDPlayfab.clear_viewed_cache = function (self)
	PlayerData.viewed_motd_urls = {}

	Managers.save:auto_save(SaveFileName, SaveData)
end

BackendInterfaceMOTDPlayfab.ready = function (self)
	return self._initialized
end

BackendInterfaceMOTDPlayfab.update = function (self, dt)
	return
end

BackendInterfaceMOTDPlayfab.type = function (self)
	return "backend"
end

BackendInterfaceMOTDPlayfab.make_dirty = function (self)
	self:_refresh()
end

return
