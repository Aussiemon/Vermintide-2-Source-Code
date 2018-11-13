require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChaosSorcererPlagueSkulkAction = class(BTChaosSorcererPlagueSkulkAction, BTNode)
local BTChaosSorcererPlagueSkulkAction = BTChaosSorcererPlagueSkulkAction
local POSITION_LOOKUP = POSITION_LOOKUP

BTChaosSorcererPlagueSkulkAction.init = function (self, ...)
	BTChaosSorcererPlagueSkulkAction.super.init(self, ...)
end

BTChaosSorcererPlagueSkulkAction.name = "BTChaosSorcererPlagueSkulkAction"

BTChaosSorcererPlagueSkulkAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local breed = blackboard.breed
	local target_dist = blackboard.target_dist

	Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "heard_enemy", DialogueSettings.hear_chaos_corruptor_sorcerer, "enemy_tag", "chaos_corruptor_sorcerer")

	local skulk_data = blackboard.skulk_data or {}
	blackboard.skulk_data = skulk_data
	skulk_data.direction = skulk_data.direction or 1 - math.random(0, 1) * 2
	skulk_data.radius = skulk_data.radius or blackboard.target_dist
	blackboard.action = action

	if blackboard.move_state ~= "idle" then
		self:idle(unit, blackboard)
	end

	LocomotionUtils.set_animation_driven_movement(unit, false)

	if blackboard.move_pos then
		local move_pos = blackboard.move_pos:unbox()

		self:move_to(move_pos, unit, blackboard)
	end

	blackboard.ready_to_summon = false
	local skulk_time = 6

	if action.skulk_time then
		skulk_time = math.random(action.skulk_time[1], action.skulk_time[2])
	end

	if not blackboard.plague_wave_data then
		blackboard.plague_wave_data = {
			plague_wave_timer = t + skulk_time,
			physics_world = World.get_data(blackboard.world, "physics_world"),
			target_starting_pos = Vector3Box(),
			plague_wave_rot = QuaternionBox()
		}
	end

	blackboard.health_extension = ScriptUnit.extension(unit, "health_system")
	blackboard.teleport_health_percent = blackboard.health_extension:current_health_percent() - action.part_hp_lost_to_teleport
	blackboard.travel_teleport_timer = t + ConflictUtils.random_interval(action.teleport_cooldown)
	blackboard.face_target_while_summoning = true
	blackboard.summon_vo_timer = blackboard.summon_vo_timer or t

	if not blackboard.played_foreshadow then
		local audio_system = Managers.state.entity:system("audio_system")
		local skulk_foreshadowing_sound = action.skulk_foreshadowing_sound

		audio_system:play_audio_unit_event(skulk_foreshadowing_sound, unit)

		blackboard.played_foreshadow = true
	end
end

BTChaosSorcererPlagueSkulkAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local skulk_data = blackboard.skulk_data
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	if reason == "aborted" then
		local path_found = navigation_extension:is_following_path()

		if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
			self:start_move_animation(unit, blackboard)
		end
	end

	if blackboard.played_foreshadow then
		local audio_system = Managers.state.entity:system("audio_system")
		local skulk_foreshadowing_sound = blackboard.action.skulk_foreshadowing_sound_stop

		audio_system:play_audio_unit_event(skulk_foreshadowing_sound, unit)
	end

	skulk_data.animation_state = nil
	blackboard.action = nil

	if reason == "failed" then
		blackboard.target_unit = nil
	end
end

