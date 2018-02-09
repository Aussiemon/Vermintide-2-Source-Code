local scenegraph_definition = {
	root_1 = {
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
	screen = {
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
		parent = "root_1",
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
	title_text = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1800,
			2
		},
		position = {
			0,
			250,
			1
		}
	},
	title_divider = {
		vertical_alignment = "bottom",
		parent = "title_text",
		horizontal_alignment = "center",
		size = {
			264,
			32
		},
		position = {
			0,
			-16,
			1
		}
	},
	console_cursor = {
		vertical_alignment = "center",
		parent = "root_1",
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
	confirm_button = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			350,
			70
		},
		position = {
			0,
			100,
			10
		}
	},
	close_button = {
		vertical_alignment = "bottom",
		parent = "confirm_button",
		horizontal_alignment = "center",
		size = {
			300,
			42
		},
		position = {
			0,
			-50,
			10
		}
	},
	previous_button = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			30,
			85
		},
		position = {
			-300,
			0,
			0
		}
	},
	next_button = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			30,
			85
		},
		position = {
			300,
			0,
			0
		}
	}
}
local title_text_style = {
	font_size = 52,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local widgets_definitions = {
	previous_button = {
		scenegraph_id = "previous_button",
		element = {
			passes = {
				{
					style_id = "arrow",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "arrow",
					texture_id = "arrow"
				}
			}
		},
		content = {
			arrow = "console_map_screen_arrow",
			button_hotspot = {}
		},
		style = {
			arrow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	},
	next_button = {
		scenegraph_id = "next_button",
		element = {
			passes = {
				{
					style_id = "arrow",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "arrow",
					pass_type = "texture_uv",
					content_id = "arrow"
				}
			}
		},
		content = {
			button_hotspot = {},
			arrow = {
				texture_id = "console_map_screen_arrow",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			}
		},
		style = {
			arrow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	},
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	background = UIWidgets.create_simple_texture("gradient_credits_menu", "screen"),
	confirm_button = UIWidgets.create_default_button("confirm_button", scenegraph_definition.confirm_button.size, nil, nil, "n/a", 24, "green"),
	close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, nil, nil, Localize("close"), 24, nil, "button_detail_03")
}
local viewport_definition = {
	scenegraph_id = "screen",
	element = {
		passes = {
			{
				style_id = "viewport",
				pass_type = "viewport",
				content_id = "viewport"
			}
		}
	},
	style = {
		viewport = {
			scenegraph_id = "screen",
			viewport_type = "default_forward",
			shading_environment = "environment/blank_offscreen_chest",
			viewport_name = "keep_decoration_viewport",
			enable_sub_gui = false,
			world_name = "keep_decoration",
			layer = UILayer.default,
			camera_position = {
				0,
				0,
				0
			},
			camera_lookat = {
				1,
				0,
				0
			}
		}
	},
	content = {}
}

return {
	scenegraph_definition = scenegraph_definition,
	viewport_definition = viewport_definition,
	widgets_definitions = widgets_definitions
}
