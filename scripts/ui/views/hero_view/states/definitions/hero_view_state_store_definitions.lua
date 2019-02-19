local window_size = {
	800,
	800
}
local inner_window_size = {
	window_size[1] - 158,
	window_size[2] - 158
}
local list_size = {
	800,
	700
}
local list_scrollbar_size = {
	16,
	list_size[2]
}
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
	purchase_overlay = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			900
		}
	},
	purchase_background = {
		vertical_alignment = "center",
		parent = "purchase_overlay",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	purchase_background_fade = {
		vertical_alignment = "center",
		parent = "purchase_background",
		horizontal_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			1
		}
	},
	background_edge_top = {
		vertical_alignment = "top",
		parent = "purchase_background",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			79
		},
		position = {
			0,
			0,
			2
		}
	},
	background_edge_bottom = {
		vertical_alignment = "bottom",
		parent = "purchase_background",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			79
		},
		position = {
			0,
			0,
			2
		}
	},
	background_edge_left = {
		vertical_alignment = "center",
		parent = "purchase_background",
		horizontal_alignment = "left",
		size = {
			79,
			window_size[2]
		},
		position = {
			0,
			0,
			2
		}
	},
	background_edge_right = {
		vertical_alignment = "center",
		parent = "purchase_background",
		horizontal_alignment = "right",
		size = {
			79,
			window_size[2]
		},
		position = {
			0,
			0,
			2
		}
	},
	corner_bottom_left = {
		vertical_alignment = "bottom",
		parent = "purchase_background",
		horizontal_alignment = "left",
		size = {
			385,
			381
		},
		position = {
			-25,
			-25,
			3
		}
	},
	corner_bottom_right = {
		vertical_alignment = "bottom",
		parent = "purchase_background",
		horizontal_alignment = "right",
		size = {
			385,
			381
		},
		position = {
			29,
			-23,
			3
		}
	},
	corner_top_left = {
		vertical_alignment = "top",
		parent = "purchase_background",
		horizontal_alignment = "left",
		size = {
			385,
			381
		},
		position = {
			-27,
			23,
			3
		}
	},
	corner_top_right = {
		vertical_alignment = "top",
		parent = "purchase_background",
		horizontal_alignment = "right",
		size = {
			385,
			381
		},
		position = {
			27,
			25,
			3
		}
	},
	purchase_confirmation_approved = {
		vertical_alignment = "center",
		parent = "purchase_overlay",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	purchase_confirmation_declined = {
		vertical_alignment = "center",
		parent = "purchase_overlay",
		horizontal_alignment = "center",
		size = {
			256,
			512
		},
		position = {
			0,
			0,
			1
		}
	},
	purchase_confirmation_loading = {
		vertical_alignment = "center",
		parent = "purchase_overlay",
		horizontal_alignment = "center",
		size = {
			314,
			33
		},
		position = {
			0,
			0,
			1
		}
	},
	title_text = {
		vertical_alignment = "top",
		parent = "purchase_background_fade",
		horizontal_alignment = "center",
		size = {
			inner_window_size[1] - 30,
			50
		},
		position = {
			0,
			-75,
			2
		}
	},
	item_name_text = {
		vertical_alignment = "top",
		parent = "title_text",
		horizontal_alignment = "center",
		size = {
			inner_window_size[1] - 30,
			50
		},
		position = {
			0,
			-35,
			2
		}
	},
	purchase_button = {
		vertical_alignment = "bottom",
		parent = "purchase_background_fade",
		horizontal_alignment = "center",
		size = {
			260,
			160
		},
		position = {
			0,
			25,
			10
		}
	},
	currency_background = {
		vertical_alignment = "bottom",
		parent = "purchase_button",
		horizontal_alignment = "center",
		size = {
			250,
			100
		},
		position = {
			0,
			90,
			0
		}
	},
	purchase_item_root = {
		vertical_alignment = "top",
		parent = "currency_background",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			20,
			2
		}
	},
	currency_current = {
		vertical_alignment = "top",
		parent = "currency_background",
		horizontal_alignment = "right",
		size = {
			180,
			20
		},
		position = {
			-10,
			-20,
			2
		}
	},
	currency_cost = {
		vertical_alignment = "top",
		parent = "currency_background",
		horizontal_alignment = "right",
		size = {
			180,
			20
		},
		position = {
			-10,
			-50,
			2
		}
	},
	currency_cost_edge = {
		vertical_alignment = "bottom",
		parent = "currency_background",
		horizontal_alignment = "right",
		size = {
			210,
			2
		},
		position = {
			-10,
			40,
			2
		}
	},
	currency_balance = {
		vertical_alignment = "bottom",
		parent = "currency_background",
		horizontal_alignment = "right",
		size = {
			180,
			20
		},
		position = {
			-10,
			10,
			2
		}
	},
	currency_icon = {
		vertical_alignment = "center",
		parent = "currency_cost_edge",
		horizontal_alignment = "left",
		size = {
			64,
			64
		},
		position = {
			-32,
			0,
			1
		}
	},
	close_button = {
		vertical_alignment = "bottom",
		parent = "purchase_background",
		horizontal_alignment = "center",
		size = {
			260,
			42
		},
		position = {
			0,
			-70,
			1
		}
	},
	list_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = list_size,
		position = {
			130,
			-215,
			10
		}
	},
	list = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "left",
		size = list_size,
		position = {
			0,
			-list_size[2],
			0
		}
	},
	list_scrollbar = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "left",
		size = list_scrollbar_size,
		position = {
			-58,
			0,
			10
		}
	},
	list_detail_top_left = {
		vertical_alignment = "top",
		parent = "list_scrollbar",
		horizontal_alignment = "left",
		size = {
			157,
			97
		},
		position = {
			-45,
			60,
			2
		}
	},
	list_detail_bottom_left = {
		vertical_alignment = "bottom",
		parent = "list_scrollbar",
		horizontal_alignment = "left",
		size = {
			157,
			97
		},
		position = {
			-45,
			-60,
			2
		}
	},
	list_detail_top_center = {
		vertical_alignment = "top",
		parent = "list_detail_top_left",
		horizontal_alignment = "left",
		size = {
			64,
			97
		},
		position = {
			157,
			0,
			0
		}
	},
	list_detail_bottom_center = {
		vertical_alignment = "bottom",
		parent = "list_detail_bottom_left",
		horizontal_alignment = "left",
		size = {
			200,
			97
		},
		position = {
			157,
			0,
			0
		}
	},
	list_detail_top_right = {
		vertical_alignment = "top",
		parent = "list_detail_top_center",
		horizontal_alignment = "right",
		size = {
			23,
			97
		},
		position = {
			23,
			0,
			0
		}
	},
	list_detail_bottom_right = {
		vertical_alignment = "bottom",
		parent = "list_detail_bottom_center",
		horizontal_alignment = "right",
		size = {
			23,
			97
		},
		position = {
			23,
			0,
			0
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = false,
	localize = true,
	font_size = 42,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local item_name_text_style = {
	use_shadow = true,
	upper_case = false,
	localize = false,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_purchase_button(scenegraph_id, size, text, font_size, disable_with_gamepad)
	local background_texture = "menu_frame_bg_07"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.button_frame_01_gold
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = "button_detail_06_gold"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size

	return {
		element = {
			passes = {
				{
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "background_fade",
					style_id = "background_fade",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect"
				},
				{
					style_id = "disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail"
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_write_mask",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					texture_id = "glas",
					style_id = "glas",
					pass_type = "texture"
				},
				{
					texture_id = "currency_icon",
					style_id = "currency_icon",
					pass_type = "texture"
				},
				{
					texture_id = "currency_icon_holder",
					style_id = "currency_icon_holder",
					pass_type = "texture"
				},
				{
					texture_id = "title_text_gradient",
					style_id = "title_text_gradient",
					pass_type = "texture"
				},
				{
					texture_id = "clear_mask",
					style_id = "clear_mask",
					pass_type = "texture"
				},
				{
					style_id = "current_title",
					pass_type = "text",
					text_id = "current_title"
				},
				{
					style_id = "current_title_shadow",
					pass_type = "text",
					text_id = "current_title"
				},
				{
					style_id = "current_value",
					pass_type = "text",
					text_id = "current_value"
				},
				{
					style_id = "current_value_shadow",
					pass_type = "text",
					text_id = "current_value"
				},
				{
					style_id = "cost_title",
					pass_type = "text",
					text_id = "cost_title"
				},
				{
					style_id = "cost_title_shadow",
					pass_type = "text",
					text_id = "cost_title"
				},
				{
					style_id = "cost_value",
					pass_type = "text",
					text_id = "cost_value"
				},
				{
					style_id = "cost_value_shadow",
					pass_type = "text",
					text_id = "cost_value"
				},
				{
					style_id = "balance_title",
					pass_type = "text",
					text_id = "balance_title"
				},
				{
					style_id = "balance_title_shadow",
					pass_type = "text",
					text_id = "balance_title"
				},
				{
					style_id = "balance_value",
					pass_type = "text",
					text_id = "balance_value"
				},
				{
					style_id = "balance_value_shadow",
					pass_type = "text",
					text_id = "balance_value"
				},
				{
					pass_type = "rect",
					style_id = "currency_line"
				}
			}
		},
		content = {
			balance_title = "menu_store_currency_text_balance",
			hover_glow = "button_state_default",
			current_title = "menu_store_currency_text_current",
			currency_icon_holder = "button_detail_07_gold",
			cost_value = "-",
			cost_title = "menu_store_currency_text_cost",
			glas = "game_options_fg",
			balance_value = "-",
			title_text_gradient = "text_gradient",
			background_fade = "button_bg_fade",
			clear_mask = "mask_rect",
			current_value = "-",
			currency_icon = "store_icon_currency_ingame",
			button_hotspot = {},
			side_detail = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				texture_id = side_detail_texture
			},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			},
			disable_with_gamepad = disable_with_gamepad
		},
		style = {
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
			},
			background_fade = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					frame_width,
					frame_width - 2,
					2
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 2,
					3
				},
				size = {
					size[1],
					math.max(size[2] - 5, 80)
				}
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				}
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20
				},
				offset = {
					0,
					0,
					1
				}
			},
			current_title = {
				font_size = 20,
				upper_case = false,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					20,
					size[2] - 40,
					6
				}
			},
			current_title_shadow = {
				font_size = 20,
				upper_case = false,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					22,
					size[2] - 40 - 2,
					5
				}
			},
			current_value = {
				font_size = 20,
				upper_case = false,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					20,
					size[2] - 40,
					6
				}
			},
			current_value_shadow = {
				font_size = 20,
				upper_case = false,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					22,
					size[2] - 40 - 2,
					5
				}
			},
			cost_title = {
				font_size = 20,
				upper_case = false,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					20,
					size[2] - 60,
					6
				}
			},
			cost_title_shadow = {
				font_size = 20,
				upper_case = false,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					22,
					size[2] - 60 - 2,
					5
				}
			},
			cost_value = {
				font_size = 20,
				upper_case = false,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					20,
					size[2] - 60,
					6
				}
			},
			cost_value_shadow = {
				font_size = 20,
				upper_case = false,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					22,
					size[2] - 60 - 2,
					5
				}
			},
			balance_title = {
				font_size = 20,
				upper_case = false,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					20,
					size[2] - 90,
					6
				}
			},
			balance_title_shadow = {
				font_size = 20,
				upper_case = false,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					22,
					size[2] - 90 - 2,
					5
				}
			},
			balance_value = {
				font_size = 20,
				upper_case = false,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					20,
					size[2] - 90,
					6
				},
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				insufficient_text_color = Colors.get_color_table_with_alpha("red", 255)
			},
			balance_value_shadow = {
				font_size = 20,
				upper_case = false,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					20
				},
				offset = {
					22,
					size[2] - 90 - 2,
					5
				}
			},
			title_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					20,
					10,
					6
				}
			},
			title_text_write_mask = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_header_write_mask",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					20,
					10,
					7
				}
			},
			title_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					20,
					10,
					6
				}
			},
			title_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					22,
					8,
					5
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					8
				}
			},
			currency_icon = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					29,
					10
				},
				texture_size = {
					64,
					64
				}
			},
			currency_icon_holder = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					21,
					9
				},
				texture_size = {
					100,
					48
				}
			},
			title_text_gradient = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				masked = true,
				color = {
					255,
					97,
					180,
					141
				},
				offset = {
					0,
					24,
					7
				},
				texture_size = {
					size[1] - 40,
					28
				}
			},
			clear_mask = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					1,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					1
				},
				texture_size = size
			},
			currency_line = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				masked = true,
				color = {
					150,
					120,
					120,
					120
				},
				offset = {
					0,
					size[2] - 68,
					6
				},
				texture_size = {
					size[1] - 40,
					2
				}
			},
			glas = {
				color = {
					150,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				},
				size = {
					size[1],
					size[2]
				}
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - side_detail_texture_size[1] + 9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
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
end

local disable_with_gamepad = true
local widgets = {}
local list_detail_widgets = {
	list_detail_top_left = UIWidgets.create_simple_uv_texture("divider_skull_left", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "list_detail_top_left"),
	list_detail_bottom_left = UIWidgets.create_simple_uv_texture("divider_skull_left", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "list_detail_bottom_left"),
	list_detail_top_center = UIWidgets.create_tiled_texture("list_detail_top_center", "divider_skull_middle", {
		64,
		97
	}),
	list_detail_bottom_center = UIWidgets.create_tiled_texture("list_detail_bottom_center", "divider_skull_middle_down", {
		64,
		97
	}),
	list_detail_top_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "list_detail_top_right"),
	list_detail_bottom_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "list_detail_bottom_right"),
	chain = UIWidgets.create_tiled_texture("list_scrollbar", "chain_link_01_blue", {
		16,
		19
	})
}
local purchase_popup_widgets = {
	title_text = UIWidgets.create_simple_text("menu_store_purchase_popup_title", "title_text", nil, nil, title_text_style),
	item_name_text = UIWidgets.create_simple_text("n/a", "item_name_text", nil, nil, item_name_text_style),
	purchase_overlay = UIWidgets.create_simple_rect("purchase_overlay", {
		220,
		10,
		10,
		10
	}),
	purchase_background = UIWidgets.create_tiled_texture("purchase_background", "menu_frame_bg_03", {
		256,
		256
	}),
	purchase_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "purchase_background_fade"),
	background_edge_top = UIWidgets.create_tiled_texture("background_edge_top", "store_frame_side_01", {
		128,
		79
	}),
	background_edge_bottom = UIWidgets.create_tiled_texture("background_edge_bottom", "store_frame_side_03", {
		128,
		79
	}),
	background_edge_left = UIWidgets.create_tiled_texture("background_edge_left", "store_frame_side_04", {
		79,
		128
	}),
	background_edge_right = UIWidgets.create_tiled_texture("background_edge_right", "store_frame_side_02", {
		79,
		128
	}),
	corner_bottom_left = UIWidgets.create_simple_rotated_texture("store_frame_corner", 0, {
		192.5,
		190.5
	}, "corner_bottom_left"),
	corner_bottom_right = UIWidgets.create_simple_rotated_texture("store_frame_corner", -math.pi / 2, {
		192.5,
		190.5
	}, "corner_bottom_right"),
	corner_top_left = UIWidgets.create_simple_rotated_texture("store_frame_corner", math.pi / 2, {
		192.5,
		190.5
	}, "corner_top_left"),
	corner_top_right = UIWidgets.create_simple_rotated_texture("store_frame_corner", math.pi, {
		192.5,
		190.5
	}, "corner_top_right"),
	purchase_button = create_purchase_button("purchase_button", scenegraph_definition.purchase_button.size, Localize("menu_store_purchase_button_unlock"), 36, disable_with_gamepad),
	close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, "button_frame_01_gold", "menu_frame_bg_06", Localize("interaction_action_close"), 28, nil, "button_detail_03_gold", nil, disable_with_gamepad)
}
local purchase_confirm_widgets = {
	overlay = UIWidgets.create_simple_rect("purchase_overlay", {
		220,
		10,
		10,
		10
	}),
	declined = UIWidgets.create_simple_gradient_mask_texture("store_loading_declined", "purchase_confirmation_declined", {
		255,
		255,
		0,
		0
	}),
	approved = {
		scenegraph_id = "purchase_confirmation_approved",
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture"
				},
				{
					texture_id = "background_final",
					style_id = "background_final",
					pass_type = "texture"
				},
				{
					texture_id = "stamp",
					style_id = "stamp",
					pass_type = "texture"
				},
				{
					texture_id = "drop",
					style_id = "drop",
					pass_type = "texture"
				},
				{
					texture_id = "smoke",
					style_id = "smoke",
					pass_type = "texture"
				},
				{
					texture_id = "check",
					style_id = "check",
					pass_type = "texture"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = "menu_store_purchase_confirmation_approved",
			background_final = "store_sigil_stamped",
			background = "store_sigil_blob",
			check = "store_sigil_check",
			stamp = "store_sigil_symbol",
			drop = "store_sigil_drop",
			fade_out = false,
			smoke = "store_sigil_smoke"
		},
		style = {
			background = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					199,
					220
				},
				default_size = {
					199,
					220
				},
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
			},
			background_final = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					276,
					276
				},
				default_size = {
					276,
					276
				},
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
			},
			drop = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					78,
					79
				},
				default_size = {
					78,
					79
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					3
				}
			},
			stamp = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					195,
					195
				},
				default_size = {
					195,
					195
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-5,
					-5,
					5
				}
			},
			smoke = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					256,
					256
				},
				default_size = {
					256,
					256
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			check = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					150,
					122
				},
				default_size = {
					150,
					122
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					-5,
					-23,
					6
				}
			},
			text = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 82,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					-200,
					2
				}
			},
			text_shadow = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 82,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-202,
					1
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	},
	loading_icon = {
		scenegraph_id = "purchase_confirmation_loading",
		element = {
			passes = {
				{
					style_id = "background",
					pass_type = "texture",
					texture_id = "background",
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0
						local speed = 0.5
						progress = (progress + dt * speed) % 1
						local anim_progress = math.smoothstep(progress, 0, 1)
						style.progress = progress
						local fade_out = content.fade_out
						local alpha = 255 * math.ease_pulse(anim_progress)
						style.color[1] = (fade_out and math.min(style.color[1], alpha)) or alpha
					end
				},
				{
					style_id = "glow",
					pass_type = "texture",
					texture_id = "glow",
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0
						local speed = 0.5
						progress = (progress + dt * speed) % 1
						local anim_progress = math.smoothstep(progress, 0, 1)
						style.progress = progress
						local fade_out = content.fade_out
						local alpha = 255 * math.ease_pulse(anim_progress)
						style.color[1] = (fade_out and math.min(style.color[1], alpha)) or alpha
					end
				}
			}
		},
		content = {
			background = "loading_title_divider_background",
			fade_out = false,
			glow = "loading_title_divider"
		},
		style = {
			background = {
				progress = 0,
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
			},
			glow = {
				progress = 0,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
}
local animation_definitions = {
	approved = {
		{
			name = "background",
			start_progress = 0,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.approved
				local style = widget.style
				local background_style = style.background
				local stamp_style = style.stamp
				local background_final_style = style.background_final
				background_style.color[1] = 0
				stamp_style.color[1] = 0
				background_final_style.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_out_quad(progress)
				local widget = widgets.approved
				local content = widget.content
				local style = widget.style
				local background_style = style.background
				local background_size = background_style.texture_size
				local background_default_size = background_style.default_size
				background_size[1] = math.floor(background_default_size[1] - 40 + 20 * anim_progress)
				background_size[2] = math.floor(background_default_size[2] - 40 + 20 * anim_progress)
				background_style.color[1] = 255 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "stamp",
			start_progress = 0,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_in_exp(progress)
				local widget = widgets.approved
				local content = widget.content
				local style = widget.style
				local stamp_style = style.stamp
				local stamp_size = stamp_style.texture_size
				local stamp_default_size = stamp_style.default_size
				stamp_size[1] = math.floor((stamp_default_size[1] + 800) - 800 * anim_progress)
				stamp_size[2] = math.floor((stamp_default_size[2] + 800) - 800 * anim_progress)
				stamp_style.color[1] = 255 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.approved
				local style = widget.style
				local stamp_style = style.stamp
				local stamp_size = stamp_style.texture_size
				local stamp_default_size = stamp_style.default_size
				stamp_style.color[1] = 0
			end
		},
		{
			name = "final_background",
			start_progress = 0.4,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_exp(progress)
				local widget = widgets.approved
				local content = widget.content
				local style = widget.style
				local background_final_style = style.background_final
				local background_final_size = background_final_style.texture_size
				local background_final_default_size = background_final_style.default_size
				background_final_size[1] = math.floor(background_final_default_size[1] - 10 + 10 * anim_progress)
				background_final_size[2] = math.floor(background_final_default_size[2] - 10 + 10 * anim_progress)
				background_final_style.color[1] = 255 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "drop_move",
			start_progress = 0.3,
			end_progress = 0.32,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.approved
				local style = widget.style
				local drop_style = style.drop
				drop_style.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.approved
				local content = widget.content
				local style = widget.style
				local drop_style = style.drop
				local drop_size = drop_style.texture_size
				local drop_default_size = drop_style.default_size
				local drop_offset = drop_style.offset
				drop_offset[1] = math.floor(150 * anim_progress)
				drop_offset[2] = math.floor(-100 * anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "drop_size",
			start_progress = 0.3,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				local widget = widgets.approved
				local content = widget.content
				local style = widget.style
				local drop_style = style.drop
				local drop_size = drop_style.texture_size
				local drop_default_size = drop_style.default_size
				drop_size[1] = math.floor(drop_default_size[1] - 40 + 40 * anim_progress)
				drop_size[2] = math.floor(drop_default_size[2] - 40 + 40 * anim_progress)
				drop_style.color[1] = anim_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "text",
			start_progress = 0.4,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.approved
				local style = widget.style
				local text_style = style.text
				local text_shadow_style = style.text_shadow
				text_style.text_color[1] = 0
				text_shadow_style.text_color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_exp(progress)
				local widget = widgets.approved
				local content = widget.content
				local style = widget.style
				local alpha = 255 * anim_progress
				local text_style = style.text
				local text_shadow_style = style.text_shadow
				text_style.text_color[1] = alpha
				text_shadow_style.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "smoke_size",
			start_progress = 0.4,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.approved
				local style = widget.style
				local background_style = style.background
				local stamp_style = style.stamp
				local background_final_style = style.background_final
				background_style.color[1] = 0
				stamp_style.color[1] = 0
				background_final_style.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_out_quad(progress)
				local widget = widgets.approved
				local content = widget.content
				local style = widget.style
				local smoke_style = style.smoke
				local smoke_size = smoke_style.texture_size
				local smoke_default_size = smoke_style.default_size
				smoke_size[1] = math.floor(smoke_default_size[1] + 200 * anim_progress)
				smoke_size[2] = math.floor(smoke_default_size[2] + 200 * anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "smoke_fade",
			start_progress = 0.4,
			end_progress = 1.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.approved
				local style = widget.style
				local background_style = style.background
				local stamp_style = style.stamp
				local background_final_style = style.background_final
				background_style.color[1] = 0
				stamp_style.color[1] = 0
				background_final_style.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.approved
				local content = widget.content
				local style = widget.style
				local smoke_style = style.smoke
				smoke_style.color[1] = 50 * math.ease_pulse(anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	list_detail_on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local list_detail_top_left = widgets.list_detail_top_left
				local list_detail_top_right = widgets.list_detail_top_right
				local list_detail_bottom_left = widgets.list_detail_bottom_left
				local list_detail_bottom_center = widgets.list_detail_bottom_center
				local list_detail_top_center = widgets.list_detail_top_center
				local list_detail_bottom_right = widgets.list_detail_bottom_right
				local chain = widgets.chain
				local alpha = 255 * anim_progress
				chain.style.tiling_texture.color[1] = alpha
				list_detail_top_center.style.tiling_texture.color[1] = alpha
				list_detail_bottom_center.style.tiling_texture.color[1] = alpha
				list_detail_top_left.style.texture_id.color[1] = alpha
				list_detail_bottom_left.style.texture_id.color[1] = alpha
				list_detail_top_right.style.texture_id.color[1] = alpha
				list_detail_bottom_right.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	list_detail_widgets = list_detail_widgets,
	purchase_popup_widgets = purchase_popup_widgets,
	purchase_confirm_widgets = purchase_confirm_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
