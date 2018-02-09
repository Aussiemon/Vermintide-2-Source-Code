ActionFlamethrower = class(ActionFlamethrower)
local POSITION_TWEAK = -1.5
local SPRAY_RANGE = math.abs(POSITION_TWEAK) + 9
local SPRAY_RADIUS = 2
local PLAYER_SPRAY_RADIUS = 2
local MAX_TARGETS = 50
local NODES = {
	"j_leftshoulder",
	"j_rightshoulder",
	"j_spine1"
}
ActionFlamethrower.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.first_person_unit = first_person_unit
	self.weapon_unit = weapon_unit
	self.item_name = item_name
	self.is_server = is_server
	self.world = world
	self.nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self.fire_unit = nil
	self.flamepatch_spawn_pos = nil
	self.flamepatch_spawn_dir = nil
	self.owner_player = Managers.player:owner(owner_unit)
	self.wwise_world = Managers.world:wwise_world(self.world)
	self.stop_sound_event = "Stop_player_combat_weapon_drakegun_flamethrower_shoot"
	self.flamepatch_timer = 2.5

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.targets = {}
	self.old_targets = {}
	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.is_server = is_server
	self.network_transmit = Managers.state.network.network_transmit
	self.unit_id = Managers.state.network.unit_storage:go_id(owner_unit)
	self._is_critical_strike = false

	return 
end
ActionFlamethrower.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	local buff_extension = ScriptUnit.extension(self.owner_unit, "buff_system")
	self.current_action = new_action
	self.power_level = power_level
	self.state = "waiting_to_shoot"
	self.time_to_shoot = t + new_action.fire_time
	self.overcharge_timer = 0
	self.damage_timer = 1
	self.flamepatch_timer = 2.5
	self.stop_sound_event = new_action.stop_fire_event or self.stop_sound_event
	self.muzzle_node_name = new_action.fx_node or "fx_muzzle"
	self.vfx_stopped = false
	self.dot_check = new_action.dot_check or 0.95
	self.spray_range = (new_action.spray_range and math.abs(POSITION_TWEAK) + new_action.spray_range) or SPRAY_RANGE
	self.charge_value = (chain_action_data and chain_action_data.charge_value) or 1

	if not new_action.fire_stop_time or not (t + new_action.fire_stop_time) then
		slot6 = t + self.charge_value*(new_action.charge_fuel_time_multiplier or 3)
	end

	self.max_flame_time = slot6

	table.clear(self.old_targets)
	table.clear(self.targets)

	return 
