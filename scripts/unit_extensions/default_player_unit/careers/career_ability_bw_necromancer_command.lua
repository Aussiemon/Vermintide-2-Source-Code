local RPCS = {
	"rpc_necromancer_command_sacrifice",
	"rpc_necromancer_command_charge"
}
local CommandSyncTypes = table.mirror_array({
	"pet",
	"player",
	"enemy"
})
CareerAbilityBWNecromancerCommand = class(CareerAbilityBWNecromancerCommand)

CareerAbilityBWNecromancerCommand.init = function (self, extension_init_context, unit, extension_init_data)
	self._owner_unit = unit
	self._player = extension_init_data.player
	self._is_local = extension_init_data.player.local_player
	self._is_server = extension_init_context.is_server
	self._command_explosion_params = {
		source_attacker_unit = unit
	}
	self._network_transmit = extension_init_context.network_transmit
	self._network_event_delegate = self._network_transmit.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._unit_storage = extension_init_context.unit_storage
	self._outline_data = nil
	self._target_unit = nil
end

CareerAbilityBWNecromancerCommand.extensions_ready = function (self, world, unit)
	self._status_extension = ScriptUnit.extension(unit, "status_system")
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._buff_system = Managers.state.entity:system("buff_system")

	if self._is_local then
		self._input_extension = ScriptUnit.extension(unit, "input_system")
		self._fp_extension = ScriptUnit.extension(unit, "first_person_system")
		self._inventory_extension = ScriptUnit.has_extension(unit, "inventory_system")
	end

	if self._is_local or self._is_server then
		self._commander_extension = ScriptUnit.extension(unit, "ai_commander_system")
	end

	Managers.state.event:register(self, "on_talents_changed", "_on_talents_changed")
	self:_on_talents_changed(unit, ScriptUnit.extension(unit, "talent_system"))
end

CareerAbilityBWNecromancerCommand._on_talents_changed = function (self, unit, talent_extension)
	if unit ~= self._owner_unit then
		return
	end

	self._has_charge = talent_extension:has_talent("sienna_necromancer_6_3")

	if self._is_local then
		self:_cleanup_talent_buffs(unit)
		self:_add_talent_buffs(unit)
	end
end

CareerAbilityBWNecromancerCommand.update = function (self, dt, t)
	if not self._is_local and not self._is_server then
		return
	end

	self:_update_outlines(t)

	if self._is_local then
		self:_update_vent_command_target(t)
	end
end

CareerAbilityBWNecromancerCommand.destroy = function (self)
	self._network_event_delegate:unregister(self)

	local event_manager = Managers.state.event

	if event_manager then
		Managers.state.event:unregister("on_talents_changed", self)
	end
end

CareerAbilityBWNecromancerCommand._update_outlines = function (self, t)
	local data = self._outline_data

	if data then
		local status_extension = ScriptUnit.has_extension(data.unit, "status_system")

		if not HEALTH_ALIVE[data.unit] or data.command_type == CommandSyncTypes.player and not status_extension:is_knocked_down() then
			if ALIVE[data.unit] then
				data.extension:remove_outline(data.id)
			end

			self._outline_data = nil
		end
	end
end

CareerAbilityBWNecromancerCommand._command_sacrifice_pet = function (self, pet_unit)
	local target_node_id = Unit.has_node(pet_unit, "j_spine") and Unit.node(pet_unit, "j_spine") or 0
	local network_manager = Managers.state.network
	local effect_name_id = NetworkLookup.effects["fx/necromancer_skeleton_sacrifice"]
	local pet_unit_id = network_manager:unit_game_object_id(pet_unit)

	network_manager:rpc_play_particle_effect(nil, effect_name_id, pet_unit_id, target_node_id, Vector3.zero(), Quaternion.identity(), false)

	local bb = BLACKBOARDS[pet_unit]
	local locomotion_extension = bb.locomotion_extension
	locomotion_extension.death_velocity_boxed = Vector3Box(locomotion_extension:current_velocity())

	AiUtils.kill_unit(pet_unit)

	if self._has_explode then
		local pet_position = POSITION_LOOKUP[pet_unit]
		local player_unit = self._owner_unit
		local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
		local career_power_level = career_extension and career_extension:get_career_power_level() or DefaultPowerLevel
		local area_damage_system = Managers.state.entity:system("area_damage_system")

		area_damage_system:create_explosion(player_unit, pet_position, Quaternion.identity(), "sienna_necromancer_passive_explosion", 1, "buff", career_power_level, false)
	end
