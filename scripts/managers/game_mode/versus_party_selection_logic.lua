﻿-- chunkname: @scripts/managers/game_mode/versus_party_selection_logic.lua

local DRAW_DEBUG = false

VersusPartySelectionLogicUtility = {}

VersusPartySelectionLogicUtility.picker_index_is_bot = function (party_data, picker_index)
	local is_bot = party_data.picker_list[picker_index].is_bot

	return is_bot ~= false
end

local RPCS = {
	"rpc_set_party_array",
	"rpc_sync_player_loadout",
	"rpc_set_player_state",
	"rpc_set_party_state",
	"rpc_set_party_picking_id",
	"rpc_pre_game_sync_hovered_item",
	"rpc_set_party_selection_logic_timer",
}

VersusPartySelectionLogic = class(VersusPartySelectionLogic)
VersusPartySelectionLogic.party_states = {
	startup = {
		enter = function (parent, party_data, party)
			local picking_settings = parent._picking_settings

			parent:set_timer(picking_settings.startup_time)
		end,
		run = function (parent, party_data, party, timer, t, dt)
			if timer <= 0 then
				local picker_list = party_data.picker_list

				for i = 1, #picker_list do
					parent:set_player_state("player_waiting_to_pick", party.party_id, i)
				end

				return "player_picking_character"
			end
		end,
	},
	player_picking_character = {
		enter = function (parent, party_data, party)
			local current_picker_index = party_data.current_picker_index

			current_picker_index = current_picker_index + 1
			party_data.current_picker_index = current_picker_index

			parent:_ensure_picker_has_character(party_data, party, current_picker_index, true)

			local picking_settings = parent._picking_settings
			local player_pick_time = picking_settings.player_pick_time

			parent:set_timer(player_pick_time)
			parent:set_party_current_picker(party.party_id, current_picker_index)
			parent:set_player_state("player_picking_character", party.party_id, current_picker_index)
		end,
		run = function (parent, party_data, party, timer, t, dt)
			local current_picker_index = party_data.current_picker_index

			parent:_ensure_picker_has_character(party_data, party, current_picker_index)

			if timer <= 0 then
				return "player_has_picked_character"
			end
		end,
	},
	player_has_picked_character = {
		enter = function (parent, party_data, party)
			local current_picker_index = party_data.current_picker_index

			parent:set_player_state("player_has_picked_character", party.party_id, current_picker_index)

			local profile_index, career_index = parent:_ensure_picker_has_character(party_data, party, current_picker_index)
			local picker_list = party_data.picker_list
			local status = picker_list[current_picker_index].status

			printf("[VersusPartySelectionLogic] %s in party %s locked in %s", status.peer_id or "BOT", party.party_id, SPProfiles[profile_index].careers[career_index].display_name)
			parent:remove_available_character(profile_index, career_index, party_data, party)
		end,
		run = function (parent, party_data, party, timer, t, dt)
			if party_data.current_picker_index >= #party_data.picker_list then
				return "parading"
			end

			return "player_picking_character"
		end,
	},
	parading = {
		enter = function (parent, party_data, party)
			local duration = Managers.state.game_mode:setting("character_picking_settings").parading_duration
			local mechanism = Managers.mechanism:game_mechanism()
			local all_players_have_saved_hero, peers_without_saved_heros = mechanism:all_peers_have_saved_hero(parent._pick_data_per_party)

			if not all_players_have_saved_hero then
				assert(not peers_without_saved_heros, "[versus_party_selection_logic]some player dont have a saved hero")
			end

			parent:set_timer(duration)
		end,
		run = function (parent, party_data, party, timer, t, dt, party_selection_logic)
			if timer <= 0 then
				return "closing"
			end
		end,
	},
	closing = {
		enter = function (parent, party_data, party)
			local picking_settings = parent._picking_settings

			parent:set_timer(picking_settings.closing_time)

			for i = 1, #party_data.picker_list do
				parent:set_player_state("closing", party.party_id, i)
			end
		end,
		run = function (parent, party_data, party, timer, t, dt, party_selection_logic)
			if not parent._character_selection_completed then
				local all_parties_done = parent:_all_parties_have_picked()

				if all_parties_done then
					Managers.state.event:unregister("on_player_left_party", party_selection_logic)
					Managers.state.game_mode:game_mode():server_character_selection_completed()

					parent._character_selection_completed = true
				end
			end
		end,
	},
}
VersusPartySelectionLogic.client_states = {
	startup = {
		enter = function (parent, party_data, party)
			parent:set_party_timer(party_data)
		end,
		run = function (parent, party_data, party, timer, t, dt)
			return
		end,
	},
	player_waiting_to_pick = {
		enter = function (parent, party_data, party)
			return
		end,
		run = function (parent, party_data, party, timer, t, dt)
			local prev_picker_index = party_data.prev_picker_index
			local current_picker_index = party_data.current_picker_index

			if prev_picker_index < current_picker_index then
				parent:check_preferred_character_taken(party_data, party)
				parent:set_party_timer(party_data)

				party_data.prev_picker_index = current_picker_index
			end

			party_data.slider_timer = timer
		end,
	},
	player_picking_character = {
		enter = function (parent, party_data, party)
			party_data.prev_picker_index = party_data.current_picker_index

			parent:set_party_timer(party_data)

			if not parent._is_server then
				parent:check_preferred_character_taken(party_data, party)
			end
		end,
		run = function (parent, party_data, party, timer, t, dt)
			party_data.slider_timer = timer
		end,
	},
	player_has_picked_character = {
		enter = function (parent, party_data, party)
			return
		end,
		run = function (parent, party_data, party, timer, t, dt)
			local prev_picker_index = party_data.prev_picker_index
			local current_picker_index = party_data.current_picker_index

			if prev_picker_index < current_picker_index then
				parent:set_party_timer(party_data)

				party_data.prev_picker_index = current_picker_index
			end

			party_data.slider_timer = timer
		end,
	},
	closing = {
		enter = function (parent, party_data, party)
			party_data.slider_timer = nil
		end,
		run = function (parent, party_data, party, timer, t, dt)
			return
		end,
	},
}

