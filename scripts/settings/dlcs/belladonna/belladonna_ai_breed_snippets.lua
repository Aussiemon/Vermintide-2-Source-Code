-- chunkname: @scripts/settings/dlcs/belladonna/belladonna_ai_breed_snippets.lua

AiBreedSnippets = AiBreedSnippets or {}

AiBreedSnippets.on_beastmen_bestigor_spawn = function (unit, blackboard)
	local t = Managers.time:time("game")

	blackboard.charge_astar_timer = t
	blackboard.num_charges_targeting_target = 0
	blackboard.target_is_charged = false
	blackboard.aggro_list = {}

	local allowed_layers = {
		bot_poison_wind = 1,
		bot_ratling_gun_fire = 1,
		doors = 1,
		fire_grenade = 1,
		planks = 1,
	}
	local navigation_extension = blackboard.navigation_extension
	local navtag_layer_cost_table = navigation_extension:get_navtag_layer_cost_table("charge")

	table.merge(allowed_layers, NAV_TAG_VOLUME_LAYER_COST_AI)
	AiUtils.initialize_cost_table(navtag_layer_cost_table, allowed_layers)

	local nav_cost_map_cost_table = navigation_extension:nav_cost_map_cost_table("charge")

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table)

	local charge_traverse_logic = navigation_extension:get_reusable_traverse_logic("charge", nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(charge_traverse_logic, navtag_layer_cost_table)
end

AiBreedSnippets.on_beastmen_bestigor_update = function (unit, blackboard, t)
	local traverse_logic
	local nav_cost_map_cost_table = blackboard.navigation_extension:nav_cost_map_cost_table("charge")

	traverse_logic = blackboard.navigation_extension:get_reusable_traverse_logic("charge", nav_cost_map_cost_table)

	if traverse_logic and blackboard.charge_astar_timer and not blackboard.charge_state and Unit.alive(blackboard.target_unit) then
		local astar = blackboard.navigation_extension:get_reusable_astar("charge", true)

		if astar then
			local done = GwNavAStar.processing_finished(astar)

			if done then
				local path_found = GwNavAStar.path_found(astar)

				if path_found then
					blackboard.has_valid_astar_path = true
				else
					blackboard.has_valid_astar_path = false
				end

				blackboard.navigation_extension:destroy_reusable_astar("charge")

				blackboard.charge_astar_timer = t + 1
			end
		elseif t > blackboard.charge_astar_timer then
			local nav_world = blackboard.nav_world
			local target_position = Unit.local_position(blackboard.target_unit, 0)
			local success, z = GwNavQueries.triangle_from_position(nav_world, target_position, 1, 1)

			if success then
				local wanted_position = Vector3(target_position[1], target_position[2], z)
				local width = 7
				local new_astar = blackboard.navigation_extension:get_reusable_astar("charge")

				GwNavAStar.start_with_propagation_box(new_astar, nav_world, Unit.local_position(unit, 0), wanted_position, width, traverse_logic)

				blackboard.charge_astar_timer = t + 1
			else
				blackboard.charge_astar_timer = t + 0.1
			end
		end
	end

	if Unit.alive(blackboard.target_unit) then
		local target_unit_status_extension = ScriptUnit.has_extension(blackboard.target_unit, "status_system")

		if target_unit_status_extension then
			local num_charges_targeting_player = target_unit_status_extension.num_charges_targeting_player or 0

			blackboard.num_charges_targeting_target = num_charges_targeting_player
			blackboard.target_is_charged = target_unit_status_extension:is_charged()
		end
	end
end

AiBreedSnippets.on_beastmen_standard_bearer_spawn = function (unit, blackboard)
	blackboard.switching_weapons = 1

	local buff_extension = ScriptUnit.extension(unit, "buff_system")

	blackboard.buff_extension = buff_extension

	if blackboard.spawn_category ~= "patrol" then
		WwiseUtils.trigger_unit_event(blackboard.world, "Play_enemy_beastmen_standar_chanting_loop", unit, 0)

		blackboard.triggered_standard_chanting_sound = true
	end

	if blackboard.spawn_type ~= "terror_event" and blackboard.spawn_category ~= "patrol" then
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")

		ai_slot_system:do_slot_search(unit, true)

		local num_columns = 3
		local rot = Unit.local_rotation(unit, 0)
		local conflict_director = Managers.state.conflict
		local nav_world = conflict_director.nav_world
		local bearer_position = Unit.world_position(unit, 0)
		local standard_bearer_spawn_list = BreedTweaks.standard_bearer_spawn_list
		local spawn_list = Managers.state.difficulty:get_difficulty_value_from_table(standard_bearer_spawn_list)
		local level_transition_handler = Managers.level_transition_handler
		local enemy_package_loader = level_transition_handler.enemy_package_loader
		local startup_breeds = enemy_package_loader:get_startup_breeds()
		local replacement_breeds = BreedTweaks.standard_bearer_spawn_list_replacements
		local new_spawn_list = {}

		for i = 1, #spawn_list do
			local breed_name = spawn_list[i]

			if not startup_breeds[breed_name] then
				local replacement
				local check_breeds = false

				for j = 1, #replacement_breeds do
					local replacement_breed = replacement_breeds[j]

					if check_breeds and startup_breeds[replacement_breed] then
						replacement = replacement_breed

						break
					elseif replacement_breed == breed_name then
						check_breeds = true
					end
				end

				if replacement then
					new_spawn_list[#new_spawn_list + 1] = replacement
				end
			else
				new_spawn_list[#new_spawn_list + 1] = breed_name
			end
		end

		local num_to_spawn = #new_spawn_list
		local above, below = 1, 1

		for i = 1, num_to_spawn do
			local offset = Vector3(-num_columns / 2 + i % num_columns, -num_columns / 2 + math.floor(i / num_columns), 0)
			local spawn_pos = bearer_position + offset * 2
			local spawn_pos_on_navmesh = LocomotionUtils.pos_on_mesh(nav_world, spawn_pos, above, below)
			local breed = Breeds[new_spawn_list[i]]
			local optional_data

			if spawn_pos_on_navmesh then
				conflict_director:spawn_queued_unit(breed, Vector3Box(spawn_pos_on_navmesh), QuaternionBox(rot), "hidden_spawn", nil, "horde_hidden", optional_data)
			else
				local horizontal = 1
				local distance_from_border = 0.1
				local clamped_position = GwNavQueries.inside_position_from_outside_position(nav_world, spawn_pos, above, below, horizontal, distance_from_border)

				clamped_position = clamped_position or POSITION_LOOKUP[unit]

				conflict_director:spawn_queued_unit(breed, Vector3Box(clamped_position), QuaternionBox(rot), "hidden_spawn", nil, "horde_hidden", optional_data)
			end
		end
	end

	if blackboard.spawn_type == "terror_event" then
		blackboard.ignore_passive_on_patrol = true
	end

	local t = Managers.time:time("game")

	blackboard.plant_standard_astar_timer = t

	local allowed_layers = {
		bot_poison_wind = 1,
		bot_ratling_gun_fire = 1,
		doors = 1,
		fire_grenade = 1,
		planks = 1,
	}
	local navigation_extension = blackboard.navigation_extension
	local navtag_layer_cost_table = navigation_extension:get_navtag_layer_cost_table("plant_standard")

	table.merge(allowed_layers, NAV_TAG_VOLUME_LAYER_COST_AI)
	AiUtils.initialize_cost_table(navtag_layer_cost_table, allowed_layers)

	local nav_cost_map_cost_table = navigation_extension:nav_cost_map_cost_table("plant_standard")

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table)

	local plant_standard_traverse_logic = navigation_extension:get_reusable_traverse_logic("plant_standard", nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(plant_standard_traverse_logic, navtag_layer_cost_table)
end

AiBreedSnippets.on_beastmen_standard_bearer_husk_spawn = function (unit)
	local world = Managers.world:world("level_world")

	WwiseUtils.trigger_unit_event(world, "Play_enemy_beastmen_standar_chanting_loop", unit, 0)
end

AiBreedSnippets.on_beastmen_standard_bearer_update = function (unit, blackboard, t)
	if HEALTH_ALIVE[blackboard.standard_unit] then
		local self_position = Unit.local_position(unit, 0)
		local standard_position = Unit.local_position(blackboard.standard_unit, 0)
		local distance_to_standard = Vector3.distance(self_position, standard_position)

		blackboard.distance_to_standard = distance_to_standard

		if HEALTH_ALIVE[blackboard.target_unit] then
			local target_position = Unit.local_position(blackboard.target_unit, 0)

			blackboard.target_distance_to_standard = Vector3.distance(target_position, standard_position)
		end
	else
		blackboard.distance_to_standard = nil
		blackboard.target_distance_to_standard = nil
	end

	if blackboard.climb_state then
		blackboard.has_valid_astar_path = false
	end

	if blackboard.plant_standard_astar_timer and Unit.alive(blackboard.target_unit) then
		local navigation_extension = blackboard.navigation_extension
		local nav_cost_map_cost_table = navigation_extension:nav_cost_map_cost_table("plant_standard")
		local traverse_logic = navigation_extension:get_reusable_traverse_logic("plant_standard", nav_cost_map_cost_table)
		local astar = navigation_extension:get_reusable_astar("plant_standard", true)

		if astar then
			local done = GwNavAStar.processing_finished(astar)

			if done then
				local path_found = GwNavAStar.path_found(astar)

				if path_found then
					blackboard.has_valid_astar_path = true
				else
					blackboard.has_valid_astar_path = false
				end

				navigation_extension:destroy_reusable_astar("plant_standard")

				blackboard.plant_standard_astar_timer = t + 1
			end
		elseif t > blackboard.plant_standard_astar_timer then
			local nav_world = blackboard.nav_world
			local target_position = Unit.local_position(blackboard.target_unit, 0)
			local success, z = GwNavQueries.triangle_from_position(nav_world, target_position, 1, 1)

			if success then
				local wanted_position = Vector3(target_position[1], target_position[2], z)
				local new_astar = navigation_extension:get_reusable_astar("plant_standard")

				GwNavAStar.start(new_astar, nav_world, Unit.local_position(unit, 0), wanted_position, traverse_logic)

				blackboard.plant_standard_astar_timer = t + 1
			else
				blackboard.plant_standard_astar_timer = t + 0.1
			end
		end
	end
end

AiBreedSnippets.on_beastmen_standard_bearer_death = function (unit, blackboard)
	if blackboard.triggered_standard_chanting_sound then
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Stop_enemy_beastmen_standar_chanting_loop", unit)
	end
end

AiBreedSnippets.on_beastmen_ungor_archer_spawn = function (unit, blackboard)
	blackboard.archer_broadphase_results = {}

	local physics_world = World.get_data(blackboard.world, "physics_world")

	blackboard.physics_world = physics_world

	local t = Managers.time:time("game")

	blackboard.pause_line_of_sight_t = t + Math.random_range(4, 8)
end

AiBreedSnippets.on_beastmen_ungor_archer_death = function (unit, blackboard)
	if blackboard.is_volley_leader then
		local nearby_archers = blackboard.nearby_archers
		local num_nearby_archers = #nearby_archers

		for i = 1, num_nearby_archers do
			local nearby_unit_blackboard = nearby_archers[i]

			if nearby_unit_blackboard then
				nearby_unit_blackboard.volley_target_unit = nil
				nearby_unit_blackboard.has_volley_target = nil
				nearby_unit_blackboard.fire_volley_at_t = nil
			end
		end

		blackboard.is_volley_leader = nil
	end
end
