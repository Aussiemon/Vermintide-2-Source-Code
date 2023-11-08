BTConditions.can_activate = BTConditions.can_activate or {}
BTConditions.can_activate_non_combat = BTConditions.can_activate_non_combat or {}

table.merge_recursive(BTConditions.ability_check_categories, {
	activate_ability = {
		bw_necromancer = true
	}
})

BTConditions.can_activate.bw_necromancer = function (blackboard)
	local threat, num_enemies = Managers.state.conflict:get_threat_value()

	if threat > 5 then
		return true
	end

	local current_health_percent = blackboard.health_extension:current_health_percent()
	local is_wounded = blackboard.status_extension:is_wounded()

	if current_health_percent < 0.3 or is_wounded then
		return true
	end

	return false
end
