require("scripts/managers/backend_playfab/backend_interface_deus_base")

BackendInterfaceDeusPlayFab = class(BackendInterfaceDeusPlayFab, BackendInterfaceDeusBase)

BackendInterfaceDeusPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._belakor_data = {}

	self.super.init(self)
end

BackendInterfaceDeusPlayFab.get_journey_cycle = function (self)
	local current_time = Managers.time:time("main")
	local deus_journey_cycle_data = self._backend_mirror:get_deus_journey_cycle_data()
	local time_delta = current_time - deus_journey_cycle_data.time_of_update
	local remaining_time = deus_journey_cycle_data.remaining_time - time_delta
	local cycle = nil

	if remaining_time < 0 then
		local time_past_cycle = -remaining_time
		local span = deus_journey_cycle_data.span
		local cycle_delta = math.ceil(time_past_cycle / span)
		cycle = deus_journey_cycle_data.cycle_count + cycle_delta
		remaining_time = span - time_past_cycle % span
	else
		cycle = deus_journey_cycle_data.cycle_count
	end

	return self:_generate_journey_cycle(current_time, remaining_time, cycle)
end

BackendInterfaceDeusPlayFab.has_loaded_belakor_data = function (self)
	return self._backend_mirror:has_loaded_belakor_data()
end

BackendInterfaceDeusPlayFab.set_has_loaded_belakor_data = function (self, value)
	self._backend_mirror:set_has_loaded_belakor_data(value)
end

BackendInterfaceDeusPlayFab.deus_journey_with_belakor = function (self, journey_name)
	if not journey_name then
		return false
	end

	if not self._belakor_data or table.is_empty(self._belakor_data) then
		self:get_belakor_cycle()
	end

	local deus_belakor_cycle_data = self._belakor_data

	return deus_belakor_cycle_data.journey_name == journey_name and true or false
end

BackendInterfaceDeusPlayFab.get_belakor_cycle = function (self)
	local current_time = Managers.time:time("main")
	local deus_belakor_cycle_data = self._backend_mirror:get_deus_belakor_curse_data()
	local time_delta = current_time - deus_belakor_cycle_data.time_of_update
	local remaining_time = deus_belakor_cycle_data.remaining_time - time_delta
	local cycle = nil

	if remaining_time < 0 then
		local time_past_cycle = -remaining_time
		local span = deus_belakor_cycle_data.span
		local cycle_delta = math.ceil(time_past_cycle / span)
		cycle = deus_belakor_cycle_data.cycle_count + cycle_delta
		remaining_time = span - time_past_cycle % span
	else
		cycle = deus_belakor_cycle_data.cycle_count
	end

	return self:_generate_belakor_curse_cycle(current_time, remaining_time, cycle)
end

BackendInterfaceDeusPlayFab._generate_belakor_curse_cycle = function (self, current_time, remaining_time, cycle)
	local index = cycle % #AvailableJourneyOrder + 1
	local journey_name = AvailableJourneyOrder[index]
	local belakor_data = {
		remaining_time = remaining_time,
		time_of_update = current_time,
		journey_name = journey_name
	}
	self._belakor_data = belakor_data

	return belakor_data
end

BackendInterfaceDeusPlayFab.refresh_belakor_cycle = function (self)
	self._backend_mirror:deus_refresh_belakor_data()
end

BackendInterfaceDeusPlayFab.get_rolled_over_soft_currency = function (self)
	return self._backend_mirror:get_deus_rolled_over_soft_currency()
end

BackendInterfaceDeusPlayFab.deus_run_started = function (self)
	local request = {
		FunctionName = "deusRunStarted",
		FunctionParameter = {}
	}
	local backend_mirror = self._backend_mirror

	backend_mirror:predict_deus_run_started()

	local function cb(result)
		backend_mirror:handle_deus_result(result)
	end

	local request_queue = backend_mirror:request_queue()

	request_queue:enqueue(request, cb)
end

BackendInterfaceDeusPlayFab.write_player_event = function (self, event_name, data)
	local request = {
		EventName = event_name,
		Body = data
	}
	local backend_mirror = self._backend_mirror
	local request_queue = backend_mirror:request_queue()

	local function empty_success_callback(result)
		return
	end

	request_queue:enqueue_api_request("WritePlayerEvent", request, empty_success_callback)
end
