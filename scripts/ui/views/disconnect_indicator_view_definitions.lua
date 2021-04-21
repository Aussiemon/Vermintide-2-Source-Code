local icon_size = 64
local padding = 8
local distance_from_bottom = 200
local max_text_width = 800
local scenegraph_definition = {
	screen = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		scale = "fit",
		position = {
			0,
			0,
			UILayer.transition
		},
		size = {
			1920,
			1080
		}
	},
	indicator = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			icon_size,
			icon_size
		},
		position = {
			0,
			distance_from_bottom,
			1
		}
	},
	text = {
		vertical_alignment = "center",
		parent = "indicator",
		horizontal_alignment = "left",
		size = {
			max_text_width,
			100
		},
		position = {
			icon_size + padding,
			0,
			1
		}
	}
}

if not IS_WINDOWS then
	scenegraph_definition.screen.scale = "hud_fit"
end

local function create_texture_with_text(texture, text, scenegraph_id, text_scenegraph_id, text_style)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			texture_id = texture,
			text = text
		},
		style = {
			text = text_style or {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 26,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				scenegraph_id = text_scenegraph_id
			},
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local definitions = {
	scenegraph_definition = scenegraph_definition,
	icon_text = create_texture_with_text("icon_connection_lost", "", "indicator", "text", nil),
	padding = padding,
	max_text_width = max_text_width
}

return definitions
