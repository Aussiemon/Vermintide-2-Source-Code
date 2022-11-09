require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local stagger_types = require("scripts/utils/stagger_types")
BTChaosSorcererChargeAction = class(BTChaosSorcererChargeAction, BTNode)

BTChaosSorcererChargeAction.init = function (self, ...)
	BTChaosSorcererChargeAction.super.init(self, ...)
end

BTChaosSorcererChargeAction.name = "BTChaosSorcererChargeAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTChaosSorcererChargeAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTChaosSorcererChargeAction
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.locked_attack_rotation = false
	blackboard.ray_can_go_update_time = t
	blackboard.attack_token = true
	blackboard.test_start_time = t + 1
	blackboard.charge_target_position = Vector3Box(0, 0, 0)
	blackboard.charge_target_unit = blackboard.target_unit
	local start_animation = randomize(action.start_animation)

	Managers.state.network:anim_event(unit, start_animation)

	blackboard.spawn_to_running = nil
	blackboard.charge_state = "starting"
	local navigation_extension = blackboard.navigation_extension
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_velocity(Vector3.zero())
	navigation_extension:set_enabled(false)
	navigation_extension:reset_destination()

	locomotion_extension.death_velocity_boxed = locomotion_extension.death_velocity_boxed or Vector3Box()

	locomotion_extension:use_lerp_rotation(true)

	blackboard.stored_rotation = QuaternionBox(Quaternion.identity())
	blackboard.hit_units = {}
	blackboard.pushed_units = {}
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)

	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = true

	AiUtils.add_attack_intensity(blackboard.charge_target_unit, action, blackboard)

	blackboard.lean_target_position_boxed = Vector3Box()
	local old_cost_table = blackboard.navigation_extension:get_navtag_layer_cost_table()
	blackboard.old_navtag_layer_cost_table = old_cost_table
	local charge_navtag_layer_cost_table = blackboard.charge_navtag_layer_cost_table

	if charge_navtag_layer_cost_table then
		local traverse_logic = blackboard.navigation_extension:traverse_logic()

		GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, charge_navtag_layer_cost_table)
	end
end

BTChaosSorcererChargeAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if blackboard.move_state ~= "idle" and AiUtils.unit_alive(unit) then
		if not blackboard.blocked then
			local network_manager = Managers.state.network

			network_manager:anim_event(unit, "idle")
		end

		blackboard.move_state = "idle"
	end

	blackboard.attack_token = false

	if AiUtils.unit_alive(unit) then
		local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_enabled(true)
		navigation_extension:set_max_speed(default_move_speed)
		blackboard.locomotion_extension:set_rotation_speed(nil)

		local traverse_logic = blackboard.navigation_extension:traverse_logic()

		GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, blackboard.old_navtag_layer_cost_table)

		blackboard.old_navtag_layer_cost_table = nil
		blackboard.locomotion_extension.death_velocity_boxed = nil
		local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
		hit_reaction_extension.force_ragdoll_on_death = nil

		blackboard.locomotion_extension:use_lerp_rotation(true)
		LocomotionUtils.set_animation_driven_movement(unit, false)
	end

	local target_unit_status_extension = ScriptUnit.has_extension(blackboard.charge_target_unit, "status_system")

	if target_unit_status_extension then
		local num_charges_targeting_player = target_unit_status_extension.num_charges_targeting_player or 0
		num_charges_targeting_player = num_charges_targeting_player - 1
		target_unit_status_extension.num_charges_targeting_player = num_charges_targeting_player

		StatusUtils.set_charged_network(blackboard.charge_target_unit, false)
	end

	if (blackboard.stagger and blackboard.charge_state == "charging") or (blackboard.charge_state == "lunge" and not blackboard.anim_cb_disable_charge_collision) then
		blackboard.charge_stagger = true
	end

	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.anim_cb_disable_charge_collision = nil
	blackboard.attack_aborted = nil
	blackboard.charge_target_unit = nil
	blackboard.charge_started_at_t = nil
	blackboard.charge_state = nil
	blackboard.current_charge_speed = nil
	blackboard.hit_target = nil
	blackboard.hit_units = nil
	blackboard.lean_target_position_boxed = nil
	blackboard.pushed_units = nil
	blackboard.stop_lunge_rotation = nil
	blackboard.stored_rotation = nil
	blackboard.target_lunge_position = nil
	blackboard.target_unit_status_extension = nil
	blackboard.triggered_dodge_sound = nil
	blackboard.charge_target_position = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)
end

