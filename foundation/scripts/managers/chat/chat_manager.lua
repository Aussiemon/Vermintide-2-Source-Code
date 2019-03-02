require("scripts/ui/views/chat_gui")
require("scripts/misc/script_retrieve_app_ticket_token")

local PROFANITY_LIST = require("scripts/settings/profanity_list")

if script_data.honduras_demo or Development.parameter("attract_mode") then
	ChatGuiNull = class(ChatGuiNull)

	for name, func in pairs(ChatGui) do
		ChatGuiNull[name] = function ()
			return
		end
	end
end

ChatManager = class(ChatManager)

if not MESSAGE_TYPES then
	local MESSAGE_TYPES = {
		[Irc.PRIVATE_MSG] = "Private Message",
		[Irc.CHANNEL_MSG] = "Channel Message",
		[Irc.SYSTEM_MSG] = "System Message",
		[Irc.PARTY_MSG] = "Party Message"
	}
end

local CHAT_VIEWS = {
	"All",
	"Channels",
	"Party",
	"Private"
}
local CHAT_VIEW_LUT = {
	All = {},
	Channels = {
		filter = Irc.CHANNEL_MSG
	},
	Party = {
		filter = Irc.PARTY_MSG
	},
	Private = {
		filter = Irc.PRIVATE_MSG
	}
}
CHAT_VIEW_TYPE_LUT = {
	[0] = "Private",
	"Channels",
	nil,
	"Party"
}
CHAT_VIEW_COLOR = {
	All = Colors.get_table("white"),
	Channels = IRC_CHANNEL_COLORS[Irc.CHANNEL_MSG],
	Party = IRC_CHANNEL_COLORS[Irc.PARTY_MSG],
	Private = IRC_CHANNEL_COLORS[Irc.PRIVATE_MSG]
}

ChatManager.init = function (self)
	self.channels = {}
	self.chat_messages = {}
	self.global_messages = {}
	self.user_to_simplified_user_lut = {}
	self.alias_lut = {}
	self.recently_sent_messages = {}
	self.peer_ignore_list = SaveData.chat_ignore_list or {}

	self:create_chat_gui()
	self:set_chat_enabled(Application.user_setting("chat_enabled"))

	self.message_targets = {}
	self.message_targets_lut = {}
	self.current_message_target_index = 1
	self.current_view_index = 1

	self:add_message_target("Party", Irc.PARTY_MSG)

	if PLATFORM == "win32" and GameSettingsDevelopment.use_global_chat and rawget(_G, "Steam") then
		Steam.retrieve_encrypted_app_ticket()

		local token = ScriptReceiveAppTicketToken:new()

		Managers.token:register_token(token, callback(self, "cb_encrypted_app_ticket_recieved"), 20)
	elseif not rawget(_G, "Steam") then
		GameSettingsDevelopment.use_global_chat = false

		Application.warning("[ChatManager] DISABLING GLOBAL CHAT - STEAM NOT ENABLED")
	end
end

ChatManager.update_ignore_list = function (self)
	self.peer_ignore_list = SaveData.chat_ignore_list or self.peer_ignore_list
end

ChatManager.cb_encrypted_app_ticket_recieved = function (self, info)
	local password = nil

	print("ENCRYPTED APP TICKET RECIEVED")
	print("begin")

	if info.error then
		GameSettingsDevelopment.use_global_chat = false

		print("FAILED", info.error, info.encrypted_app_ticket)
	else
		print("SUCCESS:")
		print(info.encrypted_app_ticket)

		password = "steam:" .. info.encrypted_app_ticket
	end

	print("end")

	local irc_settings = {
		port = 6667,
		allow_send = true,
		channel_name = "#vermintide_se",
		address = "irc.fatsharkgames.se"
	}
	local user_name = Steam.user_name()

	Managers.irc:connect(user_name, password, irc_settings, callback(self, "cb_notify_connected"))
end

