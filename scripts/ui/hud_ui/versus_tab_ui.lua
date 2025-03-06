-- chunkname: @scripts/ui/hud_ui/versus_tab_ui.lua

local definitions = local_require("scripts/ui/hud_ui/versus_tab_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local create_empty_frame_widget = definitions.create_empty_frame_widget
local console_cursor_definition = definitions.console_cursor_definition
local custom_game_settings_widgets = definitions.custom_game_settings_widgets
local NUM_MAX_TEAMS = 2
local NUM_TEAMS_SIZE = 4
local DO_RELOAD = false
local temp_vote_data = {}
local allowed_loadout_slots = {
	"slot_melee",
	"slot_ranged",
}

VersusTabUI = class(VersusTabUI)

VersusTabUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._voip = ingame_ui_context.voip

	local player = ingame_ui_context.player

	self._player = player
	self._peer_id = player:network_id()
	self._local_player_id = player:local_player_id()
	self._context = ingame_ui_context

	local world = ingame_ui_context.world_manager:world("level_world")

	self._wwise_world = Managers.world:wwise_world(world)

	local input_manager = self._input_manager

	input_manager:create_input_service("player_list_input", "IngamePlayerListKeymaps", "IngamePlayerListFilters")
	input_manager:map_device_to_service("player_list_input", "keyboard")
	input_manager:map_device_to_service("player_list_input", "mouse")
	input_manager:map_device_to_service("player_list_input", "gamepad")

	self._animations = {}
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._selected_objective_index = 0
	self._selected_sub_objective_index = 0

	self:_create_ui_elements()

	self._objective_system = Managers.state.entity:system("objective_system")
	self._objectives_initialized = false
	self._win_conditions = Managers.mechanism:game_mechanism():win_conditions()

	local level_key = Managers.level_transition_handler:get_current_level_keys()
	local level_settings = LevelSettings[level_key]
	local level_name_localized = Localize(level_settings.display_name)

	self:_set_level_name(level_name_localized)
	self:_register_events()

	local game_mode_state = Managers.state.game_mode:game_mode():game_mode_state()
	local round_has_started = game_mode_state == "match_running_state" and true or nil

	if round_has_started then
		self:_on_round_started()
	end

	self._round_has_started = round_has_started

	local _, custom_round_time_limit, custom_settings_enabled = Managers.mechanism:mechanism_try_call("get_custom_game_setting", "round_time_limit")

	if custom_settings_enabled and custom_round_time_limit then
		self._custom_round_timer_active = true
	end
end

VersusTabUI._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}
	local widget_definitions = definitions.widget_definitions

	for name, definition in pairs(widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	self._item_tooltip = UIWidget.init(definitions.item_tooltip)
	self._console_cursor = UIWidget.init(console_cursor_definition)
	self._widgets_by_name = widgets_by_name
	self._widgets = widgets
	DO_RELOAD = false

	self:_create_player_slots()

	self._custom_game_settings_widgets, self._custom_game_settings_widgets_by_name = {}, {}

	UIUtils.create_widgets(custom_game_settings_widgets, self._custom_game_settings_widgets, self._custom_game_settings_widgets_by_name)

	local custom_settings_enabled = Managers.mechanism:game_mechanism():custom_settings_enabled()

	if custom_settings_enabled then
		self:_setup_custom_settings()
	end

	self._custom_settings_enabled = custom_settings_enabled
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

VersusTabUI.destroy = function (self)
	self._ui_animator = nil

	self:_unregister_events()
end

VersusTabUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()
	end

	self:_handle_input(dt, t)

	if self._active then
		local mechanism_manager = Managers.mechanism
		local current_set = self:_get_current_set()
		local level_key = Managers.level_transition_handler:get_current_level_key()
		local max_rounds = VersusObjectiveSettings[level_key].num_sets

		if current_set ~= self._round_id then
			self._round_id = current_set

			local temp_string = Localize("versus_round_count")

			self:_set_sub_title(string.format(temp_string, current_set, max_rounds))
		end

		local party_manager = Managers.party
		local _, party_id = party_manager:get_party_from_player_id(self._peer_id, self._local_player_id)
		local opponent_party_id = self:_get_opponent_party_id()

		self:_set_team_name(party_id, opponent_party_id)
		self:_set_team_textures(party_id, opponent_party_id)
		self:_set_side_text(party_manager, party_id, opponent_party_id)

		if not self._party_id then
			self._party_id = party_id
			self._opponent_party_id = opponent_party_id
		end

		self:_update_round_start_timer(dt, t)
		self:_update_objectives(dt, t)
		self:_update_score(party_id, opponent_party_id)
		self:_update_animations(dt, t)
		self:_update_custom_lobby_slots()
		self:_draw(dt, t)
	end
end

VersusTabUI._update_animations = function (self, dt, t)
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

VersusTabUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("player_list_input")
	local render_settings = self._render_settings
	local gamepad_active = input_manager:is_device_active("gamepad")
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local widgets = self._widgets

	if widgets then
		for i = 1, #widgets do
			local widget = widgets[i]

			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	render_settings.alpha_multiplier = alpha_multiplier

	local custom_game_slots = self._custom_game_slots

	if custom_game_slots then
		for i = 1, #custom_game_slots do
			local team_slots = custom_game_slots[i]

			for j = 1, #team_slots do
				local player_slot = team_slots[j]
				local empty = player_slot.empty
				local is_player = player_slot.is_player
				local peer_id = player_slot.peer_id
				local empty_widget = player_slot.empty_widget

				if empty_widget then
					UIRenderer.draw_widget(ui_renderer, empty_widget)
				end

				if not empty then
					local panel_widget = player_slot.panel_widget

					if panel_widget then
						UIRenderer.draw_widget(ui_renderer, panel_widget)
					end

					local portrait_widget = player_slot.portrait_widget

					if portrait_widget then
						UIRenderer.draw_widget(ui_renderer, portrait_widget)
					end

					local insignia_widget = player_slot.insignia_widget

					if insignia_widget then
						UIRenderer.draw_widget(ui_renderer, insignia_widget)
					end
				end
			end
		end
	end

	self._widgets_by_name.objective_text.content.visible = self._round_has_started and true or false

	UIRenderer.draw_widget(ui_renderer, self._item_tooltip)

	if gamepad_active then
		UIRenderer.draw_widget(ui_renderer, self._console_cursor)
	end

	if self._custom_settings_enabled and self._custom_game_settings_widgets then
		UIRenderer.draw_all_widgets(ui_renderer, self._custom_game_settings_widgets)
	end

	if self._custom_settings_enabled and self._settings_widgets then
		UIRenderer.draw_all_widgets(ui_renderer, self._settings_widgets)
	end

	UIRenderer.end_pass(ui_renderer)

	if self._scrollbar_ui then
		self._scrollbar_ui:update(dt, t, ui_renderer, input_service, render_settings)
	end
end

VersusTabUI._set_team_name = function (self, local_player_party_id, opponent_party_id)
	local local_team_ui_settings, opponent_team_ui_settings = self:_get_teams_ui_settings(local_player_party_id, opponent_party_id)
	local team_1_name = self._widgets_by_name.team_1_name

	team_1_name.content.text = Localize(local_team_ui_settings.display_name)

	local team_2_name = self._widgets_by_name.team_2_name

	team_2_name.content.text = Localize(opponent_team_ui_settings.display_name)
end

VersusTabUI._set_team_textures = function (self, local_player_party_id, opponent_party_id)
	local local_team_ui_settings, opponent_team_ui_settings = self:_get_teams_ui_settings(local_player_party_id, opponent_party_id)
	local team_1_icon = self._widgets_by_name.team_1_icon

	team_1_icon.content.texture_id = local_team_ui_settings.local_flag_texture

	local team_2_icon = self._widgets_by_name.team_2_icon

	team_2_icon.content.texture_id = opponent_team_ui_settings.opponent_flag_texture
end

VersusTabUI._set_side_text = function (self, party_manager, local_player_party_id, opponent_party_id)
	local settings = DLCSettings.carousel
	local local_player_party = party_manager:get_party(local_player_party_id)

	if local_player_party then
		local side = Managers.state.side.side_by_party[local_player_party]
		local side_name = side:name()
		local side_name_text = self._widgets_by_name.team_1_side_text
		local side_localization_key = settings.sides_localization_lookup[side_name]

		side_name_text.content.text = Localize(side_localization_key)
	end

	local opponent_party = party_manager:get_party(opponent_party_id)

	if opponent_party then
		local side = Managers.state.side.side_by_party[opponent_party]
		local side_name = side:name()
		local side_name_text = self._widgets_by_name.team_2_side_text
		local side_localization_key = settings.sides_localization_lookup[side_name]

		side_name_text.content.text = Localize(side_localization_key)
	end
end

VersusTabUI._update_score = function (self, local_player_party_id, opponent_party_id)
	local local_player_team_score = self._win_conditions:get_total_score(local_player_party_id)
	local opponent_team_score = self._win_conditions:get_total_score(opponent_party_id)
	local local_player_party = Managers.party:get_party(local_player_party_id)
	local local_player_team_side = Managers.state.side.side_by_party[local_player_party]
	local local_player_team_side_name = local_player_team_side:name()
	local widget = self._widgets_by_name.score
	local content = widget.content

	content.is_hero = local_player_team_side_name == "heroes"
	content.team_1_score = local_player_team_score
	content.team_2_score = opponent_team_score
end

VersusTabUI._get_teams_ui_settings = function (self, local_player_party_id, opponent_party_id)
	local local_player_team_name_key = Managers.state.game_mode:setting("party_names_lookup_by_id")[local_player_party_id]
	local opponent_team_name_key = Managers.state.game_mode:setting("party_names_lookup_by_id")[opponent_party_id]
	local dlc_settings = DLCSettings.carousel
	local local_team_ui_settings = dlc_settings.teams_ui_assets[local_player_team_name_key]
	local opponent_ui_settings = dlc_settings.teams_ui_assets[opponent_team_name_key]

	return local_team_ui_settings, opponent_ui_settings
end

VersusTabUI._set_level_name = function (self, text)
	local widget = self._widgets_by_name.level_name

	widget.content.text = text
end

VersusTabUI._set_sub_title = function (self, text)
	local widget = self._widgets_by_name.sub_title

	widget.content.text = text
end

VersusTabUI.input_service = function (self)
	local input_manager = self._input_manager

	return input_manager:get_service("player_list_input")
end

VersusTabUI.is_focused = function (self)
	return self._active and self.cursor_active
end

VersusTabUI.is_active = function (self)
	return self._active
end

VersusTabUI.set_active = function (self, active)
	local chat_gui = Managers.chat.chat_gui

	if active then
		local anim_params = {
			render_settings = self._render_settings,
		}

		self._ui_animator:start_animation("on_enter", self._widgets_by_name, scenegraph_definition, anim_params)
		Managers.input:enable_gamepad_cursor()
		self:_create_player_slots()
	else
		chat_gui:hide_chat()
		Managers.input:disable_gamepad_cursor()
	end

	self._active = active

	if active then
		self._fade_in_duration = 0
	end

	self:_deactivate_cursor()
end

VersusTabUI._deactivate_cursor = function (self)
	if self.cursor_active then
		ShowCursorStack.hide("VersusSlotStatusUI")

		local input_manager = self._input_manager

		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")

		self.cursor_active = false
		self._widgets_by_name.input_description_text.content.visible = true
	end
end

VersusTabUI._activate_cursor = function (self)
	if not self.cursor_active then
		ShowCursorStack.show("VersusSlotStatusUI")

		local input_manager = self._input_manager

		input_manager:block_device_except_service("player_list_input", "keyboard")
		input_manager:block_device_except_service("player_list_input", "mouse")
		input_manager:block_device_except_service("player_list_input", "gamepad")

		self.cursor_active = true
		self._widgets_by_name.input_description_text.content.visible = false
	end
end

VersusTabUI._handle_input = function (self, dt)
	local input_manager = self._input_manager
	local in_fade_active = Managers.transition:in_fade_active()
	local input_service = input_manager:get_service("player_list_input")

	if not in_fade_active and (input_service:get("ingame_player_list_exit") or input_service:get("ingame_player_list_toggle") or input_service:get("back")) and self._active and self.cursor_active then
		self:set_active(false)
	elseif not self.cursor_active then
		if not in_fade_active and input_service:get("ingame_player_list_toggle") then
			if not self._active then
				self:set_active(true)

				if not self.cursor_active then
					self:_activate_cursor()
				end
			end
		elseif input_service:get("ingame_player_list_pressed") then
			if not self._active then
				self:set_active(true)
			end
		elseif self._active and not input_service:get("ingame_player_list_held") then
			self:set_active(false)
		end
	end

	if self._active and input_service:get("activate_ingame_player_list") then
		self:_activate_cursor()
	end
end

VersusTabUI._create_player_slots = function (self)
	local ui_scenegraph = self._ui_scenegraph
	local index = 1
	local custom_game_slots = {}

	for i = 1, NUM_MAX_TEAMS do
		local team_slots = {}

		custom_game_slots[i] = team_slots

		for j = 1, NUM_TEAMS_SIZE do
			local slot_data = {}

			team_slots[j] = slot_data

			local player_panel_scenegraph_id = "team_" .. i .. "_player_panel_" .. j
			local talent_tooltip_scenegraph_id = "talent_tooltip"
			local player_panel_scenegraph = ui_scenegraph[player_panel_scenegraph_id]

			if player_panel_scenegraph then
				local size = ui_scenegraph[player_panel_scenegraph_id].size
				local widget_definition = UIWidgets.create_player_panel(player_panel_scenegraph_id, talent_tooltip_scenegraph_id, index, size)
				local widget = UIWidget.init(widget_definition)
				local team_color = i == 1 and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255)

				self:_apply_color_values(widget.style.background.color, team_color)

				local empty_widget_def = create_empty_frame_widget(player_panel_scenegraph_id)
				local empty_widget = UIWidget.init(empty_widget_def)

				slot_data.panel_widget = widget
				slot_data.empty_widget = empty_widget
				index = index + 1
			end
		end
	end

	self._custom_game_slots = custom_game_slots
