-- chunkname: @scripts/unit_extensions/objectives/versus_capture_point_objective_extension.lua

local versus_capture_point_objective_extension_testify = script_data.testify and require("scripts/unit_extensions/objectives/testify/versus_capture_point_objective_extension_testify")

VersusCapturePointObjectiveExtension = class(VersusCapturePointObjectiveExtension, VersusBaseObjectiveExtension)
VersusCapturePointObjectiveExtension.NAME = "VersusCapturePointObjectiveExtension"

VersusCapturePointObjectiveExtension._activate = function (self, game_object_id, objective_data)
	local capture_point_default_settings = GameModeSettings.versus.objectives.capture_point

	self._capture_rate_multiplier = objective_data.capture_rate_multiplier or capture_point_default_settings.capture_rate_multiplier
	self._capture_time = objective_data.capture_time or capture_point_default_settings.capture_time
	self._num_sections = objective_data.num_sections or capture_point_default_settings.num_sections
	self._score_per_section = objective_data.score_per_section or capture_point_default_settings.score_per_section
	self._time_per_section = objective_data.time_per_section or capture_point_default_settings.time_per_section
	self._score_for_completion = objective_data.score_for_completion or capture_point_default_settings.score_for_completion
	self._time_for_completion = objective_data.time_for_completion or capture_point_default_settings.time_for_completion
	self._on_complete_sound_event = objective_data.on_complete_sound_event or capture_point_default_settings.on_complete_sound_event
	self._capture_time_remaining = self._capture_time

	local _, extents = Unit.box(self._unit)
	local radius = math.max(extents.x, extents.y)

	self._inside_radius = radius * math.max(self._scale.x, self._scale.y)

	local mesh = Unit.mesh(self._unit, "g_projector002")

	self._material = Mesh.material(mesh, "projector")

	Material.set_scalar(self._material, "radial_cutoff", 0)

	self._hero_side = Managers.state.side:get_side_from_name("heroes")

	if not self._is_server then
		self._percentage = 0
	end

	if not DEDICATED_SERVER then
		self:play_local_unit_sound("Play_versus_objective_capture_world_loop")
	end
end

VersusCapturePointObjectiveExtension._deactivate = function (self)
	if not DEDICATED_SERVER then
		local complete_event = self._on_complete_sound_event[self._local_side:name()]

		self:play_local_sound(complete_event)
		self:play_local_unit_sound("Stop_versus_objective_capture_loop")
		self:play_local_unit_sound("Stop_versus_objective_capture_ticking_loop")
	end
end

VersusCapturePointObjectiveExtension._server_update = function (self, dt, t)
	local num_players_inside = self:_get_num_players_inside()
	local previous_percentage = self:get_percentage_done()

	if num_players_inside >= 1 then
		local total_num_players = #self._hero_side.PLAYER_UNITS
		local capture_rate = self._capture_rate_multiplier * 4 * (num_players_inside / total_num_players)
		local time_remaining = math.clamp(self._capture_time_remaining - dt * capture_rate, 0, self._capture_time)

		if time_remaining ~= self._capture_time_remaining then
			self._capture_time_remaining = time_remaining

			local percentage_done = self:get_percentage_done()

			self:set_game_object_field("value", math.ceil(percentage_done * 100))

			if percentage_done >= (self._current_section + 1) * (1 / self._num_sections) then
				self:on_section_completed()
			end
		end
	end

	if not DEDICATED_SERVER then
		self:_update_local_player(dt, t, previous_percentage)
	end
end

VersusCapturePointObjectiveExtension._client_update = function (self, dt, t)
	local game_session = Network.game_session()

	if not game_session or not self._game_object_id then
		return
	end

	local previous_percentage = self:get_percentage_done()

	self._percentage = GameSession.game_object_field(game_session, self._game_object_id, "value") / 100

	self:_update_local_player(dt, t, previous_percentage)
end

VersusCapturePointObjectiveExtension.update_testify = function (self, dt, t)
	Testify:poll_requests_through_handler(versus_capture_point_objective_extension_testify, self)
end

VersusCapturePointObjectiveExtension._update_local_player = function (self, dt, t, previous_percentage)
	local percentage_done = self:get_percentage_done()

	if previous_percentage ~= percentage_done then
		Material.set_scalar(self._material, "radial_cutoff", percentage_done)
		self._audio_system:set_global_parameter("versus_checkpoint", percentage_done * 100)
	end

	if self._local_side:name() ~= "heroes" then
		return
	end

	local local_player_inside = self:_is_local_player_inside()

	if local_player_inside and not self._local_player_entered then
		self:play_local_unit_sound("Play_versus_objective_capture_ticking_loop")
	elseif not local_player_inside and self._local_player_entered then
		self:play_local_unit_sound("Stop_versus_objective_capture_ticking_loop")
	end

	self._local_player_entered = local_player_inside
end

VersusCapturePointObjectiveExtension._is_local_player_inside = function (self)
	local local_player = Managers.player:local_player()
	local local_player_unit = local_player and local_player.player_unit

	if not local_player_unit then
		return
	end

	local player_position = POSITION_LOOKUP[local_player_unit]
	local position = Unit.local_position(self._unit, 0)
	local distance = Vector3.distance_squared(position, player_position)
	local radius = self._inside_radius * self._inside_radius

	return distance <= radius
end

VersusCapturePointObjectiveExtension._get_num_players_inside = function (self)
	local ALIVE = ALIVE
	local POSITION_LOOKUP = POSITION_LOOKUP
	local ScriptUnit_extension = ScriptUnit.extension
	local Vector3_distance_squared = Vector3.distance_squared
	local radius_sq = self._inside_radius * self._inside_radius
	local num_players_inside = 0
	local player_units = self._hero_side.PLAYER_UNITS
	local position = self:get_position()

	for _, unit in pairs(player_units) do
		if ALIVE[unit] then
			local status_extension = ScriptUnit_extension(unit, "status_system")

			if not status_extension:is_disabled() then
				local player_position = POSITION_LOOKUP[unit]
				local distance = Vector3_distance_squared(position, player_position)

				if distance <= radius_sq then
					num_players_inside = num_players_inside + 1
				end
			end
		end
	end

	return num_players_inside
end

VersusCapturePointObjectiveExtension.get_percentage_done = function (self)
	if self._is_server then
		local value = 1 - self._capture_time_remaining / self._capture_time

		return math.clamp(value, 0, 1)
	end

	return self._percentage
end
