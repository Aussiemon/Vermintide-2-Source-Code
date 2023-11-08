ActionCareerBWNecromancerArea = class(ActionCareerBWNecromancerArea, ActionBase)

ActionCareerBWNecromancerArea.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBWNecromancerArea.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self._inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self._talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
end

ActionCareerBWNecromancerArea.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerBWNecromancerArea.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	if chain_action_data then
		self:_play_vo()
		self._first_person_extension:play_hud_sound_event("Play_career_necro_ability_withering_wave_start", nil, true)
		self:_create_damage_area(chain_action_data.position:unbox())
		self:_add_buffs()
		self._career_extension:start_activated_ability_cooldown()
	end
end

ActionCareerBWNecromancerArea._create_damage_area = function (self, position)
	local owner_unit = self.owner_unit
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local source_unit_id = network_manager:unit_game_object_id(self.owner_unit)

	network_transmit:send_rpc_server("rpc_necromancer_create_curse_area", source_unit_id, position)
end

ActionCareerBWNecromancerArea._add_buffs = function (self)
	local buff_name = "sienna_necromancer_cursed_area"
	local owner_unit = self.owner_unit

	self._buff_extension:add_buff(buff_name, {
		attacker_unit = owner_unit
	})
end

ActionCareerBWNecromancerArea.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	return
end

ActionCareerBWNecromancerArea._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end

ActionCareerBWNecromancerArea.finish = function (self, reason)
	self._inventory_extension:wield_previous_non_level_slot()
end
