require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTChaosExaltedSorcererSkulkAction = class(BTChaosExaltedSorcererSkulkAction, BTNode)
BTChaosExaltedSorcererSkulkAction.name = "BTChaosExaltedSorcererSkulkAction"
local BTChaosExaltedSorcererSkulkAction = BTChaosExaltedSorcererSkulkAction
local Unit_alive = Unit.alive
local POSITION_LOOKUP = POSITION_LOOKUP

BTChaosExaltedSorcererSkulkAction.init = function (self, ...)
	BTChaosExaltedSorcererSkulkAction.super.init(self, ...)

	self.cover_points_broadphase = Managers.state.conflict.level_analysis.cover_points_broadphase
end

BTChaosExaltedSorcererSkulkAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	local breed = blackboard.breed
	local target_dist = blackboard.target_dist
	local skulk_data = blackboard.skulk_data or {}
	blackboard.skulk_data = skulk_data
	skulk_data.direction = skulk_data.direction or 1 - math.random(0, 1) * 2
	skulk_data.radius = skulk_data.radius or blackboard.target_dist
	blackboard.action = action

	if blackboard.move_state ~= "idle" then
		self:idle(unit, blackboard)
	end

	local ai_navigation = blackboard.navigation_extension

	ai_navigation:set_max_speed(breed.run_speed)
	LocomotionUtils.set_animation_driven_movement(unit, false)

	if blackboard.move_pos then
		local move_pos = blackboard.move_pos:unbox()

		self:move_to(move_pos, unit, blackboard)
	end

	blackboard.ready_to_summon = false
	blackboard.num_summons = blackboard.num_summons or 0
	blackboard.health_extension = ScriptUnit.extension(unit, "health_system")
	blackboard.teleport_health_percent = blackboard.health_extension:current_health_percent() - action.part_hp_lost_to_teleport
	blackboard.travel_teleport_timer = t + ConflictUtils.random_interval(action.teleport_cooldown)
	local available_spells = action.available_spells
	local spell_name = available_spells[Math.random(1, #available_spells)]
	local spell = blackboard.spells_lookup[spell_name]
	blackboard.current_spell = spell
	blackboard.current_spell_name = spell.name
	blackboard.face_target_while_summoning = true
end

BTChaosExaltedSorcererSkulkAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local skulk_data = blackboard.skulk_data
	local default_move_speed = AiUtils.get_default_breed_move_speed(unit, blackboard)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_max_speed(default_move_speed)

	if reason == "aborted" then
		local path_found = navigation_extension:is_following_path()

		if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
			self:start_move_animation(unit, blackboard)
		end

		local difficulty = Managers.state.difficulty:get_difficulty()
		blackboard.done_casting_timer = t + blackboard.action.after_casting_delay[difficulty]
	end

	skulk_data.animation_state = nil
	blackboard.action = nil
end

BTChaosExaltedSorcererSkulkAction.run = function (self, unit, blackboard, t, dt)
	local ai_navigation = blackboard.navigation_extension
	local path_found = ai_navigation:is_following_path()
	local failed_attempts = ai_navigation:number_failed_move_attempts()
	local action = blackboard.action
	local spell = blackboard.current_spell

	if blackboard.done_casting_timer < t and spell and spell.search_func(self, unit, blackboard, t, spell) then
		return "done"
	end

	local skulk_data = blackboard.skulk_data

	if blackboard.move_pos and path_found and blackboard.move_state == "idle" then
		self:start_move_animation(unit, blackboard)
	end

	local current_health_percent = blackboard.health_extension:current_health_percent()

	if current_health_percent < blackboard.teleport_health_percent then
		local unit_pos = POSITION_LOOKUP[unit]
		local target_pos = POSITION_LOOKUP[blackboard.target_unit]
		local center_pos = unit_pos
		local target_dist_sq = Vector3.distance_squared(unit_pos, target_pos)

		if action.far_away_from_target_sq < target_dist_sq then
			center_pos = target_pos
		end

		local spread = math.random() * 5 + math.random() * 5 + math.random() * 5
		local dist = spread * 0.5 + 10
		local tries = 5
		local teleport_pos = ConflictUtils.get_spawn_pos_on_circle_with_func(blackboard.nav_world, unit_pos, dist, spread, tries, blackboard.valid_teleport_pos_func, blackboard)

		if teleport_pos then
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			skulk_data.direction = nil
			blackboard.move_pos = nil

			return "done"
		end
	elseif blackboard.travel_teleport_timer < t then
		local teleport_pos = BTChaosExaltedSorcererSkulkAction.get_skulk_target(unit, blackboard, true)

		if teleport_pos and blackboard.valid_teleport_pos_func(teleport_pos, blackboard) then
			blackboard.quick_teleport_exit_pos = Vector3Box(teleport_pos)
			blackboard.quick_teleport = true
			blackboard.move_pos = nil

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

	local position = BTChaosExaltedSorcererSkulkAction.get_skulk_target(unit, blackboard)

	if position then
		self:move_to(position, unit, blackboard)

		return "running"
	end

	if blackboard.move_state ~= "idle" then
		self:idle(unit, blackboard)
	end

	return "running"
end

BTChaosExaltedSorcererSkulkAction.at_goal = function (self, unit, blackboard)
	local skulk_data = blackboard.skulk_data
	local position_boxed = blackboard.move_pos

	if not position_boxed then
		return false
	end

	local position = position_boxed:unbox()
	local distance = Vector3.distance_squared(position, POSITION_LOOKUP[unit])

	if distance < 0.25 then
		return true
	end
end

BTChaosExaltedSorcererSkulkAction.move_to = function (self, position, unit, blackboard)
	local ai_navigation = blackboard.navigation_extension

	ai_navigation:move_to(position)

	blackboard.move_pos = Vector3Box(position)
end

BTChaosExaltedSorcererSkulkAction.idle = function (self, unit, blackboard)
	self:anim_event(unit, blackboard, "idle")

	blackboard.move_state = "idle"
end

BTChaosExaltedSorcererSkulkAction.start_move_animation = function (self, unit, blackboard)
	local move_animation = blackboard.action.move_animation

	self:anim_event(unit, blackboard, move_animation)

	blackboard.move_state = "moving"
end

BTChaosExaltedSorcererSkulkAction.anim_event = function (self, unit, blackboard, anim)
	local skulk_data = blackboard.skulk_data

	if skulk_data.animation_state ~= anim then
		Managers.state.network:anim_event(unit, anim)

		skulk_data.animation_state = anim
	end
end

local TRIES = 15

BTChaosExaltedSorcererSkulkAction.get_skulk_target = function (unit, blackboard, teleporting)
	local action = blackboard.action
	local nav_world = blackboard.nav_world
	local skulk_data = blackboard.skulk_data
	local direction = skulk_data.direction
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]
	local unit_position = POSITION_LOOKUP[unit]
	local dist = blackboard.target_dist
	local to_target = unit_position - target_position
	local to_target_dir = Vector3.normalize(to_target)
	local preferred_distance = action.preferred_distance

	if blackboard.is_close then
		if dist < preferred_distance then
			to_target = to_target + to_target_dir * (1 + math.random())
		else
			blackboard.is_close = false
			to_target = to_target + to_target_dir
		end
	elseif dist < action.close_distance then
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

		if blackboard.num_summons and blackboard.num_summons >= (action.teleport_closer_summon_limit or 3) then
			rot_vec = Vector3.normalize(target_position - unit_position) * action.teleport_closer_range
		end

		local pos = target_position + Quaternion.rotate(Quaternion(cross_dir, alpha * i), rot_vec)
		pos = ConflictUtils.find_center_tri(nav_world, pos)

		if pos then
			return pos
		end
	end

	skulk_data.direction = skulk_data.direction * -1
end

BTChaosExaltedSorcererSkulkAction.debug_show_skulk_circle = function (self, unit, blackboard)
	local action = blackboard.action
	local skulk_data = blackboard.skulk_data
	local radius = skulk_data.radius
	local target_unit = blackboard.target_unit
	local target_position = POSITION_LOOKUP[target_unit]
	local offset = Vector3.up() * 0.2

	QuickDrawer:circle(target_position + offset, blackboard.target_dist, Vector3.up(), Colors.get("light_green"))
	QuickDrawer:circle(target_position + offset, skulk_data.radius, Vector3.up(), Colors.get("light_green"))

	skulk_data.radius = blackboard.target_dist
end

BTChaosExaltedSorcererSkulkAction.update_dummy = function (self, unit, blackboard, t)
	return false
end

BTChaosExaltedSorcererSkulkAction.update_plague_wave = function (self, unit, blackboard, t, plague_wave_data)
	local target_unit = blackboard.target_unit
	local teleport_position = BTChaosSorcererPlagueSkulkAction.get_plague_wave_cast_position(self, unit, blackboard, plague_wave_data)

	if teleport_position and blackboard.valid_teleport_pos_func(teleport_position, blackboard) then
		blackboard.face_player_when_teleporting = true
		blackboard.quick_teleport_exit_pos = Vector3Box(teleport_position)
		blackboard.quick_teleport = true
		blackboard.move_pos = nil
		blackboard.ready_to_summon = true
		blackboard.num_plague_waves = (blackboard.num_plague_waves and blackboard.num_plague_waves + 1) or 1

		if blackboard.num_plague_waves >= 4 then
			blackboard.num_plague_waves = 0
		end

		return true
	end
end

BTChaosExaltedSorcererSkulkAction.update_cast_missile = function (self, unit, blackboard, t, missile_data)
	local curr_pos = Vector3.copy(POSITION_LOOKUP[unit])
	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)
	local x, y, z = unpack(blackboard.action.missile_spawn_offset)
	local pos = Vector3(x, y, z)
	local throw_offset = Quaternion.rotate(rot, pos)
	local throw_pos = curr_pos + throw_offset
	curr_pos.z = throw_pos.z
	local root_to_throw = throw_pos - curr_pos
	local direction = Vector3.normalize(root_to_throw)
	local length = Vector3.length(root_to_throw)
	local world = blackboard.world
	local physics_world = World.get_data(world, "physics_world")
	local result = PhysicsWorld.immediate_raycast(physics_world, curr_pos, direction, length, "closest", "collision_filter", "filter_enemy_ray_projectile")

	if result then
		return false
	end

	blackboard.ready_to_summon = true

	return true
end

return