end

VersusTabUI._setup_custom_settings = function (self)
	local custom_game_settings_handler = Managers.mechanism:game_mechanism():get_custom_game_settings_handler()
	local settings_templates = custom_game_settings_handler and custom_game_settings_handler:get_settings_template()
	local settings = custom_game_settings_handler:get_settings()
	local settings_template = settings_templates
	local settings_ui_data = DLCSettings.carousel.custom_game_ui_settings
	local settings_widgets, settings_widgets_by_name = {}, {}
	local settings_spacing = 34

	for id, value in ipairs(settings) do
		local data = settings_template[id]
		local setting_name = data.setting_name
		local values = data.values
		local ui_data = settings_ui_data[setting_name]
		local start_idx = data.values_reverse_lookup[value]
		local default_value = data.default
		local default_idx = data.values_reverse_lookup[default_value]
		local widget_def = definitions.create_settings_widget("settings_anchor", data, ui_data, value, start_idx, id)
		local widget = UIWidget.init(widget_def)

		widget.offset = {
			20,
			-settings_spacing * id,
			1,
		}
		widget.content.default_value = default_value
		widget.content.default_idx = default_idx
		settings_widgets[#settings_widgets + 1] = widget
		settings_widgets_by_name[setting_name] = widget
	end

	self._settings_widgets = settings_widgets
	self._settings_widgets_by_name = settings_widgets_by_name

	local num_settings = #settings

	self:_setup_custom_settings_scrollbar(num_settings, settings_spacing)

	self._num_settings = num_settings
	self._settings = settings
end

VersusTabUI._update_custom_lobby_slots = function (self)
	local party_manager = Managers.party
	local player_manager = Managers.player
	local pre_game_logic = self._pre_game_logic
	local players = player_manager:human_and_bot_players()
	local custom_game_slots = self._custom_game_slots

	if not custom_game_slots then
		return
	end

	self._item_tooltip.content.item = nil

	local local_player_team_slots = custom_game_slots[1]

	self:_update_party_slots_data(self._party_id, local_player_team_slots, 1, party_manager, player_manager, pre_game_logic, players)

	local opponent_team_slots = custom_game_slots[2]
	local opponent_party_id = self:_get_opponent_party_id()

	self:_update_party_slots_data(opponent_party_id, opponent_team_slots, 2, party_manager, player_manager, pre_game_logic, players)
	self:_update_players_panel_button_widgets()
	self:_handle_players_panel_button_input()
end

VersusTabUI._update_party_slots_data = function (self, party_id, team_slots, team, party_manager, player_manager, pre_game_logic, players)
	local party = party_manager:get_party(party_id)
	local game_session = Managers.state.network:game()

	if party then
		local side = Managers.state.side.side_by_party[party]
		local is_dark_pact = side and side:name() == "dark_pact"
		local slots = party.slots

		for j = 1, #team_slots do
			local player_slot = team_slots[j]
			local status = slots[j]
			local slot_changed = false
			local slot_filled = false
			local panel_widget = player_slot.panel_widget
			local panel_content = panel_widget.content
			local panel_style = panel_widget.style
			local empty_widget = player_slot.empty_widget
			local empty_content = empty_widget.content

			if player_slot.unique_id ~= status.unique_id then
				player_slot.unique_id = status.unique_id
				slot_changed = true
			end

			local peer_id, local_player_id = status.peer_id, status.local_player_id
			local player
			local is_player = false
			local ready = false
			local is_in_local_player_party = self._party_id == status.party_id
			local profile_index, career_index

			if peer_id and local_player_id then
				profile_index = status.profile_index
				career_index = status.career_index
				player = status.player
				is_player = status.is_player
				slot_filled = true
			end

			if player_slot.ready ~= ready then
				player_slot.ready = ready
				panel_content.ready = ready
			end

			local profile_updated = false

			if player_slot.profile_index ~= profile_index or player_slot.career_index ~= career_index or slot_changed then
				player_slot.profile_index = profile_index
				player_slot.career_index = career_index
				profile_updated = true
			end

			local is_wounded, is_knocked_down, needs_help, is_dead
			local is_local_player = false
			local is_bot = true
			local unique_id = player and player:unique_id()
			local player_exists = player and players[unique_id]

			if player_exists then
				if profile_updated then
					local is_player_controlled = player:is_player_controlled()
					local player_portrait_frame = CosmeticUtils.get_cosmetic_slot(player, "slot_frame")
					local player_portrait_frame_name = player_portrait_frame and player_portrait_frame.item_name or "default"
					local level_text = player and (is_player_controlled and ExperienceSettings.get_player_level(player) or UISettings.bots_level_display_text)
					local portrait_texture = self:_get_hero_portrait(profile_index, career_index)
					local player_frame_scenegraph_id = "team_" .. team .. "_player_frame_" .. j
					local portrait_widget = self:_create_portrait_frame(player_frame_scenegraph_id, player_portrait_frame_name, level_text, portrait_texture)

					player_slot.portrait_widget = portrait_widget

					if is_player_controlled then
						local player_insignia_scenegraph_id = "team_" .. team .. "_player_insignia_" .. j
						local versus_level = ExperienceSettings.get_versus_player_level(player) or 0
						local insignia_widget_def = UIWidgets.create_small_insignia(player_insignia_scenegraph_id, versus_level)
						local insignia_widget = UIWidget.init(insignia_widget_def)

						player_slot.insignia_widget = insignia_widget
					end
				end

				is_local_player = player.local_player
				is_bot = not player:is_player_controlled()

				local player_name = player:name()
				local career_name = (not is_dark_pact or is_in_local_player_party) and player:career_name() or "vs_lobby_dark_pact_team_name"

				if player_slot.player_name ~= player_name then
					player_slot.player_name = player_name
					panel_content.name = player_name
				end

				if career_name and player_slot.career_name ~= career_name then
					player_slot.career_name = career_name
					panel_content.hero = career_name
				end

				local player_unit = player.player_unit

				if ALIVE[player_unit] then
					if not is_dark_pact then
						local player_loadouts = Managers.player:player_loadouts()
						local loadout = player_loadouts[unique_id]

						if loadout then
							self:_update_player_item_slots(loadout, panel_widget)
						end

						self:_update_player_talents(player_unit, player, panel_widget)
					end

					is_wounded, is_knocked_down, needs_help, is_dead = self:_update_player_health(player_unit, panel_widget)
				else
					is_dead = true
				end

				self:_update_player_status_portrait(player_slot, profile_index, career_index, is_dark_pact, is_in_local_player_party, is_wounded, is_knocked_down, needs_help, is_dead)

				if is_dark_pact and panel_content.respawning and is_in_local_player_party then
					self:_update_player_respawn_counter(player_slot)
				end

				self:_update_player_talents_tooltip(panel_widget)

				local game_object_id = player.game_object_id
				local ping = game_object_id and GameSession.game_object_field(game_session, game_object_id, "ping") or math.huge
				local ping_texture, ping_color = self:_get_ping_texture_by_ping_value(ping)

				panel_content.ping_texture = ping_texture
				panel_content.ping_text = ping

				local ping_style = panel_widget.style.ping_text

				ping_style.text_color = ping_style[ping_color]
			end

			panel_content.empty = not slot_filled
			empty_content.empty = not slot_filled
			panel_content.visible = player_exists
			panel_content.is_local_player = not is_dark_pact and player ~= nil
			panel_content.is_dark_pact = is_dark_pact
			panel_content.is_build_visible = true
			panel_content.is_in_local_player_party = is_in_local_player_party
			panel_content.is_wounded = is_wounded
			panel_content.is_knocked_down = is_knocked_down
			panel_content.needs_help = needs_help
			panel_content.is_dead = is_dead
			player_slot.empty = not slot_filled
			player_slot.is_player = is_player
			player_slot.peer_id = peer_id
			player_slot.is_dark_pact = is_dark_pact
			player_slot.is_local_player = is_local_player
			player_slot.is_bot = is_bot
		end
	end
end

VersusTabUI._set_player_custom_panel_loadout_icon = function (self, widget, item_name, slot_name)
	local content = widget.content
	local style = widget.style

	if item_name then
		local item = {
			data = ItemMasterList[item_name],
		}
		local inventory_icon, _, _ = UIUtils.get_ui_information_from_item(item)

		content[slot_name] = inventory_icon
		content[slot_name .. "_item_name"] = item_name
	else
		content[slot_name .. "_item_name"] = nil
	end
end

VersusTabUI._button_pressed = function (self, button_hotspot)
	if button_hotspot.on_release then
		button_hotspot.on_release = false

		return true
	end

	return false
end

VersusTabUI._get_hero_portrait = function (self, profile_index, career_index)
	local default_portrait = "eor_empty_player"

	if profile_index == nil or career_index == nil then
		return default_portrait
	end

	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local portrait_texture = career.portrait_image

	return portrait_texture or default_portrait
end

VersusTabUI._create_portrait_frame = function (self, scenegraph_id, frame_settings_name, level_text, portrait_texture, optional_scale)
	local scale = optional_scale or 1
	local retained_mode = false
	local widget_definition = UIWidgets.create_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	local widget = UIWidget.init(widget_definition, self._ui_top_renderer)
	local widget_content = widget.content

	widget_content.frame_settings_name = frame_settings_name
	widget_content.level_text = level_text

	return widget
end

VersusTabUI._apply_color_values = function (self, target, source, include_alpha)
	if include_alpha then
		target[1] = source[1]
	end

	target[2] = source[2]
	target[3] = source[3]
	target[4] = source[4]
end

VersusTabUI._show_profile_by_peer_id = function (self, peer_id)
	if IS_WINDOWS and rawget(_G, "Steam") then
		local id = Steam.id_hex_to_dec(peer_id)
		local url = "http://steamcommunity.com/profiles/" .. id

		Steam.open_url(url)
	elseif IS_XB1 then
		local xuid = self.network_lobby.lobby:xuid(peer_id)

		if xuid then
			XboxLive.show_gamercard(Managers.account:user_id(), xuid)
		end
	elseif IS_PS4 then
		Managers.account:show_player_profile_with_account_id(peer_id)
	end
end

VersusTabUI._muted_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			return Managers.voice_chat:is_peer_muted(peer_id)
		else
			return false
		end
	else
		return self._voip:peer_muted(peer_id)
	end
end

VersusTabUI._ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:mute_peer(peer_id)
		end
	else
		self._voip:mute_member(peer_id)
	end
end

VersusTabUI._remove_ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:unmute_peer(peer_id)
		end
	else
		self._voip:unmute_member(peer_id)
	end
end

VersusTabUI._ignoring_chat_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		return chat_gui:ignoring_peer_id(peer_id)
	elseif IS_XB1 then
		return Managers.chat:ignoring_peer_id(peer_id)
	end
end

VersusTabUI._ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:ignore_peer_id(peer_id)
	end
end

VersusTabUI._can_host_solo_kick = function (self)
	return self._is_server and Managers.player:num_human_players() == 2
end

VersusTabUI._can_kick_player = function (self, peer_id)
	local is_in_local_player_party = self:_is_in_local_player_party(peer_id)

	if peer_id and is_in_local_player_party then
		temp_vote_data.kick_peer_id = peer_id

		local is_leader = Managers.party:is_leader(peer_id)
		local player_available = Managers.state.voting:can_start_vote("kick_player", temp_vote_data)

		if player_available and peer_id ~= Network.peer_id() and not is_leader and Managers.player:num_human_players() > 2 then
			return true
		end
	end

	return false
end

VersusTabUI._kick_player_attempt = function (self, peer_id)
	if self:_can_kick_player(peer_id) then
		local vote_data = {
			kick_peer_id = peer_id,
		}

		Managers.state.voting:request_vote("kick_player", vote_data, Network.peer_id())
		self:set_active(false)
	end
end

VersusTabUI._update_players_panel_button_widgets = function (self)
	local vote_manager = Managers.state.voting
	local vote_kick_enabled = vote_manager:vote_kick_enabled()
	local custom_game_slots = self._custom_game_slots

	if custom_game_slots then
		for i = 1, #custom_game_slots do
			local team_slots = custom_game_slots[i]

			for j = 1, #team_slots do
				local player_slot = team_slots[j]
				local widget = player_slot.panel_widget
				local widget_content = widget.content
				local style = widget.style
				local empty = player_slot.empty
				local is_player = player_slot.is_player
				local peer_id = player_slot.peer_id
				local is_local_player = player_slot.is_local_player
				local is_bot = player_slot.is_bot
				local can_kick_player = vote_kick_enabled and self:_can_kick_player(peer_id)

				if not empty and is_player then
					if is_local_player or is_bot then
						widget_content.show_chat_button = false
						widget_content.show_kick_button = false
						widget_content.show_voice_button = false
						widget_content.show_profile_button = is_local_player and not is_bot
						widget_content.show_ping = not is_local_player and not is_bot
						widget_content.chat_button_hotspot.disable_button = true
						widget_content.kick_button_hotspot.disable_button = true
						widget_content.voice_button_hotspot.disable_button = true
						widget_content.profile_button_hotspot.disable_button = is_bot
					else
						if can_kick_player then
							widget_content.show_kick_button = true
							widget_content.kick_button_hotspot.disable_button = false
						else
							widget_content.show_kick_button = false
							widget_content.kick_button_hotspot.disable_button = true
						end

						widget_content.show_profile_button = true
						widget_content.show_chat_button = not IS_PS4
						widget_content.show_voice_button = true
						widget_content.show_ping = true
						widget_content.profile_button_hotspot.disable_button = false
						widget_content.chat_button_hotspot.disable_button = IS_PS4
						widget_content.voice_button_hotspot.disable_button = false
						widget_content.chat_button_hotspot.is_selected = self:_ignoring_chat_peer_id(peer_id)
						widget_content.voice_button_hotspot.is_selected = self:_muted_peer_id(peer_id)
					end
				end
			end
		end
	end
end

VersusTabUI._handle_players_panel_button_input = function (self)
	local custom_game_slots = self._custom_game_slots

	if custom_game_slots then
		for i = 1, #custom_game_slots do
			local team_slots = custom_game_slots[i]

			for j = 1, #team_slots do
				local player_slot = team_slots[j]
				local widget = player_slot.panel_widget
				local widget_content = widget.content
				local style = widget.style
				local empty = player_slot.empty
				local is_player = player_slot.is_player
				local peer_id = player_slot.peer_id
				local is_local_player = player_slot.is_local_player
				local is_bot = player_slot.is_bot

				if not empty then
					if is_player then
						if not is_bot then
							local profile_button_hotspot = widget_content.profile_button_hotspot

							if profile_button_hotspot.on_pressed then
								profile_button_hotspot.on_pressed = nil

								self:_show_profile_by_peer_id(peer_id)
							end
						end

						if not is_local_player then
							local chat_button_hotspot = widget_content.chat_button_hotspot

							if chat_button_hotspot.on_pressed then
								chat_button_hotspot.on_pressed = nil

								if chat_button_hotspot.is_selected then
									self:_remove_ignore_chat_message_from_peer_id(peer_id)

									chat_button_hotspot.is_selected = nil
								else
									self:_ignore_chat_message_from_peer_id(peer_id)

									chat_button_hotspot.is_selected = true
								end
							end

							local voice_button_hotspot = widget_content.voice_button_hotspot

							if voice_button_hotspot.on_pressed then
								voice_button_hotspot.on_pressed = nil

								if voice_button_hotspot.is_selected then
									self:_remove_ignore_voice_message_from_peer_id(peer_id)

									voice_button_hotspot.is_selected = nil
								else
									self:_ignore_voice_message_from_peer_id(peer_id)

									voice_button_hotspot.is_selected = true
								end
							end

							local kick_button_hotspot = widget_content.kick_button_hotspot

							if kick_button_hotspot.on_pressed then
								kick_button_hotspot.on_pressed = nil

								self:_kick_player_attempt(peer_id)
							end
						end
					end

					for k = 1, #allowed_loadout_slots do
						local slot_name = allowed_loadout_slots[k]

						if UIUtils.is_button_hover(widget, slot_name .. "_hotspot") then
							local item_name = widget.content[slot_name .. "_item_name"]

							self:_update_item_slots_tooltip(item_name, widget)
						end
					end
				end
			end
		end
	end
end

VersusTabUI._update_player_item_slots = function (self, loadout, widget)
	for i = 1, #allowed_loadout_slots do
		local slot_name = allowed_loadout_slots[i]
		local item = loadout[slot_name]
		local item_data = item.data
		local item_name = item_data.name

		if widget.content[slot_name .. "_item_name"] ~= item_name then
			self:_set_player_custom_panel_loadout_icon(widget, item_name, slot_name)
		end
	end
end

local ITEM_TOOLTIP_RENDER_SETTINGS = {
	alpha_multiplier = 0,
}

VersusTabUI._update_item_slots_tooltip = function (self, item_name, panle_widget)
	local ui_scenegraph = self._ui_scenegraph
	local ui_renderer = self._ui_top_renderer
	local widget = self._item_tooltip
	local widget_style = widget.style
	local widget_content = widget.content
	local item = {
		data = ItemMasterList[item_name],
	}

	widget_content.item = item

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, FAKE_INPUT_SERVICE, 0, nil, ITEM_TOOLTIP_RENDER_SETTINGS)
	UIRenderer.draw_widget(ui_renderer, widget)
	UIRenderer.end_pass(ui_renderer)

	local item_tooltip_node = ui_scenegraph.item_tooltip
	local item_presentation_height = widget_style.item.item_presentation_height - 100
	local max_height = 1080 - item_presentation_height
	local parent_scenegraph_node = ui_scenegraph[panle_widget.scenegraph_id]
	local parent_offset = parent_scenegraph_node.position
	local left_aligned = parent_scenegraph_node.horizontal_alignment == "left"

	if left_aligned then
		item_tooltip_node.horizontal_alignment = "left"
		item_tooltip_node.local_position[1] = 20 + parent_scenegraph_node.size[1] + 50
		item_tooltip_node.local_position[2] = math.min(parent_offset[2] + item_presentation_height, max_height) + 50
	else
		item_tooltip_node.horizontal_alignment = "right"
		item_tooltip_node.local_position[1] = -20 - parent_scenegraph_node.size[1] - 50
		item_tooltip_node.local_position[2] = math.min(parent_offset[2] + item_presentation_height, max_height) + 50
	end
