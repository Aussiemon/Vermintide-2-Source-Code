-- chunkname: @scripts/settings/dlcs/shovel/action_soul_drain.lua

ActionSoulDrain = class(ActionSoulDrain, ActionCareerTrueFlightAim)

ActionSoulDrain.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionSoulDrain.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self.owner_buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if self.first_person_extension then
		self.first_person_unit = self.first_person_extension:get_first_person_unit()
	end

	self._rumble_effect_id = false
	self.unit_id = Managers.state.network.unit_storage:go_id(owner_unit)
end

ActionSoulDrain.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionSoulDrain.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	self.current_action = new_action

	local owner_unit = self.owner_unit

	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + new_action.fire_time
	self.current_target = nil
	self.damage_timer = 0
	self.overcharge_timer = 0
	self.ramping_interval = 1
	self.consecutive_hits = 0
	self.power_level = power_level
	self.charge_level = 0
	self.last_alive_target_hit = nil
	self._is_critical_strike = false
	self._num_hits = 0

	local beam_effect = new_action.particle_effect_trail
	local beam_effect_3p = new_action.particle_effect_trail_3p
	local beam_end_effect = new_action.particle_effect_target
	local beam_effect_lookup_id = NetworkLookup.effects[beam_effect_3p]
	local beam_end_effect_lookup_id = NetworkLookup.effects[beam_end_effect]
	local world = self.world

	if not self.owner_player.bot_player then
		self.beam_effect_id = World.create_particles(world, beam_effect, Vector3.zero())
		self.beam_effect_length_id = World.find_particles_variable(world, beam_effect, "trail_length")
	end

	self.beam_end_effect_id = World.create_particles(world, beam_end_effect, Vector3.zero())

	local go_id = self.unit_id

	if self.is_server or LEVEL_EDITOR_TEST then
		if self.owner_player.bot_player then
			self.network_transmit:queue_local_rpc("rpc_start_beam", go_id, beam_effect_lookup_id, beam_end_effect_lookup_id, new_action.range)
		else
			self.network_transmit:send_rpc_clients("rpc_start_beam", go_id, beam_effect_lookup_id, beam_end_effect_lookup_id, new_action.range)
		end
	else
		self.network_transmit:send_rpc_server("rpc_start_beam", go_id, beam_effect_lookup_id, beam_end_effect_lookup_id, new_action.range)
	end

	local overcharge_type = new_action.overcharge_type

	if overcharge_type then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)
	end

	self.overcharge_target_hit = false

	self:_start_charge_sound()
end

ActionSoulDrain._start_charge_sound = function (self)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local is_bot = owner_player and owner_player.bot_player
	local is_local = owner_player and not owner_player.remote
	local wwise_world = self.wwise_world

	if is_local and not is_bot then
		local wwise_playing_id, wwise_source_id = ActionUtils.start_charge_sound(wwise_world, self.weapon_unit, owner_unit, current_action)

		self.charging_sound_id = wwise_playing_id
		self.wwise_source_id = wwise_source_id
	end

	ActionUtils.play_husk_sound_event(wwise_world, current_action.charge_sound_husk_name, owner_unit, is_bot)
end

ActionSoulDrain._stop_charge_sound = function (self)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local owner_player = self.owner_player
	local is_bot = owner_player and owner_player.bot_player
	local is_local = owner_player and not owner_player.remote
	local wwise_world = self.wwise_world

	if is_local and not is_bot then
		ActionUtils.stop_charge_sound(wwise_world, self.charging_sound_id, self.wwise_source_id, current_action)

		self.charging_sound_id = nil
		self.wwise_source_id = nil
	end

	ActionUtils.play_husk_sound_event(wwise_world, current_action.charge_sound_husk_stop_event, owner_unit, is_bot)
end

local INDEX_POSITION = 1
local INDEX_ACTOR = 4

