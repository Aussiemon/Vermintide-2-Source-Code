require("scripts/managers/backend/backend_interface_common")
require("scripts/managers/backend/data_server_queue")
require("scripts/managers/backend_playfab/backend_interface_crafting_playfab")
require("scripts/managers/backend_playfab/backend_interface_item_playfab")
require("scripts/managers/backend_playfab/tutorial_backend/backend_interface_item_tutorial")
require("scripts/managers/backend_playfab/tutorial_backend/backend_interface_hero_attributes_tutorial")
require("scripts/managers/backend_playfab/backend_interface_loot_playfab")
require("scripts/managers/backend_playfab/backend_interface_talents_playfab")
require("scripts/managers/backend_playfab/backend_interface_quests_playfab")
require("scripts/managers/backend_playfab/backend_interface_hero_attributes_playfab")
require("scripts/managers/backend_playfab/backend_interface_statistics_playfab")
require("scripts/managers/backend_playfab/backend_interface_keep_decorations_playfab")
require("scripts/managers/backend_playfab/backend_interface_live_events_playfab")
require("scripts/managers/backend_playfab/backend_interface_cdn_resources_playfab")
require("scripts/managers/backend_playfab/backend_interface_dlcs_playfab")
require("scripts/managers/backend_playfab/benchmark_backend/backend_interface_loot_benchmark")
require("scripts/managers/backend_playfab/benchmark_backend/backend_interface_statistics_benchmark")
require("scripts/managers/backend_playfab/benchmark_backend/backend_interface_quests_benchmark")
require("scripts/managers/backend/script_backend")
require("scripts/settings/equipment/item_master_list")
require("backend/error_codes")

if IS_WINDOWS or IS_LINUX then
	require("scripts/managers/backend_playfab/script_backend_playfab")
	DLCUtils.require_list("script_backend_playfab_files")
elseif IS_XB1 then
	require("scripts/managers/backend_playfab/script_backend_playfab_xbox")
	require("scripts/managers/backend_playfab/backend_interface_console_dlc_rewards_playfab")
elseif IS_PS4 then
	require("scripts/managers/backend_playfab/script_backend_playfab_ps4")
	require("scripts/managers/backend_playfab/backend_interface_console_dlc_rewards_playfab")
end

cjson = cjson.stingray_init()
local backend_manager_playfab_testify = script_data.testify and require("scripts/managers/backend_playfab/backend_manager_playfab_testify")
BackendManagerPlayFab = class(BackendManagerPlayFab)
local TIMEOUT_SIGNIN = 20

BackendManagerPlayFab.init = function (self, signin_name, mirror_name, server_queue_name)
	local settings = GameSettingsDevelopment.backend_settings
	local implementation = settings.implementation
	self._backend_implementation = implementation
	self._signin = rawget(_G, signin_name)
	self._mirror = rawget(_G, mirror_name)
	self._server_queue = rawget(_G, server_queue_name)
	self._interfaces = {}
	self._interfaces_created = false
	self._errors = {}
	self._in_error_state = false
	self._is_tutorial_backend = false
	self._button_retry = "button_retry"
	self._button_ok = "button_ok"
	self._button_quit = "button_quit"
	self._button_disconnected = "button_disconnected"
	self._loadout_interface_overrides = {}
	self._current_loadout_interface_override = nil
	self._talents_interface_overrides = {}
	self._current_talents_interface_override = nil
	self._total_power_level_interface_overrides = {}
	self._metadata = {
		client_version = VersionSettings.version,
		realm = HAS_STEAM and script_data["eac-untrusted"] and "modded" or "official"
	}
end

BackendManagerPlayFab.reset = function (self)
	self._errors = {}
	self._is_disconnected = false
	self._in_error_state = false

	self:_destroy_backend()
end

BackendManagerPlayFab.signin = function (self, authentication_token)
	local available = self:available()
	local backend_plugin_loaded = self:_backend_plugin_loaded()
	local allow_local = GameSettingsDevelopment.backend_settings.allow_local
	local use_backend = GameSettingsDevelopment.use_backend

	if not available or not backend_plugin_loaded or not use_backend then
		if allow_local then
			if use_backend and not available then
				local error_data = {
					reason = BACKEND_LUA_ERRORS.ERR_PLATFORM_SPECIFIC_INTERFACE_MISSING
				}

				self:_post_error(error_data)

				return
			end
		elseif not backend_plugin_loaded then
			local error_data = {
				reason = BACKEND_LUA_ERRORS.ERR_LOADING_PLUGIN
			}

			self:_post_error(error_data)

			return
		elseif not use_backend then
			local error_data = {
				reason = BACKEND_LUA_ERRORS.ERR_USE_LOCAL_BACKEND_NOT_ALLOWED
			}

			self:_post_error(error_data)

			return
		else
			error("Bad backend combination")
		end
	end

	if self._backend_signin then
		self:reset()
	end

	print("[BackendManagerPlayFab] Backend Enabled")

	self._backend_signin = self._signin:new(authentication_token)
	self._need_signin = true
	self._signin_timeout = os.time() + TIMEOUT_SIGNIN