end

VersusTabUI._update_player_talents = function (self, player_unit, player, widget)
	local panel_content = widget.content
	local talent_extension = ScriptUnit.has_extension(player_unit, "talent_system")

	if talent_extension then
		local talent_ids = talent_extension:get_talent_ids()
		local profile_name = player:profile_display_name()

		for i = 1, 6 do
			local id = talent_ids[i]
			local talent = TalentUtils.get_talent_by_id(profile_name, id)
			local talent_icon = talent and talent.icon
			local talent_content = panel_content["talent_" .. i]

			if not talent_icon then
				talent = nil
			end

			talent_content.talent = talent
			talent_content.icon = talent_icon or "icons_placeholder"
		end
	end
end

VersusTabUI._update_player_talents_tooltip = function (self, widget)
	local panel_content = widget.content

	for i = 1, 6 do
		local talent_content = panel_content["talent_" .. i]

		if talent_content.talent and talent_content.is_hover then
			local parent_scenegraph_id = widget.scenegraph_id
			local parent_scenegraph_node = self._ui_scenegraph[parent_scenegraph_id]
			local parent_offset = parent_scenegraph_node.position
			local left_aligned = parent_scenegraph_node.horizontal_alignment == "left"
			local talent_tooltip_node = self._ui_scenegraph.talent_tooltip

			if left_aligned then
				talent_tooltip_node.horizontal_alignment = "left"
				talent_tooltip_node.local_position[1] = 20 + parent_scenegraph_node.size[1] + 50
				talent_tooltip_node.local_position[2] = parent_scenegraph_node.position[2] + 50
			else
				talent_tooltip_node.horizontal_alignment = "right"
				talent_tooltip_node.local_position[1] = -20 - parent_scenegraph_node.size[1] - 50
				talent_tooltip_node.local_position[2] = parent_scenegraph_node.position[2] + 50
			end
		end
	end
