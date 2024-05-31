-- chunkname: @scripts/unit_extensions/objectives/versus_interact_objective_extension.lua

local versus_interact_objective_extension_testify = script_data.testify and require("scripts/unit_extensions/objectives/testify/versus_interact_objective_extension_testify")

VersusInteractObjectiveExtension = class(VersusInteractObjectiveExtension, VersusBaseObjectiveExtension)
VersusInteractObjectiveExtension.NAME = "VersusInteractObjectiveExtension"

VersusInteractObjectiveExtension._activate = function (self, game_object_id, objective_data)
	local interact_default_settings = GameModeSettings.versus.objectives.interact

	self._score_for_completion = objective_data.score_for_completion or interact_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or interact_default_settings.time_for_completion
	self._wanted_interaction_result = InteractionResult.SUCCESS
	self._interactable_extension = ScriptUnit.has_extension(self._unit, "interactable_system")
	self._percentage = 0
end

VersusInteractObjectiveExtension._server_update = function (self, dt, t)
	if self._percentage < 1 and self._interactable_extension.interaction_result == self._wanted_interaction_result then
		self._percentage = 1

		self:set_game_object_field("value", self._percentage * 100)
	end
end

VersusInteractObjectiveExtension._client_update = function (self, dt, t)
	local game_session = Network.game_session()

	if not game_session or not self._game_object_id then
		return
	end

	self._percentage = GameSession.game_object_field(game_session, self._game_object_id, "value") / 100
end

VersusInteractObjectiveExtension.update_testify = function (self, dt, t)
	Testify:poll_requests_through_handler(versus_interact_objective_extension_testify, self)
end

VersusInteractObjectiveExtension.get_percentage_done = function (self)
	return self._percentage
end

VersusInteractObjectiveExtension._deactivate = function (self)
	return
end
