-- chunkname: @scripts/managers/boon/boon_manager.lua

require("scripts/managers/challenges/in_game_challenge_rewards")

BoonManager = class(BoonManager)

local function validate_boon(boon)
	return true
end

local function filter_targets(targets, valid_targets)
	if not valid_targets or not targets then
		return targets
	end

	for i = #targets, 1, -1 do
		local idx = table.index_of(valid_targets, targets[i])

		if idx == -1 then
			table.swap_delete(targets, i)
		end
	end

	return targets
end

BoonManager.init = function (self)
	self._network_event_delegate = nil
	self._boons = {}
	self._spawned_players_queue = {}
	self._unique_id = 0
end

BoonManager.destroy = function (self)
	self:unregister_rpcs()
end

local queued_target_filter_table = {}

BoonManager.update = function (self, dt, t)
	local spawned_players_queue = self._spawned_players_queue
	local spawned_players_queue_n = #spawned_players_queue
	local boons = self._boons

	for target_unit_id = 1, spawned_players_queue_n do
		queued_target_filter_table[1] = spawned_players_queue[target_unit_id]

		for boon_id = 1, #boons do
			self:_activate_boon(boons[boon_id], queued_target_filter_table)
		end
	end

	table.clear_array(spawned_players_queue, spawned_players_queue_n)
end