local ClientStateLookup = {
	"startup",
	"player_waiting_to_pick",
	"player_picking_character",
	"player_has_picked_character",
	"closing",
	closing = 5,
	player_has_picked_character = 4,
	player_picking_character = 3,
	player_waiting_to_pick = 2,
	startup = 1,
}

VersusPartySelectionLogic.init = function (self, is_server, settings, network_server, network_event_delegate, network_transmit)
	self._timer_paused = false
	self._timer = 0
	self._timer_scale = 1

	local party_states_lookup = {}

	for key, _ in pairs(VersusPartySelectionLogic.party_states) do
		local index = #party_states_lookup + 1

		party_states_lookup[index] = key
		party_states_lookup[key] = index
	end

	local client_states_lookup = {}

	for key, _ in pairs(VersusPartySelectionLogic.client_states) do
		local index = #client_states_lookup + 1

		client_states_lookup[index] = key
		client_states_lookup[key] = index
	end

	self._party_states_lookup = party_states_lookup
	self._client_states_lookup = client_states_lookup
	self._is_server = is_server
	self._network_server = network_server

	if is_server then
		self._profile_requester = network_server:profile_requester()
	end

	self._settings = settings
	self._picking_settings = settings.character_picking_settings
	self._timer = self._picking_settings.startup_time + GameSettings.transition_fade_out_speed
	self._pick_data_per_party = {}
	self._first_update = true
	self._party_data = nil
	self._party = nil

	self:_register_rpcs(network_event_delegate, network_transmit)

	if is_server then
		Managers.state.event:register(self, "on_player_left_party", "on_player_left_party")
		self:_setup_picking_order(is_server)

		local players = Managers.player:human_players()

		for unique_id, player in pairs(players) do
			local peer_id = player:network_id()

			self:_sync_party_array(peer_id)
		end
	end
end

VersusPartySelectionLogic.pre_update = function (self, t, dt)
	if not DEDICATED_SERVER then
		self:_client_pre_update(t, dt)
	end

	if self._is_server then
		self:_server_pre_update(t, dt)
	end
end

VersusPartySelectionLogic._server_pre_update = function (self, t, dt)
	local game = Network.game_session()
	local in_game_session = Managers.state.network:in_game_session()

	if not game or not in_game_session then
		return
	end

	local states = VersusPartySelectionLogic.party_states
	local pick_data_per_party = self._pick_data_per_party
	local parties = Managers.party:game_participating_parties()
	local new_states = {}

	if self._first_update then
		for party_id = 1, #pick_data_per_party do
			local party = parties[party_id]
			local party_data = pick_data_per_party[party_id]
			local current_state = party_data.state
			local enter_func = states[current_state].enter

			if enter_func then
				enter_func(self, party_data, party)
			end
		end

		if DEDICATED_SERVER then
			self._first_update = false
		end
	end

	for party_id = 1, #pick_data_per_party do
		local party = parties[party_id]
		local party_data = pick_data_per_party[party_id]
		local current_state = party_data.state
		local new_state = states[current_state].run(self, party_data, party, self._timer, t, dt, self)

		new_states[party_id] = new_state
	end

	for party_id, new_state in pairs(new_states) do
		local party = parties[party_id]
		local party_data = pick_data_per_party[party_id]
		local state_id = self._party_states_lookup[new_state]

		self._network_transmit:send_rpc_clients("rpc_set_party_state", party_id, state_id)

		local old_state = party_data.state
		local leave_func = states[old_state].leave

		if leave_func then
			leave_func(self, party_data, party)
		end

		local enter_func = states[new_state].enter

		if enter_func then
			enter_func(self, party_data, party)
		end

		party_data.state = new_state
	end

	if self._timer_paused then
		return
	end

	self._timer = math.max(self._timer - dt, 0)
