require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local stagger_types = require("scripts/utils/stagger_types")
BTChargeAttackAction = class(BTChargeAttackAction, BTNode)

BTChargeAttackAction.init = function (self, ...)
	BTChargeAttackAction.super.init(self, ...)
end

BTChargeAttackAction.name = "BTChargeAttackAction"

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTChargeAttackAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTChargeAttackAction
	blackboard.attack_finished = false
	blackboard.attack_aborted = false
	blackboard.locked_attack_rotation = false
	blackboard.ray_can_go_update_time = t
	blackboard.attack_token = true
	local target_unit = blackboard.target_unit
	local target_unit_status_extension = ScriptUnit.has_extension(target_unit, "status_system")

	if target_unit_status_extension then
		local num_charges_targeting_player = target_unit_status_extension.num_charges_targeting_player or 0
		num_charges_targeting_player = num_charges_targeting_player + 1
		target_unit_status_extension.num_charges_targeting_player = num_charges_targeting_player
	end

	local animation_movement_extension = ScriptUnit.extension(unit, "animation_movement_system")
	blackboard.animation_movement_extension = animation_movement_extension
	local network_manager = Managers.state.network
	blackboard.target_unit_status_extension = target_unit_status_extension
	local start_animation = randomize(action.start_animation)

	network_manager:anim_event(unit, start_animation)

	blackboard.spawn_to_running = nil
	blackboard.charge_state = "starting"
	blackboard.attacking_target = blackboard.target_unit
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

	AiUtils.add_attack_intensity(target_unit, action, blackboard)

	blackboard.lean_target_position_boxed = Vector3Box()

	AiUtils.alert_nearby_friends_of_enemy(unit, blackboard.group_blackboard.broadphase, blackboard.attacking_target, 8)

	local old_cost_table = blackboard.navigation_extension:get_navtag_layer_cost_table()
	blackboard.old_navtag_layer_cost_table = old_cost_table
	local charge_navtag_layer_cost_table = blackboard.charge_navtag_layer_cost_table

	if charge_navtag_layer_cost_table then
		local traverse_logic = blackboard.navigation_extension:traverse_logic()

		GwNavTraverseLogic.set_navtag_layer_cost_table(traverse_logic, charge_navtag_layer_cost_table)
	end
end

BTChargeAttackAction.leave = function (self, unit, blackboard, t, reason, destroy)
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

	local target_unit_status_extension = ScriptUnit.has_extension(blackboard.attacking_target, "status_system")

	if target_unit_status_extension then
		local num_charges_targeting_player = target_unit_status_extension.num_charges_targeting_player or 0
		num_charges_targeting_player = num_charges_targeting_player - 1
		target_unit_status_extension.num_charges_targeting_player = num_charges_targeting_player

		StatusUtils.set_charged_network(blackboard.attacking_target, false)
	end

	if (blackboard.stagger and blackboard.charge_state == "charging") or blackboard.charge_state == "approaching" or (blackboard.charge_state == "lunge" and not blackboard.anim_cb_disable_charge_collision) then
		blackboard.charge_stagger = true
	end

	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.anim_cb_disable_charge_collision = nil
	blackboard.anim_cb_rotation_stop = nil
	blackboard.attack_aborted = nil
	blackboard.attacking_target = nil
	blackboard.cancel_approaching_t = nil
	blackboard.charge_started_at_t = nil
	blackboard.charge_state = nil
	blackboard.current_charge_speed = nil
	blackboard.current_lean_direction = nil
	blackboard.current_lean_value = nil
	blackboard.has_valid_astar_path = nil
	blackboard.hit_target = nil
	blackboard.hit_units = nil
	blackboard.lean_during_lunge = nil
	blackboard.lean_target_position_boxed = nil
	blackboard.lean_time = nil
	blackboard.lean_variable = nil
	blackboard.lean_variables = nil
	blackboard.pushed_units = nil
	blackboard.ran_past_target_timer = nil
	blackboard.start_slowing_down_at_t = nil
	blackboard.stop_lunge_rotation = nil
	blackboard.stored_position = nil
	blackboard.stored_rotation = nil
	blackboard.target_lunge_position = nil
	blackboard.target_unit_status_extension = nil
	blackboard.triggered_dodge_sound = nil

	self:_set_leaning_enabled(unit, blackboard, false)

	blackboard.animation_movement_extension = nil
	local ai_slot_system = Managers.state.entity:system("ai_slot_system")

	ai_slot_system:do_slot_search(unit, true)
