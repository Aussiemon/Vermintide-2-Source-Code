ActionCareerBWScholar = class(ActionCareerBWScholar, ActionTrueFlightBow)

ActionCareerBWScholar.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBWScholar.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self.buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
end

ActionCareerBWScholar.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionCareerBWScholar.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	local talent_extension = self.talent_extension
	local owner_unit = self.owner_unit

	if talent_extension:has_talent("sienna_scholar_activated_ability_no_overcharge", "bright_wizard", true) then
		local player = Managers.player:owner(owner_unit)

		if player.local_player or self.is_server and player.bot_player then
			local buff_ext = self.buff_extension

			buff_ext:add_buff("sienna_scholar_activated_ability_no_overcharge")
		end
	end

	if talent_extension:has_talent("sienna_scholar_activated_ability_heal", "bright_wizard", true) then
		local network_manager = Managers.state.network
		local network_transmit = network_manager.network_transmit
		local unit_id = network_manager:unit_game_object_id(owner_unit)
		local heal_type_id = NetworkLookup.heal_types.career_skill

		network_transmit:send_rpc_server("rpc_request_heal", unit_id, 35, heal_type_id)
	end

	self:_play_vo()
	self.career_extension:start_activated_ability_cooldown()

	local inventory_extension = self.inventory_extension

	inventory_extension:check_and_drop_pickups("career_ability")
end

ActionCareerBWScholar.client_owner_post_update = function (self, dt, t, world, can_damage)
	ActionCareerBWScholar.super.client_owner_post_update(self, dt, t, world, can_damage)
end

ActionCareerBWScholar.finish = function (self, reason)
	if self.state == "waiting_to_shoot" then
		self:fire(self.current_action, false)

		self.state = "shot"
	end

	Unit.flow_event(self.owner_unit, "lua_force_stop")
	Unit.flow_event(self.first_person_unit, "lua_force_stop")
	ActionCareerBWScholar.super.finish(self, reason)

	local inventory_extension = self.inventory_extension

	inventory_extension:wield_previous_non_level_slot()
end

ActionCareerBWScholar._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end
