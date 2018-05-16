RoundStartedSystem = class(RoundStartedSystem, ExtensionSystemBase)
local extensions = {
	"RoundStartedExtension"
}
RoundStartedExtension = class(RoundStartedExtension)

RoundStartedExtension.init = function (self)
	return
end

RoundStartedExtension.destroy = function (self)
	return
end

RoundStartedSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self._is_server = context.is_server
	self._world = context.world
	self._start_area = "start_area"
	self._round_started = false
	self._player_spawned = false
	self._units = {}
end

RoundStartedSystem.destroy = function (self)
	return
end

RoundStartedSystem.set_start_area = function (self, volume_name)
	local level = LevelHelper:current_level(self._world)
	local level_name = LevelHelper:current_level_settings(self._world).level_name

	fassert(Level.has_volume(level, volume_name), "Volume name %s does not exist in level %s", volume_name, level_name)

	self._start_area = volume_name
end

RoundStartedSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	ScriptUnit.add_extension(nil, unit, "RoundStartedExtension", self.NAME, extension_init_data)

	self._units[unit] = true
	local ext = ScriptUnit.extension(unit, self.NAME)

	return ext
end

RoundStartedSystem.on_remove_extension = function (self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	self._units[unit] = nil
end

RoundStartedSystem.hot_join_sync = function (self, sender, player)
	return
end

RoundStartedSystem.update = function (self, context, t)
	if not self._is_server or self._round_started then
		return
	end

	local started = self:_players_left_start_area()

	if started then
		Managers.state.game_mode:round_started()

		local level_settings = LevelHelper:current_level_settings()
		local score_type = level_settings.score_type

		if score_type then
			local start_data = {
				start_time = t
			}
			local leaderboard_system = Managers.state.entity:system("leaderboard_system")

			leaderboard_system:round_started(score_type, start_data)
		end

		self._round_started = true
	end
end

RoundStartedSystem._players_left_start_area = function (self)
	local checkpoint_data = Managers.state.spawn:checkpoint_data()
	local volume_name = (checkpoint_data and checkpoint_data.safe_zone_volume_name) or self._start_area
	local level = LevelHelper:current_level(self._world)

	if not Level.has_volume(level, volume_name) then
		if script_data.debug_level then
			Application.warning("Level is missing start area.")
		end

		return self._player_spawned
	end

	for unit, _ in pairs(self._units) do
		local pos = POSITION_LOOKUP[unit]

		if not Level.is_point_inside_volume(level, volume_name, pos) then
			return true
		end
	end

	return false
end

RoundStartedSystem.player_spawned = function (self)
	self._player_spawned = true
end

return
