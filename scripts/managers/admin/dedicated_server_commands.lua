-- chunkname: @scripts/managers/admin/dedicated_server_commands.lua

DedicatedServerCommands = class(DedicatedServerCommands)

local Commands, MetaCommands

local function print_log(text, ...)
	local formatted_string = string.format(text, ...)

	cprint(formatted_string)
end

local function print_error(text, ...)
	local formatted_string = string.format(text, ...)

	cprint(string.format("[ERROR] %s", formatted_string))
end

local function console_printf(success, text, ...)
	if success then
		print_log(text, ...)
	else
		print_error(text, ...)
	end
end

DedicatedServerCommands.init = function (self)
	return
end

DedicatedServerCommands.execute_command = function (self, input)
	local args = string.split(input, " ")

	if #args == 0 then
		local reason = "No command"

		print_error(reason)

		return false, reason
	end

	local command = table.remove(args, 1)
	local meta = MetaCommands[command]

	if meta then
		local success, response = pcall(meta)

		return success, string.format("meta;%s;%s", command, response)
	end

	local command_info = Commands[command]

	if not command_info then
		local reason = string.format("Unknown command '%s'", command)

		print_error(reason)

		return false, string.format("error;%s;%s", command, reason)
	end

	local func = command_info.func

	fassert(func, "Command function '%s' not implemented", command)
	fassert(type(func) == "function", "Command function '%s' is not a function", command)

	local min_args = command_info.min_args
	local max_args = command_info.max_args
	local num_args = #args

	if num_args < min_args then
		local reason = string.format("Too few arguments. Got %d, expected %d", num_args, min_args)

		print_error(reason)

		return false, string.format("error;%s;%s", command, reason)
	end

	if max_args < num_args then
		local reason = string.format("Too many arguments. Got %d, expected %d", num_args, max_args)

		print_error(reason)

		return false, string.format("error;%s;%s", command, reason)
	end

	local success, result, response = pcall(func, unpack(args))

	if not success then
		print_error(tostring(result))

		return false, string.format("error;%s;%s", command, response)
	end

	fassert(result == true or result == false, "Unexpected result value '%s'", tostring(result))
	fassert(response ~= nil, "Missing response for '%s'", command)

	local index = string.find(response, "\n+$")

	if index then
		response = string.sub(response, 1, index - 1)
	end

	console_printf(result, response)

	return result, string.format("command;%s;%s", command, response)
end

