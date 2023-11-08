ImguiManager = class(ImguiManager)
ImguiKeymaps = {
	win32 = {
		toggle_imgui = {
			"keyboard",
			"f3",
			"pressed"
		}
	}
}

require("scripts/imgui/imgui_configuration_settings")

ImguiManager.init = function (self)
	self._open = false
	self._persistant_windows = 0
	self._guis_by_category = {}
	self._key_bindings = {}
	self._input_stack = 0

	for _, config in pairs(ImguiConfigurationSettings) do
		require(config.file)

		local class_object = _G[config.class]

		self:add_gui(class_object, config.category, config.name)
	end

	self:_load_settings()
end

local function sorted_index(list, name)
	for i = 1, #list do
		local list_name = list[i].name

		if list_name == name then
			return i, true
		elseif name < list_name then
			return i, false
		end
	end

	return #list + 1, false
end

ImguiManager._call_on_guis = function (self, func_name, ...)
	for _, category in pairs(self._guis_by_category) do
		for _, menu_item in pairs(category.list) do
			local gui = menu_item.gui
			local func = gui[func_name]

			if func then
				func(gui, ...)
			end
		end
	end
end

ImguiManager.add_gui = function (self, gui_class, category_name, name, enabled)
	local gui = gui_class:new()

	assert(gui.init)
	assert(gui.update)
	assert(gui.draw)
	assert(gui.is_persistent)

	local category_index, has_category = sorted_index(self._guis_by_category, category_name)

	if not has_category then
		table.insert(self._guis_by_category, category_index, {
			name = category_name,
			list = {}
		})

		self._key_bindings[category_name] = {}
	end

	local category_list = self._guis_by_category[category_index].list
	local gui_index = sorted_index(category_list, name)

	table.insert(category_list, gui_index, {
		gui = gui,
		name = name,
		enabled = enabled
	})

	local keybind_settings = self._key_bindings[category_name][name]

	if not keybind_settings then
		self._key_bindings[category_name][name] = {
			id = 0,
			keybind = {}
		}
	end

	local category_keybinds = self._key_bindings[category_name]

	for i, menu_item in pairs(category_list) do
		category_keybinds[menu_item.name].id = i
	end
end

ImguiManager.destroy = function (self)
	return self:_call_on_guis("destroy")
end

ImguiManager.set_open = function (self, bool)
	if bool ~= self._open then
		if bool then
			Imgui.open_imgui()
			self:_capture_input()
		else
			if self._persistant_windows == 0 then
				Imgui.close_imgui()
			end

			self:_release_input()

			self._settings = false
		end

		self._open = bool
	end
end

ImguiManager.update = function (self, t, dt)
	if Keyboard.pressed(Keyboard.button_index("f3")) then
		self:set_open(not self._open)
	end

	if self._open then
		self:update_main_menu()
	end

	self:update_guis(t, dt)
	self:_update_keybinds()
end

ImguiManager.post_update = function (self, t, dt)
	self:post_update_guis(t, dt)
end

ImguiManager.post_update_guis = function (self, t, dt)
	local prev_persistant = self._persistant_windows
	local is_open = self._open

	for _, category in pairs(self._guis_by_category) do
		for _, menu_item in pairs(category.list) do
			if menu_item.enabled then
				local gui = menu_item.gui

				if gui.post_update then
					gui:post_update(t, dt, is_open)

					if is_open or gui:is_persistent() or menu_item.opened_with_keybind then
						if gui:post_draw(is_open, t, dt) then
							self:_set_gui_enabled(menu_item, false)
						end

						self._persistant_windows = self._persistant_windows + 1
					end
				end
			end
		end
	end

	if not is_open and prev_persistant <= 0 and self._persistant_windows > 0 then
		Imgui.open_imgui()
	elseif not is_open and prev_persistant > 0 and self._persistant_windows <= 0 then
		Imgui.close_imgui()
	end
end

