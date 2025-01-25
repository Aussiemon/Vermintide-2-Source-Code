-- chunkname: @scripts/ui/views/matchmaking_ui.lua

require("scripts/settings/difficulty_settings")

local definitions = local_require("scripts/ui/views/matchmaking_ui_definitions")
local cancel_input_widget_definitions = definitions.cancel_input_widgets
local versus_input_widgets_definitions = definitions.versus_input_widgets
local scenegraph_definition = definitions.scenegraph_definition
local debug_widget_definitions = definitions.debug_widget_definitions

local function dprint(...)
	return
end

local function get_portrait_name_by_profile_index(profile_index, career_index)
	local profile_data = SPProfiles[profile_index]
	local careers = profile_data.careers
	local career_settings = careers[career_index]
	local portrait_image = career_settings.portrait_image

	return portrait_image and "small_" .. portrait_image or "icons_placeholder"
end

local WIND_COLORS = {
	default = Colors.get_table("default"),
	life = Colors.get_table("life"),
	metal = Colors.get_table("metal"),
	death = Colors.get_table("death"),
	heavens = Colors.get_table("heavens"),
	light = Colors.get_table("light"),
	beasts = Colors.get_table("beasts"),
	fire = Colors.get_table("fire"),
	shadow = Colors.get_table("shadow"),
}
local state_to_display_name_overrides = {}

MatchmakingUI = class(MatchmakingUI)

MatchmakingUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.network_event_delegate = ingame_ui_context.network_event_delegate
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.camera_manager = ingame_ui_context.camera_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.lobby = ingame_ui_context.network_lobby
	self.render_settings = {
		snap_pixel_positions = true,
	}
	self.voting_manager = ingame_ui_context.voting_manager
	self._cached_matchmaking_info = {}
	self._is_in_inn = ingame_ui_context.is_in_inn
	self.matchmaking_manager = Managers.matchmaking

	local input_manager = ingame_ui_context.input_manager

	self.input_manager = input_manager

	self:create_ui_elements()

	self.num_players_text = Localize("number_of_players")
	self._max_number_of_players = Managers.mechanism:max_instance_members()
	self.portrait_index_table = {}
	self._my_peer_id = Network.peer_id()

	if Managers.party:is_leader(self._my_peer_id) then
		self:_update_button_prompts()

		self._allow_cancel_matchmaking = true
	end
end

MatchmakingUI.create_ui_elements = function (self)
	table.clear(self._cached_matchmaking_info)

	self.ui_animations = {}
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)
	self._detail_widgets, self._detail_widgets_by_name = UIUtils.create_widgets(definitions.widget_detail_definitions)
	self._widgets_deus, self._widgets_deus_by_name = UIUtils.create_widgets(definitions.deus_widget_definitions)
	self._detail_widgets_deus, self._detail_widgets_deus_by_name = UIUtils.create_widgets(definitions.deus_widget_detail_definitions)
	self._widgets_versus, self._widgets_versus_by_name = UIUtils.create_widgets(definitions.versus_widget_definitions)
	self._detail_widgets_versus, self._detail_widgets_versus_by_name = UIUtils.create_widgets(definitions.versus_widget_detail_definitions)
	self._versus_input_widgets, self._versus_input_widgets_by_name = UIUtils.create_widgets(versus_input_widgets_definitions)
	self._cancel_input_widgets, self._cancel_input_widgets_by_name = UIUtils.create_widgets(cancel_input_widget_definitions)
	self.debug_box_widget = UIWidget.init(debug_widget_definitions.debug_box)
	self.debug_lobbies_widget = UIWidget.init(debug_widget_definitions.debug_lobbies)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.scenegraph_definition = scenegraph_definition
	self._input_to_widget_mapping = {}

	local cancel_input_widgets_by_name = self._cancel_input_widgets_by_name

	self._input_to_widget_mapping[#self._input_to_widget_mapping + 1] = {
		input_action = "cancel_matchmaking",
		widgets = {
			text_widget = cancel_input_widgets_by_name.cancel_text_input,
			text_widget_prefix = cancel_input_widgets_by_name.cancel_text_prefix,
			text_widget_suffix = cancel_input_widgets_by_name.cancel_text_suffix,
			input_icon_widget = cancel_input_widgets_by_name.cancel_icon,
		},
	}

	local versus_input_widgets_by_name = self._versus_input_widgets_by_name

	self._input_to_widget_mapping[#self._input_to_widget_mapping + 1] = {
		input_action = "cancel_matchmaking",
		widgets = {
			text_widget = versus_input_widgets_by_name.versus_cancel_text_input,
			text_widget_prefix = versus_input_widgets_by_name.versus_cancel_text_prefix,
			text_widget_suffix = versus_input_widgets_by_name.versus_cancel_text_suffix,
			input_icon_widget = versus_input_widgets_by_name.versus_cancel_icon,
		},
	}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

