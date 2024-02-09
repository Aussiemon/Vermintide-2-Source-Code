-- chunkname: @scripts/managers/admin/admin_manager.lua

require("scripts/managers/admin/script_rcon_server")

AdminManager = class(AdminManager)

AdminManager.init = function (self)
	if DEDICATED_SERVER then
		local window_title = script_data.window_title

		CommandWindow.open(window_title or "Dedicated Server")
		cprintf("Version: content '%s', engine '%s'", script_data.settings.content_revision, script_data.build_identifier)

		local start_port_range = script_data.start_port_range
		local rcon_port

		if start_port_range then
			start_port_range = tonumber(start_port_range)
			rcon_port = start_port_range + 3
		else
			rcon_port = script_data.rcon_port or script_data.settings.rcon_port or Managers.mechanism:mechanism_setting("rcon_port")
		end

		local settings = {
			port = rcon_port,
			rcon_password = script_data.rcon_password or script_data.settings.rcon_password or "rconpassword",
		}

		self._dedicated_server_commands = DedicatedServerCommands:new()
		self._rcon_server = ScriptRconServer:new(settings, self._dedicated_server_commands)
	end
end

AdminManager.destroy = function (self)
	if self._rcon_server ~= nil then
		self._rcon_server:destroy()
	end

	if DEDICATED_SERVER then
		CommandWindow.close()
	end
end

AdminManager.update = function (self, dt)
	if self._rcon_server ~= nil then
		self._rcon_server:update(dt)
	end
end

AdminManager.execute_command = function (self, input)
	self._dedicated_server_commands:execute_command(input)
end
