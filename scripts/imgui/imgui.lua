if not Imgui._FUNCTION_FIXES then
	Imgui._FUNCTION_FIXES = true
	local _combo = Imgui.combo

	Imgui.combo = function (label, item_idx, values, ...)
		return _combo(label, item_idx - 1, values, ...)
	end

	local _list_box = Imgui.list_box

	Imgui.list_box = function (label, item_idx, values, ...)
		return _list_box(label, item_idx - 1, values, ...)
	end
end

require("scripts/imgui/imgui_umbra_debug")
require("scripts/imgui/imgui_combat_log")
require("scripts/imgui/imgui_craft_item")
require("scripts/imgui/imgui_weapon_debug")
require("scripts/imgui/imgui_buffs_debug")
require("scripts/imgui/imgui_objectives_debug")
require("scripts/imgui/imgui_ai_spawn_log")
require("scripts/imgui/imgui_teleport_tool")
require("scripts/imgui/imgui_versus_character_picking_debug")
require("scripts/imgui/imgui_terror_event_debug")
require("scripts/imgui/imgui_behavior_tree")
require("scripts/imgui/imgui_spawning")
require("scripts/imgui/imgui_debug_menu")
require("scripts/imgui/imgui_unlock_override")
require("scripts/imgui/imgui_sound_debug")
require("scripts/imgui/imgui_career_debug")
require("scripts/imgui/imgui_localization")
require("scripts/imgui/imgui_call_interceptor")
require("scripts/imgui/imgui_weapon_editor")
require("scripts/imgui/imgui_ui_tool")

if IS_WINDOWS then
	require("scripts/imgui/imgui_lua_scratchpad")
	require("scripts/imgui/imgui_flamegraph")
	require("scripts/imgui/imgui_jit")
end

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

local function _call_on_guis(guis, func_name, ...)
	for _, category_guis in pairs(guis) do
		for i = 1, #category_guis, 1 do
			local gui = category_guis[i].gui

			if gui[func_name] then
				gui[func_name](gui, ...)
			end
		end
	end
end

ImguiManager.init = function (self)
	self._open = false
	self._persistant_windows = 0
	self._guis = {}
	self._key_bindings = {}

	self:add_gui(ImguiUmbraDebug, "World", "Umbra")
	self:add_gui(ImguiCombatLog, "Gameplay", "Combat Log")
	self:add_gui(ImguiCraftItem, "Gameplay", "Craft Item")
	self:add_gui(ImguiWeaponDebug, "Gameplay", "Weapon Debug")
	self:add_gui(ImguiBuffsDebug, "Gameplay", "Buffs Debug")
	self:add_gui(ImguiAISpawnLog, "Gameplay", "AI Spawn Log")
	self:add_gui(ImguiTeleportTool, "Gameplay", "Teleport Tool")
	self:add_gui(ImguiBehaviorTree, "Gameplay", "BT Debug")
	self:add_gui(ImguiServerBrowser, "Gameplay", "Server Browser")
	self:add_gui(ImguiTerrorEventDebug, "Gameplay", "Terror Event Debug")
	self:add_gui(ImguiSpawning, "Gameplay", "Spawn Breeds/Pickups")
	self:add_gui(ImguiSoundDebug, "Gameplay", "Sound Debug")
	self:add_gui(ImguiCareerDebug, "Gameplay", "Career Debug")
	self:add_gui(ImguiLocalization, "Tools", "Localization")
	self:add_gui(ImguiWeaponEditor, "Tools", "Weapon Editor")
	self:add_gui(ImguiUITool, "Tools", "UI Tool")
	self:add_gui(ImguiDebugMenu, "Debug", "Debug Menu 2.0")
	self:add_gui(ImguiUnlockOverride, "Debug", "Unlock Override")
	self:add_gui(ImguiCallInterceptor, "Debug", "Call Interceptor")

	if IS_WINDOWS then
		self:add_gui(ImguiLuaScratchpad, "Debug", "Lua Scratchpad")
		self:add_gui(ImguiJIT, "Debug", "JIT Debug")
		self:add_gui(ImguiFlamegraph, "Debug", "Flamegraph")
	end

	local mechanism_key = Managers.mechanism:current_mechanism_name()

	if mechanism_key == "versus" then
	end

	for _, dlc in pairs(DLCSettings) do
		local imgui_system_params = dlc.imgui_system_params or {}

		for _, params in pairs(imgui_system_params) do
			require(params.require)

			local gui_class = rawget(_G, params.gui)
			local category = params.category
			local name = params.name
			local enabled = params.enabled

			self:add_gui(gui_class:new(), category, name, enabled)
		end
	end

	self:_load_settings()
end

ImguiManager.add_gui = function (self, gui_class, category, name, enabled)
	local gui = gui_class:new()

	assert(gui.init)
	assert(gui.update)
	assert(gui.draw)
	assert(gui.is_persistent)

	if not self._guis[category] then
		self._guis[category] = {}
		self._key_bindings[category] = {}
	end

	local category_table = self._guis[category]
	local index = 1
	local max_index = #category_table

	while index <= max_index and category_table[index].name < name do
		index = index + 1
	end

	table.insert(category_table, index, {
		gui = gui,
		name = name,
		enabled = enabled
	})

	local keybind_settings = self._key_bindings[category][name]

	if keybind_settings then
		keybind_settings.id = #category_table
	else
		self._key_bindings[category][name] = {
			id = #category_table,
			keybind = {}
		}
	end
end

ImguiManager.destroy = function (self)
	_call_on_guis(self._guis, "destroy")
end