end

BackendManagerPlayFab.on_shutdown = function (self, external_callback)
	local function commit_cb(commit_status)
		local function log_cb(log_status)
			external_callback(log_status)
		end

		if self._backend_mirror then
			self._backend_mirror:log_player_exit(log_cb)
		end
	end

	return self:commit(true, commit_cb)
end

BackendManagerPlayFab._backend_plugin_loaded = function (self)
	if self._backend_implementation == "fishtank" then
		return rawget(_G, "Backend")
	elseif self._backend_implementation == "playfab" then
		return true
	end

	fassert(false, "unknown backend implementation set in backend settings")
end

BackendManagerPlayFab._create_interfaces = function (self)
	local settings = GameSettingsDevelopment.backend_settings

	self:_create_items_interface(settings)

	if not DEDICATED_SERVER then
		self:_create_quests_interface(settings)
	end

	self:_create_crafting_interface(settings)
	self:_create_talents_interface(settings)
	self:_create_loot_interface(settings)
	self:_create_common_interface(settings)
	self:_create_hero_attributes_interface(settings)
	self:_create_statistics_interface(settings)
	self:_create_keep_decorations_interface(settings)
	self:_create_live_events_interface(settings)
	self:_create_cdn_resources_interface(settings)
	self:_create_dlcs_interface(settings)

	if IS_CONSOLE then
		self:_create_console_dlc_rewards_interface(settings)
	end

	self:_create_dlc_interfaces(settings)

	self._interfaces_created = true
end

BackendManagerPlayFab._destroy_backend = function (self)
	if self._backend_signin then
		self._backend_signin:destroy()

		self._backend_signin = nil
	end

	if self._backend_mirror then
		self._backend_mirror:destroy()

		self._backend_mirror = nil
	end
end

BackendManagerPlayFab.item_script_type = function (self)
	return "backend"
end

BackendManagerPlayFab.get_interface = function (self, interface_name, player_id)
	if not self._interfaces[interface_name] then
		Application.warning("BackendManagerPlayFab:get_interface: Requesting unknown interface " .. interface_name)

		return nil
	end

	return self._interfaces[interface_name]
end

BackendManagerPlayFab.dirtify_interfaces = function (self)
	local interfaces = self._interfaces

	for interface_name, interface in pairs(interfaces) do
		if interface.make_dirty then
			interface:make_dirty()
		end
	end
end

BackendManagerPlayFab.get_data_server_queue = function (self)
	return self._data_server_queue
end

BackendManagerPlayFab.is_disconnected = function (self)
	return self._is_disconnected
end

BackendManagerPlayFab.is_waiting_for_user_input = function (self)
	return not not self._error_dialog
end

BackendManagerPlayFab.get_title_data = function (self, key)
	local mirror = self._backend_mirror

	if mirror then
		local title_data = mirror:get_title_data()
		local value = title_data[key]

		return value
	end

	return nil
end

BackendManagerPlayFab.get_read_only_data = function (self, key)
	return self._backend_mirror and self._backend_mirror:get_read_only_data(key) or nil
end

BackendManagerPlayFab.start_tutorial = function (self)
	fassert(self._script_backend_items_backup == nil, "Tutorial already started")
	fassert(self._script_backend_hero_attributes_backup == nil, "Tutorial already started")

	self._script_backend_items_backup = self._interfaces.items
	self._interfaces.items = BackendInterfaceItemTutorial:new()
	self._script_backend_hero_attributes_backup = self._interfaces.hero_attributes
	self._interfaces.hero_attributes = BackendInterfaceHeroAttributesTutorial:new()
	self._is_tutorial_backend = true
end

BackendManagerPlayFab.stop_tutorial = function (self)
	fassert(self._script_backend_items_backup ~= nil, "Stopping tutorial without starting it")
	fassert(self._script_backend_hero_attributes_backup ~= nil, "Stopping tutorial without starting it")

	self._interfaces.items = self._script_backend_items_backup
	self._script_backend_items_backup = nil
	self._interfaces.hero_attributes = self._script_backend_hero_attributes_backup
	self._script_backend_hero_attributes_backup = nil
	self._is_tutorial_backend = false
