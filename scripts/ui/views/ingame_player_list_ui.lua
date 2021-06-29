require("scripts/ui/views/character_inspect_ui")

local definitions = local_require("scripts/ui/views/ingame_player_list_ui_definitions")
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
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.wwise_world = ingame_ui_context.dialogue_system.wwise_world
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true
	}
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.voip = ingame_ui_context.voip
	self.map_save_data = PlayerData.map_view_data or {}
	self.platform = PLATFORM
	self.is_server = ingame_ui_context.is_server
	self.network_server = ingame_ui_context.network_server
	self.ingame_ui_context = ingame_ui_context
	self.cleanui = ingame_ui_context.cleanui
	local mission_system = Managers.state.entity:system("mission_system")
	self._mission_system = mission_system
	local input_manager = self.input_manager

	input_manager:create_input_service("player_list_input", "IngamePlayerListKeymaps", "IngamePlayerListFilters")
	input_manager:map_device_to_service("player_list_input", "keyboard")
	input_manager:map_device_to_service("player_list_input", "mouse")
	input_manager:map_device_to_service("player_list_input", "gamepad")

	self.network_lobby = ingame_ui_context.network_lobby
	self.local_player = self.player_manager:local_player()
	self.num_players = 0
	self.players = {}
	self.active = false
	self._client_duplicate_removed = false

	self:create_ui_elements()

	local level_key = Managers.level_transition_handler:get_current_level_keys()
	local level_settings = LevelSettings[level_key]

	self:set_level_name(Localize(level_settings.display_name))
	self:_setup_mission_data(level_settings)

	local gamemode_settings = Managers.state.game_mode:settings()
	local private_only = gamemode_settings.private_only
	self.private_only = private_only
	self.private_setting_enabled = not private_only and not self.is_in_inn and self.local_player.is_server and self.platform ~= "xb1"
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local server_peer_id = network_transmit.server_peer_id
	self.host_peer_id = server_peer_id or network_transmit.peer_id
	self._show_difficulty = not gamemode_settings.hide_difficulty

	if not self._show_difficulty then
		self:set_difficulty_name("")
	end

	self:_setup_weave_display_info()
	Managers.state.event:register(self, "weave_objective_synced", "event_weave_objective_synced")
end

IngamePlayerListUI.create_ui_elements = function (self)
	local scenegraph_definition = definitions.scenegraph_definition
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
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
	local specific_widget_definitions = definitions.specific_widget_definitions
	self.input_description_text_widget = UIWidget.init(specific_widget_definitions.input_description_text)
	self.background = UIWidget.init(specific_widget_definitions.background)
	self.private_checkbox_widget = UIWidget.init(specific_widget_definitions.private_checkbox)
	local twitch_connection = Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated())

	if Managers.state.game_mode:game_mode_key() == "weave" or twitch_connection then
		local content = self.private_checkbox_widget.content
		content.is_disabled = true
	end

	static_widgets_by_name.banner_top_edge.offset[3] = 1
	local banner_bottom_edge = static_widgets_by_name.banner_bottom_edge
	local banner_bottom_edge_scenegraph_id = banner_bottom_edge.scenegraph_id
	banner_bottom_edge.offset[2] = scenegraph_definition[banner_bottom_edge_scenegraph_id].size[2] - 2
	banner_bottom_edge.offset[3] = 1
	local player_list_widgets = {}

	for i = 1, 8, 1 do
		player_list_widgets[i] = UIWidget.init(definitions.player_widget_definition(i))
	end

	self.player_list_widgets = player_list_widgets
	self.popup_list = UIWidget.init(definitions.popup_widget_definition)
	self._console_cursor = UIWidget.init(console_cursor_definition)
end

local MUTATORS_PER_COLUMN = 2
local MAX_MUTATORS = MUTATORS_PER_COLUMN * 2

