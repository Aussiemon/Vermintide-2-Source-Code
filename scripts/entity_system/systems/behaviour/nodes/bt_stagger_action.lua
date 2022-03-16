require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local stagger_types = require("scripts/utils/stagger_types")
BTStaggerAction = class(BTStaggerAction, BTNode)

BTStaggerAction.init = function (self, ...)
	BTStaggerAction.super.init(self, ...)
end

BTStaggerAction.name = "BTStaggerAction"
local DEFAULT_IN_AIR_MOVER_CHECK_RADIUS = 0.35

BTStaggerAction.enter = function (self, unit, blackboard, t)
	local locomotion_extension = blackboard.locomotion_extension
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)

	local breed = blackboard.breed
	local was_already_in_stagger = blackboard.staggering_id and blackboard.stagger ~= blackboard.staggering_id

	if not was_already_in_stagger then
		local override_mover_move_distance = breed.override_mover_move_distance

		locomotion_extension:set_movement_type("constrained_by_mover", override_mover_move_distance, true)
	end

	blackboard.stagger_anim_done = false
	blackboard.stagger_hit_wall = nil
	blackboard.stagger_ignore_anim_cb = nil
	blackboard.staggering_id = blackboard.stagger
	blackboard.attack_aborted = true
	blackboard.move_state = "stagger"
	blackboard.active_node = BTStaggerAction
	local action_data = self._tree_node.action_data
	blackboard.action = action_data
	local ai_base_extension = ScriptUnit.extension(unit, "ai_system")

	ai_base_extension:increase_stagger_count()

	local stagger_anims, idle_event, post_stagger_event, override_rotation = nil
	local custom_enter_function = action_data.custom_enter_function

	if custom_enter_function then
		stagger_anims, idle_event, post_stagger_event, override_rotation = custom_enter_function(unit, blackboard, t, action_data)

		if post_stagger_event then
			blackboard.post_stagger_event = post_stagger_event
		end
	else
		idle_event = "idle"
		stagger_anims = action_data.stagger_anims[blackboard.stagger_type]
	end

	if action_data.custom_weakspot_function and blackboard.stagger_type == stagger_types.weakspot then
		action_data.custom_weakspot_function(unit, blackboard, t, action_data)
	end

	local impact_dir = blackboard.stagger_direction:unbox()
	local push_anim, impact_rot = self:_select_animation(unit, blackboard, impact_dir, stagger_anims)

	Unit.set_local_rotation(unit, 0, override_rotation or impact_rot)

	local network_manager = Managers.state.network

	if action_data.scale_animation_speeds then
		local anim_scale = action_data.stagger_animation_scale or blackboard.stagger_animation_scale or 1

		network_manager:anim_event_with_variable_float(unit, push_anim, "stagger_scale", anim_scale)
	else
		network_manager:anim_event(unit, push_anim)
	end

	network_manager:anim_event(unit, idle_event)

	local scale = blackboard.stagger_length

	LocomotionUtils.set_animation_translation_scale(unit, Vector3(scale, scale, scale))

	if was_already_in_stagger then
		local unit_id = network_manager:unit_game_object_id(unit)
		local unit_position = POSITION_LOOKUP[unit]
		local yaw = Quaternion.yaw(impact_rot)

		network_manager.network_transmit:send_rpc_clients("rpc_teleport_unit_with_yaw_rotation", unit_id, unit_position, yaw)
	else
		LocomotionUtils.set_animation_driven_movement(unit, true, true, false)
	end

	if blackboard.stagger_type == stagger_types.heavy or blackboard.stagger_type == stagger_types.explosion then
		local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
		hit_reaction_extension.force_ragdoll_on_death = true
	end

	locomotion_extension:set_rotation_speed(100)
	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:use_lerp_rotation(false)

	blackboard.spawn_to_running = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)
	ai_slot_system:ai_unit_staggered(unit)
end

BTStaggerAction._select_animation = function (self, unit, blackboard, impact_vec, stagger_anims)
	local impact_dir = Vector3.normalize(impact_vec)
	local my_fwd = Quaternion.forward(Unit.local_rotation(unit, 0))
	local dot = Vector3.dot(my_fwd, impact_dir)
	dot = math.clamp(dot, -1, 1)
	local angle = math.acos(dot)
	local action = blackboard.action
	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension:current_velocity()
	local impact_rot, anim_table = nil
	local moving_stagger_distance = action.moving_stagger_minimum_destination_distance
	local in_moving_stagger_distane = moving_stagger_distance and moving_stagger_distance < blackboard.destination_dist
	local moving_stagger_threshold = action.moving_stagger_threshold
	local velocy_my_fwd_dot = Vector3.dot(velocity, my_fwd)
	local in_moving_stagger_velocity = moving_stagger_threshold and moving_stagger_threshold < velocy_my_fwd_dot
	local moving_stagger = false

	if not blackboard.always_stagger_suffered then
		moving_stagger = in_moving_stagger_distane and in_moving_stagger_velocity
	end

	blackboard.always_stagger_suffered = nil

	if impact_vec.z == -1 and stagger_anims.dwn then
		impact_dir.z = 0
		impact_rot = Quaternion.look(-impact_dir)
		anim_table = (moving_stagger and stagger_anims.moving_dwn) or stagger_anims.dwn
	else
		impact_dir.z = 0

		if angle > math.pi * 0.75 then
			impact_rot = Quaternion.look(-impact_dir)
			anim_table = (moving_stagger and stagger_anims.moving_bwd) or stagger_anims.bwd
		elseif angle < math.pi * 0.25 then
			impact_rot = Quaternion.look(impact_dir)
			anim_table = (moving_stagger and stagger_anims.moving_fwd) or stagger_anims.fwd
		elseif Vector3.cross(my_fwd, impact_dir).z > 0 then
			local dir = Vector3.cross(Vector3(0, 0, -1), impact_dir)
			impact_rot = Quaternion.look(dir)
			anim_table = (moving_stagger and stagger_anims.moving_left) or stagger_anims.left
		else
			local dir = Vector3.cross(Vector3(0, 0, 1), impact_dir)
			impact_rot = Quaternion.look(dir)
			anim_table = (moving_stagger and stagger_anims.moving_right) or stagger_anims.right
		end
	end

	local num_anims = #anim_table
	local index = Math.random(1, num_anims)
	local anim = anim_table[index]

	if anim == blackboard.last_stagger_anim then
		anim = anim_table[index % num_anims + 1]
	end

	blackboard.last_stagger_anim = anim
	local yaw = Quaternion.yaw(impact_rot)
	local final_rotation = Quaternion(Vector3.up(), yaw)

	return anim, final_rotation