end

VersusTabUI._update_player_health = function (self, player_unit, widget)
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local go_id = Managers.state.unit_storage:go_id(player_unit)
	local health_extension = ScriptUnit.extension(player_unit, "health_system")
	local status_extension = ScriptUnit.extension(player_unit, "status_system")
	local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local max_health = health_extension:get_max_health()
	local is_dead = status_extension:is_dead()
	local total_health = is_dead and 0 or health_extension:current_health()
	local total_health_percent = is_dead and 0 or health_extension:current_health_percent()
	local health_percent = is_dead and 0 or health_extension:current_permanent_health_percent()
	local is_wounded = status_extension:is_wounded()
	local is_knocked_down = (status_extension:is_knocked_down() or status_extension:get_is_ledge_hanging()) and total_health_percent > 0
	local is_ready_for_assisted_respawn = status_extension:is_ready_for_assisted_respawn()
	local needs_help = status_extension:is_grabbed_by_pack_master() or status_extension:is_hanging_from_hook() or status_extension:is_pounced_down() or status_extension:is_grabbed_by_corruptor() or status_extension:is_in_vortex() or status_extension:is_grabbed_by_chaos_spawn()
	local num_grimoires = buff_extension:num_buff_perk("skaven_grimoire")
	local multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF, "curse_protection")
	local num_twitch_grimoires = buff_extension:num_buff_perk("twitch_grimoire")
	local twitch_multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF, "curse_protection")
	local num_slayer_curses = buff_extension:num_buff_perk("slayer_curse")
	local slayer_curse_multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.SLAYER_CURSE_HEALTH_DEBUFF, "curse_protection")
	local num_mutator_curses = buff_extension:num_buff_perk("mutator_curse")
	local curse_settings_value = WindSettings.light.curse_settings.value
	local value = Managers.state.difficulty:get_difficulty_value_from_table(curse_settings_value)
	local mutator_curse_multiplier = buff_extension:apply_buffs_to_value(value, "curse_protection")
	local cursed_health = buff_extension:apply_buffs_to_value(0, "health_curse")

	cursed_health = buff_extension:apply_buffs_to_value(cursed_health, "curse_protection")

	local active_percentage = 1 + num_grimoires * multiplier + num_twitch_grimoires * twitch_multiplier + num_slayer_curses * slayer_curse_multiplier + num_mutator_curses * mutator_curse_multiplier + cursed_health
	local style = widget.style
	local content = widget.content
	local health_bar_style = style.health_bar
	local total_health_bar_style = style.total_health_bar
	local ability_bar_content = content.ability_bar

	if game and go_id then
		local ability_cooldown_percentage = GameSession.game_object_field(game, go_id, "ability_percentage") or 0

		ability_bar_content.bar_value = 1 - ability_cooldown_percentage
	end

	health_bar_style.gradient_threshold = health_percent * active_percentage
	total_health_bar_style.gradient_threshold = total_health_percent * active_percentage

	return is_wounded, is_knocked_down, needs_help, is_dead
