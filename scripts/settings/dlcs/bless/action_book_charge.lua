ActionBookCharge = class(ActionBookCharge, ActionMeleeStart)
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event

ActionBookCharge.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionBookCharge.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
	self.inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self.first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	self.owner_unit = owner_unit
	local left_hand_unit, right_hand_unit = self.inventory_extension:get_all_weapon_unit()
	self._left_hand_unit = left_hand_unit
	self._right_hand_unit = right_hand_unit
	self._current_segment = -1
	self._sfx_active = false
	self._charge_sfx = false
end

local function scale_charge_value(action_settings, value, owner_unit, buff_extension, increase)
	local new_value = value
	local time_scale = ActionUtils.get_action_time_scale(owner_unit, action_settings)

	if increase then
		new_value = new_value * time_scale
	else
		new_value = new_value * 1 / time_scale
	end

	return new_value
end

ActionBookCharge.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionBookCharge.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self.charge = self.weapon_extension:get_custom_data("charge")
	local owner_unit = self.owner_unit
	local buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self.charge_speed = scale_charge_value(new_action, new_action.charge_speed or 0.3, owner_unit, buff_extension, true)
	self.initial_charge_delay = scale_charge_value(new_action, new_action.initial_charge_delay or 0, owner_unit, buff_extension, false)
	self.start_time = t

	self:_update_visual_charge(self.charge)
end

ActionBookCharge.client_owner_post_update = function (self, dt, t, world)
	ActionBookCharge.super.client_owner_post_update(self, dt, t, world)

	if t < self.start_time + self.initial_charge_delay then
		return
	end

	if self.charge < 1 and not self._sfx_active then
		self._sfx_active = true

		self.first_person_extension:play_hud_sound_event("priest_melee_book_charge")
	end

	self.charge = self.charge + self.charge_speed * dt

	self.weapon_extension:set_custom_data("charge", self.charge)
	self:_update_visual_charge(self.charge)
end

ActionBookCharge._update_visual_charge = function (self, current_charge)
	if self._right_hand_unit then
		local visual_charge = math.clamp(current_charge, 0, 1)

		unit_set_flow_variable(self._right_hand_unit, "current_charge", visual_charge)
		unit_flow_event(self._right_hand_unit, "lua_update_charge")
	end

	local inventory_extension = self.inventory_extension

	if current_charge >= 1 and not self._charge_sfx then
		self._charge_sfx = true

		self.first_person_extension:play_hud_sound_event("priest_melee_book_charge_end")

		self._sfx_active = false
	elseif current_charge < 1 and self._charge_sfx then
		self._charge_sfx = false
	end
end

ActionBookCharge.finish = function (self, reason)
	ActionChangeMode.super.finish(self, reason)

	if self.charge < 1 then
		self._sfx_active = false

		self.first_person_extension:play_hud_sound_event("priest_melee_book_charge_stop")
	end
end
