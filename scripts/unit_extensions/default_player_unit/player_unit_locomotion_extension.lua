require("scripts/helpers/mover_helper")

PlayerUnitLocomotionExtension = class(PlayerUnitLocomotionExtension)
IS_NEW_FRAME = false
local POSITION_LOOKUP = POSITION_LOOKUP

PlayerUnitLocomotionExtension.set_new_frame = function ()
	IS_NEW_FRAME = true
end

PlayerUnitLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.is_server = Managers.player.is_server
	self.player = extension_init_data.player
	local profile_index = self.player:profile_index()
	local profile = SPProfiles[profile_index]
	local mover_profile = profile.mover_profile
	self._default_mover_filter = mover_profile or "filter_player_mover"
	self._pactsworn_no_clip = self._default_mover_filter == "filter_player_mover_pactsworn"
	self._no_clip_filter = {}
	self.velocity_network = Vector3Box()
	self.velocity_current = Vector3Box()
	self.animation_translation_scale = Vector3Box(1, 1, 1)
	self.external_velocity = nil
	self._external_velocity_enabled = true
	self._script_driven_gravity_scale = 1
	self.velocity_forced = nil
	self.use_drag = true

	self:reset()

	self._move_speed_lerp_val = 0
	self.move_speed_anim_var = Unit.animation_find_variable(unit, "move_speed")
	self.collides_down = true
	self.on_ground = true
	self.time_since_last_down_collide = 0
	self.rotate_along_direction = true
	self.debugging_animations = false
	self.ignore_gravity = false

	self:_initialize_sample_velocities()

	self.mover_state = MoverHelper.create_mover_state()

	MoverHelper.set_active_mover(unit, self.mover_state, "standing")

	self.world = extension_init_context.world
	self.is_bot = extension_init_data.player.bot_player
	local rotation = Unit.local_rotation(unit, 0)
	self.target_rotation = QuaternionBox(rotation)

	self:move_to_non_intersecting_position()

	local position = Unit.world_position(unit, 0)
	self.has_moved_from_start_position = false
	self._start_position = Vector3Box(position)

	if self.is_server then
		local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()

		AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table, nil, 1)

		self._latest_position_on_navmesh = Vector3Box(position)
		self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
		self._nav_traverse_logic = GwNavTraverseLogic.create(self._nav_world, nav_cost_map_cost_table)
		self._nav_cost_map_cost_table = nav_cost_map_cost_table
	end

	self._system_data = extension_init_data.system_data
	self._system_data.all_update_units[unit] = self
	self._mover_modes = {
		ladder = false,
		enemy_noclip = false,
		dark_pact_noclip = false
	}
	self._climb_entrance = nil
	self._climb_exit = nil
	self.wanted_position = Vector3Box()
end

PlayerUnitLocomotionExtension.set_mover_filter_property = function (self, property, bool)
	local modes = self._mover_modes

	fassert(bool ~= nil, "Trying to set mover filter property nil")
	fassert(modes[property] ~= nil, "Trying to set unitialized mover filter property %q.", bool)

	modes[property] = bool
	local filter = nil

	if modes.ladder then
		filter = "filter_player_ladder_mover"
	elseif modes.enemy_noclip then
		filter = "filter_player_enemy_noclip_mover"
	elseif modes.dark_pact_noclip then
		filter = "filter_player_mover_pactsworn_ghost_mode"
	else
		filter = self._default_mover_filter
	end

	local mover = Unit.mover(self.unit)

	Mover.set_collision_filter(mover, filter)
end

local ALLOWED_MOVER_MOVE_DISTANCE = 1

PlayerUnitLocomotionExtension.move_to_non_intersecting_position = function (self)
	local unit = self.unit
	local mover = Unit.mover(unit)
	local is_colliding, colliding_actor, move_vector, new_position = Mover.separate(mover, ALLOWED_MOVER_MOVE_DISTANCE)

	if is_colliding and new_position then
		Mover.set_position(mover, new_position)
		Unit.set_local_position(unit, 0, new_position)
	end
end

