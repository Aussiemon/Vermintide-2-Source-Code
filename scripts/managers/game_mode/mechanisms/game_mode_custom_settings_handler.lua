-- chunkname: @scripts/managers/game_mode/mechanisms/game_mode_custom_settings_handler.lua

GameModeCustomSettingsHandlerUtility = GameModeCustomSettingsHandlerUtility or {}

GameModeCustomSettingsHandlerUtility.parse_packed_custom_settings = function (packed_custom_settings, game_mode_name)
	local settings = FrameTable.alloc_table()
	local custom_settings_table = string.split(packed_custom_settings, ";")
	local settings_template = GameModeSettings[game_mode_name].custom_game_settings_templates

	for i = 1, #custom_settings_table, 2 do
		local idx = tonumber(custom_settings_table[i])
		local lookup_value = tonumber(custom_settings_table[i + 1])

		if not idx or not lookup_value then
			break
		end

		local template = settings_template[idx]
		local name = template.setting_name
		local value = template.values[lookup_value]

		settings[#settings + 1] = {
			name = name,
			value = value,
			template = template,
		}
	end

	return settings
end

GameModeCustomSettingsHandler = class(GameModeCustomSettingsHandler)

local RPCS = {
	"rpc_game_mode_custom_settings_full_sync",
	"rpc_game_mode_custom_settings_request_full_sync",
	"rpc_game_mode_custom_settings_handler_set_enabled",
}

GameModeCustomSettingsHandler.init = function (self, game_mode_name, custom_settings)
	self._game_mode_settings = GameModeSettings[game_mode_name]
	self._settings_template = self._game_mode_settings.custom_game_settings_templates
	self._settings = {}

	self:set_enabled(false)
end

GameModeCustomSettingsHandler.server_set_setting = function (self, setting_name, value)
	fassert(self._enabled, "GameModeCustomSettingsHandler is disabled, cannot set setting %s", tostring(setting_name))

	local setting_data = self._settings_template[setting_name]

	self._settings[setting_data.id] = value

	self:_print_settings()

	local network_handler = Managers.mechanism:network_handler()
	local match_handler = network_handler:get_match_handler()
	local packed_settings = self:pack_settings(self._settings, self._settings_template)

	match_handler:send_rpc_others("rpc_game_mode_custom_settings_full_sync", packed_settings, self._enabled)
end

GameModeCustomSettingsHandler.pack_settings = function (self, settings, settings_template)
	local packed_settings = FrameTable.alloc_table()

	for k, v in ipairs(settings) do
		packed_settings[k] = settings_template[k].values_reverse_lookup[v]
	end

	return packed_settings
end

GameModeCustomSettingsHandler.get_packed_custom_settings = function (self)
	local changed_packaged_settings = ""
	local settings = self._settings
	local has_custom_settings = false
	local settings_template = self._settings_template

	for k, v in ipairs(settings) do
		if v ~= settings_template[k].default then
			local idx = k
			local value = settings_template[k].values_reverse_lookup[v]

			changed_packaged_settings = changed_packaged_settings .. string.format("%s;%s;", idx, value)
			has_custom_settings = true
		end
	end

	return has_custom_settings and changed_packaged_settings or "n/a"
end

GameModeCustomSettingsHandler.unpack_settings = function (self, packed_settings, settings_template)
	local settings = {}

	for k, v in ipairs(packed_settings) do
		settings[k] = settings_template[k].values[v]
	end

	return settings
end

GameModeCustomSettingsHandler.request_full_sync = function (self)
	local network_handler = Managers.mechanism:network_handler()
	local match_handler = network_handler:get_match_handler()

	if match_handler:is_leader() then
		match_handler:send_rpc_up("rpc_game_mode_custom_settings_request_full_sync")
	end
end

GameModeCustomSettingsHandler.get_setting = function (self, setting_name)
	local setting_data = self._settings_template[setting_name]
	local setting

	if setting_data then
		setting = self._settings[setting_data.id]
	end

	return setting, self._enabled
end

GameModeCustomSettingsHandler.reset_custom_settings = function (self)
	for k, v in ipairs(self._settings_template) do
		self._settings[k] = v.default
	end
end

