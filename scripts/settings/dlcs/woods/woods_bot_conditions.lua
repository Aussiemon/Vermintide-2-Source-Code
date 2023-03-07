BTConditions.can_activate = BTConditions.can_activate or {}
BTConditions.can_activate_non_combat = BTConditions.can_activate_non_combat or {}

table.merge_recursive(BTConditions.ability_check_categories, {
	activate_ability = {
		we_thornsister = true
	}
})

local wall_max_distance_sq = 100
local wall_prio_distance = 8
local wall_placement_bias = 1.5

BTConditions.can_activate.we_thornsister = function (blackboard)
	local self_unit = blackboard.unit
	local talent_extension = ScriptUnit.has_extension(self_unit, "talent_system")
	local is_smiter_ability = talent_extension and talent_extension:has_talent("kerillian_thorn_sister_debuff_wall")

	if not is_smiter_ability then
		local threat, num_enemies = Managers.state.conflict:get_threat_value()

		if num_enemies < 20 then
			return false
		end
	end

	local self_position = POSITION_LOOKUP[self_unit]
	local target_unit = blackboard.target_unit
	local target_blackboard = BLACKBOARDS[target_unit]
	local wall_target = nil
	local forward_offset = 0

	if target_unit then
		local wall_target_distance_sq = Vector3.distance_squared(self_position, POSITION_LOOKUP[target_unit])

		if wall_target_distance_sq <= wall_max_distance_sq and wall_target_distance_sq >= 4 then
			if is_smiter_ability then
				local target_breed = target_blackboard and target_blackboard.breed
				local target_threat_value = target_breed and target_breed.threat_value or 0

				if target_unit == blackboard.priority_target_enemy or target_unit == blackboard.urgent_target_enemy or target_unit == blackboard.opportunity_target_enemy or target_threat_value >= 8 then
					wall_target = target_unit
				end
			else
				local proximite_enemies = blackboard.proximite_enemies
				local num_proximite_enemies = #proximite_enemies

				if num_proximite_enemies >= 10 then
					wall_target = target_unit
					forward_offset = -(math.sqrt(wall_target_distance_sq) / wall_placement_bias)
				end
			end
		end
	end

	if wall_target then
		local wall_target_position = POSITION_LOOKUP[wall_target]
		local wall_target_direction = Vector3.normalize(wall_target_position - self_position)
		local check_position = wall_target_position + wall_target_direction * math.max(forward_offset, 0)
		local nav_world = blackboard.nav_world
		local navigation_extension = target_blackboard and target_blackboard.navigation_extension
		local traverse_logic = navigation_extension and navigation_extension:traverse_logic()
		local success = is_smiter_ability or LocomotionUtils.ray_can_go_on_mesh(nav_world, self_position, check_position, traverse_logic, 1, 1)

		if success then
			local target_pos = wall_target_position + wall_target_direction * forward_offset

			blackboard.activate_ability_data.aim_position:store(target_pos)

			return true
		end
	end

	return false
end
