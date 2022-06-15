require("scripts/settings/dlcs/morris/deus_map_populate_settings")
require("scripts/managers/game_mode/mechanisms/deus_gen_engine")
require("scripts/helpers/deus_gen_utils")

local function shuffle_array(table, random_generator)
	for ii = #table, 2, -1 do
		local swap = random_generator(1, ii)
		table[ii] = table[swap]
		table[swap] = table[ii]
	end

	return table
end

local function get_random_key_list(table1, random_generator)
	local keys = {}

	for key, _ in pairs(table1) do
		keys[#keys + 1] = key
	end

	table.sort(keys)

	for ii = #keys, 2, -1 do
		local swap = random_generator(1, ii)
		keys[ii] = keys[swap]
		keys[swap] = keys[ii]
	end

	return keys
end

local function get_nodes_list(nodes)
	local nodes_list = {}

	for _, node in pairs(nodes) do
		nodes_list[#nodes_list + 1] = node
	end

	return nodes_list
end

local function get_nodes_above_progress(nodes, progress)
	local chosen_nodes = {}

	for _, node in pairs(nodes) do
		if progress < node.run_progress then
			chosen_nodes[#chosen_nodes + 1] = node
		end
	end

	return chosen_nodes
end

local function filter_node_types(node_list, types)
	local new_node_list = {}

	for _, node in ipairs(node_list) do
		if table.contains(types, node.type) then
			new_node_list[#new_node_list + 1] = node
		end
	end

	return new_node_list
end

local function get_paths(nodes, node_key)
	if #nodes[node_key].prev == 0 then
		return {
			{
				node_key
			}
		}
	end

	local paths = {}

	for _, prev in ipairs(nodes[node_key].prev) do
		local prev_paths = get_paths(nodes, prev)

		for _, prev_path in ipairs(prev_paths) do
			prev_path[#prev_path + 1] = node_key
			paths[#paths + 1] = prev_path
		end
	end

	return paths
end

local function get_all_ancestors_and_descendants(nodes, node_key)
	local all_nodes = {}

	local function go_forward(other_node_key)
		for _, next in ipairs(nodes[other_node_key].next) do
			if not all_nodes[next] then
				all_nodes[next] = true

				go_forward(next)
			end
		end
	end

	local function go_backward(other_node_key)
		for _, prev in ipairs(nodes[other_node_key].prev) do
			if not all_nodes[prev] then
				all_nodes[prev] = true

				go_backward(prev)
			end
		end
	end

	go_forward(node_key)
	go_backward(node_key)

	return all_nodes
end

local function get_first_playable_descendants(nodes, node_key)
	if #nodes[node_key].next == 0 then
		return {}
	end

	local playable_descendants = {}

	for _, next in ipairs(nodes[node_key].next) do
		local next_type = nodes[next].type

		if next_type == "SIGNATURE" or next_type == "TRAVEL" or next_type == "ARENA" then
			playable_descendants[#playable_descendants + 1] = next
		else
			local other_playable_descendants = get_first_playable_descendants(nodes, next)

			for _, other_non_dummy_descendent in ipairs(other_playable_descendants) do
				playable_descendants[#playable_descendants + 1] = other_non_dummy_descendent
			end
		end
	end

	return playable_descendants
end

local function get_descendants(nodes, node_key, depth)
	if depth > 1 then
		depth = depth - 1
		local all_descendants = {}

		for _, next_node_key in ipairs(nodes[node_key].next) do
			local visibles_from_descendant = get_descendants(nodes, next_node_key, depth)

			for visible_from_descendant_node_key, visible_from_descendant in pairs(visibles_from_descendant) do
				all_descendants[visible_from_descendant_node_key] = visible_from_descendant
			end
		end

		return all_descendants
	else
		return nodes[node_key].next
	end
end

local function prevent_same_level_choice(config, working_graph, node_key, level)
	local prev = working_graph[node_key].prev

	for _, prev_node_key in ipairs(prev) do
		local prev_node = working_graph[prev_node_key]

		for _, next_node_key in ipairs(prev_node.next) do
			local next_node = working_graph[next_node_key]

			if next_node_key ~= node_key and next_node.level == level then
				return false
			end
		end
	end

	return true
end

local function prevent_same_level_on_same_path(config, working_graph, node_key, level)
	local paths = get_paths(working_graph, node_key)

	for _, path in ipairs(paths) do
		for i = #path, 1, -1 do
			local node_in_path = path[i]

			if node_in_path ~= node_key and working_graph[node_in_path].level == level then
				return false
			end
		end
	end

	return true
end

local function last_signature_level_is_specific_level(config, working_graph, node_key, level)
	local node = working_graph[node_key]

	for _, next_node_key in ipairs(node.next) do
		local next_node = working_graph[next_node_key]

		if #next_node.next == 0 then
			local specific_level = config.SPECIFIC_SIGNATURE_LEVEL

			return specific_level == level
		end
	end

	return true
end

local LEVEL_VALIDATIONS = {
	SIGNATURE = {
		prevent_same_level_choice = prevent_same_level_choice,
		last_signature_level_is_specific_level = last_signature_level_is_specific_level,
		prevent_same_level_on_same_path = prevent_same_level_on_same_path
	},
	TRAVEL = {
		prevent_same_level_choice = prevent_same_level_choice,
		prevent_same_level_on_same_path = prevent_same_level_on_same_path
	},
	SHOP = {
		prevent_same_level_choice = prevent_same_level_choice
	},
	ARENA = {}
}
local LEVEL_SHUFFLERS = {
	lower_priority_of_already_used_levels_on_path = function (context, working_graph, node_key, levels)
		local function is_level_already_used(current_node_key, level)
			if working_graph[current_node_key].level == level then
				return true
			end

			for _, prev_node_key in ipairs(working_graph[current_node_key].prev) do
				if is_level_already_used(prev_node_key, level) then
					return true
				end
			end

			return false
		end

		local swap_to_index = #levels

		for i = #levels, 1, -1 do
			local level = levels[i]

			if is_level_already_used(node_key, level) then
				local level_to_swap = levels[swap_to_index]
				levels[i] = level_to_swap
				levels[swap_to_index] = level
				swap_to_index = swap_to_index - 1
			end
		end
	end
}
local LABEL_OVERRIDES = {
	last_signature_level_is_specific_level = function (context, working_graph, labels)
		local config = context.config
		local sig_level = config.SPECIFIC_SIGNATURE_LEVEL

		fassert(sig_level, "you need to specify a SPECIFIC_SIGNATURE_LEVEL when using LABEL_OVERRIDES.last_signature_level_is_specific_level")

		local sig_labels = labels.SIGNATURE
		local last_level_label = nil

		for _, prev_node_key in ipairs(working_graph.final.prev) do
			local prev_node = working_graph[prev_node_key]

			if prev_node.type == "SIGNATURE" then
				last_level_label = prev_node.label

				break
			end
		end

		fassert(last_level_label, "a graph needs to have a signature level just before the end in order for LABEL_OVERRIDES.last_signature_level_is_specific_level to work")

		local specific_level_label = nil

		for label, level in pairs(sig_labels) do
			if level == sig_level then
				specific_level_label = label

				break
			end
		end

		fassert(specific_level_label, sprintf("In LABEL_OVERRIDES.last_signature_level_is_specific_level the level %s was not found in the level availability", sig_level))

		local other_level = sig_labels[last_level_label]
		sig_labels[last_level_label] = sig_level
		sig_labels[specific_level_label] = other_level

		return labels
	end
}
local MINOR_MODIFIER_VALIDATORS = {
	prevent_modifier_on_curse_abundance_of_life = function (context, working_graph, node_key, modifier_group)
		local node = working_graph[node_key]

		return node.curse ~= "curse_abundance_of_life" or (not table.contains(modifier_group, "increased_grenades") and not table.contains(modifier_group, "increased_healing"))
	end
}

local function validate_level_placement(config, indent, working_graph, node_key, level)
	local node = working_graph[node_key]
	local node_type = node.type
	local validator_names = config.LEVEL_VALIDATIONS[node_type]
	local validators = LEVEL_VALIDATIONS[node_type]

	for _, validator_name in ipairs(validator_names) do
		if not validators[validator_name](config, working_graph, node_key, level) then
			return false
		end
	end

	return true
end

local function validate_until_the_end(context, working_graph, node_key)
	local node = working_graph[node_key]

	if not validate_level_placement(context.config, context.indent, working_graph, node_key, node.level, context.indent) then
		return false
	end

	for _, next_node_key in ipairs(node.next) do
		if not validate_until_the_end(context, working_graph, next_node_key) then
			return false
		end
	end

	return true
end

local function get_available_paths(context, working_graph, node_key, level)
	local node = working_graph[node_key]
	local node_type = node.type
	local levels_available = context.config.LEVEL_AVAILABILITY[node_type]
	local paths = table.clone(levels_available[level].paths)

	local function filter_paths_node(node_key_to_filter)
		local node_to_filter = working_graph[node_key_to_filter]

		if node_to_filter.level == level then
			local index = table.index_of(paths, node_to_filter.path)

			if index ~= -1 then
				table.swap_delete(paths, index)
			end
		end
	end

	local function filter_paths_backwards(node_key_to_filter)
		local node_to_filter = working_graph[node_key_to_filter]

		for _, prev in ipairs(node_to_filter.prev) do
			filter_paths_node(prev)
			filter_paths_backwards(prev)
		end
	end

	local function filter_paths_forwards(node_key_to_filter)
		local node_to_filter = working_graph[node_key_to_filter]

		for _, next in ipairs(node_to_filter.next) do
			filter_paths_node(next)
			filter_paths_forwards(next)
		end
	end

	filter_paths_node(node_key)
	filter_paths_backwards(node_key)
	filter_paths_forwards(node_key)

	return paths
end

local create_process_node_action, create_assign_level_and_path_action, create_process_connections_action = nil

function create_process_connections_action(context, working_graph, node_key)
	local function executor()
		local node = working_graph[node_key]
		local connections = shuffle_array(table.clone(node.next), context.random_generator)
		local next_actions = {}

		for i = 1, #connections, 1 do
			next_actions[i] = function ()
				return create_process_node_action(context, working_graph, connections[i])
			end
		end

		return true, next_actions
	end

	return {
		name = "connections " .. node_key,
		run = function ()
			return executor()
		end,
		retry = function ()
			return false
		end
	}
end

function create_process_node_action(context, working_graph, node_key)
	local node = working_graph[node_key]
	local node_type = node.type

	return {
		name = "node " .. node_key,
		run = function ()
			if node.level then
				return validate_until_the_end(context, working_graph, node_key)
			end

			local next_actions = {
				function ()
					return create_assign_level_and_path_action(context, working_graph, node_key)
				end
			}

			return true, next_actions
		end,
		retry = function ()
			return false
		end
	}
end

function create_assign_level_and_path_action(context, working_graph, node_key)
	local node = working_graph[node_key]
	local node_type = node.type
	local node_label = node.label
	local levels_available = context.config.LEVEL_AVAILABILITY[node_type]

	local function create_shuffled_levels()
		local levels = get_random_key_list(levels_available, context.random_generator)

		for _, shuffler_name in ipairs(context.config.LEVEL_SHUFFLERS) do
			LEVEL_SHUFFLERS[shuffler_name](context, working_graph, node_key, levels)
		end

		table.reverse(levels)

		return levels
	end

	local shuffled_levels_available = nil

	local function executor()
		if node_label and node_label ~= 0 then
			node.level = context.shuffled_levels_for_labels[node_type][node_label]
			local paths = levels_available[node.level].paths
			paths = shuffle_array(table.clone(paths), context.random_generator)
			node.path = paths[1]
		else
			if not shuffled_levels_available then
				shuffled_levels_available = create_shuffled_levels()
			end

			while #shuffled_levels_available > 0 do
				local level_to_try = shuffled_levels_available[#shuffled_levels_available]
				shuffled_levels_available[#shuffled_levels_available] = nil

				if validate_level_placement(context.config, context.indent, working_graph, node_key, level_to_try) then
					if node.type == "SHOP" then
						node.level = level_to_try

						break
					else
						local paths = get_available_paths(context, working_graph, node_key, level_to_try)

						if #paths == 0 then
						else
							paths = shuffle_array(table.clone(paths), context.random_generator)
							node.level = level_to_try
							node.path = paths[1]

							break
						end
					end
				end
			end
		end

		if not node.level then
			return false
		end

		local next_actions = {
			function ()
				return create_process_connections_action(context, working_graph, node_key)
			end
		}

		return true, next_actions
	end

	return {
		name = "level " .. node_key,
		run = function ()
			return executor()
		end,
		retry = function ()
			node.level = nil
			node.path = nil

			if node_label and node_label ~= 0 then
				return false
			else
				return executor()
			end
		end
	}
end

local function find_missing_progress_sub_path(working_graph, path)
	local sub_path_start_index = -1
	local sub_path_end_index = -1

	for index, node_key in ipairs(path) do
		if not working_graph[node_key].run_progress then
			if sub_path_start_index == -1 then
				sub_path_start_index = index
			end

			sub_path_end_index = index
		elseif sub_path_start_index ~= -1 then
			return sub_path_start_index, sub_path_end_index
		end
	end

	return sub_path_start_index, sub_path_end_index
end

local function filter_non_progress_nodes(working_graph, path)
	local filtered_path = {}

	for _, node_key in ipairs(path) do
		local node = working_graph[node_key]
		local type = node.type

		if type ~= "START" then
			filtered_path[#filtered_path + 1] = node_key
		end
	end

	return filtered_path
end

local function apply_progress(working_graph, path, start_index, end_index)
	local node_before = working_graph[path[start_index - 1]]
	local node_after = working_graph[path[end_index + 1]]
	local start_prog = (node_before and node_before.run_progress) or 0
	local end_prog = (node_after and node_after.run_progress) or 0.9999
	local length_of_lerp = end_index - start_index
	local index_offset = 0

	if node_before then
		length_of_lerp = length_of_lerp + 1
		index_offset = 1
	end

	if node_after then
		length_of_lerp = length_of_lerp + 1
	end

	for index = start_index, end_index, 1 do
		local lerp_index = index - start_index
		local progress = math.lerp(start_prog, end_prog, (lerp_index + index_offset) / length_of_lerp)
		working_graph[path[index]].run_progress = progress
	end
end

local function calculate_progress(context, working_graph)
	local paths = get_paths(working_graph, "final")

	table.sort(paths, function (path_1, path_2)
		return #path_1 > #path_2
	end)

	for _, path in ipairs(paths) do
		local filtered_path = filter_non_progress_nodes(working_graph, path)

		while true do
			local sub_path_start_index, sub_path_end_index = find_missing_progress_sub_path(working_graph, filtered_path)

			if sub_path_start_index == -1 then
				break
			end

			apply_progress(working_graph, filtered_path, sub_path_start_index, sub_path_end_index)
		end

		for _, node_key in ipairs(path) do
			local node = working_graph[node_key]

			if node.run_progress == nil then
				node.run_progress = 0
			end
		end
	end
end

local function assign_random_curse(context, node, god)
	local node_type = node.type
	local curses = context.config.AVAILABLE_CURSES[node_type][god]
	local curse = curses[context.random_generator(1, #curses)]
	node.curse = curse
	node.god = god
end

local function assign_minor_modifier_group(context, working_graph, node_key)
	local node = working_graph[node_key]
	local minor_modifier_groups = shuffle_array(table.clone(context.config.AVAILABLE_MINOR_MODIFIERS), context.random_generator)

	local function is_valid_minor_modifier_group(minor_modifier_group)
		for _, validator in ipairs(context.config.MINOR_MODIFIER_VALIDATORS) do
			if not MINOR_MODIFIER_VALIDATORS[validator](context, working_graph, node_key, minor_modifier_group) then
				return false
			end
		end

		return true
	end

	for _, minor_modifier_group in ipairs(minor_modifier_groups) do
		if is_valid_minor_modifier_group(minor_modifier_group) then
			node.minor_modifier_group = minor_modifier_group

			return
		end
	end
end

local function spread_curse_on_hot_spot(context, working_graph, god, hot_spot_center_key, squared_range, possible_cursed_nodes)
	local hot_spot_data = {
		god = god,
		center_key = hot_spot_center_key,
		nodes = {}
	}
	local hot_spot_center = working_graph[hot_spot_center_key]

	assign_random_curse(context, hot_spot_center, god)
	table.swap_delete(possible_cursed_nodes, table.index_of(possible_cursed_nodes, hot_spot_center))

	hot_spot_data.nodes[#hot_spot_data.nodes + 1] = hot_spot_center.name

	for possible_index = #possible_cursed_nodes, 1, -1 do
		local possible_node = possible_cursed_nodes[possible_index]
		local dx = hot_spot_center.layout_x - possible_node.layout_x
		local dy = hot_spot_center.layout_y - possible_node.layout_y
		local squared_distance = dx * dx + dy * dy

		if squared_range > squared_distance then
			assign_random_curse(context, possible_node, god)
			table.swap_delete(possible_cursed_nodes, possible_index)

			hot_spot_data.nodes[#hot_spot_data.nodes + 1] = possible_node.name
		end
	end

	context.hot_spots[#context.hot_spots + 1] = hot_spot_data

	return possible_cursed_nodes
end

local function spread_curse(context, working_graph)
	local hot_spot_count = context.random_generator(context.config.CURSES_HOT_SPOTS_MIN_COUNT, context.config.CURSES_HOT_SPOTS_MAX_COUNT)
	local nodes_above_progress = get_nodes_above_progress(working_graph, context.config.CURSES_MIN_PROGRESS)
	local possible_cursed_nodes = filter_node_types(nodes_above_progress, context.config.CURSEABLE_NODE_TYPES)

	if not context.config.NO_DOMINANT_GOD then
		local squared_god_range = context.config.CURSES_HOT_SPOT_MAX_RANGE * context.config.CURSES_HOT_SPOT_MAX_RANGE
		possible_cursed_nodes = spread_curse_on_hot_spot(context, working_graph, context.dominant_god, "final", squared_god_range, possible_cursed_nodes)
	end

	local remaining_gods = {}
	local available_gods = context.config.AVAILABLE_GODS

	for i = 2, hot_spot_count, 1 do
		if #remaining_gods == 0 then
			for _, god in ipairs(available_gods) do
				if context.config.NO_DOMINANT_GOD or god ~= context.dominant_god then
					remaining_gods[#remaining_gods + 1] = god
				end
			end
		end

		local index = context.random_generator(1, #remaining_gods)
		local god = remaining_gods[index]

		table.swap_delete(remaining_gods, index)

		if #possible_cursed_nodes > 0 then
			local hot_spot_center_index = context.random_generator(1, #possible_cursed_nodes)
			local hot_spot_center = possible_cursed_nodes[hot_spot_center_index]
			local god_range = context.config.CURSES_HOT_SPOT_MIN_RANGE + context.random_generator() * (context.config.CURSES_HOT_SPOT_MAX_RANGE - context.config.CURSES_HOT_SPOT_MAX_RANGE)
			possible_cursed_nodes = spread_curse_on_hot_spot(context, working_graph, god, hot_spot_center.name, god_range * god_range, possible_cursed_nodes)
		end
	end
end

local function spread_belakor(context, working_graph)
	local possible_belakor_nodes = {}
	local depth = context.config.ARENA_BELAKOR_SHOWS_UP_IN_DEPTH

	for node_key, node in pairs(working_graph) do
		if node.type ~= "START" and node.type ~= "SHOP" and node.type ~= "ARENA" then
			local final_nodes = nil
			local possible_arena_belakor_nodes = get_descendants(working_graph, node_key, depth)
			local possible_arena_belakor_nodes_without_shops = {}

			for _, possible_node_key in ipairs(possible_arena_belakor_nodes) do
				local possible_node = working_graph[possible_node_key]

				if possible_node.type == "SHOP" then
					local shop_playable_connections = get_first_playable_descendants(working_graph, possible_node_key)

					for _, shop_playable_connection_node_key in ipairs(shop_playable_connections) do
						possible_arena_belakor_nodes_without_shops[#possible_arena_belakor_nodes_without_shops + 1] = shop_playable_connection_node_key
					end
				else
					possible_arena_belakor_nodes_without_shops[#possible_arena_belakor_nodes_without_shops + 1] = possible_node_key
				end
			end

			for _, possible_node_key in ipairs(possible_arena_belakor_nodes_without_shops) do
				local possible_node = working_graph[possible_node_key]

				repeat
					if #possible_node.next == 0 then
						possible_node = nil

						break
					end

					possible_node = working_graph[possible_node.next[1]]
				until possible_node.type == "SIGNATURE" or possible_node.type == "TRAVEL"

				if possible_node then
					final_nodes = final_nodes or {}
					final_nodes[possible_node_key] = true
				end
			end

			if final_nodes then
				local final_list = {}

				for final_node_key, _ in pairs(final_nodes) do
					final_list[#final_list + 1] = final_node_key
				end

				node.possible_arena_belakor_nodes = final_list
				possible_belakor_nodes[#possible_belakor_nodes + 1] = node_key
			end
		end
	end

	local belakor_node_map = table.mirror_array_inplace(possible_belakor_nodes)
	local first_playable_nodes = get_first_playable_descendants(working_graph, "start")
	local belakor_paths = {}

	for i = 1, #first_playable_nodes, 1 do
		local path_start_node = first_playable_nodes[i]

		if belakor_node_map[path_start_node] then
			local path = {}
			local path_n = 1
			belakor_paths[#belakor_paths + 1] = path
			path[path_n] = first_playable_nodes[i]
			local path_next = get_descendants(working_graph, path_start_node, 1)

			for j = 1, #path_next, 1 do
				if belakor_node_map[path_next[j]] then
					path_n = path_n + 1
					path[path_n] = path_next[j]
				end
			end
		end
	end

	local random_generator = context.random_generator
	local belakor_nodes = {}

	for path_id = 1, #belakor_paths, 1 do
		local path = belakor_paths[path_id]
		local path_n = #path

		if path_n > 0 then
			local rand_node = random_generator(1, path_n)
			local rand_node_name = path[rand_node]
			belakor_nodes[#belakor_nodes + 1] = rand_node_name

			for next_path_id = path_id + 1, #belakor_paths, 1 do
				local next_path = belakor_paths[next_path_id]

				if table.contains(next_path, rand_node_name) then
					table.clear(next_path)
				else
					for i = 1, #path, 1 do
						local overlapping_node_idx = table.find(next_path, path[i])

						if overlapping_node_idx then
							table.remove(next_path, overlapping_node_idx)
						end
					end
				end
			end
		end
	end

	for i = 1, #belakor_nodes, 1 do
		local belakor_node_key = belakor_nodes[i]

		assign_random_curse(context, working_graph[belakor_node_key], "belakor")
	end
end

local function spread_minor_modifier_groups(context, working_graph)
	local nodes_above_progress = get_nodes_above_progress(working_graph, context.config.MINOR_MODIFIABLE_MIN_PROGRESS)
	local possible_minor_modifiable_nodes = filter_node_types(nodes_above_progress, context.config.MINOR_MODIFIABLE_NODE_TYPES)

	for _, possible_minor_modifiable_node in ipairs(possible_minor_modifiable_nodes) do
		local can_assign_minor_modifier = context.random_generator() < context.config.MINOR_MODIFIABLE_NODE_CHANCE

		if can_assign_minor_modifier then
			assign_minor_modifier_group(context, working_graph, possible_minor_modifiable_node.name)
		end
	end
end

local function assign_conflict_settings(context, working_graph)
	for _, base_node in pairs(working_graph) do
		if base_node.type == "SIGNATURE" or base_node.type == "TRAVEL" or base_node.type == "ARENA" then
			local possible_conflict_settings = context.config.CONFLICT_DIRECTORS[base_node.god] or context.config.CONFLICT_DIRECTORS.default
			base_node.conflict_settings = possible_conflict_settings[context.random_generator(1, #possible_conflict_settings)]
		end
	end
end

local function check_if_power_up_is_already_granted_in_nodes(working_graph, nodes, power_up)
	for node_key, _ in pairs(nodes) do
		local node = working_graph[node_key]

		if power_up == node.terror_event_power_up then
			return true
		end
	end

	return false
end

local function get_visible_nodes(nodes, node_key, depth)
	local descendants = nodes[node_key].next

	if depth > 1 then
		depth = depth - 1
		local all_visible_nodes = {}

		for _, descendant in ipairs(descendants) do
			all_visible_nodes[descendant] = nodes[descendant]
			local visibles_from_descendant = get_visible_nodes(nodes, descendant, depth)

			for visible_from_descendant_node_key, visible_from_descendant in pairs(visibles_from_descendant) do
				all_visible_nodes[visible_from_descendant_node_key] = visible_from_descendant
			end
		end

		return all_visible_nodes
	else
		local all_visible_nodes = {}

		for _, descendant in ipairs(descendants) do
			all_visible_nodes[descendant] = nodes[descendant]
		end

		return all_visible_nodes
	end
end

local function spread_terror_event_power_ups(context, working_graph)
	local random_generator = context.random_generator
	local node_key_list = get_random_key_list(working_graph, random_generator)

	for _, base_node_key in ipairs(node_key_list) do
		local base_node = working_graph[base_node_key]

		if base_node.type == "SIGNATURE" or base_node.type == "TRAVEL" then
			local all_nodes = get_all_ancestors_and_descendants(working_graph, base_node_key)

			for _, prev_node_key in ipairs(base_node.prev) do
				local visible_nodes = get_visible_nodes(working_graph, prev_node_key, context.config.POWER_UP_LOOKAHEAD)

				for visible_node_key, visible_node in pairs(visible_nodes) do
					if visible_node.type == "SIGNATURE" or visible_node.type == "TRAVEL" then
						all_nodes[visible_node_key] = visible_node
					end
				end
			end

			local available_power_ups = shuffle_array(table.clone(context.config.TERROR_POWER_UPS), random_generator)

			for _, available_power_up in ipairs(available_power_ups) do
				local available_power_up_name = available_power_up[1]
				local available_power_up_rarity = available_power_up[2]

				if not check_if_power_up_is_already_granted_in_nodes(working_graph, all_nodes, available_power_up_name) then
					base_node.terror_event_power_up = available_power_up_name
					base_node.terror_event_power_up_rarity = available_power_up_rarity

					break
				end
			end

			if not base_node.terror_event_power_up then
				Application.warning("could not assign power_up to node, add more power_ups or reduce lookahead in the settings.")
			end
		end
	end
end

local function get_level_name(level, path, theme)
	return level .. "_" .. theme .. "_path" .. path
end

function deus_generate_seeds(level_seed)
	local random_generator = DeusGenUtils.create_random_generator(level_seed)
	local _, weapon_pickup_seed = random_generator()
	local _, pickups_seed = random_generator()
	local _, mutator_seed = random_generator()
	local _, blessings_seed = random_generator()
	local _, power_ups_seed = random_generator()

	return {
		weapon_pickup_seed = weapon_pickup_seed,
		pickups_seed = pickups_seed,
		mutator_seed = mutator_seed,
		blessings_seed = blessings_seed,
		power_ups_seed = power_ups_seed
	}
end

function deus_populate_graph(base_graph, seed, config, dominant_god, with_belakor)
	local random_generator = DeusGenUtils.create_random_generator(seed)
	local working_graph = table.clone(base_graph)
	local context = {
		indent = 0,
		random_generator = random_generator,
		config = config,
		dominant_god = dominant_god,
		hot_spots = {}
	}
	local shuffled_levels_for_labels = {}
	local level_availability_types = {}

	for type, _ in pairs(config.LEVEL_AVAILABILITY) do
		level_availability_types[#level_availability_types + 1] = type
	end

	table.sort(level_availability_types)

	for _, type in pairs(level_availability_types) do
		local levels = config.LEVEL_AVAILABILITY[type]
		levels = get_random_key_list(levels, random_generator)
		shuffled_levels_for_labels[type] = levels
	end

	for _, label_override in ipairs(config.LABEL_OVERRIDES) do
		shuffled_levels_for_labels = LABEL_OVERRIDES[label_override](context, working_graph, shuffled_levels_for_labels)
	end

	context.shuffled_levels_for_labels = shuffled_levels_for_labels

	local function per_action_callback(action_list, action)
		context.indent = #action_list
	end

	local action_list = {
		create_process_connections_action(context, working_graph, "start")
	}
	local generator = DeusGenEngine.get_generator(action_list, per_action_callback)
	local error_message, result = nil
	local process_count = 100000

	for i = 1, process_count, 1 do
		result, error_message = generator()

		if result then
			if error_message then
				Application.warning("[deus_populate_graph.lua] failed to populate graph, maybe the settings are impossible to solve? error: " .. (error_message or "N/A"))

				return nil
			end

			break
		end
	end

	if not result then
		Application.warning("[deus_populate_graph.lua] failed to populate graph, maybe the settings are impossible to solve? error: " .. (error_message or "N/A"))

		return nil
	end

	calculate_progress(context, working_graph)
	spread_curse(context, working_graph)

	if with_belakor then
		spread_belakor(context, working_graph)
	end

	spread_minor_modifier_groups(context, working_graph)
	assign_conflict_settings(context, working_graph)
	spread_terror_event_power_ups(context, working_graph)

	local complete_graph = {}

	for key, base_node in pairs(working_graph) do
		local _, level_seed = random_generator()
		local seeds = deus_generate_seeds(level_seed)
		local weapon_pickup_seed = seeds.weapon_pickup_seed
		local pickups_seed = seeds.pickups_seed
		local mutator_seed = seeds.mutator_seed
		local blessings_seed = seeds.blessings_seed
		local power_ups_seed = seeds.power_ups_seed
		local node = {
			layout_x = base_node.layout_x,
			layout_y = base_node.layout_y,
			level_seed = level_seed,
			weapon_pickup_seed = weapon_pickup_seed,
			system_seeds = {
				pickups = pickups_seed,
				mutator = mutator_seed,
				blessings = blessings_seed,
				power_ups = power_ups_seed
			},
			theme = base_node.god or "wastes",
			minor_modifier_group = base_node.minor_modifier_group,
			run_progress = base_node.run_progress,
			conflict_settings = base_node.conflict_settings or "disabled",
			level_type = base_node.type,
			mutators = config.MUTATORS[base_node.type],
			terror_event_power_up = base_node.terror_event_power_up,
			terror_event_power_up_rarity = base_node.terror_event_power_up_rarity,
			possible_arena_belakor_nodes = base_node.possible_arena_belakor_nodes,
			next = table.clone(base_node.next)
		}

		if script_data.deus_shoppify_run and base_node.type ~= "START" and base_node.type ~= "ARENA" then
			local shop_types = table.keys(DeusShopSettings.shop_types)
			local random_id = random_generator(1, #shop_types)
			local shop_type = shop_types[random_id]
			base_node.level = shop_type
			base_node.type = "SHOP"
		end

		if base_node.type == "SIGNATURE" or base_node.type == "TRAVEL" or base_node.type == "ARENA" then
			node.base_level = base_node.level
			node.path = base_node.path
			local themes = config.LEVEL_AVAILABILITY[base_node.type][base_node.level].themes

			if not table.contains(themes, base_node.god or "wastes") then
				local any_theme = themes[1]

				Application.warning(string.format("[deus_populate_graph.lua] theme %s not found for level %s, using %s", base_node.god or "wastes", base_node.level, any_theme))

				node.level = get_level_name(base_node.level, base_node.path, any_theme)
			else
				node.level = get_level_name(base_node.level, base_node.path, base_node.god or "wastes")
			end

			local level_alias = config.LEVEL_ALIAS[node.level]

			if config.LEVEL_ALIAS[node.level] then
				node.level = level_alias
			end

			node.curse = base_node.curse
			node.node_type = "ingame"
		elseif base_node.type == "SHOP" then
			node.base_level = base_node.level
			node.level = base_node.level
			node.path = 0
			node.node_type = "shop"
		elseif base_node.type == "START" then
			node.level = "dlc_morris_map"
			node.path = 0
			node.base_level = "dlc_morris_map"
			node.node_type = "start"
		end

		printf("Generated node with: Level <%s>, level_seed <%s>, Run progress <%s>", node.level, level_seed, node.run_progress)

		complete_graph[key] = node
	end

	return complete_graph
end

return
