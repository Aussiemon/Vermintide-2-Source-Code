﻿-- chunkname: @scripts/unit_extensions/camera/states/camera_state_observer_testify.lua

local CameraStateObserverTestify = {
	set_camera_to_observe_first_bot = function (camera_state_observer)
		local first_bot = Managers.player:bots()[1]
		local players = camera_state_observer:_get_valid_players_to_observe()

		if players[first_bot._unique_id] and camera_state_observer._observed_unit ~= first_bot.player_unit then
			camera_state_observer:follow_next_unit()
		end
	end,
}

return CameraStateObserverTestify
