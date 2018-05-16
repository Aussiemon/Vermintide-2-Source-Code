ScriptWebApiPsn = class(ScriptWebApiPsn)
local web_api = WebApi
local method_to_string = {
	[web_api.GET] = "GET",
	[web_api.PUT] = "PUT",
	[web_api.POST] = "POST",
	[web_api.DELETE] = "DELETE"
}

ScriptWebApiPsn.init = function (self)
	self._requests = {}
end

ScriptWebApiPsn.destroy = function (self)
	local requests = self._requests

	for i = #requests, 1, -1 do
		local r = requests[i]

		web_api.free(r.id)
	end

	self._requests = nil
end

ScriptWebApiPsn.update = function (self, dt)
	local requests = self._requests

	for i = #requests, 1, -1 do
		local r = requests[i]
		local id = r.id
		local status = web_api.status(id)

		if status == web_api.COMPLETED then
			self:_handle_request_response(i, true)
		elseif status == web_api.ERROR then
			self:_handle_request_response(i, false)
		end
	end
end

ScriptWebApiPsn._handle_request_response = function (self, request_index, success)
	local request = self._requests[request_index]
	local id = request.id
	local response_callback = request.response_callback
	local response_format = request.response_format or web_api.TABLE

	if success then
		if script_data.debug_psn then
			printf("[ScriptWebApiPsn] Completed Request: %q", request.debug_text)
		end

		if response_callback then
			local response = web_api.request_result(id, response_format)

			response_callback(response)
		end
	else
		if script_data.debug_psn then
			printf("[ScriptWebApiPsn] Failed Request: %q", request.debug_text)
		end

		if response_callback then
			response_callback(nil)
		end
	end

	web_api.free(id)
	table.remove(self._requests, request_index)
end

ScriptWebApiPsn.send_request = function (self, np_id, api_group, path, method, content, response_callback, response_format)
	if np_id == nil then
		return
	end

	local id = web_api.send_request(np_id, api_group, path, method, content)
	self._requests[#self._requests + 1] = {
		id = id,
		response_callback = response_callback,
		response_format = response_format,
		debug_text = string.format("%s %s", method_to_string[method], path)
	}
end

ScriptWebApiPsn.send_request_create_session = function (self, np_id, session_parameters, session_image, session_data, changable_session_data, response_callback)
	local id = web_api.send_request_create_session(np_id, session_parameters, session_image, session_data, changable_session_data)
	self._requests[#self._requests + 1] = {
		debug_text = "POST /v1/sessions",
		id = id,
		response_callback = response_callback
	}
end

ScriptWebApiPsn.send_request_session_invitation = function (self, np_id, params, session_id)
	local id = web_api.send_request_session_invitation(np_id, params, session_id)
	self._requests[#self._requests + 1] = {
		id = id,
		debug_text = string.format("POST /v1/sessions/%s/invitations", session_id)
	}
end

return
