ActionGeiser = class(ActionGeiser, ActionBase)

ActionGeiser.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionGeiser.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self._damage_buffer = {}
	self._damage_buffer_index = 1
	self._check_buffs = false
end

ActionGeiser.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionGeiser.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	self.current_action = new_action
	local owner_unit = self.owner_unit
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action)
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local charge_value = chain_action_data.charge_value
	self.charge_value = charge_value
	self.power_level = ActionUtils.scale_geiser_power_level(power_level, charge_value)
	local full_charge_boost = buff_extension:has_buff_perk("full_charge_boost")

	if full_charge_boost and self.charge_value >= 1 then
		self.power_level = buff_extension:apply_buffs_to_value(self.power_level, "full_charge_boost")
	end

	self.owner_buff_extension = buff_extension
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + (new_action.fire_time or 0)
	self.radius = chain_action_data.radius
	self.height = chain_action_data.height
	self.position = chain_action_data.position
	self.targeting_effect_id = chain_action_data.targeting_effect_id

	table.clear(self._damage_buffer)

	self._damage_buffer_index = 1
	self._check_buffs = true
	self._is_critical_strike = is_critical_strike

	if self.charge_value and self.charge_value >= 1 then
		buff_extension:trigger_procs("on_full_charge_action", new_action, t, chain_action_data)
	end
end

ActionGeiser.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
	end

	if self.state == "shooting" then
		self:fire()

		self.state = "doing_damage"
	end

	if self.state == "doing_damage" then
		local done = self:_update_damage(current_action)

		if done then
			self:_proc_spell_used(self.owner_buff_extension)

			self.state = "shot"
		end
	end
end

ActionGeiser.finish = function (self, reason)
	if self.state ~= "waiting_to_shoot" and self.state ~= "shot" then
		self:_proc_spell_used(self.owner_buff_extension)
	end

	if self.targeting_effect_id then
		World.destroy_particles(self.world, self.targeting_effect_id)
	end

	self.position = nil
	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

ActionGeiser.fire = function (self, reason)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local radius = self.radius
	local half_height = self.height * 0.5
	local position = self.position:unbox()
	local physics_world = World.get_data(self.world, "physics_world")
	local network_manager = Managers.state.network
	local start_pos = position + Vector3(0, 0, half_height)
	local source_pos = position
	local capsule_half_height = half_height + radius
	local shape = capsule_half_height - radius > 0 and "capsule" or "sphere"
	local hit_actors, num_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", shape, "position", start_pos, "size", Vector3(radius, capsule_half_height, radius), "rotation", Quaternion.look(Vector3.up(), Vector3.up()), "collision_filter", "filter_character_trigger")
	local charge_value = self.charge_value
	local effect_name = current_action.particle_effect
	local overcharge = current_action.overcharge_type
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local ignore_hitting_allies = not DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player)
	local small_charge_value = current_action.small_charge_value or 0.33
	local medium_charge_value = current_action.medium_charge_value or 0.66
	local large_charge_value = current_action.large_charge_value or 1
	local can_create_aoe = not global_is_inside_inn or current_action.can_proc_in_inn
	local size = "_large"

	if charge_value < small_charge_value then
		size = "_small"
	elseif charge_value < medium_charge_value then
		size = "_medium"
	elseif large_charge_value <= charge_value and can_create_aoe then
		size = "_large"
		local owner_unit_id = network_manager:unit_game_object_id(owner_unit)
		local damage_source_id = NetworkLookup.damage_sources[self.item_name]
		local explosion_template_name = current_action.aoe_name
		local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
		overcharge = current_action.overcharge_type_heavy

		self.network_transmit:send_rpc_server("rpc_client_create_aoe", owner_unit_id, source_pos, damage_source_id, explosion_template_id, radius)
	end

	if effect_name then
		effect_name = effect_name .. size
		local variable_name = current_action.particle_radius_variable
		local effect_id = NetworkLookup.effects[effect_name]
		local variable_id = NetworkLookup.effects[variable_name]
		local radius_variable = Vector3(radius, 1, 1)

		self.network_transmit:send_rpc_server("rpc_play_simple_particle_with_vector_variable", effect_id, position, variable_id, radius_variable)
	end

	if overcharge then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge]
		local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

		if self._is_critical_strike and buff_extension:has_buff_perk("no_overcharge_crit") then
			overcharge_amount = 0
		end

		self.overcharge_extension:add_charge(overcharge_amount, charge_value, overcharge)
	end

	local fire_sound_event = self.current_action.fire_sound_event

	if fire_sound_event then
		local play_on_husk = self.current_action.fire_sound_on_husk
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

		first_person_extension:play_hud_sound_event(fire_sound_event, nil, play_on_husk)
	end

	local damage_buffer = self._damage_buffer
	local hit_units = {}
	local damage_profile_name = current_action.damage_profile or "default"
	local damage_profile = DamageProfileTemplates[damage_profile_name]
	local side_manager = Managers.state.side
	local side = side_manager.side_by_unit[owner_unit]

	if num_actors > 0 then
		local hit_index = 0

		for i = 1, num_actors do
			local hit_actor = hit_actors[i]
			local hit_unit = Actor.unit(hit_actor)
			local hit_position = POSITION_LOOKUP[hit_unit] or Unit.local_position(hit_unit, 0)
			local breed = Unit.get_data(hit_unit, "breed")
			local dummy = not breed and Unit.get_data(hit_unit, "is_dummy")

			if not hit_units[hit_unit] then
				local is_enemy = side_manager:is_enemy(owner_unit, hit_unit)
				local hit_unit_side = side_manager.side_by_unit[hit_unit]
				local is_friend = side == hit_unit_side
				local friendly_fire = is_friend and not ignore_hitting_allies
				local should_hit = dummy or is_enemy or friendly_fire

				if should_hit then
					local attack_vector = hit_position - source_pos
					local attack_distance = Vector3.length(attack_vector)
					local target_index = nil

					if damage_profile.target_radius and damage_profile.targets then
						local proximity_factor = attack_distance / radius
						local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)

						if shield_blocked then
							proximity_factor = math.lerp(proximity_factor, 1, 0.5)
						end

						for index, target_radius in pairs(damage_profile.target_radius) do
							if proximity_factor <= target_radius then
								target_index = index

								break
							end
						end
					end

					hit_units[hit_unit] = true
					local hit_unit_health_extension = ScriptUnit.extension(hit_unit, "health_system")

					if hit_unit_health_extension:is_alive() then
						hit_index = hit_index + 1
					end

					local damage_data = {
						hit_zone_name = "torso",
						hit_unit = hit_unit,
						damage_profile_name = damage_profile_name,
						target_index = target_index,
						allow_critical_proc = target_index == 1,
						hit_index = hit_index
					}
					damage_buffer[#damage_buffer + 1] = damage_data
				end
			end
		end
	end

	if current_action.alert_enemies then
		Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, source_pos, current_action.alert_sound_range_fire)
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(self._is_critical_strike, self.owner_buff_extension, hud_extension, nil, "on_critical_shot", nil)
end

