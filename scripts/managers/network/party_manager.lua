require("scripts/helpers/player_utils")

PartyManager = class(PartyManager)
local rpcs = {
	"rpc_request_join_party",
	"rpc_peer_assigned_to_party",
	"rpc_remove_peer_from_party"
}

PartyManager.init = function (self)
	self._leader = nil

	self:_reset()
end

PartyManager.destroy = function (self)
	if self._gui then
		local world = Application.debug_world()

		World.destroy_gui(world, self._gui)

		self._gui = nil
	end
end

PartyManager.reset = function ()
	if Managers.party then
		Managers.party:destroy()
	end

	Managers.party = PartyManager:new()
end

PartyManager.set_leader = function (self, peer_id)
	if peer_id == nil then
		print("[PartyManager] Leader is cleared")
	else
		print("[PartyManager] Leader is set to " .. peer_id)
	end

	self._leader = peer_id
end

PartyManager.leader = function (self)
	return self._leader
end

PartyManager.is_leader = function (self, peer_id)
	return peer_id == self._leader
end

PartyManager._reset = function (self)
	self._player_statuses = {}
	self._parties = {}
	self._party_by_name = {}
	self._undecided_party = self:_register_party({
		party_id = 0,
		name = "undecided",
		num_open_slots = 0,
		num_slots = 64,
		tags = {}
	})
	self._parties[0] = self._undecided_party
	self._hot_join_synced_peers = {}
end

PartyManager._register_party = function (self, def)
	local num_slots = def.num_slots
	local slots = {}
	local slots_data = {}

	for j = 1, num_slots, 1 do
		slots[j] = {
			game_mode_data = {}
		}
		slots_data[j] = {
			slot_id = j
		}
	end

	local party = {
		num_bots = 0,
		num_used_slots = 0,
		party_id = def.party_id,
		name = def.name,
		num_open_slots = num_slots,
		num_slots = num_slots,
		slots = slots,
		occupied_slots = {},
		bot_add_order = {},
		slots_data = slots_data
	}

	return party
end

PartyManager.register_parties = function (self, party_definitions)
	for party_name, def in pairs(party_definitions) do
		local party_id = def.party_id

		fassert(party_id ~= 0, "This party id is reserved for undecided party.")

		local party = self:_register_party(def)
		self._parties[party_id] = party
		self._party_by_name[party_name] = party
	end
end

PartyManager._create_player_status = function (self, peer_id, local_player_id, is_bot)
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local statuses = self._player_statuses
	local status = {
		score = 0,
		peer_id = peer_id,
		local_player_id = local_player_id,
		unique_id = unique_id,
		is_bot = is_bot,
		is_player = not is_bot,
		game_mode_data = {}
	}

	fassert(not statuses[unique_id], "Player already connected peer_id=%s local_player_id%s", peer_id, local_player_id)

	statuses[unique_id] = status

	return status
end

PartyManager.register_player = function (self, player, unique_id)
	local status = self._player_statuses[unique_id]
	status.player = player
end

PartyManager.set_selected_profile = function (self, peer_id, local_player_id, profile_index, career_index)
	local status = self:get_player_status(peer_id, local_player_id)
	status.selected_profile_index = profile_index
	status.selected_career_index = career_index
end

PartyManager.cleanup_game_mode_data = function (self)
	for unique_id, status in pairs(self._player_statuses) do
		status.game_mode_data = {}
	end
end

PartyManager.register_rpcs = function (self, network_event_delegate)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(rpcs))
end

PartyManager.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

PartyManager.update = function (self, t, dt)
	return
end

PartyManager.get_party = function (self, party_id)
	return self._parties[party_id]
end

PartyManager.parties = function (self)
	return self._parties
end

PartyManager._slot_empty_in_party = function (self, party_id, slot_id)
	local party = self._parties[party_id]
	local status = party.slots[slot_id]
	local peer_id = status.peer_id

	return peer_id == nil
end

