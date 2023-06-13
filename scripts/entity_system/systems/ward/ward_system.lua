WardSystem = class(WardSystem, ExtensionSystemBase)
local extensions = {
	"WardExtension"
}

WardSystem.init = function (self, entity_system_creation_context, system_name, ...)
	WardSystem.super.init(self, entity_system_creation_context, system_name, extensions, ...)

	self._update_index = 1
	self._units = {}
	self._to_update = {}
	self._lookup = {}
	self._profiler_name = self.profiler_names.WardExtension
end

WardSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension_alias = self.NAME
	local extension_pool_table = nil
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, extension_alias, extension_init_data, extension_pool_table)
	self.extensions[extension_name] = (self.extensions[extension_name] or 0) + 1
	local index = self.extensions[extension_name]
	self._units[index] = unit
	self._lookup[unit] = index

	if extension.update then
		self._to_update[(#self._to_update or 0) + 1] = extension
	end

	return extension
end

WardSystem.update = function (self, context, t)
	local num_extensions = #self._to_update
	local dt = context.dt

	if num_extensions == 0 then
		return
	end

	local index = self._update_index
	local extension = self._to_update[index]

	if extension then
		extension:update(self._units[index], nil, dt, context, t)
	end

	if index == num_extensions then
		self._update_index = 1
	else
		self._update_index = index + 1
	end
end

WardSystem.on_remove_extension = function (self, unit, extension_name)
	local extension = ScriptUnit.has_extension(unit, self.NAME)

	if not extension then
		return
	end

	local num_extensions = self.extensions[extension_name]
	local index = self._lookup[unit]

	if index == num_extensions then
		self._units[index] = nil
		self._to_update[index] = nil
		self._lookup[index] = nil
	else
		self._units[index] = self._units[num_extensions]
		self._units[num_extensions] = nil
		self._to_update[index] = self._to_update[num_extensions]
		self._to_update[num_extensions] = nil
		self._lookup[self._units[index]] = index
		self._lookup[num_extensions] = nil
	end

	self._update_index = 1
	self.extensions[extension_name] = self.extensions[extension_name] - 1

	ScriptUnit.remove_extension(unit, self.NAME)
end
