local_require("scripts/ui/ui_widgets")

local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			1
		},
		size = {
			1920,
			1080
		}
	},
	dead_space_filler = {
		scale = "fit",
		position = {
			0,
			0,
			0
		},
		size = {
			1920,
			1080
		}
	},
	background_image = {
		vertical_alignment = "center",
		scale = "aspect_ratio",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			2
		}
	}
}

local function create_weave_image(image, alpha)
	return {
		scenegraph_id = "background_image",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "bg_texture",
					texture_id = "bg_texture"
				}
			}
		},
		content = {
			bg_texture = image
		},
		style = {
			bg_texture = {
				color = {
					alpha,
					255,
					255,
					255
				}
			}
		},
		offset = {
			0,
			0,
			5
		}
	}
end

local widgets = {
	dead_space_filler = UIWidgets.create_simple_rect("root", {
		255,
		0,
		0,
		0
	}, -1)
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widgets,
	create_weave_image_func = create_weave_image
}