PartyManager.request_join_party = function (self, peer_id, local_player_id, party_id, optional_slot_id, optional_bot_player)
	if self._is_server then
		local party = self._parties[party_id]
		local slot_empty = true

		if optional_slot_id then
			slot_empty = self:_slot_empty_in_party(party_id, optional_slot_id)
		end

		if slot_empty then
			local is_bot = false

			if party.num_used_slots < party.num_slots then
				self:assign_peer_to_party(peer_id, local_player_id, party_id, optional_slot_id, is_bot)
			elseif party.num_bots > 0 then
				local status = nil

				if optional_bot_player then
					local bot_peer_id = optional_bot_player:network_id()
					local bot_local_player_id = optional_bot_player:local_player_id()
					status = Managers.party:get_player_status(bot_peer_id, bot_local_player_id)
				else
					status = self:_get_last_added_bot_for_party(party_id)
				end

				self:remove_peer_from_party(status.peer_id, status.local_player_id, status.party_id)
				self:assign_peer_to_party(peer_id, local_player_id, party_id, optional_slot_id, is_bot)
			end
		end
	else
		printf("Sending request join party")

		optional_slot_id = optional_slot_id or NetworkConstants.INVALID_PARTY_SLOT_ID

		RPC.rpc_request_join_party(self._server_peer_id, peer_id, local_player_id, party_id, optional_slot_id)
	end
end

PartyManager.get_player_status = function (self, peer_id, local_player_id)
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local status = self._player_statuses[unique_id]

	return status
end

PartyManager.get_status_from_unique_id = function (self, unique_id)
	return self._player_statuses[unique_id]
end

PartyManager.get_party_from_player_id = function (self, peer_id, local_player_id)
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local status = self._player_statuses[unique_id]

	if status then
		local party_id = status.party_id

		return self._parties[party_id], party_id
	end
end

PartyManager.get_party_from_name = function (self, party_name)
	local parties = self._parties

	for i = 0, #parties, 1 do
		local party = parties[i]

		if party.name == party_name then
			return party
		end
	end
end

