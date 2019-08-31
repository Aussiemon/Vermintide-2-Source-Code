AdventureMechanism = class(AdventureMechanism)
AdventureMechanism.name = "Adventure"

AdventureMechanism.init = function (self, settings, prior_state)
	self._state = "inn"
	self._next_state = nil
	self._prior_state = prior_state
	self._hero_profiles = table.clone(PROFILES_BY_AFFILIATION.heroes)
	self._tutorial_profiles = table.clone(PROFILES_BY_AFFILIATION.tutorial)
	local party_data = {
		heroes = {
			party_id = 1,
			name = "heroes",
			num_slots = 4
		}
	}

	Managers.party:register_parties(party_data)
end

AdventureMechanism.choose_next_state = function (self, next_state)
	local state = self._state

	if state == "inn" then
		local acceptable_states = {
			weave = true,
			ingame = true,
			tutorial = true
		}

		fassert(acceptable_states[next_state], "State (%s) is not an acceptable transition from current state (%s)", next_state, state)
	else
		ferror("Not allowed to choose next state in current state (%s)", state)
	end

	self._next_state = next_state
end

AdventureMechanism.reset_choose_next_state = function (self)
	self._next_state = nil
end

AdventureMechanism.progress_state = function (self)
	if self._next_state then
		self._prior_state = self._state
		self._state = self._next_state
		self._next_state = nil
	else
		local state = self._state
		self._prior_state = state

		if state == "inn" then
			self._state = "ingame"
		elseif state == "ingame" or state == "tutorial" then
			self._state = "inn"
		elseif state == "weave" then
			local weave_manager = Managers.weave
			local next_objective_index = weave_manager:calculate_next_objective_index()

			if not next_objective_index then
				self._state = "inn"
			end
		else
			ferror("AdventureMechanism: unknown state %s", state)
		end
	end

	return self._state
end

AdventureMechanism.get_prior_state = function (self)
	return self._prior_state
end

AdventureMechanism.set_current_state = function (self, state)
	self._prior_state = self._state
	self._state = state
end

AdventureMechanism.get_starting_level = function (self)
	local weave_name = Development.parameter("weave_name")

	if weave_name and weave_name ~= "false" then
		local weave_template = WeaveSettings.templates[weave_name]
		local objective = weave_template.objectives[1]
		local level_key = objective.level_id

		return level_key
	end

	return LevelSettings.default_start_level
end

AdventureMechanism.get_level_seed = function (self, level_seed, optional_system)
	local weave_manager = Managers.weave

	if weave_manager and weave_manager:get_active_weave() then
		local active_objective = weave_manager:get_active_objective_template()
		level_seed = (optional_system and active_objective.system_seeds and active_objective.system_seeds[optional_system]) or active_objective.level_seed or level_seed
	end

	return level_seed
end

AdventureMechanism.game_round_ended = function (self, t, dt, reason)
	local state = self._state
	local level_key = nil

	if state == "inn" then
		level_key = self._level_transition_handler:get_next_level_key()
	elseif state == "tutorial" then
		level_key = "inn_level"
	elseif state == "weave" then
		local weave_manager = Managers.weave
		local next_objective_index = weave_manager:calculate_next_objective_index()

		if next_objective_index and reason == "won" then
			local active_weave_name = weave_manager:get_active_weave()
			local template = WeaveSettings.templates[active_weave_name]
			local objectives = template.objectives
			local objective = objectives[next_objective_index]

			weave_manager:set_next_weave(active_weave_name)
			weave_manager:set_next_objective(next_objective_index)

			level_key = objective.level_id
		else
			level_key = "inn_level"
			self._next_state = "inn"
		end
	else
		level_key = "inn_level"
	end

	return level_key
end

AdventureMechanism.start_next_round = function (self, level_transition_handler)
	self._level_transition_handler = level_transition_handler
	local state = self._state
	local game_mode_key = nil

	if state == "inn" then
		local level_settings = LevelSettings[level_transition_handler:get_current_level_keys()]

		if level_settings.hub_level then
			game_mode_key = "inn"
		else
			game_mode_key = "adventure"
		end
	elseif state == "tutorial" then
		game_mode_key = "tutorial"
	elseif state == "weave" then
		game_mode_key = "weave"
	else
		game_mode_key = "adventure"
	end

	local side_compositions = self:_build_side_compositions(state)

	return game_mode_key, side_compositions
end

AdventureMechanism._build_side_compositions = function (self, state)
	local available_profiles = self._hero_profiles

	if state == "tutorial" then
		available_profiles = self._tutorial_profiles
	end

	local party_manager = Managers.party
	local side_compositions = {
		{
			name = "heroes",
			relations = {
				enemy = {
					"dark_pact",
					"neutral"
				}
			},
			party = party_manager:get_party(1),
			add_these_settings = {
				using_grims_and_tomes = true,
				show_damage_feedback = false,
				available_profiles = available_profiles
			}
		},
		{
			name = "dark_pact",
			relations = {
				enemy = {
					"heroes",
					"neutral"
				}
			}
		},
		{
			name = "neutral",
			relations = {
				enemy = {
					"dark_pact",
					"heroes"
				}
			}
		}
	}

	return side_compositions
end

AdventureMechanism.profile_available = function (self, profile_synchronizer, profile_name, career_name)
	local profile_index = FindProfileIndex(profile_name)
	local party = Managers.party:get_party(1)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots, 1 do
		local status = occupied_slots[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local player_profile_id, player_career_id = profile_synchronizer:profile_by_peer(peer_id, local_player_id)

		if player_profile_id == profile_index then
			return false
		end
	end

	return true
end

AdventureMechanism.get_state = function (self)
	return self._state
end

local TEMP_LOBBY_DATA = {}

AdventureMechanism.profile_available_for_peer = function (self, profile_synchronizer, peer_id, local_player_id, profile_name, career_name)
	local profile_index = FindProfileIndex(profile_name)
	local owners = profile_synchronizer:owners(profile_index)
	local local_player = Managers.player:local_player()
	local is_server = local_player.is_server

	if is_server then
		local reserver_peer_id, local_player_id = profile_synchronizer:profile_reserver_peer_id(profile_index)

		if reserver_peer_id and reserver_peer_id ~= peer_id then
			return false
		end
	else
		table.clear(TEMP_LOBBY_DATA)

		local base_name = "player_slot_"
		local lobby = Managers.state.network:lobby()

		for _, idx in pairs(ProfilePriority) do
			local key = base_name .. idx
			TEMP_LOBBY_DATA[key] = lobby:lobby_data(key)
		end

		if not Managers.matchmaking:hero_available_in_lobby_data(profile_index, TEMP_LOBBY_DATA) then
			return false
		end
	end

	local has_owners = next(owners)

	if has_owners and not profile_synchronizer:is_only_owner(peer_id, local_player_id, profile_index) then
		return false
	end

	return true
end

return
