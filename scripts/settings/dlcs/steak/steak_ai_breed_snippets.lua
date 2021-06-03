AiBreedSnippets = AiBreedSnippets or {}

AiBreedSnippets.on_beastmen_minotaur_spawn = function (unit, blackboard)
	local t = Managers.time:time("game")
	blackboard.charge_astar_data = {
		astar_timer = t
	}
	blackboard.num_charges_targeting_target = 0
	blackboard.target_is_charged = false
	blackboard.aggro_list = {}
	local allowed_layers = {
		planks = 1,
		bot_ratling_gun_fire = 1,
		doors = 1,
		destructible_wall = 0,
		bot_poison_wind = 1,
		temporary_wall = 0,
		fire_grenade = 1
	}
	local navtag_layer_cost_table = GwNavTagLayerCostTable.create()

	table.merge(allowed_layers, NAV_TAG_VOLUME_LAYER_COST_AI)
	AiUtils.initialize_cost_table(navtag_layer_cost_table, allowed_layers)

	local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table)

	local charge_traverse_logic = GwNavTraverseLogic.create(blackboard.nav_world, nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(charge_traverse_logic, navtag_layer_cost_table)

	blackboard.charge_nav_cost_map_cost_table = nav_cost_map_cost_table
	blackboard.charge_traverse_logic = charge_traverse_logic
	blackboard.charge_navtag_layer_cost_table = navtag_layer_cost_table
	blackboard.aggro_list = {}
	blackboard.fling_skaven_timer = 0
	blackboard.next_move_check = 0
	blackboard.is_valid_target_func = GenericStatusExtension.is_ogre_target
	local conflict_director = Managers.state.conflict
	local breed = blackboard.breed
	local ai_simple = ScriptUnit.extension(unit, "ai_system")

	ai_simple:set_perception(breed.perception, breed.target_selection_angry)
	conflict_director:add_angry_boss(1, blackboard)

	blackboard.is_angry = true
	local side = Managers.state.side.side_by_unit[unit]
	local enemy_player_and_bot_units = side.ENEMY_PLAYER_AND_BOT_UNITS
	local weights = breed.perception_weights
	local best_score = 0
	local best_enemy = nil

	for i = 1, #enemy_player_and_bot_units, 1 do
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
	if blackboard.charge_astar_data and not blackboard.charge_state and Unit.alive(blackboard.target_unit) then
		local data = blackboard.charge_astar_data
		local astar = data.astar

		if astar then
			local done = GwNavAStar.processing_finished(astar)

			if done then
				local path_found = GwNavAStar.path_found(astar)

				if path_found then
					blackboard.has_valid_astar_path = true
				else
					blackboard.has_valid_astar_path = false
				end

				GwNavAStar.destroy(astar)

				data.astar = nil
				data.astar_timer = t + 1
			end
		elseif data.astar_timer < t then
			local nav_world = blackboard.nav_world
			local target_position = POSITION_LOOKUP[blackboard.target_unit]
			local success, z = GwNavQueries.triangle_from_position(nav_world, target_position, 1, 1)

			if success then
				local wanted_position = Vector3(target_position[1], target_position[2], z)
				local width = 7
				local new_astar = GwNavAStar.create(nav_world)

				GwNavAStar.start_with_propagation_box(new_astar, nav_world, POSITION_LOOKUP[unit], wanted_position, width, blackboard.charge_traverse_logic)

				data.astar = new_astar
				data.astar_timer = t + 1
			else
				data.astar_timer = t + 0.1
			end
		end
	end
end

AiBreedSnippets.on_beastmen_minotaur_death = function (unit, blackboard, t)
	local astar_data = blackboard.charge_astar_data

	if astar_data and astar_data.astar then
		local astar = astar_data.astar

		if not GwNavAStar.processing_finished(astar) then
			GwNavAStar.cancel(astar)
			GwNavAStar.destroy(astar)
		else
			GwNavAStar.destroy(astar)
		end
	end

	blackboard.charge_astar_data = nil

	if blackboard.charge_navtag_layer_cost_table then
		GwNavTagLayerCostTable.destroy(blackboard.charge_navtag_layer_cost_table)

		blackboard.charge_navtag_layer_cost_table = nil
	end

	if blackboard.charge_nav_cost_map_cost_table then
		GwNavCostMap.destroy_tag_cost_table(blackboard.charge_nav_cost_map_cost_table)

		blackboard.charge_nav_cost_map_cost_table = nil
	end

	if blackboard.charge_traverse_logic then
		GwNavTraverseLogic.destroy(blackboard.charge_traverse_logic)

		blackboard.charge_traverse_logic = nil
	end

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

AiBreedSnippets.on_beastmen_minotaur_despawn = function (unit, blackboard, t)
	local astar_data = blackboard.charge_astar_data

	if astar_data and astar_data.astar then
		local astar = astar_data.astar

		if not GwNavAStar.processing_finished(astar) then
			GwNavAStar.cancel(astar)
			GwNavAStar.destroy(astar)
		else
			GwNavAStar.destroy(astar)
		end
	end

	blackboard.charge_astar_data = nil

	if blackboard.charge_navtag_layer_cost_table then
		GwNavTagLayerCostTable.destroy(blackboard.charge_navtag_layer_cost_table)

		blackboard.charge_navtag_layer_cost_table = nil
	end

	if blackboard.charge_nav_cost_map_cost_table then
		GwNavCostMap.destroy_tag_cost_table(blackboard.charge_nav_cost_map_cost_table)

		blackboard.charge_nav_cost_map_cost_table = nil
	end

	if blackboard.charge_traverse_logic then
		GwNavTraverseLogic.destroy(blackboard.charge_traverse_logic)

		blackboard.charge_traverse_logic = nil
	end

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

return
