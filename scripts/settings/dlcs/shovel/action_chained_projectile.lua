-- chunkname: @scripts/settings/dlcs/shovel/action_chained_projectile.lua

ActionChainedProjectile = class(ActionChainedProjectile, ActionBase)

ActionChainedProjectile.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionChainedProjectile.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self.owner_buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")
	self.owner_unit = owner_unit

	if self.first_person_extension then
		self.first_person_unit = self.first_person_extension:get_first_person_unit()
	end

	self._rumble_effect_id = false
	self.unit_id = Managers.state.network.unit_storage:go_id(owner_unit)
	self._audio_system = Managers.state.entity:system("audio_system")
	self._active_projectiles = Script.new_array(4)
	self._active_projectiles_n = 0
	self.fx_spline_ids = {
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_1"),
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_2"),
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_3"),
	}
end

local RAYCAST_INDEX_POSITION = 1
local RAYCAST_INDEX_DISTANCE = 2
local RAYCAST_INDEX_NORMAL = 3
local RAYCAST_INDEX_ACTOR = 4

ActionChainedProjectile.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionChainedProjectile.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	self._fire_t = t + new_action.fire_time
	self.state = "waiting_to_shoot"
	self._power_level = power_level
	self._fire_sound_event = new_action.fire_sound_event
	self._chain_sound_event = new_action.chain_sound_event
end

ActionChainedProjectile.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self.state == "waiting_to_shoot" and t >= self._fire_t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		self.state = "shot"

		self:_shoot(t)
	end
end

ActionChainedProjectile.finish = function (self, reason)
	ActionChainedProjectile.super.finish(self, reason)
end

