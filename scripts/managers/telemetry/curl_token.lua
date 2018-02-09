CurlToken = class(CurlToken)
CurlToken.init = function (self, token)
	self._token = token
	self._info = {}

	if not token then
		self._info.done = true
		self._info.error = "Not a valid token"
	end

	return 
end
CurlToken.info = function (self)
	return self._info
end
CurlToken.update = function (self)
	if self._token then
		self._info = Curl.progress(self._token)
	end

	return 
end
CurlToken.done = function (self)
	return self._info.done
end
CurlToken.close = function (self)
	if self._token then
		Curl.close(self._token)
	end

	return 
end

return 
