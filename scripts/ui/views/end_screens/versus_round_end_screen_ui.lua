-- chunkname: @scripts/ui/views/end_screens/versus_round_end_screen_ui.lua

require("scripts/ui/views/end_screens/base_end_screen_ui")

local definitions = local_require("scripts/ui/views/end_screens/versus_round_end_screen_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local BANNER_SIZE = {
	500,
	80,
}
local OBJECTIVE_MOVE_DURATION = 1.2
local OBJECTIVE_VISIBILITY_RANGE = 800
local OBJECTIVE_WIDTH_SPACING = 400
local round_text_style = {
	font_size = 32,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	default_offset = {
		0,
		-10,
		12,
	},
	offset = {
		0,
		-10,
		12,
	},
}

VersusRoundEndScreenUI = class(VersusRoundEndScreenUI, BaseEndScreenUI)

VersusRoundEndScreenUI.init = function (self, ingame_ui_context, input_service, screen_context)
	local player = ingame_ui_context.player

	self._player = player
	self._peer_id = player:network_id()
	self._local_player_id = player:local_player_id()
	self._side = Managers.state.side:get_side_from_player_unique_id(player:unique_id())
	self._win_conditions = Managers.mechanism:game_mechanism():win_conditions()
	self._input_service = input_service

	VersusRoundEndScreenUI.super.init(self, ingame_ui_context, input_service, definitions)
end

VersusRoundEndScreenUI._create_ui_elements = function (self, definitions)
	local scenegraph_definition = definitions.scenegraph_definition
	local widget_definitions = definitions.widget_definitions
	local party_manager = Managers.party
	local _, party_id = party_manager:get_party_from_player_id(self._peer_id, self._local_player_id)

	party_id = party_id == 0 and 1 or party_id

	local opponent_party_id = party_id == 1 and 2 or 1

	self:_build_score_widgets_scenegraph(scenegraph_definition)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UISceneGraph.update_scenegraph(self._ui_scenegraph)

	self._widgets, self._widgets_by_name = {}, {}

	self:_setup_score_widgets(scenegraph_definition, widget_definitions, party_id, opponent_party_id)

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition, self._ui_renderer)

		self._widgets[#self._widgets + 1] = widget
		self._widgets_by_name[name] = widget
	end

	if self._current_round_bg_widget_def then
		local current_round_bg_widget = UIWidget.init(self._current_round_bg_widget_def, self._ui_renderer)

		self._widgets[#self._widgets + 1] = current_round_bg_widget
		self._widgets_by_name.current_round_bg_widget = current_round_bg_widget
	end

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)

	local level_name = Managers.level_transition_handler:get_current_level_key()

	self:_setup_top_detail_banner(level_name)
	self:_setup_total_score_progress_bars_widgets(level_name, party_id, opponent_party_id)
	self:_set_team_banner(party_id, opponent_party_id)

	local current_set = self:_get_current_set()
	local event_name = string.format("cutscene_camera_vs_round_%s", current_set)
	local world_manager = self._ingame_ui_context.world_manager
	local world = world_manager:world("level_world")
	local level = LevelHelper:current_level(world)
	local animation_system = Managers.state.entity:system("animation_system")

	animation_system:add_safe_animation_callback(function ()
		for mood, _ in pairs(MoodSettings) do
			Managers.state.camera:clear_mood(mood)
		end

		Level.trigger_event(level, event_name)
	end)
end

VersusRoundEndScreenUI._draw_widgets = function (self, ui_renderer, render_settings)
	local alpha_multiplier = render_settings.alpha_multiplier

	render_settings.alpha_multiplier = alpha_multiplier

	VersusRoundEndScreenUI.super._draw_widgets(self, ui_renderer, render_settings)
end

VersusRoundEndScreenUI._on_fade_in = function (self)
	self:_play_sound("versus_round_end_transition")
end

VersusRoundEndScreenUI._start = function (self)
	local scenegraph_definition = definitions.scenegraph_definition
	local params = {
		draw_flags = self._draw_flags,
		wwise_world = self._wwise_world,
		num_rounds = self._num_rounds,
		current_round = self:_get_current_set(),
	}

	self._round_end_anim_id = self._ui_animator:start_animation("round_end", self._widgets_by_name, scenegraph_definition, params)
end

VersusRoundEndScreenUI._update = function (self, dt)
	if self._completed then
		return
	end

	if self._round_end_anim_id and (self._ui_animator:is_animation_completed(self._round_end_anim_id) or script_data.auto_complete_rounds) then
		self._round_end_anim_id = nil
	end

	if self._round_end_anim_id == nil then
		self:_on_completed()
	end

	self:draw(dt)
end

VersusRoundEndScreenUI._get_round_count = function (self)
	local mechanism = Managers.mechanism:game_mechanism()
	local win_conditions = mechanism:win_conditions()
	local round_count = win_conditions:get_current_round()

	return round_count
end

VersusRoundEndScreenUI._get_teams_ui_settings = function (self, local_player_party_id, opponent_party_id)
	local local_player_team_name_key = Managers.state.game_mode:setting("party_names_lookup_by_id")[local_player_party_id]
	local opponent_team_name_key = Managers.state.game_mode:setting("party_names_lookup_by_id")[opponent_party_id]
	local dlc_settings = DLCSettings.carousel
	local local_team_ui_settings = dlc_settings.teams_ui_assets[local_player_team_name_key]
	local opponent_ui_settings = dlc_settings.teams_ui_assets[opponent_team_name_key]

	return local_team_ui_settings, opponent_ui_settings
end

VersusRoundEndScreenUI._build_score_widgets_scenegraph = function (self, scenegraph_definition)
	local mechanism_manager = Managers.mechanism:game_mechanism()
	local number_of_rounds = mechanism_manager:num_sets()

	self._num_rounds = number_of_rounds
	self._num_round_splits = number_of_rounds * 2

	for i = 1, number_of_rounds do
		local bg_node_name = "round_" .. i .. "_bg"

		scenegraph_definition[bg_node_name] = {
			horizontal_alignment = "center",
			parent = "screen",
			vertical_alignment = "center",
			position = {
				0,
				-160 + -110 * (i - 1),
				2,
			},
			size = {
				920,
				100,
			},
		}

		local team_1_bar_node_name = "round_" .. i .. "_team_1_score_bar"

		scenegraph_definition[team_1_bar_node_name] = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			parent = bg_node_name,
			position = {
				40,
				-20,
				3,
			},
			size = {
				400,
				14,
			},
		}

		local team_2_bar_node_name = "round_" .. i .. "_team_2_score_bar"

		scenegraph_definition[team_2_bar_node_name] = {
			horizontal_alignment = "right",
			vertical_alignment = "center",
			parent = bg_node_name,
			position = {
				-40,
				-20,
				3,
			},
			size = {
				400,
				14,
			},
		}
	end
