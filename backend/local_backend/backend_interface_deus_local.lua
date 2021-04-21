require("scripts/managers/backend_playfab/backend_interface_deus_base")

BackendInterfaceDeusLocal = class(BackendInterfaceDeusLocal, BackendInterfaceDeusBase)

BackendInterfaceDeusLocal.init = function (self, save_data)
	self._save_data = save_data or {}
	self.is_local = true

	self.super.init(self)
end

BackendInterfaceDeusLocal.get_journey_cycle = function (self)
	local client_time = Managers.time:time("main")
	local server_time = os.time()
	local time_span = (script_data.deus_journey_ten_minute_cycle and 600) or 86400
	local remaining_time = time_span - server_time % time_span
	local cycle_count = math.floor(server_time / time_span)

	return self:_generate_journey_cycle(client_time, remaining_time, cycle_count)
end

BackendInterfaceDeusLocal.get_rolled_over_soft_currency = function (self)
	return self._save_data.deus_rolled_over_soft_currency or 0
end

BackendInterfaceDeusLocal.deus_run_started = function (self)
	self._save_data.deus_rolled_over_soft_currency = 0
end

BackendInterfaceDeusLocal.generate_end_of_level_loot_local = function (self, game_won, quickplay, difficulty, end_of_level_rewards_arguments)
	local deus_soft_currency = end_of_level_rewards_arguments.deus_soft_currency
	local roll_over_coins = math.ceil(deus_soft_currency * DeusRollOverSettings.roll_over)
	self._save_data.deus_rolled_over_soft_currency = math.clamp(roll_over_coins, 0, DeusRollOverSettings.max)

	Managers.backend:commit()
end

BackendInterfaceDeusLocal.write_player_event = function (self, event_name, data)
	return
end

return
