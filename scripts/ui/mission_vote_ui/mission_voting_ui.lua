local definitions = local_require("scripts/ui/mission_vote_ui/mission_voting_ui_definitions")
local widget_definitions = definitions.widgets
local generic_input_actions = definitions.generic_input_actions
local deed_game_widget_definitions = definitions.deed_game_widgets
local custom_game_widget_definitions = definitions.custom_game_widgets
local adventure_game_widget_definitions = definitions.adventure_game_widgets
local game_mode_widget_definitions = definitions.game_mode_widgets
local event_game_widget_definitions = definitions.event_game_widgets
local weave_game_widget_definitions = definitions.weave_game_widgets
local weave_find_group_widget_definitions = definitions.weave_find_group_widgets
local weave_quickplay_widget_definitions = definitions.weave_quickplay_widgets
local twitch_mode_widget_funcs = definitions.twitch_mode_widget_funcs
local switch_mechanism_widget_definitions = definitions.switch_mechanism_widgets
MissionVotingUI = class(MissionVotingUI)

MissionVotingUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.voting_manager = ingame_ui_context.voting_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._is_server = ingame_ui_context.is_server
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()

	self:create_ui_elements()

	local input_manager = self.input_manager

	input_manager:create_input_service("mission_voting", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("mission_voting", "keyboard")
	input_manager:map_device_to_service("mission_voting", "mouse")
	input_manager:map_device_to_service("mission_voting", "gamepad")

	local input_service = input_manager:get_service("mission_voting")
	self._menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, 3, 900, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)
end