end

BTChargeAttackAction.run = function (self, unit, blackboard, t, dt)
	local target_unit = blackboard.attacking_target

	if not Unit.alive(target_unit) then
		return "done"
	end

	if blackboard.attack_aborted then
		return "done"
	end

	local charge_state = blackboard.charge_state

	Profiler.start("bt_charge_attack_action")

	if blackboard.ray_can_go_update_time < t and Unit.alive(target_unit) then
		local nav_world = blackboard.nav_world
		local target_position = POSITION_LOOKUP[target_unit]
		blackboard.ray_can_go_to_target = LocomotionUtils.ray_can_go_on_mesh(nav_world, POSITION_LOOKUP[unit], target_position, nil, 1, 1)
		blackboard.ray_can_go_update_time = t + 0.25
	end

	local should_evaluate = nil

	if charge_state == "starting" then
		self:_run_starting(unit, blackboard)
	elseif charge_state == "approaching" then
		self:_run_approaching(unit, blackboard, t, dt)
	elseif charge_state == "charging" then
		self:_run_charging(unit, blackboard, t, dt)
	elseif charge_state == "pre_lunge" then
		self:_run_pre_lunge(unit, blackboard, t, dt)
	elseif charge_state == "lunge" then
		self:_run_lunge(unit, blackboard, t, dt)
	elseif charge_state == "impact" then
		self:_run_impact(unit, blackboard, t, dt)
	elseif charge_state == "align_to_target" then
		self:_run_align_to_target(unit, blackboard, t, dt)
	elseif charge_state == "finished" then
		Profiler.stop("bt_charge_attack_action")

		return "done"
	elseif charge_state == "cancel" then
		self:_run_cancel(unit, blackboard, t, dt)
	end

	Profiler.stop("bt_charge_attack_action")

	return "running", should_evaluate
end

BTChargeAttackAction._start_charging = function (self, unit, blackboard)
	local action = blackboard.action
	local t = Managers.time:time("game")
	local charge_animation, charge_tracking_duration = self:_select_charging_animation_and_duration(action, unit, blackboard.attacking_target, blackboard)

	self:_set_leaning_enabled(unit, blackboard, true)

	blackboard.charge_state = "charging"
	blackboard.charge_tracking_duration = t + charge_tracking_duration

	Managers.state.network:anim_event(unit, charge_animation)
	blackboard.locomotion_extension:set_rotation_speed(action.charge_rotation_speed)

	blackboard.charge_started_at_t = t

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "incoming_attack", DialogueSettings.special_proximity_distance_heard, "enemy_tag", blackboard.breed.name)
end

BTChargeAttackAction._start_approaching = function (self, unit, blackboard)
	local action = blackboard.action
	blackboard.charge_state = "approaching"

	self:_set_leaning_enabled(unit, blackboard, true)

	local navigation_extension = blackboard.navigation_extension
	local speed = blackboard.current_charge_speed or action.charge_speed_min

	navigation_extension:set_enabled(true)
	navigation_extension:set_max_speed(speed)

	blackboard.move_state = "moving"
end

BTChargeAttackAction._start_lunge = function (self, unit, blackboard, distance_to_target, t)
	local action = blackboard.action
	local max_angle_to_allow_lunge = action.max_angle_to_allow_lunge

	if max_angle_to_allow_lunge then
		local self_position = POSITION_LOOKUP[unit]
		local target_position = POSITION_LOOKUP[blackboard.attacking_target]
		local direction_to_target = Vector3.normalize(target_position - self_position)
		local self_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
		local dot = Vector3.dot(self_direction, direction_to_target)
		local angle = math.radians_to_degrees(math.acos(dot))

		if max_angle_to_allow_lunge < angle then
			self:_cancel_charge(unit, blackboard)

			return
		end
	end

	blackboard.charge_state = "lunge"

	self:_set_leaning_enabled(unit, blackboard, true)

	local distance_thresholds = action.enter_lunge_thresholds
	local distance_identifier = self:_pick_distance_identifier(distance_thresholds, distance_to_target)

	if action.lunge_animations then
		local lunge_animation = action.lunge_animations[distance_identifier]

		Managers.state.network:anim_event(unit, lunge_animation)
	elseif action.lunge_lean_variables then
		blackboard.lean_during_lunge = true
		blackboard.lean_downwards = true

		self:_update_leaning_position(unit, blackboard, 0, Vector3:zero())
	end

	local locomotion_extension = blackboard.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local lunge_velocity_scaling = action.lunge_velocity_scaling
	local lunge_velocity_scale = lunge_velocity_scaling[distance_identifier]
	local lunge_threshold = distance_thresholds[distance_identifier]
	local lunge_distance_scale = 1 + distance_to_target / lunge_threshold

	locomotion_extension:set_wanted_velocity(current_velocity * lunge_velocity_scale * lunge_distance_scale)
	locomotion_extension:set_rotation_speed(action.lunge_rotation_speed)

	blackboard.current_lunge_velocity_scale = lunge_velocity_scale

	if action.slow_down_start_time then
		blackboard.start_slowing_down_at_t = t + action.slow_down_start_time
	end
