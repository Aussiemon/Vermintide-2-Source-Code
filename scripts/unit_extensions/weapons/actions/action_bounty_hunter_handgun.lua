ActionBountyHunterHandgun = class(ActionBountyHunterHandgun)

ActionBountyHunterHandgun.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.weapon_system = weapon_system
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.world = world
	self.item_name = item_name
	self.wwise_world = Managers.world:wwise_world(world)
	self.is_server = is_server
	self.is_critical_strike = false
end

ActionBountyHunterHandgun.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.current_action = new_action
	self.power_level = power_level
	self.owner_buff_extension = buff_extension
	self.upper_shoot_function = (action_init_data and ((action_init_data.upper_barrel == "railgun" and self._railgun_shoot) or self._shotgun_shoot)) or self._railgun_shoot
	self.lower_shoot_function = (action_init_data and ((action_init_data.lower_barrel == "railgun" and self._railgun_shoot) or self._shotgun_shoot)) or self._shotgun_shoot

	Unit.set_flow_variable(weapon_unit, "upper_is_railgun", action_init_data.upper_barrel == "railgun")
	Unit.set_flow_variable(weapon_unit, "lower_is_railgun", action_init_data.lower_barrel == "railgun")

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "light_swing"
		})
	end

	if ScriptUnit.has_extension(weapon_unit, "spread_system") then
		self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	end

	local damage_profile_name = new_action.damage_profile or "default"
	self.damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	self.damage_profile = DamageProfileTemplates[damage_profile_name]
	local damage_profile_name_aoe = new_action.damage_profile_aoe or "default"
	self.damage_profile_aoe_id = NetworkLookup.damage_profiles[damage_profile_name_aoe]
	self.damage_profile_aoe = DamageProfileTemplates[damage_profile_name_aoe]
	self.upper_shot_done = nil
	self.lower_shot_done = nil
	self.aoe_done = nil
	self.time_to_shoot_upper = t + new_action.fire_time_upper
	self.time_to_shoot_lower = t + new_action.fire_time_lower
	self.time_to_aoe = t + new_action.aoe_time
	self.hit_units = {}
	self.target_hit_zones_names = {}
	self.target_hit_unit_positions = {}
	self.shield_users_blocking = {}

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end
	end

	self.is_critical_strike = is_critical_strike

	if new_action.block then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_blocking(true)
	end
end

ActionBountyHunterHandgun.client_owner_post_update = function (self, dt, t, world, can_damage)
	if not self.upper_shot_done and self.time_to_shoot_upper <= t then
		self:upper_shoot_function()

		self.upper_shot_done = true
	end

	if not self.lower_shot_done and self.time_to_shoot_lower <= t then
		self:lower_shoot_function()

		self.lower_shot_done = true
	end

	if not self.aoe_done and self.time_to_aoe <= t then
		self:_do_aoe()

		self.aoe_done = true
	end
end

ActionBountyHunterHandgun._railgun_shoot = function (self)
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local add_spread = true

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "handgun_fire"
		})
	end

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local rotation = first_person_extension:current_rotation()
	local spread_extension = self.spread_extension
	local spread_template_override = current_action.railgun_spread_template

	if spread_extension then
		if spread_template_override then
			spread_extension:override_spread_template(spread_template_override)
		end

		rotation = spread_extension:get_randomised_spread(rotation)

		if add_spread then
			spread_extension:set_shooting()
		end
	end

	local angle = ActionUtils.pitch_from_rotation(rotation)
	local speed = current_action.speed
	local position = first_person_extension:current_position()
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local lookup_data = current_action.lookup_data

	ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self.is_critical_strike, self.power_level)

	local fire_sound_event = self.current_action.railgun_fire_sound_event

	if fire_sound_event then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event(fire_sound_event)
	end

	first_person_extension:reset_aim_assist_multiplier()
end

