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
	screen = {
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
	twitch_icon = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			80,
			27.200000000000003
		},
		position = {
			-10,
			10,
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
				style_id = "twitch_connected",
				texture_id = "twitch_connected",
				content_check_function = function (content, style)
					local connected = Managers.twitch:is_connected()

					return connected
				end
			},
			{
				pass_type = "texture",
				style_id = "twitch_disconnected",
				texture_id = "twitch_disconnected",
				content_check_function = function (content, style)
					local disconnected = not Managers.twitch:is_connected()

					return disconnected
				end
			}
		}
	},
	content = {
		twitch_icon = "twitch_small_logo",
		twitch_connected = "twitch_connected",
		twitch_disconnected = "twitch_disconnected"
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
			color = Colors.get_table("white"),
			texture_size = {
				80,
				27.200000000000003
			}
		},
		twitch_connected = {
			vertical_alignment = "center",
			scenegraph_id = "twitch_icon",
			horizontal_alignment = "left",
			offset = {
				-40,
				2,
				1
			},
			color = Colors.get_table("white"),
			texture_size = {
				30,
				30
			}
		},
		twitch_disconnected = {
			vertical_alignment = "center",
			scenegraph_id = "twitch_icon",
			horizontal_alignment = "left",
			offset = {
				-40,
				2,
				1
			},
			color = Colors.get_table("white"),
			texture_size = {
				30,
				30
			}
		}
	}
}
local definitions = {
	scenegraph_definition = scenegraph_definition,
	twitch_icon_widget = twitch_icon
}

return definitions
