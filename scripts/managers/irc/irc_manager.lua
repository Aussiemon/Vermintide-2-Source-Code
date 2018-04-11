IRCManager = class(IRCManager)
Irc.LIST_END_MSG = 8
Irc.META_MSG = 9
local DEBUG_PRINT = false
local CONNECTION_TIMER = 5
local MESSAGES_TO_SEND = {}

local function debug_print(message, ...)
	if DEBUG_PRINT then
		printf("[IRCManager] " .. message, ...)
	end

	return 
end

IRCManager.init = function (self)
	self._reset(self)

	return 
end
IRCManager._reset = function (self)
	self._state = "none"
	self._connection_timer = 0
	self._connection_retries = 0
	self._user_name = nil
	self._port = nil
	self._host_address = nil
	self._channel_members = {}
	self._channels = {}
	self._callback_by_type = self._callback_by_type or {
		[Irc.PRIVATE_MSG] = {},
		[Irc.CHANNEL_MSG] = {},
		[Irc.SYSTEM_MSG] = {},
		[Irc.JOIN_MSG] = {},
		[Irc.LEAVE_MSG] = {},
		[Irc.NAMES_MSG] = {},
		[Irc.LIST_MSG] = {},
		[Irc.LIST_END_MSG] = {},
		[Irc.META_MSG] = {}
	}

	return 
end
IRCManager.connect = function (self, user_name, optional_password, settings, cb)
	local address = settings.address
	local port = settings.port or 6667
	local channel_name = settings.channel_name
	local allow_send = settings.allow_send

	fassert(address and port, "[IRCManager] You need to provide both address and port when connecting to IRC")

	self._host_address = address
	self._port = port
	local default_user_name = "justinfan" .. Math.random(99999)
	self._user_name = user_name or self._user_name or default_user_name
	self._user_name = string.gsub(self._user_name, " ", "_")
	self._password = optional_password or nil
	self._auto_join_channel = channel_name
	self._home_channel = channel_name or ""

	self._change_state(self, "initialize")

	self._callback = cb
	self._allow_send = allow_send

	return 
end
IRCManager.home_channel = function (self)
	return self._home_channel
end
IRCManager.set_user_name = function (self, user_name)
	fassert(self._state == "none", "[IRCManager] You can't change user name after you've connected")

	self._user_name = string.gsub(user_name, " ", "_")

	return 
end
IRCManager.register_message_callback = function (self, key, message_type, callback)
	fassert(self._callback_by_type[message_type], "[IRCManager] There is no message type called %s", message_type)

	self._callback_by_type[message_type][key] = callback

	return 
end
IRCManager.unregister_message_callback = function (self, key, optional_message_type)
	if optional_message_type then
		self._callback_by_type[optional_message_type][key] = nil
	else
		for message_type, callbacks in pairs(self._callback_by_type) do
			self._callback_by_type[message_type][key] = nil
		end
	end

	return 
end
IRCManager.user_name = function (self)
	return self._user_name
end
IRCManager.force_disconnect = function (self)
	Irc.disconnect()

	return 
end
IRCManager.send_message = function (self, message, channel_or_user)
	if self._allow_send then
		local channel_or_user = channel_or_user

		if channel_or_user == self._user_name then
			Application.error("[IRCManager] You cannot message yourself")
		else
			debug_print("message: %s - channel or user: %s", message, tostring(channel_or_user))

			MESSAGES_TO_SEND[#MESSAGES_TO_SEND + 1] = {
				message = message,
				channel_or_user = channel_or_user
			}

			return true
		end
	else
		Application.error("[IRCManager] You're not allowed to send messages")
	end

	return false
end
IRCManager.join_channel = function (self, channel)
	debug_print("Joining Channel: %s", tostring(channel))
	Irc.join_channel(channel)

	return 
end
IRCManager.leave_channel = function (self, channel)
	debug_print("Leaving Channel: %s", tostring(channel))
	Irc.leave_channel(channel)

	return 
end
IRCManager.who = function (self, channel)
	Irc.who(channel)

	return 
end
IRCManager.destroy = function (self)
	Irc.disconnect()

	return 
