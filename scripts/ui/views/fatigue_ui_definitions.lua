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
	background = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			-180,
			1
		},
		size = {
			500,
			200
		}
	},
	shield = {
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			200,
			200
		}
	}
}
local shield_animations = {
	state_2 = {
		time = 0.2,
		pictures = {
			"fatigue_icon_02",
			"fatigue_icon_07"
		}
	},
	state_3 = {
		time = 0.5,
		pictures = {
			"fatigue_icon_01",
			"fatigue_icon_02",
			"fatigue_icon_03",
			"fatigue_icon_04",
			"fatigue_icon_05",
			"fatigue_icon_06",
			"fatigue_icon_07",
			"fatigue_icon_08",
			"fatigue_icon_09",
			"fatigue_icon_10",
			"fatigue_icon_empty"
		}
	}
}
local shield = {
	scenegraph_id = "shield",
	element = {
		passes = {
			{
				pass_type = "texture",
				texture_id = "texture_id"
			},
			{
				pass_type = "texture",
				style_id = "texture_glow_id",
				texture_id = "texture_glow_id",
				content_check_function = function (content)
					return content.show_glow
				end
			}
		}
	},
	content = {
		show_glow = false,
		texture_id = "fatigue_icon_full",
		texture_glow_id = "fatigue_icon_glow"
	},
	style = {
		size = {
			200,
			200
		},
		offset = {
			0,
			0,
			0
		},
		color = {
			0,
			255,
			255,
			255
		},
		state_textures = {
			state_3 = "fatigue_icon_empty",
			state_2 = "fatigue_icon_broken",
			state_1 = "fatigue_icon_full"
		},
		state_animations = {
			state_1 = {
				state_3 = shield_animations.state_3
			},
			state_2 = {
				state_3 = shield_animations.state_3
			}
		},
		texture_glow_id = {
			color = {
				255,
				90,
				240,
				90
			},
			offset = {
				0,
				0,
				1
			}
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	shield_definition = shield
}
