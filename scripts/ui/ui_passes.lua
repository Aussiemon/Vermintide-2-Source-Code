-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/utils/colors")
require("scripts/settings/ui_settings")
require("scripts/settings/inventory_settings")
require("scripts/settings/ui_frame_settings")
require("scripts/utils/utf8_utils")
require("scripts/ui/ui_passes_tooltips")

local function get_line_color_override(line_index, line_length, line_global_start_index, ui_style)
	local color_override = ui_style.color_override
	local internal_color_overrides = ui_style.internal_color_overrides

	if not internal_color_overrides then
		internal_color_overrides = {}
		ui_style.internal_color_overrides = internal_color_overrides
	end

	local line_color_override = internal_color_overrides[line_index]
	local num_color_overrides = #color_override

	if 0 < num_color_overrides then
		if not line_color_override then
			line_color_override = {}
			internal_color_overrides[line_index] = line_color_override
		end

		local num_updates = math.max(num_color_overrides, #line_color_override)

		for k = 1, num_updates, 1 do
			local override = color_override[k]

			if override then
				local color = override.color
				local start_index = override.start_index
				local end_index = override.end_index
				local vector_color = Color(color[1], color[2], color[3], color[4])

				if line_global_start_index < start_index and end_index <= line_global_start_index + line_length then
					if not line_color_override[k] then
						line_color_override[k] = {}
					end

					local line_color_values = line_color_override[k]
					line_color_values.color = vector_color
					line_color_values.start_index = start_index - line_global_start_index
					line_color_values.end_index = math.min(line_length, end_index - line_global_start_index)
				elseif end_index <= line_global_start_index - line_length and line_global_start_index - line_length <= start_index then
					if not line_color_override[k] then
						line_color_override[k] = {}
					end

					local line_color_values = line_color_override[k]
					line_color_values.color = vector_color
					line_color_values.start_index = 1
					line_color_values.end_index = (line_global_start_index + line_length) - end_index
				else
					line_color_override[k] = nil
				end
			else
				line_color_override[k] = nil
			end
		end
	else
		return nil
	end

	if line_color_override and 0 < #line_color_override then
		return line_color_override
	end

	return 
end

UIPasses = UIPasses or {}
local UIRenderer = UIRenderer
local UIRenderer_draw_texture = UIRenderer.draw_texture
local UIRenderer_draw_texture_uv = UIRenderer.draw_texture_uv
UIPasses.texture_uv_dynamic_color_uvs_size_offset = {
	init = function (pass_definition)
		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return nil
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		if pass_data.retained_id then
			UIRenderer.destroy_bitmap(ui_renderer, pass_data.retained_id)

			pass_data.retained_id = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if pass_definition.content_id and not ui_content[pass_definition.content_id] then
		end

		if pass_definition.style_id and not ui_style[pass_definition.style_id] then
		end

		local color, uvs, size, offset = pass_definition.dynamic_function(ui_content, ui_style, size, dt, ui_renderer)
		local texture_index = ui_content.texture_index

		if not texture_index or not ui_content[pass_definition.texture_id or "texture_id"][texture_index] then
			local texture = ui_content[pass_definition.texture_id or "texture_id"]
		end

		if offset then
			position = position + Vector3(offset[1], offset[2], offset[3])
		end

		if pass_definition.retained_mode then
			local retained_id = pass_definition.retained_mode and ((pass_data.retained_id and pass_data.retained_id) or true)
			retained_id = UIRenderer_draw_texture_uv(ui_renderer, texture, position, size, uvs, color, ui_style and ui_style.masked, ui_style and ui_style.saturated, retained_id)
			pass_data.retained_id = (retained_id and retained_id) or pass_data.retained_id
			pass_data.dirty = false
		else
			return UIRenderer_draw_texture_uv(ui_renderer, texture, position, size, uvs, color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
		end

		return UIRenderer_draw_texture_uv(ui_renderer, texture, position, size, uvs, color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
	end
}
UIPasses.state_texture = {
	OPERATORS = {
		GT = function (lhs, rhs)
			return rhs < (lhs or 0)
		end,
		LT = function (lhs, rhs)
			return (lhs or math.huge) < rhs
		end,
		EQ = function (lhs, rhs)
			return lhs == rhs
		end
	},
	init = function (pass_definition)
		return {}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local state_content_id = pass_definition.state_content_id

		assert(state_content_id)

		local texture_content_id = pass_definition.texture_content_id

		assert(texture_content_id)

		local num_states = pass_data.num_states
		local texture_states = ui_content[texture_content_id]

		if not num_states then
			num_states = #texture_states
			pass_data.num_states = num_states

			for i = 1, num_states, 1 do
				pass_data[i] = #texture_states[i]
			end
		end

		local texture = nil
		local state_content = ui_content[state_content_id]

		for i = 1, num_states, 1 do
			local n_data = pass_data[i]
			local test_data = texture_states[i]

			if 2 < n_data then
				local value = state_content[test_data[1]]
				local operator = test_data[2]
				local check_value = test_data[3]
				local result = operator(value, check_value)

				if result then
					texture = test_data[4]

					break
				end
			elseif n_data == 2 then
				if state_content[test_data[1]] then
					texture = test_data[2]

					break
				end
			else
				texture = test_data[1]

				break
			end
		end

		if texture then
			local draw_function = ui_style.draw_function or "draw_texture"

			Profiler.start("state_texture: " .. draw_function)
			UIRenderer[draw_function](ui_renderer, texture, position, size, ui_style.color, ui_style and ui_style.masked)
			Profiler.stop("state_texture: " .. draw_function)
		end

		return 
	end
}
local element_alignment_position = {
	0,
	0,
	0
}
UIPasses.list_pass = {
	init = function (pass_definition)
		local passes = pass_definition.passes
		local num_passes = #passes
		local sub_pass_datas = {}

		for i = 1, num_passes, 1 do
			sub_pass_datas[i] = UIPasses[passes[i].pass_type].init(passes[i])
		end

		return {
			num_passes = num_passes,
			sub_pass_datas = sub_pass_datas
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local num_list_elements = pass_data.num_list_elements

		if not num_list_elements then
			num_list_elements = #ui_content
			pass_data.num_list_elements = num_list_elements
		end

		local num_passes = pass_data.num_passes
		local passes = pass_definition.passes
		local sub_pass_datas = pass_data.sub_pass_datas
		local list_member_offset = ui_style.list_member_offset
		local element_position = FrameTable.alloc_table()
		local pass_position = FrameTable.alloc_table()
		local columns = ui_style.columns
		local column_offset = ui_style.column_offset
		element_alignment_position[1] = position[1]
		element_alignment_position[2] = position[2]
		element_alignment_position[3] = position[3]
		local start_index = ui_style.start_index
		local num_draws = ui_style.num_draws - 1
		local stop_index = math.min(start_index + num_draws, num_list_elements)

		if ui_style.scenegraph_id then
			local parent_size = ui_scenegraph[ui_style.scenegraph_id].size
			local total_width = num_draws*list_member_offset[1] + size[1]
			local total_height = num_draws*list_member_offset[2] + size[2]

			if ui_style.horizontal_alignment == "center" then
				element_alignment_position[1] = (position[1] + parent_size[1]/2) - total_width/2
			elseif ui_style.horizontal_alignment == "right" then
				element_alignment_position[1] = (position[1] + parent_size[1]) - total_width
			end

			if ui_style.vertical_alignment == "center" then
				element_alignment_position[2] = (position[2] + parent_size[2]/2) - total_height/2
			elseif ui_style.vertical_alignment == "top" then
				element_alignment_position[2] = (position[2] + parent_size[2]) - math.abs(list_member_offset[2])
			end
		end

		element_position[1] = element_alignment_position[1]
		element_position[2] = element_alignment_position[2]
		element_position[3] = element_alignment_position[3]
		local index = 0
		local row_count = 0
		local change_row = true

		for i = start_index, stop_index, 1 do
			index = index + 1
			local element_content = ui_content[i]
			local element_style = (ui_style.item_styles and ui_style.item_styles[i]) or ui_style
			local element_list_member_offset = element_style.list_member_offset
			local column_index = nil

			if columns then
				column_index = index%columns

				if column_index == 0 then
					column_index = columns - 1
					change_row = true
				else
					column_index = column_index - 1
					change_row = false
				end
			else
				change_row = true
			end

			if element_list_member_offset then
				if column_index then
					element_position[1] = element_alignment_position[1] + column_offset*column_index
					element_position[2] = element_alignment_position[2] + element_list_member_offset[2]*row_count
					element_position[3] = element_alignment_position[3] + element_list_member_offset[3]
				else
					element_position[1] = element_alignment_position[1] + element_list_member_offset[1]*row_count
					element_position[2] = element_alignment_position[2] + element_list_member_offset[2]*row_count
					element_position[3] = element_alignment_position[3] + element_list_member_offset[3]
				end
			elseif column_index then
				element_position[1] = element_alignment_position[1] + column_offset*column_index
				element_position[2] = element_alignment_position[2] + list_member_offset[2]*row_count
				element_position[3] = element_alignment_position[3] + list_member_offset[3]
			else
				element_position[1] = element_alignment_position[1] + list_member_offset[1]*row_count
				element_position[2] = element_alignment_position[2] + list_member_offset[2]*row_count
				element_position[3] = element_alignment_position[3] + list_member_offset[3]
			end

			for j = 1, num_passes, 1 do
				pass_position[1] = element_position[1]
				pass_position[2] = element_position[2]
				pass_position[3] = element_position[3]
				local sub_pass_definition = passes[j]
				local sub_pass_content_id = sub_pass_definition.content_id
				local pass_element_content = (sub_pass_content_id and element_content[sub_pass_content_id]) or element_content
				local sub_pass_style_id = sub_pass_definition.style_id
				local pass_element_style = (sub_pass_style_id and element_style[sub_pass_style_id]) or element_style
				local pass_size = (pass_element_style and pass_element_style.size and Vector2(unpack(pass_element_style.size))) or size
				local pass_offset = pass_element_style and pass_element_style.offset

				if pass_offset then
					pass_position[1] = pass_position[1] + pass_offset[1]
					pass_position[2] = pass_position[2] + pass_offset[2]
					pass_position[3] = pass_position[3] + pass_offset[3]
				end

				local sub_pass_data = sub_pass_datas[j]
				local draw = pass_element_content.visible ~= false
				local content_check_function = sub_pass_definition.content_check_function

				if content_check_function and not content_check_function(pass_element_content, pass_element_style) then
					draw = false
				end

				local content_change_function = sub_pass_definition.content_change_function

				if draw and content_change_function then
					content_change_function(pass_element_content, pass_element_style)
				end

				if draw then
					Profiler.start("list_pass: " .. sub_pass_definition.pass_type)
					UIPasses[sub_pass_definition.pass_type].draw(ui_renderer, sub_pass_data, ui_scenegraph, sub_pass_definition, pass_element_style, pass_element_content, Vector3(unpack(pass_position)), pass_size, input_service, dt)
					Profiler.stop("list_pass: " .. sub_pass_definition.pass_type)
				end
			end

			if change_row then
				row_count = row_count + 1
			end
		end

		return 
	end
}
UIPasses.gradient_mask_texture = {
	init = function (pass_definition)
		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return 
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		if pass_data.retained_id then
			UIRenderer.destroy_bitmap(ui_renderer, pass_data.retained_id)

			pass_data.retained_id = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_style then
			local texture_size = ui_style.texture_size

			if texture_size then
				if ui_style.horizontal_alignment == "right" then
					position[1] = (position[1] + size[1]) - texture_size[1]
				elseif ui_style.horizontal_alignment == "center" then
					position[1] = position[1] + (size[1] - texture_size[1])/2
				end

				local inv_scale = RESOLUTION_LOOKUP.inv_scale

				if ui_style.vertical_alignment == "center" then
					position[2] = position[2] + (size[2] - texture_size[2])/2
				elseif ui_style.vertical_alignment == "top" then
					position[2] = (position[2] + size[2]) - texture_size[2]
				end

				size = texture_size
			end
		end

		local texture_id = pass_definition.texture_id

		if pass_definition.retained_mode then
			local retained_id = pass_definition.retained_mode and ((pass_data.retained_id and pass_data.retained_id) or true)
			retained_id = UIRenderer.draw_gradient_mask_texture(ui_renderer, ui_content[pass_definition.texture_id], position, size, ui_style and ui_style.color, ui_style.gradient_threshold or 1, retained_id)
			pass_data.retained_id = (retained_id and retained_id) or pass_data.retained_id
			pass_data.dirty = false
		else
			UIRenderer.draw_gradient_mask_texture(ui_renderer, ui_content[pass_definition.texture_id], position, size, ui_style and ui_style.color, ui_style.gradient_threshold or 1)
		end

		return 
	end
}
UIPasses.texture_frame = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local gui_position = position
		local gui_size = size
		local texture_id = pass_definition.texture_id or "texture_id"

		if ui_style then
			local texture_size = ui_style.area_size

			if texture_size then
				if ui_style.horizontal_alignment == "right" then
					position[1] = (position[1] + size[1]) - texture_size[1]
				elseif ui_style.horizontal_alignment == "center" then
					position[1] = position[1] + (size[1] - texture_size[1])/2
				end

				local inv_scale = RESOLUTION_LOOKUP.inv_scale

				if ui_style.vertical_alignment == "center" then
					position[2] = position[2] + (size[2] - texture_size[2])/2
				elseif ui_style.vertical_alignment == "top" then
					position[2] = (position[2] + size[2]) - texture_size[2]
				end

				size = texture_size
			end

			local frame_margins = ui_style.frame_margins

			if frame_margins then
				gui_position = Vector3(0, 0, 0)
				gui_position[1] = position[1] + frame_margins[1]
				gui_position[2] = position[2] + frame_margins[2]
				gui_position[3] = position[3]
				gui_size = Vector2(0, 0)
				gui_size[1] = size[1] - frame_margins[1]*2
				gui_size[2] = size[2] - frame_margins[2]*2
			end
		end

		return UIRenderer.draw_texture_frame(ui_renderer, gui_position, gui_size, ui_content[texture_id], ui_style.texture_size, ui_style.texture_sizes, ui_style.color, ui_style and ui_style.masked, ui_style and ui_style.saturated, ui_style and ui_style.only_corners)
	end
}
UIPasses.texture_dynamic_color = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local color = pass_definition.color_function(ui_content, dt)

		return UIRenderer_draw_texture(ui_renderer, ui_content[pass_definition.texture_id], position, size, color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
	end
}
UIPasses.texture = {
	init = function (pass_definition)
		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return 
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		if pass_data.retained_id then
			UIRenderer.destroy_bitmap(ui_renderer, pass_data.retained_id)

			pass_data.retained_id = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_style then
			local texture_size = ui_style.texture_size

			if texture_size then
				if ui_style.horizontal_alignment == "right" then
					position[1] = (position[1] + size[1]) - texture_size[1]
				elseif ui_style.horizontal_alignment == "center" then
					position[1] = position[1] + (size[1] - texture_size[1])/2
				end

				local inv_scale = RESOLUTION_LOOKUP.inv_scale

				if ui_style.vertical_alignment == "center" then
					position[2] = position[2] + (size[2] - texture_size[2])/2
				elseif ui_style.vertical_alignment == "top" then
					position[2] = (position[2] + size[2]) - texture_size[2]
				end

				size = texture_size
			end
		end

		local texture_id = pass_definition.texture_id

		if pass_definition.retained_mode then
			local retained_id = pass_definition.retained_mode and ((pass_data.retained_id and pass_data.retained_id) or true)
			retained_id = UIRenderer_draw_texture(ui_renderer, ui_content[texture_id], position, size, ui_style and ui_style.color, ui_style and ui_style.masked, ui_style and ui_style.saturated, retained_id)
			pass_data.retained_id = (retained_id and retained_id) or pass_data.retained_id
			pass_data.dirty = false
		else
			UIRenderer_draw_texture(ui_renderer, ui_content[texture_id], position, size, ui_style and ui_style.color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
		end

		return 
	end
}
UIPasses.shader_tiled_texture = {
	init = function (pass_definition)
		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return 
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		if pass_data.retained_id then
			UIRenderer.destroy_bitmap(ui_renderer, pass_data.retained_id)

			pass_data.retained_id = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_style then
			local texture_size = ui_style.texture_size

			if texture_size then
				if ui_style.horizontal_alignment == "right" then
					position[1] = (position[1] + size[1]) - texture_size[1]
				elseif ui_style.horizontal_alignment == "center" then
					position[1] = position[1] + (size[1] - texture_size[1])/2
				end

				local inv_scale = RESOLUTION_LOOKUP.inv_scale

				if ui_style.vertical_alignment == "center" then
					position[2] = position[2] + (size[2] - texture_size[2])/2
				elseif ui_style.vertical_alignment == "top" then
					position[2] = (position[2] + size[2]) - texture_size[2]
				end

				size = texture_size
			end
		end

		local texture_id = pass_definition.texture_id
		local tile_size = ui_style.tile_size
		local tiles = Vector2(size[1]/tile_size[1], size[2]/tile_size[2])
		local material = Gui.material(ui_renderer.gui, ui_content[texture_id])

		Material.set_vector2(material, "tile_multiplier", tiles)

		local tile_offset = Vector2(0, 0)

		if ui_style.tile_offset[1] then
			tile_offset[1] = position[1]/tile_size[1]
		end

		if ui_style.tile_offset[2] then
			tile_offset[2] = position[2]/tile_size[2]
		end

		Material.set_vector2(material, "tile_offset", tile_offset)

		if pass_definition.retained_mode then
			local retained_id = pass_definition.retained_mode and ((pass_data.retained_id and pass_data.retained_id) or true)
			retained_id = UIRenderer_draw_texture(ui_renderer, ui_content[texture_id], position, size, ui_style and ui_style.color, ui_style and ui_style.masked, ui_style and ui_style.saturated, retained_id)
			pass_data.retained_id = (retained_id and retained_id) or pass_data.retained_id
			pass_data.dirty = false
		else
			UIRenderer_draw_texture(ui_renderer, ui_content[texture_id], position, size, ui_style and ui_style.color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
		end

		return 
	end
}
UIPasses.tiled_texture = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local texture_size = ui_style.texture_tiling_size

		assert(texture_size, "Missing texture_tiling_size")

		return UIRenderer.draw_tiled_texture(ui_renderer, ui_content[pass_definition.texture_id], position, size, texture_size, ui_style and ui_style.color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
	end
}
UIPasses.multi_texture = {
	init = function (pass_definition, content, style, style_global)
		local style_id = pass_definition.style_id
		local pass_style = style[style_id]

		if pass_style then
			local global_color_ids = pass_definition.global_color_ids

			if global_color_ids then
				local texture_colors = pass_style.texture_colors or {}

				for i = 1, #global_color_ids, 1 do
					local color_id = global_color_ids[i]
					texture_colors[i] = style_global[color_id]
				end

				pass_style.texture_colors = texture_colors
			end
		end

		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return nil
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		local retained_ids = pass_data.retained_ids

		if retained_ids then
			for i = 1, #retained_ids, 1 do
				UIRenderer.destroy_bitmap(ui_renderer, retained_ids[i])
			end

			pass_data.retained_ids = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local texture_size = ui_style.texture_size
		local texture_sizes = ui_style.texture_sizes
		local texture_offsets = ui_style.texture_offsets

		assert(texture_size or texture_sizes, "Missing texture_sizes")

		if pass_definition.retained_mode then
			local retained_ids = pass_definition.retained_mode and ((pass_data.retained_ids and pass_data.retained_ids) or true)
			retained_ids = UIRenderer.draw_multi_texture(ui_renderer, ui_content[pass_definition.texture_id], position, texture_size, texture_sizes, texture_offsets, ui_style.tile_sizes, ui_style.axis, ui_style.spacing, ui_style.direction, ui_style.draw_count, ui_style.texture_colors, ui_style.color, ui_style.masked, ui_style and ui_style.texture_saturation, ui_style and ui_style.saturated, retained_ids)
			pass_data.retained_ids = (retained_ids and retained_ids) or pass_data.retained_ids
			pass_data.dirty = false
		else
			return UIRenderer.draw_multi_texture(ui_renderer, ui_content[pass_definition.texture_id], position, texture_size, texture_sizes, texture_offsets, ui_style.tile_sizes, ui_style.axis, ui_style.spacing, ui_style.direction, ui_style.draw_count, ui_style.texture_colors, ui_style.color, ui_style.masked, ui_style and ui_style.texture_saturation, ui_style and ui_style.saturated)
		end

		return 
	end
}
UIPasses.centered_texture_amount = {
	init = function (pass_definition)
		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return nil
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		local retained_ids = pass_data.retained_ids

		if retained_ids then
			for i = 1, #retained_ids, 1 do
				UIRenderer.destroy_bitmap(ui_renderer, retained_ids[i])
			end

			pass_data.retained_ids = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local texture_size = ui_style.texture_size

		assert(texture_size, "Missing texture_size")

		local texture_axis = ui_style.texture_axis

		assert(texture_axis, "Missing texture_axis")

		local num_of_textures = ui_style.texture_amount

		assert(num_of_textures, "Missing texture_amount")

		if pass_definition.retained_mode then
			local retained_ids = pass_definition.retained_mode and ((pass_data.retained_ids and pass_data.retained_ids) or true)
			retained_ids = UIRenderer.draw_centered_texture_amount(ui_renderer, ui_content[pass_definition.texture_id], position, size, texture_size, num_of_textures, texture_axis, ui_style and ui_style.spacing, ui_style and ui_style.color, ui_style and ui_style.texture_colors, ui_style and ui_style.masked, retained_ids)
			pass_data.retained_ids = (retained_ids and retained_ids) or pass_data.retained_ids
			pass_data.dirty = false
		else
			return UIRenderer.draw_centered_texture_amount(ui_renderer, ui_content[pass_definition.texture_id], position, size, texture_size, num_of_textures, texture_axis, ui_style and ui_style.spacing, ui_style and ui_style.color, ui_style and ui_style.texture_colors, ui_style and ui_style.masked)
		end

		return 
	end
}
UIPasses.centered_uv_texture_amount = {
	init = function (pass_definition, content, style)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local texture_size = ui_style.texture_size

		assert(texture_size, "Missing texture_size")

		local texture_axis = ui_style.texture_axis

		assert(texture_axis, "Missing texture_axis")

		local num_of_textures = ui_style.texture_amount

		assert(num_of_textures, "Missing texture_amount")

		local texture_uvs = ui_style.texture_uvs

		assert(texture_uvs, "Missing texture_uvs")

		local texture_sizes = ui_style.texture_sizes

		assert(texture_sizes, "Missing texture_sizes")

		return UIRenderer.draw_centered_uv_texture_amount(ui_renderer, ui_content[pass_definition.texture_id], position, size, texture_size, texture_sizes, texture_uvs, num_of_textures, texture_axis, ui_style and ui_style.spacing, ui_style and ui_style.color, ui_style and ui_style.masked)
	end
}
UIPasses.texture_uv = {
	init = function (pass_definition)
		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return pass_definition.content_id
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		if pass_data.retained_id then
			UIRenderer.destroy_bitmap(ui_renderer, pass_data.retained_id)

			pass_data.retained_id = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local uvs = ui_content.uvs
		local texture = ui_content[pass_definition.texture_id or "texture_id"]
		local color = ui_style.color

		if ui_style then
			local texture_size = ui_style.texture_size

			if texture_size then
				if ui_style.horizontal_alignment == "right" then
					position[1] = (position[1] + size[1]) - texture_size[1]
				elseif ui_style.horizontal_alignment == "center" then
					position[1] = position[1] + (size[1] - texture_size[1])/2
				end

				local inv_scale = RESOLUTION_LOOKUP.inv_scale

				if ui_style.vertical_alignment == "center" then
					position[2] = position[2] + (size[2] - texture_size[2])/2
				elseif ui_style.vertical_alignment == "top" then
					position[2] = (position[2] + size[2]) - texture_size[2]
				end

				size = texture_size
			end
		end

		if pass_definition.retained_mode then
			local retained_id = pass_definition.retained_mode and ((pass_data.retained_id and pass_data.retained_id) or true)
			retained_id = UIRenderer_draw_texture_uv(ui_renderer, texture, position, size, uvs, color, ui_style and ui_style.masked, ui_style and ui_style.saturated, retained_id)
			pass_data.retained_id = (retained_id and retained_id) or pass_data.retained_id
			pass_data.dirty = false
		else
			UIRenderer_draw_texture_uv(ui_renderer, texture, position, size, uvs, color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
		end

		return 
	end
}
UIPasses.texture_uv_dynamic_size_uvs = {
	init = function (pass_definition)
		return pass_definition.content_id
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if pass_definition.content_id and not ui_content[pass_definition.content_id] then
		end

		local color = ui_style.color
		local uvs, size = pass_definition.dynamic_function(ui_content, size, ui_style, dt)
		local texture = ui_content[pass_definition.texture_id or "texture_id"]

		return UIRenderer_draw_texture_uv(ui_renderer, texture, position, size, uvs, color, nil, ui_style and ui_style.masked, ui_style and ui_style.saturated)
	end
}
UIPasses.texture_uv_dynamic_color = {
	init = function (pass_definition)
		return pass_definition.content_id
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local uvs = ui_content.uvs
		local texture = ui_content[pass_definition.texture_id or "texture_id"]
		local color = pass_definition.color_function(ui_content)

		return UIRenderer_draw_texture_uv(ui_renderer, texture, position, size, uvs, color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
	end
}
UIPasses.rotated_texture = {
	init = function (pass_definition)
		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return 
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		if pass_data.retained_id then
			UIRenderer.destroy_bitmap(ui_renderer, pass_data.retained_id)

			pass_data.retained_id = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local texture_id = pass_definition.texture_id
		local texture = ui_content[texture_id or "texture_id"]
		local angle = ui_style.angle
		local pivot = ui_style.pivot
		local color = ui_style.color

		if ui_style then
			local texture_size = ui_style.texture_size

			if texture_size then
				if ui_style.horizontal_alignment == "right" then
					position[1] = (position[1] + size[1]) - texture_size[1]
				elseif ui_style.horizontal_alignment == "center" then
					position[1] = position[1] + (size[1] - texture_size[1])/2
				end

				local inv_scale = RESOLUTION_LOOKUP.inv_scale

				if ui_style.vertical_alignment == "center" then
					position[2] = position[2] + (size[2] - texture_size[2])/2
				elseif ui_style.vertical_alignment == "top" then
					position[2] = (position[2] + size[2]) - texture_size[2]
				end

				size = texture_size
			end
		end

		if pass_definition.retained_mode then
			local retained_id = pass_definition.retained_mode and ((pass_data.retained_id and pass_data.retained_id) or true)
			retained_id = UIRenderer.draw_texture_rotated(ui_renderer, texture, size, position, angle, pivot, color, ui_style and ui_style.masked, retained_id)
			pass_data.retained_id = (retained_id and retained_id) or pass_data.retained_id
			pass_data.dirty = false
		else
			UIRenderer.draw_texture_rotated(ui_renderer, texture, size, position, angle, pivot, color, ui_style and ui_style.masked)
		end

		return 
	end
}
UIPasses.rounded_background = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_style then
			local rect_size = ui_style.rect_size

			if rect_size then
				if ui_style.horizontal_alignment == "right" then
					position[1] = (position[1] + size[1]) - rect_size[1]
				elseif ui_style.horizontal_alignment == "center" then
					position[1] = position[1] + (size[1] - rect_size[1])/2
				end

				local inv_scale = RESOLUTION_LOOKUP.inv_scale

				if ui_style.vertical_alignment == "center" then
					position[2] = position[2] + (size[2] - rect_size[2])/2
				elseif ui_style.vertical_alignment == "top" then
					position[2] = (position[2] + size[2]) - rect_size[2]
				end

				size = rect_size
			end
		end

		return UIRenderer.draw_rounded_rect(ui_renderer, position, size, ui_style.corner_radius, ui_style.color)
	end
}
UIPasses.rect = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_style then
			local texture_size = ui_style.texture_size

			if texture_size then
				if ui_style.horizontal_alignment == "right" then
					position[1] = (position[1] + size[1]) - texture_size[1]
				elseif ui_style.horizontal_alignment == "center" then
					position[1] = position[1] + (size[1] - texture_size[1])/2
				end

				local inv_scale = RESOLUTION_LOOKUP.inv_scale

				if ui_style.vertical_alignment == "center" then
					position[2] = position[2] + (size[2] - texture_size[2])/2
				elseif ui_style.vertical_alignment == "top" then
					position[2] = (position[2] + size[2]) - texture_size[2]
				end

				size = texture_size
			end
		end

		return UIRenderer.draw_rect(ui_renderer, position, size, ui_style.color)
	end
}
local cursor_value_type_name = "Vector3"
UIPasses.scrollbar_hotspot = {
	init = function (pass_definition)
		return {
			content_id = pass_definition.content_id,
			scrollbar_size = {
				0,
				0
			},
			scrollbar_position = {
				0,
				0,
				0
			},
			hotspot_size = {
				0,
				0
			},
			hotspot_position = {
				0,
				0,
				0
			},
			scroll_area_position = {
				0,
				0,
				0
			},
			start_move_pos = {
				math.huge,
				math.huge
			}
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local was_hover = ui_content.is_hover or ui_content.is_hover_scrollbar
		local is_hover = nil
		local cursor_name = "cursor"
		local cursor_stack = ShowCursorStack.stack_depth
		local has_cursor = input_service and input_service.has(input_service, cursor_name)
		local cursor = 0 < cursor_stack and has_cursor and input_service.get(input_service, cursor_name)

		if not cursor or Script.type_name(cursor) ~= cursor_value_type_name then
			cursor = NilCursor
		end

		local cursor_position = UIInverseScaleVectorToResolution(cursor)
		local hotspot_position = pass_data.hotspot_position
		hotspot_position[1] = position[1]
		hotspot_position[2] = position[2]
		hotspot_position[3] = position[3]
		local hotspot_size = pass_data.hotspot_size
		hotspot_size[1] = size[1]
		hotspot_size[2] = size[2]

		if ui_style.hotspot_width_modifier then
			local size_x = hotspot_size[1]*ui_style.hotspot_width_modifier
			hotspot_size[1] = size_x
			hotspot_position[1] = hotspot_position[1] - size_x/2 + size[1]/2
		end

		is_hover = math.point_is_inside_2d_box(cursor_position, hotspot_position, hotspot_size)
		ui_content.is_hover = is_hover
		local percentage = ui_content.percentage
		local scrollbar_size = pass_data.scrollbar_size
		scrollbar_size[1] = hotspot_size[1]
		local scrollbar_height = math.max(ui_style.min_scrollbar_height, hotspot_size[2]*percentage)
		scrollbar_size[2] = scrollbar_height
		local scroll_value = ui_content.scroll_value
		local bar_move_area = hotspot_size[2] - scrollbar_height
		local scrollbar_offset_y = bar_move_area*scroll_value
		local scrollbar_position = pass_data.scrollbar_position
		scrollbar_position[1] = hotspot_position[1]
		scrollbar_position[2] = hotspot_position[2] + scrollbar_offset_y
		scrollbar_position[3] = hotspot_position[3] + 1
		local is_hover_scrollbar = math.point_is_inside_2d_box(cursor_position, scrollbar_position, scrollbar_size)
		ui_content.is_hover_scrollbar = is_hover_scrollbar
		local left_pressed = input_service and input_service.get(input_service, "left_press")
		local left_hold = input_service and input_service.get(input_service, "left_hold")
		local target_value = nil
		local should_update_scrollbar_position = false

		if is_hover_scrollbar then
			if left_hold then
				ui_content.holding = true

				if pass_data.start_move_pos[2] == math.huge then
					pass_data.start_move_pos[2] = cursor[2]
					ui_content.og_scroll_value = ui_content.scroll_value
				end
			end
		elseif is_hover and left_hold then
			ui_content.holding = true
		end

		if ui_content.holding then
			if not left_hold then
				ui_content.holding = false
				pass_data.start_move_pos[2] = math.huge
			elseif pass_data.start_move_pos[2] < math.huge then
				local start_y = pass_data.start_move_pos[2]
				local cursor_y = cursor[2]
				local diff_y = cursor_y - start_y
				local delta = diff_y/bar_move_area
				local og_value = ui_content.og_scroll_value
				target_value = math.clamp(og_value + delta, 0, 1)
			else
				local cursor_y = cursor[2]
				local y_diff = cursor_y - hotspot_position[2]
				target_value = math.clamp(y_diff/bar_move_area, 0, 1)
			end
		end

		local is_hover_scroll_area = false
		local scroll_area_position = pass_data.scroll_area_position
		local scroll_area_size = ui_style.scroll_area_size

		if not target_value and scroll_area_size then
			local scroll_area_offset = ui_style.scroll_area_offset
			scroll_area_position[1] = hotspot_position[1] + scroll_area_offset[1]
			scroll_area_position[2] = hotspot_position[2] + scroll_area_offset[2]
			scroll_area_position[3] = hotspot_position[3] + scroll_area_offset[3]
			is_hover_scroll_area = math.point_is_inside_2d_box(cursor_position, scroll_area_position, scroll_area_size)

			if is_hover_scroll_area then
				local scroll_axis = input_service.get(input_service, "scroll_axis")
				local y = scroll_axis[2]
				local move = ui_content.scroll_amount*y
				target_value = math.clamp(ui_content.scroll_value + move, 0, 1)
			end
		end

		if target_value then
			ui_content.scroll_value = target_value
		end

		if script_data.ui_debug_hover then
			if is_hover then
				UIRenderer.draw_rect(ui_renderer, Vector3(hotspot_position[1], hotspot_position[2], 999), hotspot_size, {
					128,
					0,
					255,
					0
				})
			else
				UIRenderer.draw_rect(ui_renderer, Vector3(hotspot_position[1], hotspot_position[2], hotspot_position[3] + 1), hotspot_size, {
					60,
					255,
					0,
					0
				})
			end

			if is_hover_scrollbar then
				UIRenderer.draw_rect(ui_renderer, Vector3(scrollbar_position[1], scrollbar_position[2], 999), scrollbar_size, {
					128,
					0,
					255,
					0
				})
			else
				UIRenderer.draw_rect(ui_renderer, Vector3(scrollbar_position[1], scrollbar_position[2], scrollbar_position[3] + 1), scrollbar_size, {
					60,
					255,
					0,
					0
				})
			end

			if is_hover_scroll_area then
				UIRenderer.draw_rect(ui_renderer, Vector3(scroll_area_position[1], scroll_area_position[2], 999), scroll_area_size, {
					128,
					0,
					255,
					0
				})
			else
				UIRenderer.draw_rect(ui_renderer, Vector3(scroll_area_position[1], scroll_area_position[2], scroll_area_position[3] + 1), scroll_area_size, {
					60,
					255,
					0,
					0
				})
			end
		end

		return 
	end
}
UIPasses.scrollbar = {
	init = function (pass_definition)
		return {
			content_id = pass_definition.content_id,
			scrollbar_size = {
				0,
				0
			},
			scrollbar_position = {
				0,
				0,
				0
			}
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		UIRenderer.draw_rect(ui_renderer, position, size, ui_style.background_color)

		local percentage = ui_content.percentage
		local scrollbar_size = pass_data.scrollbar_size
		scrollbar_size[1] = size[1]
		local scrollbar_height = math.max(ui_style.min_scrollbar_height, size[2]*percentage)
		scrollbar_size[2] = scrollbar_height
		local scroll_value = ui_content.scroll_value
		local bar_move_area = size[2] - scrollbar_height
		local scrollbar_offset_y = bar_move_area*scroll_value
		local scrollbar_position = pass_data.scrollbar_position
		scrollbar_position[1] = position[1]
		scrollbar_position[2] = position[2] + scrollbar_offset_y
		scrollbar_position[3] = position[3] + 1

		UIRenderer.draw_rect(ui_renderer, scrollbar_position, scrollbar_size, ui_style.scrollbar_color)

		return 
	end
}
UIPasses.rect_rotated = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		return UIRenderer.draw_rect_rotated(ui_renderer, size, position, ui_style.angle, ui_style.pivot, ui_style.color)
	end
}
local border_fill_rect_color = {
	255,
	0,
	0,
	0
}
UIPasses.border_fill_rect = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		return UIRenderer.draw_border_fill_rect(ui_renderer, position, size, border_fill_rect_color)
	end
}
UIPasses.video = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local is_complete = UIRenderer.draw_video(ui_renderer, ui_content.material_name, position, size, ui_style.color)
		ui_content.video_completed = is_complete

		return 
	end
}
UIPasses.splash_video = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local is_complete = UIRenderer.draw_splash_video(ui_renderer, ui_content.material_name, position, size, ui_style.color)
		ui_content.video_completed = is_complete

		return 
	end
}
UIPasses.border = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local lower_left_corner = position
		local thickness = ui_style.thickness or 1

		UIRenderer.draw_rect(ui_renderer, lower_left_corner, Vector3(thickness, size.y, 0), ui_style.color)
		UIRenderer.draw_rect(ui_renderer, lower_left_corner, Vector3(size.x, thickness, 0), ui_style.color)
		UIRenderer.draw_rect(ui_renderer, lower_left_corner + Vector3(size.x - thickness, 0, 0), Vector3(thickness, size.y, 0), ui_style.color)
		UIRenderer.draw_rect(ui_renderer, lower_left_corner + Vector3(0, size.y - thickness, 0), Vector3(size.x, thickness, 0), ui_style.color)

		return 
	end
}

local function get_position_offset(text_width, font_height, font_min, font_max, size, origin, data)
	local offset = Vector3(0, 0, 0)

	if data.horizontal_alignment == "right" then
		offset = Vector3(size[1] - text_width, 0, 0)
	elseif data.horizontal_alignment == "center" then
		local x_offset = (size[1] - text_width)/2
		offset = Vector3(x_offset - origin.x, 0, 0)
	end

	local inv_scale = RESOLUTION_LOOKUP.inv_scale

	if data.vertical_alignment == "center" then
		local y_offset = (size[2] - font_height*inv_scale*0.5)/2
		offset = offset + Vector3(0, y_offset, 0)
	elseif data.vertical_alignment == "top" then
		local y_offset = size[2] - font_max*inv_scale
		offset = offset + Vector3(0, y_offset, 0)
	else
		offset.y = offset.y + math.abs(font_min)*inv_scale
	end

	return offset
end

local link_array = {}
local message_array = {}
local name_array = {}
local name_color_array = {}
local dev_name_array = {}
local system_message_array = {}
local formatted_emojis_array = {}
local base_str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
UIPasses.text_area_chat = {
	init = function (pass_definition)
		assert(pass_definition.text_id)

		return {
			text_id = pass_definition.text_id
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if #ui_content.message_tables == 0 then
			return 
		end

		Profiler.start("text area chat")
		table.clear_array(message_array, #message_array)
		table.clear(name_array)
		table.clear(name_color_array)
		table.clear(dev_name_array)
		table.clear(system_message_array)
		table.clear(link_array)
		table.clear(formatted_emojis_array)

		local w, h = Gui.resolution()
		local current_format = w .. ":" .. h
		local font_material, scaled_font_size, font_name = nil

		if ui_style.font_type then
			local font, size = UIFontByResolution(ui_style)
			font_material, scaled_font_size, font_name = unpack(font)
			scaled_font_size = size
		end

		local row_size = Vector3(size.x, scaled_font_size, size.z)
		local offset = ui_style.offset

		if offset then
			position = position + Vector3(offset[1], offset[2], offset[3] or 0)
		end

		local channel_color_alpha = ui_style.text_color[1]
		local irc_channel_colors = table.clone(IRC_CHANNEL_COLORS)

		for _, channel_color in pairs(irc_channel_colors) do
			channel_color[1] = channel_color_alpha
		end

		local inv_scale = RESOLUTION_LOOKUP.inv_scale
		local font, _ = UIFontByResolution(ui_style, inv_scale)
		local inv_font_material = unpack(font)
		local _, _, minimum = UIRenderer.text_size(ui_renderer, base_str, inv_font_material, ui_style.font_size)
		local num_texts = 0

		for i = 1, #ui_content.message_tables, 1 do
			local message_table = ui_content.message_tables[i]
			local is_dev = message_table.is_dev
			local is_system = message_table.is_system
			local sender = message_table.sender
			local message = message_table.message
			local message_type = message_table.type
			local link = message_table.link
			local emojis = message_table.emojis
			local formatted = message_table.formatted

			if formatted ~= current_format then
				local message_text = ""

				if is_system then
					message_text = message
				else
					message_text = sender .. message
				end

				local indicator = " "
				local text_to_split = message_text

				if emojis then
					for _, emoji_data in ipairs(emojis) do
						text_to_split = string.gsub(text_to_split, emoji_data.keys, indicator)
					end
				end

				local split_message = UIRenderer.word_wrap(ui_renderer, text_to_split, font_material, scaled_font_size, size[1])
				local formatted_emojis = nil
				local formatted_message_array = table.clone(split_message)

				if emojis then
					local formatted_message, formatted_row = nil
					formatted_emojis = {}

					for _, emoji_data in ipairs(emojis) do
						for row, split_msg in ipairs(formatted_message_array) do
							local index, end_index = string.find(split_msg, indicator)

							if index then
								local substr = string.sub(split_msg, 1, math.max(index - 2, 1))

								if not Utf8.valid(substr) then
									print(string.format("%q is not a valid utf-8 string", substr))

									break
								end

								local blank_area = "       "
								local width = UIRenderer.text_size(ui_renderer, substr .. ".", font_material, scaled_font_size)
								local spacing_width = UIRenderer.text_size(ui_renderer, blank_area, font_material, scaled_font_size)
								formatted_emojis[row] = formatted_emojis[row] or {}
								formatted_emojis[row][#formatted_emojis[row] + 1] = {
									data = emoji_data,
									offset_x = (width + spacing_width*0.5) - ui_style.emoji_size[1]*0.5,
									offset_y = -ui_style.emoji_size[2]*0.3,
									size = ui_style.emoji_size
								}
								local cropped_msg = string.gsub(split_msg, indicator, blank_area, 1)
								formatted_message = cropped_msg
								formatted_row = row

								break
							end
						end

						if formatted_message then
							formatted_message_array[formatted_row] = formatted_message
						end
					end
				end

				message_table.formatted_emojis = formatted_emojis
				message_table.formatted_message_array = formatted_message_array
				message_table.formatted = current_format
			end

			local formatted_message_array = message_table.formatted_message_array
			local formatted_emojis = message_table.formatted_emojis
			local n_rows = #formatted_message_array
			num_texts = num_texts + n_rows
			local row = #message_array + 1

			for j = 1, n_rows, 1 do
				message_array[row] = formatted_message_array[j]

				if is_system then
					system_message_array[row] = formatted_message_array[j]
				end

				if j == 1 then
					if is_dev then
						dev_name_array[#message_array] = sender
					else
						name_array[row] = sender
						name_color_array[row] = irc_channel_colors[message_type] or Colors.get_color_table_with_alpha("gray", channel_color_alpha)
					end
				end

				if link then
					link_array[row] = link
				end

				if formatted_emojis and formatted_emojis[j] then
					local test = formatted_emojis_array
					local formatted_emojis_data = formatted_emojis[j]
					formatted_emojis_array[row] = formatted_emojis_data
				end

				row = row + 1
			end
		end

		local spacing = ui_style.spacing or 0
		local num_texts_to_draw = math.floor(size[2]/(ui_style.font_size + spacing))
		local text_height = num_texts_to_draw*ui_style.font_size
		local allowed_overlap = 12

		if size[2] + allowed_overlap < text_height then
			num_texts_to_draw = num_texts_to_draw - 1
		end

		num_texts_to_draw = math.min(num_texts_to_draw, num_texts)
		local vertical_alignment = ui_style.vertical_alignment

		if vertical_alignment == "top" then
			position = position + Vector3(0, size[2], 0)
		elseif vertical_alignment == "bottom" then
			local text_area_draw_height = (ui_style.font_size + spacing)*(num_texts_to_draw - 1)
			position = position + Vector3(0, text_area_draw_height - minimum[2], 0)
		end

		local percent_num_texts_to_draw = num_texts_to_draw/num_texts
		local text_start_offset = ui_content.text_start_offset
		local num_texts_to_scale_on = (percent_num_texts_to_draw - 1)*num_texts
		local start_index, discrepancy, _ = nil

		if PLATFORM == "xb1" then
			_, start_index = math.modf((num_texts_to_scale_on + 1)*text_start_offset)
		else
			start_index, discrepancy = math.modf((num_texts_to_scale_on + 1)*text_start_offset)
		end

		local stop_index = math.min(num_texts, start_index + num_texts_to_draw)
		start_index = math.max(1, stop_index - num_texts_to_draw + 1)
		local color_text = ui_style.text_color
		local color_name = ui_style.name_color
		local color_name_dev = ui_style.name_color_dev
		local color_name_system = ui_style.name_color_system

		for i = start_index, stop_index, 1 do
			local text = message_array[i]

			UIRenderer.draw_text(ui_renderer, text, font_material, scaled_font_size, font_name, position, color_text)

			if system_message_array[i] then
				UIRenderer.draw_text(ui_renderer, system_message_array[i], font_material, scaled_font_size, font_name, position, color_name_system)
			end

			if dev_name_array[i] then
				UIRenderer.draw_text(ui_renderer, dev_name_array[i], font_material, scaled_font_size, font_name, position, color_name_dev)
			elseif name_array[i] then
				if name_color_array[i] then
					UIRenderer.draw_text(ui_renderer, name_array[i], font_material, scaled_font_size, font_name, position, name_color_array[i])
				else
					UIRenderer.draw_text(ui_renderer, name_array[i], font_material, scaled_font_size, font_name, position, color_name)
				end
			end

			if link_array[i] then
				local cursor = input_service.get(input_service, "cursor") or NilCursor
				local cursor_position = UIInverseScaleVectorToResolution(cursor)
				local is_hover = math.point_is_inside_2d_box(cursor_position, position, row_size)

				if is_hover then
					UIRenderer.draw_rect(ui_renderer, position, row_size, Colors.get_color_table_with_alpha("magenta", 50))

					if input_service.get(input_service, "left_press") then
						print("PRESSED")

						ui_content.link_pressed = link_array[i]
					end
				else
					UIRenderer.draw_rect(ui_renderer, position, row_size, Colors.get_color_table_with_alpha("powder_blue", 50))
				end
			end

			if formatted_emojis_array[i] then
				for _, emoji in ipairs(formatted_emojis_array[i]) do
					UIRenderer.draw_texture(ui_renderer, emoji.data.texture, position + Vector3(emoji.offset_x, emoji.offset_y, 0), Vector2(emoji.size[1], emoji.size[2]))
				end
			end

			position.y = position.y - ui_style.font_size - spacing
		end

		Profiler.stop("text area chat")

		return 
	end
}
local temp_line_color_override = {}
UIPasses.text = {
	init = function (pass_definition)
		assert(pass_definition.text_id, "no text id in pass definition. YOU NEEDS IT.")

		return {
			text_id = pass_definition.text_id,
			dirty = (pass_definition.retained_mode and true) or nil
		}
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		local retained_ids = pass_data.retained_ids

		if retained_ids then
			for i = 1, #retained_ids, 1 do
				UIRenderer.destroy_text(ui_renderer, retained_ids[i])
			end

			pass_data.retained_ids = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global)
		local retained_ids = nil

		if pass_definition.retained_mode then
			retained_ids = (pass_data.retained_ids and pass_data.retained_ids) or true
		end

		local new_retained_ids = nil

		if retained_ids == true then
			new_retained_ids = {}
		end

		local text = ui_content[pass_data.text_id]

		if ui_style.localize then
			text = Localize(text)
		end

		if ui_style.upper_case then
			text = string.upper(text)
		end

		local widget_scale = nil

		if ui_style_global then
			widget_scale = ui_style_global.scale
		end

		local default_font_size = ui_style.font_size

		if ui_style.dynamic_font_size then
			ui_style.font_size = UIRenderer.scaled_font_size_by_width(ui_renderer, text, size[1], ui_style)
		end

		local font_material, font_size, font_name = nil

		if ui_style.font_type then
			local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
			font_name = font[3]
			font_size = font[2]
			font_material = font[1]
			font_size = size_of_font
		else
			local font = ui_style.font
			font_name = font[3]
			font_size = font[2]
			font_material = font[1]

			if not ui_style.font_size then
			end
		end

		if ui_style.word_wrap then
			local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
			local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
			local text_start_index = ui_content.text_start_index or 1
			local max_texts = ui_content.max_texts or #texts
			local num_texts = math.min(#texts - text_start_index - 1, max_texts)
			local inv_scale = RESOLUTION_LOOKUP.inv_scale
			local full_font_height = (font_max + math.abs(font_min))*inv_scale
			local text_offset = Vector3(0, (ui_style.grow_downward and full_font_height) or -full_font_height, 0)

			if ui_style.dynamic_height then
				size[2] = num_texts*full_font_height
				position.y = position.y - size[2]
			end

			local last_line_color = ui_style.last_line_color

			if ui_style.vertical_alignment == "top" then
				position = position + Vector3(0, size[2] - font_max*inv_scale, 0)
			elseif ui_style.vertical_alignment == "center" then
				position[2] = position[2] + (size[2] - full_font_height*0.5)/2
				position[2] = position[2] + math.max(num_texts - 1, 0)*0.5*full_font_height
			else
				position = position + Vector3(0, (num_texts - 1)*full_font_height + math.abs(font_min)*inv_scale, 0)
			end

			if ui_style.horizontal_alignment == "center" then
				local line_start_index = 0

				for i = 1, num_texts, 1 do
					text = texts[i - 1 + text_start_index]
					local text_length = (text and UTF8Utils.string_length(text)) or 0
					local width, height, min = UIRenderer.text_size(ui_renderer, text, font_material, font_size, size[2])
					local alignment_offset = Vector3(size[1]/2 - width/2, 0, 0)
					local color = ui_style.text_color

					if ui_style.line_colors and ui_style.line_colors[i] then
						color = ui_style.line_colors[i]
					end

					local line_color_override = ui_style.line_color_override

					if ui_style.color_override then
						line_color_override = get_line_color_override(i, text_length, line_start_index, ui_style)
					end

					local retained_id = retained_ids and ((new_retained_ids and true) or retained_ids[i])
					retained_id = UIRenderer.draw_text(ui_renderer, text, font_material, font_size, font_name, position + alignment_offset, color, retained_id, line_color_override)

					if new_retained_ids then
						new_retained_ids[i] = retained_id
					end

					position = position + text_offset
					line_start_index = line_start_index + text_length + 1
				end
			elseif ui_style.horizontal_alignment == "right" then
				local line_start_index = 0

				for i = 1, num_texts, 1 do
					text = texts[i - 1 + text_start_index]
					local text_length = (text and UTF8Utils.string_length(text)) or 0
					local width, height, min = UIRenderer.text_size(ui_renderer, text, font_material, font_size, size[2])
					local alignment_offset = Vector3(size[1] - width, 0, 0)
					local color = ui_style.text_color

					if ui_style.line_colors and ui_style.line_colors[i] then
						color = ui_style.line_colors[i]
					end

					local line_color_override = ui_style.line_color_override

					if ui_style.color_override then
						line_color_override = get_line_color_override(i, text_length, line_start_index, ui_style)
					end

					local retained_id = retained_ids and ((new_retained_ids and true) or retained_ids[i])
					retained_id = UIRenderer.draw_text(ui_renderer, text, font_material, font_size, font_name, position + alignment_offset, color, retained_id, line_color_override)

					if new_retained_ids then
						new_retained_ids[i] = retained_id
					end

					position = position + text_offset
					line_start_index = line_start_index + text_length + 1
				end
			else
				local line_start_index = 0

				for i = 1, num_texts, 1 do
					text = texts[i - 1 + text_start_index]
					local text_length = (text and UTF8Utils.string_length(text)) or 0
					local text_color = ui_style.text_color

					if ui_style.line_colors and ui_style.line_colors[i] then
						text_color = ui_style.line_colors[i]
					end

					if i == num_texts and last_line_color then
						text_color = last_line_color
					end

					local line_color_override = ui_style.line_color_override

					if ui_style.color_override then
						line_color_override = get_line_color_override(i, text_length, line_start_index, ui_style)
					end

					local retained_id = retained_ids and ((new_retained_ids and true) or retained_ids[i])
					retained_id = UIRenderer.draw_text(ui_renderer, text, font_material, font_size, font_name, position, text_color, retained_id, line_color_override)

					if new_retained_ids then
						new_retained_ids[i] = retained_id
					end

					position = position + text_offset
					line_start_index = line_start_index + text_length + 1
				end
			end

			if ui_style.draw_text_rect then
				local padding_x = 4
				local padding_y = 2
				position[3] = position[3] - 1
				position[2] = (position[2] + full_font_height + font_min) - padding_y
				position[1] = position[1] - 2 - padding_x
				size[1] = size[1] + padding_x*2
				size[2] = num_texts*full_font_height + padding_y*2

				if ui_style.masked then
					UIRenderer_draw_texture(ui_renderer, "rect_masked", position, size, ui_style.rect_color, ui_style.masked, ui_style and ui_style.saturated)
				else
					UIRenderer.draw_rounded_rect(ui_renderer, position, size, 5, ui_style.rect_color)
				end
			end
		elseif ui_style.horizontal_scroll then
			local start_index = ui_content.text_index
			local end_index = UTF8Utils.string_length(text)
			local sub_string = UTF8Utils.sub_string(text, start_index, end_index)
			local sub_string_width = UIRenderer.text_size(ui_renderer, sub_string, font_material, font_size, font_name)

			while size[1] < sub_string_width do
				end_index = end_index - 1
				sub_string = UTF8Utils.sub_string(sub_string, 1, end_index)
				sub_string_width = UIRenderer.text_size(ui_renderer, sub_string, font_material, font_size, font_name)
			end

			local caret_index = ui_content.caret_index

			if end_index + 1 < caret_index then
				ui_content.text_index = ui_content.text_index + 1
			elseif caret_index < start_index then
				ui_content.text_index = ui_content.text_index - 1
			end

			local caret_size = ui_style.caret_size

			if caret_size then
				local caret_offset = ui_style.caret_offset
				local caret_sub_string = UTF8Utils.sub_string(sub_string, 1, ui_content.caret_index - start_index) .. " "
				local caret_position_x = UIRenderer.text_size(ui_renderer, caret_sub_string .. " ", font_material, font_size, font_name) + 1
				local caret_position = position + Vector3(caret_position_x + caret_offset[1], caret_offset[2], caret_offset[3])
				local retained_id = retained_ids and ((new_retained_ids and true) or retained_ids[1])
				retained_id = UIRenderer.draw_text(ui_renderer, caret_sub_string, font_material, font_size, font_name, position, ui_style.text_color, retained_id, ui_style.color_override)

				if new_retained_ids then
					new_retained_ids[1] = retained_id
				end

				if ui_style.masked then
					UIRenderer_draw_texture(ui_renderer, "rect_masked", caret_position, caret_size, ui_style.caret_color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
				else
					UIRenderer.draw_rect(ui_renderer, caret_position, caret_size, ui_style.caret_color)
				end

				local offset = ui_style.offset
				local rest_string = string.sub(sub_string, string.len(caret_sub_string), string.len(sub_string))
				position[1] = (position[1] + caret_position_x) - offset[1]

				UIRenderer.draw_text(ui_renderer, rest_string, font_material, font_size, font_name, position, ui_style.text_color, retained_id, ui_style.color_override)
			else
				retained_id = retained_ids and ((new_retained_ids and true) or retained_ids[1])
				retained_id = UIRenderer.draw_text(ui_renderer, sub_string, font_material, font_size, font_name, position, ui_style.text_color, retained_id, ui_style.color_override)

				if new_retained_ids then
					new_retained_ids[1] = retained_id
				end
			end
		else
			local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
			local text_width, text_height, origin = UIRenderer.text_size(ui_renderer, text, font_material, font_size, font_name)
			local offset = get_position_offset(text_width, font_height, font_min, font_max, size, origin, ui_style)
			local new_position = position + offset
			local retained_id = retained_ids and ((new_retained_ids and true) or retained_ids[1])
			retained_id = UIRenderer.draw_text(ui_renderer, text, font_material, font_size, font_name, new_position, ui_style.text_color, retained_id, ui_style.color_override)

			if new_retained_ids then
				new_retained_ids[1] = retained_id
			end
		end

		if ui_style.debug_draw_box then
			UIRenderer.draw_rect(ui_renderer, position, size, Colors.get_color_table_with_alpha("magenta", 50))
		end

		if pass_definition.retained_mode then
			pass_data.retained_ids = new_retained_ids or pass_data.retained_ids
			pass_data.dirty = false
		end

		ui_style.font_size = default_font_size

		return 
	end
}

local function draw_lorebook_texts(initial_retained_id, section, ui_renderer, position, font_material, font_size, font_name, text_color)
	local width = section.width
	local texts = section.texts
	local num_texts = #texts/3
	local retained_id = initial_retained_id

	for i = 1, num_texts, 1 do
		local text = texts[i*3 - 2]
		local justified = texts[i*3 - 1]
		local new_position = position + texts[i*3]:unbox()

		if justified then
			retained_id = UIRenderer.draw_justified_text(ui_renderer, text, font_material, font_size, font_name, new_position, text_color, retained_id, width)
		else
			retained_id = UIRenderer.draw_text(ui_renderer, text, font_material, font_size, font_name, new_position, text_color)
		end
	end

	return retained_id
end

UIPasses.lorebook_multiple_texts = {
	init = function (pass_definition)
		assert(pass_definition.text_id, "no text id in pass definition. YOU NEEDS IT.")

		return {
			text_id = pass_definition.text_id,
			dirty = (pass_definition.retained_mode and true) or nil
		}
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		if pass_data.retained_id then
			UIRenderer.destroy_text(ui_renderer, pass_data.retained_id)

			pass_data.retained_id = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local retained_id = nil

		if pass_definition.retained_mode then
			retained_id = (pass_data.retained_id and pass_data.retained_id) or true
		end

		local font_material, font_size, font_name = nil

		if ui_style.font_type then
			local font, size_of_font = UIFontByResolution(ui_style)
			font_name = font[3]
			font_size = font[2]
			font_material = font[1]
			font_size = size_of_font
		else
			local font = ui_style.font
			font_name = font[3]
			font_size = font[2]
			font_material = font[1]

			if not ui_style.font_size then
			end
		end

		local text_color = ui_style.text_color
		local page = ui_content.page
		local top = page.top
		position.y = position.y + size[2]
		retained_id = draw_lorebook_texts(retained_id, top, ui_renderer, position, font_material, font_size, font_name, text_color)
		local center = page.center
		retained_id = draw_lorebook_texts(retained_id, center, ui_renderer, position, font_material, font_size, font_name, text_color)
		local bottom = page.bottom
		retained_id = draw_lorebook_texts(retained_id, bottom, ui_renderer, position, font_material, font_size, font_name, text_color)

		if pass_definition.retained_mode then
			pass_data.retained_id = retained_id or pass_data.retained_id
			pass_data.dirty = false
		end

		return 
	end
}
UIPasses.lorebook_paragraph_divider = {
	init = function (pass_definition)
		if pass_definition.retained_mode then
			return {
				dirty = true
			}
		end

		return 
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		assert(pass_definition.retained_mode, "why u destroy immediate pass?")

		if pass_data.retained_id then
			UIRenderer.destroy_bitmap(ui_renderer, pass_data.retained_id)

			pass_data.retained_id = nil
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local divider_positions = ui_content.positions
		local num_dividers = #divider_positions
		local texture_id = pass_definition.texture_id
		local initial_y = position[2]

		if pass_definition.retained_mode then
			for i = 1, num_dividers, 1 do
				position[2] = initial_y + divider_positions[i]
				local texture = ui_content[texture_id][i]
				local retained_id = pass_definition.retained_mode and ((pass_data.retained_id and pass_data.retained_id) or true)
				retained_id = UIRenderer_draw_texture(ui_renderer, texture, position, size, ui_style and ui_style.color, ui_style and ui_style.masked, ui_style and ui_style.saturated, retained_id)
				pass_data.retained_id = (retained_id and retained_id) or pass_data.retained_id
				pass_data.dirty = false
			end
		else
			for i = 1, num_dividers, 1 do
				position[2] = initial_y + divider_positions[i]
				local texture = ui_content[texture_id][i]

				UIRenderer_draw_texture(ui_renderer, texture, position, size, ui_style and ui_style.color, ui_style and ui_style.masked, ui_style and ui_style.saturated)
			end
		end

		return 
	end
}
UIPasses.text_positive_reinforcement = {
	init = function (pass_definition)
		assert(pass_definition.text_id, "no text id in pass definition. YOU NEEDS IT.")

		return {
			text_id = pass_definition.text_id
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if #ui_content.message_tables == 0 then
			return 
		end

		Profiler.start("text positive reinforcement")

		local font_material, font_size, font_name = nil

		if ui_style.font_type then
			local font, size = UIFontByResolution(ui_style)
			font_material, font_size, font_name = unpack(font)
			font_size = size
		end

		local offset = ui_style.offset

		if offset then
			position = position + Vector3(offset[1], offset[2], offset[3] or 0)
		end

		local inv_scale = RESOLUTION_LOOKUP.inv_scale
		local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
		local full_font_height = (font_max + math.abs(font_min))*inv_scale

		if ui_style.vertical_alignment == "top" then
			position = position + Vector3(0, size[2] - font_max*inv_scale, 0)
		elseif ui_style.vertical_alignment == "center" then
			position[2] = position[2] + (size[2] - full_font_height*0.5)/2
		else
			position = position + Vector3(0, math.abs(font_min)*inv_scale, 0)
		end

		local color_text = ui_style.text_color

		for i = 1, #ui_content.message_tables, 1 do
			local text = ui_content.message_tables[i].text
			local alpha = ui_content.message_tables[i].alpha
			color_text[1] = alpha

			UIRenderer.draw_text(ui_renderer, text, font_material, font_size, font_name, position, color_text)

			position.y = position.y + ui_style.font_size
		end

		Profiler.stop("text positive reinforcement")

		return 
	end
}
UIPasses.editable_text = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		return 
	end
}
UIPasses.multiple_texts = {
	init = function (pass_definition)
		assert(pass_definition.texts_id, "no text id in pass definition. YOU NEEDS IT.")

		return {
			texts_id = pass_definition.texts_id
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local font, calculated_font_size = UIFontByResolution(ui_style)
		local font_material, font_size, font_name = unpack(font)
		font_size = calculated_font_size
		local texts = (ui_content[pass_data.texts_id] and ui_content[pass_data.texts_id].texts) or ui_content.texts
		local axis = ui_style.axis or 2
		local direction = ui_style.direction or 1
		local draw_backwards = direction == 2

		for i = 1, #texts, 1 do
			local text = texts[i]

			if ui_style.localize then
				text = Localize(text)
			end

			local width, height, min = UIRenderer.text_size(ui_renderer, text, font_material, font_size)
			local alignment_offset = Vector3(0, 0, 0)

			if axis == 2 then
				if ui_style.horizontal_alignment == "center" then
					alignment_offset[1] = size[1]*0.5 - width*0.5
				elseif ui_style.horizontal_alignment == "right" then
					alignment_offset[1] = size[1] - width
				end

				if ui_style.vertical_alignment == "center" then
					alignment_offset[2] = size[2]*0.5 - height*0.5
				elseif ui_style.vertical_alignment == "top" then
					alignment_offset[2] = size[2] - height
				end
			else
				if i == 1 and draw_backwards then
					position[axis] = position[axis] - size[axis]
				end

				if ui_style.horizontal_alignment == "center" then
					alignment_offset[1] = size[1]*0.5 - width*0.5
				elseif ui_style.horizontal_alignment == "right" then
					alignment_offset[1] = size[1] - width
				end

				if ui_style.vertical_alignment == "center" then
					alignment_offset[2] = size[2]*0.5 - height*0.5
				elseif ui_style.vertical_alignment == "top" then
					alignment_offset[2] = size[2] - height
				end
			end

			UIRenderer.draw_text(ui_renderer, text, font_material, font_size, font_name, position + alignment_offset, ui_style.text_color)

			if axis == 2 then
				if draw_backwards then
					position[2] = position[2] + size[2] + ui_style.spacing
				else
					position[2] = position[2] - size[2] - ui_style.spacing
				end
			elseif draw_backwards then
				position[1] = position[1] - size[1] - ui_style.spacing
			else
				position[1] = position[1] + size[1] + ui_style.spacing
			end
		end

		return 
	end
}
UIPasses.viewport = {
	init = function (pass_definition, content, style)
		local style = style[pass_definition.style_id]
		local content = content[pass_definition.content_id]

		if not style.world_flags then
			local world_flags = {
				Application.DISABLE_SOUND,
				Application.DISABLE_ESRAM
			}
		end

		local shading_environment = style.shading_environment
		local world = Managers.world:create_world(style.world_name, shading_environment, nil, style.layer, unpack(world_flags))
		local viewport_type = style.viewport_type or "default"
		local viewport = ScriptWorld.create_viewport(world, style.viewport_name, viewport_type, style.layer)

		Viewport.set_rect(viewport, 1, 1, 1, 1)

		local level_name = style.level_name
		local level = nil

		if level_name then
			level = ScriptWorld.load_level(world, level_name, nil, nil, nil, nil)

			Level.spawn_background(level)
		end

		if style.clear_screen_on_create then
		else
			Viewport.set_data(viewport, "initialize", true)
		end

		local camera_pos = Vector3Aux.unbox(style.camera_position)
		local camera_lookat = Vector3Aux.unbox(style.camera_lookat)
		local camera_direction = Vector3.normalize(camera_lookat - camera_pos)
		local camera = ScriptViewport.camera(viewport)

		ScriptCamera.set_local_position(camera, camera_pos)
		ScriptCamera.set_local_rotation(camera, Quaternion.look(camera_direction))

		local fov = style.fov or 65

		Camera.set_vertical_fov(camera, (math.pi*fov)/180)

		local ui_renderer = nil

		if style.enable_sub_gui then
			ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_hud_atlas_textures", "material", "materials/ui/ui_1080p_hud_single_textures", "material", "materials/ui/ui_1080p_menu_atlas_textures", "material", "materials/ui/ui_1080p_menu_single_textures", "material", "materials/ui/ui_1080p_common", "material", "materials/ui/ui_1080p_popup", "material", "materials/fonts/gw_fonts")
		end

		return {
			world = world,
			world_name = style.world_name,
			level = level,
			viewport = viewport,
			viewport_name = style.viewport_name,
			ui_renderer = ui_renderer,
			camera = camera
		}
	end,
	destroy = function (ui_renderer, pass_data, pass_definition)
		if pass_data.ui_renderer then
			UIRenderer.destroy(pass_data.ui_renderer, pass_data.world)
		end

		ScriptWorld.destroy_viewport(pass_data.world, pass_data.viewport_name)
		Managers.world:destroy_world(pass_data.world)

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local scaled_position = UIScaleVectorToResolution(position)
		local scaled_size = UIScaleVectorToResolution(size)
		local resx = RESOLUTION_LOOKUP.res_w
		local resy = RESOLUTION_LOOKUP.res_h
		local viewport_size = Vector3.zero()
		viewport_size.x = scaled_size.x/resx
		viewport_size.y = scaled_size.y/resy
		local viewport_position = Vector3.zero()
		viewport_position.x = scaled_position.x/resx
		viewport_position.y = scaled_position.y/resy - 1 - viewport_size.y

		if Viewport.get_data(pass_data.viewport, "initialize") then
			Viewport.set_data(pass_data.viewport, "initialize", false)
			Viewport.set_rect(pass_data.viewport, 0, 0, 1, 1)
		else
			local splitscreen = false

			if Managers.splitscreen then
				splitscreen = Managers.splitscreen:active()
			end

			local multiplier = (splitscreen and 0.5) or 1

			Viewport.set_rect(pass_data.viewport, viewport_position.x*multiplier, viewport_position.y*multiplier, viewport_size.x*multiplier, viewport_size.y*multiplier)

			pass_data.viewport_rect_pos_x = viewport_position.x
			pass_data.viewport_rect_pos_y = viewport_position.y
			pass_data.viewport_rect_size_x = scaled_size.x
			pass_data.viewport_rect_size_y = scaled_size.y
			pass_data.size_scale_x = viewport_size.x
			pass_data.size_scale_y = viewport_size.y
		end

		return 
	end,
	raycast_at_screen_position = function (pass_data, screen_position, result_type, range, collision_filter)
		if pass_data.viewport_rect_pos_x == nil then
			return nil
		end

		local resx = RESOLUTION_LOOKUP.res_w
		local resy = RESOLUTION_LOOKUP.res_h
		local camera_space_position = Vector3.zero()
		local aspect_ratio = resx/resy
		local default_aspect = 1.7777777777777777

		if aspect_ratio < default_aspect then
			local scale_x = screen_position.x/resx
			local width = resy/9*16
			camera_space_position.x = resx*0.5 - width*0.5 + width*scale_x
			local scale_y = screen_position.y/resy
			local height = pass_data.size_scale_x*resy
			camera_space_position.y = resy*0.5 - height*0.5 + height*scale_y
		elseif default_aspect < aspect_ratio then
			local scale_x = screen_position.x/resx
			local width = pass_data.size_scale_y*resx
			camera_space_position.x = resx*0.5 - width*0.5 + width*scale_x
			camera_space_position.y = screen_position.y
		else
			camera_space_position.x = screen_position.x
			camera_space_position.y = screen_position.y
		end

		local position = Camera.screen_to_world(pass_data.camera, camera_space_position, 0)
		local direction = Camera.screen_to_world(pass_data.camera, camera_space_position + Vector3(0, 0, 0), 1) - position
		local raycast_dir = Vector3.normalize(direction)
		local physics_world = World.get_data(pass_data.world, "physics_world")

		return PhysicsWorld.immediate_raycast(physics_world, position, raycast_dir, range, result_type, "collision_filter", collision_filter)
	end
}
local NilCursor = {
	0,
	0,
	0
}
script_data.ui_debug_hover = script_data.ui_debug_hover or Development.parameter("ui_debug_hover")
script_data.ui_debug_drag = script_data.ui_debug_drag or Development.parameter("ui_debug_drag")
local drag_position_table = {
	0,
	0,
	0
}
local start_drag_threshold = UISettings.start_drag_threshold
UIPasses.is_dragging_item = false
UIPasses.drag = {
	init = function (pass_definition, ui_content, ui_style)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_content.ui_top_renderer then
			ui_renderer = ui_content.ui_top_renderer
		end

		if ui_content.on_drag_stopped then
			ui_content.on_drag_stopped = nil
			UIPasses.is_dragging_item = false
		end

		if ui_content.on_drag_started then
			ui_content.on_drag_started = nil
		end

		if ui_content.drag_disabled then
			return 
		end

		local drag_texture = ui_content[pass_definition.texture_id]

		if not drag_texture then
			return 
		end

		local cursor = input_service.get(input_service, "cursor") or NilCursor
		local scaled_cursor = UIInverseScaleVectorToResolution(cursor)
		local on_drag_started = ui_content.on_drag_started
		local is_dragging = ui_content.is_dragging

		if not is_dragging then
			if input_service.get(input_service, "left_press") and math.point_is_inside_2d_box(scaled_cursor, position, size) then
				ui_content.hover_start_timer = 0
			elseif ui_content.hover_start_timer then
				if input_service.get(input_service, "left_hold") then
					ui_content.hover_start_timer = ui_content.hover_start_timer + dt
				else
					ui_content.hover_start_timer = nil
				end
			end
		end

		local hover_start_timer = ui_content.hover_start_timer

		if hover_start_timer and start_drag_threshold <= hover_start_timer then
			ui_content.hover_start_timer = nil
			ui_content.on_drag_started = true
			ui_content.is_dragging = true
			UIPasses.is_dragging_item = true
		elseif is_dragging and input_service.get(input_service, "left_hold") then
			if on_drag_started then
				ui_content.on_drag_started = nil
			end

			local drag_texture_size = ui_content.drag_texture_size

			assert(drag_texture_size, "Missing texture_size")

			drag_position_table[1] = scaled_cursor.x - drag_texture_size[1]*0.5
			drag_position_table[2] = scaled_cursor.y - drag_texture_size[2]*0.5
			drag_position_table[3] = 999

			UIRenderer_draw_texture(ui_renderer, ui_content[pass_definition.texture_id], drag_position_table, drag_texture_size, nil, nil, false)
		elseif is_dragging and input_service.get(input_service, "left_release") then
			ui_content.is_dragging = nil
			ui_content.on_drag_stopped = true
		end

		if script_data.ui_debug_drag then
			UIRenderer.draw_rect(ui_renderer, position + Vector3(0, 0, 1), size, (ui_content.is_dragging and {
				128,
				0,
				100,
				100
			}) or {
				0,
				0,
				0,
				255
			})
		end

		return 
	end
}
local cursor_position_table = {
	0,
	0,
	0
}
UIPasses.gamepad_cursor = {
	init = function (pass_definition, ui_content, ui_style)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_content.ui_top_renderer then
			ui_renderer = ui_content.ui_top_renderer
		end

		local cursor = input_service.get(input_service, "cursor") or NilCursor
		local offset = ui_style.offset or {
			0,
			0
		}
		cursor_position_table[1] = ((cursor.x or 0) + offset[1])*UIInverseResolutionScale()
		cursor_position_table[2] = ((cursor.y or 0) + offset[2])*UIInverseResolutionScale()
		cursor_position_table[3] = 1000

		if Managers.input:is_device_active("gamepad") then
			UIRenderer_draw_texture(ui_renderer, ui_content[pass_definition.texture_id], cursor_position_table, ui_style.size, nil, nil, false)
		end

		if script_data.ui_debug_hover then
			local cursor_size = Vector2(GAMEPAD_CURSOR_SIZE*0.5, GAMEPAD_CURSOR_SIZE*0.5)
			local cursor_position = Vector3(cursor_position_table[1], cursor_position_table[2], cursor_position_table[3])
			local pos = cursor_position + cursor_size*0.5

			UIRenderer.draw_rect(ui_renderer, {
				pos[1],
				pos[2],
				pos[3]
			}, {
				cursor_size[1],
				cursor_size[2]
			}, {
				128,
				255,
				255,
				255
			})
		end

		if script_data.ui_debug_drag then
			UIRenderer.draw_rect(ui_renderer, position + Vector3(0, 0, 1), size, (ui_content.is_dragging and {
				128,
				0,
				100,
				100
			}) or {
				0,
				0,
				0,
				255
			})
		end

		return 
	end
}
UIPasses.hover = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local was_hover = ui_content.is_hover
		local is_hover = nil
		local cursor = (input_service and input_service.has(input_service, "cursor") and input_service.get(input_service, "cursor")) or NilCursor

		if ui_content.hover_type == "circle" then
			local half_size = (ui_renderer.get_scaling(ui_renderer)*size)/2
			local pos_center = Vector3Aux.flat(ScaleVectorToResolution(position)) + half_size
			local square_distance = Vector3.distance_squared(Vector3Aux.unbox(cursor), pos_center)
		else
			local pixel_pos = position
			local pixel_size = size
			is_hover = math.point_is_inside_2d_box(UIInverseScaleVectorToResolution(cursor), pixel_pos, pixel_size)

			if script_data.ui_debug_hover then
				UIRenderer.draw_rect(ui_renderer, position + Vector3(0, 0, 1), size, (ui_content.is_hover and {
					128,
					0,
					255,
					0
				}) or {
					128,
					255,
					0,
					0
				})
			end
		end

		if is_hover and not was_hover then
			ui_content.is_hover = not UIPasses.is_dragging_item
			ui_content.internal_is_hover = true
		end

		if was_hover and not is_hover then
			ui_content.is_hover = nil
			ui_content.internal_is_hover = nil
		end

		if not is_hover and ui_content.internal_is_hover then
			ui_content.internal_is_hover = nil
		end

		return 
	end
}
UIPasses.click = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_content.is_hover and input_service.get(input_service, "left_release") then
			ui_content.is_clicked = 0
		else
			ui_content.is_clicked = (ui_content.is_clicked or 10) + dt
		end

		return 
	end
}
UIPasses.generic_tooltip = {
	init = function (pass_definition, ui_content, ui_style, style_global)
		local passes = {
			{
				data = UITooltipPasses.generic_text.setup_data(),
				draw = UITooltipPasses.generic_text.draw
			}
		}
		pass_definition.end_pass = {
			data = UITooltipPasses.background.setup_data(),
			draw = UITooltipPasses.background.draw
		}
		pass_definition.passes = passes
		pass_definition.size = {
			400,
			0
		}
		pass_definition.alpha_multiplier = 1

		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, parent_size, input_service, dt, ui_style_global)
		local size = pass_definition.size
		size[2] = 0
		local draw_downwards = false
		local res_w = RESOLUTION_LOOKUP.res_w
		local res_h = RESOLUTION_LOOKUP.res_h

		if res_h*0.5 < position[2] + parent_size[2]*0.5 then
			draw_downwards = true
			position[2] = position[2] + parent_size[2]
		end

		if res_w*0.5 < position[1] + parent_size[1]*0.5 then
			position[1] = position[1] - size[1] - 5
		else
			position[1] = position[1] + parent_size[1] + 5
		end

		local position_x = position[1]
		local position_y = position[2]
		local position_z = position[3]
		local loop_func = (draw_downwards and ipairs) or ripairs
		local passes = pass_definition.passes
		local draw = true

		for _, tooltip_pass in loop_func(passes) do
			local data = tooltip_pass.data
			local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, data, draw_downwards)
			size[2] = size[2] + pass_height

			if draw_downwards then
				position[2] = position[2] - pass_height
			else
				position[2] = position[2] + pass_height
			end
		end

		position[1] = position_x
		position[2] = position_y
		position[3] = position_z
		local end_pass = pass_definition.end_pass

		if end_pass then
			local data = end_pass.data
			slot23 = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, data, draw_downwards)
		end

		return 
	end
}
UIPasses.level_tooltip = {
	init = function (pass_definition, ui_content, ui_style, style_global)
		local passes = {
			{
				data = UITooltipPasses.level_info.setup_data(),
				draw = UITooltipPasses.level_info.draw
			}
		}
		pass_definition.end_pass = {
			data = UITooltipPasses.background.setup_data(),
			draw = UITooltipPasses.background.draw
		}
		pass_definition.passes = passes
		pass_definition.size = {
			300,
			0
		}
		pass_definition.alpha_multiplier = 1

		return nil
	end,
	update = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, input_service, dt, ui_style_global, visible)
		if not visible then
			pass_definition.alpha_progress = 0
			pass_definition.alpha_wait_time = UISettings.tooltip_wait_duration
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, parent_size, input_service, dt, ui_style_global)
		local level_data = ui_content[pass_definition.level_id]

		if not level_data then
			return 
		end

		local alpha_wait_time = pass_definition.alpha_wait_time
		local alpha_progress = pass_definition.alpha_progress

		if alpha_wait_time then
			alpha_wait_time = alpha_wait_time - dt

			if alpha_wait_time <= 0 then
				pass_definition.alpha_wait_time = nil
			else
				pass_definition.alpha_wait_time = alpha_wait_time
			end

			pass_definition.alpha_multiplier = 0
		elseif alpha_progress then
			local tooltip_fade_in_speed = UISettings.tooltip_fade_in_speed
			local alpha_progress = math.min(alpha_progress + dt*tooltip_fade_in_speed, 1)
			pass_definition.alpha_multiplier = math.easeOutCubic(alpha_progress)

			if alpha_progress == 1 then
				pass_definition.alpha_progress = nil
			else
				pass_definition.alpha_progress = alpha_progress
			end
		end

		local size = pass_definition.size
		size[2] = 0
		local draw_downwards = true
		local res_w = RESOLUTION_LOOKUP.res_w
		local res_h = RESOLUTION_LOOKUP.res_h
		position[1] = (position[1] + parent_size[1]/2) - size[1]/2
		local tooltip_total_height = 0
		local passes = pass_definition.passes
		local draw = false
		local end_pass = pass_definition.end_pass

		if end_pass then
			local data = end_pass.data
			local pass_height = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, data, draw_downwards)
			tooltip_total_height = tooltip_total_height + pass_height
		end

		frame_margin = end_pass.data.frame_margin or 0

		for _, tooltip_pass in ipairs(passes) do
			local data = tooltip_pass.data
			data.frame_margin = frame_margin
			local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, level_data, data, draw_downwards)
			tooltip_total_height = tooltip_total_height + pass_height
		end

		local scale = UIResolutionScale()
		local scale_inversed = UIInverseResolutionScale()
		local actual_screen_y_position = position[2]*scale
		position[2] = position[2] + parent_size[2] + tooltip_total_height
		local position_x = position[1]
		local position_y = position[2]
		local position_z = position[3]
		draw = true

		for _, tooltip_pass in ipairs(passes) do
			local data = tooltip_pass.data
			data.frame_margin = frame_margin
			local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, level_data, data, draw_downwards)
			size[2] = size[2] + pass_height
			position[2] = position[2] - pass_height
		end

		position[1] = position_x
		position[2] = position_y
		position[3] = position_z

		if end_pass then
			local data = end_pass.data
			slot30 = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, data, draw_downwards)
		end

		return 
	end
}
UIPasses.item_tooltip = {
	init = function (pass_definition, ui_content, ui_style, style_global)
		local passes = {
			{
				data = UITooltipPasses.equipped_item_title.setup_data(),
				draw = UITooltipPasses.equipped_item_title.draw
			},
			{
				data = UITooltipPasses.item_titles.setup_data(),
				draw = UITooltipPasses.item_titles.draw
			},
			{
				data = UITooltipPasses.ammunition.setup_data(),
				draw = UITooltipPasses.ammunition.draw
			},
			{
				data = UITooltipPasses.fatigue.setup_data(),
				draw = UITooltipPasses.fatigue.draw
			},
			{
				data = UITooltipPasses.item_power_level.setup_data(),
				draw = UITooltipPasses.item_power_level.draw
			},
			{
				data = UITooltipPasses.properties.setup_data(),
				draw = UITooltipPasses.properties.draw
			},
			{
				data = UITooltipPasses.traits.setup_data(),
				draw = UITooltipPasses.traits.draw
			},
			{
				data = UITooltipPasses.item_description.setup_data(),
				draw = UITooltipPasses.item_description.draw
			},
			{
				data = UITooltipPasses.advanced_input_helper.setup_data(),
				draw = UITooltipPasses.advanced_input_helper.draw
			}
		}
		pass_definition.end_pass = {
			data = UITooltipPasses.item_background.setup_data(),
			draw = UITooltipPasses.item_background.draw
		}
		pass_definition.passes = passes
		pass_definition.size = {
			400,
			0
		}
		pass_definition.alpha_multiplier = 1
		pass_definition.items = {}

		return {}
	end,
	update = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, input_service, dt, ui_style_global, visible)
		if not visible then
			pass_definition.alpha_progress = 0
			pass_definition.alpha_wait_time = UISettings.tooltip_wait_duration
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, parent_size, input_service, dt, ui_style_global)
		local preview_item = ui_content[pass_definition.item_id]

		if not preview_item then
			return 
		end

		local items = pass_definition.items

		table.clear(items)

		items[1] = preview_item
		local preview_item_backend_id = preview_item.backend_id
		local equipped_item = nil
		local slot_type = preview_item.slot_type

		if slot_type then
			local slot_names = InventorySettings.slot_names_by_type[slot_type]

			if slot_names then
				local slot_name = slot_names[1]
				local local_player = Managers.player:local_player()

				if local_player then
					local hero_name = local_player.profile_display_name(local_player)
					local career_name = local_player.career_name(local_player)
					local equipped_item = BackendUtils.get_loadout_item(career_name, slot_name)

					if equipped_item and equipped_item.backend_id ~= preview_item_backend_id then
						items[2] = equipped_item
					end
				end
			end
		end

		local alpha_wait_time = pass_definition.alpha_wait_time
		local alpha_progress = pass_definition.alpha_progress

		if alpha_wait_time then
			alpha_wait_time = alpha_wait_time - dt

			if alpha_wait_time <= 0 then
				pass_definition.alpha_wait_time = nil
			else
				pass_definition.alpha_wait_time = alpha_wait_time
			end

			pass_definition.alpha_multiplier = 0
		elseif alpha_progress then
			local tooltip_fade_in_speed = UISettings.tooltip_fade_in_speed
			local alpha_progress = math.min(alpha_progress + dt*tooltip_fade_in_speed, 1)
			pass_definition.alpha_multiplier = math.easeOutCubic(alpha_progress)

			if alpha_progress == 1 then
				pass_definition.alpha_progress = nil
			else
				pass_definition.alpha_progress = alpha_progress
			end
		end

		local wanted_max_height = nil

		for _, item in ipairs(items) do
			local start_position_x = position[1]
			local start_position_y = position[2]
			local start_position_z = position[3]
			local size = pass_definition.size
			size[2] = 0
			local draw_downwards = true
			local res_w = RESOLUTION_LOOKUP.res_w
			local res_h = RESOLUTION_LOOKUP.res_h

			if res_w*0.5 < position[1] + parent_size[1]*0.5 then
				position[1] = position[1] - size[1] - 5

				if wanted_max_height then
					position[1] = position[1] - size[1]
				end
			else
				position[1] = position[1] + parent_size[1] + 5

				if wanted_max_height then
					position[1] = position[1] + size[1]
				end
			end

			local loop_func = (draw_downwards and ipairs) or ripairs
			local passes = pass_definition.passes
			local draw = false
			local tooltip_total_height = 0
			local end_pass = pass_definition.end_pass
			local frame_margin = end_pass.data.frame_margin or 0

			if end_pass then
				local data = end_pass.data
				local pass_height = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
				tooltip_total_height = tooltip_total_height + pass_height
			end

			for _, tooltip_pass in loop_func(passes) do
				local data = tooltip_pass.data
				data.frame_margin = frame_margin
				local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
				tooltip_total_height = tooltip_total_height + pass_height
			end

			if not wanted_max_height then
				position[2] = (position[2] + tooltip_total_height) - frame_margin/2
				wanted_max_height = position[2]
			else
				position[2] = wanted_max_height
				local scale = UIResolutionScale()
				local scale_inversed = UIInverseResolutionScale()
				local tooltip_bottom_y_position = position[2]*scale - tooltip_total_height

				if tooltip_bottom_y_position < 0 then
					position[2] = frame_margin/2
				end
			end

			local scale = UIResolutionScale()
			local scale_inversed = UIInverseResolutionScale()
			local actual_screen_y_position = position[2]*scale

			if res_h < actual_screen_y_position then
				position[2] = position[2] - (actual_screen_y_position - res_h + 40)*scale_inversed
			end

			local position_x = position[1]
			local position_y = position[2] + frame_margin/2
			local position_z = position[3]
			draw = true

			for _, tooltip_pass in loop_func(passes) do
				local data = tooltip_pass.data
				data.frame_margin = frame_margin
				local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
				size[2] = size[2] + pass_height

				if draw_downwards then
					position[2] = position[2] - pass_height
				else
					position[2] = position[2] + pass_height
				end
			end

			position[1] = position_x
			position[2] = position_y
			position[3] = position_z

			if end_pass then
				local data = end_pass.data
				slot44 = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			end

			position[1] = start_position_x
			position[2] = start_position_y
			position[3] = start_position_z
		end

		return 
	end
}
UIPasses.talent_tooltip = {
	init = function (pass_definition, ui_content, ui_style, style_global)
		local passes = {
			{
				data = UITooltipPasses.talent_text.setup_data(),
				draw = UITooltipPasses.talent_text.draw
			}
		}
		pass_definition.end_pass = {
			data = UITooltipPasses.background.setup_data(),
			draw = UITooltipPasses.background.draw
		}
		pass_definition.passes = passes
		pass_definition.size = {
			400,
			0
		}
		pass_definition.alpha_multiplier = 1

		return nil
	end,
	update = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, input_service, dt, ui_style_global, visible)
		if not visible then
			pass_definition.alpha_progress = 0
			pass_definition.alpha_wait_time = UISettings.tooltip_wait_duration
		end

		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, parent_size, input_service, dt, ui_style_global)
		local talent = ui_content[pass_definition.talent_id]

		if not talent then
			return 
		end

		local alpha_wait_time = pass_definition.alpha_wait_time
		local alpha_progress = pass_definition.alpha_progress

		if alpha_wait_time then
			alpha_wait_time = alpha_wait_time - dt

			if alpha_wait_time <= 0 then
				pass_definition.alpha_wait_time = nil
			else
				pass_definition.alpha_wait_time = alpha_wait_time
			end

			pass_definition.alpha_multiplier = 0
		elseif alpha_progress then
			local tooltip_fade_in_speed = UISettings.tooltip_fade_in_speed
			local alpha_progress = math.min(alpha_progress + dt*tooltip_fade_in_speed, 1)
			pass_definition.alpha_multiplier = math.easeOutCubic(alpha_progress)

			if alpha_progress == 1 then
				pass_definition.alpha_progress = nil
			else
				pass_definition.alpha_progress = alpha_progress
			end
		end

		local size = pass_definition.size
		size[2] = 0
		local draw_downwards = true
		local res_w = RESOLUTION_LOOKUP.res_w
		local res_h = RESOLUTION_LOOKUP.res_h
		position[1] = (position[1] + parent_size[1]/2) - size[1]/2
		local tooltip_total_height = 0
		local passes = pass_definition.passes
		local draw = false
		local end_pass = pass_definition.end_pass

		if end_pass then
			local data = end_pass.data
			local pass_height = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, data, draw_downwards)
			tooltip_total_height = tooltip_total_height + pass_height
		end

		frame_margin = end_pass.data.frame_margin or 0

		for _, tooltip_pass in ipairs(passes) do
			local data = tooltip_pass.data
			data.frame_margin = frame_margin
			local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, talent, data, draw_downwards)
			tooltip_total_height = tooltip_total_height + pass_height
		end

		local scale = UIResolutionScale()
		local scale_inversed = UIInverseResolutionScale()
		local actual_screen_y_position = position[2]*scale
		position[2] = position[2] + parent_size[2] + tooltip_total_height
		local position_x = position[1]
		local position_y = position[2]
		local position_z = position[3]
		draw = true

		for _, tooltip_pass in ipairs(passes) do
			local data = tooltip_pass.data
			data.frame_margin = frame_margin
			local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, talent, data, draw_downwards)
			size[2] = size[2] + pass_height
			position[2] = position[2] - pass_height
		end

		position[1] = position_x
		position[2] = position_y
		position[3] = position_z

		if end_pass then
			local data = end_pass.data
			slot30 = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, data, draw_downwards)
		end

		return 
	end
}
local tooltip_size = {
	0,
	0
}
local temp_cursor_pos = {
	0,
	0
}
local tooltip_background_color = {
	220,
	3,
	3,
	3
}
local temp_text_lines = {}
UIPasses.tooltip_text = {
	init = function (pass_definition)
		assert(pass_definition.text_id, "no text id in pass definition. YOU NEEDS IT.")

		return {
			text_id = pass_definition.text_id
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		ui_style.font_size = 18
		local font_material, font_size, font_name = nil

		if ui_style.font_type then
			local font, size_of_font = UIFontByResolution(ui_style)
			font_name = font[3]
			font_size = font[2]
			font_material = font[1]
			font_size = size_of_font
		else
			local font = ui_style.font
			font_name = font[3]
			font_size = font[2]
			font_material = font[1]

			if not ui_style.font_size then
			end
		end

		local text = ui_content[pass_data.text_id]

		if ui_style.localize then
			text = Localize(text)
		end

		local max_width = ui_style.max_width or size[1]
		local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
		local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, max_width)
		local text_start_index = ui_content.text_start_index or 1
		local max_texts = ui_content.max_texts or #texts
		local num_texts = math.min(#texts - text_start_index - 1, max_texts)
		local full_font_height = (font_max + math.abs(font_min))*RESOLUTION_LOOKUP.inv_scale
		local text_offset = Vector3(0, (ui_style.grow_downward and full_font_height) or -full_font_height, 0)
		local fixed_position = ui_style.fixed_position

		if fixed_position and ui_style.use_fixed_position then
			temp_cursor_pos[1] = position[1] + fixed_position[1]
			temp_cursor_pos[2] = position[2] + fixed_position[2]
		else
			local cursor = input_service.get(input_service, "cursor") or NilCursor
			temp_cursor_pos[1] = cursor[1]
			temp_cursor_pos[2] = cursor[2]
		end

		local cursor_offset = ui_style.cursor_offset
		temp_cursor_pos[1] = temp_cursor_pos[1] + ((cursor_offset and cursor_offset[1]) or 25)
		temp_cursor_pos[2] = temp_cursor_pos[2] - ((cursor_offset and cursor_offset[2]) or 15)
		local cursor_position = UIInverseScaleVectorToResolution(temp_cursor_pos)
		tooltip_size[2] = full_font_height*num_texts
		tooltip_size[1] = 0

		for i = 1, num_texts, 1 do
			local text_line = texts[i - 1 + text_start_index]
			local width, height, min = UIRenderer.text_size(ui_renderer, text_line, font_material, font_size, tooltip_size[2])

			if tooltip_size[1] < width then
				tooltip_size[1] = width
			end
		end

		local cursor_side = ui_style.cursor_side
		local draw_downwards = ui_style.draw_downwards

		if cursor_side and cursor_side == "left" then
			position[1] = cursor_position[1] - tooltip_size[1]

			if draw_downwards then
				position[2] = cursor_position[2] - full_font_height
			else
				position[2] = cursor_position[2] + tooltip_size[2] - full_font_height
			end
		else
			position[1] = cursor_position[1]
			position[2] = cursor_position[2] - full_font_height
		end

		position[3] = UILayer.tooltip + 1

		for i = 1, num_texts, 1 do
			local text_line = texts[i - 1 + text_start_index]
			local color = (ui_style.last_line_color and i == num_texts and ui_style.last_line_color) or (ui_style.line_colors and ui_style.line_colors[i]) or ui_style.text_color

			UIRenderer.draw_text(ui_renderer, text_line, font_material, font_size, font_name, position, color)

			position = position + text_offset
		end

		local padding_x = 4
		local padding_y = 2
		position[3] = position[3] - 1
		position[2] = (position[2] + full_font_height + font_min) - padding_y
		position[1] = position[1] - 2 - padding_x
		tooltip_size[1] = tooltip_size[1] + padding_x*2
		tooltip_size[2] = tooltip_size[2] + padding_y*2

		UIRenderer.draw_rounded_rect(ui_renderer, position, tooltip_size, 5, tooltip_background_color)

		return 
	end
}
local rect_text_size = {
	0,
	0
}
UIPasses.rect_text = {
	init = function (pass_definition)
		assert(pass_definition.text_id, "no text id in pass definition. YOU NEEDS IT.")

		return {
			text_id = pass_definition.text_id
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local font_material, font_size, font_name = nil

		if ui_style.font_type then
			local font, size_of_font = UIFontByResolution(ui_style)
			font_name = font[3]
			font_size = font[2]
			font_material = font[1]
			font_size = size_of_font
		else
			local font = ui_style.font
			font_name = font[3]
			font_size = font[2]
			font_material = font[1]

			if not ui_style.font_size then
			end
		end

		local text = ui_content[pass_data.text_id]

		if ui_style.localize then
			text = Localize(text)
		end

		local max_width = ui_style.max_width or size[1]
		local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
		local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, max_width)
		local text_start_index = ui_content.text_start_index or 1
		local max_texts = ui_content.max_texts or #texts
		local num_texts = math.min(#texts - text_start_index - 1, max_texts)
		local full_font_height = (font_max + math.abs(font_min))*RESOLUTION_LOOKUP.inv_scale
		local text_offset = Vector3(0, (ui_style.grow_downward and full_font_height) or -full_font_height, 0)
		rect_text_size[2] = full_font_height*num_texts
		rect_text_size[1] = 0

		if ui_style.static_rect_width then
			rect_text_size[1] = size[1]
		else
			for i = 1, num_texts, 1 do
				local text_line = texts[i - 1 + text_start_index]
				local width, height, min = UIRenderer.text_size(ui_renderer, text_line, font_material, font_size, rect_text_size[2])

				if rect_text_size[1] < width then
					rect_text_size[1] = width
				end
			end
		end

		if ui_style.horizontal_alignment == "center" then
			local line_start_index = 0

			for i = 1, num_texts, 1 do
				text = texts[i - 1 + text_start_index]
				local text_length = (text and UTF8Utils.string_length(text)) or 0
				local width, height, min = UIRenderer.text_size(ui_renderer, text, font_material, font_size, size[2])
				local alignment_offset = Vector3(size[1]/2 - width/2, 0, 0)
				local line_color_override = nil

				if ui_style.color_override then
					line_color_override = get_line_color_override(i, text_length, line_start_index, ui_style)
				end

				UIRenderer.draw_text(ui_renderer, text, font_material, font_size, font_name, position + alignment_offset, ui_style.text_color, nil, line_color_override)

				position = position + text_offset
				line_start_index = line_start_index + text_length + 1
			end

			position[1] = position[1] - rect_text_size[1]*0.5
		else
			for i = 1, num_texts, 1 do
				local text_line = texts[i - 1 + text_start_index]
				local color = (ui_style.last_line_color and i == num_texts and ui_style.last_line_color) or (ui_style.line_colors and ui_style.line_colors[i]) or ui_style.text_color

				UIRenderer.draw_text(ui_renderer, text_line, font_material, font_size, font_name, position, color)

				position = position + text_offset
			end
		end

		local padding_x = 4
		local padding_y = 2
		position[3] = position[3] - 1
		position[2] = (position[2] + full_font_height + font_min) - padding_y
		position[1] = position[1] - 2 - padding_x
		rect_text_size[1] = rect_text_size[1] + padding_x*2
		rect_text_size[2] = rect_text_size[2] + padding_y*2

		if ui_style.masked then
			UIRenderer_draw_texture(ui_renderer, "rect_masked", position, rect_text_size, ui_style.rect_color, ui_style.masked, ui_style and ui_style.saturated)
		else
			UIRenderer.draw_rounded_rect(ui_renderer, position, rect_text_size, 5, ui_style.rect_color)
		end

		return 
	end
}
local double_click_threshold = UISettings.double_click_threshold
local cursor_value_type_name = "Vector3"
UIPasses.hotspot = {
	init = function (pass_definition, content)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local gamepad_active = Managers.input:is_device_active("gamepad")
		local is_already_hovering = Managers.input:is_frame_hovering()
		local was_hover = ui_content.is_hover
		local is_hover = nil
		local cursor_name = "cursor"
		local cursor_stack = ShowCursorStack.stack_depth
		local has_cursor = input_service and input_service.has(input_service, cursor_name)
		local cursor = 0 < cursor_stack and has_cursor and input_service.get(input_service, cursor_name)

		if not cursor or Script.type_name(cursor) ~= cursor_value_type_name then
			cursor = NilCursor
		end

		local cursor_position = UIInverseScaleVectorToResolution(cursor)
		local hover_type = ui_content.hover_type
		local pixel_pos = position
		local pixel_size = size

		if gamepad_active then
			if is_already_hovering and not ui_content.allow_multi_hover then
				is_hover = false
			else
				local cursor_size = Vector2(GAMEPAD_CURSOR_SIZE*0.5, GAMEPAD_CURSOR_SIZE*0.5)
				is_hover = math.box_overlap_box(cursor_position - cursor_size*0.5, cursor_size, pixel_pos, pixel_size)
			end
		elseif hover_type == "circle" then
			local half_size = pixel_size/2
			local pos_center = Vector3.flat(pixel_pos) + half_size
			local square_distance = Vector3.distance_squared(cursor_position, pos_center)
		else
			is_hover = math.point_is_inside_2d_box(cursor_position, pixel_pos, pixel_size)
		end

		ui_content.cursor_hover = is_hover

		if ui_content.disable_button then
			is_hover = false
		end

		if not is_hover then
			slot22 = 0
		end

		if gamepad_active and is_hover and not ui_content.allow_multi_hover then
			Managers.input:set_hovering(is_hover)
		end

		if script_data.ui_debug_hover then
			if ui_content.is_hover then
				UIRenderer.draw_rect(ui_renderer, Vector3(position[1], position[2], 999), size, {
					128,
					0,
					255,
					0
				})
			else
				UIRenderer.draw_rect(ui_renderer, position + Vector3(0, 0, 1), size, {
					60,
					255,
					0,
					0
				})
			end
		end

		ui_content.gamepad_active = gamepad_active

		if ui_content.on_hover_enter then
			ui_content.on_hover_enter = nil
		end

		if ui_content.on_hover_exit then
			ui_content.on_hover_exit = nil
		end

		if is_hover and not was_hover then
			ui_content.on_hover_enter = not UIPasses.is_dragging_item
			ui_content.is_hover = not UIPasses.is_dragging_item
			ui_content.internal_is_hover = true
		end

		if was_hover and not is_hover then
			ui_content.is_hover = nil
			ui_content.on_hover_exit = true
			ui_content.internal_is_hover = nil
		end

		if ui_content.on_pressed then
			ui_content.on_pressed = nil
		end

		if is_hover and UIPasses.is_dragging_item then
			is_hover = false
		elseif not is_hover and ui_content.internal_is_hover then
			ui_content.internal_is_hover = nil
		end

		local left_pressed = input_service and input_service.get(input_service, "left_press")
		local left_hold = input_service and input_service.get(input_service, "left_hold")
		local double_click_accepted = ui_content.is_clicked and ui_content.is_clicked < double_click_threshold

		if is_hover then
			if not ui_content.input_pressed then
				ui_content.input_pressed = left_pressed

				if ui_content.input_pressed then
					ui_content.on_pressed = true
				end
			elseif not double_click_accepted then
				ui_content.input_pressed = false
			end
		elseif ui_content.input_pressed then
			ui_content.input_pressed = false
		end

		ui_content.on_right_click = false
		ui_content.on_double_click = false

		if ui_content.input_pressed then
			local left_release = input_service.get(input_service, "left_release")

			if left_release then
				ui_content.on_release = true
				ui_content.is_clicked = 0
			else
				ui_content.on_release = false

				if left_pressed and (double_click_accepted or gamepad_active) then
					ui_content.on_double_click = true
					ui_content.is_clicked = 0
				elseif is_hover and left_hold then
					ui_content.is_clicked = 0
				else
					ui_content.is_clicked = (ui_content.is_clicked or 10) + dt
				end
			end
		else
			if is_hover and not left_pressed and not left_hold and input_service.get(input_service, "right_press") then
				ui_content.on_right_click = true
			end

			ui_content.on_release = false
			ui_content.is_clicked = (ui_content.is_clicked or 10) + dt
		end

		return 
	end
}
UIPasses.controller_hotspot = {
	init = function (pass_definition)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local was_hover = ui_content.is_hover
		local is_hover = nil
		local controller_cursor_position = input_service.get_controller_cursor_position(input_service) or NilCursor
		local pixel_pos = position
		local pixel_size = size
		is_hover = math.point_is_inside_2d_box(controller_cursor_position, pixel_pos, pixel_size)

		if script_data.ui_debug_hover then
			UIRenderer.draw_rect(ui_renderer, position + Vector3(0, 0, 1), size, (ui_content.is_hover and {
				128,
				0,
				255,
				0
			}) or {
				128,
				255,
				0,
				0
			})
		end

		if is_hover and not was_hover then
			ui_content.is_hover = not UIPasses.is_dragging_item
			ui_content.internal_is_hover = true
			is_hover = not UIPasses.is_dragging_item
		end

		if was_hover and not is_hover then
			ui_content.is_hover = nil
			ui_content.internal_is_hover = nil
		end

		if is_hover and UIPasses.is_dragging_item then
			is_hover = false
		elseif not is_hover and ui_content.internal_is_hover then
			ui_content.internal_is_hover = nil
		end

		ui_content.on_double_click = false

		if is_hover or ui_content.is_clicked == 0 then
			local left_release = input_service.get(input_service, "confirm")

			if left_release then
				ui_content.on_release = true
				ui_content.is_clicked = 0
			else
				ui_content.on_release = false
				local left_hold = input_service.get(input_service, "confirm_hold")

				if ui_content.is_clicked == 0 and left_hold then
					ui_content.is_clicked = 0
				elseif input_service.get(input_service, "confirm_press") and ui_content.is_clicked < UISettings.double_click_threshold then
					ui_content.on_double_click = true
					ui_content.is_clicked = 0
				else
					ui_content.is_clicked = (ui_content.is_clicked or 10) + dt
				end
			end
		else
			ui_content.on_release = false
			ui_content.is_clicked = (ui_content.is_clicked or 10) + dt
		end

		return 
	end
}
UIPasses.game_pad_connected = {
	init = function (pass_definition)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		ui_content.gamepad_connected = Managers.input:get_device("gamepad").active()

		return 
	end
}

local function gamepad_button_clicked(ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, button_type)
	local button_released = input_service.get(input_service, button_type)

	if button_released then
		ui_content.on_release = true
		ui_content.is_clicked = 0
	else
		ui_content.on_release = false
		ui_content.is_clicked = (ui_content.is_clicked or 10) + dt
	end

	return 
end

UIPasses.gamepad_button_click_confirm = {
	init = function (pass_definition)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		gamepad_button_clicked(ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, "confirm")

		return 
	end
}
UIPasses.gamepad_button_click_back = {
	init = function (pass_definition)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		gamepad_button_clicked(ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, "back")

		return 
	end
}
UIPasses.gamepad_button_click_refresh = {
	init = function (pass_definition)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		gamepad_button_clicked(ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, "refresh")

		return 
	end
}
UIPasses.on_click = {
	init = function (pass_definition)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_content[pass_definition.click_check_content_id].on_pressed then
			pass_definition.click_function(ui_scenegraph, ui_style, ui_content, input_service)
		end

		return 
	end
}
UIPasses.on_left_and_right_click = {
	init = function (pass_definition)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local hotspot = ui_content[pass_definition.click_check_content_id]

		if hotspot.on_pressed or hotspot.on_right_click then
			pass_definition.click_function(ui_scenegraph, ui_style, ui_content, input_service)
		end

		return 
	end
}
UIPasses.on_double_click = {
	init = function (pass_definition)
		return 
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local click_content = ui_content[pass_definition.click_check_content_id]

		if click_content.on_double_click then
			pass_definition.click_function(ui_scenegraph, ui_style, ui_content, input_service)
		end

		return 
	end
}
UIPasses.debug_cursor = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local color = (ui_content.is_hover and Colors.green) or Colors.red

		if (ui_content.is_clicked or 10) < 0.5 then
			color = Colors.blue
		end

		UIRenderer.draw_rect(ui_renderer, position, size, color)

		return 
	end
}
UIPasses.local_offset = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		pass_definition.offset_function(ui_scenegraph, ui_style, ui_content, ui_renderer)

		return 
	end
}
UIPasses.scroll = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local cursor = input_service.get(input_service, "cursor") or NilCursor
		local is_hover = math.point_is_inside_2d_box(UIInverseScaleVectorToResolution(cursor), position, size) and not UIPasses.is_dragging_item

		if is_hover then
			local scroll_axis = input_service.get(input_service, "scroll_axis")

			if scroll_axis and 0 < Vector3.length(scroll_axis) then
				pass_definition.scroll_function(ui_scenegraph, ui_style, ui_content, input_service, scroll_axis)
			end
		end

		return 
	end
}
UIPasses.held = {
	init = function (pass_definition)
		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		local content = (pass_definition.content_check_hover and ui_content[pass_definition.content_check_hover]) or ui_content

		if not content.is_held and content.is_hover and input_service.get(input_service, "left_press") then
			content.is_held = true
		end

		if content.is_held then
			if input_service.get(input_service, "left_hold") then
				if pass_definition.held_function then
					pass_definition.held_function(ui_scenegraph, ui_style, ui_content, input_service)
				end
			else
				if pass_definition.release_function then
					pass_definition.release_function(ui_scenegraph, ui_style, ui_content, input_service)
				end

				content.is_held = false
			end
		end

		return 
	end
}
UIPasses.item_presentation = {
	init = function (pass_definition, ui_content, ui_style, style_global)
		local passes = {
			{
				data = UITooltipPasses.item_titles.setup_data(),
				draw = UITooltipPasses.item_titles.draw
			},
			{
				data = UITooltipPasses.ammunition.setup_data(),
				draw = UITooltipPasses.ammunition.draw
			},
			{
				data = UITooltipPasses.fatigue.setup_data(),
				draw = UITooltipPasses.fatigue.draw
			},
			{
				data = UITooltipPasses.item_power_level.setup_data(),
				draw = UITooltipPasses.item_power_level.draw
			},
			{
				data = UITooltipPasses.properties.setup_data(),
				draw = UITooltipPasses.properties.draw
			},
			{
				data = UITooltipPasses.traits.setup_data(),
				draw = UITooltipPasses.traits.draw
			}
		}
		pass_definition.end_pass = {
			data = UITooltipPasses.item_background.setup_data(),
			draw = UITooltipPasses.item_background.draw
		}
		pass_definition.passes = passes
		pass_definition.size = {
			400,
			0
		}
		pass_definition.alpha_multiplier = 1

		return nil
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global)
		local item = ui_content[pass_definition.item_id]

		if not item then
			return 
		end

		size[2] = 0
		pass_definition.start_layer = position[3]
		local draw_downwards = true
		local loop_func = (draw_downwards and ipairs) or ripairs
		local passes = pass_definition.passes
		local draw = false
		local tooltip_total_height = 0
		local end_pass = pass_definition.end_pass
		local draw_end_passes = ui_style.draw_end_passes
		local frame_margin = end_pass.data.frame_margin or 0

		if end_pass and draw_end_passes then
			local data = end_pass.data
			local pass_height = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			tooltip_total_height = tooltip_total_height + pass_height
		end

		for _, tooltip_pass in ipairs(passes) do
			local data = tooltip_pass.data
			data.frame_margin = frame_margin
			local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			tooltip_total_height = tooltip_total_height + pass_height
		end

		if ui_style.vertical_alignment == "center" then
			position[2] = (position[2] + tooltip_total_height/2) - frame_margin/2
		end

		local position_x = position[1]
		local position_y = position[2] + frame_margin/2
		local position_z = position[3]
		draw = true

		for _, tooltip_pass in ipairs(passes) do
			local data = tooltip_pass.data
			data.frame_margin = frame_margin
			local pass_height = tooltip_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
			size[2] = size[2] + pass_height

			if draw_downwards then
				position[2] = position[2] - pass_height
			else
				position[2] = position[2] + pass_height
			end
		end

		position[1] = position_x
		position[2] = position_y
		position[3] = position_z

		if end_pass and draw_end_passes then
			local data = end_pass.data
			slot24 = end_pass.draw(draw, ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt, ui_style_global, item, data, draw_downwards)
		end

		ui_style.item_presentation_height = size[2]

		return 
	end
}
UIPasses.keystrokes = {
	init = function (pass_definition)
		return {
			input_text_id = pass_definition.input_text_id
		}
	end,
	draw = function (ui_renderer, pass_data, ui_scenegraph, pass_definition, ui_style, ui_content, position, size, input_service, dt)
		if ui_content.active then
			local input_text = ui_content[pass_data.input_text_id]
			local caret_index = ui_content.caret_index
			local input_mode = ui_content.input_mode
			local keystrokes = Keyboard.keystrokes()
			local new_input_text, new_caret_index, new_input_mode = KeystrokeHelper.parse_strokes(input_text, caret_index, input_mode, keystrokes)
			ui_content[pass_data.input_text_id] = new_input_text
			ui_content.caret_index = new_caret_index
			ui_content.input_mode = new_input_mode
		end

		return 
	end
}

return 
