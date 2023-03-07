require("scripts/network/script_xbox_user_privilege_token")

XboxUserPrivileges = class(XboxUserPrivileges)
DEFAULT_PRIVILEGES = DEFAULT_PRIVILEGES or {}
ATTEMPT_RESOLUTION_PRIVILEGES = ATTEMPT_RESOLUTION_PRIVILEGES or {}
XBOX_PRIVILEGE_LUT = XBOX_PRIVILEGE_LUT or {}
PRIVILEGES_ERROR_CODES = PRIVILEGES_ERROR_CODES or {}

XboxUserPrivileges.init = function (self)
	self:reset()
	self:_setup_lookup_tables()
end

XboxUserPrivileges.reset = function (self)
	self._current_users = {}
	self._initialized = false
	self._has_error = nil
	self._check_privilege_cb = {}
end

XboxUserPrivileges.add_user = function (self, user_id)
	self:reset()

	self._current_users[user_id] = {}

	for _, privilege in pairs(DEFAULT_PRIVILEGES) do
		local attempt_resolution = false

		if ATTEMPT_RESOLUTION_PRIVILEGES[privilege] then
			print(XBOX_PRIVILEGE_LUT[privilege] .. " using attempt_resolution=true")

			attempt_resolution = true
		end

		local token = UserPrivilege.has(user_id, attempt_resolution, privilege)

		if token then
			local script_token = ScriptXboxUserPrivilegeToken:new(token)

			Managers.token:register_token(script_token, callback(self, "cb_user_privilege_done", user_id, privilege, nil))
		else
			self._has_error = true
		end
	end
end

XboxUserPrivileges.get_privilege_async = function (self, user_id, privilege, attempt_resolution, external_cb)
	if not self._current_users[user_id] then
		fassert(false, "ERROR ERROR")

		return
	end

	local token = UserPrivilege.has(user_id, attempt_resolution, privilege)

	if token then
		local script_token = ScriptXboxUserPrivilegeToken:new(token)

		Managers.token:register_token(script_token, callback(self, "cb_user_privilege_done", user_id, privilege, external_cb))
	else
		self._has_error = true
	end
end

