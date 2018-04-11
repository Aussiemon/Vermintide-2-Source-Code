ScriptRconServer = class(ScriptRconServer)
local Commands = {
	ban = {
		arg_help = "rcon_server_command_args_ban",
		min_args = 2,
		help = "rcon_server_command_help_ban",
		max_args = 3,
		method = "_command_ban"
	},
	banlist = {
		arg_help = "",
		min_args = 0,
		help = "rcon_server_command_help_banlist",
		max_args = 0,
		method = "_command_banlist"
	},
	help = {
		arg_help = "",
		min_args = 0,
		help = "rcon_server_command_help_help",
		max_args = 0,
		method = "_command_help"
	},
	id = {
		arg_help = "",
		min_args = 0,
		help = "rcon_server_command_help_id",
		max_args = 0,
		method = "_command_id"
	},
	kick = {
		arg_help = "rcon_server_command_args_kick",
		min_args = 1,
		help = "rcon_server_command_help_kick",
		max_args = 1,
		method = "_command_kick"
	},
	players = {
		arg_help = "",
		min_args = 0,
		help = "rcon_server_command_help_players",
		max_args = 0,
		method = "_command_players"
	},
	say = {
		arg_help = "rcon_server_command_args_say",
		min_args = 1,
		method = "_command_say",
		help = "rcon_server_command_help_say"
	},
	shutdown = {
		arg_help = "",
		min_args = 0,
		help = "rcon_server_command_help_shutdown",
		max_args = 0,
		method = "_command_shutdown"
	},
	unban = {
		arg_help = "rcon_server_command_args_unban",
		min_args = 1,
		help = "rcon_server_command_help_unban",
		max_args = 1,
		method = "_command_unban"
	}
}

local function tr(localize_key)
	if localize_key == "" then
		return ""
	end

	return Localize(localize_key)
end

ScriptRconServer.init = function (self, settings)
	if settings then
		self._port = settings.port or 20000
		self._clients = {}
		self._enabled = true

		if RConServer.start(self._port) then
			cprintf("RCon server is running and listens to port %d", self._port)
			cprintf("You need to open TCP port %d for incoming traffic to make the server configurable outside the LAN", self._port)

			self._enabled = true
		else
			cprintf("RCon failed to start")

			self._enabled = false
		end
	else
		cprintf("RCon not started")

		self._enabled = false
	end

	return 
end
ScriptRconServer.destroy = function (self)
	if self._enabled then
		RConServer.stop()
	end

	return 
end
ScriptRconServer.update = function (self, dt, t)
	if self._enabled then
		RConServer.update(dt, self)
	end

	return 
end
ScriptRconServer._find_player = function (self, find_str)
	local disable_pattern_matching = true
	local start_index = 1
	local found_id = nil

	for _, player in pairs(Managers.player:players()) do
		local peer_id = player.network_id(player)

		if string.find(peer_id, find_str, start_index, disable_pattern_matching) ~= nil or string.find(player.name(player), find_str, start_index, disable_pattern_matching) ~= nil then
			if found_id ~= nil then
				return nil
			end

			found_id = peer_id
		end
	end

	return found_id
end
ScriptRconServer._find_banned = function (self, find_str)
	local list = Managers.ban_list:ban_list()
	local disable_pattern_matching = true
	local start_index = 1
	local found_id = nil

	for _, player in ipairs(list) do
		local peer_id = player.peer_id

		if string.find(peer_id, find_str, start_index, disable_pattern_matching) ~= nil or string.find(player.name, find_str, start_index, disable_pattern_matching) ~= nil then
			if found_id ~= nil then
				return nil
			end

			found_id = peer_id
		end
	end

	return found_id
end
ScriptRconServer.rcon_connect = function (self, id, ip_port)
	cprintf("RCon client with ID %s successfully connected", id)

	self._clients[id] = true

	return true
end
ScriptRconServer.rcon_command = function (self, id, command_string)
	if not self._clients[id] then
		return string.format("%s\n", tr("rcon_server_command_error_unauthorized"))
	end

	local args = split_string(command_string)

	if #args == 0 then
		return 
	end

	local command = table.remove(args, 1)
	local command_info = Commands[command]

	if command_info == nil then
		return string.format("%s\n", tr("rcon_server_command_error_unknown_command"))
	end

	local num_args = #args

	if num_args < command_info.min_args then
		return string.format("%s\n%s %s\n", tr("rcon_server_command_error_too_few_args"), command, tr(command_info.arg_help))
	end

	if command_info.max_args ~= nil and command_info.max_args < num_args then
		return string.format("%s\n%s %s\n", tr("rcon_server_command_error_too_many_args"), command, tr(command_info.arg_help))
	end

	local response = self[command_info.method](self, unpack(args))

	return response
