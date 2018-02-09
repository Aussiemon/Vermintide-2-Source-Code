local debug_xbox_voice = true

local function debug_print(...)
	print("[VoiceChatXboxOneManager]", string.format(...))

	return 
end

local dprintf = nil

if debug_xbox_voice then
	dprintf = debug_print
else
	function dprintf()
		return 
	end
end

VoiceChatXboxOneManager = class(VoiceChatXboxOneManager)
DEFAULT_XBOX_CHAT_CHANNEL = 1
local CHANNEL_LOOKUP = {
	"DEFAULT_XBOX_CHAT_CHANNEL"
}
VoiceChatXboxOneManager.init = function (self)
	self._current_chat_users = {}
	self._pending_users = {}
	self._muted_users = {}
	self._shutdown = false
	self._shutting_down = false
	self._users_have_changed = 0
	self._bandwidth_disabled = false
	self._initiating = true

	return 
end
VoiceChatXboxOneManager.initate_voice_chat = function (self)
	self._initiating = true
	self._shutdown = false

	return 
end
VoiceChatXboxOneManager._init_voice_chat = function (self)
	if not self._initiated then
		VoiceChat.init()
		Application.error("INITIALIZING VOICE CHAT")

		self._initiated = true
		self._current_user = nil

		table.clear(self._pending_users)
		self.join_channel(self)
	end

	self._initiating = false
	self._shutdown = false
	self._bandwidth_disabled = false

	return 
end
VoiceChatXboxOneManager.initiated = function (self)
	return self._initiated
