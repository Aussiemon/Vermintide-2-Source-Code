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
require("scripts/managers/backend_playfab/benchmark_backend/backend_interface_loot_benchmark")
require("scripts/managers/backend_playfab/benchmark_backend/backend_interface_statistics_benchmark")
require("scripts/managers/backend_playfab/benchmark_backend/backend_interface_quests_benchmark")
require("scripts/managers/backend/script_backend")
require("scripts/settings/equipment/item_master_list")
require("backend/error_codes")

if PLATFORM == "win32" then
	require("scripts/managers/backend_playfab/script_backend_playfab_dedicated")
	require("scripts/managers/backend_playfab/script_backend_playfab")
elseif PLATFORM == "xb1" then
	require("scripts/managers/backend_playfab/script_backend_playfab_xbox")
	require("scripts/managers/backend_playfab/backend_interface_console_dlc_rewards_playfab")
elseif PLATFORM == "ps4" then
	require("scripts/managers/backend_playfab/script_backend_playfab_ps4")
	require("scripts/managers/backend_playfab/backend_interface_console_dlc_rewards_playfab")
end

if GameSettingsDevelopment.backend_settings.allow_local then
	require("backend/local_backend/local_backend")
end

cjson = cjson.stingray_init()
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
	self._button_local_backend = "button_local_backend"
	self._button_disconnected = "button_disconnected"

	if settings.allow_local then
		local local_backend_data = (script_data.honduras_demo and DefaultDemoLocalBackendData) or DefaultLocalBackendData
		local local_backend_save_version = (script_data.honduras_demo and DemoBackendSaveDataVersion) or BackendSaveDataVersion

		fassert(self:_verify_data(local_backend_data), "Mismatch between (local) default equipment and ItemMasterList")

		self._local_backend_file_name = "backend_local"

		self:_load_save_data(local_backend_data, local_backend_save_version)
	end
end

BackendManagerPlayFab.is_local = function (self)
	return self._disable_backend
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
			else
				self._should_disable = true
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

	if self._should_disable then
		self:disable()

		return
	end

	if self._backend_signin then
		self:reset()
	end

	print("[BackendManagerPlayFab] Backend Enabled")

	self._backend_signin = self._signin:new(authentication_token)
	self._need_signin = true
	self._signin_timeout = os.time() + TIMEOUT_SIGNIN
end

BackendManagerPlayFab.update_items = function (self, leader_peer_id)
	self._backend_mirror:update_items(leader_peer_id)
	self:dirtify_interfaces()
end

BackendManagerPlayFab._backend_plugin_loaded = function (self)
	if self._backend_implementation == "fishtank" then
		return rawget(_G, "Backend")
	elseif self._backend_implementation == "playfab" then
		return true
	end

	fassert(false, "unknown backend implementation set in backend settings")
end

BackendManagerPlayFab._create_interfaces = function (self, force_local)
	local settings = GameSettingsDevelopment.backend_settings

	self:_create_items_interface(settings, force_local)
	self:_create_quests_interface(settings, force_local)
	self:_create_crafting_interface(settings, force_local)
	self:_create_talents_interface(settings, force_local)
	self:_create_loot_interface(settings, force_local)
	self:_create_common_interface(settings, force_local)
	self:_create_hero_attributes_interface(settings, force_local)
	self:_create_statistics_interface(settings, force_local)
	self:_create_keep_decorations_interface(settings, force_local)
	self:_create_live_events_interface(settings, force_local)

	if PLATFORM == "xb1" then
		self:_create_console_dlc_rewards_interface(settings, force_local)
	end

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
	fassert(self._interfaces[interface_name], "Requesting unknown interface %q", interface_name)

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
	local mirror = self._backend_mirror

	if mirror then
		local read_only_data = mirror:get_read_only_data()
		local value = read_only_data[key]

		return value
	end

	return nil
end

BackendManagerPlayFab.disable = function (self)
	print("[BackendManagerPlayFab] Backend Disabled")

	self._disable_backend = true

	self:_destroy_backend()
	self:_create_interfaces(true)

	self._should_disable = false
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

BackendManagerPlayFab._update_state = function (self)
	local settings = GameSettingsDevelopment.backend_settings
	local signin = self._backend_signin

	if (not settings.allow_backend or self._local_save_loaded) and self._need_signin then
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

