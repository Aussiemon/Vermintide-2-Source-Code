LevelHelper = LevelHelper or {}
LevelHelper.current_level_settings = function (self)
	local level_key = Managers.state.game_mode:level_key()

	return LevelSettings[level_key]
end
LevelHelper.current_level = function (self, world)
	local level_settings = self.current_level_settings(self)
	local level = ScriptWorld.level(world, level_settings.level_name)

	return level
end
LevelHelper.flow_event = function (self, world, event)
	local level_settings = self.current_level_settings(self)
	local level = ScriptWorld.level(world, level_settings.level_name)

	Level.trigger_event(level, event)

	return 
end
LevelHelper.set_flow_parameter = function (self, world, name, value)
	local level_settings = self.current_level_settings(self)
	local level = ScriptWorld.level(world, level_settings.level_name)

	Level.set_flow_variable(level, name, value)

	return 
end
LevelHelper.unit_index = function (self, world, unit)
	local level = self.current_level(self, world)

	return Level.unit_index(level, unit)
end
LevelHelper.unit_by_index = function (self, world, index)
	local level = self.current_level(self, world)

	return Level.unit_by_index(level, index)
end

return 
