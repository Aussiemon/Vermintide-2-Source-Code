local career_window_size = {
	1215,
	820
}
local career_info_size = {
	450,
	170
}
local talent_button_size = {
	364,
	80
}
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	info_window = {
		vertical_alignment = "top",
		parent = "area_right",
		horizontal_alignment = "right",
		size = {
			career_info_size[1] + 20,
			680
		},
		position = {
			0,
			-20,
			1
		}
	},
	scrollbar_anchor = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			career_info_size[1] + 20,
			680
		},
		position = {
			0,
			0,
			1
		}
	},
	scrollbar_window = {
		parent = "scrollbar_anchor"
	},
	passive_window = {
		vertical_alignment = "top",
		parent = "scrollbar_window",
		horizontal_alignment = "center",
		size = career_info_size,
		position = {
			0,
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
			10,
			-50,
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
			career_info_size[1] * 0.6,
			50
		},
		position = {
			10,
			-5,
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
			10,
			1
		}
	},
	passive_type_title = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "right",
		size = {
			career_info_size[1] * 0.3,
			50
		},
		position = {
			-10,
			-5,
			1
		}
	},
	passive_description_text = {
		vertical_alignment = "top",
		parent = "passive_icon",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 40
		},
		position = {
			90,
			0,
			1
		}
	},
	active_window = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "left",
		size = career_info_size,
		position = {
			0,
			-career_info_size[2],
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
			10,
			-50,
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
			career_info_size[1] * 0.6,
			50
		},
		position = {
			10,
			-5,
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
			10,
			1
		}
	},
	active_type_title = {
		vertical_alignment = "top",
		parent = "active_window",
		horizontal_alignment = "right",
		size = {
			career_info_size[1] * 0.3,
			50
		},
		position = {
			-10,
			-5,
			1
		}
	},
	active_description_text = {
		vertical_alignment = "top",
		parent = "active_icon",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 40
		},
		position = {
			90,
			0,
			1
		}
	},
	perk_title_text = {
		vertical_alignment = "bottom",
		parent = "active_window",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] * 0.6,
			50
		},
		position = {
			10,
			-50,
			1
		}
	},
	perk_title_divider = {
		vertical_alignment = "bottom",
		parent = "perk_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			10,
			1
		}
	},
	career_perk_1 = {
		vertical_alignment = "bottom",
		parent = "perk_title_divider",
		horizontal_alignment = "left",
		size = {
			420,
			1
		},
		position = {
			10,
			-30,
			1
		}
	},
	career_perk_2 = {
		vertical_alignment = "center",
		parent = "career_perk_1",
		horizontal_alignment = "left",
		size = {
			420,
			1
		},
		position = {
			0,
			0,
			1
		}
	},
	career_perk_3 = {
		vertical_alignment = "center",
		parent = "career_perk_2",
		horizontal_alignment = "left",
		size = {
			420,
			1
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
		horizontal_alignment = "left",
		size = {
			career_window_size[1] - 20,
			80
		},
		position = {
			0,
			90,
			0
		}
	},
	talent_row_2 = {
		vertical_alignment = "bottom",
		parent = "talent_row_3",
		horizontal_alignment = "left",
		size = {
			career_window_size[1] - 20,
			80
		},
		position = {
			0,
			90,
			0
		}
	},
	talent_row_3 = {
		vertical_alignment = "bottom",
		parent = "talent_row_4",
		horizontal_alignment = "left",
		size = {
			career_window_size[1] - 20,
			80
		},
		position = {
			0,
			90,
			0
		}
	},
	talent_row_4 = {
		vertical_alignment = "bottom",
		parent = "talent_row_5",
		horizontal_alignment = "left",
		size = {
			career_window_size[1] - 20,
			80
		},
		position = {
			0,
			90,
			0
		}
	},
	talent_row_5 = {
		vertical_alignment = "bottom",
		parent = "talent_row_6",
		horizontal_alignment = "left",
		size = {
			career_window_size[1] - 20,
			80
		},
		position = {
			0,
			90,
			0
		}
	},
	talent_row_6 = {
		vertical_alignment = "bottom",
		parent = "area_left",
		horizontal_alignment = "left",
		size = {
			career_window_size[1] - 20,
			80
		},
		position = {
			0,
			10,
			5
		}
	},
	tooltip_area = {
		vertical_alignment = "top",
		parent = "area_left",
		horizontal_alignment = "left",
		size = {
			career_window_size[1] - 20,
			240
		},
		position = {
			0,
			-20,
			1
		}
	},
	tooltip_title = {
		vertical_alignment = "top",
		parent = "tooltip_area",
		horizontal_alignment = "center",
		size = {
			career_window_size[1] - 40,
			40
		},
		position = {
			0,
			-10,
			1
		}
	},
	tooltip_description = {
		vertical_alignment = "top",
		parent = "tooltip_area",
		horizontal_alignment = "center",
		size = {
			career_window_size[1] - 40,
			40
		},
		position = {
			0,
			-60,
			1
		}
	},
	tooltip_info = {
		vertical_alignment = "bottom",
		parent = "tooltip_area",
		horizontal_alignment = "center",
		size = {
			career_window_size[1] - 40,
			40
		},
		position = {
			0,
			0,
			1
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
	font_size = 18,
	use_shadow = true,
	localize = false,
	dynamic_font_size_word_wrap = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_masked",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local tooltip_text_style = {
	word_wrap = true,
	font_size = 24,
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
local tooltip_info_text_style = {
	word_wrap = true,
	font_size = 24,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2
	}
}
local type_title_text_style = {
	word_wrap = true,
	use_shadow = true,
	localize = false,
	font_size = 18,
	horizontal_alignment = "right",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_masked",
	text_color = Colors.get_color_table_with_alpha("gray", 200),
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
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local sub_perk_title_text_style = {
	font_size = 32,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header_masked",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}

local function talent_row(scenegraph_id, size, button_size, amount)
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
				size[2]
			},
			offset = {
				3,
				2,
				1
			}
		},
		level_text = {
			word_wrap = true,
			font_size = 26,
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
				-12,
				3
			}
		},
		level_text_shadow = {
			word_wrap = true,
			font_size = 26,
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
				-14,
				2
			}
		}
	}
	local slot_width_spacing = 0
	local offset_layer = 0
	local icon_size = {
		80,
		80
	}
	local start_width_offset = size[1] - (button_size[1] * amount + slot_width_spacing * (amount - 1))

	for k = 1, amount do
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
				IS_WINDOWS and 165 or 100,
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
				7
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
			texture_size = button_size,
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
			font_size = 24,
			localize = false,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				button_size[1] - 100,
				button_size[2]
			},
			offset = {
				offset[1] + 90,
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
			font_size = 24,
			localize = false,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			size = {
				button_size[1] - 100,
				button_size[2]
			},
			offset = {
				offset[1] + 90,
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
			font_size = 24,
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
				button_size[1] - 100,
				button_size[2]
			},
			offset = {
				offset[1] + 90,
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
			font_size = 24,
			localize = false,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				button_size[1] - 100,
				button_size[2]
			},
			offset = {
				offset[1] + 90 + 2,
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

				return hotspot.is_hover or hotspot.focused
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
				offset[2] + button_size[2] - 8,
				5
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
				offset[1],
				offset[2] + button_size[2] / 2 - icon_size[2] / 2,
				3
			}
		}
		content[icon_name] = "icons_placeholder"
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
				offset[1],
				offset[2] + button_size[2] / 2 - icon_size[2] / 2,
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
				offset[1],
				offset[2] + button_size[2] / 2 - icon_size[2] / 2,
				4
			}
		}
		local icon_divider_name = "icon_divider" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_divider_name,
			style_id = icon_divider_name
		}
		style[icon_divider_name] = {
			size = {
				5,
				icon_size[2] - 2
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1] + icon_size[1] - 5,
				offset[2] + button_size[2] / 2 - icon_size[2] / 2 + 1,
				6
			}
		}
		content[icon_divider_name] = "menu_frame_09_divider_vertical"
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

