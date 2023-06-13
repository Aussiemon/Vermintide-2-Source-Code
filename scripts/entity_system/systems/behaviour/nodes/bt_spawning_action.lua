require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSpawningAction = class(BTSpawningAction, BTNode)

BTSpawningAction.init = function (self, ...)
	BTSpawningAction.super.init(self, ...)
end

BTSpawningAction.name = "BTSpawningAction"
local unit_alive = Unit.alive

BTSpawningAction.enter = function (self, unit, blackboard, t)
	Unit.set_animation_root_mode(unit, "ignore")
	self:_apply_anim_varations(unit)

	local breed = blackboard.breed
	blackboard.uses_spawn_animation = blackboard.spawn_type == "horde" or breed.uses_spawn_animation

	if blackboard.uses_spawn_animation then
		local ai_extension = ScriptUnit.extension(unit, "ai_system")
		local animation_translation_scale = 1 / ai_extension:size_variation()

		LocomotionUtils.set_animation_translation_scale(unit, Vector3(animation_translation_scale, animation_translation_scale, animation_translation_scale))

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:use_lerp_rotation(false)
		locomotion_extension:set_movement_type("script_driven")
		LocomotionUtils.set_animation_driven_movement(unit, true)
	else
		blackboard.spawning_finished = true
	end

	local network_manager = Managers.state.network
	local wield_inventory_on_spawn = breed.wield_inventory_on_spawn
	local is_horde = blackboard.spawn_type == "horde" or blackboard.spawn_type == "horde_hidden"

	if (is_horde or wield_inventory_on_spawn) and ScriptUnit.has_extension(unit, "ai_inventory_system") then
		local unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
	end

	local spawn_animation = blackboard.spawn_animation or breed.default_spawn_animation or "idle"

	if type(spawn_animation) == "table" then
		local random_index = Math.random(1, #spawn_animation)
		spawn_animation = spawn_animation[random_index]
	end

	network_manager:anim_event(unit, spawn_animation)

	blackboard.spawn_last_pos = Vector3Box(POSITION_LOOKUP[unit])
	blackboard.spawn_immovable_time = 0
end

BTSpawningAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.spawn = nil
	blackboard.spawning_finished = nil
	blackboard.spawn_last_pos = nil
	blackboard.fallback_landing_t = nil
	local ai_navigation = blackboard.navigation_extension

	ai_navigation:init_position()

	if (blackboard.uses_spawn_animation or blackboard.spawn_type == "horde_hidden") and not destroy and not blackboard.about_to_be_destroyed then
		local ai_extension = ScriptUnit.extension(unit, "ai_system")

		ai_extension:force_enemy_detection(t)

		if unit_alive(blackboard.target_unit) then
			local ai_slot_system = Managers.state.entity:system("ai_slot_system")

			ai_slot_system:do_slot_search(unit, true)
		else
			blackboard.target_unit = nil
		end
	end

	if not destroy then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_movement_type("snap_to_navmesh")

		if blackboard.uses_spawn_animation then
			locomotion_extension:use_lerp_rotation(true)
			LocomotionUtils.set_animation_driven_movement(unit, false)

			blackboard.spawn_landing_state = nil
			blackboard.jump_climb_finished = nil
		end

		if blackboard.constrained_on_client then
			blackboard.constrained_on_client = nil

			LocomotionUtils.constrain_on_clients(unit, false)
		end

		LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))
	end
end

