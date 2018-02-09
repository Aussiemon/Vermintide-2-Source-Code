require("scripts/unit_extensions/limited_item_track/limited_item_track_spawner")

LimitedItemTrackSystem = class(LimitedItemTrackSystem, ExtensionSystemBase)
local RPCS = {}
local extensions = {
	"LimitedItemTrackSpawner",
	"HeldLimitedItemExtension",
	"LimitedItemExtension"
}
LimitedItemTrackSystem.init = function (self, entity_system_creation_context, system_name)
	LimitedItemTrackSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.network_event_delegate = network_event_delegate
	self.network_manager = Managers.state.network
	self.spawners = {}
	self.active_spawners = {}
	self.active_spawners_n = 0
	self.items = {}
	self.groups = {}
	self.active_groups = {}
	self.active_groups_n = 0
	self.queued_group_spawners = {}
	self.no_group_spawners = {}
	self.marked_items = {}
	self.mark_item_for_transformation = function (extension)
		local unit = extension.unit
		self.marked_items[unit] = extension.id

		return 
	end
	self.enable_spawner = function (extension)
		local unit = extension.unit
		local active_spawners_n = self.active_spawners_n + 1
		local spawners = self.spawners

		fassert(spawners[unit], "Tried enabling spawner that does not exist %q", tostring(unit))

		self.active_spawners[active_spawners_n] = unit
		self.active_spawners_n = active_spawners_n

		return 
	end
	self.disable_spawner = function (extension)
		local unit = extension.unit
		local spawner_id = self:find_active_spawner_id(unit)

		if spawner_id == nil then
			return 
		end

		table.remove(self.active_spawners, spawner_id)

		self.active_spawners_n = self.active_spawners_n - 1

		return 
	end

	return 
end
LimitedItemTrackSystem.register_group = function (self, group_name, pool_size)
	fassert(self.groups[group_name] == nil, "Limited Item Group with name %q, is already registered", group_name)

	local spawners = self.queued_group_spawners[group_name] or {}
	local spawners_n = #spawners
	self.queued_group_spawners[group_name] = nil
	self.groups[group_name] = {
		spawners = spawners,
		spawners_n = spawners_n,
		pool_size = pool_size
	}

	return 
end
LimitedItemTrackSystem.decrease_group_pool_size = function (self, group_name)
	local group = self.groups[group_name]
	local pool_size = math.max(group.pool_size - 1, 0)
	group.pool_size = pool_size

	if pool_size == 0 then
		self.deactivate_group(self, group_name)
	end

	return 
end
LimitedItemTrackSystem.activate_group = function (self, group_name, pool_size)
	local active_groups = self.active_groups
	local active_groups_n = self.active_groups_n

	for i = 1, active_groups_n, 1 do
		local active_group_name = active_groups[i]

		if active_group_name == group_name then
			Application.warning(string.format("Limited Item Group %q is already active", group_name))

			return 
		end
	end

	self.active_groups_n = active_groups_n + 1
	active_groups[self.active_groups_n] = group_name
	self.groups[group_name].pool_size = pool_size

	return 
end
LimitedItemTrackSystem.deactivate_group = function (self, group_name)
	local active_groups = self.active_groups
	local active_groups_n = self.active_groups_n

	for i = 1, active_groups_n, 1 do
		local active_group_name = active_groups[i]

		if active_group_name == group_name then
			table.remove(active_groups, i)

			self.active_groups_n = active_groups_n - 1

			break
		end
	end

	return 
end
LimitedItemTrackSystem.find_active_spawner_id = function (self, unit)
	local active_spawners = self.active_spawners
	local active_spawners_n = self.active_spawners_n

	for i = 1, active_spawners_n, 1 do
		local spawner_unit = active_spawners[i]

		if unit == spawner_unit then
			return i
		end
	end

	return nil
end
LimitedItemTrackSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.network_manager = nil

	return 
