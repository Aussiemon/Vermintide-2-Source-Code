-- chunkname: @scripts/ui/views/level_end/level_end_view_versus_definitions.lua

local scenegraph_definitions = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.end_screen,
		},
	},
	screen_award = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			500,
			300,
		},
		position = {
			50,
			-50,
			0,
		},
	},
	portrait_1 = {
		parent = "screen",
		size = {
			100,
			100,
		},
		position = {
			0,
			0,
			0,
		},
	},
	portrait_2 = {
		parent = "screen",
		size = {
			100,
			100,
		},
		position = {
			0,
			0,
			0,
		},
	},
	portrait_3 = {
		parent = "screen",
		size = {
			100,
			100,
		},
		position = {
			0,
			0,
			0,
		},
	},
	portrait_4 = {
		parent = "screen",
		size = {
			100,
			100,
		},
		position = {
			0,
			0,
			0,
		},
	},
	portrait_5 = {
		parent = "screen",
		size = {
			100,
			100,
		},
		position = {
			0,
			0,
			0,
		},
	},
	award_1 = {
		horizontal_alignment = "left",
		parent = "portrait_1",
		vertical_alignment = "bottom",
		size = {
			50,
			138,
		},
		position = {
			0,
			0,
			0,
		},
	},
	award_2 = {
		horizontal_alignment = "left",
		parent = "portrait_2",
		vertical_alignment = "bottom",
		size = {
			50,
			138,
		},
		position = {
			0,
			0,
			0,
		},
	},
	award_3 = {
		horizontal_alignment = "left",
		parent = "portrait_3",
		vertical_alignment = "bottom",
		size = {
			50,
			138,
		},
		position = {
			0,
			0,
			0,
		},
	},
	award_4 = {
		horizontal_alignment = "left",
		parent = "portrait_4",
		vertical_alignment = "bottom",
		size = {
			50,
			138,
		},
		position = {
			0,
			0,
			0,
		},
	},
	award_5 = {
		horizontal_alignment = "left",
		parent = "portrait_4",
		vertical_alignment = "bottom",
		size = {
			50,
			138,
		},
		position = {
			0,
			0,
			0,
		},
	},
	continue_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			300,
			75,
		},
		position = {
			0,
			0,
			0,
		},
	},
}
local DISABLE_WITH_GAMEPAD = true
local widget_definitions = {
	continue_button = UIWidgets.create_default_button("continue_button", scenegraph_definitions.continue_button.size, nil, nil, Localize("continue_menu_button_name"), 25, nil, nil, nil, DISABLE_WITH_GAMEPAD),
}
local animation_definitions = {
	animate_continue_button = {
		{
			end_progress = 2.25,
			name = "animate_continue_button",
			start_progress = 2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local eased_progress = math.easeOutCubic(progress)
				local widget = widgets.continue_button

				widget.content.visible = true
				ui_scenegraph.continue_button.local_position[2] = math.lerp(-200, 50, eased_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local data = params.data
				local cb = data.cb

				cb()
			end,
		},
	},
	show_awards = {
		{
			end_progress = 1,
			name = "show_all_awards",
			start_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				for _, widget in pairs(widgets) do
					widget.content.visible = true
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	hide_awards = {
		{
			end_progress = 0,
			name = "hide",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				for _, widget in pairs(widgets) do
					widget.content.visible = false
				end

				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "title_screen_store_skip",
			input_action = "confirm_hold",
			priority = 1,
		},
	},
	continue_available = {
		actions = {
			{
				description_text = "input_description_continue",
				input_action = "refresh",
				priority = 2,
			},
		},
	},
}
local camera_movement_functions = {
	{
		name = "top_down",
		func = function (neck_pose, neck_pos, hips_pos, base_pos, right, forward, distance, time)
			return {
				start_pos = Vector3Box(neck_pos + Vector3.up() * 2 - forward * distance * 0.3),
				end_pos = Vector3Box(hips_pos + Vector3.up() * 0.4 - forward * distance * 0.8),
				neck_pose = Matrix4x4Box(neck_pose),
				distance = distance * 0.3,
				timer = time,
				time = time,
			}
		end,
	},
	{
		name = "pan_up",
		func = function (neck_pose, neck_pos, hips_pos, base_pos, right, forward, distance, time)
			return {
				disable_camera_rotation = true,
				start_pos = Vector3Box(base_pos - forward * distance * 0.5 + Vector3.up() * 0.2),
				end_pos = Vector3Box(neck_pos - forward * distance * 1),
				neck_pose = Matrix4x4Box(neck_pose),
				distance = distance * 0,
				timer = time,
				time = time,
			}
		end,
	},
	{
		name = "zoom_in",
		func = function (neck_pose, neck_pos, hips_pos, base_pos, right, forward, distance, time)
			return {
				start_pos = Vector3Box(hips_pos - forward * distance * 2 - right * 0.4),
				end_pos = Vector3Box(neck_pos - forward * distance * 0.75 + Vector3.up() * 0 + right * 0.4),
				neck_pose = Matrix4x4Box(neck_pose),
				distance = distance * 0,
				timer = time,
				time = time,
			}
		end,
	},
	{
		name = "zoom_around",
		func = function (neck_pose, neck_pos, hips_pos, base_pos, right, forward, distance, time)
			return {
				start_pos = Vector3Box(hips_pos + right * distance * 0.3 + Vector3.up() * 0 - forward * distance * 0.6),
				end_pos = Vector3Box(neck_pos - right * distance * 0.3 + Vector3.up() * 0.1 - forward * distance * 0.8),
				neck_pose = Matrix4x4Box(neck_pose),
				distance = distance * 0.3,
				timer = time,
				time = time,
			}
		end,
	},
	{
		name = "zoom_other_way_around",
		func = function (neck_pose, neck_pos, hips_pos, base_pos, right, forward, distance, time)
			return {
				start_pos = Vector3Box(hips_pos - right * distance * 0.3 + Vector3.up() * 0 - forward * distance * 0.6),
				end_pos = Vector3Box(neck_pos + right * distance * 0.3 + Vector3.up() * 0.1 - forward * distance * 0.8),
				neck_pose = Matrix4x4Box(neck_pose),
				distance = distance * 0.3,
				timer = time,
				time = time,
			}
		end,
	},
}

return {
	widget_definitions = widget_definitions,
	scenegraph_definitions = scenegraph_definitions,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	camera_movement_functions = camera_movement_functions,
}