ChatManager.cb_notify_connected = function (self, connected)
	if connected then
		Application.warning("[ChatManager] Connected to IRC!")
		Managers.irc:register_message_callback("chat_channel_message", Irc.CHANNEL_MSG, callback(self, "cb_channel_msg_received"))
		Managers.irc:register_message_callback("chat_private_message", Irc.PRIVATE_MSG, callback(self, "cb_private_msg_received"))
		Managers.irc:register_message_callback("chat_system_message", Irc.SYSTEM_MSG, callback(self, "cb_system_msg_received"))
		Managers.irc:register_message_callback("chat_join_message", Irc.JOIN_MSG, callback(self, "cb_join_msg_received"))
		Managers.irc:register_message_callback("chat_leave_message", Irc.LEAVE_MSG, callback(self, "cb_leave_msg_received"))
		Managers.irc:register_message_callback("chat_names_message", Irc.NAMES_MSG, callback(self, "cb_names_msg_received"))
	else
		Application.error("[ChatManager] Disconnected from IRC!")
		Managers.irc:unregister_message_callback("chat_channel_message")
		Managers.irc:unregister_message_callback("chat_private_message")
		Managers.irc:unregister_message_callback("chat_system_message")
		Managers.irc:unregister_message_callback("chat_join_message")
		Managers.irc:unregister_message_callback("chat_leave_message")
		Managers.irc:unregister_message_callback("chat_names_message")
	end
end

ChatManager.cb_channel_msg_received = function (self, key, message_type, username, message, parameter)
	local message, link_data = self:check_meta(message, username, parameter)

	if message then
		Managers.chat:add_irc_message(message_type, username, message, parameter, link_data)
	end
end

ChatManager.cb_private_msg_received = function (self, key, message_type, username, message, parameter)
	local message, link_data = self:check_meta(message, username, parameter)

	if message then
		Managers.chat:add_irc_message(message_type, username, message, parameter, link_data)
	end
end

ChatManager.cb_system_msg_received = function (self, key, message_type, username, message, parameter)
	Managers.chat:add_irc_message(message_type, username, message, parameter)
end

ChatManager.cb_join_msg_received = function (self, key, message_type, username, message, parameter)
	message = username .. " " .. message .. parameter

	Managers.chat:add_irc_message(message_type, username, message, parameter)
end

ChatManager.cb_leave_msg_received = function (self, key, message_type, username, message, parameter)
	message = username .. " " .. message .. parameter

	Managers.chat:add_irc_message(message_type, username, message, parameter)
end

ChatManager.cb_names_msg_received = function (self, key, message_type, username, message, parameter)
	Managers.chat:add_irc_message(message_type, username, message, parameter)
end

ChatManager.check_meta = function (self, message, username, parameter)
	if string.find(message, "$LINK;") then
		local start_index, end_index = string.find(message, "$LINK;")

		if end_index then
			local new_message = string.sub(message, 1, start_index - 1)
			local lobby_id = string.sub(message, end_index + 1)
			local lobby_data = SteamMisc.get_lobby_data(lobby_id)

			if lobby_data then
				return new_message, {
					lobby_id = lobby_id
				}
			else
				return new_message
			end
		end

		return message
	end

	return message
end

ChatManager.add_message_target = function (self, message_target, message_target_type)
	if self:_verify_new_target(message_target, message_target_type) then
		self.message_targets[#self.message_targets + 1] = {
			message_target = message_target,
			message_target_type = message_target_type
		}
		self.message_targets_lut[message_target] = #self.message_targets
	end
end

ChatManager._verify_new_target = function (self, message_target, message_target_type)
	if not message_target or message_target == "" then
		return false
	end

	for _, info in ipairs(self.message_targets) do
		if info.message_target == message_target then
			return false
		end
	end

	return true
end

ChatManager.remove_message_target = function (self, message_target)
	local target_index = self.message_targets_lut[message_target]

	if target_index then
		table.remove(self.message_targets, target_index)

		self.message_targets_lut[message_target] = nil

		return true
	end
end

ChatManager.current_view_and_color = function (self)
	local chat_view_name = CHAT_VIEWS[self.current_view_index]

	return chat_view_name, CHAT_VIEW_COLOR[chat_view_name]
end