BTChaosSorcererPlagueSkulkAction.run = function (self, unit, blackboard, t, dt)
	if not AiUtils.is_of_interest_plague_wave_sorcerer(blackboard.target_unit) then
		return "failed"
	end

	local ai_navigation = blackboard.navigation_extension
	local path_found = ai_navigation:is_following_path()
	local failed_attempts = ai_navigation:number_failed_move_attempts()
	local action = blackboard.action
	local plague_wave_data = blackboard.plague_wave_data
	local skulk_data = blackboard.skulk_data
	local target_unit = blackboard.target_unit

	if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
		self:start_move_animation(unit, blackboard)
	end

	local current_health_percent = blackboard.health_extension:current_health_percent()

	if current_health_percent < blackboard.teleport_health_percent then
		local unit_pos = POSITION_LOOKUP[unit]
		local target_pos = POSITION_LOOKUP[target_unit]
		local center_pos = unit_pos
		local target_dist_sq = Vector3.distance_squared(unit_pos, target_pos)

		if action.far_away_from_target_sq < target_dist_sq then
			center_pos = target_pos
		end

		local spread = math.random() * 5 + math.random() * 5 + math.random() * 5
		local dist = spread * 0.5 + 10
		local tries = 5
		local teleport_pos = ConflictUtils.get_spawn_pos_on_circle(blackboard.nav_world, unit_pos, dist, spread, tries)

		if teleport_pos then
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			skulk_data.direction = nil
			blackboard.move_pos = nil

			return "done"
		end
	end

	if blackboard.vanish_timer and t < blackboard.vanish_timer then
		local ping_system = Managers.state.entity:system("ping_system")

		ping_system:remove_ping_from_unit(unit)

		return "running"
	end

	if blackboard.travel_teleport_timer < t then
		local teleport_pos = self:get_skulk_target(unit, blackboard, true)

		if teleport_pos then
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			blackboard.move_pos = nil

			return "done"
		end
	end

	if blackboard.vanish_countdown and blackboard.vanish_countdown < t and self:vanish(unit, blackboard, t) then
		return "done"
	end

	if plague_wave_data.plague_wave_timer < t and not ScriptUnit.extension(target_unit, "status_system"):is_invisible() then
		local teleport_position = self:get_plague_wave_cast_position(unit, blackboard, blackboard.plague_wave_data)

		if teleport_position then
			local skulk_time = 6

			if action.skulk_time then
				skulk_time = math.random(action.skulk_time[1], action.skulk_time[2])
			end

			blackboard.face_player_when_teleporting = true
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_position)
			blackboard.quick_teleport = true
			blackboard.move_pos = nil
			blackboard.vanish_countdown = t + action.vanish_countdown
			plague_wave_data.plague_wave_timer = t + skulk_time
			blackboard.ready_to_summon = true
			blackboard.num_plague_waves = (blackboard.num_plague_waves and blackboard.num_plague_waves + 1) or 1

			if blackboard.num_plague_waves >= 4 then
				blackboard.num_plague_waves = 0
			end

			if blackboard.played_foreshadow then
				local audio_system = Managers.state.entity:system("audio_system")
				local skulk_foreshadowing_sound = action.skulk_foreshadowing_sound_stop

				audio_system:play_audio_unit_event(skulk_foreshadowing_sound, unit)
			end

			return "done"
		end
	end

	local position = blackboard.move_pos

	if position then
		local at_goal = self:at_goal(unit, blackboard)

		if at_goal or failed_attempts > 0 then
			blackboard.move_pos = nil
		end

		return "running"
	end

	local position = self:get_skulk_target(unit, blackboard)

	if position then
		self:move_to(position, unit, blackboard)

		return "running"
	end

	if blackboard.move_state ~= "idle" then
		self:idle(unit, blackboard)
	end

	return "running"
end

BTChaosSorcererPlagueSkulkAction.at_goal = function (self, unit, blackboard)
	local action = blackboard.action
	local dist = blackboard.target_dist
	local skulk_data = blackboard.skulk_data
	local position_boxed = blackboard.move_pos
	local unit_position = POSITION_LOOKUP[unit]

	if not position_boxed then
		return false
	end

	local goal_position = position_boxed:unbox()
	local goal_distance = Vector3.distance_squared(unit_position, goal_position)

	if goal_distance < 0.25 then
		return true
	end
end

BTChaosSorcererPlagueSkulkAction.move_to = function (self, position, unit, blackboard)
	local action = blackboard.action
	local ai_navigation = blackboard.navigation_extension
	local breed = blackboard.breed

	ai_navigation:move_to(position)

	blackboard.move_pos = Vector3Box(position)
end

BTChaosSorcererPlagueSkulkAction.vanish = function (self, unit, blackboard, t)
	local action = blackboard.action
	local escape_position = BTNinjaVanishAction.find_escape_position(unit, blackboard)

	if escape_position then
		blackboard.quick_teleport_exit_pos = Vector3Box(escape_position)
		blackboard.quick_teleport = true
		blackboard.move_pos = nil
		blackboard.vanish_countdown = nil
		blackboard.vanish_timer = t + action.vanish_timer
		local ai_navigation = blackboard.navigation_extension

		ai_navigation:move_to(escape_position)
		blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

		return true
	end

	return false
end

BTChaosSorcererPlagueSkulkAction.idle = function (self, unit, blackboard)
	self:anim_event(unit, blackboard, "idle")

	blackboard.move_state = "idle"
end

BTChaosSorcererPlagueSkulkAction.start_move_animation = function (self, unit, blackboard)
	local move_animation = blackboard.action.move_animation

	self:anim_event(unit, blackboard, move_animation)

	blackboard.move_state = "moving"