end

VersusPartySelectionLogic._client_pre_update = function (self, t, dt)
	local game = Network.game_session()

	if not game then
		return
	end

	if not self._party_data then
		local num_parties = Managers.party:get_num_game_participating_parties()

		if #self._pick_data_per_party ~= num_parties then
			return
		end

		local party_manager = Managers.party
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local unique_id = local_player:unique_id()
		local player_party = party_manager:get_party_from_unique_id(unique_id)
		local pick_data_per_party = self._pick_data_per_party
		local party_data = pick_data_per_party[player_party.party_id]

		if not party_data then
			return
		end

		self._local_party_id = player_party.party_id
		self._party_data = party_data
		self._party = player_party

		local picker_list = self._party_data.picker_list

		for id, picker_data in ipairs(picker_list) do
			picker_data.status = player_party.slots[picker_data.slot_id]

			local player = picker_data.status.player

			if player and player.local_player then
				self._picker_list_id = id

				break
			end
		end
	end

	local states = VersusPartySelectionLogic.client_states
	local party_data = self._party_data
	local current_state = party_data.picker_list[self._picker_list_id].state

	if self._first_update then
		local enter_func = states[current_state].enter

		if enter_func then
			enter_func(self, party_data, self._party)
		end

		self._first_update = false
	end

	states[current_state].run(self, party_data, self._party, self._timer, t, dt)

	if self._is_server then
		return
	end

	if self._timer_paused then
		return
	end

	self._timer = math.max(self._timer - dt, 0)
end

VersusPartySelectionLogic.destroy = function (self)
	table.clear(self._party_states_lookup)
	table.clear(self._client_states_lookup)
	self:_unregister_rpcs()
end

VersusPartySelectionLogic._register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit
end

VersusPartySelectionLogic._unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._network_transmit = nil
end

VersusPartySelectionLogic.set_ingame_ui = function (self, ingame_ui)
	self._ingame_ui = ingame_ui
end

VersusPartySelectionLogic.hot_join_sync = function (self, peer_id)
	self:_sync_party_array(peer_id)

	local pick_data_per_party = self._pick_data_per_party

	for i = 1, #pick_data_per_party do
		local party_data = pick_data_per_party[i]
		local party_id = party_data.party_id
		local party_state_id = self._party_states_lookup[party_data.state]
		local picker_list = party_data.picker_list

		for j = 1, #picker_list do
			local player_data = picker_list[j]
			local picker_id = player_data.picker_index
			local player_state_id = self._client_states_lookup[player_data.state]

			self._network_transmit:send_rpc("rpc_set_party_state", peer_id, party_id, party_state_id)

			local profile_index, career_index

			if ClientStateLookup[player_data.state] >= ClientStateLookup.player_picking_character then
				local slot_id = player_data.slot_id
				local mechanism = Managers.mechanism:game_mechanism()
				local is_bot = VersusPartySelectionLogicUtility.picker_index_is_bot(party_data, slot_id)

				if is_bot then
					profile_index, career_index = mechanism:get_saved_bot(party_id, slot_id)
				else
					profile_index, career_index = mechanism:get_wanted_hero_character(player_data.status.peer_id, player_data.status.local_player_id, party_id)
				end
			end

			if profile_index then
				local party = Managers.party:get_party(party_id)
				local slots_data = party.slots_data
				local slot_data = slots_data[player_data.slot_id]
				local melee_name, ranged_name, skin_name, hat_name, frame_name = slot_data.slot_melee, slot_data.slot_ranged, slot_data.slot_skin, slot_data.slot_hat, slot_data.slot_frame
				local melee_id = NetworkLookup.item_names[melee_name or "n/a"]
				local ranged_id = NetworkLookup.item_names[ranged_name or "n/a"]
				local skin_id = NetworkLookup.item_names[skin_name or "n/a"]
				local hat_id = NetworkLookup.item_names[hat_name or "n/a"]
				local frame_id = NetworkLookup.item_names[frame_name or "n/a"]

				self._network_transmit:send_rpc("rpc_sync_player_loadout", peer_id, party_id, picker_id, profile_index, career_index, melee_id, ranged_id, skin_id, hat_id, frame_id)
			end

			self._network_transmit:send_rpc("rpc_set_player_state", peer_id, player_state_id, party_id, picker_id)
		end
	end

	if self._timer > 0 then
		local network_time_done = Managers.state.network:network_time() + self._timer

		self._network_transmit:send_rpc("rpc_set_party_selection_logic_timer", peer_id, self._timer, network_time_done)
	end