ActionSoulDrain.client_owner_post_update = function (self, dt, t, world, can_damage)
	ActionSoulDrain.super.client_owner_post_update(self, dt, t, world, can_damage)

	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local is_server = self.is_server
	local input_extension = ScriptUnit.extension(self.owner_unit, "input_system")
	local buff_extension = self.owner_buff_extension
	local status_extension = self.status_extension

	if self.state == "waiting_to_shoot" and t >= self.time_to_shoot then
		self.state = "shooting"
	end

	self.overcharge_timer = self.overcharge_timer + dt

	if self.overcharge_timer >= current_action.overcharge_interval then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values.charging

		self.overcharge_extension:add_charge(overcharge_amount)

		self._is_critical_strike = ActionUtils.is_critical_strike(owner_unit, current_action, t)
		self.overcharge_timer = 0
		self.overcharge_target_hit = false
	end

	if self.state == "shooting" then
		if not Managers.player:owner(self.owner_unit).bot_player and not self._rumble_effect_id then
			self._rumble_effect_id = Managers.state.controller_features:add_effect("persistent_rumble", {
				rumble_effect = "reload_start",
			})
		end

		local beam_end_position, hit_unit
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local current_position, current_rotation = first_person_extension:get_projectile_start_position_rotation()
		local direction = Quaternion.forward(current_rotation)

		if self.target then
			direction = Vector3.normalize(Unit.world_position(self.target, Unit.node(self.target, "j_head")) - current_position)
		end

		local physics_world = World.get_data(self.world, "physics_world")
		local range = current_action.range or 30
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, current_position, direction, range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")

		beam_end_position = current_position + direction * range

		local hit_position

		if result then
			local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
			local owner_player = self.owner_player
			local allow_friendly_fire = DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player)

			for _, hit_data in pairs(result) do
				local potential_hit_position = hit_data[INDEX_POSITION]
				local hit_actor = hit_data[INDEX_ACTOR]
				local potential_hit_unit = Actor.unit(hit_actor)

				potential_hit_unit, hit_actor = ActionUtils.redirect_shield_hit(potential_hit_unit, hit_actor)

				if potential_hit_unit ~= owner_unit then
					local breed = Unit.get_data(potential_hit_unit, "breed")
					local hit_enemy

					if breed then
						local is_enemy = DamageUtils.is_enemy(owner_unit, potential_hit_unit)
						local node = Actor.node(hit_actor)
						local hit_zone = breed.hit_zones_lookup[node]
						local hit_zone_name = hit_zone.name

						hit_enemy = (allow_friendly_fire or is_enemy) and hit_zone_name ~= "afro"
					else
						hit_enemy = true
					end

					if hit_enemy then
						hit_position = potential_hit_position - direction * 0.15
						hit_unit = potential_hit_unit

						break
					end
				end
			end

			if self.target then
				hit_unit = self.target
			end

			if hit_unit then
				local health_extension = ScriptUnit.has_extension(hit_unit, "health_system")

				if health_extension then
					if hit_unit ~= self.current_target then
						self.ramping_interval = 0.4
						self.damage_timer = 0
						self._num_hits = 0
					end

					if self.damage_timer >= current_action.damage_interval * self.ramping_interval then
						Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], 5)

						self.damage_timer = 0

						if health_extension then
							self.ramping_interval = math.clamp(self.ramping_interval * 1.4, 0.45, 1.5)
						end
					end

					if self.damage_timer == 0 then
						local is_critical_strike = self._is_critical_strike
						local hud_extension = self.hud_extension

						self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, first_person_extension, "on_critical_shot", nil)

						local override_damage_profile
						local power_level = self.power_level

						power_level = power_level * self.ramping_interval

						if hit_unit ~= self.current_target then
							self.consecutive_hits = 0
							power_level = power_level * 0.5
							override_damage_profile = current_action.damage_profile or "default"
						else
							self.consecutive_hits = self.consecutive_hits + 1

							if self.consecutive_hits < 3 then
								override_damage_profile = current_action.damage_profile or "default"
							end
						end

						first_person_extension:play_hud_sound_event("staff_beam_hit_enemy", nil, false)

						local check_buffs = self._num_hits > 1

						DamageUtils.process_projectile_hit(world, self.item_name, owner_unit, is_server, result, current_action, direction, check_buffs, nil, nil, self._is_critical_strike, power_level, override_damage_profile)

						self._num_hits = self._num_hits + 1

						if not Managers.player:owner(self.owner_unit).bot_player then
							Managers.state.controller_features:add_effect("rumble", {
								rumble_effect = "hit_character_light",
							})
						end

						if health_extension:is_alive() then
							local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[current_action.overcharge_type]

							if is_critical_strike and buff_extension:has_buff_perk("no_overcharge_crit") then
								overcharge_amount = 0
							end

							self.overcharge_extension:add_charge(overcharge_amount * self.ramping_interval)
						end
					end

					self.damage_timer = self.damage_timer + dt
					self.current_target = hit_unit

					if health_extension:is_alive() then
						self.last_alive_target_hit = hit_unit
					elseif self.last_alive_target_hit == hit_unit and not health_extension:is_alive() and self.ammo_extension and self.ammo_extension:current_ammo() < self.ammo_extension:clip_size() then
						self.last_alive_target_hit = nil

						self.ammo_extension:add_ammo(1)
					end
				end
			end
		end

		if self.beam_effect_id then
			local weapon_unit = self.weapon_unit
			local owner_unit = self.first_person_unit
			local end_of_staff_position = Unit.world_position(owner_unit, Unit.node(owner_unit, "j_lefthand"))
			local distance = Vector3.distance(end_of_staff_position, beam_end_position)
			local beam_direction = Vector3.normalize(end_of_staff_position - beam_end_position)
			local rotation = Quaternion.look(beam_direction)

			World.move_particles(world, self.beam_effect_id, beam_end_position, rotation)
			World.set_particles_variable(world, self.beam_effect_id, self.beam_effect_length_id, Vector3(0.3, distance, 0))
			World.move_particles(world, self.beam_end_effect_id, beam_end_position, rotation)

			local target_location = POSITION_LOOKUP[self.target]
			local staff_location = end_of_staff_position

			if target_location and staff_location then
				local drain_length = Vector3.distance(staff_location, target_location)

				if range < drain_length then
					self.target = nil
					self.current_target = nil
				end
			end
		end
	end
