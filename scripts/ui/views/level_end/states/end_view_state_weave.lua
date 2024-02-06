-- chunkname: @scripts/ui/views/level_end/states/end_view_state_weave.lua

require("scripts/helpers/weave_utils")
require("scripts/ui/ui_widgets_weaves")

local definitions = local_require("scripts/ui/views/level_end/states/definitions/end_view_state_weave_definitions")
local widget_definitions = definitions.widgets
local hero_widget_definitions = definitions.hero_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local update_bar_progress = definitions.update_bar_progress
local generic_input_actions = definitions.generic_input_actions
local player_frame_spacing = 430
local player_name_width = player_frame_spacing - 20

local function draw_widgets(ui_renderer, widgets)
	for i = 1, #widgets do
		UIRenderer.draw_widget(ui_renderer, widgets[i])
	end
end

EndViewStateWeave = class(EndViewStateWeave)
EndViewStateWeave.NAME = "EndViewStateWeave"

EndViewStateWeave.on_enter = function (self, params)
	print("[PlayState] Enter Substate EndViewStateWeave")

	self.parent = params.parent
	self.game_won = params.game_won
	self.game_mode_key = params.game_mode_key

	local context = params.context

	self._context = context
	self.ui_renderer = context.ui_renderer
	self.ui_top_renderer = context.ui_top_renderer
	self.wwise_world = context.wwise_world
	self.input_manager = context.input_manager
	self.statistics_db = context.statistics_db
	self.render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	self.peer_id = context.peer_id
	self.weave_personal_best_achieved = context.weave_personal_best_achieved
	self.weave_personal_best_ranking = context.weave_personal_best_ranking
	self._completed_weave = context.completed_weave
	self._animations = {}
	self._ui_animations = {}
	self._player_count = Managers.weave:get_num_players()
	self._exit_timer = nil
	self._screen_done = false
	self._selected_profile = 1

	if params.initial_state then
		self._initial_preview = true
		params.initial_state = nil
	end

	self:create_ui_elements(params)
	self:_start_transition_animation("on_enter", "transition_enter")
	self:_setup_team_results(self._context.players_session_score)
	self:_play_sound("play_gui_mission_summary_wom_appear")
	self.parent:_push_mouse_cursor()
end

EndViewStateWeave.exit = function (self, direction)
	self._exit_started = true

	self:_start_transition_animation("on_enter", "transition_exit")

	local transition_delay = 0.5
	local transition_duration = 2.5
	local degrees = 55

	self.parent:start_camera_look_up(transition_delay, transition_duration, degrees)
	self:_play_sound("stop_gui_mission_summary_wom")
end

EndViewStateWeave.exit_done = function (self)
	return self._exit_started and self._animations.on_enter == nil
end

EndViewStateWeave.done = function (self)
	return self._screen_done or self.parent:get_all_signaled_done()
end

EndViewStateWeave.create_ui_elements = function (self, params)
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
	self._hero_widgets = {}
	self._ready_button_widget = widgets_by_name.ready_button
	self._ready_timer_widget = widgets_by_name.ready_timer
	self._player_name_widgets = {}
	widgets_by_name.highscore_sigil.content.visible = false
	widgets_by_name.highscore_ribbon.content.visible = false
	widgets_by_name.highscore_text.content.visible = false

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, Managers.input:get_service("end_of_level"), 4, 900, generic_input_actions.default)

	self._menu_input_description:set_input_description(generic_input_actions.show_profile)
end

EndViewStateWeave._wanted_state = function (self)
	local new_state = self.parent:wanted_menu_state()

	return new_state
end

EndViewStateWeave.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager
end

EndViewStateWeave.on_exit = function (self, params)
	print("[PlayState] Exit Substate EndViewStateWeave")

	self.ui_animator = nil
end

EndViewStateWeave._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

