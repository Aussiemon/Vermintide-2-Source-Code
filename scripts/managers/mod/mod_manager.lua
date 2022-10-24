require("scripts/managers/mod/mod_shim")

ModManager = class(ModManager)

ModManager.init = function (self, boot_gui)
	self._mods = {}
	self._num_mods = nil
	self._state = "not_loaded"
	self._settings = Application.user_setting("mod_settings") or {
		toposort = false,
		log_level = 1,
		developer_mode = false
	}
	self._chat_print_buffer = {}
	self._reload_data = {}
	self._gui = boot_gui
	self._ui_time = 0
	self._network_callbacks = {}
	local in_modded_realm = script_data["eac-untrusted"]

	Crashify.print_property("realm", (in_modded_realm and "modded") or "official")

	if rawget(_G, "Presence") then
		Presence.set_presence("status", (in_modded_realm and "Modded Realm") or "Official Realm")
	end

	ModShim.start()

	local has_enabled_mods = self:_has_enabled_mods()
	local is_bundled = Application.bundled()

	printf("[ModManager] Mods enabled: %s // Bundled: %s", has_enabled_mods, is_bundled)

	if has_enabled_mods and is_bundled then
		print("[ModManager] Fetching mod metadata ...")

		if in_modded_realm then
			self._mod_metadata = {}
			self._state = "fetching_metadata"
		else
			self:_fetch_mod_metadata()
		end
	else
		self._state = "done"
		self._num_mods = 0
	end
end

ModManager.developer_mode_enabled = function (self)
	return self._settings.developer_mode
end

ModManager._draw_state_to_gui = function (self, gui, dt)
	local state = self._state
	local t = self._ui_time + dt
	self._ui_time = t
	local status_str = "Loading mods"

	if state == "scanning" then
		status_str = "Scanning for mods"
	elseif state == "loading" then
		local mod = self._mods[self._mod_load_index]
		status_str = string.format("Loading mod %q", mod.name)
	elseif state == "fetching_metadata" then
		status_str = "Fetching mod metadata"
	end

	Gui.text(gui, status_str .. string.rep(".", (2 * t) % 4), "materials/fonts/arial", 16, nil, Vector3(5, 10, 1))
end

ModManager.remove_gui = function (self)
	assert(self._gui, "Trying to remove gui without setting gui first.")

	self._gui = nil
end

ModManager._has_enabled_mods = function (self, in_modded_realm)
	local mod_settings = Application.user_setting("mods")

	if not mod_settings then
		return false
	end

	for i = 1, #mod_settings, 1 do
		if mod_settings[i].enabled then
			return true
		end
	end

	return false
end

local Keyboard = Keyboard
local BUTTON_INDEX_R = Keyboard.button_index("r")
local BUTTON_INDEX_LEFT_SHIFT = Keyboard.button_index("left shift")
local BUTTON_INDEX_LEFT_CTRL = Keyboard.button_index("left ctrl")

ModManager._check_reload = function (self)
	return Keyboard.pressed(BUTTON_INDEX_R) and Keyboard.button(BUTTON_INDEX_LEFT_SHIFT) + Keyboard.button(BUTTON_INDEX_LEFT_CTRL) == 2
end

ModManager.update = function (self, dt)
	local chat_print_buffer = self._chat_print_buffer
	local num_delayed_prints = #chat_print_buffer

	if num_delayed_prints > 0 and Managers.chat then
		for i = 1, num_delayed_prints, 1 do
			Managers.chat:add_local_system_message(1, chat_print_buffer[i], true)

			chat_print_buffer[i] = nil
		end
	end

	local old_state = self._state

	if self._settings.developer_mode and self:_check_reload() then
		self._reload_requested = true
	end

	if self._reload_requested and self._state == "done" then
		self:_reload_mods()
	end

	if self._state == "done" then
		for i = 1, self._num_mods, 1 do
			local mod = self._mods[i]

			if mod and mod.enabled and not mod.callbacks_disabled then
				self:_run_callback(mod, "update", dt)
			end
		end
	elseif self._state == "fetching_metadata" then
		if self._mod_metadata then
			self:_start_scan()
		end
	elseif self._state == "scanning" and not Mod.is_scanning() then
		local mod_handles = Mod.mods()

		self:_build_mod_table(mod_handles)

		self._state = self:_load_mod(1)
		self._ui_time = 0
	elseif self._state == "loading" then
		local handle = self._loading_resource_handle

		if ResourcePackage.has_loaded(handle) then
			ResourcePackage.flush(handle)

			local mod = self._mods[self._mod_load_index]
			local next_index = mod.package_index + 1
			local mod_data = mod.data

			if next_index > #mod_data.packages then
				mod.state = "running"
				local ok, object = pcall(mod_data.run)

				if not ok then
					self:print("error", "%s", object)
				end

				local name = mod.name
				mod.object = object or {}

				self:_run_callback(mod, "init", self._reload_data[mod.id])
				self:print("info", "%s loaded.", name)

				self._state = self:_load_mod(self._mod_load_index + 1)
			else
				self:_load_package(mod, next_index)
			end
		end
	end

	local gui = self._gui

	if gui then
		self:_draw_state_to_gui(gui, dt)
	end

	if old_state ~= self._state then
		self:print("info", "%s -> %s", old_state, self._state)
	end