PlayerUnitLocomotionExtension.destroy = function (self)
	if self.is_server then
		GwNavCostMap.destroy_tag_cost_table(self._nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(self._nav_traverse_logic)
	end

	local unit = self.unit
	local system_data = self._system_data
	system_data.all_disabled_units[unit] = nil
	system_data.all_update_units[unit] = nil
end

PlayerUnitLocomotionExtension.set_on_moving_platform = function (self, platform_unit)
	local level_unit_id = nil

	if platform_unit then
		local platform_extension = ScriptUnit.extension(platform_unit, "transportation_system")
		self._platform_extension = platform_extension
		self._platform_unit = platform_unit
		level_unit_id = Managers.state.network:level_object_id(platform_unit)
	else
		self._platform_extension = nil
		self._platform_unit = nil
		level_unit_id = 0
	end

	local game = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(self.unit)

	GameSession.set_game_object_field(game, go_id, "moving_platform", level_unit_id)
	self:sync_network_position(game, go_id)
end

PlayerUnitLocomotionExtension.get_moving_platform = function (self)
	return self._platform_unit, self._platform_extension
end

PlayerUnitLocomotionExtension.hot_join_sync = function (self, sender)
	local unit = self.unit
	local game_object_id = Managers.state.network:unit_game_object_id(unit)
	local channel_id = PEER_ID_TO_CHANNEL[sender]

	RPC.rpc_sync_anim_state_3(channel_id, game_object_id, Unit.animation_get_state(unit))
end

PlayerUnitLocomotionExtension._initialize_sample_velocities = function (self)
	self._sample_velocity_index = 0
	self._sample_velocity_time = Managers.time:time("game")
	self._average_velocity = Vector3Box(0, 0, 0)
	self._small_sample_size_average_velocity = Vector3Box(0, 0, 0)
	self._sample_velocities = {
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0),
		Vector3Box(0, 0, 0)
	}
end

PlayerUnitLocomotionExtension._stop = function (self, clear_average_velocity)
	local zero = Vector3.zero()

	self.velocity_current:store(zero)
	self.velocity_network:store(zero)

	if clear_average_velocity then
		local velocities = self._sample_velocities

		for i = 1, #velocities do
			velocities[i]:store(zero)
		end
	end
end

PlayerUnitLocomotionExtension.average_velocity = function (self)
	return self._average_velocity:unbox()
end

PlayerUnitLocomotionExtension.small_sample_size_average_velocity = function (self)
	return self._small_sample_size_average_velocity:unbox()
end

PlayerUnitLocomotionExtension.extensions_ready = function (self)
	self.first_person_extension = ScriptUnit.extension(self.unit, "first_person_system")
	local first_person_unit = self.first_person_extension and self.first_person_extension.first_person_unit

	if first_person_unit then
		self._move_speed_anim_var_1p = Unit.animation_find_variable(first_person_unit, "move_speed")
	end
end

PlayerUnitLocomotionExtension.last_position_on_navmesh = function (self)
	assert(self.is_server, "last position on nav mesh is only saved on server")

	return self._latest_position_on_navmesh:unbox()
end

PlayerUnitLocomotionExtension.reset = function (self)
	self.state = "script_driven"
	self.velocity_wanted = Vector3Box(0, 0, 0)
	self.allow_jump = false

	self:reset_maximum_upwards_velocity()

	self.speed_multiplier = nil
	self.speed_multiplier_start_time = nil
	self.speed_multiplier_duration = nil
end

PlayerUnitLocomotionExtension.set_disabled = function (self, disabled, run_func, master_unit, dont_update_position_on_exit)
	self.disabled = disabled
	self.run_func = run_func
	self.master_unit = master_unit
	local system_data = self._system_data
	local unit = self.unit

	if disabled then
		system_data.all_update_units[unit] = nil
		system_data.all_disabled_units[unit] = self

		self:_stop(true)
	else
		system_data.all_update_units[unit] = self
		system_data.all_disabled_units[unit] = nil
		local pos = POSITION_LOOKUP[unit]
		self._pos_lerp_time = 0

		Unit.set_data(unit, "last_lerp_position", pos)
		Unit.set_data(unit, "last_lerp_position_offset", Vector3(0, 0, 0))
		Unit.set_data(unit, "accumulated_movement", Vector3(0, 0, 0))

		if not dont_update_position_on_exit then
			self:set_wanted_velocity(Vector3.zero())
			self:move_to_non_intersecting_position()
		end
	end
end

PlayerUnitLocomotionExtension.set_mover_disable_reason = function (self, reason, state)
	MoverHelper.set_disable_reason(self.unit, self.mover_state, reason, state)
end

PlayerUnitLocomotionExtension.set_active_mover = function (self, active_mover)
	MoverHelper.set_active_mover(self.unit, self.mover_state, active_mover)
end

