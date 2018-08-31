local SIZE_X = 1920
local SIZE_Y = 1080
local WIDGET_SIZE = {
	420,
	120
}
local MAX_NUMBER_OF_NEWS = 5
local NEWS_SPACING = 10
local scenegraph_definition = {
	root = {
		scale = "hud_scale_fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	pivot = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "right",
		position = {
			-20,
			-300,
			1
		},
		size = {
			0,
			0
		}
	}
}

if PLATFORM ~= "win32" then
	scenegraph_definition.root.scale = "hud_fit"
	scenegraph_definition.root.is_root = false
end

local function create_news_widget(index, specific_scenegraph_id)
	local scenegraph_id = specific_scenegraph_id

	if not scenegraph_id then
		scenegraph_id = "news_pivot_" .. index
		scenegraph_definition[scenegraph_id] = {
			vertical_alignment = "top",
			parent = "pivot",
			horizontal_alignment = "right",
			size = {
				WIDGET_SIZE[1],
				WIDGET_SIZE[2]
			},
			position = {
				0,
				0,
				1
			}
		}
	end

	return {
		element = {
			passes = {
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					pass_type = "rotated_texture",
					style_id = "effect",
					texture_id = "effect"
				}
			}
		},
		content = {
			text = "text \n text \n text",
			title_text = "title_text",
			background = "news_feed_background",
			effect = "sparkle_effect"
		},
		style = {
			title_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 24,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				font_type = "hell_shark",
				offset = {
					-12,
					-8,
					2
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255)
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 24,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				font_type = "hell_shark",
				offset = {
					-10,
					-10,
					1
				},
				text_color = Colors.get_color_table_with_alpha("black", 255)
			},
			text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				font_type = "hell_shark",
				offset = {
					-12,
					-34,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				font_type = "hell_shark",
				offset = {
					-10,
					-36,
					1
				},
				text_color = Colors.get_color_table_with_alpha("black", 255)
			},
			background = {
				offset = {
					0,
					0,
					0
				},
				color = Colors.get_color_table_with_alpha("white", 255)
			},
			effect = {
				vertical_alignment = "top",
				angle = 0,
				horizontal_alignment = "right",
				offset = {
					120,
					120,
					4
				},
				pivot = {
					128,
					128
				},
				texture_size = {
					256,
					256
				},
				color = Colors.get_color_table_with_alpha("white", 255)
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local buff_widget_definitions = {}

for i = 1, MAX_NUMBER_OF_NEWS, 1 do
	buff_widget_definitions[i] = create_news_widget(i)
end

return {
	WIDGET_SIZE = WIDGET_SIZE,
	NEWS_SPACING = NEWS_SPACING,
	MAX_NUMBER_OF_NEWS = MAX_NUMBER_OF_NEWS,
	scenegraph_definition = scenegraph_definition,
	buff_widget_definitions = buff_widget_definitions
}
