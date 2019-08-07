require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTHesitateAction = class(BTHesitateAction, BTNode)

BTHesitateAction.init = function (self, ...)
	BTHesitateAction.super.init(self, ...)
end

BTHesitateAction.name = "BTHesitateAction"
local HESITATION_TIMER = 5

if script_data.ai_hesitation_debug then
	HESITATION_TIMER = 26
end

local HESITATION_PROXIMITY_SCALING = 4
local HESITATION_SCALING_MINIMUM_RANGE_SQ = 4
local BROADPHASE_QUERY_RADIUS = 10
local HESITATION_EXIT_LOWER_BOUND = 0.3
local HESITATION_EXIT_UPPER_BOUND = 1.4
local RE_RAYCAST_DOT = math.sin(math.pi / 3)
local DO_DOT_CHECK_FOR_RE_RAYCAST = false
local WALL_ROTATION_FACTOR = 1

BTHesitateAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action

	blackboard.navigation_extension:set_enabled(false)

	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)

	blackboard.hesitation = 0

	blackboard.locomotion_extension:use_lerp_rotation(true)
	LocomotionUtils.set_animation_driven_movement(unit, true, false, true)
	LocomotionUtils.set_animation_rotation_scale(unit, 1)
	Managers.state.network:anim_event(unit, "to_combat")
	self:_select_new_hesitate_anim(unit, blackboard)

	blackboard.hesitate_wall = false
	blackboard.outnumber_multiplier = 1
	blackboard.outnumber_timer = t + 0.2 + Math.random() * 0.2
	blackboard.hesitating = true
	blackboard.hesitate_timer = nil
	blackboard.do_wall_check = action.do_wall_check
	blackboard.anim_cb_rotation_start = false
	blackboard.move_animation_name = nil

	if Math.random() > 0.5 and not blackboard.taunt_unit then
		blackboard.oh_shit_proximity_panic_override = true
	else
		blackboard.oh_shit_proximity_panic_override = false
	end

	blackboard.active_node = self
	blackboard.move_state = "idle"
	blackboard.spawn_to_running = nil
end

BTHesitateAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if not destroy then
		blackboard.locomotion_extension:use_lerp_rotation(true)
		LocomotionUtils.set_animation_driven_movement(unit, false)
		LocomotionUtils.set_animation_rotation_scale(unit, 1)
	end

	AiUtils.activate_unit(blackboard)
	blackboard.navigation_extension:set_enabled(true)

	blackboard.do_wall_check = nil
	blackboard.hesitate_wall = nil
	blackboard.hesitate_wall_rotation = nil
	blackboard.hesitate_wall_position = nil
	blackboard.last_hesitate_anim = nil
	blackboard.active_node = nil
	blackboard.outnumber_multiplier = nil
	blackboard.outnumber_timer = nil
	blackboard.oh_shit_proximity_panic_override = false
	blackboard.move_animation_name = nil
	blackboard.hesitating = false
	blackboard.hesitate_finished = nil
	blackboard.hesitate_fwd = nil

	if blackboard.taunt_unit then
		blackboard.taunt_hesitate_finished = true
		blackboard.no_taunt_hesitate = nil
	end
end

local BROADPHASE_QUERY_RESULT = {}

BTHesitateAction.anim_cb_hesitate_finished = function (self, unit, blackboard)
	blackboard.hesitate_finished = true
end

BTHesitateAction.set_unit_wall_hesitation = function (self, unit, blackboard, current_pos)
	local pos = blackboard.hesitate_wall_position and blackboard.hesitate_wall_position:unbox()

	if pos and hesitate_wall_rotation then
		local diff = Vector3.flat(pos - current_pos)

		if Vector3.dot(diff, Quaternion.forward(hesitate_wall_rotation)) >= 0.05 then
			locomotion_extension:set_wanted_velocity_flat(diff * 2)
		else
			blackboard.hesitate_wall_position = nil

			LocomotionUtils.set_animation_driven_movement(unit, true, false, true)
		end
	end
end

