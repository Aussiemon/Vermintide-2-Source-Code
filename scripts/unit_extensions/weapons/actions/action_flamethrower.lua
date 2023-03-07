ActionFlamethrower = class(ActionFlamethrower, ActionBase)
local POSITION_TWEAK = -1.5
local SPRAY_RANGE = math.abs(POSITION_TWEAK) + 10
local SPRAY_RADIUS = 2
local MAX_TARGETS = 50
local NODES = {
	"j_leftshoulder",
	"j_rightshoulder",
	"j_spine1"
}

ActionFlamethrower.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionFlamethrower.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.targets = {}
	self.old_targets = {}
	self.stop_sound_event = "Stop_player_combat_weapon_drakegun_flamethrower_shoot"
	self.unit_id = Managers.state.network.unit_storage:go_id(owner_unit)
end

ActionFlamethrower.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionFlamethrower.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	self.current_action = new_action
	self.power_level = power_level
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + new_action.fire_time
	self.overcharge_timer = 0
	self.damage_timer = 1
	self.stop_sound_event = new_action.stop_fire_event or self.stop_sound_event
	self.muzzle_node_name = new_action.fx_node or "fx_muzzle"
	self._fx_stopped = false
	self.dot_check = new_action.dot_check or 0.95
	self.spray_range = new_action.spray_range and math.abs(POSITION_TWEAK) + new_action.spray_range or SPRAY_RANGE
	self.charge_level = chain_action_data and chain_action_data.charge_level or 1
	self.max_flame_time = new_action.fire_stop_time and t + new_action.fire_stop_time or t + self.charge_level * (new_action.charge_fuel_time_multiplier or 3)
	local full_charge_boost = self.buff_extension:has_buff_perk("full_charge_boost")

	if full_charge_boost and self.charge_level >= 1 then
		self.power_level = self.buff_extension:apply_buffs_to_value(self.power_level, "full_charge_boost")
	end

	if chain_action_data and chain_action_data.charge_level and self.charge_level and self.charge_level >= 1 then
		self.buff_extension:trigger_procs("on_full_charge_action", new_action, t, chain_action_data)
	end

	table.clear(self.old_targets)
	table.clear(self.targets)
end

local INDEX_ACTOR = 4

