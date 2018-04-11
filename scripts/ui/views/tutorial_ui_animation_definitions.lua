local info_slate_enter = {
	{
		name = "entry",
		start_progress = 0,
		end_progress = 1,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			local start_position = ui_scenegraph[params.start_id].position
			local ui_local_position = ui_scenegraph[widget.scenegraph_id].position
			ui_local_position[1] = start_position[1]
			ui_local_position[2] = start_position[2]
			local start_size = ui_scenegraph[params.start_id].size
			local ui_size = ui_scenegraph[widget.scenegraph_id].size
			ui_size[1] = start_size[1]
			ui_size[2] = start_size[2]
			local icon_scenegraph_id = widget.style.icon_texture.scenegraph_id
			local icon_definition = ui_scenegraph[icon_scenegraph_id]
			local icon_local_position = icon_definition.position
			icon_local_position[2] = 0
			widget.content.icon_texture.fraction = 1
			icon_definition.size[1] = 0
			icon_definition.size[2] = 0
			widget.style.description_text.text_color[1] = 0

			for name, style_data in pairs(widget.style) do
				if style_data.color then
					style_data.color[1] = (not style_data.background_component or 0) and style_data.default_alpha
				end
			end

			widget.element.dirty = true

			return 
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, local_progress, params)
			local catmullrom_value = (local_progress == 1 and 1) or math.catmullrom(local_progress, 2, 0, 1, -1)
			local smooth_value = math.smoothstep(local_progress, 0, 1)

			for name, style_data in pairs(widget.style) do
				if style_data.color and style_data.background_component then
					style_data.color[1] = style_data.default_alpha * smooth_value
				end
			end

			widget.element.dirty = true

			return 
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end
	},
	{
		name = "fade_in_text_and_icon",
		start_progress = 1,
		end_progress = 2,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			local icon_scenegraph_id = widget.style.icon_texture.scenegraph_id
			local icon_definition = ui_scenegraph[icon_scenegraph_id]
			icon_definition.position[3] = icon_definition.position[3] + 10
			widget.element.dirty = true

			return 
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, local_progress, params)
			local catmullrom_value = (local_progress == 1 and 1) or math.catmullrom(local_progress, -15, 0, 1, 1)
			local smooth_value = math.smoothstep(local_progress, 0, 1)
			local icon_scenegraph_id = widget.style.icon_texture.scenegraph_id
			local icon_definition = ui_scenegraph[icon_scenegraph_id]
			icon_definition.size[1] = 62 * catmullrom_value
			icon_definition.size[2] = 62 * catmullrom_value
			widget.style.description_text.text_color[1] = math.lerp(0, 255, smooth_value)
			local value = math.clamp(math.catmullrom(local_progress, -8, 0.4, 0, -1), 0, 1)
			widget.style.frame_glow_top_texture.color[1] = value * 255
			widget.style.frame_glow_bottom_texture.color[1] = value * 255
			widget.element.dirty = true

			return 
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
			local icon_scenegraph_id = widget.style.icon_texture.scenegraph_id
			local icon_definition = ui_scenegraph[icon_scenegraph_id]
			icon_definition.position[3] = icon_definition.position[3] - 10

			return 
		end
	}
}
local info_slate_exit = {
	{
		name = "exit",
		start_progress = 0,
		end_progress = 1,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, local_progress, params)
			local smooth_value = math.smoothstep(local_progress, 1, 0)

			for name, style_data in pairs(widget.style) do
				if style_data.color then
					style_data.color[1] = style_data.default_alpha * smooth_value
				end
			end

			widget.style.description_text.text_color[1] = 255 * smooth_value
			widget.element.dirty = true

			return 
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
			local lol = math.random()

			return 
		end
	}
}
local info_slate_flash = {
	{
		name = "flash",
		start_progress = 0,
		end_progress = 1,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, local_progress, params)
			local value = math.clamp(math.catmullrom(local_progress, -8, 0.4, 0, -1), 0, 1)
			widget.style.frame_glow_top_texture.color[1] = value * 255
			widget.style.frame_glow_bottom_texture.color[1] = value * 255
			widget.element.dirty = true

			return 
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end
	}
}
local info_slate_move_slot = {
	{
		name = "move_up",
		start_progress = 0,
		end_progress = 2,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, local_progress, params)
			local smooth_value = math.smoothstep(local_progress, 0, 1)
			local start_position = ui_scenegraph[params.start_id].position
			local end_position = ui_scenegraph[params.end_id].position
			local ui_local_position = ui_scenegraph[widget.scenegraph_id].position
			ui_local_position[2] = math.lerp(start_position[2], end_position[2], smooth_value)
			widget.element.dirty = true

			return 
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end
	}
}
local mission_goal_wait = {
	{
		name = "wait",
		start_progress = 0,
		end_progress = 1,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, local_progress, params)
			return 
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end
	}
}
local mission_goal_move_up = {
	{
		name = "move_up",
		start_progress = 0,
		end_progress = 2,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, local_progress, params)
			local smooth_value = math.smoothstep(local_progress, 0, 1)
			local start_position = ui_scenegraph.info_slate_slot1_start.position
			local end_position = ui_scenegraph.info_slate_mission_goal_end.position
			local ui_local_position = ui_scenegraph[widget.scenegraph_id].position
			ui_local_position[2] = math.lerp(start_position[2], end_position[2], smooth_value)
			local start_size = ui_scenegraph.info_slate_slot1_start.size
			local end_size = ui_scenegraph.info_slate_mission_goal_end.size
			local ui_size = ui_scenegraph[widget.scenegraph_id].size
			ui_size[2] = math.lerp(start_size[2], end_size[2], smooth_value)
			local fraction = (ui_size[2] - 6) / start_size[2]
			local icon_scenegraph_id = widget.style.icon_texture.scenegraph_id
			local icon_definition = ui_scenegraph[icon_scenegraph_id]
			icon_definition.size[2] = 62 * fraction
			local icon_local_position = icon_definition.position
			icon_local_position[2] = math.lerp(0, 15, smooth_value)
			widget.content.icon_texture.fraction = fraction
			widget.style.icon_texture.color[1] = math.lerp(255, 150, smooth_value)
			widget.element.dirty = true

			return 
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
			return 
		end
	}
}

return {
	info_slate_enter = info_slate_enter,
	info_slate_exit = info_slate_exit,
	info_slate_flash = info_slate_flash,
	info_slate_move_slot = info_slate_move_slot,
	mission_goal_wait = mission_goal_wait,
	mission_goal_move_up = mission_goal_move_up
}
