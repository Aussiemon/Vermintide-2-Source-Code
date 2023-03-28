local conflict_settings = {
	deus_skaven_chaos = {
		breed2 = "deus_chaos",
		breed1 = "deus_skaven"
	},
	deus_skaven_beastmen = {
		breed2 = "deus_beastmen",
		breed1 = "deus_skaven"
	}
}
local EVENT_ACTIVATION_DISTANCE = 45
local EVENT_WEIGHTS = {
	{
		run_progress = 0,
		weights = {
			event_boss = 0,
			nothing = 30,
			event_patrol = 70
		}
	},
	{
		run_progress = 0.4,
		weights = {
			event_boss = 20,
			nothing = 10,
			event_patrol = 70
		}
	}
}
local sequences = {
	SIGNATURE = {
		{
			{
				breeds = "a",
				mutators = {
					"no_roamers"
				}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				peak = true,
				breeds = "a",
				mutators = {}
			},
			{
				breeds = "a",
				mutators = {
					"no_roamers"
				}
			},
			{
				breeds = "b",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "b",
				mutators = {
					"easier_packs"
				}
			},
			{
				peak = true,
				breeds = "b",
				mutators = {}
			},
			{
				breeds = "both",
				mutators = {}
			},
			{
				breeds = "both",
				mutators = {}
			}
		}
	},
	TRAVEL = {
		{
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "a",
				mutators = {}
			},
			{
				peak = true,
				breeds = "a",
				mutators = {}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "b",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "b",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "b",
				mutators = {}
			},
			{
				peak = true,
				breeds = "both",
				mutators = {}
			},
			{
				breeds = "both",
				mutators = {
					"easier_packs"
				}
			}
		},
		{
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "a",
				mutators = {}
			},
			{
				peak = true,
				breeds = "a",
				mutators = {}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			},
			{
				breeds = "a",
				mutators = {}
			},
			{
				peak = true,
				breeds = "a",
				mutators = {}
			},
			{
				breeds = "a",
				mutators = {
					"easier_packs"
				}
			}
		}
	}
}
local EVENT_DISTANCE_THRESHOLD = 40

local function get_random_from_weighted_table(seed, weighted_table)
	local total_weight_sum = 0

	for key, weight in pairs(weighted_table) do
		total_weight_sum = total_weight_sum + weight
	end

	local _, random = Math.next_random(seed, 0, total_weight_sum * 100)
	local current_weight_sum = 0

	for key, weight in pairs(weighted_table) do
		current_weight_sum = current_weight_sum + weight * 100

		if random <= current_weight_sum then
			return key
		end
	end

	return nil
end

local Sequencer = {}

