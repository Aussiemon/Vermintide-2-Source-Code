local experience_levels = {
	0,
	200,
	400,
	600,
	650,
	700,
	750,
	800,
	850,
	900,
	1000,
	1100,
	1200,
	1300,
	1400,
	1500,
	1600,
	1700,
	1800,
	1900,
	2000,
	2100,
	2200,
	2300,
	2400,
	2500,
	2600,
	2700,
	2800,
	2900,
	3000,
	3100,
	3200,
	3300,
	3400
}
local level_used_for_extra_levels_experience = 30
local num_defined_levels = #experience_levels
local experience_for_extra_levels = experience_levels[level_used_for_extra_levels_experience]
local total_defined_experience = 0

for i = 1, num_defined_levels, 1 do
	total_defined_experience = total_defined_experience + experience_levels[i]
end

ExperienceSettings = ExperienceSettings or {}

ExperienceSettings.get_player_level = function (player)
	local network_manager = Managers.state.network
	local network_game = network_manager:game()

	if not network_game then
		return nil
	end

	local unit_storage = Managers.state.unit_storage
	local unit = player.player_unit
	local go_id = unit_storage:go_id(unit)

	if not go_id then
		return nil
	end

	local level = GameSession.game_object_field(network_game, go_id, "level")

	return level
end

ExperienceSettings.get_account_level = function ()
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local best_class, best_xp = nil
	local level = ExperienceSettings.get_level(best_xp)

	return level, best_xp, best_class
end

ExperienceSettings.get_experience = function (hero_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")

	return hero_attributes:get(hero_name, "experience") or 0
end

ExperienceSettings.get_experience_pool = function (hero_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")

	return hero_attributes:get(hero_name, "experience_pool") or 0
end

ExperienceSettings.get_level = function (experience)
	experience = experience or 0

	assert(experience >= 0, "Negative XP!??")

	local exp_total = 0
	local level = 0
	local progress = 0
	local experience_into_level = 0
	local previous_exp_total = 0

	if total_defined_experience <= experience then
		local experience_into_level = 0
		local progress = 0

		return num_defined_levels, progress, experience_into_level
	end

	for i = 1, num_defined_levels, 1 do
		previous_exp_total = exp_total
		exp_total = exp_total + experience_levels[i]

		if experience < exp_total then
			level = i - 1
			experience_into_level = experience - previous_exp_total
			progress = experience_into_level / experience_levels[i]

			break
		end
	end

	return level, progress, experience_into_level
end

ExperienceSettings.get_extra_level = function (experience_pool)
	local extra_level = math.floor(experience_pool / experience_for_extra_levels)
	local progress = experience_pool % experience_for_extra_levels
	local progress_ratio = progress / experience_for_extra_levels

	return extra_level, progress_ratio
end

ExperienceSettings.get_total_experience_required_for_level = function (level)
	local experience = 0

	for i = 1, level, 1 do
		local level_experience = experience_levels[i] or experience_for_extra_levels
		experience = experience + level_experience
	end

	return experience
end

ExperienceSettings.get_experience_required_for_level = function (level)
	return experience_levels[level] or experience_for_extra_levels
end

ExperienceSettings.get_highest_character_level = function ()
	local highest_level = 0

	for _, profile_index in ipairs(ProfilePriority) do
		local profile = SPProfiles[profile_index]
		local display_name = profile.display_name
		local experience = ExperienceSettings.get_experience(display_name)
		local level = ExperienceSettings.get_level(experience)

		if highest_level < level then
			highest_level = level
		end
	end

	return highest_level
end

ExperienceSettings.max_experience = total_defined_experience
ExperienceSettings.max_level = num_defined_levels
ExperienceSettings.multiplier = 1
ExperienceSettings.level_length_experience_multiplier = {
	short = 1,
	long = 1
}

return
