require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTThrowPoisonGlobeAction = class(BTThrowPoisonGlobeAction, BTNode)
BTThrowPoisonGlobeAction.init = function (self, ...)
	BTThrowPoisonGlobeAction.super.init(self, ...)

	return 
end
BTThrowPoisonGlobeAction.name = "BTThrowPoisonGlobeAction"
BTThrowPoisonGlobeAction.enter = function (self, unit, blackboard, t)
	local ai_navigation = blackboard.navigation_extension

	ai_navigation.set_enabled(ai_navigation, false)

	local action = self._tree_node.action_data
	blackboard.action = action
	blackboard.anim_cb_spawn_projectile = false
	blackboard.anim_cb_throw = false
	local locomotion = ScriptUnit.extension(unit, "locomotion_system")

	locomotion.set_rotation_speed(locomotion, 5)
	locomotion.set_wanted_velocity(locomotion, Vector3.zero())

	return 
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

	return 
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

		self.spawn_dummy_projectile(self, unit, blackboard, world, action)
	elseif blackboard.anim_cb_throw then
		blackboard.anim_cb_throw = false

		World.unlink_unit(world, blackboard.dummy_projectile_unit)
		Managers.state.unit_spawner:mark_for_deletion(blackboard.dummy_projectile_unit)

		blackboard.dummy_projectile_unit = nil
		local throw_pos = blackboard.throw_globe_data.throw_pos:unbox()
		local target_dir = blackboard.throw_globe_data.target_direction:unbox()
		local angle = blackboard.throw_globe_data.angle
		local speed = blackboard.throw_globe_data.speed

		self.launch_projectile(self, blackboard, action, throw_pos, target_dir, angle, speed, unit)
		Managers.state.entity:system("surrounding_aware_system"):add_system_event(unit, "enemy_attack", DialogueSettings.pounced_down_broadcast_range, "attack_tag", "pwg_projectile")

		local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()
		event_data.attack_tag = "pwg_projectile"
		event_data.distance = math.floor(Vector3.distance(throw_pos, POSITION_LOOKUP[unit]))

		dialogue_input.trigger_networked_dialogue_event(dialogue_input, "enemy_attack", event_data)
	end

	if blackboard.start_anim_locked_time and blackboard.start_anim_locked_time < t then
		LocomotionUtils.set_animation_driven_movement(unit, false)

		blackboard.start_anim_locked_time = nil
	end

	local locomotion = ScriptUnit.extension(unit, "locomotion_system")

	if blackboard.anim_locked and t < blackboard.anim_locked then
		local rot = LocomotionUtils.rotation_towards_unit_flat(unit, blackboard.target_unit)

		locomotion.set_wanted_rotation(locomotion, rot)
	elseif blackboard.move_state == "throwing" then
		return "done"
	else
		self.attack_throw(self, unit, t, dt, blackboard, locomotion, action)
	end

	return "running"
end
BTThrowPoisonGlobeAction.attack_throw = function (self, unit, t, dt, blackboard, locomotion, action)
	if blackboard.move_state ~= "throwing" then
		local target_unit = blackboard.target_unit

		Managers.state.network:anim_event(unit, "to_combat")
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

	locomotion.set_wanted_rotation(locomotion, rot)

	return 
end
BTThrowPoisonGlobeAction.spawn_dummy_projectile = function (self, unit, blackboard, world, action)
	local throw_hand_name = action.weapon_node_name
	local throw_hand_node = Unit.node(unit, throw_hand_name)
	local hand_position = Unit.world_position(unit, throw_hand_node)
	local projectile_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, "prop_unit", nil, hand_position)

	World.link_unit(world, projectile_unit, 0, unit, throw_hand_node)

	local network_manager = Managers.state.network
	local child_unit_id = network_manager.unit_game_object_id(network_manager, projectile_unit)
	local parent_unit_id = network_manager.unit_game_object_id(network_manager, unit)

	network_manager.network_transmit:send_rpc_clients("rpc_link_unit", child_unit_id, 0, parent_unit_id, throw_hand_node)

	blackboard.dummy_projectile_unit = projectile_unit

	return 
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
	local nav_tag_volume_layer = action.nav_tag_volume_layer
	local extension_init_data = {
		projectile_locomotion_system = {
			trajectory_template_name = "throw_trajectory",
			angle = angle,
			speed = speed,
			target_vector = target_vector,
			initial_position = initial_position
		},
		projectile_impact_system = {
			server_side_raycast = true,
			collision_filter = "filter_enemy_ray_projectile",
			owner_unit = owner_unit
		},
		projectile_system = {
			impact_template_name = "explosion_impact",
			damage_source = damage_source,
			owner_unit = owner_unit
		},
		area_damage_system = {
			invisible_unit = false,
			player_screen_effect_name = "fx/screenspace_poison_globe_impact",
			area_ai_random_death_template = "area_poison_ai_random_death",
			dot_effect_name = "fx/wpnfx_poison_wind_globe_impact",
			area_damage_template = "area_dot_damage",
			damage_players = true,
			aoe_dot_damage = aoe_dot_damage,
			aoe_init_damage = aoe_init_damage,
			aoe_dot_damage_interval = aoe_dot_damage_interval,
			radius = radius,
			initial_radius = initial_radius,
			life_time = duration,
			damage_source = damage_source,
			create_nav_tag_volume = create_nav_tag_volume,
			nav_tag_volume_layer = nav_tag_volume_layer
		}
	}
	local projectile_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, "aoe_projectile_unit", extension_init_data, initial_position)

	return 
end

return 
