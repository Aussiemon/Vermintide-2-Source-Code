require("scripts/helpers/steam_helper")
require("scripts/utils/base64")

local DO_RELOAD = false
local definitions = local_require("scripts/ui/views/friends_view_definitions")
FriendsView = class(FriendsView)
local INVITE_COOLDOWN_TIMER = 2
local FRIENDS_REFRESH_STEP, FRIENDS_LIST_LIMIT = nil

if PLATFORM == "ps4" then
	FRIENDS_REFRESH_STEP = 20
	FRIENDS_LIST_LIMIT = 500
else
	FRIENDS_REFRESH_STEP = 3
	FRIENDS_LIST_LIMIT = 400
end

local PLAYER_NAME_MAX_LENGTH = 18
local player_name_max_length_info = 15
script_data.debug_friends_view = script_data.debug_friends_view or Development.parameter("debug_friends_view")
local generic_input_actions = {
	{
		input_action = "back",
		priority = 50,
		description_text = "input_description_close"
	}
}
local input_description_data = {
	name = "friendslist",
	gamepad_support = true,
	actions = {}
}
local input_actions = {
	win32 = {},
	xb1 = {
		invite = {
			input_action = "refresh",
			priority = 3,
			description_text = "input_description_invite"
		},
		show_profile = {
			input_action = "confirm",
			priority = 4,
			description_text = "input_description_show_profile_xb1"
		}
	},
	ps4 = {
		invite = {
			input_action = "refresh",
			priority = 3,
			description_text = "input_description_invite"
		},
		join = {
			input_action = "special_1",
			priority = 2,
			description_text = "input_description_join"
		},
		show_profile = {
			input_action = "confirm",
			priority = 4,
			description_text = "input_description_show_profile"
		}
	}
}
FriendsView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.network_lobby = ingame_ui_context.network_lobby
	self.matchmaking_manager = ingame_ui_context.matchmaking_manager
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.network_server = ingame_ui_context.network_server
	self.is_server = ingame_ui_context.is_server
	self.is_in_inn = ingame_ui_context.is_in_inn
	local input_manager = ingame_ui_context.input_manager

	input_manager.create_input_service(input_manager, "friends_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager.map_device_to_service(input_manager, "friends_view", "keyboard")
	input_manager.map_device_to_service(input_manager, "friends_view", "mouse")
	input_manager.map_device_to_service(input_manager, "friends_view", "gamepad")

	self.input_manager = input_manager
	local world_manager = ingame_ui_context.world_manager
	local world = world_manager.world(world_manager, "level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self.invite_cooldown_list = {}
	self.friends = {}
	self.friends_n = 0
	self.playing_bulldozer_friends = {}
	self.playing_bulldozer_friends_n = 0
	self.online_friends = {}
	self.online_friends_n = 0
	self.offline_friends = {}
	self.offline_friends_n = 0
	self.friends_update_timer = 0
	self.active = false
	self.selected_id = nil
	self.controller_cooldown = 0

	self.create_ui_elements(self)

	self.scenegraph_button_map = {
		invite_button = self.invite_button,
		join_button = self.join_button
	}
	local input_service = self.input_manager:get_service("friends_view")
	local number_of_actvie_descriptions = 4
	local gui_layer = definitions.scenegraph_definition.root.position[3]
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, number_of_actvie_descriptions, gui_layer, generic_input_actions)

	self.menu_input_description:set_input_description(nil)

	if PLATFORM ~= "xb1" then
		self.refresh_friends(self)
	end

	return 
end
FriendsView.set_active = function (self, active, ignore_input_service)
	self.active = active
	self.selected_id = nil

	if active then
		self.play_sound(self, "Play_hud_button_open")

		if not ignore_input_service then
			self.input_manager:block_device_except_service("friends_view", "keyboard", 1)
			self.input_manager:block_device_except_service("friends_view", "mouse", 1)
			self.input_manager:block_device_except_service("friends_view", "gamepad", 1)
		end

		if not self.selected_id then
			local friend_list = self.friend_list
			local friend_list_content = friend_list.content.list_content
			local list_style = friend_list.style.list_style
			local item_styles = list_style.item_styles
			local friends = self.friends

			for i = 1, #friend_list_content, 1 do
				local content = friend_list_content[i]

				if content then
					local id = content.id

					if id then
						if not self.selected_id then
							self.selected_index = nil

							self.on_entry_pressed(self, id, i, true)
						end

						self.setup_widget(self, friends[id], id, content, item_styles[i])
					end
				end
			end
		end

		self.set_scroll_amount(self, 0)
	else
		self.play_sound(self, "Play_hud_button_close")
	end

	return 
end
FriendsView.is_active = function (self)
	return self.active
end
FriendsView.on_enter = function (self)
	self.input_manager:block_device_except_service("friends_view", "keyboard", 1)
	self.input_manager:block_device_except_service("friends_view", "mouse", 1)
	self.input_manager:block_device_except_service("friends_view", "gamepad", 1)
	ShowCursorStack.push()

	if PLATFORM == "xb1" and Managers.account:setup_friendslist() then
		self.updating_friend_info = true
		self.friends_update_timer = FRIENDS_REFRESH_STEP
	end

	self.set_active(self, true)

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
		ShadingEnvironment.apply(shading_env)
	end

	return 
end
FriendsView.on_exit = function (self)
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)
	ShowCursorStack.pop()
	self.set_active(self, false)

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
		ShadingEnvironment.apply(shading_env)
	end

	return 
