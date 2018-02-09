local NUM_GO_BOONS = 10
local MAX_BOONS = 10
PlayerBoonHandler = class(PlayerBoonHandler)
local boon_name_go_fields = {}
local remaining_duration_go_fields = {}

for i = 1, NUM_GO_BOONS, 1 do
	boon_name_go_fields[i] = "boon_" .. i .. "_id"
	remaining_duration_go_fields[i] = "boon_" .. i .. "_remaining_duration"
end

PlayerBoonHandler.init = function (self, player, world, is_server)
	local network_manager = Managers.state.network
	self.network_manager = network_manager
	self.player = player
	self.world = world
	self.is_server = is_server
	self.active_boons = {}

	for i = 1, MAX_BOONS, 1 do
		self.active_boons[i] = {}
	end

	local is_local_player = player.local_player

	if is_local_player then
		local quests_interface = Managers.backend:get_interface("quests")

		quests_interface.query_boons(quests_interface)

		self._boons_interface = Managers.backend:get_interface("boons")
	end

	self.is_local_player = is_local_player

	return 
end
PlayerBoonHandler.update = function (self, dt, t)
	if self.is_local_player then
		self._poll_for_boons(self)
	end

	self._update_active_boons(self, dt, t)

	return 
end
PlayerBoonHandler._poll_for_boons = function (self)
	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local query_boons = game_mode_key == "inn" or not self._boons_inited

	if query_boons then
		local dirty = self._boons_interface:is_dirty()

		if dirty then
			local boons = self._boons_interface:get_boons()

			self._update_boons(self, boons)

			self._boons_inited = true
		end
	end

	return 
end
PlayerBoonHandler._update_boons = function (self, boons)
	local name_ids = {}
	local remaining_durations = {}
	local network_manager = self.network_manager
	local game = network_manager.game(network_manager)

	for i = 1, NUM_GO_BOONS, 1 do
		local boon_data = boons[i]
		local boon_name_id = NetworkLookup.boons["n/a"]
		local remaining_duration = 0

		if boon_data then
			local name = boon_data.name
			boon_name_id = NetworkLookup.boons[name]
			remaining_duration = boon_data.remaining_duration
		end

		name_ids[i] = boon_name_id
		remaining_durations[i] = remaining_duration
	end

	if self.is_server then
		self.set_game_object_fields(self, name_ids, remaining_durations)
	else
		local player = self.player
		local player_game_object_id = player.game_object_id

		if game then
			network_manager.network_transmit:send_rpc_server("rpc_set_boon_handler_game_object_fields", player_game_object_id, name_ids, remaining_durations)
		end
	end

	return 
end
PlayerBoonHandler.set_game_object_fields = function (self, name_ids, remaining_durations)
	local game = self.network_manager:game()
	local player = self.player
	local player_game_object_id = player.game_object_id
	local poll_time = self.network_manager:network_time()

	if game and player_game_object_id then
		for i = 1, NUM_GO_BOONS, 1 do
			local boon_name_id = name_ids[i]
			local game_object_field = boon_name_go_fields[i]

			GameSession.set_game_object_field(game, player_game_object_id, game_object_field, boon_name_id)

			local remaining_duration = remaining_durations[i]
			local game_object_field = remaining_duration_go_fields[i]

			GameSession.set_game_object_field(game, player_game_object_id, game_object_field, remaining_duration)
		end

		GameSession.set_game_object_field(game, player_game_object_id, "boon_poll_time", poll_time)
	end

	return 
end
PlayerBoonHandler._update_active_boons = function (self, dt, t)
	local boon_templates = BoonTemplates
	local game = self.network_manager:game()
	local human_players = Managers.player:human_players()
	local network_time = self.network_manager:network_time()
	local current_index = 1

	for i = 1, MAX_BOONS, 1 do
		table.clear(self.active_boons[i])
	end

	for _, player in pairs(human_players) do
		local player_game_object_id = player.game_object_id

		if game and player_game_object_id then
			local boon_poll_time = GameSession.game_object_field(game, player_game_object_id, "boon_poll_time")
			local elapsed_time = network_time - boon_poll_time

			for i = 1, NUM_GO_BOONS, 1 do
				local game_object_field = boon_name_go_fields[i]
				local boon_name_id = GameSession.game_object_field(game, player_game_object_id, game_object_field)
				local boon_name = NetworkLookup.boons[boon_name_id]
				local boon_settings = boon_templates[boon_name]
				local game_object_field = remaining_duration_go_fields[i]
				local backend_remaining_duration = GameSession.game_object_field(game, player_game_object_id, game_object_field)
				local is_time_left = elapsed_time < backend_remaining_duration

				if boon_settings and (player == self.player or boon_settings.affects_allies) then
					local boon_data = self.active_boons[current_index]
					local remaining_duration = (is_time_left and backend_remaining_duration - elapsed_time) or 0
					boon_data.name = boon_name
					boon_data.remaining_duration = remaining_duration
					boon_data.own_boon = player == self.player
					current_index = current_index + 1
				end
			end
		end
	end

	if script_data.debug_active_boons and self.is_local_player then
		self.debug_timer = (self.debug_timer or 0) + dt

		if 2 <= self.debug_timer then
			print("------- Active Boons -------")
			table.dump(self.active_boons, nil, 2)

			self.debug_timer = 0
		end
	end

	return 
end
PlayerBoonHandler.get_active_boons = function (self)
	return self.active_boons
end
PlayerBoonHandler.get_last_poll_time = function (self)
	local player = self.player
	local player_game_object_id = player.game_object_id
	local game = self.network_manager:game()
	local boon_poll_time = 0

	if game and player_game_object_id then
		boon_poll_time = GameSession.game_object_field(game, player_game_object_id, "boon_poll_time")
	end

	return boon_poll_time
end
PlayerBoonHandler.get_num_boons = function (self, boon_name)
	local num_boons = 0
	local active_boons = self.active_boons

	for i = 1, #active_boons, 1 do
		local boon_data = active_boons[i]

		if boon_data.name == boon_name then
			num_boons = num_boons + 1
		end
	end

	return num_boons
end
PlayerBoonHandler.has_boon = function (self, boon_name)
	local active_boons = self.active_boons

	for i = 1, #active_boons, 1 do
		local boon_data = active_boons[i]

		if boon_data.name == boon_name then
			return true
		end
	end

	return false
end

return 
