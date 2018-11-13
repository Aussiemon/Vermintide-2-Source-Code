require("scripts/network/script_ps_restriction_token")

PSRestrictions = class(PSRestrictions)
local default_restrictions = {
	"network_availability",
	"playstation_plus",
	"parental_control"
}
local start_funcs = {
	playstation_plus = "_playstation_plus_start",
	network_availability = "_network_availability_start",
	parental_control = "_parental_control_start"
}
local callbacks = {
	playstation_plus = "cb_playstation_plus",
	network_availability = "cb_network_availability",
	parental_control = "cb_parental_control"
}

local function dprint(string, ...)
	if script_data.debug_ps_restrictions then
		local s = string.format("[PSRestrictions] %s", string)

		printf(s, ...)
	end
end

local function error_print(string, ...)
	local s = string.format("[PSRestrictions] %s", string)

	Application.error(string.format(s, ...))
end

local fake_restrictions = script_data.fake_restrictions

PSRestrictions.init = function (self)
	self._current_users = {}
end

PSRestrictions.add_user = function (self, user_id)
	self._current_users[user_id] = {
		restrictions = table.clone(default_restrictions)
	}

	self:_start_restriction_access_fetched(user_id)
end

PSRestrictions._start_restriction_access_fetched = function (self, user_id)
	local user = self._current_users[user_id]

	self:_fetch_next_restriction_access(user_id)
end

PSRestrictions._fetch_next_restriction_access = function (self, user_id)
	if fake_restrictions then
		return
	end

	local user = self._current_users[user_id]
	local restrictions = user.restrictions
	local _, restriction = next(restrictions)
	local signed_in = PS4.signed_in(user_id)
	local start_func = start_funcs[restriction]
	local callback_name = callbacks[restriction]

	if signed_in then
		local token = self[start_func](self, user_id)
		local script_token = ScriptPSRestrictionToken:new(token)

		Managers.token:register_token(script_token, callback(self, callback_name, user_id, restriction))
	else
		self[callback_name](self, user_id, restriction, {
			error = PS4.SCE_NP_ERROR_SIGNED_OUT
		})
	end
end

PSRestrictions.has_access = function (self, user_id, restriction)
	if fake_restrictions then
		return true
	end

	local user = self._current_users[user_id]
	local restriction_result = user[restriction]
	local access = restriction_result.access

	fassert(access ~= nil, "Have not fetched access to this restriction (%s)", restriction)

	return access
end

PSRestrictions.has_error = function (self, user_id, restriction)
	if fake_restrictions then
		return false
	end

	local user = self._current_users[user_id]
	local restriction_result = user[restriction]
	local error_code = restriction_result.error

	return error_code
end

PSRestrictions.restriction_access_fetched = function (self, user_id, restriction)
	if fake_restrictions then
		return true
	end

	local user = self._current_users[user_id]
	local restriction_access_fetched = user[restriction]

	return restriction_access_fetched
end

PSRestrictions.refetch_restriction_access = function (self, user_id, restrictions)
	fassert(self._current_users[user_id] ~= nil, "User (%d) is not added", user_id)

	local user = self._current_users[user_id]
	user.restrictions = table.clone(restrictions)

	for i, restriction in ipairs(restrictions) do
		user[restriction] = nil
	end

	self:_fetch_next_restriction_access(user_id)
end

PSRestrictions._set_restriction_fetched = function (self, user_id, restriction)
	local user = self._current_users[user_id]
	local restrictions = user.restrictions
	local index = table.find(restrictions, restriction)

	table.remove(restrictions, index)
end

PSRestrictions._try_fetch_next_restriction_access = function (self, user_id)
	local user = self._current_users[user_id]
	local restrictions = user.restrictions

	if #restrictions > 0 then
		self:_fetch_next_restriction_access(user_id)
	end
end

PSRestrictions._playstation_plus_start = function (self, user_id)
	return NpCheck.check_plus(user_id, NpCheck.REALTIME_MULTIPLAY)
end

PSRestrictions._network_availability_start = function (self, user_id)
	return NpCheck.check_availability(user_id)
end

PSRestrictions._parental_control_start = function (self, user_id)
	return NpCheck.parental_control_info(user_id)
end

PSRestrictions.cb_network_availability = function (self, user_id, restriction, info)
	local error = info.error or NpCheck.error_code(info.token)

	if error then
		error_print("Error (%#x) when checking (%s) access for user (%d)", error, restriction, user_id)

		self._current_users[user_id][restriction] = {
			access = false,
			error = error
		}
	else
		local result = NpCheck.result(info.token)

		dprint("(%q) access for user (%d) result (%s)", restriction, user_id, tostring(result))

		self._current_users[user_id][restriction] = {
			error = false,
			access = result
		}
	end

	self:_set_restriction_fetched(user_id, restriction)
	self:_try_fetch_next_restriction_access(user_id)
end

PSRestrictions.cb_playstation_plus = function (self, user_id, restriction, info)
	local error = info.error or NpCheck.error_code(info.token)

	if error then
		error_print("Error (%#x) when checking (%s) access for user (%d)", error, restriction, user_id)

		self._current_users[user_id][restriction] = {
			access = false,
			error = error
		}
	else
		local result = NpCheck.result(info.token)

		dprint("(%q) access for user (%d) result (%s)", restriction, user_id, tostring(result))

		self._current_users[user_id][restriction] = {
			error = false,
			access = result
		}
	end

	self:_set_restriction_fetched(user_id, restriction)
	self:_try_fetch_next_restriction_access(user_id)
end

PSRestrictions.cb_parental_control = function (self, user_id, restriction, info)
	local error = info.error or NpCheck.error_code(info.token)

	if error then
		error_print("Error (%#x) when checking parental control access for user (%d)", error, user_id)

		self._current_users[user_id].chat = {
			access = false,
			error = error
		}
		self._current_users[user_id].user_generated_content = {
			access = false,
			error = error
		}
	else
		local result = NpCheck.parental_control_info_result(info.token)
		local chat = result.chat_restriction == false
		local ugc = result.ugc_restriction == false
		self._current_users[user_id].chat = {
			error = false,
			access = chat
		}
		self._current_users[user_id].user_generated_content = {
			error = false,
			access = ugc
		}

		dprint("\"chat\" access for user (%d) result (%s)", user_id, tostring(chat))
		dprint("\"ugc\" access for user (%d) result (%s)", user_id, tostring(ugc))
	end

	self:_set_restriction_fetched(user_id, restriction)
	self:_try_fetch_next_restriction_access(user_id)
end

return
