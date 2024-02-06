-- chunkname: @scripts/unit_extensions/weapons/actions/action_wield.lua

ActionWield = class(ActionWield, ActionBase)

ActionWield.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionWield.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.input_extension = ScriptUnit.extension(owner_unit, "input_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.status_extension = ScriptUnit.extension(owner_unit, "status_system")
end

ActionWield.client_owner_start_action = function (self, new_action, t, chain_attack_data)
	ActionWield.super.client_owner_start_action(self, new_action, t, chain_attack_data)

	local inventory_extension = self.inventory_extension
	local input_extension = self.input_extension

	self.current_action = new_action
	self.action_time_started = t

	if self.current_action.reset_aim_on_attack then
		local first_person_extension = ScriptUnit.extension(self.owner_unit, "first_person_system")

		first_person_extension:reset_aim_assist_multiplier()
	end

	local new_slot, scroll_value, swap_from_storage_type = CharacterStateHelper.wield_input(input_extension, inventory_extension, "action_wield", true)

	self.new_slot = new_slot

	assert(self.new_slot, "went into wield action without input")

	if new_slot == inventory_extension:get_wielded_slot_name() or swap_from_storage_type then
		inventory_extension:swap_equipment_from_storage(new_slot, swap_from_storage_type)
		Managers.state.event:trigger("swap_equipment_from_storage", new_slot, inventory_extension:get_additional_items(new_slot))
	end

	input_extension:set_last_scroll_value(scroll_value)

	local clear_input_buffer_from_wield = true

	input_extension:clear_input_buffer(clear_input_buffer_from_wield)

	local equipment = inventory_extension:equipment()
	local slot_data = equipment.slots[new_slot]
	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)

	item_template.next_action = item_template.action_on_wield

	input_extension:add_wield_cooldown(t + new_action.wield_cooldown)
	inventory_extension:wield(self.new_slot)
end

ActionWield.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionWield.finish = function (self, reason)
	local status_extension = self.status_extension

	if status_extension:is_zooming() then
		status_extension:set_zooming(false)
	end
end
