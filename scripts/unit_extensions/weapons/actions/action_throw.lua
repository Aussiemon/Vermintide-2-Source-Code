ActionThrow = class(ActionThrow)
ActionThrow.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.world = world
	self.owner_unit = owner_unit
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.is_server = is_server

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.owner_inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")

	return 
end
ActionThrow.client_owner_start_action = function (self, new_action, t)
	self.current_action = new_action
	self.action_time_started = t
	self.thrown = nil

	return 
end
ActionThrow.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self.thrown then
		return 
	end

	local current_action = self.current_action
	local throw_time = self.action_time_started + current_action.throw_time

	if throw_time <= t then
		self._throw(self)

		self.thrown = true
	end

	return 
end
ActionThrow._throw = function (self)
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local projectile_info = current_action.projectile_info
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local first_person_unit = first_person_extension.get_first_person_unit(first_person_extension)
	local first_person_unit_pos = POSITION_LOOKUP[first_person_unit]
	local speed = current_action.speed
	local velocity_multiplier = current_action.velocity_multiplier or 0.25
	local fp_pose = Unit.local_pose(first_person_unit, 0)
	local rotation = Unit.local_rotation(first_person_unit, 0)
	local thrower_velocity = Vector3(0, 0, 0)

	if ScriptUnit.has_extension(owner_unit, "locomotion_system") then
		thrower_velocity = ScriptUnit.extension(owner_unit, "locomotion_system"):current_velocity()
	end

	local forward = Quaternion.forward(rotation)
	local to = current_action.throw_offset
	local throw_offset = Vector3(to[1], to[2], to[3])
	local throw_offset_transformed = Matrix4x4.transform_without_translation(fp_pose, throw_offset)
	local position = first_person_unit_pos + throw_offset_transformed
	local weapon_pose = Unit.world_pose(self.weapon_unit, 0)
	local av = current_action.angular_velocity
	local angular_velocity = Vector3(av[1], av[2], av[3])
	local angular_velocity_transformed = Matrix4x4.transform_without_translation(weapon_pose, angular_velocity)
	local velocity = Vector3.normalize(Quaternion.forward(rotation) + Vector3(0, 0, current_action.uppety or 0.6))*speed + thrower_velocity*velocity_multiplier
	local proj_rotation = Unit.world_rotation(self.weapon_unit, 0)

	if current_action.is_statue_and_needs_rotation_cause_reasons then
		local statue_rotation_two = Quaternion(Vector3.up(), -math.pi)
		proj_rotation = Quaternion.multiply(proj_rotation, statue_rotation_two)
	end

	local raycast_vector = (first_person_unit_pos + forward*1.2) - first_person_unit_pos
	local length = Vector3.length(raycast_vector)
	local direction = Vector3.normalize(raycast_vector)
	local physics_world = World.get_data(self.world, "physics_world")
	local result = PhysicsWorld.immediate_raycast(physics_world, first_person_unit_pos, direction, length, "closest", "types", "both", "collision_filter", "filter_physics_projectile_large")

	if result then
		position = first_person_unit_pos
	end

	local spawn_type = "thrown"

	ActionUtils.spawn_pickup_projectile(self.world, self.weapon_unit, projectile_info.projectile_unit_name, projectile_info.projectile_unit_template_name, current_action, owner_unit, position, proj_rotation, velocity, angular_velocity_transformed, self.item_name, spawn_type)
	Unit.set_unit_visibility(self.weapon_unit, false)
	Unit.flow_event(self.weapon_unit, "lua_unwield")

	local include_local_player = false

	CharacterStateHelper.show_inventory_3p(owner_unit, false, include_local_player, self.is_server, self.owner_inventory_extension)

	if projectile_info.pickup_name then
		local dialogue_input = ScriptUnit.extension_input(self.owner_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.item_type = projectile_info.pickup_name

		dialogue_input.trigger_networked_dialogue_event(dialogue_input, "throwing_item", event_data)
	end

	if self.ammo_extension then
		local ammo_usage = current_action.ammo_usage

		self.ammo_extension:use_ammo(ammo_usage)
	end

	return 
end
ActionThrow.finish = function (self, reason)
	return 
end

return 