PlayerUnitLocomotionExtension.post_update = function (self, unit, input, dt, context, t)
	if self._platform_extension then
		local delta = self._platform_extension:movement_delta()
		local mover = Unit.mover(unit)
		local old_pos = Mover.position(mover)
		local new_pos = old_pos + delta

		Mover.set_position(mover, new_pos)
		Unit.set_local_position(unit, 0, new_pos)
	end

	local first_person_unit = self.first_person_extension and self.first_person_extension.first_person_unit

	if first_person_unit and self._move_speed_anim_var_1p then
		local lerp_time = 0.3
		local move_speed = self.on_ground and Vector3.length(self.velocity_current:unbox()) or 0
		local move_speed_lerp_val = self._move_speed_lerp_val

		if move_speed_lerp_val < move_speed then
			move_speed_lerp_val = math.clamp(move_speed_lerp_val + move_speed / lerp_time * dt, 0, move_speed)
			self._move_speed_top = move_speed_lerp_val
		else
			local ms = self._move_speed_top or move_speed
			move_speed_lerp_val = math.clamp(move_speed_lerp_val - ms / lerp_time * dt, 0, move_speed_lerp_val)
		end

		self._move_speed_lerp_val = move_speed_lerp_val

		Unit.animation_set_variable(first_person_unit, self._move_speed_anim_var_1p, math.min(move_speed_lerp_val, 99.9999))
	end

	if script_data.debug_player_skeletons then
		local bones = Unit.bones(unit)

		for _, bone in ipairs(bones) do
			if Unit.has_node(unit, bone) then
				local i = Unit.node(unit, bone)
				local parent = Unit.scene_graph_parent(unit, i)

				if parent then
					local from = Unit.world_position(unit, parent)
					local to = Unit.world_position(unit, i)
					local r = Vector3.distance(from, to) / 10

					if r > 0.1 then
						r = 0.1
					end

					local color = Color(100, 100, 255)

					if bone == self.draw_node then
						color = Color(255, 255, 0)
					end

					QuickDrawer:cone(from, to, r, color, 20, 5)
				end
			end
		end
	end
end

PlayerUnitLocomotionExtension.moving_on_slope = function (self, calculate_fall_velocity, unit, mover, final_position)
	if self.is_bot then
		self.allow_jump = true

		return false
	end

	local slope_traversion_settings = PlayerUnitMovementSettings.slope_traversion
	local slope_angle = slope_traversion_settings.max_angle

	Mover.set_max_slope_angle(mover, slope_angle)

	local standing_on_actor = Mover.actor_colliding_down(mover)
	local slippery = true

	if standing_on_actor then
		local unit_stood_on = Actor.unit(standing_on_actor)

		if not Unit.alive(unit_stood_on) or not Unit.get_data(unit_stood_on, "slippery") then
			slippery = false
		end
	end

	local on_slope = Mover.standing_frames(mover) == 0 or slippery
	self.allow_jump = not calculate_fall_velocity or self.allow_jump and self.on_ground or Mover.flying_frames(mover) == 0 and not slippery

	return on_slope and calculate_fall_velocity
end

local ai_units = {}

