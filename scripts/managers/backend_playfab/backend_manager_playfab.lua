require("scripts/managers/backend/backend_interface_common")
require("scripts/managers/backend/data_server_queue")
require("scripts/managers/backend_playfab/backend_interface_crafting_playfab")
require("scripts/managers/backend_playfab/backend_interface_item_playfab")
require("scripts/managers/backend_playfab/tutorial_backend/backend_interface_item_tutorial")
require("scripts/managers/backend_playfab/backend_interface_loot_playfab")
require("scripts/managers/backend_playfab/backend_interface_talents_playfab")
require("scripts/managers/backend_playfab/backend_interface_hero_attributes_playfab")
require("scripts/managers/backend_playfab/backend_interface_statistics_playfab")
require("scripts/managers/backend/script_backend")
require("scripts/managers/backend_playfab/script_backend_playfab")
require("scripts/managers/backend_playfab/script_backend_playfab_dedicated")
require("scripts/settings/equipment/item_master_list")
require("backend/error_codes")

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
	self._errors = {}
	self._button_retry = "button_ok"
	self._button_quit = "button_quit"
	self._button_local_backend = "button_local_backend"
	self._button_disconnected = "button_disconnected"

	if settings.allow_local then
		local local_backend_data = (Development.parameter("honduras_demo") and DefaultDemoLocalBackendData) or DefaultLocalBackendData
		local local_backend_save_version = (Development.parameter("honduras_demo") and DemoBackendSaveDataVersion) or BackendSaveDataVersion

		fassert(self._verify_data(self, local_backend_data), "Mismatch between (local) default equipment and ItemMasterList")

		self._local_backend_file_name = "backend_local"

		self._load_save_data(self, local_backend_data, local_backend_save_version)
	end

	return 
end
BackendManagerPlayFab.is_local = function (self)
	return self._disable_backend
end
BackendManagerPlayFab.reset = function (self)
	self._errors = {}
	self._is_disconnected = false

	self._destroy_backend(self)

	return 
end
BackendManagerPlayFab.signin = function (self, authentication_token)
	local available = self.available(self)
	local backend_plugin_loaded = self._backend_plugin_loaded(self)
	local allow_local = GameSettingsDevelopment.backend_settings.allow_local
	local use_backend = GameSettingsDevelopment.use_backend

	if not available or not backend_plugin_loaded or not use_backend then
		if allow_local then
			if use_backend and not available then
				local error_data = {
					reason = BACKEND_LUA_ERRORS.ERR_PLATFORM_SPECIFIC_INTERFACE_MISSING
				}

				self._post_error(self, error_data)

				return 
			else
				self._should_disable = true
			end
		elseif not backend_plugin_loaded then
			local error_data = {
				reason = BACKEND_LUA_ERRORS.ERR_LOADING_PLUGIN
			}

			self._post_error(self, error_data)

			return 
		elseif not use_backend then
			local error_data = {
				reason = BACKEND_LUA_ERRORS.ERR_USE_LOCAL_BACKEND_NOT_ALLOWED
			}

			self._post_error(self, error_data)

			return 
		else
			error("Bad backend combination")
		end
	end

	if self._should_disable then
		self.disable(self)

		return 
	end

	if self._backend_signin then
		self.reset(self)
	end

	print("[BackendManagerPlayFab] Backend Enabled")

	self._backend_signin = self._signin:new(authentication_token)
	self._need_signin = true
	self._signin_timeout = os.time() + TIMEOUT_SIGNIN

	return 
end
BackendManagerPlayFab.update_items = function (self, leader_peer_id)
	self._backend_mirror:update_items(leader_peer_id)
	self.dirtify_interfaces(self)

	return 
end
BackendManagerPlayFab._backend_plugin_loaded = function (self)
	if self._backend_implementation == "fishtank" then
		return rawget(_G, "Backend")
	elseif self._backend_implementation == "playfab" then
		return true
	end

	fassert(false, "unknown backend implementation set in backend settings")

	return 
