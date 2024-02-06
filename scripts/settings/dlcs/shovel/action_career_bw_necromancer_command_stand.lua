-- chunkname: @scripts/settings/dlcs/shovel/action_career_bw_necromancer_command_stand.lua

local raycast_speed = 11
local raycast_gravity = -10

ActionCareerBwNecromancerCommandStand = class(ActionCareerBwNecromancerCommandStand, ActionBase)

ActionCareerBwNecromancerCommandStand.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBwNecromancerCommandStand.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self._command_ability = self._career_extension:get_passive_ability_by_name("bw_necromancer_command")
end

ActionCareerBwNecromancerCommandStand.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerBwNecromancerCommandStand.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	local target_center, fp_rotation

	if chain_action_data then
		target_center = chain_action_data.target_center:unbox()
		fp_rotation = chain_action_data.fp_rotation:unbox()
	end

	if target_center then
		self._command_ability:command_stand_ground(target_center, fp_rotation)
	end
end

ActionCareerBwNecromancerCommandStand.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	return
end