end

BackendManagerPlayFab.is_tutorial_backend = function (self)
	return self._is_tutorial_backend
end

BackendManagerPlayFab.is_benchmark_backend = function (self)
	return self._benchmark_backend
end

BackendManagerPlayFab.start_benchmark = function (self)
	fassert(self._benchmark_backend == nil, "Benchmark backend already started.")

	self._script_backend_items_backup = self._interfaces.items
	self._interfaces.items = BackendInterfaceItemTutorial:new()
	self._script_backend_hero_attributes_backup = self._interfaces.hero_attributes
	self._interfaces.hero_attributes = BackendInterfaceHeroAttributesTutorial:new()
	self._script_backend_loot_backup = self._interfaces.loot
	self._interfaces.loot = BackendInterfaceLootBenchmark:new()
	self._script_backend_statistics_backup = self._interfaces.statistics
	self._interfaces.statistics = BackendInterfaceStatisticsBenchmark:new()
	self._script_backend_quest_backup = self._interfaces.quests
	self._interfaces.quests = BackendInterfaceQuestsBenchmark:new()
	self._benchmark_backend = true
end

BackendManagerPlayFab.stop_benchmark = function (self)
	fassert(self._benchmark_backend == true, "Benchmark has not been started.")

	self._interfaces.items = self._script_backend_items_backup
	self._script_backend_items_backup = nil
	self._interfaces.hero_attributes = self._script_backend_hero_attributes_backup
	self._script_backend_hero_attributes_backup = nil
	self._interfaces.loot = self._script_backend_loot_backup
	self._script_backend_loot_backup = nil
	self._interfaces.statistics = self._script_backend_statistics_backup
	self._script_backend_statistics_backup = nil
	self._interfaces.quests = self._script_backend_quest_backup
	self._script_backend_quest_backup = nil
	self._benchmark_backend = nil
end

BackendManagerPlayFab.add_loadout_interface_override = function (self, override_name, interface_name_by_slot)
	self._loadout_interface_overrides[override_name] = interface_name_by_slot
end

BackendManagerPlayFab.set_loadout_interface_override = function (self, override_name)
	local current_name = self._current_loadout_interface_override
	local verified_name = self._loadout_interface_overrides[override_name] and override_name
	local changed = false

	if verified_name ~= current_name then
		self._current_loadout_interface_override = verified_name
		changed = true
	end

	return changed, current_name, verified_name
end

BackendManagerPlayFab.get_loadout_interface_by_slot = function (self, slot_name)
	local override_name = self._current_loadout_interface_override

	if not override_name then
		return self._interfaces.items
	end

	local override = self._loadout_interface_overrides[override_name]
	local interface_name = override[slot_name]
	local interface = interface_name and self._interfaces[interface_name]

	return interface
end

BackendManagerPlayFab.add_talents_interface_override = function (self, override_name, interface_name)
	self._talents_interface_overrides[override_name] = interface_name
end

BackendManagerPlayFab.set_talents_interface_override = function (self, override_name)
	local current_name = self._current_talents_interface_override
	local verified_name = self._talents_interface_overrides[override_name] and override_name
	local changed = false

	if verified_name ~= current_name then
		self._current_talents_interface_override = verified_name
		changed = true
	end

	return changed
end

BackendManagerPlayFab.get_talents_interface = function (self)
	local override_name = self._current_talents_interface_override

	if not override_name then
		return self._interfaces.talents
	end

	local interface_name = self._talents_interface_overrides[override_name]
	local interface = self._interfaces[interface_name]

	return interface
end

BackendManagerPlayFab.set_total_power_level_interface_for_game_mode = function (self, game_mode, interface_name)
	self._total_power_level_interface_overrides[game_mode] = interface_name
end

BackendManagerPlayFab.get_total_power_level = function (self, profile_name, career_name, game_mode_key)
	local override_name = self._total_power_level_interface_overrides[game_mode_key]

	if override_name then
		local interface = self._interfaces[override_name]

		return interface:get_total_power_level(profile_name, career_name)
	end

	local hero_power_level = BackendUtils.get_hero_power_level(profile_name)
	local average_item_power_level = BackendUtils.get_average_item_power_level(career_name)

	return hero_power_level + average_item_power_level
end

