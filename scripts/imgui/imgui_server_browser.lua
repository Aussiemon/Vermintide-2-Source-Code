ImguiServerBrowser = class(ImguiServerBrowser)
local SHOULD_RELOAD = false
local DEFAULT_WINDOW_X = 1200
local DEFAULT_WINDOW_Y = 500

local function format_timestamp(time)
	return string.format("%06.3f", time)
end

local spinner = {
	">",
	" >",
	"  >",
	"  ^",
	"  <",
	" <",
	"<",
	"^"
}

local function draw_spinner(t)
	local spinner_index = math.floor((t * 4) % 8 + 1)

	return spinner[spinner_index] or "?"
end

ImguiServerBrowser.init = function (self)
	self._search_types = {
		"favorites",
		"internet",
		"lan"
	}
	self._search_type_index = 1
	self._server_types = {
		"server",
		"lobby"
	}
	self._server_type_index = 1
	self._state = "idle"
	self._is_persistent = false
	self._first_run = true
	self._finder = nil
	self._network_hash = nil
	self._network_options = nil
	self._servers = {}
	self._filters = {}
	self._soft_filters = {
		check_server_name = false
	}

	if not HAS_STEAM then
		self._state = "missing_steam"
	end
end

ImguiServerBrowser.is_persistent = function (self)
	return self._is_persistent
end

ImguiServerBrowser.on_show = function (self)
	self:_refresh_servers()
end

ImguiServerBrowser.on_hide = function (self)
	self:_stop_search()
end

ImguiServerBrowser.update = function (self, t, dt)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	if self._state == "searching" then
		if self._server_types[self._server_type_index] == "server" then
			local found = self:_update_search_for_game_servers(t, dt)

			if found then
				self._search_type_index = self._search_type_index + 1

				if self._search_type_index > #self._search_types then
					self._server_type_index = self._server_type_index + 1
				end
			end
		elseif self._server_types[self._server_type_index] == "lobby" then
			local found = self:_update_search_for_lobbies(t, dt)

			if found then
				self:_refresh_servers()
			end
		end
	end
end

ImguiServerBrowser._update_search_for_game_servers = function (self, t, dt)
	local server_type = self._server_types[self._server_type_index]
	local search_type = self._search_types[self._search_type_index]
	local server_type_group = self._servers[server_type] or {}
	local server_list = server_type_group[search_type] or {}

	if self._finder == nil then
		self._network_options = self._network_options or Managers.lobby:network_options()
		self._network_hash = self._network_hash or Managers.lobby:network_hash()
		local optional_filters = {}
		self._finder = ServerSearchUtils.trigger_game_server_finder_search(search_type, self._network_options, 1, optional_filters)
	end

	self._finder:update(dt)

	if self._finder:is_refreshing() then
		return
	end

	local servers = self._finder:servers()

	ServerSearchUtils.filter_game_server_search(servers, self._network_options, self._soft_filters, self._network_hash, {})
	self:_clear_finder()

	server_list = servers
	server_type_group[search_type] = server_list
	self._servers[server_type] = server_type_group

	return true
end

ImguiServerBrowser._update_search_for_lobbies = function (self, t, dt)
	local server_type = self._server_types[self._server_type_index]
	local search_type = "internet"
	local server_type_group = self._servers[server_type] or {}
	local server_list = server_type_group[search_type] or {}

	if self._finder == nil then
		self._network_options = self._network_options or Managers.lobby:network_options()
		self._network_hash = self._network_hash or Managers.lobby:network_hash()
		local optional_filters = {}
		self._finder = ServerSearchUtils.trigger_lobby_finder_search(self._network_options, 1, optional_filters)
	end

	self._finder:update(dt)

	if self._finder:is_refreshing() then
		return
	end

	local lobbies = self._finder:lobbies()

	self:_clear_finder()

	server_list = lobbies
	server_type_group[search_type] = server_list
	self._servers[server_type] = server_type_group

	return true
end

ImguiServerBrowser._refresh_servers = function (self)
	self._state = "searching"
	self._search_type_index = 1
	self._server_type_index = 1
end

ImguiServerBrowser._stop_search = function (self)
	self._state = "idle"

	self:_clear_finder()
end

ImguiServerBrowser._clear_finder = function (self)
	if self._finder then
		self._finder:destroy()

		self._finder = nil
	end
end

ImguiServerBrowser.button = function (self, text, func_name, params, ...)
	if Imgui.button(text, ...) then
		local func = func_name and self[func_name]

		if func then
			params = params or {}

			func(self, unpack(params))
		end
	end
end

ImguiServerBrowser.set_columns = function (self, num_columns, border, columns_width)
	border = border or false

	Imgui.columns(num_columns, border)

	if not columns_width then
		return
	end

	if type(columns_width) == "table" then
		for i, width in ipairs(columns_width) do
			Imgui.set_column_width(width, i - 1)
		end
	else
		for i = 0, num_columns - 1, 1 do
			Imgui.set_column_width(columns_width, i)
		end
	end
end

ImguiServerBrowser.reset_columns = function (self)
	self:set_columns(1)
end

ImguiServerBrowser.draw = function (self, is_open, t, dt)
	if self._first_run then
		Imgui.set_next_window_size(DEFAULT_WINDOW_X, DEFAULT_WINDOW_Y)

		self._first_run = false
	end

	Imgui.Begin("Dedicated servers")
	self:_draw_status(t)
	self:_draw_server_list()
	self:_draw_search_button()
	Imgui.End("Dedicated servers")
end

