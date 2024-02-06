-- chunkname: @scripts/unit_extensions/weapons/actions/action_shield_slam.lua

ActionShieldSlam = class(ActionShieldSlam, ActionBase)

local POSITION_LOOKUP = POSITION_LOOKUP

ActionShieldSlam.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionShieldSlam.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

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
	ActionShieldSlam.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self.current_action = new_action
	self.target_breed_unit = nil

	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local career_extension = ScriptUnit.extension(owner_unit, "career_system")

	self.owner_career_extension = career_extension
	self.owner_buff_extension = buff_extension

	local _, melee_boost_curve_multiplier = career_extension:has_melee_boost()
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)

	self.melee_boost_curve_multiplier = melee_boost_curve_multiplier
	self.power_level = power_level

	if not Managers.player:owner(owner_unit).bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "light_swing",
		})
	end

	local action_hand = action_init_data and action_init_data.action_hand
	local damage_profile_name = action_hand and new_action["damage_profile_" .. action_hand] or new_action.damage_profile or "default"

	self.damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
	self.damage_profile = DamageProfileTemplates[damage_profile_name]

	local damage_profile_name_aoe = action_hand and new_action["damage_profile_aoe_" .. action_hand] or new_action.damage_profile_aoe or "default"

	self.damage_profile_aoe_id = NetworkLookup.damage_profiles[damage_profile_name_aoe]
	self.damage_profile_aoe = DamageProfileTemplates[damage_profile_name_aoe]

	local damage_profile_target_name = action_hand and new_action["damage_profile_target" .. action_hand] or new_action.damage_profile_target or "default"

	self.damage_profile_target_id = NetworkLookup.damage_profiles[damage_profile_target_name]
	self.damage_profile_target = DamageProfileTemplates[damage_profile_target_name]

	local ammo_extension = self.ammo_extension

	if ammo_extension and ammo_extension:is_reloading() then
		ammo_extension:abort_reload()
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, first_person_extension, "on_critical_sweep", "Play_player_combat_crit_swing_2D")

	self._is_critical_strike = is_critical_strike

	Unit.flow_event(first_person_unit, "sfx_swing_started")
	first_person_extension:disable_rig_movement()

	local physics_world = World.get_data(self.world, "physics_world")
	local pos = first_person_extension:current_position()
	local rot = first_person_extension:current_rotation()
	local direction = Quaternion.forward(rot)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local owner_player = Managers.player:owner(owner_unit)
	local melee_friendly_fire = DamageUtils.allow_friendly_fire_melee(difficulty_settings, owner_player)
	local collision_filter = melee_friendly_fire and "filter_melee_sweep" or "filter_melee_sweep_no_player"
	local results = PhysicsWorld.immediate_raycast(physics_world, pos, direction, new_action.dedicated_target_range, "all", "collision_filter", collision_filter)

	if results then
		local side_manager = Managers.state.side
		local num_results = #results

		for i = 1, num_results do
			local result = results[i]
			local actor = result[4]
			local hit_unit = Actor.unit(actor)

			if not melee_friendly_fire and side_manager:is_ally(owner_unit, hit_unit) then
				-- Nothing
			else
				local breed = Unit.get_data(hit_unit, "breed")

				if breed then
					local node = Actor.node(actor)
					local hit_zone = breed.hit_zones_lookup[node]
					local hit_zone_name = hit_zone.name

					if hit_zone_name ~= "afro" and HEALTH_ALIVE[hit_unit] then
						self.target_breed_unit = hit_unit

						break
					end
				end
			end
		end
	end

	if not self.target_breed_unit and ScriptUnit.has_extension(owner_unit, "smart_targeting_system") then
		local targeting_extension = ScriptUnit.extension(owner_unit, "smart_targeting_system")
		local targeting_data = targeting_extension:get_targeting_data()
		local smart_targeting_unit = targeting_data.unit

		if HEALTH_ALIVE[smart_targeting_unit] then
			local smart_targeting_position = Unit.has_node(smart_targeting_unit, "j_spine") and Unit.world_position(smart_targeting_unit, Unit.node(smart_targeting_unit, "j_spine"))
			local target_world_position = POSITION_LOOKUP[smart_targeting_unit] or Unit.world_position(smart_targeting_unit, 0)
			local target_position = smart_targeting_position or target_world_position
			local distance = Vector3.length(pos - target_position)

			if HEALTH_ALIVE[smart_targeting_unit] and distance < new_action.dedicated_target_range then
				self.target_breed_unit = smart_targeting_unit
			end
		end
	end

	self.state = "waiting_to_hit"

	local anim_time_scale = ActionUtils.get_action_time_scale(owner_unit, new_action)

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

	self._num_targets_hit = 0
end

ActionShieldSlam.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if self.state == "waiting_to_hit" and t >= self.time_to_hit then
		self.state = "hitting"
	end

	if self.state == "hitting" then
		self:_hit(world, can_damage, owner_unit, current_action)

		if not Managers.player:owner(self.owner_unit).bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "hit_character_light",
			})
		end
	end
