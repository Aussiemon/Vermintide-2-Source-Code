require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTClanRatFollowAction = class(BTClanRatFollowAction, BTNode)
local LEAVE_WALK_DISTANCE_SQ = 36
local ENTER_WALK_DISTANCE_SQ = 16
local LATERAL_DISTANCE_FACTOR = 0.01
local WALK_MAX_TARGET_VELOCITY = 3
local CHASE_MIN_REQUIRED_MOVEMENT_DISTANCE = 2
local CHASE_MAX_TARGET_DISTANCE = 10
local CHASE_MAX_SPEED_INCREASE = 2
local CHASE_DEACCELERATION_DISTANCE = 1
local RUN_SPEED_INTERPOLATION_FACTOR = 0.05
local POSITION_LOOKUP = POSITION_LOOKUP
local DEFAULT_MIN_ALERT_FRIENDS_DIST = 7
local DEFAULT_MAX_ALERT_FRIENDS_DIST = 30
local DEFAULT_FRIENDS_ALERT_RANGE = 3

BTClanRatFollowAction.init = function (self, ...)
	BTClanRatFollowAction.super.init(self, ...)

	self.next_time_to_trigger_running_dialogue = 0
	self.triggered_units = {}
end

BTClanRatFollowAction.name = "BTClanRatFollowAction"

BTClanRatFollowAction.enter = function (self, unit, blackboard, t)
	local action_data = self._tree_node.action_data
	blackboard.action = action_data
	blackboard.active_node = self
	blackboard.time_to_next_evaluate = t + 0.5

	if blackboard.sneaky then
		blackboard.time_to_next_friend_alert = t + 99999
	else
		blackboard.time_to_next_friend_alert = t + 0.3
	end

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)

	local target_unit = blackboard.target_unit
	local locomotion_extension = blackboard.locomotion_extension
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

	locomotion_extension:set_wanted_rotation(rotation)

	local position = POSITION_LOOKUP[unit]
	local breed = blackboard.breed
	local enter_walk_dist_sq = (breed.enter_walk_distance and breed.enter_walk_distance^2) or ENTER_WALK_DISTANCE_SQ
	local navigation_extension = blackboard.navigation_extension
	local destination = navigation_extension:destination()
	local should_walk = self:_should_walk(destination, position, enter_walk_dist_sq, rotation)
	local use_slow_approach = self:_slow_approach(destination, position, action_data, rotation)

	if should_walk or use_slow_approach then
		blackboard.walking = true

		if use_slow_approach then
			blackboard.walk_timer = t + action_data.slow_approach_time
		else
			blackboard.walk_timer = t + 3 + 1 * Math.random()
		end

		local dir = navigation_extension:desired_velocity()
		local walk_anim, walk_dir = self:_calculate_walk_animation(Quaternion.right(rotation), Quaternion.forward(rotation), dir, position)
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, walk_anim)

		blackboard.walking_direction = walk_dir
	end
end

BTClanRatFollowAction._should_walk = function (self, destination, self_pos, max_distance_sq, rotation_towards_target)
	local diff_vector = destination - self_pos
	local direct_distance = Vector3.dot(Quaternion.forward(rotation_towards_target), diff_vector)
	local lateral_distance = Vector3.dot(Quaternion.right(rotation_towards_target), diff_vector)
	local distance_sq = direct_distance * direct_distance + lateral_distance * LATERAL_DISTANCE_FACTOR * lateral_distance * LATERAL_DISTANCE_FACTOR

	return max_distance_sq > distance_sq
end

BTClanRatFollowAction._slow_approach = function (self, destination, self_pos, action_data, rotation_towards_target)
	local breed = action_data
	local slow_approach_distance_sq = breed.slow_approach_distance_sq

	if not slow_approach_distance_sq then
		return false
	end

	local diff_vector = destination - self_pos
	local direct_distance = Vector3.dot(Quaternion.forward(rotation_towards_target), diff_vector)
	local lateral_distance = Vector3.dot(Quaternion.right(rotation_towards_target), diff_vector)
	local distance_sq = direct_distance^2 + (lateral_distance * LATERAL_DISTANCE_FACTOR)^2
	local use_slow_approach = slow_approach_distance_sq < distance_sq

	return use_slow_approach
end

BTClanRatFollowAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.active_node = nil
	local locomotion_extension = blackboard.locomotion_extension

	if not locomotion_extension._engine_extension_id then
		return
	end

	if Managers.state.network:in_game_session() then
		self:set_start_move_animation_lock(unit, blackboard, false)
	end

	if blackboard.is_turning then
		LocomotionUtils.reset_turning(unit, blackboard)

		blackboard.is_turning = nil
	end

	blackboard.start_anim_locked = nil
	blackboard.anim_cb_rotation_start = nil
	blackboard.anim_cb_move = nil
	blackboard.start_anim_done = nil
	blackboard.anim_lock_fallback_time = nil
	blackboard.deacceleration_factor = nil

	if blackboard.walking then
		blackboard.walking = nil
		blackboard.walking_direction = nil

		Managers.state.network:anim_event(unit, "move_fwd")
	end

	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	self.triggered_units[unit] = nil