end

BTChargeAttackAction._start_impact = function (self, unit, blackboard, hit_target, hit_wall, hit_target_blocked, target_avoided_attack)
	local action = blackboard.action
	blackboard.charge_state = "impact"

	self:_set_leaning_enabled(unit, blackboard, false)

	local locomotion_extension = blackboard.locomotion_extension

	if hit_wall then
		local wanted_animation = action.charge_blocked_animation
		local impact_animation = randomize(wanted_animation)

		Managers.state.network:anim_event(unit, impact_animation)
		locomotion_extension:set_wanted_velocity(Vector3.zero())
		locomotion_extension:set_rotation_speed(nil)
	elseif hit_target or target_avoided_attack then
		local wanted_animation = (hit_target_blocked and action.charge_blocked_animation) or action.impact_animation
		local impact_animation = randomize(wanted_animation)

		Managers.state.network:anim_event(unit, impact_animation)

		local current_velocity = locomotion_extension:current_velocity()

		locomotion_extension:set_wanted_velocity(current_velocity * 0.5)
		locomotion_extension:set_rotation_speed(nil)
	else
		locomotion_extension:set_wanted_rotation(blackboard.stored_rotation:unbox())
	end

	if target_avoided_attack then
		local hit_during_impact_t = action.hit_during_impact_t

		if hit_during_impact_t then
			local t = Managers.time:time("game")
			blackboard.hit_during_impact_t = t + hit_during_impact_t
		end
	end

	blackboard.hit_target = hit_target
end

BTChargeAttackAction._start_align_to_target = function (self, unit, blackboard)
	local action = blackboard.action

	if not action.align_to_target_animation then
		blackboard.charge_state = "finished"

		return
	end

	local target_unit = blackboard.attacking_target
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

	Managers.state.network:anim_event(unit, align_to_target_animation)

	local start_align_t = t
	local end_align_t = t + action.end_align_t
	blackboard.start_align_t = start_align_t
	blackboard.end_align_t = end_align_t
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:use_lerp_rotation(true)
end

BTChargeAttackAction._cancel_charge = function (self, unit, blackboard)
	blackboard.navigation_extension:set_enabled(false)

	local cancel_animation = blackboard.action.cancel_animation

	Managers.state.network:anim_event(unit, cancel_animation)

	blackboard.charge_state = "cancel"
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_rotation_speed(nil)
	self:_set_leaning_enabled(unit, blackboard, false)
end

BTChargeAttackAction._check_unit_and_wall_collision = function (self, unit, blackboard, dt, ignore_wall_collision)
	local action = blackboard.action
	local hit_target, blocked = self:_check_overlap(unit, blackboard, action)

	if hit_target then
		self:_start_impact(unit, blackboard, true, false, blocked)
	end

	if not ignore_wall_collision then
		local hit_wall = self:_check_wall_collision(unit, blackboard, dt)

		if hit_wall then
			self:_start_impact(unit, blackboard, false, true)
		end
	end
end

local broadphase_query_result = {}

BTChargeAttackAction._check_overlap = function (self, unit, blackboard, action)
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
	local succesfully_hit_target, blocked = nil
	local side = blackboard.side
	local PLAYER_AND_BOT_UNITS = side.ENEMY_PLAYER_AND_BOT_UNITS

	for i = 1, #PLAYER_AND_BOT_UNITS, 1 do
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
				succesfully_hit_target, blocked = self:_hit_player(unit, blackboard, target_unit, action, to_target_dir)
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