EndViewStateWeave.update = function (self, dt, t)
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("end_of_level")

	self:draw(input_service, dt)
	self:_update_transition_timer(dt)
	self:_update_ready(dt, t)

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and (wanted_state or self._new_state) then
		self.parent:clear_wanted_menu_state()

		return wanted_state or self._new_state
	end

	self.ui_animator:update(dt)
	self:_update_animations(dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		if Managers.input:is_device_active("gamepad") then
			self:_handle_gamepad_input(dt, t)
		else
			self:_handle_input(dt, t)
		end
	end
end

EndViewStateWeave._update_ready = function (self, dt, t)
	local is_force_shutdown_active = self.parent:is_force_shutdown_active()
	local timer_bar = self._ready_timer_widget

	timer_bar.content.active = is_force_shutdown_active == true

	if is_force_shutdown_active then
		local time_left, time_total = self.parent:get_force_shutdown_time()
		local progress = 0

		if time_left and time_total then
			progress = 1 - time_left / time_total
		end

		update_bar_progress(timer_bar, progress, t)
	end
end

EndViewStateWeave._handle_input = function (self, dt, t)
	if UIUtils.is_button_hover_enter(self._ready_button_widget) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	if UIUtils.is_button_pressed(self._ready_button_widget) then
		self:_play_sound("play_gui_mission_summary_button_return_to_keep_click")

		self._ready_button_widget.content.button_hotspot.disable_button = true

		if self.parent._left_lobby then
			self._screen_done = true
		else
			self.parent:signal_done(false)
		end
	end
end

EndViewStateWeave._handle_gamepad_input = function (self, dt, t)
	local input_service = Managers.input:get_service("end_of_level")

	if input_service:get("confirm_press") then
		self:_play_sound("play_gui_mission_summary_button_return_to_keep_click")

		self._ready_button_widget.content.button_hotspot.disable_button = true

		if self.parent._left_lobby then
			self._screen_done = true
		else
			self.parent:signal_done(false)
		end
	elseif input_service:get("move_left") then
		local index = self._selected_profile
		local new_index = math.clamp(index - 1, 1, self._player_count)

		if new_index ~= index then
			self:_play_sound("play_gui_start_menu_button_hover")
			self:_move_profile_selector(new_index)
		end
	elseif input_service:get("move_right") then
		local index = self._selected_profile
		local new_index = math.clamp(index + 1, 1, self._player_count)

		if new_index ~= index then
			self:_play_sound("play_gui_start_menu_button_hover")
			self:_move_profile_selector(new_index)
		end
	elseif input_service:get("special_1_press") then
		local players_session_scores = self._context.players_session_score
		local sorted_stat_ids = {}

		for stats_id in pairs(players_session_scores) do
			table.insert(sorted_stat_ids, stats_id)
		end

		table.sort(sorted_stat_ids)

		local player_stat_id = sorted_stat_ids[self._selected_profile]
		local player_data = players_session_scores[player_stat_id]

		if player_data then
			self:_show_profile_by_peer_id(player_data.peer_id)
		end
	end
end

EndViewStateWeave._show_profile_by_peer_id = function (self, peer_id)
	local platform = self.platform

	if IS_WINDOWS and rawget(_G, "Steam") then
		local id = Steam.id_hex_to_dec(peer_id)
		local url = "http://steamcommunity.com/profiles/" .. id

		Steam.open_url(url)
	elseif IS_XB1 then
		local xuid = self._context.lobby.lobby:xuid(peer_id)

		if xuid then
			XboxLive.show_gamercard(Managers.account:user_id(), xuid)
		end
	elseif IS_PS4 then
		Managers.account:show_player_profile_with_account_id(peer_id)
	end
end

EndViewStateWeave._update_animations = function (self, dt)
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

	UIWidgetUtils.animate_default_button(self._ready_button_widget, dt)

	local score_count_index = self.score_count_index
	local score_count_queue = self.score_count_queue

	if score_count_index then
		local animation_completed = animations.score_count == nil and animations.total_score_count == nil

		if animation_completed then
			local next_counters = score_count_queue and score_count_queue[score_count_index]

			if next_counters then
				self:_start_score_count_animation("score_count", "score_entry", next_counters[1])
				self:_start_score_count_animation("total_score_count", "score_entry", next_counters[2])

				self.score_count_index = score_count_index + 1
			else
				self.score_count_index = nil

				local new_highscore = self.weave_personal_best_achieved

				if new_highscore then
					self:_start_transition_animation("highscore_presentation", "highscore_presentation")
				end
			end
		end
	end
end

EndViewStateWeave.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local render_settings = self.render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	draw_widgets(ui_top_renderer, self._widgets)
	draw_widgets(ui_top_renderer, self._hero_widgets)
	draw_widgets(ui_top_renderer, self._player_name_widgets)
	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

EndViewStateWeave._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
	}
	local widgets = self._widgets_by_name
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

EndViewStateWeave._start_score_count_animation = function (self, key, animation_name, params)
	local widgets = {}

	params.start_font_size = params.widget.style.text.font_size
	params.peak_font_size = params.widget.style.text.font_size * 1.5
	params.wwise_world = self.wwise_world

	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

EndViewStateWeave._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

EndViewStateWeave._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

EndViewStateWeave._setup_team_results = function (self, players_session_scores)
	local sorted_stat_ids = {}

	for stats_id in pairs(players_session_scores) do
		table.insert(sorted_stat_ids, stats_id)
	end

	table.sort(sorted_stat_ids)

	for i = 1, #sorted_stat_ids do
		local player_stat_id = sorted_stat_ids[i]
		local player_data = players_session_scores[player_stat_id]
		local peer_id = player_data.peer_id
		local profile_index = player_data.profile_index
		local career_index = player_data.career_index
		local profile_data = SPProfiles[profile_index]
		local careers = profile_data.careers
		local career_settings = careers[career_index]
		local portrait_image = career_settings.portrait_image
		local portrait_frame = player_data.portrait_frame
		local player_level = player_data.player_level
		local is_player_controlled = player_data.is_player_controlled
		local level_text = is_player_controlled and (player_level and tostring(player_level) or "-") or "BOT"

		self:_fill_portrait(i, portrait_frame, level_text, portrait_image, player_data.name)
	end

	for i = #sorted_stat_ids + 1, self._player_count do
		self:_fill_portrait(i)
	end

	self:_setup_score_panel()
	self:_move_profile_selector(1)
