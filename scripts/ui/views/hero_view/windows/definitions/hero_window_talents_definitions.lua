local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_width_offset = window_size[1]*2 + window_spacing*2
local window_text_width = window_size[1] - (window_frame_width*2 + 60)
local career_window_size = {
	window_size[1]*2 + window_spacing,
	window_size[2]
}
local career_info_size = {
	career_window_size[1]/2 - 40,
	career_window_size[2] - 50
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
	window_frame = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "left",
		size = career_window_size,
		position = {
			0,
			0,
			1
		}
	},
	career_window = {
		vertical_alignment = "top",
		parent = "window_frame",
		horizontal_alignment = "center",
		size = career_window_size,
		position = {
			0,
			0,
			1
		}
	},
	passive_window = {
		vertical_alignment = "top",
		parent = "career_window",
		horizontal_alignment = "left",
		size = career_info_size,
		position = {
			30,
			-20,
			1
		}
	},
	passive_icon = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "left",
		size = {
			80,
			80
		},
		position = {
			0,
			0,
			5
		}
	},
	passive_icon_frame = {
		vertical_alignment = "center",
		parent = "passive_icon",
		horizontal_alignment = "center",
		size = {
			80,
			80
		},
		position = {
			0,
			0,
			1
		}
	},
	passive_title_text = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 90,
			50
		},
		position = {
			90,
			-10,
			1
		}
	},
	passive_title_divider = {
		vertical_alignment = "bottom",
		parent = "passive_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			15,
			1
		}
	},
	passive_type_title = {
		vertical_alignment = "top",
		parent = "passive_title_divider",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 90,
			50
		},
		position = {
			0,
			-5,
			1
		}
	},
	passive_description_text = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 20,
			career_info_size[2] - 90
		},
		position = {
			0,
			-90,
			1
		}
	},
	active_window = {
		vertical_alignment = "top",
		parent = "career_window",
		horizontal_alignment = "right",
		size = career_info_size,
		position = {
			-30,
			-20,
			1
		}
	},
	active_icon = {
		vertical_alignment = "top",
		parent = "active_window",
		horizontal_alignment = "left",
		size = {
			80,
			80
		},
		position = {
			0,
			0,
			5
		}
	},
	active_icon_frame = {
		vertical_alignment = "center",
		parent = "active_icon",
		horizontal_alignment = "center",
		size = {
			80,
			80
		},
		position = {
			0,
			0,
			1
		}
	},
	active_title_text = {
		vertical_alignment = "top",
		parent = "active_window",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 90,
			50
		},
		position = {
			90,
			-10,
			1
		}
	},
	active_title_divider = {
		vertical_alignment = "bottom",
		parent = "active_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			15,
			1
		}
	},
	active_type_title = {
		vertical_alignment = "top",
		parent = "active_title_divider",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 90,
			50
		},
		position = {
			0,
			-5,
			1
		}
	},
	active_description_text = {
		vertical_alignment = "top",
		parent = "active_window",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 20,
			career_info_size[2] - 90
		},
		position = {
			0,
			-90,
			1
		}
	},
	talents_window = {
		vertical_alignment = "bottom",
		parent = "window_frame",
		horizontal_alignment = "center",
		size = {
			career_window_size[1],
			505
		},
		position = {
			0,
			0,
			1
		}
	},
	talent_row_1 = {
		vertical_alignment = "bottom",
		parent = "talent_row_2",
		horizontal_alignment = "center",
		size = {
			career_window_size[1] - 20,
			100
		},
		position = {
			0,
			120,
			0
		}
	},
	talent_row_2 = {
		vertical_alignment = "bottom",
		parent = "talent_row_3",
		horizontal_alignment = "center",
		size = {
			career_window_size[1] - 20,
			100
		},
		position = {
			0,
			120,
			0
		}
	},
	talent_row_3 = {
		vertical_alignment = "bottom",
		parent = "talent_row_4",
		horizontal_alignment = "center",
		size = {
			career_window_size[1] - 20,
			100
		},
		position = {
			0,
			120,
			0
		}
	},
	talent_row_4 = {
		vertical_alignment = "bottom",
		parent = "talent_row_5",
		horizontal_alignment = "center",
		size = {
			career_window_size[1] - 20,
			100
		},
		position = {
			0,
			120,
			0
		}
	},
	talent_row_5 = {
		vertical_alignment = "bottom",
		parent = "window_frame",
		horizontal_alignment = "center",
		size = {
			career_window_size[1] - 20,
			100
		},
		position = {
			0,
			10,
			5
		}
	}
}
local title_text_style = {
	font_size = 42,
	upper_case = true,
	localize = false,
	use_shadow = true,
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
local description_text_style = {
	word_wrap = true,
	font_size = 18,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local type_title_text_style = {
	word_wrap = true,
	font_size = 20,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local sub_title_text_style = {
	font_size = 32,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local level_area_text_style = {
	font_size = 32,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		-8,
		4
	}
}

local function create_window_button(scenegraph_id, size, button_text, font_size, use_bottom_edge, optional_color_name)
	local button_color_name = nil

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local button_background_texture = "button_bg_01"
	local button_background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(button_background_texture)
	local widget = {
		element = {
			passes = {
				{
					style_id = "button_background",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "button_background",
					pass_type = "texture_uv",
					content_id = "button_background"
				},
				{
					texture_id = "bottom_edge",
					style_id = "button_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "glass_top",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end
				},
				{
					style_id = "button_text",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "button_text_disabled",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "button_text_shadow",
					pass_type = "text",
					text_id = "button_text"
				},
				{
					style_id = "button_clicked_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end
				},
				{
					style_id = "button_disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture",
					content_check_function = function (content)
						return content.use_bottom_edge
					end
				}
			}
		},
		content = {
			edge_holder_left = "menu_frame_09_divider_left",
			edge_holder_right = "menu_frame_09_divider_right",
			glass_top = "button_glass_01",
			bottom_edge = "menu_frame_09_divider",
			use_bottom_edge = use_bottom_edge,
			button_hotspot = {},
			button_text = button_text or "n/a",
			hover_glow = (optional_color_name and "button_state_hover_" .. optional_color_name) or "button_state_hover",
			glow = (optional_color_name and "button_state_normal_" .. optional_color_name) or "button_state_normal",
			button_background = {
				uvs = {
					{
						0,
						math.min(size[2]/button_background_texture_settings.size[2], 1) - 1
					},
					{
						math.min(size[1]/button_background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = button_background_texture
			}
		},
		style = {
			button_background = {
				color = background_color,
				offset = {
					0,
					0,
					2
				},
				size = size
			},
			button_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2],
					3
				},
				size = {
					size[1],
					5
				},
				texture_tiling_size = {
					1,
					5
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 4,
					3
				},
				size = {
					size[1],
					5
				}
			},
			glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					5,
					3
				},
				size = {
					size[1],
					size[2] - 5
				}
			},
			hover_glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					5,
					2
				},
				size = {
					size[1],
					size[2] - 5
				}
			},
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					6
				},
				size = {
					size[1] - 10,
					5
				},
				texture_tiling_size = {
					1,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 12,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			button_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					5,
					4
				},
				size = size
			},
			button_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					5,
					4
				},
				size = size
			},
			button_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					3,
					3
				},
				size = size
			},
			button_clicked_rect = {
				color = {
					100,
					0,
					0,
					0
				},
				offset = {
					5,
					0,
					5
				},
				size = {
					size[1] - 10,
					size[2]
				}
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					5,
					0,
					5
				},
				size = {
					size[1] - 10,
					size[2]
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

local function talent_row(scenegraph_id, size, amount)
	local frame_settings = UIFrameSettings.menu_frame_09
	local glow_frame_name = "frame_outer_glow_01"
	local glow_frame_settings = UIFrameSettings[glow_frame_name]
	local glow_frame_width = glow_frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame_lock",
			texture_id = "frame"
		},
		{
			pass_type = "texture",
			style_id = "lock",
			texture_id = "lock"
		},
		{
			pass_type = "rect",
			style_id = "lock_rect"
		},
		{
			style_id = "level_text",
			pass_type = "text",
			text_id = "level_text"
		},
		{
			style_id = "level_text_shadow",
			pass_type = "text",
			text_id = "level_text"
		},
		{
			texture_id = "glow_frame",
			style_id = "glow_frame",
			pass_type = "texture_frame"
		}
	}
	local content = {
		level_text = "0",
		lock = "talent_lock_fg",
		amount = amount,
		frame = frame_settings.texture,
		glow_frame = glow_frame_settings.texture
	}
	local style = {
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			size = {
				size[1],
				size[2]
			},
			offset = {
				0,
				0,
				5
			}
		},
		frame_lock = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			size = {
				103,
				size[2]
			},
			offset = {
				0,
				0,
				3
			}
		},
		glow_frame = {
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				-2
			},
			size = size,
			texture_size = glow_frame_settings.texture_size,
			texture_sizes = glow_frame_settings.texture_sizes,
			frame_margins = {
				-(glow_frame_width - 1),
				-(glow_frame_width - 1)
			}
		},
		lock_rect = {
			color = {
				100,
				0,
				0,
				0
			},
			size = {
				100,
				size[2]
			},
			offset = {
				0,
				0,
				0
			}
		},
		lock = {
			color = {
				255,
				255,
				255,
				255
			},
			size = {
				97,
				97
			},
			offset = {
				3,
				2,
				1
			}
		},
		level_text = {
			word_wrap = true,
			font_size = 32,
			localize = false,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				97,
				97
			},
			offset = {
				3,
				-6,
				3
			}
		},
		level_text_shadow = {
			word_wrap = true,
			font_size = 32,
			localize = false,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				97,
				97
			},
			offset = {
				5,
				-8,
				2
			}
		}
	}
	local slot_width_spacing = 0
	local offset_layer = 0
	local button_size = {
		314,
		100
	}
	local icon_size = {
		80,
		80
	}
	local start_width_offset = size[1] - (button_size[1]*amount + slot_width_spacing*(amount - 1))

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		local offset = {
			start_width_offset,
			0,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = button_size,
			offset = offset
		}
		content[hotspot_name] = {}
		local hotspot_content = content[hotspot_name]
		local background_name = "background" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = background_name
		}
		style[background_name] = {
			size = button_size,
			color = {
				100,
				0,
				0,
				0
			},
			offset = {
				offset[1],
				offset[2],
				0
			}
		}
		local frame_name = "frame" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_frame",
			texture_id = frame_name,
			style_id = frame_name
		}
		style[frame_name] = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			size = button_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				4
			}
		}
		content[frame_name] = frame_settings.texture
		local selected_name = "selected" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = selected_name,
			style_id = selected_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.is_selected
			end
		}
		style[selected_name] = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				318,
				104
			},
			size = button_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				28
			}
		}
		content[selected_name] = "talent_selected"
		local title_text_name = "title_text" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return not hotspot.is_selected and not hotspot.disabled
			end
		}
		style[title_text_name] = {
			word_wrap = true,
			font_size = 28,
			localize = false,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				button_size[1] - 110,
				button_size[2]
			},
			offset = {
				offset[1] + 100,
				offset[2],
				3
			}
		}
		content[title_text_name] = "n/a"
		local title_text_selected_name = "title_text_selected" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_selected_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.is_selected and not hotspot.disabled
			end
		}
		style[title_text_selected_name] = {
			word_wrap = true,
			font_size = 28,
			localize = false,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			size = {
				button_size[1] - 110,
				button_size[2]
			},
			offset = {
				offset[1] + 100,
				offset[2],
				3
			}
		}
		local title_text_disabled_name = "title_text_disabled" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_disabled_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.disabled
			end
		}
		style[title_text_disabled_name] = {
			word_wrap = true,
			font_size = 28,
			localize = false,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = {
				255,
				50,
				50,
				50
			},
			size = {
				button_size[1] - 110,
				button_size[2]
			},
			offset = {
				offset[1] + 100,
				offset[2],
				3
			}
		}
		local title_text_shadow_name = "title_text_shadow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_shadow_name
		}
		style[title_text_shadow_name] = {
			word_wrap = true,
			font_size = 28,
			localize = false,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				button_size[1] - 110,
				button_size[2]
			},
			offset = {
				offset[1] + 100 + 2,
				offset[2] - 2,
				2
			}
		}
		local background_glow_name = "background_glow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = background_glow_name,
			style_id = background_glow_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.is_hover
			end
		}
		style[background_glow_name] = {
			size = button_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				3
			}
		}
		content[background_glow_name] = "talent_bg_glow_01"
		local glass_top_name = "glass_top" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = glass_top_name,
			style_id = glass_top_name
		}
		style[glass_top_name] = {
			size = {
				button_size[1],
				3
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				(offset[2] + button_size[2]) - 8,
				3
			}
		}
		content[glass_top_name] = "button_glass_01"
		local icon_name = "icon" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_name,
			style_id = icon_name
		}
		style[icon_name] = {
			saturated = true,
			size = icon_size,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1] + 10,
				(offset[2] + button_size[2]/2) - icon_size[2]/2 - 1,
				3
			}
		}
		content[icon_name] = "talent_damage_dwarf"
		local icon_rect_name = "icon_rect" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = icon_rect_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return not hotspot.disabled and not hotspot.is_selected
			end
		}
		style[icon_rect_name] = {
			size = icon_size,
			color = {
				100,
				0,
				0,
				0
			},
			offset = {
				offset[1] + 10,
				(offset[2] + button_size[2]/2) - icon_size[2]/2 - 1,
				4
			}
		}
		local icon_disabled_rect_name = "icon_disabled_rect" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = icon_disabled_rect_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.disabled
			end
		}
		style[icon_disabled_rect_name] = {
			size = icon_size,
			color = {
				200,
				0,
				0,
				0
			},
			offset = {
				offset[1] + 10,
				(offset[2] + button_size[2]/2) - icon_size[2]/2 - 1,
				4
			}
		}
		local icon_frame_name = "icon_frame" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_frame_name,
			style_id = icon_frame_name
		}
		style[icon_frame_name] = {
			size = icon_size,
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1] + 10,
				(offset[2] + button_size[2]/2) - icon_size[2]/2 - 1,
				5
			}
		}
		content[icon_frame_name] = "icon_talent_frame"
		local tooltip_name = "tooltip" .. name_suffix
		passes[#passes + 1] = {
			talent_id = "talent",
			pass_type = "talent_tooltip",
			content_id = hotspot_name,
			style_id = tooltip_name,
			content_check_function = function (content)
				return content.talent and content.is_hover
			end
		}
		style[tooltip_name] = {
			size = button_size,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 10
			}
		}
		content[tooltip_name] = nil
		start_width_offset = start_width_offset + button_size[1] + slot_width_spacing
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_window_divider(scenegraph_id, size, optional_texture_version)
	local texture_version = optional_texture_version or "09"
	local widget = {
		element = {
			passes = {
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_left = "menu_frame_" .. texture_version .. "_divider_left",
			edge_holder_right = "menu_frame_" .. texture_version .. "_divider_right",
			bottom_edge = "menu_frame_" .. texture_version .. "_divider"
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					6
				},
				size = {
					size[1] - 10,
					5
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					-6,
					10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 12,
					-6,
					10
				},
				size = {
					9,
					17
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

local function create_vertical_window_divider(scenegraph_id, size, optional_texture_version)
	local texture_version = optional_texture_version or "09"
	local widget = {
		element = {
			passes = {
				{
					texture_id = "edge",
					style_id = "edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_top",
					style_id = "edge_holder_top",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_bottom",
					style_id = "edge_holder_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_top = "menu_frame_" .. texture_version .. "_divider_top",
			edge_holder_bottom = "menu_frame_" .. texture_version .. "_divider_bottom",
			edge = "menu_frame_" .. texture_version .. "_divider_vertical"
		},
		style = {
			edge = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					6,
					6
				},
				size = {
					5,
					size[2] - 9
				},
				texture_tiling_size = {
					5,
					size[2] - 9
				}
			},
			edge_holder_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					size[2] - 7,
					10
				},
				size = {
					17,
					9
				}
			},
			edge_holder_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-6,
					3,
					10
				},
				size = {
					17,
					9
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
	talent_row_1 = talent_row("talent_row_1", scenegraph_definition.talent_row_1.size, 3, "green"),
	talent_row_2 = talent_row("talent_row_2", scenegraph_definition.talent_row_2.size, 3),
	talent_row_3 = talent_row("talent_row_3", scenegraph_definition.talent_row_3.size, 3),
	talent_row_4 = talent_row("talent_row_4", scenegraph_definition.talent_row_4.size, 3),
	talent_row_5 = talent_row("talent_row_5", scenegraph_definition.talent_row_5.size, 3),
	career_background = UIWidgets.create_background("window_frame", scenegraph_definition.window_frame.size, "talent_tree_bg_01"),
	career_window = UIWidgets.create_frame("window_frame", scenegraph_definition.window_frame.size, window_frame, 10),
	career_background_rect = UIWidgets.create_simple_rect("window_frame", {
		150,
		0,
		0,
		0
	}, 1),
	passive_title_text = UIWidgets.create_simple_text("n/a", "passive_title_text", nil, nil, sub_title_text_style),
	passive_type_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "passive_type_title", nil, nil, type_title_text_style),
	passive_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "passive_title_divider"),
	passive_description_text = UIWidgets.create_simple_text("n/a", "passive_description_text", nil, nil, description_text_style),
	passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "passive_icon"),
	passive_icon_frame = UIWidgets.create_simple_texture("talent_frame", "passive_icon_frame"),
	active_title_text = UIWidgets.create_simple_text("n/a", "active_title_text", nil, nil, sub_title_text_style),
	active_type_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "active_type_title", nil, nil, type_title_text_style),
	active_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "active_title_divider"),
	active_description_text = UIWidgets.create_simple_text("n/a", "active_description_text", nil, nil, description_text_style),
	active_icon = UIWidgets.create_simple_texture("icons_placeholder", "active_icon"),
	active_icon_frame = UIWidgets.create_simple_texture("talent_frame", "active_icon_frame")
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress

				return 
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

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress - 1

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	widgets = widgets,
	node_widgets = node_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
