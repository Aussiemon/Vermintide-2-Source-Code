-- chunkname: @scripts/unit_extensions/objectives/versus_volume_objective_extension.lua

VersusVolumeObjectiveExtension = class(VersusVolumeObjectiveExtension, VersusBaseObjectiveExtension)
VersusVolumeObjectiveExtension.NAME = "VersusVolumeObjectiveExtension"

local VOLUME_TYPE_TO_FUNC_NAME = {
	all_alive = "all_alive_human_players_inside",
	any_alive = "any_alive_human_players_inside",
}

VersusVolumeObjectiveExtension._activate = function (self, game_object_id, objective_data)
	local volume_default_settings = GameModeSettings.versus.objectives.volume

	self._score_for_completion = objective_data.score_for_completion or volume_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or volume_default_settings.time_for_completion
	self._score_for_each_player_inside = objective_data.score_for_each_player_inside or volume_default_settings.score_for_each_player_inside
	self._time_for_each_player_inside = objective_data.time_for_each_player_inside or volume_default_settings.time_for_each_player_inside
	self._volume_name = objective_data.volume_name
	self._volume_type = objective_data.volume_type or volume_default_settings.volume_type
	self._percentage = 0
	self._on_complete_sound_event = objective_data.on_complete_sound_event or volume_default_settings.on_complete_sound_event

	if self._is_server then
		self._volume_system = Managers.state.entity:system("volume_system")
		self._condition_func = self._volume_system.all_alive_human_players_inside

		self._volume_system:register_volume(self._volume_name, "trigger_volume", {
			sub_type = "players_inside",
		})

		local name = VOLUME_TYPE_TO_FUNC_NAME[self._volume_type]

		fassert(name ~= nil, "Invalid volume type ", self._volume_type)

		self._condition_func = self._volume_system[name]
	end
end

VersusVolumeObjectiveExtension._deactivate = function (self)
	if not DEDICATED_SERVER then
		local complete_event = self._on_complete_sound_event[self._local_side:name()]

		self:play_local_sound(complete_event)
	end
end

VersusVolumeObjectiveExtension._server_update = function (self, dt, t)
	local completed = self._condition_func(self._volume_system, self._volume_name)

	if self._percentage < 1 and completed then
		self._percentage = 1

		self:set_game_object_field("value", self._percentage * 100)
	end
end

VersusVolumeObjectiveExtension._client_update = function (self, dt, t)
	local game_session = Network.game_session()

	if not game_session or not self._game_object_id then
		return
	end

	self._percentage = GameSession.game_object_field(game_session, self._game_object_id, "value") / 100
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
