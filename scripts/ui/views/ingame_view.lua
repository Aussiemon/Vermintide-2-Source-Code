require("scripts/ui/views/ingame_view_definitions")
require("scripts/ui/views/ingame_view_layout_logic")
require("scripts/ui/views/menu_input_description_ui")

local layout_definitions = local_require("scripts/ui/views/ingame_view_menu_layout")
local generic_input_actions = {
	{
		input_action = "confirm",
		priority = 2,
		description_text = "input_description_open"
	},
	{
		input_action = "back",
		priority = 3,
		description_text = "input_description_close"
	}
}
IngameView = class(IngameView)

IngameView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.menu_active = false
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.network_lobby = ingame_ui_context.network_lobby
	local is_in_inn = ingame_ui_context.is_in_inn
	self.is_server = ingame_ui_context.is_server
	self.layout_logic = IngameViewLayoutLogic:new(ingame_ui_context, layout_definitions.menu_layouts, layout_definitions.full_access_layout)
	self.menu_definition = IngameViewDefinitions

	self:create_ui_elements()

	self.ui_animations = {}
	self.controller_grid_index = {
		x = 1,
		y = 1
	}
	self.controller_cooldown = 0
	local input_service = self.input_manager:get_service("ingame_menu")
	local number_of_actvie_descriptions = 3
	local world = Managers.world:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self._friends_component_ui = FriendsUIComponent:new(ingame_ui_context)
	local gui_layer = self.menu_definition.scenegraph_definition.root.position[3]
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, number_of_actvie_descriptions, gui_layer, generic_input_actions)

	self.menu_input_description:set_input_description(nil)
end

local MENU_ANIMATION_TIME = 0.3

IngameView.on_enter = function (self, menu_to_enter)
	assert(menu_to_enter ~= "MainMenu")

	local had_menu = self.active_menu
	self.active_menu = menu_to_enter
	self.controller_cooldown = 0.2

	self.input_manager:block_device_except_service("ingame_menu", "keyboard", 1)
	self.input_manager:block_device_except_service("ingame_menu", "mouse", 1)
	self.input_manager:block_device_except_service("ingame_menu", "gamepad", 1)

	if script_data.debug_enabled then
		self.input_manager:device_unblock_service("keyboard", 1, "Debug")
	end

	ShowCursorStack.push()
	self:play_sound("Play_hud_button_open")

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
		ShadingEnvironment.apply(shading_env)
	end

	Managers.state.event:trigger("ingame_menu_opened", "interacting")
end

IngameView.on_exit = function (self)
	if self._friends_component_ui:is_active() then
		self._friends_component_ui:deactivate_friends_ui()
	end

	ShowCursorStack.pop()
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	MOOD_BLACKBOARD.menu = false

	self:play_sound("Play_hud_button_close")

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
		ShadingEnvironment.apply(shading_env)
	end
end

IngameView.input_service = function (self)
	return self.input_manager:get_service("ingame_menu")
end

IngameView.create_ui_elements = function (self)
	local widgets = self.menu_definition.widgets
	self.stored_buttons = {
		UIWidget.init(widgets.button_1),
		UIWidget.init(widgets.button_2),
		UIWidget.init(widgets.button_3),
		UIWidget.init(widgets.button_4),
		UIWidget.init(widgets.button_5),
		UIWidget.init(widgets.button_6),
		UIWidget.init(widgets.button_7),
		UIWidget.init(widgets.button_8),
		UIWidget.init(widgets.button_9)
	}

	for _, button_widget in ipairs(self.stored_buttons) do
		button_widget.style.title_text.localize = true
		button_widget.style.title_text_disabled.localize = true
		button_widget.style.title_text_shadow.localize = true
	end

	self.static_widgets = {
		UIWidget.init(widgets.background),
		UIWidget.init(widgets.top_panel),
		UIWidget.init(widgets.left_chain_end)
	}
	self.left_chain_widget = UIWidget.init(widgets.left_chain)
	self.right_chain_widget = UIWidget.init(widgets.right_chain)
	self.console_cursor_widget = UIWidget.init(widgets.console_cursor)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(self.menu_definition.scenegraph_definition)