MatchmakingUI._get_widget = function (self, name)
	if self._active_mechanism == "deus" then
		return self._widgets_deus_by_name[name]
	elseif self._active_mechanism == "versus" then
		return self._widgets_versus_by_name[name]
	else
		return self._widgets_by_name[name]
	end
end

MatchmakingUI._get_detail_widget = function (self, name)
	if self._active_mechanism == "deus" then
		return self._detail_widgets_deus_by_name[name]
	elseif self._active_mechanism == "versus" then
		return self._detail_widgets_versus_by_name[name]
	else
		return self._detail_widgets_by_name[name]
	end
end

MatchmakingUI._get_widgets = function (self)
	if self._active_mechanism == "deus" then
		return self._widgets_deus, self._detail_widgets_deus
	elseif self._active_mechanism == "versus" then
		return self._widgets_versus, self._detail_widgets_versus
	else
		return self._widgets, self._detail_widgets
	end
end

MatchmakingUI.is_in_inn = function (self)
	return self._is_in_inn
end

MatchmakingUI.update = function (self, dt, t)
	if RESOLUTION_LOOKUP.modified then
		self:_update_button_prompts()
	end

	local parent = self._parent
	local ingame_ui = parent:parent()
	local menu_active = ingame_ui.menu_active
	local in_menu_current_view = ingame_ui.current_view ~= nil
	local ingame_player_list_ui = parent:component("IngamePlayerListUI")
	local player_list_active = ingame_player_list_ui and ingame_player_list_ui:is_active()
	local show_detailed_matchmaking_info = not menu_active and not player_list_active and not in_menu_current_view
	local is_in_store_view = false

	if in_menu_current_view then
		local current_view = ingame_ui.views[ingame_ui.current_view]
		local state = current_view and current_view.current_state and current_view:current_state()

		is_in_store_view = state and state.NAME == "HeroViewStateStore"
	end

	local versus_slot_status_ui = parent:component("VersusSlotStatusUI")
	local versus_slot_status_ui_active = versus_slot_status_ui and versus_slot_status_ui:is_active()

	show_detailed_matchmaking_info = show_detailed_matchmaking_info and not versus_slot_status_ui_active

	local ui_top_renderer = self.ui_top_renderer
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local is_matchmaking = self.matchmaking_manager:is_game_matchmaking() and self._is_in_inn
	local ingame_ui = self.ingame_ui
	local ingame_hud = ingame_ui.ingame_hud
	local countdown_ui = ingame_hud:component("LevelCountdownUI")
	local is_enter_game = countdown_ui and countdown_ui:is_enter_game()
	local ui_suspended = ingame_ui.menu_suspended
	local voting_manager = self.voting_manager
	local has_mission_vote = voting_manager:vote_in_progress() and voting_manager:is_mission_vote()

	if ui_suspended and not is_enter_game then
		return
	end

	if show_detailed_matchmaking_info ~= self._show_detailed_matchmaking_info then
		self._show_detailed_matchmaking_info = show_detailed_matchmaking_info
		self._detailed_info_visibility_progress = 0
	end

	if is_in_store_view ~= self._is_in_store_view then
		self._is_in_store_view = is_in_store_view

		self:_set_in_view_ui_visibility(not is_in_store_view)
	end

	for _, animation in pairs(self.ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self.ui_animations = nil
		end
	end

	if not is_enter_game and (is_matchmaking or has_mission_vote) then
		self:_update_background(is_matchmaking, has_mission_vote)
		self:_update_portraits(has_mission_vote)
		self:_update_status(dt)
		self:_update_show_timer(has_mission_vote)

		if is_matchmaking then
			self:_update_matchmaking_info(t)
			self:_sync_players_ready_state(dt)

			if self._allow_cancel_matchmaking and not has_mission_vote then
				local cancel_matchmaking = input_service:get("cancel_matchmaking")

				if cancel_matchmaking then
					local matchmaking_manager = self.matchmaking_manager

					matchmaking_manager:cancel_matchmaking()

					if matchmaking_manager:have_game_mode_event_data() then
						matchmaking_manager:clear_game_mode_event_data()
					end

					if Managers.deed:has_deed() then
						Managers.deed:reset()
					end

					if Managers.weave:get_next_weave() then
						Managers.weave:set_next_weave(nil)
					end
				end
			end
		elseif has_mission_vote then
			self:_update_mission_vote_status()
			self:_update_mission_vote_player_status()
			self:_update_mission_timer()
		end

		self:_handle_gamepad_activity()

		local network_handler = Managers.mechanism:network_handler()
		local match_handler = network_handler:get_match_handler()

		if match_handler:is_leader(self._my_peer_id) then
			local allow_cancel_matchmaking = self.matchmaking_manager:allow_cancel_matchmaking()

			self._allow_cancel_matchmaking = allow_cancel_matchmaking and not has_mission_vote
		end

		self:_draw(ui_top_renderer, input_service, is_matchmaking, dt)
	end
end

MatchmakingUI._handle_gamepad_activity = function (self)
	local gamepad_active = self.input_manager:is_device_active("gamepad")
	local most_recent_device = Managers.input:get_most_recent_device()
	local force_update = self.gamepad_active_last_frame == nil or gamepad_active and most_recent_device ~= self._most_recent_device

	if gamepad_active then
		if not self.gamepad_active_last_frame or force_update then
			self.gamepad_active_last_frame = true

			self:_update_button_prompts()
		end
	elseif self.gamepad_active_last_frame or force_update then
		self.gamepad_active_last_frame = false

		self:_update_button_prompts()
	end

	self._most_recent_device = most_recent_device
end

MatchmakingUI._draw = function (self, ui_renderer, input_service, is_matchmaking, dt)
	local detailed_info_visibility_progress = self._detailed_info_visibility_progress

	if detailed_info_visibility_progress then
		detailed_info_visibility_progress = math.min(detailed_info_visibility_progress + dt * 1.2, 1)

		local anim_progress = math.easeOutCubic(detailed_info_visibility_progress)
		local definition = scenegraph_definition.detailed_info_box
		local default_size = definition.size
		local default_position = definition.position

		self.ui_scenegraph.detailed_info_box.local_position[2] = default_size[2] * (1 - anim_progress) + default_position[2]

		if detailed_info_visibility_progress == 1 then
			self._detailed_info_visibility_progress = nil
		else
			self._detailed_info_visibility_progress = detailed_info_visibility_progress
		end
	end

	local widgets, detal_widgets = self:_get_widgets()

	UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt, nil, self.render_settings)
	UIRenderer.draw_all_widgets(ui_renderer, widgets)

	if self._show_detailed_matchmaking_info then
		if self._active_mechanism == "versus" then
			if not Managers.state.voting:cancel_disabled() then
				UIRenderer.draw_all_widgets(ui_renderer, self._versus_input_widgets)
			end
		elseif self._allow_cancel_matchmaking then
			UIRenderer.draw_all_widgets(ui_renderer, self._cancel_input_widgets)
		end

		UIRenderer.draw_all_widgets(ui_renderer, detal_widgets)
	end

	UIRenderer.end_pass(ui_renderer)
