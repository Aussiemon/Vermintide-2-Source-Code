-- chunkname: @scripts/ui/views/level_end/states/end_view_state_score_vs.lua

local definitions = local_require("scripts/ui/views/level_end/states/definitions/end_view_state_score_vs_definitions")

require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_details")
require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_report")

local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local tab_size = definitions.tab_size
local DO_RELOAD = false
local PADDING = 30

EndViewStateScoreVS = class(EndViewStateScoreVS)
EndViewStateScoreVS.NAME = "EndViewStateScoreVS"

EndViewStateScoreVS.on_enter = function (self, params)
	print("[PlayState] Enter Substate EndViewStateScoreVS")

	self._params = params

	local context = params.context

	self._parent = params.parent
	self._context = context
	self._ui_renderer = context.ui_top_renderer
	self._input_manager = context.input_manager
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}

	local tab_layouts = table.shallow_copy(definitions.tab_layouts)

	for i = #tab_layouts, 1, -1 do
		local condition = tab_layouts[i].condition_func

		if condition and not condition() then
			table.remove(tab_layouts, i)
		end
	end

	self._layout_settings = tab_layouts

	self:create_ui_elements(params)
	self:_align_tabs()
	self:_setup_level_widget()

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}
	self._animation_callbacks = {}

	local initial_tab = self._layout_settings[1]

	self._selected_layout_name = initial_tab.name

	self:_update_tab_selection(1)
	self._parent:hide_team()
	self:_play_animation("transition_enter")

	self._animation_callbacks.transition_enter = function ()
		self:_set_initial_tab()
	end

	self._parent:set_input_description(nil)
end

EndViewStateScoreVS.exit = function (self, direction)
	self._exit_started = true

	self:_play_animation("transition_exit")
end

EndViewStateScoreVS._play_animation = function (self, anim_name)
	local params = {
		render_settings = self._render_settings,
	}
	local anim_id = self._ui_animator:start_animation(anim_name, self._widgets_by_name, scenegraph_definition, params)

	self._animations[anim_name] = anim_id
end

EndViewStateScoreVS.play_sound = function (self, event_name)
	self._parent:play_sound(event_name)
end

EndViewStateScoreVS.exit_done = function (self)
	return self._exit_started and table.is_empty(self._animations)
end

