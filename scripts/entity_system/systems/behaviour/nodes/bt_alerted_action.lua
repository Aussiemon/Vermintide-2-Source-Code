require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTAlertedAction = class(BTAlertedAction, BTNode)
BTAlertedAction.init = function (self, ...)
	BTAlertedAction.super.init(self, ...)

	return 
end
BTAlertedAction.name = "BTAlertedAction"
BTAlertedAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.alerted_action = blackboard.alerted_action or {}
	blackboard.move_animation_name = nil
	blackboard.anim_cb_rotation_start = false
	blackboard.anim_cb_move = false
	blackboard.alerted_deadline_reached = false
	blackboard.alerted_deadline_reached_and_sighted_enemy = false

	self.should_hesitate(self, unit, blackboard, action)
	self.decide_deadline(self, unit, blackboard, t)

	local should_be_alerted = self.init_alerted(self, unit, blackboard, t)
	blackboard.no_alert = not should_be_alerted

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	blackboard.in_alerted_state = true
	blackboard.move_state = "idle"

	return 
end
BTAlertedAction.init_alerted = function (self, unit, blackboard, t)
	local network_manager = Managers.state.network
	local unit_id = network_manager.unit_game_object_id(network_manager, unit)

	if script_data.enable_alert_icon then
		local category_name = "detect"
		local head_node = Unit.node(unit, "c_head")
		local viewport_name = "player_1"
		local color_vector = Vector3(255, 0, 0)
		local offset_vector = Vector3(0, 0, 1)
		local text_size = 0.5
		local debug_start_string = "!"

		Managers.state.debug_text:output_unit_text(debug_start_string, text_size, unit, head_node, offset_vector, nil, category_name, color_vector, viewport_name)
		network_manager.network_transmit:send_rpc_clients("rpc_enemy_is_alerted", unit_id, true)
	end

	if ScriptUnit.has_extension(unit, "ai_inventory_system") then
		network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
	end

	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local current_pos = POSITION_LOOKUP[unit]
	local target_dist = Vector3.distance(target_pos, current_pos)

	if 6 < target_dist or blackboard.action.close_range_alert_idle then
		local alerted_anims = blackboard.action.alerted_anims

		if alerted_anims then
			local alerted_anim = alerted_anims[math.random(1, #alerted_anims)]

			network_manager.anim_event(network_manager, unit, alerted_anim)
		else
			network_manager.anim_event(network_manager, unit, "alerted")
		end
	end

	local world = blackboard.world
	local physics_world = World.physics_world(world)
	local has_line_of_sight = PerceptionUtils.raycast_spine_to_spine(unit, blackboard.target_unit, physics_world)

	if has_line_of_sight and not blackboard.action.no_hesitation and target_dist < 12 then
		blackboard.alerted_action.deadline = blackboard.alerted_action.deadline - Math.random(0, 0.6)

		return false
	end

	local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input.trigger_networked_dialogue_event(dialogue_input, "startled", event_data)

	return true
end
BTAlertedAction.decide_deadline = function (self, unit, blackboard, t)
	local target_unit = blackboard.target_unit
	local current_pos = POSITION_LOOKUP[unit]
	local target_pos = POSITION_LOOKUP[target_unit]
	local target_vector_flat = Vector3.normalize(Vector3.flat(target_pos - current_pos))
	local rotation = Unit.local_rotation(unit, 0)
	local forward_vector_flat = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local dot_product = Vector3.dot(forward_vector_flat, target_vector_flat)
	local min_deadline = (0.25 < dot_product and 0.5) or 1
	local max_deadline = math.max(min_deadline, dot_product*2 - 2)
	local time_alerted = Math.random(min_deadline, max_deadline)
	local breed = blackboard.breed
	local action = blackboard.action

	if action.override_time_alerted then
		time_alerted = action.override_time_alerted
	elseif action.close_range_alert_idle then
		blackboard.no_alert_override = true
	end

	blackboard.alerted_action.deadline = time_alerted + t

	return 
end
BTAlertedAction.should_hesitate = function (self, unit, blackboard, action)
	if action.no_hesitation then
		blackboard.no_hesitation = true
	elseif not blackboard.no_hestitation then
		local target = blackboard.target_unit
		local target_pos = POSITION_LOOKUP[target]
		local self_pos = POSITION_LOOKUP[unit]
		local nav_world = blackboard.nav_world
		local on_nav_mesh_target, target_z = GwNavQueries.triangle_from_position(nav_world, target_pos, 0.25, 1.5)
		local on_nav_mesh_self, self_z = GwNavQueries.triangle_from_position(nav_world, self_pos, 0.25, 0.25)

		if on_nav_mesh_target and on_nav_mesh_self then
			local from_pos = Vector3(self_pos.x, self_pos.y, self_z)
			local to_pos = Vector3(target_pos.x, target_pos.y, target_z)
			local success_self, ray_pos_self = GwNavQueries.raycast(nav_world, from_pos, to_pos)

			if not success_self then
				local success_target, ray_pos_target = GwNavQueries.raycast(nav_world, to_pos, from_pos)
				local diff = ray_pos_self - ray_pos_target
				local height_diff = diff.z
				blackboard.no_hesitation = 2 < height_diff and math.pi/3 < math.asin(height_diff/Vector3.length(diff))
			end
		else
			blackboard.no_hesitation = true
		end
	end

	return 
end
BTAlertedAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local network_manager = Managers.state.network

	if script_data.enable_alert_icon then
		local category_name = "detect"

		Managers.state.debug_text:clear_unit_text(unit, category_name)

		local unit_id = network_manager.unit_game_object_id(network_manager, unit)

		network_manager.network_transmit:send_rpc_clients("rpc_enemy_is_alerted", unit_id, false)
	end

	if blackboard.no_hesitation then
		AiUtils.activate_unit(blackboard)

		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system.do_slot_search(ai_slot_system, unit, true)

		if blackboard.move_animation_name then
			local locomotion_extension = blackboard.locomotion_extension

			locomotion_extension.use_lerp_rotation(locomotion_extension, true)
			LocomotionUtils.set_animation_driven_movement(unit, false)
			LocomotionUtils.set_animation_rotation_scale(unit, 1)

			if reason ~= "aborted" then
				blackboard.move_state = "moving"
				blackboard.anim_locked = 0
				blackboard.spawn_to_running = true

				network_manager.anim_event(network_manager, unit, "move_fwd")
			end
		end
	end

	blackboard.anim_cb_move = nil

	blackboard.navigation_extension:set_enabled(true)

	blackboard.action = nil
	blackboard.detection_radius = 99999
	blackboard.update_timer = 0
	blackboard.in_alerted_state = false
	blackboard.move_animation_name = nil
	blackboard.no_alert = nil
	blackboard.no_alert_override = nil

	if ScriptUnit.has_extension(unit, "ai_shield_system") then
		local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

		shield_extension.set_is_blocking(shield_extension, true)
	end

	if not blackboard.confirmed_player_sighting then
		Managers.state.network:anim_event(unit, "to_passive")
	end

	return 
end

local function contains(wanted_event, event)
	if type(wanted_event) == "table" then
		return table.contains(wanted_event, event)
	else
		return wanted_event == event
	end

	return 
end

BTAlertedAction.check_if_should_start_moving = function (self, unit, blackboard)
	local action = blackboard.action
	local target_unit = blackboard.target_unit
	local target_pos = POSITION_LOOKUP[target_unit]
	local deadline_reached = blackboard.alerted_deadline_reached_and_sighted_enemy
	local has_started_animation = blackboard.move_animation_name and true

	if deadline_reached and not has_started_animation then
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system.do_slot_search(ai_slot_system, unit, true)
		blackboard.navigation_extension:set_enabled(true)

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension.use_lerp_rotation(locomotion_extension, false)
		LocomotionUtils.set_animation_driven_movement(unit, true, false, false)

		local animation_name = AiAnimUtils.get_start_move_animation(unit, target_pos, action.start_anims_name)

		fassert(animation_name, "Move animation was nil!  Have you added start_anims_name entry to breeds?")
		Managers.state.network:anim_event(unit, animation_name)

		blackboard.move_animation_name = animation_name
	end

	if deadline_reached and blackboard.anim_cb_rotation_start then
		local move_animation_name = blackboard.move_animation_name
		local fwd_start_anim = action.start_anims_name.fwd
		local is_fwd_animation = contains(fwd_start_anim, move_animation_name)

		if is_fwd_animation then
			local locomotion_extension = blackboard.locomotion_extension

			locomotion_extension.use_lerp_rotation(locomotion_extension, true)
			LocomotionUtils.set_animation_driven_movement(unit, false)

			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

			locomotion_extension.set_wanted_rotation(locomotion_extension, rot)
		elseif move_animation_name then
			blackboard.anim_cb_rotation_start = false
			local rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, target_pos, move_animation_name, action.start_anims_data)

			LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)
		end
	end

	return 
