-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
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
	self.target_hit_zones_names = {}
	self.target_hit_unit_positions = {}

	return 
end
ActionShieldSlam.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	self.current_action = new_action
	self.target_breed_unit = nil
	local owner_unit = self.owner_unit
	local first_person_unit = self.owner_unit_first_person
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local career_extension = ScriptUnit.extension(owner_unit, "career_system")
	local has_melee_boost, melee_boost_curve_multiplier = career_extension.has_melee_boost(career_extension)
	self.melee_boost_curve_multiplier = melee_boost_curve_multiplier
	self.owner_career_extension = career_extension
	self.owner_buff_extension = buff_extension
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t) or has_melee_boost
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
	local ammo_extension = self.ammo_extension

	if ammo_extension and ammo_extension.is_reloading(ammo_extension) then
		ammo_extension.abort_reload(ammo_extension)
	end

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end

		buff_extension.trigger_procs(buff_extension, "on_critical_sweep")

		local crit_hud_sound_event = "Play_player_combat_crit_swing_2D"
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension.play_hud_sound_event(first_person_extension, crit_hud_sound_event, nil, false)
	end

	self._is_critical_strike = is_critical_strike

	Unit.flow_event(first_person_unit, "sfx_swing_started")

	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local physics_world = World.get_data(self.world, "physics_world")
	local pos = first_person_extension.current_position(first_person_extension)
	local rot = first_person_extension.current_rotation(first_person_extension)
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
	table.clear(self.target_hit_zones_names)
	table.clear(self.target_hit_unit_positions)

	local current_action = self.current_action
	local overcharge_type = current_action.overcharge_type

	if overcharge_type then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)
	end

	return 
end
ActionShieldSlam.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if self.state == "waiting_to_hit" and self.time_to_hit <= t then
		self.state = "hitting"
	end

	if self.state == "hitting" then
		self._hit(self, world, can_damage, owner_unit, current_action)

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "hit_character_light"
			})
		end
	end

	return 