end

VersusRoundEndScreenUI._setup_score_widgets = function (self, scenegraph_definition, widget_definitions, local_player_party_id, opponent_party_id)
	local number_of_rounds = self._num_rounds
	local current_set = self:_get_current_set()

	for i = 1, number_of_rounds do
		local sets_data = self._win_conditions:get_sets_data_for_party(local_player_party_id)
		local set_data = sets_data[i]
		local max_points = set_data.max_points
		local current_points = set_data.claimed_points
		local bar_fill_threashold = current_points / max_points
		local team_1_bar_node_name = "round_" .. i .. "_team_1_score_bar"
		local team_1_widget_def = UIWidgets.create_round_score_progress_bar(team_1_bar_node_name, scenegraph_definition[team_1_bar_node_name].size, nil, true, max_points, current_points)

		team_1_widget_def.content.bar_fill_threashold = bar_fill_threashold

		local team_1_widget = UIWidget.init(team_1_widget_def, self._ui_renderer)

		self._widgets[#self._widgets + 1] = team_1_widget
		self._widgets_by_name[team_1_bar_node_name] = team_1_widget
		sets_data = self._win_conditions:get_sets_data_for_party(opponent_party_id)
		set_data = sets_data[i]
		max_points = set_data.max_points
		current_points = set_data.claimed_points
		bar_fill_threashold = current_points / max_points

		local team_2_bar_node_name = "round_" .. i .. "_team_2_score_bar"
		local team_2_widget_def = UIWidgets.create_round_score_progress_bar(team_2_bar_node_name, scenegraph_definition[team_2_bar_node_name].size, nil, false, max_points, current_points)

		team_2_widget_def.content.bar_fill_threashold = bar_fill_threashold

		local team_2_widget = UIWidget.init(team_2_widget_def, self._ui_renderer)

		self._widgets[#self._widgets + 1] = team_2_widget
		self._widgets_by_name[team_2_bar_node_name] = team_2_widget

		local bg_node_name = "round_" .. i .. "_bg"
		local round_text_widget_name = "round_" .. i .. "_text"
		local str = "%s %d"
		local round_text_style = table.clone(round_text_style)

		round_text_style.text_color = current_set == i and Colors.get_color_table_with_alpha("font_default", 255) or Colors.get_color_table_with_alpha("font_button_normal", 255)

		local round_text_widget_def = UIWidgets.create_simple_text(string.format(str, Localize("versus_round"), i), bg_node_name, nil, nil, round_text_style)
		local round_text_widget = UIWidget.init(round_text_widget_def, self._ui_renderer)

		self._widgets[#self._widgets + 1] = round_text_widget
		self._widgets_by_name[round_text_widget_name] = round_text_widget
	end

	local bg_node_name = "round_" .. current_set .. "_bg"

	self._current_round_bg_widget_def = UIWidgets.create_round_end_round_score_bg_widget(bg_node_name)
end

VersusRoundEndScreenUI._set_team_banner = function (self, local_player_party_id, opponent_party_id)
	local local_team_ui_settings, opponent_team_ui_settings = self:_get_teams_ui_settings(local_player_party_id, opponent_party_id)
	local team_1_banner = self._widgets_by_name.team_1_banner

	team_1_banner.content.texture_id = local_team_ui_settings.local_flag_long_texture

	local team_1_info = self._widgets_by_name.team_1_info

	team_1_info.content.team_name = Localize(local_team_ui_settings.display_name)
	team_1_info.content.team_side = Localize("vs_lobby_your_team")

	local team_2_banner = self._widgets_by_name.team_2_banner

	team_2_banner.content.texture_id = opponent_team_ui_settings.opponent_flag_long_texture

	local team_2_info = self._widgets_by_name.team_2_info

	team_2_info.content.team_name = Localize(opponent_team_ui_settings.display_name)
	team_2_info.content.team_side = Localize("vs_lobby_enemy_team")
end

VersusRoundEndScreenUI._setup_top_detail_banner = function (self, level_key, local_player_party_id, opponent_party_id)
	local level_settings = LevelSettings[level_key]
	local level_display_name = level_settings.display_name
	local widget = self._widgets_by_name.level_name

	widget.content.text = Localize(level_display_name)

	local level_image_widget = self._widgets_by_name.level_image

	level_image_widget.content.icon = level_settings.level_image

	local current_set = self:_get_current_set()
	local max_rounds = VersusObjectiveSettings[level_key].num_sets
	local round_counter = self._widgets_by_name.round_counter

	round_counter.content.text = string.format(Localize("versus_round_count"), current_set, max_rounds)
end

VersusRoundEndScreenUI._setup_total_score_progress_bars_widgets = function (self, level_key, local_player_party_id, opponent_party_id)
	local max_level_score = VersusObjectiveSettings[level_key].max_score
	local local_player_team_score = self._win_conditions:get_total_score(local_player_party_id)
	local opponent_team_score = self._win_conditions:get_total_score(opponent_party_id)
	local local_player_winning = opponent_team_score < local_player_team_score
	local oppoenent_winning = local_player_team_score < opponent_team_score
	local team_1_total_score_def = UIWidgets.create_total_score_progress_bar("team_1_total_score", scenegraph_definition.team_1_total_score.size, max_level_score, local_player_team_score, true)
	local team_1_total_score_widget = UIWidget.init(team_1_total_score_def)

	self._widgets[#self._widgets + 1] = team_1_total_score_widget
	self._widgets_by_name.team_1_total_score = team_1_total_score_widget

	local team_1_content = team_1_total_score_widget.content
	local bar_fill = local_player_team_score / max_level_score

	team_1_content.bar_fill_threashold = bar_fill
	team_1_content.is_winning = local_player_winning

	local team_2_total_score_def = UIWidgets.create_total_score_progress_bar("team_2_total_score", scenegraph_definition.team_2_total_score.size, max_level_score, opponent_team_score, false)
	local team_2_total_score_widget = UIWidget.init(team_2_total_score_def)

	self._widgets[#self._widgets + 1] = team_2_total_score_widget
	self._widgets_by_name.team_2_total_score = team_2_total_score_widget

	local team_2_content = team_2_total_score_widget.content
	local bar_fill = opponent_team_score / max_level_score

	team_2_content.bar_fill_threashold = bar_fill
	team_2_content.is_winning = oppoenent_winning

	local local_team_ui_settings, opponent_team_ui_settings = self:_get_teams_ui_settings(local_player_party_id, opponent_party_id)
	local total_score_bg = self._widgets_by_name.total_score_bg

	total_score_bg.content.team_1_icon = local_team_ui_settings.team_icon
	total_score_bg.content.team_2_icon = opponent_team_ui_settings.team_icon

	local winner_team_crown_def

	if local_player_winning then
		winner_team_crown_def = UIWidgets.create_simple_texture("winner_icon", "team_1_winner")
	elseif oppoenent_winning then
		winner_team_crown_def = UIWidgets.create_simple_texture("winner_icon", "team_2_winner")
	end

	if winner_team_crown_def then
		local winner_team_crown_widget = UIWidget.init(winner_team_crown_def)

		self._widgets[#self._widgets + 1] = winner_team_crown_widget
		self._widgets_by_name.winner_team_crown = winner_team_crown_widget
	end

	local status_text = ""
	local status_text_widget = self._widgets_by_name.team_wining_status_text

	status_text_widget.content.text = status_text
end

VersusRoundEndScreenUI._get_current_set = function (self)
	local rounds_played = self._win_conditions:get_current_round()

	return math.round(rounds_played / 2)
end

VersusRoundEndScreenUI._get_close_to_winning_score = function (self, level_key, local_player_party_id, opponent_party_id)
	local current_set = self:_get_current_set()
	local current_round = self:_get_round_count()
	local num_rounds = self._num_rounds
	local max_level_score = VersusObjectiveSettings[level_key].max_score
	local local_player_team_score = self._win_conditions:get_total_score(local_player_party_id)
	local local_player_team_sets_data = self._win_conditions:get_sets_data_for_party(local_player_party_id)
	local opponent_team_score = self._win_conditions:get_total_score(opponent_party_id)
	local opponent_team_sets_data = self._win_conditions:get_sets_data_for_party(opponent_party_id)
	local local_player_available_score, opponent_team_available_score = max_level_score, max_level_score
	local player = Managers.player:local_player()
	local side = Managers.state.side and Managers.state.side:get_side_from_player_unique_id(player:unique_id())
	local is_hero = side and side:name() == "heroes"
	local match_state = Managers.mechanism:get_state()
	local game_mode = Managers.state.game_mode and Managers.state.game_mode:game_mode()
	local is_round_over = game_mode and game_mode:match_in_round_over_state()
	local local_player_has_played_round, opponent_has_played_round = false, false

	if current_round % current_set ~= 0 then
		local_player_has_played_round = is_hero
		opponent_has_played_round = not is_hero
	elseif current_round % current_set == 0 then
		local_player_has_played_round = true
		opponent_has_played_round = true
	end

	local is_last_round = self._win_conditions:is_final_round()

	for i = 1, num_rounds do
		local local_player_set_data = local_player_team_sets_data[i]
		local opponent_team_set_data = opponent_team_sets_data[i]

		if i < current_set then
			local unclaimed_points = local_player_set_data.max_points - local_player_set_data.claimed_points or 0

			local_player_available_score = local_player_available_score - unclaimed_points
			unclaimed_points = opponent_team_set_data.max_points - opponent_team_set_data.claimed_points or 0
			opponent_team_available_score = opponent_team_available_score - unclaimed_points
		end
	end

	local score_threshold = local_player_available_score < opponent_team_available_score and local_player_available_score or opponent_team_available_score
	local local_player_score_to_win = score_threshold - local_player_team_score
	local opponent_team_score_to_win = score_threshold - opponent_team_score
	local next_round_id = num_rounds >= current_set + 1 and current_set + 1 or num_rounds
	local opp_predicted_score = 0
	local loc_predicted_score = 0

	if local_player_has_played_round and opponent_has_played_round then
		local opponent_team_set_data = opponent_team_sets_data[next_round_id]

		opp_predicted_score = opponent_team_score + opponent_team_set_data.max_points

		local local_player_set_data = local_player_team_sets_data[next_round_id]

		loc_predicted_score = local_player_team_score + local_player_set_data.max_points
	else
		local opponent_team_set_data = opponent_team_sets_data[current_set]

		opp_predicted_score = opponent_team_score + (opponent_team_set_data.max_points - opponent_team_set_data.claimed_points)

		local local_player_set_data = local_player_team_sets_data[current_set]

		loc_predicted_score = local_player_team_score + (local_player_set_data.max_points - local_player_set_data.claimed_points)
	end

	local is_next_round_last = current_round + 1 == self._num_rounds * 2

	if is_next_round_last then
		if is_hero then
			return opponent_party_id, opponent_team_score_to_win + 1
		else
			return local_player_party_id, local_player_score_to_win + 1
		end
	end

	if local_player_score_to_win < opponent_team_score_to_win then
		local local_player_set_data = local_player_team_sets_data[next_round_id]

		if local_player_score_to_win < local_player_set_data.max_points then
			return local_player_party_id, local_player_score_to_win + 1
		end
	elseif opponent_team_score_to_win < local_player_score_to_win then
		local opponent_team_set_data = opponent_team_sets_data[next_round_id]

		if opponent_team_score_to_win < opponent_team_set_data.max_points then
			return opponent_party_id, opponent_team_score_to_win + 1
		end
	else
		local local_player_set_data = local_player_team_sets_data[next_round_id]

		if local_player_score_to_win < local_player_set_data.max_points then
			return local_player_party_id, local_player_score_to_win + 1
		end
	end

	return nil, nil
end
