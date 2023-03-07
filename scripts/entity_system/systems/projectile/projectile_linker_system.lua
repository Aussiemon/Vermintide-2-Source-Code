require("scripts/unit_extensions/weapons/projectiles/projectile_linker_extension")

ProjectileLinkerSystem = class(ProjectileLinkerSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_link_pickup",
	"rpc_spawn_and_link_units"
}
local extensions = {
	"ProjectileLinkerExtension"
}
local LINKED_PROJECTILE_LIFETIME = 30

ProjectileLinkerSystem.init = function (self, entity_system_creation_context, system_name)
	ProjectileLinkerSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.linked_projectile_units = {}
	self.owner_units_count = 0

	self.cb_linked_projectile_owner_destroyed = function (destroyed_linked_projectile_owner_unit)
		for owner_unit, linked_projectiles in pairs(self.linked_projectile_units) do
			if owner_unit == destroyed_linked_projectile_owner_unit then
				for linked_projectile_unit, _ in pairs(linked_projectiles) do
					if self:_has_reference(linked_projectile_unit) then
						self:_remove_linked_projectile_reference(linked_projectile_unit)
					end

					if Unit.alive(linked_projectile_unit) then
						Managers.state.unit_spawner:mark_for_deletion(linked_projectile_unit)
					end
				end
			end
		end

		self.linked_projectile_units[destroyed_linked_projectile_owner_unit] = nil
		self.owner_units_count = self.owner_units_count - 1
	end

	self.cb_linked_pickup_projectile_owner_destroyed = function (destroyed_linked_projectile_owner_unit)
		for owner_unit, linked_projectiles in pairs(self.linked_projectile_units) do
			if owner_unit == destroyed_linked_projectile_owner_unit then
				for linked_projectile_unit, _ in pairs(linked_projectiles) do
					if self:_has_reference(linked_projectile_unit) then
						self:_remove_linked_projectile_reference(linked_projectile_unit)
					end

					local linker_extension = ScriptUnit.has_extension(owner_unit, "projectile_linker_system")

					if linker_extension then
						linker_extension:unlink_projectile(linked_projectile_unit)
					end

					if Unit.alive(linked_projectile_unit) then
						local pickup_extension = ScriptUnit.has_extension(linked_projectile_unit, "pickup_system")

						if pickup_extension then
							pickup_extension:set_physics_enabled(true)
						end
					end
				end
			end
		end

		self.linked_projectile_units[destroyed_linked_projectile_owner_unit] = nil
		self.owner_units_count = self.owner_units_count - 1
	end

	self.cb_linked_projectile_timeout = function (linked_projectile_owner_unit, linked_projectile_unit)
		if self:_has_reference(linked_projectile_unit) then
			self:_remove_linked_projectile_reference(linked_projectile_unit)
		end

		if Unit.alive(linked_projectile_unit) then
			local unit_spawner = Managers.state.unit_spawner

			unit_spawner:mark_for_deletion(linked_projectile_unit)
		end
	end

	self.cb_linked_pickup_projectile_timeout = function (linked_projectile_owner_unit, linked_projectile_unit)
		if self:_has_reference(linked_projectile_unit) then
			self:_remove_linked_projectile_reference(linked_projectile_unit)
		end

		local linker_extension = ScriptUnit.has_extension(linked_projectile_owner_unit, "projectile_linker_system")

		if linker_extension then
			linker_extension:unlink_projectile(linked_projectile_unit)
		end

		if Unit.alive(linked_projectile_unit) then
			local pickup_extension = ScriptUnit.has_extension(linked_projectile_unit, "pickup_system")

			if pickup_extension then
				pickup_extension:set_physics_enabled(true)
			end

			if Unit.find_actor(linked_projectile_unit, "throw") then
				Unit.create_actor(linked_projectile_unit, "throw")
			end
		end
	end
end

ProjectileLinkerSystem.on_remove_extension = function (self, unit, extension_name)
	self:clear_linked_projectiles(unit)

	return ProjectileLinkerSystem.super.on_remove_extension(self, unit, extension_name)
end

ProjectileLinkerSystem.freeze = function (self, unit, extension_name, reason)
	self:clear_linked_projectiles(unit)
end

ProjectileLinkerSystem.clear_linked_projectiles = function (self, unit)
	local linked_projectile_units = self.linked_projectile_units[unit]

	if not linked_projectile_units then
		return
	end

	for linked_projectile_unit, link_data in pairs(linked_projectile_units) do
		local cb_function = link_data.cb_timeout

		cb_function(unit, linked_projectile_unit)
	end
end

local linked_projectiles_to_remove = {}

ProjectileLinkerSystem.update = function (self, context, t)
	ProjectileLinkerSystem.super.update(self, context, t)

	local linked_projectile_units = self.linked_projectile_units

	for owner_unit, linked_projectiles in pairs(linked_projectile_units) do
		for linked_projectile_unit, link_data in pairs(linked_projectiles) do
			if link_data.end_time <= t then
				linked_projectiles_to_remove[linked_projectile_unit] = {
					cb_function = link_data.cb_timeout,
					owner_unit = owner_unit
				}
			end
		end
	end

	for linked_projectile_unit, removal_data in pairs(linked_projectiles_to_remove) do
		removal_data.cb_function(removal_data.owner_unit, linked_projectile_unit)
	end

	table.clear(linked_projectiles_to_remove)