end

VersusTabUI._is_in_local_player_party = function (self, peer_id)
	local local_player_party = Managers.party:get_local_player_party()

	if local_player_party then
		local occupied_slots = local_player_party.occupied_slots

		for i = 1, #occupied_slots do
			local slot = occupied_slots[i]
			local slot_peer_id = slot.peer_id

			if peer_id == slot_peer_id then
				return true
			end
		end
	end

	return false
end

VersusTabUI._get_opponent_party_id = function (self)
	return self._party_id == 1 and 2 or 1
end

VersusTabUI._remove_ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:remove_ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:remove_ignore_peer_id(peer_id)
	end
end

VersusTabUI.add_respawn_counter_event = function (self, player, is_local_player, spawn_timer, show_selection_ui)
	local peer_id = player.peer_id
	local player_slot = self:_get_player_slot_by_peer_id(peer_id)

	if player_slot and spawn_timer > 0 then
		local widget = player_slot.panel_widget
		local content = widget.content

		content.respawning = true
		content.spawn_timer = spawn_timer
	end
end

VersusTabUI._update_player_respawn_counter = function (self, player_slot)
	local portrait_frame_widget = player_slot.portrait_widget

	if not portrait_frame_widget then
		return
	end

	local panel_widget = player_slot.panel_widget

	if panel_widget.content.respawning then
		local t, dt = Managers.time:time_and_delta("game")
		local respawn_time = panel_widget.content.spawn_timer - t

		if respawn_time <= 0 then
			panel_widget.content.respawning = false
		end

		panel_widget.content.respawn_text = string.format("%d", math.abs(respawn_time))
	end

	portrait_frame_widget.style.portrait.saturated = panel_widget.content.respawning