end
ScriptRconServer.rcon_disconnect = function (self, id)
	cprintf("RCon client with ID %s disconnected", id)

	self._clients[id] = nil

	return 
end
ScriptRconServer._command_ban = function (self, peer_id, name, days_str)
	local dec = Application.hex64_to_dec(peer_id)

	if dec == nil then
		return string.format("%s\n", tr("rcon_server_command_response_invalid_peerid"))
	end

	if days_str ~= nil and days_str.match(days_str, "^%d+$") == nil then
		return string.format("%s\n", tr("rcon_server_command_response_invalid_days"))
	end

	local days = nil

	if days_str ~= nil then
		days = tonumber(days_str)
	end

	local unban_at = nil

	if days ~= nil then
		unban_at = os.time() + days * 24 * 60 * 60
	end

	local manager = Managers.ban_list

	manager.ban(manager, peer_id, name, unban_at)
	manager.save(manager, function (error)
		if error ~= nil then
			cprintf("Ban list save failed (%s)", error)
		end

		return 
	end)

	return string.format("%s\n", tr("rcon_server_command_response_ok"))
end
ScriptRconServer._command_banlist = function (self)
	local result = ""
	local manager = Managers.ban_list
	local list = manager.ban_list(manager)

	for _, info in ipairs(list) do
		if info.ban_end ~= nil then
			local date = os.date("*t", info.ban_end)
			result = string.format("%s%s %04d-%02d-%02d %q\n", result, info.peer_id, date.year, date.month, date.day, info.name)
		else
			result = string.format("%s%s xxxx-xx-xx %q\n", result, info.peer_id, info.name)
		end
	end

	return result
end
ScriptRconServer._command_help = function (self)
	local help_text = tr("rcon_server_command_response_help") .. "\n---\n"
	local sorted_names = {}

	for command, _ in pairs(Commands) do
		sorted_names[#sorted_names + 1] = command
	end

	table.sort(sorted_names)

	for _, command in ipairs(sorted_names) do
		local command_info = Commands[command]
		help_text = string.format("%s%s %s - %s\n", help_text, command, tr(command_info.arg_help), tr(command_info.help))
	end

	return help_text
end
ScriptRconServer._command_id = function (self)
	return string.format("%s\n", Network.peer_id())
end
ScriptRconServer._command_kick = function (self, id_or_name)
	local peer_id = self._find_player(self, id_or_name)

	if peer_id == nil then
		return string.format("%s\n", tr("rcon_server_command_response_unmatched_player"))
	end

	local server = Managers.matchmaking.network_server

	server.kick_peer(server, peer_id)

	return string.format("%s\n", tr("rcon_server_command_response_ok"))
end
ScriptRconServer._command_players = function (self)
	local player_list = ""

	for _, player in pairs(Managers.player:players()) do
		player_list = string.format("%s%s - %s\n", player_list, player.network_id(player), player.name(player))
	end

	if player_list == "" then
		return string.format("%s\n", tr("rcon_server_command_response_no_players"))
	end

	return player_list
end
ScriptRconServer._command_shutdown = function (self)
	Application.quit()

	return string.format("%s\n", tr("rcon_server_command_response_shutting_down"))
end
ScriptRconServer._command_say = function (self, ...)
	local say_text = varargs.join(" ", ...)
	local chat = Managers.chat

	if chat.has_channel(chat, 1) then
		chat.send_chat_message(chat, 1, say_text)
	end

	return string.format("%s\n", tr("rcon_server_command_response_ok"))
end
ScriptRconServer._command_unban = function (self, id_or_name)
	local peer_id = self._find_banned(self, id_or_name)

	if peer_id == nil then
		return string.format("%s\n", tr("rcon_server_command_response_unmatched_player"))
	end

	local manager = Managers.ban_list

	manager.unban(manager, peer_id)
	manager.save(manager, function (error)
		if error ~= nil then
			cprintf("Ban list save failed (%s)", error)
		end

		return 
	end)

	return string.format("%s\n", tr("rcon_server_command_response_ok"))
end

return 
