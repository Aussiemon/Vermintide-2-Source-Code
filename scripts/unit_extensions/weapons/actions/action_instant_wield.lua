ActionInstantWield = class(ActionInstantWield)

ActionInstantWield.init = function (self, world, item_name, is_server, owner_unit, weapon_unit)
	self.world = world
	self.owner_unit = owner_unit
	self.weapon_unit = weapon_unit
	self.is_server = is_server
	self.input_extension = ScriptUnit.extension(owner_unit, "input_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self.item_name = item_name
	local network_manager = Managers.state.network
	self.network_manager = network_manager
	self.network_transmit = network_manager.network_transmit
end

ActionInstantWield.client_owner_start_action = function (self, new_action, t, chain_attack_data)
	local slot = new_action.slot_to_wield
	local action_on_wield = new_action.action_on_wield
	local equipment = self.inventory_extension:equipment()
	local slot_data = equipment.slots[slot]
	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)
	item_template.next_action = action_on_wield

	self.inventory_extension:wield(slot)
	self.input_extension:add_wield_cooldown(t)
end

ActionInstantWield.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionInstantWield.finish = function (self)
	return
end

return
