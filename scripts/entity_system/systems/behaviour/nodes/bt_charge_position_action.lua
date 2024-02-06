-- chunkname: @scripts/entity_system/systems/behaviour/nodes/bt_charge_position_action.lua

require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local stagger_types = require("scripts/utils/stagger_types")

BTChargePositionAction = class(BTChargePositionAction, BTNode)

BTChargePositionAction.init = function (self, ...)
	BTChargePositionAction.super.init(self, ...)
end

BTChargePositionAction.name = "BTChargePositionAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTChargePositionAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data

	blackboard.action = action
	blackboard.active_node = BTChargePositionAction
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.locked_attack_rotation = false
	blackboard.ray_can_go_update_time = t
	blackboard.attack_token = true
	blackboard.requested_charge_position = blackboard.charge_position
	blackboard.action_enter_t = t
	blackboard.total_distance_ran = 0
	blackboard.last_frame_pos = Vector3Box(POSITION_LOOKUP[unit])

	local network_manager = Managers.state.network
	local start_animation = randomize(action.start_animation)

	network_manager:anim_event(unit, start_animation)

	blackboard.spawn_to_running = nil
	blackboard.keep_position_if_interrupted = action.keep_position_if_interrupted

	self:_start_starting(unit, blackboard, t)

	local navigation_extension = blackboard.navigation_extension
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_wanted_velocity(Vector3.zero())
	locomotion_extension:use_lerp_rotation(true)
	navigation_extension:reset_destination()
	navigation_extension:set_enabled(false)

	blackboard.hit_units = {}
	blackboard.pushed_units = {}

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, false)

	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")

	hit_reaction_extension.force_ragdoll_on_death = true

	local old_cost_table = blackboard.navigation_extension:get_navtag_layer_cost_table()

	blackboard.old_navtag_layer_cost_table = old_cost_table

	local charge_navtag_layer_cost_table = blackboard.charge_navtag_layer_cost_table

	if charge_navtag_layer_cost_table then
		local traverse_logic = blackboard.navigation_extension:traverse_logic()

		GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, charge_navtag_layer_cost_table)
	end
end

BTChargePositionAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.attack_token = false

	if HEALTH_ALIVE[unit] then
		local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_enabled(true)
		navigation_extension:set_max_speed(default_move_speed)

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_rotation_speed(nil)
		locomotion_extension:use_lerp_rotation(true)

		local traverse_logic = blackboard.navigation_extension:traverse_logic()

		GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, blackboard.old_navtag_layer_cost_table)

		blackboard.old_navtag_layer_cost_table = nil

		local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")

		hit_reaction_extension.force_ragdoll_on_death = nil
	end

	if blackboard.stagger and blackboard.charge_state == "charging" then
		blackboard.charge_stagger = true
	end

	if blackboard.action.stick_to_enemy_t then
		blackboard.stick_to_enemy_t = t + blackboard.action.stick_to_enemy_t
	end

	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.anim_cb_disable_charge_collision = nil
	blackboard.attack_aborted = nil
	blackboard.cancel_approaching_t = nil
	blackboard.charge_started_at_t = nil
	blackboard.charge_state = nil
	blackboard.current_charge_speed = nil
	blackboard.hit_target = nil
	blackboard.hit_units = nil
	blackboard.pushed_units = nil
	blackboard.ray_can_go_to_target = nil
	blackboard.ray_can_go_update_time = nil
	blackboard.anim_cb_attack_finished = nil

	if not blackboard.keep_position_if_interrupted and blackboard.requested_charge_position == blackboard.charge_position then
		blackboard.charge_position = nil
	end

	blackboard.requested_charge_position = nil
	blackboard.total_distance_ran = nil
	blackboard.last_frame_pos = nil
	blackboard.action_enter_t = nil
	blackboard.distance_to_target_sq = nil
	blackboard.charge_start_pos = nil

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)
end

BTChargePositionAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.attack_aborted then
		return "done"
	end

	if not blackboard.requested_charge_position then
		return "done"
	end

	if t > blackboard.ray_can_go_update_time then
		local nav_world = blackboard.nav_world
		local charge_position = blackboard.requested_charge_position:unbox()

		blackboard.ray_can_go_to_target = LocomotionUtils.ray_can_go_on_mesh(nav_world, POSITION_LOOKUP[unit], charge_position, nil, 1, 1)
		blackboard.ray_can_go_update_time = t + 0.25
	end

	local charge_state = blackboard.charge_state
	local should_evaluate

	if charge_state == "starting" then
		self:_run_starting(unit, blackboard, t)
	elseif charge_state == "approaching" then
		self:_run_approaching(unit, blackboard, t, dt)
	elseif charge_state == "charging" then
		self:_run_charging(unit, blackboard, t, dt)
	elseif charge_state == "impact" then
		self:_run_impact(unit, blackboard, t, dt)
	elseif charge_state == "finished" then
		return "done"
	elseif charge_state == "cancel" then
		self:_run_cancel(unit, blackboard, t, dt)
	end

	return "running", should_evaluate
end

BTChargePositionAction._start_starting = function (self, unit, blackboard, t)
	blackboard.charge_state = "starting"
end

BTChargePositionAction._start_charging = function (self, unit, blackboard)
	local action = blackboard.action
	local t = Managers.time:time("game")
	local charge_animation = randomize(action.charge_animation)

	blackboard.move_state = "moving"
	blackboard.charge_state = "charging"

	Managers.state.network:anim_event(unit, charge_animation)
	blackboard.locomotion_extension:set_rotation_speed(action.charge_rotation_speed)

	blackboard.charge_started_at_t = t

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "incoming_attack", DialogueSettings.special_proximity_distance_heard, "enemy_tag", blackboard.breed.name)
end

BTChargePositionAction._start_approaching = function (self, unit, blackboard)
	local action = blackboard.action

	blackboard.charge_state = "approaching"
	blackboard.goal_destination = blackboard.requested_charge_position

	local navigation_extension = blackboard.navigation_extension
	local speed = blackboard.current_charge_speed or action.charge_speed_min

	navigation_extension:set_enabled(true)
	navigation_extension:set_max_speed(speed)
	navigation_extension:move_to(blackboard.goal_destination:unbox())

	blackboard.move_state = "moving"
end

BTChargePositionAction._start_impact = function (self, unit, blackboard, hit_target, hit_wall, hit_target_blocked, target_avoided_attack)
	local action = blackboard.action

	blackboard.charge_state = "impact"

	local locomotion_extension = blackboard.locomotion_extension

	blackboard.navigation_extension:set_enabled(false)

	if hit_wall then
		local wanted_animation = action.charge_blocked_animation
		local impact_animation = randomize(wanted_animation)

		Managers.state.network:anim_event(unit, impact_animation)
		locomotion_extension:set_wanted_velocity(Vector3.zero())
		locomotion_extension:set_rotation_speed(nil)
	elseif hit_target or target_avoided_attack then
		local wanted_animation = hit_target_blocked and action.charge_blocked_animation or action.impact_animation
		local impact_animation = randomize(wanted_animation)

		Managers.state.network:anim_event(unit, impact_animation)

		local current_velocity = locomotion_extension:current_velocity()

		locomotion_extension:set_wanted_velocity(current_velocity * 0.5)
		locomotion_extension:set_rotation_speed(nil)
	end

	blackboard.hit_target = hit_target
	blackboard.charge_position = nil
end

BTChargePositionAction._pause_charge = function (self, unit, blackboard)
	blackboard.navigation_extension:set_enabled(false)

	local cancel_animation = randomize(blackboard.action.cancel_animation)

	Managers.state.network:anim_event(unit, cancel_animation)

	blackboard.charge_state = "cancel"

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_rotation_speed(nil)
end

BTChargePositionAction._cancel_charge = function (self, unit, blackboard)
	self:_pause_charge(unit, blackboard)

	blackboard.charge_position = nil
end

BTChargePositionAction._check_unit_and_wall_collision = function (self, unit, blackboard, dt, ignore_wall_collision)
	local action = blackboard.action
	local hit_target = self:_check_overlap(unit, blackboard, action)

	if hit_target then
		self:_start_impact(unit, blackboard, true, false, hit_target)
	end

	if not ignore_wall_collision then
		local hit_wall = self:_check_wall_collision(unit, blackboard, dt)

		if hit_wall then
			self:_start_impact(unit, blackboard, false, true)
		end
	end
end

local broadphase_query_result = {}

