BTConditions.can_activate = BTConditions.can_activate or {}

table.merge_recursive(BTConditions.ability_check_categories, {
	activate_ability = {
		es_questingknight = true
	}
})

BTConditions.can_activate.es_questingknight = function (blackboard)
	local target = blackboard.target_unit

	if not ALIVE[target] then
		return false
	end

	if not BLACKBOARDS[target] then
		return false
	end

	local max_distance = 5

	return (target == blackboard.priority_target_enemy and blackboard.priority_target_distance <= max_distance) or (target == blackboard.urgent_target_enemy and blackboard.urgent_target_distance <= max_distance) or (target == blackboard.opportunity_target_enemy and blackboard.opportunity_target_distance <= max_distance)
end

return
