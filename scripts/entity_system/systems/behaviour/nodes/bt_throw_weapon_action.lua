require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTThrowWeaponAction = class(BTThrowWeaponAction, BTNode)
BTThrowWeaponAction.init = function (self, ...)
	BTThrowWeaponAction.super.init(self, ...)

	return 
end
BTThrowWeaponAction.name = "BTThrowWeaponAction"
local player_and_bot_units = PLAYER_AND_BOT_UNITS
BTThrowWeaponAction.enter = function (self, unit, blackboard, t)
	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.active_node = BTThrowWeaponAction
	blackboard.move_state = "attacking"
	local throw_animation = action.throw_animation

	Managers.state.network:anim_event(unit, "to_combat")
	Managers.state.network:anim_event(unit, throw_animation)
	Unit.flow_event(unit, "throw_animation_started")

	local ai_inventory_extension = ScriptUnit.extension(unit, "ai_inventory_system")
	blackboard.inventory_extension = ai_inventory_extension

	blackboard.navigation_extension:set_enabled(false)
	blackboard.locomotion_extension:set_wanted_velocity(Vector3.zero())

	blackboard.thrown_weapon_displaced_units = {}
	blackboard.pushed_position_override = Vector3Box()
	blackboard.hit_units = {}
	blackboard.rotation_timer = t + action.rotation_time
	blackboard.close_attack_timer = t + action.close_attack_time

	return 
end
BTThrowWeaponAction.leave = function (self, unit, blackboard, t, reason, destroy)
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_rotation_speed(locomotion_extension, nil)
	blackboard.navigation_extension:set_enabled(true)

	if blackboard.thrown_unit and Unit.alive(blackboard.thrown_unit) then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system.play_audio_unit_event(audio_system, blackboard.action.stop_sound_id, blackboard.thrown_unit)
		Managers.state.unit_spawner:mark_for_deletion(blackboard.thrown_unit)

		blackboard.thrown_unit = nil
		local network_manager = Managers.state.network
		local owner_go_id = network_manager.unit_game_object_id(network_manager, unit)

		network_manager.network_transmit:send_rpc_all("rpc_ai_show_single_item", owner_go_id, 1, true)
	end

	blackboard.action = nil
	blackboard.active_node = nil
	blackboard.throw_finished = nil
	blackboard.inventory_extension = nil
	blackboard.pushed_position_override = nil
	blackboard.hit_units = nil
	blackboard.catched_weapon = nil
	blackboard.rotation_timer = nil

	Managers.state.network:anim_event(unit, "move_fwd")

	return 
end
BTThrowWeaponAction.anim_cb_throw_weapon = function (self, unit, blackboard)
	local action = blackboard.action
	local rotation = Unit.local_rotation(unit, 0)
	local position = POSITION_LOOKUP[unit] + Vector3.up()*2
	local direction = Quaternion.forward(rotation)
	local world = blackboard.world
	local physics_world = World.physics_world(world)
	local result, hit_position, distance = PhysicsWorld.immediate_raycast(physics_world, position, direction, 40, "closest", "collision_filter", "filter_ai_line_of_sight_check")

	if result then
		local network_manager = Managers.state.network
		local owner_go_id = network_manager.unit_game_object_id(network_manager, unit)

		network_manager.network_transmit:send_rpc_all("rpc_ai_show_single_item", owner_go_id, 1, false)

		blackboard.throw_weapon_goal_position = Vector3Box(hit_position)
		local unit_name = action.throw_unit_name
		local thrown_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "thrown_weapon_unit", nil, position)
		blackboard.thrown_unit = thrown_unit
		blackboard.thrown_state = "moving_towards_target"

		Unit.flow_event(thrown_unit, "axe_thrown")

		blackboard.initial_throw_direction = Vector3Box(direction)
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system.play_audio_unit_event(audio_system, action.running_sound_id, blackboard.thrown_unit)

		local obstacle_position, obstacle_rotation, obstacle_size = AiUtils.calculate_oobb(distance, POSITION_LOOKUP[unit], rotation, 2, action.radius*1.2)
		local bot_threat_duration = distance*0.25
		local ai_bot_group_system = Managers.state.entity:system("ai_bot_group_system")

		ai_bot_group_system.aoe_threat_created(ai_bot_group_system, obstacle_position, "oobb", obstacle_size, obstacle_rotation, bot_threat_duration)
	else
		blackboard.throw_finished = true
	end

	return 
