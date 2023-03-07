ActionLunge = class(ActionLunge, ActionSweep)

ActionLunge.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionLunge.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._status_extension = ScriptUnit.extension(owner_unit, "status_system")
	self._first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
end

ActionLunge.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	local status_extension = self._status_extension

	if status_extension.do_lunge then
		return
	end

	local lunge_settings = new_action.lunge_settings
	status_extension.do_lunge = {
		allow_rotation = false,
		noclip = false,
		dodge = false,
		initial_speed = lunge_settings.initial_speed,
		falloff_to_speed = lunge_settings.falloff_to_speed,
		duration = lunge_settings.duration,
		damage = {
			offset_forward = 0.5,
			height = 1,
			depth_padding = 0.6,
			hit_zone_hit_name = "full",
			ignore_shield = true,
			collision_filter = "filter_explosion_overlap_no_player",
			power_level_multiplier = 1,
			interrupt_on_first_hit = true,
			damage_profile = "light_push",
			width = 2
		}
	}

	ActionLunge.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)
end