GameModeCustomSettingsHandler.set_enabled = function (self, enabled, do_sync)
	self._enabled = enabled

	if not enabled then
		self:reset_custom_settings()
	end

	if DEDICATED_SERVER then
		return
	end

	if do_sync then
		local network_handler = Managers.mechanism:network_handler()
		local match_handler = network_handler and network_handler:get_match_handler()

		if match_handler and match_handler:is_match_owner() then
			printf("GameModeCustomSettingsHandler: match_owner called set_enabled(%s)", tostring(enabled))
			match_handler:send_rpc_others("rpc_game_mode_custom_settings_handler_set_enabled", enabled)
		end
	end
end

GameModeCustomSettingsHandler.is_enabled = function (self)
	return self._enabled
end

GameModeCustomSettingsHandler.register_rpcs = function (self, network_event_delegate)
	network_event_delegate:register(self, unpack(RPCS))
end

GameModeCustomSettingsHandler.unregister_rpcs = function (self, network_event_delegate)
	network_event_delegate:unregister(self)
end

GameModeCustomSettingsHandler.get_settings = function (self)
	return self._settings, self._enabled
end

GameModeCustomSettingsHandler.get_settings_template = function (self)
	return self._settings_template
end

GameModeCustomSettingsHandler.rpc_game_mode_custom_settings_full_sync = function (self, channel_id, settings, enabled)
	self:set_enabled(enabled)

	self._settings = self:unpack_settings(settings, self._settings_template)

	self:_print_settings()

	local network_handler = Managers.mechanism:network_handler()
	local match_handler = network_handler:get_match_handler()

	match_handler:propagate_rpc("rpc_game_mode_custom_settings_full_sync", CHANNEL_TO_PEER_ID[channel_id], settings, enabled)
end

GameModeCustomSettingsHandler.rpc_game_mode_custom_settings_request_full_sync = function (self, channel_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	if peer_id then
		local network_handler = Managers.mechanism:network_handler()
		local match_handler = network_handler:get_match_handler()
		local packed_settings = self:pack_settings(self._settings, self._settings_template)

		match_handler:send_rpc("rpc_game_mode_custom_settings_full_sync", peer_id, packed_settings, self._enabled)
	end
end

GameModeCustomSettingsHandler.rpc_game_mode_custom_settings_handler_set_enabled = function (self, channel_id, enabled)
	printf("GameModeCustomSettingsHandler: rpc_game_mode_custom_settings_handler_set_enabled, enabled = %s", tostring(enabled))
	self:set_enabled(enabled)

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:trigger("lobby_member_game_mode_custom_settings_handler_enabled", enabled)
	end

	local network_handler = Managers.mechanism:network_handler()
	local match_handler = network_handler and network_handler:get_match_handler()

	if match_handler then
		match_handler:propagate_rpc("rpc_game_mode_custom_settings_handler_set_enabled", CHANNEL_TO_PEER_ID[channel_id], enabled)
	end
end

GameModeCustomSettingsHandler._print_settings = function (self)
	local to_print = string.format("GameModeCustomSettingsHandler: settings updated: \n Custom Settings Enabled = %s \n", self._enabled)

	for i = 1, #self._settings_template do
		local setting = self._settings_template[i]
		local setting_name = setting.setting_name
		local setting_value = self:get_setting(setting_name)
		local line = string.format("\n %s: %s", setting_name, setting_value)

		to_print = to_print .. line
	end

	print(to_print)
end

GameModeCustomSettingsHandler.get_telemetry_data = function (self)
	local settings_hash_map = {}
	local modified_settings = {}

	for i = 1, #self._settings_template do
		local template = self._settings_template[i]
		local setting_name = template.setting_name
		local setting = self:get_setting(setting_name)

		settings_hash_map[setting_name] = setting

		if setting ~= template.default then
			modified_settings[#modified_settings + 1] = setting_name
		end
	end

	local is_default_settings = #modified_settings == 0 and true or false

	return settings_hash_map, is_default_settings, modified_settings
end

GameModeCustomSettingsHandler.destroy = function (self)
	self._game_mode_settings = nil
	self._settings_template = nil
	self._settings = nil
	self._enabled = nil
end