ActionChainedProjectile._shoot = function (self, t)
	local length = 100
	local hit_radius = 0.15
	local physics_world = self.physics_world
	local owner_unit = self.owner_unit
	local side_manager = Managers.state.side
	local side_by_unit = side_manager.side_by_unit
	local side = side_by_unit[owner_unit]
	local first_person_extension = self.first_person_extension
	local player_position, player_rotation = first_person_extension:get_projectile_start_position_rotation()
	local direction = Quaternion.forward(player_rotation)
	local static_hit, _, ray_length, hit_surface_normal, static_hit_actor = PhysicsWorld.immediate_raycast(physics_world, player_position, direction, length, "closest", "collision_filter", "filter_player_ray_projectile_static_only")
	local max_length = ray_length or length
	local halfway_position = player_position + direction * max_length / 2
	local prepare_radius = max_length / 2

	PhysicsWorld.prepare_actors_for_overlap(physics_world, halfway_position, prepare_radius * prepare_radius)

	local results = PhysicsWorld.linear_sphere_sweep(physics_world, player_position + direction * (hit_radius / 2), player_position + direction * max_length, hit_radius, 100, "types", "both", "collision_filter", "filter_player_ray_projectile", "report_initial_overlap")
	local num_results = results and #results or 0
	local best_target_unit

	for i = 1, num_results do
		local result = results[i]
		local hit_actor = result.actor

		if hit_actor then
			local hit_unit = Actor.unit(hit_actor)
			local health_extension = ScriptUnit.has_extension(hit_unit, "health_system")

			if health_extension then
				local hit_unit_side = side_by_unit[hit_unit]

				if not side or not hit_unit_side or side_manager:is_enemy_by_side(side, hit_unit_side) then
					local node = Actor.node(hit_actor)
					local breed = AiUtils.unit_breed(hit_unit)
					local hit_zone = breed and breed.hit_zones_lookup[node]

					if not hit_zone or hit_zone.name ~= "afro" then
						best_target_unit = hit_unit

						break
					end
				end
			end
		end
	end

	local end_pos
	local attack_distance = max_length

	end_pos = player_position + direction * attack_distance

	local hit_unit

	if best_target_unit then
		hit_unit = best_target_unit

		local _, is_level_unit = Managers.state.network:game_object_or_level_id(hit_unit)

		if not is_level_unit then
			local node = Unit.has_node(best_target_unit, "j_spine") and Unit.node(best_target_unit, "j_spine") or 0

			end_pos = Unit.world_position(best_target_unit, node)
		end
	elseif static_hit then
		local static_hit_unit = Actor.unit(static_hit_actor)
		local _, is_level_unit = Managers.state.network:game_object_or_level_id(static_hit_unit)

		if not is_level_unit then
			hit_unit = static_hit_unit
		end
	end

	if hit_unit then
		local chain_hit_settings = self.current_action.chain_hit_settings
		local breed = Unit.get_data(hit_unit, "breed")

		if breed then
			self._is_critical_strike = ActionUtils.is_critical_strike(self.owner_unit, self.current_action, t)

			self:_handle_critical_strike(self._is_critical_strike, self.buff_extension, self.hud_extension, nil, "on_critical_shot", nil)

			local hit_index = 1
			local send_to_server = true
			local damage_profile = DamageProfileTemplates[chain_hit_settings.damage_profile]
			local charge_value = damage_profile.charge_value or "projectile"
			local buff_type = DamageUtils.get_item_buff_type(self.item_name)

			DamageUtils.buff_on_attack(self.owner_unit, hit_unit, charge_value, self._is_critical_strike, "full", hit_index, send_to_server, buff_type, nil, self.item_name)
		else
			self._is_critical_strike = false
		end

		local power_level = self._power_level
		local _, boost_curve_multiplier = ActionUtils.get_ranged_boost(owner_unit)
		local is_critical_strike = self._is_critical_strike
		local active_projectiles = self._active_projectiles
		local active_projectiles_n = self._active_projectiles_n + 1

		self._active_projectiles_n = active_projectiles_n
		active_projectiles[active_projectiles_n] = {
			chain_count = 0,
			settings = chain_hit_settings,
			is_critical_strike = is_critical_strike,
			power_level = power_level,
			boost_curve_multiplier = boost_curve_multiplier,
			next_chain_t = t + (chain_hit_settings.chain_delay - chain_hit_settings.target_selection_delay),
			target_selection_t = math.huge,
			next_target_unit = hit_unit,
			hit_units = {
				[hit_unit] = true,
			},
			last_chain_pos = Vector3Box(end_pos),
		}
	elseif hit_surface_normal then
		local impact_normal = hit_surface_normal
		local impact_direction = Vector3.reflect(direction, impact_normal)
		local fx_id = NetworkLookup.effects["fx/wpnfx_staff_death/curse_spirit_impact"]

		if self.is_server then
			Managers.state.network:rpc_play_particle_effect(nil, fx_id, NetworkConstants.invalid_game_object_id, 0, end_pos, Quaternion.look(impact_direction), false)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_play_particle_effect", fx_id, NetworkConstants.invalid_game_object_id, 0, end_pos, Quaternion.look(impact_direction), false)
		end
	end

	local start_offset_limits = self.current_action.start_offset
	local start_offset = Quaternion.rotate(player_rotation, Vector3(math.lerp(start_offset_limits.min[1], start_offset_limits.max[1], math.random()), math.lerp(start_offset_limits.min[2], start_offset_limits.max[2], math.random()), math.lerp(start_offset_limits.min[3], start_offset_limits.max[3], math.random())))
	local curve_offset_limits = self.current_action.curve_offset
	local curve_offset = Quaternion.rotate(player_rotation, Vector3(math.lerp(curve_offset_limits.min[1], curve_offset_limits.max[1], math.random()), math.lerp(curve_offset_limits.min[2], curve_offset_limits.max[2], math.random()), math.lerp(curve_offset_limits.min[3], curve_offset_limits.max[3], math.random())))
	local start_pos_node = Unit.node(self.first_person_unit, "j_aim_target")
	local start_pos = Unit.world_position(self.first_person_unit, start_pos_node) + start_offset
	local mid_point = start_pos + (end_pos - start_pos) / 3 + curve_offset

	self:_play_fx("fx/wpnfx_staff_death/curse_spirit_first", start_pos, mid_point, end_pos, false)

	local current_action = self.current_action
	local overcharge_type = current_action.overcharge_type

	if overcharge_type and not self.extra_buff_shot then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if self._is_critical_strike and buff_extension:has_buff_perk("no_overcharge_crit") then
			overcharge_amount = 0
		end

		if current_action.scale_overcharge then
			self.overcharge_extension:add_charge(overcharge_amount, self.charge_level)
		else
			self.overcharge_extension:add_charge(overcharge_amount)
		end
	end

	self:_proc_spell_used(self.owner_buff_extension)
