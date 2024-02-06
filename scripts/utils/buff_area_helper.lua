-- chunkname: @scripts/utils/buff_area_helper.lua

local BuffAreaHelper = BuffAreaHelper or {}

BuffAreaHelper.setup_range_check = function (unit, buff, params, world)
	buff.range_check = {
		update_time = 0,
		units_in_range = {},
		temp_new_units_in_range = {},
	}
end

BuffAreaHelper.update_range_check = function (unit, buff, params, world)
	local buff_template = buff.template
	local range_check_template = buff_template.range_check
	local range_check_state = buff.range_check

	if range_check_state.update_time < params.t then
		range_check_state.update_time = params.t + range_check_template.update_rate

		local radius = buff_template.custom_radius and buff.radius or range_check_template.radius
		local units_in_range = range_check_state.units_in_range
		local unit_entered_range_func_name = range_check_template.unit_entered_range_func
		local unit_left_range_func_name = range_check_template.unit_left_range_func
		local temp_new_units_in_range = range_check_state.temp_new_units_in_range
		local initial_length_temp_new_units_in_range = #temp_new_units_in_range
		local position = POSITION_LOOKUP[unit] or Unit.world_position(unit, 0)
		local num_hits = 0

		if not range_check_template.only_players then
			num_hits = AiUtils.broadphase_query(position, radius, temp_new_units_in_range)
		end

		if not range_check_template.only_ai then
			local side = Managers.state.side:get_side_from_name("heroes")
			local other_player_positions = side.PLAYER_AND_BOT_POSITIONS

			for i = 1, #other_player_positions do
				local other_player_position = other_player_positions[i]
				local radius_squared = math.pow(radius, 2)
				local distance_squared = Vector3.distance_squared(position, other_player_position)

				if distance_squared <= radius_squared then
					num_hits = num_hits + 1
					temp_new_units_in_range[num_hits] = side.PLAYER_AND_BOT_UNITS[i]
				end
			end
		end

		for i = num_hits + 1, initial_length_temp_new_units_in_range do
			temp_new_units_in_range[i] = nil
		end

		if buff_template.randomize_result then
			table.shuffle(temp_new_units_in_range)
		end

		local unit_entered_range_func = unit_entered_range_func_name and BuffFunctionTemplates.functions[unit_entered_range_func_name]

		for _, new_unit in ipairs(temp_new_units_in_range) do
			if not units_in_range[new_unit] then
				local user_data = true

				if unit_entered_range_func then
					user_data = unit_entered_range_func(new_unit, unit, buff, params, world) or true
				end

				units_in_range[new_unit] = user_data
			end
		end

		local unit_left_range_func = unit_left_range_func_name and BuffFunctionTemplates.functions[unit_left_range_func_name]

		for prev_unit_in_range, _ in pairs(units_in_range) do
			if not table.contains(temp_new_units_in_range, prev_unit_in_range) then
				if unit_left_range_func then
					local user_data = units_in_range[prev_unit_in_range]

					unit_left_range_func(prev_unit_in_range, user_data, unit, buff, params, world)
				end

				units_in_range[prev_unit_in_range] = nil
			end
		end

		return true
	end

	return false
end

BuffAreaHelper.destroy_range_check = function (unit, buff, params, world)
	local buff_template = buff.template
	local range_check_template = buff_template.range_check
	local range_check_state = buff.range_check
	local unit_left_range_func_name = range_check_template.unit_left_range_func

	if not unit_left_range_func_name then
		return
	end

	local unit_left_range_func = BuffFunctionTemplates.functions[unit_left_range_func_name]

	for unit_in_range, user_data in pairs(range_check_state.units_in_range) do
		unit_left_range_func(unit_in_range, user_data, unit, buff, params, world)
	end
end

return BuffAreaHelper
