LocomotionTemplates = LocomotionTemplates or {}
local LocomotionTemplates = LocomotionTemplates
local detailed_profiler_start, detailed_profiler_stop = nil
local DETAILED_PROFILING = true

if DETAILED_PROFILING then
else
	function detailed_profiler_start()
		return 
	end

	function detailed_profiler_stop()
		return 
	end
end

LocomotionTemplates.AiHuskLocomotionExtension = {
	init = function (data, nav_world)
		data.nav_world = nav_world
		data.destroy_units = {}
		data.all_update_units = {}
		data.affected_by_gravity_update_units = {}
		data.pure_network_update_units = {}
		data.other_update_units = {}

		return 
	end
}
local LOLUPDATE = false
LocomotionTemplates.AiHuskLocomotionExtension.update = function (data, t, dt)
	local game = Managers.state.network:game()

	if game == nil then
		return 
	end

	data.game = game

	if LOLUPDATE then
		LocomotionTemplates.AiHuskLocomotionExtension.update_alive(data, t, dt)
		LocomotionTemplates.AiHuskLocomotionExtension.update_pure_network_update_units(data, t, dt)
		LocomotionTemplates.AiHuskLocomotionExtension.update_other_update_units_navmesh_check(data, t, dt)
		LocomotionTemplates.AiHuskLocomotionExtension.update_other_update_units(data, t, dt)
	else
		LocomotionTemplates.AiHuskLocomotionExtension.update_other_update_units_navmesh_check(data, t, dt)
		EngineOptimizedExtensions.ai_husk_locomotion_update(dt, game, data.all_update_units)
	end

	return 
end
LocomotionTemplates.AiHuskLocomotionExtension.update_alive = function (data, t, dt)
	local all_update_units = data.all_update_units
	local pure_network_update_units = data.pure_network_update_units
	local other_update_units = data.other_update_units

	for unit, extension in pairs(all_update_units) do
		local health_extension = ScriptUnit.extension(unit, "health_system")
		local is_alive = health_extension.is_alive(health_extension)

		if not is_alive then
			all_update_units[unit] = nil
			pure_network_update_units[unit] = nil
			other_update_units[unit] = nil
		end
	end

	return 
