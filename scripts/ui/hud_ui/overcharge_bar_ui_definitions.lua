-- chunkname: @scripts/ui/hud_ui/overcharge_bar_ui_definitions.lua

local DEFAULT_BAR_SIZE = {
	250,
	16,
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud_inventory,
		},
		size = {
			1920,
			1080,
		},
	},
	screen_bottom_pivot_parent = {
		parent = "screen",
		position = {
			0,
			0,
			0,
		},
		size = {
			0,
			0,
		},
	},
	screen_bottom_pivot = {
		parent = "screen_bottom_pivot_parent",
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
	charge_bar = {
		horizontal_alignment = "center",
		parent = "screen_bottom_pivot",
		vertical_alignment = "center",
		size = DEFAULT_BAR_SIZE,
		position = {
			0,
			-220,
			1,
		},
	},
}
local frame_settings = UIFrameSettings.frame_outer_glow_01
local frame_corner = frame_settings.texture_sizes.corner
local frame_width = frame_corner[1]
local widget_definitions = {}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	DEFAULT_BAR_SIZE = DEFAULT_BAR_SIZE,
}
