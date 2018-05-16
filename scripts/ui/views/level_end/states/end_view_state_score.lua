local definitions = local_require("scripts/ui/views/level_end/states/definitions/end_view_state_score_definitions")
local widget_definitions = definitions.widgets
local player_score_size = definitions.player_score_size
local hero_widget_definitions = definitions.hero_widgets
local score_widget_definitions = definitions.score_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local PLAYER_NAME_MAX_LENGTH = 16
local DO_RELOAD = false
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
EndViewStateScore = class(EndViewStateScore)
EndViewStateScore.NAME = "EndViewStateScore"

EndViewStateScore.on_enter = function (self, params)
	print("[PlayState] Enter Substate EndViewStateScore")

	self.parent = params.parent
	self.game_won = params.game_won
	self.game_mode_key = params.game_mode_key
	local context = params.context
	self._context = context
	self.ui_renderer = context.ui_top_renderer
	self.input_manager = context.input_manager
	self.statistics_db = context.statistics_db
	self.rewards = context.rewards
	self.render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true
	}
	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	self.peer_id = context.peer_id
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params)

	if params.initial_state then
		self._initial_preview = true
		params.initial_state = nil
	end

	self:_start_transition_animation("on_enter", "transition_enter")

	self._exit_timer = nil
	local players_session_score = self._context.players_session_score

	self:_setup_player_scores(players_session_score)
	self:_play_sound("play_gui_mission_summary_team_summary_enter")
end

EndViewStateScore.exit = function (self, direction)
	self._exit_started = true

	self:_start_transition_animation("on_enter", "transition_exit")
end

EndViewStateScore.exit_done = function (self)
	return self._exit_started and self._animations.on_enter == nil
end

EndViewStateScore.create_ui_elements = function (self, params)
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
	self._hero_widgets = {
		UIWidget.init(hero_widget_definitions.player_frame_1),
		UIWidget.init(hero_widget_definitions.player_frame_2),
		UIWidget.init(hero_widget_definitions.player_frame_3),
		UIWidget.init(hero_widget_definitions.player_frame_4)
	}
	self._score_widgets = {
		UIWidget.init(score_widget_definitions.player_score_1),
		UIWidget.init(score_widget_definitions.player_score_2),
		UIWidget.init(score_widget_definitions.player_score_3),
		UIWidget.init(score_widget_definitions.player_score_4)
	}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

EndViewStateScore._wanted_state = function (self)
	local new_state = self.parent:wanted_menu_state()

	return new_state
end

EndViewStateScore.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager
end

EndViewStateScore.on_exit = function (self, params)
	print("[PlayState] Exit Substate EndViewStateScore")

	self.ui_animator = nil
end

EndViewStateScore._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

