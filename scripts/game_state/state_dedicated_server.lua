require("scripts/game_state/state_dedicated_server_init")
require("scripts/game_state/state_dedicated_server_running")
require("scripts/game_state/components/level_transition_handler")
require("scripts/game_state/state_loading")
require("scripts/network/game_server/game_server")
require("scripts/network/network_event_delegate")
require("scripts/network/network_transmit")
require("scripts/settings/platform_specific")
require("scripts/managers/matchmaking/matchmaking_manager")
require("scripts/managers/network/game_server_manager")
require("scripts/managers/input/input_manager")
require("foundation/scripts/util/garbage_leak_detector")
require("foundation/scripts/managers/chat/chat_manager")
require("scripts/ui/ui_animations")
require("scripts/utils/visual_assert_log")

StateDedicatedServer = class(StateDedicatedServer)
StateDedicatedServer.NAME = "StateDedicatedServer"
StateDedicatedServer.packages_to_load = {}

StateDedicatedServer.on_enter = function (self, params)
	VisualAssertLog.setup(nil)
	self:_setup_garbage_collection()
	self:_setup_level_transition()
	self:_setup_network()
	self:_setup_state_machine()
	self:_setup_popup_manager()
	self:_setup_chat_manager()
	self:_setup_account_manager()

	if self.parent.loading_context.reload_packages then
		self:_unload_packages()
	end

	self:_load_packages()
end

StateDedicatedServer._setup_garbage_collection = function (self)
	local assert_on_leak = true

	GarbageLeakDetector.run_leak_detection(assert_on_leak)
	GarbageLeakDetector.register_object(self, "StateDedicatedServer")
end

StateDedicatedServer._setup_level_transition = function (self)
	local loading_context = self.parent.loading_context

	if loading_context.level_transition_handler then
		self._level_transition_handler = loading_context.level_transition_handler
	else
		self._level_transition_handler = LevelTransitionHandler:new()

		self._level_transition_handler:set_next_level(self._level_transition_handler:default_level_key())
	end
end

StateDedicatedServer._init_input = function (self)
	self._input_manager = InputManager:new()
	local input_manager = self._input_manager
	Managers.input = input_manager

	input_manager:initialize_device("keyboard", 1)
	input_manager:initialize_device("mouse", 1)
	input_manager:initialize_device("gamepad")
end

StateDedicatedServer._setup_network = function (self)
	self._network_event_delegate = NetworkEventDelegate:new()
end

StateDedicatedServer._setup_state_machine = function (self)
	local params = {}
	self._machine = GameStateMachine:new(self, StateDedicatedServerInit, params, true)
end

StateDedicatedServer._setup_popup_manager = function (self)
	Managers.popup = PopupManager:new()
	Managers.simple_popup = SimplePopup:new()
end

StateDedicatedServer._setup_chat_manager = function (self)
	Managers.chat = Managers.chat or ChatManager:new()
end

StateDedicatedServer._setup_account_manager = function (self)
	Managers.account = Managers.account or AccountManager:new()
end

StateDedicatedServer._load_packages = function (self)
	local package_manager = Managers.package

	for i, name in ipairs(StateDedicatedServer.packages_to_load) do
		if not package_manager:has_loaded(name, "state_dedicated_server") then
			package_manager:load(name, "state_dedicated_server", nil, true)
		end
	end

	if not GlobalResources.loaded then
		for i, name in ipairs(GlobalResources) do
			if not package_manager:has_loaded(name) then
				package_manager:load(name, "global", nil, true)
			end
		end

		GlobalResources.loaded = true
	end
end

StateDedicatedServer._unload_packages = function (self)
	local package_manager = Managers.package

	for i, name in ipairs(StateDedicatedServer.packages_to_load) do
		if package_manager:has_loaded(name, "state_dedicated_server") then
			package_manager:unload(name, "state_dedicated_server")
		end
	end

	if GlobalResources.loaded then
		GlobalResources.loaded = nil

		for i, name in ipairs(GlobalResources) do
			package_manager:unload(name, "global")
		end
	end
end

StateDedicatedServer._packages_loaded = function (self)
	local package_manager = Managers.package

	for i, name in ipairs(StateDedicatedServer.packages_to_load) do
		if not package_manager:has_loaded(name) then
			return false
		end
	end

	return true
end

StateDedicatedServer.update = function (self, dt, t)
	Network.update_receive(dt, self._network_event_delegate.event_table)
	self._machine:update(dt, t)
	self:_update_network(dt)

	if script_data.debug_enabled then
		VisualAssertLog.update(dt)
	end

	if Managers.matchmaking then
		Managers.matchmaking:update(dt, t)
	end

	if Managers.game_server then
		Managers.game_server:update(dt, t)

		local start_game_params = Managers.game_server:start_game_params()

		if start_game_params then
			local level_key = start_game_params.level_key
			local level_transition_handler = self._level_transition_handler

			Managers.mechanism:generate_locked_director_functions(level_key)
			Managers.mechanism:generate_level_seed()
			level_transition_handler:set_next_level(level_key)
			self._network_server:set_current_level(level_key)
			level_transition_handler:level_completed()

			self._wanted_state = StateLoading
		end

		self:_update_wanted_state()
	end

	Network.update_transmit(dt)

	if self:_packages_loaded() then
		return self._wanted_state
	end
