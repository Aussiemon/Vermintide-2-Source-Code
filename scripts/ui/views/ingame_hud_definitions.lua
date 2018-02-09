local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			1920,
			1080
		}
	},
	subtitles = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
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
	damage_indicator_center = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition
}