end

MatchmakingUI._update_background = function (self, is_matchmaking, has_mission_vote)
	local background_texture

	if is_matchmaking then
		background_texture = "matchmaking_window_01"
	elseif has_mission_vote then
		background_texture = "matchmaking_window_02"
	end

	if background_texture then
		local background_widget = self:_get_detail_widget("detailed_info_box")
		local content = background_widget.content
		local background = content.background

		if not content.no_background_changes and background.texture_id ~= background_texture then
			background.texture_id = background_texture
		end
	end
end

MatchmakingUI._update_matchmaking_info = function (self, t)
	local matchmaking_manager = self.matchmaking_manager
	local matchmaking_info = matchmaking_manager:search_info()
	local cached_matchmaking_info = self._cached_matchmaking_info

	if IS_XB1 and matchmaking_info.no_lobby_data then
		local widget = self:_get_widget("status_text")

		widget.content.text = Localize("loading_fetching_matchmaking_data")
		widget = self:_get_detail_widget("title_text")
		widget.content.text = string.rep(".", 1 + math.floor((t * 5 + 0.5) % 4))
		widget = self:_get_detail_widget("difficulty_text")
		widget.content.text = ""

		return
	end

	local mechanism = matchmaking_info.mechanism

	self._active_mechanism = mechanism

	if mechanism == "weave" then
		local quick_game = matchmaking_info.quick_game

		if quick_game then
			local text = "start_game_window_weave_quickplay_title"

			self:_set_detail_level_text(text, true)

			local difficulty = matchmaking_info.difficulty
			local difficulty_setting = difficulty and DifficultySettings[difficulty]
			local difficulty_display_name = difficulty_setting and difficulty_setting.display_name or "dlc1_2_difficulty_unavailable"

			self:_set_detail_difficulty_text(difficulty_display_name, nil, false)
		else
			local weave_name = matchmaking_info.mission_id
			local weave_templates = WeaveSettings.templates
			local weave_template = weave_name and weave_templates[weave_name]
			local weave_index = weave_template and table.find(WeaveSettings.templates_ordered, weave_template) or nil
			local weave_display_name = weave_template and weave_index .. ". " .. Localize(weave_template.display_name) or Localize("level_display_name_unavailable")

			self:_set_detail_level_text(weave_display_name, false)

			local wind = weave_template and weave_template.wind
			local wind_settings = wind and WindSettings[wind]
			local wind_display_name = wind_settings and wind_settings.display_name or ""

			self:_set_detail_difficulty_text(wind_display_name, WIND_COLORS[wind])
		end
	elseif mechanism == "deus" then
		local detail_text = "mission_vote_quick_play"

		if not matchmaking_info.quick_game then
			local journey_name = matchmaking_info.mission_id
			local journey_settings = journey_name and DeusJourneySettings[journey_name]

			detail_text = journey_settings and journey_settings.display_name or "deus_matching"
		end

		self:_set_detail_level_text(detail_text, true)

		local difficulty = matchmaking_info.difficulty

		if difficulty ~= cached_matchmaking_info.difficulty then
			cached_matchmaking_info.difficulty = difficulty

			local difficulty_setting = difficulty and DifficultySettings[difficulty]
			local difficulty_display_name = difficulty_setting and difficulty_setting.display_name or "dlc1_2_difficulty_unavailable"

			self:_set_detail_difficulty_text(difficulty_display_name)
		end
	elseif mechanism == "versus" then
		local detail_text = "mission_vote_quick_play"
		local difficulty_text = "vs_ui_versus_tag"

		if not matchmaking_info.quick_game then
			local mission_id = matchmaking_info.mission_id

			if mission_id == "any" then
				detail_text = "map_screen_quickplay_button"
			else
				local level_settings = mission_id and LevelSettings[mission_id]
				local display_name = level_settings and level_settings.display_name

				detail_text = display_name or detail_text
			end

			difficulty_text = "player_hosted_title"
		end

		self:_set_detail_level_text(detail_text, true)
		self:_set_detail_difficulty_text(difficulty_text)
	else
		local difficulty = matchmaking_info.difficulty

		if difficulty ~= cached_matchmaking_info.difficulty then
			cached_matchmaking_info.difficulty = difficulty

			local difficulty_setting = difficulty and DifficultySettings[difficulty]
			local difficulty_display_name = difficulty_setting and difficulty_setting.display_name or "dlc1_2_difficulty_unavailable"

			self:_set_detail_difficulty_text(difficulty_display_name)
		end

		local quick_game = matchmaking_info.quick_game
		local quick_game_changed = quick_game ~= cached_matchmaking_info.quick_game
		local mission_id = matchmaking_info.mission_id
		local mission_id_changed = mission_id ~= cached_matchmaking_info.mission_id

		if quick_game_changed or mission_id_changed then
			cached_matchmaking_info.quick_game = quick_game
			cached_matchmaking_info.mission_id = mission_id

			local is_event_game = matchmaking_manager:have_game_mode_event_data()
			local text

			if quick_game then
				text = "mission_vote_quick_play"
			elseif is_event_game then
				local level_settings = mission_id and mission_id ~= "n/a" and LevelSettings[mission_id]
				local level_display_name = level_settings and level_settings.display_name or "random_level"

				text = level_display_name
			else
				local level_settings = mission_id and mission_id ~= "n/a" and LevelSettings[mission_id]
				local level_display_name = level_settings and level_settings.display_name or "level_display_name_unavailable"

				text = level_display_name
			end

			self:_set_detail_level_text(text, true)
		end
	end

	local status = matchmaking_info.status

	if status ~= cached_matchmaking_info[status] then
		cached_matchmaking_info.status = status

		self:_set_status_text(status)
	end