PlayerUnitLocomotionExtension.update_script_driven_movement = function (self, unit, dt, t, calculate_fall_velocity)
	if self._script_movement_time_scale then
		dt = dt * self._script_movement_time_scale
		self._script_movement_time_scale = nil
	end

	local external_velocity = self.external_velocity and self.external_velocity:unbox()
	local velocity_current = self.velocity_current:unbox() + Vector3(0, 0, external_velocity and external_velocity.z or 0)
	local velocity_wanted = self.velocity_wanted:unbox()
	local mover = Unit.mover(unit)

	if calculate_fall_velocity then
		velocity_wanted.z = velocity_current.z
	end

	local velocity_forced = self.velocity_forced

	if velocity_forced then
		velocity_wanted = velocity_forced
		self.velocity_forced = nil
	end

	local external_dir, new_external_velocity = nil

	if external_velocity then
		local flat_external_velocity = Vector3.flat(external_velocity)
		external_dir = Vector3.normalize(flat_external_velocity)
		local external_length = Vector3.length(flat_external_velocity)
		local external_direction_component = Vector3.dot(external_dir, velocity_wanted)

		if external_length < external_direction_component then
			-- Nothing
		elseif external_direction_component > 0 then
			velocity_wanted = velocity_wanted - external_dir * external_direction_component + flat_external_velocity
		else
			flat_external_velocity = flat_external_velocity + external_dir * external_direction_component * dt
			local wanted_component = velocity_wanted - external_dir * external_direction_component
			velocity_wanted = wanted_component + flat_external_velocity
		end

		if self.on_ground then
			local friction_constant = 15
			local friction = math.min(friction_constant * dt, external_length) * -external_dir
			new_external_velocity = flat_external_velocity + friction
		else
			new_external_velocity = flat_external_velocity * (1 - math.min(dt * 0.00225 * external_length * external_length, 1))
		end

		if Vector3.length(new_external_velocity) < 0.01 then
			self.external_velocity = nil
		else
			self.external_velocity:store(new_external_velocity)
		end
	end

	local drag_koeff = self.use_drag and 0.00255 or 1
	local speed = Vector3.length(velocity_wanted)
	local drag_force = drag_koeff * speed * speed * Vector3.normalize(-velocity_wanted)
	local dragged_velocity = velocity_wanted + drag_force * dt

	if calculate_fall_velocity then
		local fall_speed = dragged_velocity.z
		local movement_settings_table = PlayerUnitMovementSettings.get_movement_settings_table(unit)
		fall_speed = fall_speed - movement_settings_table.gravity_acceleration * self._script_driven_gravity_scale * dt
		dragged_velocity.z = math.min(self.maximum_upward_velocity, fall_speed)
	end

	local dragged_velocity_magnitude = Vector3.length(dragged_velocity)
	local current_position = Unit.local_position(unit, 0)
	local velocity_flat_normalized = Vector3.flat(dragged_velocity)
	local velocity_flat_length = Vector3.length(velocity_flat_normalized)

	if velocity_flat_length > 0.001 then
		velocity_flat_normalized = velocity_flat_normalized / velocity_flat_length
		local flat_player_pos = Vector3.flat(current_position)
		local constrained_target = nil
		local min_dot = -1
		local max_dot = 1
		local query_radius = 1
		local query_position = current_position + velocity_flat_normalized * 0.5
		local no_clip = self._mover_modes.enemy_noclip == true
		local collide_with_enemies = not self._pactsworn_no_clip and not no_clip
		local no_clip_filter = self._no_clip_filter

		if collide_with_enemies then
			local num_ai_units = AiUtils.broadphase_query(query_position, query_radius, ai_units)

			for i = 1, num_ai_units do
				local ai_unit = ai_units[i]
				local breed = ScriptUnit.extension(ai_unit, "ai_system")._breed
				local is_alive = ScriptUnit.extension(ai_unit, "health_system"):is_alive()
				local ai_extension = ScriptUnit.extension(ai_unit, "ai_system")

				if is_alive and ai_extension.player_locomotion_constrain_radius ~= nil and not no_clip_filter[breed.armor_category] then
					local ai_radius = ai_extension.player_locomotion_constrain_radius
					local ai_min_dist_sq = ai_radius * ai_radius * 2 * 2
					local ai_position = Vector3.flat(POSITION_LOOKUP[ai_unit])
					local ai_point_on_line = flat_player_pos + velocity_flat_normalized
					local ai_dist_to_line_sq = Vector3.distance_squared(ai_position, ai_point_on_line)

					if ai_dist_to_line_sq < ai_min_dist_sq then
						constrained_target = ai_position + Vector3.normalize(ai_point_on_line - ai_position) * ai_radius * 2
						local dot = Vector3.dot(velocity_flat_normalized, Vector3.normalize(constrained_target - flat_player_pos))
						min_dot = math.max(min_dot, dot)
						max_dot = math.min(max_dot, dot)
					end
				end
			end
		end

		if max_dot < min_dot or max_dot <= 0 then
			local fall_speed = dragged_velocity.z
			dragged_velocity = Vector3.zero()
			dragged_velocity.z = fall_speed
		elseif constrained_target then
			local fall_speed = dragged_velocity.z
			dragged_velocity = constrained_target - flat_player_pos

			if Vector3.length(dragged_velocity) > 0.001 then
				dragged_velocity = Vector3.normalize(dragged_velocity) * dragged_velocity_magnitude * max_dot
			end

			dragged_velocity.z = fall_speed
		end
	else
		local flat_player_pos = Vector3.flat(current_position)
		local query_radius = 1
		local query_position = current_position + velocity_flat_normalized * 0.5
		local no_clip = self._mover_modes.enemy_noclip == true
		local collide_with_enemies = not self._pactsworn_no_clip and not no_clip

		if collide_with_enemies then
			local num_ai_units = AiUtils.broadphase_query(query_position, query_radius, ai_units)

			for i = 1, num_ai_units do
				local ai_unit = ai_units[i]
				local is_alive = ScriptUnit.extension(ai_unit, "health_system"):is_alive()
				local ai_extension = ScriptUnit.extension(ai_unit, "ai_system")

				if is_alive and ai_extension.player_locomotion_constrain_radius ~= nil then
					local ai_radius = ai_extension.player_locomotion_constrain_radius
					local ai_position = Vector3.flat(POSITION_LOOKUP[ai_unit])
					local ai_radius_sq = ai_radius * ai_radius
					local dist_to_ai_sq = Vector3.distance_squared(ai_position, flat_player_pos)

					if dist_to_ai_sq < ai_radius_sq then
						local push_strength = 2
						local push_force = push_strength * (1 - dist_to_ai_sq / ai_radius_sq)
						local push_direction = Vector3.normalize(flat_player_pos - ai_position)
						dragged_velocity = dragged_velocity + push_direction * push_force
					end
				end
			end
		end
	end

	local delta = dragged_velocity * dt

	Mover.move(mover, delta, dt)

	local final_position = Mover.position(mover)
	local final_velocity = (final_position - current_position) / dt

	self.velocity_network:store(final_velocity)
	Unit.set_local_position(unit, 0, final_position)

	if self:moving_on_slope(calculate_fall_velocity, unit, mover, final_position) then
		final_velocity.z = dragged_velocity.z
	end

	if self.external_velocity then
		local vel_dot = Vector3.dot(final_velocity, external_dir)
		local external_length = Vector3.length(new_external_velocity)

		if vel_dot < external_length then
			self.external_velocity:store(vel_dot * external_dir)
		end
	end

	self.velocity_current:store(final_velocity)
