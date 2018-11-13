local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_ingame_view_definitions")
local layout_definitions = local_require("scripts/ui/views/ingame_view_menu_layout_console")
local widget_definitions = definitions.widgets
local title_button_definitions = definitions.title_button_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local INPUT_ACTION_NEXT = "move_down_hold_continuous"
local INPUT_ACTION_PREVIOUS = "move_up_hold_continuous"
local DO_RELOAD = false
local menu_functions = {
	options_menu = function (this)
		local input_manager = Managers.input

		input_manager:block_device_except_service("options_menu", "gamepad")
		this:_activate_view("options_view")
	end,
	console_friends_menu = function (this)
		local input_manager = Managers.input

		input_manager:block_device_except_service("console_friends_menu", "gamepad")
		this:_activate_view("console_friends_view")
	end
}
HeroWindowIngameView = class(HeroWindowIngameView)
HeroWindowIngameView.NAME = "HeroWindowIngameView"

HeroWindowIngameView.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowIngameView")

	self._params = params
	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.layout_logic = IngameViewLayoutLogic:new(ingame_ui_context, layout_definitions.menu_layouts, layout_definitions.full_access_layout)

	self.layout_logic:update()

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)

	local ignore_sound = true

	self:_on_button_selected(1, ignore_sound)
	self:_start_transition_animation("on_enter")
	self:_init_menu_views()
end

HeroWindowIngameView._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowIngameView._init_menu_views = function (self)
	local ingame_ui_context = self.ingame_ui_context
	self._views = {
		options_view = ingame_ui_context.ingame_ui.views.options_view,
		console_friends_view = ingame_ui_context.ingame_ui.views.console_friends_view
	}

	for name, view in pairs(self._views) do
		view.old_exit = view.exit

		view.exit = function ()
			self:exit_current_view()
		end
	end
end

HeroWindowIngameView._reset_menu_views = function (self)
	for name, view in pairs(self._views) do
		view.exit = view.old_exit
		view.old_exit = nil
	end

	self._views = nil
end

HeroWindowIngameView._activate_view = function (self, new_view)
	self._active_view = new_view
	local views = self._views

	assert(views[new_view])

	if new_view and views[new_view] and views[new_view].on_enter then
		views[new_view]:on_enter()
	end
end

HeroWindowIngameView.exit_current_view = function (self)
	local active_view = self._active_view
	local views = self._views

	assert(active_view)

	if views[active_view] and views[active_view].exit_reset_params then
		views[active_view]:exit_reset_params()
	end

	if views[active_view] and views[active_view].on_exit then
		views[active_view]:on_exit()
	end

	self._active_view = nil
	local input_service = Managers.input:get_service("hero_view")
	local input_service_name = input_service.name
	local input_manager = Managers.input

	input_manager:block_device_except_service(input_service_name, "keyboard")
	input_manager:block_device_except_service(input_service_name, "mouse")
	input_manager:block_device_except_service(input_service_name, "gamepad")
	input_manager:disable_gamepad_cursor()
end

