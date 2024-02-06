-- chunkname: @scripts/ui/hud_ui/news_feed_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local WIDGET_SIZE = {
	420,
	120,
}
local MAX_NUMBER_OF_NEWS = 5
local NEWS_SPACING = 10
local scenegraph_definition = {
	root = {
		scale = "hud_scale_fit",
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
		horizontal_alignment = "right",
		parent = "root",
		vertical_alignment = "top",
		position = {
			-20,
			-300,
			1,
		},
		size = {
			0,
			0,
		},
	},
}

if not IS_WINDOWS then
	scenegraph_definition.root.scale = "hud_fit"
	scenegraph_definition.root.is_root = false
end

local function create_news_widget(index, specific_scenegraph_id)
	local scenegraph_id = specific_scenegraph_id

	if not scenegraph_id then
		scenegraph_id = "news_pivot_" .. index
		scenegraph_definition[scenegraph_id] = {
			horizontal_alignment = "right",
			parent = "pivot",
			vertical_alignment = "top",
			size = {
				WIDGET_SIZE[1],
				WIDGET_SIZE[2],
			},
			position = {
				0,
				0,
				1,
			},
		}
	end

	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content, style)
						return content.icon ~= nil
					end,
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "rotated_texture",
					style_id = "effect",
					texture_id = "effect",
				},
			},
		},
		content = {
			background = "news_feed_background",
			effect = "sparkle_effect",
			text = "text \n text \n text",
			title_text = "title_text",
		},
		style = {
			title_text = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				offset = {
					-12,
					-8,
					2,
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				offset = {
					-10,
					-10,
					1,
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
			},
			text = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				offset = {
					-12,
					-34,
					2,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
			},
			text_shadow = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = true,
				offset = {
					-10,
					-36,
					1,
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
			},
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			background = {
				offset = {
					0,
					0,
					0,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			effect = {
				angle = 0,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				offset = {
					120,
					120,
					4,
				},
				pivot = {
					128,
					128,
				},
				texture_size = {
					256,
					256,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
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

local buff_widget_definitions = {}

for i = 1, MAX_NUMBER_OF_NEWS do
	buff_widget_definitions[i] = create_news_widget(i)
end

return {
	WIDGET_SIZE = WIDGET_SIZE,
	NEWS_SPACING = NEWS_SPACING,
	MAX_NUMBER_OF_NEWS = MAX_NUMBER_OF_NEWS,
	scenegraph_definition = scenegraph_definition,
	buff_widget_definitions = buff_widget_definitions,
}
