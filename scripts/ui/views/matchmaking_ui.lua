-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/settings/difficulty_settings")

local definitions = local_require("scripts/ui/views/matchmaking_ui_definitions")
local widget_definitions = definitions.widget_definitions
local widget_detail_definitions = definitions.widget_detail_definitions
local scenegraph_definition = definitions.scenegraph_definition
local debug_widget_definitions = definitions.debug_widget_definitions

local function dprint(...)
	return 
end

local function get_portrait_name_by_profile_index(profile_index, career_index)
	local scale = RESOLUTION_LOOKUP.scale
	local profile_data = SPProfiles[profile_index]
	local careers = profile_data.careers
	local career_settings = careers[career_index]
	local portrait_image = career_settings.portrait_image
	local display_name = profile_data.display_name

	return "small_" .. portrait_image
end

MatchmakingUI = class(MatchmakingUI)
MatchmakingUI.init = function (self, ingame_ui_context)
	self.level_transition_handler = ingame_ui_context.level_transition_handler
	self.network_event_delegate = ingame_ui_context.network_event_delegate
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.camera_manager = ingame_ui_context.camera_manager
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.lobby = ingame_ui_context.network_lobby
	self.countdown_ui = self.ingame_ui.countdown_ui
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.voting_manager = ingame_ui_context.voting_manager
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.is_server = ingame_ui_context.is_server
	self.matchmaking_manager = Managers.matchmaking
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	rawset(_G, "GLOBAL_MMUI", self)
	self.create_ui_elements(self)

	self.num_players_text = Localize("number_of_players")
	self.max_number_of_players = MatchmakingSettings.MAX_NUMBER_OF_PLAYERS
	self.portrait_index_table = {}
	self._cached_matchmaking_info = {}

	if self.is_server then
		self._enable_cancel_matchmaking(self)
		self._update_button_prompts(self)
	end

	return 
end
MatchmakingUI.create_ui_elements = function (self)
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
	self.debug_box_widget = UIWidget.init(debug_widget_definitions.debug_box)
	self.debug_lobbies_widget = UIWidget.init(debug_widget_definitions.debug_lobbies)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.scenegraph_definition = scenegraph_definition
	self._input_to_widget_mapping = {
		cancel_matchmaking = {
			text_widget = detail_widgets_by_name.cancel_text_input,
			text_widget_prefix = detail_widgets_by_name.cancel_text_prefix,
			text_widget_suffix = detail_widgets_by_name.cancel_text_suffix,
			input_icon_widget = detail_widgets_by_name.cancel_icon,
			background = detail_widgets_by_name.cancel_input_backround
		}
	}

	for _, widgets in pairs(self._input_to_widget_mapping) do
		for _, widget in pairs(widgets) do
			widget.content.visible = false
		end
	end

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	return 
end
MatchmakingUI._enable_cancel_matchmaking = function (self)
	self._allow_cancel_matchmaking = true

	for _, widgets in pairs(self._input_to_widget_mapping) do
		for _, widget in pairs(widgets) do
			widget.content.visible = true
		end
	end

	return 
end
MatchmakingUI._get_widget = function (self, name)
	return self._widgets_by_name[name]
end
MatchmakingUI._get_detail_widget = function (self, name)
	return self._detail_widgets_by_name[name]
end
MatchmakingUI.is_enter_game = function (self)
	return self.countdown_ui:is_enter_game()
end
MatchmakingUI.is_in_inn = function (self)
	return self.is_in_inn
