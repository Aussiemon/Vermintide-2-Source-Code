local function on_marked_enemy_killed(dialogue_event, killer_unit)
	if HEALTH_ALIVE[killer_unit] then
		local killed_by_player = Managers.player:is_player_unit(killer_unit)

		if killed_by_player then
			local dialogue_input = ScriptUnit.extension_input(killer_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_dialogue_event(dialogue_event, event_data)
		end
	end
end

return function (display_name, description, icon, buff, difficulty_data, markable_enemies, should_spawn_func)
	return {
		marked_enemy_killed_dialogue_event = "curse_killed_marked_enemy",
		display_name = display_name,
		description = description,
		icon = icon,
		server_start_function = function (context, data)
			local difficulty = Managers.state.difficulty:get_difficulty()
			data.max_marked_enemies = difficulty_data[difficulty].max_marked_enemies
			data.mark_chance = difficulty_data[difficulty].mark_chance
			data.enemies_to_be_marked = {}
			data.marked_enemies = {}
			data.seed = Managers.mechanism:get_level_seed("mutator")
		end,
		can_enemy_be_marked = function (context, data, unit)
			local marked_enemies_amount = #data.marked_enemies

			if marked_enemies_amount < data.max_marked_enemies then
				local breed = Unit.get_data(unit, "breed")
				local breed_name = breed.name

				if markable_enemies[breed_name] then
					local random = nil
					data.seed, random = Math.next_random(data.seed)

					if random <= data.mark_chance then
						if should_spawn_func then
							return should_spawn_func()
						else
							return true
						end
					end
				end
			end

			return false
		end,
		mark_enemy = function (context, data, unit)
			local buff_system = Managers.state.entity:system("buff_system")

			if buff_system then
				buff_system:add_buff(unit, buff, unit)

				data.marked_enemies[#data.marked_enemies + 1] = unit
			end
		end,
		update_marked_enemies = function (context, data)
			local marked_enemies = data.marked_enemies

			if #marked_enemies == 0 then
				return
			end

			for i = #marked_enemies, 1, -1 do
				local enemy_unit = marked_enemies[i]
				local is_dead = not HEALTH_ALIVE[enemy_unit]

				if is_dead then
					table.swap_delete(marked_enemies, i)
				end
			end
		end,
		update_spawned_enemies = function (context, data)
			local enemies_to_be_marked = data.enemies_to_be_marked

			if table.size(enemies_to_be_marked) == 0 then
				return
			end

			local network_manager = Managers.state.network

			for i = #enemies_to_be_marked, 1, -1 do
				local enemy_unit = enemies_to_be_marked[i]
				local unit_id = network_manager:unit_game_object_id(enemy_unit)

				if unit_id then
					data.template.mark_enemy(context, data, enemy_unit)
					table.swap_delete(enemies_to_be_marked, i)
				end
			end
		end,
		server_update_function = function (context, data, dt, t)
			data.template.update_marked_enemies(context, data)
			data.template.update_spawned_enemies(context, data)
		end,
		server_ai_spawned_function = function (context, data, spawned_unit)
			if data.template.can_enemy_be_marked(context, data, spawned_unit) then
				data.enemies_to_be_marked[#data.enemies_to_be_marked + 1] = spawned_unit
			end
		end,
		server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data)
			local index = table.index_of(data.marked_enemies, killed_unit)
			local was_marked = index ~= -1

			if was_marked then
				on_marked_enemy_killed(data.template.marked_enemy_killed_dialogue_event, killer_unit)
				table.swap_delete(data.marked_enemies, index)
			end
		end
	}
end
