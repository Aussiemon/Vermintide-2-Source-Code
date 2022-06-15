local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_heroic_deed_overview_console_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widgets
local animation_definitions = definitions.animation_definitions
local selector_input_definition = definitions.selector_input_definition
local START_GAME_INPUT = "refresh_press"
local SELECTION_INPUT = "confirm_press"
StartGameWindowHeroicDeedOverviewConsole = class(StartGameWindowHeroicDeedOverviewConsole)
StartGameWindowHeroicDeedOverviewConsole.NAME = "StartGameWindowHeroicDeedOverviewConsole"

StartGameWindowHeroicDeedOverviewConsole.on_enter = function (self, params, offset)
	print("[StartGameViewWindow] Enter Substate StartGameWindowHeroicDeedOverviewConsole")

	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._animations = {}

	self:_create_ui_elements(params, offset)

	self._input_index = params.input_index or 1

	self:_handle_new_selection(self._input_index)

	self._is_focused = false
	self._play_button_pressed = false
	self._show_additional_settings = false
	self._previous_can_play = nil

	self._parent:change_generic_actions("default")
	self:_start_transition_animation("on_enter")
end

StartGameWindowHeroicDeedOverviewConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowHeroicDeedOverviewConsole._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowHeroicDeedOverviewConsole.on_exit = function (self, params)
	print("[StartGameViewWindow] Exit Substate StartGameWindowHeroicDeedOverviewConsole")

	self._ui_animator = nil

	if self._play_button_pressed then
		params.input_index = nil
	else
		params.input_index = self._input_index
	end
end

StartGameWindowHeroicDeedOverviewConsole.set_focus = function (self, focused)
	self._is_focused = focused
end

StartGameWindowHeroicDeedOverviewConsole.update = function (self, dt, t)
	self:_update_heroic_deed_selection()
	self:_update_can_play()
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_draw(dt)
end

StartGameWindowHeroicDeedOverviewConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowHeroicDeedOverviewConsole._present_heroic_deed = function (self, backend_id)
	local item_interface = Managers.backend:get_interface("items")
	local data = backend_id and item_interface:get_item_masterlist_data(backend_id)
	local heroic_deed_setting = self._widgets_by_name.heroic_deed_setting
	heroic_deed_setting.content.input_text = (data and Localize(data.display_name)) or Localize("not_assigned")
	heroic_deed_setting.content.icon_texture = (data and data.inventory_icon) or nil
end

StartGameWindowHeroicDeedOverviewConsole._update_heroic_deed_selection = function (self)
	local backend_id = self._parent:get_selected_heroic_deed_backend_id()

	if backend_id ~= self._selected_backend_id then
		self._selected_backend_id = backend_id

		if backend_id ~= nil then
			self:_present_heroic_deed(backend_id)
		end
	end
end

StartGameWindowHeroicDeedOverviewConsole._update_can_play = function (self)
	local can_play = self:_can_play()

	if self._previous_can_play ~= can_play then
		self._previous_can_play = can_play
		local play_button = self._widgets_by_name.play_button
		play_button.content.button_hotspot.disable_button = not can_play
		play_button.content.disabled = not can_play

		if can_play then
			self._parent:set_input_description("play_available")
		else
			self._parent:set_input_description(nil)
		end
	end
end

StartGameWindowHeroicDeedOverviewConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameWindowHeroicDeedOverviewConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowHeroicDeedOverviewConsole._handle_input = function (self, dt, t)
	local parent = self._parent
	local input_service = parent:window_input_service()

	if input_service:get(SELECTION_INPUT) then
		self:_option_selected(self._input_index, t)
	end

	local input_index = self._input_index

	if input_service:get("move_down") then
		input_index = input_index + 1
	elseif input_service:get("move_up") then
		input_index = input_index - 1
	end

	if input_index ~= self._input_index then
		self:_handle_new_selection(input_index)
	end

	local widgets_by_name = self._widgets_by_name

	for i = 1, #selector_input_definition, 1 do
		local widget_name = selector_input_definition[i]
		local widget = widgets_by_name[widget_name]
		local is_selected = widget.content.is_selected

		if not is_selected and self:_is_button_hover_enter(widget) then
			self:_handle_new_selection(i)
		end

		if self:_is_button_pressed(widget) then
			self:_option_selected(self._input_index, t)
		end
	end

	if self:_can_play() then
		if self:_is_button_hover_enter(widgets_by_name.play_button) then
			self._parent:play_sound("Play_hud_hover")
		end

		if input_service:get(START_GAME_INPUT) or self:_is_button_pressed(widgets_by_name.play_button) then
			self._play_button_pressed = true

			parent:play(t, "deed")
		end
	end
end

StartGameWindowHeroicDeedOverviewConsole._can_play = function (self)
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface:get_item_from_id(self._selected_backend_id)

	if not item then
		self._selected_backend_id = nil
	end

	local can_play = self._selected_backend_id ~= nil

	return can_play
end

StartGameWindowHeroicDeedOverviewConsole._option_selected = function (self, input_index, t)
	local selected_widget_name = selector_input_definition[input_index]

	if selected_widget_name == "heroic_deed_setting" then
		self._parent:set_layout_by_name("heroic_deed_selection")
	elseif selected_widget_name == "play_button" then
		self._play_button_pressed = true

		self._parent:play(t, "deed")
	else
		ferror("Unknown selector_input_definition: %s", selected_widget_name)
	end
end

StartGameWindowHeroicDeedOverviewConsole._handle_new_selection = function (self, input_index)
	local widgets_by_name = self._widgets_by_name
	local num_inputs = #selector_input_definition
	input_index = math.clamp(input_index, 1, num_inputs)
	local widget_name = selector_input_definition[input_index]
	local widget = widgets_by_name[widget_name]
	local widget_content = widget.content

	if widget_content.disabled then
		return
	end

	for i = 1, #selector_input_definition, 1 do
		local widget_name = selector_input_definition[i]
		local widget = widgets_by_name[widget_name]
		local is_selected = i == input_index
		widget.content.is_selected = is_selected
	end

	self._input_index = input_index
end

StartGameWindowHeroicDeedOverviewConsole._update_animations = function (self, dt)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	UIWidgetUtils.animate_start_game_console_setting_button(widgets_by_name.heroic_deed_setting, dt)
	UIWidgetUtils.animate_play_button(widgets_by_name.play_button, dt)
end

StartGameWindowHeroicDeedOverviewConsole._draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local render_settings = self._render_settings
	local parent_scenegraph_id = nil

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

return
