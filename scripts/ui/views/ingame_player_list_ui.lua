require("scripts/ui/views/character_inspect_ui")

local definitions = local_require("scripts/ui/views/ingame_player_list_ui_definitions")
local generic_input_actions = definitions.generic_input_actions
local PLAYER_LIST_SIZE = definitions.PLAYER_LIST_SIZE
local PLAYER_NAME_MAX_LENGTH = 16
local mission_settings = {
	tome = {
		texture = "loot_objective_icon_02",
		mission_name = "tome_bonus_mission",
		total_amount = 3,
		widget_name = "tome_counter",
		item_name = "wpn_side_objective_tome_01",
		title_text = "Tomes",
		title_widget_name = "tome_counter_title"
	},
	grimoire = {
		texture = "loot_objective_icon_01",
		mission_name = "grimoire_hidden_mission",
		total_amount = 2,
		widget_name = "grimoire_counter",
		item_name = "wpn_grimoire_01",
		title_text = "Grimoires",
		title_widget_name = "grimoire_counter_title"
	}
}
IngamePlayerListUI = class(IngamePlayerListUI)
IngamePlayerListUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.wwise_world = ingame_ui_context.dialogue_system.wwise_world
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.level_transition_handler = ingame_ui_context.level_transition_handler
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

	input_manager.create_input_service(input_manager, "player_list_input", "IngamePlayerListKeymaps", "IngamePlayerListFilters")
	input_manager.map_device_to_service(input_manager, "player_list_input", "keyboard")
	input_manager.map_device_to_service(input_manager, "player_list_input", "mouse")
	input_manager.map_device_to_service(input_manager, "player_list_input", "gamepad")

	self.network_lobby = ingame_ui_context.network_lobby
	self.local_player = self.player_manager:local_player()
	self.num_players = 0
	self.players = {}
	self.active = false

	self.create_ui_elements(self)

	local level_key = self.level_transition_handler:get_current_level_keys()
	local level_settings = LevelSettings[level_key]

	self.set_level_name(self, Localize(level_settings.display_name))
	self._setup_mission_data(self, level_settings)

	local input_service = input_manager.get_service(input_manager, "player_list_input")
	local gui_layer = definitions.scenegraph_definition.root.position[3]
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, 6, gui_layer, generic_input_actions.default)
	local gamemode_settings = Managers.state.game_mode:settings()
	local private_only = gamemode_settings.private_only
	self.private_only = private_only
	self.private_setting_enabled = not private_only and not self.is_in_inn and self.local_player.is_server and self.platform ~= "xb1"

	if self.private_setting_enabled then
		self.menu_input_description:set_input_description(definitions.private_input_description)
	end

	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local server_peer_id = network_transmit.server_peer_id
	self.host_peer_id = server_peer_id or network_transmit.peer_id

	rawset(_G, "ingame_player_list", self)

	return 
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
	local specific_widget_definitions = definitions.specific_widget_definitions
	self.input_description_text_widget = UIWidget.init(specific_widget_definitions.input_description_text)
	self.background = UIWidget.init(specific_widget_definitions.background)
	self.private_checkbox_widget = UIWidget.init(specific_widget_definitions.private_checkbox)
	static_widgets_by_name.banner_top_edge.offset[3] = 1
	local banner_bottom_edge = static_widgets_by_name.banner_bottom_edge
	local banner_bottom_edge_scenegraph_id = banner_bottom_edge.scenegraph_id
	banner_bottom_edge.offset[2] = scenegraph_definition[banner_bottom_edge_scenegraph_id].size[2] - 2
	banner_bottom_edge.offset[3] = 1
	local player_list_widgets = {}

	for i = 1, 4, 1 do
		player_list_widgets[i] = UIWidget.init(definitions.player_widget_definition(i))
	end

	self.player_list_widgets = player_list_widgets
	self.popup_list = UIWidget.init(definitions.popup_widget_definition)

	return 
