-- chunkname: @scripts/unit_extensions/weapons/actions/action_deus_relic_throw.lua

ActionDeusRelicThrow = class(ActionDeusRelicThrow, ActionThrow)

ActionDeusRelicThrow._throw = function (self)
	local weapon_unit = self.weapon_unit

	Unit.set_unit_visibility(weapon_unit, false)
	Unit.flow_event(weapon_unit, "lua_unwield")

	local owner_unit = self.owner_unit
	local include_local_player = false

	CharacterStateHelper.show_inventory_3p(owner_unit, false, include_local_player, self.is_server, self.owner_inventory_extension)

	local current_action = self.current_action
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local first_person_unit = first_person_extension:get_first_person_unit()
	local first_person_unit_pos = POSITION_LOOKUP[first_person_unit]
	local fp_pose = Unit.local_pose(first_person_unit, 0)
	local to = current_action.throw_offset
	local throw_offset = Vector3(to[1], to[2], to[3])
	local throw_offset_transformed = Matrix4x4.transform_without_translation(fp_pose, throw_offset)
	local position = first_person_unit_pos + throw_offset_transformed
	local proj_rotation = Unit.world_rotation(weapon_unit, 0)

	if current_action.is_statue_and_needs_rotation_cause_reasons then
		local statue_rotation_two = Quaternion(Vector3.up(), -math.pi)

		proj_rotation = Quaternion.multiply(proj_rotation, statue_rotation_two)
	end

	if current_action.rotate_towards_owner_unit then
		proj_rotation = Quaternion.look(Vector3.normalize(Vector3.flat(POSITION_LOOKUP[owner_unit]) - Vector3.flat(position)))
	end

	local projectile_info = current_action.projectile_info
	local spawn_type = "thrown"
	local speed = current_action.speed
	local buff_extension = ScriptUnit.has_extension(owner_unit, "buff_system")

	if buff_extension then
		speed = buff_extension:apply_buffs_to_value(speed, "throw_speed_increase")
	end

	local velocity_multiplier = current_action.velocity_multiplier or 0.25
	local rotation = Unit.local_rotation(first_person_unit, 0)
	local thrower_velocity = Vector3(0, 0, 0)

	if ScriptUnit.has_extension(owner_unit, "locomotion_system") then
		thrower_velocity = ScriptUnit.extension(owner_unit, "locomotion_system"):current_velocity()
	end

	local weapon_pose = Unit.world_pose(self.weapon_unit, 0)
	local av = current_action.angular_velocity
	local angular_velocity = Vector3(av[1], av[2], av[3])
	local angular_velocity_transformed = Matrix4x4.transform_without_translation(weapon_pose, angular_velocity)
	local velocity = Vector3.normalize(Quaternion.forward(rotation) + Vector3(0, 0, current_action.uppety or 0.6)) * speed + thrower_velocity * velocity_multiplier

	ActionUtils.spawn_pickup_projectile(self.world, weapon_unit, projectile_info.projectile_unit_name, projectile_info.projectile_unit_template_name, current_action, owner_unit, position, proj_rotation, velocity, angular_velocity_transformed, self.item_name, spawn_type)

	local status_extension = ScriptUnit.has_extension(self.owner_unit, "status_system")

	self.owner_inventory_extension:destroy_slot("slot_level_event", false, true)

	local grabbed_by_packmaster = status_extension and CharacterStateHelper.pack_master_status(status_extension)

	if not grabbed_by_packmaster then
		self.owner_inventory_extension:wield_previous_weapon()
	end
end
