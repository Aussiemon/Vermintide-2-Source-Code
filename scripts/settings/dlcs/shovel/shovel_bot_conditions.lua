BTConditions.can_activate = BTConditions.can_activate or {}
BTConditions.can_activate_non_combat = BTConditions.can_activate_non_combat or {}

table.merge_recursive(BTConditions.ability_check_categories, {
	activate_ability = {
		bw_necromancer = true
	}
})

BTConditions.can_activate.bw_necromancer = function (blackboard)
	local num_occupied_slots = blackboard.ai_slot_extension.num_occupied_slots

	if num_occupied_slots >= 3 then
		return true
	end

	if not Managers.state.game_mode:is_round_started() then
		blackboard._bt_conditions_first_ability = true

		return false
	elseif blackboard._bt_conditions_first_ability then
		local t = Managers.time:time("game")
		blackboard._first_ability_t = blackboard._first_ability_t or t + Math.random(1, 4)

		if t < blackboard._first_ability_t then
			return false
		end

		blackboard._bt_conditions_first_ability = nil
		blackboard._first_ability_t = nil
	end

	local num_skeletons = blackboard.ai_commander_extension:get_controlled_units_count()

	if num_skeletons <= 4 then
		return true
	end

	return false
end
