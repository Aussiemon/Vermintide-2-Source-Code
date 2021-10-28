require("scripts/ui/ui_resolution")

UISceneGraph = {}
local UISceneGraph = UISceneGraph
local Vector2 = Vector2
local Vector3 = Vector3
local RESOLUTION_LOOKUP = RESOLUTION_LOOKUP
local Application = Application
local fassert = fassert
local ZERO_VECTOR3 = {
	0,
	0,
	0
}

local function to_vector2_table(t)
	return {
		t[1],
		t[2]
	}
end

local function to_vector3_table(t)
	return {
		t[1],
		t[2],
		t[3] or 0
	}
end

local ALIGN_KWORD_MULT = {
	left = 0,
	bottom = 0,
	top = 1,
	center = 0.5,
	right = 1
}

local function align(x, dx, align)
	return x + dx * (ALIGN_KWORD_MULT[align] or 0)
end

local NEWINDEX_ERR_MT = {
	__newindex = function (t, k, v)
		local err_msg = string.format("[UIScenegraph] Cannot add field %q to %s", k, t)

		print(err_msg)

		return rawset(t, k, v)
	end
}

local function legacy_merge_no_override(node, node_def)
	for k, v in pairs(node_def) do
		if node[k] == nil then
			Application.warning(string.format("[UIScenegraph] Node polluted: scenegraph[%q][%q]\n%s", node.name, k, Script.callstack()))

			node[k] = (type(v) == "table" and table.clone(v)) or v
		end
	end
end

