CareerAbilityESMercenary = class(CareerAbilityESMercenary)

CareerAbilityESMercenary.init = function (self, extension_init_context, unit, extension_init_data)
	self._owner_unit = unit
	self._world = extension_init_context.world
	self._wwise_world = Managers.world:wwise_world(self._world)
	local player = extension_init_data.player
	self._player = player
	self._is_server = player.is_server
	self._local_player = player.local_player
	self._bot_player = player.bot_player
	self._network_manager = Managers.state.network
	self._input_manager = Managers.input
	self._priming_fx_id = nil
	self._priming_fx_name = "fx/chr_ironbreaker_aoe_decal"
end

CareerAbilityESMercenary.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

CareerAbilityESMercenary.destroy = function (self)
	return
end

CareerAbilityESMercenary.update = function (self, unit, input, dt, context, t)
	if not self:_ability_available() then
		return
	end

	local input_extension = self._input_extension

	if not input_extension then
		return
	end

	if not self._is_priming then
		if input_extension:get("action_career") then
			self:_start_priming()
		end
	elseif self._is_priming then
		self:_update_priming(dt)

		if input_extension:get("action_two") then
			self:_stop_priming()

			return
		end

		if input_extension:get("weapon_reload") then
			self:_stop_priming()

			return
		end

		if not input_extension:get("action_career_hold") then
			self:_run_ability()
		end
	end
end

CareerAbilityESMercenary.stop = function (self, reason)
	if self._is_priming then
		self:_stop_priming()
	end
end

CareerAbilityESMercenary._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled()
end

CareerAbilityESMercenary._start_priming = function (self)
	if self._local_player then
		local world = self._world
		local effect_name = self._priming_fx_name
		self._priming_fx_id = World.create_particles(world, effect_name, Vector3.zero())
	end

	self._is_priming = true
end

CareerAbilityESMercenary._update_priming = function (self, dt)
	local effect_id = self._priming_fx_id

	if effect_id then
		local world = self._world
		local owner_unit = self._owner_unit
		local owner_unit_position = POSITION_LOOKUP[owner_unit]

		World.move_particles(world, effect_id, owner_unit_position)
	end
end

CareerAbilityESMercenary._stop_priming = function (self)
	local effect_id = self._priming_fx_id

	if effect_id then
		local world = self._world

		World.destroy_particles(world, effect_id)

		self._priming_fx_id = nil
	end

	self._is_priming = false
end

CareerAbilityESMercenary._run_ability = function (self, new_initial_speed)
	self:_stop_priming()

	local world = self._world
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	CharacterStateHelper.play_animation_event(owner_unit, "mercenary_active_ability")

	local radius = 15
	local nearby_player_units = FrameTable.alloc_table()
	local proximity_extension = Managers.state.entity:system("proximity_system")
	local broadphase = proximity_extension.player_units_broadphase

	Broadphase.query(broadphase, POSITION_LOOKUP[owner_unit], radius, nearby_player_units)

	local revivable_units = FrameTable.alloc_table()

	for _, player_unit in pairs(nearby_player_units) do
		local status_extension = ScriptUnit.extension(player_unit, "status_system")

		if status_extension:is_available_for_career_revive() then
			revivable_units[#revivable_units + 1] = player_unit
		end
	end

	local owner_unit_go_id = network_manager:unit_game_object_id(owner_unit)

	if talent_extension:has_talent("markus_mercenary_activated_ability_revive") then
		for _, player_unit in pairs(revivable_units) do
			local target_unit_go_id = network_manager:unit_game_object_id(player_unit)

			network_transmit:send_rpc_server("rpc_request_revive", target_unit_go_id, owner_unit_go_id)
			CharacterStateHelper.play_animation_event(player_unit, "revive_complete")
		end
	end

	local heal_amount = 25

	if talent_extension:has_talent("markus_mercenary_activated_ability_improved_healing") then
		heal_amount = 40
	end

	local heal_type_id = NetworkLookup.heal_types.career_skill

	for _, player_unit in pairs(nearby_player_units) do
		local unit_go_id = network_manager:unit_game_object_id(player_unit)

		if unit_go_id then
			network_transmit:send_rpc_server("rpc_request_heal", unit_go_id, heal_amount, heal_type_id)
		end
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:animation_event("ability_shout")
		first_person_extension:play_unit_sound_event("Play_career_ability_mercenary_shout_out", owner_unit, 0, true)
	end

	local explosion_template_name = "kruber_mercenary_activated_ability_stagger"
	local explosion_template = ExplosionTemplates[explosion_template_name]
	local scale = 1
	local damage_source = "career_ability"
	local is_husk = false
	local rotation = Quaternion.identity()
	local career_power_level = career_extension:get_career_power_level()
	local player_and_bot_units = PLAYER_AND_BOT_UNITS
	local num_player_units = #player_and_bot_units

	for i = 1, num_player_units, 1 do
		local player_unit = player_and_bot_units[i]
		local friendly_status_extension = ScriptUnit.extension(player_unit, "status_system")

		if friendly_status_extension then
			friendly_status_extension:add_attack_intensity(20, 20)
		end
	end

	self:_play_vo()
	self:_play_vfx()
	career_extension:start_activated_ability_cooldown()

	local position = POSITION_LOOKUP[owner_unit]
	local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	if is_server then
		network_transmit:send_rpc_clients("rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, career_power_level, false)
	else
		network_transmit:send_rpc_server("rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, career_power_level, false)
	end

	DamageUtils.create_explosion(world, owner_unit, position, rotation, explosion_template, scale, damage_source, is_server, is_husk, owner_unit, career_power_level, false)
end

CareerAbilityESMercenary._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

CareerAbilityESMercenary._play_vfx = function (self)
	local owner_unit = self._owner_unit
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local owner_unit_id = network_manager:unit_game_object_id(owner_unit)
	local effect_name = "fx/chr_kruber_shockwave"
	local effect_id = NetworkLookup.effects[effect_name]
	local game_object_id = owner_unit_id
	local node_id = 0
	local offset = Vector3(0, 0, 0)
	local rotation_offset = Quaternion.identity()
	local linked = false

	Managers.state.event:trigger("event_play_particle_effect", effect_name, owner_unit, node_id, offset, rotation_offset, linked)

	if Managers.player.is_server then
		network_transmit:send_rpc_clients("rpc_play_particle_effect", effect_id, game_object_id, node_id, offset, rotation_offset, linked)
	else
		network_transmit:send_rpc_server("rpc_play_particle_effect", effect_id, game_object_id, node_id, offset, rotation_offset, linked)
	end
end

return
