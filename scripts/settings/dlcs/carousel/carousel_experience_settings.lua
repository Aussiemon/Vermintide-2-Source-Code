-- chunkname: @scripts/settings/dlcs/carousel/carousel_experience_settings.lua

local versus_experience_levels = {
	0,
	1500,
	1501,
	1503,
	1506,
	1509,
	1513,
	1518,
	1523,
	1529,
	1536,
	1543,
	1551,
	1560,
	1569,
	1579,
	1590,
	1601,
	1613,
	1626,
	1639,
	1653,
	1668,
	1683,
	1699,
	1716,
	1733,
	1751,
	1770,
	1789,
	1809,
	1830,
	1851,
	1873,
	1896,
	1919,
	1943,
	1968,
	1993,
	2019,
	2046,
	2073,
	2101,
	2130,
	2159,
	2189,
	2220,
	2251,
	2283,
	2316,
	2349,
	2383,
	2418,
	2453,
	2489,
	2526,
	2563,
	2601,
	2640,
	2679,
	2719,
	2760,
	2801,
	2843,
	2886,
	2929,
	2973,
	3018,
	3063,
	3109,
	3156,
	3203,
	3251,
	3300,
	3349,
	3399,
	3450,
	3501,
	3553,
	3606,
	3659,
	3713,
	3768,
	3823,
	3879,
	3936,
	3993,
	4051,
	4110,
	4169,
	4229,
	4290,
	4351,
	4413,
	4476,
	4539,
	4603,
	4668,
	4733,
	4799,
	4866,
	4933,
	5001,
	5070,
	5139,
	5209,
	5280,
	5351,
	5423,
	5496,
	5569,
	5643,
	5718,
	5793,
	5869,
	5946,
	6023,
	6101,
	6180,
	6259,
	6339,
	6420,
	6501,
	6583,
	6666,
	6749,
	6833,
	6918,
	7003,
	7089,
	7176,
	7263,
	7351,
	7440,
	7529,
	7619,
	7710,
	7801,
	7893,
	7986,
	8079,
	8173,
	8268,
	8363,
	8459,
	8556,
	8653,
	8751,
	8850,
	8949,
	9049,
	9150,
	9251,
	9353,
	9456,
	9559,
	9663,
	9768,
	9873,
	9979,
	10086,
	10193,
	10301,
	10410,
	10519,
	10629,
	10740,
	10851,
	10963,
	11076,
	11189,
	11303,
	11418,
	11533,
	11649,
	11766,
	11883,
	12001,
	12120,
	12239,
	12359,
	12480,
	12601,
	12723,
	12846,
	12969,
	13093,
	13218,
	13343,
	13469,
	13596,
	13723,
	13851,
	13980,
	14109,
	14239,
	14370,
	14501,
	14633,
	14766,
	14899,
	15033,
	15168,
	15303,
	15439,
	15576,
	15713,
	15851,
	15990,
	16129,
	16269,
	16410,
	16551,
	16693,
	16836,
	16979,
	17123,
	17268,
	17413,
	17559,
	17706,
	17853,
	18001,
	18150,
	18299,
	18449,
	18600,
	18751,
	18903,
	19056,
	19209,
	19363,
	19518,
	19673,
	19829,
	19986,
	20143,
	20301,
	20460,
	20619,
	20779,
	20940,
	21101,
	21263,
	21426,
	21589,
	21753,
	21918,
	22083,
	22249,
}
local num_defined_versus_levels = #versus_experience_levels
local total_defined_versus_experience = 0

for i = 1, num_defined_versus_levels do
	total_defined_versus_experience = total_defined_versus_experience + versus_experience_levels[i]
end

ExperienceSettings = ExperienceSettings or {}

ExperienceSettings.get_versus_level = function ()
	local versus_experience = ExperienceSettings.get_versus_experience()

	return ExperienceSettings.get_versus_level_from_experience(versus_experience)
end

ExperienceSettings.get_versus_player_level = function (player)
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

	local level = GameSession.game_object_field(network_game, go_id, "versus_level")

	return level
end

ExperienceSettings.get_versus_experience = function ()
	local versus_interface = Managers.backend:get_interface("versus")
	local versus_experience = versus_interface:get_profile_data("experience")

	return versus_experience or 0
end

ExperienceSettings.get_versus_level_from_experience = function (experience)
	experience = experience or 0

	assert(experience >= 0, "Negative XP!??")

	local exp_total = 0
	local level = 0
	local progress = 0
	local experience_into_level = 0
	local previous_exp_total

	if experience >= total_defined_versus_experience then
		return num_defined_versus_levels, progress, experience_into_level
	end

	for i = 1, num_defined_versus_levels do
		previous_exp_total = exp_total
		exp_total = exp_total + versus_experience_levels[i]

		if experience < exp_total then
			level = i - 1
			experience_into_level = experience - previous_exp_total
			progress = experience_into_level / versus_experience_levels[i]

			break
		end
	end

	return level, progress, experience_into_level
end

ExperienceSettings.get_versus_progress_breakdown = function (start_experience, total_experience_gained)
	local start_level, start_experience_level_progress = ExperienceSettings.get_versus_level_from_experience(start_experience)
	local end_level, end_experience_level_progress = ExperienceSettings.get_versus_level_from_experience(start_experience + total_experience_gained)
	local breakdown = {}

	for i = start_level, end_level do
		if not versus_experience_levels[i + 1] then
			breakdown[i] = 0
		else
			local end_level_experience = versus_experience_levels[i + 1] * (i == end_level and end_experience_level_progress or 1)
			local start_level_experience = end_level_experience * start_experience_level_progress

			breakdown[i] = (end_level_experience - start_level_experience) / total_experience_gained
			start_experience_level_progress = 0
		end
	end

	return breakdown, start_level
end

ExperienceSettings.max_versus_experience = total_defined_versus_experience
ExperienceSettings.max_versus_level = num_defined_versus_levels