end
FriendsView.exit = function (self, return_to_game)
	local exit_transition = (return_to_game and "exit_menu") or "ingame_menu"

	self.ingame_ui:handle_transition(exit_transition)

	return 
end
FriendsView.suspend = function (self)
	self.suspended = true

	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	return 
end
FriendsView.unsuspend = function (self)
	self.input_manager:block_device_except_service("friends_view", "keyboard", 1)
	self.input_manager:block_device_except_service("friends_view", "mouse", 1)
	self.input_manager:block_device_except_service("friends_view", "gamepad", 1)

	self.suspended = nil

	return 
end
FriendsView.input_service = function (self)
	return self.input_manager:get_service("friends_view")
end
FriendsView.destroy = function (self)
	self.menu_input_description:destroy()

	self.menu_input_description = nil
	self.cached_friends_list = nil

	return 
end
FriendsView.create_ui_elements = function (self)
	self.ui_animations = {}
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	local scrollbar_scenegraph_id = "friend_list_scrollbar_root"
	local scrollbar_scenegraph = definitions.scenegraph_definition[scrollbar_scenegraph_id]
	self.scrollbar_widget = UIWidget.init(UIWidgets.create_scrollbar(scrollbar_scenegraph_id, scrollbar_scenegraph.size))
	self.scroll_field_widget = UIWidget.init(widget_definitions.scroll_field)
	self.logo = UIWidget.init(widget_definitions.logo)
	self.dead_space_filler = UIWidget.init(widget_definitions.dead_space_filler)
	self.background = UIWidget.init(widget_definitions.background)
	self.background_statue_left = UIWidget.init(widget_definitions.background_statue_left)
	self.title = UIWidget.init(widget_definitions.title)
	self.info_title = UIWidget.init(widget_definitions.info_title)
	local friend_info_widget_definitions = definitions.friend_info_widget_definitions
	self.friend_info = UIWidget.init(friend_info_widget_definitions.friend_info)
	self.controller_invite_text = UIWidget.init(friend_info_widget_definitions.controller_invite_text)
	self.friend_info_title = UIWidget.init(friend_info_widget_definitions.friend_info_title)
	self.friend_info_update_icon = UIWidget.init(friend_info_widget_definitions.update_friend_info_icon)
	local button_widgets = definitions.button_widgets
	self.close_button = UIWidget.init(button_widgets.close_button)
	self.join_button = UIWidget.init(button_widgets.join_button)
	self.invite_button = UIWidget.init(button_widgets.invite_button)
	self.console_cursor = UIWidget.init(definitions.console_cursor_definition)
	local friend_list = UIWidget.init(definitions.friend_list_definition)
	local list_content = friend_list.content.list_content
	local list_style = friend_list.style.list_style
	local item_styles = list_style.item_styles

	for i = 1, FRIENDS_LIST_LIMIT, 1 do
		local content, style = self.create_friend_entry(self, i)
		list_content[i] = content
		item_styles[i] = style
	end

	list_style.start_index = 1
	list_style.num_draws = 10
	self.friend_list = friend_list
	DO_RELOAD = false

	return 
end
FriendsView.create_friend_entry = function (self, i)
	local size_y = definitions.scenegraph_definition.friend_list.size[2]
	local offset_y = size_y * -1
	local content = {
		name = "n/a",
		selected = false,
		hover_texture = "friends_list_window_entry_select",
		button_hotspot = {},
		controller_button_hotspot = {}
	}
	local style = {
		list_member_offset = {
			0,
			offset_y,
			0
		},
		name = {
			font_size = 22,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark",
			selected_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			bulldozer_color = Colors.get_color_table_with_alpha("online_green", 255),
			online_color = Colors.get_color_table_with_alpha("white", 255),
			offline_color = Colors.get_color_table_with_alpha("gray", 255),
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				10,
				0,
				1
			}
		},
		hover_texture = {
			offset = {
				3,
				0,
				0
			},
			color = Colors.get_color_table_with_alpha("light_slate_gray", 255),
			size = {
				300,
				25
			}
		}
	}

	return content, style
end

local function format_friend_data(data)
	if PLATFORM == "ps4" then
		local this_title_id = Managers.account:np_title_id()
		local friend_list = data.friendList

		for i = 1, #friend_list, 1 do
			local friend = friend_list[i]
			local presonal_detail = friend.personalDetail
			local name = (presonal_detail and presonal_detail.name) or friend.onlineId
			local presence_info = friend.presence.primaryInfo
			local playing_title_id = presence_info.gameTitleInfo and presence_info.gameTitleInfo.npTitleId
			local playing_this_game = playing_title_id == this_title_id
			local playing_game = nil

			if playing_title_id then
				playing_game = {}

				if playing_this_game and presence_info.gameData then
					playing_game.lobby = from_base64(presence_info.gameData)
				end
			end

			data[friend.onlineId] = {
				name = name,
				status = presence_info.onlineStatus,
				playing_this_game = playing_this_game,
				playing_game = playing_game,
				presence_status = presence_info.gameStatus,
				np_id = (script_data.debug_friends and "") or WebApi.convert_np_id(friend.npId)
			}
		end

		data.friendList = nil
		data.start = nil
		data.size = nil
		data.totalResults = nil
	end

	return 