end

ActionSoulDrain._stop_fx = function (self)
	local world = self.world

	if self.beam_end_effect_id then
		World.destroy_particles(world, self.beam_end_effect_id)

		self.beam_end_effect_id = nil
	end

	if self.beam_effect_id then
		World.destroy_particles(world, self.beam_effect_id)

		self.beam_effect_id = nil
	end

	if self._rumble_effect_id then
		Managers.state.controller_features:stop_effect(self._rumble_effect_id)

		self._rumble_effect_id = nil
	end

	self:_stop_charge_sound()
end

ActionSoulDrain._stop_client_vfx = function (self)
	local network_manager = Managers.state.network
	local game = network_manager:game()

	if game then
		local go_id = self.unit_id

		if self.is_server or LEVEL_EDITOR_TEST then
			if self.owner_player.bot_player then
				self.network_transmit:queue_local_rpc("rpc_end_beam", go_id)
			else
				self.network_transmit:send_rpc_clients("rpc_end_beam", go_id)
			end
		else
			self.network_transmit:send_rpc_server("rpc_end_beam", go_id)
		end
	end
end

ActionSoulDrain.finish = function (self, reason)
	ActionSoulDrain.super.finish(self, reason)
	self:_stop_client_vfx()
	self:_stop_fx()
	self:_proc_spell_used(self.owner_buff_extension)

	return {
		beam_consecutive_hits = math.max(self.consecutive_hits - 1, 0),
	}
end

ActionSoulDrain.destroy = function (self)
	self:_stop_client_vfx()
	self:_stop_fx()
end
