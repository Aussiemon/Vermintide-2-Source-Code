CareerAbilityWHCaptain = class(CareerAbilityWHCaptain)

CareerAbilityWHCaptain.init = function (self, extension_init_context, unit, extension_init_data)
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

CareerAbilityWHCaptain.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

CareerAbilityWHCaptain.destroy = function (self)
	return
end

CareerAbilityWHCaptain.update = function (self, unit, input, dt, context, t)
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

		if input_extension:get("action_career_release") then
			self:_run_ability()
		end
	end
end

CareerAbilityWHCaptain._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled()
end

CareerAbilityWHCaptain._start_priming = function (self)
	if self._local_player then
		local world = self._world
		local effect_name = self._priming_fx_name
		self._priming_fx_id = World.create_particles(world, effect_name, Vector3.zero())
	end

	self._is_priming = true
end

CareerAbilityWHCaptain._update_priming = function (self, dt)
	local effect_id = self._priming_fx_id

	if effect_id then
		local world = self._world
		local owner_unit = self._owner_unit
		local owner_unit_position = POSITION_LOOKUP[owner_unit]

		World.move_particles(world, effect_id, owner_unit_position)
	end
end

CareerAbilityWHCaptain._stop_priming = function (self)
	local effect_id = self._priming_fx_id

	if effect_id then
		local world = self._world

		World.destroy_particles(world, effect_id)

		self._priming_fx_id = nil
	end

	self._is_priming = false
end

CareerAbilityWHCaptain._run_ability = function (self, new_initial_speed)
	self:_stop_priming()

	local world = self._world
	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local buff_system = Managers.state.entity:system("buff_system")
	local buff_to_add = "victor_witchhunter_activated_ability_crit_buff"

	if talent_extension:has_talent("victor_witchhunter_activated_ability_duration", "witch_hunter", true) then
		buff_to_add = "victor_witchhunter_activated_ability_duration"
	end

	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local career_extension = self._career_extension

	CharacterStateHelper.play_animation_event(owner_unit, "witch_hunter_active_ability")

	local radius = 10

	if talent_extension:has_talent("victor_witchhunter_activated_ability_radius", "witch_hunter", true) then
		radius = 15
	end

	local nearby_player_units = FrameTable.alloc_table()
	local proximity_extension = Managers.state.entity:system("proximity_system")
	local position = POSITION_LOOKUP[owner_unit]
	local broadphase = proximity_extension.player_units_broadphase

	Broadphase.query(broadphase, position, radius, nearby_player_units)

	for _, player_unit in pairs(nearby_player_units) do
		if Unit.alive(player_unit) then
			buff_system:add_buff(player_unit, buff_to_add, owner_unit)
		end
	end

	local explosion_template_name = "victor_captain_activated_ability_stagger"
	local explosion_template = ExplosionTemplates[explosion_template_name]
	local scale = 1
	local damage_source = "career_ability"
	local is_husk = false
	local rotation = Quaternion.identity()
	local career_power_level = career_extension:get_career_power_level()

	DamageUtils.create_explosion(world, owner_unit, position, rotation, explosion_template, scale, damage_source, is_server, is_husk, owner_unit, career_power_level)

	local owner_unit_go_id = network_manager:unit_game_object_id(owner_unit)
	local explosion_template_id = NetworkLookup.explosion_templates[explosion_template_name]
	local damage_source_id = NetworkLookup.damage_sources[damage_source]

	if is_server then
		network_transmit:send_rpc_clients("rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, career_power_level)
	else
		network_transmit:send_rpc_server("rpc_create_explosion", owner_unit_go_id, false, position, rotation, explosion_template_id, scale, damage_source_id, career_power_level)
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:animation_event("ability_shout")
		WwiseUtils.trigger_unit_event(self._world, "Play_career_ability_captain_shout_out", owner_unit, 0)
	end

	self:_play_vo()
	self:_play_vfx()
	career_extension:start_activated_ability_cooldown()
end

CareerAbilityWHCaptain._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

CareerAbilityWHCaptain._play_vfx = function (self)
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
