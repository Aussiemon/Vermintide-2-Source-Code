-- chunkname: @scripts/managers/matchmaking/matchmaking_manager_testify.lua

local MatchmakingManagerTestify = {
	wait_for_matchmaking_state = function (matchmaking_manager, wanted_state)
		if matchmaking_manager:state().NAME ~= wanted_state then
			return Testify.RETRY
		end
	end,
	wait_for_matchmaking_substate = function (matchmaking_manager, params)
		local wanted_state = params.state
		local wanted_substate = params.substate

		if wanted_state and matchmaking_manager:state().NAME ~= wanted_state then
			return Testify.RETRY
		end

		if matchmaking_manager:state()._state ~= wanted_substate then
			return Testify.RETRY
		end
	end,
}

return MatchmakingManagerTestify
