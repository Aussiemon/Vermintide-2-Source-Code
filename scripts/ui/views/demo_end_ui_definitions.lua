-- chunkname: @scripts/ui/views/demo_end_ui_definitions.lua

local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	dead_space_filler = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			99,
		},
	},
	splash_video = {
		parent = "background",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			700,
		},
	},
}
local demo_video = {
	loop = false,
	material_name = "demo_end_video_list",
	scenegraph_id = "splash_video",
	sound_start = "Play_ending_demo",
	sound_stop = "Stop_ending_demo",
	video_name = "video/demo_end_video_list",
}
local background_widget_definitions = {
	dead_space_filler_widget = UIWidgets.create_simple_rect("dead_space_filler", {
		255,
		0,
		0,
		0,
	}),
}
local widget_definitions = {}

return {
	scenegraph_definition = scenegraph_definition,
	background_widget_definitions = background_widget_definitions,
	demo_video = demo_video,
	widget_definitions = widget_definitions,
}