PartyManager.assign_peer_to_party = function (self, peer_id, local_player_id, wanted_party_id, optional_slot_id, is_bot)
	is_bot = not not is_bot
	local unique_id = PlayerUtils.unique_player_id(peer_id, local_player_id)
	local existing_player = true
	local player_status = self._player_statuses[unique_id]

	if not player_status then
		player_status = self:_create_player_status(peer_id, local_player_id, is_bot)
		existing_player = false
	end

	local old_party_id = nil

	if existing_player and player_status.party_id then
		old_party_id = player_status.party_id
		local old_party = self._parties[old_party_id]
		local old_slot_id = player_status.slot_id
		local old_is_bot = player_status.is_bot

		self:_clear_slot_in_party(old_party, old_slot_id, old_is_bot)
	end

	local party = (wanted_party_id and self._parties[wanted_party_id]) or self._undecided_party
	local party_id = wanted_party_id or 0

	printf("player (%s,%d) was put into party %d", peer_id, local_player_id, party_id)

	local slot_id = optional_slot_id or self:_find_first_empty_slot_id(party)
	party.slots[slot_id] = player_status
	party.occupied_slots[#party.occupied_slots + 1] = player_status
	player_status.party_id = party_id
	player_status.slot_id = slot_id
	party.num_used_slots = party.num_used_slots + 1
	party.num_open_slots = party.num_slots - party.num_used_slots

	if is_bot then
		party.num_bots = party.num_bots + 1
		party.bot_add_order[party.num_bots] = slot_id
	end

	if self._is_server then
		self:_send_rpc_to_clients("rpc_peer_assigned_to_party", peer_id, local_player_id, party_id, slot_id, is_bot)
	end

	if Managers.state.game_mode then
		Managers.state.game_mode:player_joined_party(peer_id, local_player_id, party_id, slot_id)
	end

	return player_status
end

PartyManager.remove_peer_from_party = function (self, peer_id, local_player_id, party_id)
	local player_status = self:get_player_status(peer_id, local_player_id)

	if not player_status then
		return
	end

	local party = self._parties[party_id]

	if Managers.state.game_mode then
		local slot_id = player_status.slot_id

		Managers.state.game_mode:player_left_party(peer_id, local_player_id, party_id, slot_id)
	end

	self:_clear_slot_in_party(party, player_status.slot_id, player_status.is_bot)

	player_status.party_id = nil
	player_status.slot_id = nil

	if self._is_server then
		self:_send_rpc_to_clients("rpc_remove_peer_from_party", peer_id, local_player_id, party_id)
	end
end

PartyManager.get_players_in_party = function (self, party_id)
	local player_statuses = {}

	for unique_id, status in pairs(self._player_statuses) do
		if status.party_id == party_id then
			table.insert(player_statuses, status)
		end
	end

	return player_statuses
end

PartyManager._find_slot_index = function (party, slot_id)
	local slot_index = nil
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots, 1 do
		local status = occupied_slots[i]

		if status.slot_id == slot_id then
			slot_index = i

			break
		end
	end

	return slot_index
end

PartyManager._clear_slot_in_party = function (self, party, slot_id, is_bot)
	party.slots[slot_id] = {}
	local slot_index = PartyManager._find_slot_index(party, slot_id)

	fassert(slot_index ~= nil, "could not find player status in occupied_slots")

	local occupied_slots = party.occupied_slots
	local num_used_slots = party.num_used_slots
	local last = occupied_slots[num_used_slots]
	occupied_slots[slot_index] = last
	occupied_slots[num_used_slots] = nil
	party.num_used_slots = num_used_slots - 1
	party.num_open_slots = party.num_slots - party.num_used_slots

	if is_bot then
		party.num_bots = party.num_bots - 1
		local add_order = table.find(party.bot_add_order, slot_id)

		table.remove(party.bot_add_order, add_order)
	end
end

PartyManager._find_first_empty_slot_id = function (self, party)
	local slots = party.slots
	local num_slots = party.num_slots

	for i = 1, num_slots, 1 do
		if slots[i] == nil or slots[i].peer_id == nil then
			return i
		end
	end

	ferror("No empty slot in party %s", party.name)
end

PartyManager.get_least_filled_party = function (self, ignore_bots)
	local parties = self._parties

	fassert(#parties > 1, "parties has not been initialized yet")

	local best_party_id = 0
	local count = math.huge

	for i = 1, #parties, 1 do
		local party = parties[i]
		local num_used_slots = party.num_used_slots

		if ignore_bots then
			num_used_slots = num_used_slots - party.num_bots
		end

		if count > num_used_slots then
			best_party_id = i
			count = num_used_slots
		end
	end

	return parties[best_party_id], best_party_id
end

PartyManager.is_party_full = function (self, party_id)
	local party = self._parties[party_id]
	local num_open_slots = party.num_open_slots + party.num_bots

	return num_open_slots == 0
end

PartyManager.is_player_in_party = function (self, unique_id, party_id)
	local party = self._parties[party_id]
	local player_status = self._player_statuses[unique_id]

	return party_id == player_status.party_id
end

PartyManager._get_last_added_bot_for_party = function (self, party_id)
	local party = self._parties[party_id]
	local slot_id = party.bot_add_order[party.num_bots]
	local status = party.slots[slot_id]

	return status
end

PartyManager.hot_join_sync = function (self, peer_id)
	local parties = self._parties

	for party_id = 0, #parties, 1 do
		local party = parties[party_id]
		local occupied_slots = party.occupied_slots

		for i = 1, #occupied_slots, 1 do
			local status = occupied_slots[i]
			local slot_peer_id = status.peer_id
			local slot_local_player_id = status.local_player_id
			local is_bot = status.is_bot
			local slot_id = status.slot_id

			RPC.rpc_peer_assigned_to_party(peer_id, slot_peer_id, slot_local_player_id, party_id, slot_id, is_bot)
		end
	end
end

PartyManager._send_rpc_to_clients = function (self, rpc_name, ...)
	local rpc = RPC[rpc_name]
	local server_peer_id = self._server_peer_id

	for peer_id, synced in pairs(self._hot_join_synced_peers) do
		if peer_id ~= server_peer_id and synced then
			rpc(peer_id, ...)
		end
	end
end

PartyManager.network_context_created = function (self, lobby, server_peer_id, own_peer_id)
	printf("[PartyManager] network_context_created (server_peer_id=%s, own_peer_id=%s)", server_peer_id, own_peer_id)

	self._lobby = lobby
	self._server_peer_id = server_peer_id
	self._peer_id = own_peer_id
	local is_server = server_peer_id == own_peer_id
	self._is_server = is_server
end

PartyManager.network_context_destroyed = function (self)
	print("[PartyManager] network_context_destroyed")

	self._lobby = nil
	self._server_peer_id = nil
	self._peer_id = nil
	self._is_server = nil

	self:_reset()
end

PartyManager.server_peer_hot_join_synced = function (self, peer_id)
	self._hot_join_synced_peers[peer_id] = true
end

PartyManager.server_peer_left_session = function (self, peer_id)
	self._hot_join_synced_peers[peer_id] = false
	local parties = self._parties

	for party_id = 0, #parties, 1 do
		local party = parties[party_id]
		local slots = party.slots
		local num_slots = party.num_slots

		for i = 1, num_slots, 1 do
			local status = slots[i]

			if status.peer_id == peer_id then
				self:remove_peer_from_party(status.peer_id, status.local_player_id, party_id)
			end
		end
	end
end

PartyManager.rpc_request_join_party = function (self, sender, peer_id, local_player_id, party_id, optional_slot_id)
	printf("Recieved join party request from %s - %s party_id(%s)", peer_id, local_player_id, party_id)

	if optional_slot_id == NetworkConstants.INVALID_PARTY_SLOT_ID then
		optional_slot_id = nil
	end

	self:request_join_party(peer_id, local_player_id, party_id, optional_slot_id)
end

PartyManager.rpc_peer_assigned_to_party = function (self, sender, peer_id, local_player_id, party_id, slot_id, is_bot)
	print("PartyManager:rpc_peer_assigned_to_party()", sender, peer_id, local_player_id, party_id, slot_id)
	self:assign_peer_to_party(peer_id, local_player_id, party_id, slot_id, is_bot)
end

PartyManager.rpc_remove_peer_from_party = function (self, sender, peer_id, local_player_id, party_id)
	print("PartyManager:rpc_remove_peer_from_party()", sender, peer_id, local_player_id, party_id)
	self:remove_peer_from_party(peer_id, local_player_id, party_id)
end

PartyManager._draw_debug = function (self, t)
	local font = "materials/fonts/arial"
	local font_material = "arial"
	local text_height = 20
	local row_height = 20
	local margin = 32
	local peer_width = 180
	local state_width = 160
	local profile_width = 90
	local win_width = 2 * margin + peer_width + state_width + profile_width
	local is_server = Managers.player.is_server
	local background_color = Color(128, 0, 0, 0)
	local text_color = Color(255, 255, 255, 255)
	local text_color2 = Color(255, 128, 255, 255)
	local party_header_color = Color(255, 155, 155, 255)
	local game_mode_color = Color(255, 155, 255, 155)
	local mechanism_color = Color(255, 55, 155, 156)
	local server_color = (is_server and Color(255, 255, 255, 0)) or Color(255, 55, 126, 255)
	local width, height = Gui.resolution()
	local y = height - margin - text_height
	local win_start_x = width - win_width

	if self._gui == nil then
		local world = Application.debug_world()
		self._gui = World.create_screen_gui(world, "immediate", "material", "materials/fonts/gw_fonts")
	end

	Gui.rect(self._gui, Vector2(win_start_x, 0), Vector2(win_width, height), background_color)

	local server_text = (is_server and "(Server)") or "(Client)"

	Gui.text(self._gui, server_text, font, text_height, font_material, Vector3((win_start_x + win_width) - 80, y, 0), server_color)

	local mechanism_key = Managers.mechanism:current_mechanism_name()
	local mechanism_state = Managers.mechanism:game_mechanism():get_state()
	local info1 = string.format("Mechanism:'%s', state:'%s'", mechanism_key, mechanism_state)

	Gui.text(self._gui, info1, font, text_height, font_material, Vector3(win_start_x + margin, y, 0), mechanism_color)

	y = y - row_height
	local game_mode = Managers.state.game_mode:game_mode()
	local game_mode_name = (game_mode and game_mode:settings().key) or "none"
	local level_seed = Managers.mechanism:get_level_seed()
	local info2 = string.format("Game mode: '%s', seed: %s", game_mode_name, tostring(level_seed))

	Gui.text(self._gui, info2, font, text_height, font_material, Vector3(win_start_x + margin, y, 0), game_mode_color)

	y = y - row_height
	local info3 = string.format("    state: '%s' max: %s", game_mode:game_mode_state(), Managers.lobby._network_options.max_members)

	Gui.text(self._gui, info3, font, text_height, font_material, Vector3(win_start_x + margin, y, 0), game_mode_color)

	y = y - row_height * 2
	local parties = self._parties

	for i = 0, #parties, 1 do
		local party = parties[i]
		local x = win_start_x + margin

		Gui.text(self._gui, "Party " .. tostring(party.party_id), font, text_height, font_material, Vector3(x, y, 0), party_header_color)

		x = x + peer_width
		local side = Managers.state.side.side_by_party[party]
		local num_units = (side and side._num_units) or 0
		local num_enemy_units = (side and side._num_enemy_units) or 0

		Gui.text(self._gui, string.format("(%d/%d) units(%d) enemies(%d)", party.num_used_slots, party.num_slots, num_units, num_enemy_units), font, text_height, font_material, Vector3(x, y, 0), party_header_color)

		y = y - row_height
		x = win_start_x + margin

		Gui.text(self._gui, "Peer", font, text_height, font_material, Vector3(x, y, 0), text_color)

		x = x + peer_width

		Gui.text(self._gui, "State", font, text_height, font_material, Vector3(x, y, 0), text_color)

		x = x + state_width

		Gui.text(self._gui, "Info", font, text_height, font_material, Vector3(x, y, 0), text_color)

		y = y - 4

		Gui.rect(self._gui, Vector2(win_start_x + margin, y), Vector2(peer_width + state_width + profile_width, 1), text_color)

		y = y - row_height
		local occupied_slots = party.occupied_slots

		for i = 1, #occupied_slots, 1 do
			local status = occupied_slots[i]
			local data = status.game_mode_data
			local timer = (data.spawn_state == "w8_to_spawn" and status.game_mode_data.spawn_timer and string.format("%.1f", status.game_mode_data.spawn_timer - t)) or ""
			local state = string.format("%s %s", status.game_mode_data.spawn_state or "?", timer)
			local peer = status.peer_id
			local profile_id = status.profile_id
			local profile_index = status.profile_index
			local career_index = status.career_index
			local slot_data = party.slots_data[status.slot_id]
			local wanted_profile_id = slot_data.wanted_profile_id
			local wanted_profile_name = SPProfiles[wanted_profile_id] and SPProfiles[wanted_profile_id].display_name
			local wanted_career_id = slot_data.wanted_career_id
			local row2_text = string.format("P/C: %s-%s/%s, Picked: %s-%s/%s", tostring(profile_id), tostring(profile_index), tostring(career_index), tostring(wanted_profile_name), tostring(wanted_profile_id), tostring(wanted_career_id))
			local info = "-"
			local player_controlled = "?"
			local player = status.player

			if player then
				if player:is_player_controlled() then
					player_controlled = "P"
				else
					player_controlled = "B"
				end

				info = "1"
				local player_unit = player.player_unit
				local breed = nil

				if player_unit then
					breed = Unit.get_data(player_unit, "breed")

					if breed and breed.hit_zones_lookup ~= nil then
						info = "L"
					else
						info = "2"
					end
				elseif next(player.owned_units) then
					info = "P"
				else
					info = "?"
				end
			end

			info = player_controlled .. info
			x = win_start_x + margin

			Gui.text(self._gui, peer, font, text_height, font_material, Vector3(x, y, 0), text_color)

			x = x + peer_width

			Gui.text(self._gui, tostring(state), font, text_height, font_material, Vector3(x, y, 0), text_color)

			x = x + state_width

			Gui.text(self._gui, info, font, text_height, font_material, Vector3(x, y, 0), text_color)

			y = y - row_height
			x = win_start_x + margin

			Gui.text(self._gui, tostring(row2_text), font, text_height, font_material, Vector3(x, y, 0), text_color2)

			y = y - row_height
		end

		y = y - row_height * 2
	end
end

return