BackendManagerPlayFab._update_error_handling = function (self, dt)
	if #self._errors > 0 and not self._error_dialog and not self._is_disconnected and not DEDICATED_SERVER then
		local error_data = table.remove(self._errors, 1)

		self:_show_error_dialog(error_data.reason, error_data.details)
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

			if result == self._button_disconnected then
				self._is_disconnected = true
			elseif result == self._button_retry then
				self._is_disconnected = true
			elseif result == self._button_quit then
				Application.quit()
			elseif result == self._button_restart then
				self._is_disconnected = true
			elseif result == self._button_local_backend then
				self._should_disable = true
			end
		end
	end
end

BackendManagerPlayFab._update_interface = function (self, interface_name, dt)
	local interface = self._interfaces[interface_name]
	local backend_mirror = self._backend_mirror

	if interface and interface.update and (backend_mirror or interface.is_local) then
		interface:update(dt)
	end
end

BackendManagerPlayFab.update = function (self, dt)
	if self._should_disable then
		self:disable()

		return
	end

	local settings = GameSettingsDevelopment.backend_settings
	local signin = self._backend_signin
	local mirror = self._backend_mirror
	local queue = self._data_server_queue
	local error_data = nil

	if mirror then
		error_data = mirror:update(dt)
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

BackendManagerPlayFab.signed_in = function (self)
	local signin = self._backend_signin

	if self:is_local() or (signin and signin:authenticated()) then
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
		local reason_key = self:_reason_localize_key(reason)

		return Localize(reason_key)
	end
end

