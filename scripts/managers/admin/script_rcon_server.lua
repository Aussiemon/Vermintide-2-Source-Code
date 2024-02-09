-- chunkname: @scripts/managers/admin/script_rcon_server.lua

ScriptRconServer = class(ScriptRconServer)

local function print_log(text, ...)
	local formatted_string = string.format(text, ...)

	cprintf("[RCON] %s", formatted_string)
end

ScriptRconServer.init = function (self, settings, dedicated_server_commands)
	if not settings then
		print_log("Failed to start")

		self._enabled = false
	end

	self._port = settings.port or 27018
	self._password = settings.rcon_password

	if RConServer.start(self._port, self._password) then
		print_log("Running on port %d.", self._port)
		print_log("You need to open TCP port %d for incoming traffic to make the server configurable outside the LAN", self._port)

		self._dedicated_server_commands = dedicated_server_commands
		self._clients = {}
		self._enabled = true
	else
		self._enabled = false

		print_log("Failed to start")
	end
end

ScriptRconServer.destroy = function (self)
	if self._enabled then
		RConServer.stop()
	end
end

ScriptRconServer.update = function (self, dt, t)
	if self._enabled then
		RConServer.update(dt, self)
	end
end

ScriptRconServer.rcon_connect = function (self, id, ip_port)
	fassert(self._clients[id] == nil, "Tried to connect duplicate RCON client")
	print_log("Client '%s' connected", id)

	self._clients[id] = ip_port

	return true
end

ScriptRconServer.rcon_command = function (self, id, command_string)
	if not self._clients[id] then
		print_log("Unauthorized")

		return "Unauthorized"
	end

	local result, response = self._dedicated_server_commands:execute_command(command_string)

	return response
end

ScriptRconServer.rcon_disconnect = function (self, id)
	fassert(self._clients[id] ~= nil, "Tried to disconnect duplicate RCON client")
	print_log("Client '%s' disconnected", id)

	self._clients[id] = nil
end
