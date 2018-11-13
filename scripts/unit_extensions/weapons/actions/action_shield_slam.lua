ActionShieldSlam = class(ActionShieldSlam)

ActionShieldSlam.init = function (self, world, item_name, is_server, owner_unit, weapon_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.owner_unit_first_person = first_person_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.weapon_system = weapon_system
	self.item_name = item_name
	self.wwise_world = Managers.world:wwise_world(world)
	self.world = world
	self._is_critical_strike = false

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.hit_units = {}
	self.inner_hit_units = {}
	self.target_hit_zones_names = {}
	self.target_hit_unit_positions = {}
end

ActionShieldSlam.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	self.current_action = new_action
	self.target_breed_unit = nil
	local owner_unit = self.owner_unit
	local first_person_unit = self.owner_unit_first_person
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local career_extension = ScriptUnit.extension(owner_unit, "career_system")
	local has_melee_boost, melee_boost_curve_multiplier = career_extension:has_melee_boost()
	self.melee_boost_curve_multiplier = melee_boost_curve_multiplier
	self.owner_career_extension = career_extension
	self.owner_buff_extension = buff_extension
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	self.power_level = power_level

	if not Managers.player:owner(owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "light_swing"
		})
	end

	local action_hand = action_init_data and action_init_data.action_hand
	local damage_profile_name = (action_hand and new_action["damage_profile_" .. action_hand]) or new_action.damage_profile or "default"
	self.damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	self.damage_profile = DamageProfileTemplates[damage_profile_name]
	local damage_profile_name_aoe = (action_hand and new_action["damage_profile_aoe_" .. action_hand]) or new_action.damage_profile_aoe or "default"
	self.damage_profile_aoe_id = NetworkLookup.damage_profiles[damage_profile_name_aoe]
	self.damage_profile_aoe = DamageProfileTemplates[damage_profile_name_aoe]
	local damage_profile_name = (action_hand and new_action["damage_profile_default_target" .. action_hand]) or new_action.damage_profile_default_target or "default"
	self.damage_profile_default_target_id = NetworkLookup.damage_profiles[damage_profile_name]
	self.damage_profile_default_target = DamageProfileTemplates[damage_profile_name]
	local ammo_extension = self.ammo_extension

	if ammo_extension and ammo_extension:is_reloading() then
		ammo_extension:abort_reload()
	end

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end

		buff_extension:trigger_procs("on_critical_sweep")

		local crit_hud_sound_event = "Play_player_combat_crit_swing_2D"
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event(crit_hud_sound_event, nil, false)
	end

	self._is_critical_strike = is_critical_strike

	Unit.flow_event(first_person_unit, "sfx_swing_started")

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local physics_world = World.get_data(self.world, "physics_world")
	local pos = first_person_extension:current_position()
	local rot = first_person_extension:current_rotation()
	local direction = Quaternion.forward(rot)
	local collision_filter = "filter_player_ray_projectile_no_player"
	local result, hit_position, _, _, actor = PhysicsWorld.immediate_raycast(physics_world, pos, direction, new_action.dedicated_target_range, "closest", "collision_filter", collision_filter)

	if result then
		local hit_unit = Actor.unit(actor)
		local breed = Unit.get_data(hit_unit, "breed")

		if breed then
			self.target_breed_unit = hit_unit
		end
	end

	self.state = "waiting_to_hit"
	local anim_time_scale = ActionUtils.apply_attack_speed_buff(new_action.anim_time_scale or 1, owner_unit)
	self.time_to_hit = t + (new_action.hit_time or 0) / anim_time_scale

	table.clear(self.hit_units)
	table.clear(self.inner_hit_units)
	table.clear(self.target_hit_zones_names)
	table.clear(self.target_hit_unit_positions)

	local current_action = self.current_action
	local overcharge_type = current_action.overcharge_type

	if overcharge_type then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)
	end
end

ActionShieldSlam.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if self.state == "waiting_to_hit" and self.time_to_hit <= t then
		self.state = "hitting"
	end

	if self.state == "hitting" then
		self:_hit(world, can_damage, owner_unit, current_action)

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "hit_character_light"
			})
		end
	end
end