end

local Unit_alive = Unit.alive

BTClanRatFollowAction.run = function (self, unit, blackboard, t, dt)
	if not Unit_alive(blackboard.target_unit) then
		return "done"
	end

	if blackboard.spawn_to_running then
		blackboard.spawn_to_running = nil
		blackboard.start_anim_done = true
		blackboard.move_state = "moving"
		blackboard.start_anim_locked = nil

		self:set_start_move_animation_lock(unit, blackboard, false)
	end

	if blackboard.walking then
		self:_update_walking(unit, blackboard, dt, t)
	end

	if not blackboard.walking and not blackboard.start_anim_done then
		if not blackboard.start_anim_locked then
			self:start_move_animation(unit, blackboard)

			blackboard.anim_lock_fallback_time = t + 2.5
		end

		if blackboard.anim_cb_rotation_start then
			self:start_move_rotation(unit, blackboard, t, dt)
		end

		if blackboard.anim_cb_move or (blackboard.anim_lock_fallback_time and blackboard.anim_lock_fallback_time <= t) then
			blackboard.anim_cb_move = false
			blackboard.move_state = "moving"
			blackboard.anim_lock_fallback_time = nil

			self:set_start_move_animation_lock(unit, blackboard, false)

			blackboard.start_anim_locked = nil
			blackboard.start_anim_done = true
		end
	else
		self:follow(unit, blackboard, t, dt)
		self:do_dialogue(unit, blackboard, t, dt)
	end

	local should_evaluate = nil
	local navigation_extension = blackboard.navigation_extension

	if blackboard.time_to_next_evaluate < t or navigation_extension:has_reached_destination() then
		local prioritized_update = blackboard.have_slot == 1 and blackboard.attacks_done == 0
		should_evaluate = "evaluate"
		blackboard.time_to_next_evaluate = (prioritized_update and t + 0.1) or t + 0.5
	end

	return "running", should_evaluate
end

BTClanRatFollowAction._update_walking = function (self, unit, blackboard, dt, t)
	local target = blackboard.target_unit
	local locomotion_extension = blackboard.locomotion_extension
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target)

	locomotion_extension:set_wanted_rotation(rotation)

	local action_data = blackboard.action
	local self_pos = POSITION_LOOKUP[unit]
	local target_locomotion = ScriptUnit.has_extension(target, "locomotion_system")
	local velocity_away = target_locomotion and target_locomotion.average_velocity and Vector3.dot(target_locomotion:average_velocity(), Vector3.normalize(POSITION_LOOKUP[target] - self_pos))
	local destination = blackboard.navigation_extension:destination()
	local walk_timer_finished = blackboard.walk_timer < t
	local use_slow_approach = self:_slow_approach(destination, self_pos, action_data, rotation)
	local breed = blackboard.breed
	local leave_walk_distance = breed.leave_walk_distance
	local leave_walk_dist_sq = (leave_walk_distance and leave_walk_distance * leave_walk_distance) or LEAVE_WALK_DISTANCE_SQ
	local should_walk = self:_should_walk(destination, self_pos, leave_walk_dist_sq, rotation)
	local run = not use_slow_approach and not should_walk
	local target_moving_fast = not use_slow_approach and velocity_away and WALK_MAX_TARGET_VELOCITY < velocity_away
	local is_tired = blackboard.action.custom_is_tired_function and blackboard.action.custom_is_tired_function(unit, blackboard)
	local run_anim = (is_tired and blackboard.action.alt_tired_anim) or "move_fwd"

	if (not breed.force_walk_while_tired or not is_tired) and (walk_timer_finished or run or target_moving_fast) then
		blackboard.walking = false
		blackboard.walking_direction = nil

		Managers.state.network:anim_event(unit, run_anim)

		return
	end

	local walk_anims = action_data.walk_anims
	local dir = blackboard.navigation_extension:desired_velocity()
	local walk_dir = self:_calculate_walk_dir(Quaternion.right(rotation), Quaternion.forward(rotation), dir, self_pos, walk_anims)

	if walk_dir ~= blackboard.walking_direction then
		local walk_anim = self:_calculate_walk_animation(walk_dir, walk_anims)

		if blackboard.action.alt_walk_anim and not is_tired then
			Managers.state.network:anim_event(unit, blackboard.action.alt_walk_anim)
		else
			Managers.state.network:anim_event(unit, walk_anim)
		end

		blackboard.move_state = "moving"
		blackboard.walking_direction = walk_dir
	end
