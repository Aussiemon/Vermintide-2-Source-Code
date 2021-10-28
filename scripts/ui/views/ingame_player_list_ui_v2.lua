require("scripts/ui/views/character_inspect_ui")

local definitions = local_require("scripts/ui/views/ingame_player_list_ui_v2_definitions")
local console_cursor_definition = definitions.console_cursor_definition
local PLAYER_LIST_SIZE = definitions.PLAYER_LIST_SIZE
local PLAYER_NAME_MAX_LENGTH = 16
local temp_vote_data = {}
local mission_settings = {
	{
		texture = "loot_objective_icon_02",
		mission_name = "tome_bonus_mission",
		key = "tome",
		widget_name = "tome_counter",
		title_text = "dlc1_3_1_tomes"
	},
	{
		texture = "loot_objective_icon_01",
		mission_name = "grimoire_hidden_mission",
		key = "grimoire",
		widget_name = "grimoire_counter",
		title_text = "dlc1_3_1_grimoires"
	},
	{
		texture = "loot_mutator_icon_05",
		mission_name = "bonus_dice_hidden_mission",
		key = "loot_die",
		widget_name = "loot_dice",
		title_text = "interaction_loot_dice"
	}
}
IngamePlayerListUI = class(IngamePlayerListUI)

IngamePlayerListUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._wwise_world = ingame_ui_context.dialogue_system.wwise_world
	self._input_manager = ingame_ui_context.input_manager
	self._player_manager = ingame_ui_context.player_manager
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer
	self._is_in_inn = ingame_ui_context.is_in_inn
	self._voip = ingame_ui_context.voip
	self._is_server = ingame_ui_context.is_server
	self._network_server = ingame_ui_context.network_server
	self._network_lobby = ingame_ui_context.network_lobby
	self._local_player = self._player_manager:local_player()
	self._map_save_data = PlayerData.map_view_data or {}
	self._platform = PLATFORM
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true
	}
	self._active = false
	self._client_duplicate_removed = false
	local mission_system = Managers.state.entity:system("mission_system")
	self._mission_system = mission_system
	local input_manager = self._input_manager

	input_manager:create_input_service("player_list_input", "IngamePlayerListKeymaps", "IngamePlayerListFilters")
	input_manager:map_device_to_service("player_list_input", "keyboard")
	input_manager:map_device_to_service("player_list_input", "mouse")
	input_manager:map_device_to_service("player_list_input", "gamepad")
	self:_create_ui_elements()

	local gamemode_settings = Managers.state.game_mode:settings()
	local private_only = gamemode_settings.private_only
	self._private_setting_enabled = not private_only and not self._is_in_inn and self._local_player.is_server and self._platform ~= "xb1"
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local server_peer_id = network_transmit.server_peer_id
	self._host_peer_id = server_peer_id or network_transmit.peer_id
	self._show_difficulty = not gamemode_settings.hide_difficulty

	if not self._show_difficulty then
		self:_set_difficulty_name("")
	end

	self:_setup_weave_display_info()
	Managers.state.event:register(self, "weave_objective_synced", "event_weave_objective_synced")
end

IngamePlayerListUI._create_ui_elements = function (self)
	self._num_players = 0
	self._num_rewards = 0
	self._mission_count = 0
	self._num_mutators = 0
	self._players = {}
	self._current_difficulty_name = nil
	self._reward_widgets = {}
	local scenegraph_definition = definitions.scenegraph_definition
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local static_widget_definitions = definitions.static_widget_definitions
	local static_widgets = {}
	local static_widgets_by_name = {}

	for name, defintion in pairs(static_widget_definitions) do
		local widget = UIWidget.init(defintion)
		static_widgets[#static_widgets + 1] = widget
		static_widgets_by_name[name] = widget
	end

	self._static_widgets = static_widgets
	self._static_widgets_by_name = static_widgets_by_name
	local widget_definitions = definitions.widget_definitions
	local widgets = {}
	local widgets_by_name = {}

	for name, defintion in pairs(widget_definitions) do
		local widget = UIWidget.init(defintion)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local mutator_summary1_widget = widgets_by_name.mutator_summary1
	mutator_summary1_widget.content.item = {
		mutators = {}
	}
	local mutator_summary2_widget = widgets_by_name.mutator_summary2
	mutator_summary2_widget.content.item = {
		mutators = {}
	}
	local mutator_summary3_widget = widgets_by_name.mutator_summary3
	mutator_summary3_widget.content.item = {
		mutators = {}
	}
	local specific_widget_definitions = definitions.specific_widget_definitions
	self._input_description_text_widget = UIWidget.init(specific_widget_definitions.input_description_text)
	self._reward_header_widget = UIWidget.init(specific_widget_definitions.reward_header)
	self._reward_divider_widget = UIWidget.init(specific_widget_definitions.reward_divider)
	self._collectibles_name = UIWidget.init(specific_widget_definitions.collectibles_name)
	self._collectibles_divider = UIWidget.init(specific_widget_definitions.collectibles_divider)
	self._level_description_widget = UIWidget.init(specific_widget_definitions.level_description)
	self._private_checkbox_widget = UIWidget.init(specific_widget_definitions.private_checkbox)
	self._node_info_widget = nil
	local twitch_connection = Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated())

	if Managers.state.game_mode:game_mode_key() == "weave" or twitch_connection then
		local content = self._private_checkbox_widget.content
		content.is_disabled = true
	end

	local player_list_widgets = {}

	for i = 1, 8, 1 do
		player_list_widgets[i] = UIWidget.init(definitions.player_widget_definition(i))
	end

	self._player_list_widgets = player_list_widgets
	self._popup_list = UIWidget.init(definitions.popup_widget_definition)
	self._console_cursor = UIWidget.init(console_cursor_definition)
	self._item_tooltip = UIWidget.init(definitions.item_tooltip)
	local level_key = Managers.level_transition_handler:get_current_level_keys()
	local level_settings = LevelSettings[level_key]

	self:_set_level_name(Localize(level_settings.display_name))
	self:_setup_mission_data(level_settings)

	if level_settings.description_text then
		self._level_description_widget.content.text = Localize(level_settings.description_text)
	end
end

local MUTATORS_PER_COLUMN = 1
local MUTATOR_ROWS = 3
local MAX_MUTATORS = MUTATORS_PER_COLUMN * MUTATOR_ROWS