end

ActionChainedProjectile._apply_damage = function (self, hit_unit, hit_target_index, is_critical_strike, power_level, boost_curve_multiplier, damage_profile, damage_source_position)
	local network_manager = Managers.state.network
	local attacker_unit_id = network_manager:unit_game_object_id(self.owner_unit)

	self:_handle_critical_strike(is_critical_strike, self.owner_buff_extension, self.hud_extension, self.first_person_extension, "on_critical_shot", nil)

	local damage_profile_id = NetworkLookup.damage_profiles[damage_profile]
	local hit_unit_id, is_level_unit = network_manager:game_object_or_level_id(hit_unit)
	local damage_source_id = NetworkLookup.damage_sources[self.item_name]
	local hit_zone_id = NetworkLookup.hit_zones.torso
	local hit_position = Unit.world_position(hit_unit, 0) + Vector3.up()
	local attack_direction, attack_distance = Vector3.direction_length(hit_position - damage_source_position)

	if is_level_unit then
		local hit_zone_name = "full"
		local target_index = 1
		local damage_source = self.item_name
		local damage_profile_template = DamageProfileTemplates[damage_profile]

		DamageUtils.damage_level_unit(hit_unit, self.owner_unit, hit_zone_name, power_level, self.melee_boost_curve_multiplier, is_critical_strike, damage_profile_template, target_index, attack_direction, damage_source)
	else
		self.weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", hit_target_index, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", true, "can_stagger", true, "first_hit", hit_target_index == 1)
	end

	local fx_id = NetworkLookup.effects["fx/wpnfx_staff_death/curse_spirit_impact"]
	local rotation = Quaternion.look(attack_direction)

	if self.is_server then
		Managers.state.network:rpc_play_particle_effect(nil, fx_id, NetworkConstants.invalid_game_object_id, 0, hit_position, rotation, false)
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_play_particle_effect", fx_id, NetworkConstants.invalid_game_object_id, 0, hit_position, rotation, false)
	end

	local audio_system = Managers.state.entity:system("audio_system")

	audio_system:play_audio_unit_event("Play_career_necro_passive_shadow_blood", hit_unit)
end

ActionChainedProjectile.destroy = function (self)
	return
end

ActionChainedProjectile.passive_update = function (self, dt, t)
	if self._active_projectiles_n <= 0 then
		return
	end

	local owner_unit = self.owner_unit
	local ai_broadphase = Managers.state.entity:system("ai_system").broadphase
	local side_manager = Managers.state.side
	local side_by_unit = side_manager.side_by_unit
	local side = side_by_unit[owner_unit]
	local enemy_categories = side and side.enemy_broadphase_categories
	local active_projectiles = self._active_projectiles

	for i = self._active_projectiles_n, 1, -1 do
		local projectile = active_projectiles[i]

		if not projectile.next_target_unit and t >= projectile.target_selection_t then
			local chain_next = self:_select_next_target(projectile, ai_broadphase, enemy_categories)

			if not chain_next then
				table.swap_delete(active_projectiles, i)

				self._active_projectiles_n = self._active_projectiles_n - 1
			end
		elseif t >= projectile.next_chain_t then
			local chain_next = self:_apply_chain_damage(projectile, ai_broadphase, enemy_categories)

			if chain_next then
				projectile.next_target_unit = nil
				projectile.next_chain_t = t + projectile.settings.chain_delay
				projectile.target_selection_t = t + projectile.settings.target_selection_delay
			else
				table.swap_delete(active_projectiles, i)

				self._active_projectiles_n = self._active_projectiles_n - 1
			end
		end
	end