BTChargePositionAction._check_overlap = function (self, unit, blackboard, action)
	if blackboard.is_illusion then
		return false, false
	end

	local t = Managers.time:time("game")
	local radius = action.radius
	local head_radius = action.head_radius
	local hit_units = blackboard.hit_units
	local pushed_units = blackboard.pushed_units
	local self_pos = Unit.local_position(unit, 0)
	local head_pos = Unit.world_position(unit, Unit.node(unit, "j_head"))
	local forward_dir = Quaternion.forward(Unit.local_rotation(unit, 0))
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i = 1, #PLAYER_AND_BOT_UNITS do
		local target_unit = PLAYER_AND_BOT_UNITS[i]
		local pos = POSITION_LOOKUP[target_unit]
		local to_target_dir = Vector3.normalize(pos - self_pos)
		local to_target = pos - self_pos
		local dist = Vector3.length(to_target)
		local dot = Vector3.dot(to_target_dir, forward_dir)

		if dot > 0 then
			local target_status_ext = ScriptUnit.extension(target_unit, "status_system")

			if target_status_ext and target_status_ext:get_is_dodging() then
				head_radius = action.target_dodged_radius
			end

			local has_hit_unit = hit_units[target_unit]
			local has_pushed_unit = pushed_units[target_unit]

			if not has_hit_unit and dist < head_radius and target_status_ext and not target_status_ext:is_invisible() then
				self:_hit_player(unit, blackboard, target_unit, action, to_target_dir)

				hit_units[target_unit] = true
			elseif not has_hit_unit and not has_pushed_unit and dist < radius and target_status_ext and not target_status_ext:is_invisible() then
				self:_push_player(unit, target_unit, blackboard, action)

				pushed_units[target_unit] = true
			end
		end
	end

	local broadphase = blackboard.group_blackboard.broadphase
	local hit_ai_radius = action.hit_ai_radius
	local num_results = Broadphase.query(broadphase, self_pos, hit_ai_radius, broadphase_query_result)

	for i = 1, num_results do
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

	local hit_target = hit_units[blackboard.target_unit]

	return hit_target
end

BTChargePositionAction._charged_at_player = function (self, unit, hit_unit, blackboard, action)
	return
end

BTChargePositionAction._push_player = function (self, unit, hit_unit, blackboard, action, blocked)
	local to_hit_unit = POSITION_LOOKUP[hit_unit] - POSITION_LOOKUP[unit]
	local push_speed = action.dodge_past_push_speed
	local velocity = push_speed * Vector3.normalize(to_hit_unit)

	Vector3.set_z(velocity, 3)
	StatusUtils.set_catapulted_network(hit_unit, true, velocity)
end

BTChargePositionAction._hit_player = function (self, unit, blackboard, hit_unit, action, attack_direction)
	local hit_unit_status_extension = ScriptUnit.has_extension(hit_unit, "status_system")
	local blocked = DamageUtils.check_block(unit, hit_unit, action.fatigue_type)
	local blocked_with_shield = DamageUtils.check_ranged_block(unit, hit_unit, attack_direction, action.shield_blocked_fatigue_type or "ogre_shove")

	if not blocked_with_shield and not blocked then
		AiUtils.damage_target(hit_unit, unit, action, action.damage)
	end

	if action.player_push_speed and not hit_unit_status_extension.knocked_down then
		if not blocked_with_shield then
			self:_charged_at_player(unit, hit_unit, blackboard, action)
		else
			self:_push_player(unit, hit_unit, blackboard, action, blocked_with_shield or blocked)
		end
	end

	return blocked
end

