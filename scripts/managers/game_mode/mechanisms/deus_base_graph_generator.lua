require("scripts/settings/dlcs/morris/deus_map_base_gen_settings")
require("scripts/settings/dlcs/morris/deus_map_seed_whitelist")
require("scripts/helpers/deus_gen_utils")

local node_type_list = {
	"SIGNATURE",
	"ARENA",
	"TRAVEL",
	"DUMMY",
	"SHOP",
	"START"
}
local CONNECTION_TYPES = {
	FINAL = "FINAL",
	NEW = "NEW",
	EXISTING = "EXISTING"
}

local function create_indent_string(depth)
	local ind = {}

	for ii = 0, depth % 100, 1 do
		ind[#ind + 1] = " "
	end

	return table.concat(ind)
end

local function dprint(depth, ...)
	if script_data.deus_base_graph_generator_debug then
		local message = sprintf(...)

		print("[deus_base_graph_generator.lua] " .. create_indent_string(depth) .. message)
	end
end

local function print_warning(message)
	print("[deus_base_graph_generator.lua] WARNING: " .. message)
end

local function get_random_from_weighted_table(random_generator, weighted_table)
	local total_weight_sum = 0

	for key, weight in pairs(weighted_table) do
		total_weight_sum = total_weight_sum + weight
	end

	local random = random_generator(0, total_weight_sum * 100)
	local current_weight_sum = 0

	for key, weight in pairs(weighted_table) do
		current_weight_sum = current_weight_sum + weight * 100

		if random <= current_weight_sum then
			return key
		end
	end

	return nil
end

local function get_random_node_type_list(random_generator)
	local node_type_list_copy = table.clone(node_type_list)

	for ii = #node_type_list_copy, 2, -1 do
		local swap = random_generator(1, ii)
		node_type_list_copy[ii] = node_type_list_copy[swap]
		node_type_list_copy[swap] = node_type_list_copy[ii]
	end

	return node_type_list_copy
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

local function shuffle_array(table, random_generator)
	for ii = #table, 2, -1 do
		local swap = random_generator(1, ii)
		table[ii] = table[swap]
		table[swap] = table[ii]
	end

	return table
end

local function sequence_fits(allowed_sequence, current_sequence, available_dummies)
	if #allowed_sequence + available_dummies < #current_sequence then
		return false
	end

	local used_dummies = 0

	for i, node_type in ipairs(current_sequence) do
		if node_type == "DUMMY" then
			if available_dummies - used_dummies <= 0 then
				return false
			end

			used_dummies = used_dummies + 1
		elseif node_type ~= allowed_sequence[i - used_dummies] then
			return false
		end
	end

	if available_dummies - used_dummies > 0 then
		return false
	end

	if #allowed_sequence + available_dummies == #current_sequence then
		return allowed_sequence[#allowed_sequence] == current_sequence[#current_sequence]
	end

	return true
end

local function is_node_an_ancestor(nodes, node_key, node_key_to_find)
	for _, prev_node in ipairs(nodes[node_key].prev) do
		if prev_node == node_key_to_find then
			return true
		else
			local res = is_node_an_ancestor(nodes, prev_node, node_key_to_find)

			if res then
				return true
			end
		end
	end

	return false
end

local function get_first_non_dummy_ancestors(nodes, node_key)
	if #nodes[node_key].prev == 0 then
		return {}
	end

	local non_dummy_ancestors = {}

	for _, prev in ipairs(nodes[node_key].prev) do
		if nodes[prev].type ~= "DUMMY" then
			non_dummy_ancestors[#non_dummy_ancestors + 1] = prev
		else
			local other_non_dummy_ancestors = get_first_non_dummy_ancestors(nodes, prev)

			for _, other_non_dummy_ancestor in ipairs(other_non_dummy_ancestors) do
				non_dummy_ancestors[#non_dummy_ancestors + 1] = other_non_dummy_ancestor
			end
		end
	end

	return non_dummy_ancestors
end

local function get_first_non_dummy_descendents(nodes, node_key)
	if #nodes[node_key].next == 0 then
		return {}
	end

	local non_dummy_descendents = {}

	for _, next in ipairs(nodes[node_key].next) do
		if nodes[next].type ~= "DUMMY" then
			non_dummy_descendents[#non_dummy_descendents + 1] = next
		else
			local other_non_dummy_descendents = get_first_non_dummy_descendents(nodes, next)

			for _, other_non_dummy_descendent in ipairs(other_non_dummy_descendents) do
				non_dummy_descendents[#non_dummy_descendents + 1] = other_non_dummy_descendent
			end
		end
	end

	return non_dummy_descendents
end

local function count_ancestors_of_type(nodes, node_key, type)
	if #nodes[node_key].prev == 0 then
		return {
			0
		}
	end

	local count_per_path = {}

	for _, prev in ipairs(nodes[node_key].prev) do
		local count = 0

		if nodes[prev].type == type then
			count = count + 1
		end

		local ancestor_count = count_ancestors_of_type(nodes, prev, type)

		for _, path_of_ancestor_count in ipairs(ancestor_count) do
			count_per_path[#count_per_path + 1] = count + path_of_ancestor_count
		end
	end

	return count_per_path
end

local function node_type_sequences_to_node(nodes, node_key)
	local type = nodes[node_key].type

	if #nodes[node_key].prev == 0 then
		return {
			{
				type
			}
		}
	end

	local sequences_per_path = {}

	for _, prev in ipairs(nodes[node_key].prev) do
		local sequences = node_type_sequences_to_node(nodes, prev)

		for _, sequence in ipairs(sequences) do
			sequence[#sequence + 1] = type
			sequences_per_path[#sequences_per_path + 1] = sequence
		end
	end

	return sequences_per_path
end

local function count_ancestors_in_straight_line(nodes, node_key)
	if #nodes[node_key].prev == 0 or #nodes[node_key].prev > 1 then
		return 0
	end

	local prev_key = nodes[node_key].prev[1]
	local prev = nodes[prev_key]

	fassert(prev.connected_to ~= 0, "this should never happen")

	if prev.connected_to > 1 then
		return 0
	end

	local type = nodes[node_key].type
	local is_traversed_node = type ~= "DUMMY" and type ~= "SHOP"

	return ((is_traversed_node and 1) or 0) + count_ancestors_in_straight_line(nodes, prev_key)
end

local function is_crossing(from_1, to_1, from_2, to_2)
	return (from_2 <= from_1 and to_1 < to_2) or (from_1 <= from_2 and to_2 < to_1)
end

local function get_paths_from(nodes, node_key)
	if #nodes[node_key].next == 0 then
		return {
			{
				node_key
			}
		}
	end

	local paths = {}

	for _, next in ipairs(nodes[node_key].next) do
		local next_paths = get_paths_from(nodes, next)

		for _, next_path in ipairs(next_paths) do
			next_path[#next_path + 1] = node_key
			paths[#paths + 1] = next_path
		end
	end

	return paths
end

local function get_visible_nodes(nodes, node_key, depth)
	local descendants = get_first_non_dummy_descendents(nodes, node_key)

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

local CONNECTION_VALIDATIONS = {
	check_if_not_already_connected = function (config, nodes, from, to)
		return not table.contains(nodes[from].next, to)
	end,
	check_if_does_not_create_cycle = function (config, nodes, from, to)
		if from == to then
			return false
		end

		if is_node_an_ancestor(nodes, from, to) then
			return false
		end

		return true
	end,
	check_if_not_at_max_incoming_connections = function (config, nodes, from, to)
		return #nodes[to].prev < config.MAX_INCOMING_CONNECTIONS_PER_NODE
	end,
	check_if_not_dummy = function (config, nodes, from, to)
		return nodes[to].type ~= "DUMMY"
	end,
	check_if_layer_above = function (config, nodes, from, to)
		local from_node = nodes[from]
		local to_node = nodes[to]
		local result = from_node.layout_x == to_node.layout_x - 1

		return result
	end,
	check_if_does_not_create_crossing = function (config, nodes, from, to)
		local from_node = nodes[from]
		local to_node = nodes[to]

		for node_key, node in pairs(nodes) do
			if node.layout_x == from_node.layout_x then
				for _, next_node_key in ipairs(node.next) do
					if is_crossing(from_node.layout_y, to_node.layout_y, node.layout_y, nodes[next_node_key].layout_y) then
						return false
					end
				end
			end
		end

		return true
	end,
	check_if_not_repeating_labels = function (config, nodes, from, to)
		local all_paths = get_paths_from(nodes, "start")

		for _, path in ipairs(all_paths) do
			local lookup = {}

			for _, node_key in ipairs(path) do
				local visible_nodes = get_visible_nodes(nodes, node_key, config.LABEL_LOOKAHEAD)

				for visible_node_key, visible_node in pairs(visible_nodes) do
					if visible_node.label and visible_node.label ~= 0 then
						local type_lookup = lookup[visible_node.type] or {}
						lookup[visible_node.type] = type_lookup
						local label_lookup = type_lookup[visible_node.label] or {}

						if #label_lookup > 0 and not table.contains(label_lookup, visible_node_key) then
							return false
						else
							label_lookup[#label_lookup + 1] = visible_node_key
						end

						type_lookup[visible_node.label] = label_lookup
					end
				end
			end
		end

		return true
	end
}
local CONNECTION_COUNT_VALIDATIONS = {
	{
		check_if_not_over_limit_of_straight_line = function (config, nodes, node_key)
			local count = count_ancestors_in_straight_line(nodes, node_key)

			return count < config.MAX_STRAIGHT_LINE
		end,
		check_if_not_start_node = function (config, nodes, node_key)
			return config.MAX_CONNECTIONS_PER_NODE == 1 or node_key ~= "start"
		end
	},
	{
		check_if_not_over_max_paths = function (config, nodes, node_key)
			local ancestor_count = count_ancestors_of_type(nodes, node_key, "TRAVEL")

			return #ancestor_count < config.MAX_PATHS
		end,
		check_if_not_dummy = function (config, nodes, node_key)
			return nodes[node_key].type ~= "DUMMY"
		end,
		check_if_not_start_node = function (config, nodes, node_key)
			return config.MAX_CONNECTIONS_PER_NODE == 1 or node_key ~= "start"
		end
	},
	{
		enforce_only_start_node = function (config, nodes, node_key)
			return config.MAX_CONNECTIONS_PER_NODE == 1 or node_key == "start"
		end
	}
}
local CONNECTION_TYPE_WEIGHT_TRANSFORMS = {
	NEW = {
		discourage_new_nodes_when_near_node_capacity = function (config, nodes, node_key, weight)
			local node_count = 0

			for key, node in pairs(nodes) do
				node_count = node_count + 1
			end

			if node_count < config.MAX_IDEAL_NODES * 0.5 then
				return weight
			end

			local half_max_nodes = config.MAX_IDEAL_NODES * 0.5
			local weight_range = weight
			local percentage_of_nodes_left = (node_count - half_max_nodes) / half_max_nodes

			return math.clamp(weight_range - weight_range * percentage_of_nodes_left, 1, weight_range)
		end
	},
	EXISTING = {},
	FINAL = {}
}
local START_NODE_VALIDATIONS = {
	force_start_on_start_node = function (config, nodes, node_type)
		return node_type == "START"
	end
}
local FINAL_NODE_VALIDATIONS = {
	end_with_arena = function (config, nodes, node_type)
		return node_type == "ARENA"
	end,
	only_one_signature_level_required_before_final_level = function (config, nodes, node_type)
		local current_node = nodes.final

		while current_node do
			if #current_node.prev ~= 1 then
				return false
			end

			local prev_node = nodes[current_node.prev[1]]

			if prev_node.type == "SIGNATURE" then
				return true
			end

			if prev_node.type ~= "DUMMY" then
				return false
			end

			current_node = prev_node
		end

		return false
	end,
	check_minimum_nodes = function (config, nodes, node_type)
		local count = 0

		for node_key, node in pairs(nodes) do
			if node_key ~= "final" and node.connected_to > #node.next then
				return true
			end

			count = count + 1
		end

		return config.MIN_NODES <= count
	end
}
local NODE_TYPE_VALIDATIONS = {
	ANY = {
		check_allowed_sequences = function (config, nodes, node_key, node_type)
			local allowed_sequences = config.ALLOWED_SEQUENCES
			local current_sequences = {}

			for _, prev in ipairs(nodes[node_key].prev) do
				local prev_sequences = node_type_sequences_to_node(nodes, prev)

				for _, prev_sequence in ipairs(prev_sequences) do
					prev_sequence[#prev_sequence + 1] = node_type
					current_sequences[#current_sequences + 1] = prev_sequence
				end
			end

			for _, current_sequence in ipairs(current_sequences) do
				local fit = false

				for _, allowed_sequence in ipairs(allowed_sequences) do
					local available_dummies = config._max_sequence_length - #allowed_sequence

					if sequence_fits(allowed_sequence, current_sequence, available_dummies) then
						fit = true

						break
					end
				end

				if not fit then
					return false
				end
			end

			return true
		end
	},
	ARENA = {
		only_on_final = function (config, nodes, node_key)
			return node_key == "final"
		end
	},
	SIGNATURE = {},
	TRAVEL = {},
	SHOP = {},
	DUMMY = {
		check_if_not_creating_dummy_choice = function (config, nodes, node_key)
			local prev = nodes[node_key].prev

			for _, prev_node_key in ipairs(prev) do
				local prev_next = nodes[prev_node_key].next

				for _, prev_next_node_key in ipairs(prev_next) do
					local prev_next_node = nodes[prev_next_node_key]

					if prev_next_node.type == "DUMMY" then
						return false
					end
				end
			end

			return true
		end,
		check_if_not_creating_consecutive_dummies = function (config, nodes, node_key)
			local prev = nodes[node_key].prev

			for _, prev_node_key in ipairs(prev) do
				if nodes[prev_node_key].type == "DUMMY" then
					return false
				end
			end

			return true
		end
	},
	START = {}
}
local LABEL_VALIDATIONS = {
	check_if_not_repeating_label = function (config, nodes, node_key)
		local all_paths = get_paths_from(nodes, "start")
		local node = nodes[node_key]
		local label = node.label
		local type = node.type

		for _, path in ipairs(all_paths) do
			local found_node_key = nil

			for _, other_node_key in ipairs(path) do
				local visible_nodes = get_visible_nodes(nodes, other_node_key, config.LABEL_LOOKAHEAD)

				for visible_node_key, visible_node in pairs(visible_nodes) do
					if visible_node.type == type and visible_node.label and visible_node.label == label then
						if not found_node_key then
							found_node_key = visible_node_key
						elseif found_node_key ~= visible_node_key then
							return false
						end
					end
				end
			end
		end

		return true
	end
}
local NODE_TYPE_SHUFFLERS = {
	prefer_not_shop_if_already_having_a_shop_choice = function (context, nodes, node_key, node_types)
		local needs_reshuffle = false
		local non_dummy_ancestors = get_first_non_dummy_ancestors(nodes, node_key)

		for _, non_dummy_ancestor in ipairs(non_dummy_ancestors) do
			local non_dummy_descendents = get_first_non_dummy_descendents(nodes, non_dummy_ancestor)

			for _, non_dummy_descendent in ipairs(non_dummy_descendents) do
				if non_dummy_descendent ~= node_key and nodes[non_dummy_descendent].type == "SHOP" then
					needs_reshuffle = true
				end
			end
		end

		if needs_reshuffle then
			local index = table.index_of(node_types, "SHOP")
			node_types[index] = node_types[#node_types]
			node_types[#node_types] = "SHOP"
		end
	end
}

local function validate_connection_to_existing_node(config, indent, nodes, from, to)
	local validator_names = config.CONNECTION_VALIDATIONS
	local validators = CONNECTION_VALIDATIONS

	for _, validator_name in ipairs(validator_names) do
		if not validators[validator_name](config, nodes, from, to) then
			return false
		end
	end

	return true
end

local function validate_connection_count(config, indent, nodes, node_key, connection_count)
	local validators_connection_count_names = config.CONNECTION_COUNT_VALIDATIONS[connection_count]
	local validators_connection_count = CONNECTION_COUNT_VALIDATIONS[connection_count]

	if validators_connection_count_names and validators_connection_count then
		for _, validator_name in ipairs(validators_connection_count_names) do
			if not validators_connection_count[validator_name](config, nodes, node_key) then
				return false
			end
		end
	end

	return true
end

local function validate_node_type(config, indent, nodes, node_key, node_type)
	if node_key == "start" then
		for _, validator_name in ipairs(config.START_NODE_VALIDATIONS) do
			if not START_NODE_VALIDATIONS[validator_name](config, nodes, node_type) then
				return false
			end
		end
	end

	if node_key == "final" then
		for _, validator_name in ipairs(config.FINAL_NODE_VALIDATIONS) do
			if not FINAL_NODE_VALIDATIONS[validator_name](config, nodes, node_type) then
				return false
			end
		end
	end

	for _, validator_name in ipairs(config.NODE_TYPE_VALIDATIONS.ANY) do
		if not NODE_TYPE_VALIDATIONS.ANY[validator_name](config, nodes, node_key, node_type) then
			return false
		end
	end

	local validation_list_for_type = config.NODE_TYPE_VALIDATIONS[node_type]
	local validators_for_type = NODE_TYPE_VALIDATIONS[node_type]

	for _, validator_name in ipairs(validation_list_for_type) do
		if not validators_for_type[validator_name](config, nodes, node_key, node_type) then
			return false
		end
	end

	return true
end

local function validate_until_the_end(config, indent, nodes, node_key)
	for _, next in pairs(nodes[node_key].next) do
		if not validate_node_type(config, indent, nodes, next, nodes[next].type) then
			return false
		end

		if not validate_until_the_end(config, indent, nodes, next) then
			return false
		end
	end

	return true
end

local create_process_node_action, create_assign_node_label_action, create_connect_action, create_connections_action, create_random_connection_action, create_connect_with_type_action, create_new_node_action, create_connection_to_existing_action = nil

function create_connection_to_existing_action(context, nodes, node_key, to_node_key)
	local node = nodes[node_key]
	local to_node = nodes[to_node_key]
	local connection_made = false

	local function revert_func()
		if connection_made then
			node.next[#node.next] = nil
			to_node.prev[#to_node.prev] = nil
			connection_made = false
		end
	end

	local function apply_func()
		node.next[#node.next + 1] = to_node_key
		to_node.prev[#to_node.prev + 1] = node_key
		connection_made = true
	end

	local function executor()
		apply_func()

		if validate_node_type(context.config, context.indent, nodes, to_node_key, to_node.type) and validate_until_the_end(context.config, context.indent, nodes, to_node_key) then
			return true
		end

		revert_func()

		return false
	end

	return {
		name = "connect_to_existing " .. node_key,
		run = function ()
			return executor()
		end,
		retry = function ()
			revert_func()

			return false
		end
	}
end

function create_new_node_action(context, nodes, node_key, name_override)
	local node = nodes[node_key]
	local layer, new_node_key = nil

	local function executor()
		local prev_node_count = context.node_count
		context.node_count = (prev_node_count and prev_node_count + 1) or 1
		new_node_key = name_override or "node_" .. context.node_count
		layer = node.layout_x + 1
		local nodes_for_layer = context.nodes_per_layer[layer]

		if not nodes_for_layer then
			nodes_for_layer = {}
			context.nodes_per_layer[layer] = nodes_for_layer
		end

		nodes_for_layer[#nodes_for_layer + 1] = new_node_key
		local y_position = #nodes_for_layer
		nodes[new_node_key] = {
			name = new_node_key,
			prev = {
				node_key
			},
			next = {},
			layout_x = layer,
			layout_y = y_position
		}
		node.next[#node.next + 1] = new_node_key
		local next_actions = {
			function ()
				return create_process_node_action(context, nodes, new_node_key)
			end
		}

		return true, next_actions
	end

	return {
		name = "new_node " .. node_key,
		run = function ()
			return executor()
		end,
		retry = function ()
			if new_node_key then
				nodes[new_node_key] = nil
				node.next[#node.next] = nil
				context.node_count = context.node_count - 1
				local nodes_for_layer = context.nodes_per_layer[layer]
				nodes_for_layer[#nodes_for_layer] = nil
			end

			return false
		end
	}
end

function create_connect_with_type_action(context, nodes, node_key, connection_type)
	local function create_shuffled_possible_connections()
		return get_random_key_list(nodes, context.random_generator)
	end

	local possible_connections = nil

	local function executor()
		if connection_type == CONNECTION_TYPES.NEW then
			local next_actions = {
				function ()
					return create_new_node_action(context, nodes, node_key)
				end
			}

			return true, next_actions
		elseif connection_type == CONNECTION_TYPES.EXISTING then
			if not possible_connections then
				possible_connections = create_shuffled_possible_connections()
			end

			local connection = nil

			while #possible_connections > 0 do
				local possible_connection = possible_connections[#possible_connections]
				possible_connections[#possible_connections] = nil

				if possible_connection ~= "final" and validate_connection_to_existing_node(context.config, context.indent, nodes, node_key, possible_connection) then
					connection = possible_connection

					break
				end
			end

			if not connection then
				return false
			end

			local next_actions = {
				function ()
					return create_connection_to_existing_action(context, nodes, node_key, connection)
				end
			}

			return true, next_actions
		elseif connection_type == CONNECTION_TYPES.FINAL then
			if not nodes.final then
				local next_actions = {
					function ()
						return create_new_node_action(context, nodes, node_key, "final")
					end
				}

				return true, next_actions
			else
				if validate_connection_to_existing_node(context.config, context.indent, nodes, node_key, "final") then
					local next_actions = {
						function ()
							return create_connection_to_existing_action(context, nodes, node_key, "final")
						end
					}

					return true, next_actions
				end

				return false
			end
		end

		fassert(false, "shouldn't come here")
	end

	return {
		name = "connection_type " .. node_key .. " " .. connection_type,
		run = function ()
			return executor()
		end,
		retry = function ()
			if connection_type == CONNECTION_TYPES.NEW then
				return false
			elseif connection_type == CONNECTION_TYPES.EXISTING then
				return executor()
			elseif connection_type == CONNECTION_TYPES.FINAL then
				if not nodes.final then
					return false
				else
					return false
				end
			end

			fassert(false, "shouldn't come here")
		end
	}
end

function create_random_connection_action(context, nodes, node_key)
	local function create_weights()
		local weights = {
			[CONNECTION_TYPES.NEW] = 100,
			[CONNECTION_TYPES.EXISTING] = 100,
			[CONNECTION_TYPES.FINAL] = 100
		}

		for connection_type, weight in pairs(weights) do
			local transformer_names = context.config.CONNECTION_TYPE_WEIGHT_TRANSFORMS[connection_type]

			for _, transformer_name in ipairs(transformer_names) do
				local transformer = CONNECTION_TYPE_WEIGHT_TRANSFORMS[connection_type][transformer_name]
				weights[connection_type] = transformer(context.config, nodes, node_key, weights[connection_type])
			end
		end

		return weights
	end

	local weights = nil

	local function executor()
		if not weights then
			weights = create_weights()
		end

		local connection_type = get_random_from_weighted_table(context.random_generator, weights)

		if connection_type then
			weights[connection_type] = nil
		end

		if not connection_type then
			return false
		end

		local next_actions = {
			function ()
				return create_connect_with_type_action(context, nodes, node_key, connection_type)
			end
		}

		return true, next_actions
	end

	return {
		name = "connection_type " .. node_key,
		run = function ()
			return executor()
		end,
		retry = function ()
			return executor()
		end
	}
end

function create_connections_action(context, nodes, node_key)
	local node = nodes[node_key]

	local function executor()
		local next_actions = {}

		for i = 1, node.connected_to, 1 do
			next_actions[i] = function ()
				return create_random_connection_action(context, nodes, node_key)
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

function create_connect_action(context, nodes, node_key)
	local node = nodes[node_key]

	local function create_shuffled_connection_count()
		local connection_count_array = {}

		for i = 1, context.config.MAX_CONNECTIONS_PER_NODE, 1 do
			connection_count_array[#connection_count_array + 1] = i
		end

		return shuffle_array(connection_count_array, context.random_generator)
	end

	local random_connection_count, last_attempt = nil

	local function executor()
		if not random_connection_count then
			random_connection_count = create_shuffled_connection_count()
		end

		while #random_connection_count > 0 do
			local new_connection_count = random_connection_count[#random_connection_count]
			random_connection_count[#random_connection_count] = nil

			if (not last_attempt or new_connection_count < last_attempt) and validate_connection_count(context.config, context.indent, nodes, node_key, new_connection_count) then
				node.connected_to = new_connection_count

				break
			end
		end

		if not node.connected_to then
			return false
		end

		last_attempt = node.connected_to
		local next_actions = {
			function ()
				return create_connections_action(context, nodes, node_key)
			end
		}

		return true, next_actions
	end

	return {
		name = "connect " .. node_key,
		run = function ()
			return executor()
		end,
		retry = function ()
			node.connected_to = nil

			return executor()
		end
	}
end

function create_assign_node_label_action(context, nodes, node_key)
	local node = nodes[node_key]
	local node_type = node.type
	local labels_left = nil
	local should_label = context.config.LABELLED_NODE_TYPES[node_type]

	local function executor()
		if should_label then
			if not labels_left then
				labels_left = {}
				local found_unused_label = false
				local unused_label_index = nil

				for i = 1, context.config.LABELS_AVAILABLE[node_type], 1 do
					local found = false

					for _, other_node in pairs(nodes) do
						if other_node.type == node_type and other_node.label == i then
							labels_left[#labels_left + 1] = i
							found = true

							break
						end
					end

					if not found and not found_unused_label then
						labels_left[#labels_left + 1] = i
						unused_label_index = #labels_left
						found_unused_label = true
					end
				end

				if found_unused_label then
					local val = labels_left[1]
					labels_left[1] = labels_left[unused_label_index]
					labels_left[unused_label_index] = val
				end
			end

			while #labels_left > 0 do
				local label_to_try = labels_left[#labels_left]
				labels_left[#labels_left] = nil
				local validator_names = context.config.LABEL_VALIDATIONS
				local validators = LABEL_VALIDATIONS
				node.label = label_to_try
				local failed = false

				for _, validator_name in ipairs(validator_names) do
					if not validators[validator_name](context.config, nodes, node_key) then
						failed = true

						break
					end
				end

				if failed then
					node.label = nil
				else
					break
				end
			end

			if not node.label then
				return false
			end
		end

		if node_key == "final" then
			return true
		else
			local next_actions = {
				function ()
					return create_connect_action(context, nodes, node_key)
				end
			}

			return true, next_actions
		end
	end

	return {
		name = "node_label " .. node_key,
		run = function ()
			return executor()
		end,
		retry = function ()
			if should_label then
				node.label = nil

				return executor()
			end

			return false
		end
	}
end

function create_process_node_action(context, nodes, node_key)
	local node = nodes[node_key]
	local shuffled_node_types = nil

	local function executor()
		if not shuffled_node_types then
			shuffled_node_types = get_random_node_type_list(context.random_generator)

			for _, shuffler_name in ipairs(context.config.NODE_TYPE_SHUFFLERS) do
				NODE_TYPE_SHUFFLERS[shuffler_name](context, nodes, node_key, shuffled_node_types)
			end

			table.reverse(shuffled_node_types)
		end

		while #shuffled_node_types > 0 do
			local node_type_to_try = shuffled_node_types[#shuffled_node_types]
			shuffled_node_types[#shuffled_node_types] = nil

			if validate_node_type(context.config, context.indent, nodes, node_key, node_type_to_try) then
				node.type = node_type_to_try

				break
			end
		end

		if not node.type then
			return false
		end

		local next_actions = {
			function ()
				return create_assign_node_label_action(context, nodes, node_key)
			end
		}

		return true, next_actions
	end

	return {
		name = "node " .. node_key,
		run = function ()
			return executor()
		end,
		retry = function ()
			node.type = nil

			return executor()
		end
	}
end

local function remove_dummy_nodes(nodes)
	local new_nodes = {}

	for node_key, node in pairs(nodes) do
		if node.type ~= "DUMMY" then
			new_nodes[node_key] = node
		else
			local next = node.next
			local prev = node.prev

			for _, prev_node_key in ipairs(prev) do
				local prev_node = nodes[prev_node_key]
				local new_next = {}

				for _, next_node_key in ipairs(prev_node.next) do
					if next_node_key ~= node_key then
						new_next[#new_next + 1] = next_node_key
					end
				end

				for _, next_node_key in ipairs(next) do
					new_next[#new_next + 1] = next_node_key
				end

				prev_node.next = new_next
			end

			for _, next_node_key in ipairs(next) do
				local next_node = nodes[next_node_key]
				local new_prev = {}

				for _, prev_node_key in ipairs(next_node.prev) do
					if prev_node_key ~= node_key then
						new_prev[#new_prev + 1] = prev_node_key
					end
				end

				for _, prev_node_key in ipairs(prev) do
					new_prev[#new_prev + 1] = prev_node_key
				end

				next_node.prev = new_prev
			end
		end
	end

	return new_nodes
end

function deus_base_graph_generator(seed, config)
	local random_generator = DeusGenUtils.create_random_generator(seed)
	local nodes = {
		start = {
			layout_x = 1,
			name = "start",
			layout_y = 1,
			prev = {},
			next = {}
		}
	}
	local max_sequence_length = 0

	for _, sequence in ipairs(config.ALLOWED_SEQUENCES) do
		max_sequence_length = math.max(#sequence, max_sequence_length)
	end

	config._max_sequence_length = max_sequence_length
	local nodes_per_layer = {
		{
			"start"
		}
	}
	local context = {
		indent = 0,
		random_generator = random_generator,
		config = config,
		nodes_per_layer = nodes_per_layer
	}

	local function per_action_callback(action_list, action)
		context.indent = #action_list
	end

	local action_list = {
		create_process_node_action(context, nodes, "start")
	}
	local generator = DeusGenEngine.get_generator(action_list, per_action_callback)

	return function ()
		local done, error_message = generator()

		if done then
			if not error_message then
				nodes = remove_dummy_nodes(nodes)
			else
				Application.warning("[deus_base_graph_generator.lua] failed to generate base graph, maybe the settings are impossible to solve? error: " .. (error_message or "N/A"))
			end
		end

		return done, error_message, nodes
	end
end

return
