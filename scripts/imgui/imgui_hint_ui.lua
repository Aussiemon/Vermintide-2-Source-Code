-- chunkname: @scripts/imgui/imgui_hint_ui.lua

ImguiHintUI = class(ImguiHintUI)

local Gui, Imgui = Gui, Imgui
local DO_RELOAD = true

ImguiHintUI.init = function (self)
	self._active = false
	self._first_launch = true
end

ImguiHintUI.update = function (self)
	if DO_RELOAD then
		self:init()

		DO_RELOAD = false
	end
end

ImguiHintUI.on_show = function (self)
	self._active = true
end

ImguiHintUI.on_hide = function (self)
	self._active = false
end

ImguiHintUI.draw = function (self, is_open)
	local do_close = self:_do_main_window()

	return do_close
end

ImguiHintUI.is_persistent = function (self)
	return true
end

ImguiHintUI._do_main_window = function (self)
	if self._first_launch then
		local w, h = Application.resolution()

		Imgui.set_next_window_size(w * 0.25, h * 0.7)
	end

	local do_close = Imgui.begin_window("Hint UI Debug", "menu_bar")

	Imgui.text("Add Hint to the Hint Templates settings file \nand verify the info from here")
	Imgui.separator()
	self:_do_clear_saved_hints_button()
	Imgui.dummy(2, 5)
	self:_do_hint_buttons()
	Imgui:end_window()

	return do_close
end

ImguiHintUI._do_hint_buttons = function (self)
	for hint_name, hint_data in pairs(HintTemplates) do
		if Imgui.button(hint_name, 250, 25) then
			Managers.state.event:trigger("ui_show_hint", hint_name)
		end
	end
end

local function on_save_ended_callback()
	print("ImguiHintUI - Cleared save hints from SaveData")
end

local function save()
	local save_data = SaveData

	save_data.viewed_hints = {}

	Managers.save:auto_save(SaveFileName, SaveData, on_save_ended_callback)
end

ImguiHintUI._do_clear_saved_hints_button = function (self)
	if Imgui.button("Clear Saved Hints", 250, 35) then
		save()
	end

	local ingame_ui = Managers.ui:ingame_ui()

	ingame_ui.hint_ui_handler:parse_unseen_hints()
end
