-- chunkname: @scripts/ui/views/level_end/states/end_view_state_score_vs.lua

local definitions = local_require("scripts/ui/views/level_end/states/definitions/end_view_state_score_vs_definitions")

require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_details")
require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_summary")
require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_report")

local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false

EndViewStateScoreVS = class(EndViewStateScoreVS)
EndViewStateScoreVS.NAME = "EndViewStateScoreVS"

EndViewStateScoreVS.on_enter = function (self, params)
	print("[PlayState] Enter Substate EndViewStateScoreVS")

	self._params = params

	local context = params.context

	self._context = context
	self._ui_renderer = context.ui_top_renderer
	self._input_manager = context.input_manager
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._layout_settings = definitions.tab_layouts

	self:create_ui_elements(params)
	self:_setup_text_buttons_width_and_position()

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}
	self._selected_layout_name = "end_view_state_score_vs_tab_summary"

	self:_set_initial_tab()
	self:_play_animation("transition_enter")
end

EndViewStateScoreVS.exit = function (self, direction)
	self._exit_started = true

	self:_play_animation("transition_exit")
end

EndViewStateScoreVS._play_animation = function (self, anim_name)
	local params = {
		render_settings = self._render_settings,
	}

	self._anim_id = self._ui_animator:start_animation(anim_name, self._widgets_by_name, scenegraph_definition, params)
end

EndViewStateScoreVS.exit_done = function (self)
	return self._exit_started and self._ui_animator:is_animation_completed(self._anim_id)
end

EndViewStateScoreVS.create_ui_elements = function (self, params)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions, {}, {})

	local title_button_widgets = {}
	local tab_layouts = definitions.tab_layouts
	local parent = self.parent

	for i = 1, #tab_layouts do
		local settings = tab_layouts[i]
		local scenegraph_id = "game_mode_option"
		local size = scenegraph_definition[scenegraph_id].size
		local display_name = settings.display_name or "n/a"
		local font_size = 32
		local horizontal_alignment = "center"
		local widget_definition = definitions.create_panel_button(scenegraph_id, size, display_name, font_size, nil, horizontal_alignment)
		local widget = UIWidget.init(widget_definition)
		local layout_name = settings.name

		widget.content.layout_name = layout_name
		title_button_widgets[#title_button_widgets + 1] = widget
	end

	self._title_button_widgets = title_button_widgets

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

EndViewStateScoreVS._setup_text_buttons_width_and_position = function (self)
	local ui_scenegraph = self._ui_scenegraph
	local area_size = ui_scenegraph.panel_entry_area.size
	local total_width = area_size[1]
	local title_button_widgets = self._title_button_widgets
	local num_title_button_widgets = #title_button_widgets
	local entry_width = math.floor(total_width / num_title_button_widgets)

	ui_scenegraph.game_mode_option.size[1] = entry_width

	for i = 1, num_title_button_widgets do
		local widget = title_button_widgets[i]

		self:_set_text_button_size(widget, entry_width)

		local position_x = entry_width * (i - 1)

		widget.offset[1] = position_x
	end
end

EndViewStateScoreVS._set_text_button_size = function (self, widget, width)
	local style = widget.style

	style.selected_texture.texture_size[1] = width

	local text_width_offset = 5
	local text_width = width - text_width_offset * 2

	style.text.size[1] = text_width
	style.text_shadow.size[1] = text_width
	style.text_hover.size[1] = text_width
	style.text_disabled.size[1] = text_width
	style.text.offset[1] = style.text.default_offset[1] + text_width_offset
	style.text_shadow.offset[1] = style.text_shadow.default_offset[1] + text_width_offset
	style.text_hover.offset[1] = style.text_hover.default_offset[1] + text_width_offset
	style.text_disabled.offset[1] = style.text_disabled.default_offset[1] + text_width_offset
end

EndViewStateScoreVS._wanted_state = function (self)
	local new_state = self.parent:wanted_menu_state()

	return new_state
end

EndViewStateScoreVS.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager
end

EndViewStateScoreVS.on_exit = function (self, params)
	print("[PlayState] Exit Substate EndViewStateScoreVS")

	self.ui_animator = nil
end

EndViewStateScoreVS._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

EndViewStateScoreVS.update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_handle_input(dt, t)
	self:_draw(dt, t)

	if self._active_tab then
		self._active_tab:update(dt, t)
	end
end

EndViewStateScoreVS._update_animations = function (self, dt, t)
	self._ui_animator:update(dt)

	local widget = self._widgets_by_name.continue_button

	UIWidgetUtils.animate_default_button(widget, dt)
end

EndViewStateScoreVS._set_initial_tab = function (self)
	self:_change_tab(self._selected_layout_name, 1, "")
end

EndViewStateScoreVS._handle_input = function (self, dt, t)
	local input_service = self._input_manager:get_service("end_of_level")
	local title_button_widgets = self._title_button_widgets

	if #title_button_widgets > 1 then
		for i = 1, #title_button_widgets do
			local widget = title_button_widgets[i]

			if UIUtils.is_button_pressed(widget) then
				local layout_name = widget.content.layout_name

				if layout_name ~= self._selected_layout_name then
					self:_change_tab(layout_name, i, self._selected_layout_name)
					self:_set_selected_option(layout_name)

					self._selected_layout_name = layout_name
				end

				break
			end
		end
	end

	local continue_button_widget = self._widgets_by_name.continue_button

	if UIUtils.is_button_pressed(continue_button_widget) then
		self._done = true
		continue_button_widget.content.disable_button = true

		UIUtils.enable_button(continue_button_widget, false)
	end
end

EndViewStateScoreVS._change_tab = function (self, new_layout_name, new_Layout_index, old_layout_name)
	local old_tab_settings = self:_get_tab_settings_by_layout_name(old_layout_name)

	if self._active_tab and self._active_tab.NAME == old_tab_settings.class_name then
		self._active_tab:on_exit()

		self._active_tab = nil
	end

	local layout_settings = self._layout_settings
	local tab_settings = layout_settings[new_Layout_index]
	local new_tab_class_name = tab_settings.class_name
	local tab_class = rawget(_G, new_tab_class_name)
	local tab = tab_class:new()

	if tab.on_enter then
		tab:on_enter(self._params)
	end

	self._active_tab = tab
end

EndViewStateScoreVS._set_selected_option = function (self, selected_layout_name)
	local title_button_widgets = self._title_button_widgets

	for i = 1, #title_button_widgets do
		local widget = title_button_widgets[i]
		local content = widget.content
		local layout_name = content.layout_name

		content.button_hotspot.is_selected = layout_name == selected_layout_name
	end
end

EndViewStateScoreVS.post_update = function (self, dt, t)
	return
end

EndViewStateScoreVS._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self._input_manager:get_service("end_of_level")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_all_widgets(ui_renderer, self._widgets)

	if #self._title_button_widgets > 1 then
		UIRenderer.draw_all_widgets(ui_renderer, self._title_button_widgets)
	end

	UIRenderer.end_pass(ui_renderer)
end

EndViewStateScoreVS.done = function (self)
	return self._done
end

EndViewStateScoreVS._get_tab_settings_by_layout_name = function (self, layout_name)
	for index, settings in ipairs(self._layout_settings) do
		if settings.name == layout_name then
			return settings
		end
	end
end