end
BackendManagerPlayFab._create_interfaces = function (self, force_local)
	local settings = GameSettingsDevelopment.backend_settings

	self._create_items_interface(self, settings, force_local)
	self._create_crafting_interface(self, settings, force_local)
	self._create_talents_interface(self, settings, force_local)
	self._create_loot_interface(self, settings, force_local)
	self._create_common_interface(self, settings, force_local)
	self._create_hero_attributes_interface(self, settings, force_local)
	self._create_statistics_interface(self, settings, force_local)

	return 
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

	return 
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
			interface.make_dirty(interface)
		end
	end

	return 
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
BackendManagerPlayFab.disable = function (self)
	print("[BackendManagerPlayFab] Backend Disabled")

	self._disable_backend = true

	self._destroy_backend(self)
	self._create_interfaces(self, true)

	self._should_disable = false

	return 
end
BackendManagerPlayFab.start_tutorial = function (self)
	fassert(self._script_backend_items_backup == nil, "Tutorial already started")

	self._script_backend_items_backup = self._interfaces.items
	self._interfaces.items = BackendInterfaceItemTutorial:new()

	return 
end
BackendManagerPlayFab.stop_tutorial = function (self)
	fassert(self._script_backend_items_backup ~= nil, "Stopping tutorial without starting it")

	self._interfaces.items = self._script_backend_items_backup
	self._script_backend_items_backup = nil

	return 
end
BackendManagerPlayFab._update_state = function (self)
	Profiler.start("BackendManagerPlayFab update_state")

	local settings = GameSettingsDevelopment.backend_settings
	local signin = self._backend_signin

	if (not settings.allow_backend or self._local_save_loaded) and self._need_signin then
		local result_data = signin.update_signin(signin)

		if result_data then
			self._need_signin = false

			self._post_error(self, result_data)
		elseif signin.authenticated(signin) then
			local backend_mirror = self._backend_mirror

			if backend_mirror and backend_mirror.ready(backend_mirror) then
				self._need_signin = false
				local queue = self._server_queue:new()
				self._data_server_queue = queue

				self._create_interfaces(self, false)
			elseif not backend_mirror then
				local signin_result = signin.get_signin_result(signin)
				self._backend_mirror = self._mirror:new(signin_result)
			end
		elseif self._signin_timeout < os.time() then
			self._need_signin = false
			local error_data = {
				reason = BACKEND_LUA_ERRORS.ERR_SIGNIN_TIMEOUT
			}

			self._post_error(self, error_data)
		end
	end

	Profiler.stop("BackendManagerPlayFab update_state")

	return 
end
BackendManagerPlayFab._update_error_handling = function (self, dt)
	Profiler.start("BackendManagerPlayFab update_error_handling")

	if 0 < #self._errors and not self._error_dialog and not self._is_disconnected then
		local error_data = table.remove(self._errors, 1)

		self._show_error_dialog(self, error_data.reason, error_data.details)
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

	Profiler.stop("BackendManagerPlayFab update_error_handling")

	return 
end
BackendManagerPlayFab._update_interface = function (self, interface_name, dt)
	local interface = self._interfaces[interface_name]
	local backend_mirror = self._backend_mirror

	if interface and interface.update and (backend_mirror or interface.is_local) then
		interface.update(interface, dt)
	end

	return 
end
BackendManagerPlayFab.update = function (self, dt)
	if self._should_disable then
		self.disable(self)

		return 
	end

	local settings = GameSettingsDevelopment.backend_settings
	local signin = self._backend_signin
	local mirror = self._backend_mirror
	local queue = self._data_server_queue
	local error_data = nil

	if mirror then
		Profiler.start("ScriptBackend update")

		error_data = mirror.update(mirror, dt)

		Profiler.stop("ScriptBackend update")
	end

	if queue then
		queue.update(queue)

		error_data = error_data or queue.check_for_errors(queue)
	end

	local interfaces = self._interfaces

	if settings.enable_sessions then
		self._update_interface(self, "session", dt)
	end

	self._update_interface(self, "items", dt)
	self._update_interface(self, "crafting", dt)
	self._update_interface(self, "talents", dt)
	self._update_interface(self, "loot", dt)

	if settings.quests_enabled then
		self._update_interface(self, "boons", dt)
		self._update_interface(self, "quests", dt)
	end

	if signin then
		self._update_state(self)

		if settings.enable_sessions then
			error_data = error_data or interfaces.session:check_for_errors()
		end

		if error_data then
			self._post_error(self, error_data)
		end
	end

	self._update_error_handling(self, dt)

	return 