BackendManagerPlayFab._update_state = function (self)
	local settings = GameSettingsDevelopment.backend_settings
	local signin = self._backend_signin

	if (not settings.allow_backend or self._local_save_loaded or DEDICATED_SERVER) and self._need_signin then
		local result_data = signin:update_signin()

		if result_data then
			self._need_signin = false

			self:_post_error(result_data)
		elseif signin:authenticated() then
			local backend_mirror = self._backend_mirror

			if backend_mirror and backend_mirror:ready() then
				self._need_signin = false
				local queue = self._server_queue:new()
				self._data_server_queue = queue

				self:_create_interfaces(false)
			elseif not backend_mirror then
				local signin_result = signin:get_signin_result()
				self._backend_mirror = self._mirror:new(signin_result)
			end
		elseif self._signin_timeout < os.time() then
			self._need_signin = false
			local error_data = {
				reason = BACKEND_LUA_ERRORS.ERR_SIGNIN_TIMEOUT
			}

			self:_post_error(error_data)
		end
	end
end

function string_is_url(str)
	return string.starts_with(str, "http://") or string.starts_with(str, "https://")
end

BackendManagerPlayFab._update_error_handling = function (self, dt)
	if #self._errors > 0 and not self._error_dialog and not self._is_disconnected and not DEDICATED_SERVER then
		local error_data = table.remove(self._errors, 1)

		self:_show_error_dialog(error_data.reason, error_data.details, error_data.optional_error_topic, error_data.optional_url_button)
	end

	if self._error_dialog ~= nil and not Managers.popup:has_popup_with_id(self._error_dialog) then
		self._is_disconnected = true
		self._error_dialog = nil
	end

	if self._error_dialog then
		local result = Managers.popup:query_result(self._error_dialog)

		if result then
			Managers.popup:cancel_popup(self._error_dialog)

			self._error_dialog = nil

			if type(result) == "table" then
				if result.open_url and string_is_url(result.open_url) then
					Application.open_url_in_browser(result.open_url)
				end

				if result.application_quit then
					Application.quit()
				end
			elseif result == self._button_disconnected then
				self._is_disconnected = true
			elseif result == self._button_retry then
				self._is_disconnected = true
			elseif result == self._button_quit then
				Application.quit()
			elseif result == self._button_restart then
				self._is_disconnected = true
			end
		end
	end
end

BackendManagerPlayFab._update_interface = function (self, interface_name, dt)
	local interface = self._interfaces[interface_name]
	local backend_mirror = self._backend_mirror

	if interface and interface.update and backend_mirror then
		interface:update(dt)
	end
end

BackendManagerPlayFab.update = function (self, dt, t)
	if self:_are_profiles_loaded() and not self._profiles_loaded then
		self._profiles_loaded = true

		Managers.mechanism:backend_profiles_loaded()
	elseif not self:_are_profiles_loaded() and self._profiles_loaded then
		self._profiles_loaded = false
	end

	local settings = GameSettingsDevelopment.backend_settings
	local signin = self._backend_signin
	local mirror = self._backend_mirror
	local queue = self._data_server_queue
	local error_data = nil

	if mirror then
		error_data = mirror:update(dt, t)
	end

	if queue then
		queue:update()

		error_data = error_data or queue:check_for_errors()
	end

	local interfaces = self._interfaces

	if settings.enable_sessions then
		self:_update_interface("session", dt)
	end

	self:_update_interface("items", dt)
	self:_update_interface("crafting", dt)
	self:_update_interface("talents", dt)
	self:_update_interface("loot", dt)
	self:_update_interface("quests", dt)
	self:_update_interface("deus", dt)

	if signin then
		self:_update_state()

		if settings.enable_sessions then
			error_data = error_data or interfaces.session:check_for_errors()
		end

		if error_data then
			self:_post_error(error_data)
		end
	end

	self:_update_error_handling(dt)

	if script_data.testify then
		Testify:poll_requests_through_handler(backend_manager_playfab_testify, self)
	end
end

BackendManagerPlayFab.playfab_api_error = function (self, result, error_code)
	table.dump(result, nil, 10)

	local error_data = {
		reason = BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR,
		details = error_code
	}

	self:_post_error(error_data)
end

BackendManagerPlayFab.request_timeout = function (self)
	local error_data = {
		reason = BACKEND_LUA_ERRORS.ERR_REQUEST_TIMEOUT
	}

	self:_post_error(error_data, "backend_err_request_timeout")
end

BackendManagerPlayFab.commit_error = function (self)
	local reason = BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_COMMIT_TIMEOUT
	local details = nil
	local error_data = {
		reason = reason,
		details = details
	}

	self:_post_error(error_data)
end

