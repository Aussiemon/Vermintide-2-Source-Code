require("scripts/imgui/imgui_umbra_debug")
require("scripts/imgui/imgui_combat_log")
require("scripts/imgui/imgui_craft_item")
require("scripts/imgui/imgui_weapon_debug")
require("scripts/imgui/imgui_buffs_debug")
require("scripts/imgui/imgui_ai_spawn_log")

ImguiManager = class(ImguiManager)
ImguiClassTemplate = class(ImguiClassTemplate)

ImguiClassTemplate.init = function (self)
	return
end

ImguiClassTemplate.update = function (self)
	return
end

ImguiClassTemplate.draw = function (self)
	return
end

ImguiClassTemplate.is_persistent = function (self)
	return
end

ImguiManager.init = function (self)
	self.open = false
	self.persistant_windows = 0
	self.guis = {}
	script_data.imgui = script_data.imgui or {}

	self:add_gui(ImguiUmbraDebug:new(), "World", "Umbra")
	self:add_gui(ImguiCombatLog:new(), "Gameplay", "Combat Log")
	self:add_gui(ImguiCraftItem:new(), "Gameplay", "Craft Item")
	self:add_gui(ImguiWeaponDebug:new(), "Gameplay", "Weapon Debug")
	self:add_gui(ImguiBuffsDebug:new(), "Gameplay", "Buffs Debug")
	self:add_gui(ImguiAISpawnLog:new(), "Gameplay", "AI Spawn Log")
end

ImguiManager.add_gui = function (self, gui, category, name, enabled)
	ApiVerification.ensure_public_api(ImguiClassTemplate, gui)

	if not self.guis[category] then
		self.guis[category] = {}
	end

	local category_table = self.guis[category]

	table.insert(category_table, {
		initialized = false,
		gui = gui,
		name = name,
		enabled = enabled
	})
end

ImguiManager.update = function (self)
	if Keyboard.pressed(Keyboard.button_index("f3")) then
		self.open = not self.open

		if self.open then
			Imgui.open_imgui()
			self:_capture_input()
		else
			if self.persistant_windows == 0 then
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
					end
				end

				Imgui.EndMenu()
			end
		end

		Imgui.EndMainMenuBar()
	end
end

ImguiManager.update_guis = function (self)
	self.persistant_windows = 0
	local is_open = self.open

	for category_name, category_guis in pairs(self.guis) do
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

					self.persistant_windows = self.persistant_windows + 1
				end
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

	ShowCursorStack.push()
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

	ShowCursorStack.pop()
	Imgui.disable_imgui_input_system(Imgui.KEYBOARD)
	Imgui.disable_imgui_input_system(Imgui.MOUSE)
end

return
