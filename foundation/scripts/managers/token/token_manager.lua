TokenManager = class(TokenManager)
TokenManager.init = function (self)
	self._tokens = {}

	return 
end
TokenManager.register_token = function (self, token, callback, timeout)
	self._tokens[#self._tokens + 1] = {
		token = token,
		callback = callback,
		timeout = timeout or math.huge
	}

	return 
end
TokenManager.update = function (self, dt, t)
	for id, entry in pairs(self._tokens) do
		local token = entry.token

		token.update(token)

		if token.done(token) or entry.timeout <= t then
			local callback = entry.callback

			if callback then
				local info = token.info(token)

				callback(info)
			end

			token.close(token)

			self._tokens[id] = nil
		end
	end

	return 
end
TokenManager.destroy = function (self)
	for id, entry in pairs(self._tokens) do
		local token = entry.token

		token.close(token)

		self._tokens[id] = nil
	end

	self._tokens = nil

	return 
end

return 