end

PlayerUnitLocomotionExtension.update_animation_driven_movement = function (self, unit, dt, t)
	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local wanted_position = Matrix4x4.translation(wanted_pose)
	local current_position = POSITION_LOOKUP[unit]
	local delta_anim = wanted_position - current_position
	delta_anim = Vector3.multiply_elements(delta_anim, self.animation_translation_scale:unbox())
	local delta_total = nil
	local velocity = self.velocity_current:unbox()
	local velocity_fall = Vector3(0, 0, velocity.z)

	if self.ignore_gravity then
		delta_total = delta_anim
	else
		velocity_fall.z = velocity_fall.z - 9.82 * dt
		local delta_velocity = velocity_fall * dt
		delta_total = delta_velocity + delta_anim
	end

	local mover = Unit.mover(unit)

	Mover.move(mover, delta_total, dt)

	local mover_position = Mover.position(mover)

	Unit.set_local_position(unit, 0, mover_position)

	local final_position = Vector3(wanted_position.x, wanted_position.y, mover_position.z)
	local velocity_new = (final_position - current_position) / dt

	if not self.ignore_gravity and self:moving_on_slope(true, unit, mover, mover_position) then
		velocity_new.z = velocity_fall.z
	end

	velocity_new.z = math.min(0, velocity_new.z)

	self.velocity_network:store(velocity_new)
	self.velocity_current:store(velocity_new)
end

PlayerUnitLocomotionExtension.set_animation_translation_scale = function (self, animation_translation_scale)
	self.animation_translation_scale:store(animation_translation_scale)
end

PlayerUnitLocomotionExtension.get_animation_translation_scale = function (self)
	return self.animation_translation_scale:unbox()
end

PlayerUnitLocomotionExtension.update_animation_driven_movement_no_mover = function (self, unit, dt, t)
	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local wanted_position = Matrix4x4.translation(wanted_pose)
	local current_position = POSITION_LOOKUP[unit]
	local delta_anim = wanted_position - current_position
	delta_anim = Vector3.multiply_elements(delta_anim, self.animation_translation_scale:unbox())
	local velocity_new = delta_anim / dt

	Unit.set_local_position(unit, 0, current_position + delta_anim)
	self.velocity_network:store(velocity_new)
	self.velocity_current:store(velocity_new)
end

PlayerUnitLocomotionExtension.update_animation_driven_movement_with_rotation_no_mover = function (self, unit, dt, t)
	self:update_animation_driven_movement_no_mover(unit, dt, t)

	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local final_rotation = Matrix4x4.rotation(wanted_pose)

	Unit.set_local_rotation(unit, 0, final_rotation)
end

PlayerUnitLocomotionExtension.update_animation_driven_movement_entrance_and_exit_no_mover = function (self, unit, dt, t)
	self:update_animation_driven_movement_no_mover(unit, dt, t)

	local exit_pos = self._climb_exit:unbox()
	local entrance_pos = self._climb_entrance:unbox()
	local look_direction_wanted = Vector3.normalize(Vector3.flat(exit_pos - entrance_pos))
	local look_rotation_wanted = Quaternion.look(look_direction_wanted)

	Unit.set_local_rotation(unit, 0, look_rotation_wanted)
end

PlayerUnitLocomotionExtension.update_script_driven_ladder_transition_movement = function (self, unit, dt, t)
	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local animation_position = Matrix4x4.translation(wanted_pose)
	local current_position = POSITION_LOOKUP[unit]
	local wanted_position = animation_position
	local mover = Unit.mover(unit)
	local delta = wanted_position - current_position

	Mover.move(mover, delta, dt)

	local final_position = Mover.position(mover)
	local move_error = wanted_position - final_position

	Unit.set_local_position(unit, 0, final_position)

	local velocity = (wanted_position - current_position) / dt

	self.velocity_network:store(velocity)
	self.velocity_current:store(velocity)
	self.old_error:store(move_error)