Commands = {
	list_commands = {
		description = "List all commands",
		example = "list_commands",
		max_args = 0,
		min_args = 0,
		func = function ()
			local response = ""

			for command, data in pairs(Commands) do
				response = string.format("%s%s - %s\n", response, command, data.description)
			end

			return true, response
		end,
	},
	help = {
		description = "Display the help for the command",
		example = "help <command>",
		max_args = 1,
		min_args = 0,
		func = function (command_name)
			if not command_name then
				local response = ""

				for command, data in pairs(Commands) do
					response = string.format("%s%s - %s\n", response, command, data.description)
				end

				return true, response
			end

			local command = Commands[command_name]

			if not command then
				return false, string.format("Unknown command '%s'", command_name)
			end

			local response = string.format("Command: %s\nDescription: %s\nExample: %s\n", command_name, command.description, command.example)

			return true, response
		end,
	},
	start = {
		description = "Start the server",
		example = "start",
		max_args = 0,
		min_args = 0,
		func = function ()
			local mechanism_state = Managers.mechanism:get_state()

			if mechanism_state ~= "inn" then
				return false, string.format("Failed to start server - Match already started")
			end

			Managers.mechanism:game_mechanism():force_start_dedicated_server()

			return true, "Starting server!"
		end,
	},
	stop = {
		description = "Stop the server",
		example = "stop",
		max_args = 0,
		min_args = 0,
		func = function ()
			Application.quit()

			return true, "Server stopped!"
		end,
	},
	restart = {
		description = "Restart the server",
		example = "restart",
		max_args = 0,
		min_args = 0,
		func = function ()
			local mechanism = Managers.mechanism:game_mechanism()
			local reservation_handler = mechanism:get_slot_reservation_handler()
			local network_manager = Managers.state.network
			local reserved_peer_ids = reservation_handler:reservers()

			for _, peer_id in pairs(reserved_peer_ids) do
				network_manager.network_server:kick_peer(peer_id)
			end

			local game_server_manager = Managers.game_server

			game_server_manager:restart()

			return true, "Restarting server!"
		end,
	},
	set_party_size = {
		description = "Set the size of a party",
		example = "set_party_size <party_id> <size>",
		max_args = 2,
		min_args = 2,
		func = function (party_id, party_size)
			local mechanism_state = Managers.mechanism:get_state()

			if mechanism_state ~= "inn" then
				return false, "Failed to set party size - Ongoing match"
			end

			party_id = tonumber(party_id)
			party_size = tonumber(party_size)

			local reservation_handler = Managers.mechanism:get_slot_reservation_handler()
			local result, reason = reservation_handler:set_party_size(party_id, party_size)

			if not result then
				return false, string.format("Failed to set party size - %s", reason)
			end

			return true, string.format("Party %d's size set to %d", party_id, party_size)
		end,
	},
	set_level = {
		description = "Force the server to use a level",
		example = "set_level <level_key>",
		max_args = 1,
		min_args = 1,
		func = function (level_key)
			local mechanism_state = Managers.mechanism:get_state()

			if mechanism_state ~= "inn" then
				return false, string.format("Failed to set level - Match started")
			end

			if type(level_key) ~= "string" then
				return false, string.format("Failed to set level - Invalid level")
			end

			if not LevelSettings[level_key] then
				return false, string.format("Failed to set level - Level not found")
			end

			local game_mode = Managers.state.game_mode:game_mode()

			game_mode:force_map_pool({
				level_key,
			})

			return true, "Level set!"
		end,
	},
	list_players = {
		description = "List all players",
		example = "list_players",
		max_args = 0,
		min_args = 0,
		func = function ()
			local response = ""

			if Managers.level_transition_handler:in_hub_level() then
				local reservers = Managers.mechanism:game_mechanism()._slot_reservation_handler:reservers()

				for i = 1, #reservers do
					local peer_id = reservers[i]

					response = string.format("%s%s - %s\n", response, peer_id or "-", Managers.game_server:peer_name(peer_id) or "-")
				end

				return true, response
			end

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				response = string.format("%s%s - %s (%s)\n", response, player.peer_id or "-", player:name() or "-", player:career_name() or "-")
			end

			return true, response
		end,
	},
	list_party = {
		description = "List all players in a party",
		example = "list_party <party_id>",
		max_args = 1,
		min_args = 1,
		func = function (party_id)
			party_id = tonumber(party_id)

			if Managers.level_transition_handler:in_hub_level() then
				local reservers = Managers.mechanism:game_mechanism()._slot_reservation_handler._reserved_peers[party_id]

				if not reservers then
					return false, string.format("Failed to list party - Invalid party id %d", party_id)
				end

				local response = ""

				for i = 1, #reservers do
					local data = reservers[i]
					local peer_id = data.peer_id

					if peer_id then
						response = string.format("%s%s - %s\n", response, peer_id, Managers.game_server:peer_name(peer_id))
					end
				end

				return true, response
			end

			local party = Managers.party:get_party(party_id)

			if not party then
				return false, string.format("Failed to list party - Invalid party id %d", party_id)
			end

			local response = ""
			local occupied_slots = party.occupied_slots

			for i = 1, #occupied_slots do
				local data = occupied_slots[i]
				local player = data.player

				response = string.format("%s%s - %s (%s)\n", response, data.peer_id, player:name(), player:career_name())
			end

			return true, response
		end,
	},
	list_script_data = {
		description = "List all script_data settings",
		example = "list_script_data",
		max_args = 0,
		min_args = 0,
		func = function ()
			return true, table.dump_string(script_data)
		end,
	},
	set_script_data = {
		description = "Set a script_data setting",
		example = "set_script_data <key> <value>",
		max_args = 2,
		min_args = 2,
		func = function (key, value)
			script_data[key] = value

			return true, "Script data changed!"
		end,
	},
	set_disable_gamemode_end = {
		description = "Set disable game mode end setting",
		example = "disable_gamemode_end <bool>",
		max_args = 1,
		min_args = 1,
		func = function (bool)
			script_data.disable_gamemode_end = bool

			return true, "Game mode end has changed"
		end,
	},
	set_time = {
		description = "Set the objective timer",
		example = "set_time <time>",
		max_args = 1,
		min_args = 1,
		func = function (value)
			if Managers.level_transition_handler:in_hub_level() then
				return false, string.format("Failed to set time - Match not started")
			end

			local win_conditions = Managers.mechanism:game_mechanism():win_conditions()

			win_conditions:set_time(tonumber(value))

			return true, "Time set!"
		end,
	},
	add_time = {
		description = "Add time to the objective timer",
		example = "add_time <time>",
		max_args = 1,
		min_args = 1,
		func = function (value)
			if Managers.level_transition_handler:in_hub_level() then
				return false, string.format("Failed to add time - Match not started")
			end

			local win_conditions = Managers.mechanism:game_mechanism():win_conditions()

			win_conditions:add_time(tonumber(value))

			return true, "Time added!"
		end,
	},
	set_score = {
		description = "Set the score for the current hero team",
		example = "set_score <score>",
		max_args = 1,
		min_args = 1,
		func = function (value)
			if Managers.level_transition_handler:in_hub_level() then
				return false, string.format("Failed to set time - Match not started")
			end

			local win_conditions = Managers.mechanism:game_mechanism():win_conditions()

			win_conditions:set_score(tonumber(value))

			return true, "Score set!"
		end,
	},
	add_score = {
		description = "Add score to the current hero team",
		example = "add_score <score>",
		max_args = 1,
		min_args = 1,
		func = function (value)
			if Managers.level_transition_handler:in_hub_level() then
				return false, string.format("Failed to add time - Match not started")
			end

			local win_conditions = Managers.mechanism:game_mechanism():win_conditions()

			win_conditions:add_score(tonumber(value))

			return true, "Score added!"
		end,
	},
	h = {
		description = "Start the round",
		example = "start_round",
		max_args = 0,
		min_args = 0,
		func = function ()
			if Managers.level_transition_handler:in_hub_level() then
				return false, "Failed to start round - Match not started"
			end

			local game_mode_manager = Managers.state.game_mode

			game_mode_manager:round_started()

			return true, "Round started!"
		end,
	},
	end_round = {
		description = "End the round",
		example = "end_round",
		max_args = 0,
		min_args = 0,
		func = function ()
			if Managers.level_transition_handler:in_hub_level() then
				return false, "Failed to end round - Match not started"
			end

			local game_mode_manager = Managers.state.game_mode

			game_mode_manager:round_started()

			local win_conditions = Managers.mechanism:game_mechanism():win_conditions()

			win_conditions:set_time(0)

			return true, "Round ended!"
		end,
	},
	skip_to_set = {
		description = "End current round and skip to the first round of the specified set",
		example = "skip_to_set <set>",
		max_args = 1,
		min_args = 1,
		func = function (set)
			do return false, "Failed to skip to set - only avaiable in DEBUG" end

			if Managers.level_transition_handler:in_hub_level() then
				return false, "Failed to skip to set - Match not started"
			end

			local mechanism = Managers.mechanism:game_mechanism()

			set = tonumber(set)

			if set <= mechanism:get_current_set() then
				return false, "Failed to skip to set - Can't skip to current / previous set"
			end

			mechanism:debug_skip_to_set(set)

			return true, "Skipping to new set!"
		end,
	},
	skip_picker = {
		description = "Skip the current picking player during character selection",
		example = "skip_picker",
		max_args = 0,
		min_args = 0,
		func = function (set)
			do return false, "Failed to skip to set - only avaiable in DEBUG" end

			local mechanism = Managers.mechanism:game_mechanism()

			if not mechanism then
				return false, "No active mechanism"
			end

			local game_mode = Managers.state.game_mode and Managers.state.game_mode:game_mode()

			if not game_mode then
				return false, "No current game mode is active"
			end

			local party_selection_logic = game_mode:party_selection_logic()

			if not party_selection_logic then
				return false, "Current game mode doesn't have a party selection"
			end

			party_selection_logic._timer = 0

			return true, "Skipping current picker"
		end,
	},
	stop_selection_timer = {
		description = "Skip the current picking player during character selection",
		example = "skip_picker",
		max_args = 0,
		min_args = 0,
		func = function (set)
			do return false, "Failed to skip to set - only avaiable in DEBUG" end

			local mechanism = Managers.mechanism:game_mechanism()

			if not mechanism then
				return false, "No active mechanism"
			end

			local game_mode = Managers.state.game_mode and Managers.state.game_mode:game_mode()

			if not game_mode then
				return false, "No current game mode is active"
			end

			local party_selection_logic = game_mode:party_selection_logic()

			if not party_selection_logic then
				return false, "Current game mode doesn't have a party selection"
			end

			party_selection_logic._timer = 100000

			return true, "Stopping current picker"
		end,
	},
	say = {
		description = "Send a message to everyone on the server",
		example = "say <message>",
		max_args = 1024,
		min_args = 1,
		func = function (...)
			local text = varargs.join(" ", ...)
			local chat_manager = Managers.chat

			if chat_manager:has_channel(1) then
				chat_manager:send_system_chat_message(1, "rcon_server_command_say_header", text, false, true)
			else
				return false, "Failed to send chat message - No channel 1"
			end

			return true, "Message sent"
		end,
	},
	say_party = {
		description = "Send a message to everyone in a team",
		example = "say_party <party_id> <message>",
		max_args = 1025,
		min_args = 2,
		func = function ()
			fassert("Not implemented")
		end,
	},
	say_player = {
		description = "Send a message to a player",
		example = "say_player <peer_id> <message>",
		max_args = 1025,
		min_args = 2,
		func = function ()
			fassert("Not implemented")
		end,
	},
	swap_players = {
		description = "Swap party between two players",
		example = "swap_players <peer_id> <peer_id>",
		max_args = 2,
		min_args = 2,
		func = function (peer_id_1, peer_id_2)
			local mechanism_state = Managers.mechanism:get_state()

			if mechanism_state ~= "inn" then
				return false, "Failed to move players - Match started"
			end

			if peer_id_1 == peer_id_2 then
				return false, "Failed to move players - peer_id_1 is same as peer_id_2"
			end

			local mechanism = Managers.mechanism:game_mechanism()
			local reservation_handler = mechanism:get_slot_reservation_handler()
			local result, reason = reservation_handler:swap_players(peer_id_1, peer_id_2)

			if not result then
				return false, string.format("Failed to swap players - %s", reason)
			end

			return true, "Players swapped!"
		end,
	},
	set_player_party = {
		description = "Move a player to another party",
		example = "set_player_party <peer_id> <party_id>",
		max_args = 2,
		min_args = 2,
		func = function (peer_id, party_id)
			local mechanism_state = Managers.mechanism:get_state()

			if mechanism_state ~= "inn" then
				return false, "Failed to move player - Match started"
			end

			party_id = tonumber(party_id)

			local reservation_handler = Managers.mechanism:get_slot_reservation_handler()

			if reservation_handler:is_fully_reserved() then
				return false, "Failed to move player - All parties are full"
			end

			local ignore_assert = true
			local result, reason = reservation_handler:move_player(peer_id, party_id, ignore_assert)

			if not result then
				return false, reason or "Failed to move player - unknown"
			end

			return true, "Player moved!"
		end,
	},
	kill = {
		description = "Kill a player",
		example = "kill <peer_id>",
		max_args = 1,
		min_args = 1,
		func = function (peer_id)
			if Managers.level_transition_handler:in_hub_level() then
				return false, "Failed to kill player - Match not started"
			end

			local player = Managers.player:player(peer_id, 1)

			if not player then
				return false, "Failed to kill player - Player not found"
			end

			local player_unit = player.player_unit

			if not player_unit or not Unit.alive(player_unit) then
				return false, "Failed to kill player - Player unit not found"
			end

			local status_extension = ScriptUnit.extension(player_unit, "status_system")

			if status_extension:is_dead() then
				return false, "Failed to kill player - Player already dead"
			end

			local health_extension = ScriptUnit.extension(player_unit, "health_system")

			health_extension:die("forced")

			return true, "Player killed!"
		end,
	},
	ban = {
		description = "Ban a player",
		example = "ban <peer_id>/<ip>",
		max_args = 1,
		min_args = 1,
		func = function (peer_id, days)
			local dec = Application.hex64_to_dec(peer_id)

			if dec == nil then
				return false, "Invalid peer id"
			end

			days = tonumber(days)

			local unban_at

			if days ~= nil then
				unban_at = os.time() + days * 24 * 60 * 60
			end

			local manager = Managers.ban_list

			manager:ban(peer_id, peer_id, unban_at)
			manager:save(function (error)
				if error ~= nil then
					cprintf("Ban list save failed (%s)", error)
				end
			end)

			return true, "Player banned"
		end,
	},
	kick = {
		description = "Kick a player",
		example = "kick <peer_id>/<ip>",
		max_args = 1,
		min_args = 1,
		func = function (peer_id)
			local mechanism = Managers.mechanism:game_mechanism()
			local reservation_handler = mechanism:get_slot_reservation_handler()
			local reserved_peer_ids = reservation_handler:reservers()

			for _, current_peer_id in pairs(reserved_peer_ids) do
				if peer_id == current_peer_id then
					Managers.state.network.network_server:kick_peer(peer_id)

					return true, "Player kicked from server"
				end
			end

			return false, "Failed to kick player - Player not found"
		end,
	},
	spawn_horde = {
		description = "spawns a horde",
		max_args = 0,
		min_args = 0,
		func = function ()
			Managers.state.conflict:debug_spawn_horde()

			return true, "Spawning horde"
		end,
	},
}
MetaCommands = {
	_num_players = function ()
		local dedicated_server_reservation_slots = script_data.dedicated_server_reservation_slots
		local slots_per_party = string.split(dedicated_server_reservation_slots, ",")
		local num_players
		local max_players = 0

		for i = 1, #slots_per_party do
			max_players = max_players + tonumber(slots_per_party[i])
		end

		if Managers.level_transition_handler:in_hub_level() then
			num_players = Managers.mechanism:game_mechanism()._slot_reservation_handler._num_slots_reserved
		else
			num_players = Managers.player:num_human_players()
		end

		return string.format("%d/%d", num_players, max_players)
	end,
	_ping = function ()
		return "pong"
	end,
}
