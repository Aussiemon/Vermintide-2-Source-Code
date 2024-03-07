-- chunkname: @scripts/unit_extensions/weapons/actions/action_warpfire_thrower.lua

ActionWarpfireThrower = class(ActionWarpfireThrower, ActionBase)

local POSITION_TWEAK = -1.5
local SPRAY_RANGE = math.abs(POSITION_TWEAK) + 10
local SPRAY_RADIUS = 2
local MAX_TARGETS = 50
local NODES = {
	"j_leftshoulder",
	"j_rightshoulder",
	"j_spine1",
}
local NUM_NODES = #NODES

ActionWarpfireThrower.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionWarpfireThrower.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.overcharge_extension = ScriptUnit.extension(owner_unit, "overcharge_system")
	self.buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	self.targets = {}
	self.old_targets = {}
	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.stop_sound_event = "Stop_player_combat_weapon_drakegun_flamethrower_shoot"
	self.unit_id = Managers.state.network.unit_storage:go_id(owner_unit)
end

ActionWarpfireThrower.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionWarpfireThrower.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	self.current_action = new_action
	self.power_level = power_level
	self.state = "waiting_to_shoot"

	local value, threshold, max_value = self.overcharge_extension:current_overcharge_status()

	self.time1 = t
	self.time_to_shoot = t + new_action.fire_time
	self.overcharge_timer = 0
	self.damage_timer = 1
	self.stop_sound_event = new_action.stop_fire_event or self.stop_sound_event
	self.muzzle_node_name = new_action.fx_node or "fx_muzzle"
	self._fx_stopped = false
end

local INDEX_ACTOR = 4

ActionWarpfireThrower.client_owner_post_update = function (self, dt, t, world, can_damage)
	if self.state == "wait_for_overcharge" then
		return
	end

	local owner_unit = self.owner_unit
	local first_person_unit = self.first_person_unit
	local current_action = self.current_action
	local owner_player = self.owner_player
	local bot_player = owner_player.bot_player
	local network_transmit = self.network_transmit
	local is_server = self.is_server

	if self.state == "waiting_to_shoot" and t >= self.time_to_shoot then
		self.state = "shooting"

		local muzzle_unit = current_action.first_person_muzzle and first_person_unit or self.weapon_unit
		local muzzle_node_name = self.muzzle_node_name
		local go_id = self.unit_id
		local muzzle_node = Unit.node(muzzle_unit, muzzle_node_name)
		local muzzle_position = Unit.world_position(muzzle_unit, muzzle_node)
		local muzzle_rotation = Unit.world_rotation(muzzle_unit, muzzle_node)
		local flamethrower_effect = current_action.particle_effect_flames
		local flamethrower_effect_3p = current_action.particle_effect_flames_3p
		local flamethrower_effect_3p_id = NetworkLookup.effects[flamethrower_effect_3p]

		if not bot_player then
			self._flamethrower_effect = World.create_particles(world, flamethrower_effect, muzzle_position, muzzle_rotation)

			World.link_particles(world, self._flamethrower_effect, muzzle_unit, muzzle_node, Matrix4x4.identity(), "destroy")
		end

		if not current_action.first_person_muzzle then
			if is_server or LEVEL_EDITOR_TEST then
				if bot_player then
					network_transmit:send_rpc_all("rpc_start_flamethrower", go_id, flamethrower_effect_3p_id)
				else
					network_transmit:send_rpc_clients("rpc_start_flamethrower", go_id, flamethrower_effect_3p_id)
				end
			else
				network_transmit:send_rpc_server("rpc_start_flamethrower", go_id, flamethrower_effect_3p_id)
			end
		end

		if current_action.fire_sound_event then
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
	end

	self.overcharge_timer = self.overcharge_timer + dt

	if self.state == "shooting" and self.overcharge_timer >= current_action.overcharge_interval then
		local overcharge_amount = PlayerUnitStatusSettings.overcharge_values[current_action.overcharge_type]

		self.overcharge_extension:add_charge(overcharge_amount)

		self.overcharge_timer = 0
	end

	local max_overcharge = self.overcharge_extension.max_value - 1
	local current_overcharge_value = self.overcharge_extension:get_overcharge_value()
	local is_max_overcharge = max_overcharge <= current_overcharge_value

	if self.state == "shooting" and not is_max_overcharge then
		local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
		local player_position = first_person_extension:current_position()

		if not Managers.player:owner(owner_unit).bot_player and not self._rumble_effect_id then
			self._rumble_effect_id = Managers.state.controller_features:add_effect("persistent_rumble", {
				rumble_effect = "reload_start",
			})
		end
	elseif is_max_overcharge and self.state == "shooting" then
		self.state = "shot"

		self:_stop_fx()
		self.weapon_extension:stop_action("action_complete")
	end
end

ActionWarpfireThrower.finish = function (self, reason, data)
	print(Managers.time:time("game") - self.time1)

	if self.state == "wait_for_overcharge" then
		return
	end

	if self.state ~= "shot" then
		self:_proc_spell_used(self.buff_extension)
	end

	self:_stop_fx()
end

ActionWarpfireThrower._stop_fx = function (self)
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

ActionWarpfireThrower.destroy = function (self)
	if self._flamethrower_effect then
		World.destroy_particles(self.world, self._flamethrower_effect)

		self._flamethrower_effect = nil
	end
end

ActionWarpfireThrower._select_targets = function (self, world, show_outline)
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

					if is_enemy and HEALTH_ALIVE[hit_unit] then
						num_hit = num_hit + 1
					end
				end

				if num_hit >= MAX_TARGETS then
					break
				end
			end
		end

		Script.set_temp_count(v, q, m)
	end
end

ActionWarpfireThrower._check_within_cone = function (self, player_position, player_direction, target, is_enemy)
	local target_position = Unit.world_position(target, Unit.node(target, "j_neck"))
	local target_direction = Vector3.normalize(target_position - player_position)
	local target_cos_alpha = Vector3.dot(player_direction, target_direction)
	local dot_threshold = is_enemy and self.dot_check or 0.99

	if dot_threshold <= target_cos_alpha then
		return true
	end

	return false
end

ActionWarpfireThrower._is_infront_player = function (self, player_position, player_direction, hit_position)
	local player_to_hit_unit_dir = Vector3.normalize(hit_position - player_position)
	local dot = Vector3.dot(player_to_hit_unit_dir, player_direction)

	if dot > 0 then
		return true
	end
end

ActionWarpfireThrower.raycast_to_target = function (self, world, from_position, direction, target)
	local physics_world = World.get_data(world, "physics_world")
	local collision_filter = "filter_player_ray_projectile"
	local result = PhysicsWorld.immediate_raycast(physics_world, from_position, direction, SPRAY_RANGE, "all", "collision_filter", collision_filter)

	return result
end

ActionWarpfireThrower._check_critical_strike = function (self, t)
	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, current_action, t)
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

	self:_handle_critical_strike(is_critical_strike, self.buff_extension, hud_extension, nil, "on_critical_shot", nil)

	self._is_critical_strike = is_critical_strike
end

ActionWarpfireThrower._clear_targets = function (self)
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
