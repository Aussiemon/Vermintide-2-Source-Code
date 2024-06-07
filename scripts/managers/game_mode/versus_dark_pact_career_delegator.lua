-- chunkname: @scripts/managers/game_mode/versus_dark_pact_career_delegator.lua

VersusDarkPactCareerDelegator = class(VersusDarkPactCareerDelegator)

local weights = {
	[0] = 1,
	0.5,
	0.25,
	0.125,
}

VersusDarkPactCareerDelegator.init = function (self)
	self._playable_boss_can_be_picked = false
	self._picks_per_career = {}
	self._picks_per_player = {}
	self._peer_picking_boss = nil
	self._rolled_careers_time_stamp = {}

	Managers.state.event:register(self, "on_player_left_party", "on_player_left_party")
	Managers.state.event:register(self, "player_profile_assigned", "on_player_profile_assigned")

	self._mechanism = Managers.mechanism:game_mechanism()
end

VersusDarkPactCareerDelegator.destroy = function (self)
	Managers.state.event:unregister("on_player_left_party", self)
	Managers.state.event:unregister("player_profile_assigned", self)
	Managers.state.event:unregister("player_unit_relinquished", self)
end

VersusDarkPactCareerDelegator._roll_career_options = function (self, num_career_options, available_careers, peer_id)
	local selected_careers = {}
	local rolls = FrameTable.alloc_table()

	for i = 1, num_career_options do
		rolls[i] = 0
	end

	local delegated_careers = self._picks_per_player[peer_id] or {}

	self._picks_per_player[peer_id] = delegated_careers

	for i = 1, #available_careers do
		local career = available_careers[i]

		self._picks_per_career[career] = self._picks_per_career[career] or 0

		local num_times_picked = self._picks_per_career[career]
		local weighted_roll = math.random() * (weights[num_times_picked] or 0)
		local smallest_roll = table.min(rolls)

		if weighted_roll > rolls[smallest_roll] then
			selected_careers[smallest_roll] = career
			rolls[smallest_roll] = weighted_roll
		end
	end

	for i = 1, #selected_careers do
		local career = selected_careers[i]

		delegated_careers[i] = career
		self._picks_per_career[career] = self._picks_per_career[career] + 1
	end

	return selected_careers
end

VersusDarkPactCareerDelegator.request_careers = function (self, peer_id)
	printf("[DELEGATOR] requested careers, peer_id: %s", peer_id)
	self:_release_career_for_player(peer_id)

	local settings = Managers.state.game_mode:game_mode():settings()
	local num_career_options = settings.dark_pact_picking_rules.special_pick_options
	local all_careers = settings.dark_pact_profile_order
	local career_options = self:_roll_career_options(num_career_options, all_careers, peer_id)

	if self._playable_boss_can_be_picked then
		if DEDICATED_SERVER then
			cprint("[VS BOSS] added boss to picking list")
		elseif Managers.state.network.is_server then
			print("[VS BOSS] added boss to picking list")
		end

		assert(self._peer_picking_boss == nil, "Peer_picking_boss needs to be nill, another player is picking the boss")

		self._peer_picking_boss = peer_id

		local bosses = GameModeSettings.versus.dark_pact_boss_profiles
		local random_boss_profile = table.random(bosses)

		career_options[#career_options + 1] = random_boss_profile

		table.insert(self._picks_per_player[peer_id], random_boss_profile)

		self._picks_per_career[random_boss_profile] = (self._picks_per_career[random_boss_profile] or 0) + 1

		self:set_playable_boss_can_be_picked(false)
	end

	self._rolled_careers_time_stamp[peer_id] = Managers.time:time("game")

	return career_options, "all"
end

VersusDarkPactCareerDelegator.set_playable_boss_can_be_picked = function (self, is_next)
	if DEDICATED_SERVER then
		cprint("[VS BOSS] setting is_playble_boss_next")
	elseif Managers.state.network.is_server then
		printf("[Playable_bosses] setting is_playble_boss_next %s", is_next)
	end

	if self._peer_picking_boss == nil and is_next then
		self._playable_boss_can_be_picked = true
	elseif not is_next then
		self._playable_boss_can_be_picked = false
	else
		print("[VS BOSS] self._playable_boss_can_be_picked was not sett")
	end
end

VersusDarkPactCareerDelegator.get_playable_boss_can_be_picked = function (self)
	return self._playable_boss_can_be_picked
end

VersusDarkPactCareerDelegator.on_player_profile_assigned = function (self, peer_id, local_player_id, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career_name = profile.careers[career_index].name
	local settings = Managers.state.game_mode:game_mode():settings()

	if not table.contains(settings.dark_pact_profile_order, career_name) and not table.contains(GameModeSettings.versus.dark_pact_boss_profiles, career_name) then
		return
	end

	self:_career_picked(peer_id, career_name)
end

VersusDarkPactCareerDelegator.on_player_left_party = function (self, peer_id)
	self:_release_career_for_player(peer_id)

	self._picks_per_player[peer_id] = nil
end

VersusDarkPactCareerDelegator._career_picked = function (self, peer_id, career)
	self:_picking_telemetry(peer_id, career)
	self:_release_career_for_player(peer_id)

	self._picks_per_career[career] = (self._picks_per_career[career] or 0) + 1

	local delegated_careers = self._picks_per_player[peer_id] or {}

	self._picks_per_player[peer_id] = delegated_careers

	if self._peer_picking_boss and peer_id == self._peer_picking_boss then
		local bosses = GameModeSettings.versus.dark_pact_boss_profiles

		if table.contains(bosses, career) then
			self._peer_picking_boss = nil
		else
			self._peer_picking_boss = nil

			self:set_playable_boss_can_be_picked(true)
		end
	end

	delegated_careers[1] = career
end

VersusDarkPactCareerDelegator._release_career_for_player = function (self, peer_id)
	local delegated_careers = self._picks_per_player[peer_id]

	if delegated_careers then
		for i = 1, #delegated_careers do
			local delegated_career = delegated_careers[i]

			self._picks_per_career[delegated_career] = self._picks_per_career[delegated_career] - 1

			printf("[DELEGATOR] releasing career: %s", delegated_careers[i])

			delegated_careers[i] = nil
		end
	end
end

VersusDarkPactCareerDelegator.update = function (self)
	return
end

VersusDarkPactCareerDelegator._picking_telemetry = function (self, peer_id, selected_career)
	local settings = Managers.state.game_mode:game_mode():settings()

	if not table.contains(settings.dark_pact_profile_order, selected_career) and not table.contains(GameModeSettings.versus.dark_pact_boss_profiles, selected_career) then
		return
	end

	local player = Managers.player:player_from_peer_id(peer_id)

	if not player then
		return
	end

	if not self._picks_per_player[peer_id] then
		return
	end

	local player_backend_id = self._mechanism:get_peer_backend_id(peer_id) or "offline backend"
	local career_options = table.shallow_copy(self._picks_per_player[peer_id])
	local match_id = Managers.mechanism:game_mechanism():match_id()
	local career_selection_time_elapsed = Managers.time:time("game") - self._rolled_careers_time_stamp[peer_id]
	local platform = PLATFORM
	local build = BUILD

	Managers.telemetry_events:versus_pactsworn_picking(match_id, player_backend_id, career_options, selected_career, career_selection_time_elapsed, platform, build)
end
