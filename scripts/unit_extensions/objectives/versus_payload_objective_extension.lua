-- chunkname: @scripts/unit_extensions/objectives/versus_payload_objective_extension.lua

VersusPayloadObjectiveExtension = class(VersusPayloadObjectiveExtension, BaseObjectiveExtension)
VersusPayloadObjectiveExtension.NAME = "VersusPayloadObjectiveExtension"

VersusPayloadObjectiveExtension.init = function (self, ...)
	VersusPayloadObjectiveExtension.super.init(self, ...)

	self._total_distance = math.huge
	self._current_distance = 0
	self._percentage = 0
end

VersusPayloadObjectiveExtension.extensions_ready = function (self)
	local payload_extension = ScriptUnit.has_extension(self._unit, "payload_system")

	if payload_extension then
		self._payload_extension = payload_extension
	end
end

VersusPayloadObjectiveExtension._set_objective_data = function (self, objective_data)
	local payload_default_settings = GameModeSettings.versus.objectives.payload

	self._num_sections = objective_data.num_sections or payload_default_settings.num_sections
	self._score_per_section = objective_data.score_per_section or payload_default_settings.score_per_section
	self._time_per_section = objective_data.time_per_section or payload_default_settings.time_per_section
	self._score_for_completion = objective_data.score_for_completion or payload_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or payload_default_settings.time_for_completion
	self._on_last_leaf_complete_sound_event = objective_data.on_last_leaf_complete_sound_event or payload_default_settings.on_last_leaf_complete_sound_event
end

VersusPayloadObjectiveExtension._activate = function (self)
	self._spline_movement = self._payload_extension:movement()
	self._total_distance = self._spline_movement:distance(1, 1, 0, #self._spline_movement._splines, #self._spline_movement:_current_spline().subdivisions, 1)
end

VersusPayloadObjectiveExtension._deactivate = function (self)
	return
end

VersusPayloadObjectiveExtension._server_update = function (self, dt, t)
	if not self._payload_extension:started() then
		return
	end

	local new_distance = self._spline_movement:current_spline_curve_distance()

	if new_distance ~= self._current_distance then
		self._current_distance = new_distance

		local percentage_done = self:get_percentage_done()

		self:server_set_value(percentage_done)

		if percentage_done >= (self._current_section + 1) * (1 / self._num_sections) then
			self:on_section_completed()
		end
	end
end

VersusPayloadObjectiveExtension._client_update = function (self, dt, t)
	self._percentage = self:client_get_value()
end

VersusPayloadObjectiveExtension.get_percentage_done = function (self)
	if self._is_server then
		return self._current_distance / self._total_distance + math.epsilon
	end

	return self._percentage
end
