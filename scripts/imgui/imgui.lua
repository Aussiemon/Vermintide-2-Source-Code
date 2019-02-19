require("scripts/imgui/imgui_umbra_debug")

ImguiManager = class(ImguiManager)

ImguiManager.init = function (self)
	self.open = false
	self.persistant_sub_windows = 0
	self.guis = {
		ImguiUmbraDebug:new()
	}

	for i, gui in ipairs(self.guis) do
		gui:init()
	end
end

ImguiManager.update = function (self)
	if Keyboard.pressed(Keyboard.button_index("f3")) then
		self.open = not self.open

		if self.open then
			Imgui.open_imgui()
			Window.set_mouse_focus(false)
		else
			Window.set_mouse_focus(true)

			if self.persistant_sub_windows == 0 then
				Imgui.close_imgui()
			end
		end
	end

	self.persistant_sub_windows = 0

	for i, gui in ipairs(self.guis) do
		local sub_windows = gui:subwindow_count()

		if self.open then
			gui:update()
		end

		if sub_windows > 0 then
			gui:update_subwindow()
		end

		self.persistant_sub_windows = self.persistant_sub_windows + sub_windows
	end
end

return