end

StateDedicatedServer.setup_network_server = function (self, game_server)
	self._game_server = game_server
	local level_transition_handler = self._level_transition_handler
	local initial_level = level_transition_handler:default_level_key()
	local loading_context = self.parent.loading_context

	fassert(Managers.game_server == nil, "Already has a game server manager.")

	Managers.game_server = GameServerManager:new(level_transition_handler)
	self._network_server = NetworkServer:new(Managers.player, game_server, initial_level, nil, level_transition_handler, Managers.game_server)
	self._network_transmit = loading_context.network_transmit or NetworkTransmit:new(true, self._network_server.connection_handler)

	self._network_transmit:set_network_event_delegate(self._network_event_delegate)
	self._network_server:register_rpcs(self._network_event_delegate, self._network_transmit)

	self._profile_synchronizer = self._network_server.profile_synchronizer
	local network_context = {
		network_server = self._network_server,
		network_transmit = self._network_transmit,
		game_server = game_server,
		profile_synchronizer = self._profile_synchronizer
	}

	Managers.game_server:setup_network_context(network_context)
	Managers.game_server:register_rpcs(self._network_event_delegate)
	fassert(Managers.matchmaking == nil, "Already has a matchmaking server manager.")

	local matchmaking_params = {
		is_server = true,
		network_transmit = self._network_transmit,
		lobby = game_server,
		peer_id = Network.peer_id(),
		level_transition_handler = level_transition_handler,
		profile_synchronizer = self._profile_synchronizer,
		network_server = self._network_server,
		slot_allocator = self._network_server.slot_allocator
	}
	Managers.matchmaking = MatchmakingManager:new(matchmaking_params)

	Managers.matchmaking:register_rpcs(self._network_event_delegate)

	loading_context.game_server = game_server
	loading_context.network_server = self._network_server

	Managers.mechanism:generate_locked_director_functions(level_key)
	Managers.mechanism:generate_level_seed()
	level_transition_handler:set_next_level(initial_level)
	self._network_server:set_current_level(initial_level)
	level_transition_handler:set_next_level(initial_level)
	level_transition_handler:level_completed()
end

StateDedicatedServer.setup_chat_manager = function (self, game_server)
	local peer_id = Network.peer_id()
	local network_context = {
		is_server = true,
		host_peer_id = peer_id,
		my_peer_id = peer_id
	}

	Managers.chat:setup_network_context(network_context)

	local function member_func()
		return game_server:members():get_members()
	end

	Managers.chat:register_channel(1, member_func)
end

StateDedicatedServer.setup_enemy_package_loader = function (self, game_server)
	local peer_id = Network.peer_id()

	self._level_transition_handler.enemy_package_loader:network_context_created(game_server, peer_id, peer_id)
end

StateDedicatedServer.setup_global_managers = function (self, game_server)
	local peer_id = Network.peer_id()

	Managers.mechanism:network_context_created(game_server, peer_id, peer_id)
	Managers.party:network_context_created(game_server, peer_id, peer_id)
end

StateDedicatedServer._update_network = function (self, dt)
	if self._network_server then
		self._network_server:update(dt)
	end
end

StateDedicatedServer._update_wanted_state = function (self)
	local current_state_name = self._machine:state().NAME

	if current_state_name == "StateDedicatedServerRunning" then
		self._wanted_state = StateLoading
	end
end

StateDedicatedServer._destroy_network = function (self)
	if self._network_server then
		self._network_server:destroy()

		self._network_server = nil
	end

	if self._game_server then
		self._game_server:destroy()

		self._game_server = nil
	end

	self.parent.loading_context = {}

	Managers.chat:unregister_channel(1)

	if self._network_transmit then
		self._network_transmit:destroy()

		self._network_transmit = nil
	end
end

StateDedicatedServer.on_exit = function (self, application_shutdown)
	if self._network_server then
		self._network_server:unregister_rpcs()
	end

	if Managers.game_server then
		Managers.game_server:unregister_rpcs()
	end

	if Managers.matchmaking then
		Managers.matchmaking:unregister_rpcs()
	end

	if application_shutdown then
		self:_destroy_network()
	else
		local loading_context = self.parent.loading_context
		loading_context.network_server = self._network_server
		loading_context.network_transmit = self._network_transmit
		loading_context.lobby_host = self._game_server
		loading_context.level_transition_handler = self._level_transition_handler
	end

	self._network_event_delegate:destroy()

	self._network_event_delegate = nil
end

return