ChatManager.add_recent_chat_message = function (self, message)
	self.recently_sent_messages[#self.recently_sent_messages + 1] = message
end

ChatManager.get_recently_sent_messages = function (self)
	return self.recently_sent_messages
end

ChatManager.next_message_target = function (self)
	self.current_message_target_index = 1 + self.current_message_target_index % #self.message_targets
	local message_target_type = self.message_targets[self.current_message_target_index].message_target_type
	local filter_name = CHAT_VIEWS[self.current_view_index]
	local view_filter = CHAT_VIEW_LUT[filter_name].filter

	if filter_name == "All" or message_target_type == view_filter then
		return
	end

	local view_name = CHAT_VIEW_TYPE_LUT[message_target_type]

	if not view_name then
		return
	end

	local view_index = table.find(CHAT_VIEWS, view_name)

	if not view_index then
		return
	end

	self:_switch_view_internally(view_index)

	return true
end

ChatManager.current_message_target = function (self)
	return self.message_targets[self.current_message_target_index]
end

ChatManager.gui_should_clear = function (self)
	local clear = self.clear_messages
	self.clear_messages = nil

	return clear
end

ChatManager.create_chat_gui = function (self)
	local top_world = Managers.world:world("top_ingame_view")
	self._ui_top_renderer = UIRenderer.create(top_world, "material", "materials/ui/ui_1080p_chat", "material", "materials/fonts/gw_fonts")
	local context = {
		input_manager = Managers.input,
		ui_top_renderer = self._ui_top_renderer,
		chat_manager = self
	}

	if script_data.honduras_demo then
		self.chat_gui = ChatGuiNull
	else
		self.chat_gui = ChatGui:new(context)
	end

	self.gui_enabled = true
	local font_size = nil

	if LEVEL_EDITOR_TEST then
		font_size = DefaultUserSettings.get("user_settings", "chat_font_size")
	else
		font_size = Application.user_setting("chat_font_size")
	end

	self:set_font_size(font_size)
end

ChatManager.set_profile_synchronizer = function (self, profile_synchronizer)
	self.chat_gui:set_profile_synchronizer(profile_synchronizer)
end

ChatManager.set_wwise_world = function (self, wwise_world)
	self.chat_gui:set_wwise_world(wwise_world)
end

ChatManager.set_input_manager = function (self, input_manager)
	self.chat_gui:set_input_manager(input_manager)
end

ChatManager.register_network_event_delegate = function (self, network_event_delegate)
	network_event_delegate:register(self, "rpc_chat_message")

	self.network_event_delegate = network_event_delegate
end

ChatManager.unregister_network_event_delegate = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
end

ChatManager.setup_network_context = function (self, network_context)
	print(string.format("[ChatManager] Setting up network context, host_peer_id:%s my_peer_id:%s", network_context.host_peer_id, network_context.my_peer_id))

	self.is_server = network_context.is_server
	self.host_peer_id = network_context.host_peer_id
	self.my_peer_id = network_context.my_peer_id
end

ChatManager.ignoring_peer_id = function (self, peer_id)
	return self.peer_ignore_list[peer_id]
end

ChatManager.ignore_peer_id = function (self, peer_id)
	self.peer_ignore_list[peer_id] = true

	if rawget(_G, "Steam") or PLATFORM ~= "win32" then
		SaveData.chat_ignore_list = self.peer_ignore_list

		Managers.save:auto_save(SaveFileName, SaveData, nil)
	end
end

ChatManager.remove_ignore_peer_id = function (self, peer_id)
	self.peer_ignore_list[peer_id] = nil

	if rawget(_G, "Steam") or PLATFORM ~= "win32" then
		SaveData.chat_ignore_list = self.peer_ignore_list

		Managers.save:auto_save(SaveFileName, SaveData, nil)
	end
end

ChatManager.destroy = function (self)
	self.chat_gui:destroy()

	self.chat_gui = nil
	local top_world = Managers.world:world("top_ingame_view")

	UIRenderer.destroy(self._ui_top_renderer, top_world)

	self.channels = nil
end

ChatManager.set_font_size = function (self, font_size)
	if self.chat_gui then
		self.chat_gui:set_font_size(font_size)
	end
end

ChatManager.set_chat_enabled = function (self, chat_enabled)
	self._chat_enabled = chat_enabled
end

ChatManager.register_channel = function (self, channel_id, members_func)
	print(string.format("[ChatManager] Registering channel %s", channel_id))

	local channels = self.channels

	if PLATFORM == "xb1" then
		if channels[channel_id] then
			Application.warning(string.format("[ChatManager] Tried to add already registered channel %q", channel_id))
		end
	else
		assert(channels[channel_id] == nil, "[ChatManager] Tried to add already registered channel %q", channel_id)
	end

	channels[channel_id] = {
		members_func = members_func
	}
end

ChatManager.unregister_channel = function (self, channel_id)
	print(string.format("[ChatManager] Unregistering channel %s", channel_id))

	self.channels[channel_id] = nil
end

ChatManager.chat_is_focused = function (self)
	return self.chat_gui.chat_focused
end

ChatManager.enable_gui = function (self, enable)
	self.gui_enabled = enable
end

ChatManager.update = function (self, dt, t, menu_active, menu_input_service, no_unblock)
	if self.gui_enabled then
		self.chat_gui:update(dt, menu_active, menu_input_service, no_unblock, self._chat_enabled)
	end
end

ChatManager._get_localized_message = function (self, message, localize, localization_parameters, localize_parameters)
	local localized_parameters = nil

	if localize_parameters then
		localized_parameters = LocalizeArray(localization_parameters, FrameTable.alloc_table())
	else
		localized_parameters = localization_parameters
	end

	if localize then
		message = string.format(Localize(message), unpack(localized_parameters))
	elseif #localized_parameters > 0 then
		message = string.format(message, unpack(localized_parameters))
	end

	return message
end

ChatManager.send_chat_message = function (self, channel_id, local_player_id, message, localize, localization_parameters, localize_parameters, recent_message_index, optional_message_type, optional_message_target)
	local command, parameters, context_data = self:_handle_command(message, recent_message_index, optional_message_target)

	if command then
		return command, parameters, context_data
	end

	fassert(self:has_channel(channel_id), "Haven't registered channel: %s", tostring(channel_id))

	local is_system_message = false
	local pop_chat = true
	local peer_id = self.my_peer_id
	local is_dev = SteamHelper.is_dev(peer_id) and local_player_id == 1

	if type(localization_parameters) ~= "table" then
		local old_parameter = localization_parameters
		localization_parameters = FrameTable.alloc_table()
		localization_parameters[1] = old_parameter
	end

	local message_target_info = self.message_targets[self.current_message_target_index]
	local message_type = optional_message_type or message_target_info.message_target_type
	local message_target = optional_message_target or message_target_info.message_target

	if message_type == Irc.PARTY_MSG then
		if self.is_server then
			local members = self:channel_members(channel_id)

			for _, member in pairs(members) do
				if member ~= self.my_peer_id then
					RPC.rpc_chat_message(member, channel_id, peer_id, local_player_id, message, localization_parameters, localize, localize_parameters, is_system_message, pop_chat, is_dev)
				end
			end
		else
			local host_peer_id = self.host_peer_id

			if host_peer_id then
				RPC.rpc_chat_message(host_peer_id, channel_id, peer_id, local_player_id, message, localization_parameters, localize, localize_parameters, is_system_message, pop_chat, is_dev)
			end
		end
	elseif message_type == Irc.CHANNEL_MSG or message_type == Irc.PRIVATE_MSG then
		Managers.irc:send_message(message, message_target)

		if rawget(_G, "Steam") then
			peer_id = Steam.user_name()
		end

		if message_type == Irc.CHANNEL_MSG then
			peer_id = "[" .. message_target .. "] " .. peer_id
		elseif message_type == Irc.PRIVATE_MSG then
			peer_id = "To [" .. message_target .. "]"
		end
	end

	if not recent_message_index then
		self:add_recent_chat_message(message)
	else
		local recent_message = self.recently_sent_messages[recent_message_index]

		if recent_message ~= message then
			self:add_recent_chat_message(message)
		end
	end

	local localized_message = self:_get_localized_message(message, localize, localization_parameters, localize_parameters)

	self:_add_message_to_list(channel_id, peer_id, local_player_id, localized_message, is_system_message, pop_chat, is_dev, message_type)
end

ChatManager.send_system_chat_message = function (self, channel_id, message_id, localization_parameters, localize_parameters, pop_chat)
	fassert(self:has_channel(channel_id), "Haven't registered channel: %s", tostring(channel_id))

	local localize = true

	if type(localization_parameters) ~= "table" then
		local old_parameter = localization_parameters
		localization_parameters = FrameTable.alloc_table()
		localization_parameters[1] = old_parameter
	end

	local is_system_message = true
	pop_chat = pop_chat or false
	local is_dev = false
	local my_peer_id = self.my_peer_id

	if self.is_server then
		local members = self:channel_members(channel_id)

		for _, member in pairs(members) do
			if member ~= my_peer_id then
				RPC.rpc_chat_message(member, channel_id, my_peer_id, 0, message_id, localization_parameters, localize, localize_parameters, is_system_message, pop_chat, is_dev)
			end
		end
	else
		local host_peer_id = self.host_peer_id

		if host_peer_id then
			RPC.rpc_chat_message(host_peer_id, channel_id, my_peer_id, 0, message_id, localization_parameters, localize, localize_parameters, is_system_message, pop_chat, is_dev)
		end
	end

	local message_sender = "System"
	local localized_message = self:_get_localized_message(message_id, localize, localization_parameters, localize_parameters)

	self:_add_message_to_list(channel_id, message_sender, 0, localized_message, is_system_message, pop_chat, is_dev)
end

ChatManager.add_local_system_message = function (self, channel_id, message, pop_chat)
	local message_sender = "System"
	local is_system_message = true
	local is_dev = false

	self:_add_message_to_list(channel_id, message_sender, 0, message, is_system_message, pop_chat, is_dev)
end

ChatManager.add_irc_message = function (self, message_type, username, message, parameter, context)
	local channel_id = 1
	local data = {
		username = username,
		message = message,
		parameter = parameter
	}

	if message_type == Irc.PRIVATE_MSG then
		local link_data = context

		if not link_data then
			self._last_private_message_username = username

			self:add_message_target(username, message_type)
		end

		self:_add_message_to_list(channel_id, username, 0, message, nil, true, false, message_type, link_data, data)
	elseif message_type == Irc.CHANNEL_MSG then
		local link_data = context

		self:_add_message_to_list(channel_id, username, 0, message, nil, true, false, message_type, link_data, data)
	elseif message_type == Irc.SYSTEM_MSG then
		self:_add_message_to_list(channel_id, "System", 0, message, nil, true, false, message_type, nil, data)
	elseif message_type == Irc.JOIN_MSG then
		if username == Managers.irc:user_name() then
			self:_add_message_to_list(channel_id, "System", 0, message, nil, true, false, Irc.SYSTEM_MSG, nil, data)
			self:add_message_target(parameter, Irc.CHANNEL_MSG)
		else
			self:_add_message_to_list(channel_id, "System", 0, message, nil, true, false, Irc.SYSTEM_MSG, nil, data)
		end
	elseif message_type == Irc.LEAVE_MSG then
		if username == Managers.irc:user_name() then
			self:_add_message_to_list(channel_id, "System", 0, message, nil, true, false, Irc.SYSTEM_MSG, nil, data)
			self:remove_message_target(parameter)
		else
			self:_add_message_to_list(channel_id, "System", 0, message, nil, true, false, Irc.SYSTEM_MSG, nil, data)
		end
	end
end

ChatManager.channel_members = function (self, channel_id)
	local channel = self.channels[channel_id]

	fassert(channel, "[ChatManager] Trying to get members from unregistered channel %q", channel_id)

	local members = channel.members_func()

	return members
end

ChatManager.is_channel_member = function (self, channel_id)
	local channel = self.channels[channel_id]
	local members = channel.members_func()
	local my_peer_id = self.my_peer_id

	for _, member in pairs(members) do
		if member == my_peer_id then
			return true
		end
	end
end

ChatManager.has_channel = function (self, channel_id)
	return self.channels[channel_id] and true
end

ChatManager.rpc_chat_message = function (self, sender, channel_id, message_sender, local_player_id, message, localization_parameters, localize, localize_parameters, is_system_message, pop_chat, is_dev)
	if not self:has_channel(channel_id) then
		return
	end

	if self.is_server then
		local members = self:channel_members(channel_id)
		local my_peer_id = self.my_peer_id

		for _, member in pairs(members) do
			if member ~= my_peer_id and member ~= sender then
				RPC.rpc_chat_message(member, channel_id, message_sender, local_player_id, message, localization_parameters, localize, localize_parameters, is_system_message, pop_chat, is_dev)
			end
		end
	end

	if self:is_channel_member(channel_id) and (is_system_message or not self.peer_ignore_list[message_sender]) then
		if is_system_message then
			message_sender = "System"
		end

		local localized_message = self:_get_localized_message(message, localize, localization_parameters, localize_parameters)

		self:_add_message_to_list(channel_id, message_sender, local_player_id, localized_message, is_system_message, pop_chat, is_dev)
	end
end

ChatManager._profanity_check = function (self, message)
	for _, profanity in pairs(PROFANITY_LIST) do
		local start_index, end_index = string.find(message, profanity)

		while start_index do
			local replacement_text = ""
			local length = UTF8Utils.string_length(profanity)

			for i = 1, length, 1 do
				replacement_text = replacement_text .. "*"
			end

			message = string.gsub(message, profanity, replacement_text)
			start_index, end_index = string.find(message, profanity)
		end
	end

	return message
end

ChatManager._add_message_to_list = function (self, channel_id, message_sender, local_player_id, message, is_system_message, pop_chat, is_dev, message_type, link, data)
	local player_manager = Managers.player
	local player = player_manager:player_from_peer_id(message_sender, local_player_id)
	local is_bot = false

	if player then
		is_bot = not player:is_player_controlled()
	end

	if Application.user_setting("profanity_check") and not is_system_message then
		message = self:_profanity_check(message)
	end

	local global_messages = self.global_messages
	global_messages[#global_messages + 1] = {
		channel_id = channel_id,
		message_sender = message_sender,
		local_player_id = local_player_id,
		message = message,
		type = message_type or (is_system_message and Irc.SYSTEM_MSG) or Irc.PARTY_MSG,
		pop_chat = pop_chat,
		is_dev = is_dev,
		is_bot = is_bot,
		link = link,
		data = data
	}

	if not self._chat_enabled and not is_system_message then
		return
	end

	local chat_messages = self.chat_messages
	chat_messages[#chat_messages + 1] = global_messages[#global_messages]

	if is_system_message then
		local sender = "System"

		printf("[ChatManager][%s]%s: %s", channel_id, sender, message)
	end
end

ChatManager.get_chat_messages = function (self, destination_table, filter_name)
	local filter_name = filter_name or CHAT_VIEWS[self.current_view_index] or 1
	local filter = CHAT_VIEW_LUT[filter_name].filter
	local chat_messages = self.chat_messages

	for i, message_data in pairs(chat_messages) do
		if filter_name == "All" or message_data.type == filter then
			destination_table[i] = message_data
		end

		chat_messages[i] = nil
	end
end

ChatManager._switch_view_internally = function (self, view_index)
	self.current_view_index = view_index
	local chat_messages = self.chat_messages

	table.clear(chat_messages)

	local message_data = nil
	local filter_name = CHAT_VIEWS[self.current_view_index] or 1

	print("Switching Chat View to: " .. string.upper(filter_name))

	local filter = CHAT_VIEW_LUT[filter_name].filter

	for i = 1, #self.global_messages, 1 do
		message_data = self.global_messages[i]

		if filter_name == "All" or message_data.type == filter then
			chat_messages[#chat_messages + 1] = message_data
		end
	end
end

ChatManager.switch_view = function (self, view_index)
	self.current_view_index = 1 + self.current_view_index % #CHAT_VIEWS
	local chat_messages = self.chat_messages

	table.clear(chat_messages)

	local message_data = nil
	local filter_name = CHAT_VIEWS[self.current_view_index] or 1

	print("Switching Chat View to: " .. string.upper(filter_name))

	local filter = CHAT_VIEW_LUT[filter_name].filter

	for i = 1, #self.global_messages, 1 do
		message_data = self.global_messages[i]

		if filter_name == "All" or message_data.type == filter then
			chat_messages[#chat_messages + 1] = message_data
		end
	end
end

COMMAND_LUT = {
	["/w"] = "send_message",
	["/t"] = "send_message",
	["/away"] = "away",
	["/cls"] = "clear_chat",
	["/reply"] = "reply",
	["/clear"] = "clear_chat",
	["/j"] = "join_channel",
	["/leave"] = "leave",
	["/invite"] = "game_invite",
	["/msg"] = "send_message",
	["/join"] = "join_channel",
	["/send"] = "send_message",
	["/r"] = "reply",
	["/who"] = "who",
	["/part"] = "leave"
}

ChatManager._handle_command = function (self, message, recent_message_index, optional_message_target)
	if string.find(message, "/") == 1 then
		local parameters = string.split(message, " ")
		local command = COMMAND_LUT[parameters[1]]
		local context_data = nil

		if command then
			context_data = self[command](self, parameters, message, recent_message_index, optional_message_target)
		end

		return command, parameters, context_data
	end

	return false
end

ChatManager.join_channel = function (self, parameters)
	if parameters[2] then
		Managers.irc:join_channel(parameters[2])

		if string.find(parameters[2], "#") == 1 then
			local channel_name = string.lower(parameters[2])

			self:add_message_target(channel_name, Irc.CHANNEL_MSG)

			self.current_message_target_index = self.message_targets_lut[channel_name] or self.current_message_target_index
		end
	end
end

ChatManager.game_invite = function (self, parameters, message, recent_message_index, optional_message_target)
	if #parameters > 0 then
		local message_target_data = nil

		if optional_message_target then
			local message_target_index = self.message_targets_lut[optional_message_target]

			if not message_target_index then
				print("No such message target:", optional_message_target)

				return
			else
				message_target_data = self.message_targets[message_target_index]
			end
		else
			message_target_data = self:current_message_target()
		end

		if message_target_data.message_target_type == Irc.PARTY_MSG then
			self:_add_message_to_list(1, "System", 0, "You cannot invite people already in your party", false, true, false, Irc.SYSTEM_MSG)

			return
		end

		local _, end_index = string.find(message, parameters[1])
		local message = string.sub(message, end_index + 2)
		local cropped_msg = string.gsub(message, " ", "")

		if string.len(cropped_msg) == 0 then
			return
		end

		local lobby_id = Managers.state.network:lobby():id()
		local link_data = {
			lobby_id = lobby_id
		}
		local networked_message = message .. "$LINK;" .. lobby_id
		local channel_or_username = message_target_data.message_target

		print(networked_message, channel_or_username)
		Managers.irc:send_message(networked_message, channel_or_username)
		self:_add_message_to_list(1, "LINK", message, 0, false, true, false, message_target_data.message_target_type, link_data)

		return link_data
	end
end

ChatManager.send_message = function (self, parameters, message, recent_message_index)
	if parameters[2] then
		local _, end_index = string.find(message, parameters[2], 1, true)
		local message = string.sub(message, end_index + 2)
		local cropped_msg = string.gsub(message, " ", "")

		if string.len(cropped_msg) == 0 then
			return
		end

		local user_name = parameters[2]

		if Managers.irc:send_message(message, user_name) then
			self:add_message_target(user_name, Irc.PRIVATE_MSG)

			self.current_message_target_index = self.message_targets_lut[user_name] or self.current_message_target_index
			local name = "To [" .. user_name .. "]"

			if not recent_message_index then
				self:add_recent_chat_message(message)
			else
				local recent_message = self.recently_sent_messages[recent_message_index]

				if recent_message ~= message then
					self:add_recent_chat_message(message)
				end
			end

			self:_add_message_to_list(1, name, 0, message, false, true, false, Irc.PRIVATE_MSG)
		end
	end
end

ChatManager.leave = function (self, parameters)
	if parameters[2] and string.find(parameters[2], "#") == 1 then
		local channel_name = string.lower(parameters[2])

		Managers.irc:leave_channel(channel_name)

		if self:remove_message_target(channel_name) then
			self.current_message_target_index = 1
		end
	end
end

ChatManager.who = function (self, parameters)
	if parameters[2] and string.find(parameters[2], "#") == 1 then
		local channel_name = string.lower(parameters[2])

		Managers.irc:who(channel_name)
	end
end

ChatManager.reply = function (self, parameters, message)
	local user_name = self._last_private_message_username

	if parameters[2] and user_name then
		local start_index, end_index = string.find(message, parameters[1])
		local new_message = string.sub(message, end_index + 2)

		Managers.irc:send_message(new_message, user_name)

		self.current_message_target_index = self.message_targets_lut[user_name] or self.current_message_target_index
		local name = "To [" .. user_name .. "]"

		self:add_recent_chat_message(new_message)
		self:_add_message_to_list(1, name, 0, new_message, false, true, false, Irc.PRIVATE_MSG)
	end
end

ChatManager.clear_chat = function (self)
	self.global_messages = {}
	self.chat_messages = {}
	self.clear_messages = true
end

return