MissionVotingUI.create_ui_elements = function (self)
	self._ui_animations = {}
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
	local deed_widgets = {}
	local deed_widgets_by_name = {}

	for name, widget_definition in pairs(deed_game_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			deed_widgets[#deed_widgets + 1] = widget
			deed_widgets_by_name[name] = widget
		end
	end

	self._deed_widgets = deed_widgets
	self._deed_widgets_by_name = deed_widgets_by_name
	local custom_game_widgets = {}
	local custom_game_widgets_by_name = {}

	for name, widget_definition in pairs(custom_game_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			custom_game_widgets[#custom_game_widgets + 1] = widget
			custom_game_widgets_by_name[name] = widget
		end
	end

	self._custom_game_widgets = custom_game_widgets
	self._custom_game_widgets_by_name = custom_game_widgets_by_name
	local event_game_widgets = {}
	local event_game_widgets_by_name = {}

	for name, widget_definition in pairs(event_game_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			event_game_widgets[#event_game_widgets + 1] = widget
			event_game_widgets_by_name[name] = widget
		end
	end

	self._event_game_widgets = event_game_widgets
	self._event_game_widgets_by_name = event_game_widgets_by_name
	local weave_game_widgets = {}
	local weave_game_widgets_by_name = {}

	for name, widget_definition in pairs(weave_game_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			weave_game_widgets[#weave_game_widgets + 1] = widget
			weave_game_widgets_by_name[name] = widget
		end
	end

	self._weave_game_widgets = weave_game_widgets
	self._weave_game_widgets_by_name = weave_game_widgets_by_name
	local weave_find_group_widgets = {}
	local weave_find_group_widgets_by_name = {}

	for name, widget_definition in pairs(weave_find_group_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			weave_find_group_widgets[#weave_find_group_widgets + 1] = widget
			weave_find_group_widgets_by_name[name] = widget
		end
	end

	self._weave_find_group_widgets = weave_find_group_widgets
	self._weave_find_group_widgets_by_name = weave_find_group_widgets_by_name
	local weave_quickplay_widgets = {}
	local weave_quickplay_widgets_by_name = {}

	for name, widget_definition in pairs(weave_quickplay_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			weave_quickplay_widgets[#weave_quickplay_widgets + 1] = widget
			weave_quickplay_widgets_by_name[name] = widget
		end
	end

	self._weave_quickplay_widgets = weave_quickplay_widgets
	self._weave_quickplay_widgets_by_name = weave_quickplay_widgets_by_name
	local adventure_game_widgets = {}
	local adventure_game_widgets_by_name = {}

	for name, widget_definition in pairs(adventure_game_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			adventure_game_widgets[#adventure_game_widgets + 1] = widget
			adventure_game_widgets_by_name[name] = widget
		end
	end

	self._adventure_game_widgets = adventure_game_widgets
	self._adventure_game_widgets_by_name = adventure_game_widgets_by_name
	local game_mode_widgets = {}
	local game_mode_widgets_by_name = {}

	for name, widget_definition in pairs(game_mode_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			game_mode_widgets[#game_mode_widgets + 1] = widget
			game_mode_widgets_by_name[name] = widget
		end
	end

	self._game_mode_widgets = game_mode_widgets
	self._game_mode_widgets_by_name = game_mode_widgets_by_name
	local switch_mechanism_widgets = {}
	local switch_mechanism_widgets_by_name = {}

	for name, widget_definition in pairs(switch_mechanism_widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			switch_mechanism_widgets[#switch_mechanism_widgets + 1] = widget
			switch_mechanism_widgets_by_name[name] = widget
		end
	end

	self._switch_mechanism_widgets = switch_mechanism_widgets
	self._switch_mechanism_widgets_by_name = switch_mechanism_widgets_by_name
	local twitch_widgets = {}
	local twitch_widgets_by_name = {}

	for name, widget_func in pairs(twitch_mode_widget_funcs) do
		local widget_definition = widget_func(self._is_server)
		local widget = UIWidget.init(widget_definition)
		twitch_widgets[#twitch_widgets + 1] = widget
		twitch_widgets_by_name[name] = widget
	end

	self._twitch_widgets = twitch_widgets
	self._twitch_widgets_by_name = twitch_widgets_by_name
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.scenegraph_definition = definitions.scenegraph_definition

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)
end

MissionVotingUI.destroy = function (self)
	if self.vote_started then
		self:on_vote_ended()
	end
end

MissionVotingUI.is_active = function (self)
	return self.vote_started and not self.has_voted
end

MissionVotingUI.setup_option_input = function (self, option_widget, option)
	local text = option.text
	local input_action = option.input
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("mission_voting")
	local gamepad_active = false
	local button_texture_data, input_text = UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)

	if not gamepad_active then
		button_texture_data = nil
	end

	local option_text = Localize(text)
	option_widget.content.title_text = option_text
end

MissionVotingUI.start_vote = function (self, active_voting)
	self.render_settings.alpha_multiplier = 0
	local vote_template = active_voting.template

	if vote_template.can_start_vote then
		local can_start_vote = vote_template.can_start_vote(active_voting.data)

		if not can_start_vote then
			local text = vote_template.text or "Unknown vote"

			printf("[MissionVotingUI] - Terminating vote request (%s) due to the requirements to start was not fulfilled.", text)

			return
		end
	end

	local vote_data = active_voting.data
	local game_mode = vote_data.game_mode
	self._twitch_mode_enabled = vote_data.twitch_enabled
	self._game_mode = vote_data.game_mode

	if game_mode == "deed" then
		local item_name = vote_data.item_name
		local level_key = vote_data.level_key
		local difficulty = vote_data.difficulty

		self:_set_deed_presentation(item_name, level_key, difficulty)
	elseif game_mode == "event" then
		local event_data = vote_data.event_data
		local level_key = vote_data.level_key
		local difficulty = vote_data.difficulty
		local mutators = (event_data and event_data.mutators) or {}

		self:_set_event_game_presentation(difficulty, level_key, mutators)
	elseif game_mode == "weave" then
		local quick_game = vote_data.quick_game

		if quick_game then
			local difficulty = vote_data.difficulty

			self:_set_weave_quickplay_presentation(difficulty)
		else
			local weave_name = vote_data.weave_name
			local level_key = vote_data.level_key
			local difficulty = vote_data.difficulty
			local private_game = vote_data.private_game

			self:_set_weave_presentation(difficulty, level_key, weave_name, private_game)
		end
	elseif game_mode == "weave_find_group" then
		self:_set_weave_find_group_presentation()
	else
		local quick_game = vote_data.quick_game

		if quick_game then
			local difficulty = vote_data.difficulty

			self:_set_adventure_presentation(difficulty)
		elseif vote_data.mechanism_key ~= nil then
			local mechanism_key = vote_data.mechanism_key

			self:_set_game_mode_presentation(mechanism_key)
		elseif vote_data.switch_mechanism then
			self:_set_switch_mechanism_presentation(vote_data)
		else
			local level_key = vote_data.level_key
			local difficulty = vote_data.difficulty
			local private_game = vote_data.private_game
			local always_host = vote_data.always_host
			local strict_matchmaking = vote_data.strict_matchmaking

			self:_set_custom_game_presentation(difficulty, level_key, private_game, always_host, strict_matchmaking)
		end
	end

	local title_text = vote_template.text

	if vote_template.modify_title_text then
		title_text = vote_template.modify_title_text(Localize(title_text), vote_data)
	else
		title_text = Localize(title_text)
	end

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.title_text.content.text = title_text
	self.voters = {}
	self.vote_results = {
		[1.0] = 0,
		[2.0] = 0
	}
	self.vote_started = true
	self.has_voted = false
	local vote_options = vote_template.vote_options

	self:setup_option_input(widgets_by_name.button_confirm, vote_options[1])
	self:setup_option_input(widgets_by_name.button_abort, vote_options[2])

	self.gamepad_active = self.input_manager:is_device_active("gamepad")

	self:_acquire_input()

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
		ShadingEnvironment.apply(shading_env)
	end

	self._ui_animations.twitch_info = UIAnimation.init(UIAnimation.function_by_time, self.ui_scenegraph.twitch_mode_info.local_position, 1, 400, 0, 0.3, math.easeOutCubic)

	self:_check_initial_votes()
	self:_setup_gamepad_input_desc(vote_template)
end

MissionVotingUI._setup_gamepad_input_desc = function (self, vote_template)
	local input_desc = vote_template.gamepad_input_desc

	if input_desc then
		self._menu_input_description:set_input_description(generic_input_actions[input_desc])
	else
		self._menu_input_description:set_input_description(nil)
	end
end

MissionVotingUI._check_initial_votes = function (self)
	local has_voted = self.voting_manager:has_voted(Network.peer_id())

	if has_voted then
		self:on_vote_casted()
	end
end

MissionVotingUI.on_vote_casted = function (self)
	self.has_voted = true

	self.voting_manager:allow_vote_input(false)
	self:_release_input()

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
		ShadingEnvironment.apply(shading_env)
	end
end

MissionVotingUI.on_vote_ended = function (self)
	if not self.has_voted then
		self.voting_manager:allow_vote_input(false)
		self:_release_input()

		local world = self.ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
			ShadingEnvironment.apply(shading_env)
		end
	end

	local ingame_ui = self.ingame_ui

	if ingame_ui:is_local_player_ready_for_game() then
		ingame_ui:suspend_active_view()
	end

	self.has_voted = nil
	self.vote_started = nil
end

MissionVotingUI._get_selection_frame_by_difficulty_index = function (self, difficulty_index)
	local completed_frame_texture = "map_frame_00"

	if difficulty_index and difficulty_index > 0 then
		local difficulty_key = DefaultDifficulties[difficulty_index]
		local settings = DifficultySettings[difficulty_key]
		completed_frame_texture = settings.completed_frame_texture
	end

	return completed_frame_texture
end

MissionVotingUI._set_weave_quickplay_presentation = function (self, difficulty)
	local difficulty_settings = DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_settings.display_name
	local difficulty_display_image = difficulty_settings.display_image
	local difficulty_frame_texture = difficulty_settings.completed_frame_texture or "map_frame_00"
	local weave_quickplay_widgets_by_name = self._weave_quickplay_widgets_by_name
	local game_option_1 = weave_quickplay_widgets_by_name.game_option_1
	game_option_1.content.option_text = Localize(difficulty_display_name)
	game_option_1.content.icon = difficulty_display_image
	game_option_1.content.icon_frame = difficulty_frame_texture
	self._presentation_type = "weave_quickplay"
end

MissionVotingUI._set_adventure_presentation = function (self, difficulty)
	local difficulty_settings = DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_settings.display_name
	local difficulty_display_image = difficulty_settings.display_image
	local difficulty_frame_texture = difficulty_settings.completed_frame_texture or "map_frame_00"
	local adventure_game_widgets_by_name = self._adventure_game_widgets_by_name
	local game_option_1 = adventure_game_widgets_by_name.game_option_1
	game_option_1.content.option_text = Localize(difficulty_display_name)
	game_option_1.content.icon = difficulty_display_image
	game_option_1.content.icon_frame = difficulty_frame_texture
	self._presentation_type = "adventure"
end

MissionVotingUI._set_game_mode_presentation = function (self, mechanism_key)
	local game_mode_widgets_by_name = self._game_mode_widgets_by_name
	local game_mode_text = game_mode_widgets_by_name.game_mode_text
	game_mode_text.content.text = Localize("vs_game_mode_title_" .. mechanism_key)
	self._presentation_type = "game_mode"
end

MissionVotingUI._set_switch_mechanism_presentation = function (self, vote_data)
	local mechanism_key = vote_data.mechanism
	local level_key = vote_data.level_key
	local level_settings = LevelSettings[level_key]
	local level_display_name = level_settings.display_name
	local level_image = level_settings.level_image
	local frame_index = 3
	local level_frame = self:_get_selection_frame_by_difficulty_index(frame_index)
	local switch_mechanism_widgets_by_name = self._switch_mechanism_widgets_by_name
	local game_option_1 = switch_mechanism_widgets_by_name.game_option_1
	game_option_1.content.title_text = Localize(level_display_name)
	local level_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(level_image)
	game_option_1.content.icon = level_image
	game_option_1.content.icon_frame = level_frame
	local level_texture_size = game_option_1.style.icon.texture_size
	level_texture_size[1] = level_texture_settings.size[1]
	level_texture_size[2] = level_texture_settings.size[2]
	self._presentation_type = "switch_mechanism"
end

MissionVotingUI._set_custom_game_presentation = function (self, difficulty, level_key, private_game, always_host, strict_matchmaking)
	local difficulty_settings = DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_settings.display_name
	local difficulty_display_image = difficulty_settings.display_image
	local difficulty_frame_texture = difficulty_settings.completed_frame_texture or "map_frame_00"
	local level_settings = LevelSettings[level_key]
	local level_display_name = level_settings.display_name
	local level_image = level_settings.level_image
	local completed_difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(self.statistics_db, self._stats_id, level_key) or 0
	local level_frame = self:_get_selection_frame_by_difficulty_index(completed_difficulty_index)
	local custom_game_widgets_by_name = self._custom_game_widgets_by_name
	local game_option_1 = custom_game_widgets_by_name.game_option_1
	game_option_1.content.option_text = Localize(level_display_name)
	local level_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(level_image)
	game_option_1.content.icon = level_image
	game_option_1.content.icon_frame = level_frame
	local level_texture_size = game_option_1.style.icon.texture_size
	level_texture_size[1] = level_texture_settings.size[1]
	level_texture_size[2] = level_texture_settings.size[2]
	local game_option_2 = custom_game_widgets_by_name.game_option_2
	game_option_2.content.option_text = Localize(difficulty_display_name)
	game_option_2.content.icon = difficulty_display_image
	game_option_2.content.icon_frame = difficulty_frame_texture
	local additional_option = custom_game_widgets_by_name.additional_option
	additional_option.content.option_text = ""
	local private_button = custom_game_widgets_by_name.private_button
	private_button.content.button_hotspot.disable_button = true
	private_button.content.button_hotspot.is_selected = private_game
	private_button.style.hover_glow.color[1] = 0
	local host_button = custom_game_widgets_by_name.host_button
	host_button.content.button_hotspot.disable_button = true
	host_button.content.button_hotspot.is_selected = always_host
	host_button.style.hover_glow.color[1] = 0
	local strict_matchmaking_button = custom_game_widgets_by_name.strict_matchmaking_button
	strict_matchmaking_button.content.button_hotspot.disable_button = true
	strict_matchmaking_button.content.button_hotspot.is_selected = strict_matchmaking
	strict_matchmaking_button.style.hover_glow.color[1] = 0
	self._presentation_type = "custom"
end

MissionVotingUI._set_deed_presentation = function (self, item_key, level_key, difficulty)
	local item_data = ItemMasterList[item_key]
	local item = {
		data = item_data,
		difficulty = difficulty,
		level_key = level_key
	}
	local deed_widgets_by_name = self._deed_widgets_by_name
	local item_presentation = deed_widgets_by_name.item_presentation
	item_presentation.content.item = item
	self._presentation_type = "deed"
end

MissionVotingUI._set_event_game_presentation = function (self, difficulty, level_key, mutators)
	local difficulty_settings = DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_settings.display_name
	local difficulty_display_image = difficulty_settings.display_image
	local difficulty_frame_texture = difficulty_settings.completed_frame_texture or "map_frame_00"
	local event_game_widgets_by_name = self._event_game_widgets_by_name
	local game_option_1 = event_game_widgets_by_name.game_option_1
	game_option_1.content.option_text = Localize(difficulty_display_name)
	game_option_1.content.icon = difficulty_display_image
	game_option_1.content.icon_frame = difficulty_frame_texture
	local event_summary = event_game_widgets_by_name.event_summary
	event_summary.content.item = {
		level_key = level_key,
		mutators = mutators
	}
	self._presentation_type = "event"
end

MissionVotingUI._set_weave_presentation = function (self, difficulty, level_key, weave_id, private_game)
	local weave_game_widgets_by_name = self._weave_game_widgets_by_name
	local game_option_1 = weave_game_widgets_by_name.game_option_1
	local weave_template = WeaveSettings.templates[weave_id]
	local weave_index = table.find(WeaveSettings.templates_ordered, weave_template)
	local wind_name = weave_template.wind
	local wind_settings = WindSettings[wind_name]
	local level_settings = LevelSettings[level_key]
	local level_image = level_settings.level_image
	local difficulty_settings = DifficultySettings[difficulty]
	local level_frame = difficulty_settings.completed_frame_texture
	local level_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(level_image)
	game_option_1.content.icon = level_image
	local level_texture_size = game_option_1.style.icon.texture_size
	level_texture_size[1] = level_texture_settings.size[1] * 0.8
	level_texture_size[2] = level_texture_settings.size[2] * 0.8
	game_option_1.content.title_text = weave_index .. ". " .. Localize(weave_template.display_name)
	local wind_color = Colors.get_color_table_with_alpha(wind_name, 255)
	game_option_1.style.icon_frame.color = wind_color
	local thumbnail_icon = wind_settings.thumbnail_icon
	local thumbnail_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(thumbnail_icon)
	local thumbnail_icon_size = thumbnail_icon_settings.size
	local wind_icon_glow_style = game_option_1.style.wind_icon_glow
	local wind_icon_glow_size = wind_icon_glow_style.texture_size
	local wind_icon_glow_offset = wind_icon_glow_style.offset
	local wind_icon_glow_color = wind_icon_glow_style.color
	wind_icon_glow_color[1] = 128
	wind_icon_glow_color[2] = wind_color[2]
	wind_icon_glow_color[3] = wind_color[3]
	wind_icon_glow_color[4] = wind_color[4]
	local wind_icon_style = game_option_1.style.wind_icon
	local wind_icon_size = wind_icon_style.texture_size
	local wind_icon_offset = wind_icon_style.offset
	wind_icon_size[1] = thumbnail_icon_size[1] * 0.8
	wind_icon_size[2] = thumbnail_icon_size[2] * 0.8
	wind_icon_offset[1] = wind_icon_glow_offset[1] - wind_icon_glow_size[1] / 2 + wind_icon_size[1] / 2
	wind_icon_offset[2] = (wind_icon_glow_offset[2] + wind_icon_glow_size[2] / 2) - wind_icon_size[2] / 2
	game_option_1.content.wind_icon = thumbnail_icon
	game_option_1.content.mission_name = Localize(level_settings.display_name)
	game_option_1.content.wind_name = Localize(wind_settings.display_name)
	game_option_1.style.wind_name.text_color = wind_color
	wind_icon_style.color = wind_color
	local mutator_name = wind_settings.mutator
	local mutator_data = MutatorTemplates[mutator_name]
	local mutator_icon = weave_game_widgets_by_name.mutator_icon
	local mutator_title_text = weave_game_widgets_by_name.mutator_title_text
	local mutator_description_text = weave_game_widgets_by_name.mutator_description_text
	mutator_icon.content.texture_id = mutator_data.icon
	mutator_title_text.content.text = Localize(mutator_data.display_name)
	mutator_description_text.content.text = Localize(mutator_data.description)
	local objective_title = weave_game_widgets_by_name.objective_title
	local objective_1 = weave_game_widgets_by_name.objective_1
	local objective_2 = weave_game_widgets_by_name.objective_2
	objective_title.content.text = "weave_objective_title"
	local objectives = weave_template.objectives
	local objective_spacing = 10
	local largest_objective_width = 0

	for i = 1, #objectives, 1 do
		local objective = objectives[i]
		local objective_display_name = objective.display_name
		local objective_icon = objective.icon

		self:_assign_objective(i, objective_display_name, objective_icon, objective_spacing)
	end

	local private_game_widget = weave_game_widgets_by_name.private_checkbox
	private_game_widget.content.button_hotspot.is_selected = private_game
	self._presentation_type = "weave"
end

MissionVotingUI._set_weave_find_group_presentation = function (self)
	self._presentation_type = "weave_find_group"
end

MissionVotingUI._assign_objective = function (self, index, text, icon, spacing)
	local widgets_by_name = self._weave_game_widgets_by_name
	local widget_name = "objective_" .. index
	local widget = widgets_by_name[widget_name]
	local content = widget.content
	local style = widget.style
	content.icon = icon or "objective_icon_general"
	content.text = text or "-"
end

MissionVotingUI._update_vote_timer = function (self)
	local voting_manager = self.voting_manager
	local vote_template = voting_manager:active_vote_template()
	local duration = vote_template.duration
	local vote_time_left = voting_manager:vote_time_left()
	local time_progress = math.max(vote_time_left / duration, 0)

	self:_set_vote_time_progress(time_progress)
end

MissionVotingUI._set_vote_time_progress = function (self, progress)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.timer_fg
	local content = widget.content
	local uvs = content.texture_id.uvs
	local scenegraph_id = widget.scenegraph_id
	local default_size = self.scenegraph_definition[scenegraph_id].size
	local current_size = self.ui_scenegraph[scenegraph_id].size
	current_size[1] = default_size[1] * progress
	uvs[2][1] = progress
end

MissionVotingUI._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

MissionVotingUI._update_animations = function (self, dt, t)
	for animation_name, ui_animation in pairs(self._ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self._ui_animations[animation_name] = nil
		end
	end
end

MissionVotingUI.update = function (self, dt, t)
	local parent = self._parent
	local ingame_ui = parent:parent()
	local menu_active = ingame_ui.menu_active or ingame_ui.current_view or ingame_ui._transition_fade_data
	self.menu_active = menu_active

	self:_update_animations(dt, t)

	local voting_manager = self.voting_manager

	if voting_manager:vote_in_progress() and voting_manager:is_mission_vote() then
		if not menu_active then
			if not self.vote_started then
				self:start_vote(voting_manager.active_voting)
			end

			self:_update_vote_timer()

			local widgets_by_name = self._widgets_by_name

			UIWidgetUtils.animate_default_button(widgets_by_name.button_abort, dt)

			if not self.has_voted then
				local gamepad_active = Managers.input:is_device_active("gamepad")
				local active_voting = voting_manager.active_voting
				local vote_template = active_voting and active_voting.template

				if vote_template then
					if gamepad_active and vote_template.gamepad_support then
						local vote_options = vote_template.vote_options
						local input_service = self.input_manager:get_service("mission_voting")

						for i = 1, #vote_options, 1 do
							local vote_option = vote_options[i]

							if input_service:get(vote_option.gamepad_input) then
								voting_manager:vote(vote_option.vote)
								self:on_vote_casted()

								break
							end
						end
					elseif self:_is_button_pressed(widgets_by_name.button_confirm) then
						voting_manager:vote(1)
						self:on_vote_casted()
					elseif self:_is_button_pressed(widgets_by_name.button_abort) then
						voting_manager:vote(2)
						self:on_vote_casted()
					end
				end

				if self.gamepad_active ~= gamepad_active and vote_template then
					local vote_options = vote_template.vote_options

					self:setup_option_input(widgets_by_name.button_confirm, vote_options[1])
					self:setup_option_input(widgets_by_name.button_abort, vote_options[2])

					self.gamepad_active = gamepad_active
				end
			end
		end
	elseif self.vote_started then
		self:on_vote_ended()
	end

	if self.vote_started and not self.has_voted then
		self:draw(dt)
	end
end

MissionVotingUI.draw = function (self, dt)
	self:_update_pulse_animations(dt)

	local ui_top_renderer = self.ui_top_renderer
	local render_settings = self.render_settings
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("mission_voting")
	local alpha_multiplier = 1
	render_settings.alpha_multiplier = alpha_multiplier
	ui_scenegraph.window.local_position[2] = -50 + alpha_multiplier * 50

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_top_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	if not self._twitch_mode_enabled and (Managers.twitch:is_connecting() or Managers.twitch:is_connected()) and not Managers.twitch:game_mode_supported(self._game_mode) then
		local twitch_widgets_by_name = self._twitch_widgets_by_name
		local widget = twitch_widgets_by_name.twitch_disclaimer

		UIRenderer.draw_widget(ui_top_renderer, widget)
	elseif self._twitch_mode_enabled then
		local twitch_widgets_by_name = self._twitch_widgets_by_name
		local widget = twitch_widgets_by_name.twitch_mode

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local presentation_type = self._presentation_type

	if presentation_type then
		if presentation_type == "adventure" then
			local adventure_game_widgets = self._adventure_game_widgets

			for i = 1, #adventure_game_widgets, 1 do
				local widget = adventure_game_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "custom" then
			local custom_game_widgets = self._custom_game_widgets

			for i = 1, #custom_game_widgets, 1 do
				local widget = custom_game_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "deed" then
			local deed_widgets = self._deed_widgets

			for i = 1, #deed_widgets, 1 do
				local widget = deed_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "event" then
			local event_game_widgets = self._event_game_widgets

			for i = 1, #event_game_widgets, 1 do
				local widget = event_game_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "weave" then
			local weave_game_widgets = self._weave_game_widgets

			for i = 1, #weave_game_widgets, 1 do
				local widget = weave_game_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "weave_quickplay" then
			local weave_quickplay_widgets = self._weave_quickplay_widgets

			for i = 1, #weave_quickplay_widgets, 1 do
				local widget = weave_quickplay_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "weave_find_group" then
			local weave_find_group_widgets = self._weave_find_group_widgets

			for i = 1, #weave_find_group_widgets, 1 do
				local widget = weave_find_group_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "game_mode" then
			local game_mode_widgets = self._game_mode_widgets

			for i = 1, #game_mode_widgets, 1 do
				local widget = game_mode_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		elseif presentation_type == "switch_mechanism" then
			local switch_mechanism_widgets = self._switch_mechanism_widgets

			for i = 1, #switch_mechanism_widgets, 1 do
				local widget = switch_mechanism_widgets[i]

				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				UIRenderer.draw_widget(ui_top_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	local gamepad_active = self.input_manager:is_device_active("gamepad")

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

MissionVotingUI._update_pulse_animations = function (self, dt)
	if self.has_voted then
		return
	end

	local menu_active = self.menu_active

	if not menu_active then
		local speed_multiplier = (menu_active and 5) or 8
		local progress = (menu_active and 0) or 0.5 + math.sin(Managers.time:time("ui") * speed_multiplier) * 0.5
		local alpha = 100 + progress * 155
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.timer_fg.style.texture_id.color[1] = alpha
		widgets_by_name.timer_glow.style.texture_id.color[1] = alpha
	end
end

MissionVotingUI._acquire_input = function (self, ignore_cursor_stack)
	self:_release_input(true)

	local input_manager = self.input_manager

	input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "mission_voting", "MissionVotingUI")

	if not ignore_cursor_stack then
		ShowCursorStack.push()
	end
end

MissionVotingUI._release_input = function (self, ignore_cursor_stack)
	local input_manager = self.input_manager

	input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "mission_voting", "MissionVotingUI")

	if not ignore_cursor_stack then
		ShowCursorStack.pop()
	end
end

MissionVotingUI.active_input_service = function (self)
	local input_manager = self.input_manager
	local service_name = "mission_voting"
	local input_service = input_manager:get_service(service_name)

	return input_service
end

return
