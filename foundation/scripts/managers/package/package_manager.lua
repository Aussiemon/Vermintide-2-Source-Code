local function debug_print(format, ...)
	if not script_data.package_debug then
	end

	print(string.format("[PackageManager] " .. format, ...))
end

PackageManager = PackageManager or {}

PackageManager.init = function (self)
	self._packages = {}
	self._asynch_packages = {}
	self._references = {}
	self._queued_async_packages = {}
	self._queue_order = {}
end

PackageManager.load = function (self, package_name, reference_name, callback, asynchronous, prioritize)
	debug_print("Load:  %s, %s, %s, %s", package_name, reference_name, (asynchronous and "async-read") or "sync-read", (prioritize and "prioritized") or "")
	assert(reference_name ~= nil, "No reference name passed when loading package")

	if self._references[package_name] then
		self._references[package_name][reference_name] = (self._references[package_name][reference_name] or 0) + 1

		if not asynchronous and self._asynch_packages[package_name] then
			self:force_load(package_name)

			if callback then
				callback()
			end
		elseif not asynchronous and self._queued_async_packages[package_name] then
			self:force_load_queued_package(package_name)

			if callback then
				callback()
			end
		elseif self._asynch_packages[package_name] then
			local callbacks = self._asynch_packages[package_name].callbacks
			callbacks[#callbacks + 1] = callback
		elseif self._queued_async_packages[package_name] then
			local callbacks = self._queued_async_packages[package_name].callbacks
			callbacks[#callbacks + 1] = callback

			if prioritize then
				local index = table.find(self._queue_order, package_name)

				table.remove(self._queue_order, index)
				table.insert(self._queue_order, 1, package_name)
			end
		elseif callback then
			callback()
		end
	else
		assert(self._packages[package_name] == nil, "Package '" .. tostring(package_name) .. "' is already loaded")
		assert(self._asynch_packages[package_name] == nil, "Package '" .. tostring(package_name) .. "' is already being loaded")
		assert(self._queued_async_packages[package_name] == nil, "Package '" .. tostring(package_name) .. "' is already queued")

		self._references[package_name] = {
			[reference_name] = 1
		}

		if next(self._asynch_packages) and asynchronous then
			self._queued_async_packages[package_name] = {
				callbacks = {
					callback
				}
			}

			if prioritize then
				table.insert(self._queue_order, 1, package_name)
			else
				self._queue_order[#self._queue_order + 1] = package_name
			end
		elseif not asynchronous then
			local resource_handle = Application.resource_package(package_name)

			ResourcePackage.load(resource_handle)
			ResourcePackage.flush(resource_handle)

			self._packages[package_name] = resource_handle
		else
			local resource_handle = Application.resource_package(package_name)

			ResourcePackage.load(resource_handle)

			self._asynch_packages[package_name] = {
				handle = resource_handle,
				callbacks = {
					callback
				}
			}
		end
	end
end

PackageManager.force_load = function (self, package_name)
	debug_print("Force_load:  %s", package_name)

	local package = self._asynch_packages[package_name]

	assert(package, "Package %q is not being loaded", package_name)

	local resource_handle = package.handle

	assert(not self._packages[package_name], "Package %q is already loaded", package_name)
	ResourcePackage.flush(resource_handle)

	self._packages[package_name] = resource_handle
	self._asynch_packages[package_name] = nil

	if package.callbacks then
		for _, callback in ipairs(package.callbacks) do
			callback()
		end
	end

	self:_pop_queue()
end

PackageManager.force_load_queued_package = function (self, package_name)
	debug_print("Force_load_queued_package:  %s", package_name)

	local package = self._queued_async_packages[package_name]

	assert(package, "Package %q is not being loaded", package_name)

	local resource_handle = Application.resource_package(package_name)

	ResourcePackage.load(resource_handle)
	assert(not self._packages[package_name], "Package %q is already loaded", package_name)
	ResourcePackage.flush(resource_handle)

	self._packages[package_name] = resource_handle
	self._queued_async_packages[package_name] = nil

	if package.callbacks then
		for _, callback in ipairs(package.callbacks) do
			callback()
		end
	end

	local index = table.find(self._queue_order, package_name)

	table.remove(self._queue_order, index)
	self:_pop_queue()
end

PackageManager._pop_queue = function (self)
	local queued_package_name = nil
	local index = 1

	while #self._queue_order > 0 and index <= #self._queue_order do
		queued_package_name = self._queue_order[index]

		if self._queued_async_packages[queued_package_name] then
			break
		end

		index = index + 1
		queued_package_name = nil
	end

	if queued_package_name and self._queued_async_packages[queued_package_name] then
		local data = self._queued_async_packages[queued_package_name]

		debug_print("Queueing new asynch package:  %s", queued_package_name)

		local resource_handle = Application.resource_package(queued_package_name)

		ResourcePackage.load(resource_handle)

		self._asynch_packages[queued_package_name] = {
			handle = resource_handle,
			callbacks = data.callbacks
		}
		self._queued_async_packages[queued_package_name] = nil
		self._queue_order = table.crop(self._queue_order, index + 1)
	else
		table.clear(self._queue_order)
	end
end

PackageManager.unload = function (self, package_name, reference_name)
	local references = self._references[package_name]

	assert(references[reference_name] ~= nil, "[PackageManager] Trying to unload package with unknown reference name")

	local reference_count = references[reference_name] - 1

	if reference_count == 0 then
		references[reference_name] = nil
	else
		references[reference_name] = reference_count
	end

	if table.is_empty(references) then
		local resource_handle = self._packages[package_name]

		if self._asynch_packages[package_name] then
			resource_handle = self._asynch_packages[package_name].handle

			assert(resource_handle, "Package '" .. tostring(package_name) .. "' is not loaded")
		end

		if resource_handle then
			ResourcePackage.unload(resource_handle)
			Application.release_resource_package(resource_handle)
		end

		self._packages[package_name] = nil
		self._asynch_packages[package_name] = nil
		self._references[package_name] = nil
		self._queued_async_packages[package_name] = nil

		if table.is_empty(self._asynch_packages) then
			self:_pop_queue()
		end

		debug_print("Unload:  %s, %s", package_name, reference_name)
	else
		debug_print("Unload:  %s, %s -> Package still referenced, NOT unloaded:", package_name, reference_name)
	end
end

PackageManager.can_unload = function (self, package_name)
	local resource_handle = self._packages[package_name]

	if self._asynch_packages[package_name] then
		resource_handle = self._asynch_packages[package_name].handle
	end

	if resource_handle then
		return ResourcePackage.can_unload(resource_handle)
	end

	return true
end

PackageManager.destroy = function (self)
	debug_print("Destroy()")
	table.clear(self._queue_order)
	table.clear(self._queued_async_packages)

	for package_name, _ in pairs(self._packages) do
		for reference_name, reference_count in pairs(self._references[package_name]) do
			for i = 1, reference_count, 1 do
				self:unload(package_name, reference_name)
			end
		end
	end

	for package_name, _ in pairs(self._asynch_packages) do
		for reference_name, reference_count in pairs(self._references[package_name]) do
			for i = 1, reference_count, 1 do
				self:unload(package_name, reference_name)
			end
		end
	end
end

PackageManager.is_loading = function (self, package)
	return self._packages[package] == nil and (self._asynch_packages[package] ~= nil or self._queued_async_packages[package] ~= nil)
end

PackageManager.has_loaded = function (self, package, reference_name)
	local loaded = self._packages[package] ~= nil and self._asynch_packages[package] == nil and self._queued_async_packages[package] == nil

	if reference_name then
		return loaded and self._references[package][reference_name] ~= nil
	else
		return loaded
	end
end

PackageManager.reference_count = function (self, package, reference_name)
	local reference_count = 0

	if self._references[package] then
		reference_count = self._references[package][reference_name]
	end

	return reference_count
end

PackageManager.update = function (self)
	for package_name, package in pairs(self._asynch_packages) do
		local resource_handle = package.handle

		if ResourcePackage.has_loaded(resource_handle) then
			debug_print("Finished loading asynchronous package:  %s", package_name)
			self:force_load(package_name)

			break
		end
	end

	return next(self._asynch_packages) == nil
end

PackageManager.num_references = function (self, package_name)
	local num_references = 0
	local references = self._references[package_name]

	for reference_name, reference_count in pairs(references) do
		num_references = num_references + reference_count
	end

	return num_references
end

PackageManager.unload_dangling_painting_materials = function (self)
	local is_occuring = false

	print("############### UNLOADING PACKAGES ###############")

	for package_name, resource_handle in pairs(self._packages) do
		if PaintingPackageNames[package_name] then
			is_occuring = true

			self:_force_unload(package_name)
		end
	end

	if is_occuring then
		Crashify.print_exception("Keep Decorations", "unloading dangling painting packages")
	end
end

PackageManager._force_unload = function (self, package_name)
	table.clear(self._references[package_name])

	local resource_handle = self._packages[package_name]

	if self._asynch_packages[package_name] then
		resource_handle = self._asynch_packages[package_name].handle

		assert(resource_handle, "Package '" .. tostring(package_name) .. "' is not loaded")
	end

	if resource_handle then
		ResourcePackage.unload(resource_handle)
		Application.release_resource_package(resource_handle)
	end

	self._packages[package_name] = nil
	self._asynch_packages[package_name] = nil
	self._references[package_name] = nil
	self._queued_async_packages[package_name] = nil

	if table.is_empty(self._asynch_packages) then
		self:_pop_queue()
	end

	debug_print("Unload:  %s, %s", package_name, "Keep Painting Error")
end

PackageManager.dump_reference_counter = function (self, reference_name)
	printf("[PackageManager] Dumping reference counters for %s", reference_name)

	for package_name, references in pairs(self._references) do
		local referenced = references[reference_name]

		if referenced then
			printf("%s - referenced %i", package_name, referenced)
		end
	end

	printf("[PackageManager] Done!")
end

return
