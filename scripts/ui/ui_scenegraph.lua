require("scripts/utils/colors")

UISceneGraph = {}
local UISceneGraph = UISceneGraph

UISceneGraph.init_scenegraph_cached = function (scenegraph)
	local hierarchical_scenegraph = scenegraph.hierarchical_scenegraph

	for i = 1, scenegraph.n_hierarchical_scenegraph, 1 do
		local scenegraph_object = hierarchical_scenegraph[i]

		EngineOptimized.scenegraph_cached_deinit(scenegraph_object.scene_graph_ref)

		scenegraph_object.scene_graph_ref = nil
		local children = scenegraph_object.children

		if children then
			local scene_graph_ref = EngineOptimized.scenegraph_cached_init(scenegraph_object.children)
			scenegraph_object.scene_graph_ref = scene_graph_ref
		end
	end
end

UISceneGraph.init_scenegraph = function (scenegraph)
	scenegraph = table.clone(scenegraph)
	local hierarchical_scenegraph = {}
	local n_hierarchical_scenegraph = 0
	local is_static = false
	local num_scenegraph_objects = 0

	for name, scene_object_data in pairs(scenegraph) do
		is_static = is_static or scene_object_data.is_static or false
		scene_object_data.name = name
		num_scenegraph_objects = num_scenegraph_objects + 1

		if not scene_object_data.parent then
			n_hierarchical_scenegraph = n_hierarchical_scenegraph + 1
			hierarchical_scenegraph[n_hierarchical_scenegraph] = scene_object_data
			local position = scene_object_data.position or {
				0,
				0,
				0
			}
			scene_object_data.local_position = position
			scene_object_data.world_position = Vector3Aux.box({}, Vector3Aux.unbox(position))
		end
	end

	local num_iterated_objects = n_hierarchical_scenegraph

	while num_iterated_objects < num_scenegraph_objects do
		for name, scene_object_data in pairs(scenegraph) do
			local parent = scene_object_data.parent

			if parent and not scene_object_data.world_position then
				fassert(scenegraph[parent], "No such parent %s in scene graph for object %s", parent, name)
				fassert(parent ~= name, "Object %q can't have itself as parent", name)

				local parent_data = scenegraph[parent]

				if parent_data.world_position then
					num_iterated_objects = num_iterated_objects + 1
					local position = scene_object_data.position or {
						0,
						0,
						0
					}
					scene_object_data.local_position = position

					assert(parent_data.world_position)
					assert(parent_data.world_position[3])

					local parent_world_position = Vector3Aux.unbox(parent_data.world_position)
					local local_position = Vector3Aux.unbox(position)
					scene_object_data.world_position = Vector3Aux.box({}, local_position + parent_world_position)
					scene_object_data.size = scene_object_data.size or table.clone(parent_data.size)

					if (scene_object_data.size[1] or 0) < 0 then
						scene_object_data.size[1] = scene_object_data.size[1] + parent_data.size[1]
					else
						scene_object_data.size[1] = scene_object_data.size[1] or 0
					end

					if (scene_object_data.size[2] or 0) < 0 then
						scene_object_data.size[2] = scene_object_data.size[2] + parent_data.size[2]
					else
						scene_object_data.size[2] = scene_object_data.size[2] or 0
					end

					local children = parent_data.children or {}
					local num_children = parent_data.num_children or 0
					children[num_children + 1] = scene_object_data
					parent_data.children = children
					parent_data.num_children = num_children + 1
				end
			end
		end
	end

	scenegraph.n_hierarchical_scenegraph = n_hierarchical_scenegraph
	scenegraph.hierarchical_scenegraph = hierarchical_scenegraph
	scenegraph.is_static = is_static

	if scenegraph.is_static then
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		scenegraph.w = w
		scenegraph.h = h
		scenegraph.dirty = false

		UISceneGraph.init_scenegraph_cached(scenegraph)
	end

	return ProtectMetaTable(MakeTableStrict(scenegraph))
end