BTChargePositionAction._hit_ai = function (self, unit, hit_unit, action, blackboard, t)
	local push_data = action.push_ai
	local hit_unit_blackboard = BLACKBOARDS[hit_unit]
	local breed_name = hit_unit_blackboard.breed and hit_unit_blackboard.breed.name
	local unit_side = Managers.state.side.side_by_unit[unit]
	local hit_unit_side = Managers.state.side.side_by_unit[hit_unit]

	if unit_side == hit_unit_side then
		return
	end

	if push_data then
		local stagger_type, stagger_duration = DamageUtils.calculate_stagger(push_data.stagger_impact, push_data.stagger_duration, hit_unit, unit)

		if stagger_type > stagger_types.none then
			local self_pos = POSITION_LOOKUP[unit]
			local hit_unit_pos = POSITION_LOOKUP[hit_unit]
			local direction_to_ai = Vector3.normalize(hit_unit_pos - self_pos)
			local self_rot = Unit.local_rotation(unit, 0)
			local right = Quaternion.right(self_rot)
			local forward = Quaternion.forward(self_rot)
			local dot = Vector3.dot(right, direction_to_ai)
			local push_direction = -right

			if dot > 0 then
				push_direction = -push_direction
			end

			push_direction = Vector3.normalize(push_direction + forward)

			AiUtils.stagger(hit_unit, hit_unit_blackboard, unit, push_direction, push_data.stagger_distance, stagger_type, stagger_duration, nil, t, nil, nil, nil, true)

			if breed_name == "chaos_warrior" then
				local attacker_name = blackboard.breed and blackboard.breed.name

				if attacker_name == "beastmen_bestigor" then
					local stat_name = "scorpion_bestigor_charge_chaos_warrior"
					local stat_name_index = NetworkLookup.statistics[stat_name]
					local statistics_db = Managers.player:statistics_db()
					local local_player = Managers.player:local_player()
					local stats_id = local_player:stats_id()

					statistics_db:increment_stat(stats_id, stat_name)
					Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat", stat_name_index)
				end
			end
		end
	end

	if not action.ignore_ai_damage then
		AiUtils.damage_target(hit_unit, unit, action, action.damage)
	end

	AiUtils.alert_nearby_friends_of_enemy(unit, blackboard.group_blackboard.broadphase, hit_unit)
end

BTChargePositionAction._check_wall_collision = function (self, unit, blackboard, dt)
	local check_range = blackboard.action.wall_collision_check_range
	local above, below = 1, 1
	local nav_world = blackboard.nav_world
	local from = POSITION_LOOKUP[unit]
	local success, z = GwNavQueries.triangle_from_position(nav_world, from, above, below)

	if not success then
		return true
	end

	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension:current_velocity()
	local speed = Vector3.length(velocity)
	local direction

	if speed > 0.01 then
		direction = Vector3.normalize(velocity)
	else
		local rotation = Unit.local_rotation(unit, 0)

		direction = Quaternion.forward(rotation)
	end

	local length = check_range + dt * speed
	local to = from + direction * length
	local success2, z2 = GwNavQueries.triangle_from_position(nav_world, to, above, below)

	if not success2 then
		if not blackboard.action.ignore_ledge_death and self:_is_at_edge(unit, blackboard, from, direction) then
			local damage_type = "charge_death"

			AiUtils.kill_unit(unit, unit, "torso", damage_type, Vector3.normalize(velocity))

			blackboard.charge_state = "finished"

			return false
		end

		return true
	end

	local ray_start = Vector3(from.x, from.y, z)
	local ray_end = Vector3(to.x, to.y, z2)
	local traverse_logic = blackboard.navigation_extension:traverse_logic()
	local ray_can_go = GwNavQueries.raycango(nav_world, ray_start, ray_end, traverse_logic)

	return not ray_can_go
end

BTChargePositionAction._is_at_edge = function (self, unit, blackboard, from, direction)
	local pw = World.get_data(blackboard.world, "physics_world")
	local line_of_sight_start = from + Vector3(0, 0, 1)
	local line_of_sight_dist = 4
	local line_of_sight_end = line_of_sight_start + direction * line_of_sight_dist
	local line_of_sight_direction = line_of_sight_end - line_of_sight_start
	local hit = PhysicsWorld.raycast(pw, line_of_sight_start, line_of_sight_direction, line_of_sight_dist, "closest", "collision_filter", "filter_ai_line_of_sight_check")

	if hit then
		return false
	end

	local downwards_start = line_of_sight_end
	local downwards_dist = 4
	local downwards_end = line_of_sight_end + -Vector3.up() * downwards_dist
	local downwards_direction = downwards_end - downwards_start
	local hit2 = PhysicsWorld.raycast(pw, downwards_start, downwards_direction, downwards_dist, "closest", "collision_filter", "filter_ai_line_of_sight_check")

	if not hit2 then
		return true
	end

	if false then
		-- Nothing
	end
end

