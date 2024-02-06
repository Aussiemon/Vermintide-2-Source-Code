-- chunkname: @scripts/ui/views/area_indicator_ui_definitions.lua

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
	area_text_box = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		position = {
			0,
			-310,
			100,
		},
		size = {
			SIZE_X,
			50,
		},
	},
}

if not IS_WINDOWS then
	scenegraph_definition.screen.scale = "hud_fit"
end

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
	area_text_box = UIWidgets.create_simple_text("placeholder_area_text", "area_text_box", nil, nil, text_style),
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
