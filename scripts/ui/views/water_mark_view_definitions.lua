-- chunkname: @scripts/ui/views/water_mark_view_definitions.lua

local scenegraph_definition = {
	root = {
		is_root = true,
		scale = "fit",
		position = {
			0,
			0,
			0,
		},
		size = {
			1920,
			1080,
		},
	},
	water_mark = {
		horizontal_alignment = "right",
		parent = "root",
		vertical_alignment = "top",
		position = {
			-200,
			-20,
			999,
		},
		size = {
			256,
			128,
		},
	},
}
local definitions = {
	scenegraph_definition = scenegraph_definition,
	water_mark = UIWidgets.create_simple_texture("demo_water_mark", "water_mark", false, false),
}

return definitions