EndViewStateScore.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()

		local players_session_score = self._context.players_session_score

		self:_setup_player_scores(players_session_score)
	end

	local input_manager = self.input_manager
	local input_service = input_manager:get_service("end_of_level")

	self:draw(input_service, dt)
	self:_update_transition_timer(dt)

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and (wanted_state or self._new_state) then
		self.parent:clear_wanted_menu_state()

		return wanted_state or self._new_state
	end

	self:_update_entry_hover(dt)
	self.ui_animator:update(dt)
	self:_update_animations(dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		self:_handle_input(dt, t)
	end
end

EndViewStateScore.post_update = function (self, dt, t)
	return
end

EndViewStateScore._update_animations = function (self, dt)
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
end

EndViewStateScore._update_entry_hover = function (self)
	local hover_index = nil
	local widgets_by_name = self._widgets_by_name
	local topics_widget = widgets_by_name.scores_topics
	local content = topics_widget.content
	local num_rows = content.num_rows

	for i = 1, num_rows, 1 do
		local line_suffix = "_" .. i
		local row_hotspot_name = "hotspot" .. line_suffix
		local line_hotspot = content[row_hotspot_name]

		if line_hotspot and line_hotspot.is_hover then
			local row_name = "row_bg" .. line_suffix
			local row_content = content[row_name]

			if row_content.has_score then
				hover_index = i

				break
			end
		end
	end

	if hover_index ~= self._current_topic_hover_index then
		self:_set_entry_hover_index(hover_index)

		self._current_topic_hover_index = hover_index
	end
end

EndViewStateScore._set_entry_hover_index = function (self, hover_index)
	local widgets_by_name = self._widgets_by_name
	local score_widgets = self._score_widgets

	for index, widget in ipairs(score_widgets) do
		local content = widget.content
		content.hover_index = hover_index
	end

	local topics_widget = widgets_by_name.scores_topics
	local content = topics_widget.content
	content.hover_index = hover_index
end

EndViewStateScore._handle_input = function (self, dt, t)
	if Development.parameter("tobii_button") then
		self:_handle_tobii_button(dt)
	end
end

EndViewStateScore._handle_tobii_button = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local tobii_button = widgets_by_name.tobii_button

	UIWidgetUtils.animate_default_button(tobii_button, dt)

	if self:_is_button_hover_enter(tobii_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	if self:_is_button_pressed(tobii_button) then
		self:_play_sound("play_gui_start_menu_button_click")

		local tobii_contest_url = "https://vermintide2beta.com/?utm_medium=referral&utm_campaign=vermintide2beta&utm_source=ingame#challenge"

		Application.open_url_in_browser(tobii_contest_url)
	end
end

EndViewStateScore._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

EndViewStateScore._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

EndViewStateScore.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._hero_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._score_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

EndViewStateScore._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

EndViewStateScore._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

EndViewStateScore._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

EndViewStateScore._transform_player_session_score = function (self, players_session_scores)
	local transformed_player_session_score = {
		group_scores = {}
	}

	for stats_id, player_data in pairs(players_session_scores) do
		for group_name, group_data in pairs(player_data.group_scores) do
			if not transformed_player_session_score.group_scores[group_name] then
				transformed_player_session_score.group_scores[group_name] = {}
			end

			for index, score_data in ipairs(group_data) do
				if not transformed_player_session_score.group_scores[group_name][index] then
					transformed_player_session_score.group_scores[group_name][index] = {
						player_scores = {}
					}
				end

				local highscore = transformed_player_session_score.group_scores[group_name][index].highscore or 0
				transformed_player_session_score.group_scores[group_name][index].stat_name = score_data.stat_name
				transformed_player_session_score.group_scores[group_name][index].display_name = score_data.display_name
				transformed_player_session_score.group_scores[group_name][index].highscore = (highscore < score_data.score and score_data.score) or highscore
				transformed_player_session_score.group_scores[group_name][index].player_scores[stats_id] = score_data.score
			end
		end
	end

	return transformed_player_session_score
end

EndViewStateScore._group_scores_by_player_and_topic = function (self, score_panel_scores, player_data, player_index)
	for group_name, group_data in pairs(player_data.group_scores) do
		if not score_panel_scores[group_name] then
			score_panel_scores[group_name] = {}
		end

		local highscore = 0

		for index, score_data in ipairs(group_data) do
			if not score_panel_scores[group_name][index] then
				score_panel_scores[group_name][index] = {
					player_scores = {}
				}
			end

			local highscore = score_panel_scores[group_name][index].highscore or 0
			score_panel_scores[group_name][index].stat_name = score_data.stat_name
			score_panel_scores[group_name][index].display_text = score_data.display_text
			score_panel_scores[group_name][index].highscore = (highscore < score_data.score and score_data.score) or highscore
			score_panel_scores[group_name][index].player_scores[player_index] = score_data.score
		end
	end
end

EndViewStateScore._setup_player_scores = function (self, players_session_scores)
	local score_panel_scores = {}
	local player_names = {}
	local widget_index = 1
	local score_index = 1
	local hero_widgets = self._hero_widgets

	for stats_id, player_data in pairs(players_session_scores) do
		self:_set_topic_data(player_data, widget_index)
		self:_group_scores_by_player_and_topic(score_panel_scores, player_data, widget_index)

		player_names[widget_index] = player_data.name
		local peer_id = player_data.peer_id
		local profile_index = player_data.profile_index
		local career_index = player_data.career_index
		local profile_data = SPProfiles[profile_index]
		local careers = profile_data.careers
		local career_settings = careers[career_index]
		local portrait_image = career_settings.portrait_image
		local portrait_frame = player_data.portrait_frame or "default"
		local player_level = player_data.player_level
		local is_player_controlled = player_data.is_player_controlled
		local level_text = (is_player_controlled and ((player_level and tostring(player_level)) or "-")) or "BOT"
		local widget_definition = UIWidgets.create_portrait_frame("player_frame_" .. widget_index, portrait_frame, level_text, 1, nil, portrait_image)
		hero_widgets[widget_index] = UIWidget.init(widget_definition)
		widget_index = widget_index + 1
	end

	self:_setup_score_panel(score_panel_scores, player_names)
end

local position_colors = {
	Colors.get_color_table_with_alpha("cyan", 255),
	Colors.get_color_table_with_alpha("gold", 255),
	Colors.get_color_table_with_alpha("silver", 255),
	Colors.get_color_table_with_alpha("gray", 255)
}
local position_textures = {
	nil,
	"scoreboard_topic_02",
	"scoreboard_topic_03",
	"scoreboard_topic_04"
}

EndViewStateScore._set_topic_data = function (self, player_data, widget_index)
	local widget = self._score_widgets[widget_index]
	local content = widget.content
	local style = widget.style
	local total_score = 0
	local group_scores = player_data.group_scores

	for group_name, group_data in pairs(group_scores) do
		local group_total_score = 0

		for _, score_data in ipairs(group_data) do
			group_total_score = group_total_score + score_data.score
			total_score = total_score + score_data.score
		end

		group_data.total_score = group_total_score
	end
end

EndViewStateScore._setup_score_panel = function (self, score_panel_scores, player_names)
	local category_title_size = 30
	local text_size = 22
	local total_row_index = 1
	local score_index = 1
	local score_widgets = self._score_widgets

	for group_name, group_data in pairs(score_panel_scores) do
		local title_text = "title_text_" .. tostring(total_row_index)
		local horizontal_divider = "horizontal_divider_" .. tostring(total_row_index)

		if total_row_index == 1 then
			for player_index, player_name in ipairs(player_names) do
				local score_text = "score_player_" .. tostring(player_index) .. "_" .. tostring(total_row_index)
				local widget = score_widgets[player_index]
				local content = widget.content
				local style = widget.style
				local line_suffix = "_" .. total_row_index
				local score_text_name = "score_text" .. line_suffix
				local row_name = "row_bg" .. line_suffix
				local row_content = content[row_name]
				local name = (PLAYER_NAME_MAX_LENGTH < UTF8Utils.string_length(player_name) and UIRenderer.crop_text_width(self.ui_renderer, player_name, player_score_size[1] - 40, style[score_text_name])) or player_name
				row_content[score_text_name] = name
			end

			total_row_index = total_row_index + 1
		end

		for group_row_index, score_data in ipairs(group_data) do
			local highscore = math.round(score_data.highscore)
			local player_scores = score_data.player_scores

			for player_index, player_score in ipairs(player_scores) do
				local widget = score_widgets[player_index]
				local content = widget.content
				local style = widget.style
				player_score = math.round(player_score)
				local title_text = "title_text_" .. tostring(total_row_index)
				local score_text = "score_player_" .. tostring(player_index) .. "_" .. tostring(total_row_index)
				local high_score_marker = "high_score_marker_" .. tostring(player_index) .. "_" .. tostring(total_row_index)
				local horizontal_divider = "horizontal_divider_" .. tostring(total_row_index)
				local row_bg = "row_bg_" .. tostring(total_row_index)
				local has_highscore = highscore <= player_score and highscore > 0
				local has_horizontal_divider = false
				local line_suffix = "_" .. total_row_index
				local score_text_name = "score_text" .. line_suffix
				local row_name = "row_bg" .. line_suffix
				local row_content = content[row_name]
				row_content[score_text_name] = player_score
				row_content.has_background = total_row_index % 2 == 0
				row_content.has_highscore = has_highscore
				row_content.has_score = true

				self:_set_score_topic_by_row(total_row_index, Localize(score_data.display_text))
			end

			total_row_index = total_row_index + 1
		end

		score_index = score_index + 1
	end
end

EndViewStateScore._set_score_topic_by_row = function (self, row, text)
	local widget = self._widgets_by_name.scores_topics
	local content = widget.content
	local line_suffix = "_" .. row
	local score_text_name = "score_text" .. line_suffix
	local row_name = "row_bg" .. line_suffix
	local row_content = content[row_name]
	row_content[score_text_name] = text
	row_content.has_score = true
	row_content.has_background = row % 2 == 0
end

EndViewStateScore._setup_hero_score_tooltip = function (self, widget, group_scores)
	local content = widget.content.tooltip
	local style = widget.style.tooltip
	local text_styles = style.text_styles
	local value_styles = style.value_styles

	table.clear(text_styles)
	table.clear(value_styles)
	table.clear(content)

	for group_name, group_data in pairs(group_scores) do
		content[group_name] = group_name
		local group_value_name = group_name .. "_value"
		content[group_value_name] = group_data.total_score
		text_styles[#text_styles + 1] = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			font_size = 20,
			font_type = "hell_shark",
			word_wrap = true,
			name = group_name,
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			value_style = {
				vertical_alignment = "top",
				word_wrap = true,
				horizontal_alignment = "right",
				font_size = 20,
				font_type = "hell_shark",
				name = group_value_name,
				text_color = Colors.get_color_table_with_alpha("font_title", 255)
			}
		}

		for _, score_data in ipairs(group_data) do
			local stat_name = score_data.stat_name
			local score = score_data.score
			local display_text = score_data.display_text
			content[stat_name] = Localize(display_text) .. ":"
			local stat_value_name = stat_name .. "_value"
			content[stat_value_name] = tostring(score)
			text_styles[#text_styles + 1] = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				font_size = 20,
				font_type = "hell_shark",
				word_wrap = true,
				name = stat_name,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				value_style = {
					vertical_alignment = "top",
					word_wrap = true,
					horizontal_alignment = "right",
					font_size = 20,
					font_type = "hell_shark",
					name = stat_value_name,
					text_color = Colors.get_color_table_with_alpha("font_default", 255)
				}
			}
		end
	end
end

EndViewStateScore._player_score_data_by_stats_id = function (self, stats_id)
	return self._players_list[stats_id]
end

EndViewStateScore._get_player_position_in_score_table = function (self, stats_id, scores_data)
	for index, scores in ipairs(scores_data.scores) do
		if scores.stats_id == stats_id then
			return index
		end
	end
end

EndViewStateScore._start_hero_score_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world
	}

	return self.ui_animator:start_animation(animation_name, self._hero_widgets, scenegraph_definition, params)
end

EndViewStateScore._play_sound = function (self, event)
	self.parent:play_sound(event)
end

return
