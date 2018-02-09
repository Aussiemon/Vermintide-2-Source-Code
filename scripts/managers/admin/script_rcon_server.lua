ScriptRconServer = class(ScriptRconServer)
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
ScriptRconServer.rcon_connect = function (self, id, ip_port)
	cprintf("RCon client with ID %s successfully connected", id)

	self._clients[id] = true

	return true
end
ScriptRconServer.rcon_command = function (self, id, command_string)
	cprintf("RCon client %s issued the following command string: %s", id, command_string)

	local command, argument = unpack_string(command_string)

	if self._clients[id] then
		if command == "shutdown" then
			Application.quit()

			return "ok\n"
		elseif command == "list_players" then
			local player_list = ""

			for _, player in pairs(Managers.player:players()) do
				player_list = player_list .. player.name(player) .. " " .. player.network_id(player) .. "\n"
			end

			return player_list
		elseif command == "say" then
			local say_text = varargs.join(" ", select(2, unpack_string(command_string)))
			local chat = Managers.chat

			if chat.has_channel(chat, 1) then
				chat.send_chat_message(chat, 1, say_text)
			end

			return "ok\n"
		else
			return "unknown command\n"
		end
	else
		return "unauthorized\n"
	end

	return 
end
ScriptRconServer.rcon_disconnect = function (self, id)
	cprintf("RCon client with ID %s disconnected", id)

	self._clients[id] = nil

	return 
end

return 