end

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTClanRatFollowAction._calculate_walk_animation = function (self, walk_dir, walk_anims)
	local anim = nil

	if walk_dir == "right" then
		anim = "move_right_walk"
	elseif walk_dir == "left" then
		anim = "move_left_walk"
	elseif walk_dir == "forward" then
		anim = (walk_anims and randomize(walk_anims)) or "move_fwd_walk"
	else
		anim = "move_bwd_walk"
	end

	return anim
end

BTClanRatFollowAction._calculate_walk_dir = function (self, right_vector, forward_vector, dir, pos, walk_anims)
	local right_dot = Vector3.dot(right_vector, dir)
	local fwd_dot = Vector3.dot(forward_vector, dir)
	local abs_right = math.abs(right_dot)
	local abs_fwd = math.abs(fwd_dot)

	if abs_fwd < abs_right and right_dot > 0 then
		dir = "right"
	elseif abs_fwd < abs_right then
		dir = "left"
	elseif fwd_dot > 0 then
		dir = "forward"
	else
		dir = "backward"
	end

	return dir
end

BTClanRatFollowAction.follow = function (self, unit, blackboard, t, dt)
	local breed = blackboard.breed
	local target_unit = blackboard.target_unit
	local target_distance = blackboard.target_dist
	local weapon_reach = breed.follow_reach or breed.weapon_reach or 2
	local target_locomotion = ScriptUnit.has_extension(target_unit, "locomotion_system")
	local locomotion_extension = blackboard.locomotion_extension
	local current_speed = Vector3.length(locomotion_extension:current_velocity())

	if breed.use_big_boy_turning and blackboard.move_state == "moving" then
		local is_turning = blackboard.is_turning

		if is_turning then
			LocomotionUtils.update_turning(unit, t, dt, blackboard)
		else
			LocomotionUtils.check_start_turning(unit, t, dt, blackboard)
		end
	end

	local new_speed = nil

	if blackboard.walking then
		blackboard.deacceleration_factor = nil
		new_speed = breed.walk_speed
	elseif target_distance < (breed.match_speed_distance or 2 * weapon_reach) then
		blackboard.deacceleration_factor = nil
		local lerp_value = math.max((target_distance - weapon_reach) / weapon_reach, 0) * 0.4
		local target_velocity = (target_locomotion and target_locomotion.average_velocity and target_locomotion:average_velocity()) or Vector3.zero()
		local target_speed = Vector3.length(target_velocity) or 0
		local wanted_speed = (breed.walk_speed < target_speed and target_speed) or breed.walk_speed
		new_speed = math.lerp(wanted_speed, breed.run_speed, lerp_value)
	elseif (current_speed > breed.run_speed + 0.1 or blackboard.deacceleration_factor) and target_distance < 2 * weapon_reach + CHASE_DEACCELERATION_DISTANCE then
		local deaccelearation_distance_left = target_distance - weapon_reach

		if not blackboard.deacceleration_factor then
			blackboard.deacceleration_factor = (current_speed - breed.run_speed) / deaccelearation_distance_left
		end

		new_speed = blackboard.deacceleration_factor * deaccelearation_distance_left + breed.run_speed
	else
		blackboard.deacceleration_factor = nil
		local interpolation_factor = blackboard.breed.run_speed_interpolation_factor or RUN_SPEED_INTERPOLATION_FACTOR
		local wanted_speed = self:_calculate_run_speed(unit, target_unit, blackboard, target_locomotion)
		local sign = math.sign(wanted_speed - current_speed)

		if sign > 0 and current_speed < breed.run_speed and target_distance > (breed.match_speed_distance or weapon_reach) + 0.5 then
			current_speed = breed.run_speed or current_speed
		end

		new_speed = math.min(current_speed + sign * interpolation_factor * dt, wanted_speed)
	end

	if blackboard.action.custom_is_tired_function and blackboard.action.custom_is_tired_function(unit, blackboard) then
		blackboard.walking = true
		blackboard.walk_timer = t + 2.5
	end

	if not blackboard.walking then
		local enter_walk_dist_sq = (breed.enter_walk_distance and breed.enter_walk_distance^2) or ENTER_WALK_DISTANCE_SQ
		local destination = blackboard.navigation_extension:destination()
		local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)
		local position = POSITION_LOOKUP[unit]
		local should_walk = self:_should_walk(destination, position, enter_walk_dist_sq, rotation)

		if should_walk then
			local target_velocity = (target_locomotion and target_locomotion.average_velocity and target_locomotion:average_velocity()) or Vector3.zero()
			local target_speed = Vector3.length(target_velocity) or 0

			if target_speed < WALK_MAX_TARGET_VELOCITY then
				blackboard.walking = true
				blackboard.walk_timer = t + 2.5
			end
		end
	end

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(new_speed)

	if blackboard.time_to_next_friend_alert < t then
		blackboard.time_to_next_friend_alert = t + 0.5
		local is_within_range = (breed.min_alert_friends_distance or DEFAULT_MIN_ALERT_FRIENDS_DIST) < target_distance and target_distance < (breed.max_alert_friends_distance or DEFAULT_MAX_ALERT_FRIENDS_DIST)

		if is_within_range then
			local physics_world = World.get_data(blackboard.world, "physics_world")
			local unit_pos = POSITION_LOOKUP[unit]
			local direction = POSITION_LOOKUP[target_unit] - unit_pos
			local raycast_pos = unit_pos + Vector3(0, 0, 1)
			local result, hit_pos, hit_distance, normal = PhysicsWorld.immediate_raycast(physics_world, raycast_pos, direction, blackboard.target_dist, "closest", "types", "statics", "collision_filter", "filter_ai_line_of_sight_check")

			if not result then
				AiUtils.alert_nearby_friends_of_enemy(unit, blackboard.group_blackboard.broadphase, target_unit, breed.friends_alert_range or DEFAULT_FRIENDS_ALERT_RANGE)
			end
		end
	end
