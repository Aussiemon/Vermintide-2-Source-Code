-- chunkname: @scripts/ui/hud_ui/gameplay_info_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local RETAINED_MODE_ENABLED = false
local scenegraph_definition = {
	screen = {
		scale = "hud_scale_fit",
		size = {
			SIZE_X,
			SIZE_Y,
		},
		position = {
			0,
			0,
			UILayer.hud,
		},
	},
	center_screen = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			512,
			256,
		},
		position = {
			0,
			-SIZE_Y * 0.3,
			15,
		},
	},
	teleport_text = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			800,
			50,
		},
		position = {
			0,
			200,
			2,
		},
	},
	spawn_text = {
		horizontal_alignment = "center",
		parent = "teleport_text",
		vertical_alignment = "bottom",
		size = {
			800,
			50,
		},
		position = {
			0,
			110,
			2,
		},
	},
	spawn_reason = {
		horizontal_alignment = "center",
		parent = "spawn_text",
		vertical_alignment = "bottom",
		size = {
			800,
			50,
		},
		position = {
			0,
			-48,
			2,
		},
	},
	spawn_info = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			550,
			200,
		},
		position = {
			0,
			40,
			2,
		},
	},
	spawn_info_text = {
		horizontal_alignment = "right",
		parent = "spawn_info",
		vertical_alignment = "center",
		size = {
			400,
			184,
		},
		position = {
			16,
			0,
			4,
		},
	},
}
local teleport_text_style = {
	draw_text_rect = true,
	dynamic_font_size = false,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("light_gray", 255),
	rect_color = Colors.get_color_table_with_alpha("black", 0),
	offset = {
		0,
		0,
		2,
	},
	shadow_offset = {
		1,
		1,
		0,
	},
}
local spawn_text_style = {
	draw_text_rect = true,
	font_size = 40,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	rect_color = Colors.get_color_table_with_alpha("black", 0),
	offset = {
		0,
		0,
		10,
	},
	shadow_offset = {
		1,
		1,
		0,
	},
}
local spawn_reason_text_style = {
	draw_text_rect = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	rect_color = Colors.get_color_table_with_alpha("dark_red", 100),
	offset = {
		0,
		0,
		10,
	},
	shadow_offset = {
		1,
		1,
		0,
	},
}
local widgets = {
	teleport_text = UIWidgets.create_simple_text("", "teleport_text", nil, nil, teleport_text_style, nil, RETAINED_MODE_ENABLED),
}
local spawn_info_widgets = {
	spawn_text = UIWidgets.create_simple_text("", "spawn_text", nil, nil, spawn_text_style, nil, RETAINED_MODE_ENABLED),
	spawn_reason = UIWidgets.create_simple_text("", "spawn_reason", nil, nil, spawn_reason_text_style, nil, RETAINED_MODE_ENABLED),
}
local animation_definitions = {}

return {
	scenegraph = scenegraph_definition,
	widgets = widgets,
	spawn_info_widgets = spawn_info_widgets,
	animation_definitions = animation_definitions,
}