BTHesitateAction.wall_check = function (self, unit, blackboard, current_pos, direction)
	local physics_world = World.get_data(blackboard.world, "physics_world")
	local raycast_pos = current_pos + Vector3(0, 0, 1)
	local distance = 1.5
	local result, hit_pos, hit_distance, normal = PhysicsWorld.immediate_raycast(physics_world, raycast_pos, direction, distance, "closest", "types", "statics", "collision_filter", "filter_ai_line_of_sight_check")
	blackboard.do_wall_check = false

	if result and (not DO_DOT_CHECK_FOR_RE_RAYCAST or Vector3.dot(normal, -direction) < RE_RAYCAST_DOT) then
		local result2, hit_pos2, hit_distance2, normal2 = PhysicsWorld.immediate_raycast(physics_world, raycast_pos, -normal, distance, "closest", "types", "statics", "collision_filter", "filter_ai_line_of_sight_check")

		if result2 then
			result = result2
			hit_pos = hit_pos2
			hit_distance = hit_distance2
			normal = normal2
		end
	end

	if result then
		local network_manager = Managers.state.network

		network_manager:anim_event(unit, "hesitate_wall")

		blackboard.hesitate_wall = true
		blackboard.hesitate_wall_rotation = QuaternionBox(Quaternion.look(Vector3.flat(normal), Vector3.up()))
		local OPTIMAL_DISTANCE = 1.2

		if hit_distance < OPTIMAL_DISTANCE then
			blackboard.hesitate_wall_position = Vector3Box(hit_pos + normal * OPTIMAL_DISTANCE)

			LocomotionUtils.set_animation_driven_movement(unit, false)
		end
	elseif blackboard.last_hesitate_anim == "hesitate_bwd" then
		self:_select_new_hesitate_anim(unit, blackboard)
	end
end

BTHesitateAction.calculate_outnumber_multiplier = function (self, unit, blackboard, t, dt, current_pos, target_pos)
	local target_dist_sq = Vector3.distance_squared(target_pos, current_pos)
	local hesitation_delta = HESITATION_PROXIMITY_SCALING / math.max(target_dist_sq - HESITATION_SCALING_MINIMUM_RANGE_SQ, 1) * dt + dt
	local outnumber_multiplier = nil

	if blackboard.taunt_unit then
		outnumber_multiplier = 1
	elseif t < blackboard.outnumber_timer then
		blackboard.outnumber_timer = t + 0.2 + Math.random() * 0.2
		local broadphase = blackboard.group_blackboard.broadphase

		table.clear(BROADPHASE_QUERY_RESULT)
		Broadphase.query(broadphase, current_pos, BROADPHASE_QUERY_RADIUS, BROADPHASE_QUERY_RESULT)

		local allies_nearby = 0

		for i = 1, #BROADPHASE_QUERY_RESULT, 1 do
			local bf_unit = BROADPHASE_QUERY_RESULT[i]
			local bb = ScriptUnit.extension(bf_unit, "ai_system"):blackboard()

			if bb.confirmed_player_sighting or bb.hesitating then
				allies_nearby = allies_nearby + 1
			end
		end

		local enemies_nearby = 0
		local side = blackboard.side
		local positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS

		for i = 1, #positions, 1 do
			local proximity = Vector3.distance_squared(target_pos, current_pos)

			if proximity < 36 then
				blackboard.oh_shit_proximity_panic_override = true
				blackboard.is_within_proximity = true
			end

			local distance = Vector3.distance(target_pos, positions[i])

			if distance < 100 then
				enemies_nearby = enemies_nearby + 1
			elseif distance < 225 then
				enemies_nearby = enemies_nearby + math.auto_lerp(10, 15, 1, 0, distance)^2
			end
		end

		outnumber_multiplier = 1.25 * allies_nearby / math.max(enemies_nearby, 1)
		blackboard.outnumber_multiplier = outnumber_multiplier

		if enemies_nearby < allies_nearby then
			blackboard.oh_shit_proximity_panic_override = true
		end
	else
		outnumber_multiplier = blackboard.outnumber_multiplier
	end

	return outnumber_multiplier, hesitation_delta
end

BTHesitateAction.start_move_animation = function (self, unit, blackboard, target_pos)
	local action = blackboard.action
	local target_unit = blackboard.target_unit
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:use_lerp_rotation(false)
	LocomotionUtils.set_animation_driven_movement(unit, true, false, false)

	local animation_name = AiAnimUtils.get_start_move_animation(unit, target_pos, blackboard.action.start_anims_name)

	assert(animation_name, "Move animation was nil!  Have you added start_anims_name entry to breeds?")
	Managers.state.network:anim_event(unit, animation_name)

	blackboard.move_animation_name = animation_name
	blackboard.anim_locked = 0
	blackboard.spawn_to_running = true
	local fwd_start_anim = action.start_anims_name.fwd
	local is_fwd_animation = false

	if type(fwd_start_anim) == "table" then
		for _, anim in pairs(fwd_start_anim) do
			if anim == animation_name then
				is_fwd_animation = true
			end
		end
	else
		is_fwd_animation = animation_name == fwd_start_anim
	end

	blackboard.navigation_extension:set_enabled(true)

	blackboard.hesitate_fwd = is_fwd_animation
end