end
IRCManager._handle_irc_message = function (self, message_type, username, message, parameter)
	debug_print("Message: %s %s %s %s", message_type, username, message, parameter)

	if self._handle_meta(self, message_type, username, message, parameter) then
		return 
	end

	message_type = self._handle_connections(self, message_type, username, message, parameter)
	local callbacks = self._callback_by_type[message_type]

	if callbacks then
		local message = string.gsub(message, "%c", "")

		for key, callback in pairs(callbacks) do
			callback(key, message_type, username, message, parameter)
		end
	end

	return 
end
IRCManager._handle_connections = function (self, message_type, username, message, parameter)
	self._channels = self._channels or {}
	self._channel_members = self._channel_members or {}

	if message_type == Irc.NAMES_MSG then
		local channel = parameter
		local new_members = string.split(message, " ")
		self._channels[channel] = true
		self._channel_members[channel] = self._channel_members[channel] or {}
		local members = self._channel_members[channel]

		for _, name in ipairs(new_members) do
			if not members[name] then
				members[name] = {
					icon_id = 0,
					info = "",
					level = "n/a",
					name = name,
					time = Managers.time:time("main")
				}
			end
		end
	elseif message_type == Irc.LEAVE_MSG then
		if username == self._user_name then
			local channel = parameter
			self._channel_members[channel] = nil
			self._channels[channel] = nil
		else
			local channel = parameter
			self._channel_members[channel] = self._channel_members[channel] or {}
			local channel_members = self._channel_members[channel]
			channel_members[username] = nil
		end
	elseif message_type == Irc.JOIN_MSG then
		local channel = parameter
		self._channel_members[channel] = self._channel_members[channel] or {}
		local user_data, icon_id, level, info = nil

		if username == self._user_name then
			icon_id = 1
			info = "vermintide owns"
			local level = ExperienceSettings.get_account_level()
			user_data = {
				name = username,
				time = Managers.time:time("main"),
				icon_id = icon_id,
				level = level,
				info = info
			}
			local message = self._create_metadata_table(self, username, icon_id, level, info)

			Irc.send_message(message, parameter)
			self._update_meta_data(self, username, channel, user_data)
		else
			user_data = {
				name = username,
				time = Managers.time:time("main"),
				icon_id = icon_id,
				level = level,
				info = info
			}
		end

		self._channel_members[channel][username] = user_data
		self._channels[channel] = true

		Managers.chat:add_message_target(channel, Irc.CHANNEL_MSG)
	elseif message_type == Irc.LIST_MSG and message == "CHANNELS_END" then
		message_type = Irc.LIST_END_MSG
	end

	return message_type
end
IRCManager._handle_meta = function (self, message_type, username, message, parameter)
	if message_type == Irc.CHANNEL_MSG then
		local meta_start_index, meta_end_index = string.find(message, "$META;")

		if meta_end_index then
			local metadata = string.sub(message, meta_end_index + 1)

			Managers.irc:parse_metadata(metadata, username, parameter)

			return true
		end
	end

	return false
end
IRCManager._create_metadata_table = function (self, username, icon_id, level, info)
	print("doing it")

	local message = "$META;"
	message = message .. username .. ";" .. icon_id .. ";" .. level .. ";" .. info

	return message
end
IRCManager.parse_metadata = function (self, meta_data, username, parameter)
	local data = string.split(meta_data, ";")
	local user_data = self._channel_members[parameter][username]

	if user_data then
		user_data.icon_id = data[2] and tonumber(data[2])
		user_data.level = data[3]
		user_data.info = data[4]

		self._update_meta_data(self, username, parameter, user_data)
	else
		print("\tMissing user data")
	end

	return 
end
IRCManager._update_meta_data = function (self, username, channel, user_data)
	local message_type = Irc.META_MSG
	local callbacks = self._callback_by_type[message_type]

	if callbacks then
		for key, callback in pairs(callbacks) do
			callback(key, message_type, username, channel, user_data)
		end
	end

	return 
end
IRCManager.get_channel_members = function (self, channel_name)
	if channel_name and self._channel_members[channel_name] then
		return self._channel_members[channel_name]
	else
		return {}
	end

	return 
end
IRCManager.get_channels = function (self)
	return self._channels