ImguiManager.update_main_menu = function (self)
	if Imgui.begin_main_menu_bar() then
		for _, category in pairs(self._guis_by_category) do
			local category_name = category.name
			local category_list = category.list

			if Imgui.begin_menu(category_name) then
				for _, menu_item in pairs(category_list) do
					local keybinds = self:_get_keybind_text(category_name, menu_item.name)

					if Imgui.menu_item(menu_item.name .. keybinds) then
						self:_set_gui_enabled(menu_item, not menu_item.enabled)
					end
				end

				Imgui.end_menu()
			end
		end

		if Imgui.menu_item("[Keybinds]") then
			self._settings = not self._settings
		end

		if Imgui.menu_item("[X]") then
			self:set_open(false)
		end

		Imgui.end_main_menu_bar()
	end
end

ImguiManager.update_guis = function (self, t, dt)
	local prev_persistant = self._persistant_windows
	self._persistant_windows = 0
	local is_open = self._open

	for _, category in pairs(self._guis_by_category) do
		for _, menu_item in pairs(category.list) do
			if menu_item.enabled then
				local gui = menu_item.gui

				gui:update(t, dt, is_open)

				if is_open or gui:is_persistent() or menu_item.opened_with_keybind then
					if gui:draw(is_open, t, dt) then
						self:_set_gui_enabled(menu_item, false)
					end

					self._persistant_windows = self._persistant_windows + 1
				end
			end
		end
	end

	if not is_open and prev_persistant <= 0 and self._persistant_windows > 0 then
		Imgui.open_imgui()
	elseif not is_open and prev_persistant > 0 and self._persistant_windows <= 0 then
		Imgui.close_imgui()
	end

	if self._settings then
		if self:_draw_keybind_settings() then
			self._settings = false
		end
	else
		self._rebind_action = nil
	end
end

ImguiManager.on_round_start = function (self, ...)
	return self:_call_on_guis("on_round_start", ...)
end

ImguiManager.on_round_end = function (self, ...)
	return self:_call_on_guis("on_round_end", ...)
end

ImguiManager.on_venture_start = function (self, ...)
	return self:_call_on_guis("on_venture_start", ...)
end

ImguiManager.on_venture_end = function (self, ...)
	return self:_call_on_guis("on_venture_end", ...)
end

ImguiManager._input_manager_do = function (self, method)
	local input_manager = Managers.input

	if input_manager then
		if not input_manager:get_input_service("imgui") then
			input_manager:create_input_service("imgui", "ImguiKeymaps")
			input_manager:map_device_to_service("imgui", "keyboard")
			input_manager:map_device_to_service("imgui", "gamepad")
			input_manager:map_device_to_service("imgui", "mouse")
		end

		input_manager[method](input_manager, ALL_INPUT_METHODS, 1, "imgui", "ImguiManager")
	end
end

ImguiManager._set_gui_enabled = function (self, menu_item, enabled, capture_input)
	if enabled then
		if menu_item.gui.on_show then
			menu_item.gui:on_show()
		end

		if capture_input then
			self:_capture_input()

			menu_item.opened_with_keybind = true
		end
	else
		if menu_item.gui.on_hide then
			menu_item.gui:on_hide()
		end

		if menu_item.opened_with_keybind then
			self:_release_input()

			menu_item.opened_with_keybind = false
		end
	end

	menu_item.enabled = enabled
end

ImguiManager._update_keybinds = function (self)
	for category, items in pairs(self._key_bindings) do
		for name, val in pairs(items) do
			local keybind = val.keybind
			local num_keys = #keybind

			if num_keys > 0 then
				local modifiers = true

				for i = 1, num_keys - 1 do
					local key_index = Keyboard.button_index(keybind[i])

					if not key_index or Keyboard.button(key_index) <= 0 then
						modifiers = false

						break
					end
				end

				if modifiers then
					local key_index = Keyboard.button_index(keybind[num_keys])

					if key_index and Keyboard.pressed(key_index) then
						local _, category = table.find_by_key(self._guis_by_category, "name", category)
						local menu_item = category.list[val.id]

						self:_set_gui_enabled(menu_item, not menu_item.enabled, true)
					end
				end
			end
		end
	end
end

