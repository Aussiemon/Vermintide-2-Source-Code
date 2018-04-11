ActionPushStagger = class(ActionPushStagger)
local BLACKBOARDS = BLACKBOARDS
local PUSH_UPGRADES = {
	basic_sweep_push = "heavy_sweep_push",
	dagger_sweep_push = "upgraded_sweep_push",
	heavy_sweep_push = "super_heavy_sweep_push",
	weak_sweep_push = "upgraded_sweep_push"
}
ActionPushStagger.init = function (self, world, item_name, is_server, owner_unit, weapon_unit, first_person_unit, weapon_unit, weapon_system)
	self.owner_unit = owner_unit
	self.owner_unit_first_person = first_person_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.weapon_system = weapon_system
	self.item_name = item_name
	self._status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.has_played_rumble_effect = false
	self.owner = Managers.player:unit_owner(self.owner_unit)
	self._is_critical_strike = false
	self.hit_units = {}
	self.waiting_for_callback = false
	self._player_direction = Vector3Box()

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	return 
end
ActionPushStagger.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	local owner_unit = self.owner_unit
	local first_person_unit = self.owner_unit_first_person
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local career_extension = ScriptUnit.extension(owner_unit, "career_system")
	local has_melee_boost, boost_amount = career_extension.has_melee_boost(career_extension)
	self.melee_boost_curve_multiplier = boost_amount
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t) or has_melee_boost
	self.power_level = power_level
	self.owner_buff_extension = buff_extension
	self.owner_career_extension = career_extension
	self.current_action = new_action
	self.has_played_rumble_effect = false

	for k, v in pairs(self.hit_units) do
		self.hit_units[k] = nil
	end

	self.bot_player = Managers.player:owner(owner_unit).bot_player

	if not self.bot_player then
		Managers.state.controller_features:add_effect("rumble", {
			rumble_effect = "light_swing"
		})
	end

	local action_hand = action_init_data and action_init_data.action_hand
	local damage_profile_name_inner = (action_hand and new_action["damage_profile_inner_" .. action_hand]) or new_action.damage_profile_inner or "default"
	self.damage_profile_inner_id = NetworkLookup.damage_profiles[damage_profile_name_inner]
	self.damage_profile_inner = DamageProfileTemplates[damage_profile_name_inner]
	local damage_profile_name_outer = (action_hand and new_action["damage_profile_outer_" .. action_hand]) or new_action.damage_profile_outer or "default"
	self.damage_profile_outer_id = NetworkLookup.damage_profiles[damage_profile_name_outer]
	self.damage_profile_outer = DamageProfileTemplates[damage_profile_name_outer]
	local status_extension = self._status_extension
	local _, procced = buff_extension.apply_buffs_to_value(buff_extension, 0, StatBuffIndex.NO_PUSH_FATIGUE_COST)

	if not procced then
		local cost = "action_push"

		if new_action.fatigue_cost then
			cost = new_action.fatigue_cost
		end

		if buff_extension.has_buff_perk(buff_extension, "slayer_stamina") then
			cost = "action_stun_push"
		end

		status_extension.add_fatigue_points(status_extension, cost)
		status_extension.set_has_pushed(status_extension)
	end

	self.block_end_time = t + 0.5

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

	if not LEVEL_EDITOR_TEST then
		local go_id = Managers.state.unit_storage:go_id(owner_unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, true)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, true)
		end
	end

	status_extension.set_blocking(status_extension, true)
	buff_extension.trigger_procs(buff_extension, "on_push_used")
	Unit.animation_event(self.owner_unit_first_person, "hitreaction_defend_reset")

	return 
end
local callback_context = {
	has_gotten_callback = false,
	overlap_units = {}
}

local function callback(actors)
	callback_context.has_gotten_callback = true
	local overlap_units = callback_context.overlap_units

	for k, actor in pairs(actors) do
		callback_context.num_hits = callback_context.num_hits + 1

		if overlap_units[callback_context.num_hits] == nil then
			overlap_units[callback_context.num_hits] = ActorBox()
		end

		overlap_units[callback_context.num_hits]:store(actor)
	end

	return 
end