end

BTStaggerAction.clean_blackboard = function (self, blackboard)
	blackboard.action = nil
	blackboard.heavy_stagger_immune_time = nil
	blackboard.pushing_unit = nil
	blackboard.stagger = nil
	blackboard.stagger_anim_done = nil
	blackboard.stagger_direction = nil
	blackboard.stagger_hit_wall = nil
	blackboard.stagger_ignore_anim_cb = nil
	blackboard.stagger_immune_time = nil
	blackboard.stagger_length = nil
	blackboard.stagger_time = nil
	blackboard.stagger_type = nil
	blackboard.stagger_priority = nil
	blackboard.staggering_id = nil
	blackboard.active_node = nil
end

BTStaggerAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if not destroy then
		LocomotionUtils.set_animation_driven_movement(unit, false, false)
	end

	if ScriptUnit.has_extension(unit, "ai_shield_system") and not blackboard.action.ignore_block_on_leave then
		local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

		shield_extension:set_is_blocking(true)
	end

	self:clean_blackboard(blackboard)

	if not destroy then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_rotation_speed(10)
		locomotion_extension:set_wanted_rotation(nil)
		locomotion_extension:set_movement_type("snap_to_navmesh")
		locomotion_extension:use_lerp_rotation(true)
		locomotion_extension:set_wanted_velocity(Vector3.zero())
		LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))

		local network_manager = Managers.state.network
		local post_stagger_anim_event = nil

		if blackboard.post_stagger_event then
			post_stagger_anim_event = blackboard.post_stagger_event
			blackboard.post_stagger_event = nil
		else
			post_stagger_anim_event = "stagger_finished"
		end

		network_manager:anim_event(unit, post_stagger_anim_event)
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	local run_on_stagger_action_done = blackboard.breed.run_on_stagger_action_done

	if run_on_stagger_action_done then
		run_on_stagger_action_done(unit, blackboard, t)
	end

	local hit_reaction_extension = ScriptUnit.has_extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)
end

BTStaggerAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.stagger ~= blackboard.staggering_id then
		self:enter(unit, blackboard, t)
	end

	local locomotion_extension = blackboard.locomotion_extension
	local stagger_anim_done = blackboard.stagger_anim_done

	if locomotion_extension.movement_type ~= "constrained_by_mover" and not blackboard.stagger_hit_wall then
		local position = POSITION_LOOKUP[unit]
		local velocity = locomotion_extension:current_velocity()
		local nav_world = blackboard.nav_world
		local world = blackboard.world
		local physics_world = World.physics_world(world)
		local navigation_extension = blackboard.navigation_extension
		local traverse_logic = navigation_extension:traverse_logic()
		local result = LocomotionUtils.navmesh_movement_check(position, velocity, nav_world, physics_world, traverse_logic)

		if result == "navmesh_hit_wall" then
			blackboard.stagger_hit_wall = true
		elseif result == "navmesh_use_mover" then
			local breed = blackboard.breed
			local override_mover_move_distance = breed.override_mover_move_distance
			local ignore_forced_mover_kill = true
			local successful = locomotion_extension:set_movement_type("constrained_by_mover", override_mover_move_distance, ignore_forced_mover_kill)

			if not successful then
				locomotion_extension:set_movement_type("snap_to_navmesh")

				blackboard.stagger_hit_wall = true
			end
		end
	end

	local stagger_time_finished = blackboard.stagger_time < t
	local stagger_ignore_anim_cb = blackboard.stagger_ignore_anim_cb

	if blackboard.stagger_immune_time and blackboard.stagger_immune_time < t then
		blackboard.stagger_immune_time = nil
	end

	if blackboard.heavy_stagger_immune_time and blackboard.heavy_stagger_immune_time < t then
		blackboard.heavy_stagger_immune_time = nil
	end

	if stagger_time_finished and (stagger_ignore_anim_cb or stagger_anim_done) then
		return "done"
	else
		return "running"
	end
end

BTStaggerAction.anim_cb_push_cancel = function (self, unit, blackboard)
	if blackboard.stagger_type and blackboard.stagger_type == 9 then
		Managers.state.network:anim_event(unit, "stagger_finished")

		blackboard.stagger_anim_done = true
	end
end

return