ImguiManager.update = function (self, t, dt)
	if Keyboard.pressed(Keyboard.button_index("f3")) then
		self._open = not self._open

		if self._open then
			Imgui.open_imgui()
			self:_capture_input()
		else
			if self._persistant_windows == 0 then
				Imgui.close_imgui()
			end

			self:_release_input()

			self._settings = false
		end
	end

	if self._open then
		self:update_main_menu()
	end

	self:update_guis(t, dt)
	self:_update_keybinds()
end

ImguiManager.update_main_menu = function (self)
	if Imgui.begin_main_menu_bar() then
		for category_name, category_guis in pairs(self._guis) do
			if Imgui.begin_menu(category_name) then
				for i = 1, #category_guis, 1 do
					local menu_item = category_guis[i]
					local keybinds = self:_get_keybind_text(category_name, menu_item.name)

					if Imgui.menu_item(menu_item.name .. keybinds) then
						menu_item.enabled = not menu_item.enabled

						if menu_item.enabled and menu_item.gui.on_show then
							menu_item.gui:on_show()
						elseif not menu_item.enabled and menu_item.gui.on_hide then
							menu_item.gui:on_hide()
						end
					end
				end

				Imgui.end_menu()
			end
		end

		if Imgui.menu_item("[Reload]") then
			Console.refresh()
			self:init()

			self._open = true
		end

		if Imgui.menu_item("[SETTINGS]") then
			self._settings = not self._settings
		end

		Imgui.end_main_menu_bar()
	end
end

ImguiManager.update_guis = function (self, t, dt)
	local prev_persistant = self._persistant_windows
	self._persistant_windows = 0
	local is_open = self._open

	for category_name, category_guis in pairs(self._guis) do
		for i = 1, #category_guis, 1 do
			local menu_item = category_guis[i]

			if menu_item.enabled then
				local gui = menu_item.gui

				gui:update(t, dt, is_open)

				if is_open or gui:is_persistent() then
					gui:draw(is_open, t, dt)

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
		self:_draw_keybind_settings()
	else
		self._rebind_action = nil
	end
end

ImguiManager.on_round_start = function (self, ...)
	_call_on_guis(self._guis, "on_round_start", ...)
end

ImguiManager.on_round_end = function (self, ...)
	_call_on_guis(self._guis, "on_round_end", ...)
end

ImguiManager.on_venture_start = function (self, ...)
	_call_on_guis(self._guis, "on_venture_start", ...)
end

ImguiManager.on_venture_end = function (self, ...)
	_call_on_guis(self._guis, "on_venture_end", ...)
end

ImguiManager._input_manager_do = function (self, method)
	local input_manager = Managers.input

	if input_manager then
		if not input_manager:get_service("imgui") then
			input_manager:create_input_service("imgui", "ImguiKeymaps")
			input_manager:map_device_to_service("imgui", "keyboard")
			input_manager:map_device_to_service("imgui", "gamepad")
			input_manager:map_device_to_service("imgui", "mouse")
		end

		input_manager[method](input_manager, {
			"keyboard",
			"gamepad",
			"mouse"
		}, 1, "imgui", "ImguiManager")
	end
end

ImguiManager._update_keybinds = function (self)
	for category, items in pairs(self._key_bindings) do
		for name, val in pairs(items) do
			local keybind = val.keybind
			local num_keys = #keybind

			if num_keys > 0 then
				local modifiers = true

				for i = 1, num_keys - 1, 1 do
					local key_index = Keyboard.button_index(keybind[i])

					if not key_index or Keyboard.button(key_index) <= 0 then
						modifiers = false

						break
					end
				end

				if modifiers then
					local key_index = Keyboard.button_index(keybind[num_keys])

					if key_index and Keyboard.pressed(key_index) then
						local category_guis = self._guis[category]
						local menu_item = category_guis[val.id]
						menu_item.enabled = not menu_item.enabled
					end
				end
			end
		end
	end
end

ImguiManager._draw_keybind_settings = function (self)
	Imgui.begin_window("Settings")
	Imgui.text("<esc> to clear keybind")

	for category, items in pairs(self._key_bindings) do
		Imgui.text(category)
		Imgui.tree_push(category)

		for name, val in pairs(items) do
			Imgui.tree_push(name)

			local keybind = val.keybind

			for i = 1, #keybind, 1 do
				local selected_for_rebind = self._rebind_action == name and self._rebind_category == category and self._rebind_id == i
				local button_name = (selected_for_rebind and "<?>") or keybind[i]

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
end

ImguiManager._get_keybind_text = function (self, category_name, menu_item)
	local keybind = self._key_bindings[category_name][menu_item].keybind
	local num_keybinds = #keybind

	if num_keybinds > 0 then
		local keybind_text = " ["

		for i = 1, num_keybinds, 1 do
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
				items[name].keybind = (category_binds[name] and category_binds[name].keybind) or items[name].keybind
			end
		end
	end
end

ImguiManager._capture_input = function (self)
	self:_input_manager_do("capture_input")
	ShowCursorStack.push()
	Imgui.enable_imgui_input_system(Imgui.KEYBOARD)
	Imgui.enable_imgui_input_system(Imgui.MOUSE)
	Imgui.enable_imgui_input_system(Imgui.GAMEPAD)
end

ImguiManager._release_input = function (self)
	self:_input_manager_do("release_input")
	ShowCursorStack.pop()
	Imgui.disable_imgui_input_system(Imgui.KEYBOARD)
	Imgui.disable_imgui_input_system(Imgui.GAMEPAD)
	Imgui.disable_imgui_input_system(Imgui.MOUSE)
end

return
