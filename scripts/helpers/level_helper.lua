-- chunkname: @scripts/helpers/level_helper.lua

LevelHelper = LevelHelper or {}
LevelHelper.INGAME_WORLD_NAME = "level_world"

LevelHelper.current_level_settings = function (self)
	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager then
		local level_key = Managers.state.game_mode:level_key()

		return LevelSettings[level_key]
	end

	return nil
end

LevelHelper.current_level = function (self, world)
	local level_settings = self:current_level_settings()
	local level = ScriptWorld.level(world, level_settings.level_name)

	return level
end

LevelHelper.get_environment_variation_id = function (self, level_key)
	local backend_manager = Managers.backend
	local environment_variations = backend_manager:get_title_data("environment_variations")

	if not environment_variations then
		return self:get_random_variation_id(level_key)
	end

	environment_variations = cjson.decode(environment_variations)

	local level_environment_variations = environment_variations[level_key]

	if not level_environment_variations then
		return 0
	end

	local type = level_environment_variations.type

	if type == "random" then
		return self:get_random_variation_id(level_key)
	elseif type == "specific" then
		local level_settings = LevelSettings[level_key]
		local existing_variations = level_settings and level_settings.environment_variations

		if not existing_variations or #existing_variations < 1 then
			return 0
		end

		local variations = level_environment_variations.variations
		local selected_variation_string, i, id

		while #variations > 0 do
			i = math.random(1, #variations)
			selected_variation_string = variations[i]

			if selected_variation_string == "default" then
				return 0
			end

			id = table.find(existing_variations, selected_variation_string)

			if id then
				return id
			else
				table.remove(variations, i)
			end
		end
	elseif type == "default" then
		return 0
	end

	return 0
end

LevelHelper.get_random_variation_id = function (self, level_key)
	local settings = rawget(LevelSettings, level_key)
	local variations = settings and settings.environment_variations

	return variations and math.random(0, #variations) or 0
end

LevelHelper.flow_event = function (self, world, event)
	local level_settings = self:current_level_settings()
	local level = ScriptWorld.level(world, level_settings.level_name)

	Level.trigger_event(level, event)
end

LevelHelper.set_flow_parameter = function (self, world, name, value)
	local level_settings = self:current_level_settings()
	local level = ScriptWorld.level(world, level_settings.level_name)

	Level.set_flow_variable(level, name, value)
end

LevelHelper.unit_index = function (self, world, unit)
	local level = self:current_level(world)

	return Level.unit_index(level, unit)
end

LevelHelper.unit_by_index = function (self, world, index)
	local level = self:current_level(world)

	return Level.unit_by_index(level, index)
end

LevelHelper.find_dialogue_unit = function (self, world, dialogue_profile)
	local level = LevelHelper:current_level(world)
	local units = Level.units(level)
	local intro_vo_unit

	for _, unit in ipairs(units) do
		if Unit.has_data(unit, "dialogue_profile") then
			local found_dialogue_profile = Unit.get_data(unit, "dialogue_profile")

			if found_dialogue_profile == dialogue_profile then
				intro_vo_unit = unit

				break
			end
		end
	end

	return intro_vo_unit
end

LevelHelper.get_base_level = function (self, level_key)
	local level_settings = LevelSettings[level_key]

	return level_settings and level_settings.base_level_name or level_key
end

LevelHelper.get_small_level_image = function (self, level_key)
	local level_settings = LevelSettings[level_key]
	local level_image = level_settings.small_level_image or level_key .. "_small_image"

	if not UIAtlasHelper.has_texture_by_name(level_image) then
		level_image = "any_small_image"
	end

	return level_image
end

LevelHelper.should_load_enemies = function (self, level_key)
	local level_settings = LevelSettings[level_key]

	return not level_settings.preload_no_enemies
end
