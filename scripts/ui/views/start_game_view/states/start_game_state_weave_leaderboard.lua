require("scripts/helpers/weave_utils")

local definitions = local_require("scripts/ui/views/start_game_view/states/definitions/start_game_state_weave_leaderboard_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local console_cursor_definition = definitions.console_cursor_definition
local generic_input_actions = definitions.generic_input_actions
local DO_RELOAD = false
local LIST_EDGE_SPACING = 20
local LIST_SPACING = 4
local LIST_MAX_WIDTH = 800
local LIST_PRESENTATION_AMOUNT = 12
local LIST_FADE_IN_DURATION = 0.3
local MIN_TIME_BETWEEN_LEADERBOARD_REQUESTS = 1.5
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
StartGameStateWeaveLeaderboard = class(StartGameStateWeaveLeaderboard)
StartGameStateWeaveLeaderboard.NAME = "StartGameStateWeaveLeaderboard"

StartGameStateWeaveLeaderboard.on_enter = function (self, params)
	print("[StartGameState] Enter Substate StartGameStateWeaveLeaderboard")

	self.parent = params.parent
	local use_gamepad_layout = false
	self._gamepad_style_active = use_gamepad_layout
	self._wwise_world = params.wwise_world
	self._hero_name = params.hero_name
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self._animations = {}
	self._ui_animations = {}
	self._is_open = true
	self._close_on_exit = true

	self:_create_ui_elements(params)

	if params.initial_state then
		params.initial_state = nil

		self:_start_transition_animation("on_enter", "on_enter")
	end

	if self._gamepad_style_active then
		self:disable_player_world()
	end

	local stepper_1_data = {
		{
			value = 1,
			text = Localize("menu_weave_leaderboard_filter_option_players_1")
		},
		{
			value = 2,
			text = Localize("menu_weave_leaderboard_filter_option_players_2")
		},
		{
			value = 3,
			text = Localize("menu_weave_leaderboard_filter_option_players_3")
		},
		{
			value = 4,
			text = Localize("menu_weave_leaderboard_filter_option_players_4")
		}
	}
	local stepper_2_data = {
		{
			value = 1,
			text = Localize("menu_weave_leaderboard_filter_option_global")
		},
		{
			value = 2,
			text = Localize("menu_weave_leaderboard_filter_option_friends")
		}
	}

	self:_initialize_stepper(1, Localize("menu_weave_leaderboard_filter_title_team_size"), stepper_1_data, 4)
	self:_initialize_stepper(2, Localize("menu_weave_leaderboard_filter_title_player_range"), stepper_2_data)
	self:_refresh_list()
	Managers.input:enable_gamepad_cursor()
	self:play_sound("menu_leaderboard_open")
end

StartGameStateWeaveLeaderboard._refresh_list = function (self)
	local stepper_settings = self._stepper_settings
	local stat_name = "season_1_weave_score_"
	local leaderboard_type = "global"

	if stepper_settings then
		for i = 1, #stepper_settings, 1 do
			local stepper_setting = stepper_settings[i]
			local content = stepper_setting.content
			local read_index = stepper_setting.read_index
			local stepper_name = stepper_setting.stepper_name
			local read_content = content[read_index]
			local read_value = read_content.value

			if stepper_name == "setting_stepper_1" then
				stat_name = stat_name .. read_value .. "_players"
			end

			if stepper_name == "setting_stepper_2" and read_value == 2 then
				leaderboard_type = "friends"
			end
		end
	end

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.refresh_button.content.button_hotspot.disable_button = true
	widgets_by_name.loading_icon.content.visible = true
	self._polling = true
	local time = Application.time_since_launch()
	self._min_poll_time = time + MIN_TIME_BETWEEN_LEADERBOARD_REQUESTS
	local weave_interface = Managers.backend:get_interface("weaves")

	weave_interface:request_player_rank(stat_name, leaderboard_type)

	local start_position = 0

	weave_interface:request_leaderboard(stat_name, start_position, leaderboard_type)
	self:_set_player_info(nil, true)
end

StartGameStateWeaveLeaderboard._poll_list = function (self, dt, t)
	local weave_interface = Managers.backend:get_interface("weaves")

	if self._polling then
		if weave_interface:is_requesting_leaderboard() then
			return
		elseif t < self._min_poll_time then
			return
		else
			self._polling = false
		end
	else
		return
	end

	local entries = weave_interface:get_leaderboard_entries()

	self:_populate_list(entries)

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.refresh_button.content.button_hotspot.disable_button = false
	widgets_by_name.loading_icon.content.visible = false
	local player_entry = weave_interface:get_player_entry()

	self:_set_player_info(player_entry)
end

StartGameStateWeaveLeaderboard._set_player_info = function (self, player_entry, hide_all)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.player_entry
	local content = widget.content
	local has_rank = player_entry and player_entry.ranking ~= "-"

	if has_rank then
		content.name = player_entry.name
		content.score = WeaveUtils.comma_value(player_entry.score)
		content.weave = tostring(player_entry.weave)
		content.ranking = tostring(player_entry.ranking)
		content.career_name = player_entry.career_name
		local career = CareerSettings[content.career_name]
		local portrait_thumbnail = (career and career.portrait_thumbnail) or "icons_placeholder"
		content.career_icon = portrait_thumbnail
	end

	widgets_by_name.player_entry.content.visible = (has_rank and not hide_all) or false
	widgets_by_name.no_placement_text.content.visible = (not hide_all and not has_rank) or false
end

StartGameStateWeaveLeaderboard._initialize_stepper = function (self, stepper_index, title_text, content, start_index)
	self._stepper_settings = self._stepper_settings or {}
	local stepper_settings = self._stepper_settings
	local stepper_name = "setting_stepper_" .. stepper_index
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name[stepper_name]
	start_index = start_index or 1
	stepper_settings[stepper_index] = {
		stepper_name = stepper_name,
		title_text = title_text,
		content = content,
		read_index = start_index,
		widget = widget
	}
	widget.content.title_text = title_text

	self:_set_stepper_read_index(stepper_index, start_index)
end

StartGameStateWeaveLeaderboard._set_stepper_read_index = function (self, stepper_index, read_index)
	local stepper_settings = self._stepper_settings
	local settings = stepper_settings[stepper_index]
	local content = settings.content
	settings.read_index = read_index
	local read_data = content[read_index]
	local widget = settings.widget
	widget.content.setting_text = read_data.text
end

StartGameStateWeaveLeaderboard._on_stepper_pressed = function (self, widget)
	local content = widget.content
	local button_hotspot_left = content.button_hotspot_left
	local button_hotspot_right = content.button_hotspot_right

	if button_hotspot_left.on_pressed or button_hotspot_left.on_double_click then
		return -1
	elseif button_hotspot_right.on_pressed or button_hotspot_right.on_double_click then
		return 1
	end
end

StartGameStateWeaveLeaderboard._create_ui_elements = function (self, params)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._console_cursor_widget = UIWidget.init(console_cursor_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	widgets_by_name.loading_icon.content.visible = false

	self:_setup_list_widget()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	local scrollbar_widget = self._widgets_by_name.list_scrollbar
	self._scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)
	local gui_layer = UILayer.default + 30
	local input_service = self:input_service()
	local use_fullscreen_layout = self._gamepad_style_active
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, input_service, 6, gui_layer, generic_input_actions.default, use_fullscreen_layout)

	self._menu_input_description:set_input_description(nil)
