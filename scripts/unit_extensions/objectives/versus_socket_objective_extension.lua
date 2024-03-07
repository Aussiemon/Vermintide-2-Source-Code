-- chunkname: @scripts/unit_extensions/objectives/versus_socket_objective_extension.lua

VersusSocketObjectiveExtension = class(VersusSocketObjectiveExtension, VersusBaseObjectiveExtension)
VersusSocketObjectiveExtension.NAME = "VersusSocketObjectiveExtension"

VersusSocketObjectiveExtension._activate = function (self, game_object_id, objective_data)
	local socket_default_settings = GameModeSettings.versus.objectives.socket

	self._score_per_section = objective_data.score_per_socket or socket_default_settings.score_per_socket
	self._time_per_section = objective_data.time_per_socket or socket_default_settings.time_per_socket
	self._score_for_completion = objective_data.score_for_completion or socket_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or socket_default_settings.time_for_completion
	self._on_complete_sound_event = objective_data.on_complete_sound_event or socket_default_settings.on_complete_sound_event
	self._socket_extension = ScriptUnit.has_extension(self._unit, "objective_socket_system")
	self._num_sections = self._socket_extension.num_sockets
	self._num_closed_sockets = 0
end

VersusSocketObjectiveExtension._deactivate = function (self)
	if not DEDICATED_SERVER then
		local complete_event = self._on_complete_sound_event[self._local_side:name()]

		self:play_local_sound(complete_event)
	end
end

VersusSocketObjectiveExtension._server_update = function (self, dt, t)
	local num_closed_sockets = self._socket_extension.num_closed_sockets
	local num_new_closed_sockets = num_closed_sockets - self._num_closed_sockets

	for i = 1, num_new_closed_sockets do
		self:on_section_completed()
	end

	self._num_closed_sockets = num_closed_sockets
end

VersusSocketObjectiveExtension._client_update = function (self, dt, t)
	return
end

VersusSocketObjectiveExtension.get_percentage_done = function (self)
	return self._socket_extension.num_closed_sockets / self._num_sections + math.epsilon
end