end

PlayerUnitLocomotionExtension.update_linked_movement = function (self, unit, dt, t)
	local link_data = self.link_data
	local link_unit = link_data.unit
	local node = link_data.node
	local offset = link_data.offset:unbox()
	local position = Unit.world_position(link_unit, node) + offset

	Unit.set_local_position(unit, 0, position)

	local velocity = Vector3.zero()

	self.velocity_network:store(velocity)
	self.velocity_current:store(velocity)
end

PlayerUnitLocomotionExtension.update_script_driven_no_mover_movement = function (self, unit, dt, t)
	local velocity = self.velocity_wanted:unbox()
	local current_position = POSITION_LOOKUP[unit]
	local final_position = current_position + velocity * dt

	Unit.set_local_position(unit, 0, final_position)
	self.velocity_network:store(velocity)
	self.velocity_current:store(velocity)
end

PlayerUnitLocomotionExtension.update_wanted_position_movement = function (self, unit, dt, t)
	local current_position = POSITION_LOOKUP[unit]
	local wanted_pos = self.wanted_position:unbox()
	local move_velocity = wanted_pos - current_position
	local velocity = self.velocity_current:unbox()
	local velocity_fall = Vector3(0, 0, velocity.z)
	velocity_fall.z = velocity_fall.z - 9.82 * dt
	local delta_velocity = move_velocity + velocity_fall
	local mover = Unit.mover(unit)

	Mover.move(mover, delta_velocity, dt)

	local mover_position = Mover.position(mover)

	Unit.set_local_position(unit, 0, mover_position)
end

PlayerUnitLocomotionExtension.set_disable_rotation_update = function (self)
	self.disable_rotation_update = true
end

PlayerUnitLocomotionExtension.set_stood_still_target_rotation = function (self, rotation)
	self.target_rotation:store(rotation)

	local rotation_flat = Vector3.flat(Quaternion.forward(rotation))
	local final_rotation = Quaternion.look(rotation_flat)

	Unit.set_local_rotation(self.unit, 0, final_rotation)
end

PlayerUnitLocomotionExtension.is_stood_still = function (self)
	local first_person_extension = self.first_person_extension
	local current_rotation = first_person_extension:current_rotation()
	local current_rotation_flat = Vector3.flat(Quaternion.forward(current_rotation))
	local velocity_current = self.velocity_current:unbox()
	velocity_current.z = 0
	local velocity_dot = Vector3.dot(velocity_current, current_rotation_flat)

	return velocity_dot == 0
end

PlayerUnitLocomotionExtension.sync_network_rotation = function (self, game, go_id)
	local current_rotation = Unit.local_rotation(self.unit, 0)
	local yaw = Quaternion.yaw(current_rotation)
	local pitch = Quaternion.pitch(current_rotation)

	GameSession.set_game_object_field(game, go_id, "yaw", yaw)
	GameSession.set_game_object_field(game, go_id, "pitch", pitch)
end

PlayerUnitLocomotionExtension.sync_network_position = function (self, game, go_id)
	local position = Unit.local_position(self.unit, 0)

	if self._platform_unit then
		local platform_pos = Unit.local_position(self._platform_unit, 0)
		position = position - platform_pos
	end

	local position_constant = NetworkConstants.position
	local min = position_constant.min
	local max = position_constant.max

	GameSession.set_game_object_field(game, go_id, "position", Vector3.clamp(position, min, max))
end

local MAX_MOVE_SPEED = 99.9999

PlayerUnitLocomotionExtension.sync_network_velocity = function (self, game, go_id, dt)
	local velocity = self.velocity_network:unbox()
	local platform_ext = self._platform_extension

	if platform_ext then
		velocity = velocity + platform_ext:movement_delta() / dt
	end

	Unit.animation_set_variable(self.unit, self.move_speed_anim_var, math.min(Vector3.length(self.velocity_current:unbox()), MAX_MOVE_SPEED))

	local min = NetworkConstants.velocity.min
	local max = NetworkConstants.velocity.max

	GameSession.set_game_object_field(game, go_id, "velocity", Vector3.clamp(velocity, min, max))
	GameSession.set_game_object_field(game, go_id, "average_velocity", Vector3.clamp(self._average_velocity:unbox(), min, max))
end

PlayerUnitLocomotionExtension.set_wanted_velocity = function (self, velocity_wanted)
	if not self.disabled and (self.state == "script_driven" or self.state == "script_driven_ladder" or self.state == "script_driven_no_mover" or self.state == "script_driven_ladder_transition_movement") then
		self.velocity_wanted:store(velocity_wanted)
	end