BTChaosSorcererChargeAction.run = function (self, unit, blackboard, t, dt)
	local target_unit = blackboard.charge_target_unit

	if not Unit.alive(target_unit) then
		return "done"
	end

	if blackboard.attack_aborted then
		return "done"
	end

	local charge_state = blackboard.charge_state

	if charge_state == "starting" then
		if blackboard.test_start_time < t then
			self:anim_cb_start_finished(unit, blackboard)

			blackboard.test_start_time = nil
		end
	elseif charge_state == "impact" then
		blackboard.test_start_time = blackboard.test_start_time or t + 1

		if blackboard.test_start_time < t then
			self:anim_cb_charge_impact_finished(unit, blackboard)

			blackboard.test_start_time = t + 1
		end
	end

	if blackboard.ray_can_go_update_time < t and Unit.alive(target_unit) then
		local nav_world = blackboard.nav_world
		local target_position = POSITION_LOOKUP[target_unit]
		blackboard.ray_can_go_to_target = LocomotionUtils.ray_can_go_on_mesh(nav_world, POSITION_LOOKUP[unit], target_position, nil, 1, 1)
		blackboard.ray_can_go_update_time = t + 0.25
	end

	local should_evaluate = nil

	if charge_state == "starting" then
		self:_run_starting(unit, blackboard)
	elseif charge_state == "charging" then
		local done = self:_run_charging(unit, blackboard, t, dt)

		if done then
			return "done"
		end
	elseif charge_state == "finished" then
		return "done"
	elseif charge_state == "cancel" then
		self:_run_cancel(unit, blackboard, t, dt)
	end

	return "running", should_evaluate
end

BTChaosSorcererChargeAction._start_charging = function (self, unit, blackboard)
	local action = blackboard.action
	local t = Managers.time:time("game")
	blackboard.charge_state = "charging"

	blackboard.locomotion_extension:set_rotation_speed(action.charge_rotation_speed)

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event("Play_sorcerer_boss_fly_charge", unit)

	blackboard.charge_started_at_t = t
end

BTChaosSorcererChargeAction._start_lunge = function (self, unit, blackboard, distance_to_target, t)
	local action = blackboard.action
	blackboard.charge_state = "lunge"
	blackboard.time_to_impact = t + 0.25
	local distance_thresholds = action.enter_lunge_thresholds
	local distance_identifier = self:_pick_distance_identifier(distance_thresholds, distance_to_target)
	slot8 = action.lunge_animations and action.lunge_animations[distance_identifier]
	local locomotion_extension = blackboard.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local lunge_velocity_scaling = action.lunge_velocity_scaling
	local lunge_velocity_scale = lunge_velocity_scaling[distance_identifier]
	local lunge_threshold = distance_thresholds[distance_identifier]
	local lunge_distance_scale = distance_to_target / lunge_threshold

	locomotion_extension:set_wanted_velocity(current_velocity * lunge_velocity_scale * lunge_distance_scale)
	locomotion_extension:set_rotation_speed(action.lunge_rotation_speed)

	blackboard.current_lunge_velocity_scale = lunge_velocity_scale
end

BTChaosSorcererChargeAction._start_impact = function (self, unit, blackboard, hit_target, hit_wall, hit_target_blocked, target_avoided_attack)
	blackboard.charge_state = "impact"
	blackboard.hit_target = hit_target
end

BTChaosSorcererChargeAction._start_align_to_target = function (self, unit, blackboard)
	local action = blackboard.action

	if not action.align_to_target_animation then
		blackboard.charge_state = "finished"

		return
	end

	local target_unit = blackboard.charge_target_unit
	local target_unit_pos = Unit.world_position(target_unit, 0)
	local self_pos = Unit.world_position(unit, 0)
	local target_unit_to_self_dir = Vector3.normalize(self_pos - target_unit_pos)
	local self_forward = Quaternion.forward(Unit.local_rotation(unit, 0))
	local dot = Vector3.dot(self_forward, target_unit_to_self_dir)
	local needs_to_turn = dot >= 0.4 and dot <= 1

	if not needs_to_turn then
		blackboard.charge_state = "finished"

		return
	end

	local t = Managers.time:time("game")
	blackboard.charge_state = "align_to_target"
	local align_to_target_animation = action.align_to_target_animation
	local start_align_t = t
	local end_align_t = t + action.end_align_t
	blackboard.start_align_t = start_align_t
	blackboard.end_align_t = end_align_t
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:use_lerp_rotation(true)
end

