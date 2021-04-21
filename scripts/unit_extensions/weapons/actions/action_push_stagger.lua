ActionPushStagger = class(ActionPushStagger, ActionBase)

ActionPushStagger.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionPushStagger.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end

	self._status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.owner_unit_first_person = first_person_unit
	self.has_played_rumble_effect = false
	self.hit_units = {}
	self.push_units = {}
	self.waiting_for_callback = false
	self._player_direction = Vector3Box()
end

ActionPushStagger.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionPushStagger.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self.current_action = new_action
	local owner_unit = self.owner_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local career_extension = ScriptUnit.extension(owner_unit, "career_system")
	local status_extension = self._status_extension
	self.owner_buff_extension = buff_extension
	self.owner_career_extension = career_extension
	local _, melee_boost_curve_multiplier = career_extension:has_melee_boost()
	local is_critical_strike = ActionUtils.is_critical_strike(owner_unit, new_action, t)
	self.melee_boost_curve_multiplier = melee_boost_curve_multiplier
	self.power_level = power_level
	self.has_played_rumble_effect = false

	for hit_unit, _ in pairs(self.hit_units) do
		self.hit_units[hit_unit] = nil
	end

	for push_unit, _ in pairs(self.push_units) do
		self.push_units[push_unit] = nil
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

	self:_handle_fatigue(buff_extension, status_extension, new_action, true)

	self.block_end_time = t + 0.5
	local hud_extension = ScriptUnit.has_extension(owner_unit, "hud_system")
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

	self:_handle_critical_strike(is_critical_strike, buff_extension, hud_extension, first_person_extension, "on_critical_sweep", "Play_player_combat_crit_swing_2D")

	self._is_critical_strike = is_critical_strike

	if not LEVEL_EDITOR_TEST then
		local go_id = Managers.state.unit_storage:go_id(owner_unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, true)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, true)
		end
	end

	status_extension:set_blocking(true)
	buff_extension:trigger_procs("on_push_used")
	Unit.animation_event(self.owner_unit_first_person, "hitreaction_defend_reset")
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

		status_extension:set_blocking(false)
		status_extension:set_has_blocked(false)
	end

	if not callback_context.has_gotten_callback and can_damage then
		self.waiting_for_callback = true
		callback_context.num_hits = 0
		local physics_world = World.get_data(world, "physics_world")
		local pos = POSITION_LOOKUP[owner_unit]
		local buff_extension = self.owner_buff_extension
		local push_range = buff_extension:apply_buffs_to_value(2.5, "push_range")
		local radius = math.max(current_action.push_radius, push_range)
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
		local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
		local overlap_units = callback_context.overlap_units
		local hit_units = self.hit_units
		local push_units = self.push_units
		local num_hits = callback_context.num_hits
		local hit_once = false
		local player_direction = self._player_direction:unbox()
		local player_direction_flat = Vector3.flat(player_direction)
		local buff_extension = self.owner_buff_extension
		local push_half_angle = math.rad(buff_extension:apply_buffs_to_value(current_action.push_angle or 90, "block_angle") * 0.5)
		local outer_push_half_angle = math.rad(buff_extension:apply_buffs_to_value(current_action.outer_push_angle or 0, "block_angle") * 0.5)
		local total_hits = 0

		for i = 1, num_hits, 1 do
			repeat
				local hit_actor = overlap_units[i]:unbox()

				if hit_actor == nil then
					break
				end

				local hit_unit = Actor.unit(hit_actor)

				if hit_units[hit_unit] == nil and AiUtils.unit_alive(hit_unit) then
					hit_units[hit_unit] = true
					local is_enemy = DamageUtils.is_enemy(owner_unit, hit_unit)

					if not is_enemy then
						break
					end
				end

				local breed = Unit.get_data(hit_unit, "breed")

				if not breed then
					return
				end

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
					break
				end

				total_hits = total_hits + 1
				push_units[hit_unit] = {
					hit_actor = hit_actor,
					hit_zone_name = hit_zone_name,
					inner_push = inner_push,
					outer_push = outer_push,
					node = node,
					attack_direction = attack_direction,
					target_index = total_hits
				}
			until true
		end

		if total_hits == 0 then
			return
		end

		for hit_unit, info in pairs(push_units) do
			repeat
				if not Unit.alive(hit_unit) then
					break
				end

				if info.inner_push and not info.outer_push then
					local push_arc_event = "Play_player_push_ark_success"
					local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")

					first_person_extension:play_hud_sound_event(push_arc_event, nil, false)
				end

				local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
				local hit_zone_id = NetworkLookup.hit_zones[info.hit_zone_name]
				local power_level = self.power_level
				local damage_profile_id_to_use = (info.inner_push and self.damage_profile_inner_id) or self.damage_profile_outer_id
				local damage_profile_to_use = (info.inner_push and self.damage_profile_inner) or self.damage_profile_outer
				local target_settings = damage_profile_to_use.default_target
				local hit_position = Unit.world_position(hit_unit, info.node)
				local hit_effect = current_action.impact_particle_effect or "fx/impact_block_push"
				local hit_unit_root_pos = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
				local attacker_unit_root_pos = POSITION_LOOKUP[owner_unit] or Unit.world_position(owner_unit, 0)
				local attack_direction = Vector3.normalize(hit_unit_root_pos - attacker_unit_root_pos)

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
					Application.warning("[ActionPushStagger] Missing sound event for push action in unit %q.", self.weapon_unit)
				end

				local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
				local damage_source = self.item_name
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local is_critical_strike = self._is_critical_strike
				local target_index = info.target_index or nil

				weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id_to_use, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", false, "can_stagger", true, "total_hits", total_hits)

				if Managers.state.controller_features and self.owner.local_player and not self.has_played_rumble_effect then
					Managers.state.controller_features:add_effect("rumble", {
						rumble_effect = "push_hit"
					})

					self.has_played_rumble_effect = true
				end

				Managers.state.entity:system("play_go_tutorial_system"):register_push(hit_unit)
				buff_extension:trigger_procs("on_push", hit_unit, damage_source)

				local player_manager = Managers.player
				local owner_player = player_manager:owner(self.owner_unit)

				if not LEVEL_EDITOR_TEST and not player_manager.is_server then
					local peer_id = owner_player:network_id()
					local local_player_id = owner_player:local_player_id()
					local event_id = NetworkLookup.proc_events.on_push

					Managers.state.network.network_transmit:send_rpc_server("rpc_proc_event", peer_id, local_player_id, event_id)
				end

				hit_once = true
			until true
		end

		if hit_once and not self.bot_player then
			Managers.state.controller_features:add_effect("rumble", {
				rumble_effect = "hit_character_light"
			})
		end
	end
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
	local owner_unit = self.owner_unit

	if reason ~= "new_interupting_action" then
		local reload_when_out_of_ammo_condition_func = current_action.reload_when_out_of_ammo_condition_func
		local do_out_of_ammo_reload = (not reload_when_out_of_ammo_condition_func and true) or reload_when_out_of_ammo_condition_func(owner_unit, reason)

		if ammo_extension and current_action.reload_when_out_of_ammo and do_out_of_ammo_reload and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
			local play_reload_animation = true

			ammo_extension:start_reload(play_reload_animation)
		end
	end

	if not LEVEL_EDITOR_TEST then
		local go_id = Managers.state.unit_storage:go_id(owner_unit)

		if self.is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_set_blocking", go_id, false)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_set_blocking", go_id, false)
		end
	end

	local status_extension = self._status_extension

	status_extension:set_blocking(false)
	status_extension:set_has_blocked(false)
end

return
