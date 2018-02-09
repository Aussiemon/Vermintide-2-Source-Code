LuaAStar = LuaAStar or {}
LuaAStar.cached_paths = {}
local cached_paths = LuaAStar.cached_paths

function dist_between(pos_a, pos_b)
	return Vector3.distance(pos_a, pos_b)
end

function dist_between_nodes(node_a, node_b)
	return Vector3.distance(node_a.get_group_center(node_a):unbox(), node_b.get_group_center(node_b):unbox())
end

function heuristic_cost_estimate(node1, node2)
	return dist_between_nodes(node1, node2)
end

function is_valid_node(node, neighbor)
	return true
end

function lowest_f_score_node(nodes, f_score)
	local lowest = math.huge
	local best_node = nil

	for i = 1, #nodes, 1 do
		local node = nodes[i]
		local score = f_score[node]

		if score < lowest then
			best_node = node
			lowest = score
		end
	end

	return best_node
end

function neighbour_nodes(source_node, nodes)
	local neighbour_nodes = source_node.get_group_neighbours(source_node)
	local array = {}

	for node, _ in pairs(neighbour_nodes) do
		array[#array + 1] = node
	end

	return array
end

function not_in(nodes, node)
	local size = #nodes

	for i = 1, size, 1 do
		if nodes[i] == node then
			return false
		end
	end

	return true
end

function remove_node(nodes, node)
	local size = #nodes

	for i = 1, size, 1 do
		if nodes[i] == node then
			nodes[i] = nodes[size]
			nodes[size] = nil

			break
		end
	end

	return 
end

function reconstruct_path(path, came_from, current_node)
	if came_from[current_node] then
		table.insert(path, 1, came_from[current_node])

		return reconstruct_path(path, came_from, came_from[current_node])
	else
		return path
	end

	return 
end

LuaAStar.a_star_plain = function (nodes, node1, node2)
	local closed_set = {}
	local open_set = {
		node1
	}
	local came_from = {}
	local g_score = {}
	local f_score = {}
	g_score[node1] = 0
	f_score[node1] = g_score[node1] + heuristic_cost_estimate(node1, node2)

	while 0 < #open_set do
		local current = lowest_f_score_node(open_set, f_score)

		if current == node2 then
			local path = reconstruct_path({}, came_from, node2)
			path[#path + 1] = node2

			return path, f_score[current]
		end

		remove_node(open_set, current)

		closed_set[#closed_set + 1] = current
		local neighbour_nodes = neighbour_nodes(current, nodes)

		for i = 1, #neighbour_nodes, 1 do
			local neighbour = neighbour_nodes[i]

			if not_in(closed_set, neighbour) then
				local tentative_g_score = g_score[current] + dist_between_nodes(current, neighbour)

				if not_in(open_set, neighbour) or tentative_g_score < g_score[neighbour] then
					came_from[neighbour] = current
					g_score[neighbour] = tentative_g_score
					f_score[neighbour] = g_score[neighbour] + heuristic_cost_estimate(neighbour, node2)

					if not_in(open_set, neighbour) then
						open_set[#open_set + 1] = neighbour
					end
				end
			end
		end
	end

	return nil
end
LuaAStar.clear_cached_paths = function ()
	cached_paths = nil

	return 
end
LuaAStar.a_star_cached = function (nodes, a1, a2)
	if not cached_paths[a1] then
		cached_paths[a1] = {}
	elseif cached_paths[a1][a2] then
		local cached_path = cached_paths[a1][a2]

		return cached_path[1], cached_path[2], true
	end

	local path, length = LuaAStar.a_star_plain(nodes, a1, a2)
	cached_paths[a1][a2] = {
		path,
		length
	}

	return path, length
end

return 
