require("scripts/managers/network/ban_list_manager")
require("scripts/network/network_server")

StateDedicatedServerInit = class(StateDedicatedServerInit)
StateDedicatedServerInit.NAME = "StateDedicatedServerInit"
StateDedicatedServerInit.on_enter = function (self, params)
	self._init_network(self)

	return 
end
StateDedicatedServerInit._init_network = function (self)
	self.parent:setup_network_options()

	local platform = PLATFORM

	if not rawget(_G, "GameServerInternal") then
		if platform == "win32" then
			if rawget(_G, "Steam") then
				ferror("Running dedicated server with Steam enabled. This will make it easy to introduce bugs.")
			end

			require("scripts/network/game_server/game_server_steam")
		else
			ferror("Running dedicated server on unsupported platform (%s)", platform)
		end
	end

	local network_options = self.parent:network_options()
	local game_server_name = script_data.server_name or script_data.settings.server_name

	cprint("Network Options:")
	cprint("----------------------------------------")

	for k, v in pairs(network_options) do
		cprintf("%s = %s", k, v)
	end

	cprintf("server_name = %s", game_server_name)
	cprint("----------------------------------------")
	cprintf("You need to open port %d for incoming traffic to make the server detectable", network_options.query_port)

	self._game_server = GameServer:new(network_options, game_server_name)

	Managers.party:set_leader(nil)

	self._state = "waiting_for_backend"

	if not Managers.eac then
		Managers.eac = EACManager:new()
	end

	Managers.ban_list = Managers.ban_list or BanListManager:new()

	return 
end
StateDedicatedServerInit.update = function (self, dt, t)
	local game_server = self._game_server
	local server_state = game_server.update(game_server, dt, t)
	local state = self._state

	if self._state == "waiting_for_backend" then
		if Managers.backend:has_loaded() then
			Managers.backend:signin()

			self._state = "wait_for_connect"
		end
	elseif state == "wait_for_connect" then
		if server_state == GameServerState.CONNECTED then
			self.parent:setup_network_server(game_server)
			self.parent:setup_chat_manager(game_server)

			return StateDedicatedServerRunning
		elseif server_state == GameServerState.DISCONNECTED then
			print("Failed to connect the game server. Check the connection to Steam.")
			Application.quit()
		end
	end

	return nil
end
StateDedicatedServerInit.on_exit = function (self)
	return 
end

return 
