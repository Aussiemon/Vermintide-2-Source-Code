ActionHandgunLock = class(ActionHandgunLock)

ActionHandgunLock.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.owner_unit_first_person = first_person_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.world = world
	self.item_name = item_name
	self.targets = {}
	self.fire_timer = 0
	self.shots_fired = 0

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self.spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
	self._is_critical_strike = false
end

ActionHandgunLock.client_owner_start_action = function (self, new_action, t, chain_action_data)
	local weapon_unit = self.weapon_unit
	local owner_unit = self.owner_unit
	local first_person_unit = self.owner_unit_first_person
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	self.current_action = new_action
	self.targets = table.clone(chain_action_data.targets)
	self.target_count = #self.targets
	self.shots_per_target = 3
	self.current_target = 1
	self.abort_timer = nil
	self.shots_fired = 0
	self.time_between_targets = 0.4
	self.time_between_shots = 0.16
	self.shots_on_target = 0

	if is_critical_strike then
		Unit.flow_event(owner_unit, "vfx_critical_strike")
		Unit.flow_event(first_person_unit, "vfx_critical_strike")

		local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")

		if hud_extension then
			hud_extension.show_critical_indication = true
		end
	end

	self._is_critical_strike = is_critical_strike
end

ActionHandgunLock.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local target_count = self.target_count

	if self.shots_fired == target_count then
		if self.time_between_shots <= t then
			local weapon_extension = ScriptUnit.extension(self.weapon_unit, "weapon_system")

			weapon_extension:stop_action("action_abort")
		end

		return
	end

	if self.shots_fired == 0 then
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.trigger_event(wwise_world, "ui_activate_special_attack")
	end

	if self.fire_timer <= t then
		local current_target = self.targets[self.current_target]

		if self.shots_on_target == 3 then
			self.shots_on_target = 0
			self.shots_fired = self.shots_fired + 1
			self.current_target = self.current_target + 1
		end

		self.shots_on_target = self.shots_on_target + 1
		self.fire_timer = (self.shots_on_target < 3 and t + self.time_between_shots) or t + self.time_between_targets
		local ammo_extension = self.ammo_extension

		if ammo_extension and ammo_extension:ammo_count() > 0 then
			ammo_extension:use_ammo(1)
		end

		local event = current_action.anim_event
		local go_id = Managers.state.unit_storage:go_id(self.owner_unit)
		local event_id = NetworkLookup.anims[event]

		if not LEVEL_EDITOR_TEST then
			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_anim_event", event_id, go_id)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_anim_event", event_id, go_id)
			end
		end

		local owner_unit_1p = self.owner_unit_first_person

		Unit.animation_event(owner_unit_1p, event)
		Unit.animation_event(self.owner_unit, event)

		if Unit.alive(current_target) then
			local breed_data = Unit.get_data(current_target, "breed")
			local hit_zones = breed_data.hit_zones

			print(self.shots_on_target)

			local hit_zone = (self.shots_on_target == 1 and "left_arm") or (self.shots_on_target == 2 and "right_arm") or (self.shots_on_target == 3 and "head")
			local node = hit_zones[hit_zone].actors[1] or "j_spine"
			local first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")
			local target_position = Unit.world_position(current_target, Unit.node(current_target, node))
			local owner_unit_position = POSITION_LOOKUP[owner_unit_1p]
			local direction = Vector3.normalize(target_position - owner_unit_position)
			local rotation = Quaternion.look(direction)

			first_person_extension:force_look_rotation(rotation)

			local direction = Quaternion.forward(rotation)
			local result = self:raycast_to_target(world, owner_unit_position, direction, current_target)
			local owner_unit = self.owner_unit
			local is_server = self.is_server

			if current_action.alert_sound_range_fire then
				Managers.state.entity:system("ai_system"):alert_enemies_within_range(owner_unit, POSITION_LOOKUP[owner_unit], current_action.alert_sound_range_fire)
			end

			if result then
				DamageUtils.process_projectile_hit(world, self.item_name, owner_unit, is_server, result, current_action, direction, true, nil, nil, self._is_critical_strike)
			end

			local weapon_unit = self.weapon_unit
			local hit_position = (result and result[#result][1]) or owner_unit_position + direction * 100

			Unit.set_flow_variable(weapon_unit, "hit_position", hit_position)
			Unit.set_flow_variable(weapon_unit, "trail_life", Vector3.length(hit_position - owner_unit_position) * 0.1)
			Unit.flow_event(weapon_unit, "lua_bullet_trail")
			Unit.flow_event(weapon_unit, "lua_bullet_trail_set")
		end
	end
end

ActionHandgunLock.raycast_to_target = function (self, world, from_position, direction, target)
	local physics_world = World.get_data(world, "physics_world")
	local return_result = nil
	local collision_filter = "filter_player_ray_projectile"

	PhysicsWorld.prepare_actors_for_raycast(physics_world, from_position, direction, 0.01, 9)

	local result = PhysicsWorld.immediate_raycast(physics_world, from_position, direction, "all", "collision_filter", collision_filter)

	return result
end

ActionHandgunLock.finish = function (self, reason)
	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end
end

return
