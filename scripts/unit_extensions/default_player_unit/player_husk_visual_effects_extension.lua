PlayerHuskVisualEffectsExtension = class(PlayerHuskVisualEffectsExtension)
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event
PlayerHuskVisualEffectsExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.network_manager = Managers.state.network
	self.world = extension_init_context.world
	self.unit = unit
	self.threshold_changed = true

	return 
end
PlayerHuskVisualEffectsExtension.extensions_ready = function (self, world, unit)
	return 
end
PlayerHuskVisualEffectsExtension.destroy = function (self)
	return 
end
PlayerHuskVisualEffectsExtension.update = function (self, unit, input, dt, context, t)
	local overcharge_percentage, overcharge_threshold_percentage = self._update_game_object_field(self)

	self._update_thresholds(self, overcharge_percentage, overcharge_threshold_percentage)
	self._set_flow_values(self, overcharge_percentage)

	return 
end
PlayerHuskVisualEffectsExtension._update_thresholds = function (self, overcharge_percentage, overcharge_threshold_percentage)
	if self.above_threshold and overcharge_percentage < overcharge_threshold_percentage then
		self.above_threshold = false
		self.threshold_changed = true
	elseif not self.above_threshold and overcharge_threshold_percentage <= overcharge_percentage then
		self.above_threshold = true
		self.threshold_changed = true
	else
		self.threshold_changed = false
	end

	return 
end
PlayerHuskVisualEffectsExtension._update_game_object_field = function (self)
	local network_manager = self.network_manager
	local unit = self.unit
	local game = network_manager.game(network_manager)
	local go_id = Managers.state.unit_storage:go_id(unit)

	if game and go_id then
		local overcharge_percentage = GameSession.game_object_field(game, go_id, "overcharge_percentage")
		local overcharge_threshold_percentage = GameSession.game_object_field(game, go_id, "overcharge_threshold_percentage")

		return overcharge_percentage, overcharge_threshold_percentage
	end

	return 0, 0
end
PlayerHuskVisualEffectsExtension._set_flow_values = function (self, overcharge_percentage)
	local unit = self.unit

	if unit and Unit.alive(unit) then
		unit_set_flow_variable(unit, "current_overcharge", overcharge_percentage)
		unit_flow_event(unit, "lua_update_overcharge")
	end

	if self.threshold_changed then
		local event_name = "below_overcharge_threshold"

		if self.above_threshold then
			event_name = "above_overcharge_threshold"
		end

		if unit and Unit.alive(unit) then
			unit_flow_event(unit, event_name)
		end
	end

	return 
end

return 
