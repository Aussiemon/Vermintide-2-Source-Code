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

	self._jobs = {}
	self._url_jobs = {}
	self._texture_resources = {}
	self._reference_counters = {}
	self._reference_callbacks = {}
	self._cleanup = false
end

UrlLoaderManager.load_resource = function (self, reference_name, url, callback, cache_key, cache_version, texture_category)
	cache_key = cache_key or url
	cache_version = cache_version or "1"
	texture_category = texture_category or "downloaded_textures"

	if not self._jobs[cache_key] then
		local url_job = UrlLoader.load_texture(self._url_loader, url, cache_key, cache_version, texture_category)
		local job = {
			url_job = url_job,
			cache_key = cache_key,
			cache_version = cache_version,
			texture_category = texture_category
		}
		self._jobs[cache_key] = job
		self._url_jobs[cache_key] = url_job
	end

	if not self._reference_counters[cache_key] then
		self._reference_counters[cache_key] = {}
	end

	if not self._reference_callbacks[cache_key] then
		self._reference_callbacks[cache_key] = {}
	end

	self._reference_counters[cache_key][reference_name] = true
	self._reference_callbacks[cache_key][reference_name] = callback
end

UrlLoaderManager.unload_resource = function (self, reference_name)
	local reference_counters = self._reference_counters
	local reference_callbacks = self._reference_callbacks
	local reference_cache_key = nil

	for cache_key, references in pairs(reference_counters) do
		if references[reference_name] then
			reference_cache_key = cache_key
			references[reference_name] = nil
			reference_callbacks[cache_key][reference_name] = nil

			if next(references) then
				return
			else
				break
			end
		end
	end

	fassert(reference_cache_key, "Could not find any Cache key for reference (%s)", reference_name)

	local jobs = self._jobs
	local url_jobs = self._url_jobs
	local url_job = url_jobs[reference_cache_key]
	local url_loader = self._url_loader

	UrlLoader.unload(url_loader, url_job)

	jobs[reference_cache_key] = nil
	url_jobs[reference_cache_key] = nil
	local texture_resources = self._texture_resources
	texture_resources[reference_cache_key] = nil
	self._cleanup = true
end

UrlLoaderManager._on_job_complete = function (self, job, success)
	local url_loader = self._url_loader
	local url_job = job.url_job
	local cache_key = job.cache_key

	if success then
		local texture_resource = UrlLoader.texture(url_loader, url_job)
		self._texture_resources[cache_key] = texture_resource
	else
		local reference_counters = self._reference_counters
		local cache_key_references = reference_counters[cache_key]
		local reference_callbacks = self._reference_callbacks
		local cache_key_callbacks = reference_callbacks[cache_key]

		for reference_name, callback in pairs(cache_key_callbacks) do
			callback(nil)

			cache_key_callbacks[reference_name] = nil
			cache_key_references[reference_name] = nil
		end

		UrlLoader.unload(url_loader, url_job)

		local url_jobs = self._url_jobs
		url_jobs[cache_key] = nil
	end

	local jobs = self._jobs
	jobs[cache_key] = nil
end

UrlLoaderManager.update = function (self, dt)
	local url_loader = self._url_loader
	local jobs = self._jobs

	for cache_key, job in pairs(jobs) do
		local url_job = job.url_job

		if UrlLoader.done(url_loader, url_job) then
			local success = UrlLoader.success(url_loader, url_job)

			self:_on_job_complete(job, success)
		end
	end

	local texture_resources = self._texture_resources
	local reference_callbacks = self._reference_callbacks

	for cache_key, callbacks in pairs(reference_callbacks) do
		local texture_resource = texture_resources[cache_key]

		if texture_resource then
			for reference_name, callback in pairs(callbacks) do
				callback(texture_resource)

				callbacks[reference_name] = nil
			end
		end
	end
end

UrlLoaderManager.post_render = function (self)
	if self._cleanup then
		local url_loader = self._url_loader

		UrlLoader.update(url_loader)

		self._cleanup = false
	end
end

UrlLoaderManager.destroy = function (self)
	local url_loader = self._url_loader
	local url_jobs = self._url_jobs
	local texture_resources = self._texture_resources

	for cache_key, texture_resource in pairs(texture_resources) do
		local url_job = url_jobs[cache_key]

		UrlLoader.unload(url_loader, url_job)
	end

	local reference_counters = self._reference_counters

	for cache_key, references in pairs(reference_counters) do
		for reference_name, _ in pairs(references) do
			Application.warning(string.format("[UrlLoaderManager] - [Destroy] - Found existing reference to Cache key: (%s), Reference name: (%s)", cache_key, reference_name))
		end
	end

	UrlLoader.update(url_loader)
	UrlLoader.destroy(url_loader)

	self._url_loader = nil
	self._jobs = nil
	self._url_jobs = nil
	self._texture_resources = nil
	self._reference_counters = nil
	self._reference_callbacks = nil
end

return
