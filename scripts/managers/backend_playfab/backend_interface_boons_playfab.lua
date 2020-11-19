BackendInterfaceBoonsPlayFab = class(BackendInterfaceBoonsPlayFab)
local REQUIRE_EAC = false

BackendInterfaceBoonsPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
end

BackendInterfaceBoonsPlayFab.ready = function (self)
	return true
end

BackendInterfaceBoonsPlayFab.get_active_boons = function (self)
	return self._backend_mirror:get_active_boons()
end

BackendInterfaceBoonsPlayFab.refresh_boons = function (self)
	local request = {
		FunctionName = "refreshBoons",
		FunctionParameter = {}
	}
	local backend_mirror = self._backend_mirror

	backend_mirror:predict_refresh_boons()

	local function cb(result)
		backend_mirror:handle_boons_result(result)
	end

	local request_queue = backend_mirror:request_queue()

	request_queue:enqueue(request, cb, REQUIRE_EAC)
end

return
