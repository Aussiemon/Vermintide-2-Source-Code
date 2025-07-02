-- chunkname: @scripts/settings/dlcs/steak/steak_ai_breed_snippets.lua

AiBreedSnippets = AiBreedSnippets or {}

AiBreedSnippets.on_beastmen_minotaur_spawn = function (unit, blackboard)
	local t = Managers.time:time("game")

	blackboard.charge_astar_timer = t
	blackboard.num_charges_targeting_target = 0
	blackboard.target_is_charged = false
	blackboard.aggro_list = {}

	local breed = blackboard.breed
	local allowed_layers = {
		bot_poison_wind = 1,
		bot_ratling_gun_fire = 1,
		destructible_wall = 0,
		doors = 1,
		fire_grenade = 1,
		planks = 1,
		temporary_wall = 0,
	}
	local navigation_extension = blackboard.navigation_extension
	local navtag_layer_cost_table = navigation_extension:get_navtag_layer_cost_table("charge")

	table.merge(allowed_layers, NAV_TAG_VOLUME_LAYER_COST_AI)
	AiUtils.initialize_cost_table(navtag_layer_cost_table, allowed_layers)

	local nav_cost_map_cost_table = navigation_extension:nav_cost_map_cost_table("charge")

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table)

	local charge_traverse_logic = navigation_extension:get_reusable_traverse_logic("charge", nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(charge_traverse_logic, navtag_layer_cost_table)

	blackboard.aggro_list = {}
	blackboard.fling_skaven_timer = 0
	blackboard.next_move_check = 0
	blackboard.is_valid_target_func = GenericStatusExtension.is_ogre_target

	local conflict_director = Managers.state.conflict
	local ai_simple = ScriptUnit.extension(unit, "ai_system")

	ai_simple:set_perception(breed.perception, breed.target_selection_angry)
	conflict_director:add_angry_boss(1, blackboard)

	blackboard.is_angry = true

	local side = Managers.state.side.side_by_unit[unit]
	local enemy_player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local weights = breed.perception_weights
	local best_score = 0
	local best_enemy

	for i = 1, #enemy_player_and_bot_units do
		local enemy_unit = enemy_player_and_bot_units[i]
		local enemy_pos = POSITION_LOOKUP[enemy_unit]
		local pos = POSITION_LOOKUP[unit]
		local dist = Vector3.distance(pos, enemy_pos)

		if dist < breed.detection_radius then
			local inv_radius = math.clamp(1 - dist / weights.max_distance, 0, 1)
			local score = inv_radius * inv_radius * weights.distance_weight

			if best_score < score then
				best_score = score
				best_enemy = enemy_unit
			end
		end
	end

	if best_enemy then
		local aggro_list = blackboard.aggro_list

		aggro_list[best_enemy] = 50
	end

	conflict_director:freeze_intensity_decay(10)
	conflict_director:add_unit_to_bosses(unit)
end

AiBreedSnippets.on_beastmen_minotaur_update = function (unit, blackboard, t)
	local nav_cost_map_cost_table = blackboard.navigation_extension:nav_cost_map_cost_table("charge")
	local traverse_logic = blackboard.navigation_extension:get_reusable_traverse_logic("charge", nav_cost_map_cost_table)

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
end

AiBreedSnippets.on_beastmen_minotaur_death = function (unit, blackboard, t)
	print("minotaur died!")

	if not blackboard.rewarded_boss_loot then
		AiBreedSnippets.reward_boss_kill_loot(unit, blackboard)
	end

	local conflict_director = Managers.state.conflict

	if blackboard.is_angry then
		conflict_director:add_angry_boss(-1)
	end

	conflict_director:freeze_intensity_decay(1)
	conflict_director:remove_unit_from_bosses(unit)
end