IngamePlayerListUI._setup_mutator_data = function (self, mutators)
	local widgets_by_name = self._widgets_by_name
	local mutator_summary_widget1 = widgets_by_name.mutator_summary1
	local mutator_storage1 = mutator_summary_widget1.content.item.mutators

	table.clear(mutator_storage1)

	local mutator_summary_widget2 = widgets_by_name.mutator_summary2
	local mutator_storage2 = mutator_summary_widget2.content.item.mutators

	table.clear(mutator_storage2)

	if mutators then
		local current_mutator_index = 1

		for name, _ in pairs(mutators) do
			if not MutatorTemplates[name].hide_from_player_ui then
				if MAX_MUTATORS < current_mutator_index then
					break
				elseif current_mutator_index <= MUTATORS_PER_COLUMN then
					mutator_storage1[#mutator_storage1 + 1] = name
				else
					mutator_storage2[#mutator_storage2 + 1] = name
				end

				current_mutator_index = current_mutator_index + 1
			end
		end
	end
end

IngamePlayerListUI._setup_mission_data = function (self, level_settings)
	local loot_objectives = level_settings.loot_objectives

	if not loot_objectives then
		return
	end

	local ui_renderer = self.ui_renderer
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

			local new_column = (mission_count + 1) % (entries_per_row + 1) == 0

			if new_column then
				column = column + 1
				row = 1
				offset_x = offset_x + texture_size[1] + longest_row_text
				longest_row_text = 0
			else
				row = row + 1
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

				self:set_level_name(weave_display_name)
				self:set_difficulty_name(Localize(wind_display_name))
			else
				self:set_level_name("")
				self:set_difficulty_name("")
			end
		end
	end
end

IngamePlayerListUI.destroy = function (self)
	if self.cursor_active then
		ShowCursorStack.pop()

		local input_manager = self.input_manager

		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")

		self.cursor_active = false
	end

	Managers.state.event:unregister("weave_objective_synced", self)
	print("[IngamePlayerListUI] - Destroy")
end

IngamePlayerListUI.set_level_name = function (self, name)
	self:_set_widget_text("game_level", name)
end

IngamePlayerListUI.set_difficulty_name = function (self, name)
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

IngamePlayerListUI.add_player = function (self, player)
	local is_local_player = player.local_player
	local is_bot_player = player.bot_player or not player:is_player_controlled()
	local ui_id = player:ui_id()
	local player_level = ExperienceSettings.get_player_level(player)
	local peer_id = player:network_id()
	local is_player_server = self.host_peer_id == peer_id
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
	self.num_players = self.num_players + 1
	self.players[self.num_players] = player_data
end

IngamePlayerListUI.select_player = function (self, player_index)
	self.selected_player_index = player_index
	local players = self.players
	local num_players = self.num_players

	for i = 1, num_players, 1 do
		players[i].widget.content.button_hotspot.is_selected = i == player_index
	end
end

IngamePlayerListUI.deselect_player = function (self)
	self.selected_player_index = nil
	local players = self.players
	local num_players = self.num_players

	for i = 1, num_players, 1 do
		local button_hotspot = players[i].widget.content.button_hotspot
		button_hotspot.is_selected = nil
		button_hotspot.is_hover = nil
		button_hotspot.is_clicked = nil
	end
end

IngamePlayerListUI.update_widgets = function (self)
	local players = self.players
	local num_players = self.num_players
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
		local can_kick_player = not is_leader and not is_server and (can_vote_kick or self:can_host_solo_kick())
		local widget = self.player_list_widgets[i]
		local widget_content = widget.content
		widget_content.show_host = is_leader
		widget_content.is_local_player = is_local_player
		widget_content.is_bot_player = is_bot_player

		if is_local_player or is_bot_player then
			widget_content.show_chat_button = false
			widget_content.show_kick_button = false
			widget_content.show_voice_button = false
			widget_content.show_profile_button = false
			widget_content.show_ping = not is_server and not is_bot_player
			widget_content.chat_button_hotspot.disable_button = true
			widget_content.kick_button_hotspot.disable_button = true
			widget_content.voice_button_hotspot.disable_button = true
			widget_content.profile_button_hotspot.disable_button = true
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
			widget_content.chat_button_hotspot.is_selected = self:ignoring_chat_peer_id(peer_id)
			widget_content.voice_button_hotspot.is_selected = self:muted_peer_id(peer_id)
		end

		local name = player_data.player_name
		player_data.player_name = (PLAYER_NAME_MAX_LENGTH < UTF8Utils.string_length(name) and UIRenderer.crop_text_width(self.ui_top_renderer, name, 370, widget.style.name)) or name
		player_data.widget = widget
	end
end

local slot_to_block_by_wield_slot = {
	slot_ranged = "slot_melee",
	slot_melee = "slot_ranged"
}

IngamePlayerListUI._populate_hero_unit_equipment = function (self, player, hero_previewer, hero_name, career_index, current_items)
	local player_unit = player.player_unit

	if not Unit.alive(player_unit) then
		return
	end

	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local attachment_extension = ScriptUnit.extension(player_unit, "attachment_system")
	local slots = InventorySettings.slots_by_slot_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local preview_wield_slot_type = career_data.preview_wield_slot
	local preview_wield_slot = InventorySettings.slot_names_by_type[preview_wield_slot_type]
	local preview_wield_slot_name = preview_wield_slot[1]
	local items_changed = false

	for slot_index, slot in pairs(slots) do
		local slot_name = slot.name

		if slot_name ~= slot_to_block_by_wield_slot[preview_wield_slot_name] then
			local slot_data = inventory_extension:get_slot_data(slot_name) or attachment_extension:get_slot_data(slot_name)
			local item = slot_data and slot_data.item_data

			if item then
				local item_name = item.name

				if current_items[slot_index] ~= item_name then
					hero_previewer:equip_item(item.name, slot)

					current_items[slot_index] = item_name
					items_changed = true
				end
			end
		end
	end

	if hero_previewer:items_spawned() and hero_previewer:wielded_slot_type() ~= preview_wield_slot_type then
		hero_previewer:wield_weapon_slot(preview_wield_slot_type)
	end

	return items_changed
end

IngamePlayerListUI.update_player_information = function (self)
	local profiles = SPProfiles
	local profile_synchronizer = self.profile_synchronizer
	local players = self.players
	local num_players = self.num_players
	local spacing = 100
	local total_spacing = (num_players - 1) * spacing
	local widget_width = PLAYER_LIST_SIZE[1]
	local total_width = widget_width * num_players + total_spacing
	local cosmetic_system = Managers.state.entity:system("cosmetic_system")

	for i = 1, num_players, 1 do
		local player_data = players[i]
		local player = player_data.player
		local widget = player_data.widget
		local offset = widget.offset
		offset[1] = -(total_width / 2) + widget_width * i + (i - 1) * spacing
		local profile_index, career_index = profile_synchronizer:profile_by_peer(player_data.peer_id, player_data.local_player_id)
		local profile_settings = profiles[profile_index]
		local display_name = (profile_settings and profile_settings.display_name) or "unspawned"
		local ingame_display_name = (profile_settings and profile_settings.ingame_display_name) or "unspawned"
		widget.content.name = player_data.player_name
		local resync_player_level = player_data.resync_player_level

		if resync_player_level then
			local player_level = ExperienceSettings.get_player_level(player) or Managers.mechanism:get_player_level_fallback(player)

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
			local portrait_frame = CosmeticUtils.get_cosmetic_slot(player, "slot_frame")
			local portrait_frame_name = (portrait_frame and portrait_frame.item_name) or "default"

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
				portrait_offset[1] = offset[1]
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
end

IngamePlayerListUI._create_portrait_frame_widget = function (self, frame_settings_name, portrait_texture, player_level_text)
	local widget_definition = UIWidgets.create_portrait_frame("player_list_portrait", frame_settings_name, player_level_text, 1, nil, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content
	widget_content.frame_settings_name = frame_settings_name

	return widget
end

IngamePlayerListUI.get_ping_texture_by_ping_value = function (self, ping_value)
	if ping_value <= 125 then
		return "ping_icon_01", "low_ping_color"
	elseif ping_value > 125 and ping_value <= 175 then
		return "ping_icon_02", "medium_ping_color"
	elseif ping_value > 175 then
		return "ping_icon_03", "high_ping_color"
	end
end

IngamePlayerListUI.ignoring_chat_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		return chat_gui:ignoring_peer_id(peer_id)
	elseif IS_XB1 then
		return Managers.chat:ignoring_peer_id(peer_id)
	end
end

IngamePlayerListUI.ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:ignore_peer_id(peer_id)
	end
end

IngamePlayerListUI.remove_ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:remove_ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:remove_ignore_peer_id(peer_id)
	end
end

IngamePlayerListUI.muted_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			return Managers.voice_chat:is_peer_muted(peer_id)
		else
			return false
		end
	else
		return self.voip:peer_muted(peer_id)
	end
end

IngamePlayerListUI.ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:mute_peer(peer_id)
		end
	else
		self.voip:mute_member(peer_id)
	end
end

IngamePlayerListUI.remove_ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:unmute_peer(peer_id)
		end
	else
		self.voip:unmute_member(peer_id)
	end
end

IngamePlayerListUI.post_update = function (self, dt)
	return
end

IngamePlayerListUI.update = function (self, dt)
	local input_manager = self.input_manager
	local in_fade_active = Managers.transition:in_fade_active()
	local input_service = input_manager:get_service("player_list_input")
	local is_matchmaking = self.is_in_inn and Managers.matchmaking:is_game_matchmaking()

	if not in_fade_active and (input_service:get("ingame_player_list_exit") or input_service:get("ingame_player_list_toggle") or input_service:get("back")) and self.active and self.cursor_active then
		self:set_active(false)
	elseif not self.cursor_active then
		if not in_fade_active and input_service:get("ingame_player_list_toggle") and not is_matchmaking then
			if not self.active then
				self:set_active(true)

				if not self.cursor_active then
					ShowCursorStack.push()
					input_manager:block_device_except_service("player_list_input", "keyboard")
					input_manager:block_device_except_service("player_list_input", "mouse")
					input_manager:block_device_except_service("player_list_input", "gamepad")

					self.cursor_active = true
				end
			end
		elseif input_service:get("ingame_player_list_pressed") then
			if not self.active then
				self:set_active(true)
			end
		elseif self.active and not input_service:get("ingame_player_list_held") then
			self:set_active(false)
		end
	end

	if self.active then
		if input_service:get("activate_ingame_player_list") and not self.cursor_active then
			ShowCursorStack.push()
			input_manager:block_device_except_service("player_list_input", "keyboard")
			input_manager:block_device_except_service("player_list_input", "mouse")
			input_manager:block_device_except_service("player_list_input", "gamepad")

			self.cursor_active = true
		end

		self:update_player_list(dt)

		if self._show_difficulty then
			self:update_difficulty()
		end

		local private_checkbox_content = self.private_checkbox_widget.content

		if self.local_player.is_server and not self.is_in_inn and not private_checkbox_content.is_disabled then
			local private_checkbox_hotspot = private_checkbox_content.button_hotspot

			if private_checkbox_hotspot.on_hover_enter then
				WwiseWorld.trigger_event(self.wwise_world, "Play_hud_hover")
			end

			if self.private_setting_enabled and private_checkbox_hotspot.on_release then
				local is_private = Managers.matchmaking:is_game_private()
				local map_save_data = self.map_save_data
				map_save_data.private_enabled = not is_private

				print("privat: ", map_save_data.private_enabled)
				WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
				self:set_privacy_enabled(map_save_data.private_enabled, true)

				PlayerData.map_view_data = map_save_data

				Managers.save:auto_save(SaveFileName, SaveData, callback(self, "on_save_ended_callback"))

				local matchmaking_manager = Managers.matchmaking

				matchmaking_manager:set_in_progress_game_privacy(map_save_data.private_enabled)
			end
		end

		self:_sync_missions()
		self:draw(dt)
	end
end

IngamePlayerListUI.set_privacy_enabled = function (self, enabled, animate)
	local text = "map_screen_private_button"
	local widget = self.private_checkbox_widget
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
	return self.active
end

IngamePlayerListUI.is_focused = function (self)
	return self.active and self.cursor_active
end

IngamePlayerListUI.input_service = function (self)
	local input_manager = self.input_manager

	return input_manager:get_service("player_list_input")
end

IngamePlayerListUI.set_visible = function (self, visible)
	if self.active and not visible then
		self:set_active(false)
	end
end

IngamePlayerListUI.set_active = function (self, active)
	local chat_gui = Managers.chat.chat_gui

	if active then
		if self.local_player.is_server and not self.is_in_inn then
			local is_private = Managers.matchmaking:is_game_private()

			self:set_privacy_enabled(is_private)
		end

		local game_mode_manager = Managers.state.game_mode
		local activated_mutators = game_mode_manager:activated_mutators()

		self:_setup_mutator_data(activated_mutators)

		local world = self.ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
			ShadingEnvironment.apply(shading_env)
		end

		Managers.input:enable_gamepad_cursor()
	else
		local world = self.ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
			ShadingEnvironment.apply(shading_env)
		end

		chat_gui:hide_chat()
		Managers.input:disable_gamepad_cursor()
	end

	self.active = active

	if active then
		self._fade_in_duration = 0
	end

	if self.cursor_active then
		ShowCursorStack.pop()

		local input_manager = self.input_manager

		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")

		self.cursor_active = false
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
	local render_settings = self.render_settings
	local ui_scenegraph = self.ui_scenegraph
	render_settings.alpha_multiplier = progress
	ui_scenegraph.banner_top.local_position[2] = ui_scenegraph.banner_top.size[2] * (1 - anim_progress)
	ui_scenegraph.banner_bottom.local_position[2] = -(ui_scenegraph.banner_bottom.size[2] * (1 - anim_progress))

	if progress == 1 then
		self._fade_in_duration = nil
	else
		self._fade_in_duration = fade_in_duration
	end
end

IngamePlayerListUI.get_background_world = function (self)
	local previewer_pass_data = self.viewport_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local world = previewer_pass_data.world

	return world, viewport
end

local temp_players = {}

IngamePlayerListUI.update_player_list = function (self, dt)
	local game_session = Managers.state.network:game()
	local player_manager = self.player_manager

	table.clear(temp_players)

	local update_widgets = false
	local players = self.players
	local num_players = self.num_players
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
				local ping_texture, ping_color = self:get_ping_texture_by_ping_value(ping)
				widget.content.ping_texture = ping_texture
				widget.content.ping_text = ping
				local ping_style = widget.style.ping_text
				ping_style.text_color = ping_style[ping_color]
			end

			if not is_local_player then
				local chat_button_hotspot = widget.content.chat_button_hotspot

				if chat_button_hotspot.on_pressed then
					chat_button_hotspot.on_pressed = nil

					if chat_button_hotspot.is_selected then
						self:remove_ignore_chat_message_from_peer_id(peer_id)

						chat_button_hotspot.is_selected = nil
					else
						self:ignore_chat_message_from_peer_id(peer_id)

						chat_button_hotspot.is_selected = true
					end
				end

				local voice_button_hotspot = widget.content.voice_button_hotspot

				if voice_button_hotspot.on_pressed then
					voice_button_hotspot.on_pressed = nil

					if voice_button_hotspot.is_selected then
						self:remove_ignore_voice_message_from_peer_id(peer_id)

						voice_button_hotspot.is_selected = nil
					else
						self:ignore_voice_message_from_peer_id(peer_id)

						voice_button_hotspot.is_selected = true
					end
				end

				local profile_button_hotspot = widget.content.profile_button_hotspot

				if profile_button_hotspot.on_pressed then
					profile_button_hotspot.on_pressed = nil

					self:show_profile_by_peer_id(peer_id)
				end

				local kick_button_hotspot = widget.content.kick_button_hotspot

				if not is_server and kick_button_hotspot.on_pressed then
					kick_button_hotspot.on_pressed = nil

					self:kick_player(data.player)
				end
			end
		end
	end

	self.num_players = num_players - removed_players
	local human_and_bot_players = Managers.player:human_and_bot_players()

	for _, player in pairs(human_and_bot_players) do
		if not temp_players[player:ui_id()] then
			self:add_player(player)

			update_widgets = true
		end
	end

	if update_widgets then
		self:update_widgets()
	end

	self:update_player_information()
end

IngamePlayerListUI.update_difficulty = function (self)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local difficulty_name = difficulty_settings.display_name

	if difficulty_name ~= self.current_difficulty_name then
		self:set_difficulty_name(Localize(difficulty_name))

		self.current_difficulty_name = difficulty_name
	end
end

IngamePlayerListUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("player_list_input")
	local gamepad_active = input_manager:is_device_active("gamepad")
	local render_settings = self.render_settings

	self:_update_fade_in_duration(dt)
	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	if not gamepad_active and not self.cursor_active then
		UIRenderer.draw_widget(ui_top_renderer, self.input_description_text_widget)
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

	if self.private_setting_enabled then
		UIRenderer.draw_widget(ui_top_renderer, self.private_checkbox_widget)
	end

	if gamepad_active then
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor)
	end

	local players = self.players
	local num_players = self.num_players

	for i = 1, num_players, 1 do
		local player = players[i]
		local widget = player.widget

		UIRenderer.draw_widget(ui_top_renderer, widget)

		local portrait_widget = player.portrait_widget

		if portrait_widget then
			UIRenderer.draw_widget(ui_top_renderer, portrait_widget)
		end
	end

	if self.viewport_widget then
		UIRenderer.draw_widget(ui_top_renderer, self.viewport_widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_renderer, self.background)
	UIRenderer.end_pass(ui_renderer)
end

IngamePlayerListUI.can_host_solo_kick = function (self)
	return self.is_server and Managers.player:num_human_players() == 2
end

IngamePlayerListUI.kick_player = function (self, player)
	local kick_peer_id = player.peer_id

	if self:can_host_solo_kick() then
		self.network_server:kick_peer(kick_peer_id)
	else
		local vote_data = {
			kick_peer_id = kick_peer_id
		}

		Managers.state.voting:request_vote("kick_player", vote_data, Network.peer_id())
		self:set_active(false)
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

IngamePlayerListUI.show_profile_by_peer_id = function (self, peer_id)
	local platform = self.platform

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
