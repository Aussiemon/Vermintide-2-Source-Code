local CameraStateObserverTestify = {
	set_camera_to_observe_first_bot = function (_, camera_state_observer)
		local first_bot = Managers.player:bots()[1]
		local players = camera_state_observer:_get_valid_players_to_observe()

		if players[first_bot._unique_id] and camera_state_observer._observed_player_id ~= first_bot._unique_id then
			camera_state_observer:follow_next_unit()
		end
	end
}

return CameraStateObserverTestify