XboxUserPrivileges.update_privilege = function (self, privilege, cb)
	local privilege_id = nil

	for id, name in pairs(XBOX_PRIVILEGE_LUT) do
		if name == privilege then
			privilege_id = id

			break
		end
	end

	if not privilege_id then
		Application.error(string.format("[XboxUserPrivileges] Couldn't find privilege called %s", privilege))
	else
		local user_id = Managers.account:user_id()
		local token = UserPrivilege.has(user_id, false, privilege_id)

		if token then
			local script_token = ScriptXboxUserPrivilegeToken:new(token)

			Managers.token:register_token(script_token, callback(self, "cb_user_privilege_done", user_id, privilege_id, nil))

			if cb then
				self._check_privilege_cb = self._check_privilege_cb or {}
				self._check_privilege_cb[privilege_id] = self._check_privilege_cb[privilege_id] or {}
				self._check_privilege_cb[privilege_id][#self._check_privilege_cb[privilege_id] + 1] = cb
			end
		else
			self._has_error = true
		end
	end
end

XboxUserPrivileges.cb_user_privilege_done = function (self, user_id, privilege, external_cb, info)
	if info.error then
		Application.error(string.format("[XboxUserPrivileges] Something went wrong when trying to fetch privilege [%s] for User [%s]. Error: %s", XBOX_PRIVILEGE_LUT[privilege] or "unknown", tostring(user_id), PRIVILEGES_ERROR_CODES[info.error] or "UNKNOWN"))

		self._has_error = true
		self._initialized = true
	elseif info.status_code == UserPrivilege.NoIssue then
		Application.warning(string.format("[XboxUserPrivileges] User [%s] has the privilege to [%s]", tostring(user_id), XBOX_PRIVILEGE_LUT[privilege] or "unknown", PRIVILEGES_ERROR_CODES[info.status_code] or "UNKNOWN"))

		self._current_users[user_id][privilege] = true
	else
		Application.error(string.format("[XboxUserPrivileges] User [%s] do not have the privilege to [%s]. Error: %s", tostring(user_id), XBOX_PRIVILEGE_LUT[privilege] or "unknown", PRIVILEGES_ERROR_CODES[info.status_code] or "UNKNOWN"))

		self._current_users[user_id][privilege] = false
	end

	if self._check_privilege_cb and self._check_privilege_cb[privilege] then
		local callbacks = self._check_privilege_cb[privilege]

		for _, cb in pairs(callbacks) do
			cb(XBOX_PRIVILEGE_LUT[privilege])
		end

		self._check_privilege_cb[privilege] = nil
	end

	if external_cb then
		external_cb(privilege)
	end
end

XboxUserPrivileges.has_privilege = function (self, user_id, privilege)
	if user_id and self._current_users[user_id] then
		return self._current_users[user_id][privilege]
	else
		return false
	end
end

XboxUserPrivileges.is_initialized = function (self)
	if self._initialized then
		return true
	else
		local user_id = Managers.account:user_id()
		local privileges = self._current_users[user_id]

		if not privileges then
			return false
		end

		for _, privilege in pairs(DEFAULT_PRIVILEGES) do
			if privileges[privilege] == nil then
				return false
			end
		end

		self._initialized = true

		return true
	end
end

XboxUserPrivileges.has_error = function (self)
	return self._has_error
end

XboxUserPrivileges._setup_lookup_tables = function (self)
	XBOX_PRIVILEGE_LUT[UserPrivilege.ADD_FRIEND] = "ADD_FRIEND"
	XBOX_PRIVILEGE_LUT[UserPrivilege.BROADCAST] = "BROADCAST"
	XBOX_PRIVILEGE_LUT[UserPrivilege.CLOUD_GAMING_JOIN_SESSION] = "CLOUD_GAMING_JOIN_SESSION"
	XBOX_PRIVILEGE_LUT[UserPrivilege.CLOUD_GAMING_MANAGE_SESSION] = "CLOUD_GAMING_MANAGE_SESSION"
	XBOX_PRIVILEGE_LUT[UserPrivilege.CLOUD_SAVED_GAMES] = "CLOUD_SAVED_GAMES"
	XBOX_PRIVILEGE_LUT[UserPrivilege.COMMUNICATIONS] = "COMMUNICATIONS"
	XBOX_PRIVILEGE_LUT[UserPrivilege.COMMUNICATION_VOICE_INGAME] = "COMMUNICATION_VOICE_INGAME"
	XBOX_PRIVILEGE_LUT[UserPrivilege.COMMUNICATION_VOICE_SKYPE] = "COMMUNICATION_VOICE_SKYPE"
	XBOX_PRIVILEGE_LUT[UserPrivilege.GAME_DVR] = "GAME_DVR"
	XBOX_PRIVILEGE_LUT[UserPrivilege.MULTIPLAYER_PARTIES] = "MULTIPLAYER_PARTIES"
	XBOX_PRIVILEGE_LUT[UserPrivilege.MULTIPLAYER_SESSIONS] = "MULTIPLAYER_SESSIONS"
	XBOX_PRIVILEGE_LUT[UserPrivilege.PREMIUM_CONTENT] = "PREMIUM_CONTENT"
	XBOX_PRIVILEGE_LUT[UserPrivilege.PREMIUM_VIDEO] = "PREMIUM_VIDEO"
	XBOX_PRIVILEGE_LUT[UserPrivilege.PROFILE_VIEWING] = "PROFILE_VIEWING"
	XBOX_PRIVILEGE_LUT[UserPrivilege.PURCHASE_CONTENT] = "PURCHASE_CONTENT"
	XBOX_PRIVILEGE_LUT[UserPrivilege.SHARE_CONTENT] = "SHARE_CONTENT"
	XBOX_PRIVILEGE_LUT[UserPrivilege.SHARE_KINECT_CONTENT] = "SHARE_KINECT_CONTENT"
	XBOX_PRIVILEGE_LUT[UserPrivilege.SOCIAL_NETWORK_SHARING] = "SOCIAL_NETWORK_SHARING"
	XBOX_PRIVILEGE_LUT[UserPrivilege.SUBSCRIPTION_CONTENT] = "SUBSCRIPTION_CONTENT"
	XBOX_PRIVILEGE_LUT[UserPrivilege.USER_CREATED_CONTENT] = "USER_CREATED_CONTENT"
	XBOX_PRIVILEGE_LUT[UserPrivilege.VIDEO_COMMUNICATIONS] = "VIDEO_COMMUNICATIONS"
	XBOX_PRIVILEGE_LUT[UserPrivilege.VIEW_FRIENDS_LIST] = "VIEW_FRIENDS_LIST"
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.ADD_FRIEND
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.BROADCAST
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.CLOUD_GAMING_JOIN_SESSION
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.CLOUD_GAMING_MANAGE_SESSION
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.CLOUD_SAVED_GAMES
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.COMMUNICATIONS
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.COMMUNICATION_VOICE_INGAME
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.COMMUNICATION_VOICE_SKYPE
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.GAME_DVR
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.MULTIPLAYER_PARTIES
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.PREMIUM_CONTENT
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.PREMIUM_VIDEO
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.PROFILE_VIEWING
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.PURCHASE_CONTENT
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.SHARE_CONTENT
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.SHARE_KINECT_CONTENT
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.SOCIAL_NETWORK_SHARING
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.SUBSCRIPTION_CONTENT
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.USER_CREATED_CONTENT
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.VIDEO_COMMUNICATIONS
	DEFAULT_PRIVILEGES[#DEFAULT_PRIVILEGES + 1] = UserPrivilege.VIEW_FRIENDS_LIST
	PRIVILEGES_ERROR_CODES[UserPrivilege.Aborted] = "ABORTED"
	PRIVILEGES_ERROR_CODES[UserPrivilege.Banned] = "BANNED"
	PRIVILEGES_ERROR_CODES[UserPrivilege.NoIssue] = "NO_ISSUE"
	PRIVILEGES_ERROR_CODES[UserPrivilege.PurchaseRequired] = "PURCHASE_REQUIRED"
	PRIVILEGES_ERROR_CODES[UserPrivilege.Restricted] = "RESTRICTED"
	ATTEMPT_RESOLUTION_PRIVILEGES[UserPrivilege.MULTIPLAYER_SESSIONS] = true
end