BTChaosSorcererChargeAction._cancel_charge = function (self, unit, blackboard)
	blackboard.navigation_extension:set_enabled(false)

	local cancel_animation = blackboard.action.cancel_animation
	blackboard.charge_state = "cancel"
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_rotation_speed(nil)
end

BTChaosSorcererChargeAction._check_lunge = function (self, unit, blackboard, t)
	local action = blackboard.action

	self:_check_overlap(unit, blackboard, action)

	if blackboard.time_to_impact < t then
		self:_start_impact(unit, blackboard, true, false, false)
	end
end

local broadphase_query_result = {}

BTChaosSorcererChargeAction._check_overlap = function (self, unit, blackboard, action)
	local t = Managers.time:time("game")
	local radius = action.radius
	local hit_radius = action.hit_radius
	local hit_units = blackboard.hit_units
	local pushed_units = blackboard.pushed_units
	local self_pos = Unit.local_position(unit, 0) - Vector3.down()
	local head_pos = Unit.world_position(unit, Unit.node(unit, "j_head"))
	local forward_dir = Quaternion.forward(Unit.local_rotation(unit, 0))
	local succesfully_hit_target, blocked = nil
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i = 1, #PLAYER_AND_BOT_UNITS, 1 do
		local target_unit = PLAYER_AND_BOT_UNITS[i]
		local pos = POSITION_LOOKUP[target_unit]
		local to_target_dir = Vector3.normalize(pos - self_pos)
		local to_target = pos - self_pos
		local dist = Vector3.length(to_target)
		local target_status_ext = ScriptUnit.extension(target_unit, "status_system")

		if target_status_ext and target_status_ext:get_is_dodging() then
			hit_radius = action.target_dodged_radius
		end

		local has_hit_unit = hit_units[target_unit]
		local has_pushed_unit = pushed_units[target_unit]

		if not has_hit_unit and dist < hit_radius and target_status_ext and not target_status_ext:is_invisible() then
			succesfully_hit_target, blocked = self:_hit_player(unit, blackboard, target_unit, action, to_target_dir)
			hit_units[target_unit] = true
		elseif not has_hit_unit and not has_pushed_unit and dist < radius and target_status_ext and not target_status_ext:is_invisible() then
			self:_push_player(unit, target_unit, blackboard, action)

			pushed_units[target_unit] = true
		end
	end

	local broadphase = blackboard.group_blackboard.broadphase
	local hit_ai_radius = action.hit_ai_radius
	local num_results = Broadphase.query(broadphase, self_pos, hit_ai_radius, broadphase_query_result)

	for i = 1, num_results, 1 do
		local hit_unit = broadphase_query_result[i]
		local pos = POSITION_LOOKUP[hit_unit]
		local to_target_dir = Vector3.normalize(pos - self_pos)
		local dot = Vector3.dot(to_target_dir, forward_dir)

		if dot > 0 and hit_unit ~= unit and not hit_units[hit_unit] then
			self:_hit_ai(unit, hit_unit, action, blackboard, t)
		end

		hit_units[hit_unit] = true
		broadphase_query_result[i] = nil
	end

	return succesfully_hit_target, blocked
end

BTChaosSorcererChargeAction._charged_at_player = function (self, unit, hit_unit, blackboard, action)
	if action.catapult_player then
		local to_hit_unit = POSITION_LOOKUP[hit_unit] - POSITION_LOOKUP[unit]
		local current_velocity = blackboard.locomotion_extension:current_velocity()
		local magnitude = Vector3.length(current_velocity)
		local velocity = magnitude * Vector3.normalize(to_hit_unit)

		Vector3.set_z(velocity, action.catapult_force_z or 3)
		StatusUtils.set_catapulted_network(hit_unit, true, velocity)
	else
		StatusUtils.set_charged_network(hit_unit, true)
	end
end

BTChaosSorcererChargeAction._push_player = function (self, unit, hit_unit, blackboard, action, blocked)
	local to_hit_unit = POSITION_LOOKUP[hit_unit] - POSITION_LOOKUP[unit]
	local push_speed = action.dodge_past_push_speed
	local velocity = push_speed * Vector3.normalize(to_hit_unit)
	local hit_attacking_target = hit_unit == blackboard.charge_target_unit

	if not hit_attacking_target and action.catapult_on_push_other_targets then
		local catapult_on_push_z = action.catapult_on_push_z

		Vector3.set_z(velocity, catapult_on_push_z or 3)
		StatusUtils.set_catapulted_network(hit_unit, true, velocity)
	else
		if blocked and action.blocked_velocity_scale then
			velocity = velocity * action.blocked_velocity_scale
		end

		local locomotion_extension = ScriptUnit.extension(hit_unit, "locomotion_system")

		locomotion_extension:add_external_velocity(velocity)
	end
