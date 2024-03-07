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
	self._win_conditions = Managers.mechanism:game_mechanism():win_conditions()

	VersusRoundEndScreenUI.super.init(self, ingame_ui_context, input_service, definitions)
end

VersusRoundEndScreenUI._create_ui_elements = function (self, definitions)
	local scenegraph_definition = definitions.scenegraph_definition
	local widget_definitions = definitions.widget_definitions
	local party_manager = Managers.party
	local _, party_id = party_manager:get_party_from_player_id(self._peer_id, self._local_player_id)
	local opponent_party_id = party_id == 1 and 2 or 1

	self:_setup_score_widgets(scenegraph_definition, widget_definitions, party_id, opponent_party_id)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UISceneGraph.update_scenegraph(self._ui_scenegraph)

	self._widgets, self._widgets_by_name = {}, {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition, self._ui_renderer)

		self._widgets[#self._widgets + 1] = widget
		self._widgets_by_name[name] = widget
	end

	local current_round_bg_widget = UIWidget.init(self._current_round_bg_widget_def, self._ui_renderer)

	self._widgets[#self._widgets + 1] = current_round_bg_widget
	self._widgets_by_name.current_round_bg_widget = current_round_bg_widget
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)

	local level_name = Managers.level_transition_handler:get_current_level_key()

	self:_setup_top_detail_banner(level_name)
	self:_setup_total_score_progress_bars_widgets(level_name, party_id, opponent_party_id)
	self:_set_team_banner(party_id, opponent_party_id)

	local level_settings = LevelSettings[level_name]
	local round_end_events = level_settings.round_end_camera_events

	if round_end_events then
		local current_set = self:_get_current_set()
		local event_name = round_end_events[current_set]
		local world_manager = self._ingame_ui_context.world_manager
		local world = world_manager:world("level_world")
		local level = LevelHelper:current_level(world)

		Level.trigger_event(level, event_name)
	end
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

	self:_play_sound("versus_round_end_chains")
end

VersusRoundEndScreenUI._update = function (self, dt)
	if self._completed then
		return
	end

	if self._round_end_anim_id and self._ui_animator:is_animation_completed(self._round_end_anim_id) then
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
	local round_count = win_conditions:num_rounds_played()

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

VersusRoundEndScreenUI._setup_score_widgets = function (self, scenegraph_definition, widget_definitions, local_player_party_id, opponent_party_id)
	local mechanism_manager = Managers.mechanism:game_mechanism()
	local number_of_rounds = mechanism_manager:num_sets()

	self._num_rounds = number_of_rounds
	self._num_round_splits = number_of_rounds * 2

	local current_set = self:_get_current_set()

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

		local team_1_bar_node_name = "round_" .. i .. "team_1_score_bar"

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

		local team_2_bar_node_name = "round_" .. i .. "team_2_score_bar"

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

		local sets_data = self._win_conditions:get_sets_data_for_party(local_player_party_id)
		local set_data = sets_data[i]
		local max_points = set_data.max_points
		local current_points = set_data.claimed_points
		local bar_fill_threashold = current_points / max_points
		local team_1_widget_def = UIWidgets.create_round_score_progress_bar(team_1_bar_node_name, scenegraph_definition[team_1_bar_node_name].size, nil, true, max_points, current_points)

		team_1_widget_def.content.bar_fill_threashold = bar_fill_threashold
		widget_definitions[team_1_bar_node_name] = team_1_widget_def
		sets_data = self._win_conditions:get_sets_data_for_party(opponent_party_id)
		set_data = sets_data[i]
		max_points = set_data.max_points
		current_points = set_data.claimed_points
		bar_fill_threashold = current_points / max_points

		local team_2_widget_def = UIWidgets.create_round_score_progress_bar(team_2_bar_node_name, scenegraph_definition[team_2_bar_node_name].size, nil, false, max_points, current_points)

		widget_definitions[team_2_bar_node_name] = team_2_widget_def
		team_2_widget_def.content.bar_fill_threashold = bar_fill_threashold

		local round_text_widget_name = "round_" .. i .. "_text"
		local str = "%s %d"
		local round_text_style = table.clone(round_text_style)

		round_text_style.text_color = current_set == i and Colors.get_color_table_with_alpha("font_default", 255) or Colors.get_color_table_with_alpha("font_button_normal", 255)
		widget_definitions[round_text_widget_name] = UIWidgets.create_simple_text(string.format(str, Localize("versus_round"), i), bg_node_name, nil, nil, round_text_style)
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

	local status_text = Localize("versus_end_of_round_team_winning")

	if local_player_team_score < opponent_team_score then
		status_text = Localize("versus_end_of_round_team_losing")
	elseif local_player_team_score == opponent_team_score then
		status_text = Localize("versus_end_of_round_team_tied")
	end

	local status_text_widget = self._widgets_by_name.team_wining_status_text

	status_text_widget.content.text = status_text
end

VersusRoundEndScreenUI._get_current_set = function (self)
	local rounds_played = self._win_conditions:num_rounds_played()

	return math.round(rounds_played / 2)
end