end

VersusTabUI._update_player_status_portrait = function (self, player_slot, profile_index, career_index, is_dark_pact, is_in_local_player_party, is_wounded, is_knocked_down, needs_help, is_dead)
	local portrait_frame_widget = player_slot.portrait_widget

	if not portrait_frame_widget then
		return
	end

	local panel_widget = player_slot.panel_widget
	local player_card_content = panel_widget.content

	if is_dark_pact and not is_in_local_player_party then
		portrait_frame_widget.content.portrait = "eor_empty_player"
		portrait_frame_widget.style.portrait.color[1] = 255
	elseif player_card_content.is_wounded ~= is_wounded or player_card_content.is_knocked_down ~= is_knocked_down or player_card_content.needs_help ~= needs_help or player_card_content.is_dead ~= is_dead then
		local style = panel_widget.style

		if is_knocked_down or needs_help then
			portrait_frame_widget.content.portrait = "status_icon_needs_assist"
			portrait_frame_widget.style.portrait.color[1] = 150
		elseif is_dead and not player_card_content.respawning then
			portrait_frame_widget.content.portrait = "status_icon_dead"
			portrait_frame_widget.style.portrait.color[1] = 255
		else
			local portrait_texture = self:_get_hero_portrait(profile_index, career_index)

			portrait_frame_widget.content.portrait = portrait_texture
			portrait_frame_widget.style.portrait.color[1] = 255
		end
	end