end

MatchmakingUI._update_status = function (self, dt)
	local rotation_progresss = ((self._rotation_progresss or 0) + dt * 0.2) % 1

	self._rotation_progresss = rotation_progresss

	local anim_progress = math.easeCubic(rotation_progresss)
	local rotation_angle = anim_progress * 360
	local radians = math.degrees_to_radians(rotation_angle)
	local loading_icon = self:_get_widget("loading_status_frame")

	loading_icon.style.texture_id.angle = radians

	local connecting_rotation_speed = 200
	local connecting_rotation_angle = dt * connecting_rotation_speed % 360
	local connecting_radians = math.degrees_to_radians(connecting_rotation_angle)

	if self._active_mechanism ~= "versus" then
		for i = 1, 4 do
			local widget_name = "party_slot_" .. i
			local widget = self:_get_detail_widget(widget_name)
			local content = widget.content
			local style = widget.style
			local is_connecting = content.is_connecting
			local connecting_icon_style = style.connecting_icon

			connecting_icon_style.angle = is_connecting and connecting_icon_style.angle + connecting_radians or 0
		end
	end
end

MatchmakingUI._update_mission_vote_status = function (self)
	local voting_manager = self.voting_manager
	local active_vote_name = voting_manager:vote_in_progress()
	local active_vote_data = voting_manager:active_vote_data()
	local difficulty = active_vote_data.difficulty
	local mission_id = active_vote_data.mission_id
	local quick_game = active_vote_data.quick_game
	local event_data = active_vote_data.event_data
	local mechanism = active_vote_data.mechanism
	local switch_mechanism = active_vote_data.switch_mechanism

	self._active_mechanism = mechanism

	if switch_mechanism then
		local mechanism_settings = MechanismSettings[mechanism]
		local level_key = active_vote_data.level_key or "inn_level"
		local level_settings = LevelSettings[level_key]

		self:_set_detail_level_text(mechanism_settings.display_name, true)
		self:_set_detail_difficulty_text(level_settings.display_name, nil, false)
	elseif mechanism == "weave" then
		if quick_game then
			local text = "start_game_window_weave_quickplay_title"

			self:_set_detail_level_text(text, true)

			local difficulty_setting = difficulty and DifficultySettings[difficulty]
			local difficulty_display_name = difficulty_setting and difficulty_setting.display_name or "dlc1_2_difficulty_unavailable"

			self:_set_detail_difficulty_text(difficulty_display_name, nil, false)
		else
			local weave_name = mission_id
			local weave_templates = WeaveSettings.templates
			local weave_template = weave_name and weave_templates[weave_name]
			local weave_index = weave_template and table.find(WeaveSettings.templates_ordered, weave_template) or nil
			local weave_display_name = weave_template and weave_index .. ". " .. Localize(weave_template.display_name) or Localize("level_display_name_unavailable")

			self:_set_detail_level_text(weave_display_name, false)

			local wind = weave_template and weave_template.wind
			local wind_settings = wind and WindSettings[wind]
			local wind_display_name = wind_settings and wind_settings.display_name or ""

			self:_set_detail_difficulty_text(wind_display_name, WIND_COLORS[wind])
		end
	elseif mechanism == "deus" then
		self:_set_detail_level_text("deus_matching", true)

		local difficulty_settings = DifficultySettings[difficulty]
		local difficulty_display_name = difficulty_settings and difficulty_settings.display_name

		self:_set_detail_difficulty_text(difficulty_display_name or "")
	elseif mechanism == "versus" then
		local detail_text = "mission_vote_quick_play"
		local difficulty_text = "vs_ui_versus_tag"

		if not quick_game then
			if mission_id == "any" then
				detail_text = "map_screen_quickplay_button"
			else
				local level_settings = mission_id and LevelSettings[mission_id]
				local display_name = level_settings and level_settings.display_name

				detail_text = display_name or detail_text
			end

			difficulty_text = "player_hosted_title"
		end

		self:_set_detail_level_text(detail_text, true)
		self:_set_detail_difficulty_text(difficulty_text)
	else
		local difficulty_settings = DifficultySettings[difficulty]
		local difficulty_display_name = difficulty_settings and difficulty_settings.display_name
		local level_display_name

		if quick_game then
			level_display_name = "mission_vote_quick_play"
		elseif mission_id == nil then
			level_display_name = "random_level"
		else
			local level_settings = LevelSettings[mission_id]

			level_display_name = level_settings.display_name
		end

		self:_set_detail_difficulty_text(difficulty_display_name or "")
		self:_set_detail_level_text(level_display_name, true)
	end

	local status = active_vote_name

	self:_set_status_text(status)