end
MatchmakingUI.update = function (self, dt, t, show_detailed_matchmaking_info)
	local countdown_ui = self.countdown_ui
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, "ingame_menu")
	local is_matchmaking = self.matchmaking_manager:is_game_matchmaking() and self.is_in_inn
	local enter_game = self.countdown_ui:is_enter_game()
	local ui_suspended = self.ingame_ui.menu_suspended
	local voting_manager = self.voting_manager
	local active_vote_name = voting_manager.vote_in_progress(voting_manager)
	local has_mission_vote = active_vote_name == "game_settings_vote" or active_vote_name == "game_settings_deed_vote"

	if script_data.debug_lobbies then
		self.update_debug_lobbies(self)
		self.draw_debug_lobbies(self, ui_top_renderer, input_service, dt)
	end

	if ui_suspended and not enter_game then
		return 
	end

	if show_detailed_matchmaking_info ~= self._show_detailed_matchmaking_info then
		self._show_detailed_matchmaking_info = show_detailed_matchmaking_info
		self._detailed_info_visibility_progress = 0
	end

	for name, animation in pairs(self.ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			animation = nil
		end
	end

	if not enter_game and (is_matchmaking or has_mission_vote) then
		self._update_background(self, is_matchmaking, has_mission_vote)
		self._update_portraits(self, has_mission_vote)
		self._update_status(self, dt)
		self._update_show_timer(self, has_mission_vote)

		if is_matchmaking then
			self._update_matchmaking_info(self)
			self._sync_players_ready_state(self, dt)

			if self._allow_cancel_matchmaking and not has_mission_vote then
				local cancel_matchmaking = input_service.get(input_service, "cancel_matchmaking")

				if cancel_matchmaking then
					self.matchmaking_manager:cancel_matchmaking()

					if Managers.deed:has_deed() then
						Managers.deed:reset()
					end
				end
			end
		elseif has_mission_vote then
			self._update_mission_vote_status(self)
			self._update_mission_vote_player_status(self)
			self._update_mission_timer(self)
		end

		local gamepad_active = self.input_manager:is_device_active("gamepad")

		if gamepad_active then
			if not self.gamepad_active_last_frame then
				self.gamepad_active_last_frame = true

				self._update_button_prompts(self)
			end
		elseif self.gamepad_active_last_frame then
			self.gamepad_active_last_frame = false

			self._update_button_prompts(self)
		end

		self._draw(self, ui_top_renderer, input_service, is_matchmaking, dt)
	end

	return 
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

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._show_detailed_matchmaking_info then
		for _, widget in ipairs(self._detail_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
MatchmakingUI.draw_debug_lobbies = function (self, ui_renderer, input_service, dt)
	UIRenderer.begin_pass(ui_renderer, self.ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, self.debug_lobbies_widget)
	UIRenderer.end_pass(ui_renderer)

	return 
end
MatchmakingUI._update_background = function (self, is_matchmaking, has_mission_vote)
	local background_texture = nil

	if is_matchmaking then
		background_texture = "matchmaking_window_01"
	elseif has_mission_vote then
		background_texture = "matchmaking_window_02"
	end

	if background_texture then
		local background_widget = self._get_detail_widget(self, "detailed_info_box")

		if background_widget.content.background.texture_id ~= background_texture then
			background_widget.content.background.texture_id = background_texture
		end
	end

	return 
end
MatchmakingUI._update_matchmaking_info = function (self)
	local matchmaking_info = self.matchmaking_manager:search_info()
	local cached_matchmaking_info = self._cached_matchmaking_info
	local difficulty = matchmaking_info.difficulty

	if difficulty ~= cached_matchmaking_info.difficulty then
		cached_matchmaking_info.difficulty = difficulty
		local difficulty_setting = difficulty and DifficultySettings[difficulty]
		local difficulty_display_name = (difficulty_setting and difficulty_setting.display_name) or "dlc1_2_difficulty_unavailable"

		self._set_detail_difficulty_text(self, difficulty_display_name)
	end

	local quick_game = matchmaking_info.quick_game
	local quick_game_changed = quick_game ~= cached_matchmaking_info[quick_game]
	local level_key = matchmaking_info.level_key
	local level_key_changed = level_key ~= cached_matchmaking_info[level_key]

	if quick_game_changed or level_key_changed then
		cached_matchmaking_info.quick_game = quick_game
		cached_matchmaking_info.level_key = level_key
		local widget = self._get_detail_widget(self, "title_text")
		local text = nil

		if quick_game then
			text = "mission_vote_quick_play"
		else
			local level_settings = level_key and level_key ~= "n/a" and LevelSettings[level_key]
			local level_display_name = (level_settings and level_settings.display_name) or "level_display_name_unavailable"
			text = level_display_name
		end

		self._set_detail_level_text(self, text)
	end

	local status = matchmaking_info.status

	if status ~= cached_matchmaking_info[status] then
		cached_matchmaking_info.status = status

		self._set_status_text(self, status)
	end

	return 
end
MatchmakingUI._update_status = function (self, dt)
	local rotation_progresss = ((self._rotation_progresss or 0) + dt * 0.2) % 1
	self._rotation_progresss = rotation_progresss
	local anim_progress = math.easeCubic(rotation_progresss)
	local rotation_angle = anim_progress * 360
	local radians = math.degrees_to_radians(rotation_angle)
	local loading_icon = self._get_widget(self, "loading_status_frame")
	loading_icon.style.texture_id.angle = radians
	local connecting_rotation_speed = 200
	local connecting_rotation_angle = (dt * connecting_rotation_speed) % 360
	local connecting_radians = math.degrees_to_radians(connecting_rotation_angle)

	for i = 1, 4, 1 do
		local widget_name = "party_slot_" .. i
		local widget = self._get_detail_widget(self, widget_name)
		local content = widget.content
		local style = widget.style
		local is_connecting = content.is_connecting
		local connecting_icon_style = style.connecting_icon
		connecting_icon_style.angle = (is_connecting and connecting_icon_style.angle + connecting_radians) or 0
	end

	return 
end
MatchmakingUI._update_mission_vote_status = function (self)
	local voting_manager = self.voting_manager
	local active_vote_name = voting_manager.vote_in_progress(voting_manager)
	local active_vote_data = voting_manager.active_vote_data(voting_manager)
	local difficulty, level_key, quick_game = nil
	difficulty = active_vote_data.difficulty
	level_key = active_vote_data.level_key
	quick_game = active_vote_data.quick_game
	local difficulty_settings = DifficultySettings[difficulty]
	local difficulty_display_name = difficulty_settings.display_name
	local level_display_name = nil

	if quick_game then
		level_display_name = "mission_vote_quick_play"
	else
		local level_settings = LevelSettings[level_key]
		level_display_name = level_settings.display_name
	end

	local status = active_vote_name

	self._set_detail_difficulty_text(self, difficulty_display_name)
	self._set_detail_level_text(self, level_display_name)
	self._set_status_text(self, status)

	return 
end
MatchmakingUI._update_mission_vote_player_status = function (self)
	local voting_manager = self.voting_manager
	local voters = self.voting_manager:get_current_voters()

	for peer_id, vote in pairs(voters) do
		local portrait_index = self._get_portrait_index(self, peer_id)

		if portrait_index ~= nil then
			if vote == 1 then
				self._set_player_voted_yes(self, portrait_index, true)
			elseif vote == "undecided" then
				self._set_player_voted_yes(self, portrait_index, false)
			end
		end
	end

	return 
end
MatchmakingUI._update_mission_timer = function (self)
	local voting_manager = self.voting_manager
	local vote_template = voting_manager.active_vote_template(voting_manager)
	local duration = vote_template.duration
	local vote_time_left = voting_manager.vote_time_left(voting_manager)
	local time_progress = math.max(vote_time_left / duration, 0)

	self._set_vote_time_progress(self, time_progress)

	return 
end
MatchmakingUI._update_show_timer = function (self, has_mission_vote)
	local alpha = nil

	if has_mission_vote then
		alpha = 255
	else
		alpha = 0
	end

	local bg = self._get_detail_widget(self, "timer_bg")
	local fg = self._get_detail_widget(self, "timer_fg")
	local glow = self._get_detail_widget(self, "timer_glow")
	bg.style.texture_id.color[1] = alpha
	fg.style.texture_id.color[1] = alpha
	glow.style.texture_id.color[1] = alpha

	return 
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
		witch_hunter_player = lobby.lobby_data(lobby, "player_slot_1") or "available"
		bright_wizard_player = lobby.lobby_data(lobby, "player_slot_2") or "available"
		dwarf_ranger_player = lobby.lobby_data(lobby, "player_slot_3") or "available"
		wood_elf_player = lobby.lobby_data(lobby, "player_slot_4") or "available"
		empire_soldier_player = lobby.lobby_data(lobby, "player_slot_5") or "available"
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

	return 
end
MatchmakingUI.update_debug_lobbies = function (self)

	-- Decompilation error in this vicinity:
	local matchmaking_manager = Managers.matchmaking
	local search_data = matchmaking_manager.state_context.game_search_data
	self.debug_lobbies_widget.content.debug_text = string.lower(debug_text)
	self.debug_lobbies_widget.content.debug_server_text = string.lower(debug_server_text)
	self.debug_lobbies_widget.content.debug_match_text = string.lower(debug_match_text)
	self.debug_lobbies_widget.content.debug_valid_text = string.lower(debug_valid_text)
	self.debug_lobbies_widget.content.debug_broken_text = string.lower(debug_broken_text)
	self.debug_lobbies_widget.content.debug_level_key_text = string.lower(debug_level_key_text)
	self.debug_lobbies_widget.content.debug_selected_level_key_text = string.lower(debug_selected_level_key_text)
	self.debug_lobbies_widget.content.debug_matchmaking_text = string.lower(debug_matchmaking_text)
	self.debug_lobbies_widget.content.debug_difficulty_text = string.lower(debug_difficulty_text)
	self.debug_lobbies_widget.content.debug_num_players_text = debug_num_players_text
	self.debug_lobbies_widget.content.debug_wh_text = debug_wh_text
	self.debug_lobbies_widget.content.debug_we_text = debug_we_text
	self.debug_lobbies_widget.content.debug_dr_text = debug_dr_text
	self.debug_lobbies_widget.content.debug_bw_text = debug_bw_text
	self.debug_lobbies_widget.content.debug_es_text = debug_es_text
	self.debug_lobbies_widget.content.debug_rp_text = debug_rp_text
	self.debug_lobbies_widget.content.debug_host_text = debug_host_text
	self.debug_lobbies_widget.content.debug_lobby_id_text = debug_lobby_id_text
	self.debug_lobbies_widget.content.debug_hash_text = debug_hash_text

	return 
end
MatchmakingUI.destroy = function (self)
	rawset(_G, "GLOBAL_MMUI", nil)

	return 
end
MatchmakingUI.get_input_texture_data = function (self, input_action)
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, "ingame_menu")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local platform = PLATFORM

	if platform == "win32" and gamepad_active then
		platform = "xb1"
	end

	local keymap_binding = input_service.get_keymapping(input_service, input_action, platform)
	local device_type = keymap_binding[1]
	local key_index = keymap_binding[2]
	local key_action_type = keymap_binding[3]
	local prefix_text = nil

	if key_action_type == "held" then
		prefix_text = "matchmaking_prefix_hold"
	end

	if device_type == "keyboard" then
		return nil, Keyboard.button_locale_name(key_index), prefix_text
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
	if not self._allow_cancel_matchmaking then
		return 
	end

	local ui_scenegraph = self.ui_scenegraph

	for input_action, widgets in pairs(self._input_to_widget_mapping) do
		local text_widget = widgets.text_widget
		local text_widget_prefix = widgets.text_widget_prefix
		local text_widget_suffix = widgets.text_widget_suffix
		local input_icon_widget = widgets.input_icon_widget
		local input_icon_bar_width = 0
		local texture_data, input_text, prefix_text = self.get_input_texture_data(self, input_action)
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

	return 
end
MatchmakingUI._update_portraits = function (self, has_mission_vote)
	local profile_synchronizer = self.profile_synchronizer
	local player_manager = Managers.player
	local portrait_index = 0
	local lobby = self.lobby
	local lobby_members = lobby.members(lobby)
	local members = lobby_members and lobby_members.members_map(lobby_members)

	if members then
		local portrait_index_table = self.portrait_index_table

		for i = 1, MatchmakingSettings.MAX_NUMBER_OF_PLAYERS, 1 do
			local peer_id = portrait_index_table[i]

			if peer_id and not members[peer_id] then
				portrait_index_table[i] = nil

				self.large_window_set_player_portrait(self, i, nil)
				self.large_window_set_player_connecting(self, i, false)
				self.large_window_set_player_ready_state(self, i, false)
				self._set_player_is_voting(self, i, false)
				self._set_player_voted_yes(self, i, false)
			end
		end

		for peer_id, _ in pairs(members) do
			local portrait_index = self._get_portrait_index(self, peer_id)

			if not portrait_index then
				portrait_index = self._get_first_free_portrait_index(self)
				portrait_index_table[portrait_index] = peer_id
			end

			if has_mission_vote then
				self._set_player_is_voting(self, portrait_index, true)
			else
				self._set_player_is_voting(self, portrait_index, false)
			end

			local profile = profile_synchronizer.profile_by_peer(profile_synchronizer, peer_id, 1)

			if profile then
				local display_name = SPProfiles[profile].unit_name

				self.large_window_set_player_portrait(self, portrait_index, peer_id)

				if player_manager.player_from_peer_id(player_manager, peer_id) then
					self.large_window_set_player_connecting(self, portrait_index, false)
				end
			else
				self.large_window_set_player_connecting(self, portrait_index, true)
				self.large_window_set_player_ready_state(self, portrait_index, false)
			end
		end
	end

	return 
end
MatchmakingUI._get_portrait_index = function (self, peer_id)
	local portrait_index_table = self.portrait_index_table

	for i = 1, MatchmakingSettings.MAX_NUMBER_OF_PLAYERS, 1 do
		local player_peer_id = portrait_index_table[i]

		if player_peer_id == peer_id then
			return i
		end
	end

	return 
end
MatchmakingUI._get_first_free_portrait_index = function (self)
	local portrait_index_table = self.portrait_index_table

	for i = 1, MatchmakingSettings.MAX_NUMBER_OF_PLAYERS, 1 do
		local player_peer_id = portrait_index_table[i]

		if player_peer_id == nil then
			return i
		end
	end

	return 
end
MatchmakingUI.large_window_set_title = function (self, title)
	local widget = self._get_detail_widget(self, "title_text")
	widget.content.text = Localize(title)

	return 
end
MatchmakingUI.large_window_set_status_message = function (self, message)
	assert(message ~= " ", "tried to pass empty status message to matchmaking ui")

	local widget = self._get_widget(self, "status_text")
	widget.content.text = Localize(message)

	return 
end
MatchmakingUI.large_window_set_difficulty = function (self, difficulty)
	local difficulty_setting = difficulty and DifficultySettings[difficulty]
	local difficulty_display_name = (difficulty_setting and difficulty_setting.display_name) or "dlc1_2_difficulty_unavailable"
	local widget = self._get_detail_widget(self, "difficulty_text")
	widget.content.text = Localize(difficulty_display_name)

	return 
end
MatchmakingUI.large_window_set_player_portrait = function (self, index, peer_id)
	local widget = self._get_detail_widget(self, "party_slot_" .. index)
	local status_widget = self._get_widget(self, "player_status_" .. index)
	local content = widget.content
	local style = widget.style
	local portrait_texture = nil

	if peer_id then
		local player_manager = Managers.player
		local player = player_manager.player(player_manager, peer_id, 1)
		local player_unit = player and player.player_unit

		if Unit.alive(player_unit) then
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local career_index = (career_extension and career_extension.career_index(career_extension)) or player.career_index(player)
			local profile_index = player.profile_index(player)

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

	return 
end
MatchmakingUI._get_party_slot_index_by_peer_id = function (self, peer_id)
	for i = 1, 4, 1 do
		local widget_name = "party_slot_" .. i
		local widget = self._get_detail_widget(self, widget_name)
		local content = widget.content

		if content.peer_id == peer_id then
			return i
		end
	end

	return 
end
MatchmakingUI._sync_players_ready_state = function (self, dt)
	local player_manager = Managers.player
	local human_players = player_manager.human_players(player_manager)

	for _, player in pairs(human_players) do
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local is_in_end_zone = status_extension.is_in_end_zone(status_extension)
			local peer_id = player.peer_id
			local widget_index = self._get_party_slot_index_by_peer_id(self, peer_id)

			if widget_index then
				self._set_player_ready_state(self, widget_index, is_in_end_zone)
			end
		end
	end

	return 
end
MatchmakingUI._set_player_ready_state = function (self, index, is_ready)
	local widget = self._get_detail_widget(self, "party_slot_" .. index)
	local status_widget = self._get_widget(self, "player_status_" .. index)
	widget.content.is_ready = is_ready
	status_widget.content.is_ready = is_ready
	status_widget.content.texture_id = (is_ready and "matchmaking_light_01") or "matchmaking_light_02"

	return 
end
MatchmakingUI.large_window_set_player_connecting = function (self, index, is_connecting)
	local widget = self._get_detail_widget(self, "party_slot_" .. index)
	local status_widget = self._get_widget(self, "player_status_" .. index)
	widget.content.is_connecting = is_connecting
	status_widget.content.is_connecting = is_connecting

	return 
end
MatchmakingUI._set_player_is_voting = function (self, index, is_voting)
	local widget = self._get_detail_widget(self, "party_slot_" .. index)
	widget.content.is_voting = is_voting

	return 
end
MatchmakingUI._set_player_voted_yes = function (self, index, voted_yes)
	local widget = self._get_detail_widget(self, "party_slot_" .. index)
	widget.content.voted_yes = voted_yes

	return 
end
MatchmakingUI._set_detail_difficulty_text = function (self, text)
	local widget = self._get_detail_widget(self, "difficulty_text")
	widget.content.text = Localize(text)

	return 
end
MatchmakingUI._set_detail_level_text = function (self, text)
	local widget = self._get_detail_widget(self, "title_text")
	widget.content.text = Localize(text)

	return 
end
MatchmakingUI._set_status_text = function (self, text)
	local widget = self._get_widget(self, "status_text")
	widget.content.text = Localize(text)

	return 
end
MatchmakingUI._set_vote_time_progress = function (self, progress)
	local widget = self._get_detail_widget(self, "timer_fg")
	local content = widget.content
	local uvs = content.texture_id.uvs
	local scenegraph_definition = self.scenegraph_definition
	local scenegraph_id = widget.scenegraph_id
	local default_size = self.scenegraph_definition[scenegraph_id].size
	local current_size = self.ui_scenegraph[scenegraph_id].size
	current_size[1] = default_size[1] * progress
	uvs[2][1] = progress

	return 
end
MatchmakingUI.large_window_set_cancel_button_text = function (self, suffix_text)
	dprint("[MatchmakingUI] - Function ( large_window_set_cancel_button_text ) is deprecated")

	return 
end
MatchmakingUI.large_window_set_ready_button_text = function (self, suffix_text)
	dprint("[MatchmakingUI] - Function ( large_window_set_ready_button_text ) is deprecated")

	return 
end
MatchmakingUI.large_window_set_action_button_text = function (self, suffix_text)
	dprint("[MatchmakingUI] - Function ( large_window_set_action_button_text ) is deprecated")

	return 
end
MatchmakingUI.large_window_start_ready_pulse = function (self)
	dprint("[MatchmakingUI] - Function ( large_window_start_ready_pulse ) is deprecated")

	return 
end
MatchmakingUI.large_window_stop_ready_pulse = function (self)
	dprint("[MatchmakingUI] - Function ( large_window_stop_ready_pulse ) is deprecated")

	return 
end
MatchmakingUI.large_window_set_time = function (self, time)
	dprint("[MatchmakingUI] - Function ( large_window_set_time ) is deprecated")

	return 
end
MatchmakingUI.large_window_set_search_zone_title = function (self, title)
	dprint("[MatchmakingUI] - Function ( large_window_set_search_zone_title ) is deprecated")

	return 
end
MatchmakingUI.large_window_set_level = function (self, level_key, optional_name, optional_image)
	dprint("[MatchmakingUI] - Function ( large_window_set_level ) is deprecated")

	return 
end
MatchmakingUI.set_zone_visible = function (self, visible)
	dprint("[MatchmakingUI] - Function ( set_zone_visible ) is deprecated")

	return 
end
MatchmakingUI.set_search_zone_host_title = function (self, text)
	dprint("[MatchmakingUI] - Function ( set_search_zone_host_title ) is deprecated")

	return 
end
MatchmakingUI.set_ready_area_enabled = function (self, enabled, error_message)
	dprint("[MatchmakingUI] - Function ( set_ready_area_enabled ) is deprecated")

	return 
end
MatchmakingUI.set_minimize = function (self, set)
	return 
end
MatchmakingUI.animate_large_window = function (self, minimize)
	dprint("[MatchmakingUI] - Function ( animate_large_window ) is deprecated")

	return 
end
MatchmakingUI.set_ready_progress = function (self, progress)
	dprint("[MatchmakingUI] - Function ( set_ready_progress ) is deprecated")

	return 
end
MatchmakingUI.set_start_progress = function (self, progress)
	dprint("[MatchmakingUI] - Function ( set_start_progress ) is deprecated")

	return 
end
MatchmakingUI.set_cancel_progress = function (self, progress)
	dprint("[MatchmakingUI] - Function ( set_cancel_progress ) is deprecated")

	return 
end
MatchmakingUI.large_window_ready_enable = function (self, enable)
	dprint("[MatchmakingUI] - Function ( large_window_ready_enable ) is deprecated")

	return 
end
MatchmakingUI.large_window_cancel_enable = function (self, enable)
	dprint("[MatchmakingUI] - Function ( large_window_cancel_enable ) is deprecated")

	return 
end
MatchmakingUI.set_action_area_visible = function (self, visible, instant_hide)
	dprint("[MatchmakingUI] - Function ( set_action_area_visible ) is deprecated")

	return 
end
MatchmakingUI.large_window_set_player_ready_state = function (self, index, is_ready)
	dprint("[MatchmakingUI] - Function ( large_window_set_player_ready_state ) is deprecated")

	return 
end

return 