end

IngameView._update_presentation = function (self)
	local layout_logic = self.layout_logic
	local layout_data = layout_logic:layout_data()
	local num_entries = #layout_data

	if num_entries ~= self._num_entries then
		local controller_selection_index = self.controller_selection_index

		if controller_selection_index and num_entries < controller_selection_index then
			self:controller_select_button_index(num_entries, true)
		end

		self:set_background_height(num_entries)

		self._num_entries = num_entries
	end
end

IngameView.destroy = function (self)
	self.menu_input_description:destroy()

	self.menu_input_description = nil

	self.layout_logic:destroy()

	self.layout_logic = nil
end

IngameView.set_background_height = function (self, num_buttons)
	local button_spacing = self.menu_definition.MENU_BUTTON_SPACING
	local button_size = self.menu_definition.MENU_BUTTON_SIZE
	local button_height = button_size[2]
	local total_button_height = num_buttons * (button_height + button_spacing)
	local ui_scenegraph = self.ui_scenegraph
	local background_size = ui_scenegraph.window.size
	background_size[2] = total_button_height
	local left_chain_widget = self.left_chain_widget
	local left_chain_scenegraph_id = left_chain_widget.scenegraph_id
	ui_scenegraph[left_chain_scenegraph_id].size[2] = total_button_height + 40
	local right_chain_widget = self.right_chain_widget
	local right_chain_scenegraph_id = right_chain_widget.scenegraph_id
	ui_scenegraph[right_chain_scenegraph_id].size[2] = total_button_height + 100
end