end
LocomotionTemplates.AiHuskLocomotionExtension.update_pure_network_update_units = function (data, t, dt)
	local GameSession_game_object_field = GameSession.game_object_field
	local Vector3_length_squared = Vector3.length_squared
	local Vector3_length = Vector3.length
	local Profiler_record_statistics = Profiler.record_statistics
	local Unit_set_local_position = Unit.set_local_position
	local Unit_set_local_rotation = Unit.set_local_rotation
	local Unit_local_rotation = Unit.local_rotation
	local Quaternion_lerp = Quaternion.lerp
	local math_min = math.min
	local math_max = math.max
	local null_vector = Vector3.zero()
	local POSITION_LOOKUP = POSITION_LOOKUP
	local VELOCITY_EPSILON_SQ = NetworkConstants.VELOCITY_EPSILON * NetworkConstants.VELOCITY_EPSILON
	local POS_EPSILON_SQ = 0.0001
	local POS_LERP_TIME = 0.1
	local WALK_THRESHOLD = 0.97
	local rotation_lerp_amount = math.min(dt * 15, 1)
	local game = data.game
	local unit_storage = Managers.state.unit_storage

	for unit, extension in pairs(data.pure_network_update_units) do
		local old_pos = POSITION_LOOKUP[unit]
		local go_id = unit_storage.go_id(unit_storage, unit)
		local network_pos = GameSession_game_object_field(game, go_id, "position")
		local has_teleported = GameSession_game_object_field(game, go_id, "has_teleported")
		local network_yaw = GameSession_game_object_field(game, go_id, "yaw_rot")
		local network_velocity = GameSession_game_object_field(game, go_id, "velocity")

		if Vector3_length_squared(network_velocity) < VELOCITY_EPSILON_SQ then
			network_velocity = Vector3(0, 0, 0)
		end

		local lerp_pos = nil

		if extension.has_teleported ~= has_teleported then
			extension.has_teleported = has_teleported
			extension._pos_lerp_time = 0

			extension.last_lerp_position:store(network_pos)
			extension.last_lerp_position_offset:store(null_vector)
			extension.accumulated_movement:store(null_vector)

			lerp_pos = network_pos
		else
			local last_pos = extension.last_lerp_position:unbox()
			local last_pos_offset = extension.last_lerp_position_offset:unbox()
			local accumulated_movement = extension.accumulated_movement:unbox()
			extension._pos_lerp_time = extension._pos_lerp_time + dt
			local lerp_t = extension._pos_lerp_time / POS_LERP_TIME
			local move_delta = network_velocity * dt
			accumulated_movement = accumulated_movement + move_delta
			local lerp_pos_offset = Vector3.lerp(last_pos_offset, null_vector, math_min(lerp_t, 1))
			lerp_pos = last_pos + accumulated_movement + lerp_pos_offset

			if POS_EPSILON_SQ < Vector3_length_squared(network_pos - last_pos) then
				extension._pos_lerp_time = 0

				extension.last_lerp_position:store(network_pos)
				extension.last_lerp_position_offset:store(lerp_pos - network_pos)
				extension.accumulated_movement:store(null_vector)
			else
				extension.accumulated_movement:store(accumulated_movement)
			end
		end

		if extension.is_constrained then
			lerp_pos = Vector3.clamp_3d(lerp_pos, extension.constrain_min, extension.constrain_max)
		end

		Unit_set_local_position(unit, 0, lerp_pos)

		local old_rot = Unit_local_rotation(unit, 0)
		local new_network_rot = Quaternion(Vector3.up(), network_yaw)

		Unit_set_local_rotation(unit, 0, Quaternion_lerp(old_rot, new_network_rot, rotation_lerp_amount))
		extension._velocity:store(network_velocity)

		local mover = Unit.mover(unit)

		assert(mover == nil, "remove this assert if you see this")

		local flat_velocity = Vector3(network_velocity.x, network_velocity.y, 0)
		local speed = Vector3.length(flat_velocity)

		Unit.animation_set_variable(unit, extension._move_speed_anim_var, math_max(speed, WALK_THRESHOLD))
	end

	return 
end
local ALLOWED_MOVER_MOVE_DISTANCE = 0.5
LocomotionTemplates.AiHuskLocomotionExtension.update_other_update_units_navmesh_check = function (data, t, dt)
	local nav_world = data.nav_world
	local physics_world, traverse_logic = nil

	for unit, extension in pairs(data.other_update_units) do
		if not extension.is_network_driven and not extension.hit_wall and Unit.mover(unit) == nil then
			local current_position = Unit.local_position(unit, 0)
			traverse_logic = traverse_logic or extension.traverse_logic(extension)
			physics_world = physics_world or World.physics_world(extension._world)
			local velocity = extension.current_velocity(extension)
			local result = LocomotionUtils.navmesh_movement_check(current_position, velocity, nav_world, physics_world, traverse_logic)

			if result == "navmesh_hit_wall" then
				extension.hit_wall = true
			elseif result == "navmesh_use_mover" then
				extension.set_mover_disable_reason(extension, "not_constrained_by_mover", false)

				local mover = Unit.mover(unit)

				if mover then
					local breed = extension._breed
					local mover_move_distance = breed.override_mover_move_distance or ALLOWED_MOVER_MOVE_DISTANCE

					Mover.set_position(mover, current_position)

					local success = LocomotionUtils.separate_mover_fallbacks(mover, mover_move_distance)

					if success then
						local mover_position = Mover.position(mover)

						Unit.set_local_position(unit, 0, mover_position)
					else
						extension.set_mover_disable_reason(extension, "not_constrained_by_mover", true)

						extension.hit_wall = true
					end
				end
			end
		end
	end

	return 