BTChargeAttackAction._charged_at_player = function (self, unit, hit_unit, blackboard, action)
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

BTChargeAttackAction._push_player = function (self, unit, hit_unit, blackboard, action, blocked)
	local to_hit_unit = POSITION_LOOKUP[hit_unit] - POSITION_LOOKUP[unit]
	local push_speed = action.dodge_past_push_speed
	local velocity = push_speed * Vector3.normalize(to_hit_unit)
	local hit_attacking_target = hit_unit == blackboard.attacking_target

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

BTChargeAttackAction._hit_player = function (self, unit, blackboard, hit_unit, action, attack_direction)
	local hit_attacking_target = hit_unit == blackboard.attacking_target
	local hit_unit_status_extension = ScriptUnit.has_extension(hit_unit, "status_system")
	local blocked = not action.unblockable_by_normal_blocks and DamageUtils.check_block(unit, hit_unit, action.fatigue_type)
	local blocked_with_shield = DamageUtils.check_ranged_block(unit, hit_unit, attack_direction, action.shield_blocked_fatigue_type or "ogre_shove")

	if hit_attacking_target and not blocked_with_shield and not blocked then
		AiUtils.damage_target(hit_unit, unit, action, action.damage)
	end

	if action.player_push_speed and not hit_unit_status_extension.knocked_down then
		if hit_attacking_target and not blocked_with_shield then
			self:_charged_at_player(unit, hit_unit, blackboard, action)
		else
			self:_push_player(unit, hit_unit, blackboard, action, blocked_with_shield or blocked)
		end
	end

	if hit_attacking_target then
		return true
	end

	return false
end

BTChargeAttackAction._hit_ai = function (self, unit, hit_unit, action, blackboard, t)
	local push_data = action.push_ai
	local immune_breeds = action.immune_breeds
	local hit_unit_blackboard = BLACKBOARDS[hit_unit]
	local breed_name = hit_unit_blackboard.breed and hit_unit_blackboard.breed.name

	if immune_breeds and immune_breeds[breed_name] then
		return
	end

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

	if action.hit_ai_func then
		action.hit_ai_func(unit, blackboard, hit_unit, action, action)
	end

	AiUtils.alert_nearby_friends_of_enemy(unit, blackboard.group_blackboard.broadphase, blackboard.attacking_target)
end

BTChargeAttackAction._check_wall_collision = function (self, unit, blackboard, dt)
	local check_range = blackboard.action.wall_collision_check_range
	local above = 1
	local below = 1
	local nav_world = blackboard.nav_world
	local from = POSITION_LOOKUP[unit]
	local success, z = GwNavQueries.triangle_from_position(nav_world, from, above, below)

	if not success then
		return true
	end

	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension:current_velocity()
	local speed = Vector3.length(velocity)
	local direction = nil

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
			locomotion_extension.death_velocity_boxed = nil

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

BTChargeAttackAction._is_at_edge = function (self, unit, blackboard, from, direction)
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
end

BTChargeAttackAction._check_smartobjects = function (self, unit, blackboard)
	if BTConditions.at_smartobject(blackboard) then
		if BTConditions.at_door_smartobject(blackboard) then
			local smart_object = blackboard.next_smart_object_data
			local door_unit = smart_object.smart_object_data.unit

			if Unit.alive(door_unit) then
				AiUtils.kill_unit(door_unit, unit)
			end
		else
			self:_cancel_charge(unit, blackboard)
		end
	end
end

BTChargeAttackAction._run_starting = function (self, unit, blackboard)
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.attacking_target)

	blackboard.locomotion_extension:set_wanted_rotation(rotation)
end

