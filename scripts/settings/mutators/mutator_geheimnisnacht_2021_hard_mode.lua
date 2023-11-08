local possible_grudge_marks = {
	chaos_warrior = {
		chance = 0.15,
		base_grudgemark_name = "elite_base",
		names = {
			"shockwave",
			"ignore_death_aura"
		}
	}
}
local mutator = {
	description = "description_mutator_geheimnisnacht_2021_hard_mode",
	display_name = "display_name_mutator_geheimnisnacht_2021_hard_mode",
	icon = "mutator_icon_geheimnisnacht_2021_difficulty"
}

mutator.server_ai_spawned_function = function (context, data, spawned_unit)
	data.enemies_to_be_buffed[#data.enemies_to_be_buffed + 1] = spawned_unit
end

mutator.server_stop_function = function (context, data, is_destroy)
	if not is_destroy then
		Managers.telemetry_events:geheimnisnacht_hard_mode_toggled(false)
	end

	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local spawned_enemies = hero_side:enemy_units()
	local num_enemies = #spawned_enemies

	for i = 1, num_enemies do
		local unit = spawned_enemies[i]

		if ALIVE[unit] then
			local buff_ext = ScriptUnit.has_extension(unit, "buff_system")

			if buff_ext then
				local has_buff = buff_ext:get_buff_type("geheimnisnacht_2021_event_health")

				if has_buff then
					buff_ext:remove_buff(has_buff.id)
				end
			end
		end
	end
end

mutator.client_start_function = function (context, data)
	local pop_chat = true
	local message = Localize("system_chat_geheimnisnacht_2021_hard_mode_on")

	Managers.chat:add_local_system_message(1, message, pop_chat)
end

mutator.client_stop_function = function (context, data, is_destroy)
	if not is_destroy then
		local pop_chat = true
		local message = Localize("system_chat_geheimnisnacht_2021_hard_mode_off")

		Managers.chat:add_local_system_message(1, message, pop_chat)
	end

	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local spawned_enemies = hero_side:enemy_units()
	local num_enemies = #spawned_enemies

	for i = 1, num_enemies do
		local unit = spawned_enemies[i]

		if ALIVE[unit] then
			local buff_ext = ScriptUnit.has_extension(unit, "buff_system")

			if buff_ext then
				local has_buff = buff_ext:get_buff_type("geheimnisnacht_2021_event_health")

				if has_buff then
					buff_ext:remove_buff(has_buff.id)
				end
			end
		end
	end
end

mutator.server_start_function = function (context, data)
	Managers.telemetry_events:geheimnisnacht_hard_mode_toggled(true)

	local hero_side = Managers.state.side:get_side_from_name("heroes")
	local spawned_enemies = hero_side:enemy_units()
	local num_enemies = #spawned_enemies
	local buff_system = Managers.state.entity:system("buff_system")
	data.enemies_to_be_buffed = {}

	for i = 1, num_enemies do
		local unit = spawned_enemies[i]

		if ALIVE[unit] then
			local buff_ext = ScriptUnit.has_extension(unit, "buff_system")

			if buff_ext then
				local has_buff = buff_ext:get_buff_type("geheimnisnacht_2021_event_health")

				if buff_system and not has_buff then
					buff_system:add_buff(unit, "geheimnisnacht_2021_event_horde_buff", unit)
				end
			end
		end
	end
end

mutator.server_update_function = function (context, data, dt, t)
	local enemies_to_be_buffed = data.enemies_to_be_buffed

	if table.size(enemies_to_be_buffed) == 0 then
		return
	end

	local network_manager = Managers.state.network
	local buff_system = Managers.state.entity:system("buff_system")

	for i = #enemies_to_be_buffed, 1, -1 do
		local enemy_unit = enemies_to_be_buffed[i]
		local unit_id = network_manager:unit_game_object_id(enemy_unit)

		if unit_id and buff_system then
			buff_system:add_buff(enemy_unit, "geheimnisnacht_2021_event_horde_buff", enemy_unit)
			table.swap_delete(enemies_to_be_buffed, i)
		end
	end
end

mutator.post_ai_spawned_function = function (mutator_context, mutator_data, breed, optional_data)
	local breed_name = breed.name
	local grudge_data = possible_grudge_marks[breed_name]

	if grudge_data then
		local state_by_breed = mutator_data.grudge_mark_state_by_breed or {}
		mutator_data.grudge_mark_state_by_breed = state_by_breed
		local success = nil
		local chance = optional_data.spawn_chance or grudge_data.chance
		local breed_state = state_by_breed[breed_name]
		success, breed_state = PseudoRandomDistribution.flip_coin(breed_state, chance)
		state_by_breed[breed_name] = breed_state

		if success then
			local names = grudge_data.names
			local grudge_mark_name = names[math.random(1, #names)]
			local list = optional_data.enhancements or {}
			local base_grudgemark_name = grudge_data.base_grudgemark_name

			if base_grudgemark_name then
				list[#list + 1] = BreedEnhancements[base_grudgemark_name]
			end

			list[#list + 1] = BreedEnhancements[grudge_mark_name]
			optional_data.enhancements = list
		end
	end
end

return mutator
