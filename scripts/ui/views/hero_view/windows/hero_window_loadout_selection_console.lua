-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_loadout_selection_console.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_loadout_selection_console_definitions")
local widget_definitions = definitions.widgets
local loadout_button_widgets_definitions = definitions.loadout_button_widgets
local gamepad_specific_widgets_definitions = definitions.gamepad_specific_widgets
local context_menu_widgets_definitions = definitions.context_menu_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local BUTTON_SIZE = definitions.button_size
local BUTTON_SPACING = definitions.button_spacing
local equipment_slots = definitions.equipment_slots
local cosmetic_slots = definitions.cosmetic_slots
local generic_input_actions = definitions.generic_input_actions

HeroWindowLoadoutSelectionConsole = class(HeroWindowLoadoutSelectionConsole)
HeroWindowLoadoutSelectionConsole.NAME = "HeroWindowLoadoutSelectionConsole"

HeroWindowLoadoutSelectionConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowLoadoutSelectionConsole")

	self._parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		snap_pixel_positions = true,
	}

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self._player_manager = player_manager
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer
	self._peer_id = ingame_ui_context.peer_id
	self._local_player_id = ingame_ui_context.local_player_id
	self._game_mode_key = Managers.state.game_mode:game_mode_key()
	self._hero_name = params.hero_name
	self._career_index = params.career_index
	self._profile_index = params.profile_index
	self._animations = {}
	self._ui_animations = {}
	self._gamepad_loadout_grid = {}
	self._gamepad_grid_index = {}

	self:_create_ui_elements(params, offset)
	self:_hide_context_menu()
	self:_start_transition_animation("on_enter")

	local input_service = Managers.input:get_service("hero_view")
	local gui_layer = UILayer.default + 300
	local default_input_actions = generic_input_actions.default

	if self._num_loadouts <= 1 then
		default_input_actions = generic_input_actions.default_no_delete
	end

	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 7, gui_layer, default_input_actions, true)

	self._menu_input_description:set_input_description(nil)
end

HeroWindowLoadoutSelectionConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