EndViewStateScoreVS.create_ui_elements = function (self, params)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions, {}, {})

	local title_button_widgets = {}
	local tab_layouts = self._layout_settings
	local offset = 0

	for i = 1, #tab_layouts do
		local settings = tab_layouts[i]
		local scenegraph_id = "tab"
		local display_name = settings.display_name or "n/a"
		local widget_definition = definitions.create_tab(scenegraph_id, display_name)
		local widget = UIWidget.init(widget_definition)
		local text_width = UIUtils.get_text_width(self._ui_renderer, widget.style.text, display_name)

		widget.offset[1] = offset + (i > 1 and text_width * 0.5 or 0)
		offset = offset + text_width * 0.5 + PADDING
		widget.style.hotspot.area_size[1] = text_width * 0.5

		local layout_name = settings.name

		widget.content.layout_name = layout_name
		title_button_widgets[#title_button_widgets + 1] = widget
	end

	self._title_button_widgets = title_button_widgets
	self._ui_animations = {}

	local create_team_score_func = definitions.create_team_score_func
	local my_peer_id = Network.peer_id()
	local local_player_id = 1
	local local_player_party_id = self._context.party_composition[PlayerUtils.unique_player_id(my_peer_id, local_player_id)]
	local opponent_party_id = local_player_party_id == 1 and 2 or 1
	local local_team = GameModeSettings.versus.party_names_lookup_by_id[local_player_party_id]
	local opponent_team = GameModeSettings.versus.party_names_lookup_by_id[opponent_party_id]
	local scores = self._context.rewards.team_scores
	local local_player_team_score = scores[local_player_party_id]
	local opponent_team_score = scores[opponent_party_id]
	local local_widget_definition = create_team_score_func("local_team", local_team, local_player_team_score)
	local opponent_widget_definition = create_team_score_func("opponent_team", opponent_team, opponent_team_score)
	local local_widget = UIWidget.init(local_widget_definition)
	local opponent_widget = UIWidget.init(opponent_widget_definition)

	self._widgets[#self._widgets + 1] = local_widget
	self._widgets[#self._widgets + 1] = opponent_widget
	self._widgets_by_name.local_score = local_widget
	self._widgets_by_name.opponent_score = opponent_widget

	local num_tabs = #tab_layouts

	self._widgets_by_name.tab_selection.content.visible = num_tabs > 1
	self._widgets_by_name.prev_tab.content.visible = num_tabs > 1
	self._widgets_by_name.next_tab.content.visible = num_tabs > 1

	local back_to_keep_button_widget = self._widgets_by_name.back_to_keep_button

	UIUtils.enable_button(back_to_keep_button_widget, false)
end

EndViewStateScoreVS._align_tabs = function (self)
	local offset = 0

	for _, widget in pairs(self._title_button_widgets) do
		offset = offset + widget.style.hotspot.area_size[1] + PADDING
	end

	for _, widget in pairs(self._title_button_widgets) do
		widget.offset[1] = widget.offset[1] - offset
	end

	local first_tab_widget = self._title_button_widgets[1]
	local text = first_tab_widget.content.text
	local text_style = first_tab_widget.style.text
	local text_width = UIUtils.get_text_width(self._ui_renderer, text_style, text)

	self._widgets_by_name.prev_tab.offset[1] = -offset - text_width * 0.5 - PADDING * 2

	local last_tab_widget = self._title_button_widgets[#self._title_button_widgets]
	local text = last_tab_widget.content.text
	local text_style = last_tab_widget.style.text
	local text_width = UIUtils.get_text_width(self._ui_renderer, text_style, text)

	offset = last_tab_widget.offset
	self._widgets_by_name.next_tab.offset[1] = offset[1] + text_width * 0.5 + PADDING * 2
end

EndViewStateScoreVS._setup_level_widget = function (self)
	local content = self._widgets_by_name.level.content
	local level_key = self._context.level_key
	local level_settings = LevelSettings[level_key]
	local level_image = level_settings and level_settings.level_image or "level_image_any"

	content.icon = level_image

	local difficulty_key = self._context.difficulty
	local difficulty_settings = DifficultySettings[difficulty_key]
	local frame_image = difficulty_settings and difficulty_settings.completed_frame_texture or "map_frame_00"

	content.frame = frame_image

	local content = self._widgets_by_name.level_text.content

	content.text = Localize(level_settings.display_name)
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
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil

			local animation_callback = self._animation_callbacks[animation_name]

			if animation_callback then
				animation_callback()

				self._animation_callbacks[animation_name] = nil
			end
		end
	end

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil

			local animation_callback = self._animation_callbacks[name]

			if animation_callback then
				animation_callback()

				self._animation_callbacks[name] = nil
			end
		end
	end

	local widget = self._widgets_by_name.back_to_keep_button

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
				end

				self:play_sound("Play_hud_select")

				break
			elseif UIUtils.is_button_hover_enter(widget) then
				self:play_sound("Play_hud_hover")
			end
		end
	end

	local tab_index

	if UIUtils.is_button_pressed(self._widgets_by_name.prev_tab) or input_service:get("cycle_previous") then
		tab_index = self._selected_tab_index
		tab_index = math.clamp((tab_index or 1) - 1, 1, #self._title_button_widgets)
	elseif UIUtils.is_button_pressed(self._widgets_by_name.next_tab) or input_service:get("cycle_next") then
		tab_index = self._selected_tab_index
		tab_index = math.clamp((tab_index or 1) + 1, 1, #self._title_button_widgets)
	end

	if tab_index then
		local title_button_widget = self._title_button_widgets[tab_index]
		local layout_name = title_button_widget.content.layout_name

		if layout_name ~= self._selected_layout_name then
			self:_change_tab(layout_name, tab_index, self._selected_layout_name)
		end
	end

	local back_to_keep_button_widget = self._widgets_by_name.back_to_keep_button
	local continue_input_pressed = UIUtils.is_button_enabled(back_to_keep_button_widget) and input_service:get("refresh")

	if UIUtils.is_button_pressed(back_to_keep_button_widget) or continue_input_pressed then
		self._done = true

		UIUtils.enable_button(back_to_keep_button_widget, false)
		self:play_sound("play_gui_mission_summary_button_return_to_keep_click")
		Managers.transition:fade_in(GameSettings.transition_fade_in_speed)
	elseif UIUtils.is_button_hover_enter(back_to_keep_button_widget) then
		self:play_sound("Play_hud_hover")
	end
end

EndViewStateScoreVS._change_tab = function (self, new_layout_name, new_layout_index, old_layout_name)
	if new_layout_index < 0 or new_layout_index > #self._title_button_widgets then
		return
	end

	local old_tab_settings = self:_get_tab_settings_by_layout_name(old_layout_name)

	if self._active_tab and self._active_tab.NAME == old_tab_settings.class_name then
		self._active_tab:on_exit()

		self._active_tab = nil
	end

	local layout_settings = self._layout_settings
	local tab_settings = layout_settings[new_layout_index]
	local new_tab_class_name = tab_settings.class_name
	local tab_class = rawget(_G, new_tab_class_name)
	local tab = tab_class:new()

	if tab.on_enter then
		tab:on_enter(self._params)
	end

	self._active_tab = tab
	self._selected_layout_name = new_layout_name

	self:_update_tab_selection(new_layout_index)
	self:play_sound("Play_vs_hud_progression_scoreboard_appear")
end

EndViewStateScoreVS._update_tab_selection = function (self, index)
	self._selected_tab_index = index

	for button_index, widget in ipairs(self._title_button_widgets) do
		widget.content.hotspot.is_selected = button_index == index
	end

	local selected_tab_button_widget = self._title_button_widgets[index]
	local text = selected_tab_button_widget.content.text
	local text_style = selected_tab_button_widget.style.text
	local offset_x = selected_tab_button_widget.offset[1]
	local padding = 20
	local text_width = UIUtils.get_text_width(self._ui_renderer, text_style, text)
	local selection_widget = self._widgets_by_name.tab_selection
	local rect_style = selection_widget.style.rect

	self._ui_animations.tab_selection_position = UIAnimation.init(UIAnimation.function_by_time, selection_widget.offset, 1, selection_widget.offset[1], offset_x, 0.25, math.easeOutCubic)
	self._ui_animations.tab_selection_size = UIAnimation.init(UIAnimation.function_by_time, rect_style.texture_size, 1, rect_style.texture_size[1], text_width + padding, 0.25, math.easeOutCubic)
end

EndViewStateScoreVS._set_selected_option = function (self, selected_layout_name)
	local title_button_widgets = self._title_button_widgets

	for i = 1, #title_button_widgets do
		local widget = title_button_widgets[i]
		local content = widget.content
		local layout_name = content.layout_name

		content.hotspot.is_selected = layout_name == selected_layout_name
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

EndViewStateScoreVS.activate_back_to_keep_button = function (self)
	local back_to_keep_button = self._widgets_by_name.back_to_keep_button

	UIUtils.enable_button(back_to_keep_button, true)
end