end

BTClanRatFollowAction._calculate_run_speed = function (self, unit, target_unit, blackboard, target_locomotion)
	local target_distance = blackboard.target_dist
	local destination_distance = blackboard.destination_dist
	local chase_factor = 0

	if target_locomotion and CHASE_MIN_REQUIRED_MOVEMENT_DISTANCE < destination_distance and target_distance < CHASE_MAX_TARGET_DISTANCE then
		local current_position = POSITION_LOOKUP[unit]
		local navigation_extension = blackboard.navigation_extension
		local destination = navigation_extension:destination()
		local target_velocity = target_locomotion:average_velocity()
		local move_direction = Vector3.normalize(destination - current_position)
		local target_move_direction = Vector3.normalize(target_velocity)
		local dot = Vector3.dot(target_move_direction, move_direction)
		chase_factor = math.clamp(dot, 0, 1)
	end

	local breed = blackboard.breed
	local new_speed = breed.run_speed + CHASE_MAX_SPEED_INCREASE * chase_factor

	return new_speed
end

BTClanRatFollowAction.start_move_animation = function (self, unit, blackboard)
	self:set_start_move_animation_lock(unit, blackboard, true)

	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local start_anims_name = nil
	local action = blackboard.action

	if action.start_alt_tired_anims_name and action.custom_is_tired_function(unit, blackboard) then
		start_anims_name = action.start_alt_tired_anims_name
	else
		start_anims_name = blackboard.action.start_anims_name
	end

	local animation_name = AiAnimUtils.get_start_move_animation(unit, target_pos, start_anims_name)

	Managers.state.network:anim_event(unit, animation_name)

	blackboard.move_animation_name = animation_name
	blackboard.start_anim_locked = true
end

BTClanRatFollowAction.start_move_rotation = function (self, unit, blackboard, t, dt)
	if blackboard.move_animation_name == "move_start_fwd" or blackboard.move_animation_name == "move_start_fwd_jog" then
		self:set_start_move_animation_lock(unit, blackboard, false)

		local locomotion_extension = blackboard.locomotion_extension
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

		locomotion_extension:set_wanted_rotation(rot)
	else
		blackboard.anim_cb_rotation_start = false
		local target_pos = POSITION_LOOKUP[blackboard.target_unit]
		local rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, target_pos, blackboard.move_animation_name, blackboard.action.start_anims_data)

		LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)
	end
end

BTClanRatFollowAction.set_start_move_animation_lock = function (self, unit, blackboard, should_lock_ani)
	local locomotion_extension = blackboard.locomotion_extension

	if should_lock_ani then
		locomotion_extension:use_lerp_rotation(false)
		LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
	else
		locomotion_extension:use_lerp_rotation(true)
		LocomotionUtils.set_animation_driven_movement(unit, false)
		LocomotionUtils.set_animation_rotation_scale(unit, 1)
	end
end

local nearby_units = {}

BTClanRatFollowAction.do_dialogue = function (self, unit, blackboard, t, dt)
	if self.next_time_to_trigger_running_dialogue < t and self.triggered_units[unit] == nil then
		local distance = math.ceil(Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[blackboard.target_unit]))

		if distance < 15 then
			local position = POSITION_LOOKUP[unit]
			local num_nearby_units = AiUtils.broadphase_query(position, 10, nearby_units)
			self.next_time_to_trigger_running_dialogue = t + 1
			self.triggered_units[unit] = true
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.distance = distance
			event_data.num_units = num_nearby_units - 1

			dialogue_input:trigger_networked_dialogue_event("running", event_data)
		end
	end
end

return
