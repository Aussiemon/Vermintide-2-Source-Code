ModManager = class(ModManager)

local function mod_name(mod)
	return mod.name
end

local LOG_LEVELS = {
	[0] = {},
	{
		error = true
	},
	{
		warning = true,
		error = true
	},
	{
		warning = true,
		info = true,
		error = true
	},
	{
		spew = true,
		info = true,
		warning = true,
		error = true
	}
}

ModManager.print = function (self, level, str, ...)
	if LOG_LEVELS[self._settings.log_level][level] then
		local concat_str = sprintf("[ModManager][" .. level .. "] " .. str, ...)

		print(concat_str)

		if Managers.chat then
			Managers.chat:add_local_system_message(1, concat_str, true)
		else
			self._print_cache[#self._print_cache + 1] = concat_str
		end
	end
end

ModManager.init = function (self, boot_gui)
	self._mods = {}
	self._num_mods = nil
	self._state = "not_loaded"
	local settings = Application.user_setting("mod_settings") or {
		disable_pcalls = false,
		log_level = 1,
		developer_mode = false
	}
	self._settings = settings
	self._print_cache = {}
	self._gui = boot_gui
	self._ui_time = 0
	self._reload_data = {}
	local in_modded_realm = script_data["eac-untrusted"]

	if HAS_STEAM then
		if in_modded_realm then
			Presence.set_presence("status", "Modded Realm")
		else
			Presence.set_presence("status", "Official Realm")
		end
	end

	if self:_has_enabled_mods(in_modded_realm) and Application.bundled() then
		self:print("info", "Scanning for mods...")
		self:_start_scan()
	else
		self._state = "done"
		self._num_mods = 0
	end
end

ModManager.remove_gui = function (self)
	assert(self._gui, "Trying to remove gui without setting gui first.")

	self._gui = nil
end

ModManager._has_enabled_mods = function (self, in_modded_realm)
	local mod_settings = Application.user_setting("mods")

	if not mod_settings then
		return
	end

	for i, mod_data in ipairs(mod_settings) do
		if mod_data.enabled then
			return true
		end
	end

	return false
end

ModManager.state = function (self)
	return self._state
end

ModManager.update = function (self, dt)
	local print_cache = self._print_cache
	local num_delayed_prints = #print_cache

	if num_delayed_prints > 0 and Managers.chat then
		for i = 1, num_delayed_prints, 1 do
			Managers.chat:add_local_system_message(1, print_cache[i], true)
		end

		table.clear(print_cache)
	end

	local old_state = self._state

	if self._settings.developer_mode and Keyboard.pressed(Keyboard.button_index("r")) and Keyboard.button(Keyboard.button_index("left shift")) + Keyboard.button(Keyboard.button_index("left ctrl")) == 2 then
		self._reload_requested = true
	end

	if self._reload_requested and self._state == "done" then
		self:_reload_mods()
	end

	if self._state == "scanning" and not Mod.is_scanning() then
		local mod_handles = Mod.mods()

		self:_build_mod_table(mod_handles)
		table.dump(mod_handles, "Mods", 1)

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
				local on_loaded_func = nil
				mod.state = "running"
				local object = mod_data.run()
				local name = mod_name(mod)

				if object then
					mod.object = object

					self:_run_callback(mod, "init", self._reload_data[mod.id])
				else
					mod.object = {}

					self:print("warning", "Mod %s does not return callback table from run function", name)
				end

				self:print("info", "%s loaded.", name)

				self._state = self:_load_mod(self._mod_load_index + 1)
			else
				self:_load_package(mod, next_index)
			end
		end
	elseif self._state == "done" then
		for i = 1, self._num_mods, 1 do
			local mod = self._mods[i]

			if mod and mod.enabled and not mod.callbacks_disabled then
				self:_run_callback(mod, "update", dt)
			end
		end
	end

	local gui = self._gui

	if gui then
		local state = self._state
		self._ui_time = self._ui_time + dt
		local t = self._ui_time * 2
		local num_dots = math.floor(t % 4)
		local dots_string = ""

		for i = 1, num_dots, 1 do
			dots_string = dots_string .. "."
		end

		local pos = Vector3(5, 10, 1)
		local color = Color(255, 255, 255, 255)
		local size = 16
		local font = "core/performance_hud/debug"
		local font_material = "core/performance_hud/debug"

		if state == "scanning" then
			Gui.text(gui, "Scanning for mods" .. dots_string, font_material, size, font, pos, color)
		elseif state == "loading" then
			local str = string.format("Loading mod '%s'" .. dots_string, mod_name(self._mods[self._mod_load_index]))

			Gui.text(gui, str, font_material, size, font, pos, color)
		end
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

	if cb then
		if mod.disable_pcalls == true or (self._settings.disable_pcalls == true and mod.disable_pcalls ~= false) then
			return cb(object, ...)
		else
			local success, a, b, c, d = pcall(cb, object, ...)

			if success then
				return a, b, c, d
			else
				if a then
					local pcall_error = tostring(a):gsub("%%", "%%%%")

					self:print("error", pcall_error)
				end

				self:print("error", "Failed to run callback %q for mod %q. Disabling callbacks until reload.", callback_name, mod_name(mod))

				mod.callbacks_disabled = true
			end
		end
	end
end

ModManager._start_scan = function (self)
	self:print("info", "scanning")

	self._state = "scanning"

	Mod.start_scan(not script_data["eac-untrusted"])
end

ModManager._load_mod = function (self, index)
	self._ui_time = 0
	local mods = self._mods
	local mod = mods[index]

	while mod and not mod.enabled do
		index = index + 1
		mod = mods[index]
	end

	if mod then
		Crashify.print_property("modded", true)

		local id = mod.id
		local handle = mod.handle

		self:print("info", "loading mod %s", id)

		local info = Mod.info(handle)

		self:print("spew", "<mod info> \n%s\n<\\mod info>", info)

		local data_file, info_error = loadstring(info)

		if not data_file then
			self:print("error", "Syntax error in .mod file. Mod %q skipped.", mod_name(mod))
			self:print("info", info_error)

			mod.enabled = false

			return self:_load_mod(index + 1)
		end

		local success, data_or_error = pcall(data_file)

		if not success then
			self:print("error", "Error in .mod file return table. Mod %q skipped.", mod_name(mod))
			self:print("info", data_or_error)

			mod.enabled = false

			return self:_load_mod(index + 1)
		end

		mod.data = data_or_error
		mod.name = mod_name(mod) or data_or_error.NAME or "Mod " .. id
		mod.state = "loading"

		Crashify.print_property(string.format("Mod:%s:%s", id, mod_name(mod)), true)

		self._mod_load_index = index

		self:_load_package(mod, 1)

		return "loading"
	else
		table.clear(self._reload_data)

		return "done"
	end
end

ModManager._build_mod_table = function (self, mod_handles)
	fassert(table.is_empty(self._mods), "Trying to add mods to non-empty mod table")

	local index = 0
	local parsed_mods = {}

	local function add_mod(handle, id, enabled, name, version, user_settings_index)
		index = index + 1
		self._mods[index] = {
			state = "not_loaded",
			callbacks_disabled = false,
			name = name,
			version = version,
			id = id,
			handle = handle,
			enabled = enabled,
			loaded_packages = {},
			user_settings_index = user_settings_index
		}
	end

	local user_settings_mod_list = Application.user_setting("mods") or {}

	table.dump(user_settings_mod_list, "mod settings", 3)
	table.dump(mod_handles, "mod_handles", 3)

	for i, mod_data in ipairs(user_settings_mod_list) do
		local id = mod_data.id
		local handle = mod_handles[id]

		if handle then
			add_mod(handle, id, mod_data.enabled, mod_data.name, mod_data.version, i)

			parsed_mods[handle] = true
		else
			self:print("error", "Trying to load mod with steam id %s, not in downloaded list", id)
		end
	end

	for id, handle in pairs(mod_handles) do
		if not parsed_mods[handle] then
			add_mod(handle, id, false, "unnamed", "unversioned")
		end
	end

	self._num_mods = index

	self:print("info", "Found %i mods", index)

	local new_settings_table = {}

	for i = 1, self._num_mods, 1 do
		local mod = self._mods[i]
		local mod_data = nil

		if mod.user_settings_index then
			mod_data = user_settings_mod_list[mod.user_settings_index]
		else
			mod_data = {
				name = mod.name,
				id = mod.id,
				version = mod.version,
				enabled = mod.enabled or false
			}
		end

		new_settings_table[i] = mod_data
	end

	Application.set_user_setting("mods", new_settings_table)
	Application.save_user_settings()
end

ModManager._load_package = function (self, mod, index)
	mod.package_index = index
	local package_name = mod.data.packages[index]

	self:print("info", "loading package %q", package_name)

	local resource_handle = Mod.resource_package(mod.handle, package_name)
	self._loading_resource_handle = resource_handle

	ResourcePackage.load(resource_handle)

	mod.loaded_packages[#mod.loaded_packages + 1] = resource_handle
end

ModManager.unload_all_mods = function (self)
	if self._state == "done" then
		self:print("info", "Unload all mod packages")

		for i = self._num_mods, 1, -1 do
			local mod = self._mods[i]

			if mod and mod.enabled then
				self:unload_mod(i)
			end
		end

		table.clear(self._mods)

		self._num_mods = nil
		self._state = "unloaded"
	else
		self:print("error", "Mods can't be unloaded, mod state is not \"done\". current: %q", self._state)
	end
end

ModManager.unload_mod = function (self, index)
	local mod = self._mods[index]

	if mod then
		self:print("info", "Unloading %q.", mod_name(mod))
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
			self:print("info", "reloading %s", mod_name(mod))

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

return
