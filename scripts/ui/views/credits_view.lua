local credits = local_require("scripts/settings/credits")
local definitions = local_require("scripts/ui/views/credits_view_definitions")
local colors = {
	header = Colors.color_definitions.credits_header,
	title = Colors.color_definitions.credits_title,
	normal = Colors.color_definitions.credits_normal
}
local font_sizes = {
	legal = 15,
	normal = 30
}
CreditsView = class(CreditsView)

CreditsView.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	local input_manager = ingame_ui_context.input_manager
	self._input_manager = input_manager

	input_manager:create_input_service("credits_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("credits_view", "keyboard")
	input_manager:map_device_to_service("credits_view", "mouse")
	input_manager:map_device_to_service("credits_view", "gamepad")
	self:_create_ui_elements()
end

CreditsView._create_ui_elements = function (self)
	self._num_credits = #credits.entries
	self._current_offset = 0
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._credits_widget = UIWidget.init(definitions.widget_definitions.credits)
end

CreditsView.input_service = function (self)
	return self._input_manager:get_service("credits_view")
end

CreditsView.on_enter = function (self)
	self._input_manager:capture_input(ALL_INPUT_METHODS, 1, "credits_view", "CreditsView")

	self._current_offset = 0
	self._active = true
end

CreditsView.on_exit = function (self)
	self._input_manager:release_input(ALL_INPUT_METHODS, 1, "credits_view", "CreditsView")

	self.active = nil
	self.exiting = nil

	Managers.music:trigger_event((IS_WINDOWS and "Play_hud_select") or "Play_console_menu_select")
end

CreditsView.exit = function (self, return_to_game)
	local exit_transition = (return_to_game and "exit_menu") or "ingame_menu"

	self.ingame_ui:handle_transition(exit_transition)

	self.exiting = nil
end

CreditsView.update = function (self, dt)
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("credits_view")
	local gamepad_active = input_manager:is_device_active("gamepad")

	if input_service:get("toggle_menu", true) or (gamepad_active and input_service:get("back", true)) then
		self:exit()

		return
	end

	local input_axis = (gamepad_active and input_service:get("gamepad_left_axis")) or input_service:get("scroll_axis")
	local scroll_value = input_axis.y

	if not gamepad_active and IS_XB1 then
		scroll_value = math.sign(input_axis.x) * 5
	end

	local current_offset = math.max(0, (self._current_offset + dt * 50) - scroll_value * 30)
	self._current_offset = current_offset
	local ui_top_renderer = self._ui_top_renderer
	local widget = self._credits_widget
	local content = widget.content
	local style = widget.style

	UIRenderer.begin_pass(ui_top_renderer, self._ui_scenegraph, input_service, dt)

	local w = RESOLUTION_LOOKUP.res_w
	local h = RESOLUTION_LOOKUP.res_h
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale

	UIRenderer.draw_texture(ui_top_renderer, "gradient_credits_menu", Vector3(0, 0, UILayer.credits_gradient), Vector2(w * inverse_scale, h * inverse_scale))

	local credit_entries = credits.entries

	for i = 1, self._num_credits, 1 do
		local entry = credit_entries[i]
		content.text_field = entry.localized_str or (entry.localized and Localize(entry.text)) or entry.text
		entry.localized_str = content.text_field

		if entry.type == "header" then
			style.text.text_color = colors.header
			style.text.font_size = font_sizes.normal
			current_offset = current_offset - 84 - 5
		elseif entry.type == "title" then
			style.text.text_color = colors.title
			style.text.font_size = font_sizes.normal
			current_offset = current_offset - 64 - 5
		elseif entry.type == "legal" then
			style.text.text_color = colors.normal
			style.text.font_size = font_sizes.legal
			current_offset = current_offset - 15 - 5
		else
			style.text.text_color = colors.normal
			style.text.font_size = font_sizes.normal
			current_offset = current_offset - 30 - 5
		end

		if current_offset < -84 then
			break
		elseif current_offset < h then
			widget.offset[2] = current_offset

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	if current_offset > 1200 then
		self._current_offset = 0
	end

	UIRenderer.end_pass(ui_top_renderer)
end

return
