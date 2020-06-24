require("scripts/managers/challenges/in_game_challenge")
require("scripts/managers/challenges/in_game_challenge_templates")
require("scripts/managers/challenges/in_game_challenge_rewards")

ChallengeManager = class(ChallengeManager)
local MAX_UNIQUE_IDS = 255

ChallengeManager.init = function (self, statistics_db, is_server)
	self._statistics_db = statistics_db
	self._is_server = is_server
	self._all_challenges = {}
	self._completed_challenges = {}

	if is_server then
		local max_ids = MAX_UNIQUE_IDS
		local id_pool = Script.new_array(MAX_UNIQUE_IDS)

		for i = 1, max_ids, 1 do
			id_pool[i] = i
		end

		self._free_ids = id_pool
	end
end

ChallengeManager.destroy = function (self)
	local all_challenges = self._all_challenges

	for i = 1, #all_challenges, 1 do
		all_challenges[i]:cancel()
	end

	table.clear(self._all_challenges)
	table.clear(self._completed_challenges)
	self:unregister_rpcs()
end

ChallengeManager.on_round_start = function (self, network_event_delegate, event_manager)
	self:register_rpcs(network_event_delegate)
	event_manager:register(self, "on_bot_added", "on_bot_added")
	event_manager:register(self, "on_bot_removed", "on_bot_removed")

	local all_challenges = self._all_challenges

	for i = 1, #all_challenges, 1 do
		local challenge = all_challenges[i]

		challenge:on_round_start()
	end
end

ChallengeManager.on_round_end = function (self)
	if not self._is_server then
		local all_challenges = self._all_challenges

		for i = 1, #all_challenges, 1 do
			all_challenges[i]:cancel()
		end

		table.clear(self._all_challenges)
	else
		local all_challenges = self._all_challenges

		for i = 1, #all_challenges, 1 do
			local challenge = all_challenges[i]

			challenge:on_round_end()
		end
	end

	local event_manager = Managers.state.event

	event_manager:unregister("on_bot_added", self)
	event_manager:unregister("on_bot_removed", self)
	self:unregister_rpcs()
end