end

FriendsView.refresh_friends = function (self)
	Managers.account:get_friends(FRIENDS_LIST_LIMIT, callback(self, "cb_refresh_friends_done"))

	return 
end
local EMPTY_TABLE = {}
FriendsView.cb_refresh_friends_done = function (self, friends_list, use_cached_friends_list)
	if use_cached_friends_list and not self.cached_friends_list then
	end

	if friends_list then
		if not use_cached_friends_list then
			format_friend_data(friends_list)
		end
	else
		friends_list = EMPTY_TABLE
	end

	self.cached_friends_list = friends_list
	local friends = self.friends
	local playing_bulldozer_friends = self.playing_bulldozer_friends

	for i = #playing_bulldozer_friends, 1, -1 do
		local id = playing_bulldozer_friends[i]

		if not friends_list[id] then
			table.remove(playing_bulldozer_friends, i)

			friends[id] = nil
		end
	end

	local online_friends = self.online_friends

	for i = #online_friends, 1, -1 do
		local id = online_friends[i]

		if not friends_list[id] then
			table.remove(online_friends, i)

			friends[id] = nil
		end
	end

	local offline_friends = self.offline_friends

	for i = #offline_friends, 1, -1 do
		local id = offline_friends[i]

		if not friends_list[id] then
			table.remove(offline_friends, i)

			friends[id] = nil
		end
	end

	for id, data in pairs(friends_list) do
		local saved_data = friends[id]

		if not saved_data then
			friends[id] = data

			if data.status == "offline" then
				table.insert(offline_friends, id)
			elseif data.playing_this_game then
				table.insert(playing_bulldozer_friends, id)
			else
				table.insert(online_friends, id)
			end
		else
			if saved_data.status ~= data.status then
				saved_data.status = data.status
			end

			if saved_data.playing_game ~= data.playing_game then
				saved_data.playing_game = data.playing_game
			end

			if saved_data.playing_this_game ~= data.playing_this_game then
				saved_data.playing_this_game = data.playing_this_game
			end

			if saved_data.name ~= data.name then
				saved_data.name = data.name
			end

			if saved_data.presence_status ~= data.presence_status then
				saved_data.presence_status = data.presence_status
			end
		end
	end

	for i = #offline_friends, 1, -1 do
		local id = offline_friends[i]
		local data = friends[id]

		if data.status ~= "offline" then
			table.remove(offline_friends, i)
			table.insert(online_friends, id)
		end
	end

	for i = #online_friends, 1, -1 do
		local id = online_friends[i]
		local data = friends[id]

		if data.status == "offline" then
			table.remove(online_friends, i)
			table.insert(offline_friends, id)
		elseif data.playing_this_game then
			table.remove(online_friends, i)
			table.insert(playing_bulldozer_friends, id)
		end
	end

	for i = #playing_bulldozer_friends, 1, -1 do
		local id = playing_bulldozer_friends[i]
		local data = friends[id]

		if data.status == "offline" then
			table.remove(playing_bulldozer_friends, i)
			table.insert(offline_friends, id)
		elseif not data.playing_this_game then
			table.remove(playing_bulldozer_friends, i)
			table.insert(online_friends, id)
		end
	end

	local function sort(a, b)
		local data1 = friends[a]
		local data2 = friends[b]

		return data1.name < data2.name
	end

	table.sort(online_friends, sort)
	table.sort(offline_friends, sort)
	table.sort(playing_bulldozer_friends, sort)

	local offline_friends_n = #offline_friends
	local online_friends_n = #online_friends
	local playing_bulldozer_friends_n = #playing_bulldozer_friends
	local friends_n = offline_friends_n + online_friends_n + playing_bulldozer_friends_n
	local friend_list = self.friend_list
	local list_content = friend_list.content.list_content
	local list_style = friend_list.style.list_style
	local item_styles = list_style.item_styles
	local num_entries = #list_content

	if num_entries < friends_n then
		local new_entries = friends_n - num_entries
		local start = num_entries + 1

		if script_data.debug_friends_view then
			printf("Adding %s entries to friends view, start: %s", tostring(new_entries), start)
		end

		for i = start, (start + new_entries) - 1, 1 do
			local content, style = self.create_friend_entry(self, i)
			list_content[i] = content
			item_styles[i] = style
		end

		friend_list.element.pass_data[1].num_list_elements = nil
	end

	local index = 0

	for i = 1, playing_bulldozer_friends_n, 1 do
		index = index + 1
		local id = playing_bulldozer_friends[i]

		self.setup_widget(self, friends[id], id, list_content[index], item_styles[index])
	end

	for i = 1, online_friends_n, 1 do
		index = index + 1
		local id = online_friends[i]

		self.setup_widget(self, friends[id], id, list_content[index], item_styles[index])
	end

	for i = 1, offline_friends_n, 1 do
		index = index + 1
		local id = offline_friends[i]

		self.setup_widget(self, friends[id], id, list_content[index], item_styles[index])
	end

	list_style.num_draws = math.min(21, friends_n)
	self.offline_friends_n = offline_friends_n
	self.online_friends_n = online_friends_n
	self.playing_bulldozer_friends_n = playing_bulldozer_friends_n
	self.friends_n = friends_n
	local selected_id = self.selected_id

	if selected_id then
		local friend_data = friends[selected_id]

		if friend_data then
			self.setup_info_window(self, friend_data, selected_id)
		end
	end

	local overflowing_friends = friends_n - list_style.num_draws

	if overflowing_friends <= 0 then
		self.scrollbar_widget.content.scroll_step = 0
	else
		local bar_length = math.min(1 - math.max(overflowing_friends / friends_n, 0.1), 0.9)
		local steps_possible = 1 / overflowing_friends
		self.scrollbar_widget.content.scroll_bar_info.bar_height_percentage = bar_length
		self.scrollbar_widget.content.button_scroll_step = steps_possible
		self.scroll_field_widget.content.scroll_step = steps_possible
	end

	if PLATFORM == "ps4" and not use_cached_friends_list then
		self.refresh_psn_room_data(self, friends, playing_bulldozer_friends)
	end

	return 