end

local BROADPHASE_QUERY_TEMP = {}

ActionChainedProjectile._select_next_target = function (self, chain_data, ai_broadphase, enemy_categories)
	local settings = chain_data.settings
	local hit_units = chain_data.hit_units
	local last_chain_pos = chain_data.last_chain_pos:unbox()

	table.clear(BROADPHASE_QUERY_TEMP)

	local nearby_enemy_units = BROADPHASE_QUERY_TEMP
	local num_enemies = Broadphase.query(ai_broadphase, last_chain_pos, settings.chain_distance, nearby_enemy_units, enemy_categories)

	for target_id = 1, num_enemies do
		local target_unit = nearby_enemy_units[target_id]

		if not hit_units[target_unit] and HEALTH_ALIVE[target_unit] then
			hit_units[target_unit] = true

			local node = Unit.has_node(target_unit, "j_spine") and Unit.node(target_unit, "j_spine") or 0
			local next_chain_pos = Unit.world_position(target_unit, node)
			local mid_offset = Vector3(math.lerp(-0.5, 0.5, math.random()), math.lerp(-0.5, 0.5, math.random()), math.lerp(-0.5, 0.5, math.random()))
			local mid_point = last_chain_pos + (next_chain_pos - last_chain_pos) / 2 + mid_offset

			self:_play_fx("fx/wpnfx_staff_death/curse_spirit", last_chain_pos, mid_point, next_chain_pos, true)

			chain_data.next_target_unit = target_unit

			return true
		end
	end

	return false
end

ActionChainedProjectile._play_fx = function (self, fx_name, point_1, point_2, point_3, is_chain)
	local fx_name_id = NetworkLookup.effects[fx_name]
	local spline_points = {
		point_1,
		point_2,
		point_3,
	}

	if is_chain then
		if self._chain_sound_event then
			self._audio_system:play_audio_position_event(self._chain_sound_event, point_1)
		end
	elseif self._fire_sound_event and self.first_person_extension then
		self.first_person_extension:play_hud_sound_event(self._fire_sound_event)
	end

	if self.is_server then
		Managers.state.network:rpc_play_particle_effect_spline(nil, fx_name_id, self.fx_spline_ids, spline_points)
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_play_particle_effect_spline", fx_name_id, self.fx_spline_ids, spline_points)
	end
end

ActionChainedProjectile._apply_chain_damage = function (self, chain_data, ai_broadphase, enemy_categories)
	local settings = chain_data.settings
	local chain_count = chain_data.chain_count + 1
	local target_unit = chain_data.next_target_unit

	if HEALTH_ALIVE[target_unit] then
		local last_chain_pos = chain_data.last_chain_pos:unbox()

		self:_apply_damage(target_unit, chain_count + 1, chain_data.is_critical_strike, chain_data.power_level, chain_data.boost_curve_multiplier, settings.damage_profile, last_chain_pos)
	end

	if ALIVE[target_unit] and chain_count <= settings.max_chain_count then
		local next_chain_pos

		if Unit.has_node(target_unit, "j_spine") then
			local node = Unit.node(target_unit, "j_spine")

			next_chain_pos = Unit.world_position(target_unit, node)
		else
			next_chain_pos = Unit.world_position(target_unit, 0) + Vector3.up() * 0.8
		end

		chain_data.chain_count = chain_count

		chain_data.last_chain_pos:store(next_chain_pos)

		return true
	else
		return false
	end
end
