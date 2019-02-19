local function readonlytable(table)
	return setmetatable({}, {
		__metatable = false,
		__index = table,
		__newindex = function (table, key, value)
			error("Coder trying to modify EntityManager's read-only empty table. Don't do it!")
		end
	})
end

local EMPTY_TABLE = readonlytable({})
EntityManager2 = class(EntityManager2)

EntityManager2.init = function (self)
	self.temp_table = {}
	self._ignore_extensions_list = {}
	self._units = {}
	self._unit_extensions_list = {}
	self._extensions = {}
	self._systems = {}
	self._extension_to_system_map = {}
	self.system_to_extension_per_unit_type_map = {}
end

EntityManager2.set_extension_extractor_function = function (self, extension_extractor_function)
	self.extension_extractor_function = extension_extractor_function
end

EntityManager2.register_system = function (self, system, system_name, extension_list)
	assert(self._systems[system_name] == nil, string.format("Tried to register system whose name '%s' was already registered.", system_name))

	self._systems[system_name] = system
	system.NAME = system_name

	for i, extension in ipairs(extension_list) do
		self._extension_to_system_map[extension] = system_name
	end

	GarbageLeakDetector.register_object(system, system_name)
end

EntityManager2.system = function (self, system_name)
	return self._systems[system_name]
end

EntityManager2.system_by_extension = function (self, extension_name)
	local system_name = self._extension_to_system_map[extension_name]

	return system_name and self._systems[system_name]
end

EntityManager2.get_entities = function (self, extension_name)
	return self._extensions[extension_name] or EMPTY_TABLE
end

EntityManager2.destroy = function (self)
	self.temp_table = nil
	self._units = nil
	self._unit_extensions_list = nil
	self._extensions = nil
	self._systems = nil
	self._extension_to_system_map = nil
	self.extension_extractor_function = nil

	GarbageLeakDetector.register_object(self, "EntityManager")
end

EntityManager2.add_unit_extensions = function (self, world, unit, unit_template_name, all_extension_init_data)
	all_extension_init_data = all_extension_init_data or EMPTY_TABLE
	local ignore_extensions_list = self._ignore_extensions_list
	local extension_to_system_map = self._extension_to_system_map
	local self_units = self._units
	local self_extensions = self._extensions
	local self_systems = self._systems
	local extensions_list, num_extensions = self.extension_extractor_function(unit, unit_template_name)

	if unit_template_name and self.system_to_extension_per_unit_type_map[extensions_list] == nil then
		local reverse_lookup = {}

		for i = 1, num_extensions, 1 do
			repeat
				local extension_name = extensions_list[i]

				if ignore_extensions_list[extension_name] then
					break
				end

				local system_name = self._extension_to_system_map[extension_name]
				reverse_lookup[system_name] = extension_name
			until true
		end

		self.system_to_extension_per_unit_type_map[extensions_list] = reverse_lookup
	end

	local unit_extensions_list = self._unit_extensions_list

	assert(not unit_extensions_list[unit], "Adding extensions to a unit that already has extensions added!")

	unit_extensions_list[unit] = extensions_list

	if num_extensions == 0 then
		if unit_template_name ~= nil then
			Unit.flow_event(unit, "unit_registered")
		end

		return false
	end

	for i = 1, num_extensions, 1 do
		repeat
			local extension_name = extensions_list[i]

			if ignore_extensions_list[extension_name] then
				break
			end

			local extension_system_name = extension_to_system_map[extension_name]

			assert(extension_system_name, string.format("No such registered extension %q", extension_name))

			local extension_init_data = all_extension_init_data[extension_system_name] or EMPTY_TABLE

			assert(extension_to_system_map[extension_name])

			local system = self_systems[extension_system_name]

			assert(system ~= nil, string.format("Adding extension %q with no system is registered.", extension_name))

			local extension = system:on_add_extension(world, unit, extension_name, extension_init_data)

			assert(extension, string.format("System (%s) must return the created extension (%s)", extension_system_name, extension_name))

			self_extensions[extension_name] = self_extensions[extension_name] or {}
			self_units[unit] = self_units[unit] or {}
			self_units[unit][extension_name] = extension

			assert(extension ~= EMPTY_TABLE)
		until true
	end

	local extensions = self_units[unit]

	for i = 1, num_extensions, 1 do
		repeat
			local extension_name = extensions_list[i]

			if ignore_extensions_list[extension_name] then
				break
			end

			local extension = extensions[extension_name]

			if extension.extensions_ready ~= nil then
				extension:extensions_ready(world, unit)
			end

			local extension_system_name = extension_to_system_map[extension_name]
			local system = self_systems[extension_system_name]

			if system.extensions_ready ~= nil then
				system:extensions_ready(world, unit, extension_name)
			end
		until true
	end

	Unit.flow_event(unit, "unit_registered")

	return true
