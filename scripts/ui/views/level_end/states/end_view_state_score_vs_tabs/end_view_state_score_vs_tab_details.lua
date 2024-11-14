-- chunkname: @scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_details.lua

EndViewStateScoreVSTabDetails = class(EndViewStateScoreVSTabDetails)
EndViewStateScoreVSTabDetails.NAME = "EndViewStateScoreVSTabDetails"

local scoreboard_setup = {
	headers = {
		{
			scenegraph_id = "local_heroes_header_grid",
			side = "heroes",
			texts = {
				"vs_scoreboard_eliminations",
				"vs_scoreboard_damage_done",
				"vs_scoreboard_revives",
			},
		},
		{
			scenegraph_id = "local_pact_header_grid",
			side = "dark_pact",
			texts = {
				"vs_scoreboard_eliminations",
				"vs_scoreboard_damage_done",
				"vs_scoreboard_disables",
			},
		},
	},
	local_team = {
		{
			"kills_specials",
			"vs_damage_dealt_to_pactsworn",
			"revives",
			scenegraph_id = "local_heroes_score_grid",
			side = "heroes",
		},
		{
			"kills_heroes",
			"damage_dealt_heroes",
			"disables",
			scenegraph_id = "local_pact_score_grid",
			side = "dark_pact",
		},
	},
	opponent_team = {
		{
			"kills_specials",
			"vs_damage_dealt_to_pactsworn",
			"revives",
			scenegraph_id = "opponent_heroes_score_grid",
			side = "heroes",
		},
		{
			"kills_heroes",
			"damage_dealt_heroes",
			"disables",
			scenegraph_id = "opponent_pact_score_grid",
			side = "dark_pact",
		},
	},
}

EndViewStateScoreVSTabDetails.on_enter = function (self, params)
	print("[EndViewStateVS] Enter Substate EndViewStateScoreVSTabDetails")

	self._params = params
	self._parent = params.parent

	local context = params.context

	self._context = context
	self._ui_renderer = context.ui_renderer
	self._ui_top_renderer = context.ui_top_renderer
	self._input_manager = context.input_manager
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params)
	self:_start_transition_animation("on_enter", "on_enter")
	self._parent:hide_team()
	self._parent:activate_back_to_keep_button()
end

EndViewStateScoreVSTabDetails.on_exit = function (self, params)
	print("[EndViewStateVS] Exit Substate EndViewStateScoreVSTabDetails")

	self._ui_scenegraph = nil
	self._widgets = nil
	self._widgets_by_name = nil
	self._ui_animator = nil
end

EndViewStateScoreVSTabDetails.create_ui_elements = function (self, params)
	local definitions = self:_get_definitions()
	local widget_definitions = definitions.widget_definitions
	local scenegraph_definition = definitions.scenegraph_definition
	local animation_definitions = definitions.animation_definitions

	self._scenegraph_definition = scenegraph_definition
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions, {}, {})

	self:_populate_stats(definitions)
	self:_create_winner_icon(definitions)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