end

MatchmakingUI._update_mission_vote_player_status = function (self)
	local voting_manager = self.voting_manager
	local voters = voting_manager:get_current_voters()

	for peer_id, vote in pairs(voters) do
		local portrait_index = self:_get_portrait_index(peer_id)

		if portrait_index ~= nil then
			if vote == 1 then
				self:_set_player_voted_yes(portrait_index, true)
			elseif vote == "undecided" then
				self:_set_player_voted_yes(portrait_index, false)
			end
		end
	end
end

MatchmakingUI._update_mission_timer = function (self)
	local voting_manager = self.voting_manager
	local vote_template = voting_manager:active_vote_template()
	local duration = vote_template.duration
	local vote_time_left = voting_manager:vote_time_left()
	local time_progress = math.max(vote_time_left / duration, 0)

	self:_set_vote_time_progress(time_progress)
end

MatchmakingUI._update_show_timer = function (self, has_mission_vote)
	local alpha

	alpha = has_mission_vote and 255 or 0

	local bg = self:_get_detail_widget("timer_bg")
	local fg = self:_get_detail_widget("timer_fg")
	local glow = self:_get_detail_widget("timer_glow")

	bg.style.texture_id.color[1] = alpha
	fg.style.texture_id.color[1] = alpha
	glow.style.texture_id.color[1] = alpha
end

