local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local confirm_button_size = {
	window_size[1] - 60,
	72
}
local game_option_size = {
	window_size[1] - 20,
	window_size[2] - (50 + confirm_button_size[2])
}
local deed_frame_name = "menu_frame_08"
local deed_frame_settings = UIFrameSettings[deed_frame_name]
local deed_frame_width = deed_frame_settings.texture_sizes.corner[1]
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	menu_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	game_options_right_chain = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			16,
			window_size[2]
		},
		position = {
			195,
			0,
			1
		}
	},
	game_options_left_chain = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			16,
			window_size[2]
		},
		position = {
			-195,
			0,
			1
		}
	},
	game_option_1 = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = game_option_size,
		position = {
			0,
			-16,
			2
		}
	},
	item_presentation = {
		vertical_alignment = "top",
		parent = "game_option_1",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 10,
			0
		},
		position = {
			0,
			-deed_frame_width,
			1
		}
	},
	confirm_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = confirm_button_size,
		position = {
			0,
			18,
			20
		}
	}
}

local function create_placeholder_option(scenegraph_id, size)
	local background_texture = "game_options_bg_04"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local widget = {
		element = {
			passes = {
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				}
			}
		},
		content = {
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1)
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			background = {
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
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local widgets = {
	background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "window"),
	window = UIWidgets.create_frame("window", window_size, window_frame, 20),
	confirm_button = UIWidgets.create_default_button("confirm_button", scenegraph_definition.confirm_button.size, nil, nil, Localize("confirm_menu_button_name"), 32),
	game_options_left_chain = UIWidgets.create_tiled_texture("game_options_left_chain", "chain_link_01", {
		16,
		19
	}),
	game_options_right_chain = UIWidgets.create_tiled_texture("game_options_right_chain", "chain_link_01", {
		16,
		19
	}),
	game_option_placeholder = create_placeholder_option("game_option_1", scenegraph_definition.game_option_1.size),
	item_presentation_frame = UIWidgets.create_frame("game_option_1", scenegraph_definition.game_option_1.size, deed_frame_name, 20),
	item_presentation_bg = UIWidgets.create_simple_texture("game_options_bg_04", "game_option_1"),
	item_presentation = UIWidgets.create_simple_item_presentation("item_presentation")
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition
}
