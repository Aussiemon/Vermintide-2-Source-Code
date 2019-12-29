Actions = {}

Actions.smoke = function ()
	Actions.load_level("inn_level")
end

Actions.load_level = function (level_key)
	Managers.auto_test:schedule_functions(ActionHelper.can_load_level, ActionHelper.load_level(level_key), ActionHelper.is_level_loaded(level_key), ActionHelper.finalize())
end

ActionHelper = {
	can_load_level = function ()
		local state_managers = Managers.state

		if not state_managers then
			return
		end

		local game_mode = state_managers.game_mode

		if not game_mode then
			return
		end

		local level_transition_handler = game_mode.level_transition_handler

		if not level_transition_handler then
			return
		end

		return true
	end,
	load_level = function (level_key)
		return function ()
			local transition = Managers.state.game_mode.level_transition_handler

			transition:set_next_level(level_key)
			transition:level_completed()

			return true
		end
	end,
	is_level_loaded = function (level_key)
		return function ()
			local state_managers = Managers.state

			if not state_managers then
				return
			end

			local game_mode_manager = state_managers.game_mode

			if not game_mode_manager then
				return
			end

			local level_transition_handler = game_mode_manager.level_transition_handler

			if level_transition_handler.level_key ~= level_key then
				return
			end

			local packages_loaded = level_transition_handler:all_packages_loaded()

			if not packages_loaded then
				return
			end

			local peer_id = Network:peer_id()
			local player = Managers.player:player_from_peer_id(peer_id)
			local player_unit = player and player.player_unit

			if not Unit.alive(player_unit) then
				return
			end

			return true
		end
	end,
	finalize = function (message)
		return function ()
			Managers.auto_test:reply(message)

			return true
		end
	end
}

return
