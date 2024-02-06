-- chunkname: @scripts/settings/dlcs/shovel/action_career_bw_necromancer_command_attack.lua

ActionCareerBWNecromancerCommandAttack = class(ActionCareerBWNecromancerCommandAttack, ActionBase)

local IGNORED_BREEDS = {
	critter_rat = true,
}
local CALCULATED_TARGET_BY_OWNER = {}

ActionCareerBWNecromancerCommandAttack.pre_calculate_target = function (owner_unit)
	local commander_extension = ScriptUnit.extension(owner_unit, "ai_commander_system")
	local fp_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local pets = commander_extension:get_controlled_units()

	if table.is_empty(pets) then
		return nil
	end

	local own_position = fp_extension:current_position()
	local look_direction = Quaternion.forward(fp_extension:current_rotation())
	local dummy_table = FrameTable.alloc_table()
	local ai_system = Managers.state.entity:system("ai_system")
	local ai_broadphase = ai_system.broadphase
	local hit_ai_units = FrameTable.alloc_table()
	local num_hit_ai_units = EngineOptimized.smart_targeting_query(ai_broadphase, own_position, look_direction, 0, 50, 0.1, 0.2, 0.8, 5, hit_ai_units, dummy_table, dummy_table)

	TrueFlightUtility.sort_prioritize_bosses(hit_ai_units)

	local side_manager = Managers.state.side
	local unit = owner_unit

	for i = 1, num_hit_ai_units do
		local hit_unit = hit_ai_units[i]
		local blackboard = BLACKBOARDS[hit_unit]
		local breed_name = blackboard and blackboard.breed.name

		if IGNORED_BREEDS[breed_name] then
			-- Nothing
		elseif side_manager:is_enemy(unit, hit_unit) then
			CALCULATED_TARGET_BY_OWNER[owner_unit] = hit_unit

			return true
		end
	end
end

ActionCareerBWNecromancerCommandAttack.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerBWNecromancerCommandAttack.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._buff_extension = ScriptUnit.extension(owner_unit, "buff_system")
	self._commander_extension = ScriptUnit.extension(owner_unit, "ai_commander_system")
	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self._career_extension = ScriptUnit.has_extension(owner_unit, "career_system")
	self._command_ability = self._career_extension:get_passive_ability_by_name("bw_necromancer_command")
	self._owner_unit = owner_unit
end

ActionCareerBWNecromancerCommandAttack.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level)
	ActionCareerBWNecromancerCommandAttack.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level)

	local target_unit = CALCULATED_TARGET_BY_OWNER[self._owner_unit]

	CALCULATED_TARGET_BY_OWNER[self._owner_unit] = nil

	if ALIVE[target_unit] then
		local should_charge = self:_is_charge_off_cooldown() and self:_has_armored_pet()

		self._command_ability:command_attack_enemy(target_unit, should_charge, t)
	end
end

ActionCareerBWNecromancerCommandAttack.client_owner_post_update = function (self, dt, t, world, can_damage)
	return
end

ActionCareerBWNecromancerCommandAttack.destroy = function (self)
	return
end

ActionCareerBWNecromancerCommandAttack._select_target = function (self)
	return
end

ActionCareerBWNecromancerCommandAttack._is_charge_off_cooldown = function (self)
	return self._buff_extension:get_buff_type("sienna_necromancer_6_3_available_charge")
end

ActionCareerBWNecromancerCommandAttack._has_armored_pet = function (self)
	for pet_unit, controlled_unit_data in pairs(self._commander_extension:get_controlled_units()) do
		local breed = Unit.get_data(pet_unit, "breed")

		if breed.name == "pet_skeleton_armored" then
			return true
		end
	end
end
