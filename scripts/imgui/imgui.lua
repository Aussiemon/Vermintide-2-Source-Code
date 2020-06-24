require("scripts/imgui/imgui_interface_alias")
require("scripts/imgui/imgui_umbra_debug")
require("scripts/imgui/imgui_combat_log")
require("scripts/imgui/imgui_craft_item")
require("scripts/imgui/imgui_weapon_debug")
require("scripts/imgui/imgui_buffs_debug")
require("scripts/imgui/imgui_ai_spawn_log")
require("scripts/imgui/imgui_teleport_tool")
require("scripts/imgui/imgui_behavior_tree")
require("scripts/imgui/imgui_spawning")
require("scripts/imgui/imgui_debug_menu")
require("scripts/imgui/imgui_lua_scratchpad")
require("scripts/imgui/imgui_jit")
require("scripts/imgui/imgui_ui_editor")
require("scripts/imgui/imgui_unlock_override")

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

ImguiManager.init = function (self)
	self._open = false
	self._persistant_windows = 0
	self._guis = {}
	script_data.imgui = script_data.imgui or {}

	self:add_gui(ImguiUmbraDebug:new(), "World", "Umbra")
	self:add_gui(ImguiCombatLog:new(), "Gameplay", "Combat Log")
	self:add_gui(ImguiCraftItem:new(), "Gameplay", "Craft Item")
	self:add_gui(ImguiWeaponDebug:new(), "Gameplay", "Weapon Debug")
	self:add_gui(ImguiBuffsDebug:new(), "Gameplay", "Buffs Debug")
	self:add_gui(ImguiAISpawnLog:new(), "Gameplay", "AI Spawn Log")
	self:add_gui(ImguiTeleportTool:new(), "Gameplay", "Teleport Tool")
	self:add_gui(ImguiBehaviorTree:new(), "Gameplay", "BT Debug")
	self:add_gui(ImguiSpawning:new(), "Gameplay", "Spawn Breeds/Pickups")
	self:add_gui(ImguiDebugMenu:new(), "Debug", "Debug Menu 2.0")
	self:add_gui(ImguiLuaScratchpad:new(), "Debug", "Lua Scratchpad")
	self:add_gui(ImguiJIT:new(), "Debug", "JIT Debug")
	self:add_gui(ImguiUIEditor:new(), "Tools", "Texture Viewer")
	self:add_gui(ImguiUnlockOverride:new(), "Debug", "Unlock Override")
end

ImguiManager.add_gui = function (self, gui, category, name, enabled)
	assert(gui.init)
	assert(gui.update)
	assert(gui.draw)
	assert(gui.is_persistent)

	if not self._guis[category] then
		self._guis[category] = {}
	end

	local category_table = self._guis[category]

	table.insert(category_table, {
		initialized = false,
		gui = gui,
		name = name,
		enabled = enabled
	})
end

ImguiManager.update = function (self)
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
		end
	end

	if self._open then
		self:update_main_menu()
	end

	self:update_guis()
end

ImguiManager.update_main_menu = function (self)
	if Imgui.begin_main_menu_bar() then
		for category_name, category_guis in pairs(self._guis) do
			if Imgui.begin_menu(category_name) then
				for i = 1, #category_guis, 1 do
					local menu_item = category_guis[i]

					if Imgui.menu_item(menu_item.name) then
						menu_item.enabled = not menu_item.enabled
					end
				end

				Imgui.end_menu()
			end
		end

		if Imgui.menu_item("Reload") then
			Console.refresh()
			self:init()

			self._open = true
		end

		Imgui.end_main_menu_bar()
	end
end

ImguiManager.update_guis = function (self)
	self._persistant_windows = 0
	local is_open = self._open

	for category_name, category_guis in pairs(self._guis) do
		for i = 1, #category_guis, 1 do
			local menu_item = category_guis[i]

			if menu_item.enabled then
				local gui = menu_item.gui

				if menu_item.enabled and not menu_item.initialized then
					menu_item.gui:init()

					menu_item.initialized = true
				end

				gui:update()

				if is_open or gui:is_persistent() then
					gui:draw(is_open)

					self._persistant_windows = self._persistant_windows + 1
				end
			end
		end
	end
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
