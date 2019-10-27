PlayerUtils = {
	unique_player_id = function (peer_id, local_player_id)
		return peer_id .. ":" .. local_player_id
	end
}

return