Sequencer.apply_travel_dist_to_sequence_with_peaks_and_events = function (sequence, total_travel_dist, peaks, possible_events, event_weight_table, seed)
	local sequence_with_travel_dist = table.clone(sequence)
	local zone_dist_delta = total_travel_dist / (#sequence + 1)
	local dist = 0

	for _, sequence_node in ipairs(sequence_with_travel_dist) do
		sequence_node.travel_dist = dist
		dist = dist + zone_dist_delta
	end

	for _, peak in ipairs(peaks) do
		local closest_peak = nil

		for i, sequence_node in ipairs(sequence_with_travel_dist) do
			if sequence_node.peak then
				if not closest_peak then
					closest_peak = sequence_node
				else
					local new_travel_dist_delta = math.abs(sequence_node.travel_dist - peak)
					local old_travel_dist_delta = math.abs(closest_peak.travel_dist - peak)

					if new_travel_dist_delta < old_travel_dist_delta then
						closest_peak = sequence_node
					end
				end
			end
		end

		closest_peak.travel_dist = peak
		closest_peak.fixed_peak = true
	end

	local best_events, node_for_best_event, best_distance = nil

	for i, sequence_node in ipairs(sequence_with_travel_dist) do
		if sequence_node.peak and not sequence_node.fixed_peak then
			for _, possible_event in ipairs(possible_events) do
				local distance = math.abs(possible_event.travel_dist - EVENT_ACTIVATION_DISTANCE - sequence_node.travel_dist)

				if not best_distance then
					best_events = {
						possible_event
					}
					node_for_best_event = sequence_node
					best_distance = distance
				else
					local diff = math.abs(distance - best_distance)

					if diff < EVENT_DISTANCE_THRESHOLD then
						best_events[#best_events + 1] = possible_event
					elseif distance < best_distance then
						best_events = {
							possible_event
						}
						node_for_best_event = sequence_node
						best_distance = distance
					end
				end
			end
		end
	end

	local best_event = nil

	if best_events then
		local weighted_table = {}

		for _, event in ipairs(best_events) do
			weighted_table[event.kind] = event_weight_table[event.kind]
		end

		weighted_table.nothing = event_weight_table.nothing
		local event_kind = get_random_from_weighted_table(seed, weighted_table)

		if event_kind ~= "nothing" then
			for _, event in ipairs(best_events) do
				if event.kind == event_kind then
					best_event = event

					break
				end
			end

			node_for_best_event.travel_dist = best_event.travel_dist - EVENT_ACTIVATION_DISTANCE
		end
	end

	local function normalize(start_index, end_index)
		local offset = end_index - start_index
		local early_travel_dist = sequence_with_travel_dist[start_index].travel_dist
		local current_travel_dist = sequence_with_travel_dist[end_index].travel_dist

		for normalize_index = start_index + 1, end_index - 1 do
			local lerp_val = (normalize_index - start_index) / offset
			sequence_with_travel_dist[normalize_index].travel_dist = math.lerp(early_travel_dist, current_travel_dist, lerp_val)
		end
	end

	local early_index = 1

	for current_index = 1, #sequence_with_travel_dist do
		if sequence_with_travel_dist[current_index].peak then
			normalize(early_index, current_index)

			early_index = current_index
		end
	end

	normalize(early_index, #sequence_with_travel_dist)

	return sequence_with_travel_dist, best_event
end

Sequencer.tweak_zones_with_sequence = function (breed_a, breed_b, both_breeds, zones, num_zones, sequence_with_travel_dist)
	local seek_start_index = 1

	for index, sequence_node in ipairs(sequence_with_travel_dist) do
		local new_mutators = sequence_node.mutators

		for i = seek_start_index, num_zones do
			local zone = zones[i]
			local mutator_list = {}

			if zone.mutators then
				for name in string.gmatch(zone.mutators, "([^[%s,]+)%s*,?%s*") do
					mutator_list[#mutator_list + 1] = name
				end
			end

			for _, new_mutator in ipairs(new_mutators) do
				if table.index_of(mutator_list, new_mutator) == -1 then
					mutator_list[#mutator_list + 1] = new_mutator
				end
			end

			zone.peak = sequence_node.peak

			if #mutator_list > 0 then
				zone.mutators = table.concat(mutator_list, ",")
			end

			if sequence_node.travel_dist < zone.travel_dist then
				if not zone.roaming_set then
					zone.roaming_set = sequence_node.breeds == "a" and breed_a or sequence_node.breeds == "b" and breed_b or both_breeds
				end

				seek_start_index = i

				break
			end
		end
	end
end

return {
	hide_from_player_ui = true,
	tweak_zones = function (mutator_context, data, conflict_director_name, zones, num_zones)
		local mechanism = Managers.mechanism:game_mechanism()
		local deus_run_controller = mechanism.get_deus_run_controller and mechanism:get_deus_run_controller()

		if not conflict_settings[conflict_director_name] or not deus_run_controller then
			return
		end

		local current_node = deus_run_controller:get_current_node()
		local sequences_for_type = sequences[current_node.level_type]

		if not sequences_for_type then
			return
		end

		local seed = Managers.mechanism:get_level_seed("mutator")
		local sequence_index = nil
		seed, sequence_index = Math.next_random(seed, 1, #sequences_for_type)
		local sequence = sequences_for_type[sequence_index]
		local last_zone_travel_dist = zones[num_zones].travel_dist
		local conflict_director = Managers.state.conflict
		local peaks = conflict_director:get_peaks()
		local possible_events = conflict_director.level_analysis:get_possible_events()
		local run_progress = current_node.run_progress
		local event_weights = table.clone(EVENT_WEIGHTS)
		local event_weight_table = event_weights[1].weights

		for _, possible_event_weight_config in ipairs(event_weights) do
			if possible_event_weight_config.run_progress <= run_progress then
				event_weight_table = possible_event_weight_config.weights
			else
				break
			end
		end

		local game_mode_manager = Managers.state.game_mode

		if game_mode_manager:has_mutator("deus_more_monsters") then
			event_weight_table.event_boss = 100
			event_weight_table.event_patrol = 0
			event_weight_table.nothing = 0
		end

		if game_mode_manager:has_mutator("deus_less_monsters") then
			event_weight_table.event_boss = 0
		end

		if game_mode_manager:has_mutator("deus_more_elites") then
			event_weight_table.event_boss = 0
			event_weight_table.nothing = 0
			event_weight_table.event_patrol = 100
		end

		if game_mode_manager:has_mutator("deus_less_elites") then
			event_weight_table.event_patrol = 0
		end

		local sequence_with_travel_dist, best_event = Sequencer.apply_travel_dist_to_sequence_with_peaks_and_events(sequence, last_zone_travel_dist, peaks, possible_events, event_weight_table, seed)
		data.event = best_event
		local _, breed_selection = Math.next_random(seed, 1, 2)
		local sub_breeds = conflict_settings[conflict_director_name]
		local breed_a = breed_selection == 1 and sub_breeds.breed1 or sub_breeds.breed2
		local breed_b = breed_selection == 1 and sub_breeds.breed2 or sub_breeds.breed1

		Sequencer.tweak_zones_with_sequence(breed_a, breed_b, conflict_director_name, zones, num_zones, sequence_with_travel_dist)

		local final_peaks = {}

		for index, sequence_node in ipairs(sequence_with_travel_dist) do
			if sequence_node.peak then
				final_peaks[#final_peaks + 1] = sequence_node.travel_dist
			end
		end

		conflict_director:set_peaks(final_peaks)
	end,
	server_start_function = function (mutator_context, data, dt, t)
		if not data.event then
			return
		end

		local conflict_director = Managers.state.conflict

		if data.event.kind == "event_boss" then
			local spawner = data.event.spawner
			local spawner_pos = Unit.local_position(spawner[1], 0)
			local boxed_pos = Vector3Box(spawner_pos)
			local event_data = {
				event_kind = "event_boss"
			}
			local terror_events = CurrentBossSettings.boss_events.event_lookup.event_boss
			local seed = Managers.mechanism:get_level_seed("mutator")
			local _, index = Math.next_random(seed, 1, #terror_events)
			local terror_event_name = terror_events[index]

			conflict_director.enemy_recycler:add_main_path_terror_event(boxed_pos, terror_event_name, EVENT_ACTIVATION_DISTANCE, event_data)
		elseif data.event.kind == "event_patrol" then
			local waypoints_table = data.event.waypoints_table
			local spline_waypoints = conflict_director.level_analysis:boxify_waypoint_table(waypoints_table.waypoints)
			local event_data = {
				spline_type = "patrol",
				event_kind = "event_spline_patrol",
				spline_id = waypoints_table.id,
				spline_way_points = spline_waypoints,
				one_directional = waypoints_table.one_directional
			}
			local terror_events = CurrentBossSettings.boss_events.event_lookup.event_patrol
			local seed = Managers.mechanism:get_level_seed("mutator")
			local _, index = Math.next_random(seed, 1, #terror_events)
			local terror_event_name = terror_events[index]
			local travel_dist = conflict_director.level_analysis:get_boss_spline_travel_distance(waypoints_table) - EVENT_ACTIVATION_DISTANCE

			conflict_director.enemy_recycler:add_main_path_terror_event(spline_waypoints[1], terror_event_name, EVENT_ACTIVATION_DISTANCE, event_data, travel_dist)
		end
	end,
	server_update_function = function (mutator_context, data, dt, t)
		if not data.peak_delayer_data then
			return
		end

		local current_time = Managers.time:time("game")
		local conflict_director = Managers.state.conflict
		local main_path_info = conflict_director.main_path_info
		local ahead_player_travel_dist = nil

		if not main_path_info.ahead_unit then
			return
		end

		local ahead_player_info = conflict_director.main_path_player_info[main_path_info.ahead_unit]
		ahead_player_travel_dist = ahead_player_info.travel_dist
		data.highest_travel_dist = math.max(data.highest_travel_dist or 0, ahead_player_travel_dist)
	end
}