EndViewStateScoreVSTabDetails._create_winner_icon = function (self, definitions)
	local create_winner_icon_func = definitions.create_winner_icon_func
	local my_peer_id = Network.peer_id()
	local local_player_id = 1
	local local_player_party_id = self._context.party_composition[PlayerUtils.unique_player_id(my_peer_id, local_player_id)]
	local opponent_party_id = local_player_party_id == 1 and 2 or 1
	local scores = self._context.rewards.team_scores
	local local_player_team_score = scores[local_player_party_id]
	local opponent_team_score = scores[opponent_party_id]

	if opponent_team_score < local_player_team_score then
		local widget_definition = create_winner_icon_func("local_team")
		local widget = UIWidget.init(widget_definition)

		self._widgets[#self._widgets + 1] = widget
		self._widgets_by_name.local_winner_icon = widget
	elseif local_player_team_score < opponent_team_score then
		local widget_definition = create_winner_icon_func("opponent_team")
		local widget = UIWidget.init(widget_definition)

		self._widgets[#self._widgets + 1] = widget
		self._widgets_by_name.opponent_winner_icon = widget
	end
end

local PARTY_COMPOSITION = {}
local TEAM_SIZES = {}
local MAX_TEAM_SIZES = {}

EndViewStateScoreVSTabDetails._trim_bots = function (self, party_composition)
	table.clear(PARTY_COMPOSITION)
	table.clear(TEAM_SIZES)
	table.clear(MAX_TEAM_SIZES)

	local versus_party_settings = GameModeSettings.versus.party_settings

	for team, settings in pairs(versus_party_settings) do
		MAX_TEAM_SIZES[settings.party_id] = settings.num_slots
	end

	for name, party_id in pairs(party_composition) do
		local values = string.split_deprecated(name, ":")

		if values[2] == "1" then
			PARTY_COMPOSITION[name] = party_id
			TEAM_SIZES[party_id] = (TEAM_SIZES[party_id] or 0) + 1
		end
	end

	return PARTY_COMPOSITION, TEAM_SIZES, MAX_TEAM_SIZES
end

EndViewStateScoreVSTabDetails._populate_stats = function (self, definitions)
	local my_peer_id = Network.peer_id()
	local context = self._context
	local party_composition, team_sizes, max_team_sizes = self:_trim_bots(context.party_composition)
	local my_unique_id = my_peer_id .. ":1"
	local my_party_id = party_composition[my_unique_id]
	local my_team = GameModeSettings.versus.party_names_lookup_by_id[my_party_id]
	local opponent_party_id = my_party_id == 1 and 2 or 1
	local opponent_team = GameModeSettings.versus.party_names_lookup_by_id[opponent_party_id]
	local players_session_score = context.players_session_score
	local create_stats_func = definitions.create_stats_func
	local create_title_func = definitions.create_title_func
	local create_team_grid_fields_func = definitions.create_team_grid_fields_func
	local create_team_title_func = definitions.create_team_title_func
	local create_flag_func = definitions.create_flag_func
	local player_session_data = table.values(players_session_score)
	local player_highscores = {}

	for _, data in pairs(player_session_data) do
		local scores = data.scores
		local unique_id = data.peer_id .. ":" .. data.local_player_id
		local party_id = party_composition[unique_id]

		for key, value in pairs(scores) do
			player_highscores[key] = player_highscores[key] or value
			player_highscores[key] = value > player_highscores[key] and value or player_highscores[key]
		end
	end

	local function sort_by_names(a, b)
		return a.name < b.name
	end

	table.sort(player_session_data, sort_by_names)

	local offset = {
		0,
		0,
		0,
	}
	local fields = {}
	local highscores = {}
	local total_fields = {}

	for team, team_scoreboard_setup in pairs(scoreboard_setup) do
		for _, setup in ipairs(team_scoreboard_setup) do
			local scenegraph_id = setup.scenegraph_id
			local side = setup.side
			local row_index = 0

			table.clear(total_fields)

			local texts = setup.texts

			if texts then
				table.clear(fields)

				for _, text in ipairs(texts) do
					fields[#fields + 1] = Localize(text)
				end

				offset[2] = -40 * row_index

				local is_me = false
				local skip_highscore = true
				local widget_definition = create_stats_func(scenegraph_id, fields, 18, offset, is_me, skip_highscore)
				local widget = UIWidget.init(widget_definition)

				self._widgets[#self._widgets + 1] = widget
				self._widgets_by_name[team .. "_" .. side] = widget
			else
				for _, data in pairs(player_session_data) do
					local unique_id = data.peer_id .. ":" .. data.local_player_id
					local party_id = party_composition[unique_id]
					local player_team_name = GameModeSettings.versus.party_names_lookup_by_id[party_id]
					local player_team = party_id == my_party_id and "local_team" or "opponent_team"

					if player_team == team then
						local scores = data.scores

						table.clear(fields)
						table.clear(highscores)

						for i = 1, #setup do
							local stat_name = setup[i]

							fields[#fields + 1] = scores[stat_name] or Localize("menu_settings_none")
							total_fields[i] = (total_fields[i] or 0) + (scores[stat_name] or 0)
							highscores[#highscores + 1] = player_highscores[stat_name]
						end

						offset[2] = -40 * (row_index - 1)

						local skip_highscore = false
						local widget_definition = create_stats_func(scenegraph_id, fields, 20, offset, data.peer_id == my_peer_id, skip_highscore, highscores)
						local widget = UIWidget.init(widget_definition)

						self._widgets[#self._widgets + 1] = widget
						self._widgets_by_name[unique_id .. "_" .. team .. "_" .. side] = widget

						if side == "heroes" then
							offset[1] = -200

							local widget_definition = create_title_func(scenegraph_id, data.name, nil, offset, data.peer_id == my_peer_id, player_team_name)
							local widget = UIWidget.init(widget_definition)

							self._widgets[#self._widgets + 1] = widget
							self._widgets_by_name["title_" .. unique_id .. "_" .. team .. "_" .. side] = widget
							offset[1] = 0
						end

						row_index = row_index + 1
					end
				end

				local widget_definitions = create_team_grid_fields_func(team, row_index, self._ui_scenegraph)

				UIUtils.create_widgets(widget_definitions, self._widgets, self._widgets_by_name)

				offset[2] = 95

				local widget_definition = create_stats_func(scenegraph_id, total_fields, 45, offset, nil, nil, nil, team)
				local widget = UIWidget.init(widget_definition)

				self._widgets[#self._widgets + 1] = widget
				self._widgets_by_name["total_fields_" .. "_" .. team .. "_" .. side] = widget

				local widget_definition = create_team_title_func(team, my_team, opponent_team)
				local widget = UIWidget.init(widget_definition)

				self._widgets[#self._widgets + 1] = widget
				self._widgets_by_name["team_title_" .. team] = widget

				local widget_definition = create_flag_func(team, my_team, opponent_team)
				local widget = UIWidget.init(widget_definition)

				self._widgets[#self._widgets + 1] = widget
				self._widgets_by_name[team .. "_flag"] = widget
			end
		end
	end
end

EndViewStateScoreVSTabDetails._get_definitions = function (self)
	return local_require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_details_definitions")
end

EndViewStateScoreVSTabDetails.update = function (self, dt, t)
	self:_draw(dt, t)
	self:_update_animations(dt)
end

EndViewStateScoreVSTabDetails.post_update = function (self, dt, t)
	return
end

EndViewStateScoreVSTabDetails._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

EndViewStateScoreVSTabDetails._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("end_of_level")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

EndViewStateScoreVSTabDetails._start_transition_animation = function (self, key, animation_name)
	local params = {
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, self._scenegraph_definition, params)

	self._animations[key] = anim_id
end