end

ActionShieldSlam._hit = function (self, world, can_damage, owner_unit, current_action)
	local network_manager = Managers.state.network
	local physics_world = World.get_data(world, "physics_world")
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local first_person_unit = self.first_person_unit
	local unit_forward = Quaternion.forward(Unit.local_rotation(first_person_unit, 0))
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local self_pos = first_person_extension:current_position()
	local forward_offset = current_action.forward_offset or 1
	local attack_pos = self_pos + unit_forward * forward_offset
	local radius = current_action.push_radius
	local collision_filter = "filter_melee_sweep"
	local actors, actors_n = PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "position", attack_pos, "size", radius, "types", "dynamics", "collision_filter", collision_filter)
	local inner_forward_offset = forward_offset + radius * 0.65
	local inner_attack_pos = self_pos + unit_forward * inner_forward_offset
	local inner_attack_pos_near = self_pos + unit_forward
	local inner_radius = current_action.inner_push_radius or radius * 0.4
	local inner_radius_sq = inner_radius * inner_radius
	local inner_hit_units = self.inner_hit_units
	local hit_units = self.hit_units
	local unit_get_data = Unit.get_data

	if script_data.debug_weapons then
		self._drawer:sphere(attack_pos, radius, Color(255, 0, 0))
		self._drawer:sphere(inner_attack_pos_near, inner_radius, Color(0, 255, 0))
		self._drawer:sphere(inner_attack_pos, inner_radius, Color(0, 255, 0))
	end

	local target_breed_unit = self.target_breed_unit

	if not HEALTH_ALIVE[target_breed_unit] then
		target_breed_unit = nil
	end

	local side_manager = Managers.state.side

	for i = 1, actors_n do
		repeat
			local hit_actor = actors[i]
			local hit_unit = Actor.unit(hit_actor)

			if hit_units[hit_unit] then
				break
			end

			hit_units[hit_unit] = true

			local target_is_friendly = side_manager:is_ally(owner_unit, hit_unit)

			if target_is_friendly then
				break
			end

			local breed = unit_get_data(hit_unit, "breed")
			local hit_self = hit_unit == owner_unit

			if breed then
				if hit_unit == target_breed_unit then
					break
				end

				do
					local node = Actor.node(hit_actor)
					local hit_zone = breed and breed.hit_zones_lookup[node]
					local target_hit_zone_name = hit_zone and hit_zone.name or "torso"
					local target_hit_position = Unit.has_node(hit_unit, "j_spine") and Unit.world_position(hit_unit, Unit.node(hit_unit, "j_spine"))
					local target_world_position = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
					local hit_position = target_hit_position or target_world_position

					self.target_hit_zones_names[hit_unit] = target_hit_zone_name
					self.target_hit_unit_positions[hit_unit] = hit_position

					local attack_direction = Vector3.normalize(hit_position - self_pos)
					local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
					local hit_zone_id = NetworkLookup.hit_zones[target_hit_zone_name]

					if self:_is_infront_player(self_pos, unit_forward, hit_position) then
						local distance_to_inner_position_sq = math.min(Vector3.distance_squared(hit_position, inner_attack_pos), Vector3.distance_squared(hit_position, inner_attack_pos_near))

						if distance_to_inner_position_sq <= inner_radius_sq then
							inner_hit_units[hit_unit] = true

							break
						end

						local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
						local damage_source = self.item_name
						local damage_source_id = NetworkLookup.damage_sources[damage_source]
						local weapon_system = self.weapon_system
						local power_level = self.power_level
						local is_server = self.is_server
						local damage_profile = self.damage_profile_aoe
						local target_index = 1
						local is_critical_strike = self._is_critical_strike

						self._overridable_settings = current_action

						ActionSweep._play_character_impact(self, is_server, owner_unit, hit_unit, breed, hit_position, target_hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, is_critical_strike)

						self._num_targets_hit = self._num_targets_hit + 1

						weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, self.damage_profile_aoe_id, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true, "first_hit", self._num_targets_hit == 1)
					end
				end

				break
			end

			if not hit_self and ScriptUnit.has_extension(hit_unit, "health_system") then
				local hit_unit_id, is_level_unit = Managers.state.network:game_object_or_level_id(hit_unit)

				if is_level_unit then
					do
						local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

						if not no_player_damage then
							local target_hit_position = Unit.world_position(hit_unit, 0)
							local distance_to_inner_position_sq = math.min(Vector3.distance_squared(target_hit_position, inner_attack_pos), Vector3.distance_squared(target_hit_position, inner_attack_pos_near))

							if distance_to_inner_position_sq <= inner_radius_sq then
								inner_hit_units[hit_unit] = true

								break
							end

							local hit_zone_name = "full"
							local target_index = 1
							local damage_profile = self.damage_profile_aoe
							local damage_source = self.item_name
							local power_level = self.power_level
							local is_critical_strike = self._is_critical_strike
							local attack_direction = Vector3.normalize(target_hit_position - self_pos)

							DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, self.melee_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)
						end
					end

					break
				end

				local hit_position = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
				local distance_to_inner_position_sq = math.min(Vector3.distance_squared(hit_position, inner_attack_pos), Vector3.distance_squared(hit_position, inner_attack_pos_near))

				if distance_to_inner_position_sq <= inner_radius_sq then
					inner_hit_units[hit_unit] = true
				end

				local damage_source = self.item_name
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local weapon_system = self.weapon_system
				local power_level = self.power_level
				local hit_zone_id = NetworkLookup.hit_zones.full
				local attack_direction = Vector3.normalize(hit_position - self_pos)

				weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, self.damage_profile_aoe_id, "power_level", power_level, "hit_target_index", nil, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true)
			end
		until true
	end

	if Unit.alive(target_breed_unit) and not self.hit_target_breed_unit then
		inner_hit_units[target_breed_unit] = true
	end

	local hit_index = 1

	for hit_unit, _ in pairs(inner_hit_units) do
		local breed = unit_get_data(hit_unit, "breed")
		local hit_zone_name = self.target_hit_zones_names[hit_unit] or "torso"
		local target_hit_position = Unit.has_node(hit_unit, "j_spine") and Unit.world_position(hit_unit, Unit.node(hit_unit, "j_spine"))
		local target_world_position = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
		local hit_position = target_hit_position or target_world_position
		local attack_direction = Vector3.normalize(hit_position - self_pos)
		local hit_unit_id, is_level_unit = network_manager:game_object_or_level_id(hit_unit)
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]

		if breed and self:_is_infront_player(self_pos, unit_forward, hit_position, current_action.push_dot) then
			local is_server = self.is_server
			local hit_default_target = hit_unit == target_breed_unit
			local damage_profile = hit_default_target and self.damage_profile_target or self.damage_profile
			local damage_profile_id = hit_default_target and self.damage_profile_target_id or self.damage_profile_id
			local target_index = 1
			local power_level = self.power_level
			local is_critical_strike = self._is_critical_strike
			local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
			local actor = Unit.find_actor(hit_unit, "c_spine") and Unit.actor(hit_unit, "c_spine")
			local actor_position_hit = actor and Actor.center_of_mass(actor)

			if actor_position_hit then
				self._overridable_settings = current_action

				ActionSweep._play_character_impact(self, is_server, owner_unit, hit_unit, breed, actor_position_hit, hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, is_critical_strike)
			end

			local send_to_server = true
			local charge_value = damage_profile.charge_value or "heavy_attack"
			local buff_type = DamageUtils.get_item_buff_type(self.item_name)

			DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, hit_index, send_to_server, buff_type, nil, self.item_name)

			local damage_source_id = NetworkLookup.damage_sources[self.item_name]
			local weapon_system = self.weapon_system

			self._num_targets_hit = self._num_targets_hit + 1

			weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", true, "can_stagger", true, "first_hit", self._num_targets_hit == 1)

			if self.is_critical_strike and self.critical_strike_particle_id then
				World.destroy_particles(self.world, self.critical_strike_particle_id)

				self.critical_strike_particle_id = nil
			end

			if not Managers.player:owner(self.owner_unit).bot_player then
				Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "handgun_fire",
				})
			end

			self.hit_target_breed_unit = true
			hit_index = hit_index + 1
		elseif ScriptUnit.has_extension(hit_unit, "health_system") then
			if is_level_unit then
				local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

				if not no_player_damage then
					hit_zone_name = "full"

					local target_index = 1
					local damage_profile = self.damage_profile
					local damage_source = self.item_name
					local power_level = self.power_level
					local is_critical_strike = self._is_critical_strike

					target_hit_position = Unit.world_position(hit_unit, 0)
					attack_direction = Vector3.normalize(target_hit_position - self_pos)

					DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, self.melee_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)
				end
			else
				local damage_source = self.item_name
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local weapon_system = self.weapon_system
				local power_level = self.power_level

				hit_zone_id = NetworkLookup.hit_zones.full
				target_hit_position = Unit.world_position(hit_unit, 0)
				attack_direction = Vector3.normalize(target_hit_position - self_pos)

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

	local owner_unit = self.owner_unit
	local current_action = self.current_action

	if reason == "action_complete" and self.state ~= "hit" then
		self:_hit(self.world, true, owner_unit, current_action)
	end

	local ammo_extension = self.ammo_extension

	if reason ~= "new_interupting_action" then
		local reload_when_out_of_ammo_condition_func = current_action.reload_when_out_of_ammo_condition_func
		local do_out_of_ammo_reload = not reload_when_out_of_ammo_condition_func and true or reload_when_out_of_ammo_condition_func(owner_unit, reason)

		if ammo_extension and current_action.reload_when_out_of_ammo and do_out_of_ammo_reload and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
			local play_reload_animation = true

			ammo_extension:start_reload(play_reload_animation)
		end
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