HeroWindowLoadoutSelectionConsole._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets

	local loadout_button_widgets = {}

	for name, widget_definition in pairs(loadout_button_widgets_definitions) do
		local widget = UIWidget.init(widget_definition)

		loadout_button_widgets[#loadout_button_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._loadout_button_widgets = loadout_button_widgets

	local context_menu_widgets = {}

	for name, widget_definition in pairs(context_menu_widgets_definitions) do
		local widget = UIWidget.init(widget_definition)

		context_menu_widgets[#context_menu_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	widgets_by_name.delete_button_bar.content.visible = false
	widgets_by_name.delete_button_bar_edge.content.visible = false
	self._context_menu_widgets = context_menu_widgets

	local gamepad_specific_widgets = {}

	for name, widget_definition in pairs(gamepad_specific_widgets_definitions) do
		local widget = UIWidget.init(widget_definition)

		gamepad_specific_widgets[#gamepad_specific_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._gamepad_specific_widgets = gamepad_specific_widgets

	local bot_checkbox_widget = widgets_by_name.bot_checkbox

	bot_checkbox_widget.content.visible = InventorySettings.bot_loadout_allowed_game_modes[self._game_mode_key] or false
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self:_populate_loadout_buttons()
end

HeroWindowLoadoutSelectionConsole._populate_loadout_buttons = function (self)
	local profile = SPProfiles[self._profile_index]
	local career_settings = profile.careers[self._career_index]
	local career_name = career_settings.name
	local item_interface = Managers.backend:get_interface("items")
	local career_loadouts = item_interface:get_career_loadouts(career_name)
	local selected_loadout_index = item_interface:get_selected_career_loadout(career_name)

	self._num_loadouts = #career_loadouts

	if selected_loadout_index > self._num_loadouts then
		selected_loadout_index = 1
	end

	self._max_loadouts = 0

	for _, loadout_setting in ipairs(InventorySettings.loadouts) do
		if loadout_setting.loadout_type == "custom" then
			self._max_loadouts = self._max_loadouts + 1
		end
	end

	local add_loadout_button = self._widgets_by_name.add_loadout_button

	add_loadout_button.content.button_hotspot.disable_button = self._num_loadouts >= self._max_loadouts
	self._selected_loadout_index = selected_loadout_index

	if InventorySettings.bot_loadout_allowed_game_modes[self._game_mode_key] then
		PlayerData.loadout_selection = PlayerData.loadout_selection or {}
		PlayerData.loadout_selection.bot_equipment = PlayerData.loadout_selection.bot_equipment or {}

		local bot_equipment_index = PlayerData.loadout_selection.bot_equipment[career_name]

		if not bot_equipment_index or bot_equipment_index > self._num_loadouts then
			PlayerData.loadout_selection.bot_equipment[career_name] = selected_loadout_index
		end
	end

	for idx, loadout_button_widget in ipairs(self._loadout_button_widgets) do
		local content = loadout_button_widget.content

		content.visible = career_loadouts[idx] ~= nil
		content.is_selected = idx == self._selected_loadout_index
		content.loadout = career_loadouts[idx]
		content.loadout_index = idx
		content.career_name = career_name
	end

	local frame_widget = self._widgets_by_name.loadout_frame
	local loadout_button_widget = self._loadout_button_widgets[selected_loadout_index]
	local offset = loadout_button_widget.offset

	frame_widget.offset[1] = offset[1]
	frame_widget.offset[3] = -10
	self._ui_scenegraph.button.offset[1] = -(BUTTON_SIZE[1] + BUTTON_SPACING) * (self._num_loadouts - 1)
end

HeroWindowLoadoutSelectionConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowLoadoutSelectionConsole")

	self._ui_animator = nil

	if not InventorySettings.save_local_loadout_selection[self._game_mode_key] then
		return
	end

	local local_player = Managers.player:local_player()
	local career_name = local_player and local_player:career_name()

	if career_name and self._selected_loadout_index then
		local selected_loadout_index

		for index, loadout_data in ipairs(InventorySettings.loadouts) do
			local loadout_index = loadout_data.loadout_index

			if loadout_data.loadout_type == "custom" and loadout_index == self._selected_loadout_index then
				selected_loadout_index = index

				break
			end
		end

		if not selected_loadout_index then
			return
		end

		local mechanism_name = Managers.mechanism:current_mechanism_name()

		PlayerData.loadout_selection = PlayerData.loadout_selection or {}
		PlayerData.loadout_selection[mechanism_name] = PlayerData.loadout_selection[mechanism_name] or {}
		PlayerData.loadout_selection[mechanism_name][career_name] = selected_loadout_index

		Managers.save:auto_save(SaveFileName, SaveData, nil)
	end
end

HeroWindowLoadoutSelectionConsole.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_draw(dt)
end

HeroWindowLoadoutSelectionConsole.post_update = function (self, dt, t)
	return
end

HeroWindowLoadoutSelectionConsole._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

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

	for _, widget in ipairs(self._loadout_button_widgets) do
		UIWidgetUtils.animate_default_button(widget, dt)
	end

	local add_loadout_button_widget = self._widgets_by_name.add_loadout_button

	UIWidgetUtils.animate_default_button(add_loadout_button_widget, dt)

	if InventorySettings.bot_loadout_allowed_game_modes[self._game_mode_key] then
		local bot_checkbox_widget = self._widgets_by_name.bot_checkbox

		UIWidgetUtils.animate_default_checkbox_button(bot_checkbox_widget, dt)
	end

	if self._context_menu_active then
		local delete_button_widget = self._widgets_by_name.delete_button

		UIWidgetUtils.animate_default_button(delete_button_widget, dt)
	end
end

HeroWindowLoadoutSelectionConsole._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active ~= self._gamepad_active_last_frame then
		self:_hide_context_menu()
	end

	self._gamepad_active_last_frame = gamepad_active
end

HeroWindowLoadoutSelectionConsole._handle_input = function (self, dt, t)
	self:_handle_gamepad_activity(dt, t)

	local input_service = self:_get_input_service()
	local mouse_active = Managers.input:is_device_active("mouse")

	if mouse_active then
		self:_handle_mouse_input(input_service, dt, t)
	else
		self:_handle_gamepad_input(input_service, dt, t)
	end
end

HeroWindowLoadoutSelectionConsole._get_input_service = function (self)
	return (self._context_menu_active or self._on_add_loadout_button) and Managers.input:get_service("hero_view") or self._parent:window_input_service()
end

HeroWindowLoadoutSelectionConsole._update_selection_frame = function (self, loadout_button_widget)
	local content = loadout_button_widget.content
	local loadout_index = content.loadout_index
	local frame_widget = self._widgets_by_name.hover_loadout_frame

	if loadout_index ~= self._selected_loadout_index then
		local offset = loadout_button_widget.offset

		frame_widget.offset = table.clone(offset)
		frame_widget.content.visible = true
		frame_widget.content.loadout_index = loadout_index
	else
		frame_widget.content.visible = false
	end
end

HeroWindowLoadoutSelectionConsole._update_button_hover = function (self, loadout_button_widget, t)
	self:_update_selection_frame(loadout_button_widget)

	local hover_enter_time = loadout_button_widget.content.hover_enter_time or math.huge

	if hover_enter_time < t and not self._context_menu_active then
		self:_show_context_menu(loadout_button_widget)
	end
end

HeroWindowLoadoutSelectionConsole._reset_hover_frame = function (self)
	local frame_widget = self._widgets_by_name.hover_loadout_frame

	if self._context_menu_active then
		if frame_widget.content.loadout_index ~= self._context_menu_loadout_index then
			frame_widget.content.visible = false
		end
	else
		frame_widget.content.visible = false
	end
end

HeroWindowLoadoutSelectionConsole._handle_mouse_input = function (self, input_service, dt, t)
	local loadout_button_index_hovered

	self:_reset_hover_frame()

	for idx, loadout_button_widget in ipairs(self._loadout_button_widgets) do
		if UIUtils.is_button_hover_enter(loadout_button_widget) then
			loadout_button_widget.content.hover_enter_time = t + 0

			self:_play_sound("Play_hud_hover")
		elseif UIUtils.is_button_hover(loadout_button_widget) then
			self:_update_button_hover(loadout_button_widget, t)

			loadout_button_index_hovered = idx
		end

		if UIUtils.is_button_pressed(loadout_button_widget) then
			local content = loadout_button_widget.content

			self:_change_loadout(idx)

			return
		end
	end

	local context_menu_widget_hotspot = self._widgets_by_name.context_menu_hotspot

	if self._context_menu_active and UIUtils.is_button_hover(context_menu_widget_hotspot) or loadout_button_index_hovered == self._context_menu_loadout_index then
		self:_handle_context_menu_input(input_service, dt, t)

		context_menu_widget_hotspot.content.hover_timer = t + 0.1
	elseif self._context_menu_active and (loadout_button_index_hovered or t > (context_menu_widget_hotspot.content.hover_timer or 0)) then
		self:_hide_context_menu()
	end

	local add_loadout_button_widget = self._widgets_by_name.add_loadout_button

	if UIUtils.is_button_hover_enter(add_loadout_button_widget) then
		self:_play_sound("Play_hud_hover")
	elseif UIUtils.is_button_pressed(add_loadout_button_widget) then
		self:_add_loadout()
	end
end

HeroWindowLoadoutSelectionConsole._handle_gamepad_input = function (self, input_service, dt, t)
	if self._inside_context_menu then
		self:_handle_context_menu_gamepad_input(input_service, dt, t)
	elseif self._on_add_loadout_button then
		self:_handle_add_loadout_gamepad_input(input_service, dt, t)
	elseif self._context_menu_active then
		if input_service:get("move_left") or input_service:get("trigger_cycle_previous") then
			local old_context_menu_loadout_index = self._context_menu_loadout_index
			local new_context_menu_loadout_index = math.max(old_context_menu_loadout_index - 1, 1)

			if old_context_menu_loadout_index ~= new_context_menu_loadout_index then
				self:_hide_context_menu()

				local loadout_button_widget = self._loadout_button_widgets[new_context_menu_loadout_index]

				self:_show_context_menu(loadout_button_widget)
				self:_update_selection_frame(loadout_button_widget)
			end
		elseif input_service:get("move_right") or input_service:get("trigger_cycle_next") then
			local old_context_menu_loadout_index = self._context_menu_loadout_index
			local new_context_menu_loadout_index = math.min(old_context_menu_loadout_index + 1, self._num_loadouts)

			if old_context_menu_loadout_index ~= new_context_menu_loadout_index then
				self:_hide_context_menu()

				local loadout_button_widget = self._loadout_button_widgets[new_context_menu_loadout_index]

				self:_show_context_menu(loadout_button_widget)
				self:_update_selection_frame(loadout_button_widget)
			elseif self._num_loadouts < self._max_loadouts then
				self:_on_enter_add_loadout_gamepad()
			end
		elseif input_service:get("special_1") then
			self:_enter_details_menu()
		elseif input_service:get("back") or input_service:get("right_stick_press") or input_service:get("toggle_menu") then
			self:_hide_context_menu()
		elseif input_service:get("confirm") then
			self:_change_loadout(self._context_menu_loadout_index)
		elseif input_service:get("left_stick_press") then
			if InventorySettings.bot_loadout_allowed_game_modes[self._game_mode_key] then
				local bot_checkbox_widget = self._widgets_by_name.bot_checkbox
				local content = bot_checkbox_widget.content

				content.button_hotspot.is_selected = true
				content.button_hotspot.disable_button = true

				self:_save_bot_equipment()
			end
		else
			self:_handle_delete_input(input_service, dt, t)
		end
	elseif input_service:get("right_stick_press") then
		local loadout_button_widget = self._loadout_button_widgets[self._selected_loadout_index]

		if not loadout_button_widget then
			return
		end

		self:_show_context_menu(loadout_button_widget)
		self:_update_selection_frame(loadout_button_widget)

		local unselect_all = true

		self:_update_gamepad_selections(unselect_all)

		self._inside_context_menu = false

		self._parent:block_input()
	elseif input_service:get("trigger_cycle_next") then
		local loadout_index = math.min(self._selected_loadout_index + 1, self._num_loadouts)

		self:_change_loadout(loadout_index)
	elseif input_service:get("trigger_cycle_previous") then
		local loadout_index = math.max(self._selected_loadout_index - 1, 1)

		self:_change_loadout(loadout_index)
	end
end

HeroWindowLoadoutSelectionConsole._handle_add_loadout_gamepad_input = function (self, input_service, dt, t)
	if input_service:get("confirm") then
		self:_add_loadout()

		local unselect_all = true

		self:_update_gamepad_selections(unselect_all)

		self._inside_context_menu = false

		self:_hide_context_menu()
	elseif input_service:get("back") or input_service:get("right_stick_press") or input_service:get("toggle_menu") then
		self:_hide_context_menu()
	elseif input_service:get("move_left") or input_service:get("trigger_cycle_previous") then
		local loadout_button_widget = self._loadout_button_widgets[self._num_loadouts]

		self:_show_context_menu(loadout_button_widget)
		self:_update_selection_frame(loadout_button_widget)

		local unselect_all = true

		self:_update_gamepad_selections(unselect_all)

		self._inside_context_menu = false

		if self._num_loadouts > 1 then
			self._menu_input_description:change_generic_actions(generic_input_actions.default)
		else
			self._menu_input_description:change_generic_actions(generic_input_actions.default_no_delete)
		end

		self._parent:block_input()
	end
end

HeroWindowLoadoutSelectionConsole._on_enter_add_loadout_gamepad = function (self)
	self:_hide_context_menu()

	self._on_add_loadout_button = true

	local hover_loadout_frame = self._widgets_by_name.hover_loadout_frame

	hover_loadout_frame.content.visible = true
	hover_loadout_frame.offset[1] = self._num_loadouts * (BUTTON_SIZE[1] + BUTTON_SPACING)

	if self._num_loadouts >= self._max_loadouts then
		self._menu_input_description:change_generic_actions(generic_input_actions.add_loadout_no_add)
	else
		self._menu_input_description:change_generic_actions(generic_input_actions.add_loadout)
	end

	self._parent:block_input()
end

HeroWindowLoadoutSelectionConsole._enter_details_menu = function (self)
	self._inside_context_menu = true

	table.clear(self._gamepad_grid_index)
	self:_update_gamepad_selections()
	self._menu_input_description:change_generic_actions(generic_input_actions.details)
end

HeroWindowLoadoutSelectionConsole._exit_details_menu = function (self)
	self._inside_context_menu = nil

	table.clear(self._gamepad_grid_index)

	local unselect_all = true

	self:_update_gamepad_selections(unselect_all)

	if self._num_loadouts > 1 then
		self._menu_input_description:change_generic_actions(generic_input_actions.default)
	else
		self._menu_input_description:change_generic_actions(generic_input_actions.default_no_delete)
	end
end

HeroWindowLoadoutSelectionConsole._handle_context_menu_gamepad_input = function (self, input_service, dt, t)
	local new_selection = false
	local row_index = self._gamepad_grid_index[1]
	local column_index = self._gamepad_grid_index[2]
	local new_row_index = row_index or #self._gamepad_loadout_grid
	local new_column_index = column_index or 1

	if input_service:get("move_left") then
		new_column_index = math.max(column_index - 1, 1)
	elseif input_service:get("move_right") then
		local row_selection = self._gamepad_loadout_grid[row_index]

		new_column_index = math.min(column_index + 1, #row_selection)
	elseif input_service:get("move_up") then
		local rows = #self._gamepad_loadout_grid

		new_row_index = math.min(row_index + 1, rows)
	elseif input_service:get("move_down") then
		local rows = #self._gamepad_loadout_grid

		new_row_index = math.max(row_index - 1, 1)
	elseif input_service:get("special_1") or input_service:get("back") then
		self:_exit_details_menu()

		return
	elseif input_service:get("right_stick_press") then
		self:_exit_details_menu()
		self:_hide_context_menu()
	elseif input_service:get("toggle_menu") then
		self:_exit_details_menu()
		self:_hide_context_menu()
	else
		self:_handle_delete_input(input_service, dt, t)
	end

	if new_row_index ~= row_index then
		self._gamepad_grid_index[1] = new_row_index

		local column_items = self._gamepad_loadout_grid[new_row_index]

		self._gamepad_grid_index[2] = math.clamp(new_column_index, 1, #column_items)

		self:_update_gamepad_selections()
	elseif new_column_index ~= column_index then
		self._gamepad_grid_index[2] = new_column_index

		self:_update_gamepad_selections()
	end
end

HeroWindowLoadoutSelectionConsole._handle_delete_input = function (self, input_service, dt, t)
	if self._num_loadouts == 1 then
		return
	end

	local delete_button = self._widgets_by_name.delete_button
	local time = 1
	local delete_progress = self._delete_progress or 0

	if input_service:get("refresh_hold") or UIUtils.is_button_held(delete_button) and UIUtils.is_button_hover(delete_button) then
		if not self._delete_started then
			self._delete_started = true

			self:_play_sound("Play_gui_loadout_delete_start")
		end

		delete_progress = math.min(delete_progress + dt / time, 1)
	else
		delete_progress = math.max(delete_progress - dt * time, 0)

		if self._delete_started then
			self._delete_started = false

			self:_play_sound("Stop_gui_loadout_delete_start")
		end
	end

	local eased_progress = math.easeOutCubic(delete_progress)

	self._ui_scenegraph.delete_button_bar.size[1] = 172 * eased_progress

	local delete_button_bar = self._widgets_by_name.delete_button_bar

	delete_button_bar.content.texture_id.uvs[2][1] = eased_progress

	if delete_progress >= 1 then
		self:_delete_loadout()
	else
		self._delete_progress = delete_progress
	end
end

HeroWindowLoadoutSelectionConsole._handle_bot_checkbox_input = function (self, input_service, dt, t)
	if InventorySettings.bot_loadout_allowed_game_modes[self._game_mode_key] then
		local bot_checkbox_widget = self._widgets_by_name.bot_checkbox

		if UIUtils.is_button_pressed(bot_checkbox_widget) then
			local content = bot_checkbox_widget.content

			content.button_hotspot.is_selected = true
			content.button_hotspot.disable_button = true

			self:_save_bot_equipment()
		end
	end
end

HeroWindowLoadoutSelectionConsole._save_bot_equipment = function (self)
	local profile_index = self._profile_index
	local career_index = self._career_index
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local profile_name = profile.display_name
	local career_name = career_settings.name

	PlayerData.loadout_selection.bot_equipment[career_name] = self._context_menu_loadout_index

	local item_interface = Managers.backend:get_interface("items")

	item_interface:refresh_bot_loadouts()
end

HeroWindowLoadoutSelectionConsole._update_gamepad_selections = function (self, unselect_all)
	local row_index = unselect_all and 0 or self._gamepad_grid_index[1]
	local column_index = unselect_all and 0 or self._gamepad_grid_index[2]

	for row, row_content in ipairs(self._gamepad_loadout_grid) do
		for column, content in ipairs(row_content) do
			content.is_selected = column == column_index and row == row_index
		end
	end
end

HeroWindowLoadoutSelectionConsole._handle_context_menu_input = function (self, input_service, dt, t)
	local delete_button = self._widgets_by_name.delete_button
	local context_menu_hotspot = self._widgets_by_name.context_menu_hotspot
	local esc_pressed = input_service:get("toggle_menu", true)

	if esc_pressed then
		self:_hide_context_menu()

		return
	end

	local left_press = input_service:get("left_press")
	local right_press = input_service:get("right_press")
	local loadout_button = self._loadout_button_widgets[self._context_menu_loadout_index]

	if not UIUtils.is_button_hover(context_menu_hotspot) and (left_press or right_press) and not UIUtils.is_button_hover(loadout_button) then
		self:_hide_context_menu()
	else
		self:_handle_delete_input(input_service, dt, t)
		self:_handle_bot_checkbox_input(input_service, dt, t)
	end
end

HeroWindowLoadoutSelectionConsole._delete_loadout = function (self)
	local profile = SPProfiles[self._profile_index]
	local career_settings = profile.careers[self._career_index]
	local career_name = career_settings.name
	local backend_items = Managers.backend:get_interface("items")

	backend_items:delete_loadout(career_name, self._context_menu_loadout_index)
	self:_populate_loadout_buttons()
	self._parent:update_full_loadout()

	self._delete_progress = 0

	self:_exit_details_menu()
	self:_hide_context_menu()
	self:_play_sound("Play_gui_loadout_delete_finish")
end

HeroWindowLoadoutSelectionConsole._hide_context_menu = function (self)
	self._context_menu_active = false
	self._inside_context_menu = false
	self._on_add_loadout_button = false

	local unselect_all = true

	self:_update_gamepad_selections(unselect_all)
	self:_reset_hover_frame()
	self._parent:unblock_input()
end

HeroWindowLoadoutSelectionConsole._show_context_menu = function (self, loadout_button_widget)
	self._context_menu_active = true
	self._on_add_loadout_button = false

	local offset = loadout_button_widget.offset

	self._ui_scenegraph.context_menu.offset[1] = offset[1]

	local content = loadout_button_widget.content
	local loadout_index = content.loadout_index
	local loadout = content.loadout

	self:_populate_context_menu_loadout(loadout, loadout_index)

	local context_frame = self._widgets_by_name.context_menu_bg
	local context_frame_white = self._widgets_by_name.context_menu_bg_white

	if loadout_index == self._selected_loadout_index then
		context_frame.content.visible = true
		context_frame_white.content.visible = false
	else
		context_frame.content.visible = false
		context_frame_white.content.visible = true
	end

	for idx, loadout_button in ipairs(self._loadout_button_widgets) do
		loadout_button.offset[3] = idx == loadout_index and -20 or -100
	end

	self._delete_progress = 0
	self._ui_scenegraph.delete_button_bar.size[1] = 0

	local delete_button = self._widgets_by_name.delete_button

	delete_button.content.visible = self._num_loadouts > 1
	delete_button.content.title_text = Localize("input_description_delete_loadout") .. " " .. loadout_index

	local delete_button_bar = self._widgets_by_name.delete_button_bar

	delete_button_bar.content.texture_id.uvs[2][1] = 0
	delete_button_bar.content.visible = self._num_loadouts > 1

	local delete_button_bar_edge = self._widgets_by_name.delete_button_bar_edge

	delete_button_bar_edge.content.visible = self._num_loadouts > 1
	self._context_menu_loadout_index = loadout_index

	self._parent:block_input()

	if self._num_loadouts > 1 then
		self._menu_input_description:change_generic_actions(generic_input_actions.default)
	else
		self._menu_input_description:change_generic_actions(generic_input_actions.default_no_delete)
	end
end

local EMPTY_TABLE = {}

HeroWindowLoadoutSelectionConsole._populate_context_menu_loadout = function (self, loadout, loadout_index)
	self._gamepad_loadout_grid = {}

	local profile_index = self._profile_index
	local career_index = self._career_index
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local profile_name = profile.display_name
	local career_name = career_settings.name
	local custom_loadout_settings = {}

	for _, loadout_setting in ipairs(InventorySettings.loadouts) do
		if loadout_setting.loadout_type == "custom" then
			custom_loadout_settings[#custom_loadout_settings + 1] = loadout_setting
		end
	end

	local loadout_settings = custom_loadout_settings[loadout_index]
	local icon_widget = self._widgets_by_name.icon
	local header_widget = self._widgets_by_name.header

	icon_widget.content.texture_id = loadout_settings.loadout_icon or "icons_placeholder"
	header_widget.content.text = Localize("custom_loadout_" .. loadout_settings.loadout_index .. "_title")

	local item_interface = Managers.backend:get_interface("items")
	local widget = self._widgets_by_name.cosmetics
	local content = widget.content
	local cosmetic_gamepad_grid

	for i, cosmetic_slot in ipairs(cosmetic_slots) do
		local item

		if CosmeticUtils.is_cosmetic_slot(cosmetic_slot) then
			local item_id = loadout[cosmetic_slot]
			local backend_id = item_interface:get_backend_id_from_cosmetic_item(item_id)

			item = item_interface:get_item_from_id(backend_id)
		elseif cosmetic_slot == "slot_pose" then
			local item_id = loadout[cosmetic_slot]
			local backend_id = item_id and item_interface:get_backend_id_from_unlocked_weapon_poses(item_id)

			item = backend_id and item_interface:get_item_from_id(backend_id)
		else
			item = BackendUtils.get_loadout_item(career_name, cosmetic_slot)
		end

		if item then
			content[cosmetic_slot].item = item
			content[cosmetic_slot].icon = item.data.inventory_icon or item.data.hud_icon
			content[cosmetic_slot].profile_index = self._profile_index
			content[cosmetic_slot].career_index = self._career_index
			content[cosmetic_slot].rarity = UISettings.item_rarity_textures[item.rarity]
			cosmetic_gamepad_grid = cosmetic_gamepad_grid or {}
			cosmetic_gamepad_grid[#cosmetic_gamepad_grid + 1] = content[cosmetic_slot]
		else
			Application.warning(string.format("[HeroWindowLoadoutSelectionConsole] Missing %q for loadout_index: %q", cosmetic_slot, loadout_index))
		end
	end

	self._gamepad_loadout_grid[#self._gamepad_loadout_grid + 1] = cosmetic_gamepad_grid

	local talent_interface = Managers.backend:get_interface("talents")
	local career_talents = talent_interface:get_career_talents(career_name)
	local loadout_talents = career_talents[loadout_index]
	local loadout_talent_ids = talent_interface:get_career_talent_ids(career_name, loadout_index)
	local widget = self._widgets_by_name.talents
	local content = widget.content
	local talent_gamepad_grid
	local talent_num = 1

	for i = 1, MaxTalentPoints do
		local talent_id = "talent_" .. i
		local talent_content = content[talent_id]

		if loadout_talents[i] ~= 0 then
			local id = loadout_talent_ids[talent_num]
			local talent = TalentUtils.get_talent_by_id(profile_name, id)
			local talent_icon = talent and talent.icon

			if not talent_icon then
				talent = nil
			end

			talent_content.icon = talent_icon
			talent_content.talent = talent
			talent_num = talent_num + 1

			if talent then
				talent_gamepad_grid = talent_gamepad_grid or {}
				talent_gamepad_grid[#talent_gamepad_grid + 1] = talent_content
			end
		else
			talent_content.talent = nil
		end
	end

	self._gamepad_loadout_grid[#self._gamepad_loadout_grid + 1] = talent_gamepad_grid

	local widget = self._widgets_by_name.equipment
	local content = widget.content
	local equipment_gamepad_grid

	for i, eqiupment_slot in ipairs(equipment_slots) do
		local item

		if loadout then
			local backend_id = loadout[eqiupment_slot]

			item = item_interface:get_item_from_id(backend_id)
		else
			item = BackendUtils.get_loadout_item(career_name, eqiupment_slot)
		end

		local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)

		content[eqiupment_slot].item = item
		content[eqiupment_slot].rarity = UISettings.item_rarity_textures[item.rarity]
		content[eqiupment_slot].icon = inventory_icon
		content[eqiupment_slot].profile_index = self._profile_index
		content[eqiupment_slot].career_index = self._career_index
		equipment_gamepad_grid = equipment_gamepad_grid or {}
		equipment_gamepad_grid[#equipment_gamepad_grid + 1] = content[eqiupment_slot]
	end

	self._gamepad_loadout_grid[#self._gamepad_loadout_grid + 1] = equipment_gamepad_grid

	local bot_equipment = PlayerData.loadout_selection and PlayerData.loadout_selection.bot_equipment
	local bot_equipped
	local bot_equipped_index = bot_equipment and bot_equipment[career_name]

	if bot_equipped_index then
		bot_equipped = bot_equipped_index == loadout_index
	else
		bot_equipped = loadout_index == self._selected_loadout_index
	end

	local bot_checkbox_widget = self._widgets_by_name.bot_checkbox
	local content = bot_checkbox_widget.content

	content.button_hotspot.is_selected = bot_equipped
	content.button_hotspot.disable_button = bot_equipped
end

HeroWindowLoadoutSelectionConsole._change_loadout = function (self, loadout_index)
	if loadout_index and loadout_index ~= self._selected_loadout_index then
		local profile = SPProfiles[self._profile_index]
		local career_settings = profile.careers[self._career_index]
		local career_name = career_settings.name
		local item_interface = Managers.backend:get_interface("items")

		item_interface:set_loadout_index(career_name, loadout_index)

		local selected_loadout_index = item_interface:get_selected_career_loadout(career_name)

		if selected_loadout_index > self._num_loadouts then
			selected_loadout_index = 1
		end

		self._selected_loadout_index = selected_loadout_index

		local frame_widget = self._widgets_by_name.loadout_frame
		local loadout_button_widget = self._loadout_button_widgets[loadout_index]
		local offset = loadout_button_widget.offset

		frame_widget.offset = table.clone(offset)

		self._parent:update_full_loadout()
		self:_play_sound("Play_gui_loadout_select")
		self:_hide_context_menu()
		self._parent:set_loadout_dirty()
	end
end

HeroWindowLoadoutSelectionConsole._add_loadout = function (self)
	local num_loadout_buttons = #self._loadout_button_widgets

	if num_loadout_buttons >= self._num_loadouts + 1 then
		local profile = SPProfiles[self._profile_index]
		local career_settings = profile.careers[self._career_index]
		local career_name = career_settings.name
		local item_interface = Managers.backend:get_interface("items")

		item_interface:add_loadout(career_name)
		self:_play_sound("Play_gui_loadout_add")
		self._parent:update_full_loadout()
		self:_populate_loadout_buttons()
	end
end

HeroWindowLoadoutSelectionConsole.set_focus = function (self, focused)
	self._focused = focused
end

HeroWindowLoadoutSelectionConsole._exit = function (self)
	self.exit = true
end

HeroWindowLoadoutSelectionConsole._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self:_get_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._loadout_button_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._context_menu_active then
		for _, widget in ipairs(self._context_menu_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	if gamepad_active and (self._context_menu_active or self._on_add_loadout_button) then
		for _, widget in ipairs(self._gamepad_specific_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active and (self._context_menu_active or self._on_add_loadout_button) then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowLoadoutSelectionConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end