end

VersusTabUI._get_player_slot_by_peer_id = function (self, peer_id)
	local custom_game_slots = self._custom_game_slots

	if custom_game_slots then
		for i = 1, #custom_game_slots do
			local team_slots = custom_game_slots[i]

			for j = 1, #team_slots do
				local player_slot = team_slots[j]

				if player_slot.peer_id == peer_id then
					return player_slot
				end
			end
		end
	end
end

VersusTabUI._get_ping_texture_by_ping_value = function (self, ping_value)
	if ping_value <= 125 then
		return "ping_icon_01", "low_ping_color"
	elseif ping_value > 125 and ping_value <= 175 then
		return "ping_icon_02", "medium_ping_color"
	elseif ping_value > 175 then
		return "ping_icon_03", "high_ping_color"
	end
end

VersusTabUI._update_objectives = function (self, dt, t)
	if not self._objective_system:is_active() then
		return
	end

	if not self._objectives_initialized then
		local is_hero = not self:_is_dark_pact()

		self:_set_active_scoring_side_color(is_hero)

		local num_main_objectives = self._objective_system:num_main_objectives()

		self._num_main_objective = num_main_objectives
		self._objectives_initialized = true
	end

	local current_objective_index = self._objective_system:current_objective_index()
	local num_completed_main_objectives = self._objective_system:num_completed_main_objectives()

	if current_objective_index > self._selected_objective_index then
		self._selected_objective_index = current_objective_index

		self:_update_current_objective(current_objective_index)

		local description = "n/a"

		if self:_is_dark_pact() then
			description = Localize("level_objective_pactsworn")
		else
			description = self._objective_system:first_active_objective_description()
		end

		self:_set_objective_text(description)
	end

	self:_update_objective_progress()