BTHesitateAction.run = function (self, unit, blackboard, t, dt)
	local debug = script_data.ai_hesitation_debug
	local action = blackboard.action
	local exit_override = blackboard.is_within_proximity or blackboard.hesitate_finished or (blackboard.previous_attacker and not blackboard.taunt_unit)
	local finished_hesitating = blackboard.confirmed_player_sighting or blackboard.no_hesitation or exit_override

	if finished_hesitating then
		local deadline_reached = blackboard.hesitate_timer and blackboard.hesitate_timer < t
		local exit_hesitate = (deadline_reached and blackboard.anim_cb_move) or exit_override

		if exit_hesitate then
			blackboard.spawn_to_running = blackboard.anim_cb_move

			return "done"
		elseif not blackboard.hesitate_timer then
			blackboard.hesitate_timer = t + math.lerp(HESITATION_EXIT_LOWER_BOUND, HESITATION_EXIT_UPPER_BOUND, Math.random())

			return "running"
		end
	end

	local current_pos = POSITION_LOOKUP[unit]
	local breed = blackboard.breed
	local locomotion_extension = blackboard.locomotion_extension
	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)
	local hesitate_wall_rotation = blackboard.hesitate_wall_rotation and blackboard.hesitate_wall_rotation:unbox()

	if hesitate_wall_rotation then
		rot = Quaternion.lerp(rot, hesitate_wall_rotation, WALL_ROTATION_FACTOR)
	end

	locomotion_extension:set_wanted_rotation(rot)

	if blackboard.do_wall_check then
		self:set_unit_wall_hesitation(unit, blackboard, current_pos)
	end

	local target_pos = POSITION_LOOKUP[blackboard.target_unit]
	local outnumber_multiplier, hesitation_delta = self:calculate_outnumber_multiplier(unit, blackboard, t, dt, current_pos, target_pos)
	local hesitation = blackboard.hesitation + hesitation_delta * blackboard.outnumber_multiplier
	local panic_override = blackboard.oh_shit_proximity_panic_override or blackboard.taunt_unit
	local should_start_move_animation = (breed.hesitation_timer or HESITATION_TIMER) < hesitation or panic_override

	if should_start_move_animation then
		local have_started_animation = blackboard.move_animation_name and true

		if not have_started_animation then
			local broadphase = blackboard.group_blackboard.broadphase

			AiUtils.alert_nearby_friends_of_enemy(unit, broadphase, blackboard.target_unit)
			self:start_move_animation(unit, blackboard, target_pos)
		elseif not panic_override then
			local network_manager = Managers.state.network

			network_manager:anim_event(unit, "move_fwd")

			blackboard.move_state = "moving"

			return "done"
		end

		if blackboard.anim_cb_rotation_start then
			if blackboard.hesitate_fwd then
				local locomotion_extension = blackboard.locomotion_extension

				locomotion_extension:use_lerp_rotation(true)
				LocomotionUtils.set_animation_driven_movement(unit, false)

				local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

				locomotion_extension:set_wanted_rotation(rot)
			elseif blackboard.move_animation_name then
				blackboard.anim_cb_rotation_start = false
				local rot_scale = AiAnimUtils.get_animation_rotation_scale(unit, target_pos, blackboard.move_animation_name, action.start_anims_data)

				LocomotionUtils.set_animation_rotation_scale(unit, rot_scale)
			end
		end

		local can_exit = blackboard.anim_cb_move or (blackboard.hesitate_finished and not panic_override)

		if can_exit then
			if blackboard.anim_cb_move then
				blackboard.move_state = "moving"
			end

			return "done"
		else
			return "running"
		end
	else
		blackboard.hesitation = hesitation
		local nav_world = blackboard.nav_world
		local direction = -Quaternion.forward(rot)

		if blackboard.do_wall_check and not GwNavQueries.raycango(nav_world, current_pos, current_pos + 0.5 * direction) then
			self:wall_check(unit, blackboard, current_pos, direction)
		end

		return "running"
	end
end

BTHesitationVariations = {
	hesitate = {
		"hesitate"
	},
	hesitate_bwd = {
		"hesitate_bwd_2",
		"hesitate_bwd_3",
		"hesitate_bwd_4",
		"hesitate_bwd_5",
		"hesitate_bwd_6",
		"hesitate_bwd"
	}
}

BTHesitateAction._select_new_hesitate_anim = function (self, unit, blackboard)
	local anim = nil

	if not blackboard.do_wall_check then
		anim = "hesitate"
	elseif blackboard.last_hesitate_anim == "hesitate_bwd" then
		if Math.random() > 0.3333333333333333 then
			anim = "hesitate"
		else
			anim = "hesitate_bwd"
		end
	elseif Math.random() > 0.3333333333333333 then
		anim = "hesitate_bwd"
	else
		anim = "hesitate"
	end

	local breed = blackboard.breed
	local root_variation_table = breed.BTHesitationVariations or BTHesitationVariations
	local variation_table = root_variation_table[anim]
	local hestitate_anim = variation_table[Math.random(1, #variation_table)]

	Managers.state.network:anim_event(unit, hestitate_anim)

	blackboard.last_hesitate_anim = anim
end

return
