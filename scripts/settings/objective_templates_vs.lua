-- chunkname: @scripts/settings/objective_templates_vs.lua

require("scripts/settings/objective_lists")

VersusObjectiveSettings = {
	bell_pvp = {
		num_sets = 2,
		round_timer = 1800,
		objective_lists = {
			"bell_pvp_set_1",
			"bell_pvp_set_2",
		},
	},
	military_pvp = {
		num_sets = 3,
		round_timer = 1800,
		objective_lists = {
			"military_pvp_set_1",
			"military_pvp_set_2",
			"military_pvp_set_3",
		},
	},
	farmlands_pvp = {
		num_sets = 2,
		round_timer = 1800,
		objective_lists = {
			"farmlands_pvp_set_1",
			"farmlands_pvp_set_2",
		},
	},
	fort_pvp = {
		num_sets = 3,
		round_timer = 1800,
		objective_lists = {
			"fort_pvp_set_1",
			"fort_pvp_set_2",
			"fort_pvp_set_3",
		},
	},
	forest_ambush_pvp = {
		num_sets = 3,
		round_timer = 1800,
		objective_lists = {
			"forest_ambush_pvp_set_1",
			"forest_ambush_pvp_set_2",
			"forest_ambush_pvp_set_3",
		},
	},
	dwarf_exterior_pvp = {
		num_sets = 3,
		round_timer = 1800,
		objective_lists = {
			"dwarf_exterior_pvp_set_1",
			"dwarf_exterior_pvp_set_2",
			"dwarf_exterior_pvp_set_3",
		},
	},
}

local allowed_objective_terms = {
	almost_done = true,
	always_show_objective_marker = true,
	capture_time = true,
	close_to_win_on_completion = true,
	close_to_win_on_section = true,
	description = true,
	dialogue_event = true,
	mission_name = true,
	num_sections = true,
	num_sockets = true,
	objective_tag = true,
	objective_type = true,
	on_last_leaf_complete_sound_event = true,
	on_leaf_complete_sound_event = true,
	play_arrive_vo = true,
	play_complete_vo = true,
	play_dialogue_event_on_complete = true,
	play_safehouse_vo = true,
	play_waystone_vo = true,
	score_for_completion = true,
	score_for_each_player_inside = true,
	score_per_section = true,
	score_per_socket = true,
	sub_objectives = true,
	time_for_completion = true,
	vo_context_on_activate = true,
	vo_context_on_complete = true,
	volume_name = true,
	volume_type = {
		all_alive = true,
		any_alive = true,
	},
}

local function nearest_word(bad_string, allowed_terms)
	local lowest_dist = 999
	local best_string

	for k, v in pairs(allowed_terms) do
		local dist = string.damerau_levenshtein_distance(k, bad_string, 5)

		if dist < lowest_dist then
			lowest_dist = dist
			best_string = k
		end
	end

	if best_string then
		return best_string
	end
end

local function recursive_add_name(data)
	local score = 0

	for objective_name, objective_data in pairs(data) do
		for k, v in pairs(objective_data) do
			local term = allowed_objective_terms[k]

			if not term then
				local close_string = nearest_word(k, allowed_objective_terms)

				if close_string then
					fassert(false, "Bad objective keyword found in objective_templates_vs.lua: '%s', did you mean '%s' ?", k, close_string)
				else
					fassert(false, "Bad objective keyword found objective_templates_vs.lua: '%s', was it misspelled?", k)
				end
			end

			if type(term) == "table" then
				local close_string = nearest_word(v, term)

				fassert(term[v], "Bad objective: Objective keyword '%s' is set to '%s' which does not exist or is misspelled. Did you mean '%s' ?", k, v, close_string)
			end
		end

		GameModeSettings.versus.objective_names[objective_name] = true

		if objective_data.sub_objectives then
			score = score + recursive_add_name(objective_data.sub_objectives)
		end

		score = score + (objective_data.score_for_completion or 0)

		local score_per_section = objective_data.score_per_section

		if score_per_section then
			score = score + score_per_section * objective_data.num_sections
		end

		local score_per_socket = objective_data.score_per_socket

		if score_per_socket then
			score = score + score_per_socket * objective_data.num_sockets
		end

		local score_for_each_player_inside = objective_data.score_for_each_player_inside

		if score_for_each_player_inside then
			score = score + score_for_each_player_inside * 4
		end
	end

	return score
end

GameModeSettings.versus.objective_names = {}

for level_key, level_data in pairs(VersusObjectiveSettings) do
	local objective_lists = level_data.objective_lists

	level_data.max_score = 0

	for i = 1, #objective_lists do
		local set = ObjectiveLists[objective_lists[i]]
		local set_score = 0

		for j = 1, #set do
			local set_data = set[j]

			set_score = set_score + recursive_add_name(set_data)
		end

		set.max_score = set_score
		level_data.max_score = level_data.max_score + set_score
	end
end