ImguiManager._draw_keybind_settings = function (self)
	local do_close = Imgui.begin_window("Keybinds")

	Imgui.text("<esc> to clear keybind")

	for category, items in pairs(self._key_bindings) do
		Imgui.text(category)
		Imgui.tree_push(category)

		for name, val in pairs(items) do
			Imgui.tree_push(name)

			local keybind = val.keybind

			for i = 1, #keybind do
				local selected_for_rebind = self._rebind_action == name and self._rebind_category == category and self._rebind_id == i
				local button_name = selected_for_rebind and "<?>" or keybind[i]

				if Imgui.button(button_name) then
					self._rebind_id = i
					self._rebind_action = name
					self._rebind_category = category
				end

				Imgui.same_line()
			end

			if Imgui.button("+", 20, 20) then
				local new_id = #keybind + 1
				keybind[new_id] = ""
				self._rebind_id = new_id
				self._rebind_action = name
				self._rebind_category = category
			end

			Imgui.same_line()
			Imgui.text(name)
			Imgui.tree_pop()
		end

		Imgui.tree_pop()
	end

	if self._rebind_action then
		local input = Keyboard.any_pressed()

		if input then
			local input_name = Keyboard.button_name(input)
			local keybind = self._key_bindings[self._rebind_category][self._rebind_action].keybind

			if input_name == "esc" then
				table.remove(keybind, self._rebind_id)
			else
				keybind[self._rebind_id] = input_name
			end

			self._rebind_action = nil
			self._rebind_category = nil
			self._rebind_id = nil

			self:_save_settings()
		end
	end

	Imgui.end_window()

	return do_close
end

ImguiManager._get_keybind_text = function (self, category_name, menu_item)
	local keybind = self._key_bindings[category_name][menu_item].keybind
	local num_keybinds = #keybind

	if num_keybinds > 0 then
		local keybind_text = " ["

		for i = 1, num_keybinds do
			if i > 1 then
				keybind_text = keybind_text .. "+"
			end

			keybind_text = keybind_text .. keybind[i]
		end

		keybind_text = keybind_text .. "]"

		return string.upper(keybind_text)
	end

	return ""
end

ImguiManager._save_settings = function (self)
	Development.set_setting("ImguiManager_keybinds", self._key_bindings)
	Application.save_user_settings()
end

ImguiManager._load_settings = function (self)
	local keybinds = Development.setting("ImguiManager_keybinds") or {}

	for category, items in pairs(self._key_bindings) do
		local category_binds = keybinds[category]

		if category_binds then
			for name, val in pairs(items) do
				items[name].keybind = category_binds[name] and category_binds[name].keybind or items[name].keybind
			end
		end
	end
end

ImguiManager._capture_input = function (self)
	local input_stack = self._input_stack

	if input_stack == 0 then
		self:_input_manager_do("capture_input")
		ShowCursorStack.push()
		Imgui.enable_imgui_input_system(Imgui.KEYBOARD)
		Imgui.enable_imgui_input_system(Imgui.MOUSE)
		Imgui.enable_imgui_input_system(Imgui.GAMEPAD)
	end

	self._input_stack = input_stack + 1
end

ImguiManager._release_input = function (self)
	local input_stack = self._input_stack - 1

	assert(input_stack >= 0, "imgui input stack underflow")

	if input_stack == 0 then
		self:_input_manager_do("release_input")
		ShowCursorStack.pop()
		Imgui.disable_imgui_input_system(Imgui.KEYBOARD)
		Imgui.disable_imgui_input_system(Imgui.GAMEPAD)
		Imgui.disable_imgui_input_system(Imgui.MOUSE)
	end

	self._input_stack = input_stack
end

ImguiX = ImguiX or {}

ImguiX.color_edit_4 = function (label, a, r, g, b)
	r, g, b, a = Imgui.color_edit_4(label, r / 255, g / 255, b / 255, a / 255)

	return a * 255, r * 255, g * 255, b * 255
end

ImguiX.heading = function (key, fmt, ...)
	Imgui.text_colored(key .. ":", 200, 200, 255, 255)
	Imgui.same_line()
	Imgui.text(string.format(fmt, ...))
end

ImguiX.combo_search = function (index, search_results, search_text, data)
	local new_search_text = Imgui.input_text("Search", search_text)

	if new_search_text ~= search_text then
		search_results = {}
		local needle = string.gsub(string.lower(new_search_text), " ", ".-")

		for i, datum in ipairs(data) do
			if string.find(string.lower(datum), needle) then
				search_results[#search_results + 1] = datum
			end
		end

		index = -1
		search_text = new_search_text
	end

	index = Imgui.list_box("##element_select", index, search_results, 5)

	return index, search_results, search_text
end
