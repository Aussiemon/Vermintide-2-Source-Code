require("scripts/imgui/imgui_umbra_debug")
require("scripts/imgui/imgui_combat_log")
require("scripts/imgui/imgui_craft_item")
require("scripts/imgui/imgui_weapon_debug")
require("scripts/imgui/imgui_buffs_debug")

ImguiManager = class(ImguiManager)

ImguiManager.init = function (self)
	self.open = false
	self.persistant_sub_windows = 0
	self.guis = {}

	self:add_gui(ImguiUmbraDebug:new(), "World", "Umbra")
	self:add_gui(ImguiCombatLog:new(), "Gameplay", "Combat Log")
	self:add_gui(ImguiCraftItem:new(), "Gameplay", "Craft Item")
	self:add_gui(ImguiWeaponDebug:new(), "Gameplay", "Weapon Debug")
	self:add_gui(ImguiBuffsDebug:new(), "Gameplay", "Buffs Debug")
end

ImguiManager.add_gui = function (self, gui, category, name)
	if not self.guis[category] then
		self.guis[category] = {}
	end

	local category_table = self.guis[category]

	table.insert(category_table, {
		enabled = false,
		initialized = false,
		gui = gui,
		name = name
	})
end

ImguiManager.update = function (self)
	if Keyboard.pressed(Keyboard.button_index("f3")) then
		self.open = not self.open

		if self.open then
			Imgui.open_imgui()
			self:_capture_input()
		else
			if self.persistant_sub_windows == 0 then
				Imgui.close_imgui()
			end

			self:_release_input()
		end
	end

	if self.open then
		self:update_main_menu()
	end

	self:update_guis()
end

ImguiManager.update_main_menu = function (self)
	if Imgui.BeginMainMenuBar() then
		for category_name, category_guis in pairs(self.guis) do
			if Imgui.BeginMenu(category_name) then
				for i = 1, #category_guis, 1 do
					local menu_item = category_guis[i]

					if Imgui.MenuItem(menu_item.name) then
						menu_item.enabled = not menu_item.enabled

						if menu_item.enabled and not menu_item.initialized then
							menu_item.gui:init()

							menu_item.initialized = true
						end
					end
				end

				Imgui.EndMenu()
			end
		end

		Imgui.EndMainMenuBar()
	end
end

ImguiManager.update_guis = function (self)
	self.persistant_sub_windows = 0

	for category_name, category_guis in pairs(self.guis) do
		for i = 1, #category_guis, 1 do
			local menu_item = category_guis[i]

			if menu_item.enabled then
				local gui = menu_item.gui

				if self.open then
					gui:update()
				end

				local sub_windows = gui:subwindow_count()

				if sub_windows > 0 then
					gui:update_subwindow()
				end

				self.persistant_sub_windows = self.persistant_sub_windows + sub_windows
			end
		end
	end
end

ImguiManager._capture_input = function (self)
	local input_manager = Managers.input

	if input_manager then
		input_manager:capture_input({
			"keyboard",
			"gamepad",
			"mouse"
		}, 1, "chat_input", "Imgui")
	end

	Window.set_mouse_focus(false)
	Imgui.enable_imgui_input_system(Imgui.KEYBOARD)
	Imgui.enable_imgui_input_system(Imgui.MOUSE)
end

ImguiManager._release_input = function (self)
	local input_manager = Managers.input

	if input_manager then
		input_manager:release_input({
			"keyboard",
			"gamepad",
			"mouse"
		}, 1, "chat_input", "Imgui")
	end

	Window.set_mouse_focus(true)
	Imgui.disable_imgui_input_system(Imgui.KEYBOARD)
	Imgui.disable_imgui_input_system(Imgui.MOUSE)
end

return