ChallengeManager.update = function (self, t, dt)
	local all_challenges = self._all_challenges

	for challenge_id = #all_challenges, 1, -1 do
		local challenge = all_challenges[challenge_id]

		if challenge:pending_cleanup() then
			if challenge:is_repeatable() and challenge:get_result() ~= InGameChallengeResult.Canceled then
				challenge:reset(true)
			else
				if self._is_server then
					table.insert(self._free_ids, challenge:get_unique_id())
				end

				table.swap_delete(all_challenges, challenge_id)
			end
		elseif challenge:has_ended() then
			if challenge:get_result() == InGameChallengeResult.Completed then
				self._completed_challenges[#self._completed_challenges + 1] = challenge

				Managers.state.event:trigger("on_challenge_completed", challenge:get_category(), challenge:get_challenge_name())
			end

			challenge:mark_for_cleanup()
		end

		if self._is_server and challenge:needs_sync(true) then
			local unique_id = challenge:get_unique_id()
			local progress = challenge:get_progress()
			local status_id = challenge:get_status().my_index
			local result_id = challenge:get_result().my_index

			Managers.state.network.network_transmit:send_rpc_clients("rpc_server_update_ingame_challenge", unique_id, progress, status_id, result_id)
		end
	end
end

ChallengeManager.add_challenge = function (self, challenge_template, is_repeatable, category, reward, owner_unique_id, custom_amount, auto_resume)
	if self._is_server then
		local unique_id = self:reserve_free_unique_id()
		local new_challenge = InGameChallenge:new(challenge_template, is_repeatable, category, reward, owner_unique_id, self._is_server, custom_amount, unique_id, auto_resume)

		new_challenge:start()
		table.insert(self._all_challenges, new_challenge)

		local template_id = NetworkLookup.challenges[challenge_template]
		local category_id = NetworkLookup.challenge_categories[category]
		local reward_id = NetworkLookup.challenge_rewards[reward]
		local owner_peer_id, owner_local_player_id = PlayerUtils.split_unique_player_id(owner_unique_id)
		local _, max_progress = new_challenge:get_progress()

		Managers.state.network.network_transmit:send_rpc_clients("rpc_server_add_ingame_challenge", unique_id, template_id, is_repeatable, category_id, reward_id, owner_peer_id, owner_local_player_id, max_progress)
	end
end

ChallengeManager.remove_challenge = function (self, challenge)
	if self._is_server and challenge then
		challenge:cancel()
	end
end

ChallengeManager.get_challenge_from_unique_id = function (self, unique_id)
	local all_challenges = self._all_challenges

	for i = 1, #all_challenges, 1 do
		if all_challenges[i]:get_unique_id() == unique_id then
			return all_challenges[i]
		end
	end

	return nil
end

ChallengeManager.get_all_challenges = function (self)
	return self._all_challenges
end

ChallengeManager.get_challenges_filtered = function (self, results, category, owner_unique_id)
	fassert(results, "Missing mandatory table (array) argument 'results'")

	local challenges = self._all_challenges
	local results_size = #results

	for i = 1, #challenges, 1 do
		local challenge = challenges[i]
		local valid = not category or challenge:get_category() == category
		valid = valid and (not owner_unique_id or challenge:belongs_to(owner_unique_id))

		if valid then
			results_size = results_size + 1
			results[results_size] = challenge
		end
	end

	return results, results_size
end

ChallengeManager.get_all_completed_challenges = function (self)
	return self._completed_challenges
end

ChallengeManager.get_completed_challenges_filtered = function (self, results, category, owner_unique_id)
	fassert(results, "Missing mandatory table (array) argument 'results'")

	local challenges = self._completed_challenges
	local results_size = #results

	for i = 1, #challenges, 1 do
		local challenge = challenges[i]
		local valid = not category or challenge:get_category() == category
		valid = valid and (not owner_unique_id or challenge:belongs_to(owner_unique_id))

		if valid then
			results_size = results_size + 1
			results[results_size] = challenge
		end
	end

	return results, results_size
end

ChallengeManager.player_entered_game_session = function (self, peer_id, local_player_id)
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local player = Managers.player:player_from_unique_id(unique_id)
	local all_challenges = self._all_challenges

	for i = 1, #all_challenges, 1 do
		local challenge = all_challenges[i]

		if challenge:belongs_to(unique_id) and challenge:auto_resume() then
			challenge:set_paused(false)
		end
	end
end

ChallengeManager.player_left_game_session = function (self, peer_id, local_player_id)
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local all_challenges = self._all_challenges

	for i = 1, #all_challenges, 1 do
		local challenge = all_challenges[i]

		if challenge:belongs_to(unique_id) then
			challenge:set_paused(true)
		end
	end
end

ChallengeManager.on_bot_added = function (self, bot_player)
	self:player_entered_game_session(bot_player:network_id(), bot_player:local_player_id())
end

ChallengeManager.on_bot_removed = function (self, bot_player)
	self:player_left_game_session(bot_player:network_id(), bot_player:local_player_id())
end

local NUM_ORPHANATED_CAHLLENGES_TO_CLEAN_UP = 5

ChallengeManager.reserve_free_unique_id = function (self)
	local free_ids = self._free_ids
	local num_free_ids = #free_ids

	if num_free_ids == 0 then
		num_free_ids = self:_cleanup_orphanated_challenge_ids(NUM_ORPHANATED_CAHLLENGES_TO_CLEAN_UP)
	end

	fassert(num_free_ids > 0, "Ran out of unique ids, %i / %i (leak or too many challenges?)", #self._all_challenges, MAX_UNIQUE_IDS)

	local id = free_ids[1]

	table.swap_delete(free_ids, 1)

	return id
end

ChallengeManager._cleanup_orphanated_challenge_ids = function (self, num_to_cleanup)
	local paused_challenges = {}
	local num_paused_challenges = 0
	local all_challenges = self._all_challenges

	for i = 1, #all_challenges, 1 do
		local challenge = all_challenges[i]

		if challenge.paused_t then
			num_paused_challenges = num_paused_challenges + 1
			paused_challenges[num_paused_challenges] = challenge
		end
	end

	if num_paused_challenges > 0 then
		if num_to_cleanup < num_paused_challenges then
			table.sort(paused_challenges, function (a, b)
				return a.paused_t < b.paused_t
			end)
		end

		local num_to_remove = math.min(num_to_cleanup, num_paused_challenges)

		for i = 1, num_to_remove, 1 do
			local challenge_to_remove = paused_challenges[i]

			self:_cancel_challenge_instant(challenge_to_remove)
		end

		return num_to_remove
	end

	return 0
end

ChallengeManager._cancel_challenge_instant = function (self, challenge)
	challenge:cancel()

	local unique_id = challenge:get_unique_id()

	Managers.state.network.network_transmit:send_rpc_clients("rpc_server_remove_ingame_challenge", unique_id)
	table.insert(self._free_ids, challenge:get_unique_id())

	local all_challenges = self._all_challenges
	local challenge_id = table.index_of(all_challenges, challenge)

	table.swap_delete(all_challenges, challenge_id)
end

local rpcs = {
	"rpc_server_add_ingame_challenge",
	"rpc_server_remove_ingame_challenge",
	"rpc_server_update_ingame_challenge",
	"rpc_server_hot_join_sync_ingame_challenge"
}

ChallengeManager.register_rpcs = function (self, network_event_delegate)
	if not self._network_event_delegate then
		self._network_event_delegate = network_event_delegate

		network_event_delegate:register(self, unpack(rpcs))
	end
end

ChallengeManager.unregister_rpcs = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end
end

ChallengeManager.hot_join_sync = function (self, peer_id)
	local all_challenges = self._all_challenges

	for i = 1, #all_challenges, 1 do
		local challenge = all_challenges[i]
		local unique_id = challenge:get_unique_id()
		local challenge_name = challenge:get_challenge_name()
		local template_id = NetworkLookup.challenges[challenge_name]
		local is_repeatable = challenge:is_repeatable()
		local category = challenge:get_category()
		local category_id = NetworkLookup.challenge_categories[category]
		local reward_name = challenge:get_reward_name()
		local reward_id = NetworkLookup.challenge_rewards[reward_name]
		local owner_unique_id = challenge:get_owner_unique_id()
		local owner_peer_id, owner_local_player_id = PlayerUtils.split_unique_player_id(owner_unique_id)
		local progress, max_progress = challenge:get_progress()
		local status_id = challenge:get_status().my_index
		local result_id = challenge:get_result().my_index

		Managers.state.network.network_transmit:send_rpc("rpc_server_hot_join_sync_ingame_challenge", peer_id, unique_id, template_id, is_repeatable, category_id, reward_id, owner_peer_id, owner_local_player_id, progress, max_progress, status_id, result_id)
	end
end

ChallengeManager.rpc_server_add_ingame_challenge = function (self, sender, unique_id, challenge_id, is_repeatable, category_id, reward_id, owner_peer_id, owner_local_player_id, custom_amount)
	local challenge_template = NetworkLookup.challenges[challenge_id]
	local category = NetworkLookup.challenge_categories[category_id]
	local reward = NetworkLookup.challenge_rewards[reward_id]
	local owner_unique_id = PlayerUtils.unique_player_id(owner_peer_id, owner_local_player_id)
	local new_challenge = InGameChallenge:new(challenge_template, is_repeatable, category, reward, owner_unique_id, self._is_server, custom_amount, unique_id, false)

	new_challenge:start()
	table.insert(self._all_challenges, new_challenge)
end

ChallengeManager.rpc_server_remove_ingame_challenge = function (self, sender, unique_id)
	local challenge = self:get_challenge_from_unique_id(unique_id)

	if challenge then
		challenge:cancel()

		local all_challenges = self._all_challenges
		local challenge_id = table.index_of(all_challenges, challenge)

		table.swap_delete(all_challenges, challenge_id)
	end
end

ChallengeManager.rpc_server_update_ingame_challenge = function (self, sender, unique_id, progress, status_id, result_id)
	local challenge = self:get_challenge_from_unique_id(unique_id)

	if challenge then
		challenge:client_update(progress, status_id, result_id)
	end
end

ChallengeManager.rpc_server_hot_join_sync_ingame_challenge = function (self, sender, unique_id, challenge_id, is_repeatable, category_id, reward_id, owner_peer_id, owner_local_player_id, progress, custom_amount, status_id, result_id)
	local challenge_template = NetworkLookup.challenges[challenge_id]
	local category = NetworkLookup.challenge_categories[category_id]
	local reward = NetworkLookup.challenge_rewards[reward_id]
	local owner_unique_id = PlayerUtils.unique_player_id(owner_peer_id, owner_local_player_id)
	local new_challenge = InGameChallenge:new(challenge_template, is_repeatable, category, reward, owner_unique_id, self._is_server, custom_amount, unique_id, false)

	new_challenge:start()
	new_challenge:client_update(progress, status_id, result_id)
	table.insert(self._all_challenges, new_challenge)
end

return
