local function debug_print(format, ...)
	if not script_data.package_debug then
	end

	print(string.format("[PackageManager] " .. format, ...))

	return 
end

PackageManager = PackageManager or {}
PackageManager.init = function (self)
	self._packages = {}
	self._asynch_packages = {}
	self._references = {}
	self._queued_async_packages = {}
	self._queue_order = {}

	return 
end
PackageManager.load = function (self, package_name, reference_name, callback, asynchronous, prioritize)
	debug_print("Load:  %s, %s, %s, %s", package_name, reference_name, (asynchronous and "async-read") or "sync-read", (prioritize and "prioritized") or "")

	if self._references[package_name] then
		self._references[package_name][reference_name] = true

		if not asynchronous and self._asynch_packages[package_name] then
			self.force_load(self, package_name)

			if callback then
				Profiler.start("PACKAGE CALLBACK")
				callback()
				Profiler.stop("PACKAGE CALLBACK")
			end
		elseif not asynchronous and self._queued_async_packages[package_name] then
			self.force_load_queued_package(self, package_name)

			if callback then
				Profiler.start("PACKAGE CALLBACK")
				callback()
				Profiler.stop("PACKAGE CALLBACK")
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
			Profiler.start("PACKAGE CALLBACK")
			callback()
			Profiler.stop("PACKAGE CALLBACK")
		end
	else
		assert(self._packages[package_name] == nil, "Package '" .. tostring(package_name) .. "' is already loaded")
		assert(self._asynch_packages[package_name] == nil, "Package '" .. tostring(package_name) .. "' is already being loaded")
		assert(self._queued_async_packages[package_name] == nil, "Package '" .. tostring(package_name) .. "' is already queued")

		self._references[package_name] = {
			[reference_name] = true
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
			Profiler.start(string.format("Load: %q", package_name))
			ResourcePackage.flush(resource_handle)

			self._packages[package_name] = resource_handle

			Profiler.stop(string.format("Load: %q", package_name))
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

	return 
end
PackageManager.force_load = function (self, package_name)
	debug_print("Force_load:  %s", package_name)

	local package = self._asynch_packages[package_name]

	assert(package, "Package %q is not being loaded", package_name)

	local resource_handle = package.handle

	assert(not self._packages[package_name], "Package %q is already loaded", package_name)
	Profiler.start("Flush resource package")
	ResourcePackage.flush(resource_handle)
	Profiler.stop("Flush resource package")

	self._packages[package_name] = resource_handle
	self._asynch_packages[package_name] = nil

	if package.callbacks then
		Profiler.start("PACKAGE CALLBACK")

		for _, callback in ipairs(package.callbacks) do
			callback()
		end

		Profiler.stop("PACKAGE CALLBACK")
	end

	self._pop_queue(self)

	return 
end
PackageManager.force_load_queued_package = function (self, package_name)
	debug_print("Force_load_queued_package:  %s", package_name)

	local package = self._queued_async_packages[package_name]

	assert(package, "Package %q is not being loaded", package_name)

	local resource_handle = Application.resource_package(package_name)

	ResourcePackage.load(resource_handle)
	assert(not self._packages[package_name], "Package %q is already loaded", package_name)
	Profiler.start("Flush resource package")
	ResourcePackage.flush(resource_handle)
	Profiler.stop("Flush resource package")

	self._packages[package_name] = resource_handle
	self._queued_async_packages[package_name] = nil

	if package.callbacks then
		Profiler.start("PACKAGE CALLBACK")

		for _, callback in ipairs(package.callbacks) do
			callback()
		end

		Profiler.stop("PACKAGE CALLBACK")
	end

	local index = table.find(self._queue_order, package_name)

	table.remove(self._queue_order, index)
	self._pop_queue(self)

	return 
end
PackageManager._pop_queue = function (self)
	local queued_package_name = nil
	local index = 1

	while 0 < #self._queue_order and index <= #self._queue_order do
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

	return 
end
PackageManager.unload = function (self, package_name, reference_name)
	debug_print("Unload:  %s, %s", package_name, reference_name)

	local references = self._references[package_name]

	assert(references[reference_name] == true, "[PackageManager] Trying to unload package with unknown reference name")

	references[reference_name] = nil

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
			self._pop_queue(self)
		end
	end

	return 
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

	for package_name, _ in pairs(self._packages) do
		for reference_name, _ in pairs(self._references[package_name]) do
			self.unload(self, package_name, reference_name)
		end
	end

	for package_name, _ in pairs(self._asynch_packages) do
		for reference_name, _ in pairs(self._references[package_name]) do
			self.unload(self, package_name, reference_name)
		end
	end

	table.clear(self._queue_order)
	table.clear(self._queued_async_packages)

	return 
end
PackageManager.is_loading = function (self, package)
	return self._packages[package] == nil and (self._asynch_packages[package] ~= nil or self._queued_async_packages[package] ~= nil)
end
PackageManager.has_loaded = function (self, package, reference_name)
	local loaded = self._packages[package] ~= nil and self._asynch_packages[package] == nil and self._queued_async_packages[package] == nil

	if reference_name then
		return loaded and self._references[package][reference_name] == true
	else
		return loaded
	end

	return 
end
PackageManager.update = function (self)
	Profiler.start("Update()")

	for package_name, package in pairs(self._asynch_packages) do
		local resource_handle = package.handle

		if ResourcePackage.has_loaded(resource_handle) then
			debug_print("Finished loading asynchronous package:  %s", package_name)
			self.force_load(self, package_name)

			break
		end
	end

	Profiler.stop("Update()")

	return 
end
local PM_UNIT_TEST = false

if PM_UNIT_TEST then
	local old_debug = script_data.package_debug
	script_data.package_debug = true

	local function printf(f, ...)
		print(string.format(f, ...))

		return 
	end

	rawset(_G, "printf", printf)

	table.is_empty = function (t)
		return next(t) == nil
	end

	debug_print("Running package manager unit test")

	local pm = PackageManager

	pm.init(pm)
	pm.load(pm, "resource_packages/strings", "unit_test_1")
	assert(pm.has_loaded(pm, "resource_packages/strings") == true)
	pm.unload(pm, "resource_packages/strings", "unit_test_1")
	assert(pm.has_loaded(pm, "resource_packages/strings") == false)
	pm.load(pm, "resource_packages/strings", "unit_test_1")
	pm.load(pm, "resource_packages/strings", "unit_test_2")
	pm.unload(pm, "resource_packages/strings", "unit_test_1")
	assert(pm.has_loaded(pm, "resource_packages/strings") == true)
	pm.unload(pm, "resource_packages/strings", "unit_test_2")
	assert(pm.has_loaded(pm, "resource_packages/strings") == false)
	pm.load(pm, "resource_packages/strings", "unit_test_1")
	pm.load(pm, "resource_packages/strings", "unit_test_1")
	pm.load(pm, "resource_packages/strings", "unit_test_1")
	pm.unload(pm, "resource_packages/strings", "unit_test_1")
	assert(pm.has_loaded(pm, "resource_packages/strings") == false)
	pm.load(pm, "resource_packages/strings", "unit_test_1")
	pm.destroy(pm)
	assert(pm.is_loading(pm, "resource_packages/strings") == false)
	pm.load(pm, "resource_packages/strings", "unit_test_1", nil, true)
	pm.destroy(pm)
	assert(pm.is_loading(pm, "resource_packages/strings") == false)

	table.is_empty = nil

	rawset(_G, "printf", nil)

	script_data.package_debug = old_debug
end

return 