ActionBountyHunterHandgun._shotgun_shoot = function (self)
	local world = self.world
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local spread_extension = self.spread_extension
	local is_server = self.is_server
	local spread_template_override = current_action.shotgun_spread_template

	if spread_template_override then
		self.spread_extension:override_spread_template(spread_template_override)
	end

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local current_position = first_person_extension:current_position()
	local current_rotation = first_person_extension:current_rotation()
	local num_shots = current_action.shot_count or 1

	if not Managers.player:owner(owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "handgun_fire"
		})
	end

	local physics_world = World.get_data(world, "physics_world")
	local check_buffs = true
	local weapon_unit = self.weapon_unit

	for i = 1, num_shots, 1 do
		local rotation = current_rotation

		if spread_extension then
			rotation = spread_extension:get_target_style_spread(i, num_shots, current_rotation)
		end

		local direction = Quaternion.forward(rotation)
		local collision_filter = "filter_player_ray_projectile"
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, current_position, direction, current_action.range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")

		if result then
			local data = DamageUtils.process_projectile_hit(world, self.item_name, owner_unit, is_server, result, current_action, direction, check_buffs, nil, self.shield_users_blocking, self.is_critical_strike, self.power_level)

			if data.buffs_checked then
				check_buffs = check_buffs and false
			end

			if data.blocked_by_unit then
				self.shield_users_blocking[data.blocked_by_unit] = true
			end
		end

		local hit_position = (result and result[#result][1]) or current_position + direction * current_action.range

		Unit.set_flow_variable(weapon_unit, "hit_position", hit_position)
		Unit.set_flow_variable(weapon_unit, "trail_life", Vector3.length(hit_position - current_position) * 0.1)
		Unit.flow_event(weapon_unit, "lua_bullet_trail")
		Unit.flow_event(weapon_unit, "lua_bullet_trail_set")
	end

	local add_spread = not self.extra_buff_shot

	if spread_extension and add_spread then
		spread_extension:set_shooting()
	end

	if current_action.alert_sound_range_fire then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
	end

	local fire_sound_event = self.current_action.shotgun_fire_sound_event

	if fire_sound_event then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event(fire_sound_event)
	end
end

ActionBountyHunterHandgun._do_aoe = function (self)
	local world = self.world
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local network_manager = Managers.state.network
	local physics_world = World.get_data(world, "physics_world")
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local unit_forward = Quaternion.forward(Unit.local_rotation(owner_unit, 0))
	local self_pos = POSITION_LOOKUP[owner_unit]
	local attack_pos = self_pos + unit_forward * 0.5
	local radius = current_action.aoe_radius
	local collision_filter = "filter_melee_sweep"
	local actors, actors_n = PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "position", attack_pos, "size", radius, "types", "dynamics", "collision_filter", collision_filter, "use_global_table")
	local hit_units = self.hit_units
	local unit_get_data = Unit.get_data
	local target_hit_actor = nil
	local target_breed_unit = self.target_breed_unit
	local target_breed_unit_health_extension = Unit.alive(target_breed_unit) and ScriptUnit.extension(target_breed_unit, "health_system")

	if target_breed_unit_health_extension then
		if not target_breed_unit_health_extension:is_alive() then
			target_breed_unit = nil
		end
	else
		target_breed_unit = nil
	end

	for i = 1, actors_n, 1 do
		repeat
			local hit_actor = actors[i]
			local hit_unit = Actor.unit(hit_actor)
			local breed = unit_get_data(hit_unit, "breed")

			if breed and not hit_units[hit_unit] then
				hit_units[hit_unit] = true
				local node = Actor.node(hit_actor)
				local hit_zone = breed.hit_zones_lookup[node]
				local target_hit_zone_name = hit_zone.name
				local target_hit_position = Unit.world_position(hit_unit, node)
				self.target_hit_zones_names[hit_unit] = target_hit_zone_name
				self.target_hit_unit_positions[hit_unit] = target_hit_position
				local attack_direction = Vector3.normalize(POSITION_LOOKUP[hit_unit] - attack_pos)
				local node = Actor.node(hit_actor)
				local hit_zone = breed.hit_zones_lookup[node]
				local hit_zone_name = hit_zone.name
				local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
				local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
				local power_level = self.power_level
				local damage_profile_id = self.damage_profile_aoe_id
				local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
				local damage_source = self.item_name
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local weapon_system = self.weapon_system
				local ranged_boost_curve_multiplier = 1
				local is_critical_strike = self.is_critical_strike
				local can_damage = false
				local can_stagger = true
				local target_index = nil

				weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", can_damage, "can_stagger", can_stagger)
			end
		until true
	end
end

ActionBountyHunterHandgun.finish = function (self, reason)
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if reason ~= "new_interupting_action" then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)
	end

	if current_action.block then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_blocking(false)
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

return