end

BTChaosSorcererChargeAction._hit_player = function (self, unit, blackboard, hit_unit, action, attack_direction)
	local hit_attacking_target = hit_unit == blackboard.charge_target_unit
	local hit_unit_status_extension = ScriptUnit.has_extension(hit_unit, "status_system")

	AiUtils.damage_target(hit_unit, unit, action, action.damage)

	if action.player_push_speed and not hit_unit_status_extension.knocked_down then
		self:_charged_at_player(unit, hit_unit, blackboard, action)
	end

	if hit_attacking_target then
		return true
	end

	return false
end

BTChaosSorcererChargeAction._hit_ai = function (self, unit, hit_unit, action, blackboard, t)
	local push_data = action.push_ai
	local hit_unit_blackboard = BLACKBOARDS[hit_unit]

	if push_data then
		local stagger_type, stagger_duration = DamageUtils.calculate_stagger(push_data.stagger_impact, push_data.stagger_duration, hit_unit, unit)

		if stagger_types.none < stagger_type then
			local self_pos = POSITION_LOOKUP[unit]
			local hit_unit_pos = POSITION_LOOKUP[hit_unit]
			local direction_to_ai = Vector3.normalize(hit_unit_pos - self_pos)
			local right = Quaternion.right(Unit.local_rotation(unit, 0))
			local dot = Vector3.dot(right, direction_to_ai)
			local push_direction = -right

			if dot > 0 then
				push_direction = -push_direction
			end

			AiUtils.stagger(hit_unit, hit_unit_blackboard, unit, push_direction, push_data.stagger_distance, stagger_type, stagger_duration, nil, t, nil, nil, nil, true)
		end
	end

	AiUtils.damage_target(hit_unit, unit, action, action.damage)
end

BTChaosSorcererChargeAction._run_starting = function (self, unit, blackboard)
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.charge_target_unit)

	blackboard.locomotion_extension:set_wanted_rotation(rotation)
	blackboard.charge_target_position:store(POSITION_LOOKUP[blackboard.charge_target_unit])
end

BTChaosSorcererChargeAction._run_charging = function (self, unit, blackboard, t, dt)
	local action = blackboard.action
	local target_position = blackboard.charge_target_position:unbox()
	local locomotion_extension = blackboard.locomotion_extension
	local navigation_extension = blackboard.navigation_extension
	local self_position = POSITION_LOOKUP[unit]
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.charge_target_unit)

	locomotion_extension:set_wanted_rotation(rotation)
	blackboard.stored_rotation:store(rotation)

	local charge_started_at_t = blackboard.charge_started_at_t
	local time_spent_charging = t - charge_started_at_t
	local charge_speed_min = action.charge_speed_min
	local charge_speed_max = action.charge_speed_max
	local charge_max_speed_at = action.charge_max_speed_at
	local charge_scale = time_spent_charging / charge_max_speed_at
	local wanted_charge_speed = math.min(charge_speed_min + charge_scale * (charge_speed_max - charge_speed_min), charge_speed_max)
	local direction_to_target = Vector3.normalize(Vector3.flat(target_position - self_position))
	local wanted_slowdown_percentage = self:_get_turn_slowdown_percentage(unit, blackboard, dt, direction_to_target)

	if wanted_slowdown_percentage then
		wanted_charge_speed = charge_speed_max * wanted_slowdown_percentage
	end

	navigation_extension:set_max_speed(wanted_charge_speed)

	local wanted_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
	local new_velocity = wanted_direction * wanted_charge_speed

	locomotion_extension:set_wanted_velocity(new_velocity)

	blackboard.current_charge_speed = wanted_charge_speed

	locomotion_extension.death_velocity_boxed:store(new_velocity * 2)

	local distance_to_target = Vector3.distance(self_position, target_position)

	if distance_to_target <= action.enter_lunge_thresholds.far then
		return true
	end

	return false
end

