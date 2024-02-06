﻿-- chunkname: @scripts/settings/terror_events/terror_event_utils.lua

require("scripts/settings/grudge_mark_settings")

TerrorEventUtils = {}

local TerrorEventUtils = TerrorEventUtils
local terror_seed = terror_seed or nil

TerrorEventUtils.set_seed = function (seed)
	terror_seed = seed
end

TerrorEventUtils.random = function (...)
	local seed, value = Math.next_random(terror_seed or 0, ...)

	terror_seed = seed

	return value
end

TerrorEventUtils.get_grudge_marked_name = function (breed_name, magic_number)
	local breed = Breeds[breed_name]
	local faction = breed.race
	local name_list = GrudgeMarkedNames[breed_name] or GrudgeMarkedNames[faction]

	fassert(name_list, "%s is not a valid breed, or does not have a valid race set in its breed data", breed_name)

	local index = magic_number % #name_list + 1
	local name = Localize(name_list[index])

	return name
end

TerrorEventUtils.apply_breed_enhancements = function (unit, breed, optional_data)
	local ai_system = Managers.state.entity:system("ai_system")
	local name_index = optional_data.name_index or TerrorEventUtils.random(16384)

	ai_system:set_attribute(unit, "name_index", "grudge_marked", name_index)

	local buff_system = Managers.state.entity:system("buff_system")
	local enhancements = optional_data.enhancements
	local is_illusion = table.find_by_key(enhancements, "name", "intangible_mirror") ~= nil

	for i = 1, #enhancements do
		local enhancement_data = enhancements[i]

		if not enhancement_data.no_attribute then
			ai_system:set_attribute(unit, enhancement_data.name, "breed_enhancements", true)
		end

		if not is_illusion or enhancement_data.name == "mirror_base" or enhancement_data.name == "intangible_mirror" then
			for i = 1, #enhancement_data do
				local buff_name = enhancement_data[i]

				buff_system:add_buff(unit, buff_name, unit, true)
			end
		end
	end
end

TerrorEventUtils.generate_enhanced_breed = function (num_enhancements, breed_name, enhancement_set)
	enhancement_set = enhancement_set or BossGrudgeMarks

	local t = {}
	local result_list = {
		BreedEnhancements.base,
	}

	for name, _ in pairs(enhancement_set) do
		t[#t + 1] = name
	end

	local banned_breed_enhancements = BreedEnhancementBannedBreeds[breed_name]

	if banned_breed_enhancements then
		for i = #t, 1, -1 do
			local enhancement_name = t[i]

			if banned_breed_enhancements[enhancement_name] then
				table.swap_delete(t, i)
			end
		end
	end

	for i = 1, num_enhancements do
		local index = TerrorEventUtils.random(#t)

		if index <= 0 then
			break
		end

		local name = t[index]
		local enhancement_data = BreedEnhancements[name]

		table.swap_delete(t, index)

		local exclusion_list = BreedEnhancementExclusionList[enhancement_data.name]

		if exclusion_list then
			for i = #t, 1, -1 do
				local enhancement_name = t[i]

				if exclusion_list[enhancement_name] then
					table.swap_delete(t, i)
				end
			end
		end

		result_list[#result_list + 1] = enhancement_data
	end

	return result_list
end

TerrorEventUtils.generate_enhanced_breed_from_set = function (enhancement_set)
	local list = {}
	local BreedEnhancements = BreedEnhancements

	for name, value in pairs(enhancement_set) do
		if value and BreedEnhancements[name] then
			local enhancement = BreedEnhancements[name]

			list[#list + 1] = enhancement
		end
	end

	if #list > 0 then
		list[#list + 1] = BreedEnhancements.base

		return list
	end

	return nil
end

TerrorEventUtils.add_enhancements_to_spawn_data = function (optional_data, num_enhancements, breed_name, enhancement_set)
	if num_enhancements > 0 then
		optional_data = optional_data or {}
		optional_data.enhancements = TerrorEventUtils.generate_enhanced_breed(num_enhancements, breed_name, enhancement_set or BossGrudgeMarks)
	end

	return optional_data
end

TerrorEventUtils.add_enhancements_for_difficulty = function (optional_data, difficulty, breed_name, event, difficulty_tweak, enhancement_set)
	optional_data = optional_data or {}

	local num_enhancements = DifficultyTweak.converters.closest_tweak_match(difficulty, difficulty_tweak, BREED_ENHANCEMENTS_PER_DIFFICULTY) or 0

	if num_enhancements > 0 then
		enhancement_set = enhancement_set or BossGrudgeMarks

		return TerrorEventUtils.add_enhancements_to_spawn_data(optional_data, num_enhancements, breed_name, enhancement_set)
	end

	return optional_data
end