ActionFlamethrower.client_owner_post_update = function (self, dt, t, world, can_damage)
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local current_action = self.current_action
	local owner_player = self.owner_player
	local bot_player = owner_player.bot_player
	local network_transmit = self.network_transmit
	local is_server = self.is_server

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
		local weapon_unit = self.weapon_unit
		local muzzle_node_name = self.muzzle_node_name
		local go_id = self.unit_id
		local muzzle_node = Unit.node(weapon_unit, muzzle_node_name)
		local muzzle_position = Unit.world_position(weapon_unit, muzzle_node)
		local muzzle_rotation = Unit.world_rotation(weapon_unit, muzzle_node)
		local flamethrower_effect = current_action.particle_effect_flames
		local flamethrower_effect_3p = current_action.particle_effect_flames_3p
		local flamethrower_effect_3p_id = NetworkLookup.effects[flamethrower_effect_3p]

		if not bot_player then
			self._flamethrower_effect = World.create_particles(world, flamethrower_effect, muzzle_position, muzzle_rotation)

			World.link_particles(world, self._flamethrower_effect, weapon_unit, muzzle_node, Matrix4x4.identity(), "destroy")
		end

		if is_server or LEVEL_EDITOR_TEST then
			if bot_player then
				network_transmit:send_rpc_all("rpc_start_flamethrower", go_id, flamethrower_effect_3p_id)
			else
				network_transmit:send_rpc_clients("rpc_start_flamethrower", go_id, flamethrower_effect_3p_id)
			end
		else
			network_transmit:send_rpc_server("rpc_start_flamethrower", go_id, flamethrower_effect_3p_id)
		end

		if self._source_id then
			local owner = self.owner_player
			local is_husk = not owner.local_player

			WwiseWorld.set_switch(self.wwise_world, "husk", is_husk and "true" or "false", self._source_id)
			WwiseWorld.trigger_event(self.wwise_world, self.stop_sound_event, self._source_id)
		else
			self._source_id = WwiseWorld.make_auto_source(self.wwise_world, self.weapon_unit)
		end

		local owner = self.owner_player
		local is_husk = not owner.local_player

		WwiseWorld.set_switch(self.wwise_world, "husk", is_husk and "true" or "false", self._source_id)
		WwiseWorld.trigger_event(self.wwise_world, current_action.fire_sound_event, self._source_id)
	end

	self.overcharge_timer = self.overcharge_timer + dt

	if self.state == "shooting" and current_action.overcharge_interval <= self.overcharge_timer then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[current_action.overcharge_type]

		if self.buff_extension then
			local no_overcharge_crit = self.buff_extension:has_buff_perk("no_overcharge_crit")
			local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, current_action, t)

			if is_critical_strike and no_overcharge_crit then
				overcharge_amount = 0
			end
		end

		self.overcharge_extension:add_charge(overcharge_amount)

		self.overcharge_timer = 0
	end

	if self.state == "shooting" and t < self.max_flame_time then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local player_position = first_person_extension:current_position()

		if not Managers.player:owner(owner_unit).bot_player and not self._rumble_effect_id then
			self._rumble_effect_id = Managers.state.controller_features:add_effect("persistent_rumble", {
				rumble_effect = "reload_start"
			})
		end

		local do_damage = current_action.damage_interval
		local buff_target_number = 0

		if do_damage then
			if current_action.damage_interval <= self.damage_timer then
				self.damage_timer = 0
			end

			if self.damage_timer == 0 then
				self:_check_critical_strike(t)
				self:_select_targets(world, true)

				local targets = self.targets
				local check_buffs = true

				for i = 1, #targets do
					local processed_hit = false
					local current_target = targets[i]

					if Unit.alive(current_target) then
						local breed = Unit.get_data(current_target, "breed")
						local node = "j_spine"

						if breed then
							buff_target_number = buff_target_number + 1
							local rand = math.round(Math.random_range(1, #NODES))
							local random_node = NODES[rand]

							if Unit.has_node(current_target, random_node) then
								node = random_node or node
							end
						end

						local target_position = Unit.world_position(current_target, Unit.node(current_target, node))
						local direction = Vector3.normalize(target_position - player_position)
						local result = self:raycast_to_target(world, player_position, direction, current_target)

						if result then
							local power_level = self.power_level
							local consecutive_hits = self.old_targets and self.old_targets[current_target]
							local override_damage_profile = nil

							if consecutive_hits then
								power_level = power_level * math.clamp(consecutive_hits, 0, 4) * 0.5

								if consecutive_hits < 5 then
									override_damage_profile = current_action.initial_damage_profile or current_action.damage_profile or "default"
								end
							else
								override_damage_profile = current_action.initial_damage_profile or current_action.damage_profile or "default"
							end

							local data = DamageUtils.process_projectile_hit(world, self.item_name, owner_unit, is_server, result, current_action, direction, check_buffs, current_target, nil, self._is_critical_strike, power_level, override_damage_profile, buff_target_number)

							if data.buffs_checked then
								check_buffs = check_buffs and false
							end

							processed_hit = true
						end
					end

					targets[current_target] = processed_hit
				end

				local flamethrower_range = current_action.spray_range or SPRAY_RANGE
				local physics_world = World.get_data(world, "physics_world")
				local player_rotation = Unit.world_rotation(first_person_unit, 0)
				local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
				local result = PhysicsWorld.immediate_raycast_actors(physics_world, player_position, player_direction, flamethrower_range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
				local hit_unit = nil

				if result then
					local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
					local friendly_fire = DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player)
					local side = Managers.state.side.side_by_unit[self.owner_unit]
					local player_and_bot_units = side.PLAYER_AND_BOT_UNITS

					for _, hit in pairs(result) do
						local hit_actor = hit[INDEX_ACTOR]
						local potential_hit_unit = Actor.unit(hit_actor)
						local breed = hit_unit and Unit.get_data(hit_unit, "breed")

						if potential_hit_unit ~= self.owner_unit and not targets[potential_hit_unit] and not breed then
							if table.contains(player_and_bot_units, potential_hit_unit) then
								if friendly_fire then
									hit_unit = potential_hit_unit

									break
								end
							else
								hit_unit = potential_hit_unit

								break
							end
						end
					end

					if hit_unit and result then
						DamageUtils.process_projectile_hit(world, self.item_name, self.owner_unit, is_server, result, current_action, player_direction, check_buffs, hit_unit, nil, self._is_critical_strike, self.power_level)
					end
				end

				self:_clear_targets()
			end

			self.damage_timer = self.damage_timer + dt
		end
	elseif self.max_flame_time <= t and self.state == "shooting" then
		self.state = "shot"

		self:_stop_fx()
		self:_proc_spell_used(self.buff_extension)
	end
end

ActionFlamethrower._stop_fx = function (self)
	if self._fx_stopped then
		return
	end

	if self._flamethrower_effect then
		World.stop_spawning_particles(self.world, self._flamethrower_effect)

		self._flamethrower_effect = nil
	end

	local go_id = self.unit_id

	if self.is_server or LEVEL_EDITOR_TEST then
		if self.owner_player.bot_player then
			self.network_transmit:send_rpc_all("rpc_end_flamethrower", go_id)
		else
			self.network_transmit:send_rpc_clients("rpc_end_flamethrower", go_id)
		end
	else
		self.network_transmit:send_rpc_server("rpc_end_flamethrower", go_id)
	end

	local source_id = self._source_id

	if source_id then
		local owner = self.owner_player
		local is_husk = not owner.local_player

		WwiseWorld.set_switch(self.wwise_world, "husk", is_husk and "true" or "false", source_id)
		WwiseWorld.trigger_event(self.wwise_world, self.stop_sound_event, source_id)

		self._source_id = nil
	end

	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	if self._rumble_effect_id then
		Managers.state.controller_features:stop_effect(self._rumble_effect_id)

		self._rumble_effect_id = nil
	end
end

ActionFlamethrower.finish = function (self, reason)
	self:_clear_targets()

	if self.state ~= "shot" then
		self:_proc_spell_used(self.buff_extension)
	end

	self:_stop_fx()
end

ActionFlamethrower.destroy = function (self)
	if self._flamethrower_effect then
		World.destroy_particles(self.world, self._flamethrower_effect)

		self._flamethrower_effect = nil
	end
end

ActionFlamethrower._clear_targets = function (self)
	local targets = self.targets
	local old_targets = self.old_targets
	local current_targets = {}

	for i = 1, #targets do
		local current_target_count = old_targets and old_targets[targets[i]] or 0
		current_targets[targets[i]] = current_target_count + 1
	end

	table.clear(self.old_targets)
	table.clear(self.targets)

	self.old_targets = current_targets
end

ActionFlamethrower._select_targets = function (self, world, show_outline)
	local owner_unit = self.owner_unit
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local position_offset = Vector3(0, 0, -0.4)
	local player_position = first_person_extension:current_position() + position_offset
	local first_person_unit = self.first_person_unit
	local player_rotation = Unit.world_rotation(first_person_unit, 0)
	local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
	local ignore_hitting_allies = not Managers.state.difficulty:get_difficulty_settings().friendly_fire_ranged
	local start_point = player_position + player_direction * POSITION_TWEAK
	local broadphase_radius = 6
	local blackboard = BLACKBOARDS[owner_unit]
	local side = blackboard.side
	local ai_units = {}
	local ai_units_n = AiUtils.broadphase_query(player_position + player_direction * broadphase_radius, broadphase_radius, ai_units)
	local physics_world = World.get_data(world, "physics_world")

	PhysicsWorld.prepare_actors_for_overlap(physics_world, start_point, SPRAY_RANGE * SPRAY_RANGE)

	if ai_units_n > 0 then
		local targets = self.targets
		local v, q, m = Script.temp_count()
		local num_hit = 0

		for i = 1, ai_units_n do
			local hit_unit = ai_units[i]
			local hit_position = POSITION_LOOKUP[hit_unit] + Vector3.up()

			if targets[hit_unit] == nil then
				local is_enemy = side.enemy_units_lookup[hit_unit]

				if (is_enemy or not ignore_hitting_allies) and self:_is_infront_player(player_position, player_direction, hit_position) and self:_check_within_cone(start_point, player_direction, hit_unit, is_enemy) then
					targets[#targets + 1] = hit_unit
					targets[hit_unit] = false

					if is_enemy and ScriptUnit.extension(hit_unit, "health_system"):is_alive() then
						num_hit = num_hit + 1
					end
				end

				if MAX_TARGETS <= num_hit then
					break
				end
			end
		end

		Script.set_temp_count(v, q, m)
	end
end

ActionFlamethrower._check_within_cone = function (self, player_position, player_direction, target, is_enemy)
	local target_position = Unit.world_position(target, Unit.node(target, "j_neck"))
	local target_direction = Vector3.normalize(target_position - player_position)
	local target_cos_alpha = Vector3.dot(player_direction, target_direction)
	local dot_threshold = is_enemy and self.dot_check or 0.99

	if target_cos_alpha >= dot_threshold then
		return true
	end

	return false
end

ActionFlamethrower._is_infront_player = function (self, player_position, player_direction, hit_position)
	local player_to_hit_unit_dir = Vector3.normalize(hit_position - player_position)
	local dot = Vector3.dot(player_to_hit_unit_dir, player_direction)

	if dot > 0 then
		return true
	end
end

ActionFlamethrower.raycast_to_target = function (self, world, from_position, direction, target)
	local physics_world = World.get_data(world, "physics_world")
	local collision_filter = "filter_player_ray_projectile"
	local result = PhysicsWorld.immediate_raycast(physics_world, from_position, direction, SPRAY_RANGE, "all", "collision_filter", collision_filter)

	return result
end

ActionFlamethrower._check_critical_strike = function (self, t)
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, current_action, t)
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(is_critical_strike, self.buff_extension, hud_extension, nil, "on_critical_shot", nil)

	self._is_critical_strike = is_critical_strike
end
