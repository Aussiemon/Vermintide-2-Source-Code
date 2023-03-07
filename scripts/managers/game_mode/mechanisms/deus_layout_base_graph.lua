require("scripts/settings/dlcs/morris/deus_default_graph_settings")
require("scripts/settings/dlcs/morris/deus_map_layout_settings")

local function add_force(config, node, force_x, force_y)
	node.acc_x = math.clamp(-config.FORCE_MAX, node.acc_x + force_x, config.FORCE_MAX)
	node.acc_y = math.clamp(-config.FORCE_MAX, node.acc_y + force_y, config.FORCE_MAX)
end

local function attract(config, attractor, attracted)
	local dx = attracted.pos_x - attractor.pos_x
	local dy = attracted.pos_y - attractor.pos_y

	if dx ~= 0 or dy ~= 0 then
		local distance = math.sqrt(dx * dx + dy * dy)
		dx = dx / distance
		dy = dy / distance
		local strength = -1 * config.SPRING_CONSTANT * distance * 0.5

		add_force(config, attracted, strength * dx, strength * dy)
	end
end

local function repel(config, repeller, reppeled)
	local dx = reppeled.pos_x - repeller.pos_x
	local dy = reppeled.pos_y - repeller.pos_y

	if dx ~= 0 or dy ~= 0 then
		local distance = math.sqrt(dx * dx + dy * dy)
		dx = dx / distance
		dy = dy / distance
		local strength = config.REPEL_CONSTANT * repeller.mass * reppeled.mass / (distance * distance)

		add_force(config, reppeled, strength * dx, strength * dy)
	end
end

local function move(config, node)
	node.vel_x = (node.vel_x + node.acc_x * config.DELTA * config.NODE_SPEED) * config.DAMPING_FACTOR
	node.vel_y = (node.vel_y + node.acc_y * config.DELTA * config.NODE_SPEED) * config.DAMPING_FACTOR
	node.pos_x = node.pos_x + node.vel_x
	node.pos_y = node.pos_y + node.vel_y
	node.acc_x = 0
	node.acc_y = 0
end

local function update(config, nodes, edges)
	for _, edge in ipairs(edges) do
		attract(config, nodes[edge.from], nodes[edge.to])
		attract(config, nodes[edge.to], nodes[edge.from])
	end

	for _, node in pairs(nodes) do
		if not node.anchor then
			for _, other_node in pairs(nodes) do
				if node ~= other_node then
					repel(config, node, other_node)
				end
			end
		end
	end

	for _, node in pairs(nodes) do
		if not node.anchor then
			move(config, node)
		end
	end
end

local function normalize(nodes)
	local max_height_per_layer = {}
	local max_layer = 0

	for _, node in pairs(nodes) do
		local layer_height = max_height_per_layer[node.layout_x]
		max_height_per_layer[node.layout_x] = layer_height and math.max(layer_height, node.layout_y) or node.layout_y
		max_layer = math.max(max_layer, node.layout_x)
	end

	local new_nodes = {}

	for key, node in pairs(nodes) do
		node = table.clone(node)
		new_nodes[key] = node
		local layer = node.layout_x
		node.layout_x = layer / max_layer
		node.layout_y = node.layout_y / (max_height_per_layer[layer] + 1)
	end

	return new_nodes
end

local function setup(config, map)
	map = normalize(map)
	local nodes = {}
	local edges = {}
	local min_x = math.huge
	local max_x = -math.huge

	for key, node in pairs(map) do
		local pos_x = config.WIDTH * node.layout_x
		local pos_y = config.HEIGHT * node.layout_y
		local anchor, mass = nil
		min_x = math.min(pos_x, min_x)
		max_x = math.max(pos_x, max_x)

		if key == "start" then
			anchor = false
			mass = config.DEFAULT_MASS
		elseif #node.next == 0 then
			anchor = false
			mass = config.DEFAULT_MASS
		else
			anchor = false
			mass = config.DEFAULT_MASS
		end

		nodes[key] = {
			acc_y = 0,
			acc_x = 0,
			vel_x = 0,
			vel_y = 0,
			pos_x = pos_x,
			pos_y = pos_y,
			anchor = anchor,
			mass = mass
		}

		for _, next in ipairs(node.next) do
			edges[#edges + 1] = {
				from = key,
				to = next
			}
		end
	end

	nodes.start_anchor = {
		acc_y = 0,
		acc_x = 0,
		vel_x = 0,
		anchor = true,
		vel_y = 0,
		pos_y = 0,
		pos_x = min_x - config.WIDTH,
		mass = config.START_MASS
	}
	edges[#edges + 1] = {
		from = "start_anchor",
		to = "start"
	}
	nodes.final_anchor = {
		acc_y = 0,
		acc_x = 0,
		vel_x = 0,
		anchor = true,
		vel_y = 0,
		pos_y = 0,
		pos_x = max_x + config.WIDTH,
		mass = config.END_MASS
	}
	edges[#edges + 1] = {
		from = "final",
		to = "final_anchor"
	}

	return nodes, edges
end

local function apply_result(config, layout_nodes, base_graph)
	local min_x = math.huge
	local max_x = -math.huge
	local min_y = math.huge
	local max_y = -math.huge

	for key, node in pairs(layout_nodes) do
		local base_graph_node = base_graph[key]

		if base_graph_node then
			min_x = math.min(min_x, node.pos_x)
			min_y = math.min(min_y, node.pos_y)
			max_x = math.max(max_x, node.pos_x)
			max_y = math.max(max_y, node.pos_y)
		end
	end

	local width = max_x - min_x
	local height = max_y - min_y

	for key, node in pairs(layout_nodes) do
		local base_graph_node = base_graph[key]

		if base_graph_node then
			base_graph[key].layout_x = width ~= 0 and (node.pos_x - min_x) / width or 0
			base_graph[key].layout_y = height ~= 0 and (node.pos_y - min_y) / height or 0
		end
	end
end

function deus_layout_normalize(base_graph)
	return normalize(base_graph)
end

function deus_layout_base_graph(base_graph, config)
	local nodes, edges = setup(config, base_graph)

	for i = 1, config.LAYOUT_TICKS do
		update(config, nodes, edges)
	end

	apply_result(config, nodes, base_graph)

	return base_graph
end

function debug_deus_create_realtime_layout_updater(base_graph, config)
	local nodes, edges = setup(config, base_graph)
	local count = config.LAYOUT_TICKS

	return function ()
		if count > 0 then
			update(config, nodes, edges)
			apply_result(config, nodes, base_graph)

			count = count - 1

			return false, base_graph
		end

		return true, base_graph
	end
end
