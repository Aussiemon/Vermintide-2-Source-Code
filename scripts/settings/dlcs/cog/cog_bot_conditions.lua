-- chunkname: @scripts/settings/dlcs/cog/cog_bot_conditions.lua

BTConditions.can_activate = BTConditions.can_activate or {}
BTConditions.can_activate_non_combat = BTConditions.can_activate_non_combat or {}

table.merge_recursive(BTConditions.ability_check_categories, {
	ranged_weapon = {
		dr_engineer = true,
	},
})

local vector3_distance_squared = Vector3.distance_squared
local ENGINEER_MAX_DISTANCE_SQ = 400

BTConditions.can_activate.dr_engineer = function (blackboard)
	local target_unit = blackboard.target_unit

	if not ALIVE[target_unit] or Unit.get_data(target_unit, "breed") == nil then
		return false
	end

	local target_buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

	if target_buff_extension and target_buff_extension:has_buff_perk("invulnerable_ranged") then
		return false
	end

	local obstruction = blackboard.ranged_obstruction_by_static

	if obstruction and obstruction.unit == target_unit then
		local t = Managers.time:time("game")
		local obstructed = t <= obstruction.timer + 1

		if obstructed then
			return false
		end
	end

	local career_extension = blackboard.career_extension
	local inventory_extension = blackboard.inventory_extension
	local career_weapon_active = inventory_extension and inventory_extension:get_wielded_slot_name() == "career_skill_weapon"
	local min_charge = career_weapon_active and 0.6 or 0.95

	if not career_extension or min_charge < career_extension:current_ability_cooldown_percentage() then
		return false
	end

	local self_unit = blackboard.unit
	local self_position = POSITION_LOOKUP[self_unit]

	if vector3_distance_squared(self_position, POSITION_LOOKUP[target_unit]) > ENGINEER_MAX_DISTANCE_SQ then
		return false
	end

	local proximite_enemies = blackboard.proximite_enemies
	local num_proximite_enemies = #proximite_enemies
	local max_distance_sq = 9

	for i = 1, num_proximite_enemies do
		local enemy_unit = proximite_enemies[i]

		if ALIVE[enemy_unit] then
			local enemy_position = POSITION_LOOKUP[enemy_unit]

			if max_distance_sq >= vector3_distance_squared(self_position, enemy_position) then
				return false
			end
		end
	end

	local threat = Managers.state.conflict:get_threat_value()

	return threat > 10
end

BTConditions.reload_ability_weapon.dr_engineer = function (blackboard, args)
	local career_extension = blackboard.career_extension

	if career_extension then
		local proximite_enemies = blackboard.proximite_enemies

		return career_extension:current_ability_cooldown() > args.ability_cooldown_theshold and #proximite_enemies == 0
	end

	return false
end
