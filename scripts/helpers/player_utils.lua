PlayerUtils = {
	unique_player_id = function (peer_id, local_player_id)
		return peer_id .. ":" .. local_player_id
	end,
	split_unique_player_id = function (unique_player_id)
		local result = string.split(unique_player_id, ":")

		return result[1], tonumber(result[2])
	end,
	get_random_alive_hero = function ()
		local side = Managers.state.side:get_side_from_name("heroes") or Managers.state.side:sides()[1]
		local players = side.PLAYER_AND_BOT_UNITS
		local unit_list = {}
		local unit_list_n = 0

		for i = 1, #players, 1 do
			local unit = players[i]

			if ALIVE[unit] and ScriptUnit.extension(unit, "health_system"):is_alive() then
				unit_list_n = unit_list_n + 1
				unit_list[unit_list_n] = unit
			end
		end

		if unit_list_n > 0 then
			local unit = unit_list[math.random(1, unit_list_n)]

			return unit
		end

		return nil
	end
}

return