end

CareerAbilityBWNecromancerCommand._trigger_charge_sound = function (self)
	self._fp_extension:play_hud_sound_event("Play_career_necro_skeleton_charge")
end

CareerAbilityBWNecromancerCommand._start_charge_cooldown = function (self)
	local buff_extension = self._buff_extension
	local buff = buff_extension:get_buff_type("sienna_necromancer_6_3_available_charge")
	self._charge_cooldown_id = buff_extension:add_buff("sienna_necromancer_6_3_cooldown_charge")

	buff_extension:remove_buff(buff.id)
end

CareerAbilityBWNecromancerCommand._add_talent_buffs = function (self, unit)
	if self._has_charge then
		self._buff_extension:add_buff("sienna_necromancer_6_3_available_charge")
	end
end

CareerAbilityBWNecromancerCommand._cleanup_talent_buffs = function (self, unit)
	local buff_extension = self._buff_extension

	if self._charge_cooldown_id then
		buff_extension:remove_buff(self._charge_cooldown_id)

		self._charge_cooldown_id = nil
	end

	local charge_buff = buff_extension:get_buff_type("sienna_necromancer_6_3_available_charge")

	if charge_buff then
		buff_extension:remove_buff(unit, charge_buff.id)
	end
end

CareerAbilityBWNecromancerCommand._add_outline = function (self, target_unit, command_sync_type)
	local outline_extension = ScriptUnit.has_extension(target_unit, "outline_system")

	if outline_extension then
		local data = self._outline_data

		if data and ALIVE[data.unit] then
			data.extension:remove_outline(data.id)
		end

		local id = outline_extension:add_outline(OutlineSettings.templates.necromancer_command)
		self._outline_data = {
			id = id,
			unit = target_unit,
			extension = outline_extension,
			command_type = command_sync_type
		}
	end
end

CareerAbilityBWNecromancerCommand.command_attack_enemy = function (self, target_unit, should_charge, t)
	if not HEALTH_ALIVE[target_unit] then
		return
	end

	if self._is_local then
		Managers.telemetry_events:necromancer_used_command_item(self._player, "attack")
	end

	local commander_pos = POSITION_LOOKUP[self._owner_unit]
	local smallest_dist_sq = math.huge
	local best_unit = nil
	local commander_extension = self._commander_extension
	local units = commander_extension:get_controlled_units()

	for controlled_unit in pairs(units) do
		local breed = Unit.get_data(controlled_unit, "breed")
		local is_following = commander_extension:command_state(controlled_unit) == CommandStates.Following

		if is_following or breed.name ~= "pet_skeleton_with_shield" then
			local pos = POSITION_LOOKUP[controlled_unit]

			if pos then
				commander_extension:command_attack(controlled_unit, target_unit)

				local dist_sq = Vector3.distance_squared(pos, commander_pos)

				if dist_sq < smallest_dist_sq then
					smallest_dist_sq = dist_sq
					best_unit = controlled_unit
				end
			end
		end
	end

	self:_play_command_sound()

	if best_unit then
		Managers.state.entity:system("audio_system"):play_audio_unit_event("Play_career_necro_skeleton_charge", best_unit)
	end

	self:_add_outline(target_unit, CommandSyncTypes.enemy)

	if should_charge then
		self:_trigger_charge_sound()
		self:_start_charge_cooldown()

		local target_unit_id = self._unit_storage:go_id(target_unit)

		self._network_transmit:send_rpc_server("rpc_necromancer_command_charge", target_unit_id)
	end
end