end
IngamePlayerListUI._setup_mission_data = function (self, level_settings)
	local loot_objectives = level_settings.loot_objectives

	if not loot_objectives then
		return 
	end

	local create_loot_widget = definitions.create_loot_widget
	local widgets = self._widgets
	local widgets_by_name = self._widgets_by_name
	local settings_data = {}
	local mission_count = 0

	for key, setting in pairs(mission_settings) do
		local total_amount = loot_objectives[key]

		if total_amount and 0 < total_amount then
			local mission_name = setting.mission_name
			local widget_name = setting.widget_name
			local texture = setting.texture
			local widget_definition = create_loot_widget(widget_name, texture, total_amount)
			local widget = UIWidget.init(widget_definition)
			local content = widget.content
			local style = widget.style
			local title_text = setting.title_text
			local title_widget_name = setting.title_widget_name
			local title_widget = widgets_by_name[title_widget_name]
			title_widget.content.text = title_text
			local data = {
				name = key,
				total_amount = total_amount,
				mission_name = mission_name,
				widget = widget
			}
			settings_data[key] = data
			widgets_by_name[widget_name] = widget
			widgets[#widgets + 1] = widget
			mission_count = mission_count + 1
		end
	end

	if 0 < mission_count then
		self._mission_settings_data = settings_data

		self._sync_missions(self)
	end

	return 
end
IngamePlayerListUI._sync_missions = function (self)
	local mission_settings_data = self._mission_settings_data

	if not mission_settings_data then
		return 
	end

	for _, data in pairs(mission_settings_data) do
		local mission_name = data.mission_name
		local amount = self._get_item_amount_by_mission_name(self, mission_name) or 0
		local current_amount = data.amount

		if current_amount ~= amount then
			data.previous_amount = current_amount or 0
			data.amount = amount
			local widget = data.widget
			local content = widget.content
			local style = widget.style
			content.draw_count = amount
			style.icon_textures.draw_count = amount
		end
	end

	return 
end
IngamePlayerListUI._get_item_amount_by_mission_name = function (self, mission_name)
	local mission_system = self._mission_system
	local data = mission_system.get_level_end_mission_data(mission_system, mission_name)
	local current_amount = data and data.current_amount

	return current_amount
end
IngamePlayerListUI._create_player_portrait = function (self, portrait_frame, portrait_image, player_level_text)
	local definition = UIWidgets.create_portrait_frame("player_portrait", portrait_frame, player_level_text, 1, nil, portrait_image)
	local widget = UIWidget.init(definition)
	self._player_portrait_widget = widget

	return 
end
IngamePlayerListUI.destroy = function (self)
	if self.cursor_active then
		ShowCursorStack.pop()

		local input_manager = self.input_manager

		input_manager.device_unblock_all_services(input_manager, "keyboard")
		input_manager.device_unblock_all_services(input_manager, "mouse")
		input_manager.device_unblock_all_services(input_manager, "gamepad")

		self.cursor_active = false
	end

	self.menu_input_description:destroy()

	self.menu_input_description = nil

	rawset(_G, "ingame_player_list", nil)
	print("[IngamePlayerListUI] - Destroy")

	return 
end
IngamePlayerListUI.set_level_name = function (self, name)
	self._set_widget_text(self, "game_level", name)

	return 
end
IngamePlayerListUI.set_difficulty_name = function (self, name)
	self._set_widget_text(self, "game_difficulty", name)

	return 
end
IngamePlayerListUI._set_widget_text = function (self, widget_name, text)
	local widget = self._widgets_by_name[widget_name]
	widget.content.text = text

	return 
end
IngamePlayerListUI._set_simple_widget_texture = function (self, widget_name, texture)
	local widget = self._widgets_by_name[widget_name]
	widget.content.texture_id = texture

	return 
end
IngamePlayerListUI.add_player = function (self, player)
	local ingame_ui_context = self.ingame_ui_context
	local is_local_player = player.local_player
	local is_bot_player = player.bot_player
	local ui_id = player.ui_id(player)
	local player_level = ExperienceSettings.get_player_level(player)
	local peer_id = player.network_id(player)
	local is_player_server = self.host_peer_id == peer_id
	local player_data = {
		unit_spawned = false,
		is_local_player = is_local_player,
		is_bot_player = is_bot_player,
		peer_id = peer_id,
		ui_id = ui_id,
		local_player_id = player.local_player_id(player),
		player = player,
		player_name = player.name(player),
		level = player_level or "n/a",
		resync_player_level = not player_level,
		is_server = is_player_server,
		unit_equipment = {}
	}
	self.num_players = self.num_players + 1
	self.players[self.num_players] = player_data

	return 
end
IngamePlayerListUI.select_player = function (self, player_index)
	self.selected_player_index = player_index
	local players = self.players
	local num_players = self.num_players

	for i = 1, num_players, 1 do
		players[i].widget.content.button_hotspot.is_selected = i == player_index
	end

	return 
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

	return 
end
IngamePlayerListUI.update_widgets = function (self)
	local players = self.players
	local num_players = self.num_players
	local can_start_vote = Managers.state.voting:can_start_vote("kick_player")
	local vote_kick_enabled = Managers.state.voting:vote_kick_enabled()
	local private_game = Managers.matchmaking:is_game_private()
	local can_kick = can_start_vote and vote_kick_enabled
	local is_pc = self.platform == "win32"
	local leader = Managers.party:leader()

	for i = 1, num_players, 1 do
		local player_data = players[i]
		local is_local_player = player_data.is_local_player
		local is_bot_player = player_data.is_bot_player
		local is_leader = player_data.peer_id == leader and not is_bot_player
		local is_server = player_data.is_server
		local can_kick_player = not is_leader and (can_kick or self.can_host_solo_kick(self))
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
			widget_content.show_ping = not is_bot_player
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
			widget_content.show_chat_button = is_pc
			widget_content.show_voice_button = true
			widget_content.show_ping = true
			widget_content.profile_button_hotspot.disable_button = false
			widget_content.chat_button_hotspot.disable_button = not is_pc
			widget_content.voice_button_hotspot.disable_button = false
			widget_content.chat_button_hotspot.is_selected = self.ignoring_chat_peer_id(self, player_data.peer_id)
			widget_content.voice_button_hotspot.is_selected = self.muted_peer_id(self, player_data.peer_id)
		end

		local name = player_data.player_name
		player_data.player_name = (PLAYER_NAME_MAX_LENGTH < UTF8Utils.string_length(name) and UIRenderer.crop_text_width(self.ui_top_renderer, name, 370, widget.style.name)) or name
		player_data.widget = widget
	end

	return 
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
	local career_name = career_data.name
	local items_changed = false

	for slot_index, slot in pairs(slots) do
		local slot_name = slot.name

		if slot_name ~= slot_to_block_by_wield_slot[preview_wield_slot_name] then
			local slot_data = inventory_extension.get_slot_data(inventory_extension, slot_name) or attachment_extension.get_slot_data(attachment_extension, slot_name)
			local item = slot_data and slot_data.item_data

			if item then
				local item_name = item.name

				if current_items[slot_index] ~= item_name then
					hero_previewer.equip_item(hero_previewer, item.name, slot)

					current_items[slot_index] = item_name
					items_changed = true
				end
			end
		end
	end

	if hero_previewer.items_spawned(hero_previewer) and hero_previewer.wielded_slot_type(hero_previewer) ~= preview_wield_slot_type then
		hero_previewer.wield_weapon_slot(hero_previewer, preview_wield_slot_type)
	end

	return items_changed
end
IngamePlayerListUI.update_player_information = function (self)
	local profiles = SPProfiles
	local profile_synchronizer = self.profile_synchronizer
	local players = self.players
	local num_players = self.num_players
	local spacing = 100
	local total_spacing = (num_players - 1)*spacing
	local widget_width = PLAYER_LIST_SIZE[1]
	local total_width = widget_width*num_players + total_spacing

	for i = 1, num_players, 1 do
		local player_data = players[i]
		local player = player_data.player
		local widget = player_data.widget
		local offset = widget.offset
		offset[1] = -(total_width/2) + widget_width*i + (i - 1)*spacing
		local profile_index = profile_synchronizer.profile_by_peer(profile_synchronizer, player_data.peer_id, player_data.local_player_id)
		local profile_settings = profiles[profile_index]
		local display_name = (profile_settings and profile_settings.display_name) or "unspawned"
		local ingame_display_name = (profile_settings and profile_settings.ingame_display_name) or "unspawned"
		widget.content.name = player_data.player_name
		local resync_player_level = player_data.resync_player_level

		if resync_player_level then
			local player_level = ExperienceSettings.get_player_level(player)

			if player_level then
				player_data.level = player_level
				player_data.resync_player_level = nil
			end
		end

		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local career_index = career_extension.career_index(career_extension)
			local career_settings = profile_settings.careers[career_index]
			local portrait_image = career_settings.portrait_image
			local player_level_text = (player_data.is_bot_player and "BOT") or (player_data.level and tostring(player_data.level)) or "-"
			local portrait_frame = self._get_portrait_frame(self, player)

			if player_data.career_index ~= career_index or display_name ~= player_data.hero_name or player_level_text ~= player_data.player_level_text or portrait_frame ~= player_data.portrait_frame then
				player_data.career_index = career_index
				local portrait_widget = self._create_portrait_frame_widget(self, portrait_frame, portrait_image, player_level_text)
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
				local activated_ability_data = career_settings.activated_ability
				local activated_display_name = activated_ability_data.display_name
				local activated_description = activated_ability_data.description
				local activated_icon = activated_ability_data.icon

				self._set_widget_text(self, "player_ability_name", Localize(activated_display_name))
				self._set_widget_text(self, "player_ability_description", Localize(activated_description))
				self._set_simple_widget_texture(self, "player_ability_icon", activated_icon)

				local passive_display_name = passive_ability_data.display_name
				local passive_description = passive_ability_data.description
				local passive_icon = passive_ability_data.icon

				self._set_widget_text(self, "player_passive_name", Localize(passive_display_name))
				self._set_widget_text(self, "player_passive_description", Localize(passive_description))
				self._set_simple_widget_texture(self, "player_passive_icon", passive_icon)

				local career_display_name = career_settings.display_name

				self._set_widget_text(self, "player_career_name", Localize(career_display_name))
				self._create_player_portrait(self, portrait_frame, portrait_image, player_level_text)
				self._set_widget_text(self, "player_hero_name", Localize(ingame_display_name))
			end
		end
	end

	return 
end
IngamePlayerListUI._get_portrait_frame = function (self, player)
	local unit = player.player_unit
	local player_portrait_frame = "default"

	if unit and player then
		local dead_portrait_frame = "unit_frame_death"
		local network_manager = Managers.state.network
		local network_game = network_manager.game(network_manager)

		if network_game and not LEVEL_EDITOR_TEST and Unit.alive(unit) then
			if player.local_player then
				local career_extension = ScriptUnit.extension(unit, "career_system")
				local career_name = career_extension.career_name(career_extension)
				local item_interface = Managers.backend:get_interface("items")
				local item = BackendUtils.get_loadout_item(career_name, "slot_frame")

				if item then
					local item_data = item.data
					local frame_name = item_data.temporary_template

					if not frame_name then
					end
				end
			else
				local unit_id = network_manager.unit_game_object_id(network_manager, unit)
				local frame_name_id = GameSession.game_object_field(network_game, unit_id, "frame_name")
				player_portrait_frame = NetworkLookup.cosmetics[frame_name_id]
			end
		end
	end

	return player_portrait_frame
end
IngamePlayerListUI._create_portrait_frame_widget = function (self, frame_settings_name, portrait_texture, player_level_text)
	local widget_definition = UIWidgets.create_portrait_frame("player_list_portrait", frame_settings_name, player_level_text, 1, nil, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content
	widget_content.frame_settings_name = frame_settings_name

	return widget
end
IngamePlayerListUI.update_player_ping_list = function (self, dt)
	local delay_time = self.time_to_next_ping_update

	if delay_time then
		local new_time = delay_time - dt

		if new_time <= 0 then
			new_time = nil
		end

		self.time_to_next_ping_update = new_time

		return 
	end

	local matchmaking_manager = Managers.matchmaking
	self.pings_by_peer_id = matchmaking_manager.get_players_ping(matchmaking_manager)
	self.time_to_next_ping_update = 2.5

	return 
end
IngamePlayerListUI.get_ping_by_peer_id = function (self, peer_id)
	local pings_by_peer_id = self.pings_by_peer_id

	if pings_by_peer_id then
		local ping_data = pings_by_peer_id[peer_id]

		if ping_data then
			local number_of_ping_values = #ping_data
			local total_value = 0

			for i = 1, number_of_ping_values, 1 do
				total_value = total_value + ping_data[i]
			end

			local avrage_value = (0 < total_value and total_value/number_of_ping_values) or 0

			return avrage_value*1000
		end
	end

	return 255
end
IngamePlayerListUI.get_ping_texture_by_ping_value = function (self, ping_value)
	if ping_value <= 100 then
		return "ping_icon_01"
	elseif 100 < ping_value and ping_value <= 150 then
		return "ping_icon_02"
	elseif 150 < ping_value then
		return "ping_icon_03"
	end

	return 
end
IngamePlayerListUI.ignoring_chat_peer_id = function (self, peer_id)
	local chat_gui = Managers.chat.chat_gui

	return chat_gui.ignoring_peer_id(chat_gui, peer_id)
end
IngamePlayerListUI.ignore_chat_message_from_peer_id = function (self, peer_id)
	local chat_gui = Managers.chat.chat_gui

	chat_gui.ignore_peer_id(chat_gui, peer_id)

	return 
end
IngamePlayerListUI.remove_ignore_chat_message_from_peer_id = function (self, peer_id)
	local chat_gui = Managers.chat.chat_gui

	chat_gui.remove_ignore_peer_id(chat_gui, peer_id)

	return 
end
IngamePlayerListUI.muted_peer_id = function (self, peer_id)
	if PLATFORM == "xb1" then
		return Managers.voice_chat:is_peer_muted(peer_id)
	else
		return self.voip:peer_muted(peer_id)
	end

	return 
end
IngamePlayerListUI.ignore_voice_message_from_peer_id = function (self, peer_id)
	if PLATFORM == "xb1" then
		Managers.voice_chat:mute_peer(peer_id)
	else
		self.voip:mute_member(peer_id)
	end

	return 
end
IngamePlayerListUI.remove_ignore_voice_message_from_peer_id = function (self, peer_id)
	if PLATFORM == "xb1" then
		Managers.voice_chat:unmute_peer(peer_id)
	else
		self.voip:unmute_member(peer_id)
	end

	return 
end
IngamePlayerListUI.post_update = function (self, dt)
	return 
end
IngamePlayerListUI.update = function (self, dt)
	local input_manager = self.input_manager
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local in_fade_active = Managers.transition:in_fade_active()
	local input_service = input_manager.get_service(input_manager, "player_list_input")

	if not in_fade_active and (input_service.get(input_service, "ingame_player_list_exit") or input_service.get(input_service, "ingame_player_list_toggle") or input_service.get(input_service, "back")) and self.active and self.cursor_active then
		self.set_active(self, false)
	elseif not self.cursor_active then
		if not in_fade_active and input_service.get(input_service, "ingame_player_list_toggle") then
			if not self.active then
				self.set_active(self, true)

				if not self.cursor_active then
					ShowCursorStack.push()
					input_manager.block_device_except_service(input_manager, "player_list_input", "keyboard")
					input_manager.block_device_except_service(input_manager, "player_list_input", "mouse")
					input_manager.block_device_except_service(input_manager, "player_list_input", "gamepad")

					self.cursor_active = true
				end
			end
		elseif input_service.get(input_service, "ingame_player_list_pressed") then
			if not self.active then
				self.set_active(self, true)
			end
		elseif self.active and not input_service.get(input_service, "ingame_player_list_held") then
			self.set_active(self, false)
		end
	end

	if self.active then
		if input_service.get(input_service, "activate_ingame_player_list") and not self.cursor_active then
			ShowCursorStack.push()
			input_manager.block_device_except_service(input_manager, "player_list_input", "keyboard")
			input_manager.block_device_except_service(input_manager, "player_list_input", "mouse")
			input_manager.block_device_except_service(input_manager, "player_list_input", "gamepad")

			self.cursor_active = true
		end

		self.update_player_ping_list(self, dt)
		self.update_player_list(self, dt)
		self.update_difficulty(self)

		if self.local_player.is_server and not self.is_in_inn then
			local private_checkbox_content = self.private_checkbox_widget.content
			local private_checkbox_hotspot = private_checkbox_content.button_hotspot

			if private_checkbox_hotspot.on_hover_enter then
				WwiseWorld.trigger_event(self.wwise_world, "Play_hud_hover")
			end

			if self.private_setting_enabled and (private_checkbox_hotspot.on_release or (gamepad_active and input_service.get(input_service, "toggle_private"))) then
				local is_private = Managers.matchmaking:is_game_private()
				local map_save_data = self.map_save_data
				map_save_data.private_enabled = not is_private

				WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
				self.set_privacy_enabled(self, map_save_data.private_enabled, true)

				PlayerData.map_view_data = map_save_data

				Managers.save:auto_save(SaveFileName, SaveData, callback(self, "on_save_ended_callback"))

				local matchmaking_manager = Managers.matchmaking

				matchmaking_manager.set_in_progress_game_privacy(matchmaking_manager, map_save_data.private_enabled)
			end
		end

		if gamepad_active then
			if not self.gamepad_active_last_frame then
				self.gamepad_active_last_frame = true

				self.on_gamepad_activated(self)
			end

			self.handle_gamepad_navigation_input(self, dt)
		elseif self.gamepad_active_last_frame then
			self.gamepad_active_last_frame = false

			self.on_gamepad_deactivated(self)
		end

		self._sync_missions(self)
		self.draw(self, dt)
	end

	return 
end
IngamePlayerListUI.set_privacy_enabled = function (self, enabled, animate)
	local text = (enabled and "map_screen_private_button") or "map_public_setting"
	local widget = self.private_checkbox_widget
	widget.content.checked = enabled
	widget.content.setting_text = text

	if animate then
		self._private_timer = 0
	end

	return 
end
IngamePlayerListUI._update_gamepad_private_text_animation_timer = function (self, dt)
	local timer = self._private_timer

	if timer then
		local total_time = 0.15

		if timer == total_time then
			self._private_timer = nil

			return 
		else
			timer = math.min(timer + dt, total_time)
			self._private_timer = timer

			return timer/total_time
		end
	end

	return 
end
IngamePlayerListUI._update_gamepad_private_text_animation = function (self, dt, instant)
	local progress = self._update_gamepad_private_text_animation_timer(self, dt)

	if not progress then
		return 
	end

	local anim_progress = math.ease_pulse(progress)
	local text_style = self.private_text_gamepad_widget.style.text
	text_style.font_size = anim_progress*10 + 22

	return 
end
IngamePlayerListUI.on_save_ended_callback = function (self)
	print("[IngamePlayerWiew] - settings saved")

	return 
end
IngamePlayerListUI.on_gamepad_activated = function (self)
	self.select_player(self, 1)

	return 
end
IngamePlayerListUI.on_gamepad_deactivated = function (self)
	self.deselect_player(self)

	return 
end
IngamePlayerListUI.handle_gamepad_navigation_input = function (self, dt)
	self.update_input_description(self)

	local input_service = self.input_manager:get_service("player_list_input")
	local controller_cooldown = self.controller_cooldown

	if controller_cooldown and 0 < controller_cooldown then
		self.controller_cooldown = controller_cooldown - dt
	else
		local selected_player_index = self.selected_player_index
		local players = self.players
		local selected_player = players[selected_player_index]

		if selected_player then
			local peer_id = selected_player.peer_id
			local selected_widget = selected_player.widget

			if input_service.get(input_service, "mute_chat", true) then
				local selected_widget_content = selected_widget.content

				if selected_widget_content.show_chat_button then
					local chat_button_hotspot = selected_widget_content.chat_button_hotspot

					if chat_button_hotspot.is_selected then
						self.remove_ignore_chat_message_from_peer_id(self, peer_id)

						chat_button_hotspot.is_selected = nil
					else
						self.ignore_chat_message_from_peer_id(self, peer_id)

						chat_button_hotspot.is_selected = true
					end
				end

				return 
			elseif input_service.get(input_service, "mute_voice", true) then
				local selected_widget_content = selected_widget.content

				if selected_widget_content.show_voice_button then
					local voice_button_hotspot = selected_widget_content.voice_button_hotspot

					if voice_button_hotspot.is_selected then
						self.remove_ignore_voice_message_from_peer_id(self, peer_id)

						voice_button_hotspot.is_selected = nil
					else
						self.ignore_voice_message_from_peer_id(self, peer_id)

						voice_button_hotspot.is_selected = true
					end
				end

				return 
			elseif input_service.get(input_service, "kick_player", true) then
				local selected_widget_content = selected_widget.content

				if selected_widget_content.show_kick_button then
					local can_start_vote = Managers.state.voting:can_start_vote("kick_player")
					local vote_kick_enabled = Managers.state.voting:vote_kick_enabled()
					local can_kick = can_start_vote and vote_kick_enabled

					if can_kick then
						self.kick_player(self, selected_player.player)
					end
				end

				return 
			elseif input_service.get(input_service, "show_profile", true) then
				local selected_widget_content = selected_widget.content

				if selected_widget_content.show_profile_button then
					self.show_profile_by_peer_id(self, peer_id)
				end

				return 
			end

			local new_selection_index = selected_player_index

			if input_service.get(input_service, "move_down", true) then
				new_selection_index = math.min(new_selection_index + 1, self.num_players)
			elseif input_service.get(input_service, "move_up", true) then
				new_selection_index = math.max(new_selection_index - 1, 1)
			end

			if new_selection_index ~= selected_player_index then
				self.select_player(self, new_selection_index)

				self.controller_cooldown = 0.15
			end
		end
	end

	return 
end
IngamePlayerListUI.update_input_description = function (self)
	local actions_name_to_use = "default"
	local selected_player_index = self.selected_player_index
	local players = self.players
	local selected_player = players[selected_player_index]

	if selected_player then
		local selected_widget = selected_player.widget
		local widget_content = selected_widget.content

		if selected_player.is_local_player then
			actions_name_to_use = "own_player"
		else
			local is_server = selected_player.is_server
			local chat_mute_enabled = widget_content.show_chat_button
			local voice_mute_enabled = widget_content.show_voice_button
			local chat_muted = widget_content.chat_button_hotspot.is_selected
			local voice_muted = widget_content.voice_button_hotspot.is_selected
			local can_start_vote = Managers.state.voting:can_start_vote("kick_player")
			local vote_kick_enabled = Managers.state.voting:vote_kick_enabled()
			local private_game = Managers.matchmaking:is_game_private()
			local can_kick = can_start_vote and vote_kick_enabled and not private_game

			if chat_muted and voice_muted then
				if is_server or not can_kick then
					actions_name_to_use = "server_voice_and_chat_muted"
				else
					actions_name_to_use = "voice_and_chat_muted"
				end
			elseif chat_muted then
				if is_server or not can_kick then
					actions_name_to_use = "server_chat_muted"
				else
					actions_name_to_use = "chat_muted"
				end
			elseif not can_kick and not voice_muted and not is_server then
				actions_name_to_use = "kick_unavailable"
			elseif not can_kick and voice_muted and not is_server then
				actions_name_to_use = "voice_and_kick_unavailable"
			elseif voice_muted then
				if is_server or not can_kick then
					actions_name_to_use = "server_voice_muted"
				else
					actions_name_to_use = "voice_muted"
				end
			elseif is_server then
				actions_name_to_use = "server_default"
			end
		end

		if not self.gamepad_active_generic_actions_name or self.gamepad_active_generic_actions_name ~= actions_name_to_use then
			self.gamepad_active_generic_actions_name = actions_name_to_use
			local generic_actions = generic_input_actions[actions_name_to_use]

			self.menu_input_description:change_generic_actions(generic_actions)
		end
	end

	return 
end
IngamePlayerListUI.is_active = function (self)
	return self.active
end
IngamePlayerListUI.is_focused = function (self)
	return self.active and self.cursor_active
end
IngamePlayerListUI.input_service = function (self)
	local input_manager = self.input_manager

	return input_manager.get_service(input_manager, "player_list_input")
end
IngamePlayerListUI.set_active = function (self, active)
	local gamepad_active = self.input_manager:is_device_active("gamepad")

	if gamepad_active then
		if active then
			self.on_gamepad_activated(self)
		else
			self.on_gamepad_deactivated(self)
		end
	end

	local chat_gui = Managers.chat.chat_gui

	if active then
		if self.local_player.is_server and not self.is_in_inn then
			local is_private = Managers.matchmaking:is_game_private()

			self.set_privacy_enabled(self, is_private)
		end

		local world = self.ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
			ShadingEnvironment.apply(shading_env)
		end
	else
		local world = self.ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
			ShadingEnvironment.apply(shading_env)
		end

		chat_gui.hide_chat(chat_gui)
	end

	self.active = active

	if active then
		self._fade_in_duration = 0
	end

	local input_manager = self.input_manager

	if self.cursor_active then
		ShowCursorStack.pop()
		input_manager.device_unblock_all_services(input_manager, "keyboard")
		input_manager.device_unblock_all_services(input_manager, "mouse")
		input_manager.device_unblock_all_services(input_manager, "gamepad")

		self.cursor_active = false
	end

	return 
end
IngamePlayerListUI._update_fade_in_duration = function (self, dt)
	local fade_in_duration = self._fade_in_duration

	if not fade_in_duration then
		return 
	end

	fade_in_duration = fade_in_duration + dt
	local progress = math.min(fade_in_duration/0.2, 1)
	local anim_progress = math.easeOutCubic(progress)
	local render_settings = self.render_settings
	local ui_scenegraph = self.ui_scenegraph
	render_settings.alpha_multiplier = progress
	ui_scenegraph.banner_top.local_position[2] = ui_scenegraph.banner_top.size[2]*(anim_progress - 1)
	ui_scenegraph.banner_bottom.local_position[2] = -(ui_scenegraph.banner_bottom.size[2]*(anim_progress - 1))

	if progress == 1 then
		self._fade_in_duration = nil
	else
		self._fade_in_duration = fade_in_duration
	end

	return 
end
IngamePlayerListUI.get_background_world = function (self)
	local previewer_pass_data = self.viewport_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local world = previewer_pass_data.world

	return world, viewport
end
local debug_players = {
	[999] = {
		peer_id = 999,
		local_player_id = 1,
		name = function ()
			return "Playername_01"
		end
	},
	[91092] = {
		peer_id = 91092,
		local_player_id = 1,
		name = function ()
			return "Playername_02"
		end
	},
	[2109456] = {
		peer_id = 2109456,
		local_player_id = 1,
		name = function ()
			return "Playername_03"
		end
	},
	[588120] = {
		peer_id = 588120,
		local_player_id = 1,
		name = function ()
			return "Playername_04"
		end
	}
}
local temp_players = {}
IngamePlayerListUI.update_player_list = function (self, dt)
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
		local player = player_manager.player_from_peer_id(player_manager, peer_id, data.local_player_id)

		if not player then
			table.remove(players, i)

			update_widgets = true
			removed_players = removed_players + 1
		else
			local is_local_player = data.is_local_player
			temp_players[ui_id] = true
			local widget = data.widget
			local ping = self.get_ping_by_peer_id(self, peer_id)
			local ping_texture = self.get_ping_texture_by_ping_value(self, ping)
			widget.content.ping_texture = ping_texture

			if not is_local_player then
				local chat_button_hotspot = widget.content.chat_button_hotspot

				if chat_button_hotspot.on_pressed then
					chat_button_hotspot.on_pressed = nil

					if chat_button_hotspot.is_selected then
						self.remove_ignore_chat_message_from_peer_id(self, peer_id)

						chat_button_hotspot.is_selected = nil
					else
						self.ignore_chat_message_from_peer_id(self, peer_id)

						chat_button_hotspot.is_selected = true
					end
				end

				local voice_button_hotspot = widget.content.voice_button_hotspot

				if voice_button_hotspot.on_pressed then
					voice_button_hotspot.on_pressed = nil

					if voice_button_hotspot.is_selected then
						self.remove_ignore_voice_message_from_peer_id(self, peer_id)

						voice_button_hotspot.is_selected = nil
					else
						self.ignore_voice_message_from_peer_id(self, peer_id)

						voice_button_hotspot.is_selected = true
					end
				end

				local profile_button_hotspot = widget.content.profile_button_hotspot

				if profile_button_hotspot.on_pressed then
					profile_button_hotspot.on_pressed = nil

					self.show_profile_by_peer_id(self, peer_id)
				end

				local is_server = data.is_server
				local kick_button_hotspot = widget.content.kick_button_hotspot

				if not is_server and kick_button_hotspot.on_pressed then
					kick_button_hotspot.on_pressed = nil

					self.kick_player(self, data.player)
				end
			end
		end
	end

	self.num_players = num_players - removed_players
	local players = Managers.player:human_and_bot_players()

	for _, player in pairs(players) do
		if not temp_players[player.ui_id(player)] then
			self.add_player(self, player)

			update_widgets = true
		end
	end

	if update_widgets then
		self.update_widgets(self)
	end

	self.update_player_information(self)

	return 
end
IngamePlayerListUI.update_difficulty = function (self)
	local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
	local difficulty_name = difficulty_settings.display_name

	if difficulty_name ~= self.current_difficulty_name then
		self.set_difficulty_name(self, Localize(difficulty_name))

		self.current_difficulty_name = difficulty_name
	end

	return 
end
IngamePlayerListUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, "player_list_input")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local render_settings = self.render_settings

	self._update_fade_in_duration(self, dt)
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
		for _, widget in ipairs(static_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	local widgets = self._widgets

	if widgets then
		for _, widget in ipairs(widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	if self.private_setting_enabled then
		if gamepad_active then
		else
			UIRenderer.draw_widget(ui_top_renderer, self.private_checkbox_widget)
		end
	end

	local players = self.players
	local num_players = self.num_players

	for i = 1, num_players, 1 do
		local player = players[i]
		local widget = player.widget
		local portrait_widget = player.portrait_widget

		UIRenderer.draw_widget(ui_top_renderer, widget)

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

	if gamepad_active then
		self.menu_input_description:draw(ui_top_renderer, dt)
	end

	return 
end
IngamePlayerListUI.can_host_solo_kick = function (self)
	return self.is_server and Managers.player:num_human_players() == 2
end
IngamePlayerListUI.kick_player = function (self, player)
	local kick_peer_id = player.peer_id

	if self.can_host_solo_kick(self) then
		self.network_server:kick_peer(kick_peer_id)
	else
		local vote_data = {
			kick_peer_id = kick_peer_id
		}

		Managers.state.voting:request_vote("kick_player", vote_data, Network.peer_id())
		self.set_active(self, false)
	end

	return 
end
IngamePlayerListUI.kick_player_available = function (self, player)
	local peer_id = player.peer_id

	if peer_id == Network.peer_id() then
		return false
	end

	if not Managers.state.voting:can_start_vote("kick_player") then
		return false
	end

	return true
end
IngamePlayerListUI.show_profile_by_peer_id = function (self, peer_id)
	local platform = self.platform

	if platform == "win32" and rawget(_G, "Steam") then
		local id = Steam.id_hex_to_dec(peer_id)
		local url = "http://steamcommunity.com/profiles/" .. id

		Steam.open_url(url)
	elseif platform == "xb1" then
		local xuid = self.network_lobby.lobby:xuid(peer_id)

		if xuid then
			XboxLive.show_gamercard(Managers.account:user_id(), xuid)
		end
	elseif platform == "ps4" then
		local np_id = self.network_lobby.lobby:np_id_from_peer_id(peer_id)

		Managers.account:show_player_profile_with_np_id(np_id)
	end

	return 
end

return 