end

ModManager.all_mods_loaded = function (self)
	return self._state == "done"
end

ModManager.destroy = function (self)
	self:unload_all_mods()
end

ModManager._run_callback = function (self, mod, callback_name, ...)
	local object = mod.object
	local cb = object[callback_name]

	if not cb then
		return
	end

	local success, val = pcall(cb, object, ...)

	if success then
		return val
	else
		self:print("error", "%s", val or "[unknown error]")
		self:print("error", "Failed to run callback %q for mod %q with id %d. Disabling callbacks until reload.", callback_name, mod.name, mod.id)

		mod.callbacks_disabled = true
	end
end

ModManager._fetch_mod_metadata = function (self)
	local url = "http://cdn.fatsharkgames.se/mod_metadata.txt"
	local headers = {
		["User-Agent"] = "Warhammer: Vermintide 2"
	}

	Managers.curl:get(url, headers, callback(self, "_cb_mod_metadata"))

	self._state = "fetching_metadata"
end

ModManager._cb_mod_metadata = function (self, success, return_code, headers, data, userdata)
	printf("[ModManager] Metadata request completed. success=%s code=%s", success, return_code)

	local mod_metadata = {}

	if success and return_code >= 200 and return_code < 300 then
		local line_number = 0

		for line in string.gmatch(data, "[^\n\r]+") do
			line_number = line_number + 1
			line = string.gsub(line, "#(.*)$", "")

			if line ~= "" then
				local key, value = string.match(line, "(%d+)%s*=%s*(%w+)")

				if key then
					printf("[ModManager] Metadata set: [%s] = %s", key, value)

					mod_metadata[key] = value
				else
					printf("[ModManager] Malformed metadata entry near line %d", line_number)
				end
			end
		end
	end

	self._mod_metadata = mod_metadata
end

ModManager._start_scan = function (self)
	self:print("info", "Starting mod scan")

	self._state = "scanning"

	Mod.start_scan(not script_data["eac-untrusted"])
end