MatchmakingUI.update_debug = function (self)
	local lobby = Managers.matchmaking:active_lobby()

	if not lobby then
		return
	end

	local debug_text = ""

	debug_text = debug_text .. "\nStatename: " .. (Managers.matchmaking.debug.statename or "-")
	debug_text = debug_text .. "\nState: " .. Managers.matchmaking.debug.state
	debug_text = debug_text .. "\nInfo: " .. Managers.matchmaking.debug.text or "matchmaking debug"
	debug_text = debug_text .. "\n"
	debug_text = debug_text .. "\nDistance: " .. (Managers.matchmaking.debug.distance or "?/" .. MatchmakingSettings.max_distance_filter)
	debug_text = debug_text .. "\nLevel: " .. Managers.matchmaking.debug.level
	debug_text = debug_text .. "\nDifficulty: " .. Managers.matchmaking.debug.difficulty
	debug_text = debug_text .. "\nHero: " .. Managers.matchmaking.debug.hero
	debug_text = debug_text .. "\nProgression: " .. Managers.matchmaking.debug.progression
	debug_text = debug_text .. "\n"
	self.debug_box_widget.content.debug_text = debug_text
end

MatchmakingUI.destroy = function (self)
	return
end

MatchmakingUI.get_input_texture_data = function (self, input_action)
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local most_recent_device = input_manager:get_most_recent_device()
	local platform = PLATFORM

	if IS_XB1 and GameSettingsDevelopment.allow_keyboard_mouse and not gamepad_active then
		platform = "win32"
	elseif IS_WINDOWS and gamepad_active then
		platform = "xb1"
		platform = most_recent_device.type() == "sce_pad" and "ps_pad" or platform
	end

	local keymap_binding = input_service:get_keymapping(input_action, platform)
	local device_type = keymap_binding[1]
	local key_index = keymap_binding[2]
	local key_action_type = keymap_binding[3]
	local prefix_text

	if key_action_type == "held" then
		prefix_text = "matchmaking_prefix_hold"
	end

	if device_type == "keyboard" then
		return nil, Keyboard.button_locale_name(key_index) or Keyboard.button_name(key_index), prefix_text
	elseif device_type == "mouse" then
		return nil, Mouse.button_name(key_index), prefix_text
	elseif device_type == "gamepad" or device_type == "ps_pad" then
		local button_name = most_recent_device.button_name(key_index)
		local button_texture_data = ButtonTextureByName(button_name, platform)

		return button_texture_data, button_name, prefix_text
	end

	return nil, ""
end

MatchmakingUI._update_button_prompts = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local ui_scenegraph = self.ui_scenegraph

	for _, mapping in ipairs(self._input_to_widget_mapping) do
		local widgets = mapping.widgets
		local text_widget = widgets.text_widget
		local text_widget_prefix = widgets.text_widget_prefix
		local text_widget_suffix = widgets.text_widget_suffix
		local input_icon_widget = widgets.input_icon_widget
		local input_action = mapping.input_action
		local texture_data, input_text, prefix_text = self:get_input_texture_data(input_action)

		text_widget_prefix.content.text = prefix_text and Localize(prefix_text) or ""

		if not texture_data then
			text_widget.content.text = "[" .. input_text .. "] "
			input_icon_widget.content.texture_id = nil
			input_icon_widget.content.visible = false
		elseif texture_data.texture then
			text_widget.content.text = ""
			input_icon_widget.content.texture_id = texture_data.texture
			input_icon_widget.content.visible = true
		end

		local text_input = text_widget.content.text
		local text_prefix = text_widget_prefix.content.text
		local text_suffix = text_widget_suffix.content.text
		local font_input, scaled_font_input_size = UIFontByResolution(text_widget.style.text)
		local font_prefix, scaled_font_size_prefix = UIFontByResolution(text_widget_prefix.style.text)
		local font_suffix, scaled_font_size_suffix = UIFontByResolution(text_widget_suffix.style.text)
		local text_width_input = UIRenderer.text_size(self.ui_renderer, text_input, font_input[1], scaled_font_input_size)
		local text_width_prefix = UIRenderer.text_size(self.ui_renderer, text_prefix, font_prefix[1], scaled_font_size_prefix)
		local text_width_suffix = UIRenderer.text_size(self.ui_renderer, text_suffix, font_suffix[1], scaled_font_size_suffix)

		if texture_data then
			local icon_size = texture_data.size
			local input_icon_scenegraph_id = input_icon_widget.scenegraph_id
			local input_icon_scenegraph = ui_scenegraph[input_icon_scenegraph_id]

			text_width_input = icon_size[1]
			input_icon_scenegraph.size[1] = text_width_input
			input_icon_scenegraph.size[2] = icon_size[2]
		end

		local total_length = text_width_input + text_width_prefix + text_width_suffix
		local offset = -(total_length * 0.5)

		if not texture_data then
			text_widget_prefix.style.text.offset[1] = offset
			text_widget_prefix.style.text_shadow.offset[1] = offset + 2
			text_widget.style.text.offset[1] = offset + text_width_prefix
			text_widget.style.text_shadow.offset[1] = offset + text_width_prefix + 2
			text_widget_suffix.style.text.offset[1] = offset + (text_width_prefix + text_width_input)
			text_widget_suffix.style.text_shadow.offset[1] = offset + (text_width_prefix + text_width_input) + 2
		else
			input_icon_widget.style.texture_id.offset[1] = offset
			text_widget_prefix.style.text.offset[1] = offset
			text_widget_prefix.style.text_shadow.offset[1] = offset + 2
			text_widget_suffix.style.text.offset[1] = offset + (text_width_prefix + text_width_input)
			text_widget_suffix.style.text_shadow.offset[1] = offset + (text_width_prefix + text_width_input) + 2
		end
	end
