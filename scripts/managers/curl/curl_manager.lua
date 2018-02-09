CurlManager = class(CurlManager)
CurlManager.init = function (self)
	self._curl = lcurl.stingray_init()
	self._multi = self._curl.multi()
	self._requests = {}

	return 
end
CurlManager.destroy = function (self)
	local timeout_at = os.time() + 10

	while 0 < self._num_requests(self) do
		self.update(self, false)

		if timeout_at < os.time() then
			print("Not all curl requests were successfully handled")

			break
		end
	end

	for handle, request in pairs(self._requests) do
		handle.close(handle)
	end

	return 
end
local Request = {
	__index = Request,
	new = function ()
		local self = setmetatable({}, Request)
		self.headers = {}

		return self
	end,
	OnResponse = function (self, data)
		self.data = (self.data and self.data .. data) or data

		return 
	end,
	OnHeader = function (self, data)
		local k, v = data.match(data, "([^:]+):%s+([^:]+)")

		if k ~= nil then
			self.headers[k] = string.gsub(v, "\r\n", "")
		end

		return 
	end
}
CurlManager.update = function (self, handle_callbacks)
	if 0 < self._multi:perform() then
		self._multi:wait(0)
	end

	local handle, ok, err = self._multi:info_read()

	if handle ~= 0 then
		local request = self._requests[handle]

		if request ~= nil then
			if handle_callbacks and request.cb then
				local code = handle.getinfo(handle, self._curl.INFO_RESPONSE_CODE)

				if ok then
					request.cb(true, code, request.headers, request.data, request.userdata)
				else
					Application.warning("Curl Manager Error, Code: %s, Url: %s, Name: %s", tostring(code), request.url, tostring(err.name(err)))
					request.cb(false, code, {}, err.name(err), request.userdata)
				end
			end

			self._requests[handle] = nil
		end

		handle.close(handle)
	end

	return 
end
CurlManager._num_requests = function (self)
	return table.size(self._requests)
end
CurlManager.add_request = function (self, request_type, url, body, headers, user_cb, userdata, options)
	local easy = self._curl.easy()

	easy.setopt_url(easy, url)
	easy.setopt_customrequest(easy, request_type)

	if headers ~= nil then
		if type(headers) == "table" then
			easy.setopt_httpheader(easy, headers)
		else
			easy.setopt_httpheader(easy, {
				headers
			})
		end
	end

	if options ~= nil then
		for k, v in pairs(options) do
			easy.setopt(easy, k, v)
		end
	end

	if body ~= nil then
		easy.setopt_postfields(easy, body)
	end

	local request = Request.new()
	request.cb = user_cb
	request.userdata = userdata
	request.url = url
	local response_cb = callback(request, "OnResponse")
	local header_cb = callback(request, "OnHeader")

	easy.setopt_writefunction(easy, response_cb)
	easy.setopt_headerfunction(easy, header_cb)
	self._multi:add_handle(easy)

	self._requests[easy] = request

	return 
end
CurlManager.get = function (self, url, headers, request_cb, userdata, options)
	self.add_request(self, "GET", url, nil, headers, request_cb, userdata, options)

	return 
end
CurlManager.post = function (self, url, body, headers, request_cb, userdata, options)
	self.add_request(self, "POST", url, body, headers, request_cb, userdata, options)

	return 
end
CurlManager.put = function (self, url, body, headers, request_cb, userdata, options)
	self.add_request(self, "PUT", url, body, headers, request_cb, userdata, options)

	return 
end
CurlManager.delete = function (self, url, body, headers, request_cb, userdata, options)
	self.add_request(self, "DELETE", url, body, headers, request_cb, userdata, options)

	return 
end
CurlManager.patch = function (self, url, body, headers, request_cb, userdata, options)
	self.add_request(self, "PATCH", url, body, headers, request_cb, userdata, options)

	return 
end

local function create_read_function(data)
	local sent = false

	return function ()
		if sent == false then
			sent = true

			return data
		end

		return 
	end
end

CurlManager.upload = function (self, url, data, cb)
	local easy = self._curl.easy()

	easy.setopt_url(easy, url)
	easy.setopt_upload(easy, true)
	easy.setopt_readfunction(easy, create_read_function(data))

	local request = Request.new()
	request.cb = cb

	self._multi:add_handle(easy)

	self._requests[easy] = request

	return 
end

return 
