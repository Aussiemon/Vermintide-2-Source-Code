-- chunkname: @scripts/imgui/imgui_career_debug.lua

ImguiCareerDebug = class(ImguiCareerDebug)

local SHOULD_RELOAD = true
local DEFAULT_WINDOW_X = 820
local DEFAULT_WINDOW_Y = 500
local MAX_BOTS = 8
local BOT_COUNT_TABLE = {}

for i = 0, MAX_BOTS do
	BOT_COUNT_TABLE[i + 1] = tostring(i)
end

ImguiCareerDebug.init = function (self)
	self._first_run = true
	self._is_persistent = false
	self._indent_counter = 0
	self._players = {}
	self._profiles = {}
	self._careers = {}

	self:register_events()

	SHOULD_RELOAD = false
end

ImguiCareerDebug._get_profile_requester = function (self)
	if self._profile_requester then
		return self._profile_requester
	end

	local network_manager = Managers.state.network

	if network_manager then
		local network = network_manager.network_server or network_manager.network_client

		self._profile_requester = network and network:profile_requester()
	end

	return self._profile_requester
end

ImguiCareerDebug._get_profile_synchronizer = function (self)
	if self._profile_synchronizer then
		return self._profile_synchronizer
	end

	local network_manager = Managers.state.network

	if network_manager then
		local network = network_manager.network_server or network_manager.network_client

		self._profile_synchronizer = network and network.profile_synchronizer
	end

	return self._profile_synchronizer
end

ImguiCareerDebug.destroy = function (self)
	self:unregister_events()
end

ImguiCareerDebug.register_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		-- Nothing
	end
end

ImguiCareerDebug.unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		-- Nothing
	end
end

ImguiCareerDebug.is_persistent = function (self)
	return self._is_persistent
end

ImguiCareerDebug.update = function (self)
	if SHOULD_RELOAD then
		self:unregister_events()
		self:init()
	end

	self:_update_profiles_and_careers()
	self:_update_players()
end

ImguiCareerDebug._update_profiles_and_careers = function (self)
	self._profiles = {}
	self._careers = {}

	for profile_index, profile in pairs(SPProfiles) do
		self._profiles[profile_index] = profile.display_name
		self._careers[profile_index] = {}

		for career_index, career in pairs(profile.careers) do
			self._careers[profile_index][career_index] = career.display_name
		end
	end
end

ImguiCareerDebug._update_players = function (self)
	self._players = Managers.player:players()
end

ImguiCareerDebug.draw = function (self)
	if self._first_run then
		Imgui.set_next_window_size(DEFAULT_WINDOW_X, DEFAULT_WINDOW_Y)

		self._first_run = false
	end

	local do_close = Imgui.begin_window("Career Debug")

	self._is_persistent = Imgui.checkbox("Keep Window Open", self._is_persistent)

	Imgui.same_line()
	Imgui.push_item_width(100)

	script_data.cap_num_bots = Imgui.combo("Num bots", (script_data.cap_num_bots or MAX_BOTS) + 1, BOT_COUNT_TABLE) - 1

	Imgui.pop_item_width()
	Imgui.separator()
	self:_draw_players()
	self:_verify_indent()
	Imgui.end_window()

	return do_close
end

local header = {
	"Name",
	"Profile",
	"Career",
	"Is Bot",
	"Is Server",
}

ImguiCareerDebug._draw_players = function (self)
	self:_set_columns(5, true, 164)

	for _, text in pairs(header) do
		Imgui.text(text)
		Imgui.next_column()
	end

	local server_peer_id = Managers.mechanism:server_peer_id()

	for id, player in pairs(self._players) do
		local is_server = player.peer_id == server_peer_id

		Imgui.tree_push(id)
		Imgui.text(player:name())
		Imgui.next_column()
		self:_draw_profile_combo(player)
		Imgui.next_column()
		self:_draw_career_combo(player)
		Imgui.next_column()
		Imgui.text(tostring(player.bot_player or not player:is_player_controlled() or false))
		Imgui.next_column()
		Imgui.text(tostring(is_server))
		Imgui.next_column()
		Imgui.tree_pop()
	end

	self:_reset_columns()
end

ImguiCareerDebug._draw_profile_combo = function (self, player)
	local profile_index = player:profile_index()

	Imgui.tree_push("profile")

	local new_profile_index = Imgui.combo("", profile_index, self._profiles)

	Imgui.tree_pop()

	if new_profile_index ~= profile_index then
		local profile_requester = self:_get_profile_requester()
		local wanted_profile_name, wanted_career_name = hero_and_career_name_from_index(new_profile_index, 1)
		local peer_id = Network.peer_id()
		local party_id = Managers.mechanism:reserved_party_id_by_peer(peer_id)

		if not Managers.mechanism:profile_available_for_peer(party_id, peer_id, new_profile_index) then
			local other_player = self:_find_who_uses_profile(new_profile_index)
			local profile_synchronizer = self:_get_profile_synchronizer()
			local party_id = 1
			local free_profile_index, free_career_index = profile_synchronizer:get_first_free_profile(party_id)
			local free_profile_name, free_career_name = hero_and_career_name_from_index(free_profile_index, free_career_index)

			profile_requester:request_profile(other_player.peer_id, other_player:local_player_id(), free_profile_name, free_career_name, true)

			if other_player.bot_player then
				other_player.character_name = Localize(free_profile_name)
			end
		end

		profile_requester:request_profile(player.peer_id, player:local_player_id(), wanted_profile_name, wanted_career_name, true)

		if player.bot_player then
			player.character_name = Localize(wanted_profile_name)
		end
	end
end

ImguiCareerDebug._draw_career_combo = function (self, player)
	local profile_index = player:profile_index()
	local career_index = player:career_index()
	local careers = self._careers[profile_index]

	Imgui.tree_push("career")

	local new_career_index = Imgui.combo("", career_index, careers)

	Imgui.tree_pop()

	if new_career_index ~= career_index then
		local profile_requester = self:_get_profile_requester()
		local profile_name, career_name = hero_and_career_name_from_index(profile_index, new_career_index)

		profile_requester:request_profile(player.peer_id, player:local_player_id(), profile_name, career_name, true)
	end
end

ImguiCareerDebug._find_who_uses_profile = function (self, profile_index)
	local parties = Managers.party:parties()

	for id, party in pairs(parties) do
		local occupied_slots = party.occupied_slots

		for i = 1, #occupied_slots do
			local status = occupied_slots[i]

			if profile_index == status.profile_index then
				return status.player
			end
		end
	end
end

ImguiCareerDebug._set_columns = function (self, num_columns, border, columns_width)
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
		for i = 0, num_columns - 1 do
			Imgui.set_column_width(columns_width, i)
		end
	end
end

ImguiCareerDebug._reset_columns = function (self)
	self:_set_columns(1)
end

local indent_width = 8

ImguiCareerDebug._indent = function (self)
	self._indent_counter = self._indent_counter + 1

	Imgui.indent(indent_width)
end

ImguiCareerDebug._unindent = function (self)
	self._indent_counter = self._indent_counter - 1

	Imgui.unindent(indent_width)
end

ImguiCareerDebug._verify_indent = function (self)
	fassert(self._indent_counter == 0, tostring(self._indent_counter))
end
