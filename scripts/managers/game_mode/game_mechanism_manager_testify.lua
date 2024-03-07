-- chunkname: @scripts/managers/game_mode/game_mechanism_manager_testify.lua

local GameMechanismManagerTestify = {
	request_vote = function (mechanism_manager, params)
		mechanism_manager:request_vote(params)
	end,
	versus_get_num_sets = function (mechanism_manager, params)
		local current_mechanism_name = mechanism_manager:current_mechanism_name()

		if current_mechanism_name ~= "versus" then
			return Testify.RETRY
		end

		local current_mechanism = mechanism_manager:game_mechanism()
		local num_sets = current_mechanism:num_sets()

		if num_sets < 1 then
			return Testify.RETRY
		end

		return num_sets
	end,
}

return GameMechanismManagerTestify