end
BTThrowWeaponAction.anim_cb_throw_finished = function (self, unit, blackboard)
	blackboard.throw_finished = true

	return 
end
BTThrowWeaponAction.catch_weapon = function (self, unit, blackboard)
	local network_manager = Managers.state.network
	local owner_go_id = network_manager.unit_game_object_id(network_manager, unit)

	network_manager.network_transmit:send_rpc_all("rpc_ai_show_single_item", owner_go_id, 1, true)

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system.play_audio_unit_event(audio_system, blackboard.action.stop_sound_id, blackboard.thrown_unit)

	local action = blackboard.action
	local catch_animation = action.catch_animation

	Managers.state.network:anim_event(unit, catch_animation)

	if blackboard.thrown_unit then
		Managers.state.unit_spawner:mark_for_deletion(blackboard.thrown_unit)
	end

	blackboard.throw_weapon_goal_position = nil
	blackboard.thrown_unit = nil
	blackboard.thrown_weapon_direction = nil
	blackboard.catched_weapon = true
	blackboard.close_attack_target = nil

	return 
end
BTThrowWeaponAction.run = function (self, unit, blackboard, t, dt)
	if t < blackboard.rotation_timer then
		local target_unit = blackboard.target_unit

		if target_unit then
			local rot = LocomotionUtils.rotation_towards_unit_flat(unit, target_unit)

			blackboard.locomotion_extension:set_wanted_rotation(rot)
		end
	elseif blackboard.close_attack_target then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.close_attack_target)

		blackboard.locomotion_extension:set_wanted_rotation(rot)
	elseif blackboard.initial_throw_direction and (blackboard.catched_weapon or blackboard.rotation_timer < t) then
		local rot = Quaternion.look(blackboard.initial_throw_direction:unbox())

		blackboard.locomotion_extension:set_wanted_rotation(rot)
	end

	if blackboard.throw_finished then
		return "done"
	else
		local has_catched_weapon = nil

		if blackboard.throw_weapon_goal_position then
			has_catched_weapon = self.update_thrown_weapon(self, unit, blackboard, dt, t)
		end

		if has_catched_weapon and blackboard.thrown_unit then
			self.catch_weapon(self, unit, blackboard)
		end

		return "running"
	end

	return 
end
BTThrowWeaponAction.update_thrown_weapon = function (self, unit, blackboard, dt, t)
	local thrown_unit = blackboard.thrown_unit

	if not thrown_unit or not Unit.alive(thrown_unit) then
		return 
	end

	local action = blackboard.action
	local speed = action.throw_speed
	local unit_position = POSITION_LOOKUP[unit] + Vector3.up()*2
	local wanted_position = blackboard.throw_weapon_goal_position:unbox()
	local current_position = Unit.local_position(thrown_unit, 0)
	local distance_to_goal = Vector3.distance(wanted_position, current_position)
	local direction = Vector3.normalize(wanted_position - current_position)

	if not blackboard.thrown_weapon_direction then
		blackboard.thrown_weapon_direction = Vector3Box(direction)
		blackboard.thrown_weapon_angle = 1
	end

	local thrown_state = blackboard.thrown_state

	if thrown_state == "lingering" then
		if blackboard.thrown_linger_timer < t then
			blackboard.thrown_state = "returning_to_owner"
			local audio_system = Managers.state.entity:system("audio_system")

			audio_system.play_audio_unit_event(audio_system, action.pull_sound_id, blackboard.thrown_unit)
		end
	elseif distance_to_goal < 1.5 then
		if thrown_state == "returning_to_owner" then
			return true
		end

		local position = current_position + direction*speed*dt

		Unit.set_local_position(thrown_unit, 0, position)
		blackboard.throw_weapon_goal_position:store(unit_position)

		blackboard.thrown_state = "lingering"
		blackboard.thrown_linger_timer = t + 1
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system.play_audio_unit_event(audio_system, action.impact_sound_id, blackboard.thrown_unit)
	else
		local position = current_position + direction*speed*dt

		Unit.set_local_position(thrown_unit, 0, position)
	end

	if thrown_state == "moving_towards_target" then
		blackboard.thrown_weapon_angle = blackboard.thrown_weapon_angle + dt*action.rotation_speed
		local current_rotation = Unit.local_rotation(thrown_unit, 0)
		local axis = Vector3.make_axes(direction)
		local rotation_towards_target = Quaternion.look(direction)
		local rotation = Quaternion.multiply(Quaternion.axis_angle(axis, blackboard.thrown_weapon_angle), rotation_towards_target)

		Unit.set_local_rotation(thrown_unit, 0, rotation)
	else
		local axis = Vector3.make_axes(-direction)
		local rotation_towards_target = Quaternion.look(-direction)
		local rotation = Quaternion.multiply(Quaternion.axis_angle(axis, 45), rotation_towards_target)

		Unit.set_local_rotation(thrown_unit, 0, rotation)
	end

	local network_manager = Managers.state.network
	local go_id = network_manager.unit_game_object_id(network_manager, thrown_unit)
	local game = network_manager.game(network_manager)
	local pos = Unit.local_position(thrown_unit, 0)

	GameSession.set_game_object_field(game, go_id, "position", pos)

	local rot = Unit.local_rotation(thrown_unit, 0)

	GameSession.set_game_object_field(game, go_id, "rotation", rot)

	for i = 1, #player_and_bot_units, 1 do
		local target_unit = player_and_bot_units[i]

		self.check_overlap(self, action, blackboard.thrown_unit, unit, blackboard, target_unit)

		if action.close_attack_animation and blackboard.close_attack_timer < t then
			self.attack_close_units(self, action, unit, blackboard, target_unit, t)
		end
	end

	return false
