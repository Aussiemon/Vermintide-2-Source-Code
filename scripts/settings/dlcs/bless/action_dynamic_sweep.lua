ActionDynamicSweep = class(ActionDynamicSweep, ActionSweep)

ActionDynamicSweep.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionDynamicSweep.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self.weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")
end

ActionDynamicSweep._get_damage_profile_name = function (self, action_hand, action)
	local current_mode = self.weapon_extension:get_mode()
	local dynamic_profiles = action.dynamic_profiles
	local profile_to_use = dynamic_profiles[current_mode]

	return action_hand and action["damage_profile_" .. action_hand] or profile_to_use or "default"
end

ActionDynamicSweep._calculate_attack_direction = function (self, action, weapon_rotation)
	local current_mode = self.weapon_extension:get_mode()
	local dynamic_attack_directions = action.dynamic_attack_direction
	local invert_attack_direction = dynamic_attack_directions[current_mode]
	local quaternion_axis = action.attack_direction or "forward"
	local attack_direction = Quaternion[quaternion_axis](weapon_rotation)

	return invert_attack_direction and -attack_direction or attack_direction
end
