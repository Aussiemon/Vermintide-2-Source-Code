ActionOneTimeConsumable = class(ActionOneTimeConsumable, ActionBase)

ActionOneTimeConsumable.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionOneTimeConsumable.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self._ammo_extension = ScriptUnit.has_extension(weapon_unit, "ammo_system")
end

ActionOneTimeConsumable.client_owner_start_action = function (self, new_action, t)
	ActionOneTimeConsumable.super.client_owner_start_action(self, new_action, t)

	self.current_action = new_action
end

ActionOneTimeConsumable.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionOneTimeConsumable.finish = function (self, reason)
	if reason ~= "action_complete" and reason ~= "hungover" then
		return
	end

	local owner_unit = self.owner_unit
	local current_action = self.current_action
	local buff_template = current_action.buff_template

	if buff_template then
		local network_manager = self.network_manager
		local buff_template_name_id = NetworkLookup.buff_templates[buff_template]
		local owner_unit_id = network_manager:unit_game_object_id(owner_unit)

		if self.is_server then
			self._buff_extension:add_buff(buff_template)
			network_manager.network_transmit:send_rpc_clients("rpc_add_buff", owner_unit_id, buff_template_name_id, owner_unit_id, 0, false)
		else
			network_manager.network_transmit:send_rpc_server("rpc_add_buff", owner_unit_id, buff_template_name_id, owner_unit_id, 0, true)
		end
	end

	local ammo_extension = self._ammo_extension

	if ammo_extension then
		local ammo_usage = current_action.ammo_usage

		ammo_extension:use_ammo(ammo_usage)
	end
end
