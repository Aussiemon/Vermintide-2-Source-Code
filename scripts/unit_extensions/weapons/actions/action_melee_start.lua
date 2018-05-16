ActionMeleeStart = class(ActionMeleeStart, ActionDummy)

ActionMeleeStart.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	ActionMeleeStart.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	Unit.flow_event(self.first_person_unit, "sfx_swing_charge")
end

return
