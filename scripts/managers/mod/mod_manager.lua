-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
ModManager = class(ModManager)
ModManager.init = function (self)
	self._loaded_packages = {}

	self._start_scan(self)

	return 
end
ModManager.update = function (self, dt)
	local old_state = self._state

	if self._state == "scanning" and not Mod.is_scanning() then
		printf("found %i mods", #Mod.mods())
		table.dump(Mod.mods())

		self._state = self._load_mod(self, 1)

		table.dump(Mod.mods(), "Mods", 1)
	elseif self._state == "loading" then
		local handle = self._loading_resource_handle

		if ResourcePackage.has_loaded(handle) then
			ResourcePackage.flush(handle)

			local next_index = self._package_index + 1

			if #self._mod_data.packages < next_index then
				self._mod_data.run()

				self._mod_data = nil
				self._state = self._load_mod(self, self._mod_index + 1)
			else
				self._load_package(self, next_index)
			end
		end
	end

	if old_state ~= self._state then
		print(old_state, "->", self._state)
	end

	return 
end
ModManager.all_mods_loaded = function (self)
	return self._state == "done"
end
ModManager.destroy = function (self)
	self.unload_all_mods(self)

	return 
end
ModManager._start_scan = function (self)
	Mod.start_scan()

	self._state = "scanning"

	print("scanning")

	return 
end
ModManager._load_mod = function (self, index)
	local mods = Mod.mods()
	local mod = mods[index]

	if mod then
		print("loading mod", mod)

		local info = Mod.info(mod)

		print(info)

		local mod_data = 
		-- Decompilation error in this vicinity:
		loadstring(info)()
		self._mod_index = index
		self._mod = mod
		self._mod_data = mod_data

		self._load_package(self, 1)

		return "loading"
	else
		self._mod = nil

		return "done"
	end

	return 
end
ModManager._load_package = function (self, index)
	self._package_index = index
	local package_name = self._mod_data.packages[index]

	printf("\tloading package %q", package_name)

	local resource_handle = Mod.resource_package(self._mod, package_name)
	self._loading_resource_handle = resource_handle

	ResourcePackage.load(resource_handle)

	self._loaded_packages[#self._loaded_packages + 1] = resource_handle

	return 
end
ModManager.unload_all_mods = function (self)
	print("unload all mod packages")

	for _, handle in ipairs(self._loaded_packages) do
		Mod.release_resource_package(handle)
	end

	return 
end

return 