end
local dummy_input = {}
local temp_extension_init_data = {}
LimitedItemTrackSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	if next(extension_init_data) == nil and not temp_extension_init_data then
	end

	extension_init_data.network_manager = self.network_manager

	if extension_name == "LimitedItemTrackSpawner" then
		local pool = Unit.get_data(unit, "pool")
		local template_name = Unit.get_data(unit, "template_name")
		extension_init_data.pool = 1
		extension_init_data.template_name = template_name
		local extension = LimitedItemTrackSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
		extension.enable = self.enable_spawner
		extension.disable = self.disable_spawner
		self.spawners[unit] = extension
		local group_name = Unit.get_data(unit, "group_name")

		if group_name ~= "" then
			local group = self.groups[group_name]

			if group == nil then
				local queued_group_spawners = self.queued_group_spawners[group_name] or {}
				queued_group_spawners[#queued_group_spawners + 1] = extension
				self.queued_group_spawners[group_name] = queued_group_spawners
			else
				local spawners = group.spawners
				local spawners_n = group.spawners_n + 1
				spawners[spawners_n] = extension
				group.spawners_n = spawners_n
			end
		else
			self.no_group_spawners[#self.no_group_spawners + 1] = extension
		end

		extension_init_data.pool = nil
		extension_init_data.template_name = nil
		extension_init_data.network_manager = nil

		return extension
	else
		local extension = {}
		local extension_alias = self.NAME

		ScriptUnit.set_extension(unit, extension_alias, extension, dummy_input)

		if extension_name == "LimitedItemExtension" then
			extension.unit = unit
			extension.id = extension_init_data.id
			extension.spawner_unit = extension_init_data.spawner_unit
			extension.mark_for_transformation = self.mark_item_for_transformation

			if self.is_server then
				local spawner_extension = self.spawners[extension.spawner_unit]
				local item = spawner_extension.items[extension.id]

				if item and type(item) ~= "boolean" then
					ScriptApplication.send_to_crashify("LimitedItemTrackSystem", "Added limited unit with occupied id")
				end

				if spawner_extension.is_transformed(spawner_extension, extension.id) then
					spawner_extension.items[extension.id] = unit
				end
			end
		elseif extension_name == "HeldLimitedItemExtension" then
			extension.unit = unit
			extension.id = extension_init_data.id
			extension.spawner_unit = extension_init_data.spawner_unit
		else
			fassert(false, "Unknown extension name %q", extension_name)
		end

		self.items[unit] = extension
		extension_init_data.network_manager = nil

		return extension
	end

	return 
end
LimitedItemTrackSystem.on_remove_extension = function (self, unit, extension_name)
	if extension_name == "LimitedItemTrackSpawner" then
		LimitedItemTrackSystem.super.on_remove_extension(self, unit, extension_name)
	elseif extension_name == "LimitedItemExtension" then
		if self.is_server then
			local item_extension = self.items[unit]
			local spawner_unit = item_extension.spawner_unit
			local spawner_extension = self.spawners[spawner_unit]
			local marked_id = self.marked_items[unit]

			if marked_id then
				spawner_extension.transform(spawner_extension, marked_id)
			else
				spawner_extension.remove(spawner_extension, item_extension.id)
			end
		end

		self.items[unit] = nil

		ScriptUnit.remove_extension(unit, self.NAME)
	elseif extension_name == "HeldLimitedItemExtension" then
		local extension = self.items[unit]
		self.items[unit] = nil

		ScriptUnit.remove_extension(unit, self.NAME)
	end

	return 
end
LimitedItemTrackSystem.spawn_batch = function (self, group)
	local spawners = group.spawners
	local spawners_n = group.spawners_n
	local spawner_ids = {}
	local spawner_ids_n = spawners_n

	for i = 1, spawners_n, 1 do
		spawner_ids[i] = i
	end

	local spawned_items = 0
	local pool_size = group.pool_size

	for i = 1, pool_size, 1 do
		if spawner_ids_n == 0 then
			break
		end

		local rnd = math.random(1, spawner_ids_n)
		local spawner_id = spawner_ids[rnd]

		table.remove(spawner_ids, rnd)

		spawner_ids_n = spawner_ids_n - 1
		local spawner = spawners[spawner_id]
		local num_items = spawner.num_items

		fassert(num_items == 0, "Sanity Check")
		spawner.spawn_item(spawner)
	end

	return 
end
LimitedItemTrackSystem.update = function (self, context, t)
	local active_groups_n = self.active_groups_n

	if 0 < active_groups_n then
		local groups = self.groups
		local active_groups = self.active_groups

		for i = 1, active_groups_n, 1 do
			local group = groups[active_groups[i]]
			local no_items = true
			local spawners = group.spawners
			local spawners_n = group.spawners_n

			for i = 1, spawners_n, 1 do
				local spawner = spawners[i]

				if 0 < spawner.num_items then
					no_items = false
				end
			end

			if no_items then
				self.spawn_batch(self, group)
			end
		end
	end

	if Debug.active then
		if 0 < #self.no_group_spawners then
			Debug.text("There are limited item spawners on this level without a group assigned to!!!!!")
		end

		if 0 < table.size(self.queued_group_spawners) then
			Debug.text("There are limited item spawners assigned to a group that hasn't been registered!!!!!")

			for group_name, spawners in pairs(self.queued_group_spawners) do
				Debug.text(group_name)
			end
		end
	end

	return 
end
LimitedItemTrackSystem.held_limited_item_destroyed = function (self, spawner_unit, id)
	assert(self.is_server)

	local spawner_extension = self.spawners[spawner_unit]

	spawner_extension.remove(spawner_extension, id)

	return 
end

return 