local function handle_alignment(position, data, width, height, parent_size_x, parent_size_y)
	local horizontal_alignment = data.horizontal_alignment

	if horizontal_alignment then
		if horizontal_alignment == "center" then
			Vector3.set_x(position, (Vector3.x(position) + parent_size_x / 2) - width / 2)
		elseif horizontal_alignment == "right" then
			Vector3.set_x(position, (Vector3.x(position) + parent_size_x) - width)
		end
	end

	local vertical_alignment = data.vertical_alignment

	if vertical_alignment then
		if vertical_alignment == "center" then
			Vector3.set_y(position, (Vector3.y(position) + parent_size_y / 2) - height / 2)
		elseif vertical_alignment == "top" then
			Vector3.set_y(position, (Vector3.y(position) + parent_size_y) - height)
		end
	end
end

UISceneGraph.get_size = function (scenegraph, scenegraph_object_name)
	local scenegraph_object = scenegraph[scenegraph_object_name]
	local size = scenegraph_object.size

	return size
end

local Vector3Aux_unbox = Vector3Aux.unbox
local UISceneGraph_get_size = UISceneGraph.get_size
local Vector3_x = Vector3.x
local Vector3_y = Vector3.y
local Vector3_set_x = Vector3.set_x
local Vector3_set_y = Vector3.set_y
local Vector3_z = Vector3.z
local Vector3_set_z = Vector3.set_z

local function update_children(world_position, children, num_children, size_x, size_y)
	for i = 1, num_children, 1 do
		local child = children[i]
		local child_local_position = Vector3Aux_unbox(child.local_position)
		local child_world_position = world_position + child_local_position
		local child_size_x = child.size and child.size[1]
		local child_size_y = child.size and child.size[2]

		handle_alignment(child_world_position, child, child_size_x, child_size_y, size_x, size_y)

		local offset = child.offset

		if offset then
			Vector3_set_x(child_world_position, Vector3_x(child_world_position) + offset[1])
			Vector3_set_y(child_world_position, Vector3_y(child_world_position) + offset[2])

			local z = offset[3]

			if z then
				Vector3_set_z(child_world_position, Vector3_z(child_world_position) + z)
			end
		end

		Vector3Aux.box(child.world_position, child_world_position)

		local child_children = child.children

		if child_children then
			update_children(child_world_position, child_children, child.num_children, child_size_x or size_x, child_size_y or size_y)
		end
	end
end

local dummy_size = {}