end

VersusTabUI._update_current_objective = function (self)
	local objective_widget = self._widgets_by_name.score
	local objective_icon = self._objective_system:current_objective_icon()

	objective_widget.content.objective_icon = objective_icon
end

VersusTabUI._update_objective_progress = function (self)
	local progress = self._objective_system:current_objective_progress() or 0
	local starting_degrees = 0
	local degrees = 360 - starting_degrees * 2
	local alpha = 255 * math.min(progress * 2, 1)
	local current_degrees = starting_degrees + degrees * progress
	local degrees_progress = current_degrees / 360
	local widgets_by_name = self._widgets_by_name
	local objective_widget = widgets_by_name.score

	objective_widget.style.progress_bar.gradient_threshold = degrees_progress

	if progress == 1 then
		return true
	end
end

VersusTabUI._update_round_start_timer = function (self, dt, t)
	if self._round_has_started then
		return
	end

	if self._countdown_timer and self._countdown_timer <= 0 then
		self:_on_round_started()
	end
end

VersusTabUI._set_pre_round_timer = function (self, time_left)
	local widget = self._widgets_by_name.score

	widget.content.pre_round_timer = time_left
	self._countdown_timer = time_left
end

VersusTabUI._set_round_starting_text = function (self)
	local widget = self._widgets_by_name.round_starting_text

	widget.content.text = "Round Starting..."
end

VersusTabUI._set_objective_text = function (self, text)
	local widget = self._widgets_by_name.objective_text
	local content = widget.content
	local style = widget.style

	content.area_text_content = text
end

VersusTabUI._register_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "add_respawn_counter_event", "add_respawn_counter_event")
		event_manager:register(self, "ui_tab_update_start_round_counter", "update_start_round_counter")
		event_manager:register(self, "ui_tab_round_started", "round_started")
	end
end

VersusTabUI._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("add_respawn_counter_event", self)
		event_manager:unregister("ui_tab_update_start_round_counter", self)
		event_manager:unregister("ui_tab_round_started", self)
	end
end

VersusTabUI.update_start_round_counter = function (self, time_left)
	self:_set_pre_round_timer(time_left)
end

VersusTabUI._on_round_started = function (self)
	self._round_has_started = true

	local objective_widget = self._widgets_by_name.score
	local var_1_0 = objective_widget.content

	if self._custom_round_timer_active then
		-- Nothing
	end

	var_1_0.pre_round_timer_done = true
end

VersusTabUI.round_started = function (self)
	self:_on_round_started()
end

VersusTabUI._set_active_scoring_side_color = function (self, is_hero)
	local active_side_color = is_hero and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
	local objective_widget = self._widgets_by_name.score

	objective_widget.content.is_hero = is_hero
	objective_widget.style.progress_bar.color = active_side_color
	objective_widget.style.objective_icon.color = active_side_color
end

VersusTabUI._is_dark_pact = function (self)
	local party_id = self._party_id
	local party_manager = Managers.party
	local party = party_manager:get_party(party_id)
	local side = Managers.state.side.side_by_party[party]
	local is_dark_pact = side and side:name() == "dark_pact"

	return is_dark_pact
end

VersusTabUI._get_current_set = function (self)
	local rounds_played = self._win_conditions:get_current_round()

	return math.round(rounds_played / 2)
end

VersusTabUI._setup_custom_settings_scrollbar = function (self, num_settings, spacing)
	local settings_total_size = num_settings * spacing
	local excess_area = settings_total_size - definitions.scenegraph_definition.settings_container.size[2]

	if excess_area > 0 then
		local ui_scenegraph = self._ui_scenegraph
		local scroll_area_scenegraph_id = "settings_anchor"
		local scroll_area_anchor_scenegraph_id = "settings_container"
		local enable_auto_scroll = false
		local optional_scroll_area_hotspot_widget, horizontal_scrollbar

		self._scrollbar_ui = ScrollbarUI:new(ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, excess_area, enable_auto_scroll, optional_scroll_area_hotspot_widget, horizontal_scrollbar)
	end
end