end

BTChaosSorcererPlagueSkulkAction.anim_event = function (self, unit, blackboard, anim)
	local skulk_data = blackboard.skulk_data

	if skulk_data.animation_state ~= anim then
		Managers.state.network:anim_event(unit, anim)

		skulk_data.animation_state = anim
	end
end

local debug_plague_wave = false

BTChaosSorcererPlagueSkulkAction.get_plague_wave_cast_position = function (self, unit, blackboard, plague_wave_data)
	local action = blackboard.action
	local nav_world = blackboard.nav_world
	local target_unit = blackboard.target_unit
	local unit_position = POSITION_LOOKUP[unit]
	local target_position = POSITION_LOOKUP[target_unit]
	local projected_start_pos = LocomotionUtils.pos_on_mesh(nav_world, target_position, 1, 1)
	local Vector3_dist = Vector3.distance
	local min_dist = action.min_wave_distance
	local max_dist = action.max_wave_distance

	if blackboard.num_plague_waves and blackboard.num_plague_waves >= 3 then
		max_dist = action.third_wave_max_distance
		min_dist = action.third_wave_min_distance
	end

	local mid_dist = (max_dist + min_dist) / 2
	local pi = math.pi
	local plague_wave_cast_position = nil
	local target_start_pos = projected_start_pos

	if not target_start_pos then
		local p = GwNavQueries.inside_position_from_outside_position(nav_world, target_position, 6, 6, 8, 0.5)

		if p then
			target_start_pos = p
		end
	end

	if target_start_pos then
		local rand_deg = math.random(0, 360)
		local radians = (rand_deg * pi) / 180
		local direction = Vector3(math.sin(radians), math.cos(radians), 0)
		local projected_end_pos = target_position + direction * max_dist

		if projected_end_pos then
			local success, hit_position = GwNavQueries.raycast(nav_world, target_start_pos, projected_end_pos)

			if hit_position then
				local distance = Vector3_dist(hit_position, target_position)
				local is_within_bounds = min_dist < distance and distance < max_dist

				if is_within_bounds then
					local wanted_pos = target_position + direction * math.random(min_dist, distance)

					if mid_dist <= distance then
						wanted_pos = target_position + direction * math.random(mid_dist, distance)
					end

					local teleport_pos_on_mesh = LocomotionUtils.pos_on_mesh(nav_world, wanted_pos, 1, 1)

					if teleport_pos_on_mesh then
						local dir_norm = Vector3.normalize(target_start_pos - teleport_pos_on_mesh)
						local rotation = Quaternion.look(dir_norm)
						plague_wave_cast_position = teleport_pos_on_mesh

						plague_wave_data.plague_wave_rot:store(rotation)
						plague_wave_data.target_starting_pos:store(target_start_pos)
					end
				end
			end
		end
	end

	return plague_wave_cast_position
end

local TRIES = 15

BTChaosSorcererPlagueSkulkAction.get_skulk_target = function (self, unit, blackboard, teleporting)
	local action = blackboard.action
	local nav_world = blackboard.nav_world
	local skulk_data = blackboard.skulk_data
	local direction = skulk_data.direction
	local target_unit = blackboard.target_unit

	if not target_unit then
		return
	end

	local target_position = POSITION_LOOKUP[target_unit]
	local unit_position = POSITION_LOOKUP[unit]
	local dist = blackboard.target_dist
	local to_target = unit_position - target_position
	local to_target_dir = Vector3.normalize(to_target)

	if blackboard.is_close then
		if dist < (action.preferred_distance or 20) then
			to_target = to_target + to_target_dir * (1 + math.random())
		else
			blackboard.is_close = false
			to_target = to_target + to_target_dir
		end
	elseif dist < (action.close_distance or 20) then
		blackboard.is_close = true
		to_target = to_target + to_target_dir
	end

	local cross_dir = Vector3(0, 0, direction)
	local mod = 0.1
	local alpha = math.pi * math.clamp((mod * 20) / dist, 0.01, 0.15)

	if teleporting then
		alpha = alpha * 1.5
	end

	for i = 1, TRIES, 1 do
		local rot_vec = to_target - to_target_dir * 0.5
		local pos = target_position + Quaternion.rotate(Quaternion(cross_dir, alpha * i), rot_vec)
		pos = ConflictUtils.find_center_tri(nav_world, pos)

		if pos then
			return pos
		end
	end

	skulk_data.direction = skulk_data.direction * -1
end

return