BTChargeAttackAction._run_approaching = function (self, unit, blackboard, t, dt)
	local navigation_extension = blackboard.navigation_extension

	if blackboard.no_path_found then
		if not blackboard.cancel_approaching_t then
			blackboard.cancel_approaching_t = t + 2
		elseif blackboard.cancel_approaching_t < t then
			self:_cancel_charge(unit, blackboard)
		end
	else
		blackboard.cancel_approaching_t = nil
	end

	if blackboard.ray_can_go_to_target then
		navigation_extension:set_enabled(false)
		self:_start_charging(unit, blackboard)
	else
		local target_unit = blackboard.attacking_target
		local wanted_position = POSITION_LOOKUP[target_unit]
		local distance_to_target = Vector3.distance(POSITION_LOOKUP[unit], wanted_position)

		if distance_to_target <= blackboard.action.enter_lunge_thresholds.short then
			self:_cancel_charge(unit, blackboard)
		else
			local above = 1
			local below = 2
			local nav_world = blackboard.nav_world
			local success, z = GwNavQueries.triangle_from_position(nav_world, wanted_position, above, below)

			if success then
				blackboard.stored_position = blackboard.stored_position or Vector3Box()
				local pos_on_nav_mesh = Vector3(wanted_position.x, wanted_position.y, z)

				navigation_extension:move_to(pos_on_nav_mesh)
				blackboard.stored_position:store(pos_on_nav_mesh)
			elseif blackboard.stored_position then
				local old_position = blackboard.stored_position:unbox()

				navigation_extension:move_to(old_position)
			else
				local p = GwNavQueries.inside_position_from_outside_position(nav_world, wanted_position, 3, 3, 1, 1)

				if p then
					navigation_extension:move_to(p)
				else
					self:_cancel_charge(unit, blackboard)
				end
			end
		end
	end

	local action = blackboard.action

	self:_check_overlap(unit, blackboard, action)
	self:_check_smartobjects(unit, blackboard)
	self:_update_animation_movement_speed(unit, blackboard, dt)

	local wanted_node_index = 4
	local current_node_position, wanted_node_position = navigation_extension:get_current_and_node_position_in_nav_path(wanted_node_index)

	if current_node_position == nil or wanted_node_position == nil then
		return
	end

	local nav_path_direction = Vector3.normalize(wanted_node_position - current_node_position)
	local wanted_slowdown_percentage = self:_get_turn_slowdown_percentage(unit, blackboard, dt, nav_path_direction)

	if wanted_slowdown_percentage then
		local max_speed = blackboard.current_charge_speed or blackboard.action.charge_speed_min
		local new_max_speed = max_speed * wanted_slowdown_percentage

		navigation_extension:set_max_speed(new_max_speed)
	end

	local self_position = POSITION_LOOKUP[unit]

	Vector3.set_z(wanted_node_position, self_position[3])
	self:_update_leaning_position(unit, blackboard, dt, wanted_node_position)
end

BTChargeAttackAction._run_charging = function (self, unit, blackboard, t, dt)
	if not blackboard.ray_can_go_to_target then
		self:_start_approaching(unit, blackboard)

		return
	end

	local action = blackboard.action
	local target_unit = blackboard.attacking_target
	local locomotion_extension = blackboard.locomotion_extension
	local navigation_extension = blackboard.navigation_extension
	local self_position = POSITION_LOOKUP[unit]
	local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

	if t < blackboard.charge_tracking_duration then
		locomotion_extension:set_wanted_rotation(rotation)
		blackboard.stored_rotation:store(rotation)
	else
		locomotion_extension:set_wanted_rotation(blackboard.stored_rotation:unbox())
	end

	local charge_started_at_t = blackboard.charge_started_at_t
	local time_spent_charging = t - charge_started_at_t
	local charge_speed_min = action.charge_speed_min
	local charge_speed_max = action.charge_speed_max
	local charge_max_speed_at = action.charge_max_speed_at
	local charge_scale = time_spent_charging / charge_max_speed_at
	local wanted_charge_speed = math.min(charge_speed_min + charge_scale * (charge_speed_max - charge_speed_min), charge_speed_max)
	local target_locomotion = ScriptUnit.has_extension(target_unit, "locomotion_system")
	local target_current_velocity = target_locomotion:current_velocity()
	target_current_velocity = target_current_velocity or target_locomotion:average_velocity()
	local target_position = POSITION_LOOKUP[target_unit]
	local extrapolated_position = target_position + target_current_velocity * action.target_extrapolation_length_scale * dt
	local direction_to_target = Vector3.normalize(Vector3.flat(extrapolated_position - self_position))
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

	if charge_speed_max <= wanted_charge_speed then
		if not blackboard.stop_charge_at_t then
			blackboard.stop_charge_at_t = t + action.charge_at_max_speed_duration
		elseif blackboard.stop_charge_at_t < t then
			self:_cancel_charge(unit, blackboard)
		end
	end

	self:_check_unit_and_wall_collision(unit, blackboard, dt, false)

	local distance_to_target = Vector3.distance(self_position, extrapolated_position)

	if distance_to_target <= action.enter_lunge_thresholds.far then
		self:_start_lunge(unit, blackboard, distance_to_target, t)
	end

	Vector3.set_z(extrapolated_position, self_position[3])
	self:_update_leaning_position(unit, blackboard, dt, extrapolated_position)
	self:_update_animation_movement_speed(unit, blackboard, dt)
	self:_check_smartobjects(unit, blackboard)