IngamePlayerListUI._setup_mutator_data = function (self, mutators)
	local widgets_by_name = self._widgets_by_name
	local mutator_summary_widget1 = widgets_by_name.mutator_summary1
	local mutator_storage1 = mutator_summary_widget1.content.item.mutators

	table.clear(mutator_storage1)

	local mutator_summary_widget2 = widgets_by_name.mutator_summary2
	local mutator_storage2 = mutator_summary_widget2.content.item.mutators

	table.clear(mutator_storage2)

	local mutator_summary_widget3 = widgets_by_name.mutator_summary3
	local mutator_storage3 = mutator_summary_widget3.content.item.mutators

	table.clear(mutator_storage3)

	local mutator_storage = {
		mutator_storage1,
		mutator_storage2,
		mutator_storage3
	}

	if mutators then
		local num_mutators = 0
		local current_mutator_index = 1

		for name, mutator_settings in pairs(mutators) do
			if not mutator_settings.activated_by_twitch and not MutatorTemplates[name].hide_from_player_ui then
				local row = 1 + math.floor((current_mutator_index - 1) / MUTATORS_PER_COLUMN) % MUTATOR_ROWS

				if MAX_MUTATORS < current_mutator_index then
					break
				end

				local storage = mutator_storage[row]
				storage[#storage + 1] = name
				current_mutator_index = current_mutator_index + 1
				num_mutators = num_mutators + 1
			end
		end

		self._num_mutators = num_mutators
	end
end

IngamePlayerListUI._setup_chaos_wastes_info = function (self)
	local game_mode_key = Managers.state.game_mode:game_mode_key()

	if game_mode_key ~= "deus" then
		return
	end

	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism:get_deus_run_controller()
	local current_node = deus_run_controller:get_current_node()
	local theme = current_node.theme
	local minor_modifier_group = current_node.minor_modifier_group
	local terror_event_power_up = current_node.terror_event_power_up
	local director_name = current_node.conflict_settings
	local profile_index, career_index = self._profile_synchronizer:profile_by_peer(Network.peer_id(), 1)
	local widget = UIWidget.init(definitions.create_node_info_widget())
	widget.content.visible = true
	local content_node_info = widget.content.node_info
	local level_key = Managers.level_transition_handler:get_current_level_keys()
	local level_settings = LevelSettings[level_key]

	if not theme or theme == "wastes" then
		content_node_info.curse_text = ""
	else
		content_node_info.curse_text = Localize("deus_map_node_info_god_" .. theme)
		content_node_info.curse_icon = "deus_icons_map_" .. theme
		widget.style.node_info.curse_section.curse_icon.color = Colors.get_color_table_with_alpha(theme, 255)
		widget.style.node_info.curse_section.curse_text.text_color = Colors.get_color_table_with_alpha(theme, 255)
	end

	if minor_modifier_group then
		content_node_info.minor_modifier_1_section.text = (minor_modifier_group[1] and Localize("mutator_" .. minor_modifier_group[1] .. "_name")) or ""
		content_node_info.minor_modifier_2_section.text = (minor_modifier_group[2] and Localize("mutator_" .. minor_modifier_group[2] .. "_name")) or ""
		content_node_info.minor_modifier_3_section.text = (minor_modifier_group[3] and Localize("mutator_" .. minor_modifier_group[3] .. "_name")) or ""
	else
		content_node_info.minor_modifier_1_section.text = ""
		content_node_info.minor_modifier_2_section.text = ""
		content_node_info.minor_modifier_3_section.text = ""
	end

	if terror_event_power_up then
		local power_up = DeusPowerUpTemplates[terror_event_power_up]
		local power_up_text_name = DeusPowerUpUtils.get_power_up_name_text(terror_event_power_up, power_up.talent_index, power_up.talent_tier, profile_index, career_index)
		local suffix = Localize("terror_event_power_up_prefix_suffix")
		local terror_event_power_up_text = string.format(suffix, power_up_text_name)
		widget.content.node_info.terror_event_power_up_text = terror_event_power_up_text
		widget.content.node_info.terror_event_power_up_icon = power_up.icon
	else
		content_node_info.terror_event_power_up_text = ""
	end

	local conflict_director = ConflictDirectors[director_name]
	local conflict_director_description = conflict_director and conflict_director.description

	if conflict_director_description then
		content_node_info.breed_text = Localize(conflict_director_description) or ""
	else
		content_node_info.breed_text = ""
	end

	self._node_info_widget = widget
end

IngamePlayerListUI._setup_deed_reward_data = function (self, deed_reward_data)
	local deed_reward_data = Managers.deed:rewards()

	if not deed_reward_data then
		return
	end

	local item_width = 60
	local spacing = 20
	local offset = 0

	table.clear(self._reward_widgets)

	for i = 1, #deed_reward_data, 1 do
		local reward_name = deed_reward_data[i]
		local reward_item = ItemMasterList[reward_name]
		local item = {
			data = reward_item
		}
		local widget = UIWidget.init(definitions.create_reward_item(offset, item))
		self._reward_widgets[#self._reward_widgets + 1] = widget
		offset = offset + item_width + spacing
	end

	local num_rewards = #deed_reward_data
	local offset = ((num_rewards - 1) * item_width + spacing * (num_rewards - 1)) * -0.5
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph.reward_item.offset[1] = offset
	self._num_rewards = num_rewards
end

IngamePlayerListUI._setup_mission_data = function (self, level_settings)
	local loot_objectives = level_settings.loot_objectives

	if not loot_objectives then
		return
	end

	local ui_renderer = self._ui_renderer
	local create_loot_widget = definitions.create_loot_widget
	local widgets = self._widgets
	local widgets_by_name = self._widgets_by_name
	local settings_data = {}
	local entries_per_row = 2
	local longest_row_text = 0
	local offset_x = 0
	local row = 0
	local column = 0
	local mission_count = 0

	for _, setting in ipairs(mission_settings) do
		local key = setting.key
		local total_amount = loot_objectives[key]

		if total_amount then
			local mission_name = setting.mission_name
			local widget_name = setting.widget_name
			local texture = setting.texture
			local title_text = Localize(setting.title_text)
			local widget_definition = create_loot_widget(texture, title_text)
			local widget = UIWidget.init(widget_definition)
			local data = {
				name = key,
				total_amount = total_amount > 0 and total_amount,
				mission_name = mission_name,
				widget = widget
			}
			local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
			local texture_size = texture_settings.size
			local text_style = widget.style.text
			local text_width = UIUtils.get_text_width(ui_renderer, text_style, title_text) + 20

			if longest_row_text < text_width then
				longest_row_text = text_width
			end

			local row = math.floor(mission_count / entries_per_row)
			column = mission_count % entries_per_row

			if column > 0 then
				offset_x = offset_x + texture_size[1] + longest_row_text
				longest_row_text = 0
			else
				offset_x = 0
			end

			local offset = widget.offset
			offset[1] = offset_x
			offset[2] = -(row - 1) * texture_size[2]
			settings_data[key] = data
			widgets_by_name[widget_name] = widget
			widgets[#widgets + 1] = widget
			mission_count = mission_count + 1
		end
	end

	if mission_count > 0 then
		self._mission_settings_data = settings_data

		self:_sync_missions()
	end

	self._mission_count = mission_count
end

IngamePlayerListUI._sync_missions = function (self)
	local mission_settings_data = self._mission_settings_data

	if not mission_settings_data then
		return
	end

	for _, data in pairs(mission_settings_data) do
		local mission_name = data.mission_name
		local amount = self:_get_item_amount_by_mission_name(mission_name) or 0
		local current_amount = data.amount
		local total_amount = data.total_amount
		local widget = data.widget

		if current_amount ~= amount then
			data.previous_amount = current_amount or 0
			data.amount = amount
			local content = widget.content
			content.amount = amount

			if total_amount then
				content.counter_text = tostring(amount) .. "/" .. tostring(total_amount)
			else
				content.counter_text = "x" .. tostring(amount)
			end
		end
	end
end

IngamePlayerListUI._get_item_amount_by_mission_name = function (self, mission_name)
	local mission_system = self._mission_system
	local data = mission_system:get_level_end_mission_data(mission_name)
	local current_amount = data and data.current_amount

	return current_amount
end

IngamePlayerListUI._create_player_portrait = function (self, portrait_frame, portrait_image, player_level_text)
	local definition = UIWidgets.create_portrait_frame("player_portrait", portrait_frame, player_level_text, 1, nil, portrait_image)
	local widget = UIWidget.init(definition)
	self._player_portrait_widget = widget
end

IngamePlayerListUI._setup_weave_display_info = function (self)
	if Managers.state.game_mode:game_mode_key() == "weave" then
		local lobby = Managers.state.network:lobby()
		local quick_game = lobby and lobby:lobby_data("quick_game")
		local weave_manager = Managers.weave

		if weave_manager then
			local weave_template = weave_manager:get_active_weave_template()

			if weave_template then
				local weave_display_name = nil

				if quick_game == "true" then
					weave_display_name = Localize(weave_template.display_name)
				else
					weave_display_name = weave_template.tier .. ". " .. Localize(weave_template.display_name)
				end

				local wind = weave_template.wind
				local wind_settings = WindSettings[wind]
				local wind_display_name = wind_settings.display_name

				self:_set_level_name(weave_display_name)
				self:_set_difficulty_name(Localize(wind_display_name))
				self:_setup_weave_objectives(weave_template)
			else
				self:_set_level_name("")
				self:_set_difficulty_name("")
			end
		end
	end
end

IngamePlayerListUI._setup_weave_objectives = function (self, weave_template)
	self._weave_objective_widgets = {}
	self._weave_objective_widgets_by_name = {}

	for name, widget_definition in pairs(definitions.weave_objective_widgets) do
		local widget = UIWidget.init(widget_definition)
		self._weave_objective_widgets[#self._weave_objective_widgets + 1] = widget
		self._weave_objective_widgets_by_name[name] = widget
	end

	local objective_spacing = 10
	local total_objectives_height = 0
	local scenegraph_definition = definitions.scenegraph_definition
	local scenegraph_id = "weave_sub_objective"
	local objective_size = scenegraph_definition[scenegraph_id].size
	local objectives = weave_template.objectives

	for i = 1, #objectives, 1 do
		local widget_definition = definitions.create_weave_sub_objective_widget(scenegraph_id, objective_size)
		local widget = UIWidget.init(widget_definition)
		self._weave_objective_widgets[#self._weave_objective_widgets + 1] = widget
		self._weave_objective_widgets_by_name["weave_sub_objective_" .. i] = widget
		local objective = objectives[i]
		local conflict_settings = objective.conflict_settings
		local is_end_objective = conflict_settings == "weave_disabled"
		local title_text = (is_end_objective and "menu_weave_play_next_end_event_title") or "menu_weave_play_main_objective_title"
		local objective_display_name = objective.display_name
		local objective_icon = (is_end_objective and "objective_icon_boss") or "objective_icon_general"
		local objective_height = self:_assign_objective(widget, title_text, objective_display_name, objective_icon, objective_spacing)
		local offset = widget.offset
		offset[2] = -total_objectives_height
		total_objectives_height = total_objectives_height + objective_height + objective_spacing
	end
end

IngamePlayerListUI._assign_objective = function (self, widget, title_text, text, icon, spacing)
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local scenegraph_definition = definitions.scenegraph_definition
	local size = scenegraph_definition[scenegraph_id].size
	content.icon = icon or "trial_gem"
	content.title_text = title_text or "-"
	content.text = text or "-"
	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(content.icon)
	local icon_texture_size = icon_texture_settings.size
	local icon_style = style.icon
	local icon_size = icon_style.texture_size
	local icon_default_offset = icon_style.default_offset
	local icon_offset = icon_style.offset
	icon_size[1] = icon_texture_size[1]
	icon_size[2] = icon_texture_size[2]
	icon_offset[1] = icon_default_offset[1] - icon_size[1] / 2
	icon_offset[2] = icon_default_offset[2]
	local text_style = style.text
	local ui_renderer = self._ui_renderer
	local text_width = UIUtils.get_text_width(ui_renderer, text_style, content.text)
	local text_height = UIUtils.get_text_height(ui_renderer, size, text_style, content.text)
	spacing = spacing or 0
	local total_height = math.max(text_height, 50) + spacing

	return total_height
end

IngamePlayerListUI.destroy = function (self)
	if self._cursor_active then
		ShowCursorStack.pop()

		local input_manager = self._input_manager

		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")

		self._cursor_active = false
	end

	Managers.state.event:unregister("weave_objective_synced", self)
	print("[IngamePlayerListUI] - Destroy")
end

IngamePlayerListUI._set_level_name = function (self, name)
	self:_set_widget_text("game_level", name)
end

IngamePlayerListUI._set_difficulty_name = function (self, name)
	self:_set_widget_text("game_difficulty", name)
end

IngamePlayerListUI._set_widget_text = function (self, widget_name, text)
	local widget = self._widgets_by_name[widget_name]
	widget.content.text = text
end

IngamePlayerListUI._set_simple_widget_texture = function (self, widget_name, texture)
	local widget = self._widgets_by_name[widget_name]
	widget.content.texture_id = texture
end

IngamePlayerListUI._add_player = function (self, player)
	local is_local_player = player.local_player
	local is_bot_player = player.bot_player or not player:is_player_controlled()
	local ui_id = player:ui_id()
	local player_level = ExperienceSettings.get_player_level(player)
	local peer_id = player:network_id()
	local is_player_server = self._host_peer_id == peer_id
	local player_data = {
		unit_spawned = false,
		is_local_player = is_local_player,
		is_bot_player = is_bot_player,
		peer_id = peer_id,
		ui_id = ui_id,
		local_player_id = player:local_player_id(),
		player = player,
		player_name = player:name(),
		level = player_level or "n/a",
		resync_player_level = not player_level,
		is_server = is_player_server,
		unit_equipment = {}
	}
	self._num_players = self._num_players + 1
	self._players[self._num_players] = player_data
	local server_player_data = nil
	local remote_player_data = {}
	local bot_player_data = {}
	local sorted_player_data = {}

	for _, player_data in pairs(self._players) do
		if player_data.is_server and not player_data.is_bot_player then
			server_player_data = player_data
		elseif player_data.is_bot_player then
			bot_player_data[#bot_player_data + 1] = player_data
		else
			remote_player_data[#remote_player_data + 1] = player_data
		end
	end

	local function sort_remote_players(a, b)
		return b.peer_id < a.peer_id
	end

	table.sort(remote_player_data, sort_remote_players)

	local function sort_bots(a, b)
		return b.local_player_id < a.local_player_id
	end

	table.sort(bot_player_data, sort_bots)

	sorted_player_data[#sorted_player_data + 1] = server_player_data

	table.append(sorted_player_data, remote_player_data)
	table.append(sorted_player_data, bot_player_data)

	self._players = sorted_player_data
end

IngamePlayerListUI._update_widgets = function (self)
	local players = self._players
	local num_players = self._num_players
	local vote_manager = Managers.state.voting
	local vote_kick_enabled = vote_manager:vote_kick_enabled()
	local leader = Managers.party:leader()

	for i = 1, num_players, 1 do
		local player_data = players[i]
		local peer_id = player_data.peer_id
		local is_local_player = player_data.is_local_player
		local is_bot_player = player_data.is_bot_player
		local is_leader = peer_id == leader and not is_bot_player
		local is_server = player_data.is_server
		local can_vote_kick = vote_kick_enabled and self:kick_player_available(player_data)
		local can_kick_player = not is_leader and not is_server and (can_vote_kick or self:_can_host_solo_kick())
		local widget = self._player_list_widgets[i]
		local widget_content = widget.content
		widget_content.show_host = is_leader
		widget_content.is_local_player = is_local_player
		widget_content.is_bot_player = is_bot_player

		if is_local_player or is_bot_player then
			widget_content.show_chat_button = false
			widget_content.show_kick_button = false
			widget_content.show_voice_button = false
			widget_content.show_profile_button = is_local_player and not is_bot_player
			widget_content.show_ping = not is_server and not is_bot_player
			widget_content.chat_button_hotspot.disable_button = true
			widget_content.kick_button_hotspot.disable_button = true
			widget_content.voice_button_hotspot.disable_button = true
			widget_content.profile_button_hotspot.disable_button = is_bot_player
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
			widget_content.show_ping = not is_server
			widget_content.profile_button_hotspot.disable_button = false
			widget_content.chat_button_hotspot.disable_button = IS_PS4
			widget_content.voice_button_hotspot.disable_button = false
			widget_content.chat_button_hotspot.is_selected = self:_ignoring_chat_peer_id(peer_id)
			widget_content.voice_button_hotspot.is_selected = self:_muted_peer_id(peer_id)
		end

		local name = player_data.player_name
		player_data.player_name = (PLAYER_NAME_MAX_LENGTH < UTF8Utils.string_length(name) and UIRenderer.crop_text_width(self._ui_top_renderer, name, 370, widget.style.name)) or name
		player_data.widget = widget
	end
end

local slot_to_block_by_wield_slot = {
	slot_ranged = "slot_melee",
	slot_melee = "slot_ranged"
}

IngamePlayerListUI._update_player_information = function (self, dt, t)
	local profiles = SPProfiles
	local profile_synchronizer = self._profile_synchronizer
	local players = self._players
	local num_players = self._num_players
	local spacing = 20
	local total_spacing = (num_players - 1) * spacing
	local widget_height = PLAYER_LIST_SIZE[2]
	local total_height = widget_height * num_players + total_spacing
	local cosmetic_system = Managers.state.entity:system("cosmetic_system")

	for i = 1, num_players, 1 do
		local player_data = players[i]
		local player = player_data.player
		local widget = player_data.widget
		local offset = widget.offset
		offset[2] = -(widget_height * (i - 1) + spacing * (i - 1))
		local profile_index = player:profile_index()
		local career_index = player:career_index()
		local profile_settings = profiles[profile_index]
		local display_name = (profile_settings and profile_settings.display_name) or "unspawned"
		local ingame_display_name = (profile_settings and profile_settings.ingame_display_name) or "unspawned"
		local style_name = widget.style.name
		widget.content.name = UIRenderer.crop_text_width(self._ui_renderer, player_data.player_name, style_name.size[1], style_name)
		local resync_player_level = player_data.resync_player_level

		if resync_player_level then
			local player_level = ExperienceSettings.get_player_level(player)

			if player_level then
				player_data.level = player_level
				player_data.resync_player_level = nil
			end
		end

		local career_settings = profile_settings and profile_settings.careers[career_index]

		if career_settings then
			local career_name = career_settings.name
			local portrait_image = career_settings.portrait_image
			local player_level_text = (player_data.is_bot_player and "BOT") or (player_data.level and tostring(player_data.level)) or "-"
			local portrait_frame, portrait_frame_name = nil
			local player = player_data.player
			local player_unit = player.player_unit

			if ALIVE[player_unit] and player_data.is_bot_player then
				portrait_frame_name = Managers.state.entity:system("cosmetic_system"):get_equipped_frame(player_unit)
			else
				portrait_frame = CosmeticUtils.get_cosmetic_slot(player, "slot_frame")
			end

			local portrait_frame_name = portrait_frame_name or (portrait_frame and portrait_frame.item_name) or "default"

			if player_data.career_index ~= career_index or display_name ~= player_data.hero_name or player_level_text ~= player_data.player_level_text or portrait_frame ~= player_data.portrait_frame then
				player_data.career_index = career_index
				local portrait_widget = self:_create_portrait_frame_widget(portrait_frame_name, portrait_image, player_level_text)
				local background_color = widget.style.background.color
				local career_color = Colors.color_definitions[career_name]
				background_color[2] = career_color[2]
				background_color[3] = career_color[3]
				background_color[4] = career_color[4]
				player_data.player_level_text = player_level_text
				player_data.portrait_widget = portrait_widget
				player_data.hero_name = display_name

				if player_data.is_local_player then
					player_data.sync_local_player_info = true
				end
			end

			local portrait_widget = player_data.portrait_widget

			if portrait_widget then
				local portrait_offset = portrait_widget.offset
				portrait_offset[2] = offset[2]
			end

			local career_display_name = career_settings.display_name
			widget.content.hero = career_display_name

			if player_data.sync_local_player_info then
				player_data.sync_local_player_info = nil
				local passive_ability_data = career_settings.passive_ability
				local activated_ability_data = career_settings.activated_ability[1]
				local activated_display_name = activated_ability_data.display_name
				local activated_description = activated_ability_data.description
				local activated_icon = activated_ability_data.icon

				self:_set_widget_text("player_ability_name", Localize(activated_display_name))
				self:_set_widget_text("player_ability_description", Localize(activated_description))
				self:_set_simple_widget_texture("player_ability_icon", activated_icon)

				local passive_display_name = passive_ability_data.display_name
				local passive_description = passive_ability_data.description
				local passive_icon = passive_ability_data.icon

				self:_set_widget_text("player_passive_name", Localize(passive_display_name))
				self:_set_widget_text("player_passive_description", Localize(passive_description))
				self:_set_simple_widget_texture("player_passive_icon", passive_icon)
				self:_set_widget_text("player_career_name", Localize(career_display_name))
				self:_create_player_portrait(portrait_frame_name, portrait_image, player_level_text)
				self:_set_widget_text("player_hero_name", Localize(ingame_display_name))
			end
		end
	end

	self:_update_dynamic_widget_information(dt, t)
end

IngamePlayerListUI._create_portrait_frame_widget = function (self, frame_settings_name, portrait_texture, player_level_text)
	local widget_definition = UIWidgets.create_portrait_frame("player_list_portrait", frame_settings_name, player_level_text, 1, nil, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content
	widget_content.frame_settings_name = frame_settings_name

	return widget
end

IngamePlayerListUI._get_ping_texture_by_ping_value = function (self, ping_value)
	if ping_value <= 125 then
		return "ping_icon_01", "low_ping_color"
	elseif ping_value > 125 and ping_value <= 175 then
		return "ping_icon_02", "medium_ping_color"
	elseif ping_value > 175 then
		return "ping_icon_03", "high_ping_color"
	end
end

IngamePlayerListUI._ignoring_chat_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		return chat_gui:ignoring_peer_id(peer_id)
	elseif IS_XB1 then
		return Managers.chat:ignoring_peer_id(peer_id)
	end
end

IngamePlayerListUI._ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:ignore_peer_id(peer_id)
	end
end

IngamePlayerListUI._remove_ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:remove_ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:remove_ignore_peer_id(peer_id)
	end
end

IngamePlayerListUI._muted_peer_id = function (self, peer_id)
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

IngamePlayerListUI._ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:mute_peer(peer_id)
		end
	else
		self._voip:mute_member(peer_id)
	end
end

IngamePlayerListUI._remove_ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:unmute_peer(peer_id)
		end
	else
		self._voip:unmute_member(peer_id)
	end
end

IngamePlayerListUI.post_update = function (self, dt)
	return
end

IngamePlayerListUI.update = function (self, dt, t)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_changed()
	end

	local input_manager = self._input_manager
	local in_fade_active = Managers.transition:in_fade_active()
	local input_service = input_manager:get_service("player_list_input")
	local is_matchmaking = self._is_in_inn and Managers.matchmaking:is_game_matchmaking()

	if not in_fade_active and (input_service:get("ingame_player_list_exit") or input_service:get("ingame_player_list_toggle") or input_service:get("back")) and self._active and self._cursor_active then
		self:_set_active(false)
	elseif not self._cursor_active then
		if not in_fade_active and input_service:get("ingame_player_list_toggle") and not is_matchmaking then
			if not self._active then
				self:_set_active(true)

				if not self._cursor_active then
					ShowCursorStack.push()
					input_manager:block_device_except_service("player_list_input", "keyboard")
					input_manager:block_device_except_service("player_list_input", "mouse")
					input_manager:block_device_except_service("player_list_input", "gamepad")

					self._cursor_active = true
				end
			end
		elseif input_service:get("ingame_player_list_pressed") then
			if not self._active then
				self:_set_active(true)
			end
		elseif self._active and not input_service:get("ingame_player_list_held") then
			self:_set_active(false)
		end
	end

	if self._active then
		if input_service:get("activate_ingame_player_list") and not self._cursor_active then
			ShowCursorStack.push()
			input_manager:block_device_except_service("player_list_input", "keyboard")
			input_manager:block_device_except_service("player_list_input", "mouse")
			input_manager:block_device_except_service("player_list_input", "gamepad")

			self._cursor_active = true
		end

		self:_update_player_list(dt, t)

		if self._show_difficulty then
			self:_update_difficulty()
		end

		local private_checkbox_content = self._private_checkbox_widget.content

		if self._local_player.is_server and not self._is_in_inn and not private_checkbox_content.is_disabled then
			local private_checkbox_hotspot = private_checkbox_content.button_hotspot

			if private_checkbox_hotspot.on_hover_enter then
				WwiseWorld.trigger_event(self._wwise_world, "Play_hud_hover")
			end

			if self._private_setting_enabled and private_checkbox_hotspot.on_release then
				local is_private = Managers.matchmaking:is_game_private()
				local map_save_data = self._map_save_data
				map_save_data.private_enabled = not is_private

				WwiseWorld.trigger_event(self._wwise_world, "Play_hud_select")
				self:_set_privacy_enabled(map_save_data.private_enabled, true)

				PlayerData.map_view_data = map_save_data

				Managers.save:auto_save(SaveFileName, SaveData, callback(self, "on_save_ended_callback"))

				local matchmaking_manager = Managers.matchmaking

				matchmaking_manager:set_in_progress_game_privacy(map_save_data.private_enabled)
			end
		end

		self:_sync_missions()
		self:_update_fade_in_duration(dt)
		self:_draw(dt)
	end
end

IngamePlayerListUI._on_resolution_changed = function (self)
	local banner_right_edge = self._static_widgets_by_name.banner_right_edge
	local banner_left_edge = self._static_widgets_by_name.banner_left_edge
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	banner_right_edge.style.edge.texture_size[2] = inverse_scale * RESOLUTION_LOOKUP.res_h
	banner_left_edge.style.edge.texture_size[2] = inverse_scale * RESOLUTION_LOOKUP.res_h
end

IngamePlayerListUI._set_privacy_enabled = function (self, enabled, animate)
	local text = "map_screen_private_button"
	local widget = self._private_checkbox_widget
	widget.content.checked = enabled
	widget.content.setting_text = text

	if animate then
		self._private_timer = 0
	end
end

IngamePlayerListUI.on_save_ended_callback = function (self)
	print("[IngamePlayerWiew] - settings saved")
end

IngamePlayerListUI.is_active = function (self)
	return self._active
end

IngamePlayerListUI.is_focused = function (self)
	return self._active and self._cursor_active
end

IngamePlayerListUI.input_service = function (self)
	local input_manager = self._input_manager

	return input_manager:get_service("player_list_input")
end

IngamePlayerListUI.set_visible = function (self, visible)
	if self._active and not visible then
		self:_set_active(false)
	end
end

IngamePlayerListUI._set_active = function (self, active)
	local chat_gui = Managers.chat.chat_gui

	if active then
		self:_on_resolution_changed()

		if self._local_player.is_server and not self._is_in_inn then
			local is_private = Managers.matchmaking:is_game_private()

			self:_set_privacy_enabled(is_private)
		end

		local matchmaking_type_lookup = {
			deus = "area_selection_morris_name",
			deed = "start_game_window_mutator_title",
			tutorial = "lb_game_type_prologue",
			event = "start_game_window_event_title",
			["n/a"] = "lb_game_type_none",
			custom = "lb_game_type_custom"
		}
		local mechanism_name = Managers.mechanism:current_mechanism_name()
		local matchmaking_type = Managers.matchmaking:active_game_mode()
		local quick_game = Managers.matchmaking:is_quick_game()
		local mechanism_type_widget = self._static_widgets_by_name.mechanism_type_name
		local mission_type_widget = self._static_widgets_by_name.mission_type_name

		if mechanism_name == "weave" then
			if quick_game == "true" then
				matchmaking_type = "lb_game_type_weave_quick_play"
			else
				matchmaking_type = "lb_game_type_custom"
			end

			mechanism_type_widget.content.text = string.upper(Localize("lb_game_type_weave"))
			mission_type_widget.content.text = Localize(matchmaking_type)
		else
			local mechanism_settings = MechanismSettings[mechanism_name]
			mechanism_type_widget.content.text = string.upper(Localize(mechanism_settings.display_name))

			if quick_game == "true" then
				mission_type_widget.content.text = Localize("lb_game_type_quick_play")
			else
				mission_type_widget.content.text = Localize(matchmaking_type_lookup[matchmaking_type] or matchmaking_type_lookup["n/a"])
			end
		end

		local game_mode_manager = Managers.state.game_mode
		local activated_mutators = game_mode_manager:activated_mutators()

		self:_setup_mutator_data(activated_mutators)
		self:_setup_deed_reward_data()
		self:_setup_chaos_wastes_info()
		Managers.input:enable_gamepad_cursor()
	else
		chat_gui:hide_chat()
		Managers.input:disable_gamepad_cursor()
	end

	self._active = active

	if active then
		self._fade_in_duration = 0
	end

	if self._cursor_active then
		ShowCursorStack.pop()

		local input_manager = self._input_manager

		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")

		self._cursor_active = false
	end

	Managers.state.event:trigger("ingame_player_list_enabled", active)
end

IngamePlayerListUI._update_fade_in_duration = function (self, dt)
	local fade_in_duration = self._fade_in_duration

	if not fade_in_duration then
		return
	end

	fade_in_duration = fade_in_duration + dt
	local progress = math.min(fade_in_duration / 0.2, 1)
	local anim_progress = math.easeOutCubic(progress)
	local render_settings = self._render_settings
	local ui_scenegraph = self._ui_scenegraph
	render_settings.alpha_multiplier = progress
	ui_scenegraph.player_list.local_position[1] = -800 * (1 - anim_progress)
	ui_scenegraph.banner_left.local_position[1] = -800 * (1 - anim_progress)
	ui_scenegraph.banner_right.local_position[1] = 800 * (1 - anim_progress)

	if progress == 1 then
		self._fade_in_duration = nil
	else
		self._fade_in_duration = fade_in_duration
	end
end

local temp_players = {}

IngamePlayerListUI._update_player_list = function (self, dt, t)
	local game_session = Managers.state.network:game()
	local player_manager = self._player_manager

	table.clear(temp_players)

	local update_widgets = false
	local players = self._players
	local num_players = self._num_players
	local removed_players = 0

	for i = num_players, 1, -1 do
		local data = players[i]
		local peer_id = data.peer_id
		local ui_id = data.ui_id
		local player = player_manager:player_from_peer_id(peer_id, data.local_player_id)
		local has_client_duplicate, duplicate_index = self:_has_client_duplicate(players, peer_id)

		if not player or has_client_duplicate or temp_players[ui_id] then
			if duplicate_index then
				table.remove(players, duplicate_index)

				self._client_duplicate_removed = true
			else
				table.remove(players, i)
			end

			update_widgets = true
			removed_players = removed_players + 1
		else
			local is_local_player = data.is_local_player
			local is_bot_player = data.is_bot_player
			local is_server = data.is_server
			local widget = data.widget
			local game_object_id = player.game_object_id
			temp_players[ui_id] = true

			if not is_server and not is_bot_player and game_session and game_object_id then
				local ping = GameSession.game_object_field(game_session, game_object_id, "ping")
				local ping_texture, ping_color = self:_get_ping_texture_by_ping_value(ping)
				widget.content.ping_texture = ping_texture
				widget.content.ping_text = ping
				local ping_style = widget.style.ping_text
				ping_style.text_color = ping_style[ping_color]
			end

			if not is_bot_player then
				local profile_button_hotspot = widget.content.profile_button_hotspot

				if profile_button_hotspot.on_pressed then
					profile_button_hotspot.on_pressed = nil

					self:_show_profile_by_peer_id(peer_id)
				end
			end

			if not is_local_player then
				local chat_button_hotspot = widget.content.chat_button_hotspot

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

				local voice_button_hotspot = widget.content.voice_button_hotspot

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

				local kick_button_hotspot = widget.content.kick_button_hotspot

				if not is_server and kick_button_hotspot.on_pressed then
					kick_button_hotspot.on_pressed = nil

					self:kick_player(data.player)
				end
			end
		end
	end

	self._num_players = num_players - removed_players
	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local game_mode_settings = GameModeSettings[game_mode_key]
	local human_and_bot_players = Managers.player:human_and_bot_players()

	for _, player in pairs(human_and_bot_players) do
		local player_unit = player.player_unit
		local add_player_allowed = game_mode_settings.allow_unspawned_players_in_tab_menu or ALIVE[player_unit]

		if add_player_allowed and not temp_players[player:ui_id()] then
			self:_add_player(player)

			update_widgets = true
		end
	end

	if update_widgets then
		self:_update_widgets()
	end

	self:_update_player_information(dt, t)
end

local EMPTY_TABLE = {}

IngamePlayerListUI._update_dynamic_widget_information = function (self, dt, t)
	local network_manager = Managers.state.network
	local game = network_manager:game()
	self._item_tooltip.content.item = nil
	local players_data = self._players
	local profile_synchronizer = self._profile_synchronizer
	local profiles = SPProfiles
	local ui_scenegraph = self._ui_scenegraph
	local player_loadouts = Managers.player:player_loadouts()

	for i, player_data in ipairs(players_data) do
		local player = player_data.player
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local go_id = Managers.state.unit_storage:go_id(player_unit)
			local health_extension = ScriptUnit.extension(player_unit, "health_system")
			local status_extension = ScriptUnit.extension(player_unit, "status_system")
			local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local max_health = health_extension:get_max_health()
			local total_health = (status_extension:is_dead() and 0) or health_extension:current_health()
			local total_health_percent = (status_extension:is_dead() and 0) or health_extension:current_health_percent()
			local health_percent = (status_extension:is_dead() and 0) or health_extension:current_permanent_health_percent()
			local is_wounded = status_extension:is_wounded()
			local is_knocked_down = (status_extension:is_knocked_down() or status_extension:get_is_ledge_hanging()) and total_health_percent > 0
			local is_ready_for_assisted_respawn = status_extension:is_ready_for_assisted_respawn()
			local needs_help = status_extension:is_grabbed_by_pack_master() or status_extension:is_hanging_from_hook() or status_extension:is_pounced_down() or status_extension:is_grabbed_by_corruptor() or status_extension:is_in_vortex() or status_extension:is_grabbed_by_chaos_spawn()
			local num_grimoires = buff_extension:num_buff_perk("skaven_grimoire")
			local multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF, "curse_protection")
			local num_twitch_grimoires = buff_extension:num_buff_perk("twitch_grimoire")
			local twitch_multiplier = PlayerUnitDamageSettings.GRIMOIRE_HEALTH_DEBUFF
			local num_slayer_curses = buff_extension:num_buff_perk("slayer_curse")
			local slayer_curse_multiplier = buff_extension:apply_buffs_to_value(PlayerUnitDamageSettings.SLAYER_CURSE_HEALTH_DEBUFF, "curse_protection")
			local num_mutator_curses = buff_extension:num_buff_perk("mutator_curse")
			local curse_settings_value = WindSettings.light.curse_settings.value
			local value = Managers.state.difficulty:get_difficulty_value_from_table(curse_settings_value)
			local mutator_curse_multiplier = buff_extension:apply_buffs_to_value(value, "curse_protection")
			local cursed_health = buff_extension:apply_buffs_to_value(0, "health_curse")
			local active_percentage = 1 + num_grimoires * multiplier + num_twitch_grimoires * twitch_multiplier + num_slayer_curses * slayer_curse_multiplier + num_mutator_curses * mutator_curse_multiplier + cursed_health
			local widget = self._player_list_widgets[i]
			local style = widget.style
			local content = widget.content
			local health_bar_style = style.health_bar
			local total_health_bar_style = style.total_health_bar
			local grimoire_bar_style = style.grimoire_bar
			local grimoire_debuff_divider_style = style.grimoire_debuff_divider
			local ability_bar_content = content.ability_bar

			if GameSettingsDevelopment.show_ingame_player_list_talents then
				local talent_interface = Managers.backend:get_talents_interface()
				local profile_name = player:profile_display_name()
				local career_name = player:career_name()
				local talent_ids = talent_interface:get_talent_ids(career_name)
				local profile_talents = Talents[profile_name]

				for i = 1, 6, 1 do
					local id = talent_ids[i]
					local talent = profile_talents[id]
					local talent_content = content["talent_" .. i]
					talent_content.talent = talent
					talent_content.icon = talent and talent.icon
				end
			end

			if game and go_id then
				local ability_cooldown_percentage = GameSession.game_object_field(game, go_id, "ability_percentage") or 0
				ability_bar_content.bar_value = 1 - ability_cooldown_percentage
			end

			health_bar_style.gradient_threshold = health_percent * active_percentage
			total_health_bar_style.gradient_threshold = total_health_percent * active_percentage
			grimoire_bar_style.grimoire_debuff = 1 - active_percentage
			grimoire_debuff_divider_style.grimoire_debuff = 1 - active_percentage
			local unique_id = player:unique_id()
			local profile_index, career_index = profile_synchronizer:profile_by_peer(player_data.peer_id, player_data.local_player_id)
			local profile_settings = profiles[profile_index]
			local loadout = player_loadouts[unique_id] or EMPTY_TABLE
			local equipment = inventory_extension:equipment()

			for slot_name, item in pairs(loadout) do
				local rarity = item.rarity or (item.data and item.data.rarity) or "plentiful"
				local inventory_icon, _, _ = UIUtils.get_ui_information_from_item(item)
				content[slot_name] = inventory_icon
				content[slot_name .. "_rarity_texture"] = UISettings.item_rarity_textures[rarity]

				if UIUtils.is_button_hover(widget, slot_name .. "_hotspot") then
					self:_update_item_tooltip_widget(item, widget.offset)
				end
			end
		end
	end
end

local ITEM_TOOLTIP_RENDER_SETTINGS = {
	alpha_multiplier = 0
}

IngamePlayerListUI._update_item_tooltip_widget = function (self, item, offset)
	local ui_scenegraph = self._ui_scenegraph
	local ui_renderer = self._ui_renderer
	local widget = self._item_tooltip
	local widget_style = widget.style
	local widget_content = widget.content
	widget_content.item = item

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, FAKE_INPUT_SERVICE, 0, nil, ITEM_TOOLTIP_RENDER_SETTINGS)
	UIRenderer.draw_widget(ui_renderer, widget)
	UIRenderer.end_pass(ui_renderer)

	local item_presentation_height = widget_style.item.item_presentation_height - 100
	local max_height = 1080 - item_presentation_height
	ui_scenegraph.item_tooltip.local_position[2] = math.min(offset[2] + item_presentation_height, max_height)
end

IngamePlayerListUI._update_difficulty = function (self)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local difficulty_name = difficulty_settings.display_name

	if difficulty_name ~= self._current_difficulty_name then
		self:_set_difficulty_name(Localize(difficulty_name))

		self._current_difficulty_name = difficulty_name
	end
end

IngamePlayerListUI._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("player_list_input")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if not gamepad_active and not self._cursor_active then
		UIRenderer.draw_widget(ui_top_renderer, self._input_description_text_widget)
	end

	if self._num_rewards > 0 then
		UIRenderer.draw_widget(ui_top_renderer, self._reward_header_widget)
		UIRenderer.draw_widget(ui_top_renderer, self._reward_divider_widget)
	end

	if self._mission_count > 0 then
		UIRenderer.draw_widget(ui_top_renderer, self._collectibles_name)
		UIRenderer.draw_widget(ui_top_renderer, self._collectibles_divider)
	end

	if self._num_mutators == 0 then
		UIRenderer.draw_widget(ui_top_renderer, self._level_description_widget)
	end

	if self._node_info_widget then
		UIRenderer.draw_widget(ui_top_renderer, self._node_info_widget)
	end

	for _, widget in ipairs(self._reward_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local weave_objective_widgets = self._weave_objective_widgets

	if weave_objective_widgets then
		for i = 1, #weave_objective_widgets, 1 do
			local widget = weave_objective_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	local player_portrait_widget = self._player_portrait_widget

	if player_portrait_widget then
		UIRenderer.draw_widget(ui_top_renderer, player_portrait_widget)
	end

	local static_widgets = self._static_widgets

	if static_widgets then
		for i = 1, #static_widgets, 1 do
			local widget = static_widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	local widgets = self._widgets

	if widgets then
		for i = 1, #widgets, 1 do
			local widget = widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.draw_widget(ui_top_renderer, self._item_tooltip)

	if self._private_setting_enabled then
		UIRenderer.draw_widget(ui_top_renderer, self._private_checkbox_widget)
	end

	if gamepad_active then
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor)
	end

	local players = self._players
	local num_players = self._num_players

	for i = 1, num_players, 1 do
		local player = players[i]
		local widget = player.widget

		UIRenderer.draw_widget(ui_top_renderer, widget)

		local portrait_widget = player.portrait_widget

		if portrait_widget then
			UIRenderer.draw_widget(ui_top_renderer, portrait_widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

IngamePlayerListUI._can_host_solo_kick = function (self)
	return self._is_server and Managers.player:num_human_players() == 2
end

IngamePlayerListUI.kick_player = function (self, player)
	local kick_peer_id = player.peer_id

	if self:_can_host_solo_kick() then
		self._network_server:kick_peer(kick_peer_id)
	else
		local vote_data = {
			kick_peer_id = kick_peer_id
		}

		Managers.state.voting:request_vote("kick_player", vote_data, Network.peer_id())
		self:_set_active(false)
	end
end

IngamePlayerListUI.kick_player_available = function (self, player)
	local peer_id = player.peer_id

	if not peer_id or peer_id == Network.peer_id() then
		return false
	end

	temp_vote_data.kick_peer_id = peer_id

	if not Managers.state.voting:can_start_vote("kick_player", temp_vote_data) then
		return false
	end

	return true
end

IngamePlayerListUI._show_profile_by_peer_id = function (self, peer_id)
	local platform = self._platform

	if IS_WINDOWS and rawget(_G, "Steam") then
		local id = Steam.id_hex_to_dec(peer_id)
		local url = "http://steamcommunity.com/profiles/" .. id

		Steam.open_url(url)
	elseif IS_XB1 then
		local xuid = self._network_lobby.lobby:xuid(peer_id)

		if xuid then
			XboxLive.show_gamercard(Managers.account:user_id(), xuid)
		end
	elseif IS_PS4 then
		Managers.account:show_player_profile_with_account_id(peer_id)
	end
end

IngamePlayerListUI.event_weave_objective_synced = function (self)
	self:_setup_weave_display_info()
end

IngamePlayerListUI._has_client_duplicate = function (self, player_list, peer_id)
	local occurences = 0
	local duplicate_index = 0
	local duplicate_found = false

	if self._client_duplicate_removed then
		return false
	end

	for i = 1, #player_list, 1 do
		local data = player_list[i]

		if not data.is_server and not data.is_bot_player and not duplicate_found then
			if data.peer_id == peer_id then
				occurences = occurences + 1
			end

			if occurences >= 2 then
				duplicate_found = true

				break
			end
		end

		duplicate_index = (occurences < 2 and i) or 1
	end

	if duplicate_found then
		return true, duplicate_index
	else
		return false
	end
end

return
