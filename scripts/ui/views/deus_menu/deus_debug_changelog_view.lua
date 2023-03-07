require("scripts/settings/dlcs/morris/morris_changelog")

DeusDebugChangelogView = class(DeusDebugChangelogView)

DeusDebugChangelogView.init = function (self, ingame_ui_context)
	local input_service_name = "deus_debug_changelog_view"
	local input_manager = ingame_ui_context.input_manager
	self._input_manager = input_manager
	self._input_service_name = input_service_name
	self.ingame_ui = ingame_ui_context.ingame_ui

	input_manager:create_input_service(input_service_name, "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service(input_service_name, "keyboard")
	input_manager:map_device_to_service(input_service_name, "mouse")
	input_manager:map_device_to_service(input_service_name, "gamepad")
end

DeusDebugChangelogView.destroy = function (self)
	return
end

DeusDebugChangelogView.on_enter = function (self, params)
	local input_manager = self._input_manager
	local input_service_name = self._input_service_name

	input_manager:block_device_except_service(input_service_name, "keyboard")
	input_manager:block_device_except_service(input_service_name, "mouse")
	input_manager:block_device_except_service(input_service_name, "gamepad")
	ShowCursorStack.push()
	Imgui.open_imgui()
	Imgui.enable_imgui_input_system(Imgui.KEYBOARD)
	Imgui.enable_imgui_input_system(Imgui.MOUSE)
	Window.set_mouse_focus(false)

	self._changelog = MorrisChangelog
end

DeusDebugChangelogView.post_update_on_enter = function (self)
	return
end

DeusDebugChangelogView.on_exit = function (self)
	local input_manager = self._input_manager

	input_manager:device_unblock_all_services("keyboard")
	input_manager:device_unblock_all_services("mouse")
	input_manager:device_unblock_all_services("gamepad")
	ShowCursorStack.pop()
	Window.set_mouse_focus(true)
	Imgui.disable_imgui_input_system(Imgui.KEYBOARD)
	Imgui.disable_imgui_input_system(Imgui.MOUSE)
	Imgui.close_imgui()
end

DeusDebugChangelogView.post_update_on_exit = function (self)
	return
end

DeusDebugChangelogView.update = function (self, dt, t)
	Imgui.begin_window("Morris Changelog", "always_auto_resize", "no_resize", "no_title_bar", "no_move")

	local changelog = self._changelog

	for index, log_section in ipairs(changelog) do
		local entry_number = #changelog - index
		local tree_node_id = "Update " .. entry_number

		if index == 1 then
			Imgui.text(tree_node_id)
			Imgui.text(log_section)
		elseif Imgui.tree_node(tree_node_id) then
			Imgui.text(log_section)
			Imgui.tree_pop()
		end
	end

	if Imgui.button("Close", 400, 50) then
		self:_close()
	end

	Imgui.end_window()
	self:handle_input(dt)
end

DeusDebugChangelogView.handle_input = function (self, dt)
	local input_service = self._input_manager:get_service(self._input_service_name)

	if input_service:get("toggle_menu", true) or input_service:get("back", true) then
		self:_close()
	end
end

DeusDebugChangelogView.disable_toggle_menu = function (self)
	return true
end

DeusDebugChangelogView.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

DeusDebugChangelogView._close = function (self)
	self.ingame_ui:handle_transition("exit_menu")
end