end
IRCManager._parse_names_list = function (self, channel, username, members, names_list_parameter)
	local start_idx, end_idx = string.find(names_list_parameter, channel .. " :")
	local names_sub_str = string.sub(names_list_parameter, end_idx)
	local names = string.split(names_sub_str, " ")

	for _, names in ipairs(names) do
		print(names)
	end

	return 
end
IRCManager.update = function (self, dt)
	IRCStates[self._state](self, dt)

	return 
end
IRCManager._change_state = function (self, state)
	fassert(IRCStates[state], "[IRCManager] There is no state called %s", state)
	debug_print("Leaving state: %s", self._state)

	self._state = state

	debug_print("Entering state: %s", self._state)

	return 
end
IRCManager._notify_connected = function (self, connected)
	if self._callback then
		self._callback(connected)
	end

	return 
end
IRCStates = IRCStates or {}
IRCStates.none = function (irc, dt)
	return 
end
IRCStates.initialize = function (irc_manager, dt)
	if Irc.is_initialized() then
		Application.error("[IRCManager] Failed initializing IRC")
		irc_manager._change_state(irc_manager, "disconnect")

		return 
	end

	irc_manager._initialized = Irc.initialize()

	if irc_manager._initialized then
		irc_manager._change_state(irc_manager, "connect")
	else
		Application.error("[IRCManager] Failed initializing IRC")
		irc_manager._change_state(irc_manager, "disconnect")
	end

	return 
end
IRCStates.connect = function (irc_manager, dt)
	local is_connected = Irc.is_connected()

	if is_connected then
		if irc_manager._auto_join_channel then
			irc_manager._change_state(irc_manager, "join_channel")
		else
			irc_manager._change_state(irc_manager, "connected")
			irc_manager._notify_connected(irc_manager, true)
		end
	elseif irc_manager._connection_timer <= 0 then
		local host_address = irc_manager._host_address
		local host_port = irc_manager._port
		local default_user_name = "justinfan" .. Math.random(9999)
		local user_name = irc_manager._user_name or default_user_name
		local password = irc_manager._password or nil

		Irc.connect(host_address, host_port, user_name, password)

		irc_manager._connection_timer = CONNECTION_TIMER
		irc_manager._connection_retries = irc_manager._connection_retries + 1
	elseif 3 < irc_manager._connection_retries then
		local host_address = irc_manager._host_address
		local host_port = irc_manager._port
		local default_user_name = "justinfan" .. Math.random(9999)
		local user_name = irc_manager._user_name or default_user_name

		Application.error("[IRCManager] Failed connecting to " .. host_address .. ":" .. host_port .. " with user_name: " .. user_name)
		irc_manager._change_state(irc_manager, "disconnect")
	else
		irc_manager._connection_timer = irc_manager._connection_timer - dt
	end

	return 
end
IRCStates.join_channel = function (irc_manager, dt)
	local is_connected = Irc.is_connected()

	if is_connected then
		irc_manager.join_channel(irc_manager, irc_manager._auto_join_channel)

		irc_manager._auto_join_channel = false

		irc_manager._change_state(irc_manager, "connected")
		irc_manager._notify_connected(irc_manager, true)
	else
		Application.error("[IRCManager] Disconnected from server")
		irc_manager._change_state(irc_manager, "disconnect")
	end

	return 
end
IRCStates.connected = function (irc_manager, dt)
	local is_connected = Irc.is_connected()

	if is_connected then
		for _, message in ipairs(MESSAGES_TO_SEND) do
			Irc.send_message(message.message, message.channel_or_user)
		end

		table.clear(MESSAGES_TO_SEND)

		local message_type, username, message, parameters = Irc.poll_message()

		if message then
			irc_manager._handle_irc_message(irc_manager, message_type, username, message, parameters)
		end
	else
		Application.error("[IRCManager] Disconnected from server")
		irc_manager._change_state(irc_manager, "disconnect")
	end

	return 
end
IRCStates.disconnect = function (irc_manager, dt)
	local is_connected = Irc.is_connected()

	if is_connected then
		Irc.disconnect()
	end

	irc_manager._notify_connected(irc_manager, false)
	irc_manager._reset(irc_manager)
	irc_manager._change_state(irc_manager, "none")

	return 
end

return 
