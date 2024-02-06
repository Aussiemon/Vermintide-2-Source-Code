-- chunkname: @scripts/settings/dlcs/bless/bless_bot_conditions.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")

BTConditions.can_activate = BTConditions.can_activate or {}
BTConditions.can_activate_non_combat = BTConditions.can_activate_non_combat or {}

table.merge_recursive(BTConditions.ability_check_categories, {
	activate_ability = {
		wh_priest = true,
	},
})

local WP_MAX_ASSIST_DIST = 15
local WP_CLOSE_DISTANCE_SQ = 10
local WP_MIN_THREAT = 5
local WP_THREAT_THRESHOLD = 15

local function is_target_already_shielded(unit)
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")

	return not buff_extension or buff_extension:has_buff_perk(buff_perks.invulnerable)
end

BTConditions.can_activate.wh_priest = function (blackboard)
	local self_unit = blackboard.unit
	local target_ally_unit = blackboard.target_ally_unit
	local should_target_ally = false
	local should_target_self = false

	if ALIVE[self_unit] and ALIVE[target_ally_unit] and blackboard.ally_distance and blackboard.ally_distance < WP_MAX_ASSIST_DIST then
		local ally_status_ext = ScriptUnit.has_extension(target_ally_unit, "status_system")

		if ally_status_ext then
			if ally_status_ext:is_pounced_down() or ally_status_ext:is_grabbed_by_pack_master() or ally_status_ext:is_grabbed_by_corruptor() then
				should_target_ally = true
			end

			if not should_target_ally then
				local talent_extension = ScriptUnit.has_extension(self_unit, "talent_system")
				local has_revive_talent = talent_extension and talent_extension:has_talent("victor_priest_6_3")

				if has_revive_talent and ally_status_ext:is_knocked_down() then
					should_target_ally = true
				end
			end
		end
	end

	if not should_target_ally then
		local ally_too_far = blackboard.ally_distance and blackboard.ally_distance > WP_MAX_ASSIST_DIST
		local target = blackboard.target_unit
		local target_blackboard = BLACKBOARDS[target]
		local target_breed = target_blackboard and target_blackboard.breed
		local target_threat = target_breed and target_breed.threat_value or 0

		if target_threat >= WP_MIN_THREAT then
			local self_unit = blackboard.unit
			local self_position = POSITION_LOOKUP[self_unit]
			local proximite_enemies = blackboard.proximite_enemies
			local num_proximite_enemies = #proximite_enemies
			local total_threat_value = 0
			local close_threat_value = 0
			local far_threat_value = 0

			for i = 1, num_proximite_enemies do
				local enemy_unit = proximite_enemies[i]
				local enemy_position = POSITION_LOOKUP[enemy_unit]

				if ALIVE[enemy_unit] then
					local enemy_blackboard = BLACKBOARDS[enemy_unit]
					local enemy_breed = enemy_blackboard.breed
					local breed_threat_value = enemy_breed.threat_value

					if ally_too_far then
						close_threat_value = close_threat_value + breed_threat_value

						if close_threat_value > WP_THREAT_THRESHOLD then
							break
						end
					elseif Vector3.distance_squared(self_position, enemy_position) <= WP_CLOSE_DISTANCE_SQ then
						close_threat_value = close_threat_value + breed_threat_value
					else
						far_threat_value = far_threat_value + breed_threat_value

						if far_threat_value > WP_THREAT_THRESHOLD then
							break
						end
					end
				end
			end

			if blackboard.ally_distance and blackboard.ally_distance <= 3.2 then
				far_threat_value = math.max(close_threat_value, far_threat_value)
			end

			if far_threat_value > WP_THREAT_THRESHOLD then
				should_target_ally = true
			elseif close_threat_value > WP_THREAT_THRESHOLD then
				should_target_self = true
			end
		end
	end

	if should_target_ally or should_target_self then
		local target_to_shield

		if should_target_ally and not is_target_already_shielded(target_ally_unit) then
			target_to_shield = target_ally_unit
		elseif should_target_self and not is_target_already_shielded(self_unit) then
			target_to_shield = self_unit
		end

		blackboard.activate_ability_data.target_unit = target_to_shield

		return target_to_shield ~= nil
	end

	return false
end