end
ActionShieldSlam._hit = function (self, world, can_damage, owner_unit, current_action)
	local network_manager = Managers.state.network
	local physics_world = World.get_data(world, "physics_world")
	local attacker_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
	local buff_extension = self.owner_buff_extension
	local first_person_unit = self.owner_unit_first_person
	local unit_forward = Quaternion.forward(Unit.local_rotation(first_person_unit, 0))
	local self_pos = POSITION_LOOKUP[owner_unit]
	local forward_offset = 0.5
	local attack_pos = self_pos + unit_forward * forward_offset + Vector3(0, 0, 1)
	local radius = current_action.push_radius
	local collision_filter = "filter_melee_sweep"
	local actors, actors_n = PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "position", attack_pos, "size", radius, "types", "dynamics", "collision_filter", collision_filter, "use_global_table")
	local hit_units = self.hit_units
	local unit_get_data = Unit.get_data
	local hit_once = false
	local target_hit_actor = nil
	local target_breed_unit = self.target_breed_unit
	local target_breed_unit_health_extension = Unit.alive(target_breed_unit) and ScriptUnit.extension(target_breed_unit, "health_system")

	if target_breed_unit_health_extension then
		if not target_breed_unit_health_extension.is_alive(target_breed_unit_health_extension) then
			target_breed_unit = nil
		end
	else
		target_breed_unit = nil
	end

	for i = 1, actors_n, 1 do
		local hit_actor = actors[i]
		local hit_unit = Actor.unit(hit_actor)
		local breed = unit_get_data(hit_unit, "breed")

		if breed and not hit_units[hit_unit] then
			hit_units[hit_unit] = true

			if hit_unit == target_breed_unit then
				print("hit_unit == target_breed_unit", hit_actor)

				target_hit_actor = "c_spine"
			elseif not target_breed_unit then
				local health_extension = ScriptUnit.extension(hit_unit, "health_system")
			else
				local node = Actor.node(hit_actor)
				local hit_zone = breed.hit_zones_lookup[node]
				local target_hit_zone_name = hit_zone.name
				local target_hit_position = Unit.world_position(hit_unit, node)
				self.target_hit_zones_names[hit_unit] = target_hit_zone_name
				self.target_hit_unit_positions[hit_unit] = target_hit_position
				local attack_direction = Vector3.normalize(POSITION_LOOKUP[hit_unit] - self_pos)
				local node = Actor.node(hit_actor)
				local hit_zone = breed.hit_zones_lookup[node]
				local hit_zone_name = hit_zone.name
				local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
				local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]

				if self._is_infront_player(self, self_pos, unit_forward, target_hit_position) then
					local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
					local damage_source = self.item_name
					local damage_source_id = NetworkLookup.damage_sources[damage_source]
					local weapon_system = self.weapon_system
					local power_level = self.power_level
					local is_server = self.is_server
					local damage_profile = self.damage_profile
					local target_index = 1
					local is_critical_strike = self._is_critical_strike

					ActionSweep._play_character_impact(self, is_server, owner_unit, hit_unit, breed, target_hit_position, hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, is_critical_strike)

					local charge_value = self.damage_profile.charge_value or "heavy_attack"
					local num_hit_targets = 1
					local send_to_server = true

					DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, num_hit_targets, send_to_server)
					weapon_system.send_rpc_attack_hit(weapon_system, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, self.damage_profile_aoe_id, "power_level", power_level, "hit_target_index", nil, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true)
				end
			end
		end
	end

	if Unit.alive(target_breed_unit) and not self.hit_target_breed_unit then
		local network_manager = Managers.state.network
		local breed = Unit.get_data(target_breed_unit, "breed")
		local hit_zone_name = self.target_hit_zones_names[target_breed_unit] or "torso"
		local target_position = POSITION_LOOKUP[target_breed_unit]
		local target_hit_position = self.target_hit_unit_positions[target_breed_unit]
		local attack_direction = Vector3.normalize(target_position - POSITION_LOOKUP[owner_unit])
		local hit_unit_id = network_manager.unit_game_object_id(network_manager, target_breed_unit)
		local attacker_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]

		if self._is_infront_player(self, self_pos, unit_forward, target_position, current_action.push_dot) then
			local is_server = self.is_server
			local hit_position = target_hit_position or target_position
			local damage_profile = self.damage_profile
			local target_index = 1
			local power_level = self.power_level
			local is_critical_strike = self._is_critical_strike
			local shield_blocked = AiUtils.attack_is_shield_blocked(target_breed_unit, owner_unit)
			local actor_position_hit = Actor.center_of_mass(Unit.actor(target_breed_unit, "c_spine"))

			ActionSweep._play_character_impact(self, is_server, owner_unit, target_breed_unit, breed, actor_position_hit, hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, is_critical_strike)

			local send_to_server = true
			local charge_value = self.damage_profile.charge_value or "heavy_attack"
			local num_hit_targets = 1

			DamageUtils.buff_on_attack(owner_unit, target_breed_unit, charge_value, is_critical_strike, hit_zone_name, num_hit_targets, send_to_server)

			local damage_source_id = NetworkLookup.damage_sources[self.item_name]
			local weapon_system = self.weapon_system

			weapon_system.send_rpc_attack_hit(weapon_system, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, self.damage_profile_id, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", true, "can_stagger", true)

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
		end
	end

	self.state = "hit"

	return 
end
ActionShieldSlam.finish = function (self, reason)
	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	self.hit_target_breed_unit = false

	if reason == "action_complete" and self.state ~= "hit" then
		self._hit(self, self.world, true, self.owner_unit, self.current_action)
	end

	local ammo_extension = self.ammo_extension
	local current_action = self.current_action

	if reason ~= "new_interupting_action" and ammo_extension and current_action.reload_when_out_of_ammo and ammo_extension.ammo_count(ammo_extension) == 0 and ammo_extension.can_reload(ammo_extension) then
		local play_reload_animation = true

		ammo_extension.start_reload(ammo_extension, play_reload_animation)
	end

	return 
end
ActionShieldSlam._is_infront_player = function (self, player_position, player_direction, hit_position, push_dot)
	local player_to_hit_unit_dir = Vector3.normalize(hit_position - player_position)
	local dot = Vector3.dot(player_to_hit_unit_dir, player_direction)

	if (push_dot or 0.35) < dot then
		return true
	end

	return 
end
ActionShieldSlam.destroy = function (self)
	if self.critical_strike_particle_id then
		World.destroy_particles(self.world, self.critical_strike_particle_id)

		self.critical_strike_particle_id = nil
	end

	return 
end

return 
