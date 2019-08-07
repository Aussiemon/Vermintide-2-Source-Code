require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTThrowPoisonGlobeAction = class(BTThrowPoisonGlobeAction, BTNode)

BTThrowPoisonGlobeAction.init = function (self, ...)
	BTThrowPoisonGlobeAction.super.init(self, ...)
end

BTThrowPoisonGlobeAction.name = "BTThrowPoisonGlobeAction"

BTThrowPoisonGlobeAction.enter = function (self, unit, blackboard, t)
	local ai_navigation = blackboard.navigation_extension

	ai_navigation:set_enabled(false)

	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.anim_cb_spawn_projectile = false
	blackboard.anim_cb_throw = false
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")

	locomotion:set_rotation_speed(5)
	locomotion:set_wanted_velocity(Vector3.zero())
end

BTThrowPoisonGlobeAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if blackboard.dummy_projectile_unit ~= nil then
		if Unit.alive(blackboard.dummy_projectile_unit) then
			local world = blackboard.world

			World.unlink_unit(world, blackboard.dummy_projectile_unit)
			Managers.state.unit_spawner:mark_for_deletion(blackboard.dummy_projectile_unit)
		end

		blackboard.dummy_projectile_unit = nil
	end

	blackboard.action = nil
	local old_throw_target = blackboard.throw_target

	if old_throw_target then
		Managers.state.entity:system("ai_bot_group_system"):ranged_attack_ended(unit, old_throw_target, "poison_wind_globe")

		blackboard.throw_target = nil
	end

	blackboard.navigation_extension:set_enabled(true)
end

BTThrowPoisonGlobeAction.run = function (self, unit, blackboard, t, dt)
	if not Unit.alive(blackboard.target_unit) then
		blackboard.target_unit = nil

		return "failed"
	end

	local action = blackboard.action
	local world = blackboard.world

	if blackboard.anim_cb_spawn_projectile then
		blackboard.anim_cb_spawn_projectile = false

		self:spawn_dummy_projectile(unit, blackboard, world, action)
	elseif blackboard.anim_cb_throw then
		blackboard.anim_cb_throw = false

		World.unlink_unit(world, blackboard.dummy_projectile_unit)
		Managers.state.unit_spawner:mark_for_deletion(blackboard.dummy_projectile_unit)

		blackboard.dummy_projectile_unit = nil
		local throw_pos = blackboard.throw_globe_data.throw_pos:unbox()
		local target_dir = blackboard.throw_globe_data.target_direction:unbox()
		local angle = blackboard.throw_globe_data.angle
		local speed = blackboard.throw_globe_data.speed

		self:launch_projectile(blackboard, action, throw_pos, target_dir, angle, speed, unit)
		Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.pounced_down_broadcast_range, "attack_tag", "pwg_projectile")

		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.attack_tag = "pwg_projectile"
		event_data.distance = math.floor(Vector3.distance(throw_pos, POSITION_LOOKUP[unit]))

		dialogue_input:trigger_networked_dialogue_event("enemy_attack", event_data)
	end

	if blackboard.start_anim_locked_time and blackboard.start_anim_locked_time < t then
		LocomotionUtils.set_animation_driven_movement(unit, false)

		blackboard.start_anim_locked_time = nil
	end

	local locomotion = ScriptUnit.extension(unit, "locomotion_system")

	if blackboard.anim_locked and t < blackboard.anim_locked then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

		locomotion:set_wanted_rotation(rot)
	elseif blackboard.move_state == "throwing" then
		return "done"
	else
		self:attack_throw(unit, t, dt, blackboard, locomotion, action)
	end

	return "running"
end

BTThrowPoisonGlobeAction.attack_throw = function (self, unit, t, dt, blackboard, locomotion, action)
	if blackboard.move_state ~= "throwing" then
		local target_unit = blackboard.target_unit

		Managers.state.network:anim_event(unit, action.attack_anim)

		blackboard.anim_locked = t + action.attack_time
		blackboard.move_state = "throwing"
		blackboard.times_thrown = (blackboard.times_thrown and (blackboard.times_thrown + 1) % (action.barrage_count or 2)) or 1
		local action = blackboard.action
		local throw_globe_data = blackboard.throw_globe_data
		throw_globe_data.next_throw_at = t + ((blackboard.times_thrown == 0 and action.time_between_throws[1]) or action.time_between_throws[2])
		throw_globe_data.last_throw_at = t
		local attack_type = "poison_wind_globe"
		local old_throw_target = blackboard.throw_target

		if old_throw_target then
			Managers.state.entity:system("ai_bot_group_system"):ranged_attack_ended(unit, old_throw_target, attack_type)
		end

		blackboard.throw_target = target_unit

		Managers.state.entity:system("ai_bot_group_system"):ranged_attack_started(unit, target_unit, attack_type)
	end

	local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.throw_target)

	locomotion:set_wanted_rotation(rot)
end

BTThrowPoisonGlobeAction.spawn_dummy_projectile = function (self, unit, blackboard, world, action)
	local throw_hand_name = action.weapon_node_name
	local throw_hand_node = Unit.node(unit, throw_hand_name)
	local hand_position = Unit.world_position(unit, throw_hand_node)
	local projectile_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, "prop_unit", nil, hand_position)

	World.link_unit(world, projectile_unit, 0, unit, throw_hand_node)

	local network_manager = Managers.state.network
	local child_unit_id = network_manager:unit_game_object_id(projectile_unit)
	local parent_unit_id = network_manager:unit_game_object_id(unit)

	network_manager.network_transmit:send_rpc_clients("rpc_link_unit", child_unit_id, 0, parent_unit_id, throw_hand_node)

	blackboard.dummy_projectile_unit = projectile_unit
end

BTThrowPoisonGlobeAction.launch_projectile = function (self, blackboard, action, initial_position, target_vector, angle, speed, owner_unit)
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local aoe_dot_damage_table = action.aoe_dot_damage[difficulty_rank]
	local aoe_dot_damage = DamageUtils.calculate_damage(aoe_dot_damage_table)
	local aoe_init_damage_table = action.aoe_init_damage[difficulty_rank]
	local aoe_init_damage = DamageUtils.calculate_damage(aoe_init_damage_table)
	local aoe_dot_damage_interval = action.aoe_dot_damage_interval
	local radius = action.radius
	local initial_radius = action.initial_radius or radius
	local duration = action.duration
	local damage_source = blackboard.breed.name
	local create_nav_tag_volume = action.create_nav_tag_volume
	local instant_explosion = false

	Managers.state.entity:system("projectile_system"):spawn_globadier_globe(initial_position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit, damage_source, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)

	blackboard.has_thrown_first_globe = true
end

return
