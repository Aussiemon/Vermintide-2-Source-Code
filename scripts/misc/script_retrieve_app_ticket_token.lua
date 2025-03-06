-- chunkname: @scripts/misc/script_retrieve_app_ticket_token.lua

ScriptReceiveAppTicketToken = class(ScriptReceiveAppTicketToken)

ScriptReceiveAppTicketToken.init = function (self)
	self._done = false
	self._error = true
end

ScriptReceiveAppTicketToken.update = function (self)
	local encrypted_app_ticket_raw = Steam.poll_encrypted_app_ticket()

	if encrypted_app_ticket_raw then
		self._encrypted_app_ticket = string.tohex(encrypted_app_ticket_raw)
		self._done = true
		self._error = false
	end
end

ScriptReceiveAppTicketToken.info = function (self)
	local info = {
		encrypted_app_ticket = self._encrypted_app_ticket,
		error = self._error,
	}

	return info
end

ScriptReceiveAppTicketToken.done = function (self)
	return self._done
end

ScriptReceiveAppTicketToken.close = function (self)
	return
end