end
VoiceChatXboxOneManager.join_channel = function (self, channel)
	if not self._current_user and Managers.account:has_privilege(UserPrivilege.COMMUNICATION_VOICE_INGAME) and Application.user_setting("voip_is_enabled") then
		local channel = channel or DEFAULT_XBOX_CHAT_CHANNEL
		local user_id = Managers.account:user_id()
		local user_xuid = Managers.account:xbox_user_id()
		self._current_user = {
			type = "Add",
			xuid = user_xuid,
			user_id = user_id,
			channel = DEFAULT_XBOX_CHAT_CHANNEL
		}
		self._pending_users[#self._pending_users + 1] = table.clone(self._current_user)
	end

	return 
end
VoiceChatXboxOneManager.leave_channel = function (self, channel)
	local channel = channel or DEFAULT_XBOX_CHAT_CHANNEL
	local user_id = Managers.account:user_id()
	local user_xuid = Managers.account:xbox_user_id()
	self._pending_users[#self._pending_users + 1] = {
		type = "Remove",
		xuid = user_xuid,
		user_id = user_id,
		channel = DEFAULT_XBOX_CHAT_CHANNEL
	}

	return 
end
VoiceChatXboxOneManager.remove_current_user = function (self)
	if self._current_user then
		self._current_user.type = "Remove"
		self._pending_users[#self._pending_users + 1] = table.clone(self._current_user)
		self._current_user = nil
	end

	return 
end
VoiceChatXboxOneManager.set_enabled = function (self, enabled)
	if self._initiated then
		if enabled then
			self.join_channel(self)
		else
			self.remove_current_user(self)
		end
	end

	return 
end
VoiceChatXboxOneManager.bandwitdth_disable_voip = function (self)
	if self._shutdown or self._shutting_down then
		return 
	end

	self._popup_id = Managers.popup:queue_popup(Localize("popup_voice_chat_disabled_low_bandwidth"), Localize("popup_voice_chat_disabled_low_bandwidth_header"), "ok", Localize("menu_ok"))

	self.shutdown(self)

	self._bandwidth_disabled = true

	return 
end
VoiceChatXboxOneManager.bandwidth_disabled = function (self)
	return self._bandwidth_disabled
end
VoiceChatXboxOneManager.is_peer_muted = function (self, peer_id)
	if not self._initiated then
		return true
	end

	return self._muted_users[peer_id] ~= nil
end
VoiceChatXboxOneManager.mute_peer = function (self, peer_id)
	if self._initiated then
		local xuid = Managers.state.network:lobby():xuid(peer_id)

		if xuid then
			VoiceChat.mute_user(xuid)

			self._muted_users[peer_id] = xuid
		end

		return true
	end

	return 
end
VoiceChatXboxOneManager.unmute_peer = function (self, peer_id)
	if self._initiated then
		local xuid = self._muted_users[peer_id]

		if xuid then
			VoiceChat.unmute_user(xuid)
		end

		self._muted_users[peer_id] = nil

		return true
	end

	return 
end
VoiceChatXboxOneManager.set_chat_volume = function (self, volume)
	if self._initiated then
		VoiceChat.set_chat_volume(volume)
	end

	return 
end
VoiceChatXboxOneManager.set_user_chat_volume = function (self, xuid, volume)
	if self._initiated then
		local xuid = Managers.state.network:lobby():xuid(peer_id)

		if xuid then
			VoiceChat.set_user_chat_volume(xuid, volume)
		end
	end

	return 
end
VoiceChatXboxOneManager.mute_all_users = function (self)
	if self._initiated then
		VoiceChat.mute_all_users()
	end

	return 
end
VoiceChatXboxOneManager.unmute_all_users = function (self)
	if self._initiated then
		VoiceChat.unmute_all_users()
	end

	return 
end
VoiceChatXboxOneManager.update = function (self, dt, t)
	Profiler.start("VoiceChatXboxOneManager")
	self._handle_popups(self)

	if self._shutting_down then
		if Network.xboxlive_client_exists() then
			if self._initiated then
				local has_running_jobs = VoiceChat.has_running_jobs()

				if not has_running_jobs then
					VoiceChat.shutdown()
					dprintf("Has shut down")
					Application.error("SHUTTING DOWN VOICE CHAT")

					self._initiated = false
					self._shutdown = true
					self._shutting_down = false
				end
			else
				self._initiated = false
				self._shutdown = true
				self._shutting_down = false

				table.clear(self._pending_users)
			end
		else
			self._initiated = false
			self._shutdown = true
			self._shutting_down = false

			table.clear(self._pending_users)
		end
	elseif self._initiating then
		self._init_voice_chat(self)
	elseif self._shutdown then
	else
		local has_running_jobs = VoiceChat.has_running_jobs()

		if not has_running_jobs then
			local pending_user = self._pending_users[1]

			if Managers.account:user_detached() then
				return 
			end

			if pending_user then
				table.remove(self._pending_users, 1)
				Application.error(string.format("[VoiceChatXboxOneManager] %s local user to/from chat - ID: %s Xuid: %s Channel: %s", pending_user.type, pending_user.user_id, pending_user.xuid, pending_user.channel))

				if pending_user.type == "Add" then
					VoiceChat.add_user_to_channel(pending_user.user_id, pending_user.channel)
				elseif pending_user.type == "Remove" then
					VoiceChat.remove_user_from_channel_with_xuid(pending_user.xuid, pending_user.channel)
				end
			end
		end
	end

	Profiler.stop("VoiceChatXboxOneManager")

	return 
end
VoiceChatXboxOneManager._handle_popups = function (self)
	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result then
			self._popup_id = nil
		end
	end

	return 
end
local CURRENT_XUIDS = {}
local TO_REMOVE = {}
VoiceChatXboxOneManager._handle_updated_users = function (self, t)
	Profiler.start("Update current users")

	local my_xuid = Managers.account:xbox_user_id()

	Profiler.start("Has remote users changed")

	local num_changes = VoiceChat.remote_user_changes()

	if 0 < num_changes then
		self._users_have_changed = self._users_have_changed + num_changes
	end

	Profiler.stop("Has remote users changed")

	if self._users_have_changed <= 0 then
		return 
	end

	table.clear(CURRENT_XUIDS)
	table.clear(TO_REMOVE)
	Profiler.start("Get current chat users")

	local current_chat_users = VoiceChat.chat_users()

	Profiler.stop("Get current chat users")
	Profiler.start("Handle added users")

	local tmp_xuid = nil

	for idx, user_chat_data in ipairs(current_chat_users) do
		tmp_xuid = user_chat_data.xbox_user_id

		if not self._current_chat_users[tmp_xuid] then
			self._current_chat_users[tmp_xuid] = user_chat_data

			self._handle_changes(self, "Added", user_chat_data)

			if tmp_xuid ~= my_xuid then
				self._users_have_changed = self._users_have_changed - 1
			end
		end

		CURRENT_XUIDS[tmp_xuid] = true
	end

	Profiler.stop("Handle added users")
	Profiler.start("Handle removed users")

	for xuid, user_chat_data in pairs(self._current_chat_users) do
		if not CURRENT_XUIDS[xuid] then
			TO_REMOVE[xuid] = true
			CURRENT_XUIDS[xuid] = nil

			self._handle_changes(self, "Removed", user_chat_data)

			if xuid ~= my_xuid then
				self._users_have_changed = self._users_have_changed - 1
			end
		end
	end

	for xuid, _ in pairs(TO_REMOVE) do
		self._current_chat_users[xuid] = nil
	end

	Profiler.stop("Handle removed users")
	Profiler.stop("Update current users")

	if self._users_have_changed == 0 then
		self.set_chat_volume(self, 1)
	end

	return 
end
VoiceChatXboxOneManager._handle_changes = function (self, change, ...)
	local num_changes = select("#", ...)

	for i = 1, num_changes, 1 do
		local user = select(i, ...)
		local xuid = user.xbox_user_id
		local channel = user.channel

		dprintf("%s user to/from chat - Xuid: %s Channel: %s", change, tostring(xuid), CHANNEL_LOOKUP[channel] or tostring(channel))
	end

	return 0 < num_changes
end
VoiceChatXboxOneManager.shutdown = function (self)
	self._shutting_down = true

	dprintf("Shutting down...")

	return 
end
VoiceChatXboxOneManager.destroy = function (self)
	return 
end

return 