end

VersusPartySelectionLogic.get_party_data = function (self, party_id)
	local pick_data_per_party = self._pick_data_per_party

	return pick_data_per_party and pick_data_per_party[party_id]
end

VersusPartySelectionLogic.set_player_state = function (self, new_state, party_id, picker_id)
	if self._is_server then
		local new_state_id = self._client_states_lookup[new_state]

		self._network_transmit:send_rpc_clients("rpc_set_player_state", new_state_id, party_id, picker_id)
	end

	local pick_data_per_party = self._pick_data_per_party
	local party_data = pick_data_per_party[party_id]
	local picker_list = party_data.picker_list
	local picker_data = picker_list[picker_id]

	if not DEDICATED_SERVER and picker_id == self._picker_list_id and party_id == self._party_data.party_id then
		local states = VersusPartySelectionLogic.client_states
		local enter_func = states[new_state].enter

		if enter_func then
			local party = Managers.party:get_party(party_id)

			enter_func(self, party_data, party)
		end
	end

	picker_data.state = new_state
end

VersusPartySelectionLogic.set_party_current_picker = function (self, party_id, picker_id)
	self._network_transmit:send_rpc_clients("rpc_set_party_picking_id", party_id, picker_id)

	if not DEDICATED_SERVER then
		local pick_data_per_party = self._pick_data_per_party
		local party_data = pick_data_per_party[party_id]

		party_data.current_picker_index = picker_id
	end
end

VersusPartySelectionLogic.set_timer = function (self, value)
	self._timer = value

	if self._is_server then
		self._current_timer_total = value

		local network_time_done = Managers.state.network:network_time() + value

		self._network_transmit:send_rpc_clients("rpc_set_party_selection_logic_timer", value, network_time_done)
	end
end