end

ProjectileLinkerSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

ProjectileLinkerSystem.add_linked_projectile_reference = function (self, owner_unit, linked_projectile_unit, destroy_cb_name, timeout_cb_name, add_destroy_listener)
	local t = Managers.time:time("game")

	if not self.linked_projectile_units[owner_unit] then
		self.linked_projectile_units[owner_unit] = {}
		self.owner_units_count = self.owner_units_count + 1

		if add_destroy_listener then
			local unit_spawner = Managers.state.unit_spawner

			unit_spawner:add_destroy_listener(owner_unit, "linked_projectile_owner_" .. self.owner_units_count, self[destroy_cb_name or "cb_linked_projectile_owner_destroyed"])
		end
	end

	self.linked_projectile_units[owner_unit][linked_projectile_unit] = {
		end_time = t + LINKED_PROJECTILE_LIFETIME,
		cb_timeout = self[timeout_cb_name or "cb_linked_projectile_timeout"]
	}
end

ProjectileLinkerSystem._remove_linked_projectile_reference = function (self, linked_projectile_unit)
	for _, linked_projectiles in pairs(self.linked_projectile_units) do
		linked_projectiles[linked_projectile_unit] = nil
	end
end

ProjectileLinkerSystem._has_reference = function (self, linked_projectile_unit)
	for _, linked_projectiles in pairs(self.linked_projectile_units) do
		if linked_projectiles[linked_projectile_unit] then
			return true
		end
	end

	return false
end

ProjectileLinkerSystem.link_pickup = function (self, pickup_unit, link_position, link_rotation, hit_unit, node_index)
	local throw_actor = Unit.actor(pickup_unit, "throw")

	if throw_actor then
		Unit.destroy_actor(pickup_unit, "throw")
	end

	if ScriptUnit.has_extension(hit_unit, "projectile_linker_system") then
		local hit_node_rot = Unit.world_rotation(hit_unit, node_index)
		local hit_node_pos = Unit.world_position(hit_unit, node_index)
		local rel_pos = link_position - hit_node_pos
		local offset_position = Vector3(Vector3.dot(Quaternion.right(hit_node_rot), rel_pos), Vector3.dot(Quaternion.forward(hit_node_rot), rel_pos), Vector3.dot(Quaternion.up(hit_node_rot), rel_pos))
		local linker_extension = ScriptUnit.extension(hit_unit, "projectile_linker_system")

		linker_extension:link_projectile(pickup_unit, offset_position, link_rotation, node_index)
		self:add_linked_projectile_reference(hit_unit, pickup_unit, "cb_linked_pickup_projectile_owner_destroyed", "cb_linked_pickup_projectile_timeout", self.is_server)
	else
		self:add_linked_projectile_reference(hit_unit, pickup_unit, "cb_linked_pickup_projectile_owner_destroyed", "cb_linked_pickup_projectile_timeout", self.is_server)
	end
end

ProjectileLinkerSystem.rpc_link_pickup = function (self, channel_id, pickup_unit_go_id, link_position, link_rotation, hit_unit_go_id, node_index, is_level_unit)
	local pickup_unit = Managers.state.unit_storage:unit(pickup_unit_go_id)
	local hit_unit = Managers.state.network:game_object_or_level_unit(hit_unit_go_id, is_level_unit)

	self:link_pickup(pickup_unit, link_position, link_rotation, hit_unit, node_index)
end

ProjectileLinkerSystem.spawn_and_link_units = function (self, linked_unit_name, link_position, link_rotation, hit_unit, node_index)
	local unit_spawner = Managers.state.unit_spawner

	if ScriptUnit.has_extension(hit_unit, "projectile_linker_system") then
		local linked_unit = unit_spawner:spawn_local_unit(linked_unit_name, link_position, link_rotation)
		local hit_node_rot = Unit.world_rotation(hit_unit, node_index)
		local hit_node_pos = Unit.world_position(hit_unit, node_index)
		local rel_pos = link_position - hit_node_pos
		local offset_position = Vector3(Vector3.dot(Quaternion.right(hit_node_rot), rel_pos), Vector3.dot(Quaternion.forward(hit_node_rot), rel_pos), Vector3.dot(Quaternion.up(hit_node_rot), rel_pos))
		local linker_extension = ScriptUnit.extension(hit_unit, "projectile_linker_system")

		linker_extension:link_projectile(linked_unit, offset_position, link_rotation, node_index)
		self:add_linked_projectile_reference(hit_unit, linked_unit)
	else
		local linked_unit = unit_spawner:spawn_local_unit(linked_unit_name, link_position, link_rotation)

		self:add_linked_projectile_reference(hit_unit, linked_unit)
	end
end

ProjectileLinkerSystem.rpc_spawn_and_link_units = function (self, channel_id, linked_unit_name_id, link_position, link_rotation, hit_unit_go_id, node_index, is_level_unit)
	local hit_unit = Managers.state.network:game_object_or_level_unit(hit_unit_go_id, is_level_unit)
	local linked_unit_name = NetworkLookup.husks[linked_unit_name_id]

	self:spawn_and_link_units(linked_unit_name, link_position, link_rotation, hit_unit, node_index)
end
