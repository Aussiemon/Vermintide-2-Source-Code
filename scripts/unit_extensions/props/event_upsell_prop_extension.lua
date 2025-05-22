-- chunkname: @scripts/unit_extensions/props/event_upsell_prop_extension.lua

EventUpsellPropExtension = class(EventUpsellPropExtension)

EventUpsellPropExtension.init = function (self, extension_init_context, unit)
	self._unit = unit
	self._has_active_event = false

	self:_set_highlight(false)
	self:_evaluate_highlight_status()
end

EventUpsellPropExtension.update = function (self, unit, input, dt, context, t)
	return
end

EventUpsellPropExtension._evaluate_highlight_status = function (self)
	local has_active_event = false
	local live_events_interface = Managers.backend:get_interface("live_events")

	if live_events_interface and live_events_interface.get_active_events then
		local live_events = live_events_interface:get_active_events()

		if live_events and #live_events ~= 0 then
			has_active_event = true
			self._active_event_name = live_events[1]
		end
	end

	local should_be_highlighted = has_active_event
	local state_differs = should_be_highlighted ~= self._highlighted

	if state_differs then
		self:_set_highlight(should_be_highlighted)
	end
end

EventUpsellPropExtension._set_highlight = function (self, state)
	if state == true then
		Unit.flow_event(self._unit, "enable_vfx")

		if self._active_event_name then
			local global_shader_flag = UISettings.event_global_shader_flags_override_lookup[self._active_event_name]

			if global_shader_flag then
				GlobalShaderFlags.set_global_shader_flag(global_shader_flag, true)
			end
		end
	else
		Unit.flow_event(self._unit, "disable_vfx")
	end

	self._highlighted = state
end