end

BTChargeAttackAction._run_lunge = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local action = blackboard.action
	local slow_down_speed = action.slow_down_speed

	if action.get_lunge_position_at_distance and not blackboard.target_lunge_position then
		local distance_threshold = action.get_lunge_position_at_distance
		local target_position = POSITION_LOOKUP[blackboard.attacking_target]
		local distance_to_target = Vector3.distance(POSITION_LOOKUP[unit], target_position)

		if distance_to_target <= distance_threshold then
			blackboard.target_lunge_position = Vector3Box(target_position)

			if action.get_lunge_position_duration then
				blackboard.get_lunge_position_duration = t + action.get_lunge_position_duration
			end
		elseif not blackboard.ray_can_go_to_target then
			self:_start_impact(unit, blackboard, false, false, false, true)
		end
	end

	if not blackboard.stop_lunge_rotation then
		if blackboard.anim_cb_rotation_stop then
			locomotion_extension:set_wanted_rotation(blackboard.stored_rotation:unbox())

			blackboard.stop_lunge_rotation = true
		else
			local rotation = nil

			if blackboard.target_lunge_position then
				local lunge_direction = Vector3.normalize(blackboard.target_lunge_position:unbox() - POSITION_LOOKUP[unit])
				local current_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
				local dot = Vector3.dot(current_direction, lunge_direction)
				local get_lunge_position_duration = blackboard.get_lunge_position_duration

				if dot < 0 or get_lunge_position_duration < t or not blackboard.ray_can_go_to_target then
					self:_start_impact(unit, blackboard, false, false, false, true)
				end

				rotation = Quaternion.look(lunge_direction)
			else
				rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.attacking_target)
			end

			locomotion_extension:set_wanted_rotation(rotation)
			blackboard.stored_rotation:store(rotation)

			if blackboard.current_lunge_velocity_scale then
				local wanted_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
				local wanted_velocity = wanted_direction * blackboard.current_charge_speed

				locomotion_extension:set_wanted_velocity(wanted_velocity * blackboard.current_lunge_velocity_scale)
			end
		end

		if blackboard.lean_during_lunge then
			self:_update_animation_movement_speed(unit, blackboard, dt)
		end
	else
		locomotion_extension:use_lerp_rotation(false)
		locomotion_extension:set_rotation_speed(nil)

		local wanted_pose = Unit.animation_wanted_root_pose(unit)
		local wanted_rotation = Matrix4x4.rotation(wanted_pose)

		locomotion_extension:set_wanted_rotation(wanted_rotation)

		slow_down_speed = action.lunge_rotation_slow_down_speed
	end

	if not blackboard.anim_cb_disable_charge_collision then
		self:_check_unit_and_wall_collision(unit, blackboard, dt, false)

		if not blackboard.triggered_dodge_sound then
			local target_status_ext = ScriptUnit.has_extension(blackboard.attacking_target, "status_system")
			local target_dodged = target_status_ext and target_status_ext:get_is_dodging()

			if target_dodged then
				local push_sound_event = action.dodge_past_sound_event or "Play_generic_pushed_impact_small"

				Managers.state.entity:system("audio_system"):play_audio_unit_event(push_sound_event, unit)

				blackboard.triggered_dodge_sound = true
			end
		end
	end

	if blackboard.start_slowing_down_at_t and t < blackboard.start_slowing_down_at_t then
		return
	end

	self:_slow_down(unit, blackboard, slow_down_speed, t, dt)
	self:_check_smartobjects(unit, blackboard)
end

BTChargeAttackAction._run_impact = function (self, unit, blackboard, t, dt)
	if blackboard.hit_target then
		local rotation = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.attacking_target)

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

