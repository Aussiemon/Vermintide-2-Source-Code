return {
	hide_from_player_ui = true,
	server_start_function = function (context, data)
		local conflict_director = Managers.state.conflict

		if conflict_director.pacing:get_state() ~= "pacing_frozen" then
			conflict_director.pacing:disable()

			data.disabled = true
		end
	end,
	server_stop_function = function (context, data)
		if data.disabled then
			local conflict_director = Managers.state.conflict

			if conflict_director then
				conflict_director.pacing:enable()
			end
		end
	end
}