end
BackendManagerPlayFab.playfab_api_error = function (self, result)
	table.dump(result, nil, 10)

	local error_data = {
		reason = BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR
	}

	self._post_error(self, error_data)

	return 
end
BackendManagerPlayFab.signed_in = function (self)
	local signin = self._backend_signin

	if self.is_local(self) or (signin and signin.authenticated(signin)) then
		return true
	end

	return false
end
BackendManagerPlayFab.authenticated = function (self)
	local signin = self._backend_signin
	local mirror = self._backend_mirror

	return signin and signin.authenticated(signin) and mirror and mirror.ready(mirror)
end
BackendManagerPlayFab._post_error = function (self, error_data)
	ScriptApplication.send_to_crashify("Backend_Error", "ERROR: %s", error_data.details)

	local queue = self._data_server_queue

	if queue then
		queue.clear(queue)
	end

	fassert(error_data.reason, "Posting error without reason, %q: %q", error_data.reason or "nil")
	print("[BackendManagerPlayFab] adding error:", error_data.reason, error_data.details)

	if not self._error_dialog and not self._is_disconnected then
		if DEDICATED_SERVER then
			cprint("Playfab error:", error_data.reason, error_data.details)
		else
			self._show_error_dialog(self, error_data.reason, error_data.details)
		end
	else
		self._errors[#self._errors + 1] = error_data
	end

	return 
end
BackendManagerPlayFab._format_error_message_console = function (self, reason, details_message)
	local button = {
		id = self._button_retry,
		text = Localize("button_ok")
	}

	if not self.profiles_loaded(self) then
		if rawget(_G, "Backend") and reason == Backend.ERR_AUTH then
			if PLATFORM == "xb1" then
				return "backend_err_auth_xb1", button
			else
				return "backend_err_auth_ps4", button
			end
		elseif reason == BACKEND_LUA_ERRORS.ERR_SIGNIN_TIMEOUT then
			return "backend_err_signin_timeout", button
		else
			return "backend_err_connecting", button
		end
	else
		return "backend_err_network", button
	end

	return 
end
BackendManagerPlayFab._format_error_message_windows = function (self, reason, details_message)
	local error_text, button_1, button_2 = nil

	if not self.profiles_loaded(self) then
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

		if rawget(_G, "Backend") and reason == Backend.ERR_AUTH then
			error_text = "backend_err_auth_steam"
		elseif reason == BACKEND_LUA_ERRORS.ERR_SIGNIN_TIMEOUT then
			error_text = "backend_err_signin_timeout"
		elseif reason == BACKEND_LUA_ERRORS.ERR_PLATFORM_SPECIFIC_INTERFACE_MISSING then
			error_text = "backend_err_steam_not_running"
		elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR then
			error_text = "backend_err_playfab"
		else
			error_text = "backend_err_connecting"
		end
	elseif reason == BACKEND_PLAYFAB_ERRORS.ERR_PLAYFAB_ERROR then
		button_1 = {
			id = self._button_quit,
			text = Localize("menu_quit")
		}
		error_text = "backend_err_playfab"
	else
		button_1 = {
			id = self._button_disconnected,
			text = Localize("button_ok")
		}
		error_text = "backend_err_network"
	end

	return error_text, button_1, button_2
end
BackendManagerPlayFab._show_error_dialog = function (self, reason, details_message)
	print(string.format("[BackendManagerPlayFab] Showing error dialog: %q, %q", reason or "nil", details_message or "nil"))

	local error_topic = Localize("backend_error_topic")
	local error_text, button_1, button_2 = nil

	if PLATFORM == "xb1" or PLATFORM == "ps4" then
		error_text, button_1 = self._format_error_message_console(self, reason, details_message)
	else
		error_text, button_1, button_2 = self._format_error_message_windows(self, reason, details_message)
	end

	local localized_error_text = Localize(error_text)

	if button_2 then
		self._error_dialog = Managers.popup:queue_popup(localized_error_text, error_topic, button_1.id, button_1.text, button_2.id, button_2.text)
	else
		self._error_dialog = Managers.popup:queue_popup(localized_error_text, error_topic, button_1.id, button_1.text)
	end

	return 
end
BackendManagerPlayFab.get_stats = function (self)
	if self._backend_mirror then
		return self._backend_mirror:get_stats()
	else
		return self._save_data.stats
	end

	return 
end
BackendManagerPlayFab.set_stats = function (self, stats)
	if self._backend_mirror then
		return self._backend_mirror:set_stats(stats)
	else
		self._save_data.stats = stats
	end

	return 
end
BackendManagerPlayFab.available = function (self)
	local settings = GameSettingsDevelopment.backend_settings

	if PLATFORM == "win32" then
		return rawget(_G, "Steam") ~= nil or DEDICATED_SERVER
	end

	return false
end
BackendManagerPlayFab.commit = function (self, skip_queue)
	if self._local_save_loaded then
		local function save_callback(info)
			if info.error then
				Application.warning("save error %q", info.error)
			end

			return 
		end

		if PLATFORM == "win32" then
			Managers.save:auto_save(self._local_backend_file_name, self._save_data, save_callback)
		elseif PLATFORM == "ps4" then
			Managers.save:auto_save(SaveFileName, SaveData, save_callback)
		end
	end

	if self._backend_mirror then
		return self._backend_mirror:commit(skip_queue)
	end

	return 
end
BackendManagerPlayFab.has_loaded = function (self)
	return self._local_save_loaded
end
BackendManagerPlayFab.profiles_loaded = function (self)
	local signin = self._backend_signin
	local mirror = self._backend_mirror
	local ready = (self._disable_backend or (signin and signin.authenticated(signin) and mirror and mirror.ready(mirror))) and self._interfaces_ready(self)

	return ready
end
BackendManagerPlayFab._interfaces_ready = function (self)
	local interfaces = self._interfaces

	for interface_name, interface in pairs(interfaces) do
		local ready = interface.ready(interface)

		if not ready then
			return false
		end
	end

	return true
end
BackendManagerPlayFab.refresh_log_level = function (self)
	print("[BackendManagerPlayFab] No backend to set log level on!")

	return 
end
BackendManagerPlayFab.logout = function (self)
	error("[BackendManagerPlayFab] Not implemented yet")

	return 
end
BackendManagerPlayFab.disconnect = function (self)
	error("[BackendManagerPlayFab] Not implemented yet")

	return 
end
BackendManagerPlayFab.destroy = function (self)
	if self._interfaces.quests then
		self._interfaces.quests:delete()
	end

	local backend_mirror = self._backend_mirror

	if backend_mirror then
		backend_mirror.wait_for_shutdown(backend_mirror, 1)
	end

	return 
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

			return 
		end

		Managers.save:auto_load(self._local_backend_file_name, load_callback)
	elseif platform == "xb1" or platform == "ps4" then
		if not SaveData.local_backend_save then
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

	return 
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

	return 
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

	return 
end
BackendManagerPlayFab._create_boons_interface = function (self, settings, force_local)
	if settings.quests_enabled then
		if force_local then
			self._interfaces.boons = BackendInterfaceBoonsLocal:new(self._save_data)
		else
			self._interfaces.boons = BackendInterfaceBoonsLocal:new(self._save_data)
		end
	end

	return 
end
BackendManagerPlayFab._create_quests_interface = function (self, settings, force_local)
	if settings.quests_enabled then
		if force_local then
			self._interfaces.quests = BackendInterfaceQuestsLocal:new(self._save_data)
		else
			self._interfaces.quests = BackendInterfaceQuestsLocal:new(self._save_data)
		end
	end

	return 
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

	return 
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

	return 
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

	return 
end
BackendManagerPlayFab._create_profile_hash_interface = function (self, settings, force_local)
	if force_local then
	end

	return 
end
BackendManagerPlayFab._create_common_interface = function (self, settings, force_local)
	self._interfaces.common = BackendInterfaceCommon:new()

	return 
end
BackendManagerPlayFab._create_title_properties_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.title_properties = BackendInterfaceTitlePropertiesLocal:new(self._save_data)
	end

	return 
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

	return 
end
BackendManagerPlayFab._create_statistics_interface = function (self, settings, force_local)
	if force_local then
		self._interfaces.statistics = BackendInterfaceStatisticsLocal:new(self._save_data)
	else
		self._interfaces.statistics = BackendInterfaceStatisticsPlayFab:new(self._backend_mirror)
	end

	return 
end

return 
