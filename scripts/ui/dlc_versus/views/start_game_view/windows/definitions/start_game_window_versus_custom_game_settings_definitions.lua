-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_custom_game_settings_definitions.lua

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
			UILayer.default,
		},
	},
	container = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			660,
			380,
		},
		position = {
			0,
			-100,
			10,
		},
	},
	settings_anchor = {
		horizontal_alignment = "left",
		parent = "container",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-10,
			1,
		},
	},
}

local function create_list_mask(scenegraph_id, size)
	size = size or {
		600,
		380,
	}

	local definition = {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "mask",
					texture_id = "mask",
				},
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
			},
		},
		content = {
			mask = "mask_rect",
			hotspot = {},
		},
		style = {
			mask = {
				texture_size = size,
				offset = {
					0,
					0,
					0,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			hotspot = {
				size = size,
				offset = {
					0,
					0,
					0,
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

	return definition
end

local widget_definitions = {
	background = UIWidgets.create_rect_with_outer_frame("container", scenegraph_definition.container.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	mask = create_list_mask("container", scenegraph_definition.container.size),
}
local animation_definitions = {}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
}
