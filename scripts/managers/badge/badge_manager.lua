require("scripts/settings/badge_templates")

BadgeManager = class(BadgeManager)
local RPCS = {
	"rpc_show_badge",
	"rpc_complete_badge"
}

BadgeManager.init = function (self, statistics_db, network_event_delegate, is_server)
	self._statistics_db = statistics_db
	self._is_server = is_server
	self._registered_events = {}
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	local current_mechanism_name = Managers.mechanism:current_mechanism_name()

	if current_mechanism_name == "versus" then
		require("scripts/settings/dlcs/carousel/carousel_badge_templates")
	elseif current_mechanism_name == "adventure" then
	end

	if is_server then
		self:_initialize_server()
	else
		self:_initialize_client()
	end
end

BadgeManager._initialize_server = function (self)
	local templates = BadgeTemplates.server
	local update_cache = {}
	local statistics_db = self._statistics_db
	local event_manager = Managers.state.event
	local network_transmit = Managers.state.network.network_transmit

	for _, template in pairs(templates) do
		local events = template.events or {}

		for event_name, event_function in pairs(events) do
			local callback_table = {
				callback_function = function (_, ...)
					local t = Managers.time:time("main")
					local settings = template.settings
					local data = template.data
					local complete = event_function(settings, data, t, ...)

					if complete then
						local player_peer_id, badge_id = template.complete(statistics_db, settings, data, ...)

						if player_peer_id and badge_id then
							network_transmit:send_rpc("rpc_show_badge", player_peer_id, badge_id)
						end
					end
				end
			}
			self._registered_events[#self._registered_events + 1] = callback_table

			event_manager:register(callback_table, event_name, "callback_function")
		end

		if template.update then
			update_cache[#update_cache + 1] = template
		end
	end

	self._templates = templates
	self._update_cache = update_cache
end

BadgeManager._initialize_client = function (self)
	local templates = BadgeTemplates.client
	local update_cache = {}
	local statistics_db = self._statistics_db
	local event_manager = Managers.state.event
	local network_transmit = Managers.state.network.network_transmit

	for _, template in pairs(templates) do
		local events = template.events or {}

		for event_name, event_function in pairs(events) do
			local callback_table = {
				callback_function = function (_, ...)
					local t = Managers.time:time("main")
					local settings = template.settings
					local data = template.data
					local complete = event_function(settings, data, t, ...)

					if complete then
						local player_peer_id, badge_id = template.complete(statistics_db, settings, data, ...)

						if player_peer_id and badge_id then
							network_transmit:send_rpc_server("rpc_complete_badge", badge_id, player_peer_id)
						end
					end
				end
			}
			self._registered_events[#self._registered_events + 1] = callback_table

			event_manager:register(callback_table, event_name, "callback_function")
		end

		if template.update then
			update_cache[#update_cache + 1] = template
		end
	end

	self._templates = templates
	self._update_cache = update_cache
end

BadgeManager.destroy = function (self)
	self.network_event_delegate:unregister(self)

	for _, body in pairs(self._templates) do
		table.clear(body.data)
	end

	for _, callback_table in ipairs(self._registered_events) do
		self.network_event_delegate:unregister(callback_table)
	end
end

BadgeManager.update = function (self, dt, t)
	if self._is_server then
		self:_update_server(dt, t)
	else
		self:_update_client(dt, t)
	end
end

BadgeManager._update_server = function (self, dt, t)
	local update_cache = self._update_cache
	local network_transmit = Managers.state.network.network_transmit

	for _, template in ipairs(update_cache) do
		local settings = template.settings
		local data = template.data
		local players_succeded = template.update(settings, data, dt, t)

		if players_succeded and #players_succeded > 0 then
			for _, stats_id in ipairs(players_succeded) do
				local player_peer, badge_id = template.complete(self._statistics_db, template.settings, template.data, stats_id)

				if player_peer and badge_id then
					network_transmit:send_rpc("rpc_show_badge", player_peer, badge_id)
				end
			end
		end
	end
end

BadgeManager._update_client = function (self, dt, t)
	local update_cache = self._update_cache
	local network_transmit = Managers.state.network.network_transmit

	for _, template in ipairs(update_cache) do
		local settings = template.settings
		local data = template.data
		local players_succeded = template.update(settings, data, dt, t)

		if players_succeded and #players_succeded > 0 then
			for _, stats_id in ipairs(players_succeded) do
				local player_peer_id, badge_id = template.complete(self._statistics_db, template.settings, template.data, stats_id)

				if player_peer_id and badge_id then
					network_transmit:send_rpc_server("rpc_complete_badge", badge_id, player_peer_id)
				end
			end
		end
	end
end

BadgeManager.rpc_show_badge = function (self, channel_id, badge_id)
	Managers.telemetry.events:badge_gained(NetworkLookup.badges[badge_id])
	Managers.state.event:trigger("add_local_badge", badge_id)
end

BadgeManager.rpc_complete_badge = function (self, channel_id, badge_id, player_peer_id)
	fassert(self._is_server, "Only server should get this")

	local network_transmit = Managers.state.network.network_transmit

	network_transmit:send_rpc("rpc_show_badge", player_peer_id, badge_id)
end

return