local status_data = {
	searching = {
		text = "<Searching> %s",
		color = {
			36,
			180,
			0,
			255
		}
	},
	idle = {
		text = "<Idle>",
		color = {
			255,
			255,
			255,
			255
		}
	},
	missing_steam = {
		text = "<Steam is missing>",
		color = {
			255,
			0,
			0,
			255
		}
	},
	unknown = {
		text = "<Unknown State> %s",
		color = {
			255,
			0,
			0,
			255
		}
	}
}

ImguiServerBrowser._draw_status = function (self, t)
	local state = self._state
	local status = status_data[state] or status_data.unknown
	local status_text = status.text
	local status_color = status.color
	local show_spinner = false

	if state == "searching" then
		local search_type = self._search_types[self._search_type_index]
		status_text = string.format(status_text, search_type or "lobbies")
		show_spinner = true
	else
		status_text = string.format(status_text, state)
	end

	Imgui.text("Status: ")
	Imgui.same_line()
	Imgui.text_colored(status_text, unpack(status_color))

	if show_spinner then
		Imgui.same_line(6)

		local spinner_char = draw_spinner(t)

		Imgui.text_colored(spinner_char, 180, 180, 0, 255)
	end
end

local header = {
	"Name",
	"UniqueId",
	"Players",
	"Game Mode",
	"Level",
	"Matchmaking",
	"Server Type",
	"Search Type",
	"Game State"
}
local columns_width = {
	180,
	180,
	60,
	80,
	100,
	90,
	90,
	90,
	120,
	50,
	80
}

ImguiServerBrowser._draw_server_list = function (self)
	self:set_columns(#header + 2, nil, columns_width)

	for i = 1, #header, 1 do
		Imgui.text(header[i])
		Imgui.next_column()
	end

	Imgui.next_column()
	Imgui.next_column()
	Imgui.separator()

	for server_type, type_data in pairs(self._servers) do
		for search_type, search_data in pairs(type_data) do
			for index, server in pairs(search_data) do
				Imgui.tree_push(string.format("%s_%s_%s", server_type, search_type, index))

				local server_info = server.server_info
				local game_mode = server.game_mode
				local level = server.level_key
				local dedicated = server_type == "server"
				local name, unique_id = nil

				if dedicated then
					name = server.name
					unique_id = server.unique_server_name
				else
					name = server.unique_server_name
					unique_id = server.name
				end

				local matchmaking = server.matchmaking ~= "false"
				local game_state = server.game_state or (server_info and server_info.game_state) or ""
				local num_players = nil

				if server_info then
					num_players = server_info.num_players
				else
					num_players = server.num_players
				end

				Imgui.text(name)
				Imgui.next_column()
				Imgui.text(unique_id)
				Imgui.next_column()
				Imgui.text(num_players)
				Imgui.next_column()
				Imgui.text(NetworkLookup.game_modes[tonumber(game_mode)])
				Imgui.next_column()
				Imgui.text(level)
				Imgui.next_column()
				Imgui.Checkbox("", matchmaking)
				Imgui.next_column()
				Imgui.text(server_type)
				Imgui.next_column()
				Imgui.text(search_type)
				Imgui.next_column()
				Imgui.text(game_state)
				Imgui.next_column()
				self:button("Join", "join_server", {
					server_type,
					search_type,
					server
				})
				Imgui.next_column()
				self:button("Spectate", "spectate_server", {
					server
				})
				Imgui.next_column()
				Imgui.tree_pop()
			end
		end
	end

	Imgui.separator()
	self:reset_columns()
end

ImguiServerBrowser.join_server = function (self, server_type, search_type, server)
	self:_stop_search()

	if server_type == "server" then
		local server_info = server.server_info
		local game_state = server.game_state or (server_info and server_info.game_state)

		if game_state and game_state ~= "dedicated_server" and game_state ~= "dedicated_server_waiting_for_fully_reserved" then
			Managers.matchmaking:request_join_lobby(server, {
				friend_join = true
			})
		else
			local search_config = {
				skip_waystone = true,
				dedicated_server = true,
				private_game = false,
				always_host = false,
				wait_for_join_message = true,
				quick_game = false,
				join_method = "party",
				preferred_level_keys = {
					server.level_key
				},
				game_mode = NetworkLookup.game_modes[tonumber(server.game_mode)],
				party_members = self:all_party_peers(),
				party_lobby_host = Managers.state.network.network_server.lobby_host
			}

			Managers.matchmaking:find_game(search_config)

			local pre_game_logic = Managers.state.game_mode:game_mode()._versus_pre_game_logic

			if pre_game_logic then
				pre_game_logic:set_all_players_ready(true)

				Managers.state.game_mode:game_mode()._search_state = "wait_for_server_matchmake"
			end
		end
	else
		Managers.matchmaking:request_join_lobby(server, {
			friend_join = true
		})
	end
end

ImguiServerBrowser.spectate_server = function (self, server)
	local profiles = PROFILES_BY_AFFILIATION.spectators

	if not profiles or table.is_empty(profiles) then
		return
	end

	self:_stop_search()

	Managers.matchmaking.selected_profile_index = FindProfileIndex(profiles[1])
	Managers.matchmaking.selected_party_index = 3

	Managers.matchmaking:request_join_lobby(server, {
		friend_join = true
	})
end

ImguiServerBrowser.all_party_peers = function (self)
	local result = {}
	local parties = Managers.party:parties()

	for _, party in pairs(parties) do
		for _, status in ipairs(party.occupied_slots) do
			result[#result + 1] = status.peer_id
		end
	end

	return result
end

ImguiServerBrowser._draw_search_button = function (self)
	if HAS_STEAM then
		if self._state == "searching" then
			slot2 = self
			slot1 = self.button
			slot3 = "Cancel"

			if "Cancel" then
				slot3 = "Refresh"
			end

			slot1(slot2, slot3, "_stop_search")
		else
			self:button("Refresh", "_refresh_servers")
		end
	end
end

return
