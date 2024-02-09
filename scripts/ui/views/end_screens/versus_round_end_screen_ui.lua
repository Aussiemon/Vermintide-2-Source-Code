-- chunkname: @scripts/ui/views/end_screens/versus_round_end_screen_ui.lua

require("scripts/ui/views/end_screens/base_end_screen_ui")
require("scripts/ui/round_end_emblem_popup/round_end_emblem_popup_ui")

local definitions = local_require("scripts/ui/views/end_screens/versus_round_end_screen_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local BANNER_SIZE = {
	500,
	80,
}
local OBJECTIVE_MOVE_DURATION = 1.2
local OBJECTIVE_VISIBILITY_RANGE = 800
local OBJECTIVE_WIDTH_SPACING = 400

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

	self:_setup_score_widgets(scenegraph_definition, widget_definitions)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UISceneGraph.update_scenegraph(self._ui_scenegraph)

	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)

	local party_manager = Managers.party
	local _, party_id = party_manager:get_party_from_player_id(self._peer_id, self._local_player_id)
	local opponent_party_id = party_id == 1 and 2 or 1
	local level_name = Managers.level_transition_handler:get_current_level_key()

	self:_populate_current_score_widgets(party_id, opponent_party_id)
	self:_setup_top_detail_banner(level_name)
	self:_setup_total_score_widget(level_name, party_id, opponent_party_id)

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

VersusRoundEndScreenUI._setup_score_widgets = function (self, scenegraph_definition, widget_definitions)
	local mechanism_manager = Managers.mechanism:game_mechanism()
	local number_of_rounds = mechanism_manager:num_sets()

	self._num_rounds = number_of_rounds
	self._num_round_splits = number_of_rounds * 2

	local parent_node_id = "team_1_score_anchor"

	self:_create_score_widgets_definitions(scenegraph_definition, widget_definitions, parent_node_id, "team_1_round_", number_of_rounds)

	parent_node_id = "team_2_score_anchor"

	self:_create_score_widgets_definitions(scenegraph_definition, widget_definitions, parent_node_id, "team_2_round_", number_of_rounds)

	local anchor_size_x = scenegraph_definition.team_1_score_anchor.size[1]
	local anchor_size_y = BANNER_SIZE[2] * (number_of_rounds + 1)

	scenegraph_definition.team_1_score_anchor.size[2] = anchor_size_y
	scenegraph_definition.team_2_score_anchor.size[2] = anchor_size_y

	local frame_settings = UIFrameSettings.menu_frame_04
	local frame_style = {
		color = Colors.get_color_table_with_alpha("white", 255),
		size = {
			anchor_size_x + 4,
			anchor_size_y + 4,
		},
		offset = {
			-2,
			-2,
			50,
		},
	}

	widget_definitions.team_1_score_box_frame = UIWidgets.create_simple_frame(frame_settings.texture, frame_settings.texture_size, frame_settings.texture_sizes.corner, frame_settings.texture_sizes.vertical, frame_settings.texture_sizes.horizontal, "team_1_score_anchor", frame_style)
	widget_definitions.team_2_score_box_frame = UIWidgets.create_simple_frame(frame_settings.texture, frame_settings.texture_size, frame_settings.texture_sizes.corner, frame_settings.texture_sizes.vertical, frame_settings.texture_sizes.horizontal, "team_2_score_anchor", frame_style)
end

VersusRoundEndScreenUI._create_score_widgets_definitions = function (self, scenegraph_definition, widget_definitions, parent_node_id, new_node_prefix, num_rounds)
	for i = 1, num_rounds do
		local widget_name = new_node_prefix .. i

		scenegraph_definition[widget_name] = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			parent = parent_node_id,
			size = BANNER_SIZE,
			position = {
				0,
				-(i * BANNER_SIZE[2]),
				1,
			},
		}

		local widget_def = UIWidgets.create_round_end_score_widget(widget_name)

		widget_definitions[widget_name] = widget_def
	end
end

VersusRoundEndScreenUI._populate_current_score_widgets = function (self, local_player_party_id, opponent_party_id)
	self:_populate_side_score_widgets(local_player_party_id, true)
	self:_populate_side_score_widgets(opponent_party_id, false)
	self:_set_team_banner(local_player_party_id, opponent_party_id)
