-- chunkname: @scripts/settings/dlcs/shovel/action_career_bw_necromancer_single_target.lua

ActionCareerBWNecromancerSingleTarget = class(ActionCareerBWNecromancerSingleTarget, ActionBase)

ActionCareerBWNecromancerSingleTarget.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBWNecromancerSingleTarget.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._career_extension = ScriptUnit.extension(owner_unit, "career_system")
	self._inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self._talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self._owner_unit = owner_unit
end

ActionCareerBWNecromancerSingleTarget.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerBWNecromancerSingleTarget.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	if chain_action_data then
		self:_play_vo()

		self.target = chain_action_data.target

		local target = self.target
		local owner_unit = self._owner_unit
		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:add_buff(target, "sienna_necromancer_career_skill_on_hit_damage", owner_unit, false)

		if self._talent_extension:has_talent("sienna_necromancer_5_1") then
			-- Nothing
		end

		self._career_extension:start_activated_ability_cooldown()
	end
end

ActionCareerBWNecromancerSingleTarget.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	return
end

ActionCareerBWNecromancerSingleTarget.finish = function (self, reason)
	self._inventory_extension:wield_previous_non_level_slot()
end

ActionCareerBWNecromancerSingleTarget._play_vo = function (self)
	local owner_unit = self.owner_unit
	local dialogue_input = ScriptUnit.extension_input(owner_unit, "dialogue_system")
	local event_data = FrameTable.alloc_table()

	dialogue_input:trigger_networked_dialogue_event("activate_ability", event_data)
end