end

MatchmakingUI._update_portraits = function (self, has_mission_vote)
	if self._active_mechanism == "versus" then
		return
	end

	local profile_synchronizer = self.profile_synchronizer
	local player_manager = Managers.player
	local lobby = self.lobby
	local lobby_members = lobby:members()
	local members = lobby_members and lobby_members:members_map()

	if members then
		local portrait_index_table = self.portrait_index_table

		for i = 1, self._max_number_of_players do
			local peer_id = portrait_index_table[i]

			if peer_id and not members[peer_id] then
				portrait_index_table[i] = nil

				self:large_window_set_player_portrait(i, nil)
				self:large_window_set_player_connecting(i, false)
				self:_set_player_is_voting(i, false)
				self:_set_player_voted_yes(i, false)
			end
		end

		for peer_id, _ in pairs(members) do
			do
				local portrait_index = self:_get_portrait_index(peer_id)

				if not portrait_index then
					portrait_index = self:_get_first_free_portrait_index()

					if not portrait_index then
						goto label_1_0
					end

					portrait_index_table[portrait_index] = peer_id
				end

				if has_mission_vote then
					self:_set_player_is_voting(portrait_index, true)
				else
					self:_set_player_is_voting(portrait_index, false)
				end

				local profile = profile_synchronizer:profile_by_peer(peer_id, 1)

				if profile then
					self:large_window_set_player_portrait(portrait_index, peer_id)

					if player_manager:player_from_peer_id(peer_id) then
						self:large_window_set_player_connecting(portrait_index, false)
					end
				else
					self:large_window_set_player_connecting(portrait_index, true)
				end
			end

			::label_1_0::
		end
	end
end

MatchmakingUI._get_portrait_index = function (self, peer_id)
	local portrait_index_table = self.portrait_index_table

	for i = 1, self._max_number_of_players do
		local player_peer_id = portrait_index_table[i]

		if player_peer_id == peer_id then
			return i
		end
	end
end

MatchmakingUI._get_first_free_portrait_index = function (self)
	local portrait_index_table = self.portrait_index_table

	for i = 1, self._max_number_of_players do
		local player_peer_id = portrait_index_table[i]

		if player_peer_id == nil then
			return i
		end
	end
end

MatchmakingUI.large_window_set_title = function (self, title)
	local widget = self:_get_detail_widget("title_text")

	widget.content.text = Localize(title)
end

MatchmakingUI.large_window_set_status_message = function (self, message)
	fassert(message ~= " ", "tried to pass empty status message to matchmaking ui")

	local widget = self:_get_widget("status_text")

	widget.content.text = Localize(message)
end

MatchmakingUI.large_window_set_difficulty = function (self, difficulty)
	local difficulty_setting = difficulty and DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_setting and difficulty_setting.display_name or "dlc1_2_difficulty_unavailable"
	local widget = self:_get_detail_widget("difficulty_text")

	widget.content.text = Localize(difficulty_display_name)
end

MatchmakingUI.large_window_set_player_portrait = function (self, index, peer_id)
	local widget = self:_get_detail_widget("party_slot_" .. index)
	local status_widget = self:_get_widget("player_status_" .. index)
	local content = widget.content
	local portrait_texture

	if peer_id then
		local player_manager = Managers.player
		local player = player_manager:player(peer_id, 1)
		local player_unit = player and player.player_unit

		if Unit.alive(player_unit) then
			local career_index = player:career_index()
			local profile_index = player:profile_index()

			if career_index and profile_index then
				portrait_texture = get_portrait_name_by_profile_index(profile_index, career_index)
			end
		end
	end

	content.is_connected = portrait_texture ~= nil
	content.peer_id = peer_id
	status_widget.content.is_connected = portrait_texture ~= nil
	portrait_texture = portrait_texture or "small_unit_frame_portrait_default"
	content.portrait = portrait_texture
end

MatchmakingUI._get_party_slot_index_by_peer_id = function (self, peer_id)
	for i = 1, self._max_number_of_players do
		local widget_name = "party_slot_" .. i
		local widget = self:_get_detail_widget(widget_name)
		local content = widget.content

		if content.peer_id == peer_id then
			return i
		end
	end
end

