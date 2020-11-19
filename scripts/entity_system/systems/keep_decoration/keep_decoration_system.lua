require("scripts/settings/keep_decoration_settings")
require("scripts/unit_extensions/level/keep_decoration_painting_extension")

KeepDecorationSystem = class(KeepDecorationSystem, ExtensionSystemBase)
local extensions = {
	"KeepDecorationPaintingExtension"
}
local RPCS = {
	"rpc_request_painting",
	"rpc_send_painting"
}

KeepDecorationSystem.init = function (self, entity_system_creation_context, system_name)
	KeepDecorationSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._network_trasmit = Managers.state.network.network_transmit
	self._extensions = {}
	self._unit_extensions = {}
	self._used_settings_keys = {}
	self._used_backend_keys = {}
	self._update_index = 0
	self._is_leader = Managers.party:is_leader(Network.peer_id())
	self._client_paintings = {}
	self._client_painting_extensions = {}
	self._num_players = 0
end

KeepDecorationSystem.destroy = function (self)
	self._extensions = nil
	self._unit_extensions = nil

	self._network_event_delegate:unregister(self)
end

KeepDecorationSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data, ...)
	local settings_key = Unit.get_data(unit, "decoration_settings_key")
	local used_settings_keys = self._used_settings_keys
	local used_backend_keys = self._used_backend_keys

	fassert(not used_settings_keys[settings_key], "Multiple units has the same decoration_settings_key \"" .. tostring(settings_key) .. "\". Fix it in the unit data!")

	local settings = KeepDecorationSettings[settings_key]

	fassert(settings, "No settings found for decoration_settings_key \"" .. tostring(settings_key) .. "\". Fix it in keep_decoration_settings.lua!")

	local backend_key = settings.backend_key

	fassert(not used_backend_keys[backend_key], "Multiple decoration settings has the same backend_key \"" .. tostring(backend_key) .. "\". Fix it in keep_decoration_settings.lua!")

	local extension = KeepDecorationSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data, ...)

	if extension_name == "KeepDecorationPaintingExtension" then
		local is_client_painting = Unit.get_data(unit, "painting_data", "is_client_painting")

		if is_client_painting then
			self._client_painting_extensions[#self._client_painting_extensions + 1] = extension
		end

		extension.keep_decoration_system = self
	end

	self._extensions[#self._extensions + 1] = extension
	self._unit_extensions[unit] = extension
	self._used_settings_keys[settings_key] = true
	self._used_backend_keys[backend_key] = true

	return extension
end

KeepDecorationSystem.update = function (self, context, t)
	local extensions = self._extensions
	local num_extensions = #extensions

	if num_extensions == 0 then
		return
	end

	local update_index = self._update_index + 1

	if num_extensions < update_index then
		update_index = 1
	end

	local extension_to_update = extensions[update_index]

	extension_to_update:distributed_update()

	local level_key = Managers.state.game_mode:level_key()
	local level_setting = LevelSettings[level_key]

	if self._is_leader and level_setting.use_keep_decorations then
		local players = Managers.player:human_players()
		local num_players = 0

		for _, _ in pairs(players) do
			num_players = num_players + 1
		end

		if self._is_leader and num_players ~= self._num_players then
			self._num_players = num_players

			self:_sync_client_paintings()
			self:_refresh_client_paintings()
		end
	end

	self._update_index = update_index
end

KeepDecorationSystem._add_client_painting = function (self, player_id, painting)
	local client_paintings = self._client_paintings
	client_paintings[player_id] = painting
end

KeepDecorationSystem._sync_client_paintings = function (self)
	local client_paintings = self._client_paintings
	local players = Managers.player:human_players()
	local my_id = Network.peer_id()

	for key_id, _ in pairs(client_paintings) do
		local exists = false

		for _, player in pairs(players) do
			if key_id == player.peer_id and player.peer_id ~= my_id then
				exists = true

				break
			end
		end

		if not exists then
			client_paintings[key_id] = nil
		end
	end

	self._client_paintings = client_paintings
end

KeepDecorationSystem._refresh_client_paintings = function (self)
	local client_paintings = self._client_paintings
	local paintings = {}
	local count = 1

	for _, val in pairs(client_paintings) do
		paintings[count] = val
		count = count + 1
	end

	for i = 1, 3, 1 do
		local painting = paintings[i] or "hidden"
		local extension = self._client_painting_extensions[i]

		extension:set_client_painting(painting)
	end
end

KeepDecorationSystem.painting_set = function (self, painting, asking_extension)
	local painting_extensions = self._extensions
	local painting_data = Paintings[painting]
	local painting_frame = painting_data.frame

	for _, extension in pairs(painting_extensions) do
		local extension_painting = extension:get_selected_painting()
		local extension_painting_data = Paintings[extension_painting]
		local extension_painting_frame = extension_painting_data.frame
		local is_client_painting = extension:is_client_painting()

		if extension_painting == painting and asking_extension ~= extension and painting_frame == extension_painting_frame and not is_client_painting then
			extension:painting_selected("hor_none")
			extension:sync_painting()
		end
	end
end

KeepDecorationSystem.is_painting_in_use = function (self, painting)
	local painting_extensions = self._extensions

	for i = 1, #painting_extensions, 1 do
		local extension = painting_extensions[i]
		local extension_painting = extension:get_selected_painting()

		if extension_painting == painting then
			return true
		end
	end

	return false
end

KeepDecorationSystem.rpc_send_painting = function (self, channel_id, painting)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	self:_add_client_painting(peer_id, painting)
	self:_refresh_client_paintings()
end

KeepDecorationSystem.rpc_request_painting = function (self, channel_id)
	local painting = Managers.backend:get_interface("keep_decorations"):get_decoration("keep_hall_painting_wood_base_5") or "hor_none"

	self.network_transmit:send_rpc_server("rpc_send_painting", painting)
end

KeepDecorationSystem.hot_join_sync = function (self, peer_id)
	local level_key = Managers.state.game_mode:level_key()
	local level_setting = LevelSettings[level_key]

	if level_setting.use_keep_decorations then
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		RPC.rpc_request_painting(channel_id)
	end
end

return
