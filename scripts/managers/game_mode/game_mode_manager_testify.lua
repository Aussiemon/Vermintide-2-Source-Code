-- chunkname: @scripts/managers/game_mode/game_mode_manager_testify.lua

local GameModeManagerTestify = {
	game_mode_start_round = function (game_mode_manager)
		game_mode_manager:round_started()

		local game_mode = game_mode_manager:game_mode()

		game_mode.pre_round_start_timer = 0
	end,
	wait_for_game_mode = function (game_mode_manager, wanted_game_mode)
		local game_mode_key = game_mode_manager:game_mode_key()

		if wanted_game_mode ~= game_mode_key then
			return Testify.RETRY
		end
	end,
	wait_for_game_mode_state = function (game_mode_manager, params)
		local wanted_game_mode = params.game_mode
		local wanted_state = params.state
		local game_mode_key = game_mode_manager:game_mode_key()

		if wanted_game_mode and wanted_game_mode ~= game_mode_key then
			return Testify.RETRY
		end

		local game_mode = game_mode_manager:game_mode()

		if not game_mode then
			return Testify.RETRY
		end

		if game_mode:game_mode_state() ~= wanted_state then
			return Testify.RETRY
		end
	end,
	wait_for_transition_state = function (game_mode_manager, wanted_transition_state)
		local current_transition = game_mode_manager:wanted_transition()

		if current_transition ~= wanted_transition_state then
			return Testify.RETRY
		end
	end,
}

return GameModeManagerTestify
