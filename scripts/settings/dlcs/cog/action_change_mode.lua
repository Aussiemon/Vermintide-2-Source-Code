ActionChangeMode = class(ActionChangeMode, ActionBase)

ActionChangeMode.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionChangeMode.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
end

ActionChangeMode.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionChangeMode.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
	self.weapon_extension:set_mode(new_action.next_weapon_mode)
	self:_play_additional_animation(new_action.custom_start_anim_data)
end

ActionChangeMode.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	return
end

ActionChangeMode.finish = function (self, reason)
	ActionChangeMode.super.finish(self, reason)
	self:_play_additional_animation(self.current_action.custom_finish_anim_data)
end