end
BTThrowWeaponAction.check_overlap = function (self, action, thrown_unit, unit, blackboard, target_unit)
	local radius = action.radius
	local push_speed = action.push_speed
	local push_speed_z = action.push_speed_z
	local hit_units = blackboard.hit_units
	local pos = POSITION_LOOKUP[target_unit]
	local self_pos = Vector3.flat(Unit.local_position(thrown_unit, 0))
	self_pos = Vector3(self_pos[1], self_pos[2], pos[3])
	local to_target = pos - self_pos
	local dist = Vector3.length(Vector3.flat(to_target))
	local hit_unit_id = hit_units[target_unit]

	if not hit_unit_id and dist < radius then
		local velocity = push_speed*Vector3.normalize(to_target)

		if push_speed_z then
			Vector3.set_z(velocity, push_speed_z)
		end

		if action.catapult_players then
			StatusUtils.set_catapulted_network(target_unit, true, velocity)
		else
			local locomotion_extension = ScriptUnit.extension(target_unit, "locomotion_system")

			locomotion_extension.add_external_velocity(locomotion_extension, velocity)
		end

		hit_units[target_unit] = true
		local blocked = DamageUtils.check_block(unit, target_unit, action.fatigue_type)

		if not blocked then
			AiUtils.damage_target(target_unit, unit, action, action.damage)
		end
	end

	return 
end
BTThrowWeaponAction.attack_close_units = function (self, action, unit, blackboard, target_unit, t)
	local attack_range = action.attack_close_range
	local pos = POSITION_LOOKUP[target_unit]
	local self_pos = Vector3.flat(Unit.local_position(unit, 0))
	local to_target = pos - self_pos
	local dist = Vector3.length(Vector3.flat(to_target))

	if dist < attack_range then
		Managers.state.network:anim_event(unit, action.close_attack_animation)

		blackboard.close_attack_timer = t + 3
		blackboard.close_attack_target = target_unit
	end

	return 
end
BTThrowWeaponAction.anim_cb_damage = function (self, unit, blackboard)
	if not Unit.alive(blackboard.close_attack_target) then
		return 
	end

	local pos = POSITION_LOOKUP[blackboard.close_attack_target]
	local self_pos = Vector3.flat(Unit.local_position(unit, 0))
	local to_target = pos - self_pos
	local velocity = Vector3.normalize(to_target)*10
	local locomotion_extension = ScriptUnit.extension(blackboard.close_attack_target, "locomotion_system")

	locomotion_extension.add_external_velocity(locomotion_extension, velocity)
	AiUtils.damage_target(blackboard.close_attack_target, unit, blackboard.action, blackboard.action.close_attack_damage)

	return 
end

return 