HeroWindowIngameView.create_ui_elements = function (self, params, offset)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local title_button_widgets = {}

	for name, widget_definition in pairs(title_button_definitions) do
		local widget = UIWidget.init(widget_definition)
		title_button_widgets[#title_button_widgets + 1] = widget
	end

	self._title_button_widgets = title_button_widgets

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	local input_service = Managers.input:get_service("hero_view")
	local gui_layer = UILayer.default + 30
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 3, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
end

HeroWindowIngameView.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowIngameView")

	self.ui_animator = nil

	self._menu_input_description:destroy()

	self._menu_input_description = nil
	local layout_logic = self.layout_logic

	if layout_logic then
		layout_logic:destroy()

		self.layout_logic = nil
	end

	self:_reset_menu_views()
end

HeroWindowIngameView.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local layout_logic = self.layout_logic

	if layout_logic then
		layout_logic:update(dt)
		self:_update_presentation()
	end

	local active_view = self._active_view

	if active_view then
		self._views[active_view]:update(dt, t)
	else
		self:_handle_input(dt, t)
	end

	self:_update_animations(dt)
	self:draw(dt)
end

HeroWindowIngameView.post_update = function (self, dt, t)
	return
end

HeroWindowIngameView._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

HeroWindowIngameView._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.button_text

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowIngameView._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end
end

HeroWindowIngameView._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end

HeroWindowIngameView._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit and not hotspot.is_selected
end

HeroWindowIngameView._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

HeroWindowIngameView._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name
	local input_service = parent:window_input_service()
	local layout_logic = self.layout_logic

	if layout_logic then
		local layout_data = layout_logic:layout_data()
		local num_entries = #layout_data
		local current_index = self._selected_button_index or 1
		local input_made = false
		local title_button_widgets = self._title_button_widgets

		for i, data in ipairs(layout_data) do
			local widget = title_button_widgets[i]
			local disabled = data.disabled

			if i ~= current_index and self:_is_button_hover_enter(widget) and not disabled then
				self:_on_button_selected(i)

				input_made = true
			end

			if self:_is_button_pressed(widget) and not disabled then
				input_made = true

				self:_on_button_pressed(i, data)
			end
		end

		if input_service:get("confirm_press", true) and layout_data[current_index] then
			local data = layout_data[current_index]

			if not data.disabled then
				self:_on_button_pressed(current_index, data)

				input_made = true
			end
		end

		if not input_made then
			local new_index = current_index

			if input_service:get(INPUT_ACTION_PREVIOUS) then
				new_index = self:_get_previous_available_index(current_index)
			elseif input_service:get(INPUT_ACTION_NEXT) then
				new_index = self:_get_next_available_index(current_index)
			end

			if new_index ~= current_index then
				self:_on_button_selected(new_index)
			end
		end
	end
end

HeroWindowIngameView._get_next_available_index = function (self, index)
	local layout_logic = self.layout_logic

	if layout_logic then
		local layout_data = layout_logic:layout_data()
		local num_entries = #layout_data
		local i = index % num_entries + 1

		while i ~= index do
			local data = layout_data[i]

			if not data.disabled then
				return i
			end

			i = i % num_entries + 1
		end
	end

	return index
end

HeroWindowIngameView._get_previous_available_index = function (self, index)
	local layout_logic = self.layout_logic

	if layout_logic then
		local layout_data = layout_logic:layout_data()
		local num_entries = #layout_data
		local i = (index > 1 and index - 1) or num_entries

		while i ~= index do
			local data = layout_data[i]

			if not data.disabled then
				return i
			end

			i = (i > 1 and i - 1) or num_entries
		end
	end

	return index
end

HeroWindowIngameView._on_button_pressed = function (self, index, data)
	self:_play_sound("play_gui_start_menu_button_click")

	local transition = data.transition

	if menu_functions[transition] then
		menu_functions[transition](self)
	else
		self.layout_logic:execute_layout_option(index)
	end
end

HeroWindowIngameView._on_button_selected = function (self, index, ignore_sound)
	local title_button_widgets = self._title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		widget.content.button_hotspot.is_selected = i == index
	end

	if not ignore_sound then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	self._selected_button_index = index
end

HeroWindowIngameView.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local layout_logic = self.layout_logic

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if layout_logic then
		local layout_data = layout_logic:layout_data()
		local title_button_widgets = self._title_button_widgets

		for index, data in ipairs(layout_data) do
			local widget = title_button_widgets[index]
			local content = widget.content
			local button_hotspot = content.button_hotspot
			button_hotspot.disable_button = data.disabled
			content.text_field = (data.display_name_func and data.display_name_func()) or data.display_name

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active and self._menu_input_description and not self._active_view then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowIngameView._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowIngameView._update_presentation = function (self)
	local layout_logic = self.layout_logic
	local layout_data = layout_logic:layout_data()
	local num_entries = #layout_data

	if num_entries ~= self._num_entries then
		local title_button_widgets = self._title_button_widgets
		local spacing = 70
		local total_height = 0

		for index = 1, num_entries, 1 do
			local widget = title_button_widgets[index]
			local offset = widget.offset
			offset[2] = -(spacing * index - 1)
			total_height = total_height + spacing
		end

		local widgets_by_name = self._widgets_by_name
		local background_widget = widgets_by_name.background
		local background_scenegraph_id = background_widget.scenegraph_id
		local ui_scenegraph = self.ui_scenegraph
		ui_scenegraph[background_scenegraph_id].size[2] = total_height + 90
	end
end

return
