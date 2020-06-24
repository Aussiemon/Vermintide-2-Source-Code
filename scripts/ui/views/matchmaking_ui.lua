require("scripts/settings/difficulty_settings")

local definitions = local_require("scripts/ui/views/matchmaking_ui_definitions")
local widget_definitions = definitions.widget_definitions
local widget_detail_definitions = definitions.widget_detail_definitions
local cancel_input_widget_definitions = definitions.cancel_input_widgets
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

	return (portrait_image and "small_" .. portrait_image) or "icons_placeholder"
end

local WIND_COLORS = {
	default = Colors.get_color_table_with_alpha("font_default", 255),
	life = Colors.get_color_table_with_alpha("lime_green", 255),
	metal = Colors.get_color_table_with_alpha("yellow", 255),
	death = Colors.get_color_table_with_alpha("dark_magenta", 255),
	heavens = Colors.get_color_table_with_alpha("deep_sky_blue", 255),
	light = Colors.get_color_table_with_alpha("white", 255),
	beasts = Colors.get_color_table_with_alpha("saddle_brown", 255),
	fire = Colors.get_color_table_with_alpha("crimson", 255),
	shadow = Colors.get_color_table_with_alpha("gray", 255)
}
MatchmakingUI = class(MatchmakingUI)

MatchmakingUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.level_transition_handler = ingame_ui_context.level_transition_handler
	self.network_event_delegate = ingame_ui_context.network_event_delegate
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.camera_manager = ingame_ui_context.camera_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.lobby = ingame_ui_context.network_lobby
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.voting_manager = ingame_ui_context.voting_manager
	self._cached_matchmaking_info = {}
	self._is_in_inn = ingame_ui_context.is_in_inn
	self.matchmaking_manager = Managers.matchmaking
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	self:create_ui_elements()

	self.num_players_text = Localize("number_of_players")
	self._max_number_of_players = Managers.mechanism:max_members()
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
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local detail_widgets = {}
	local detail_widgets_by_name = {}

	for name, widget_definition in pairs(widget_detail_definitions) do
		local widget = UIWidget.init(widget_definition)
		detail_widgets[#detail_widgets + 1] = widget
		detail_widgets_by_name[name] = widget
	end

	self._detail_widgets = detail_widgets
	self._detail_widgets_by_name = detail_widgets_by_name
	local cancel_input_widgets = {}
	local cancel_input_widgets_by_name = {}

	for name, widget_definition in pairs(cancel_input_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		cancel_input_widgets[#cancel_input_widgets + 1] = widget
		cancel_input_widgets_by_name[name] = widget
	end

	self._cancel_input_widgets = cancel_input_widgets
	self._cancel_input_widgets_by_name = cancel_input_widgets_by_name
	self.debug_box_widget = UIWidget.init(debug_widget_definitions.debug_box)
	self.debug_lobbies_widget = UIWidget.init(debug_widget_definitions.debug_lobbies)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.scenegraph_definition = scenegraph_definition
	self._input_to_widget_mapping = {
		cancel_matchmaking = {
			text_widget = cancel_input_widgets_by_name.cancel_text_input,
			text_widget_prefix = cancel_input_widgets_by_name.cancel_text_prefix,
			text_widget_suffix = cancel_input_widgets_by_name.cancel_text_suffix,
			input_icon_widget = cancel_input_widgets_by_name.cancel_icon,
			background = cancel_input_widgets_by_name.cancel_input_backround
		}
	}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)
end

MatchmakingUI._get_widget = function (self, name)
	return self._widgets_by_name[name]
end

MatchmakingUI._get_detail_widget = function (self, name)
	return self._detail_widgets_by_name[name]
end

MatchmakingUI.is_in_inn = function (self)
	return self._is_in_inn
end

MatchmakingUI.update = function (self, dt, t)
	if RESOLUTION_LOOKUP.modified then
		self:_update_button_prompts()
	end

	local disable_matchmaking_ui = false

	if disable_matchmaking_ui then
		return
	end

	local parent = self._parent
	local ingame_ui = parent:parent()
	local menu_active = ingame_ui.menu_active
	local in_menu_current_view = ingame_ui.current_view ~= nil
	local ingame_player_list_ui = parent:component("IngamePlayerListUI")
	local player_list_active = ingame_player_list_ui and ingame_player_list_ui:is_active()
	local show_detailed_matchmaking_info = not menu_active and not player_list_active and not in_menu_current_view
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

					if matchmaking_manager:game_mode_event_data() then
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

		local gamepad_active = self.input_manager:is_device_active("gamepad")

		if gamepad_active then
			if not self.gamepad_active_last_frame then
				self.gamepad_active_last_frame = true

				self:_update_button_prompts()
			end
		elseif self.gamepad_active_last_frame then
			self.gamepad_active_last_frame = false

			self:_update_button_prompts()
		end

		if Managers.party:is_leader(self._my_peer_id) then
			local allow_cancel_matchmaking = self.matchmaking_manager:allow_cancel_matchmaking()
			self._allow_cancel_matchmaking = allow_cancel_matchmaking and not has_mission_vote
		end

		self:_draw(ui_top_renderer, input_service, is_matchmaking, dt)
	end
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

	UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._show_detailed_matchmaking_info then
		if self._allow_cancel_matchmaking then
			local cancel_input_widgets = self._cancel_input_widgets

			for i = 1, #cancel_input_widgets, 1 do
				local widget = cancel_input_widgets[i]

				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end

		local detail_widgets = self._detail_widgets

		for i = 1, #detail_widgets, 1 do
			local widget = detail_widgets[i]

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

MatchmakingUI._update_background = function (self, is_matchmaking, has_mission_vote)
	local background_texture = nil

	if is_matchmaking then
		background_texture = "matchmaking_window_01"
	elseif has_mission_vote then
		background_texture = "matchmaking_window_02"
	end

	if background_texture then
		local background_widget = self:_get_detail_widget("detailed_info_box")

		if background_widget.content.background.texture_id ~= background_texture then
			background_widget.content.background.texture_id = background_texture
		end
	end
end

MatchmakingUI._update_matchmaking_info = function (self, t)
	local matchmaking_manager = self.matchmaking_manager
	local matchmaking_info = matchmaking_manager:search_info()
	local cached_matchmaking_info = self._cached_matchmaking_info

	if PLATFORM == "xb1" and matchmaking_info.no_lobby_data then
		local dots = ""
		local num_dots = math.floor((t * 5 + 0.5) % 4)

		for i = 0, num_dots, 1 do
			dots = dots .. "."
		end

		local widget = self:_get_widget("status_text")
		widget.content.text = Localize("loading_fetching_matchmaking_data")
		widget = self:_get_detail_widget("title_text")
		widget.content.text = dots
		widget = self:_get_detail_widget("difficulty_text")
		widget.content.text = ""

		return
	end

	local game_mode = matchmaking_info.game_mode

	if game_mode == "weave" then
		local quick_game = matchmaking_info.quick_game

		if quick_game then
			local text = "start_game_window_weave_quickplay_title"

			self:_set_detail_level_text(text, true)

			local difficulty = matchmaking_info.difficulty
			local difficulty_setting = difficulty and DifficultySettings[difficulty]
			local difficulty_display_name = (difficulty_setting and difficulty_setting.display_name) or "dlc1_2_difficulty_unavailable"

			self:_set_detail_difficulty_text(difficulty_display_name, nil, false)
		else
			local weave_name = matchmaking_info.weave_name
			local weave_templates = WeaveSettings.templates
			local weave_template = weave_name and weave_templates[weave_name]
			local weave_index = (weave_template and table.find(WeaveSettings.templates_ordered, weave_template)) or nil
			local weave_display_name = (weave_template and weave_index .. ". " .. Localize(weave_template.display_name)) or Localize("level_display_name_unavailable")

			self:_set_detail_level_text(weave_display_name, false)

			local wind = weave_template and weave_template.wind
			local wind_settings = wind and WindSettings[wind]
			local wind_display_name = (wind_settings and wind_settings.display_name) or ""

			self:_set_detail_difficulty_text(wind_display_name, WIND_COLORS[wind])
		end
	elseif game_mode == "weave_find_group" then
		local text = ""
		local dots = math.floor(t * 3) % 4

		for i = 1, dots, 1 do
			text = text .. "."
		end

		self:_set_detail_level_text(text, false)
		self:_set_detail_difficulty_text("", nil, true)
	else
		local difficulty = matchmaking_info.difficulty

		if difficulty ~= cached_matchmaking_info.difficulty then
			cached_matchmaking_info.difficulty = difficulty
			local difficulty_setting = difficulty and DifficultySettings[difficulty]
			local difficulty_display_name = (difficulty_setting and difficulty_setting.display_name) or "dlc1_2_difficulty_unavailable"

			self:_set_detail_difficulty_text(difficulty_display_name)
		end

		local quick_game = matchmaking_info.quick_game
		local quick_game_changed = quick_game ~= cached_matchmaking_info.quick_game
		local level_key = matchmaking_info.level_key
		local level_key_changed = level_key ~= cached_matchmaking_info.level_key

		if quick_game_changed or level_key_changed then
			cached_matchmaking_info.quick_game = quick_game
			cached_matchmaking_info.level_key = level_key
			local is_event_game = matchmaking_manager:game_mode_event_data()
			local text = nil

			if quick_game then
				text = "mission_vote_quick_play"
			elseif is_event_game then
				local level_settings = level_key and level_key ~= "n/a" and LevelSettings[level_key]
				local level_display_name = (level_settings and level_settings.display_name) or "random_level"
				text = level_display_name
			else
				local level_settings = level_key and level_key ~= "n/a" and LevelSettings[level_key]
				local level_display_name = (level_settings and level_settings.display_name) or "level_display_name_unavailable"
				text = level_display_name
			end

			self:_set_detail_level_text(text, true)
		end
	end

	if game_mode == "weave_find_group" then
		self:_set_status_text("finding_weave_group")
	else
		local status = matchmaking_info.status

		if status ~= cached_matchmaking_info[status] then
			cached_matchmaking_info.status = status

			self:_set_status_text(status)
		end
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
	local connecting_rotation_angle = (dt * connecting_rotation_speed) % 360
	local connecting_radians = math.degrees_to_radians(connecting_rotation_angle)

	for i = 1, 4, 1 do
		local widget_name = "party_slot_" .. i
		local widget = self:_get_detail_widget(widget_name)
		local content = widget.content
		local style = widget.style
		local is_connecting = content.is_connecting
		local connecting_icon_style = style.connecting_icon
		connecting_icon_style.angle = (is_connecting and connecting_icon_style.angle + connecting_radians) or 0
	end
end

MatchmakingUI._update_mission_vote_status = function (self)
	local voting_manager = self.voting_manager
	local active_vote_name = voting_manager:vote_in_progress()
	local active_vote_data = voting_manager:active_vote_data()
	local difficulty = active_vote_data.difficulty
	local level_key = active_vote_data.level_key
	local quick_game = active_vote_data.quick_game
	local event_data = active_vote_data.event_data
	local game_mode = active_vote_data.game_mode
	local weave_name = active_vote_data.weave_name

	if game_mode == "weave" then
		if quick_game then
			local text = "start_game_window_weave_quickplay_title"

			self:_set_detail_level_text(text, true)

			local difficulty_setting = difficulty and DifficultySettings[difficulty]
			local difficulty_display_name = (difficulty_setting and difficulty_setting.display_name) or "dlc1_2_difficulty_unavailable"

			self:_set_detail_difficulty_text(difficulty_display_name, nil, false)
		else
			local weave_templates = WeaveSettings.templates
			local weave_template = weave_name and weave_templates[weave_name]
			local weave_index = (weave_template and table.find(WeaveSettings.templates_ordered, weave_template)) or nil
			local weave_display_name = (weave_template and weave_index .. ". " .. Localize(weave_template.display_name)) or Localize("level_display_name_unavailable")

			self:_set_detail_level_text(weave_display_name, false)

			local wind = weave_template and weave_template.wind
			local wind_settings = wind and WindSettings[wind]
			local wind_display_name = (wind_settings and wind_settings.display_name) or ""

			self:_set_detail_difficulty_text(wind_display_name, WIND_COLORS[wind])
		end
	elseif game_mode == "weave_find_group" then
		active_vote_name = "start_game_window_weave_find_group"

		self:_set_detail_level_text("", false)
		self:_set_detail_difficulty_text("", nil, true)
	else
		local difficulty_settings = DifficultySettings[difficulty]
		local difficulty_display_name = difficulty_settings and difficulty_settings.display_name
		local level_display_name = nil

		if quick_game then
			level_display_name = "mission_vote_quick_play"
		elseif level_key == nil then
			level_display_name = "random_level"
		else
			local level_settings = LevelSettings[level_key]
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
	local alpha = nil

	if has_mission_vote then
		alpha = 255
	else
		alpha = 0
	end

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
	local witch_hunter_player, wood_elf_player, dwarf_ranger_player, bright_wizard_player, empire_soldier_player = nil
	local profiles_data = self.matchmaking_manager.debug.profiles_data

	if profiles_data then
		witch_hunter_player = profiles_data.player_slot_1 or "available"
		bright_wizard_player = profiles_data.player_slot_2 or "available"
		dwarf_ranger_player = profiles_data.player_slot_3 or "available"
		wood_elf_player = profiles_data.player_slot_4 or "available"
		empire_soldier_player = profiles_data.player_slot_5 or "available"
	else
		witch_hunter_player = lobby:lobby_data("player_slot_1") or "available"
		bright_wizard_player = lobby:lobby_data("player_slot_2") or "available"
		dwarf_ranger_player = lobby:lobby_data("player_slot_3") or "available"
		wood_elf_player = lobby:lobby_data("player_slot_4") or "available"
		empire_soldier_player = lobby:lobby_data("player_slot_5") or "available"
	end

	if rawget(_G, "Steam") and GameSettingsDevelopment.network_mode == "steam" then
		witch_hunter_player = (witch_hunter_player and witch_hunter_player ~= "available" and Steam.user_name(witch_hunter_player)) or "available"
		bright_wizard_player = (bright_wizard_player and bright_wizard_player ~= "available" and Steam.user_name(bright_wizard_player)) or "available"
		dwarf_ranger_player = (dwarf_ranger_player and dwarf_ranger_player ~= "available" and Steam.user_name(dwarf_ranger_player)) or "available"
		wood_elf_player = (wood_elf_player and wood_elf_player ~= "available" and Steam.user_name(wood_elf_player)) or "available"
		empire_soldier_player = (empire_soldier_player and empire_soldier_player ~= "available" and Steam.user_name(empire_soldier_player)) or "available"
	end

	debug_text = debug_text .. "\nWitch hunter: \t" .. witch_hunter_player
	debug_text = debug_text .. "\nBright wizard: \t" .. bright_wizard_player
	debug_text = debug_text .. "\nDwarf ranger: \t" .. dwarf_ranger_player
	debug_text = debug_text .. "\nWood elf: \t\t" .. wood_elf_player
	debug_text = debug_text .. "\nEmpire Soldier: \t" .. empire_soldier_player
	self.debug_box_widget.content.debug_text = debug_text
end

MatchmakingUI.destroy = function (self)
	return
end

MatchmakingUI.get_input_texture_data = function (self, input_action)
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local platform = PLATFORM

	if platform == "xb1" and GameSettingsDevelopment.allow_keyboard_mouse and not gamepad_active then
		platform = "win32"
	elseif platform == "win32" and gamepad_active then
		platform = "xb1"
	end

	local keymap_binding = input_service:get_keymapping(input_action, platform)
	local device_type = keymap_binding[1]
	local key_index = keymap_binding[2]
	local key_action_type = keymap_binding[3]
	local prefix_text = nil

	if key_action_type == "held" then
		prefix_text = "matchmaking_prefix_hold"
	end

	if device_type == "keyboard" then
		return nil, Keyboard.button_locale_name(key_index) or Keyboard.button_name(key_index), prefix_text
	elseif device_type == "mouse" then
		return nil, Mouse.button_name(key_index), prefix_text
	elseif device_type == "gamepad" then
		local button_name = Pad1.button_name(key_index)
		local button_texture_data = ButtonTextureByName(button_name, platform)

		return button_texture_data, button_name, prefix_text
	end

	return nil, ""
end

MatchmakingUI._update_button_prompts = function (self)
	local ui_scenegraph = self.ui_scenegraph

	for input_action, widgets in pairs(self._input_to_widget_mapping) do
		local text_widget = widgets.text_widget
		local text_widget_prefix = widgets.text_widget_prefix
		local text_widget_suffix = widgets.text_widget_suffix
		local input_icon_widget = widgets.input_icon_widget
		local texture_data, input_text, prefix_text = self:get_input_texture_data(input_action)
		text_widget_prefix.content.text = (prefix_text and Localize(prefix_text)) or ""

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
			input_icon_scenegraph.local_position[1] = text_width_input * 0.5
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
			text_widget_suffix.style.text.offset[1] = offset + text_width_prefix + text_width_input
			text_widget_suffix.style.text_shadow.offset[1] = offset + text_width_prefix + text_width_input + 2
		else
			input_icon_widget.style.texture_id.offset[1] = offset + text_width_prefix
			text_widget_prefix.style.text.offset[1] = offset
			text_widget_prefix.style.text_shadow.offset[1] = offset + 2
			text_widget_suffix.style.text.offset[1] = offset + text_width_prefix + text_width_input
			text_widget_suffix.style.text_shadow.offset[1] = offset + text_width_prefix + text_width_input + 2
		end
	end
end

MatchmakingUI._update_portraits = function (self, has_mission_vote)
	local profile_synchronizer = self.profile_synchronizer
	local player_manager = Managers.player
	local lobby = self.lobby
	local lobby_members = lobby:members()
	local members = lobby_members and lobby_members:members_map()

	if members then
		local portrait_index_table = self.portrait_index_table

		for i = 1, self._max_number_of_players, 1 do
			local peer_id = portrait_index_table[i]

			if peer_id and not members[peer_id] then
				portrait_index_table[i] = nil

				self:large_window_set_player_portrait(i, nil)
				self:large_window_set_player_connecting(i, false)
				self:large_window_set_player_ready_state(i, false)
				self:_set_player_is_voting(i, false)
				self:_set_player_voted_yes(i, false)
			end
		end

		for peer_id, _ in pairs(members) do
			local portrait_index = self:_get_portrait_index(peer_id)

			if not portrait_index then
				portrait_index = self:_get_first_free_portrait_index()
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
				self:large_window_set_player_ready_state(portrait_index, false)
			end
		end
	end
end

MatchmakingUI._get_portrait_index = function (self, peer_id)
	local portrait_index_table = self.portrait_index_table

	for i = 1, self._max_number_of_players, 1 do
		local player_peer_id = portrait_index_table[i]

		if player_peer_id == peer_id then
			return i
		end
	end
end

MatchmakingUI._get_first_free_portrait_index = function (self)
	local portrait_index_table = self.portrait_index_table

	for i = 1, self._max_number_of_players, 1 do
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
	local difficulty_display_name = (difficulty_setting and difficulty_setting.display_name) or "dlc1_2_difficulty_unavailable"
	local widget = self:_get_detail_widget("difficulty_text")
	widget.content.text = Localize(difficulty_display_name)
end

MatchmakingUI.large_window_set_player_portrait = function (self, index, peer_id)
	local widget = self:_get_detail_widget("party_slot_" .. index)
	local status_widget = self:_get_widget("player_status_" .. index)
	local content = widget.content
	local portrait_texture = nil

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
	for i = 1, self._max_number_of_players, 1 do
		local widget_name = "party_slot_" .. i
		local widget = self:_get_detail_widget(widget_name)
		local content = widget.content

		if content.peer_id == peer_id then
			return i
		end
	end
end

MatchmakingUI._sync_players_ready_state = function (self, dt)
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
	status_widget.content.texture_id = (is_ready and "matchmaking_light_01") or "matchmaking_light_02"
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
	widget.content.voted_yes = voted_yes
end

MatchmakingUI._set_detail_difficulty_text = function (self, text, optional_color, disable_localization)
	local widget = self:_get_detail_widget("difficulty_text")
	widget.content.text = (disable_localization and text) or Localize(text)
	widget.style.text.text_color = optional_color or WIND_COLORS.default
end

MatchmakingUI._set_detail_level_text = function (self, text, localize)
	local widget = self:_get_detail_widget("title_text")
	widget.content.text = (localize and Localize(text)) or text
end

MatchmakingUI._set_status_text = function (self, text)
	local widget = self:_get_widget("status_text")
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

MatchmakingUI.large_window_set_cancel_button_text = function (self, suffix_text)
	dprint("[MatchmakingUI] - Function ( large_window_set_cancel_button_text ) is deprecated")
end

MatchmakingUI.large_window_set_ready_button_text = function (self, suffix_text)
	dprint("[MatchmakingUI] - Function ( large_window_set_ready_button_text ) is deprecated")
end

MatchmakingUI.large_window_set_action_button_text = function (self, suffix_text)
	dprint("[MatchmakingUI] - Function ( large_window_set_action_button_text ) is deprecated")
end

MatchmakingUI.large_window_start_ready_pulse = function (self)
	dprint("[MatchmakingUI] - Function ( large_window_start_ready_pulse ) is deprecated")
end

MatchmakingUI.large_window_stop_ready_pulse = function (self)
	dprint("[MatchmakingUI] - Function ( large_window_stop_ready_pulse ) is deprecated")
end

MatchmakingUI.large_window_set_time = function (self, time)
	dprint("[MatchmakingUI] - Function ( large_window_set_time ) is deprecated")
end

MatchmakingUI.large_window_set_search_zone_title = function (self, title)
	dprint("[MatchmakingUI] - Function ( large_window_set_search_zone_title ) is deprecated")
end

MatchmakingUI.large_window_set_level = function (self, level_key, optional_name, optional_image)
	dprint("[MatchmakingUI] - Function ( large_window_set_level ) is deprecated")
end

MatchmakingUI.set_zone_visible = function (self, visible)
	dprint("[MatchmakingUI] - Function ( set_zone_visible ) is deprecated")
end

MatchmakingUI.set_search_zone_host_title = function (self, text)
	dprint("[MatchmakingUI] - Function ( set_search_zone_host_title ) is deprecated")
end

MatchmakingUI.set_ready_area_enabled = function (self, enabled, error_message)
	dprint("[MatchmakingUI] - Function ( set_ready_area_enabled ) is deprecated")
end

MatchmakingUI.set_minimize = function (self, set)
	return
end

MatchmakingUI.animate_large_window = function (self, minimize)
	dprint("[MatchmakingUI] - Function ( animate_large_window ) is deprecated")
end

MatchmakingUI.set_ready_progress = function (self, progress)
	dprint("[MatchmakingUI] - Function ( set_ready_progress ) is deprecated")
end

MatchmakingUI.set_start_progress = function (self, progress)
	dprint("[MatchmakingUI] - Function ( set_start_progress ) is deprecated")
end

MatchmakingUI.set_cancel_progress = function (self, progress)
	dprint("[MatchmakingUI] - Function ( set_cancel_progress ) is deprecated")
end

MatchmakingUI.large_window_ready_enable = function (self, enable)
	dprint("[MatchmakingUI] - Function ( large_window_ready_enable ) is deprecated")
end

MatchmakingUI.large_window_cancel_enable = function (self, enable)
	dprint("[MatchmakingUI] - Function ( large_window_cancel_enable ) is deprecated")
end

MatchmakingUI.set_action_area_visible = function (self, visible, instant_hide)
	dprint("[MatchmakingUI] - Function ( set_action_area_visible ) is deprecated")
end

MatchmakingUI.large_window_set_player_ready_state = function (self, index, is_ready)
	dprint("[MatchmakingUI] - Function ( large_window_set_player_ready_state ) is deprecated")
end

return