VersusPartySelectionLogic._make_available_profile_lookup = function (self, affilation, role)
	local profile_lookup = {}

	for i = 1, #SPProfiles do
		local profile = SPProfiles[i]

		if profile.affiliation == affilation and profile.role == role then
			local careers = {}

			for i = 1, #profile.careers do
				local career = profile.careers[i]

				if career:is_dlc_unlocked() and career:override_available_for_mechanism() ~= false then
					careers[#careers + 1] = i
				end
			end

			if #careers > 0 then
				profile_lookup[profile.index] = careers
			end
		end
	end

	fassert(not table.is_empty(profile_lookup) or affilation == "spectators", "Failed to find any available profiles for " .. affilation)

	return profile_lookup
end

VersusPartySelectionLogic.get_character_or_random = function (self, available_characters, profile_index, career_index)
	local careers = available_characters[profile_index]

	if careers and careers[career_index] then
		return profile_index, career_index
	end

	return self:get_random_available_character(available_characters)
end

VersusPartySelectionLogic.get_random_available_character = function (self, available_characters)
	local keys = {}

	for key, _ in pairs(available_characters) do
		keys[#keys + 1] = key
	end

	local num_profiles = #keys
	local profile_index = keys[math.random(num_profiles)]
	local careers = available_characters[profile_index]
	local num_careers = #careers
	local career_index = careers[math.random(num_careers)]

	return profile_index, career_index
end

VersusPartySelectionLogic.remove_available_character = function (self, profile_index, career_index, party_data, party)
	local available_characters = party_data.available_characters

	if self._settings.duplicate_hero_careers_allowed then
		return
	end

	local careers = available_characters[profile_index]

	careers[career_index] = nil

	if not self._settings.duplicate_hero_profiles_allowed or #careers == 0 then
		available_characters[profile_index] = nil
	end
end

VersusPartySelectionLogic._ensure_picker_has_character = function (self, party_data, party, picker_index, force_sync)
	local picker_data = party_data.picker_list[picker_index]
	local status = picker_data.status
	local available_characters = party_data.available_characters
	local profile_index, career_index
	local mechanism = Managers.mechanism:game_mechanism()
	local is_bot = VersusPartySelectionLogicUtility.picker_index_is_bot(party_data, picker_index)

	if is_bot then
		profile_index, career_index = mechanism:get_saved_bot(party.party_id, picker_data.slot_id)
	else
		profile_index, career_index = mechanism:get_wanted_hero_character(status.peer_id, status.local_player_id, party.party_id)
	end

	if not profile_index or not career_index or profile_index == 0 or career_index == 0 or not available_characters[profile_index] or force_sync then
		profile_index, career_index = self:get_character_or_random(available_characters, profile_index, career_index)

		self:sync_player_loadout(profile_index, career_index, party.party_id, picker_index)
	end

	if is_bot then
		mechanism:set_saved_bot(party.party_id, picker_data.slot_id, profile_index, career_index)
	else
		mechanism:set_saved_hero(status.peer_id, status.local_player_id, party.party_id, profile_index, career_index)
	end

	return profile_index, career_index
end

VersusPartySelectionLogic.check_preferred_character_taken = function (self, party_data, party)
	if not self._is_server then
		local current_picker_index = party_data.current_picker_index

		if current_picker_index < 2 then
			return
		end

		local picker_list = party_data.picker_list
		local status = picker_list[current_picker_index - 1].status
		local profile_index = status.selected_profile_index
		local career_index = status.selected_career_index

		self:remove_available_character(profile_index, career_index, party_data, party)
	end
end

VersusPartySelectionLogic.select_character = function (self, profile_index, career_index)
	assert(profile_index and career_index, "[VersusPartySelectionLogic] Selecting non-character")
	print("[VersusPartySelectionLogic] Local player selected", profile_index, career_index)
	self:sync_player_loadout(profile_index, career_index, self._local_party_id, self._picker_list_id)
end

VersusPartySelectionLogic._sync_hovered_item = function (self, peer_id, local_player_id, profile_index, career_index)
	local player_party_status = Managers.party:get_status_from_unique_id(peer_id .. ":" .. local_player_id)

	if player_party_status then
		player_party_status.hovered_profile_index = profile_index
		player_party_status.hovered_career_index = career_index
	end
end

VersusPartySelectionLogic.sync_hovered_item = function (self, peer_id, local_player_id, profile_index, career_index)
	self:_sync_hovered_item(peer_id, local_player_id, profile_index, career_index)

	if self._is_server then
		self._network_transmit:send_rpc_clients("rpc_pre_game_sync_hovered_item", peer_id, local_player_id, profile_index, career_index)
	else
		self._network_transmit:send_rpc_server("rpc_pre_game_sync_hovered_item", peer_id, local_player_id, profile_index, career_index)
	end
end

VersusPartySelectionLogic.set_party_timer = function (self, party_data)
	local picking_settings = self._picking_settings
	local player_pick_time = picking_settings.player_pick_time
	local current_picker_index = party_data.current_picker_index
	local timer = player_pick_time * current_picker_index

	party_data.slider_timer = timer
	party_data.time_finished = timer
end

local function make_index_array(party, shuffle_order)
	local array = {}
	local slots = party.slots
	local slots_data = party.slots_data
	local k = 0

	for i = 1, party.num_slots do
		local status = slots[i]

		if status.is_player and status.peer_id then
			k = k + 1
			array[k] = {
				is_bot = false,
				is_connected = true,
				state = "startup",
				slot_id = i,
				status = status,
			}
		end
	end

	if shuffle_order == "players_first" then
		table.shuffle(array)
	end

	for i = 1, party.num_slots do
		local status = slots[i]

		if status.is_bot or not status.peer_id then
			k = k + 1
			array[k] = {
				is_bot = true,
				is_connected = true,
				state = "startup",
				slot_id = i,
				status = status,
			}
		end
	end

	if shuffle_order == "mix_all" then
		table.shuffle(array)
	end

	for i = 1, party.num_slots do
		local player_data = array[i]

		player_data.picker_index = i

		local slot_data = slots_data[player_data.slot_id]

		slot_data.player_data_id = i
	end

	return array
end

VersusPartySelectionLogic._setup_picking_order = function (self, is_server)
	local shuffle_order = Managers.state.game_mode:setting("shuffle_character_picking_order")
	local pick_data_per_party = self._pick_data_per_party
	local parties = Managers.party:game_participating_parties()

	for i = 1, #parties do
		local party = parties[i]
		local picker_list = make_index_array(party, shuffle_order, true)

		pick_data_per_party[i] = {
			current_picker_index = 0,
			state = "startup",
			picker_list = picker_list,
			party_id = i,
			available_characters = self:_make_available_profile_lookup("heroes", "hero"),
		}
	end
end

VersusPartySelectionLogic._sync_party_array = function (self, peer_id)
	local party_array = {}
	local pick_data_per_party = self._pick_data_per_party

	for party_id, party_data in ipairs(pick_data_per_party) do
		local picker_list = party_data.picker_list

		table.clear(party_array)

		for j = 1, #picker_list do
			party_array[j] = picker_list[j].slot_id
		end

		local current_picker_index = party_data.current_picker_index

		self._network_transmit:send_rpc("rpc_set_party_array", peer_id, party_id, party_array, current_picker_index)
	end
end

VersusPartySelectionLogic.sync_player_loadout = function (self, profile_index, career_index, party_id, picker_list_id)
	local melee_id, ranged_id, skin_id, hat_id, frame_id

	if profile_index and profile_index > 0 then
		melee_id, ranged_id, skin_id, hat_id, frame_id = self:_get_loadout(profile_index, career_index)
	else
		melee_id, ranged_id, skin_id, hat_id, frame_id = 1, 1, 1, 1, 1
	end

	self:_set_loadout(party_id, picker_list_id, profile_index, career_index, melee_id, ranged_id, skin_id, hat_id, frame_id)

	if self._is_server then
		self._network_transmit:send_rpc_clients("rpc_sync_player_loadout", party_id, picker_list_id, profile_index, career_index, melee_id, ranged_id, skin_id, hat_id, frame_id)
	else
		self._network_transmit:send_rpc_server("rpc_sync_player_loadout", party_id, picker_list_id, profile_index, career_index, melee_id, ranged_id, skin_id, hat_id, frame_id)
	end
end

VersusPartySelectionLogic._set_loadout = function (self, party_id, pick_id, profile_index, career_index, melee_id, ranged_id, skin_id, hat_id, frame_id)
	local party = Managers.party:get_party(party_id)
	local party_data = self._pick_data_per_party[party_id]
	local picker_list = party_data.picker_list
	local picker_data = picker_list[pick_id]
	local status = picker_data.status

	status.selected_profile_index = profile_index
	status.selected_career_index = career_index
	status.profile_index = profile_index
	status.career_index = career_index

	local slots_data = party.slots_data
	local slot_data = slots_data[picker_data.slot_id]

	slot_data.slot_melee = NetworkLookup.item_names[melee_id]
	slot_data.slot_ranged = NetworkLookup.item_names[ranged_id]
	slot_data.slot_skin = NetworkLookup.item_names[skin_id]
	slot_data.slot_hat = NetworkLookup.item_names[hat_id]
	slot_data.slot_frame = NetworkLookup.item_names[frame_id]
end

VersusPartySelectionLogic._get_loadout = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local career_name = career.display_name
	local item_slot_types_by_slot_name = career.item_slot_types_by_slot_name
	local get_loadout_item = BackendUtils.get_loadout_item
	local melee = item_slot_types_by_slot_name.slot_melee and get_loadout_item(career_name, "slot_melee")
	local ranged = item_slot_types_by_slot_name.slot_ranged and get_loadout_item(career_name, "slot_ranged")
	local skin = item_slot_types_by_slot_name.slot_skin and get_loadout_item(career_name, "slot_skin")
	local hat = item_slot_types_by_slot_name.slot_hat and get_loadout_item(career_name, "slot_hat")
	local portrait_frame = item_slot_types_by_slot_name.slot_frame and get_loadout_item(career_name, "slot_frame")
	local melee_id = melee and NetworkLookup.item_names[melee.key] or 1
	local ranged_id = ranged and NetworkLookup.item_names[ranged.key] or 1
	local skin_id = skin and NetworkLookup.item_names[skin.key] or 1
	local hat_id = hat and NetworkLookup.item_names[hat.key] or 1
	local frame_id = hat and NetworkLookup.item_names[portrait_frame.key] or 1

	return melee_id, ranged_id, skin_id, hat_id, frame_id
end

VersusPartySelectionLogic.settings = function (self)
	return self._settings
end

VersusPartySelectionLogic._all_parties_have_picked = function (self)
	local pick_data_per_party = self._pick_data_per_party

	for i = 2, #pick_data_per_party do
		local party_data = pick_data_per_party[i]

		if party_data.state ~= "closing" then
			return false
		end
	end

	local profile_synchronizer = Managers.state.network.profile_synchronizer

	if not profile_synchronizer:all_synced() then
		return false
	end

	return true
end

VersusPartySelectionLogic.player_joined_party = function (self, peer_id, local_player_id, new_party_id, slot_id)
	if new_party_id == 0 then
		return
	end

	if not self._pick_data_per_party then
		return
	end

	local party = Managers.party:get_party(new_party_id)
	local party_data = self._pick_data_per_party[new_party_id]
	local picker_list = party_data.picker_list
	local pick_id

	for i = 1, #picker_list do
		if picker_list[i].slot_id == slot_id then
			pick_id = i

			break
		end
	end

	fassert(pick_id ~= nil, "Failed to find slot id")

	local picker_data = picker_list[pick_id]

	fassert(picker_data.is_bot ~= false, "Tried to replace human player. Expected to replace bot")

	local status = party.slots[slot_id]
	local old_status = picker_data.status

	picker_data.status = status
	picker_data.is_bot = false

	if not self._is_server then
		return
	end

	local mechanism = Managers.mechanism:game_mechanism()

	if ClientStateLookup[picker_data.state] >= ClientStateLookup.player_picking_character then
		local old_profile_index = mechanism:get_saved_bot(new_party_id, slot_id)
		local available_characters = party_data.available_characters

		if old_profile_index and not available_characters[old_profile_index] then
			local profile = SPProfiles[old_profile_index]
			local careers = {}

			for i = 1, #profile.careers do
				local career = profile.careers[i]

				if career:is_dlc_unlocked() and career:override_available_for_mechanism() ~= false then
					careers[#careers + 1] = i
				end
			end

			available_characters[old_profile_index] = careers
		end

		local profile_index, career_index = self:_ensure_picker_has_character(party_data, party, pick_id, true)

		printf("[VersusPartySelectionLogic] %s in party %s hot joined and was delegated %s", status.peer_id or "BOT", party.party_id, SPProfiles[profile_index].careers[career_index].display_name)

		if ClientStateLookup[picker_data.state] > ClientStateLookup.player_picking_character then
			self:remove_available_character(profile_index, career_index, party_data, party)
		end
	end
end

VersusPartySelectionLogic.player_left_party = function (self, peer_id, local_player_id, party_id, slot_id, old_slot_data)
	if party_id == 0 then
		return
	end

	local party = Managers.party:get_party(party_id)
	local party_data = self._pick_data_per_party[party_id]
	local picker_list = party_data.picker_list
	local index

	for i = 1, #picker_list do
		if picker_list[i].slot_id == slot_id then
			index = i

			break
		end
	end

	fassert(index ~= nil, "Failed to find slot id")

	local picker_data = picker_list[index]

	picker_data.is_bot = nil
	picker_data.status = party.slots[slot_id]

	if not self._is_server then
		return
	end

	if ClientStateLookup[picker_data.state] >= ClientStateLookup.player_picking_character then
		local mechanism = Managers.mechanism:game_mechanism()
		local profile_index = mechanism:get_saved_hero(party_id, peer_id, local_player_id)
		local available_characters = party_data.available_characters

		if profile_index and not available_characters[profile_index] then
			local profile = SPProfiles[profile_index]
			local careers = {}

			for i = 1, #profile.careers do
				local career = profile.careers[i]

				if career:is_dlc_unlocked() and career:override_available_for_mechanism() ~= false then
					careers[#careers + 1] = i
				end
			end

			available_characters[profile_index] = careers
		end

		local new_profile_index, new_career_index = self:_ensure_picker_has_character(party_data, party, index, true)
		local old_peer_id = old_slot_data.status and old_slot_data.status.peer_id

		printf("[VersusPartySelectionLogic] %s in party %s left and was replaced by %s", old_peer_id or "UNKNOWN", party.party_id, SPProfiles[new_profile_index].careers[new_career_index].display_name)

		if ClientStateLookup[picker_data.state] > ClientStateLookup.player_picking_character then
			self:remove_available_character(new_profile_index, new_career_index, party_data, party)
		end
	end
end

VersusPartySelectionLogic.rpc_set_party_array = function (self, channel_id, party_id, party_array, current_picker_index)
	local party = Managers.party:get_party(party_id)
	local slots = party.slots
	local picker_list = {}

	for i = 1, #party_array do
		local slot_id = party_array[i]
		local status = slots[slot_id]

		picker_list[i] = {
			state = "startup",
			picker_index = i,
			slot_id = slot_id,
			status = status,
		}
	end

	local pick_data

	if self._pick_data_per_party then
		pick_data = self._pick_data_per_party[party_id]
	end

	if not pick_data then
		pick_data = {
			current_picker_index = 0,
			state = "startup",
			picker_list = picker_list,
			party_id = party_id,
			available_characters = self:_make_available_profile_lookup("heroes", "hero"),
		}
		self._pick_data_per_party[party_id] = pick_data
	end

	local individual_player_pick_time = GameModeSettings.versus.character_picking_settings.player_pick_time
	local party_size = party.num_slots

	pick_data.current_picker_index = current_picker_index
	pick_data.prev_picker_index = current_picker_index - 1
	pick_data.total_slider_time = individual_player_pick_time * party_size
end

VersusPartySelectionLogic.rpc_set_party_state = function (self, channel_id, party_id, new_state_id)
	local pick_data = self._pick_data_per_party[party_id]

	pick_data.state = self._party_states_lookup[new_state_id]
end

VersusPartySelectionLogic.rpc_sync_player_loadout = function (self, channel_id, party_id, pick_id, profile_index, career_index, melee_id, ranged_id, skin_id, hat_id, frame_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if not peer_id then
		return
	end

	if self._is_server then
		local pick_data = self._pick_data_per_party[party_id]
		local is_bot = VersusPartySelectionLogicUtility.picker_index_is_bot(pick_data, pick_id)

		if is_bot then
			return
		end

		local mechanism = Managers.mechanism:game_mechanism()
		local picker_list = pick_data.picker_list
		local picker_data = picker_list[pick_id]
		local state = picker_data.state
		local status = picker_data.status

		if ClientStateLookup[state] > ClientStateLookup.player_picking_character and (status.selected_profile_index ~= profile_index or status.selected_career_index ~= career_index) then
			print("[VersusPartySelectionLogic] Client tried to change loadout of a different character after a character has already been picked. Bouncing back request.")

			local real_profile_idx, real_career_idx = mechanism:get_saved_hero(party_id, status.peer_id, status.local_player_id)

			self._network_transmit:send_rpc("rpc_sync_player_loadout", peer_id, party_id, pick_id, real_profile_idx, real_career_idx, 1, 1, 1, 1, 1)

			return
		end

		mechanism:set_saved_hero(status.peer_id, status.local_player_id, party_id, profile_index, career_index)
		self._network_transmit:send_rpc_clients_except("rpc_sync_player_loadout", peer_id, party_id, pick_id, profile_index, career_index, melee_id, ranged_id, skin_id, hat_id, frame_id)
	end

	if self._local_party_id == party_id and self._picker_list_id == pick_id then
		print("[VersusPartySelectionLogic] Local player was assigned to", profile_index, career_index)
		self:sync_player_loadout(profile_index, career_index, self._local_party_id, self._picker_list_id)
	else
		self:_set_loadout(party_id, pick_id, profile_index, career_index, melee_id, ranged_id, skin_id, hat_id, frame_id)
	end
end

VersusPartySelectionLogic.rpc_set_player_state = function (self, channel_id, new_state_id, party_id, picker_id)
	fassert(not self._is_server, "Server should never get this")

	local new_state = self._client_states_lookup[new_state_id]

	self:set_player_state(new_state, party_id, picker_id)
end

VersusPartySelectionLogic.rpc_set_party_picking_id = function (self, channel_id, party_id, picker_id)
	local pick_data_per_party = self._pick_data_per_party
	local party_data = pick_data_per_party[party_id]

	party_data.current_picker_index = picker_id
end

VersusPartySelectionLogic.rpc_pre_game_sync_hovered_item = function (self, channel_id, peer_id, local_player_id, profile_index, career_index)
	self:_sync_hovered_item(peer_id, local_player_id, profile_index, career_index)

	if self._is_server then
		local sender_peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._network_transmit:send_rpc_clients_except("rpc_pre_game_sync_hovered_item", sender_peer_id, peer_id, local_player_id, profile_index, career_index)
	end
end

VersusPartySelectionLogic.timer = function (self)
	return self._timer
end

VersusPartySelectionLogic.on_player_left_party = function (self, peer_id, local_player_id, party_id, slot_id_player)
	if self._peers_ready then
		self._peers_ready[peer_id] = nil
	end

	local pick_data = self._pick_data_per_party[party_id]
	local picker_list = pick_data.picker_list

	for i = 1, #picker_list do
		if picker_list[i].slot_id == slot_id_player then
			picker_list[i].is_connected = false
		end
	end
end

VersusPartySelectionLogic.rpc_set_party_selection_logic_timer = function (self, peer_id, real_time_left, end_network_time)
	local current_network_time = Managers.state.network:network_time()

	if current_network_time == 0 then
		current_network_time = end_network_time - real_time_left
	end

	local time_left = end_network_time - current_network_time

	self._timer_scale = time_left / real_time_left
	self._timer = real_time_left
end