end

VersusRoundEndScreenUI._populate_side_score_widgets = function (self, party_id, is_local_player)
	local team_index = is_local_player and 1 or 2
	local sets_data = self._win_conditions:get_sets_data_for_party(party_id)
	local color_name = is_local_player and "local_player_team" or "opponent_team"

	for i = 1, self._num_rounds do
		local widget_name = "team_" .. team_index .. "_round_" .. i
		local widget = self._widgets_by_name[widget_name]
		local set_data = sets_data[i]
		local content = widget.content
		local style = widget.style
		local max_points = set_data.max_points
		local current_points = set_data.claimed_points
		local unclaimed_points = set_data.unclaimed_points == 0 and max_points - current_points or 0

		content.round_text = Localize("versus_round") .. " " .. i
		content.current_score = current_points
		content.max_score = max_points
		content.max_points_text = tostring(max_points)
		content.unclaimed_points = unclaimed_points
		style.score_progress_bar.color = Colors.get_color_table_with_alpha(color_name, 255)
		style.current_score_icon.color = is_local_player and Colors.get_color_table_with_alpha("local_player_team", 255) or Colors.get_color_table_with_alpha("opponent_team", 255)
	end
end

VersusRoundEndScreenUI._set_team_banner = function (self, local_player_party_id, opponent_party_id)
	local local_team_ui_settings, opponent_team_ui_settings = self:_get_teams_ui_settings(local_player_party_id, opponent_party_id)
	local team_1_banner = self._widgets_by_name.team_1_banner

	team_1_banner.content.team_icon = local_team_ui_settings.team_icon
	team_1_banner.content.team_text = Localize(local_team_ui_settings.display_name)
	team_1_banner.content.side_text = Localize("vs_lobby_your_team")
	team_1_banner.style.side_text.text_color = Colors.get_color_table_with_alpha("local_player_picking", 255)

	local team_2_banner = self._widgets_by_name.team_2_banner

	team_2_banner.content.team_icon = opponent_team_ui_settings.team_icon
	team_2_banner.content.team_text = Localize(opponent_team_ui_settings.display_name)
	team_2_banner.content.side_text = Localize("vs_lobby_enemy_team")
	team_2_banner.style.side_text.text_color = Colors.get_color_table_with_alpha("opponent_team", 255)
end

VersusRoundEndScreenUI._setup_top_detail_banner = function (self, level_key, local_player_party_id, opponent_party_id)
	local level_settings = LevelSettings[level_key]
	local level_display_name = level_settings.display_name
	local widget = self._widgets_by_name.level_name

	widget.content.text = Localize(level_display_name)

	local current_set = self:_get_current_set()
	local max_rounds = VersusObjectiveSettings[level_key].num_sets
	local round_counter = self._widgets_by_name.round_counter

	round_counter.content.text = string.format(Localize("versus_round_count"), current_set, max_rounds)
end

VersusRoundEndScreenUI._setup_total_score_widget = function (self, level_key, local_player_party_id, opponent_party_id)
	local total_score_widget = self._widgets_by_name.total_score
	local content = total_score_widget.content
	local style = total_score_widget.style
	local max_level_score = VersusObjectiveSettings[level_key].max_score

	content.max_score_text = max_level_score
	content.max_score = max_level_score

	local local_player_team_score = self._win_conditions:get_total_score(local_player_party_id)

	content.team_1_score = local_player_team_score

	local opponent_team_score = self._win_conditions:get_total_score(opponent_party_id)

	content.team_2_score = opponent_team_score

	local status_text = Localize("versus_end_of_round_team_winning")

	if local_player_team_score < opponent_team_score then
		status_text = Localize("versus_end_of_round_team_losing")
	elseif local_player_team_score == opponent_team_score then
		status_text = Localize("versus_end_of_round_team_tied")
	end

	content.status_text = status_text
end

VersusRoundEndScreenUI._get_current_set = function (self)
	local rounds_played = self._win_conditions:num_rounds_played()
	local current_set = Managers.mechanism:game_mechanism():get_current_set()

	if not rounds_played == self._num_round_splits and current_set ~= 1 and rounds_played % current_set == 0 then
		return current_set - 1
	else
		return current_set
	end
end