BTSpawningAction.run = function (self, unit, blackboard, t, dt)
	local breed = blackboard.breed

	if breed.interrupt_spawning_on_stagger and blackboard.stagger then
		blackboard.spawning_finished = true
	end

	if breed.interrupt_spawning_on_health_percentage then
		local percent = ScriptUnit.extension(unit, "health_system"):current_health_percent()

		if percent < breed.interrupt_spawning_on_health_percentage then
			blackboard.spawning_finished = true
		end
	end

	local locomotion_extension = blackboard.locomotion_extension
	local spawning_finished = blackboard.spawning_finished
	local nav_world = blackboard.nav_world
	local current_pos = POSITION_LOOKUP[unit]

	if spawning_finished then
		if blackboard.instant_spawn then
			return "done"
		elseif not blackboard.spawn_landing_state then
			local is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, current_pos, 0.5, 0.5)

			if is_position_on_navmesh then
				local spawn_position = Vector3(current_pos.x, current_pos.y, altitude)
				local network_manager = Managers.state.network
				local unit_id = network_manager:unit_game_object_id(unit)

				network_manager.network_transmit:send_rpc_clients("rpc_teleport_unit_to", unit_id, spawn_position, Unit.local_rotation(unit, 0))
				locomotion_extension:teleport_to(spawn_position)

				return "done"
			else
				locomotion_extension:set_affected_by_gravity(true)
				locomotion_extension:set_movement_type("script_driven")

				blackboard.spawn_landing_state = "falling"
				is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, current_pos, 0, 20)

				if is_position_on_navmesh then
					local min_pos = Vector3(current_pos.x, current_pos.y, altitude)

					LocomotionUtils.constrain_on_clients(unit, true, min_pos, current_pos)

					blackboard.constrained_on_client = true
					blackboard.landing_destination = Vector3Box(current_pos.x, current_pos.y, altitude)

					if not blackboard.spawn_animation then
						Managers.state.network:anim_event(unit, "idle")
					end
				else
					local damage_type = "forced"
					local damage_direction = Vector3(0, 0, -1)

					AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)

					return
				end
			end
		end
	end

	if blackboard.spawn_landing_state == "falling" then
		local fall_speed = locomotion_extension:current_velocity().z
		local landing_destination = blackboard.landing_destination:unbox()
		local next_height = current_pos.z + fall_speed * dt * 2

		if next_height < landing_destination.z then
			local network_manager = Managers.state.network
			local unit_id = network_manager:unit_game_object_id(unit)

			network_manager.network_transmit:send_rpc_clients("rpc_teleport_unit_to", unit_id, landing_destination, Unit.local_rotation(unit, 0))
			locomotion_extension:teleport_to(landing_destination)
			locomotion_extension:set_movement_type("snap_to_navmesh")

			if blackboard.spawn_animation then
				LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
				Managers.state.network:anim_event(unit, "jump_down_land")

				blackboard.spawn_landing_state = "landing"
				blackboard.fallback_landing_t = t + 5
			else
				return "done"
			end
		end
	elseif blackboard.spawn_landing_state == "landing" and (blackboard.jump_climb_finished or blackboard.fallback_landing_t < t) then
		return "done"
	end

	return "running"
end

local variation_type_to_rpc = {
	int = "rpc_anim_set_variable_int",
	float = "rpc_anim_set_variable_float"
}

BTSpawningAction._apply_anim_varations = function (self, unit)
	local action = self._tree_node.action_data

	if action then
		local anim_variations = action.incrementing_anim_variations

		if anim_variations then
			local unit_id = Managers.state.unit_storage:go_id(unit)
			local network_transmit = Managers.state.network.network_transmit

			for i = 1, #anim_variations do
				local variation_data = anim_variations[i]

				if Unit.animation_has_variable(unit, variation_data.name) then
					local min = variation_data.min
					local max = variation_data.max
					local val = variation_data.value or math.random(min, max)
					variation_data.value = math.wrap_index_between(val + 1, min, max)
					local var_id = Unit.animation_find_variable(unit, variation_data.name)

					Unit.animation_set_variable(unit, var_id, val)

					local rpc = variation_type_to_rpc[variation_data.value_type]
					local network_var_id = NetworkLookup.anims[variation_data.name]

					network_transmit:send_rpc_server(rpc, unit_id, network_var_id, val)
				end
			end
		end
	end
end