UISceneGraph.update_scenegraph = function (scenegraph, parent_scenegraph, scenegraph_id)
	local w = RESOLUTION_LOOKUP.res_w
	local h = RESOLUTION_LOOKUP.res_h

	if scenegraph.is_static and (scenegraph.w ~= w or scenegraph.h ~= h or scenegraph.dirty) then
		scenegraph.w = w
		scenegraph.h = h
		scenegraph.dirty = false

		UISceneGraph.init_scenegraph_cached(scenegraph)
	end

	local hierarchical_scenegraph = scenegraph.hierarchical_scenegraph
	local scale = RESOLUTION_LOOKUP.scale
	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	local root_scale_x = UISettings.root_scale[1]
	local root_scale_y = UISettings.root_scale[2]
	root_scale_x = w / (UIResolutionWidthFragments() * scale)
	local w_inverse_scale = w * inverse_scale
	local h_inverse_scale = h * inverse_scale

	for i = 1, scenegraph.n_hierarchical_scenegraph, 1 do
		local scenegraph_object = hierarchical_scenegraph[i]
		local current_world_position = nil
		local size = scenegraph_object.size
		local parent_size = dummy_size

		if parent_scenegraph then
			current_world_position = Vector3Aux_unbox(UISceneGraph.get_world_position(parent_scenegraph, scenegraph_id))
			parent_size = UISceneGraph_get_size(parent_scenegraph, scenegraph_id)
		else
			current_world_position = Vector3Aux_unbox(scenegraph_object.local_position)
		end

		local parent_size_x = parent_size[1]
		local parent_size_y = parent_size[2]
		local size_x = size and size[1]
		local size_y = size and size[2]

		if scenegraph_object.is_root then
			size_y = size_y * h / (size_y * scale)
			size_x = size_x * root_scale_x
			size_y = size_y * root_scale_y
			local scaled_x = size_x * scale
			local scaled_y = size_y * scale
			local x = ((Vector3_x(current_world_position) + w / 2) - scaled_x / 2) * inverse_scale
			local y = ((Vector3_y(current_world_position) + h / 2) - scaled_y / 2) * inverse_scale

			Vector3_set_x(current_world_position, x)
			Vector3_set_y(current_world_position, y)
		elseif scenegraph_object.scale == "fit" then
			size_x = w * inverse_scale
			size_y = h * inverse_scale

			Vector3_set_x(current_world_position, 0)
			Vector3_set_y(current_world_position, 0)
		elseif scenegraph_object.scale == "hud_scale_fit" then
			size_x = size_x * root_scale_x
			size_y = h * inverse_scale
			local scaled_x = size_x * scale
			local x = ((Vector3_x(current_world_position) + w / 2) - scaled_x / 2) * inverse_scale

			Vector3_set_x(current_world_position, x)
			Vector3_set_y(current_world_position, 0)
		elseif scenegraph_object.scale == "hud_fit" then
			local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
			size_x = w * inverse_scale * (1 - safe_rect)
			size_y = h * inverse_scale * (1 - safe_rect)

			Vector3_set_x(current_world_position, w * safe_rect * 0.5 * inverse_scale)
			Vector3_set_y(current_world_position, h * safe_rect * 0.5 * inverse_scale)
		elseif scenegraph_object.scale == "aspect_ratio" then
			local aspect_ratio = w / h
			local default_aspect_ratio = size_x / size_y
			size_x = w
			size_y = h

			if math.abs(aspect_ratio - default_aspect_ratio) > 0.005 then
				size_x = w
				size_y = size_x / default_aspect_ratio

				if h < size_y then
					size_x = h * default_aspect_ratio
					size_y = h
				end
			end

			size_x = size_x * inverse_scale
			size_y = size_y * inverse_scale

			handle_alignment(current_world_position, scenegraph_object, size_x, size_y, w * inverse_scale, h * inverse_scale)
		elseif scenegraph_object.scale == "fit_width" then
			Vector3_set_x(current_world_position, 0)

			size_x = w * inverse_scale

			handle_alignment(current_world_position, scenegraph_object, nil, size_y, nil, h * inverse_scale)
		elseif scenegraph_object.scale == "fit_height" then
			Vector3_set_y(current_world_position, 0)

			size_y = h * inverse_scale

			handle_alignment(current_world_position, scenegraph_object, size_x, nil, w * inverse_scale, nil)
		end

		Vector3Aux.box(scenegraph_object.world_position, current_world_position)

		local children = scenegraph_object.children

		if children then
			if scenegraph.is_static then
				EngineOptimized.scenegraph_cached_update_children(scenegraph_object.scene_graph_ref, current_world_position, children, scenegraph_object.num_children, size_x, size_y)
			else
				EngineOptimized.scenegraph_update_children(current_world_position, children, scenegraph_object.num_children, size_x, size_y)
			end
		end
	end
end

UISceneGraph.get_world_position = function (scenegraph, scenegraph_object_name)
	fassert(rawget(scenegraph, scenegraph_object_name), "No such object name in scenegraph: %s", tostring(scenegraph_object_name))

	return scenegraph[scenegraph_object_name].world_position
end

UISceneGraph.get_local_position = function (scenegraph, scenegraph_object_name)
	return scenegraph[scenegraph_object_name].local_position
end