BTChargePositionAction._check_smartobjects = function (self, unit, blackboard)
	if BTConditions.at_smartobject(blackboard) then
		if BTConditions.at_door_smartobject(blackboard) then
			local smart_object = blackboard.next_smart_object_data
			local door_unit = smart_object.smart_object_data.unit

			if Unit.alive(door_unit) then
				AiUtils.kill_unit(door_unit, unit)
			end
		else
			self:_pause_charge(unit, blackboard)
		end
	end
end

BTChargePositionAction._run_starting = function (self, unit, blackboard, t)
	local target_position = blackboard.requested_charge_position:unbox()
	local rotation = LocomotionUtils.look_at_position_flat(unit, target_position)

	blackboard.locomotion_extension:set_wanted_rotation(rotation)
end

BTChargePositionAction._run_approaching = function (self, unit, blackboard, t, dt)
	local navigation_extension = blackboard.navigation_extension

	if blackboard.no_path_found then
		if not blackboard.cancel_approaching_t then
			blackboard.cancel_approaching_t = t + 2
		elseif t > blackboard.cancel_approaching_t then
			self:_cancel_charge(unit, blackboard)

			return
		end
	else
		blackboard.cancel_approaching_t = nil
	end

	if blackboard.ray_can_go_to_target then
		navigation_extension:set_enabled(false)
		self:_start_charging(unit, blackboard)

		return
	end

	local target_position = blackboard.requested_charge_position:unbox()

	navigation_extension:move_to(target_position)

	local action = blackboard.action

	self:_check_overlap(unit, blackboard, action)
	self:_check_smartobjects(unit, blackboard)
	self:_update_animation_movement_speed(unit, blackboard, dt)

	local locomotion_extension = blackboard.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local rotation = Quaternion.look(current_velocity)

	blackboard.locomotion_extension:set_wanted_rotation(rotation)

	local wanted_node_index = 4
	local current_node_position, wanted_node_position = navigation_extension:get_current_and_node_position_in_nav_path(wanted_node_index)

	if current_node_position == nil or wanted_node_position == nil then
		return
	end

	local nav_path_direction = Vector3.normalize(wanted_node_position - current_node_position)
	local wanted_slowdown_percentage = self:_get_turn_slowdown_percentage(unit, blackboard, dt, nav_path_direction)

	if wanted_slowdown_percentage then
		local max_speed = blackboard.action.charge_speed_min
		local new_max_speed = max_speed * wanted_slowdown_percentage

		navigation_extension:set_max_speed(new_max_speed)
	end

	local time_since_enter = t - blackboard.action_enter_t

	if time_since_enter > action.max_charge_t then
		self:_cancel_charge(unit, blackboard)

		return
	end

	local current_pos = POSITION_LOOKUP[unit]
	local last_frame_pos = blackboard.last_frame_pos:unbox()
	local distance_this_frame = Vector3.distance(current_pos, last_frame_pos)

	blackboard.total_distance_ran = blackboard.total_distance_ran + distance_this_frame

	blackboard.last_frame_pos:store(current_pos)

	if blackboard.total_distance_ran > action.max_charge_distance then
		self:_cancel_charge(unit, blackboard)

		return
	end
end

