-- chunkname: @scripts/settings/dlcs/carousel/carousel_experience_settings.lua

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
	3400,
	3550,
	3700,
	3850,
	4000,
	4150,
	4300,
	4450,
	4600,
	4750,
	4900,
	5100,
	5300,
	5500,
	5700,
	5900,
	6100,
	6300,
	6500,
	6700,
	6900,
	7125,
	7350,
	7575,
	7800,
	8025,
	8250,
	8475,
	8700,
	8925,
	9150,
	9400,
	9650,
	9900,
	10150,
	10400,
	10650,
	10900,
	11150,
	11400,
	11650,
	11925,
	12200,
	12475,
	12750,
	13025,
	13300,
	13575,
	13850,
	14125,
	14400,
	14700,
	15000,
	15300,
	15600,
	15900,
	16200,
	16500,
	16800,
	17100,
	17400,
	17700,
	18000,
	18300,
	18600,
	18900,
	19250,
}
local num_defined_levels = #experience_levels
local total_defined_experience = 0

for i = 1, num_defined_levels do
	total_defined_experience = total_defined_experience + experience_levels[i]
end

ExperienceSettings = ExperienceSettings or {}

ExperienceSettings.get_versus_profile_experience = function ()
	local versus_interface = Managers.backend:get_interface("versus")

	return versus_interface:get_profile_data("experience") or 0
end

ExperienceSettings.get_versus_profile_level_from_experience = function (experience)
	experience = experience or 0

	assert(experience >= 0, "Negative XP!??")

	local exp_total = 0
	local level = 0
	local progress = 0
	local experience_into_level = 0
	local previous_exp_total = 0

	if experience >= total_defined_experience then
		local required_experience = experience_levels[num_defined_levels]
		local total_experience = total_defined_experience

		level = num_defined_levels

		while total_experience < experience do
			total_experience = total_experience + required_experience
			level = level + 1
		end

		experience_into_level = total_experience - experience
		progress = experience_into_level / total_experience

		return level, progress, experience_into_level
	end

	for i = 1, num_defined_levels do
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
