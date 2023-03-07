require("scripts/managers/admin/script_rcon_server")

AdminManager = class(AdminManager)

AdminManager.init = function (self)
	if DEDICATED_SERVER then
		local window_title = script_data.window_title

		CommandWindow.open(window_title or "Dedicated Server")
		cprint(string.format("Version: content '%s', engine '%s'", script_data.settings.content_revision, script_data.build_identifier))

		local settings = {
			port = script_data.rcon_port or script_data.settings.rcon_port or 20000
		}
		self._rcon_server = ScriptRconServer:new(settings)
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