local UNITS_PER_FRAME = 1

ActionGeiser._update_damage = function (self, current_action)
	local damage_buffer = self._damage_buffer
	local damage_buffer_index = self._damage_buffer_index
	local num_units = damage_buffer_index + UNITS_PER_FRAME - 1
	local network_manager = Managers.state.network
	local owner_unit = self.owner_unit
	local damage_source = self.item_name
	local damage_source_id = NetworkLookup.damage_sources[damage_source]
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local attacker_position = self.position:unbox()

	for i = damage_buffer_index, num_units do
		repeat
			local damage_data = damage_buffer[i]

			if not damage_data then
				return true
			end

			local hit_unit = damage_data.hit_unit
			local damage_profile_name = damage_data.damage_profile_name
			local target_index = damage_data.target_index
			local hit_zone_name = damage_data.hit_zone_name
			local allow_critical_proc = damage_data.allow_critical_proc
			local hit_index = damage_data.hit_index

			if not Unit.alive(hit_unit) then
				break
			end

			local has_ranged_boost, ranged_boost_curve_multiplier = ActionUtils.get_ranged_boost(owner_unit)
			local is_critical_strike = self._is_critical_strike or has_ranged_boost
			local send_to_server = true
			local buff_type = DamageUtils.get_item_buff_type(self.item_name)

			DamageUtils.buff_on_attack(owner_unit, hit_unit, "aoe", is_critical_strike and allow_critical_proc, hit_zone_name, hit_index, send_to_server, buff_type)

			local hit_unit_id = network_manager:unit_game_object_id(hit_unit)

			if not hit_unit_id then
				break
			end

			local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
			local damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]
			local hit_position = POSITION_LOOKUP[hit_unit] or Unit.local_position(hit_unit, 0)
			local attack_direction = Vector3.normalize(hit_position - attacker_position)
			local power_level = self.power_level
			local shield_blocked = false
			local shield_break_procc = false
			local weapon_system = Managers.state.entity:system("weapon_system")

			weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", shield_break_procc, "boost_curve_multiplier", ranged_boost_curve_multiplier, "is_critical_strike", is_critical_strike)
		until true
	end

	self._damage_buffer_index = num_units + 1
end
