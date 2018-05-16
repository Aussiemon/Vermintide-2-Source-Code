local definitions = dofile("scripts/ui/help_screen/help_screen_definitions")

require("scripts/ui/help_screen/help_screen_settings")

HelpScreenUI = class(HelpScreenUI)

HelpScreenUI.init = function (self, ingame_ui_context)
	self._world = ingame_ui_context.world
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._world_manager = ingame_ui_context.world_manager
	local world = self._world_manager:world("level_world")
	self._wwise_world = Managers.world:wwise_world(world)
	local input_manager = ingame_ui_context.input_manager
	self._input_manager = input_manager

	input_manager:create_input_service("help_screen_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("help_screen_view", "keyboard")
	input_manager:map_device_to_service("help_screen_view", "mouse")
	input_manager:map_device_to_service("help_screen_view", "gamepad")

	self._input_service = self._input_manager:get_service("help_screen_view")
	self._ingame_ui_context = ingame_ui_context
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._current_view = nil
	self._current_index = 1
end

HelpScreenUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	self:_set_page(self._current_index)

	DO_RELOAD = false
end

DO_RELOAD = true

HelpScreenUI.update = function (self, dt)
	if not self._current_view then
		return
	end

	if DO_RELOAD then
		self:_create_ui_elements()
	end

	self:_update_input(dt)
	self:_draw(dt)
end

HelpScreenUI.show_help = function (self, help_screen_name, input_service_name, on_init)
	if on_init then
	end

	if HelpScreens[help_screen_name] then
		self._current_view = help_screen_name
		self._current_index = 1

		self:_create_ui_elements()

		if input_service_name then
			Managers.input:device_block_service("gamepad", 1, input_service_name)
			Managers.input:device_block_service("keyboard", 1, input_service_name)
			Managers.input:device_block_service("mouse", 1, input_service_name)

			self._disabled_input_service_name = input_service_name
		end

		Managers.input:device_unblock_service("gamepad", 1, "help_screen_view")
		Managers.input:device_unblock_service("keyboard", 1, "help_screen_view")
		Managers.input:device_unblock_service("mouse", 1, "help_screen_view")
		self:_set_page(self._current_index)
	else
		Application.warning(string.format("HelpScreenUI] Help screen not available (%s)", help_screen_name))
	end
end

HelpScreenUI.hide_help = function (self)
	self:_close_help()
end

HelpScreenUI._set_page = function (self, index)
	local current_view_settings = HelpScreens[self._current_view]
	local page_settings = current_view_settings[index]
	self._help_screen_widget = UIWidget.init(definitions.help_screen_widget_func(#HelpScreens[self._current_view], index))

	for setting_name, setting in pairs(page_settings) do
		self._help_screen_widget.content[setting_name] = setting
	end
end

HelpScreenUI._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_service
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_top_renderer, self._help_screen_widget)
	UIRenderer.end_pass(ui_top_renderer)
end

HelpScreenUI._update_input = function (self, dt)
	if self._input_service:get("move_left", true) then
		self._current_index = math.max(self._current_index - 1, 1)

		self:_set_page(self._current_index)
	elseif self._input_service:get("move_right", true) then
		self._current_index = self._current_index + 1

		if self._current_index > #HelpScreens[self._current_view] then
			self:_close_help()
		else
			self:_set_page(self._current_index)
		end
	elseif self._input_service:get("back", true) or self._input_service:get("show_gamercard", true) then
		self:_close_help()
	end
end

HelpScreenUI._close_help = function (self)
	if self._disabled_input_service_name then
		Managers.input:device_unblock_service("gamepad", 1, self._disabled_input_service_name)
		Managers.input:device_unblock_service("keyboard", 1, self._disabled_input_service_name)
		Managers.input:device_unblock_service("mouse", 1, self._disabled_input_service_name)
	end

	self._current_view = nil
	self._current_index = 1
	self._disabled_input_service_name = nil
end

HelpScreenUI.destroy = function (self)
	return
end

return