MatchmakingUI._sync_players_ready_state = function (self, dt)
	if self._active_mechanism == "versus" then
		return
	end

	local player_manager = Managers.player
	local human_players = player_manager:human_players()

	for _, player in pairs(human_players) do
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local is_in_end_zone = status_extension:is_in_end_zone()
			local peer_id = player.peer_id
			local widget_index = self:_get_party_slot_index_by_peer_id(peer_id)

			if widget_index then
				self:_set_player_ready_state(widget_index, is_in_end_zone)
			end
		end
	end
end

MatchmakingUI._set_player_ready_state = function (self, index, is_ready)
	local widget = self:_get_detail_widget("party_slot_" .. index)
	local status_widget = self:_get_widget("player_status_" .. index)

	widget.content.is_ready = is_ready
	status_widget.content.is_ready = is_ready
	status_widget.content.texture_id = is_ready and "matchmaking_light_01" or "matchmaking_light_02"
end

MatchmakingUI.large_window_set_player_connecting = function (self, index, is_connecting)
	local widget = self:_get_detail_widget("party_slot_" .. index)
	local status_widget = self:_get_widget("player_status_" .. index)

	widget.content.is_connecting = is_connecting
	status_widget.content.is_connecting = is_connecting
end

MatchmakingUI._set_player_is_voting = function (self, index, is_voting)
	local widget = self:_get_detail_widget("party_slot_" .. index)

	widget.content.is_voting = is_voting
end

MatchmakingUI._set_player_voted_yes = function (self, index, voted_yes)
	local widget = self:_get_detail_widget("party_slot_" .. index)

	if not widget then
		return
	end

	widget.content.voted_yes = voted_yes
end

MatchmakingUI._set_detail_difficulty_text = function (self, text, optional_color, disable_localization)
	local widget = self:_get_detail_widget("difficulty_text")

	widget.content.text = disable_localization and text or Localize(text)
	widget.style.text.text_color = optional_color or widget.style.text.default_color or WIND_COLORS.default
end

MatchmakingUI._set_detail_level_text = function (self, text, localize)
	local widget = self:_get_detail_widget("title_text")

	widget.content.text = localize and Localize(text) or text
end

MatchmakingUI._set_status_text = function (self, text)
	local widget = self:_get_widget("status_text")

	text = state_to_display_name_overrides[text] or text
	widget.content.text = Localize(text)
end

MatchmakingUI._set_vote_time_progress = function (self, progress)
	local widget = self:_get_detail_widget("timer_fg")
	local content = widget.content
	local uvs = content.texture_id.uvs
	local scenegraph_id = widget.scenegraph_id
	local default_size = self.scenegraph_definition[scenegraph_id].size
	local current_size = self.ui_scenegraph[scenegraph_id].size

	current_size[1] = default_size[1] * progress
	uvs[2][1] = progress
end

MatchmakingUI._set_in_view_ui_visibility = function (self, show_detailed_ui)
	local adventure_window_widget = self._widgets_by_name.window
	local adventure_window_status_text = self._widgets_by_name.status_text
	local deus_window_widget = self._widgets_deus_by_name.window
	local deus_window_status_text = self._widgets_deus_by_name.status_text
	local versus_window_widget = self._widgets_versus_by_name.window
	local versus_window_status_text = self._widgets_versus_by_name.status_text
	local uv1_1 = show_detailed_ui and 0 or 0.765
	local size_x = show_detailed_ui and 506 or 118.91
	local horz_alignment = show_detailed_ui and "left" or "right"

	adventure_window_widget.content.texture_id.uvs[1][1] = uv1_1
	adventure_window_widget.style.texture_id.texture_size[1] = size_x
	adventure_window_widget.style.texture_id.horizontal_alignment = horz_alignment
	adventure_window_status_text.content.visible = show_detailed_ui
	deus_window_widget.content.texture_id.uvs[1][1] = uv1_1
	deus_window_widget.style.texture_id.texture_size[1] = size_x
	deus_window_widget.style.texture_id.horizontal_alignment = horz_alignment
	deus_window_status_text.content.visible = show_detailed_ui
	versus_window_widget.content.texture_id.uvs[1][1] = uv1_1
	versus_window_widget.style.texture_id.texture_size[1] = size_x
	versus_window_widget.style.texture_id.horizontal_alignment = horz_alignment
	versus_window_status_text.content.visible = show_detailed_ui
end

MatchmakingUI.on_matchmaking_num_players_in_matchmaking = function (self, mechanism, num_players)
	local is_matchmaking = self.matchmaking_manager:is_game_matchmaking() and self._is_in_inn

	if not is_matchmaking then
		return
	end

	local num_players_matchmaking_widget = self:_get_detail_widget("num_players_matchmaking")

	if not num_players_matchmaking_widget then
		return
	end

	num_players_matchmaking_widget.content.text = string.format("%d Players in Queue", num_players)
end
