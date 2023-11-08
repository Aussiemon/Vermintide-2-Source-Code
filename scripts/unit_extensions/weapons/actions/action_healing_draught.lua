ActionHealingDraught = class(ActionHealingDraught, ActionBase)

ActionHealingDraught.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionHealingDraught.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	if ScriptUnit.has_extension(weapon_unit, "ammo_system") then
		self.ammo_extension = ScriptUnit.extension(weapon_unit, "ammo_system")
	end
end

ActionHealingDraught.client_owner_start_action = function (self, new_action, t)
	ActionHealingDraught.super.client_owner_start_action(self, new_action, t)

	self.current_action = new_action
end

ActionHealingDraught.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionHealingDraught.finish = function (self, reason)
	if reason == "dead" or reason == "knocked_down" or reason == "weapon_wielded" then
		return
	end

	local current_action = self.current_action
	local owner_unit = self.owner_unit
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	local heal_type = "healing_draught"

	if current_action.dialogue_event then
		local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input:trigger_networked_dialogue_event(current_action.dialogue_event, event_data)
	end

	if buff_extension:has_buff_perk("no_permanent_health") then
		heal_type = "healing_draught_temp_health"
	end

	if self.is_server or LEVEL_EDITOR_TEST then
		DamageUtils.heal_network(owner_unit, owner_unit, 75, heal_type)
	else
		local owner_unit_id = network_manager:unit_game_object_id(owner_unit)
		local heal_type_id = NetworkLookup.heal_types[heal_type]

		network_transmit:send_rpc_server("rpc_request_heal", owner_unit_id, 75, heal_type_id)
	end

	local ammo_extension = self.ammo_extension

	if ammo_extension then
		local ammo_usage = current_action.ammo_usage
		local _, procced = buff_extension:apply_buffs_to_value(0, "not_consume_medpack")
		local inventory_extension = ScriptUnit.has_extension(owner_unit, "inventory_system")

		if not procced then
			ammo_extension:use_ammo(ammo_usage)
		else
			inventory_extension:wield_previous_weapon()
		end
	end

	local player = Managers.player:unit_owner(owner_unit)
	local position = POSITION_LOOKUP[owner_unit]

	Managers.telemetry_events:player_used_item(player, self.item_name, position)
end