CareerAbilityBWNecromancerCommand.rpc_necromancer_command_charge = function (self, channel_id, target_unit_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._player.peer_id then
		return
	end

	local target_unit = self._unit_storage:unit(target_unit_id)
	local commander_extension = self._commander_extension
	local units = commander_extension:get_controlled_units()

	for controlled_unit in pairs(units) do
		local blackboard = BLACKBOARDS[controlled_unit]

		if blackboard.breed.name == "pet_skeleton_armored" then
			blackboard.charge_target = target_unit
		end
	end
end

CareerAbilityBWNecromancerCommand.command_sacrifice = function (self, target_unit)
	if self._is_local then
		Managers.telemetry_events:necromancer_used_command_item(self._player, "sacrifice")
	end

	if not self._is_server then
		local target_unit_id = self._unit_storage:go_id(target_unit)

		self._network_transmit:send_rpc_server("rpc_necromancer_command_sacrifice", target_unit_id, CommandSyncTypes.pet)

		return
	end

	self:_command_sacrifice_pet(target_unit)
end

CareerAbilityBWNecromancerCommand.rpc_necromancer_command_sacrifice = function (self, channel_id, target_unit_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id ~= self._player.peer_id then
		return
	end

	local target_unit = self._unit_storage:unit(target_unit_id)

	self:command_sacrifice(target_unit)
end

CareerAbilityBWNecromancerCommand._update_vent_command_target = function (self, t)
	local last_target = self._vent_command_target
	local wielded_item_template = self._inventory_extension:get_wielded_slot_item_template()
	local in_command_mode = wielded_item_template and wielded_item_template.is_command_utility_weapon
	local new_target, using_fallback = nil

	if in_command_mode then
		local hovered_unit, fallback_unit = self._commander_extension:hovered_friendly_unit()
		using_fallback = not hovered_unit and not not fallback_unit

		if not hovered_unit then
			local controlled_units = self._commander_extension:get_controlled_units()
			local least_t_left = math.huge

			for unit, controlled_unit_data in pairs(controlled_units) do
				local duration = controlled_unit_data.template.duration

				if duration then
					local time_left = (controlled_unit_data.start_t or math.huge) + duration - t

					if least_t_left > time_left then
						least_t_left = time_left
						hovered_unit = unit
					end
				end
			end
		end

		new_target = hovered_unit or fallback_unit
	end

	if self._vent_outline_id and using_fallback or new_target ~= last_target then
		if ALIVE[last_target] then
			local outline_extension = ScriptUnit.has_extension(last_target, "outline_system")

			if outline_extension then
				outline_extension:remove_outline(self._vent_outline_id)

				self._vent_outline_id = nil
			end
		end

		if new_target and not using_fallback then
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(new_target)

			if go_id then
				local bt_action_name_id = GameSession.game_object_field(game, go_id, "bt_action_name")
				local bt_action_name = NetworkLookup.bt_action_names[bt_action_name_id]

				if bt_action_name ~= "spawn" then
					local outline_extension = ScriptUnit.extension(new_target, "outline_system")
					self._vent_outline_id = outline_extension:add_outline(OutlineSettings.templates.necromancer_command)
				end
			end
		end
	end

	self._vent_command_target = new_target
end

CareerAbilityBWNecromancerCommand.vent_command_target = function (self)
	return self._vent_command_target
end

CareerAbilityBWNecromancerCommand.command_stand_ground = function (self, position, fallback_rotation)
	local pet_array = table.keys(self._commander_extension:get_controlled_units(), FrameTable.alloc_table())

	table.array_remove_if(pet_array, function (value)
		if self._commander_extension:command_state(value) == CommandStates.Following then
			return false
		end

		local breed = Unit.get_data(value, "breed")

		return breed.name == "pet_skeleton_armored"
	end)
	self:_play_command_sound()

	if self._is_local then
		Managers.telemetry_events:necromancer_used_command_item(self._player, "defend")
	end

	local audio_system = Managers.state.entity:system("audio_system")

	for i = 1, #pet_array do
		local unit = pet_array[i]

		if ALIVE[unit] then
			audio_system:play_audio_unit_event("Play_career_necro_skeleton_defend", unit)
		end
	end

	self._commander_extension:command_stand_ground_group(pet_array, position, fallback_rotation)
end

CareerAbilityBWNecromancerCommand._play_command_sound = function (self)
	if self._fp_extension then
		self._fp_extension:play_hud_sound_event("Play_weapon_necro_command_command")
	end
end