ActionShieldSlam._hit = function (self, world, can_damage, owner_unit, current_action)
	local network_manager = Managers.state.network
	local physics_world = World.get_data(world, "physics_world")
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local buff_extension = self.owner_buff_extension
	local first_person_unit = self.owner_unit_first_person
	local unit_forward = Quaternion.forward(Unit.local_rotation(first_person_unit, 0))
	local self_pos = POSITION_LOOKUP[owner_unit]
	local forward_offset = 0.5
	local attack_pos = self_pos + unit_forward * forward_offset + Vector3(0, 0, 1)
	local radius = current_action.push_radius
	local collision_filter = "filter_melee_sweep"
	local actors, actors_n = PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "position", attack_pos, "size", radius, "types", "dynamics", "collision_filter", collision_filter, "use_global_table")
	local inner_actors, inner_actors_n = nil
	local inner_forward_offset = 1
	local inner_attack_pos = self_pos + unit_forward * inner_forward_offset + Vector3(0, 0, 1)
	local inner_radius = current_action.inner_push_radius or radius * 0.75
	local inner_radius_sq = inner_radius * inner_radius
	local inner_hit_units = self.inner_hit_units
	local hit_units = self.hit_units
	local unit_get_data = Unit.get_data
	local hit_once = false
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
			local dummy = not breed and unit_get_data(hit_unit, "is_dummy")
			local hit_self = hit_unit == owner_unit
			local target_is_player = table.contains(PLAYER_AND_BOT_UNITS, hit_unit)

			if not target_is_player and (breed or dummy) and not hit_units[hit_unit] then
				hit_units[hit_unit] = true

				if hit_unit == target_breed_unit then
					print("hit_unit == target_breed_unit", hit_actor)

					target_hit_actor = "c_spine"
				elseif not target_breed_unit then
					local health_extension = ScriptUnit.extension(hit_unit, "health_system")

					if health_extension:is_alive() then
						target_breed_unit = hit_unit
						target_hit_actor = "c_spine"
					end
				else
					local node = Actor.node(hit_actor)
					local hit_zone = breed and breed.hit_zones_lookup[node]
					local target_hit_zone_name = (hit_zone and hit_zone.name) or "torso"
					local target_hit_position = Unit.world_position(hit_unit, node)
					self.target_hit_zones_names[hit_unit] = target_hit_zone_name
					self.target_hit_unit_positions[hit_unit] = target_hit_position
					local attack_direction = Vector3.normalize(POSITION_LOOKUP[hit_unit] - self_pos)
					local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
					local hit_zone_id = NetworkLookup.hit_zones[target_hit_zone_name]

					if self:_is_infront_player(self_pos, unit_forward, target_hit_position) then
						local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
						local damage_source = self.item_name
						local damage_source_id = NetworkLookup.damage_sources[damage_source]
						local weapon_system = self.weapon_system
						local power_level = self.power_level
						local is_server = self.is_server
						local damage_profile = self.damage_profile_aoe
						local target_index = 1
						local is_critical_strike = self._is_critical_strike

						if not dummy then
							ActionSweep._play_character_impact(self, is_server, owner_unit, hit_unit, breed, target_hit_position, target_hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, is_critical_strike)
						end

						local charge_value = self.damage_profile.charge_value or "heavy_attack"
						local num_hit_targets = 1
						local send_to_server = true

						DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, target_hit_zone_name, num_hit_targets, send_to_server)
						weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, target_hit_position, attack_direction, self.damage_profile_aoe_id, "power_level", power_level, "hit_target_index", nil, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true)
					end

					local distance_to_inner_position_sq = Vector3.distance_squared(target_hit_position, inner_attack_pos)

					if distance_to_inner_position_sq <= inner_radius_sq then
						inner_hit_units[hit_unit] = true
					end
				end
			elseif not target_is_player and not hit_units[hit_unit] and not hit_self and ScriptUnit.has_extension(hit_unit, "health_system") then
				local hit_unit_id, is_level_unit = Managers.state.network:game_object_or_level_id(hit_unit)

				if is_level_unit then
					hit_units[hit_unit] = true
					local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

					if not no_player_damage then
						local hit_zone_name = "full"
						local target_index = 1
						local damage_profile = self.damage_profile_aoe
						local damage_source = self.item_name
						local power_level = self.power_level
						local is_critical_strike = self._is_critical_strike
						local target_hit_position = Unit.world_position(hit_unit, 0)
						local attack_direction = Vector3.normalize(target_hit_position - self_pos)

						DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, self.melee_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)

						local distance_to_inner_position_sq = Vector3.distance_squared(target_hit_position, inner_attack_pos)

						if distance_to_inner_position_sq <= inner_radius_sq then
							inner_hit_units[hit_unit] = true
						end
					end
				else
					hit_units[hit_unit] = true
					local damage_source = self.item_name
					local damage_source_id = NetworkLookup.damage_sources[damage_source]
					local weapon_system = self.weapon_system
					local power_level = self.power_level
					local hit_zone_id = NetworkLookup.hit_zones.full
					local target_hit_position = Unit.world_position(hit_unit, 0)
					local attack_direction = Vector3.normalize(target_hit_position - self_pos)

					weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, target_hit_position, attack_direction, self.damage_profile_aoe_id, "power_level", power_level, "hit_target_index", nil, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true)

					local distance_to_inner_position_sq = Vector3.distance_squared(target_hit_position, inner_attack_pos)

					if distance_to_inner_position_sq <= inner_radius_sq then
						inner_hit_units[hit_unit] = true
					end
				end
			end
		until true
	end

	if Unit.alive(target_breed_unit) and not self.hit_target_breed_unit then
		inner_hit_units[target_breed_unit] = true
	end

	for hit_unit, _ in pairs(inner_hit_units) do
		local network_manager = Managers.state.network
		local breed = unit_get_data(hit_unit, "breed")
		local dummy = not breed and unit_get_data(hit_unit, "is_dummy")
		local hit_zone_name = self.target_hit_zones_names[hit_unit] or "torso"
		local target_position = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
		local target_hit_position = self.target_hit_unit_positions[hit_unit]
		local attack_direction = Vector3.normalize(target_position - POSITION_LOOKUP[owner_unit])
		local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
		local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]

		if (breed or dummy) and self:_is_infront_player(self_pos, unit_forward, target_position, current_action.push_dot) then
			local is_server = self.is_server
			local hit_position = target_hit_position or target_position
			local hit_default_target = hit_unit == target_breed_unit
			local damage_profile = (hit_default_target and self.damage_profile_default_target) or self.damage_profile
			local damage_profile_id = (hit_default_target and self.damage_profile_default_target_id) or self.damage_profile_id
			local target_index = 1
			local power_level = self.power_level
			local is_critical_strike = self._is_critical_strike
			local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
			local actor = Unit.find_actor(hit_unit, "c_spine") and Unit.actor(hit_unit, "c_spine")
			local actor_position_hit = actor and Actor.center_of_mass(actor)

			if not dummy and actor_position_hit then
				ActionSweep._play_character_impact(self, is_server, owner_unit, hit_unit, breed, actor_position_hit, hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, is_critical_strike)
			end

			local send_to_server = true
			local charge_value = damage_profile.charge_value or "heavy_attack"
			local num_hit_targets = 1

			DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, num_hit_targets, send_to_server)

			local damage_source_id = NetworkLookup.damage_sources[self.item_name]
			local weapon_system = self.weapon_system

			weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", true, "can_stagger", true)

			if self.is_critical_strike and self.critical_strike_particle_id then
				World.destroy_particles(self.world, self.critical_strike_particle_id)

				self.critical_strike_particle_id = nil
			end

			if not Managers.player:owner(self.owner_unit).bot_player then
				Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "handgun_fire"
				})
			end

			self.hit_target_breed_unit = true
		elseif ScriptUnit.has_extension(hit_unit, "health_system") then
			local hit_unit_id, is_level_unit = Managers.state.network:game_object_or_level_id(hit_unit)

			if is_level_unit then
				local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

				if not no_player_damage then
					local hit_zone_name = "full"
					local target_index = 1
					local damage_profile = self.damage_profile
					local damage_source = self.item_name
					local power_level = self.power_level
					local is_critical_strike = self._is_critical_strike
					local target_hit_position = Unit.world_position(hit_unit, 0)
					local attack_direction = Vector3.normalize(target_hit_position - self_pos)

					DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, self.melee_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)
				end
			else
				local damage_source = self.item_name
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local weapon_system = self.weapon_system
				local power_level = self.power_level
				local hit_zone_id = NetworkLookup.hit_zones.full
				local target_hit_position = Unit.world_position(hit_unit, 0)
				local attack_direction = Vector3.normalize(target_hit_position - self_pos)

				weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, target_hit_position, attack_direction, self.damage_profile_id, "power_level", power_level, "hit_target_index", nil, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true)
			end
		end
	end

	self.state = "hit"
end

ActionShieldSlam.finish = function (self, reason)
	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	self.hit_target_breed_unit = false

	if reason == "action_complete" and self.state ~= "hit" then
		self:_hit(self.world, true, self.owner_unit, self.current_action)
	end

	local ammo_extension = self.ammo_extension
	local current_action = self.current_action

	if reason ~= "new_interupting_action" and ammo_extension and current_action.reload_when_out_of_ammo and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
		local play_reload_animation = true

		ammo_extension:start_reload(play_reload_animation)
	end
end

ActionShieldSlam._is_infront_player = function (self, player_position, player_direction, hit_position, push_dot)
	local player_to_hit_unit_dir = Vector3.normalize(hit_position - player_position)
	local dot = Vector3.dot(player_to_hit_unit_dir, player_direction)

	if dot > (push_dot or 0.35) then
		return true
	end
end

ActionShieldSlam.destroy = function (self)
	if self.critical_strike_particle_id then
		World.destroy_particles(self.world, self.critical_strike_particle_id)

		self.critical_strike_particle_id = nil
	end
end

return