BoonManager.add_boon = function (self, owner, reward_id, consume_type, consume_value, reactivation_rule)
	local unique_id = self._unique_id

	self._unique_id = unique_id + 1

	local new_boon = {
		active = true,
		owner = owner,
		reward_id = reward_id,
		consume_type = consume_type,
		consume_value = consume_value,
		unique_id = unique_id,
		reward_data = {},
		reactivation_rule = reactivation_rule,
	}

	if validate_boon(new_boon) and not self:_has_been_consumed(new_boon) then
		self:_activate_boon(new_boon)

		if not self:_has_been_consumed(new_boon) then
			self._boons[#self._boons + 1] = new_boon
		end
	end
end

BoonManager._activate_boon = function (self, boon, valid_targets)
	local reward = InGameChallengeRewards[boon.reward_id]

	if reward and boon.active then
		local targets = filter_targets(InGameChallengeRewardTargets[reward.target](boon.owner), valid_targets)

		if targets then
			local num_targets = #targets

			if num_targets > 0 then
				if boon.consume_type == "charges" then
					local max_targets = math.min(num_targets, boon.consume_value)

					for i = max_targets, boon.consume_value, -1 do
						targets[i] = nil
					end

					boon.consume_value = boon.consume_value - max_targets

					if self:_has_been_consumed(boon) then
						self:remove_boon(boon.unique_id)
					end
				end

				local reward_data = InGameChallengeRewardTypes[reward.type](reward, targets, boon.owner)

				if reward_data then
					table.merge(boon.reward_data, reward_data)
				end
			end
		end
	end
end

BoonManager._deactivate_boon = function (self, boon, valid_targets)
	local reward = InGameChallengeRewards[boon.reward_id]

	if reward and boon.reward_data then
		local targets = filter_targets(InGameChallengeRewardTargets[reward.target](boon.owner), valid_targets)

		if targets then
			local num_targets = #targets

			if num_targets > 0 then
				local effect_revoke_function = InGameChallengeRewardRevokeTypes[reward.type]

				if effect_revoke_function then
					effect_revoke_function(reward, targets, boon.owner, boon.reward_data)

					boon.reward_data = {}
				end
			end
		end
	end
end

BoonManager._activate_player_boons = function (self, peer_id, local_player_id)
	local player_unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local side = Managers.state.side:get_side_from_player_unique_id(player_unique_id)
	local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
	local boons = self._boons

	for boon_id = 1, #boons do
		local current_boon = boons[boon_id]

		if current_boon.owner == player_unique_id then
			local activate = not current_boon.reactivation_rule or current_boon.reactivation_rule(player_unique_id)

			if activate then
				boons[boon_id].active = true

				self:_activate_boon(boons[boon_id], player_and_bot_units)
			end
		end
	end
end

BoonManager._deactivate_player_boons = function (self, peer_id, local_player_id)
	local player_unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local party = Managers.party:get_party_from_player_id(peer_id, local_player_id)
	local side = party and Managers.state.side.side_by_party[party]
	local player_and_bot_units = side and side.PLAYER_AND_BOT_UNITS
	local boons = self._boons

	for boon_id = 1, #boons do
		if boons[boon_id].owner == player_unique_id then
			self:_deactivate_boon(boons[boon_id], player_and_bot_units)

			boons[boon_id].active = false
		end
	end
end

BoonManager._has_been_consumed = function (self, boon)
	if boon.consume_type == "time" then
		return false
	else
		return boon.consume_value <= 0
	end
end

BoonManager.remove_boon = function (self, boon_unique_id)
	local boons = self._boons

	for i = 1, #boons do
		if boons[i].unique_id == boon_unique_id then
			table.swap_delete(boons, i)

			return
		end
	end
end

BoonManager.on_round_start = function (self, network_event_delegate, event_manager)
	event_manager:register(self, "new_player_unit", "on_player_spawned")
	event_manager:register(self, "on_player_joined_party", "on_player_joined_party")
	event_manager:register(self, "on_player_left_party", "on_player_left_party")
	event_manager:register(self, "on_clean_up_server_controlled_buffs", "on_clean_up_server_controlled_buffs")
	event_manager:register(self, "on_bot_added", "on_bot_added")
	event_manager:register(self, "on_bot_removed", "on_bot_removed")
	self:register_rpcs(network_event_delegate)
end

BoonManager.on_round_end = function (self)
	self:unregister_rpcs()
	table.clear_array(self._spawned_players_queue, #self._spawned_players_queue)

	local event_manager = Managers.state.event

	event_manager:unregister("on_clean_up_server_controlled_buffs", self)
	event_manager:unregister("on_player_left_party", self)
	event_manager:unregister("on_player_joined_party", self)
	event_manager:unregister("new_player_unit", self)
	event_manager:unregister("on_bot_added", self)
	event_manager:unregister("on_bot_removed", self)

	local boons = self._boons

	for i = #boons, 1, -1 do
		local boon = boons[i]

		if boon.consume_type == "round" then
			boon.consume_value = boon.consume_value - 1
		end

		if self:_has_been_consumed(boon) then
			table.swap_delete(boons, i)
		end
	end
end

BoonManager.on_venture_start = function (self)
	return
end

BoonManager.on_venture_end = function (self)
	local boons = self._boons

	for i = #boons, 1, -1 do
		local boon = boons[i]

		if boon.consume_type == "venture" then
			boon.consume_value = boon.consume_value - 1
		end

		if self:_has_been_consumed(boon) then
			table.swap_delete(boons, i)
		end
	end
end

BoonManager.on_player_spawned = function (self, player, unit, unique_id)
	self._spawned_players_queue[#self._spawned_players_queue + 1] = unit
end

BoonManager.on_player_joined_party = function (self, peer_id, local_player_id, party_id, slot_id)
	self:_activate_player_boons(peer_id, local_player_id)
end

BoonManager.on_player_left_party = function (self, peer_id, local_player_id, party_id, slot_id_player)
	self:_deactivate_player_boons(peer_id, local_player_id)
end

BoonManager.on_bot_added = function (self, bot_player)
	self:_activate_player_boons(bot_player:network_id(), bot_player:local_player_id())
end

BoonManager.on_bot_removed = function (self, bot_player)
	self:_deactivate_player_boons(bot_player:network_id(), bot_player:local_player_id())
end

BoonManager.on_clean_up_server_controlled_buffs = function (self, unit)
	local boons = self._boons

	for i = 1, #boons do
		local boon = boons[i]
		local reward = InGameChallengeRewards[boon.reward_id]

		if reward and reward.type == "buff" and reward.server_controlled then
			boon.reward_data[unit] = nil
		end
	end
end

local rpcs = {}

BoonManager.register_rpcs = function (self, network_event_delegate)
	return
end

BoonManager.unregister_rpcs = function (self)
	return
end
