return {
	description = "description_mutator_geheimnisnacht_2021_hard_mode",
	display_name = "display_name_mutator_geheimnisnacht_2021_hard_mode",
	icon = "mutator_icon_geheimnisnacht_2021_difficulty",
	server_ai_spawned_function = function (context, data, spawned_unit)
		data.enemies_to_be_buffed[#data.enemies_to_be_buffed + 1] = spawned_unit
	end,
	server_stop_function = function (context, data, is_destroy)
		local hero_side = Managers.state.side:get_side_from_name("heroes")
		local spawned_enemies = hero_side:enemy_units()
		local num_enemies = #spawned_enemies

		for i = 1, num_enemies, 1 do
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
	end,
	client_stop_function = function (context, data, is_destroy)
		local hero_side = Managers.state.side:get_side_from_name("heroes")
		local spawned_enemies = hero_side:enemy_units()
		local num_enemies = #spawned_enemies

		for i = 1, num_enemies, 1 do
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
	end,
	server_start_function = function (context, data)
		local hero_side = Managers.state.side:get_side_from_name("heroes")
		local spawned_enemies = hero_side:enemy_units()
		local num_enemies = #spawned_enemies
		local buff_system = Managers.state.entity:system("buff_system")
		data.enemies_to_be_buffed = {}

		for i = 1, num_enemies, 1 do
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
	end,
	server_update_function = function (context, data, dt, t)
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
}