end

EntityManager2.sync_unit_extensions = function (self, unit, go_id)
	local extensions = self._units[unit]

	if extensions then
		for extension_name, extension in pairs(extensions) do
			if extension.game_object_initialized ~= nil then
				extension:game_object_initialized(unit, go_id)
			end
		end
	end
end

EntityManager2.hot_join_sync = function (self, unit)
	local unit_extensions = ScriptUnit.extensions(unit)

	if not unit_extensions then
		return
	end

	for system_name, extension in pairs(unit_extensions) do
		if extension.hot_join_sync then
			extension:hot_join_sync(Managers.state.network:game_session_host())
		end
	end
end

local TEMP_TABLE = {}

EntityManager2.register_unit = function (self, world, unit, maybe_init_data, ...)
	local extension_init_data = nil

	if type(maybe_init_data) == "table" then
		extension_init_data = maybe_init_data
	else
		extension_init_data = {
			maybe_init_data,
			...
		}
	end

	if self:add_unit_extensions(world, unit, nil, extension_init_data) then
		TEMP_TABLE[1] = unit

		self:register_units_extensions(TEMP_TABLE, 1)
	end
end

EntityManager2.add_and_register_units = function (self, world, unit_list, num_units)
	num_units = num_units or #unit_list
	local added_list = self.temp_table
	local num_added = 0

	for i = 1, num_units, 1 do
		local unit = unit_list[i]
		local unit_template = Unit.get_data(unit, "unit_template")

		if self:add_unit_extensions(world, unit, unit_template) then
			num_added = num_added + 1
			added_list[num_added] = unit
		end
	end

	if num_added > 0 then
		self:register_units_extensions(added_list, num_added)
	end
end

EntityManager2.register_units_extensions = function (self, unit_list, num_units)
	local self_units = self._units
	local self_extensions = self._extensions

	for i = 1, num_units, 1 do
		repeat
			local unit = unit_list[i]
			local unit_extensions = self_units[unit]

			if not unit_extensions then
				break
			end

			for extension_name, extension in pairs(unit_extensions) do
				assert(not self_extensions[extension_name][unit], string.format("Unit %q already has extension %s registered.", unit, extension_name))

				self_extensions[extension_name][unit] = extension
			end
		until true
	end
end

EntityManager2.remove_extensions_from_unit = function (self, unit, extensions_to_remove)
	local unit_extensions_list = self._unit_extensions_list
	local self_extensions = self._extensions
	local ScriptUnit_destroy_extension = ScriptUnit.destroy_extension
	local unit_extensions = ScriptUnit.extensions(unit)
	local extensions_list = unit_extensions_list[unit]

	if not extensions_list then
		return
	end

	local num_ext = #extensions_list

	for _, extension_name in ipairs(extensions_to_remove) do
		local system = self:system_by_extension(extension_name)
		local system_name = system.NAME

		ScriptUnit_destroy_extension(unit, system_name)
	end

	for _, extension_name in ipairs(extensions_to_remove) do
		local system = self:system_by_extension(extension_name)

		system:on_remove_extension(unit, extension_name)
		assert(not ScriptUnit.has_extension(unit, system.NAME), string.format("Extension was not properly destroyed for extension %s", extension_name))

		self_extensions[extension_name][unit] = nil
	end
