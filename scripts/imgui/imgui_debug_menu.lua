ImguiDebugMenu = class(ImguiDebugMenu)

local function cmp_setting_name(a, b)
	return a.setting_name < b.setting_name
end

local function cmp_name(a, b)
	return a.name < b.name
end

ImguiDebugMenu.init = function (self)
	self._needle = ""
	local settings = require("scripts/utils/debug_screen_config").settings
	local settings_by_category = {}

	for i, setting in ipairs(settings) do
		settings_by_category[setting.category] = settings_by_category[setting.category] or {}

		table.insert(settings_by_category[setting.category], setting)
	end

	self._settings = settings
	self._settings_categories = {}

	for name, list in pairs(settings_by_category) do
		table.sort(list, cmp_setting_name)
		table.insert(self._settings_categories, {
			name = name,
			list = list
		})
	end

	table.sort(self._settings_categories, cmp_name)

	self._options = {}
end

ImguiDebugMenu.update = function (self)
	return
end

local find = string.find
local lower = string.lower

local function ifind(h, n)
	return find(lower(h), lower(n))
end

ImguiDebugMenu._find_needle = function (self, setting, needle)
	return ifind(setting.setting_name, needle) or ifind(setting.description, needle) or ifind(setting.category, needle)
end

ImguiDebugMenu._find_needle_list = function (self, setting_list, needle)
	for i = 1, #setting_list, 1 do
		if self:_find_needle(setting_list[i], needle) then
			return true
		end
	end

	return false
end

ImguiDebugMenu.draw = function (self)
	Imgui.begin_window("DebugMenu")

	local needle = Imgui.input_text("Search", self._needle)
	self._needle = needle

	Imgui.begin_child_window("Settings", 0, 0, true)

	local no_matches = true

	for _, sc in pairs(self._settings_categories) do
		local category = sc.name
		local setting_list = sc.list

		if self:_find_needle_list(setting_list, needle) then
			no_matches = false

			if Imgui.collapsing_header(category, false) then
				for i = 1, #setting_list, 1 do
					local setting = setting_list[i]

					if self:_find_needle(setting, needle) then
						self:_show_debug_setting(setting)
					end
				end

				Imgui.tree_pop()
			end
		end
	end

	if no_matches then
		Imgui.text("No matches.")
	end

	Imgui.end_child_window()
	Imgui.end_window()
end

ImguiDebugMenu._set_setting = function (self, key, val)
	Development.set_setting(key, val)

	script_data[key] = val

	Development.clear_param_cache(key)
end

ImguiDebugMenu._show_debug_setting = function (self, setting)
	local setting_name = setting.setting_name

	Imgui.text(setting_name)

	if Imgui.is_item_hovered() then
		Imgui.begin_tool_tip()
		Imgui.text_colored(setting_name, 127, 127, 127, 255)
		Imgui.text(setting.description)
		Imgui.end_tool_tip()
	end

	Imgui.same_line(360 - Imgui.calculate_text_size(setting_name))
	Imgui.spacing(0)

	if setting.is_boolean then
		Imgui.same_line()

		local val = script_data[setting_name]

		if Imgui.radio_button("false##" .. setting_name, val == false) then
			val = false
		end

		Imgui.same_line()

		if Imgui.radio_button("true##" .. setting_name, val == true) then
			val = true
		end

		Imgui.same_line()

		if Imgui.small_button("Reset") then
			val = nil
		end

		self:_set_setting(setting_name, val)
	elseif setting.load_items_source_func or setting.item_source then
		Imgui.same_line()

		local options = nil

		if setting.load_items_source_func then
			options = self._options

			setting.load_items_source_func(options)
		else
			options = setting.item_source
		end

		local index = table.find(options, script_data[setting_name]) or 0

		Imgui.push_item_width(200)

		index = Imgui.combo("Choice", index, options)

		Imgui.pop_item_width()
		Imgui.same_line()

		if Imgui.small_button("Reset") then
			index = 0
		end

		self:_set_setting(setting_name, options[index])

		if setting.func then
			Imgui.same_line()

			if Imgui.small_button("Execute") then
				setting.func(options, index)
			end
		end
	elseif setting.preset then
		Imgui.same_line()

		if Imgui.small_button("Activate preset") then
			for k, v in pairs(setting.preset) do
				self:_set_setting(k, v)
			end
		end
	elseif setting.command_list then
		for _, def in ipairs(setting.command_list) do
			Imgui.same_line()

			if Imgui.small_button(def.description) then
				for _, cmd in ipairs(def.commands) do
					Application.console_command(unpack(cmd))
				end
			end
		end
	elseif setting.func then
		Imgui.same_line()

		if Imgui.small_button("Execute") then
			setting.func()
		end
	end
end

ImguiDebugMenu.is_persistent = function (self)
	return false
end

return
