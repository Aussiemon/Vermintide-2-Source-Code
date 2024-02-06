-- chunkname: @scripts/ui/views/fatigue_ui_definitions.lua

local scenegraph_definition = {
	root = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			1920,
			1080,
		},
	},
	background_parent = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			-120,
			1,
		},
		size = {
			500,
			200,
		},
	},
	background = {
		horizontal_alignment = "left",
		parent = "background_parent",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			0,
		},
		size = {
			500,
			200,
		},
	},
	background_dragger = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			-50,
			0,
		},
		size = {
			320,
			40,
		},
	},
	shield = {
		horizontal_alignment = "center",
		parent = "background",
		position = {
			0,
			0,
			1,
		},
		size = {
			90,
			90,
		},
	},
}
local shield_animations = {
	state_2 = {
		time = 0.2,
		pictures = {
			"fatigue_icon_02",
			"fatigue_icon_05",
		},
	},
	state_3 = {
		time = 0.4,
		pictures = {
			"fatigue_icon_02",
			"fatigue_icon_03",
			"fatigue_icon_04",
			"fatigue_icon_05",
			"fatigue_icon_06",
			"fatigue_icon_07",
			"fatigue_icon_08",
		},
	},
}
local shield = {
	scenegraph_id = "shield",
	element = {
		passes = {
			{
				pass_type = "texture",
				texture_id = "texture_id",
			},
			{
				pass_type = "texture",
				style_id = "texture_glow_id",
				texture_id = "texture_glow_id",
				content_check_function = function (content)
					return content.show_glow
				end,
			},
		},
	},
	content = {
		show_glow = false,
		texture_glow_id = "fatigue_icon_glow",
		texture_id = "fatigue_icon_01",
	},
	style = {
		size = {
			90,
			90,
		},
		offset = {
			0,
			0,
			0,
		},
		color = {
			0,
			255,
			255,
			255,
		},
		state_textures = {
			state_1 = "fatigue_icon_01",
			state_2 = "fatigue_icon_02",
			state_3 = "fatigue_icon_08",
		},
		state_animations = {
			state_1 = {
				state_3 = shield_animations.state_3,
			},
			state_2 = {
				state_3 = shield_animations.state_3,
			},
		},
		texture_glow_id = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				64,
				64,
			},
			color = {
				255,
				90,
				240,
				90,
			},
			offset = {
				0,
				0,
				1,
			},
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	shield_definition = shield,
}