UISceneGraph.get_size_scaled = function (scenegraph, scenegraph_object_name, optional_scale)
	local scenegraph_object = scenegraph[scenegraph_object_name]
	local size = scenegraph_object.size

	if scenegraph_object.is_root then
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		local scale = RESOLUTION_LOOKUP.scale

		if optional_scale then
			scale = scale * optional_scale
		end

		local root_scale_x = UISettings.root_scale[1]
		local root_scale_y = UISettings.root_scale[2]
		root_scale_x = w / (UIResolutionWidthFragments() * scale)
		local size_x = size[1]
		local size_y = size[2]
		size_y = size_y * h / (size_y * scale)
		size_x = size_x * root_scale_x
		size_y = size_y * root_scale_y

		return Vector2(size_x, size_y)
	elseif scenegraph_object.scale == "fit" then
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		local inverse_scale = RESOLUTION_LOOKUP.inv_scale

		return Vector2(w * inverse_scale, h * inverse_scale)
	elseif scenegraph_object.scale == "hud_fit" then
		local safe_rect = (Application.user_setting("safe_rect") or 0) * 0.01
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		local inverse_scale = RESOLUTION_LOOKUP.inv_scale

		return Vector2(w * inverse_scale * (1 - safe_rect), h * inverse_scale * (1 - safe_rect))
	elseif scenegraph_object.scale == "fit_width" then
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		local inverse_scale = RESOLUTION_LOOKUP.inv_scale

		return Vector2(w * inverse_scale, size[2])
	elseif scenegraph_object.scale == "fit_height" then
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		local inverse_scale = RESOLUTION_LOOKUP.inv_scale

		return Vector2(size[1], h * inverse_scale)
	elseif scenegraph_object.scale == "aspect_ratio" then
		local w = RESOLUTION_LOOKUP.res_w
		local h = RESOLUTION_LOOKUP.res_h
		local inverse_scale = RESOLUTION_LOOKUP.inv_scale
		local size_x = size[1]
		local size_y = size[2]
		local aspect_ratio = w / h
		local default_aspect_ratio = size_x / size_y
		size_x = w
		size_y = h

		if math.abs(aspect_ratio - default_aspect_ratio) > 0.005 then
			size_x = w
			size_y = size_x / default_aspect_ratio

			if h < size_y then
				size_x = h * default_aspect_ratio
				size_y = h
			end
		end

		size_x = size_x * inverse_scale
		size_y = size_y * inverse_scale

		return Vector2(size_x, size_y)
	else
		if optional_scale then
			return Vector2(size[1] * optional_scale, size[2] * optional_scale)
		end

		return Vector2(size[1], size[2])
	end
end

UISceneGraph.set_local_position = function (scenegraph, scenegraph_object_name, new_position)
	local old_position = scenegraph[scenegraph_object_name].local_position
	old_position[1] = new_position[1]
	old_position[2] = new_position[2]
	old_position[3] = new_position[3]
end

UISceneGraph.screen_position_to_resolution_position = function (pos_x, pos_y, resolution_width, resolution_height)
	local current_width, current_height = Application.resolution()
	local new_x = resolution_width / current_width * pos_x
	local new_y = resolution_height / current_height * pos_y

	return new_x, new_y
end

local default_size = {
	5,
	5
}
local draw_color = Colors.get_color_table_with_alpha("maroon", 64)
local draw_text_color = Colors.get_color_table_with_alpha("white", 255)
local font_size = 10
local font_name = "arial"
local font_mtrl = "materials/fonts/" .. font_name

local function debug_render_scenegraph(ui_renderer, scenegraph, n_scenegraph)
	for i = 1, n_scenegraph, 1 do
		local draw = true
		local scenegraph_object = scenegraph[i]
		local size = table.clone(scenegraph_object.size) or table.clone(default_size)

		if scenegraph_object.scale == "fit" then
			local inverse_scale = RESOLUTION_LOOKUP.inv_scale
			local w = RESOLUTION_LOOKUP.res_w
			local h = RESOLUTION_LOOKUP.res_h
			size[1] = w * inverse_scale
			size[2] = h * inverse_scale
			draw = false
		end

		if scenegraph_object.is_root then
			local root_scale_x = UISettings.root_scale[1]
			local root_scale_y = UISettings.root_scale[2]
			local scale = RESOLUTION_LOOKUP.scale
			local w = RESOLUTION_LOOKUP.res_w
			local h = RESOLUTION_LOOKUP.res_h
			size[1] = size[1] * root_scale_x
			size[2] = size[2] * h / (size[2] * scale) * root_scale_y
			draw = false
		end

		local color = draw_color

		if scenegraph_object.debug_mark then
			color = Colors.get_color_table_with_alpha("green", 64)
		end

		if draw then
			UIRenderer.draw_rect(ui_renderer, Vector3(unpack(scenegraph_object.world_position)), size, color)
		end

		local position = Vector3(scenegraph_object.world_position[1], scenegraph_object.world_position[2], scenegraph_object.world_position[3] + 1)

		if draw then
			UIRenderer.draw_text(ui_renderer, scenegraph_object.name, font_mtrl, font_size, font_name, position, draw_text_color)
		end

		local children = scenegraph_object.children

		if children then
			debug_render_scenegraph(ui_renderer, children, #children)
		end
	end
end

UISceneGraph.debug_render_scenegraph = function (ui_renderer, scenegraph)
	debug_render_scenegraph(ui_renderer, scenegraph.hierarchical_scenegraph, scenegraph.n_hierarchical_scenegraph)
end

return
