require("scripts/utils/keystroke_helper")
require("scripts/helpers/emoji_helper")

local definitions = local_require("scripts/ui/views/chat_view_definitions")
local create_entry_func = definitions.create_entry_func
local num_users_in_list = definitions.num_users_in_list
local WELCOME_MESSAGE = {
	"--------------------------------------------------------------------------",
	"    WELCOME TO VERMINTIDE 2 GLOBAL CHAT                    ",
	"                                                           ",
	"    type '/'  or click the '?' to get a list of commands   ",
	"                                                           ",
	"    Current channel: %s                                    ",
	"--------------------------------------------------------------------------",
	" ",
	" "
}
local tmp_icons = {}
ChatView = class(ChatView)
ChatView.MAX_CHARS = 512
ChatView.MAX_CHANNEL_NAME = 30
ChatView.MAX_POPULAR_CHANNELS = 5
local COMMANDS = {
	{
		command = "/join",
		description_text = "<channel_name> - Join a Channel",
		parameter = "#",
		color = Colors.get_table("red")
	},
	{
		command = "/leave",
		description_text = "<channel_name> - Leave a Channel",
		color = Colors.get_table("red")
	},
	{
		command = "/msg",
		description_text = "<user_name> <message> - Send Message to Another User",
		color = Colors.get_table("red")
	},
	{
		command = "/reply",
		description_text = "<message> - Replies to the Person You Last Spoke To",
		color = Colors.get_table("red")
	},
	{
		command = "/invite",
		description_text = "<description> - Send an Invite to Your Game",
		color = Colors.get_table("red")
	},
	{
		command = "/clear",
		description_text = "- Clears the chat",
		color = Colors.get_table("red")
	}
}

ChatView.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._network_lobby = ingame_ui_context.network_lobby
	self._matchmaking_manager = ingame_ui_context.matchmaking_manager
	self._render_settings = {
		snap_pixel_positions = false
	}
	self._network_server = ingame_ui_context.network_server
	self._current_channel_name = Managers.irc:home_channel()
	self._local_player_id = ingame_ui_context.local_player_id
	self._chat_message = ""
	self._chat_index = 1
	self._emoji_scroll = 0
	self._channels = {}
	self._popular_channel_list = {}
	self._popular_channel_list_lookup = {}
	self._list_channels_cbs = {}
	local has_joined_channel = false
	local channels = Managers.irc:get_channels()

	for channel, _ in pairs(channels) do
		if channel == self._current_channel_name then
			has_joined_channel = true

			break
		end
	end

	if not has_joined_channel then
		Managers.irc:join_channel(self._current_channel_name)
	end

	local input_manager = ingame_ui_context.input_manager
	local block_reasons = {
		keybind = true,
		channels_list = true,
		debug_screen = true,
		free_flight = true
	}

	input_manager:create_input_service("chat_view", "ChatControllerSettings", "ChatControllerFilters", block_reasons)
	input_manager:map_device_to_service("chat_view", "keyboard")
	input_manager:map_device_to_service("chat_view", "mouse")

	local block_reasons = {
		keybind = true,
		debug_screen = true,
		free_flight = true
	}

	input_manager:create_input_service("channels_list", "ChatControllerSettings", "ChatControllerFilters", block_reasons)
	input_manager:map_device_to_service("channels_list", "keyboard")
	input_manager:map_device_to_service("channels_list", "mouse")

	self._input_manager = input_manager
	local world_manager = ingame_ui_context.world_manager
	local world = world_manager:world("level_world")
	self._wwise_world = Managers.world:wwise_world(world)

	Managers.irc:register_message_callback("chat_view_private_msg", Irc.PRIVATE_MSG, callback(self, "cb_private_message"))
	Managers.irc:register_message_callback("chat_view_channel_msg", Irc.CHANNEL_MSG, callback(self, "cb_channel_message"))
	Managers.irc:register_message_callback("chat_view_join", Irc.JOIN_MSG, callback(self, "cb_join_updated"))
	Managers.irc:register_message_callback("chat_view_leave", Irc.LEAVE_MSG, callback(self, "cb_leave_updated"))
	Managers.irc:register_message_callback("chat_view_names", Irc.NAMES_MSG, callback(self, "cb_members_updated"))
	Managers.irc:register_message_callback("chat_view_meta", Irc.META_MSG, callback(self, "cb_meta_updated"))
	Managers.irc:register_message_callback("chat_view_list", Irc.LIST_MSG, callback(self, "cb_list_updated"))
	Managers.irc:register_message_callback("chat_view_list_end", Irc.LIST_END_MSG, callback(self, "cb_list_end"))
	self:_create_ui_elements()
end

