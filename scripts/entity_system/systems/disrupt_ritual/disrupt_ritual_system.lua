DisruptRitualSystem = class(DisruptRitualSystem, ExtensionSystemBase)
local extension_name = "DisruptRitualExtension"

DisruptRitualSystem.init = function (self, entity_system_creation_context, ...)
	DisruptRitualSystem.super.init(self, entity_system_creation_context, ...)

	self._update_index = 1
	self._units = {}
	self._is_server = entity_system_creation_context.is_server
	self._extension_list = {}
	self._profiler_name = self.profiler_names.DisruptRitualExtension
end

DisruptRitualSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension_alias = self.NAME
	local extension_pool_table = nil
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, extension_alias, extension_init_data, extension_pool_table)
	self.extensions[extension_name] = (self.extensions[extension_name] or 0) + 1
	local index = self.extensions[extension_name]
	self._units[index] = unit
	self._extension_list[#self._extension_list + 1] = extension

	return extension
end

DisruptRitualSystem.update = function (self, context, t)
	if not self._is_server then
		return
	end

	local num_extensions = self.extensions.DisruptRitualExtension

	if num_extensions == 0 then
		return
	end

	local index = self._update_index
	local dt = context.dt
	local extension = self._extension_list[index]

	extension:update(t)

	if index == num_extensions then
		self._update_index = 1
	else
		self._update_index = index + 1
	end
end

DisruptRitualSystem.hot_join_sync = function (self, peer_id)
	for extension_name, _ in pairs(self.extensions) do
		self:_hot_join_sync_extension(extension_name, peer_id)
	end
end

DisruptRitualSystem._hot_join_sync_extension = function (self, extension_name, peer_id)
	local entities = self.entity_manager:get_entities(extension_name)

	for unit, internal in pairs(entities) do
		if internal.hot_join_sync then
			internal:hot_join_sync(peer_id)
		end
	end
end
