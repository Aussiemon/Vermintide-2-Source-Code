local scenegraph_definition = {
	root = {
		is_root = true,
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
	twitch_icon = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "right",
		size = {
			100,
			43
		},
		position = {
			0,
			0,
			1
		}
	}
}
local twitch_icon = {
	scenegraph_id = "twitch_icon",
	element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "twitch_icon",
				texture_id = "twitch_icon"
			},
			{
				pass_type = "texture",
				style_id = "twitch_validate",
				texture_id = "twitch_validate",
				content_check_function = function (content, style)
					local connected = Managers.twitch:is_connected()

					return connected
				end
			}
		}
	},
	content = {
		fuzzy_circle = "fuzzy_circle",
		twitch_icon = "twitch_small_logo",
		twitch_validate = "twitch_validate",
		glass_indicator = "glass_indicator"
	},
	style = {
		twitch_icon = {
			vertical_alignment = "top",
			horizontal_alignment = "right",
			offset = {
				0,
				0,
				1
			},
			color = {
				255,
				255,
				255,
				255
			},
			texture_size = {
				120,
				43
			}
		},
		twitch_validate = {
			vertical_alignment = "center",
			scenegraph_id = "twitch_icon",
			horizontal_alignment = "left",
			offset = {
				-45,
				0,
				1
			},
			color = {
				255,
				255,
				255,
				255
			},
			texture_size = {
				25,
				25
			}
		}
	}
}
local definitions = {
	scenegraph_definition = scenegraph_definition,
	twitch_icon_widget = twitch_icon
}

return definitions