BackendManagerPlayFab.playfab_eac_error = function (self)
	local reason = BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_EAC_ERROR
	local details = nil
	local error_data = {
		reason = reason,
		details = details
	}

	self:_post_error(error_data)
end

BackendManagerPlayFab.playfab_error = function (self, reason, details)
	local error_data = {
		reason = reason,
		details = details
	}

	self:_post_error(error_data)
end

BackendManagerPlayFab.missing_required_dlc_error = function (self, details, optional_error_topic, optional_url_button)
	local reason = BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_MISSING_REQUIRED_DLC
	local error_data = {
		reason = reason,
		details = details,
		optional_error_topic = optional_error_topic,
		optional_url_button = optional_url_button
	}

	self:_post_error(error_data, nil, true)
end

BackendManagerPlayFab.signed_in = function (self)
	local signin = self._backend_signin

	if signin and signin:authenticated() then
		return true
	end

	return false
end

BackendManagerPlayFab.authenticated = function (self)
	local signin = self._backend_signin
	local mirror = self._backend_mirror

	return signin and signin:authenticated() and mirror and mirror:ready()
end

BackendManagerPlayFab.has_error = function (self)
	return self._in_error_state
end

BackendManagerPlayFab.error_string = function (self)
	if #self._errors == 0 then
		return ""
	else
		local reason = self._errors[1].reason
		local details = self._errors[1].details
		local reason_key = self:_reason_localize_key(reason, details)

		return Localize(reason_key)
	end
end

