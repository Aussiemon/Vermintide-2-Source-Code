-- chunkname: @scripts/settings/mutators/mutator_challenge_test.lua

require("scripts/settings/dlcs/morris/deus_blessing_settings")

local challenge_settings = {
	category = "deus_mutator",
	reward = "deus_power_up_quest_test_reward_01",
	type = "kill_elites",
	amount = {
		1,
		7,
		7,
		10,
		10,
		15,
		15,
		15,
	},
}

return {
	server_start_function = function (context, data, unit)
		local challenge_manager = Managers.venture.challenge
		local difficulty = Managers.state.difficulty:get_difficulty()
		local difficulty_rank = DifficultySettings[difficulty].rank
		local challenge_reward = challenge_settings.reward
		local is_repeatable = false
		local category = challenge_settings.category
		local player = Managers.player:local_player()
		local player_unique_id = player:unique_id()
		local auto_resume = false
		local challenge = challenge_manager:add_challenge(challenge_settings.type, is_repeatable, category, challenge_reward, player_unique_id, challenge_settings.amount[difficulty_rank], auto_resume)

		data.challenge = challenge
	end,
	server_stop_function = function (context, data, unit)
		local challenge = data.challenge

		if challenge then
			local challenge_manager = Managers.venture.challenge

			challenge_manager:remove_challenge(challenge)
		end
	end,
}
