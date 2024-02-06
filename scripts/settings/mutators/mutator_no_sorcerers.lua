-- chunkname: @scripts/settings/mutators/mutator_no_sorcerers.lua

local ai_tweak_update_rate = 1
local conversion_table = {
	chaos_corruptor_sorcerer = "chaos_warrior",
	chaos_vortex_sorcerer = "chaos_warrior",
}
local ai_tweak_spawn_table = {
	chaos_warrior = function (unit, blackboard)
		if blackboard.spawn_category == "specials_pacing" or blackboard.spawn_category == "spawn_one" or blackboard.spawn_category == "raw_spawner" then
			return true
		end
	end,
}
local ai_tweak_update_table = {
	chaos_warrior = function (unit, blackboard)
		if not ALIVE[unit] then
			return true
		end

		if blackboard.target_unit then
			blackboard.goal_destination = nil

			return false
		end

		local target = PerceptionUtils.pick_closest_target_infinte_range(unit, blackboard, blackboard.breed)

		if target then
			blackboard.goal_destination = Vector3Box(POSITION_LOOKUP[target])
		end

		return false
	end,
}

return {
	hide_from_player_ui = true,
	server_start_function = function (context, data)
		data.check_at = 0
		data.processed_units = {}
	end,
	update_conflict_settings = function (context, data)
		local function convert_breeds(breeds)
			local new_breeds = {}

			for _, breed in ipairs(breeds) do
				new_breeds[#new_breeds + 1] = conversion_table[breed] or breed
			end

			return new_breeds
		end

		if CurrentSpecialsSettings.breeds then
			CurrentSpecialsSettings.breeds = convert_breeds(CurrentSpecialsSettings.breeds)
		end

		if CurrentSpecialsSettings.rush_intervention then
			CurrentSpecialsSettings.rush_intervention.breeds = convert_breeds(CurrentSpecialsSettings.rush_intervention.breeds)
		end

		if CurrentSpecialsSettings.speed_running_intervention then
			CurrentSpecialsSettings.speed_running_intervention.breeds = convert_breeds(CurrentSpecialsSettings.speed_running_intervention.breeds)
		end
	end,
	post_process_terror_event = function (context, data, elements)
		for index, element in ipairs(elements) do
			if element.breed_name then
				local cloned_element

				if type(element.breed_name) == "string" then
					local different_breed = conversion_table[element.breed_name]

					if different_breed then
						cloned_element = table.clone(element)
						cloned_element.breed_name = different_breed
					end
				else
					local cloned_breed_name

					for breed_name_index, breed_name in ipairs(element.breed_name) do
						local different_breed = conversion_table[breed_name]

						if different_breed then
							cloned_element = cloned_element or table.clone(element)
							cloned_breed_name = cloned_breed_name or table.clone(element.breed_name)
							cloned_breed_name[breed_name_index] = different_breed
						end
					end

					if cloned_breed_name then
						cloned_element.breed_name = cloned_breed_name
					end
				end

				if cloned_element then
					elements[index] = cloned_element
				end
			end
		end
	end,
	server_ai_spawned_function = function (context, data, spawned_unit)
		local blackboard = BLACKBOARDS[spawned_unit]
		local breed = blackboard and blackboard.breed.name

		if ai_tweak_spawn_table[breed] then
			local process = ai_tweak_spawn_table[breed](spawned_unit, blackboard)

			if process then
				data.processed_units[#data.processed_units + 1] = spawned_unit
			end
		end
	end,
	server_update_function = function (context, data)
		local t = Managers.time:time("game")

		if t > data.check_at then
			for i = #data.processed_units, 1, -1 do
				local unit = data.processed_units[i]
				local blackboard = BLACKBOARDS[unit]
				local done = blackboard and ai_tweak_update_table[blackboard.breed.name](unit, blackboard)

				if blackboard == nil or done then
					table.swap_delete(data.processed_units, i)
				end
			end

			data.check_at = t + ai_tweak_update_rate
		end
	end,
	get_terror_event_tags = function (context, data, terror_event_tags)
		terror_event_tags[#terror_event_tags + 1] = DeusTerrorEventTags.NO_SORCERERS
	end,
}
