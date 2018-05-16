CareerAbilityDRIronbreaker = class(CareerAbilityDRIronbreaker)

CareerAbilityDRIronbreaker.init = function (self, extension_init_context, unit, extension_init_data)
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

CareerAbilityDRIronbreaker.extensions_ready = function (self, world, unit)
	self._first_person_extension = ScriptUnit.has_extension(unit, "first_person_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._career_extension = ScriptUnit.extension(unit, "career_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._input_extension = ScriptUnit.has_extension(unit, "input_system")

	if self._first_person_extension then
		self._first_person_unit = self._first_person_extension:get_first_person_unit()
	end
end

CareerAbilityDRIronbreaker.destroy = function (self)
	return
end

CareerAbilityDRIronbreaker.update = function (self, unit, input, dt, context, t)
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

CareerAbilityDRIronbreaker._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension

	return career_extension:can_use_activated_ability() and not status_extension:is_disabled()
end

CareerAbilityDRIronbreaker._start_priming = function (self)
	if self._local_player then
		local world = self._world
		local effect_name = self._priming_fx_name
		self._priming_fx_id = World.create_particles(world, effect_name, Vector3.zero())
	end

	self._is_priming = true
end

CareerAbilityDRIronbreaker._update_priming = function (self, dt)
	local effect_id = self._priming_fx_id

	if effect_id then
		local world = self._world
		local owner_unit = self._owner_unit
		local owner_unit_position = POSITION_LOOKUP[owner_unit]

		World.move_particles(world, effect_id, owner_unit_position)
	end
end

CareerAbilityDRIronbreaker._stop_priming = function (self)
	local effect_id = self._priming_fx_id

	if effect_id then
		local world = self._world

		World.destroy_particles(world, effect_id)

		self._priming_fx_id = nil
	end

	self._is_priming = false
end

CareerAbilityDRIronbreaker._run_ability = function (self)
	self:_stop_priming()

	local owner_unit = self._owner_unit
	local is_server = self._is_server
	local local_player = self._local_player
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local owner_unit_id = network_manager:unit_game_object_id(owner_unit)
	local career_extension = self._career_extension
	local buff_extension = self._buff_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")

	CharacterStateHelper.play_animation_event(owner_unit, "iron_breaker_active_ability")

	local buff_name_1 = "bardin_ironbreaker_activated_ability"
	local buff_name_2 = "bardin_ironbreaker_activated_ability_block_cost"

	if talent_extension:has_talent("bardin_ironbreaker_activated_ability_duration", "dwarf_ranger", true) then
		buff_name_1 = "bardin_ironbreaker_activated_ability_duration"
		buff_name_2 = "bardin_ironbreaker_activated_ability_duration_block_cost"
	end

	local targets = FrameTable.alloc_table()
	targets[1] = owner_unit
	local range = 10
	local duration = 10

	if talent_extension:has_talent("bardin_ironbreaker_activated_ability_duration", "dwarf_ranger", true) then
		duration = 15
	end

	if talent_extension:has_talent("bardin_ironbreaker_activated_ability_taunt_range", "dwarf_ranger", true) then
		range = 15
	end

	local stagger = true
	local taunt_bosses = talent_extension:has_talent("bardin_ironbreaker_activated_ability_taunt_bosses", "dwarf_ranger", true)

	if is_server then
		local target_override_extension = ScriptUnit.extension(owner_unit, "target_override_system")

		target_override_extension:taunt(range, duration, stagger, taunt_bosses)
	else
		network_transmit:send_rpc_server("rpc_taunt", owner_unit_id, range, duration, stagger, taunt_bosses)
	end

	local buff_template_name_id_1 = NetworkLookup.buff_templates[buff_name_1]
	local buff_template_name_id_2 = NetworkLookup.buff_templates[buff_name_2]

	for i = 1, #targets, 1 do
		local unit = targets[i]
		local unit_object_id = network_manager:unit_game_object_id(unit)
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		if is_server then
			buff_extension:add_buff(buff_name_1, {
				attacker_unit = owner_unit
			})
			buff_extension:add_buff(buff_name_2, {
				attacker_unit = owner_unit
			})
			network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id_1, owner_unit_id, 0, false)
			network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id_2, owner_unit_id, 0, false)
		else
			network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id_1, owner_unit_id, 0, true)
			network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id_2, owner_unit_id, 0, true)
		end
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:animation_event("ability_shout")
	end

	self:_play_vfx()
	self:_play_vo()
	career_extension:start_activated_ability_cooldown()
end

CareerAbilityDRIronbreaker._play_vo = function (self)
	local owner_unit = self._owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

CareerAbilityDRIronbreaker._play_vfx = function (self)
	local owner_unit = self._owner_unit
	local network_manager = self._network_manager
	local network_transmit = network_manager.network_transmit
	local owner_unit_id = network_manager:unit_game_object_id(owner_unit)
	local effect_name = "fx/chr_iron_breaker_ability_taunt"
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