local function create_career_perk_text(scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					style_id = "description_text_shadow",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				}
			}
		},
		content = {
			icon = "tooltip_marker",
			title_text = "n/a",
			description_text = "n/a"
		},
		style = {
			icon = {
				vertical_alignment = "bottom",
				masked = true,
				horizontal_alignment = "left",
				texture_size = {
					13,
					13
				},
				offset = {
					0,
					6,
					2
				}
			},
			title_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_masked",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					20,
					-5,
					2
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_masked",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					22,
					-7,
					0
				}
			},
			description_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_masked",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					0,
					2
				}
			},
			description_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_masked",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					22,
					-2,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local test_box_text_style = {
	font_size = 32,
	use_shadow = true,
	localize = false,
	dynamic_font_size_word_wrap = true,
	word_wrap = true,
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
local widgets = {
	tooltip_area = UIWidgets.create_rect_with_outer_frame("tooltip_area", scenegraph_definition.tooltip_area.size, "frame_outer_fade_02", 0, UISettings.console_menu_rect_color),
	tooltip_title = UIWidgets.create_simple_text("n/a", "tooltip_title", nil, nil, sub_title_text_style),
	tooltip_description = UIWidgets.create_simple_text("n/a", "tooltip_description", nil, nil, tooltip_text_style),
	tooltip_info = UIWidgets.create_simple_text("n/a", "tooltip_info", nil, nil, tooltip_info_text_style),
	talent_row_1 = talent_row("talent_row_1", scenegraph_definition.talent_row_1.size, talent_button_size, 3),
	talent_row_2 = talent_row("talent_row_2", scenegraph_definition.talent_row_2.size, talent_button_size, 3),
	talent_row_3 = talent_row("talent_row_3", scenegraph_definition.talent_row_3.size, talent_button_size, 3),
	talent_row_4 = talent_row("talent_row_4", scenegraph_definition.talent_row_4.size, talent_button_size, 3),
	talent_row_5 = talent_row("talent_row_5", scenegraph_definition.talent_row_5.size, talent_button_size, 3),
	talent_row_6 = talent_row("talent_row_6", scenegraph_definition.talent_row_6.size, talent_button_size, 3),
	info_window_background = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, "frame_outer_fade_02", 0, UISettings.console_menu_rect_color),
	mask = UIWidgets.create_simple_texture("mask_rect", "scrollbar_anchor"),
	perk_title_text = UIWidgets.create_simple_text(Localize("hero_view_perk_title"), "perk_title_text", nil, nil, sub_perk_title_text_style),
	perk_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "perk_title_divider", true),
	career_perk_1 = create_career_perk_text("career_perk_1"),
	career_perk_2 = create_career_perk_text("career_perk_2"),
	career_perk_3 = create_career_perk_text("career_perk_3"),
	passive_title_text = UIWidgets.create_simple_text("n/a", "passive_title_text", nil, nil, sub_perk_title_text_style),
	passive_type_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "passive_type_title", nil, nil, type_title_text_style),
	passive_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "passive_title_divider", true),
	passive_description_text = UIWidgets.create_simple_text("n/a", "passive_description_text", nil, nil, description_text_style),
	passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "passive_icon", true),
	passive_icon_frame = UIWidgets.create_simple_texture("talent_frame", "passive_icon_frame", true),
	active_title_text = UIWidgets.create_simple_text("n/a", "active_title_text", nil, nil, sub_perk_title_text_style),
	active_type_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "active_type_title", nil, nil, type_title_text_style),
	active_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "active_title_divider", true),
	active_description_text = UIWidgets.create_simple_text("n/a", "active_description_text", nil, nil, description_text_style),
	active_icon = UIWidgets.create_simple_texture("icons_placeholder", "active_icon", true),
	active_icon_frame = UIWidgets.create_simple_texture("talent_frame", "active_icon_frame", true)
}
local generic_input_actions = {
	default = {
		{
			input_action = "d_pad",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "show_gamercard",
			priority = 2,
			description_text = "start_menu_switch_hero"
		},
		{
			input_action = "confirm",
			priority = 3,
			description_text = "input_description_select"
		},
		{
			input_action = "refresh",
			priority = 4,
			description_text = "input_description_remove"
		},
		{
			input_action = "back",
			priority = 5,
			description_text = "input_description_close"
		}
	}
}
local animation_definitions = {
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
				params.render_settings.alpha_multiplier = anim_progress
				ui_scenegraph.area_left.local_position[1] = scenegraph_definition.area_left.position[1] + -100 * (1 - anim_progress)
				ui_scenegraph.area_right.local_position[1] = scenegraph_definition.area_right.position[1] + -100 * (1 - anim_progress)
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
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions
}
