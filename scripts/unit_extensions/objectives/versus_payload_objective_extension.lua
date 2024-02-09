-- chunkname: @scripts/unit_extensions/objectives/versus_payload_objective_extension.lua

VersusPayloadObjectiveExtension = class(VersusPayloadObjectiveExtension, VersusBaseObjectiveExtension)
VersusPayloadObjectiveExtension.NAME = "VersusPayloadObjectiveExtension"

VersusPayloadObjectiveExtension._activate = function (self, game_object_id, objective_data)
	local payload_default_settings = GameModeSettings.versus.objectives.payload

	self._num_sections = objective_data.num_sections or payload_default_settings.num_sections
	self._score_per_section = objective_data.score_per_section or payload_default_settings.score_per_section
	self._time_per_section = objective_data.time_per_section or payload_default_settings.time_per_section
	self._score_for_completion = objective_data.score_for_completion or payload_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or payload_default_settings.time_for_completion
	self._on_complete_sound_event = objective_data.on_complete_sound_event or payload_default_settings.on_complete_sound_event
	self._payload_extension = ScriptUnit.has_extension(self._unit, "payload_system")
	self._spline_movement = self._payload_extension._spline_curve:movement()
	self._total_distance = self._spline_movement:distance(1, 1, 0, #self._spline_movement._splines, #self._spline_movement:_current_spline().subdivisions, 1)
	self._current_distance = 0

	if not self._is_server then
		self._percentage = 0
	end
end

VersusPayloadObjectiveExtension._deactivate = function (self)
	if not DEDICATED_SERVER then
		local complete_event = self._on_complete_sound_event[self._local_side:name()]

		self:play_local_sound(complete_event)
	end
end

VersusPayloadObjectiveExtension._server_update = function (self, dt, t)
	if not self._payload_extension:started() then
		return
	end

	local new_distance = self._spline_movement:current_spline_curve_distance()

	if new_distance ~= self._current_distance then
		self._current_distance = new_distance

		local percentage_done = self:get_percentage_done()

		self:set_game_object_field("value", math.ceil(percentage_done * 100))

		if percentage_done >= (self._current_section + 1) * (1 / self._num_sections) then
			self:on_section_completed()
		end
	end
end

VersusPayloadObjectiveExtension._client_update = function (self, dt, t)
	local game_session = Network.game_session()

	if not game_session or not self._game_object_id then
		return
	end

	self._percentage = GameSession.game_object_field(game_session, self._game_object_id, "value") / 100
end

VersusPayloadObjectiveExtension.get_percentage_done = function (self)
	if self._is_server then
		return self._current_distance / self._total_distance + math.epsilon
	end

	return self._percentage
end