end

StartGameStateWeaveLeaderboard.disable_player_world = function (self)
	if not self._player_world_disabled then
		self._player_world_disabled = true
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.deactivate_viewport(world, viewport)
	end
end

StartGameStateWeaveLeaderboard.enable_player_world = function (self)
	if self._player_world_disabled then
		self._player_world_disabled = false
		local viewport_name = "player_1"
		local world = Managers.world:world("level_world")
		local viewport = ScriptWorld.viewport(world, viewport_name)

		ScriptWorld.activate_viewport(world, viewport)
	end
end

StartGameStateWeaveLeaderboard.close_on_exit = function (self)
	return self._close_on_exit
end

StartGameStateWeaveLeaderboard.transitioning = function (self)
	if self.exiting then
		return true
	else
		return false
	end
end

StartGameStateWeaveLeaderboard._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end

StartGameStateWeaveLeaderboard.wanted_menu_state = function (self)
	return self._wanted_menu_state
end

StartGameStateWeaveLeaderboard.clear_wanted_menu_state = function (self)
	self._wanted_menu_state = nil
end

StartGameStateWeaveLeaderboard.hotkey_allowed = function (self)
	return not self._polling
end

StartGameStateWeaveLeaderboard.on_exit = function (self, params)
	print("[StartGameState] Exit Substate StartGameStateWeaveLeaderboard")

	self.ui_animator = nil
	self._is_open = false

	if self._fullscreen_effect_enabled then
		self:set_fullscreen_effect_enable_state(false)
	end

	if self._gamepad_style_active then
		self:enable_player_world()
	end

	Managers.input:disable_gamepad_cursor()
	self:play_sound("menu_leaderboard_close")