BTChargeAttackAction._run_align_to_target = function (self, unit, blackboard, t, dt)
	if blackboard.end_align_t < t then
		blackboard.charge_state = "finished"
	elseif blackboard.start_align_t < t then
		local start_t = blackboard.start_align_t
		local end_t = blackboard.end_align_t
		local total_t = end_t - start_t
		local current_t = end_t - t
		local lerp_t = current_t / total_t
		local current_rotation = Unit.local_rotation(unit, 0)
		local left_rotation = Quaternion.look(-Quaternion.right(current_rotation))
		local lerped_rotation = Quaternion.lerp(left_rotation, current_rotation, lerp_t)

		blackboard.locomotion_extension:set_wanted_rotation(lerped_rotation)
	end
end

BTChargeAttackAction._run_cancel = function (self, unit, blackboard, t, dt)
	local slow_down_speed = blackboard.action.cancel_slow_down_speed

	self:_slow_down(unit, blackboard, slow_down_speed, t, dt)
end

BTChargeAttackAction._select_charging_animation_and_duration = function (self, action, unit, target_unit, blackboard)
	local charging_animations = action.charging_animations
	local distance_thresholds = action.charging_distance_thresholds
	local tracking_durations = action.tracking_durations
	local self_pos = POSITION_LOOKUP[unit]
	local target_pos = POSITION_LOOKUP[target_unit] or Unit.world_position(unit, 0)
	local flat_distance = Vector3.distance(Vector3.flat(self_pos), Vector3.flat(target_pos))
	local distance_identifier = self:_pick_distance_identifier(distance_thresholds, flat_distance)

	return charging_animations[distance_identifier], tracking_durations[distance_identifier]
end

BTChargeAttackAction._pick_distance_identifier = function (self, distance_threshold_table, distance)
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

BTChargeAttackAction._slow_down = function (self, unit, blackboard, slow_down_speed, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local wanted_velocity = Vector3.zero()
	local lerp_value = math.min(dt * slow_down_speed, 1)
	local new_velocity = Vector3.lerp(current_velocity, wanted_velocity, lerp_value)

	locomotion_extension:set_wanted_velocity(new_velocity)
end

BTChargeAttackAction._set_leaning_enabled = function (self, unit, blackboard, enable)
	local go_id = Managers.state.unit_storage:go_id(unit)
	local animation_movement_extension = blackboard.animation_movement_extension

	if enable and not animation_movement_extension.enabled then
		Managers.state.network.network_transmit:send_rpc_all("rpc_enable_animation_movement_system", go_id, enable)
	elseif not enable and animation_movement_extension.enabled then
		Managers.state.network.network_transmit:send_rpc_all("rpc_enable_animation_movement_system", go_id, enable)
	end
end

BTChargeAttackAction._update_leaning_position = function (self, unit, blackboard, dt, position)
	blackboard.lean_target_position_boxed:store(position)
end

BTChargeAttackAction._update_animation_movement_speed = function (self, unit, blackboard, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local current_velocity = locomotion_extension:current_velocity()
	local current_magnitude = Vector3.length(current_velocity)
	local animation_variable = Unit.animation_find_variable(unit, "move_speed")

	Unit.animation_set_variable(unit, animation_variable, current_magnitude)
end

BTChargeAttackAction._get_turn_slowdown_percentage = function (self, unit, blackboard, dt, direction)
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

BTChargeAttackAction.anim_cb_charge_start_finished = function (self, unit, blackboard)
	if blackboard.ray_can_go_to_target then
		self:_start_charging(unit, blackboard)
	else
		self:_start_approaching(unit, blackboard)
	end

	local game = Managers.state.network:game()

	if game then
		local charge_notification_sound_event = blackboard.action.charge_notification_sound_event

		if charge_notification_sound_event and Unit.alive(blackboard.attacking_target) then
			local player = Managers.player:unit_owner(blackboard.attacking_target)

			if player then
				local peer_id = player:network_id()

				Managers.state.network.network_transmit:send_rpc("rpc_server_audio_event", peer_id, NetworkLookup.sound_events[charge_notification_sound_event])
			end
		end
	end
end

BTChargeAttackAction.anim_cb_charge_charging_finished = function (self, unit, blackboard)
	if blackboard.charge_state == "charging" then
		self:_start_impact(unit, blackboard)
	end
end

BTChargeAttackAction.anim_cb_charge_impact_finished = function (self, unit, blackboard)
	self:_start_align_to_target(unit, blackboard)
end

BTChargeAttackAction.anim_cb_disable_charge_collision = function (self, unit, blackboard)
	blackboard.anim_cb_disable_charge_collision = true
end

return
