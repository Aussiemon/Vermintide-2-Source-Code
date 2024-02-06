-- chunkname: @scripts/ui/hud_ui/buff_presentation_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	presentation_widget_parent = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			110,
			100,
		},
		size = {
			66,
			66,
		},
	},
	presentation_widget = {
		horizontal_alignment = "left",
		parent = "presentation_widget_parent",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			0,
		},
		size = {
			66,
			66,
		},
	},
	presentation_widget_dragger = {
		horizontal_alignment = "center",
		parent = "presentation_widget",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			198,
			66,
		},
	},
}
local text_style = {
	font_size = 52,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 0),
	default_text_color = Colors.get_color_table_with_alpha("white", 0),
	offset = {
		0,
		0,
		1,
	},
}
local widget_definitions = {
	presentation_widget = {
		scenegraph_id = "presentation_widget",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
				},
				{
					pass_type = "texture",
					style_id = "texture_frame",
					texture_id = "texture_frame",
				},
			},
		},
		content = {
			texture_frame = "item_frame",
			texture_icon = "kerillian_waywatcher_movement_speed_on_taking_damage",
		},
		style = {
			texture_icon = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			texture_frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
}
local animation_definitions = {
	presentation = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				widget.style.texture_icon.color[1] = 0
				widget.style.texture_frame.color[1] = 0

				local current_size = ui_scenegraph.presentation_widget.size
				local default_size = scenegraph_definition.presentation_widget.size

				current_size[1] = default_size[1]
				current_size[2] = default_size[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local size_progress = math.catmullrom(anim_progress, -2, 0, 1, -5)

				widget.style.texture_icon.color[1] = anim_progress * 255
				widget.style.texture_frame.color[1] = anim_progress * 255

				local current_size = ui_scenegraph.presentation_widget.size
				local default_size = scenegraph_definition.presentation_widget.size

				current_size[1] = math.floor(default_size[1] * size_progress)
				current_size[2] = math.floor(default_size[2] * size_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
		{
			end_progress = 0.8,
			name = "fade_out",
			start_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local size_progress = math.catmullrom(anim_progress, 5, 0, 1, 1)

				widget.style.texture_icon.color[1] = (1 - anim_progress) * 255
				widget.style.texture_frame.color[1] = (1 - anim_progress) * 255

				local current_size = ui_scenegraph.presentation_widget.size
				local default_size = scenegraph_definition.presentation_widget.size

				current_size[1] = default_size[1] - math.floor(20 * size_progress)
				current_size[2] = default_size[2] - math.floor(20 * size_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	widget_definitions = widget_definitions,
}
