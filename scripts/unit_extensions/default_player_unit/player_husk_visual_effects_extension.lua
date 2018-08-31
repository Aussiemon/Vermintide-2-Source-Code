PlayerHuskVisualEffectsExtension = class(PlayerHuskVisualEffectsExtension)
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event

PlayerHuskVisualEffectsExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.network_manager = Managers.state.network
	self.world = extension_init_context.world
	self.unit = unit
	self.overcharge_threshold_changed = true
end

PlayerHuskVisualEffectsExtension.extensions_ready = function (self, world, unit)
	self.overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
end

PlayerHuskVisualEffectsExtension.destroy = function (self)
	return
end

PlayerHuskVisualEffectsExtension.update = function (self, unit, input, dt, context, t)
	self:_update_overcharge_thresholds()
	self:_set_overcharge_flow_values()
end

PlayerHuskVisualEffectsExtension._update_overcharge_thresholds = function (self)
	local overcharge_extension = self.overcharge_extension
	local value, threshold, _ = overcharge_extension:current_overcharge_status()

	if self.above_overcharge_threshold and value < threshold then
		self.above_overcharge_threshold = false
		self.overcharge_threshold_changed = true
	elseif not self.above_overcharge_threshold and threshold <= value then
		self.above_overcharge_threshold = true
		self.overcharge_threshold_changed = true
	else
		self.overcharge_threshold_changed = false
	end
end

PlayerHuskVisualEffectsExtension._set_overcharge_flow_values = function (self)
	if self.overcharge_extension then
		local anim_blend_overcharge = self.overcharge_extension:get_anim_blend_overcharge()
		local unit = self.unit

		if unit and Unit.alive(unit) then
			unit_set_flow_variable(unit, "current_overcharge", anim_blend_overcharge)
			unit_flow_event(unit, "lua_update_overcharge")
		end

		if self.overcharge_threshold_changed then
			self.overcharge_threshold_changed = false
			local event_name = "below_overcharge_threshold"

			if self.above_overcharge_threshold then
				event_name = "above_overcharge_threshold"
			end

			if unit and Unit.alive(unit) then
				unit_flow_event(unit, event_name)
			end
		end
	end
end

return
