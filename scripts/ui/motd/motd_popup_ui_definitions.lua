local SIZE_X = 1920
local SIZE_Y = 1080
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.main_menu
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	background_center = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			1280,
			720
		}
	},
	ok_button = {
		vertical_alignment = "bottom",
		parent = "background_center",
		horizontal_alignment = "center",
		position = {
			0,
			-35,
			10
		},
		size = {
			370,
			70
		}
	}
}
local widget_definitions = {
	background_top = UIWidgets.create_simple_texture("motd_dynamic", "background_center"),
	screen_background = UIWidgets.create_simple_rect("screen", {
		100,
		0,
		0,
		0
	}),
	ok_button = UIWidgets.create_default_button("ok_button", scenegraph_definition.ok_button.size, nil, nil, Localize("button_ok"))
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	dynamic_texture = widget_definitions.background_top.content.texture_id
}
