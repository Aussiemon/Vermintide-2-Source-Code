local function is_level_end_screen_displayed(state_ingame_running)
	return state_ingame_running.has_setup_end_of_level == true
end

local function retry_if_end_screen_not_displayed(state_ingame_running)
	local end_screen_displayed = is_level_end_screen_displayed(state_ingame_running)

	if not end_screen_displayed then
		return Testify.RETRY
	end
end

local StateInGameRunningTestify = {
	level_end_screen_displayed = function (_, state_ingame_running)
		return is_level_end_screen_displayed(state_ingame_running)
	end,
	has_lost = function (_, state_ingame_running)
		return state_ingame_running.game_lost
	end,
	start_measure_fps = function (_, state_ingame_running)
		state_ingame_running._fps_reporter_testify = FPSReporter:new()
	end,
	stop_measure_fps = function (point_id, state_ingame_running)
		local avg_fps = state_ingame_running._fps_reporter_testify:avg_fps()
		local cam_pos, cam_rot = Managers.free_flight:camera_position_rotation(1)

		Managers.telemetry.events:fps_at_point(point_id, cam_pos, cam_rot, avg_fps)

		state_ingame_running._fps_reporter_testify = nil
	end,
	memory_usage = function (index)
		local memory_usage = Memory.usage()

		Managers.telemetry.events:memory_usage(index, memory_usage)
	end,
	fail_test = function (message)
		assert(false, message)
	end,
	set_camera_to_observe_first_bot = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	update_camera_to_follow_first_bot_rotation = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	set_player_unit_not_visible = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	teleport_player_to_main_path_point = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	teleport_bots_forward_on_main_path_if_blocked = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	total_main_path_distance = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	is_end_zone_activated = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	spawn_essence_on_first_bot_position = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	make_players_invicible = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	are_bots_blocked = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	make_player_and_one_bot_invicible = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	get_active_weave_phase = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	teleport_player_randomly_on_main_path = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end,
	teleport_player_to_end_zone_position = function (_, state_ingame_running)
		return retry_if_end_screen_not_displayed(state_ingame_running)
	end
}

return StateInGameRunningTestify
