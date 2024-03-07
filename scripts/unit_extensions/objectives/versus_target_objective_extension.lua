-- chunkname: @scripts/unit_extensions/objectives/versus_target_objective_extension.lua

VersusTargetObjectiveExtension = class(VersusTargetObjectiveExtension, VersusBaseObjectiveExtension)
VersusTargetObjectiveExtension.NAME = "VersusTargetObjectiveExtension"

VersusTargetObjectiveExtension._activate = function (self, game_object_id, objective_data)
	local target_default_settings = GameModeSettings.versus.objectives.target

	self._num_sections = objective_data.num_sections or target_default_settings.num_sections
	self._score_per_section = objective_data.score_per_section or target_default_settings.score_per_section
	self._time_per_section = objective_data.time_per_section or target_default_settings.time_per_section
	self._score_for_completion = objective_data.score_for_completion or target_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or target_default_settings.time_for_completion
	self._on_complete_sound_event = objective_data.on_complete_sound_event or target_default_settings.on_complete_sound_event
	self._health_system = ScriptUnit.has_extension(self._unit, "health_system")
	self._max_health = self._health_system:current_health()
	self._health = self._max_health
end

VersusTargetObjectiveExtension._deactivate = function (self)
	if not DEDICATED_SERVER then
		local complete_event = self._on_complete_sound_event[self._local_side:name()]

		self:play_local_sound(complete_event)
	end
end

VersusTargetObjectiveExtension._store_position = function (self)
	return
end

VersusTargetObjectiveExtension._server_update = function (self, dt, t)
	self._health = self._health_system:current_health()

	local percentage_done = self:get_percentage_done()

	if percentage_done >= (self._current_section + 1) * (1 / self._num_sections) then
		self:on_section_completed()
	end
end

VersusTargetObjectiveExtension._client_update = function (self, dt, t)
	self._health = self._health_system:current_health()
end

VersusTargetObjectiveExtension.get_percentage_done = function (self)
	return 1 - self._health / self._max_health + math.epsilon
end