end

PlayerUnitLocomotionExtension.set_script_movement_time_scale = function (self, scale)
	self._script_movement_time_scale = scale
end

PlayerUnitLocomotionExtension.set_script_driven_gravity_scale = function (self, scale)
	self._script_driven_gravity_scale = scale
end

PlayerUnitLocomotionExtension.get_script_driven_gravity_scale = function (self, scale)
	return self._script_driven_gravity_scale
end

PlayerUnitLocomotionExtension.add_external_velocity = function (self, velocity_delta, upper_limit)
	if not self._external_velocity_enabled then
		return
	end

	if not self.external_velocity then
		self.external_velocity = Vector3Box()
	end

	local old_velocity = self.external_velocity:unbox()
	local max_velocity_delta = upper_limit or 5
	local already_moving_in_dir = Vector3.dot(old_velocity, Vector3.normalize(velocity_delta))
	local velocity_mod = (max_velocity_delta - math.clamp(already_moving_in_dir, 0, max_velocity_delta)) / max_velocity_delta
	local modified_delta = velocity_delta * velocity_mod
	local new_velocity = old_velocity + modified_delta

	self.external_velocity:store(new_velocity)
end

PlayerUnitLocomotionExtension.set_forced_velocity = function (self, velocity_forced)
	if not self.disabled and (self.state == "script_driven" or self.state == "script_driven_ladder") then
		assert(IS_NEW_FRAME, "trying to set forced velocity too late in frame")

		if velocity_forced then
			local current_velocity_forced = self.velocity_forced
			self.velocity_forced = current_velocity_forced and current_velocity_forced + velocity_forced or velocity_forced
		else
			self.velocity_forced = nil
		end
	end
end

PlayerUnitLocomotionExtension.set_external_velocity_enabled = function (self, enabled)
	self._external_velocity_enabled = enabled

	if self.external_velocity and not enabled then
		self.external_velocity = nil
	end
end

PlayerUnitLocomotionExtension.set_maximum_upwards_velocity = function (self, z_velocity)
	self.maximum_upward_velocity = z_velocity
end

PlayerUnitLocomotionExtension.reset_maximum_upwards_velocity = function (self)
	self.maximum_upward_velocity = 0
end

PlayerUnitLocomotionExtension.set_speed_multiplier = function (self, multiplier, t, duration)
	self.speed_multiplier = multiplier
	self.speed_multiplier_start_time = t
	self.speed_multiplier_duration = duration
end

PlayerUnitLocomotionExtension.current_speed_multiplier = function (self)
	return self.speed_multiplier
end

PlayerUnitLocomotionExtension.jump_allowed = function (self)
	return self.allow_jump
end

PlayerUnitLocomotionExtension.current_velocity = function (self)
	return self.velocity_current and self.velocity_current:unbox()
end

PlayerUnitLocomotionExtension.current_rotation = function (self)
	return self.first_person_extension:current_rotation()
end

PlayerUnitLocomotionExtension.current_relative_velocity = function (self)
	local first_person_extension = self.first_person_extension
	local velocity_current = self.velocity_current:unbox()
	local rotation_current = first_person_extension:current_rotation()
	local rotation_inverse = Quaternion.inverse(rotation_current)
	local velocity_relative = Quaternion.rotate(rotation_inverse, velocity_current)

	return velocity_relative
end

PlayerUnitLocomotionExtension.current_relative_velocity_3p = function (self)
	local unit = self.unit
	local velocity_current = self.velocity_current:unbox()
	local rotation_current = Unit.local_rotation(unit, 0)
	local rotation_inverse = Quaternion.inverse(rotation_current)
	local velocity_relative = Quaternion.rotate(rotation_inverse, velocity_current)

	return velocity_relative
end

PlayerUnitLocomotionExtension.enable_linked_movement = function (self, parent_unit, node, offset)
	self.state = "linked_movement"
	self.link_data = {
		unit = parent_unit,
		node = node,
		offset = Vector3Box(offset)
	}
	local unit = self.unit
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(unit)

	if game and go_id then
		local unit_id, is_level_unit = network_manager:game_object_or_level_id(parent_unit)

		GameSession.set_game_object_field(game, go_id, "linked_movement", true)
		GameSession.set_game_object_field(game, go_id, "link_parent_id", unit_id)
		GameSession.set_game_object_field(game, go_id, "link_parent_is_level_unit", is_level_unit)
		GameSession.set_game_object_field(game, go_id, "link_node", node)
		GameSession.set_game_object_field(game, go_id, "link_offset", offset)
	end
end

