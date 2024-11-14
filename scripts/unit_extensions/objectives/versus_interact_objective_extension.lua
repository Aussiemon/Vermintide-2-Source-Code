-- chunkname: @scripts/unit_extensions/objectives/versus_interact_objective_extension.lua

local versus_interact_objective_extension_testify = script_data.testify and require("scripts/unit_extensions/objectives/testify/versus_interact_objective_extension_testify")

VersusInteractObjectiveExtension = class(VersusInteractObjectiveExtension, BaseObjectiveExtension)
VersusInteractObjectiveExtension.NAME = "VersusInteractObjectiveExtension"

VersusInteractObjectiveExtension.init = function (self, ...)
	VersusInteractObjectiveExtension.super.init(self, ...)

	self._wanted_interaction_result = InteractionResult.SUCCESS
	self._percentage = 0
end

VersusInteractObjectiveExtension.extensions_ready = function (self)
	self._interactable_extension = ScriptUnit.has_extension(self._unit, "interactable_system")
end

VersusInteractObjectiveExtension._set_objective_data = function (self, objective_data)
	local interact_default_settings = GameModeSettings.versus.objectives.interact

	self._score_for_completion = objective_data.score_for_completion or interact_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or interact_default_settings.time_for_completion
end

VersusInteractObjectiveExtension._activate = function (self)
	return
end

VersusInteractObjectiveExtension._server_update = function (self, dt, t)
	if self._percentage < 1 and self._interactable_extension.interaction_result == self._wanted_interaction_result then
		self._percentage = 1

		self:server_set_value(self._percentage)
	end
end

VersusInteractObjectiveExtension._client_update = function (self, dt, t)
	self._percentage = self:client_get_value()
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