ModManager._build_mod_table = function (self, mod_handles)
	fassert(table.is_empty(self._mods), "Trying to add mods to non-empty mod table")

	local user_settings_mod_list = Application.user_setting("mods") or {}

	if self._settings.toposort then
		user_settings_mod_list = self:_topologically_sorted(user_settings_mod_list)
	end

	table.dump(mod_handles, "mod_handles", 3)

	local mod_metadata = self._mod_metadata

	print("user_setting.mods =>")

	for i, mod_data in ipairs(user_settings_mod_list) do
		local id = mod_data.id or -9999
		local handle = mod_handles[id]
		local enabled = mod_data.enabled

		if not handle then
			self:print("warning", "Mod %q with id %d was not found in the workshop folder.", mod_data.name, id)
			self:print("warning", "Did you try loading an unsanctioned mod in Official?")

			enabled = false
		end

		local metadata = mod_metadata[id]

		if enabled and metadata then
			local last_updated_string = mod_data.last_updated
			local month, day, year, hour, minute, second, am_pm = string.match(last_updated_string, "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+) ([AP]M)")

			if month then
				if am_pm == "PM" then
					hour = tonumber(hour) + 12
				end

				local last_updated = string.format("%04d%02d%02dT%02d%02d%02dZ", year, month, day, hour, minute, second)

				printf("[ModManager] id=%s last_updated=%s metadata=%s", id, last_updated, metadata)

				if last_updated < metadata then
					enabled = false
				end
			else
				printf("[ModManager] Could not parse date for %s", id)

				enabled = false
			end
		end

		self._mods[i] = {
			state = "not_loaded",
			callbacks_disabled = false,
			id = id,
			name = mod_data.name,
			enabled = enabled,
			handle = handle,
			loaded_packages = {}
		}
	end

	for i, mod_data in ipairs(user_settings_mod_list) do
		printf("[ModManager] mods[%d] = (id=%d, name=%q, enabled=%q, last_updated=%q)", i, mod_data.id, mod_data.name, mod_data.enabled, mod_data.last_updated)
	end

	self._num_mods = #self._mods

	self:print("info", "Found %i mods", #self._mods)
end

ModManager._load_mod = function (self, index)
	self._ui_time = 0
	local mods = self._mods
	local mod = mods[index]

	while mod and not mod.enabled do
		index = index + 1
		mod = mods[index]
	end

	if not mod then
		table.clear(self._reload_data)

		return "done"
	end

	local id = mod.id
	local handle = mod.handle

	self:print("info", "loading mod %s", id)
	Profiler.start("load info")

	local info = Mod.info(handle)

	Profiler.stop("load info")
	self:print("spew", "<mod info>\n%s\n</mod info>", info)
	Crashify.print_property("modded", true)

	local chunk, err_msg = loadstring(info)

	if not chunk then
		self:print("error", "Syntax error in .mod file. Mod %q with id %d skipped.", mod.name, mod.id)
		self:print("info", err_msg)

		mod.enabled = false

		return self:_load_mod(index + 1)
	end

	local ok, data_or_error = pcall(chunk)

	if not ok then
		self:print("error", "Error in .mod file return table. Mod %q with id %d skipped.", mod.name, mod.id)
		self:print("info", data_or_error)

		mod.enabled = false

		return self:_load_mod(index + 1)
	end

	mod.data = data_or_error
	mod.name = mod.name or data_or_error.NAME or "Mod " .. id
	mod.state = "loading"

	Crashify.print_property(string.format("Mod:%s:%s", id, mod.name), true)

	self._mod_load_index = index

	self:_load_package(mod, 1)

	return "loading"
end

ModManager._load_package = function (self, mod, index)
	mod.package_index = index
	local package_name = mod.data.packages[index]

	if not package_name then
		return
	end

	Profiler.start("_load_package")
	self:print("info", "loading package %q", package_name)

	local resource_handle = Mod.resource_package(mod.handle, package_name)
	self._loading_resource_handle = resource_handle

	ResourcePackage.load(resource_handle)

	mod.loaded_packages[#mod.loaded_packages + 1] = resource_handle

	Profiler.stop("_load_package")
end

ModManager.unload_all_mods = function (self)
	if self._state ~= "done" then
		self:print("error", "Mods can't be unloaded, mod state is not \"done\". current: %q", self._state)

		return
	end

	self:print("info", "Unload all mod packages")

	for i = self._num_mods, 1, -1 do
		local mod = self._mods[i]

		if mod and mod.enabled then
			self:unload_mod(i)
		end

		self._mods[i] = nil
	end

	self._num_mods = nil
	self._state = "unloaded"
end

ModManager.unload_mod = function (self, index)
	local mod = self._mods[index]

	if mod then
		self:print("info", "Unloading %q.", mod.name)
		self:_run_callback(mod, "on_unload")

		for _, handle in ipairs(mod.loaded_packages) do
			Mod.release_resource_package(handle)
		end

		mod.state = "not_loaded"
	else
		self:print("error", "Mod index %i can't be unloaded, has not been loaded", index)
	end
end

ModManager._reload_mods = function (self)
	self:print("info", "reloading mods")

	for i = 1, self._num_mods, 1 do
		local mod = self._mods[i]

		if mod and mod.state == "running" then
			self:print("info", "reloading %s", mod.name)

			self._reload_data[mod.id] = self:_run_callback(mod, "on_reload")
		else
			self:print("info", "not reloading mod, state: %s", mod.state)
		end
	end

	self:unload_all_mods()
	self:_start_scan()

	self._reload_requested = false
end

ModManager.on_game_state_changed = function (self, status, state_name, state_object)
	if self._state == "done" then
		for i = 1, self._num_mods, 1 do
			local mod = self._mods[i]

			if mod and mod.enabled and not mod.callbacks_disabled then
				self:_run_callback(mod, "on_game_state_changed", status, state_name, state_object)
			end
		end
	else
		self:print("warning", "Ignored on_game_state_changed call due to being in state %q", self._state)
	end
end

ModManager._topologically_sorted = function (self, mod_list)
	local visited = {}
	local sorted = {}

	for _, mod_data in ipairs(mod_list) do
		if not visited[mod_data] then
			self:_visit(mod_list, visited, sorted, mod_data)
		end
	end

	return sorted
end

ModManager._visit = function (self, mod_list, visited, sorted, mod_data)
	self:print("debug", "Visiting mod %q with id %d", mod_data.name, mod_data.id)

	if visited[mod_data] then
		return mod_data.enabled
	end

	if visited[mod_data] ~= nil then
		self:print("error", "Dependency cycle detected at mod %q with id %d", mod_data.name, mod_data.id)

		return false
	end

	visited[mod_data] = false
	local enabled = mod_data.enabled or false
	slot6 = 1
	slot7 = mod_data.num_children or 0

	for i = slot6, slot7, 1 do
		local child_id = mod_data.children[j]
		local child_index = table.find_by_key(mod_list, "id", child_id)
		local child_mod_data = mod_list[child_index]

		if not child_mod_data then
			self:print("warning", "Mod with id %d not found", id)
		elseif not self:_visit(mod_list, visited, sorted, child_mod_data) and enabled then
			self:print("warning", "Disabled mod %q with id %d due to missing dependency %d.", mod_data.name, mod_data.id, child_id)

			enabled = false
		end
	end

	mod_data.enabled = enabled
	visited[mod_data] = true
	sorted[#sorted + 1] = mod_data

	return enabled
end

local LOG_LEVELS = {
	spew = 4,
	info = 3,
	warning = 2,
	error = 1
}

ModManager.print = function (self, level, str, ...)
	local message = string.format("[ModManager][" .. level .. "] " .. str, ...)
	local log_level = LOG_LEVELS[level] or 99

	if log_level <= 2 then
		print(message)
	end

	if log_level <= self._settings.log_level then
		self._chat_print_buffer[#self._chat_print_buffer + 1] = message
	end
end

ModManager.network_bind = function (self, port, callback)
	local ncbs = self._network_callbacks

	fassert(not ncbs[port], "Port %d already in use", port)

	ncbs[port] = callback
end

ModManager.network_unbind = function (self, port)
	local ncbs = self._network_callbacks

	fassert(ncbs[port], "Port %d not in use", port)

	ncbs[port] = nil
end

ModManager.network_is_occupied = function (self, port)
	return self._network_callbacks[port] ~= nil
end

ModManager.network_send = function (self, destination_peer_id, port, payload)
	if destination_peer_id == self._my_peer_id then
		Managers.state.network.network_transmit:queue_local_rpc("rpc_mod_user_data", port, payload)
	end

	local channel_id = PEER_ID_TO_CHANNEL[(self._is_server and destination_peer_id) or self._host_peer_id]

	if channel_id then
		RPC.rpc_mod_user_data(channel_id, self._my_peer_id, destination_peer_id, port, payload)
	end
end

ModManager.rpc_mod_user_data = function (self, relay_channel_id, source_peer_id, destination_peer_id, port, payload)
	if destination_peer_id == self._my_peer_id then
		local cb = self._network_callbacks[port]

		if cb then
			cb(source_peer_id, payload)
		end
	elseif self._is_server then
		local channel_id = PEER_ID_TO_CHANNEL[destination_peer_id]

		if channel_id then
			RPC.rpc_mod_user_data(channel_id, source_peer_id, destination_peer_id, port, payload)
		end
	end
end

ModManager.register_network_event_delegate = function (self, network_event_delegate)
	network_event_delegate:register(self, "rpc_mod_user_data")

	self._network_event_delegate = network_event_delegate
end

ModManager.unregister_network_event_delegate = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

ModManager.network_context_created = function (self, host_peer_id, my_peer_id, is_server)
	self._host_peer_id = host_peer_id
	self._my_peer_id = my_peer_id
	self._is_server = is_server
end

return