end

EntityManager2.freeze_extensions = function (self, unit, extensions_to_freeze, freeze_reason)
	local num_extensions_to_freeze = #extensions_to_freeze

	for i = num_extensions_to_freeze, 1, -1 do
		local extension_name = extensions_to_freeze[i]
		local system = self:system_by_extension(extension_name)

		if system and system.on_freeze_extension then
			system:on_freeze_extension(unit, extension_name, freeze_reason)
		end
	end
end

EntityManager2.unregister_units = function (self, units, num_units)
	local self_units = self._units
	local self_extensions = self._extensions
	local extension_extractor_function = self.extension_extractor_function
	local unit_extensions_list = self._unit_extensions_list
	local ScriptUnit_destroy_extension = ScriptUnit.destroy_extension
	local ScriptUnit_has_extension = ScriptUnit.has_extension
	local ignore_extensions_list = self._ignore_extensions_list

	for i = 1, num_units, 1 do
		repeat
			local unit = units[i]
			local unit_extensions = ScriptUnit.extensions(unit)

			if not unit_extensions then
				break
			end

			local extensions_list = unit_extensions_list[unit]

			if not extensions_list then
				break
			end

			local extensions_list_n = #extensions_list

			for i = extensions_list_n, 1, -1 do
				local extension_name = extensions_list[i]
				local system = self:system_by_extension(extension_name)
				local system_name = system.NAME

				if ScriptUnit_has_extension(unit, system_name) then
					ScriptUnit_destroy_extension(unit, system_name)
				end
			end

			local system_to_extension_map = self.system_to_extension_per_unit_type_map[extensions_list]

			if system_to_extension_map then
				for system_name, _ in pairs(unit_extensions) do
					local extension_name = system_to_extension_map[system_name]
					local system = self._systems[system_name]

					system:on_remove_extension(unit, extension_name)
					assert(not ScriptUnit.has_extension(unit, system.NAME), string.format("Extension was not properly destroyed for extension %s", extension_name))

					self_extensions[extension_name][unit] = nil
				end
			else
				for i = #extensions_list, 1, -1 do
					local extension_name = extensions_list[i]

					if not ignore_extensions_list[extension_name] then
						local system = self:system_by_extension(extension_name)

						system:on_remove_extension(unit, extension_name)
						assert(not ScriptUnit.has_extension(unit, system.NAME), string.format("Extension was not properly destroyed for extension %s", extension_name))

						self_extensions[extension_name][unit] = nil
					end
				end
			end

			ScriptUnit.remove_unit(unit)

			self_units[unit] = nil
			unit_extensions_list[unit] = nil
		until true
	end
end

EntityManager2.game_object_unit_destroyed = function (self, unit)
	local unit_extensions_list = self._unit_extensions_list
	local extensions_list = unit_extensions_list[unit]
	local unit_extensions = ScriptUnit.extensions(unit)

	if not unit_extensions then
		return
	end

	for system_name, _ in pairs(unit_extensions) do
		local system = self._systems[system_name]
		local extension = ScriptUnit.extension(unit, system_name)

		if extension.game_object_unit_destroyed then
			extension:game_object_unit_destroyed()
		end
	end
end

EntityManager2.add_ignore_extensions = function (self, ignore_extensions)
	local ignore_extensions_list = self._ignore_extensions_list
	local num_extensions = #ignore_extensions

	for i = 1, num_extensions, 1 do
		local extension_name = ignore_extensions[i]
		ignore_extensions_list[extension_name] = true

		print("ignoring extension", extension_name)
	end
end

local TEMP_UNIT_TABLE = {}

EntityManager2.unregister_unit = function (self, unit)
	TEMP_UNIT_TABLE[1] = unit

	self:unregister_units(TEMP_UNIT_TABLE, 1)
end

return
