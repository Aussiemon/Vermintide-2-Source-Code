-- chunkname: @scripts/unit_extensions/objectives/versus_volume_objective_extension.lua

local versus_volume_objective_extension_testify = script_data.testify and require("scripts/unit_extensions/objectives/testify/versus_volume_objective_extension_testify")

VersusVolumeObjectiveExtension = class(VersusVolumeObjectiveExtension, BaseObjectiveExtension)
VersusVolumeObjectiveExtension.NAME = "VersusVolumeObjectiveExtension"

local VOLUME_TYPE_TO_FUNC_NAME = {
	all_alive = "all_alive_human_players_inside",
	any_alive = "any_alive_human_players_inside",
}

VersusVolumeObjectiveExtension.init = function (self, ...)
	VersusVolumeObjectiveExtension.super.init(self, ...)

	self._volume_system = Managers.state.entity:system("volume_system")
	self._percentage = 0
end

VersusVolumeObjectiveExtension._set_objective_data = function (self, objective_data)
	local volume_default_settings = GameModeSettings.versus.objectives.volume

	self._score_for_completion = objective_data.score_for_completion or volume_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or volume_default_settings.time_for_completion
	self._score_for_each_player_inside = objective_data.score_for_each_player_inside or volume_default_settings.score_for_each_player_inside
	self._time_for_each_player_inside = objective_data.time_for_each_player_inside or volume_default_settings.time_for_each_player_inside
	self._volume_name = objective_data.volume_name
	self._volume_type = objective_data.volume_type or volume_default_settings.volume_type
	self._on_last_leaf_complete_sound_event = objective_data.on_last_leaf_complete_sound_event or volume_default_settings.on_last_leaf_complete_sound_event

	local name = VOLUME_TYPE_TO_FUNC_NAME[self._volume_type]

	fassert(name ~= nil, "Invalid volume type ", self._volume_type)

	self._condition_func = self._volume_system[name]
end

VersusVolumeObjectiveExtension._activate = function (self)
	if self._is_server then
		self._volume_system:register_volume(self._volume_name, "trigger_volume", {
			sub_type = "players_inside",
		})
	end
end

VersusVolumeObjectiveExtension._deactivate = function (self)
	return
end

VersusVolumeObjectiveExtension._server_update = function (self, dt, t)
	local completed = self._condition_func(self._volume_system, self._volume_name)

	if self._percentage < 1 and completed then
		self._percentage = 1

		self:server_set_value(self._percentage)
	end
end

VersusVolumeObjectiveExtension._client_update = function (self, dt, t)
	self._percentage = self:client_get_value()
end

VersusVolumeObjectiveExtension.update_testify = function (self, dt, t)
	Testify:poll_requests_through_handler(versus_volume_objective_extension_testify, self)
end

VersusVolumeObjectiveExtension.get_percentage_done = function (self)
	return self._percentage
end

VersusVolumeObjectiveExtension._get_num_players_inside = function (self)
	local side = Managers.state.side:get_side_from_name("heroes")
	local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
	local num_players = 0

	if self._volume_type == "all_alive_human_players_inside" then
		for i = 1, #player_and_bot_units do
			local player_unit = player_and_bot_units[i]
			local status_ext = ALIVE[player_unit] and ScriptUnit.has_extension(player_unit, "status_system")

			if status_ext and not status_ext:is_disabled() then
				num_players = num_players + 1
			end
		end
	else
		for i = 1, #player_and_bot_units do
			local player_unit = player_and_bot_units[i]
			local status_ext = ALIVE[player_unit] and ScriptUnit.has_extension(player_unit, "status_system")

			if status_ext and not status_ext:is_disabled() and (status_ext.is_bot or self._volume_system:player_inside(self._volume_name, player_unit)) then
				num_players = num_players + 1
			end
		end
	end

	return num_players
end

VersusVolumeObjectiveExtension.get_score_for_completion = function (self)
	if not self:is_done() then
		return 0
	end

	if self._score_for_each_player_inside == 0 then
		return self._score_for_completion
	end

	return self._score_for_completion + self:_get_num_players_inside() * self._score_for_each_player_inside
end

VersusVolumeObjectiveExtension.get_time_for_completion = function (self)
	if not self:is_done() then
		return 0
	end

	if self._time_for_each_player_inside == 0 then
		return self._time_for_completion
	end

	return self._time_for_completion + self:_get_num_players_inside() * self._time_for_each_player_inside
end
