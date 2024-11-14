-- chunkname: @scripts/unit_extensions/objectives/versus_survive_event_objective_extension.lua

VersusSurviveEventObjectiveExtension = class(VersusSurviveEventObjectiveExtension, BaseObjectiveExtension)
VersusSurviveEventObjectiveExtension.NAME = "VersusSurviveEventObjectiveExtension"

VersusSurviveEventObjectiveExtension.init = function (self, ...)
	VersusSurviveEventObjectiveExtension.super.init(self, ...)

	self._survive_time_done = 0
	self._remaining_survive_time = 0
	self._current_time_survived = 0
	self._percentage = 0
end

VersusSurviveEventObjectiveExtension._set_objective_data = function (self, objective_data)
	local survive_default_settings = GameModeSettings.versus.objectives.survive_event

	self._num_sections = objective_data.num_sections or survive_default_settings.num_sections
	self._score_per_section = objective_data.score_per_section or survive_default_settings.score_per_section
	self._time_per_section = objective_data.time_per_section or survive_default_settings.time_per_section
	self._score_for_completion = objective_data.score_for_completion or survive_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or survive_default_settings.time_for_completion
	self._on_last_leaf_complete_sound_event = objective_data.on_last_leaf_complete_sound_event or survive_default_settings.on_last_leaf_complete_sound_event
end

VersusSurviveEventObjectiveExtension._activate = function (self)
	self._survive_time_done = Managers.time:time("game") + self._time_for_completion
end

VersusSurviveEventObjectiveExtension._deactivate = function (self)
	return
end

VersusSurviveEventObjectiveExtension._server_update = function (self, dt, t)
	local time_remaining = math.clamp(self._survive_time_done - t, 0, self._time_for_completion)

	if time_remaining ~= self._remaining_survive_time then
		self._remaining_survive_time = time_remaining

		local percentage_done = self:get_percentage_done()

		self:server_set_value(percentage_done)

		if percentage_done >= (self._current_section + 1) * (1 / self._num_sections) then
			self:on_section_completed()
		end
	end
end

VersusSurviveEventObjectiveExtension._client_update = function (self, dt, t)
	self._percentage = self:client_get_value()
end

VersusSurviveEventObjectiveExtension.update_testify = function (self, dt, t)
	return
end

VersusSurviveEventObjectiveExtension.get_percentage_done = function (self)
	if self._is_server then
		local value = 1 - self._remaining_survive_time / self._time_for_completion

		return math.clamp(value, 0, 1)
	end

	return self._percentage
end