BTChaosSorcererChargeAction._run_lunge = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local action = blackboard.action
	local slow_down_speed = nil

	locomotion_extension:use_lerp_rotation(false)
	locomotion_extension:set_rotation_speed(nil)

	local wanted_pose = Unit.animation_wanted_root_pose(unit)
	local wanted_rotation = Matrix4x4.rotation(wanted_pose)

	locomotion_extension:set_wanted_rotation(wanted_rotation)

	slow_down_speed = action.lunge_rotation_slow_down_speed

	self:_check_lunge(unit, blackboard, t)
	self:_slow_down(unit, blackboard, slow_down_speed, t, dt)
end

BTChaosSorcererChargeAction._run_impact = function (self, unit, blackboard, t, dt)
	if blackboard.hit_target then
		local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.charge_target_unit)

		blackboard.locomotion_extension:set_wanted_rotation(rotation)
	elseif blackboard.hit_during_impact_t and t < blackboard.hit_during_impact_t then
		local hit_target = self:_check_overlap(unit, blackboard, blackboard.action)

		if hit_target then
			blackboard.hit_during_impact_t = nil
		end
	end

	local slow_down_speed = (blackboard.hit_target and blackboard.action.hit_target_slow_down_speed) or blackboard.action.slow_down_speed

	self:_slow_down(unit, blackboard, slow_down_speed, t, dt)
end

BTChaosSorcererChargeAction._run_cancel = function (self, unit, blackboard, t, dt)
	local slow_down_speed = blackboard.action.cancel_slow_down_speed

	self:_slow_down(unit, blackboard, slow_down_speed, t, dt)
end

BTChaosSorcererChargeAction._pick_distance_identifier = function (self, distance_threshold_table, distance)
	local wanted_distance_identifier, previous_distance_identifier = nil
	local previous_threshold = 0

	for distance_identifier, threshold in pairs(distance_threshold_table) do
		if distance < threshold and previous_threshold < distance then
			wanted_distance_identifier = distance_identifier

			break
		end

		previous_threshold = threshold
		previous_distance_identifier = distance_identifier
	end

	wanted_distance_identifier = wanted_distance_identifier or previous_distance_identifier

	return wanted_distance_identifier
end

BTChaosSorcererChargeAction._slow_down = function (self, unit, blackboard, slow_down_speed, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local wanted_velocity = Vector3.zero()
	local lerp_value = math.min(dt * slow_down_speed, 1)
	local new_velocity = Vector3.lerp(current_velocity, wanted_velocity, lerp_value)

	locomotion_extension:set_wanted_velocity(new_velocity)
end

BTChaosSorcererChargeAction._get_turn_slowdown_percentage = function (self, unit, blackboard, dt, direction)
	local action = blackboard.action
	local rotation = Unit.local_rotation(unit, 0)
	local forward = Quaternion.forward(rotation)
	local dot = Vector3.dot(forward, direction)
	local angle = math.radians_to_degrees(math.acos(dot))
	local min_slowdown_angle = action.min_slowdown_angle
	local max_slowdown_angle = action.max_slowdown_angle

	if dot > 1 or angle <= min_slowdown_angle then
		return
	end

	local slowdown_angle_percentage = math.min((angle - min_slowdown_angle) / max_slowdown_angle, 1)
	local max_slowdown_percentage = action.max_slowdown_percentage
	local wanted_slowdown_percentage = 1 - slowdown_angle_percentage * max_slowdown_percentage

	return wanted_slowdown_percentage
end

BTChaosSorcererChargeAction.anim_cb_start_finished = function (self, unit, blackboard)
	self:_start_charging(unit, blackboard)

	local game = Managers.state.network:game()

	if game then
		local charge_notification_sound_event = blackboard.action.charge_notification_sound_event

		if charge_notification_sound_event and Unit.alive(blackboard.charge_target_unit) then
			local player = Managers.player:unit_owner(blackboard.charge_target_unit)
			local peer_id = player:network_id()

			Managers.state.network.network_transmit:send_rpc("rpc_server_audio_event", peer_id, NetworkLookup.sound_events[charge_notification_sound_event])
		end
	end
end

BTChaosSorcererChargeAction.anim_cb_charge_charging_finished = function (self, unit, blackboard)
	if blackboard.charge_state == "charging" then
		self:_start_impact(unit, blackboard)
	end
end

BTChaosSorcererChargeAction.anim_cb_charge_impact_finished = function (self, unit, blackboard)
	self:_start_align_to_target(unit, blackboard)
end

BTChaosSorcererChargeAction.anim_cb_attack_finished = function (self, unit, blackboard)
	return
end

BTChaosSorcererChargeAction.anim_cb_disable_charge_collision = function (self, unit, blackboard)
	blackboard.anim_cb_disable_charge_collision = true
end

return
