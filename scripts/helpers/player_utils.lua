PlayerUtils = {
	unique_player_id = function (peer_id, local_player_id)
		return peer_id .. ":" .. local_player_id
	end,
	split_unique_player_id = function (unique_player_id)
		local result = string.split(unique_player_id, ":")

		return result[1], tonumber(result[2])
	end
}

return