end

EndViewStateWeave._move_profile_selector = function (self, selection_index)
	local hero_frame_count = self._player_count
	local profile_selector_widget = self._widgets_by_name.profile_selector
	local x_offset = player_frame_spacing * (selection_index - hero_frame_count / 2 - 0.5)

	profile_selector_widget.offset = {
		x_offset,
		0,
		0,
	}
	self._selected_profile = selection_index

	local players_session_scores = self._context.players_session_score
	local sorted_stat_ids = {}

	for stats_id in pairs(players_session_scores) do
		table.insert(sorted_stat_ids, stats_id)
	end

	table.sort(sorted_stat_ids)

	local current_stat_id = sorted_stat_ids[self._selected_profile]
	local player_data = players_session_scores[current_stat_id]

	if player_data then
		self._menu_input_description:set_input_description(generic_input_actions.show_profile)
	else
		self._menu_input_description:set_input_description(nil)
	end
end

EndViewStateWeave._fill_portrait = function (self, slot, portrait_frame, level_text, portrait_image, player_name)
	local hero_frame_count = self._player_count
	local x_offset = player_frame_spacing * (slot - hero_frame_count / 2 - 0.5)
	local portrait_frame = portrait_frame or "default"
	local level_text = level_text or ""
	local portrait_image = portrait_image or "eor_empty_player"
	local widget_definition = UIWidgets.create_portrait_frame("player_frame", portrait_frame, level_text, 1, nil, portrait_image)
	local hero_widget = self._hero_widgets[slot]

	hero_widget = UIWidget.init(widget_definition)
	hero_widget.offset = {
		x_offset,
		0,
		0,
	}
	self._hero_widgets[slot] = hero_widget

	if player_name then
		local name = UIRenderer.crop_text_width(self.ui_renderer, player_name, player_name_width, hero_widget_definitions.player_name.style.text)
		local widget = UIWidget.init(hero_widget_definitions.player_name)

		widget.offset = {
			x_offset,
			0,
			0,
		}
		widget.content.text = name
		self._player_name_widgets[#self._player_name_widgets + 1] = widget
	end
end

EndViewStateWeave._setup_score_panel = function (self)
	local weave_manager = Managers.weave
	local game_won = self.game_won
	local weave_template = self._completed_weave and WeaveSettings.templates[self._completed_weave]
	local weave_display_name = ""
	local weave_number_display_name = ""

	if weave_template then
		weave_number_display_name = tostring(weave_template.tier)
		weave_display_name = Localize(weave_template.display_name)
	end

	local time_left = weave_manager:get_time_left()
	local time = math.max(WeaveSettings.max_time - math.floor(time_left), 0)
	local seconds = time % 60
	local minutes = math.floor(time / 60)
	local total_score = game_won and weave_manager:get_score() or 0
	local time_score = weave_manager:get_time_score()
	local damage_score = weave_manager:get_damage_score()
	local widgets_by_name = self._widgets_by_name

	widgets_by_name.score_weave_num.content.text = Localize("lb_game_type_weave") .. " " .. weave_number_display_name .. ": " .. weave_display_name
	widgets_by_name.total_time_value.content.text = string.format("%d %s %02d %s", minutes, Localize("weave_endscreen_min"), seconds, Localize("weave_endscreen_sec"))

	if game_won then
		widgets_by_name.time_score_value.content.text = UIUtils.comma_value(0)
		widgets_by_name.damage_bonus_value.content.text = UIUtils.comma_value(0)
		widgets_by_name.total_score_value.content.text = UIUtils.comma_value(0)
		self.score_count_queue = {
			{
				{
					start_value = 0,
					widget = widgets_by_name.time_score_value,
					end_value = time_score,
				},
				{
					start_value = 0,
					widget = widgets_by_name.total_score_value,
					end_value = time_score,
				},
			},
			{
				{
					start_value = 0,
					widget = widgets_by_name.damage_bonus_value,
					end_value = damage_score,
				},
				{
					widget = widgets_by_name.total_score_value,
					start_value = time_score,
					end_value = total_score,
				},
			},
		}
		self.score_count_index = 1
	else
		widgets_by_name.time_score_value.content.text = "-"
		widgets_by_name.damage_bonus_value.content.text = "-"
		widgets_by_name.total_score_value.content.text = UIUtils.comma_value(total_score)
	end
end

EndViewStateWeave._play_sound = function (self, event)
	self.parent:play_sound(event)
end
