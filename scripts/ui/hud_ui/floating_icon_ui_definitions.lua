-- chunkname: @scripts/ui/hud_ui/floating_icon_ui_definitions.lua

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
	pivot = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	bar_pivot = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
}

local function create_simple_bar(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "rect",
					style_id = "foreground",
				},
			},
		},
		content = {},
		style = {
			background = {
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				texture_size = size,
				color = {
					200,
					30,
					30,
					30,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			foreground = {
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				texture_size = {
					size[1] - 4,
					size[2] - 4,
				},
				default_size = {
					size[1] - 4,
					size[2] - 4,
				},
				color = {
					255,
					255,
					0,
					0,
				},
				offset = {
					2,
					2,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local widget_definitions = {
	default = {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "rotated_texture",
					style_id = "arrow",
					texture_id = "arrow",
					content_check_function = function (content, style)
						return style.color[1] > 0
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end,
				},
			},
		},
		content = {
			arrow = "indicator",
			text = "tooltip_text",
			texture_id = "hud_tutorial_icon_info",
		},
		style = {
			text = {
				font_size = 30,
				font_type = "hell_shark",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					34,
					0,
					1,
				},
			},
			text_shadow = {
				font_size = 30,
				font_type = "hell_shark",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					36,
					-2,
					0,
				},
			},
			texture_id = {
				size = {
					64,
					64,
				},
				offset = {
					-30,
					-30,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			arrow = {
				angle = 0,
				size = {
					38,
					18,
				},
				pivot = {
					19,
					9,
				},
				offset = {
					-19,
					-9,
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
	progress_bar = create_simple_bar("bar_pivot", {
		300,
		50,
	}),
}
local animation_definitions = {}

return {
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
