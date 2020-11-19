MutatorUtils = MutatorUtils or {}

MutatorUtils.apply_buff_to_alive_player_units = function (context, data, buff_name)
	if not data.buffed_player_units then
		data.buffed_player_units = {}
	end

	local buffed_player_units = data.buffed_player_units

	if not buffed_player_units[buff_name] then
		buffed_player_units[buff_name] = {}
	end

	local player_units = buffed_player_units[buff_name]

	for unit, _ in pairs(player_units) do
		player_units[unit] = false
	end

	local side = Managers.state.side:get_side_from_name("heroes")
	local current_player_units = (data.only_affect_players and side.PLAYER_UNITS) or side.PLAYER_AND_BOT_UNITS
	local num_current_player_units = #current_player_units
	local get_extension = ScriptUnit.extension
	local unit_alive = AiUtils.unit_alive
	local new_buff_ids = {}

	for i = 1, num_current_player_units, 1 do
		local unit = current_player_units[i]
		local is_alive = unit_alive(unit)

		if player_units[unit] == nil and is_alive then
			local params = {
				attacker_unit = unit
			}
			local buff_ext = get_extension(unit, "buff_system")
			local buff_id = buff_ext:add_buff(buff_name, params)
			new_buff_ids[unit] = buff_id
		end

		player_units[unit] = true
	end

	for unit, updated in pairs(player_units) do
		if not updated then
			player_units[unit] = nil
		end
	end

	return new_buff_ids
end

MutatorUtils.store_breed_and_action_settings = function (context, data)
	if not context.original_breed_settings and not context.original_breed_action_settings then
		context.original_breed_settings = table.clone(Breeds)
		context.original_breed_action_settings = table.clone(BreedActions)
	end
end

MutatorUtils.restore_breed_and_action_settings = function (context, data)
	if context.original_breed_settings and context.original_breed_action_settings then
		Breeds = context.original_breed_settings
		BreedActions = context.original_breed_action_settings
		context.original_breed_settings = nil
		context.original_breed_action_settings = nil
	end
end

return