ChatView.cb_private_message = function (self, key, message_type, username, message, parameter)
	local chat_output_widget = self._widgets.chat_output_widget
	local private_messages_widget = self._widgets.private_messages_widget
	local chat_output_content = chat_output_widget.content
	local private_message_content = private_messages_widget.content
	local private_messages_table = chat_output_content.private_messages_table
	private_messages_table[username] = private_messages_table[username] or {}
	local private_message_table = private_messages_table[username]
	local message, link_data = Managers.chat:check_meta(message, username, parameter)
	local emojis = EmojiHelper.parse_emojis(message)
	local new_message_table = {
		sender = username .. ": ",
		message = message,
		type = message_type
	}

	if link_data then
		new_message_table.link = link_data
	end

	if #emojis > 0 then
		new_message_table.emojis = table.clone(emojis)
	end

	private_message_table[#private_message_table + 1] = new_message_table

	if chat_output_content.private_user_name ~= username then
		private_message_content.num_private_messages = private_message_content.num_private_messages + 1
		private_message_content.new_per_user[username] = true
	end

	private_message_content.has_private_conversations = not table.is_empty(private_messages_table)
end

ChatView._find_end_index = function (self, match_str, start_index)
	local space_end_index = (string.find(match_str, " ", start_index) or math.huge) - 1
	local colon_end_index = string.find(match_str, ":", start_index) or math.huge
	local potential_end_index = (space_end_index <= colon_end_index and space_end_index) or colon_end_index

	return (potential_end_index < math.huge - 1 and potential_end_index) or nil
end

ChatView.cb_channel_message = function (self, key, message_type, username, message, parameter)
	local chat_output_widget = self._widgets.chat_output_widget
	local chat_output_content = chat_output_widget.content
	local channel_messages_table = chat_output_content.channel_messages_table
	channel_messages_table[parameter] = channel_messages_table[parameter] or {}
	local message_tables = channel_messages_table[parameter]
	local message, link_data = Managers.chat:check_meta(message, username, parameter)
	local emojis = EmojiHelper.parse_emojis(message)
	local new_message_table = {
		sender = username .. ": ",
		message = message,
		type = message_type
	}

	if link_data then
		new_message_table.link = link_data
	end

	if #emojis > 0 then
		new_message_table.emojis = table.clone(emojis)
	end

	message_tables[#message_tables + 1] = new_message_table
	chat_output_content.text_start_offset = #message_tables
end

ChatView.cb_join_updated = function (self, key, message_type, username, message, parameter)
	local my_user_name = Managers.irc:user_name()

	if username == my_user_name then
		self:_change_channel(parameter)
	end

	self:_update_members()

	PlayerData.recent_irc_channels = PlayerData.recent_irc_channels or {}
	local recent_irc_channels = PlayerData.recent_irc_channels
	local channel = parameter

	if not table.find(recent_irc_channels, channel) then
		table.insert(recent_irc_channels, 1, channel)

		while #recent_irc_channels > 5 do
			recent_irc_channels[#recent_irc_channels] = nil
		end
	end

	if username == my_user_name then
		self:_show_welcome_message()
	end
end

ChatView.cb_meta_updated = function (self, key, message_type, username, parameter, user_data)
	self:_update_members()
end

ChatView.cb_list_updated = function (self, key, message_type, username, parameter, user_data)
	print(key, message_type, username, parameter, user_data)

	self._popular_channel_list[#self._popular_channel_list + 1] = parameter .. "," .. user_data
	self._popular_channel_list_lookup = self._popular_channel_list_lookup or {}
	self._popular_channel_list_lookup[parameter] = user_data
end

ChatView.cb_list_end = function (self, key, message_type, username, parameter, user_data)
	self._list_updated = true

	local function sort_func(a, b)
		local channel_a = string.split(a, ",")
		local channel_b = string.split(b, ",")
		local a_num_clients = tonumber(channel_a[2])
		local b_num_clients = tonumber(channel_b[2])

		return b_num_clients < a_num_clients
	end

	table.sort(self._popular_channel_list, sort_func)

	if self._list_channels_cbs then
		for _, cb in ipairs(self._list_channels_cbs) do
			cb(self._popular_channel_list, self._popular_channel_list_lookup)
		end
	end

	table.clear(self._list_channels_cbs)
end

ChatView._change_channel = function (self, channel_name)
	local chat_output_widget = self._widgets.chat_output_widget
	local chat_output_content = chat_output_widget.content
	local name_list_widget = self._widgets.name_list_widget
	local name_list_content = name_list_widget.content
	self._current_channel_name = channel_name
	self._channels = self._channels or {}
	self._channels[channel_name] = channel_name
	chat_output_content.channel_name = channel_name
	name_list_content.channel_name = channel_name
	chat_output_content.private_user_name = nil
	local frame_widget = self._widgets.frame_widget
	local frame_widget_content = frame_widget.content
	frame_widget_content.private_user_name = nil
	local message_tables = chat_output_content.channel_messages_table[channel_name] or {}
	chat_output_content.text_start_offset = #message_tables

	self:_update_members()
end

ChatView._change_to_private = function (self, user_name)
	local chat_output_widget = self._widgets.chat_output_widget
	local chat_output_content = chat_output_widget.content
	chat_output_content.private_user_name = user_name
	local message_tables = chat_output_content.private_messages_table[user_name] or {}
	chat_output_content.text_start_offset = #message_tables
	local frame_widget = self._widgets.frame_widget
	local frame_widget_content = frame_widget.content
	frame_widget_content.private_user_name = user_name
	local private_messages_widget = self._widgets.private_messages_widget
	local private_messages_widget_content = private_messages_widget.content
	private_messages_widget_content.new_per_user[user_name] = nil

	Managers.chat:add_message_target(user_name, Irc.PRIVATE_MSG)
end

ChatView._list_private_messages = function (self, user_name)
	local chat_output_widget = self._widgets.chat_output_widget
	local chat_output_content = chat_output_widget.content
	local name_list_widget = self._widgets.name_list_widget
	local name_list_content = name_list_widget.content
	self._current_channel_name = user_name
	self._channels = self._channels or {}
	self._channels[channel_name] = channel_name
	chat_output_content.channel_name = channel_name
	name_list_content.channel_name = channel_name
	local message_tables = chat_output_content.channel_messages_table[channel_name] or {}
	chat_output_content.text_start_offset = #message_tables
end

ChatView.cb_leave_updated = function (self, key, message_type, username, message, parameter)
	local my_user_name = Managers.irc:user_name()

	if username == my_user_name then
		self._channels[parameter] = nil
		local channel_name = next(self._channels)
		channel_name = channel_name or " "

		self:_change_channel(channel_name)

		local chat_output_widget = self._widgets.chat_output_widget
		local chat_output_content = chat_output_widget.content
		local name_list_widget = self._widgets.name_list_widget
		local name_list_content = name_list_widget.content
		chat_output_content.channel_messages_table[parameter] = nil
		name_list_content.channel_messages_table[parameter] = nil
	end

	self:_update_members()
end

ChatView.cb_members_updated = function (self, key, message_type, username, message, parameter)
	self:_update_members()
end

ChatView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self._widgets = {}
	self._channels_list_widgets = {}
	self._popular_channel_list_widgets = {}
	self._channel_list_widgets = {}
	self._private_list_widgets = {}
	self._recent_channels_list_widgets = {}
	self._commands_list_widgets = {}
	self._filtered_user_names_list_widgets = {}
	self._create_channel_widgets = {}
	self._recent_channels_widgets = {}
	self._invite_widgets = {}
	self._emoji_widgets = {}
	local widget_definitions = definitions.widget_definitions

	for name, widget in pairs(widget_definitions.widgets) do
		self._widgets[name] = UIWidget.init(widget)
	end

	local test_max_users = 60
	local test_user_data = {}

	for i = 1, test_max_users, 1 do
		test_user_data[i] = {
			name = "test_" .. i
		}
	end

	local user_entries = {}

	for i = 1, num_users_in_list, 1 do
		local widget_definition = create_entry_func(i)
		local widget = UIWidget.init(widget_definition)
		user_entries[i] = widget
	end

	self._user_entry_widgets = user_entries

	self:_update_members()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	Managers.input:device_unblock_service("keyboard", 1, "chat_view")
	Managers.input:device_unblock_service("mouse", 1, "chat_view")
end

ChatView.on_enter = function (self)
	self:set_active(true)
end

local DO_RELOAD = true

ChatView.update = function (self, dt, t, is_sub_menu)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	if Keyboard.pressed(Keyboard.button_index("b")) then
		print("UPDATE MEMBERS")
		self:_update_members()
	end

	if self._suspended or not self._active then
		return
	end

	self:_draw(dt, t)
	self:_update_input(dt, t)
	self:_update_channels_list_input(dt, t)
	self:_update_create_channel_input(dt, t)
	self:_update_recent_channels_input(dt, t)
	self:_update_send_invite_input(dt, t)
	self:_handle_command_list(dt, t)
end

ChatView._update_filter = function (self, filter)
	local start = os.clock()
	filter = string.gsub(filter, "%W", "")
	local filter_table = KeystrokeHelper._build_utf8_table(filter)
	local num_chars_in_filter = #filter_table

	if num_chars_in_filter <= 0 then
		return
	end

	local new_sub_table = {}
	local filtered = false
	local num_chars = 1
	local has_any_matches = false
	local user_names = self._user_names

	if not user_names or #user_names <= 0 then
		return
	end

	local a, b, c = Script.temp_count()

	for i = 1, #user_names, 1 do
		if string.find(string.lower(user_names[i]), filter) then
			new_sub_table[#new_sub_table + 1] = user_names[i]
		end
	end

	if #new_sub_table > 0 then
		table.dump(new_sub_table, "NAMES", 2)

		return new_sub_table
	end

	Script.set_temp_count(a, b, c)
	print(string.format("Search time: %f", tostring(os.clock() - start)))
end

ChatView._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

ChatView._update_recent_channels_input = function (self, dt, t)
	if table.is_empty(self._recent_channels_widgets) then
		return
	end

	local input_service = Managers.input:get_service("channels_list")
	local join_button_widget = self._recent_channels_widgets.join_button
	local recent_channels_window_widget = self._recent_channels_widgets.recent_channels_window
	local join_button_content = join_button_widget.content
	local recent_channels_window_content = recent_channels_window_widget.content
	local join_button_hotspot = join_button_content.button_hotspot
	local screen_hotspot = recent_channels_window_content.screen_hotspot
	local widget_hotspot = recent_channels_window_content.widget_hotspot
	local close_hotspot = recent_channels_window_content.close_hotspot
	local list_hotspot = recent_channels_window_content.list_hotspot

	if widget_hotspot.is_hover then
		if close_hotspot.on_pressed then
			self:_destroy_recent_channels_window()
		elseif join_button_hotspot.on_pressed then
			if recent_channels_window_content.selected_channel ~= nil then
				self:_destroy_recent_channels_window(true)
				Managers.chat:send_chat_message(1, nil, "/join " .. recent_channels_window_content.selected_channel, self._recent_message_index, Irc.CHANNEL_MSG, recent_channels_window_content.selected_channel)
			end
		else
			local base_name = "channel_entry_"

			for i = 1, 5, 1 do
				local channel_entry = self._recent_channels_widgets[base_name .. i]

				if channel_entry then
					local channel_entry_content = channel_entry.content
					local channel_entry_hotspot = channel_entry_content.hotspot

					if channel_entry_hotspot.on_pressed then
						if channel_entry_content.selected_channel then
							channel_entry_content.selected_channel = nil
							recent_channels_window_content.selected_channel = nil
						else
							channel_entry_content.selected_channel = channel_entry_content.channel_name
							recent_channels_window_content.selected_channel = channel_entry_content.channel_name
						end
					elseif channel_entry_content.selected_channel ~= recent_channels_window_content.selected_channel then
						channel_entry_content.selected_channel = nil
					end
				end
			end
		end

		if widget_hotspot.on_pressed and not list_hotspot.is_hover then
			recent_channels_window_content.selected_channel = nil
		end
	elseif screen_hotspot.on_pressed then
		self:_destroy_recent_channels_window()
	end

	join_button_hotspot.disable_button = recent_channels_window_content.selected_channel == nil
end

ChatView._create_recent_channels_window = function (self)
	local widget_definitions = definitions.widget_definitions
	self._recent_channels_widgets.recent_channels_window = UIWidget.init(widget_definitions.recent_channels_window)
	local join_button = UIWidget.init(widget_definitions.recent_join_channel_button)
	join_button.content.button_hotspot.disable_button = true
	self._recent_channels_widgets.join_button = join_button

	Managers.input:block_device_except_service("channels_list", "keyboard", 1, "channels_list")
	Managers.input:block_device_except_service("channels_list", "mouse", 1, "channels_list")
	Irc.list_channels()

	self._list_channels_cbs[#self._list_channels_cbs + 1] = callback(self, "cb_populate_recent_channels")
	local widget = self._recent_channels_widgets.recent_channels_window
	local widget_content = widget.content
	widget_content.fetching_channels = true
end

ChatView.cb_populate_recent_channels = function (self, channel_list, channel_list_lookup)
	if table.is_empty(self._recent_channels_widgets) then
		return
	end

	local ui_scenegraph = self._ui_scenegraph
	local scenegraph_entry_size = ui_scenegraph.recent_channels_window_list_box_entry.size
	local channels_list_settings = definitions.channels_list_settings
	local channels_width_spacing = channels_list_settings.channels_width_spacing
	local channels_height_spacing = channels_list_settings.channels_height_spacing
	local offset_y = 0
	local widget_definitions = definitions.widget_definitions
	local recent_irc_channels = PlayerData.recent_irc_channels or {}

	for index, channel_name in ipairs(recent_irc_channels) do
		local num_members = channel_list_lookup[channel_name] or 0
		local channel_entry = UIWidget.init(widget_definitions.create_channel_list_entry_func("recent_channels_window_list_box_entry"))
		local channel_entry_content = channel_entry.content
		local channel_entry_style = channel_entry.style
		channel_entry.offset[2] = offset_y
		channel_entry_content.channel_name = channel_name
		local cropped_channel_name = UIRenderer.crop_text_width(self._ui_renderer, channel_name, 160, channel_entry_style.channel_name)
		channel_entry_content.channel_name_id = cropped_channel_name
		channel_entry_content.num_members_id = num_members .. " Member(s)"
		channel_entry_style.icon.texture_size = {
			scenegraph_entry_size[2] - channels_width_spacing * 2,
			scenegraph_entry_size[2] - channels_height_spacing * 2
		}
		channel_entry_style.channel_name.offset[1] = scenegraph_entry_size[2] - channels_width_spacing * 2 + channels_width_spacing
		channel_entry_style.num_members.offset[1] = scenegraph_entry_size[2] - channels_width_spacing * 2 + channels_width_spacing
		channel_entry_style.background.size[1] = scenegraph_entry_size[1]
		channel_entry_style.background.size[2] = scenegraph_entry_size[2] - channels_height_spacing
		self._recent_channels_widgets["channel_entry_" .. index] = channel_entry
		offset_y = offset_y - (scenegraph_entry_size[2] + channels_height_spacing)
	end

	local widget = self._recent_channels_widgets.recent_channels_window
	local widget_content = widget.content
	widget_content.fetching_channels = false
end

ChatView._destroy_recent_channels_window = function (self, go_back_to_main_window)
	table.clear(self._recent_channels_widgets)

	if not go_back_to_main_window then
		self:_create_channels_list()
	else
		Managers.input:device_unblock_service("keyboard", 1, "chat_view")
		Managers.input:device_unblock_service("mouse", 1, "chat_view")
	end
end

ChatView._create_invite_window = function (self)
	local widget_definitions = definitions.widget_definitions
	local scenegraph_definition = definitions.scenegraph_definition
	self._invite_widgets.send_invite_window = UIWidget.init(widget_definitions.send_invite_window)
	self._invite_widgets.send_invite_button = UIWidget.init(widget_definitions.send_invite_button)

	Managers.input:block_device_except_service("channels_list", "keyboard", 1, "channels_list")
	Managers.input:block_device_except_service("channels_list", "mouse", 1, "channels_list")

	local send_invite_window_widget = self._invite_widgets.send_invite_window
	local send_invite_window_content = send_invite_window_widget.content
	send_invite_window_content.text_field_active = true
end

ChatView._destroy_send_invite_window = function (self)
	table.clear(self._invite_widgets)
	Managers.input:device_unblock_service("keyboard", 1, "chat_view")
	Managers.input:device_unblock_service("mouse", 1, "chat_view")
end

ChatView._update_send_invite_input = function (self, dt, t)
	if table.is_empty(self._invite_widgets) then
		return
	end

	local input_service = Managers.input:get_service("channels_list")
	local send_invite_button_widget = self._invite_widgets.send_invite_button
	local send_invite_window_widget = self._invite_widgets.send_invite_window
	local send_invite_button_content = send_invite_button_widget.content
	local send_invite_window_content = send_invite_window_widget.content
	local send_invite_button_hotspot = send_invite_button_content.button_hotspot
	local input_field_hotspot = send_invite_window_content.input_hotspot
	local screen_hotspot = send_invite_window_content.screen_hotspot
	local widget_hotspot = send_invite_window_content.widget_hotspot
	local close_hotspot = send_invite_window_content.close_hotspot
	send_invite_button_hotspot.disable_button = send_invite_window_content.chat_text_id == ""

	if widget_hotspot.is_hover then
		if close_hotspot.on_pressed then
			self:_destroy_send_invite_window()
		elseif input_field_hotspot.on_pressed then
			send_invite_window_content.text_field_active = true
		elseif send_invite_button_hotspot.on_pressed then
			self:_destroy_send_invite_window()

			local frame_widget = self._widgets.frame_widget
			local frame_widget_content = frame_widget.content
			frame_widget_content.chat_text.text = "/invite " .. send_invite_window_content.chat_text_id

			self:_send_message(frame_widget_content)
		elseif widget_hotspot.on_pressed then
			send_invite_window_content.text_field_active = false
		end
	elseif screen_hotspot.on_pressed then
		self:_destroy_send_invite_window()
	end

	if input_service:get("deactivate_chat_input") then
		self:_destroy_send_invite_window()
	elseif send_invite_window_content.text_field_active then
		if input_service:get("execute_chat_input") then
			if send_invite_window_content.chat_text_id ~= "" then
				self:_destroy_send_invite_window()
				self:_destroy_send_invite_window()

				local frame_widget = self._widgets.frame_widget
				local frame_widget_content = frame_widget.content
				frame_widget_content.chat_text.text = "/invite " .. send_invite_window_content.chat_text_id

				self:_send_message(frame_widget_content)
			end

			send_invite_window_content.text_field_active = false
			send_invite_window_content.caret_index = 1
			send_invite_window_content.text_index = 1
			send_invite_window_content.chat_text_id = ""
		elseif send_invite_window_content.caret_index < ChatView.MAX_CHARS then
			local keystrokes = Keyboard.keystrokes()
			send_invite_window_content.chat_text_id, send_invite_window_content.caret_index = KeystrokeHelper.parse_strokes(send_invite_window_content.chat_text_id, send_invite_window_content.caret_index, "insert", keystrokes)
		elseif input_service:get("chat_backspace_pressed") then
			local keystrokes = {
				Keyboard.BACKSPACE
			}
			send_invite_window_content.chat_text_id, send_invite_window_content.caret_index = KeystrokeHelper.parse_strokes(send_invite_window_content.chat_text_id, send_invite_window_content.caret_index, "insert", keystrokes)
		end
	end
end

ChatView._create_create_channels_window = function (self)
	local widget_definitions = definitions.widget_definitions
	local scenegraph_definition = definitions.scenegraph_definition
	self._create_channel_widgets.create_channel_window = UIWidget.init(widget_definitions.create_channel_window)
	self._create_channel_widgets.create_button = UIWidget.init(widget_definitions.inner_create_channel_button)

	Managers.input:block_device_except_service("channels_list", "keyboard", 1, "channels_list")
	Managers.input:block_device_except_service("channels_list", "mouse", 1, "channels_list")

	local create_channel_window_widget = self._create_channel_widgets.create_channel_window
	local create_channel_window_content = create_channel_window_widget.content
	create_channel_window_content.text_field_active = true
end

ChatView._destroy_create_channel_window = function (self, go_back_to_main_window)
	table.clear(self._create_channel_widgets)
	Managers.input:device_unblock_service("keyboard", 1, "chat_view")
	Managers.input:device_unblock_service("mouse", 1, "chat_view")

	if not go_back_to_main_window then
		self:_create_channels_list()
	end
end

ChatView._update_create_channel_input = function (self, dt, t)
	if table.is_empty(self._create_channel_widgets) then
		return
	end

	local input_service = Managers.input:get_service("channels_list")
	local create_button_widget = self._create_channel_widgets.create_button
	local create_channel_window_widget = self._create_channel_widgets.create_channel_window
	local create_button_content = create_button_widget.content
	local create_channel_window_content = create_channel_window_widget.content
	local create_button_hotspot = create_button_content.button_hotspot
	local input_field_hotspot = create_channel_window_content.input_hotspot
	local screen_hotspot = create_channel_window_content.screen_hotspot
	local widget_hotspot = create_channel_window_content.widget_hotspot
	local close_hotspot = create_channel_window_content.close_hotspot
	create_button_hotspot.disable_button = create_channel_window_content.chat_text_id == ""

	if widget_hotspot.is_hover then
		if close_hotspot.on_pressed then
			self:_destroy_create_channel_window()
		elseif input_field_hotspot.on_pressed then
			create_channel_window_content.text_field_active = true
		elseif create_button_hotspot.on_pressed then
			self:_destroy_create_channel_window(true)
			Managers.chat:send_chat_message(1, nil, "/join #" .. create_channel_window_content.chat_text_id, self._recent_message_index, Irc.CHANNEL_MSG, create_channel_window_content.chat_text_id)
		elseif widget_hotspot.on_pressed then
			create_channel_window_content.text_field_active = false
		end
	elseif screen_hotspot.on_pressed then
		self:_destroy_create_channel_window()
	end

	if input_service:get("deactivate_chat_input") then
		self:_destroy_create_channel_window()
	elseif create_channel_window_content.text_field_active then
		if input_service:get("execute_chat_input") then
			if create_channel_window_content.chat_text_id ~= "" then
				self:_destroy_create_channel_window(true)
				Managers.chat:send_chat_message(1, nil, "/join #" .. create_channel_window_content.chat_text_id, self._recent_message_index, Irc.CHANNEL_MSG, create_channel_window_content.chat_text_id)
			end

			create_channel_window_content.text_field_active = false
			create_channel_window_content.caret_index = 1
			create_channel_window_content.text_index = 1
			create_channel_window_content.chat_text_id = ""
		elseif create_channel_window_content.caret_index < ChatView.MAX_CHANNEL_NAME then
			local keystrokes = Keyboard.keystrokes()
			create_channel_window_content.chat_text_id, create_channel_window_content.caret_index = KeystrokeHelper.parse_strokes(create_channel_window_content.chat_text_id, create_channel_window_content.caret_index, "insert", keystrokes)

			for _, escape_character in ipairs(ESCAPE_CHARACTERS) do
				create_channel_window_content.chat_text_id = string.gsub(create_channel_window_content.chat_text_id, "%" .. escape_character, "")
			end

			create_channel_window_content.chat_text_id = string.format(create_channel_window_content.chat_text_id, "%w")
			create_channel_window_content.chat_text_id = string.gsub(create_channel_window_content.chat_text_id, "%s", "")
			create_channel_window_content.caret_index = UTF8Utils.string_length(create_channel_window_content.chat_text_id) + 1
		elseif input_service:get("chat_backspace_pressed") then
			local keystrokes = {
				Keyboard.BACKSPACE
			}
			create_channel_window_content.chat_text_id, create_channel_window_content.caret_index = KeystrokeHelper.parse_strokes(create_channel_window_content.chat_text_id, create_channel_window_content.caret_index, "insert", keystrokes)
		end
	end
end

local CHANNEL_MATCHES = {}

ChatView._create_channels_list = function (self)
	local widget_definitions = definitions.widget_definitions
	local scenegraph_definition = definitions.scenegraph_definition
	self._channels_list_widgets.channel_window_widget = UIWidget.init(widget_definitions.channels_window)
	local input_manager = Managers.input
	local input_service = input_manager:get_service("channels_list")

	input_manager:block_device_except_service("channels_list", "keyboard", 1, "channels_list")
	input_manager:block_device_except_service("channels_list", "mouse", 1, "channels_list")

	local channel_entry = UIWidget.init(widget_definitions.channel_entry)
	self._channels_list_widgets.channel_entry = channel_entry
	local channel_entry_style = channel_entry.style
	local channel_entry_icon_style = channel_entry_style.icon
	local channel_entry_channel_name_style = channel_entry_style.channel_name
	local channel_entry_num_members_style = channel_entry_style.num_members
	local channel_entry_background_style = channel_entry_style.background
	local ui_scenegraph = self._ui_scenegraph
	local scenegraph_entry_parent_name = ui_scenegraph[channel_entry.scenegraph_id].parent
	local parent_scenegraph_entry = ui_scenegraph[scenegraph_entry_parent_name]
	local parent_scenegraph_entry_size = parent_scenegraph_entry.size
	local channels_list_settings = definitions.channels_list_settings
	local channels_width_spacing = channels_list_settings.channels_width_spacing
	local channels_height_spacing = channels_list_settings.channels_height_spacing
	local channels_offset = channels_list_settings.channels_offset
	local channels_per_row = channels_list_settings.channels_per_row
	local max_rows = channels_list_settings.max_rows
	local width = parent_scenegraph_entry_size[1] - channels_offset[1] * 2 - (channels_per_row - 1) * channels_width_spacing
	local height = parent_scenegraph_entry_size[2] - -channels_offset[2] * 2 - (max_rows - 3) * channels_height_spacing
	local entry_width = width / channels_per_row
	local entry_height = height / (max_rows - 2)
	channels_list_settings.channels_entry_size = {
		entry_width,
		entry_height
	}
	channel_entry_icon_style.texture_size = {
		entry_height - channels_width_spacing * 2,
		entry_height - channels_height_spacing * 2
	}
	channel_entry_channel_name_style.offset[1] = entry_height - channels_width_spacing * 2 + channels_width_spacing
	channel_entry_num_members_style.offset[1] = entry_height - channels_width_spacing * 2 + channels_width_spacing
	channel_entry_background_style.size[1] = channels_list_settings.channels_entry_size[1]
	channel_entry_background_style.size[2] = channels_list_settings.channels_entry_size[2] - channels_height_spacing
	local channel_entry_style = channel_entry.style
	local entry_scenegraph_id = channel_entry.scenegraph_id
	local scenegraph_entry = ui_scenegraph[entry_scenegraph_id]
	scenegraph_entry.size[1] = channels_list_settings.channels_entry_size[1]
	scenegraph_entry.size[2] = channels_list_settings.channels_entry_size[2]
	local join_button_widget = UIWidget.init(widget_definitions.join_channel_button)
	self._channels_list_widgets.join_button = join_button_widget
	join_button_widget.content.button_hotspot.disable_button = true
	local create_channel_button_widget = UIWidget.init(widget_definitions.create_channel_button)
	self._channels_list_widgets.create_channel_button = create_channel_button_widget
	local recent_channels_button_widget = UIWidget.init(widget_definitions.recent_channels_button)
	self._channels_list_widgets.recent_channels_button = recent_channels_button_widget

	table.clear(self._popular_channel_list)
	table.clear(self._popular_channel_list_lookup)
	Irc.list_channels()

	self._list_channels_cbs[#self._list_channels_cbs + 1] = callback(self, "cb_populate_channels_list", nil)
	local widget = self._channels_list_widgets.channel_window_widget
	local widget_content = widget.content
	widget_content.fetching_channels = true
end

ChatView._destroy_channels_list = function (self)
	table.clear(CHANNEL_MATCHES)
	table.clear(self._channels_list_widgets)
	Managers.input:device_unblock_service("keyboard", 1, "chat_view")
	Managers.input:device_unblock_service("mouse", 1, "chat_view")
end

ChatView.cb_populate_channels_list = function (self, search_text, channel_list, channel_list_lookup)
	if table.is_empty(self._channels_list_widgets) then
		return
	end

	table.clear(CHANNEL_MATCHES)

	local channels_list_settings = definitions.channels_list_settings
	local channel_window_widget = self._channels_list_widgets.channel_window_widget
	local channel_window_widget_content = channel_window_widget.content
	channel_window_widget_content.updating_channels = false
	channel_window_widget_content.info_id = string.format("Search results for %q", search_text)

	for _, channel in ipairs(channel_list) do
		if not search_text or string.find(channel, search_text) then
			CHANNEL_MATCHES[#CHANNEL_MATCHES + 1] = channel
		end
	end

	channels_list_settings.current_rows = math.ceil(#CHANNEL_MATCHES / channels_list_settings.channels_per_row)
	local widget = self._channels_list_widgets.channel_window_widget
	local widget_content = widget.content
	widget_content.fetching_channels = false
end

ChatView._handle_and_draw_channels_list = function (self, ui_renderer, ui_scenegraph, dt, t)
	local channels_list_settings = definitions.channels_list_settings
	local channel_window_widget = self._channels_list_widgets.channel_window_widget

	UIRenderer.draw_widget(ui_renderer, channel_window_widget)

	local join_button_widget = self._channels_list_widgets.join_button
	local create_channel_button_widget = self._channels_list_widgets.create_channel_button
	local recent_channels_button_widget = self._channels_list_widgets.recent_channels_button

	UIRenderer.draw_widget(ui_renderer, join_button_widget)
	UIRenderer.draw_widget(ui_renderer, create_channel_button_widget)
	UIRenderer.draw_widget(ui_renderer, recent_channels_button_widget)

	local rows_to_draw = math.min(channels_list_settings.current_rows or 0, channels_list_settings.max_rows)
	local channels_width_spacing = channels_list_settings.channels_width_spacing
	local channels_height_spacing = channels_list_settings.channels_height_spacing
	local channels_per_row = channels_list_settings.channels_per_row
	local channel_entry_size = channels_list_settings.channels_entry_size
	local channel_entry = self._channels_list_widgets.channel_entry
	local channel_entry_content = channel_entry.content
	local channel_entry_style = channel_entry.style
	local channel_entry_offset = channel_entry.offset
	local base_offset = channels_list_settings.channels_offset
	channel_entry_offset[2] = base_offset[2]
	local channel_to_join = nil

	for i = 1, math.min(rows_to_draw, 4), 1 do
		channel_entry_offset[2] = base_offset[2] - (i - 1) * channel_entry_size[2] - (i - 1) * channels_height_spacing

		for j = 1, channels_per_row, 1 do
			local index = (i - 1) * channels_per_row + j

			if not CHANNEL_MATCHES[index] then
				break
			else
				local strings = string.split(CHANNEL_MATCHES[index], ",")
				channel_entry_content.channel_name = strings[1]
				local cropped_channel_name = UIRenderer.crop_text_width(self._ui_renderer, channel_entry_content.channel_name, 160, channel_entry_style.channel_name)
				channel_entry_content.channel_name_id = cropped_channel_name
				channel_entry_content.num_members_id = strings[2] .. " Member(s)"
			end

			channel_entry_offset[1] = base_offset[1] + (j - 1) * channel_entry_size[1] + (j - 1) * channels_width_spacing

			UIRenderer.draw_widget(ui_renderer, channel_entry)

			local hotspot = channel_entry_content.hotspot

			if hotspot.on_pressed then
				if channel_entry_content.selected_channel == channel_entry_content.channel_name then
					channel_entry_content.selected_channel = nil
				else
					channel_entry_content.selected_channel = channel_entry_content.channel_name
				end
			end
		end
	end

	join_button_widget.content.button_hotspot.disable_button = channel_entry_content.selected_channel == nil
end

ChatView._update_channels_list_input = function (self, dt, t)
	if table.is_empty(self._channels_list_widgets) then
		return
	end

	local input_service = Managers.input:get_service("channels_list")
	local channel_entry_widget = self._channels_list_widgets.channel_entry
	local join_button_widget = self._channels_list_widgets.join_button
	local create_button_widget = self._channels_list_widgets.create_channel_button
	local recent_channels_button_widget = self._channels_list_widgets.recent_channels_button
	local channel_window_widget = self._channels_list_widgets.channel_window_widget
	local channel_window_widget_content = channel_window_widget.content
	local join_button_content = join_button_widget.content
	local create_button_content = create_button_widget.content
	local recent_channels_button_content = recent_channels_button_widget.content
	local channel_entry_content = channel_entry_widget.content
	local input_hotspot = channel_window_widget_content.input_hotspot
	local screen_hotspot = channel_window_widget_content.screen_hotspot
	local widget_hotspot = channel_window_widget_content.widget_hotspot
	local close_hotspot = channel_window_widget_content.close_hotspot
	local join_button_hotspot = join_button_content.button_hotspot
	local create_button_hotspot = create_button_content.button_hotspot
	local recent_channels_hotspot = recent_channels_button_content.button_hotspot
	local channels_list_hotspot = channel_window_widget_content.channels_list_hotspot

	if channel_window_widget_content.updating_channels then
		return
	end

	if input_service:get("deactivate_chat_input") then
		self:_destroy_channels_list()
	elseif input_hotspot.on_pressed then
		channel_window_widget_content.text_field_active = true
	elseif widget_hotspot.is_hover then
		if close_hotspot.on_pressed then
			channel_window_widget_content.text_field_active = false

			self:_destroy_channels_list()
		elseif join_button_hotspot.on_pressed then
			local channel_to_join = channel_entry_content.selected_channel

			self:_destroy_channels_list()

			if self._channels[channel_to_join] then
				self:_change_channel(channel_to_join)
			else
				Managers.chat:send_chat_message(1, nil, "/join " .. channel_to_join, self._recent_message_index, Irc.CHANNEL_MSG, channel_to_join)
			end
		elseif create_button_hotspot.on_pressed then
			self:_destroy_channels_list()
			self:_create_create_channels_window()
		elseif recent_channels_hotspot.on_pressed then
			self:_destroy_channels_list()
			self:_create_recent_channels_window()
		elseif widget_hotspot.on_pressed then
			channel_window_widget_content.text_field_active = false
		end
	elseif screen_hotspot.on_pressed then
		self:_destroy_channels_list()
	end

	if channel_window_widget_content.text_field_active then
		if input_service:get("execute_chat_input") then
			if channel_window_widget_content.chat_text_id ~= "" then
				table.clear(self._popular_channel_list)
				table.clear(self._popular_channel_list_lookup)
				Irc.list_channels()

				self._list_channels_cbs[#self._list_channels_cbs + 1] = callback(self, "cb_populate_channels_list", channel_window_widget_content.chat_text_id)
			end

			channel_window_widget_content.text_field_active = false
			channel_window_widget_content.caret_index = 1
			channel_window_widget_content.text_index = 1
			channel_window_widget_content.chat_text_id = ""
		elseif channel_window_widget_content.caret_index < ChatView.MAX_CHANNEL_NAME then
			local keystrokes = Keyboard.keystrokes()

			if not table.is_empty(keystrokes) then
				channel_window_widget_content.chat_text_id, channel_window_widget_content.caret_index = KeystrokeHelper.parse_strokes(channel_window_widget_content.chat_text_id, channel_window_widget_content.caret_index, "insert", keystrokes)

				for _, escape_character in ipairs(ESCAPE_CHARACTERS) do
					channel_window_widget_content.chat_text_id = string.gsub(channel_window_widget_content.chat_text_id, "%" .. escape_character, "")
				end

				channel_window_widget_content.chat_text_id = string.format(channel_window_widget_content.chat_text_id, "%w")
				channel_window_widget_content.chat_text_id = string.gsub(channel_window_widget_content.chat_text_id, "%s", "")
				channel_window_widget_content.caret_index = UTF8Utils.string_length(channel_window_widget_content.chat_text_id) + 1
			end
		elseif input_service:get("chat_backspace_pressed") then
			local keystrokes = {
				Keyboard.BACKSPACE
			}
			channel_window_widget_content.chat_text_id, channel_window_widget_content.caret_index = KeystrokeHelper.parse_strokes(channel_window_widget_content.chat_text_id, channel_window_widget_content.caret_index, "insert", keystrokes)
		end
	end
end

ChatView._update_input = function (self, dt, t)
	local input_service = self._input_manager:get_service("chat_view")

	self:_handle_user_pressed()
	self:_handle_user_list_scroll_input(input_service)
	self:_handle_link_presses()

	local frame_widget = self._widgets.frame_widget
	local frame_widget_content = frame_widget.content
	local channel_list_frame_widget = self._channel_list_widgets.channel_list_frame
	local private_user_list_frame_widget = self._private_list_widgets.private_user_list_frame
	local recent_channels_list_frame_widget = self._recent_channels_list_widgets.recent_channels_list_frame
	local command_list_frame_widget = self._commands_list_widgets.command_list_frame
	local filtered_user_names_list_frame_widget = self._filtered_user_names_list_widgets.filtered_user_names_list_frame
	local emoji_list_frame_widget = self._emoji_widgets.emoji_list_frame
	frame_widget_content.channel_name = self._current_channel_name or " "

	if input_service:get("deactivate_chat_input", true) then
		if frame_widget_content.text_field_active then
			frame_widget_content.text_field_active = false
			frame_widget_content.chat_text.text = ""
		else
			self:_exit()

			return
		end
	end

	local deactivate_chat_input = false
	local clear_chat = false
	local input_hotspot = frame_widget_content.text_input_hotspot
	local screen_hotspot = frame_widget_content.screen_hotspot
	local channel_hotspot = frame_widget_content.channel_hotspot
	local private_button_hotspot = self._widgets.private_messages_widget.content.button_hotspot
	local send_invite_hotspot = self._widgets.send_invite_widget.content.button_hotspot
	local channels_hotspot = self._widgets.channels_widget.content.button_hotspot
	local emoji_button_hotspot = self._widgets.emoji_widget.content.button_hotspot

	if command_list_frame_widget then
		local command_list_frame_content = command_list_frame_widget.content
		local hotspot = command_list_frame_content.hotspot
		local screen_hotspot = command_list_frame_content.screen_hotspot

		if hotspot.on_pressed then
			self:_handle_command_list_input()
		elseif screen_hotspot.on_pressed then
			self:_destroy_command_list()
		end
	elseif emoji_list_frame_widget then
		local emoji_list_frame_content = emoji_list_frame_widget.content
		local hotspot = emoji_list_frame_content.hotspot
		local screen_hotspot = emoji_list_frame_content.screen_hotspot

		if screen_hotspot.on_pressed and not hotspot.on_pressed then
			self:_destroy_emoji_list()
		else
			self:_handle_and_draw_emoji_list_input(dt)
		end
	elseif filtered_user_names_list_frame_widget then
		local filtered_user_names_list_frame_content = filtered_user_names_list_frame_widget.content
		local hotspot = filtered_user_names_list_frame_content.hotspot
		local screen_hotspot = filtered_user_names_list_frame_content.screen_hotspot

		if hotspot.on_pressed then
			self:_handle_filtered_user_names_list_input()
		elseif screen_hotspot.on_pressed then
			self:_destroy_filtered_user_names_list()
		end
	elseif channel_list_frame_widget then
		local channel_list_frame_content = channel_list_frame_widget.content
		local hotspot = channel_list_frame_content.hotspot
		local screen_hotspot = channel_list_frame_content.screen_hotspot

		if hotspot.on_pressed then
			self:_handle_channel_list_input()
		elseif screen_hotspot.on_pressed then
			self:_destroy_channel_list()
		end
	elseif private_user_list_frame_widget then
		local private_user_list_frame_content = private_user_list_frame_widget.content
		local hotspot = private_user_list_frame_content.hotspot
		local screen_hotspot = private_user_list_frame_content.screen_hotspot

		if hotspot.on_pressed then
			self:_handle_private_list_input()
		elseif screen_hotspot.on_pressed then
			self:_destroy_private_list()
		end
	elseif emoji_button_hotspot.on_pressed then
		self:_create_emoji_list()
	elseif channel_hotspot.on_pressed then
		self:_create_channel_list()

		deactivate_chat_input = true
		clear_chat = true
	elseif channels_hotspot.on_pressed then
		self:_create_channels_list()

		deactivate_chat_input = true
		clear_chat = true
	elseif private_button_hotspot.on_pressed then
		self:_create_private_list()

		deactivate_chat_input = true
		clear_chat = true
	elseif send_invite_hotspot.on_pressed then
		self:_create_invite_window()

		deactivate_chat_input = true
		clear_chat = true
	elseif input_hotspot.on_pressed then
		frame_widget_content.text_field_active = true
	elseif screen_hotspot.on_pressed then
		deactivate_chat_input = true
		clear_chat = true
	end

	if frame_widget_content.text_field_active then
		if input_service:get("execute_chat_input") then
			self:_send_message(frame_widget_content)
		elseif input_service:get("chat_next_old_message") then
			local recent_chat_messages = Managers.chat:get_recently_sent_messages()
			local num_recent_chat_messages = #recent_chat_messages

			if num_recent_chat_messages > 0 then
				if not self._recent_message_index then
					if string.len(frame_widget_content.chat_text.text) > 0 then
						self._old_chat_message = frame_widget_content.chat_text.text
					end

					self._recent_message_index = num_recent_chat_messages
				else
					self._recent_message_index = math.max(self._recent_message_index - 1, 1)
				end

				frame_widget_content.chat_text.text = recent_chat_messages[self._recent_message_index]
				local text_table = KeystrokeHelper._build_utf8_table(frame_widget_content.chat_text.text)
				frame_widget_content.caret_index = #text_table + 1
			end
		elseif input_service:get("chat_previous_old_message") then
			local recent_chat_messages = Managers.chat:get_recently_sent_messages()
			local num_recent_chat_messages = #recent_chat_messages

			if self._recent_message_index then
				if num_recent_chat_messages > 0 and self._recent_message_index < num_recent_chat_messages then
					self._recent_message_index = math.clamp(self._recent_message_index + 1, 1, num_recent_chat_messages)
					frame_widget_content.chat_text.text = recent_chat_messages[self._recent_message_index]
					local text_table = KeystrokeHelper._build_utf8_table(frame_widget_content.chat_text.text)
					frame_widget_content.caret_index = #text_table + 1
				elseif self.recent_message_index == num_recent_chat_messages and self._old_chat_message then
					frame_widget_content.chat_text.text = self._old_chat_message
					local text_table = KeystrokeHelper._build_utf8_table(frame_widget_content.chat_text.text)
					frame_widget_content.caret_index = #text_table + 1
					self._recent_message_index = nil
					self._old_chat_message = nil
				end
			end
		elseif input_service:get("chat_backspace_word") then
			local text_table = KeystrokeHelper._build_utf8_table(frame_widget_content.chat_text.text)
			local current_index = frame_widget_content.caret_index - 1
			local char_step = false
			local temp = 0

			for i = current_index, 1, -1 do
				local letter = text_table[i]

				if text_table[i] == " " and char_step then
					current_index = i + 1

					break
				else
					table.remove(text_table, i)

					current_index = i

					if text_table[i] ~= " " then
						char_step = true
					end
				end
			end

			frame_widget_content.caret_index = math.clamp(current_index, 1, #text_table + 1)
			frame_widget_content.chat_text.text = ""
			local num_chars = 0

			for _, text_snippet in ipairs(text_table) do
				frame_widget_content.chat_text.text = frame_widget_content.chat_text.text .. text_snippet
				num_chars = num_chars + 1
			end
		elseif frame_widget_content.caret_index <= ChatView.MAX_CHARS then
			local keystrokes = Keyboard.keystrokes()
			local ctrl_button_index = Keyboard.button_index("left ctrl")
			local ctrl_held = Keyboard.pressed(ctrl_button_index) or Keyboard.button(ctrl_button_index) > 0
			frame_widget_content.chat_text.text, frame_widget_content.caret_index = KeystrokeHelper.parse_strokes(frame_widget_content.chat_text.text, frame_widget_content.caret_index, "insert", keystrokes)

			if #keystrokes > 0 then
				local text = frame_widget_content.chat_text.text
				local _, end_idx = string.find(text, "/msg ")
				local start_idx, _ = string.find(text, " ", (end_idx or 0) + 1)

				if end_idx and not start_idx then
					local str = string.lower(string.gsub(text, "/msg ", ""))

					self:_create_filtered_user_list(str)
				end
			end
		end
	elseif input_service:get("execute_chat_input") then
		frame_widget_content.text_field_active = true
	end

	if deactivate_chat_input then
		frame_widget_content.text_field_active = false

		if clear_chat then
			frame_widget_content.chat_text.text = ""
			frame_widget_content.caret_index = 1
		end
	end
end

ChatView._handle_command_list = function (self)
	local frame_widget = self._widgets.frame_widget
	local frame_widget_content = frame_widget.content
	local commands_button = self._widgets.commands_widget
	local commands_button_content = commands_button.content
	local commands_button_hotspot = commands_button_content.button_hotspot

	if not commands_button_hotspot.on_pressed and not commands_button_hotspot.disable_button then
		local keystrokes = Keyboard.keystrokes()

		if #keystrokes == 0 then
			return
		end

		local current_command = frame_widget_content.chat_text.text
		local start_index, end_index = string.find(current_command, "/")
		local first_space = string.find(current_command, " ")
		local length = string.len(current_command)

		if not current_command or string.find(current_command, "/") ~= 1 or first_space then
			table.clear(self._commands_list_widgets)

			return
		end

		self._ui_scenegraph.commands_list.position[1] = 25
	else
		commands_button_hotspot.disable_button = true
		self._ui_scenegraph.commands_list.position[1] = -60
	end

	if table.size(self._commands_list_widgets) == 0 then
		local widget_definitions = definitions.widget_definitions
		local create_command_entry_func = widget_definitions.create_command_entry_func
		local cnt = 0
		local max_width = 0
		local description_offset = 100

		for idx, command_info in ipairs(COMMANDS) do
			local command = command_info.command
			local widget = UIWidget.init(create_command_entry_func(command, command_info.description_text, command_info.parameter, description_offset, command_info.color, -20 - 20 * cnt, frame_widget_content.chat_text))
			self._commands_list_widgets["command_" .. cnt + 1] = widget
			cnt = cnt + 1
			local command_style = widget.style.command
			local font, size_of_font = UIFontByResolution(command_style, nil)
			local font_material = font[1]
			local font_size = command_style.font_size
			local command_width = UIRenderer.text_size(self._ui_renderer, command .. command_info.description_text, font_material, font_size) + 100
			max_width = math.max(max_width, command_width)
		end

		self._commands_list_widgets.command_list_frame = UIWidget.init(widget_definitions.commands_list_frame)
		self._ui_scenegraph.commands_list.size[2] = 40 + cnt * 20
		self._ui_scenegraph.commands_list.size[1] = max_width + 10
		self._ui_scenegraph.commands_list_entry.size[1] = max_width + 20
	end
end

ChatView._create_channel_list = function (self)
	local channels = Managers.irc:get_channels()
	local widget_definitions = definitions.widget_definitions
	local create_channel_entry_func = widget_definitions.create_channel_entry_func
	local cnt = 0
	local longest_channel_name = 200
	local max_width = 0

	for channel, _ in pairs(channels) do
		local widget = UIWidget.init(create_channel_entry_func(channel, -50 - 40 * cnt))
		self._channel_list_widgets["channel_" .. cnt + 1] = widget
		cnt = cnt + 1
		local channel_style = widget.style.channel_name
		local font, size_of_font = UIFontByResolution(channel_style, nil)
		local font_material = font[1]
		local font_size = channel_style.font_size
		local channel_width = UIRenderer.text_size(self._ui_renderer, channel, font_material, font_size)
		max_width = math.max(max_width, channel_width)
	end

	self._channel_list_widgets.channel_list_frame = UIWidget.init(widget_definitions.channel_list_frame)
	self._ui_scenegraph.channel_list.size[2] = 100 + cnt * 40
	self._ui_scenegraph.channel_list.size[1] = max_width + 125
	self._ui_scenegraph.channel_list_entry.size[1] = max_width + 40
end

ChatView._destroy_emoji_list = function (self)
	table.clear(self._emoji_widgets)

	self._base_offset = 0
end

ChatView._create_emoji_list = function (self)
	local widget_definitions = definitions.widget_definitions

	table.clear(self._emoji_widgets)

	self._emoji_widgets.emoji_list_frame = UIWidget.init(widget_definitions.create_emoji_frame_func())
	self._emoji_widgets.emoji = UIWidget.init(widget_definitions.create_emoji_func())
	local emoji_list_settings = definitions.emoji_list_settings
	local num_emojis = #EMOJI_SETTINGS
	emoji_list_settings.current_rows = math.ceil(num_emojis / emoji_list_settings.emojis_per_row)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("chat_view")
	local render_settings = self._render_settings
	local emoji_widget = self._emoji_widgets.emoji
	local scenegraph_entry = ui_scenegraph[emoji_widget.scenegraph_id]
	local rows_to_handle = emoji_list_settings.max_rows - 1
	local height = (rows_to_handle + 2) * scenegraph_entry.size[2] + (rows_to_handle - 1) * emoji_list_settings.emoji_height_spacing
	emoji_widget.offset[2] = height
	emoji_list_settings.height = height
	local emoji_frame_widget = self._emoji_widgets.emoji_list_frame
	local emoji_frame_widget_content = emoji_frame_widget.content
	local emoji_frame_widget_style = emoji_frame_widget.style
	local scenegraph_entry = ui_scenegraph[emoji_frame_widget.scenegraph_id]
	scenegraph_entry.size = {
		emoji_list_settings.emoji_size[1] * emoji_list_settings.emojis_per_row + (emoji_list_settings.emojis_per_row - 1) * emoji_list_settings.emoji_width_spacing + emoji_list_settings.emoji_offset[1] * 2 + 20,
		height + emoji_list_settings.emoji_offset[2] * 2
	}
	emoji_frame_widget_style.mask_rect.offset[2] = emoji_list_settings.emoji_size[2] + emoji_list_settings.emoji_height_spacing * 3
	emoji_frame_widget_style.mask_rect.size = {
		scenegraph_entry.size[1],
		scenegraph_entry.size[2] - (emoji_list_settings.emoji_size[2] + emoji_list_settings.emoji_height_spacing * 3)
	}
	local emoji_scrollbar_widget = UIWidget.init(widget_definitions.create_emoji_scroller_func())
	local scenegraph_entry = ui_scenegraph[emoji_scrollbar_widget.scenegraph_id]
	scenegraph_entry.size[2] = height / emoji_list_settings.max_rows

	if emoji_list_settings.max_rows < emoji_list_settings.current_rows then
		self._emoji_widgets.emoji_scrollbar = emoji_scrollbar_widget
	end
end

ChatView._handle_and_draw_emoji_list_input = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("chat_view")
	local render_settings = self._render_settings
	local emoji_list_settings = definitions.emoji_list_settings
	local emoji_widget = self._emoji_widgets.emoji
	local emoji_widget_content = emoji_widget.content
	local emoji_widget_offset = emoji_widget.offset
	local emoji_frame_widget = self._emoji_widgets.emoji_list_frame
	local emoji_frame_widget_content = emoji_frame_widget.content
	local emoji_frame_widget_style = emoji_frame_widget.style
	local destroy_emoji_list = false
	local rows = emoji_list_settings.current_rows
	local emojis_per_row = emoji_list_settings.emojis_per_row
	local emoji_size = emoji_list_settings.emoji_size
	local emoji_offset = emoji_list_settings.emoji_offset
	local emoji_width_spacing = emoji_list_settings.emoji_width_spacing
	local emoji_height_spacing = emoji_list_settings.emoji_height_spacing
	local height = emoji_list_settings.height
	local max_rows = emoji_list_settings.max_rows
	local rows_to_show = math.max(max_rows, rows)
	local emoji_scrollbar_widget = self._emoji_widgets.emoji_scrollbar
	self._emoji_scroll = 0

	if emoji_scrollbar_widget then
		local scroll_input = input_service:get("chat_scroll")[2]
		self._emoji_scroll = (math.abs(self._emoji_scroll) < math.abs(scroll_input) and scroll_input) or self._emoji_scroll
	end

	local max_offset = rows * emoji_size[2] + (rows - 1) * emoji_offset[2]
	self._base_offset = math.clamp((self._base_offset or 0) - self._emoji_scroll, 0, max_offset)
	local row_index_offset = math.floor(self._base_offset / (emoji_size[2] + emoji_offset[2]))
	self._emoji_scroll = math.lerp(math.abs(self._emoji_scroll), 0, dt * 2.5) * math.sign(self._emoji_scroll)
	emoji_widget_offset[2] = height + self._base_offset % (emoji_size[2] + emoji_offset[2])

	if emoji_scrollbar_widget then
		emoji_scrollbar_widget.offset[2] = -(self._base_offset / max_offset) * ((rows_to_show - 2) * (emoji_size[2] + emoji_offset[2]) + 15)
	end

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, nil)

	if emoji_scrollbar_widget then
		UIRenderer.draw_widget(ui_renderer, emoji_scrollbar_widget)
	end

	UIRenderer.draw_widget(ui_renderer, emoji_frame_widget)

	local is_hover = false

	for i = 1 + row_index_offset, rows_to_show + row_index_offset, 1 do
		emoji_widget_offset[2] = emoji_widget_offset[2] - emoji_size[2] - emoji_offset[2]

		for k = 1, emojis_per_row, 1 do
			local row_start_index = k - 1
			local x = row_start_index * (emoji_size[1] + emoji_width_spacing)
			emoji_widget_offset[1] = x
			local index = (i - 1) * emojis_per_row + k
			local emoji_data = EMOJI_SETTINGS[index]
			emoji_widget_content.texture_id = (emoji_data and emoji_data.texture) or nil

			UIRenderer.draw_widget(ui_renderer, emoji_widget)

			if emoji_data then
				local hotspot = emoji_widget_content.hotspot

				if hotspot.on_pressed then
					local keys = EMOJI_SETTINGS[index].keys
					local frame_widget = self._widgets.frame_widget
					local frame_widget_content = frame_widget.content
					frame_widget_content.chat_text.text = frame_widget_content.chat_text.text .. keys
					local text_table = KeystrokeHelper._build_utf8_table(frame_widget_content.chat_text.text)
					frame_widget_content.caret_index = #text_table + 1
					local frame_widget = self._widgets.frame_widget
					local frame_widget_content = frame_widget.content
					frame_widget_content.text_field_active = true
					destroy_emoji_list = true
				elseif hotspot.is_hover then
					is_hover = true
					emoji_frame_widget_content.emoji_text_id = EMOJI_SETTINGS[index].keys
					emoji_frame_widget_content.emoji_texture_id = EMOJI_SETTINGS[index].texture
					emoji_frame_widget_style.emoji_texture.texture_size = emoji_size
					emoji_frame_widget_style.emoji_texture.offset[1] = emoji_size[1]
					emoji_frame_widget_style.emoji_text.offset[1] = emoji_size[1] * 2 + emoji_width_spacing
				end
			end
		end

		emoji_widget_offset[2] = emoji_widget_offset[2] - emoji_height_spacing
	end

	emoji_widget_content.texture_id = nil

	if not is_hover then
		emoji_frame_widget_content.emoji_text_id = nil
		emoji_frame_widget_content.emoji_texture_id = nil
	end

	UIRenderer.end_pass(ui_renderer)

	if destroy_emoji_list then
		self:_destroy_emoji_list()
	end
end

ChatView._create_private_list = function (self)
	local chat_output_widget = self._widgets.chat_output_widget
	local chat_output_widget_content = chat_output_widget.content
	local private_messages = chat_output_widget_content.private_messages_table
	local widget_definitions = definitions.widget_definitions
	local create_private_user_entry_func = widget_definitions.create_private_user_entry_func
	local private_messages_widget = self._widgets.private_messages_widget
	local private_messages_widget_content = private_messages_widget.content
	local new_per_user = private_messages_widget_content.new_per_user
	local cnt = 0
	local longest_user_name = 200
	local max_width = 0

	for user, _ in pairs(private_messages) do
		local widget = UIWidget.init(create_private_user_entry_func(user, -20 - 30 * cnt, new_per_user[user]))
		self._private_list_widgets[user] = widget
		cnt = cnt + 1
		local user_style = widget.style.user_name
		local font, size_of_font = UIFontByResolution(user_style, nil)
		local font_material = font[1]
		local font_size = user_style.font_size
		local user_width = UIRenderer.text_size(self._ui_renderer, user, font_material, font_size)
		max_width = math.max(max_width, user_width)
	end

	self._private_list_widgets.private_user_list_frame = UIWidget.init(widget_definitions.private_user_list_frame)
	self._ui_scenegraph.private_user_list.size[2] = 40 + cnt * 30
	self._ui_scenegraph.private_user_list.size[1] = max_width + 125
	self._ui_scenegraph.private_user_list.position[2] = self._ui_scenegraph.private_user_list.size[2] + 5
	self._ui_scenegraph.private_user_list_entry.size[1] = max_width + 40
	private_messages_widget_content.num_private_messages = 0
end

ChatView._create_filtered_user_list = function (self, filter)
	local user_list = self:_update_filter(filter)

	self:_destroy_filtered_user_names_list()

	if not user_list then
		return
	end

	local widget_definitions = definitions.widget_definitions
	local create_filtered_user_name_entry_func = widget_definitions.create_filtered_user_name_entry_func
	local cnt = 0
	local max_width = 0

	for idx, user_name in ipairs(user_list) do
		local widget = UIWidget.init(create_filtered_user_name_entry_func(string.gsub(user_name, "@", ""), -20 - 30 * cnt))
		self._filtered_user_names_list_widgets[user_name] = widget
		cnt = cnt + 1
		local user_name_style = widget.style.user_name
		local font, size_of_font = UIFontByResolution(user_name_style, nil)
		local font_material = font[1]
		local font_size = user_name_style.font_size
		local user_name_width = UIRenderer.text_size(self._ui_renderer, user_name, font_material, font_size)
		max_width = math.max(max_width, user_name_width)
	end

	self._filtered_user_names_list_widgets.filtered_user_names_list_frame = UIWidget.init(widget_definitions.filtered_user_names_list_frame)
	self._ui_scenegraph.filtered_user_names_list.size[2] = 40 + cnt * 25
	self._ui_scenegraph.filtered_user_names_list.size[1] = max_width + 60
	self._ui_scenegraph.filtered_user_names_list_entry.size[1] = max_width + 10
end

ChatView._destroy_channel_list = function (self)
	table.clear(self._channel_list_widgets)
end

ChatView._destroy_private_list = function (self)
	table.clear(self._private_list_widgets)
end

ChatView._destroy_command_list = function (self)
	table.clear(self._commands_list_widgets)

	local commands_button = self._widgets.commands_widget
	local commands_button_content = commands_button.content
	local commands_button_hotspot = commands_button_content.button_hotspot
	commands_button_hotspot.disable_button = false
end

ChatView._destroy_filtered_user_names_list = function (self)
	table.clear(self._filtered_user_names_list_widgets)
end

ChatView._handle_channel_list_input = function (self)
	for name, widget in pairs(self._channel_list_widgets) do
		local widget_content = widget.content

		if widget_content.channel_hotspot and widget_content.channel_hotspot.on_pressed then
			local channel_name = widget_content.channel_name

			self:_change_channel(channel_name)
			self:_destroy_channel_list()

			return
		elseif widget_content.exit_button_hotspot and widget_content.exit_button_hotspot.on_pressed then
			Managers.chat:send_chat_message(1, nil, "/leave " .. widget_content.channel_name, self._recent_message_index, Irc.CHANNEL_MSG, widget_content.channel_name)
			self:_destroy_channel_list()

			return
		end
	end
end

ChatView._handle_private_list_input = function (self)
	for name, widget in pairs(self._private_list_widgets) do
		local widget_content = widget.content

		if widget_content.user_hotspot and widget_content.user_hotspot.on_pressed then
			local user_name = widget_content.user_name

			self:_change_to_private(user_name)
			self:_destroy_private_list()

			return
		elseif widget_content.exit_button_hotspot and widget_content.exit_button_hotspot.on_pressed then
			local chat_output_widget = self._widgets.chat_output_widget
			local chat_output_widget_content = chat_output_widget.content
			local private_messages_table = chat_output_widget_content.private_messages_table
			private_messages_table[name] = nil
			local private_messages_widget = self._widgets.private_messages_widget
			local private_messages_widget_content = private_messages_widget.content
			private_messages_widget_content.has_private_conversations = not table.is_empty(private_messages_table)

			self:_destroy_private_list()
			self:_change_channel(self._current_channel_name)

			return
		end
	end
end

ChatView._handle_command_list_input = function (self)
	for name, widget in pairs(self._commands_list_widgets) do
		local widget_content = widget.content

		if widget_content.command_hotspot and widget_content.command_hotspot.on_pressed then
			local command = widget_content.command
			local parameter = widget_content.parameter or ""
			local frame_widget = self._widgets.frame_widget
			local frame_widget_content = frame_widget.content
			frame_widget_content.chat_text.text = command .. " " .. parameter
			local text_table = KeystrokeHelper._build_utf8_table(frame_widget_content.chat_text.text)
			frame_widget_content.caret_index = #text_table + 1

			self:_destroy_command_list()

			local frame_widget = self._widgets.frame_widget
			local frame_widget_content = frame_widget.content
			frame_widget_content.text_field_active = true

			return
		end
	end
end

ChatView._handle_filtered_user_names_list_input = function (self)
	for name, widget in pairs(self._filtered_user_names_list_widgets) do
		local widget_content = widget.content

		if widget_content.user_name_hotspot and widget_content.user_name_hotspot.on_pressed then
			local user_name = widget_content.user_name
			local frame_widget = self._widgets.frame_widget
			local frame_widget_content = frame_widget.content
			frame_widget_content.chat_text.text = "/msg " .. user_name .. " "
			local text_table = KeystrokeHelper._build_utf8_table(frame_widget_content.chat_text.text)
			frame_widget_content.caret_index = #text_table + 1

			self:_destroy_filtered_user_names_list()

			return
		end
	end
end

ChatView._handle_user_list_scroll_input = function (self, input_service)
	local user_list = self._user_list
	local current_read_index = self._user_list_read_index

	if not user_list and not current_read_index then
		return
	end

	local input_field_hotspot_widget = self._widgets.list_area_hotspot_widget

	if not input_field_hotspot_widget.content.hotspot.is_hover then
		return
	end

	local scroll_input = input_service:get("chat_scroll")
	local new_read_index = nil

	if input_service:get("chat_scroll_up") or scroll_input[2] > 0.5 then
		new_read_index = math.max(current_read_index - 1, 1)
	elseif input_service:get("chat_scroll_down") or scroll_input[2] < 0 then
		new_read_index = math.min(current_read_index + 1, #user_list)
	end

	if new_read_index and new_read_index ~= current_read_index then
		self:_update_members(new_read_index)
	end
end

ChatView._handle_link_presses = function (self)
	local output_widget = self._widgets.chat_output_widget

	if output_widget.content.link_pressed then
		local link_data = output_widget.content.link_pressed

		Managers.invite:set_invited_lobby_data(link_data.lobby_id)

		output_widget.content.link_pressed = nil

		print("Link Pressed! -> joining game!")
	end
end

ChatView._send_message = function (self, content)
	content.chat_text.text = EmojiHelper.replace_emojis(content.chat_text.text)
	local emojis = EmojiHelper.parse_emojis(content.chat_text.text)

	if content.private_user_name then
		self:_send_private_message(content, emojis)
	else
		self:_send_channel_message(content, emojis)
	end
end

ChatView._show_welcome_message = function (self)
	local chat_output_widget = self._widgets.chat_output_widget
	local chat_output_content = chat_output_widget.content
	local channel_messages_table = chat_output_content.channel_messages_table
	channel_messages_table[self._current_channel_name] = channel_messages_table[self._current_channel_name] or {}
	local message_tables = channel_messages_table[self._current_channel_name]

	for i = 1, #WELCOME_MESSAGE, 1 do
		local message = WELCOME_MESSAGE[i]
		local new_message_table = {
			sender = string.format(message, self._current_channel_name),
			message = "",
			type = nil
		}
		message_tables[#message_tables + 1] = new_message_table
		chat_output_content.text_start_offset = #message_tables
	end
end

ChatView._send_channel_message = function (self, content, emojis)
	local command, parameters, context_data = Managers.chat:send_chat_message(1, self._local_player_id, content.chat_text.text, self._recent_message_index, Irc.CHANNEL_MSG, self._current_channel_name)

	if not command then
		if content.chat_text.text ~= "" then
			local user_name = Managers.irc:user_name()
			local chat_output_widget = self._widgets.chat_output_widget
			local chat_output_content = chat_output_widget.content
			local channel_messages_table = chat_output_content.channel_messages_table
			channel_messages_table[self._current_channel_name] = channel_messages_table[self._current_channel_name] or {}
			local message_tables = channel_messages_table[self._current_channel_name]
			local new_message_table = {
				sender = user_name .. ": ",
				message = content.chat_text.text,
				type = Irc.CHANNEL_MSG
			}

			if #emojis > 0 then
				new_message_table.emojis = table.clone(emojis)
			end

			message_tables[#message_tables + 1] = new_message_table
			chat_output_content.text_start_offset = #message_tables
		else
			content.text_field_active = false
		end
	elseif command == "send_message" then
		local user_name = parameters[2]
		local message = ""

		for i = 3, #parameters, 1 do
			message = message .. " " .. parameters[i]
		end

		local chat_output_widget = self._widgets.chat_output_widget
		local chat_output_content = chat_output_widget.content
		local private_messages_table = chat_output_content.private_messages_table
		private_messages_table[user_name] = private_messages_table[user_name] or {}
		local message_tables = private_messages_table[user_name]
		local new_message_table = {
			sender = "To [" .. user_name .. "]: ",
			message = message,
			type = Irc.PRIVATE_MSG
		}

		if #emojis > 0 then
			new_message_table.emojis = table.clone(emojis)
		end

		message_tables[#message_tables + 1] = new_message_table
		chat_output_content.text_start_offset = #message_tables

		self:_change_to_private(user_name)
	elseif command == "game_invite" then
		local user_name = Managers.irc:user_name()
		local message = ""

		for i = 2, #parameters, 1 do
			message = message .. " " .. parameters[i]
		end

		local chat_output_widget = self._widgets.chat_output_widget
		local chat_output_content = chat_output_widget.content
		local channel_messages_table = chat_output_content.channel_messages_table
		channel_messages_table[self._current_channel_name] = channel_messages_table[self._current_channel_name] or {}
		local message_tables = channel_messages_table[self._current_channel_name]
		local new_message_table = {
			sender = user_name .. ": ",
			message = message,
			type = Irc.CHANNEL_MSG
		}

		if context_data then
			new_message_table.link = context_data
		end

		if #emojis > 0 then
			new_message_table.emojis = table.clone(emojis)
		end

		message_tables[#message_tables + 1] = new_message_table
		chat_output_content.text_start_offset = #message_tables
	elseif command == "clear_chat" then
		local chat_output_widget = self._widgets.chat_output_widget
		local chat_output_content = chat_output_widget.content
		local channel_messages_table = chat_output_content.channel_messages_table
		channel_messages_table[self._current_channel_name] = channel_messages_table[self._current_channel_name] or {}
		local message_tables = channel_messages_table[self._current_channel_name]

		table.clear(message_tables)

		chat_output_content.text_start_offset = #message_tables
	end

	content.chat_text.text = ""
	content.caret_index = 1
	self._recent_message_index = nil
end

ChatView._send_private_message = function (self, content, emojis)
	local user_name = content.private_user_name
	local command, parameters, context_data = Managers.chat:send_chat_message(1, self._local_player_id, content.chat_text.text, self._recent_message_index, Irc.PRIVATE_MSG, user_name)

	if not command then
		if content.chat_text.text ~= "" then
			local chat_output_widget = self._widgets.chat_output_widget
			local chat_output_content = chat_output_widget.content
			local private_messages_table = chat_output_content.private_messages_table
			private_messages_table[user_name] = private_messages_table[user_name] or {}
			local message_tables = private_messages_table[user_name]
			local new_message_table = {
				sender = "To [" .. user_name .. "]: ",
				message = content.chat_text.text,
				type = Irc.PRIVATE_MSG
			}

			if #emojis > 0 then
				new_message_table.emojis = table.clone(emojis)
			end

			message_tables[#message_tables + 1] = new_message_table
			chat_output_content.text_start_offset = #message_tables
		else
			content.text_field_active = false
		end
	elseif command == "game_invite" then
		local message = ""

		for i = 2, #parameters, 1 do
			message = message .. " " .. parameters[i]
		end

		local chat_output_widget = self._widgets.chat_output_widget
		local chat_output_content = chat_output_widget.content
		local private_messages_table = chat_output_content.private_messages_table
		private_messages_table[user_name] = private_messages_table[user_name] or {}
		local message_tables = private_messages_table[user_name]
		local new_message_table = {
			sender = "To [" .. user_name .. "]: ",
			message = message,
			type = Irc.PRIVATE_MSG
		}

		if context_data then
			new_message_table.link = context_data
		end

		if #emojis > 0 then
			new_message_table.emojis = table.clone(emojis)
		end

		message_tables[#message_tables + 1] = new_message_table
		chat_output_content.text_start_offset = #message_tables
	elseif command == "clear_chat" then
		local chat_output_widget = self._widgets.chat_output_widget
		local chat_output_content = chat_output_widget.content
		local private_messages_table = chat_output_content.private_messages_table
		private_messages_table[user_name] = private_messages_table[user_name] or {}
		local message_tables = private_messages_table[user_name]

		table.clear(message_tables)

		chat_output_content.text_start_offset = #message_tables
	end

	content.chat_text.text = ""
	content.caret_index = 1
	self._recent_message_index = nil
end

ChatView.set_active = function (self, active)
	self._active = active

	if self._active then
		self._input_manager:block_device_except_service("chat_view", "keyboard", 1, "irc_chat")
		self._input_manager:block_device_except_service("chat_view", "mouse", 1, "irc_chat")
		self._input_manager:block_device_except_service("chat_view", "gamepad", 1, "irc_chat")
		ShowCursorStack.push()
	else
		ShowCursorStack.pop()
		Managers.save:auto_save(SaveFileName, SaveData, nil)
	end
end

ChatView.suspend = function (self)
	self._suspended = true

	self._input_manager:device_unblock_all_services("keyboard", 1)
	self._input_manager:device_unblock_all_services("mouse", 1)
	self._input_manager:device_unblock_all_services("gamepad", 1)
end

ChatView.unsuspend = function (self)
	self._input_manager:block_device_except_service("chat_view", "keyboard", 1, "irc_chat")
	self._input_manager:block_device_except_service("chat_view", "mouse", 1, "irc_chat")
	self._input_manager:block_device_except_service("chat_view", "gamepad", 1, "irc_chat")

	self._suspended = nil
end

ChatView._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("chat_view")
	local channel_list_input_service = self._input_manager:get_service("channels_list")
	local render_settings = self._render_settings
	local is_connected = Managers.twitch:is_connected()
	local is_connecting = Managers.twitch:is_connecting()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for name, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for name, widget in pairs(self._channel_list_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for name, widget in pairs(self._private_list_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for name, widget in pairs(self._recent_channels_list_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for name, widget in pairs(self._popular_channel_list_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for name, widget in pairs(self._commands_list_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for name, widget in pairs(self._filtered_user_names_list_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local user_entry_widgets = self._user_entry_widgets

	if user_entry_widgets then
		for name, widget in ipairs(user_entry_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	if not table.is_empty(self._channels_list_widgets) then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, channel_list_input_service, dt, nil, render_settings)
		self:_handle_and_draw_channels_list(ui_renderer, ui_scenegraph, dt, t)
		UIRenderer.end_pass(ui_renderer)
	elseif not table.is_empty(self._create_channel_widgets) then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, channel_list_input_service, dt, nil, render_settings)

		for _, widget in pairs(self._create_channel_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		UIRenderer.end_pass(ui_renderer)
	elseif not table.is_empty(self._recent_channels_widgets) then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, channel_list_input_service, dt, nil, render_settings)

		for _, widget in pairs(self._recent_channels_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		UIRenderer.end_pass(ui_renderer)
	elseif not table.is_empty(self._invite_widgets) then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, channel_list_input_service, dt, nil, render_settings)

		for _, widget in pairs(self._invite_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end

		UIRenderer.end_pass(ui_renderer)
	end
end

ChatView.on_exit = function (self)
	self:set_active(false)
end

ChatView.destroy = function (self)
	return
end

ChatView._exit = function (self, return_to_game)
	local exit_transition = (return_to_game and "exit_menu") or "ingame_menu"

	self._ingame_ui:handle_transition(exit_transition)
end

ChatView.input_service = function (self)
	return self._input_manager:get_service("chat_view")
end

ChatView._is_widget_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_pressed
end

ChatView._set_text_field_active = function (self, active)
	local frame_widget = self._widgets.frame_widget
	local frame_widget_content = frame_widget.content
	frame_widget_content.text_field_active = active
end

ChatView._handle_user_pressed = function (self)
	local user_entry_widgets = self._user_entry_widgets

	for _, widget in ipairs(user_entry_widgets) do
		local content = widget.content
		local hotspot = content.button_hotspot

		if hotspot.on_double_click then
			local user_name = string.gsub(content.title_text, "@", "")

			self:_change_to_private(user_name)
			self:_set_text_field_active(true)
		elseif hotspot.on_right_click then
			print("on right click", content.title_text)
		end
	end
end

ChatView._populate_user_widgets = function (self, users, read_index)
	local user_entry_widgets = self._user_entry_widgets
	local current_user_index = read_index

	for _, widget in ipairs(user_entry_widgets) do
		local content = widget.content
		local style = widget.style
		local user_data = users[current_user_index]

		if user_data then
			content.title_text = user_data.name
			content.level_text = user_data.level or tostring(math.random(1, 100) + math.random(0, 100))
			content.description_text = user_data.info or "abc..."
			content.icon = tmp_icons[user_data.icon_id] or "icons_placeholder"
		end

		local visible = user_data ~= nil
		content.visible = visible
		current_user_index = current_user_index + 1
	end
end

for key, template in pairs(ItemMasterList) do
	local item_type = template.item_type

	if item_type == "hat" then
		tmp_icons[#tmp_icons + 1] = template.inventory_icon
	end
end

ChatView._update_members = function (self, read_index)
	read_index = read_index or self._user_list_read_index or 1
	self._current_channel_name = self._current_channel_name or Managers.irc:home_channel()
	local local_user_name = Managers.irc:user_name()
	local user_list = {}
	local user_names = {}
	local members = Managers.irc:get_channel_members(self._current_channel_name)
	local k = 1

	for member_name, user_data in pairs(members) do
		user_list[k] = user_data
		user_names[k] = user_data.name
		k = k + 1
	end

	self:_populate_user_widgets(user_list, read_index)

	self._user_list = user_list
	self._user_names = user_names
	self._user_list_read_index = read_index
end

return