end
local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4
ActionFlamethrower.client_owner_post_update = function (self, dt, t, world, can_damage)
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local current_action = self.current_action
	local is_server = self.is_server

	if self.state == "waiting_to_shoot" and self.time_to_shoot <= t then
		self.state = "shooting"
		local current_action = self.current_action
		local weapon_unit = self.weapon_unit
		local world = self.world
		local go_id = self.unit_id
		local cone_hypotenuse = math.sqrt(SPRAY_RANGE*SPRAY_RANGE + SPRAY_RADIUS*SPRAY_RADIUS)
		self.cone_cos_alpha = SPRAY_RANGE/cone_hypotenuse
		local flamethrower_range = current_action.range or SPRAY_RANGE*SPRAY_RANGE
		local flamethrower_effect = current_action.particle_effect_flames
		local flamethrower_effect_3p = current_action.particle_effect_flames_3p
		local flamethrower_impact_effect = current_action.particle_effect_impact
		local flamethrower_effect_id = NetworkLookup.effects[flamethrower_effect_3p]
		local flamethrower_impact_effect_id = NetworkLookup.effects[flamethrower_impact_effect]
		self.flamethrower_effect = World.create_particles(world, flamethrower_effect, Vector3.zero())
		self.flamethrower_impact_effect = World.create_particles(world, flamethrower_impact_effect, Vector3.zero())

		World.link_particles(world, self.flamethrower_effect, weapon_unit, Unit.node(weapon_unit, self.muzzle_node_name), Matrix4x4.identity(), "destroy")

		if self.is_server or LEVEL_EDITOR_TEST then
			self.network_transmit:send_rpc_clients("rpc_start_flamethrower", go_id, flamethrower_effect_id, flamethrower_impact_effect_id, flamethrower_range)
		else
			self.network_transmit:send_rpc_server("rpc_start_flamethrower", go_id, flamethrower_effect_id, flamethrower_impact_effect_id, flamethrower_range)
		end

		self.source_id = WwiseWorld.make_auto_source(self.wwise_world, self.weapon_unit)

		WwiseWorld.trigger_event(self.wwise_world, current_action.fire_sound_event, self.source_id)
	end

	self.overcharge_timer = self.overcharge_timer + dt

	if self.state == "shooting" and current_action.overcharge_interval <= self.overcharge_timer then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[current_action.overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)

		self.overcharge_timer = 0
	end

	if self.state == "shooting" and t < self.max_flame_time then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local player_position = first_person_extension.current_position(first_person_extension)

		if not Managers.player:owner(owner_unit).bot_player and not self._rumble_effect_id then
			self._rumble_effect_id = Managers.state.controller_features:add_effect("persistent_rumble", {
				rumble_effect = "reload_start"
			})
		end

		local do_damage = current_action.damage_interval

		if do_damage then
			if current_action.damage_interval <= self.damage_timer then
				self.damage_timer = 0
			end

			if self.damage_timer == 0 then
				self._check_critical_strike(self, t)
				self._select_targets(self, world, true)

				local targets = self.targets

				for i = 1, #targets, 1 do
					local current_target = targets[i]

					if Unit.alive(current_target) then
						local breed = Unit.get_data(current_target, "breed")
						local node = "j_spine"

						if breed then
							local rand = math.random()
							local chance = #NODES/1
							local cumalative_value = 0

							for i = 1, #NODES, 1 do
								cumalative_value = cumalative_value + chance

								if rand <= cumalative_value then
									node = NODES[i]

									break
								end
							end
						end

						local target_position = Unit.world_position(current_target, Unit.node(current_target, node))
						local direction = Vector3.normalize(target_position - player_position)
						local result = self.raycast_to_target(self, world, player_position, direction, current_target)

						if result then
							local power_level = self.power_level
							local consecutive_hits = self.old_targets and self.old_targets[current_target]
							local override_damage_profile = nil

							if consecutive_hits then
								power_level = power_level*math.clamp(consecutive_hits, 0, 4)*0.5

								if consecutive_hits < 5 then
									override_damage_profile = current_action.initial_damage_profile or current_action.damage_profile or "default"
								end
							else
								override_damage_profile = current_action.initial_damage_profile or current_action.damage_profile or "default"
							end

							DamageUtils.process_projectile_hit(world, self.item_name, self.owner_unit, self.is_server, result, current_action, direction, true, current_target, nil, self._is_critical_strike, power_level, override_damage_profile)
						end
					end
				end

				self._clear_targets(self)

				local weapon_unit = self.weapon_unit
				local muzzle_position = Unit.world_position(weapon_unit, Unit.node(weapon_unit, self.muzzle_node_name))
				local muzzle_rotation = Unit.world_rotation(weapon_unit, Unit.node(weapon_unit, self.muzzle_node_name))
				local muzzle_direction = Quaternion.forward(muzzle_rotation)
				local flamethrower_range = current_action.range or SPRAY_RANGE*SPRAY_RANGE
				local world = self.world
				local physics_world = World.get_data(world, "physics_world")
				local player_rotation = Unit.world_rotation(first_person_unit, 0)
				local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
				local result = PhysicsWorld.immediate_raycast_actors(physics_world, player_position, player_direction, flamethrower_range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
				local hit_unit = nil

				if result then
					local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
					local owner_player = self.owner_player
					local friendly_fire = DamageUtils.allow_friendly_fire_ranged(difficulty_settings, owner_player)

					for index, hit in pairs(result) do
						local potential_hit_position = hit[INDEX_POSITION]
						local hit_actor = hit[INDEX_ACTOR]
						local potential_hit_unit = Actor.unit(hit_actor)
						local breed = hit_unit and Unit.get_data(hit_unit, "breed")

						if potential_hit_unit ~= self.owner_unit and not breed then
							if table.contains(PLAYER_AND_BOT_UNITS, potential_hit_unit) then
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
						DamageUtils.process_projectile_hit(world, self.item_name, self.owner_unit, self.is_server, result, current_action, player_direction, true, hit_unit, nil, self._is_critical_strike, self.power_level)
					end
				end
			end

			self.damage_timer = self.damage_timer + dt
		end
	elseif self.max_flame_time <= t and self.state == "shooting" then
		self.state = "shot"

		if self.flamethrower_effect then
			World.stop_spawning_particles(self.world, self.flamethrower_effect)

			self.flamethrower_effect = nil
		end

		if self.flamethrower_impact_effect then
			World.stop_spawning_particles(self.world, self.flamethrower_impact_effect)

			self.flamethrower_impact_effect = nil
		end

		local go_id = self.unit_id

		if self.is_server or LEVEL_EDITOR_TEST then
			self.network_transmit:send_rpc_clients("rpc_end_flamethrower", go_id)
		else
			self.network_transmit:send_rpc_server("rpc_end_flamethrower", go_id)
		end

		WwiseWorld.trigger_event(self.wwise_world, self.stop_sound_event, self.source_id)

		local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = false
		end

		self.vfx_stopped = true
	end

	return 
end
ActionFlamethrower.finish = function (self, reason)
	self._clear_targets(self)

	if not self.vfx_stopped then
		if self.flamethrower_effect then
			World.stop_spawning_particles(self.world, self.flamethrower_effect)

			self.flamethrower_effect = nil
		end

		if self.flamethrower_impact_effect then
			World.stop_spawning_particles(self.world, self.flamethrower_impact_effect)

			self.flamethrower_impact_effect = nil
		end

		local go_id = self.unit_id

		if self.is_server or LEVEL_EDITOR_TEST then
			self.network_transmit:send_rpc_clients("rpc_end_flamethrower", go_id)
		else
			self.network_transmit:send_rpc_server("rpc_end_flamethrower", go_id)
		end

		WwiseWorld.trigger_event(self.wwise_world, self.stop_sound_event, self.source_id)

		local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = false
		end
	end

	return 
end
ActionFlamethrower.destroy = function (self)
	if self.flamethrower_effect then
		World.destroy_particles(self.world, self.flamethrower_effect)

		self.flamethrower_effect = nil
	end

	if self.flamethrower_impact_effect then
		World.destroy_particles(self.world, self.flamethrower_impact_effect)

		self.flamethrower_impact_effect = nil
	end

	return 
end
ActionFlamethrower._clear_targets = function (self)
	local targets = self.targets
	local old_targets = self.old_targets
	local current_targets = {}

	for i = 1, #targets, 1 do
		local current_target_count = (old_targets and old_targets[targets[i]]) or 0
		current_targets[targets[i]] = current_target_count + 1
	end

	table.clear(self.old_targets)
	table.clear(self.targets)

	self.old_targets = current_targets

	return 
end
ActionFlamethrower._select_targets = function (self, world, show_outline)
	local owner_unit = self.owner_unit
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local player_position = first_person_extension.current_position(first_person_extension)
	local first_person_unit = self.first_person_unit
	local player_rotation = Unit.world_rotation(first_person_unit, 0)
	local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))
	local ignore_hitting_allies = not Managers.state.difficulty:get_difficulty_settings().friendly_fire_ranged
	local start_point = player_position + player_direction*POSITION_TWEAK + player_direction*SPRAY_RADIUS
	local broadphase_radius = 6
	local ai_units = {}
	local ai_units_n = AiUtils.broadphase_query(player_position + player_direction*broadphase_radius, broadphase_radius, ai_units)
	local physics_world = World.get_data(world, "physics_world")

	PhysicsWorld.prepare_actors_for_overlap(physics_world, start_point, SPRAY_RANGE*SPRAY_RANGE)

	if ai_units then
		local num_hits = ai_units_n
		local targets = self.targets
		local v, q, m = Script.temp_count()
		local hit_units = {}
		local num_hit = 0

		for i = 1, num_hits, 1 do
			local hit_unit = ai_units[i]
			local hit_position = POSITION_LOOKUP[hit_unit] + Vector3.up()

			if not hit_units[hit_unit] then
				local breed = Unit.get_data(hit_unit, "breed")

				if table.contains(PLAYER_AND_BOT_UNITS, hit_unit) and not ignore_hitting_allies then
					if self._is_infront_player(self, player_position, player_direction, hit_position) and self._check_within_cone(self, start_point, player_direction, hit_unit, true) then
						targets[#targets + 1] = hit_unit
						hit_units[hit_unit] = true
					end
				elseif breed and self._is_infront_player(self, player_position, player_direction, hit_position) and self._check_within_cone(self, start_point, player_direction, hit_unit) then
					targets[#targets + 1] = hit_unit
					hit_units[hit_unit] = true

					if ScriptUnit.extension(hit_unit, "health_system"):is_alive() then
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

	return 
end
ActionFlamethrower._check_within_cone = function (self, player_position, player_direction, target, player)
	local cone_cos_alpha = self.cone_cos_alpha

	if player then
		local cone_hypotenuse = math.sqrt(SPRAY_RANGE*SPRAY_RANGE + PLAYER_SPRAY_RADIUS*PLAYER_SPRAY_RADIUS)
		cone_cos_alpha = SPRAY_RANGE/cone_hypotenuse
	end

	local target_position = Unit.world_position(target, Unit.node(target, "j_neck"))
	local target_direction = Vector3.normalize(target_position - player_position)
	local target_cos_alpha = Vector3.dot(player_direction, target_direction)
	local dot_threshold = nil

	if table.contains(PLAYER_AND_BOT_UNITS, target) then
		dot_threshold = 0.99
	else
		dot_threshold = self.dot_check
	end

	if dot_threshold <= target_cos_alpha then
		return true
	end

	return false
end
ActionFlamethrower._is_infront_player = function (self, player_position, player_direction, hit_position)
	local player_to_hit_unit_dir = Vector3.normalize(hit_position - player_position)
	local dot = Vector3.dot(player_to_hit_unit_dir, player_direction)

	if 0 < dot then
		return true
	end

	return 
end
ActionFlamethrower.raycast_to_target = function (self, world, from_position, direction, target)
	local physics_world = World.get_data(world, "physics_world")
	local collision_filter = "filter_player_ray_projectile"
	local result = PhysicsWorld.immediate_raycast(physics_world, from_position, direction, SPRAY_RANGE, "all", "collision_filter", collision_filter)

	return result
end
ActionFlamethrower._check_critical_strike = function (self, t)
	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local current_action = self.current_action
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, current_action, t)

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")
	end

	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = is_critical_strike
	end

	self._is_critical_strike = is_critical_strike

	return 
end

return 