BackendManagerPlayFab._post_error = function (self, error_data, crashify_override, ignore_crashify)
	if not ignore_crashify then
		Crashify.print_exception("Backend_Error", "ERROR: %s", crashify_override or error_data.details)
	end

	local queue = self._data_server_queue

	if queue then
		queue:clear()
	end

	fassert(error_data.reason, "Posting error without reason, %q: %q", error_data.reason or "nil")

	if DEDICATED_SERVER then
		cprintf("[BackendManagerPlayFab] Playfab error: %s, %s", error_data.reason, error_data.details)
	end

	print("[BackendManagerPlayFab] adding error:", error_data.reason, error_data.details)

	self._errors[#self._errors + 1] = error_data
	self._in_error_state = self:_is_fatal(error_data.reason)
end

BackendManagerPlayFab._is_fatal = function (self, reason)
	local harmless = reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ACHIEVEMENT_REWARD_CLAIMED or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_QUEST_REFRESH_UNAVAILABLE or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_NON_FATAL_STORE_ERROR

	return not harmless
end

BackendManagerPlayFab._reason_localize_key = function (self, reason, error_code)
	local error_code = error_code and tonumber(error_code) or -1

	if IS_CONSOLE then
		if not self:profiles_loaded() then
			if rawget(_G, "Backend") and reason == Backend.ERR_AUTH then
				if IS_XB1 then
					return "backend_err_auth_xb1"
				else
					return "backend_err_auth_ps4"
				end
			elseif reason == BACKEND_LUA_ERRORS.ERR_SIGNIN_TIMEOUT then
				return "backend_err_signin_timeout"
			elseif reason == BACKEND_LUA_ERRORS.ERR_REQUEST_TIMEOUT then
				return "connection_timeout"
			elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR then
				if error_code == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_THIRD_PARTY_PROBLEM then
					return ERROR_CODES[error_code]
				end

				return "backend_err_network"
			else
				return "backend_err_connecting"
			end
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR then
			if error_code == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_THIRD_PARTY_PROBLEM then
				return ERROR_CODES[error_code]
			end

			return "backend_err_network"
		end
	elseif not self:profiles_loaded() then
		if rawget(_G, "Backend") and reason == Backend.ERR_AUTH then
			return "backend_err_auth_steam"
		elseif reason == BACKEND_LUA_ERRORS.ERR_SIGNIN_TIMEOUT then
			return "backend_err_signin_timeout"
		elseif reason == BACKEND_LUA_ERRORS.ERR_PLATFORM_SPECIFIC_INTERFACE_MISSING then
			return "backend_err_steam_not_running"
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR then
			if error_code == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_THIRD_PARTY_PROBLEM then
				return ERROR_CODES[error_code]
			end

			return "backend_err_playfab"
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_EAC_ERROR then
			return "backend_err_playfab_eac"
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_COMMIT_TIMEOUT then
			return "backend_err_request_timeout"
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_UNSUPPORTED_VERSION_ERROR then
			return "backend_err_unsupported_version"
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_MISSING_REQUIRED_DLC then
			return nil
		else
			return "backend_err_connecting"
		end
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR then
		if error_code == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_THIRD_PARTY_PROBLEM then
			return ERROR_CODES[error_code]
		end

		return ERROR_CODES[reason]
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_EAC_ERROR or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_COMMIT_TIMEOUT then
		return ERROR_CODES[reason]
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ACHIEVEMENT_REWARD_CLAIMED or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_QUEST_REFRESH_UNAVAILABLE or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_NON_FATAL_STORE_ERROR then
		return ERROR_CODES[reason]
	else
		return "backend_err_network"
	end
end

BackendManagerPlayFab._format_error_message_console = function (self, reason, error_code)
	local button = {
		result = self._button_retry,
		text = Localize("button_ok")
	}

	return self:_reason_localize_key(reason, error_code), button
end

BackendManagerPlayFab._format_error_message_windows = function (self, reason, error_code, optional_url_button)
	local error_text = self:_reason_localize_key(reason, error_code)
	local button_1, button_2, button_3 = nil

	if not self:profiles_loaded() then
		button_1 = {
			result = self._button_quit,
			text = Localize("menu_quit")
		}

		print("backend error", reason, ERROR_CODES[reason])
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_EAC_ERROR or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_COMMIT_TIMEOUT then
		button_1 = {
			result = self._button_quit,
			text = Localize("menu_quit")
		}
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ACHIEVEMENT_REWARD_CLAIMED or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_QUEST_REFRESH_UNAVAILABLE or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_NON_FATAL_STORE_ERROR then
		button_1 = {
			result = self._button_ok,
			text = Localize("button_ok")
		}
	else
		button_1 = {
			result = self._button_disconnected,
			text = Localize("button_ok")
		}
	end

	if optional_url_button then
		local url_button = {
			result = {
				application_quit = true,
				open_url = optional_url_button.url
			},
			text = optional_url_button.text
		}

		if button_2 then
			button_3 = url_button
		elseif button_1 then
			button_2 = url_button
		else
			button_1 = url_button
		end
	end

	return error_text, button_1, button_2, button_3
end

BackendManagerPlayFab._show_error_dialog = function (self, reason, details_message, optional_error_topic, optional_url_button)
	print(string.format("[BackendManagerPlayFab] Showing error dialog: %q, %q", reason or "nil", details_message or "nil"))

	local error_topic = optional_error_topic or Localize("backend_error_topic")
	local error_text, button_1, button_2, button_3 = nil

	if IS_CONSOLE then
		error_text, button_1 = self:_format_error_message_console(reason, details_message)
	else
		error_text, button_1, button_2, button_3 = self:_format_error_message_windows(reason, details_message, optional_url_button)
	end

	local localized_error_text = error_text and Localize(error_text) or Localize("backend_err_playfab")

	if IS_WINDOWS then
		if localized_error_text and details_message then
			localized_error_text = localized_error_text .. " : " .. details_message
		elseif details_message then
			localized_error_text = details_message
		end
	end

	if button_3 then
		self._error_dialog = Managers.popup:queue_popup(localized_error_text, error_topic, button_1.result, button_1.text, button_2.result, button_2.text, button_3.result, button_3.text)
	elseif button_2 then
		self._error_dialog = Managers.popup:queue_popup(localized_error_text, error_topic, button_1.result, button_1.text, button_2.result, button_2.text)
	else
		self._error_dialog = Managers.popup:queue_popup(localized_error_text, error_topic, button_1.result, button_1.text)
	end
end

BackendManagerPlayFab.get_stats = function (self)
	if self._backend_mirror then
		return self._backend_mirror:get_stats()
	else
		return self._save_data.stats
	end
end

BackendManagerPlayFab.set_stats = function (self, stats)
	if self._backend_mirror then
		return self._backend_mirror:set_stats(stats)
	else
		self._save_data.stats = stats
	end
end

BackendManagerPlayFab.get_user_data = function (self, key)
	if self._backend_mirror then
		return self._backend_mirror:get_user_data(key)
	else
		return self._save_data.user_data[key]
	end
end

BackendManagerPlayFab.set_user_data = function (self, key, value)
	if self._backend_mirror then
		self._backend_mirror:set_user_data(key, value)
	else
		self._save_data.user_data[key] = value
	end
end

BackendManagerPlayFab.available = function (self)
	local settings = GameSettingsDevelopment.backend_settings

	if IS_WINDOWS or IS_LINUX then
		return rawget(_G, "Steam") ~= nil or DEDICATED_SERVER
	elseif IS_XB1 then
		return true
	elseif IS_PS4 then
		return true
	end

	return false
end

BackendManagerPlayFab.commit = function (self, skip_queue, commit_complete_callback)
	if self._backend_mirror then
		return self._backend_mirror:commit(skip_queue, commit_complete_callback)
	end
end

BackendManagerPlayFab.has_loaded = function (self)
	return self._local_save_loaded or DEDICATED_SERVER
end

BackendManagerPlayFab._are_profiles_loaded = function (self)
	local signin = self._backend_signin
	local mirror = self._backend_mirror
	local ready = (self._disable_backend or signin and signin:authenticated() and mirror and mirror:ready()) and self:_interfaces_ready()

	return ready
end

BackendManagerPlayFab.profiles_loaded = function (self)
	return self._profiles_loaded
end

BackendManagerPlayFab.interfaces_ready = function (self)
	return self:_interfaces_ready()
end

BackendManagerPlayFab._interfaces_ready = function (self)
	if not self._interfaces_created then
		return false
	end

	if not self._interfaces then
		return false
	end

	local interfaces = self._interfaces

	for interface_name, interface in pairs(interfaces) do
		local ready = interface:ready()

		if not ready then
			return false
		end
	end

	return true
end

BackendManagerPlayFab.refresh_log_level = function (self)
	print("[BackendManagerPlayFab] No backend to set log level on!")
end

BackendManagerPlayFab.logout = function (self)
	error("[BackendManagerPlayFab] Not implemented yet")
end

BackendManagerPlayFab.disconnect = function (self)
	error("[BackendManagerPlayFab] Not implemented yet")
end

BackendManagerPlayFab.destroy = function (self)
	if self._interfaces.quests then
		self._interfaces.quests:delete()
	end

	local backend_mirror = self._backend_mirror

	if backend_mirror then
		backend_mirror:wait_for_shutdown(1)
	end
end

BackendManagerPlayFab.implementation = function (self)
	return self._backend_implementation
end

BackendManagerPlayFab._create_items_interface = function (self, settings)
	local implementation = self._backend_implementation

	if implementation == "playfab" then
		self._interfaces.items = BackendInterfaceItemPlayfab:new(self._backend_mirror)
	elseif implementation == "fishtank" then
		self._interfaces.items = BackendInterfaceItem:new()
	end
end

BackendManagerPlayFab._create_quests_interface = function (self, settings)
	local implementation = self._backend_implementation

	if implementation == "playfab" then
		self._interfaces.quests = BackendInterfaceQuestsPlayfab:new(self._backend_mirror)
	elseif implementation == "fishtank" then
		self._interfaces.quests = BackendInterfaceQuests:new()
	end
end

BackendManagerPlayFab._create_crafting_interface = function (self, settings)
	local implementation = self._backend_implementation

	if implementation == "playfab" then
		self._interfaces.crafting = BackendInterfaceCraftingPlayfab:new(self._backend_mirror)
	elseif implementation == "fishtank" then
		self._interfaces.crafting = BackendInterfaceCrafting:new()
	end
end

BackendManagerPlayFab._create_talents_interface = function (self, settings)
	local implementation = self._backend_implementation

	if implementation == "playfab" then
		self._interfaces.talents = BackendInterfaceTalentsPlayfab:new(self._backend_mirror)
	elseif implementation == "fishtank" then
		self._interfaces.talents = BackendInterfaceTalents:new()
	end
end

BackendManagerPlayFab._create_loot_interface = function (self, settings)
	local implementation = self._backend_implementation

	if implementation == "playfab" then
		self._interfaces.loot = BackendInterfaceLootPlayfab:new(self._backend_mirror)
	elseif implementation == "fishtank" then
		self._interfaces.loot = BackendInterfaceLootLocal:new(self._save_data)
	end
end

BackendManagerPlayFab._create_common_interface = function (self, settings)
	self._interfaces.common = BackendInterfaceCommon:new(self._backend_mirror)
end

BackendManagerPlayFab._create_hero_attributes_interface = function (self, settings)
	local implementation = self._backend_implementation

	if implementation == "playfab" then
		self._interfaces.hero_attributes = BackendInterfaceHeroAttributesPlayFab:new(self._backend_mirror)
	elseif implementation == "fishtank" then
		self._interfaces.hero_attributes = BackendInterfaceHeroAttributesLocal:new(self._save_data)
	end
end

BackendManagerPlayFab._create_statistics_interface = function (self, settings)
	self._interfaces.statistics = BackendInterfaceStatisticsPlayFab:new(self._backend_mirror)
end

BackendManagerPlayFab._create_keep_decorations_interface = function (self, settings)
	self._interfaces.keep_decorations = BackendInterfaceKeepDecorationsPlayFab:new(self._backend_mirror)
end

BackendManagerPlayFab._create_live_events_interface = function (self, settings)
	self._interfaces.live_events = BackendInterfaceLiveEventsPlayfab:new(self._backend_mirror)
end

BackendManagerPlayFab._create_console_dlc_rewards_interface = function (self, settings)
	self._interfaces.console_dlc_rewards = BackendInterfaceConsoleDlcRewardsPlayfab:new(self._backend_mirror)
end

BackendManagerPlayFab._create_dlcs_interface = function (self, settings)
	self._interfaces.dlcs = BackendInterfaceDLCsPlayfab:new(self._backend_mirror)
end

BackendManagerPlayFab._create_dlc_interfaces = function (self, settings)
	local interfaces = self._interfaces
	local save_data = self._save_data
	local backend_mirror = self._backend_mirror

	for dlc_name, dlc_settings in pairs(DLCSettings) do
		local dlc_interfaces = dlc_settings.backend_interfaces

		if dlc_interfaces then
			for interface_name, interface_settings in pairs(dlc_interfaces) do
				local skip_interface = DEDICATED_SERVER and interface_settings.ignore_on_dedicated_server

				if not skip_interface then
					local interface = nil
					local file_name = interface_settings.playfab_file

					require(file_name)

					local class_name = interface_settings.playfab_class
					local class = rawget(_G, class_name)
					interface = class:new(backend_mirror)
					interfaces[interface_name] = interface
				end
			end
		end
	end
end

BackendManagerPlayFab._create_cdn_resources_interface = function (self, settings)
	self._interfaces.cdn = BackendInterfaceCdnResourcesPlayFab:new(self._backend_mirror)
	local localizer = Managers.localizer
	local language_id = localizer:language_id()

	self._interfaces.cdn:load_backend_localizations(language_id, callback(self, "_cb_backend_localizations_loaded"))
end

BackendManagerPlayFab._cb_backend_localizations_loaded = function (self, localizations)
	if localizations then
		local localizer = Managers.localizer

		localizer:append_backend_localizations(localizations)
	end
end

BackendManagerPlayFab.player_id = function (self)
	local signin = self._backend_signin

	if not signin then
		return "-"
	end

	local result = signin:get_signin_result()
	local playfab_id = result.PlayFabId

	return playfab_id
end

BackendManagerPlayFab.load_mechanism_loadout = function (self, mechanism_key)
	self._backend_mirror:request_characters(mechanism_key)
end

BackendManagerPlayFab.is_pending_request = function (self)
	local mirror = self._backend_mirror

	return mirror and mirror:request_queue():is_pending_request() or false
end

local EMPTY_TABLE = {}

BackendManagerPlayFab.get_level_variation_data = function (self)
	if not self._backend_mirror then
		return EMPTY_TABLE
	end

	local title_data = self._backend_mirror:get_title_data()
	local level_variation_data = title_data.level_variation_data
	local decoded_level_variation_data = level_variation_data and cjson.decode(level_variation_data)

	return decoded_level_variation_data or EMPTY_TABLE
end

BackendManagerPlayFab.get_deus_weapon_preload_settings = function (self)
	if not self._backend_mirror then
		return EMPTY_TABLE
	end

	local title_data = self._backend_mirror:get_title_data()
	local deus_weapon_preload_settings = title_data.deus_weapon_preload_settings
	local decoded_deus_weapon_preload_settings = deus_weapon_preload_settings and cjson.decode(deus_weapon_preload_settings)

	return decoded_deus_weapon_preload_settings or EMPTY_TABLE
end

BackendManagerPlayFab.get_title_settings = function (self)
	if not self._backend_mirror then
		return EMPTY_TABLE
	end

	local title_data = self._backend_mirror:get_title_data()
	local title_settings = title_data.title_settings
	local decoded_title_settings = title_settings and cjson.decode(title_settings)

	return decoded_title_settings or EMPTY_TABLE
end

BackendManagerPlayFab.dlc_unlocked_at_signin = function (self, dlc_name)
	if IS_WINDOWS or IS_LINUX or not self._backend_mirror then
		return true
	end

	return self._backend_mirror:dlc_unlocked_at_signin(dlc_name)
end

BackendManagerPlayFab.get_metadata = function (self)
	return self._metadata
end

BackendManagerPlayFab.get_backend_mirror = function (self)
	return self._backend_mirror
end

BackendManagerPlayFab.get_twitch_app_access_token = function (self)
	return self._backend_mirror:get_twitch_app_access_token()
end
