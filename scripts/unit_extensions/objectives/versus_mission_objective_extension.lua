-- chunkname: @scripts/unit_extensions/objectives/versus_mission_objective_extension.lua

VersusMissionObjectiveExtension = class(VersusMissionObjectiveExtension, VersusBaseObjectiveExtension)
VersusMissionObjectiveExtension.NAME = "VersusMissionObjectiveExtension"

VersusMissionObjectiveExtension._activate = function (self, game_object_id, objective_data)
	local mission_default_settings = GameModeSettings.versus.objectives.mission

	self._score_for_completion = objective_data.score_for_completion or mission_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or mission_default_settings.time_for_completion
	self._on_complete_sound_event = objective_data.on_complete_sound_event or mission_default_settings.on_complete_sound_event
	self._mission_name = objective_data.mission_name
	self._mission_system = Managers.state.entity:system("mission_system")
	self._percentage = 0
end

VersusMissionObjectiveExtension._deactivate = function (self)
	if not DEDICATED_SERVER then
		local complete_event = self._on_complete_sound_event[self._local_side:name()]

		self:play_local_sound(complete_event)
	end
end

VersusMissionObjectiveExtension._server_update = function (self, dt, t)
	local missions = self._mission_system.completed_missions

	if missions[self._mission_name] ~= nil then
		self._percentage = 1

		self:set_game_object_field("value", self._percentage * 100)
	end
end

VersusMissionObjectiveExtension._client_update = function (self, dt, t)
	local game_session = Network.game_session()

	if not game_session or not self._game_object_id then
		return
	end

	self._percentage = GameSession.game_object_field(game_session, self._game_object_id, "value") / 100
end

VersusMissionObjectiveExtension.get_percentage_done = function (self)
	return self._percentage
end