BackendManagerPlayFab._post_error = function (self, error_data, crashify_override)
	ScriptApplication.send_to_crashify("Backend_Error", "ERROR: %s", crashify_override or error_data.details)

	local queue = self._data_server_queue

	if queue then
		queue:clear()
	end

	fassert(error_data.reason, "Posting error without reason, %q: %q", error_data.reason or "nil")

	if DEDICATED_SERVER then
		cprintf("Playfab error: %s, %s", error_data.reason, error_data.details)
	end

	print("[BackendManagerPlayFab] adding error:", error_data.reason, error_data.details)

	self._errors[#self._errors + 1] = error_data
	self._in_error_state = self:_is_fatal(error_data.reason)
end

BackendManagerPlayFab._is_fatal = function (self, reason)
	local harmless = reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ACHIEVEMENT_REWARD_CLAIMED or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_QUEST_REFRESH_UNAVAILABLE

	return not harmless
end

BackendManagerPlayFab._reason_localize_key = function (self, reason)
	if PLATFORM == "xb1" or PLATFORM == "ps4" then
		if not self:profiles_loaded() then
			if rawget(_G, "Backend") and reason == Backend.ERR_AUTH then
				if PLATFORM == "xb1" then
					return "backend_err_auth_xb1"
				else
					return "backend_err_auth_ps4"
				end
			elseif reason == BACKEND_LUA_ERRORS.ERR_SIGNIN_TIMEOUT then
				return "backend_err_signin_timeout"
			elseif reason == BACKEND_LUA_ERRORS.ERR_REQUEST_TIMEOUT then
				return "connection_timeout"
			else
				return "backend_err_connecting"
			end
		else
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
			return "backend_err_playfab"
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_EAC_ERROR then
			return "backend_err_playfab_eac"
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_COMMIT_TIMEOUT then
			return "backend_err_request_timeout"
		else
			return "backend_err_connecting"
		end
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_EAC_ERROR or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_COMMIT_TIMEOUT then
		return ERROR_CODES[reason]
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ACHIEVEMENT_REWARD_CLAIMED or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_QUEST_REFRESH_UNAVAILABLE then
		return ERROR_CODES[reason]
	else
		return "backend_err_network"
	end
end

BackendManagerPlayFab._format_error_message_console = function (self, reason)
	local button = {
		id = self._button_retry,
		text = Localize("button_ok")
	}

	return self:_reason_localize_key(reason), button
end

BackendManagerPlayFab._format_error_message_windows = function (self, reason)
	local error_text = self:_reason_localize_key(reason)
	local button_1, button_2 = nil

	if not self:profiles_loaded() then
		button_1 = {
			id = self._button_quit,
			text = Localize("menu_quit")
		}

		if GameSettingsDevelopment.backend_settings.allow_local then
			button_2 = {
				id = self._button_local_backend,
				text = Localize("backend_button_local")
			}
		end

		print("backend error", reason, ERROR_CODES[reason])
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_EAC_ERROR or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_COMMIT_TIMEOUT then
		button_1 = {
			id = self._button_quit,
			text = Localize("menu_quit")
		}
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ACHIEVEMENT_REWARD_CLAIMED or reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_QUEST_REFRESH_UNAVAILABLE then
		button_1 = {
			id = self._button_ok,
			text = Localize("button_ok")
		}
	else
		button_1 = {
			id = self._button_disconnected,
			text = Localize("button_ok")
		}
	end

	return error_text, button_1, button_2
end

BackendManagerPlayFab._show_error_dialog = function (self, reason, details_message)
	print(string.format("[BackendManagerPlayFab] Showing error dialog: %q, %q", reason or "nil", details_message or "nil"))

	local error_topic = Localize("backend_error_topic")
	local error_text, button_1, button_2 = nil

	if PLATFORM == "xb1" or PLATFORM == "ps4" then
		error_text, button_1 = self:_format_error_message_console(reason)
	else
		error_text, button_1, button_2 = self:_format_error_message_windows(reason)
	end

	local localized_error_text = Localize(error_text)

	if details_message and PLATFORM == "win32" then
		localized_error_text = localized_error_text .. " : " .. details_message
	end

	if button_2 then
		self._error_dialog = Managers.popup:queue_popup(localized_error_text, error_topic, button_1.id, button_1.text, button_2.id, button_2.text)
	else
		self._error_dialog = Managers.popup:queue_popup(localized_error_text, error_topic, button_1.id, button_1.text)
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
		local user_data = self._backend_mirror:get_user_data()

		return user_data[key]
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

	if PLATFORM == "win32" then
		return rawget(_G, "Steam") ~= nil or DEDICATED_SERVER
	elseif PLATFORM == "xb1" then
		return true
	elseif PLATFORM == "ps4" then
		return true
	end

	return false
end

BackendManagerPlayFab.commit = function (self, skip_queue, commit_complete_callback)
	if self._local_save_loaded then
		local function save_callback(info)
			if info.error then
				Application.warning("save error %q", info.error)
			end
		end

		if PLATFORM == "win32" then
			Managers.save:auto_save(self._local_backend_file_name, self._save_data, save_callback)
		elseif PLATFORM == "ps4" then
			Managers.save:auto_save(SaveFileName, SaveData, save_callback)
		end
	end

	if self._backend_mirror then
		return self._backend_mirror:commit(skip_queue, commit_complete_callback)
	end
end

BackendManagerPlayFab.has_loaded = function (self)
	return self._local_save_loaded
end

BackendManagerPlayFab.profiles_loaded = function (self)
	local signin = self._backend_signin
	local mirror = self._backend_mirror
	local ready = (self._disable_backend or (signin and signin:authenticated() and mirror and mirror:ready())) and self:_interfaces_ready()

	return ready
end

BackendManagerPlayFab._interfaces_ready = function (self)
	if not self._interfaces_created then
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

BackendManagerPlayFab._load_save_data = function (self, local_backend_data, local_backend_save_version)
	local platform = PLATFORM

	if platform == "win32" then
		local function load_callback(info)
			local save_data_version = info.data and info.data.save_data_version

			if info.error or not save_data_version or save_data_version ~= local_backend_save_version then
				Application.warning("Local backend load error %q", info.error or "save data format has changed")

				self._save_data = table.clone(local_backend_data)
			elseif self:_verify_data(info.data) then
				self._save_data = info.data
			else
				print("Broken (local) save, replacing with default")

				self._save_data = table.clone(local_backend_data)
			end

			self._local_save_loaded = true
		end

		Managers.save:auto_load(self._local_backend_file_name, load_callback)
	elseif platform == "xb1" or platform == "ps4" then
		if not SaveData.local_backend_save or script_data.honduras_demo then
			SaveData.local_backend_save = table.clone(local_backend_data)
		end

		if (SaveData.user_settings and SaveData.user_settings.development_settings and SaveData.user_settings.development_settings.all_items_of_rarity) or script_data.all_items_of_rarity then
			local rarity = (SaveData.user_settings and SaveData.user_settings.development_settings.all_items_of_rarity) or script_data.all_items_of_rarity
			local items_to_add = XBoxItemsByRarity[rarity]

			for _, item in ipairs(items_to_add) do
				SaveData.local_backend_save.items[#SaveData.local_backend_save.items + 1] = item
			end
		end

		self._save_data = SaveData.local_backend_save
		self._local_save_loaded = true
	end
end

BackendManagerPlayFab._verify_data = function (self, data)
	local valid = true

	for _, item in pairs(data.items) do
		local item_data = rawget(ItemMasterList, item.key)

		if not item_data then
			print("Save data missing item", item.key)

			valid = false
		end
	end

	return valid
end

BackendManagerPlayFab.implementation = function (self)
	return self._backend_implementation
end

BackendManagerPlayFab._create_session_interface = function (self, settings, force_local)
	if force_local or not settings.enable_sessions then
		self._interfaces.session = BackendInterfaceSessionLocal:new(self._save_data)
	else
		self._interfaces.session = BackendInterfaceSessionLocal:new(self._save_data)
	end
end

BackendManagerPlayFab._create_items_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.items = BackendInterfaceItemLocal:new(self._save_data)
	else
		local implementation = self._backend_implementation

		if implementation == "playfab" then
			self._interfaces.items = BackendInterfaceItemPlayfab:new(self._backend_mirror)
		elseif implementation == "fishtank" then
			self._interfaces.items = BackendInterfaceItem:new()
		end
	end
end

BackendManagerPlayFab._create_boons_interface = function (self, settings, force_local)
	if settings.quests_enabled then
		if force_local then
			self._interfaces.boons = BackendInterfaceBoonsLocal:new(self._save_data)
		else
			self._interfaces.boons = BackendInterfaceBoonsLocal:new(self._save_data)
		end
	end
end

BackendManagerPlayFab._create_quests_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.quests = BackendInterfaceQuestsLocal:new(self._save_data)
	else
		local implementation = self._backend_implementation

		if implementation == "playfab" then
			self._interfaces.quests = BackendInterfaceQuestsPlayfab:new(self._backend_mirror)
		elseif implementation == "fishtank" then
			self._interfaces.quests = BackendInterfaceQuests:new()
		end
	end
end

BackendManagerPlayFab._create_crafting_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.crafting = BackendInterfaceCraftingLocal:new(self._save_data)
	else
		local implementation = self._backend_implementation

		if implementation == "playfab" then
			self._interfaces.crafting = BackendInterfaceCraftingPlayfab:new(self._backend_mirror)
		elseif implementation == "fishtank" then
			self._interfaces.crafting = BackendInterfaceCrafting:new()
		end
	end
end

BackendManagerPlayFab._create_talents_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.talents = BackendInterfaceTalentsLocal:new(self._save_data)
	else
		local implementation = self._backend_implementation

		if implementation == "playfab" then
			self._interfaces.talents = BackendInterfaceTalentsPlayfab:new(self._backend_mirror)
		elseif implementation == "fishtank" then
			self._interfaces.talents = BackendInterfaceTalents:new()
		end
	end
end

BackendManagerPlayFab._create_loot_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.loot = BackendInterfaceLootLocal:new(self._save_data)
	else
		local implementation = self._backend_implementation

		if implementation == "playfab" then
			self._interfaces.loot = BackendInterfaceLootPlayfab:new(self._backend_mirror)
		elseif implementation == "fishtank" then
			self._interfaces.loot = BackendInterfaceLootLocal:new(self._save_data)
		end
	end
end

BackendManagerPlayFab._create_profile_hash_interface = function (self, settings, force_local)
	if force_local then
	end
end

BackendManagerPlayFab._create_common_interface = function (self, settings, force_local)
	self._interfaces.common = BackendInterfaceCommon:new()
end

BackendManagerPlayFab._create_title_properties_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.title_properties = BackendInterfaceTitlePropertiesLocal:new(self._save_data)
	end
end

BackendManagerPlayFab._create_hero_attributes_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.hero_attributes = BackendInterfaceHeroAttributesLocal:new(self._save_data)
	else
		local implementation = self._backend_implementation

		if implementation == "playfab" then
			self._interfaces.hero_attributes = BackendInterfaceHeroAttributesPlayFab:new(self._backend_mirror)
		elseif implementation == "fishtank" then
			self._interfaces.hero_attributes = BackendInterfaceHeroAttributesLocal:new(self._save_data)
		end
	end
end

BackendManagerPlayFab._create_statistics_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.statistics = BackendInterfaceStatisticsLocal:new(self._save_data)
	else
		self._interfaces.statistics = BackendInterfaceStatisticsPlayFab:new(self._backend_mirror)
	end
end

BackendManagerPlayFab._create_keep_decorations_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.keep_decorations = BackendInterfaceKeepDecorationsLocal:new(self._save_data)
	else
		self._interfaces.keep_decorations = BackendInterfaceKeepDecorationsPlayFab:new(self._backend_mirror)
	end
end

BackendManagerPlayFab._create_live_events_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.live_events = BackendInterfaceLiveEventsLocal:new(self._save_data)
	else
		self._interfaces.live_events = BackendInterfaceLiveEventsPlayfab:new(self._backend_mirror)
	end
end

BackendManagerPlayFab._create_console_dlc_rewards_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.console_dlc_rewards = BackendInterfaceConsoleDlcRewardsLocal:new(self._save_data)
	else
		self._interfaces.console_dlc_rewards = BackendInterfaceConsoleDlcRewardsPlayfab:new(self._backend_mirror)
	end
end

return
