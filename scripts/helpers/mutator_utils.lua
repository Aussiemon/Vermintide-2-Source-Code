MutatorUtils = MutatorUtils or {}

MutatorUtils.apply_buff_to_alive_player_units = function (context, data, buff_name)
	local player_units = data.player_units

	for unit, _ in pairs(player_units) do
		player_units[unit] = false
	end

	local current_player_units = PLAYER_AND_BOT_UNITS
	local num_current_player_units = #current_player_units
	local get_extension = ScriptUnit.extension
	local unit_alive = AiUtils.unit_alive

	for i = 1, num_current_player_units, 1 do
		local unit = current_player_units[i]
		local is_alive = unit_alive(unit)

		if player_units[unit] == nil and is_alive then
			local params = {
				attacker_unit = unit
			}
			local buff_ext = get_extension(unit, "buff_system")

			buff_ext:add_buff(buff_name, params)
		end

		player_units[unit] = true
	end

	for unit, updated in pairs(player_units) do
		if not updated then
			player_units[unit] = nil
		end
	end
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