BTChargePositionAction._run_charging = function (self, unit, blackboard, t, dt)
	if blackboard.requested_charge_position ~= blackboard.charge_position then
		self:_pause_charge(unit, blackboard)

		return
	end

	if not blackboard.ray_can_go_to_target then
		self:_start_approaching(unit, blackboard)

		return
	end

	local action = blackboard.action

	if action.allow_target_unit_override and blackboard.using_override_target and ALIVE[blackboard.target_unit] then
		blackboard.requested_charge_position:store(POSITION_LOOKUP[blackboard.target_unit])
	end

	local target_position = blackboard.requested_charge_position:unbox()
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:move_to(target_position)

	local locomotion_extension = blackboard.locomotion_extension
	local rotation = LocomotionUtils.look_at_position_flat(unit, target_position)

	locomotion_extension:set_wanted_rotation(rotation)

	local charge_started_at_t = blackboard.charge_started_at_t
	local time_spent_charging = t - charge_started_at_t
	local charge_speed_min = action.charge_speed_min
	local charge_speed_max = action.charge_speed_max
	local charge_max_speed_at = action.charge_max_speed_at
	local charge_scale = time_spent_charging / charge_max_speed_at
	local wanted_charge_speed = math.min(charge_speed_min + charge_scale * (charge_speed_max - charge_speed_min), charge_speed_max)
	local wanted_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
	local new_velocity = wanted_direction * wanted_charge_speed

	locomotion_extension:set_wanted_velocity(new_velocity)
	navigation_extension:set_max_speed(wanted_charge_speed)

	blackboard.current_charge_speed = wanted_charge_speed

	self:_check_unit_and_wall_collision(unit, blackboard, dt, false)
	self:_update_animation_movement_speed(unit, blackboard, dt)
	self:_check_smartobjects(unit, blackboard)

	local time_since_enter = t - blackboard.action_enter_t

	if time_since_enter > action.max_charge_t then
		self:_cancel_charge(unit, blackboard)

		return
	end

	local current_pos = POSITION_LOOKUP[unit]
	local last_frame_pos = blackboard.last_frame_pos:unbox()

	if not action.allow_target_unit_override or not blackboard.using_override_target or not ALIVE[blackboard.target_unit] then
		local distance_to_target_sq = blackboard.distance_to_target_sq or Vector3.distance_squared(target_position, current_pos)
		local charge_start_pos = blackboard.charge_start_pos or Vector3Box(current_pos)
		local charge_distance_ran_sq = Vector3.distance_squared(charge_start_pos:unbox(), current_pos)

		if distance_to_target_sq < charge_distance_ran_sq then
			self:_cancel_charge(unit, blackboard)

			return
		end

		blackboard.distance_to_target_sq = distance_to_target_sq
		blackboard.charge_start_pos = charge_start_pos
	else
		blackboard.distance_to_target_sq = nil
		blackboard.charge_start_pos = nil
	end

	local frame_delta = current_pos - last_frame_pos
	local distance_this_frame = Vector3.length(frame_delta)

	blackboard.total_distance_ran = blackboard.total_distance_ran + distance_this_frame

	blackboard.last_frame_pos:store(current_pos)

	if blackboard.total_distance_ran > action.max_charge_distance then
		self:_cancel_charge(unit, blackboard)

		return
	end
end

BTChargePositionAction._run_impact = function (self, unit, blackboard, t, dt)
	local slow_down_speed = blackboard.hit_target and blackboard.action.hit_target_slow_down_speed or blackboard.action.slow_down_speed

	self:_slow_down(unit, blackboard, slow_down_speed, t, dt)

	if blackboard.anim_cb_attack_finished then
		blackboard.charge_state = "finished"
	end
end

BTChargePositionAction._run_cancel = function (self, unit, blackboard, t, dt)
	local slow_down_speed = blackboard.action.cancel_slow_down_speed

	self:_slow_down(unit, blackboard, slow_down_speed, t, dt)

	if blackboard.anim_cb_attack_finished then
		blackboard.charge_state = "finished"
	end
end

BTChargePositionAction._slow_down = function (self, unit, blackboard, slow_down_speed, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local wanted_velocity = Vector3.zero()
	local lerp_value = math.min(dt * slow_down_speed, 1)
	local new_velocity = Vector3.lerp(current_velocity, wanted_velocity, lerp_value)

	locomotion_extension:set_wanted_velocity(new_velocity)
end

BTChargePositionAction._update_animation_movement_speed = function (self, unit, blackboard, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local current_magnitude = Vector3.length(current_velocity)
	local animation_variable = Unit.animation_find_variable(unit, "move_speed")

	Unit.animation_set_variable(unit, animation_variable, current_magnitude)
end

BTChargePositionAction._get_turn_slowdown_percentage = function (self, unit, blackboard, dt, direction)
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

BTChargePositionAction.anim_cb_charge_start_finished = function (self, unit, blackboard)
	self:_start_charging(unit, blackboard)
end

BTChargePositionAction.anim_cb_charge_charging_finished = function (self, unit, blackboard)
	if blackboard.charge_state == "charging" then
		self:_start_impact(unit, blackboard)
	end
end

BTChargePositionAction.anim_cb_disable_charge_collision = function (self, unit, blackboard)
	blackboard.anim_cb_disable_charge_collision = true
end

BTChargePositionAction.anim_cb_attack_finished = function (self, unit, blackboard)
	blackboard.anim_cb_attack_finished = true
end
