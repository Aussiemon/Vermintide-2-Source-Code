-- chunkname: @scripts/settings/dlcs/shovel/action_career_bw_necromancer_command_attack.lua

ActionCareerBWNecromancerCommandAttack = class(ActionCareerBWNecromancerCommandAttack, ActionBase)

local IGNORED_BREEDS = {
	critter_rat = true,
}
local CALCULATED_TARGET_BY_OWNER = {}
local HIT_AI_UNITS = {}
local HIT_PLAYER_UNITS = {}
local ALL_HIT_UNITS = {}

ActionCareerBWNecromancerCommandAttack.pre_calculate_target = function (owner_unit)
	local commander_extension = ScriptUnit.extension(owner_unit, "ai_commander_system")
	local fp_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local pets = commander_extension:get_controlled_units()

	if table.is_empty(pets) then
		return nil
	end

	local own_position = fp_extension:current_position()
	local look_direction = Quaternion.forward(fp_extension:current_rotation())
	local own_position = fp_extension:current_position()
	local look_direction = Quaternion.forward(fp_extension:current_rotation())
	local broadphase_categories = Managers.state.side.side_by_unit[owner_unit].enemy_broadphase_categories

	table.clear(ALL_HIT_UNITS)

	local range = 50
	local num_hit_ai_units = AiUtils.broadphase_query(own_position, range, HIT_AI_UNITS, broadphase_categories)

	for i = 1, num_hit_ai_units do
		ALL_HIT_UNITS[i] = HIT_AI_UNITS[i]
	end

	local num_hit_player_units = PlayerUtils.broadphase_query(own_position, range, HIT_PLAYER_UNITS, broadphase_categories)

	for i = 1, num_hit_player_units do
		local status_extension = ScriptUnit.has_extension(HIT_PLAYER_UNITS[i], "status_system")
		local is_invisible = status_extension and status_extension:is_invisible()

		if not is_invisible then
			ALL_HIT_UNITS[#ALL_HIT_UNITS + 1] = HIT_PLAYER_UNITS[i]
		end
	end

	local boss_weight = 1
	local special_weight = 1
	local elite_weight = 1
	local player_weight = 1.5
	local scores = TrueFlightUtility.sort(ALL_HIT_UNITS, own_position, look_direction, boss_weight, special_weight, elite_weight, range, 0.7, 1.8, player_weight)

	for i = 1, num_hit_ai_units + num_hit_player_units do
		repeat
			local hit_unit = ALL_HIT_UNITS[i]
			local blackboard = BLACKBOARDS[hit_unit]
			local breed_name = blackboard and blackboard.breed.name

			if scores[hit_unit] == 0 then
				return false
			end

			if IGNORED_BREEDS[breed_name] or not HEALTH_ALIVE[hit_unit] then
				break
			end

			local los = AiUtils.line_of_sight_from_random_point(own_position, hit_unit, math.huge)

			if not los then
				break
			end

			CALCULATED_TARGET_BY_OWNER[owner_unit] = hit_unit

			return true
		until true
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