end

StartGameStateWeaveLeaderboard._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

StartGameStateWeaveLeaderboard.input_service = function (self)
	return self.parent:input_service()
end

StartGameStateWeaveLeaderboard.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	local input_manager = self._input_manager
	local input_service = self.parent:input_service()

	self:_poll_list(dt, t)
	self:_update_transition_timer(dt)

	if not self._polling then
		self:_update_scroll_position(dt)
		self:_update_visible_list_entries()
		self._scrollbar_logic:update(dt, t)
	end

	self:draw(input_service, dt)

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and (wanted_state or self._new_state) then
		self.parent:clear_wanted_state()

		return wanted_state or self._new_state
	end
end

StartGameStateWeaveLeaderboard.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer and not self._polling then
		self:_handle_input(dt, t)
	end
end

StartGameStateWeaveLeaderboard._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name
	local exit_button = widgets_by_name.exit_button
	local refresh_button = widgets_by_name.refresh_button

	UIWidgetUtils.animate_default_button(exit_button, dt)
	UIWidgetUtils.animate_default_button(refresh_button, dt)
end

StartGameStateWeaveLeaderboard._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

StartGameStateWeaveLeaderboard._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_service = self.parent:input_service()
	local input_pressed = input_service:get("toggle_menu", true)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local back_pressed = gamepad_active and input_service:get("back_menu", true)
	local close_on_exit = self._close_on_exit
	local exit_button = widgets_by_name.exit_button
	local refresh_button = widgets_by_name.refresh_button

	if self:_is_button_hover_enter(exit_button) or self:_is_button_hover_enter(refresh_button) then
		self:play_sound("Play_hud_hover")
	end

	local stepper_settings = self._stepper_settings

	if stepper_settings then
		for i = 1, #stepper_settings, 1 do
			local settings = stepper_settings[i]
			local widget = settings.widget
			local direction = self:_on_stepper_pressed(widget)

			if direction then
				local read_index = settings.read_index
				local content = settings.content
				local new_read_index = math.index_wrapper(read_index + direction, #content)

				self:_set_stepper_read_index(i, new_read_index)
				self:play_sound("Play_hud_hover")
				self:_refresh_list()
			end
		end
	end

	if self:_is_button_pressed(refresh_button) or (input_service:get("special_1") and not self._polling) then
		self:play_sound("Play_hud_select")
		self:_refresh_list()
	elseif close_on_exit and (back_pressed or input_pressed or self:_is_button_pressed(exit_button)) then
		self:close_menu()

		return
	end
end

StartGameStateWeaveLeaderboard.close_menu = function (self, ignore_sound_on_close_menu)
	self.parent:close_menu(nil, ignore_sound_on_close_menu)
end

StartGameStateWeaveLeaderboard.set_input_description = function (self, input_description)
	if not self._menu_input_description then
		return
	end

	fassert(not input_description or self._generic_input_actions[input_description], "[StartGameStateWeaveLeaderboard:set_input_description] There is no such input_description (%s)", input_description)
	self._menu_input_description:set_input_description(self._generic_input_actions[input_description])
end

StartGameStateWeaveLeaderboard.change_generic_actions = function (self, input_description)
	if not self._menu_input_description then
		return
	end

	fassert(self._generic_input_actions[input_description], "[StartGameStateWeaveLeaderboard:set_input_description] There is no such input_description (%s)", input_description)
	self._menu_input_description:change_generic_actions(self._generic_input_actions[input_description])
end

StartGameStateWeaveLeaderboard.draw = function (self, input_service, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local render_settings = self._render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")

	if not self._gamepad_style_active then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		local snap_pixel_positions = render_settings.snap_pixel_positions
		local alpha_multiplier = render_settings.alpha_multiplier

		for _, widget in ipairs(self._widgets) do
			if widget.snap_pixel_positions ~= nil then
				render_settings.snap_pixel_positions = widget.snap_pixel_positions
			end

			UIRenderer.draw_widget(ui_renderer, widget)

			render_settings.snap_pixel_positions = snap_pixel_positions
		end

		local list_entries = self._list_entries
		local list_widget = self._list_widget
		local list_draw_index = self._list_draw_index
		local list_fade_in_time = self._list_fade_in_time
		local list_fade_in_progress = nil

		if list_fade_in_time then
			list_fade_in_time = math.max(list_fade_in_time - dt, 0)

			if list_fade_in_time == 0 then
				self._list_fade_in_time = nil
			else
				self._list_fade_in_time = list_fade_in_time
			end

			list_fade_in_progress = 1 - list_fade_in_time / LIST_FADE_IN_DURATION
		end

		if list_entries and list_widget and list_draw_index then
			local start_index = list_draw_index
			local end_index = math.min(list_draw_index + LIST_PRESENTATION_AMOUNT + 1, #list_entries)
			local draw_count = 0

			for i = start_index, end_index, 1 do
				draw_count = draw_count + 1
				local content = list_widget.content
				local style = list_widget.style
				local offset = list_widget.offset
				local size = content.size
				local height = size[2]
				local y_offset = LIST_EDGE_SPACING + (height + LIST_SPACING) * (i - 1)
				offset[2] = -y_offset
				local entry = list_entries[i]
				local name = entry.name
				local weave = entry.weave
				local score = entry.score
				local ranking = entry.ranking
				local career_icon = entry.career_icon
				content.name = name
				content.score = score
				content.weave = weave
				content.ranking = ranking
				content.career_icon = career_icon

				if list_widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = list_widget.snap_pixel_positions
				end

				if list_fade_in_progress then
					local internal_progress = math.easeInCubic(math.min(list_fade_in_progress + (end_index - i) * 0.05, 1))
					render_settings.alpha_multiplier = internal_progress
					offset[1] = -30 * (1 - internal_progress)
				end

				UIRenderer.draw_widget(ui_renderer, list_widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
				render_settings.alpha_multiplier = alpha_multiplier
			end
		end

		UIRenderer.end_pass(ui_renderer)
	end

	if gamepad_active then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor_widget)
		UIRenderer.end_pass(ui_top_renderer)

		if self._menu_input_description and not self.parent:active_view() then
			self._menu_input_description:draw(ui_top_renderer, dt)
		end
	end
end

StartGameStateWeaveLeaderboard._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameStateWeaveLeaderboard.play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameStateWeaveLeaderboard._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

StartGameStateWeaveLeaderboard.set_fullscreen_effect_enable_state = function (self, enabled)
	local world = self._ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and 0.75) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

StartGameStateWeaveLeaderboard._setup_list_widget = function (self)
	local masked = true
	local scenegraph_id = "list_entry"
	local size = scenegraph_definition[scenegraph_id].size
	local widget_definition = UIWidgets.create_leaderboard_entry_definition(scenegraph_id, size, masked)
	local widget = UIWidget.init(widget_definition)
	self._list_widget = widget
end

StartGameStateWeaveLeaderboard._populate_list = function (self, entries)
	local list_entries = {}
	local num_entries = #entries

	for i = 1, num_entries, 1 do
		local entry = entries[i]
		local career_name = entry.career_name
		local career = CareerSettings[career_name]
		local portrait_thumbnail = (career and career.portrait_thumbnail) or "icons_placeholder"
		list_entries[i] = {
			alpha_fade_in_delay = 0.4,
			name = entry.name,
			weave = tostring(entry.weave),
			score = WeaveUtils.comma_value(entry.score),
			ranking = WeaveUtils.comma_value(entry.ranking),
			career_name = career_name,
			career_icon = portrait_thumbnail
		}
	end

	self._list_entries = list_entries

	self:_calculate_list_height(num_entries)
	self:_initialize_scrollbar()

	self._list_draw_index = 1
	self._list_fade_in_time = LIST_FADE_IN_DURATION
end

StartGameStateWeaveLeaderboard._calculate_list_height = function (self, amount)
	local total_height = LIST_EDGE_SPACING
	local widget = self._list_widget
	local content = widget.content
	local size = content.size

	for index = 1, amount, 1 do
		local height = size[2]
		total_height = total_height + height

		if index ~= amount then
			total_height = total_height + LIST_SPACING
		end
	end

	self._total_list_height = total_height + LIST_EDGE_SPACING
end

StartGameStateWeaveLeaderboard._initialize_scrollbar = function (self)
	local list_window_size = scenegraph_definition.list_window.size
	local list_scrollbar_size = scenegraph_definition.list_scrollbar.size
	local draw_length = list_window_size[2]
	local content_length = self._total_list_height
	local scrollbar_length = list_scrollbar_size[2]
	local step_size = 220 + LIST_SPACING * 1.5
	local scroll_step_multiplier = 1
	local scrollbar_logic = self._scrollbar_logic

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)
end

StartGameStateWeaveLeaderboard._update_scroll_position = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.list_scroll_root.local_position[2] = math.round(length)
		self._scrolled_length = length
	end
end

StartGameStateWeaveLeaderboard._update_visible_list_entries = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if not enabled then
		return
	end

	local scroll_percentage = scrollbar_logic:get_scroll_percentage()
	local scrolled_length = scrollbar_logic:get_scrolled_length()
	local scroll_length = scrollbar_logic:get_scroll_length()
	local list_window_size = scenegraph_definition.list_window.size
	local draw_padding = LIST_SPACING * 2
	local draw_length = list_window_size[2] + draw_padding
	local list_entries = self._list_entries
	local widget = self._list_widget
	local content = widget.content
	local size = content.size
	local height = size[2]
	local start_index = 1
	local num_entries = #list_entries

	for i = 1, num_entries, 1 do
		local y_offset = LIST_EDGE_SPACING + (height + LIST_SPACING) * (i - 1)
		local widget_position = y_offset + height
		local is_outside = false

		if widget_position < scrolled_length - draw_padding then
			is_outside = true
		elseif draw_length < y_offset - scrolled_length then
			is_outside = true
		end

		if not is_outside then
			start_index = i

			break
		end
	end

	self._list_draw_index = start_index
end

StartGameStateWeaveLeaderboard._get_scrollbar_percentage_by_index = function (self, index)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if enabled then
		local scroll_percentage = scrollbar_logic:get_scroll_percentage()
		local scrolled_length = scrollbar_logic:get_scrolled_length()
		local scroll_length = scrollbar_logic:get_scroll_length()
		local list_window_size = scenegraph_definition.list_window.size
		local draw_length = list_window_size[2]
		local draw_start_height = scrolled_length
		local draw_end_height = draw_start_height + draw_length
		local list_entries = self._list_entries

		if list_entries then
			local widget = self._list_widget
			local content = widget.content
			local size = content.size
			local height = size[2]
			local y_offset = LIST_EDGE_SPACING * 2 + (height + LIST_SPACING) * (index - 1)
			local start_position_top = y_offset
			local start_position_bottom = y_offset + height
			local percentage_difference = 0

			if draw_end_height < start_position_bottom then
				local height_missing = start_position_bottom - draw_end_height
				percentage_difference = math.clamp(height_missing / scroll_length, 0, 1)
			elseif start_position_top < draw_start_height then
				local height_missing = draw_start_height - start_position_top
				percentage_difference = -math.clamp(height_missing / scroll_length, 0, 1)
			end

			if percentage_difference then
				local scroll_percentage = math.clamp(scroll_percentage + percentage_difference, 0, 1)

				return scroll_percentage
			end
		end
	end

	return 0
end

return
