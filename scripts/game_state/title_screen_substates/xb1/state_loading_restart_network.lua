require("scripts/network/lobby_host")
require("scripts/network/lobby_client")
require("scripts/network/lobby_finder")
require("scripts/game_state/components/level_transition_handler")
require("scripts/network/network_event_delegate")
require("scripts/network/network_server")
require("scripts/network/network_client")
require("scripts/network/network_transmit")

StateLoadingRestartNetwork = class(StateLoadingRestartNetwork)
StateLoadingRestartNetwork.NAME = "StateLoadingRestartNetwork"

StateLoadingRestartNetwork.on_enter = function (self, params)
	print("[Gamestate] Enter Substate StateLoadingRestartNetwork")
	self:_init_params(params)
	self:_init_network()
end

StateLoadingRestartNetwork._init_params = function (self, params)
	self._world = params.world
	self._viewport = params.viewport
	self._loading_view = params.loading_view
end

StateLoadingRestartNetwork._init_network = function (self)
	local loading_context = self.parent.parent.loading_context

	self.parent:setup_network_options()

	LOBBY_PORT_INCREMENT = LOBBY_PORT_INCREMENT + 1

	if not rawget(_G, "LobbyInternal") or not LobbyInternal.network_initialized() then
		require("scripts/network/lobby_xbox_live")
		LobbyInternal.init_client(self.parent:network_options())
	end

	self.parent:setup_level_transition()

	if loading_context.join_lobby_data then
		self.parent:setup_join_lobby()
	elseif auto_join_setting then
		self.parent:setup_lobby_finder(Development.parameter("unique_server_name"))
	else
		self.parent:setup_lobby_host()
	end

	if loading_context.previous_session_error then
		local previous_session_error = loading_context.previous_session_error
		loading_context.previous_session_error = nil

		self.parent:create_popup(previous_session_error, nil, "continue")
	end
end

return
