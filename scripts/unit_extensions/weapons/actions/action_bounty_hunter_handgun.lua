ActionBountyHunterHandgun = class(ActionBountyHunterHandgun, ActionBase)

ActionBountyHunterHandgun.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionBountyHunterHandgun.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
end

ActionBountyHunterHandgun.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionBountyHunterHandgun.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
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
	self.shield_users_blocking = {}
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, nil, "on_critical_shot", nil)

	self.is_critical_strike = is_critical_strike

	if new_action.block then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_blocking(true)
	end
end

ActionBountyHunterHandgun.client_owner_post_update = function (self, dt, t, world, can_damage, time_in_action)
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
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local add_spread = true

	if not Managers.player:owner(self.owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "handgun_fire"
		})
	end

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local position, rotation = first_person_extension:get_projectile_start_position_rotation()
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
	local target_vector = Vector3.normalize(Vector3.flat(Quaternion.forward(rotation)))
	local lookup_data = current_action.lookup_data

	ActionUtils.spawn_player_projectile(owner_unit, position, rotation, 0, angle, target_vector, speed, self.item_name, lookup_data.item_template_name, lookup_data.action_name, lookup_data.sub_action_name, self.is_critical_strike, self.power_level)
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
	local current_position, current_rotation = first_person_extension:get_projectile_start_position_rotation()
	local num_shots = current_action.shot_count or 1
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local damage_bonus = 0

	if buff_extension:has_buff_type("victor_bounty_blast_streak_buff") then
		damage_bonus = buff_extension:num_buff_type("victor_bounty_blast_streak_buff")
		num_shots = num_shots + damage_bonus
	end

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

	for i = 1, actors_n, 1 do
		repeat
			local hit_actor = actors[i]
			local hit_unit = Actor.unit(hit_actor)
			local breed = AiUtils.unit_breed(hit_unit)

			if breed and not hit_units[hit_unit] and not breed.is_player then
				hit_units[hit_unit] = true
				local node = Actor.node(hit_actor)
				local target_hit_position = Unit.world_position(hit_unit, node)
				local attack_direction = Vector3.normalize(target_hit_position - attack_pos)
				local hit_zone = breed.hit_zones_lookup[node]
				local hit_zone_name = hit_zone.name
				local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
				local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
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

				weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, target_hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", can_damage, "can_stagger", can_stagger)
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