end
LocomotionTemplates.AiHuskLocomotionExtension.update_other_update_units = function (data, t, dt)
	local GameSession_game_object_field = GameSession.game_object_field
	local Vector3_length_squared = Vector3.length_squared
	local Vector3_length = Vector3.length
	local Unit_set_local_position = Unit.set_local_position
	local Unit_set_local_rotation = Unit.set_local_rotation
	local Unit_local_rotation = Unit.local_rotation
	local Quaternion_lerp = Quaternion.lerp
	local WALK_THRESHOLD = 0.97
	local game = data.game
	local unit_storage = Managers.state.unit_storage
	local nav_world = data.nav_world
	local traverse_logic = nil

	for unit, extension in pairs(data.other_update_units) do
		local current_position = Unit.local_position(unit, 0)
		traverse_logic = traverse_logic or extension.traverse_logic(extension)
		local wanted_pose = Unit.animation_wanted_root_pose(unit)
		local wanted_position = Matrix4x4.translation(wanted_pose)
		local wanted_rotation = nil

		if extension.has_network_driven_rotation then
			local go_id = unit_storage.go_id(unit_storage, unit)
			local yaw = GameSession_game_object_field(game, go_id, "yaw_rot")
			wanted_rotation = Quaternion(Vector3.up(), yaw)
		else
			local anim_rotation = Matrix4x4.rotation(wanted_pose)
			local current_rotation = Unit.local_rotation(unit, 0)
			local up_vector = Quaternion.up(current_rotation)
			local current_rotation_inv = Quaternion.inverse(current_rotation)
			local delta_rotation = Quaternion.multiply(current_rotation_inv, anim_rotation)
			local yaw_rotation_radians = Quaternion.yaw(delta_rotation)
			yaw_rotation_radians = yaw_rotation_radians * extension._animation_rotation_scale
			wanted_rotation = Quaternion.multiply(current_rotation, Quaternion(up_vector, yaw_rotation_radians))
		end

		local wanted_velocity = (wanted_position - current_position) / dt
		wanted_velocity = Vector3.multiply_elements(wanted_velocity, extension._animation_translation_scale:unbox())
		local final_position, final_velocity = nil
		local mover = Unit.mover(unit)

		if extension.is_affected_by_gravity and mover ~= nil then
			local previous_velocity = extension._velocity:unbox()
			wanted_velocity.z = previous_velocity.z - 9.82 * dt

			Mover.move(mover, wanted_velocity * dt, dt)

			final_position = Mover.position(mover)
			final_velocity = (final_position - current_position) / dt

			if Mover.collides_down(mover) and 0 < Mover.standing_frames(mover) then
				final_velocity.z = 0
			else
				final_velocity.z = wanted_velocity.z
			end
		else
			final_position = GwNavQueries.move_on_navmesh(nav_world, current_position, wanted_velocity, dt, traverse_logic)
			final_velocity = wanted_velocity
		end

		if extension.is_constrained then
			final_position = Vector3.clamp_3d(final_position, extension.constrain_min, extension.constrain_max)
		end

		Unit_set_local_position(unit, 0, final_position)
		Unit_set_local_rotation(unit, 0, wanted_rotation)
		extension._velocity:store(final_velocity)

		extension._pos_lerp_time = 0

		extension.last_lerp_position:store(final_position)
		extension.last_lerp_position_offset:store(Vector3(0, 0, 0))
		extension.accumulated_movement:store(Vector3(0, 0, 0))

		if mover ~= nil then
			Mover.set_position(mover, final_position)
		end

		local flat_velocity = Vector3(final_velocity.x, final_velocity.y, 0)
		local speed = Vector3_length(flat_velocity)

		Unit.animation_set_variable(unit, extension._move_speed_anim_var, math.max(speed, WALK_THRESHOLD))
	end

	return 
end

return 