end
FriendsView.refresh_psn_room_data = function (self, friends, playing_bulldozer_friends)
	local room_ids = {}

	for i = 1, #playing_bulldozer_friends, 1 do
		local id = playing_bulldozer_friends[i]
		local data = friends[id]
		local room_id = data.playing_game.lobby

		if room_id then
			room_ids[#room_ids + 1] = room_id
		end
	end

	if 0 < #room_ids then
		LobbyInternal.room_data_refresh(room_ids)
	end

	return 
end
FriendsView.setup_widget = function (self, friend_data, id, content, style)
	local name = (friend_data and friend_data.name) or "n/a"
	content.name = (PLAYER_NAME_MAX_LENGTH < UTF8Utils.string_length(name) and UIRenderer.crop_text_width(self.ui_top_renderer, name, 370, style.name)) or name
	content.id = id

	if self.selected_id == id then
		content.selected = true
	else
		content.selected = false
	end

	local name_style = style.name

	if content.selected then
		name_style.text_color = name_style.selected_color
	elseif friend_data and friend_data.playing_this_game then
		name_style.text_color = name_style.bulldozer_color
	elseif not friend_data or friend_data.status == "offline" then
		name_style.text_color = name_style.offline_color
	else
		name_style.text_color = name_style.online_color
	end

	return 
end
FriendsView._extract_level_and_difficulty_from_presence = function (self, presence)
	local low_presence = string.lower(presence)
	local ret_level_name, ret_level_image, ret_num_players = nil
	local ret_difficulty = "-"
	local levels = table.clone(UnlockableLevels)
	levels[#levels + 1] = "inn_level"

	for _, level_name in pairs(levels) do
		for _, localized_level_name in pairs(LEVEL_TRANSLATIONS[level_name]) do
			if string.find(low_presence, string.lower(localized_level_name)) then
				local level_settings = LevelSettings[level_name]
				ret_level_name = Localize(level_settings.display_name)
				ret_level_image = level_settings.level_image

				break
			end
		end
	end

	for _, difficulty in pairs(Difficulties) do
		local difficulty_settings = DifficultySettings[difficulty]

		for _, localized_difficulty in pairs(DIFFICULTY_TRANSLATIONS[difficulty]) do
			if string.find(low_presence, string.lower(localized_difficulty)) then
				ret_difficulty = localized_difficulty

				break
			end
		end
	end

	local index = string.find(presence, "/")

	if index then
		local new_str = string.sub(presence, index - 1)
		new_str = string.sub(new_str, 1, -2)
		ret_num_players = new_str
		presence = string.sub(presence, 1, index - 3)
	end

	return ret_level_name, ret_difficulty, ret_level_image, ret_num_players, presence
end
FriendsView.cb_presence_async_done = function (self, friend_data, xuid, data)
	if data.presence then
		local presence = data.presence
		local level_name, difficulty, level_image, num_players, presence = self._extract_level_and_difficulty_from_presence(self, presence or "")
		friend_data.content.difficulty_name = difficulty or ""
		friend_data.content.level_name = level_name or ""
		friend_data.content.num_players = num_players or ""
		friend_data.content.level_image = level_image or "level_image_any"
		friend_data.content.info_title = presence
		self._current_friend_data = friend_data
		self.updating_friend_info = false
		friend_data.content.display_game_info = presence ~= "" and presence ~= "Inn menus" and presence ~= "Playing tutorial"
		friend_data.content.in_idle = presence ~= "" and presence ~= "Inn menus"
		self._show_level_info = presence ~= "" and presence ~= "Inn menus"
		self._show_game_info = presence ~= "" and presence ~= "Inn menus" and presence ~= "Playing tutorial"
		local num_human_players = Managers.player:num_human_players()
		local current_level = Managers.state.game_mode:level_key()
		local disable_invite = num_human_players == 4 or current_level == "tutorial" or presence == ""
		self._disable_invite = disable_invite

		self.update_input_description(self, not disable_invite, false)
	else
		friend_data.content.display_game_info = false
		friend_data.content.in_idle = false
		self._show_level_info = false
		self._disable_invite = true

		self.update_input_description(self, false, false)
	end

	self._current_xbox_user_id = xuid

	return 
end
FriendsView.setup_info_window = function (self, friend_data, id, first_update)
	local disable_join = true
	local disable_invite = false
	local has_lobby_data = false
	local idle_in_menu = false
	local friend_info = self.friend_info
	local friend_info_title = self.friend_info_title
	local info_title_content = friend_info_title.content
	local info_title_style = friend_info_title.style
	local player_online = friend_data.status ~= "offline"

	if player_online then
		info_title_content.status = Localize("status_online")
		info_title_style.status.text_color = Colors.get_color_table_with_alpha("online_green", 255)
		friend_info.content.disable_image = "friendslist_image_02"
	else
		info_title_content.status = Localize("status_offline")
		info_title_style.status.text_color = Colors.get_color_table_with_alpha("red", 255)
		friend_info.content.disable_image = "friendslist_image_01"
		disable_invite = true
	end

	local name = friend_data.name

	fassert(name ~= nil, "Sanity Check")

	info_title_content.name = UIRenderer.crop_text(name, player_name_max_length_info)

	if friend_data.playing_this_game then
		local level, level_image, num_players, difficulty = nil
		local lobby_id = friend_data.playing_game and friend_data.playing_game.lobby
		local lobby_data = lobby_id and LobbyInternal.get_lobby_data_from_id(lobby_id)

		if lobby_data then
			if lobby_data.level_key and lobby_data.level_key ~= "tutorial" then
				local level_settings = rawget(LevelSettings, lobby_data.level_key)

				if level_settings then
					level = level_settings.display_name
					level_image = level_settings.level_image
				else
					level_image = "level_image_any"
				end
			end

			if lobby_data.difficulty then
				local lobby_difficulty = lobby_data.difficulty
				local difficulty_settings = DifficultySettings[lobby_difficulty]
				difficulty = Localize(difficulty_settings.display_name)
			end

			num_players = lobby_data.num_players
			local is_full_group = (num_players and 4 <= tonumber(num_players)) or false
			num_players = (num_players and string.format("%s/4", num_players)) or nil
			local network_hash = lobby_data.network_hash
			local host = lobby_data.host

			if not is_full_group and network_hash == self.network_lobby.network_hash and lobby_data.level_key ~= "tutorial" and host ~= Network.peer_id() then
				disable_join = false
			end

			friend_info.content.difficulty_name = difficulty or ""
			friend_info.content.level_name = (level and Localize(level)) or ""
			friend_info.content.num_players = num_players or ""
			friend_info.content.level_image = level_image or "level_image_any"
			friend_info.content.info_title = friend_data.presence_status or Localize("friend_list_playing_bulldozer")

			if level then
				has_lobby_data = true
			else
				has_lobby_data = false
			end
		elseif PLATFORM == "xb1" then
			local token = Presence.get_async(Managers.account:user_id(), friend_data.xbox_user_id)

			if token ~= -1 then
				local presence_token = ScriptPresenceToken:new(token)

				Managers.token:register_token(presence_token, callback(self, "cb_presence_async_done", friend_info, friend_data.xbox_user_id))

				first_update = friend_data.xbox_user_id ~= self._current_xbox_user_id
				self._show_level_info = (not first_update and self._show_level_info) or nil
				friend_info.content.display_game_info = (not first_update and self._show_game_info) or nil

				if first_update then
					disable_invite = true
				else
					disable_invite = self._disable_invite
				end
			else
				friend_info.content.display_game_info = false
				friend_info.content.in_idle = false
				self._show_level_info = false
				self._disable_invite = true

				self.update_input_description(self, false, false)
			end
		else
			idle_in_menu = true
		end
	else
		friend_info.content.info_title = ""
		friend_info.content.display_game_info = false
		friend_info.content.in_idle = false
		self._show_level_info = false
		self._disable_invite = true

		self.update_input_description(self, false, false)
	end

	if PLATFORM == "xb1" then
		disable_join = true
	end

	if idle_in_menu then
		local level = "inn_level"
		friend_info.content.level_name = friend_data.presence_status or (level and Localize(level)) or ""
		friend_info.content.level_image = "level_image_red_moon_inn"
		friend_info.content.info_title = Localize("friend_list_not_in_lobby")
	end

	self.join_button.content.button_hotspot.disabled = disable_join
	self.disable_invite_button = disable_invite
	self.invite_button.content.button_hotspot.disabled = self.disable_invite_button or (self.invite_cooldown_list[id] and true) or false
	local ui_scenegraph = self.ui_scenegraph

	if PLATFORM == "xb1" then
		self.updating_friend_info = first_update
	else
		self.updating_friend_info = (first_update or not has_lobby_data) and friend_data.playing_this_game
		friend_info.content.display_game_info = has_lobby_data and not idle_in_menu
		friend_info.content.in_idle = idle_in_menu
	end

	self.update_input_description(self, not disable_invite, not disable_join)

	return 
end
FriendsView.on_join_button_clicked = function (self)
	local id = self.selected_id
	local friend_data = self.friends[id]

	if PLATFORM == "xb1" then
		XboxLive.show_gamercard(Managers.account:user_id(), friend_data.xbox_user_id)
	elseif self.network_server and not self.network_server:are_all_peers_ingame() then
		self.popup_id = Managers.popup:queue_popup(Localize("popup_join_blocked_by_joining_player"), Localize("popup_invite_not_installed_header"), "ok", Localize("menu_ok"))
	else
		local lobby_id = friend_data.playing_game.lobby

		if lobby_id then
			local lobby_data = LobbyInternal.get_lobby_data_from_id(lobby_id)
			local level = lobby_data.level_key
			lobby_data.id = lobby_id
			local player = Managers.player:local_player(1)

			Managers.telemetry.events:ui_joined_game(player)

			if not self.is_server or not self.is_in_inn then
				self.ingame_ui:handle_transition("join_lobby", lobby_data)
			else
				Managers.matchmaking:request_join_lobby(lobby_data, {
					friend_join = true
				})
				self.exit(self, true)
			end
		end
	end

	local join_button_content = self.join_button.content
	join_button_content.button_hotspot.on_release = false

	return 
end
FriendsView.on_invite_button_clicked = function (self, gamepad_active)
	local id = self.selected_id
	local friend_data = self.friends[id]
	self.invite_cooldown_list[id] = INVITE_COOLDOWN_TIMER
	self.invite_button.content.button_hotspot.disabled = true
	local player = Managers.player:local_player(1)

	Managers.telemetry.events:ui_invite_sent(player)

	local invite_target = self.network_lobby:invite_target()

	if rawget(_G, "Steam") and rawget(_G, "Friends") then
		Friends.invite(id, invite_target)
	elseif PLATFORM == "ps4" or PLATFORM == "xb1" then
		Managers.account:send_session_invitation(id, invite_target)
	else
		print("FriendsView:on_invite_button_clicked(), Join not supported..")
	end

	if gamepad_active then
		self.start_invite_text_animation(self)
	end

	return 
end
FriendsView.on_show_gamercard_clicked = function (self)
	local id = self.selected_id
	local platform = PLATFORM

	if platform == "win32" and rawget(_G, "Steam") then
		local dec_id = Steam.id_hex_to_dec(id)
		local url = "http://steamcommunity.com/profiles/" .. dec_id

		Steam.open_url(url)
	elseif platform == "xb1" then
		local friend_data = self.friends[id]

		XboxLive.show_gamercard(Managers.account:user_id(), friend_data.xbox_user_id)
	elseif platform == "ps4" then
		local friend_data = self.friends[id]
		local np_id = friend_data.np_id

		Managers.account:show_player_profile_with_np_id(np_id)
	end

	return 
end
FriendsView.on_close_button_clicked = function (self)
	local close_button = self.close_button
	local button_hotspot = close_button.content.button_hotspot

	if button_hotspot.on_hover_enter then
		self.play_sound(self, "Play_hud_hover")
	end

	local on_release = button_hotspot.on_release

	if on_release then
		self.play_sound(self, "Play_hud_select")
		table.clear(button_hotspot)
	end

	return on_release
end
FriendsView.on_entry_pressed = function (self, id, index, first_update)
	if self.selected_id == id or not id then
		return 
	end

	self.selected_id = id
	self.selected_index = index

	if PLATFORM == "ps4" then
		self.cb_refresh_friends_done(self, nil, true)
	else
		self.refresh_friends(self)

		self.friends_update_timer = 0
	end

	self.setup_info_window(self, self.friends[id], id, first_update)

	return 
end
FriendsView.start_invite_text_animation = function (self, text)
	local widget = self.controller_invite_text
	local text_color = widget.style.text.text_color
	local animation_name = "controller_invite_text"
	local fade_in_time = 0.3
	local duration_time = 0.3
	local fade_out_time = 0.5
	self.ui_animations[animation_name] = UIAnimation.init(UIAnimation.function_by_time, text_color, 1, 0, 255, fade_in_time, math.easeCubic, UIAnimation.wait, duration_time, UIAnimation.function_by_time, text_color, 1, 255, 0, fade_out_time, math.easeCubic)

	return 
end
FriendsView.update = function (self, dt, t, is_sub_menu, optional_input_service)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	if self.suspended then
		return 
	end

	for name, animation in pairs(self.ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			animation = nil
		end
	end

	if self.popup_id then
		local result = Managers.popup:query_result(self.popup_id)

		if result then
			self.popup_id = nil
		end
	end

	self.update_invite_cooldowns(self, dt)

	local friends_update_timer = self.friends_update_timer + dt

	if FRIENDS_REFRESH_STEP <= friends_update_timer then
		friends_update_timer = friends_update_timer - FRIENDS_REFRESH_STEP

		self.refresh_friends(self)
	end

	self.friends_update_timer = friends_update_timer

	if script_data.debug_friends_view then
		local friends = self.friends

		Debug.text("PLAYING BULLDOZER FRIENDS")

		local playing_bulldozer_friends = self.playing_bulldozer_friends
		local playing_bulldozer_friends_n = self.playing_bulldozer_friends_n

		for i = 1, playing_bulldozer_friends_n, 1 do
			local data = friends[playing_bulldozer_friends[i]]

			Debug.text("   * %s", data.name)
		end

		Debug.text("ONLINE FRIENDS")

		local online_friends = self.online_friends
		local online_friends_n = self.online_friends_n

		for i = 1, online_friends_n, 1 do
			local data = friends[online_friends[i]]

			Debug.text("   * %s", data.name)
		end

		Debug.text("OFFLINE FRIENDS")

		local offline_friends = self.offline_friends
		local offline_friends_n = self.offline_friends_n

		for i = 1, offline_friends_n, 1 do
			local id = offline_friends[i]
			local data = friends[id]

			Debug.text("   * %s", data.name)
		end
	end

	if self.active then
		local input_manager = self.input_manager
		local input_service = optional_input_service or input_manager.get_service(input_manager, "friends_view")
		local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")

		if not is_sub_menu and (self.on_close_button_clicked(self) or input_service.get(input_service, "toggle_menu", true) or input_service.get(input_service, "back", true)) then
			if gamepad_active then
				self.play_sound(self, "Play_hud_select")
			end

			self.exit(self)

			return 
		end

		self.update_scroll(self)
		self.draw(self, gamepad_active, dt, input_service)
		self.update_buttons(self, dt, nil, input_service)
	end

	return 
end
FriendsView.update_invite_cooldowns = function (self, dt)
	local invite_cooldown_list = self.invite_cooldown_list

	for id, cooldown in pairs(invite_cooldown_list) do
		cooldown = cooldown - dt

		if 0 < cooldown then
			invite_cooldown_list[id] = cooldown
		else
			invite_cooldown_list[id] = nil

			if id == self.selected_id and not self.disable_invite_button then
				self.invite_button.content.button_hotspot.disabled = false

				print("Ready To invite again!")
			end
		end
	end

	return 
end
FriendsView.draw = function (self, gamepad_active, dt, input_service)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	ui_scenegraph.background_statue_left.local_position = {
		-20,
		39,
		10
	}

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
	UIRenderer.draw_widget(ui_top_renderer, self.logo)
	UIRenderer.draw_widget(ui_top_renderer, self.dead_space_filler)
	UIRenderer.draw_widget(ui_top_renderer, self.background)
	UIRenderer.draw_widget(ui_top_renderer, self.background_statue_left)
	UIRenderer.draw_widget(ui_top_renderer, self.title)
	UIRenderer.draw_widget(ui_top_renderer, self.info_title)
	UIRenderer.draw_widget(ui_top_renderer, self.scrollbar_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.scroll_field_widget)

	if not gamepad_active then
		UIRenderer.draw_widget(ui_top_renderer, self.close_button)
	end

	UIRenderer.draw_widget(ui_top_renderer, self.friend_list)

	if self.selected_id then
		UIRenderer.draw_widget(ui_top_renderer, self.friend_info_title)

		if self.updating_friend_info then
			local connecting_rotation_speed = 350
			local connecting_rotation_angle = (dt * connecting_rotation_speed) % 360
			local connecting_radians = math.degrees_to_radians(connecting_rotation_angle)
			local update_icon_widget = self.friend_info_update_icon
			update_icon_widget.style.texture_id.angle = update_icon_widget.style.texture_id.angle + connecting_radians

			UIRenderer.draw_widget(ui_top_renderer, update_icon_widget)
		else
			UIRenderer.draw_widget(ui_top_renderer, self.friend_info)

			if not gamepad_active or PLATFORM == "win32" then
				UIRenderer.draw_widget(ui_top_renderer, self.join_button)
				UIRenderer.draw_widget(ui_top_renderer, self.invite_button)
			else
				UIRenderer.draw_widget(ui_top_renderer, self.controller_invite_text)
			end
		end

		UIRenderer.draw_widget(ui_top_renderer, self.console_cursor)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self.menu_input_description:draw(ui_top_renderer, dt)
	end

	return 
end
FriendsView.draw_friends = function (self, ui_renderer, dt)
	local friend_widgets = self.friend_widgets
	local friends_n = self.friends_n

	for i = 1, friends_n, 1 do
		UIRenderer.draw_widget(ui_renderer, friend_widgets[i])
	end

	return 
end
FriendsView.update_buttons = function (self, dt, optional_select_index, input_service)
	local friend_list = self.friend_list
	local friend_list_content = friend_list.content.list_content
	local friend_list_style = friend_list.style.list_style
	local start_index = friend_list_style.start_index
	local num_draws = friend_list_style.num_draws - 1
	local stop_index = math.min(start_index + num_draws, #friend_list_content)
	start_index = math.max(1, stop_index - num_draws)

	for i = start_index, stop_index, 1 do
		local content = friend_list_content[i]

		if content.button_hotspot.on_hover_enter then
			self.play_sound(self, "Play_hud_hover")
		end

		if content.button_hotspot.on_release or content.controller_button_hotspot.on_release or optional_select_index == i then
			self.play_sound(self, "Play_hud_select")
			self.on_entry_pressed(self, content.id, i)

			break
		end
	end

	local input_manager = self.input_manager
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")

	if self.selected_id then
		local join_button_content = self.join_button.content
		local invite_button_content = self.invite_button.content

		if invite_button_content.button_hotspot.on_hover_enter or join_button_content.button_hotspot.on_hover_enter then
			self.play_sound(self, "Play_hud_hover")
		end

		local platform = PLATFORM

		if platform ~= "xb1" and not join_button_content.button_hotspot.disabled and (join_button_content.button_hotspot.on_release or input_service.get(input_service, "special_1")) then
			self.play_sound(self, "Play_hud_select")
			self.on_join_button_clicked(self)
		elseif not invite_button_content.button_hotspot.disabled and (invite_button_content.button_hotspot.on_release or input_service.get(input_service, "refresh")) then
			self.play_sound(self, "Play_hud_select")

			invite_button_content.button_hotspot.on_release = nil

			self.on_invite_button_clicked(self, gamepad_active)
		elseif input_service.get(input_service, "special_1") then
			self.play_sound(self, "Play_hud_select")
			self.on_show_gamercard_clicked(self)
		end
	end

	return 
end
FriendsView.update_scroll = function (self)
	local scroll_bar_value = self.scrollbar_widget.content.scroll_bar_info.value
	local mouse_scroll_value = self.scroll_field_widget.content.internal_scroll_value
	local current_scroll_value = self.scroll_value

	if current_scroll_value ~= mouse_scroll_value then
		self.set_scroll_amount(self, mouse_scroll_value)
	elseif current_scroll_value ~= scroll_bar_value then
		self.set_scroll_amount(self, scroll_bar_value)
	end

	return 
end
FriendsView.set_scroll_amount = function (self, value)
	local current_scroll_value = self.scroll_value

	if not current_scroll_value or value ~= current_scroll_value then
		local widget_scroll_bar_info = self.scrollbar_widget.content.scroll_bar_info
		widget_scroll_bar_info.value = value
		self.scroll_field_widget.content.internal_scroll_value = value
		self.scroll_value = value

		self.on_scroll_changed(self, value)
	end

	return 
end
FriendsView.on_scroll_changed = function (self, value)
	local friend_list = self.friend_list
	local list_style = friend_list.style.list_style
	local max_visible_elements = list_style.num_draws
	local total_elements = self.friends_n

	if max_visible_elements and max_visible_elements < total_elements then
		local current_scroll_value = value
		local new_start_index = math.max(0, math.round(current_scroll_value * (total_elements - max_visible_elements))) + 1
		list_style.start_index = new_start_index
	end

	return 
end
FriendsView.is_entry_outside = function (self, index)
	local friend_list = self.friend_list
	local list_style = friend_list.style.list_style
	local max_visible_elements = list_style.num_draws
	local total_elements = self.friends_n
	local current_start_index = list_style.start_index

	if index < current_start_index then
		return true, "above"
	elseif math.min((current_start_index + max_visible_elements) - 1, total_elements) < index then
		return true, "below"
	end

	return false
end
FriendsView.handle_controller_navigation_input = function (self, input_service, dt)
	local friends_n = self.friends_n

	if friends_n == 0 then
		return 
	end

	if 0 < self.controller_cooldown then
		self.controller_cooldown = self.controller_cooldown - dt
		local speed_multiplier = self.speed_multiplier or 1
		local decrease = GamepadSettings.menu_speed_multiplier_frame_decrease
		local min_multiplier = GamepadSettings.menu_min_speed_multiplier
		self.speed_multiplier = math.max(speed_multiplier - decrease, min_multiplier)

		return 
	else
		local friends_n = self.friends_n
		local selection_index = self.selected_index or 0
		local speed_multiplier = self.speed_multiplier or 1
		local new_selection_index = nil
		local move_up = input_service.get(input_service, "move_up")
		local move_up_hold = input_service.get(input_service, "move_up_hold")

		if move_up or move_up_hold then
			self.controller_cooldown = GamepadSettings.menu_cooldown * speed_multiplier
			new_selection_index = math.max(selection_index - 1, 1)
		else
			local move_down = input_service.get(input_service, "move_down")
			local move_down_hold = input_service.get(input_service, "move_down_hold")

			if move_down or move_down_hold then
				self.controller_cooldown = GamepadSettings.menu_cooldown * speed_multiplier
				new_selection_index = math.min(selection_index + 1, friends_n)
			end
		end

		if new_selection_index and new_selection_index ~= selection_index then
			local friend_list = self.friend_list
			local friend_list_content = friend_list.content.list_content
			local content = friend_list_content[new_selection_index]

			if content then
				local id = content.id

				self.play_sound(self, "Play_hud_hover")
				self.on_entry_pressed(self, id, new_selection_index)

				local is_outside, state = self.is_entry_outside(self, new_selection_index)

				if is_outside then
					local button_scroll_step = self.scrollbar_widget.content.button_scroll_step
					local scroll_value = self.scroll_value

					if state == "below" then
						scroll_value = math.min(scroll_value + button_scroll_step, 1)
					else
						scroll_value = math.max(scroll_value - button_scroll_step, 0)
					end

					if scroll_value ~= self.scroll_value then
						self.set_scroll_amount(self, scroll_value)
					end
				end
			end

			return 
		end
	end

	self.speed_multiplier = 1

	return 
end
FriendsView.set_console_selection = function (self, index)
	local current_controller_selection_index = self.controller_selection_index

	if current_controller_selection_index == index then
		return 
	elseif not current_controller_selection_index and index < 0 then
		index = 1
	end

	local friends_n = self.friends_n

	if friends_n < index or index < 0 then
		return 
	end

	self.controller_selection_index = index

	return 
end
FriendsView.update_input_description = function (self, can_invite, can_join)
	local actions = input_description_data.actions

	table.clear(actions)

	local platform = PLATFORM
	local availaible_actions = input_actions[platform]

	if availaible_actions.show_profile then
		actions[#actions + 1] = availaible_actions.show_profile
	end

	if can_invite and availaible_actions.invite then
		actions[#actions + 1] = availaible_actions.invite
	end

	if can_join and availaible_actions.join then
		actions[#actions + 1] = availaible_actions.join
	end

	self.menu_input_description:set_input_description(input_description_data)

	return 
end
FriendsView.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)

	return 
end

return 
