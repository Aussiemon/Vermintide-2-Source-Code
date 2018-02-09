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
	loading_icon = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			114,
			114
		},
		position = {
			-90,
			114,
			1
		}
	}
}

local function create_loading_icon_widget(texture, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background_rect"
				},
				{
					texture_id = "loading_icon_id",
					style_id = "loading_icon",
					pass_type = "texture"
				}
			}
		},
		content = {
			current_index = 0,
			loading_icon_id = texture
		},
		style = {
			background_rect = {
				offset = {
					0,
					0,
					-1
				},
				color = {
					0,
					0,
					0,
					0
				}
			},
			loading_icon = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
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

local definitions = {
	scenegraph_definition = scenegraph_definition,
	loading_icon = create_loading_icon_widget("default", "loading_icon")
}

return definitions