end
BTAlertedAction.run = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local target_unit = blackboard.target_unit

	if blackboard.previous_attacker or (blackboard.no_alert and blackboard.alerted_action.deadline < t) then
		blackboard.is_alerted = true

		return "done"
	end

	local current_pos = POSITION_LOOKUP[unit]
	local target_pos = POSITION_LOOKUP[target_unit]
	local target_dist_sq = Vector3.distance_squared(target_pos, current_pos)
	local in_range = target_dist_sq < 2500

	if blackboard.alerted_action.deadline < t and not blackboard.alerted_deadline_reached_and_sighted_enemy then
		blackboard.alerted_deadline_reached = true

		if blackboard.breed.berzerker_alert then
			blackboard.alerted_deadline_reached_and_sighted_enemy = true
		elseif in_range then
			local world = blackboard.world
			local physics_world = World.physics_world(world)
			local has_line_of_sight = PerceptionUtils.raycast_spine_to_spine(unit, target_unit, physics_world)

			if has_line_of_sight then
				blackboard.alerted_deadline_reached_and_sighted_enemy = true
			else
				blackboard.alerted_action.deadline = t + 0.5
			end
		end
	end

	if target_dist_sq < 36 and not blackboard.no_alert_override then
		local world = blackboard.world
		local physics_world = World.physics_world(world)
		local has_line_of_sight = PerceptionUtils.raycast_spine_to_spine(unit, target_unit, physics_world)

		if has_line_of_sight then
			local ai_unit_rotation = Unit.world_rotation(unit, 0)
			local ai_unit_direction = Vector3.normalize(Quaternion.forward(ai_unit_rotation))
			local ai_unit_to_target_dir = Vector3.normalize(target_pos - current_pos)
			local dot = Vector3.dot(ai_unit_to_target_dir, ai_unit_direction)

			if -0.5 < dot or target_dist_sq < 36 then
				blackboard.no_hesitation = true

				return "done"
			end
		end
	end

	if action.no_hesitation then
		self.check_if_should_start_moving(self, unit, blackboard)

		if blackboard.anim_cb_move and blackboard.move_animation_name then
			blackboard.move_state = "moving"

			return "done"
		end
	end

	if not blackboard.no_alert and blackboard.alerted_deadline_reached_and_sighted_enemy and (blackboard.anim_cb_move or not blackboard.move_animation_name) then
		blackboard.is_alerted = true

		return "done"
	else
		return "running"
	end

	return 
end

return 