ActionPushStagger.client_owner_post_update = function (self, dt, t, world, can_damage)
	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local weapon_system = self.weapon_system

	if self.block_end_time and self.block_end_time < t then
		if not LEVEL_EDITOR_TEST then
			local go_id = Managers.state.unit_storage:go_id(owner_unit)

			if self.is_server then
				Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, false)
			else
				Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, false)
			end
		end

		local status_extension = self._status_extension

		status_extension.set_blocking(status_extension, false)
		status_extension.set_has_blocked(status_extension, false)
	end

	if not callback_context.has_gotten_callback and can_damage then
		self.waiting_for_callback = true
		callback_context.num_hits = 0
		local physics_world = World.get_data(world, "physics_world")
		local pos = POSITION_LOOKUP[owner_unit]
		local radius = current_action.push_radius
		local collision_filter = "filter_melee_push"

		PhysicsWorld.overlap(physics_world, callback, "shape", "sphere", "position", pos, "size", radius, "types", "dynamics", "collision_filter", collision_filter)

		local first_person_unit = self.owner_unit_first_person
		local player_rotation = Unit.world_rotation(first_person_unit, 0)
		local player_direction = Vector3.normalize(Quaternion.forward(player_rotation))

		self._player_direction:store(player_direction)
	elseif self.waiting_for_callback and callback_context.has_gotten_callback then
		self.waiting_for_callback = false
		callback_context.has_gotten_callback = false
		local network_manager = Managers.state.network
		local attacker_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)
		local overlap_units = callback_context.overlap_units
		local hit_units = self.hit_units
		local num_hits = callback_context.num_hits
		local hit_once = false
		local player_direction = self._player_direction:unbox()
		local player_direction_flat = Vector3.flat(player_direction)
		local buff_extension = self.owner_buff_extension
		local push_half_angle = math.rad(buff_extension.apply_buffs_to_value(buff_extension, current_action.push_angle or 90, StatBuffIndex.BLOCK_ANGLE) * 0.5)
		local outer_push_half_angle = math.rad(buff_extension.apply_buffs_to_value(buff_extension, current_action.outer_push_angle or 0, StatBuffIndex.BLOCK_ANGLE) * 0.5)

		for i = 1, num_hits, 1 do
			local hit_actor = overlap_units[i]:unbox()

			if hit_actor == nil then
			else
				local hit_unit = Actor.unit(hit_actor)
				local is_enemy = DamageUtils.is_enemy(hit_unit)

				if is_enemy and hit_units[hit_unit] == nil then
					hit_units[hit_unit] = true
					local breed = Unit.get_data(hit_unit, "breed")
					local node = Actor.node(hit_actor)
					local hit_zone = breed.hit_zones_lookup[node]
					local hit_zone_name = hit_zone.name
					local attack_direction = Vector3.normalize(POSITION_LOOKUP[hit_unit] - POSITION_LOOKUP[owner_unit])
					local attack_direction_flat = Vector3.flat(attack_direction)
					local dot = Vector3.dot(attack_direction_flat, player_direction_flat)
					local angle_to_target = math.acos(dot)
					local inner_push = angle_to_target <= push_half_angle
					local outer_push = push_half_angle < angle_to_target and angle_to_target <= outer_push_half_angle

					if not inner_push and not outer_push then
					else
						if inner_push and not outer_push then
							local push_arc_event = "Play_player_push_ark_success"
							local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

							first_person_extension.play_hud_sound_event(first_person_extension, push_arc_event, nil, false)
						end

						local hit_unit_id = network_manager.unit_game_object_id(network_manager, hit_unit)
						local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]
						local power_level = self.power_level
						local damage_profile_id_to_use = (inner_push and self.damage_profile_inner_id) or self.damage_profile_outer_id
						local damage_profile_to_use = (inner_push and self.damage_profile_inner) or self.damage_profile_outer
						local target_settings = damage_profile_to_use.default_target
						local hit_position = Unit.world_position(hit_unit, node)
						local hit_effect = current_action.impact_particle_effect or "fx/impact_block_push"

						if hit_effect then
							EffectHelper.player_melee_hit_particles(world, hit_effect, hit_position, attack_direction, nil, hit_unit)
						end

						local sound_event = current_action.stagger_impact_sound_event or "blunt_hit"

						if sound_event then
							local attack_template = AttackTemplates[target_settings.attack_template]
							local sound_type = (attack_template and attack_template.sound_type) or "stun_heavy"
							local husk = self.bot_player

							EffectHelper.play_melee_hit_effects(sound_event, world, hit_position, sound_type, husk, hit_unit)

							local sound_event_id = NetworkLookup.sound_events[sound_event]
							local sound_type_id = NetworkLookup.melee_impact_sound_types[sound_type]
							hit_position = Vector3(math.clamp(hit_position.x, -600, 600), math.clamp(hit_position.y, -600, 600), math.clamp(hit_position.z, -600, 600))

							if self.is_server then
								network_manager.network_transmit:send_rpc_clients("rpc_play_melee_hit_effects", sound_event_id, hit_position, sound_type_id, hit_unit_id)
							else
								network_manager.network_transmit:send_rpc_server("rpc_play_melee_hit_effects", sound_event_id, hit_position, sound_type_id, hit_unit_id)
							end
						else
							Application.warning("[ActionSweep] Missing sound event for push action in unit %q.", self.weapon_unit)
						end

						local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
						local damage_source = self.item_name
						local damage_source_id = NetworkLookup.damage_sources[damage_source]
						local is_critical_strike = self._is_critical_strike

						weapon_system.send_rpc_attack_hit(weapon_system, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id_to_use, "power_level", power_level, "hit_target_index", nil, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", false, "can_stagger", true)

						if Managers.state.controller_features and self.owner.local_player and not self.has_played_rumble_effect then
							Managers.state.controller_features:add_effect("rumble", {
								rumble_effect = "push_hit"
							})

							self.has_played_rumble_effect = true
						end

						Managers.state.entity:system("play_go_tutorial_system"):register_push(hit_unit)

						local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")

						buff_extension.trigger_procs(buff_extension, "on_push", hit_unit, damage_source)

						hit_once = true
					end
				end
			end
		end

		if hit_once and not self.bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "hit_character_light"
			})
		end
	end

	return 
end
ActionPushStagger.finish = function (self, reason)
	local hud_extension = ScriptUnit.has_extension(self.owner_unit, "hud_system")

	if hud_extension then
		hud_extension.show_critical_indication = false
	end

	self.waiting_for_callback = false
	callback_context.has_gotten_callback = false
	local ammo_extension = self.ammo_extension
	local current_action = self.current_action

	if reason ~= "new_interupting_action" and ammo_extension and current_action.reload_when_out_of_ammo and ammo_extension.ammo_count(ammo_extension) == 0 and ammo_extension.can_reload(ammo_extension) then
		local play_reload_animation = true

		ammo_extension.start_reload(ammo_extension, play_reload_animation)
	end

	local owner_unit = self.owner_unit

	if not LEVEL_EDITOR_TEST then
		local go_id = Managers.state.unit_storage:go_id(owner_unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, false)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, false)
		end
	end

	local status_extension = self._status_extension

	status_extension.set_blocking(status_extension, false)
	status_extension.set_has_blocked(status_extension, false)

	return 
end

return 