IngameView.update = function (self, dt)
	local layout_logic = self.layout_logic

	layout_logic:update(dt)
	self:_update_presentation()

	if self._reinit_menu_input_description_next_update then
		self._reinit_menu_input_description_next_update = nil

		self.menu_input_description:set_input_description(generic_input_actions)
	end

	local ui_top_renderer = self.ui_top_renderer
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = input_manager:is_device_active("gamepad")

	if Managers.account:is_online() then
		self._friends_component_ui:update(dt, input_service)
	end

	local ui_animations = self.ui_animations

	for name, ui_animation in pairs(ui_animations) do
		UIAnimation.update(ui_animation, dt)
	end

	local ui_scenegraph = self.ui_scenegraph

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
	UIRenderer.draw_widget(ui_top_renderer, self.left_chain_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.right_chain_widget)

	for _, widget in ipairs(self.static_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if gamepad_active then
		UIRenderer.draw_widget(ui_top_renderer, self.console_cursor_widget)
	end

	local layout_data = layout_logic:layout_data()
	local ingame_ui = self.ingame_ui

	if layout_data then
		local stored_buttons = self.stored_buttons

		for index, data in ipairs(layout_data) do
			local widget = stored_buttons[index]
			local content = widget.content
			local button_hotspot = content.button_hotspot
			button_hotspot.disable_button = data.disabled
			content.title_text = data.display_name

			UIWidgetUtils.animate_default_button(widget, dt)
			UIRenderer.draw_widget(ui_top_renderer, widget)

			if widget.content.button_hotspot.on_hover_enter then
				self:play_sound("Play_hud_hover")
			end

			if not ingame_ui:pending_transition() then
				local mouse_input_approved = widget.content.button_hotspot.on_release
				local gamepad_input_approved = self.controller_cooldown < 0 and self.controller_selection_index == index and input_service:get("confirm", true)

				if mouse_input_approved or gamepad_input_approved then
					widget.content.button_hotspot.on_release = nil

					self:play_sound("Play_hud_select")
					layout_logic:execute_layout_option(index)

					self._reinit_menu_input_description_next_update = true
					self.controller_cooldown = GamepadSettings.menu_cooldown
				end
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	self.gamepad_active_last_frame = gamepad_active
	local join_lobby_data = self._friends_component_ui:join_lobby_data()

	if join_lobby_data and Managers.matchmaking:allowed_to_initiate_join_lobby() then
		Managers.matchmaking:request_join_lobby(join_lobby_data)
		ingame_ui:handle_transition("exit_menu")
	end

	if (input_service:get("toggle_menu", true) or input_service:get("back", true)) and not ingame_ui:pending_transition() then
		ingame_ui:handle_transition("exit_menu")
	end
end

IngameView.setup_controller_selection = function (self)
	local selection_index = 1

	self:controller_select_button_index(selection_index, true)
end

IngameView.controller_select_button_index = function (self, index, ignore_sound)
	local selection_accepted = false
	local layout_logic = self.layout_logic
	local stored_buttons = self.stored_buttons
	local layout_data = layout_logic:layout_data()
	local widget = stored_buttons[index]
	local new_selection_data = layout_data[index]

	if not new_selection_data or widget.content.button_hotspot.disable_button then
		return selection_accepted
	end

	local gamepad_selection_scenegraph_id = self.gamepad_button_selection_widget.scenegraph_id
	local gamepad_selection_default_position = self.menu_definition.scenegraph_definition[gamepad_selection_scenegraph_id].position
	local gamepad_selection_current_position = self.ui_scenegraph[gamepad_selection_scenegraph_id].local_position

	for i, data in ipairs(layout_data) do
		local button_widget = stored_buttons[i]
		local is_selected = i == index
		button_widget.content.button_hotspot.is_selected = is_selected

		if is_selected then
			local widget_scenegraph_id = button_widget.scenegraph_id
			local widget_current_position = self.ui_scenegraph[widget_scenegraph_id].local_position
			gamepad_selection_current_position[2] = gamepad_selection_default_position[2] - i * 84
		end
	end

	if not ignore_sound and index ~= self.controller_selection_index then
		self:play_sound("Play_hud_hover")
	end

	self.controller_selection_index = index
	selection_accepted = true

	return selection_accepted
end

IngameView.clear_controller_selection = function (self)
	local layout_logic = self.layout_logic
	local stored_buttons = self.stored_buttons
	local layout_data = layout_logic:layout_data()

	for i, data in ipairs(layout_data) do
		local widget = stored_buttons[i]
		widget.content.button_hotspot.is_selected = false
	end
end

IngameView.update_controller_input = function (self, input_service, dt)
	local layout_logic = self.layout_logic
	local layout_data = layout_logic:layout_data()
	local num_buttons = #layout_data

	if self.controller_cooldown > 0 then
		self.controller_cooldown = self.controller_cooldown - dt
		local speed_multiplier = self.speed_multiplier or 1
		local decrease = GamepadSettings.menu_speed_multiplier_frame_decrease
		local min_multiplier = GamepadSettings.menu_min_speed_multiplier
		self.speed_multiplier = math.max(speed_multiplier - decrease, min_multiplier)

		return
	else
		local speed_multiplier = self.speed_multiplier or 1

		repeat
			local move_up = input_service:get("move_up")
			local move_up_hold = input_service:get("move_up_hold")
			local controller_selection_index = self.controller_selection_index or 0

			if move_up or move_up_hold then
				local new_index = math.max(controller_selection_index - 1, 1)
				local selection_accepted = self:controller_select_button_index(new_index)

				while not selection_accepted do
					new_index = math.max(new_index - 1, 1)
					selection_accepted = self:controller_select_button_index(new_index)
				end

				self.controller_cooldown = GamepadSettings.menu_cooldown * speed_multiplier

				return
			end

			local move_down = input_service:get("move_down")
			local move_down_hold = input_service:get("move_down_hold")

			if move_down or move_down_hold then
				local new_index = math.min(controller_selection_index + 1, num_buttons)
				local selection_accepted = self:controller_select_button_index(new_index)

				while not selection_accepted do
					new_index = math.min(new_index + 1, num_buttons)
					selection_accepted = self:controller_select_button_index(new_index)
				end

				self.controller_cooldown = GamepadSettings.menu_cooldown * speed_multiplier

				return
			end
		until true
	end

	self.speed_multiplier = 1
end

IngameView.get_transition = function (self)
	if self.leave_game then
		return "leave_game"
	end
end

IngameView.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

return