local function scenegraph_visit_node(scenegraph, scenegraph_def, name, node_def)
	fassert(scenegraph[name] == nil, "Cycle detected at %q", name)
	fassert(node_def, "Missing definition for %q", name)

	scenegraph[name] = false
	local parent_name = node_def.parent

	if not parent_name then
		local local_position = to_vector3_table(node_def.position)
		local node = {
			parent = false,
			name = name,
			world_position = to_vector3_table(node_def.position),
			local_position = local_position,
			position = local_position,
			size = to_vector2_table(node_def.size),
			horizontal_alignment = node_def.horizontal_alignment,
			vertical_alignment = node_def.vertical_alignment,
			is_root = node_def.is_root,
			scale = node_def.scale
		}

		legacy_merge_no_override(node, node_def)

		scenegraph[name] = node
		scenegraph[#scenegraph + 1] = node

		return
	end

	local parent = scenegraph[parent_name]

	if not parent then
		scenegraph_visit_node(scenegraph, scenegraph_def, parent_name, scenegraph_def[parent_name])

		parent = scenegraph[parent_name]
	end

	local parent_world_position = parent.world_position
	local local_position = to_vector3_table(node_def.position or ZERO_VECTOR3)
	local size = to_vector2_table(node_def.size or parent.size)

	if size[1] < 0 then
		size[1] = size[1] + parent.size[1]
	end

	if size[2] < 0 then
		size[2] = size[2] + parent.size[2]
	end

	local node = {
		name = name,
		parent = parent_name,
		world_position = {
			local_position[1] + parent_world_position[1],
			local_position[2] + parent_world_position[2],
			local_position[3] + parent_world_position[3]
		},
		local_position = local_position,
		position = local_position,
		size = size,
		horizontal_alignment = node_def.horizontal_alignment,
		vertical_alignment = node_def.vertical_alignment,
		offset = node_def.offset and to_vector2_table(node_def.offset)
	}

	legacy_merge_no_override(node, node_def)
	setmetatable(node, NEWINDEX_ERR_MT)

	scenegraph[name] = node
	local num_children = rawget(parent, "num_children")

	if not num_children then
		rawset(parent, "children", {
			node
		})
		rawset(parent, "num_children", 1)
	else
		num_children = num_children + 1
		parent.children[num_children] = node
		parent.num_children = num_children
	end
end

UISceneGraph.init_scenegraph = function (scenegraph_def)
	local scenegraph = {}

	for name, node in pairs(scenegraph_def) do
		if not scenegraph[name] then
			scenegraph_visit_node(scenegraph, scenegraph_def, name, node)
		end
	end

	return setmetatable(scenegraph, NEWINDEX_ERR_MT)
end

local function scenegraph_update_children(world_position, children, num_children, size_x, size_y)
	for i = 1, num_children, 1 do
		local child = children[i]
		local x, y, z = nil
		local box = child.local_position
		z = box[3]
		y = box[2]
		x = box[1]
		local size = child.size
		local child_size_x = child.size[1]
		local child_size_y = child.size[2]
		x = align(x + world_position[1], size_x - child_size_x, child.horizontal_alignment)
		y = align(y + world_position[2], size_y - child_size_y, child.vertical_alignment)
		local offset = child.offset

		if offset then
			x = x + offset[1]
			y = y + offset[2]
			local offset_z = offset[3]

			if offset_z then
				z = z + offset_z
			end
		end

		local box = child.world_position
		box[2] = z
		box[2] = y
		box[1] = x
		local child_children = child.children

		if child_children then
			scenegraph_update_children(box, child_children, child.num_children, child_size_x, child_size_y)
		end
	end
end

UISceneGraph.update_scenegraph = function (scenegraph, parent_scenegraph, scenegraph_id)
	local w = RESOLUTION_LOOKUP.res_w
	local h = RESOLUTION_LOOKUP.res_h
	local scale = RESOLUTION_LOOKUP.scale
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	local root_scale_x = w / (1920 * scale)
	local root_scale_y = UISettings.root_scale[2]

	for i = 1, #scenegraph, 1 do
		local node = scenegraph[i]
		local name = node.name
		local x, y, z = nil

		if parent_scenegraph then
			local box = parent_scenegraph[scenegraph_id].world_position
			z = box[3]
			y = box[2]
			x = box[1]
		else
			local box = node.local_position
			z = box[3]
			y = box[2]
			x = box[1]
		end

		local size = node.size
		local size_x = size[1]
		local size_y = size[2]

		if node.is_root then
			size_x = root_scale_x * size_x
			size_y = root_scale_y * h * inverse_scale
			x = (x + (w - size_x * scale) * 0.5) * inverse_scale
			y = (y + (h - size_y * scale) * 0.5) * inverse_scale
		else
			local scale_mode = node.scale

			if scale_mode == "fit" then
				size_x = w * inverse_scale
				size_y = h * inverse_scale
				x = 0
				y = 0
			elseif scale_mode == "hud_scale_fit" then
				size_x = size_x * root_scale_x
				size_y = h * inverse_scale
				x = (x + (w - size_x * scale) * 0.5) * inverse_scale
				y = 0
			elseif scale_mode == "hud_fit" then
				local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
				size_x = w * inverse_scale * (1 - safe_rect)
				size_y = h * inverse_scale * (1 - safe_rect)
				x = w * safe_rect * inverse_scale * 0.5
				y = h * safe_rect * inverse_scale * 0.5
			elseif scale_mode == "aspect_ratio" then
				local aspect_ratio_screen = w / h
				local aspect_ratio_node = size_x / size_y

				if aspect_ratio_screen < aspect_ratio_node then
					size_x = w
					size_y = w / aspect_ratio_node
				else
					size_x = h * aspect_ratio_node
					size_y = h
				end

				size_x = size_x * inverse_scale
				size_y = size_y * inverse_scale
				x = align(x, w * inverse_scale - size_x, node.horizontal_alignment)
				y = align(y, h * inverse_scale - size_y, node.vertical_alignment)
			elseif scale_mode == "fit_width" then
				size_x = w * inverse_scale
				x = 0
				y = align(y, h * inverse_scale - size_y, node.vertical_alignment)
			elseif scale_mode == "fit_height" then
				size_y = h * inverse_scale
				x = align(x, w * inverse_scale - size_x, node.horizontal_alignment)
				y = 0
			end
		end

		local box = node.world_position
		box[3] = z
		box[2] = y
		box[1] = x
		local children = node.children

		if children then
			scenegraph_update_children(node.world_position, children, node.num_children, size_x, size_y)
		end
	end
end

UISceneGraph.get_size = function (scenegraph, node_name)
	local node = scenegraph[node_name]

	return node.size
end

UISceneGraph.get_world_position = function (scenegraph, node_name)
	local node = scenegraph[node_name]

	return node.world_position
end

UISceneGraph.get_local_position = function (scenegraph, node_name)
	local node = scenegraph[node_name]

	return node.local_position
end

UISceneGraph.get_size_scaled = function (scenegraph, node_name, optional_scale)
	local node = scenegraph[node_name]
	local size = node.size

	if node.is_root then
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		local inverse_scale = RESOLUTION_LOOKUP.inv_scale

		if optional_scale then
			inverse_scale = inverse_scale / optional_scale
		end

		return Vector2((w * inverse_scale) / 1920 * size[1], h * inverse_scale * UISettings.root_scale[2])
	end

	local scale_mode = node.scale

	if not scale_mode then
		if not optional_scale then
			return Vector2(size[1], size[2])
		else
			return Vector2(size[1] * optional_scale, size[2] * optional_scale)
		end
	end

	local w = RESOLUTION_LOOKUP.res_w
	local h = RESOLUTION_LOOKUP.res_h
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale

	if scale_mode == "fit" then
		return Vector2(w * inverse_scale, h * inverse_scale)
	elseif scale_mode == "hud_fit" then
		local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01

		return Vector2(w * inverse_scale * (1 - safe_rect), h * inverse_scale * (1 - safe_rect))
	elseif scale_mode == "fit_width" then
		return Vector2(w * inverse_scale, size[2])
	elseif scale_mode == "fit_height" then
		return Vector2(size[1], h * inverse_scale)
	elseif scale_mode == "aspect_ratio" then
		local size_x = size[1]
		local size_y = size[2]
		local aspect_ratio_screen = w / h
		local aspect_ratio_node = size_x / size_y

		if aspect_ratio_screen < aspect_ratio_node then
			size_x = w
			size_y = w / aspect_ratio_node
		else
			size_x = h * aspect_ratio_node
			size_y = h
		end

		return Vector2(size_x * inverse_scale, size_y * inverse_scale)
	end
end

UISceneGraph.set_local_position = function (scenegraph, node_name, new_position)
	local node = scenegraph[node_name]
	local old_position = node.local_position
	old_position[1] = new_position[1]
	old_position[2] = new_position[2]
	old_position[3] = new_position[3]
end

local function draw_border(gui, pos, size, color, border)
	border = border or 5
	pos = pos + Vector3(0, 0, 1)
	local w = size[1]
	local h = size[2] - 2 * border

	Gui.rect(gui, Vector3(pos[1], pos[2], pos[3]), Vector2(w, border), color)
	Gui.rect(gui, Vector3(pos[1], (pos[2] + size[2]) - border, pos[3]), Vector2(w, border), color)
	Gui.rect(gui, Vector3(pos[1], pos[2] + border, pos[3]), Vector2(border, h), color)
	Gui.rect(gui, Vector3((pos[1] + size[1]) - border, pos[2] + border, pos[3]), Vector2(border, h), color)
end

local function debug_render_scenegraph(ui_renderer, scenegraph, n_scenegraph, force_draw_depth)
	local cursor = Mouse.axis(Mouse.axis_id("cursor"))
	local inside_box = math.point_is_inside_2d_box
	local gui = Debug.gui
	force_draw_depth = force_draw_depth - 1
	local border = 4

	for i = 1, n_scenegraph, 1 do
		local node = scenegraph[i]
		local pos = node.world_position
		local size = node.size

		if force_draw_depth >= 0 or inside_box(cursor, pos, size) then
			local name = node.name
			local posV3 = Vector3(pos[1], pos[2], pos[3])
			local hue = tonumber(string.sub(Application.make_hash(name), 8), 16) / 4294967296.0
			local r, g, b = Colors.hsl2rgb(hue, 0.75, 0.5)

			Gui.rect(gui, posV3, Vector2(size[1], size[2]), Color(20, r, g, b))

			local label = string.format("%s (%d,%d,%d)[%d,%d]", name, pos[1], pos[2], pos[3], size[1], size[2])

			Gui.text(gui, label, "materials/fonts/arial", 16, nil, posV3 + Vector2(border, border), Color(200, r, g, b), "shadow", Color(200, 0, 0, 0))
			draw_border(gui, posV3, size, Color(50, r, g, b), border)

			local children = node.children

			if children then
				debug_render_scenegraph(ui_renderer, children, #children, force_draw_depth)
			end
		end
	end
end

UISceneGraph.debug_render_scenegraph = function (ui_renderer, scenegraph, force_draw_depth)
	return debug_render_scenegraph(ui_renderer, scenegraph, #scenegraph, force_draw_depth or 1)
end

return
