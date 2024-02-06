-- chunkname: @scripts/managers/game_mode/mechanisms/deus_generate_graph.lua

require("scripts/managers/game_mode/mechanisms/deus_base_graph_generator")
require("scripts/managers/game_mode/mechanisms/deus_layout_base_graph")
require("scripts/managers/game_mode/mechanisms/deus_populate_graph")

local base_graphs = require("scripts/settings/dlcs/morris/deus_map_baked_base_graphs")

function deus_generate_graph(seed, journey_name, dominant_god, populate_config, with_belakor)
	if type(seed) == "string" and string.starts_with(seed, "DEBUG_SPECIFIC_NODE") then
		local graph = table.clone(DeusDebugSpecificNodeGraph)
		local start_node = graph.start
		local seed_pattern = "SEED(.*)SEED_END"
		local level_seed = 0

		for capture in string.gmatch(seed, seed_pattern) do
			level_seed = tonumber(capture)
		end

		local without_prefix = string.gsub(seed, "DEBUG_SPECIFIC_NODE", "")
		local without_suffix = string.gsub(without_prefix, seed_pattern, "")
		local seeds = deus_generate_seeds(level_seed)

		start_node.level_seed = level_seed
		start_node.weapon_pickup_seed = seeds.weapon_pickup_seed
		start_node.system_seeds = {
			pickups = seeds.pickups_seed,
			mutator = seeds.mutator_seed,
			blessings = seeds.blessings_seed,
			power_ups = seeds.power_ups_seed,
		}

		printf("seeds used for this node: \n%s", table.tostring(seeds))

		local level = string.gsub(without_suffix, "^%w*_", "")
		local base_level = string.gsub(level, "(%w_+%w+).*", "%1")
		local progress = string.gsub(without_suffix, "_.*$", "")

		start_node.level = level
		start_node.base_level = base_level
		start_node.run_progress = progress ~= "" and tonumber(progress) / 1000 or 0

		if string.starts_with(level, "pat") then
			start_node.level_type = "TRAVEL"
		elseif string.starts_with(level, "sig") then
			start_node.level_type = "SIGNATURE"
		elseif string.starts_with(level, "arena") then
			start_node.level_type = "ARENA"
		else
			start_node.level_type = "START"
		end

		local theme

		for capture in string.gmatch(level, ".*_(.*)_path.") do
			theme = capture
		end

		if DeusThemeSettings[theme] then
			start_node.theme = theme
		end

		if level == "arena_belakor" then
			start_node.theme = "belakor"
		end

		if script_data.deus_force_load_curse then
			start_node.curse = script_data.deus_force_load_curse
			start_node.theme = theme ~= "wastes" and theme or "khorne"
		end

		return graph
	elseif type(seed) == "string" and string.starts_with(seed, "DEBUG_SHRINE_NODE") then
		return DeusDebugShrineNodeGraph
	elseif DeusDefaultGraphs[seed] then
		return DeusDefaultGraphs[seed]
	else
		local seed_number = type(seed) == "string" and tonumber(seed) or type(seed) == "number" and seed or 0
		local graphs = base_graphs[journey_name] or base_graphs.default

		seed_number = Math.next_random(seed_number)

		local keys = {}

		for key, _ in pairs(graphs) do
			keys[#keys + 1] = key
		end

		table.sort(keys)

		local keys_index

		seed_number, keys_index = Math.next_random(seed_number, 1, #keys)

		local chosen_graph = keys[keys_index]
		local base_graph = graphs[chosen_graph]
		local complete_graph = deus_populate_graph(base_graph, seed_number, populate_config, dominant_god, with_belakor)

		return complete_graph
	end
end