PlayerUnitLocomotionExtension.disable_linked_movement = function (self)
	local unit = self.unit
	local game = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(unit)

	if game and go_id then
		GameSession.set_game_object_field(game, go_id, "linked_movement", false)
	end
end

PlayerUnitLocomotionExtension.enable_animation_driven_movement = function (self, ignore_gravity)
	self.ignore_gravity = ignore_gravity
	self.state = "animation_driven"
end

PlayerUnitLocomotionExtension.enable_animation_driven_movement_entrance_and_exit_no_mover = function (self, entrance, exit)
	self._climb_entrance = Vector3Box(entrance)
	self._climb_exit = Vector3Box(exit)
	self.state = "animation_driven_entrance_and_exit_no_mover"
end

PlayerUnitLocomotionExtension.enable_animation_driven_movement_with_rotation_no_mover = function (self)
	self.state = "animation_driven_with_rotation_no_mover"
end

PlayerUnitLocomotionExtension.enable_script_driven_movement = function (self)
	self.velocity_forced = nil
	self._script_movement_time_scale = nil
	self.state = "script_driven"
end

PlayerUnitLocomotionExtension.enable_script_driven_ladder_movement = function (self)
	self.velocity_forced = nil
	self._script_movement_time_scale = nil
	self.state = "script_driven_ladder"

	self:set_wanted_velocity(Vector3.zero())
end

PlayerUnitLocomotionExtension.enable_script_driven_ladder_transition_movement = function (self)
	self.state = "script_driven_ladder_transition_movement"
	self.old_error = Vector3Box(0, 0, 0)
end

PlayerUnitLocomotionExtension.enable_script_driven_no_mover_movement = function (self)
	self.state = "script_driven_no_mover"
end

PlayerUnitLocomotionExtension.enable_wanted_position_movement = function (self, entrance, exit)
	self:_stop(false)

	self.state = "wanted_position_mover"
end

PlayerUnitLocomotionExtension.is_animation_driven = function (self)
	return self.state == "animation_driven"
end

PlayerUnitLocomotionExtension.is_linked_movement = function (self)
	return self.state == "linked_movement"
end

PlayerUnitLocomotionExtension.is_script_driven_ladder = function (self)
	return self.state == "script_driven_ladder"
end

PlayerUnitLocomotionExtension.is_script_driven_ladder_transition = function (self)
	return self.state == "script_driven_ladder_transition_movement"
end

PlayerUnitLocomotionExtension.get_link_data = function (self)
	return self.link_data
end

PlayerUnitLocomotionExtension.is_colliding_down = function (self)
	return self.collides_down
end

PlayerUnitLocomotionExtension.force_on_ground = function (self, on_ground)
	self.on_ground = on_ground
end

PlayerUnitLocomotionExtension.is_on_ground = function (self)
	return self.on_ground
end

PlayerUnitLocomotionExtension.set_wanted_pos = function (self, pos)
	self.wanted_position:store(pos)
end

PlayerUnitLocomotionExtension.teleport_to = function (self, pos, rot)
	local unit = self.unit
	local mover = Unit.mover(unit)

	Mover.set_position(mover, pos)
	Unit.set_local_position(unit, 0, pos)

	if rot ~= nil then
		self.first_person_extension:set_rotation(rot)
	end

	self:move_to_non_intersecting_position()
end

PlayerUnitLocomotionExtension.enable_rotation_towards_velocity = function (self, enabled, target_rotation, duration)
	self.rotate_along_direction = enabled

	if enabled then
		self.target_rotation_data = nil
	elseif target_rotation then
		assert(duration, "Tried to set target rotation without setting duration")

		local t = Managers.time:time("game")
		self.target_rotation_data = {
			target_rotation = QuaternionBox(target_rotation),
			start_rotation = QuaternionBox(Unit.local_rotation(self.unit, 0)),
			start_time = t,
			end_time = t + duration
		}
	end
end

PlayerUnitLocomotionExtension.enable_drag = function (self, use_drag)
	self.use_drag = use_drag
end

local num_armor_types = 6

PlayerUnitLocomotionExtension.apply_no_clip_filter = function (self, no_clip_filter, reason)
	for i = 1, num_armor_types do
		if no_clip_filter[i] then
			if not self._no_clip_filter[i] then
				self._no_clip_filter[i] = {
					[reason] = true
				}
			else
				self._no_clip_filter[i][reason] = true
			end
		end
	end
end

PlayerUnitLocomotionExtension.remove_no_clip_filter = function (self, reason)
	local no_clip_filter = self._no_clip_filter

	for i = 1, num_armor_types do
		local filter_category = no_clip_filter[i]

		if filter_category then
			filter_category[reason] = nil

			if table.is_empty(filter_category) then
				no_clip_filter[i] = nil
			end
		end
	end
end
