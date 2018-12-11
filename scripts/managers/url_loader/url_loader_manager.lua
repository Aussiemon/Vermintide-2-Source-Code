UrlLoaderManager = class(UrlLoaderManager)

if not UrlLoader then
	Application.warning("[UrlLoaderManager] UrlLoader doesnt exist in this engine branch!")

	UrlLoader = {
		init = function (loader)
			return
		end,
		load_texture = function (loader, url)
			return 0
		end,
		unload = function (loader, job)
			return
		end,
		done = function (loader, job)
			return false
		end,
		success = function (loader, job)
			return false
		end,
		texture = function (loader, job)
			return nil
		end,
		update = function (loader)
			return
		end,
		destroy = function (loader)
			return
		end,
		is_stub = true
	}
end

UrlLoaderManager.init = function (self)
	if not UrlLoader.is_stub then
		self._url_loader = UrlLoader()
	end

	self._current_jobs = {}
	self._loaded_texture_resources = {}
	self._cleanup = false
end

UrlLoaderManager.load_resource = function (self, url, callback, cache_key, cache_version, texture_category)
	cache_key = cache_key or url
	cache_version = cache_version or "1"
	texture_category = texture_category or "downloaded_textures"
	local job = {
		url_job = UrlLoader.load_texture(self._url_loader, url, cache_key, cache_version, texture_category),
		callback = callback
	}
	self._current_jobs[job.url_job] = job
end

UrlLoaderManager.unload_resource = function (self, texture_resource)
	local url_job = self._loaded_texture_resources[texture_resource]

	UrlLoader.unload(self._url_loader, url_job)

	self._loaded_texture_resources[texture_resource] = nil
	self._cleanup = true
end

UrlLoaderManager.update = function (self, dt)
	for key, job in pairs(self._current_jobs) do
		if UrlLoader.done(self._url_loader, job.url_job) and UrlLoader.success(self._url_loader, job.url_job) then
			local texture_resource = UrlLoader.texture(self._url_loader, job.url_job)
			self._loaded_texture_resources[texture_resource] = job.url_job
			self._current_jobs[key] = nil

			job.callback(texture_resource)
		end
	end
end

UrlLoaderManager.post_render = function (self)
	if self._cleanup then
		UrlLoader.update(self._url_loader)

		self._cleanup = false
	end
end

UrlLoaderManager.destroy = function (self)
	for key, url_job in pairs(self._loaded_texture_resources) do
		Application.warning("[UrlLoaderManager] UrlLoader found loaded job in :destroy() - make sure you clean up with UrlLoaderManager.unload_resource")
		UrlLoader.unload(self._url_loader, url_job)

		self._loaded_texture_resources[key] = nil
	end

	for key, job in pairs(self._current_jobs) do
		UrlLoader.unload(self._url_loader, job.url_job)

		self._current_jobs[key] = nil
	end

	UrlLoader.update(self._url_loader)
	UrlLoader.destroy(self._url_loader)

	self._url_loader = nil
	self._current_jobs = nil
	self._loaded_texture_resources = nil
end

return
