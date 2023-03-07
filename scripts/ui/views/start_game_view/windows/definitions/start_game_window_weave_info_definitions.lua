local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local default_window_size = window_default_settings.size
local large_window_size = window_default_settings.large_window_size
local window_frame_name = "menu_frame_11"
local window_frame = UIFrameSettings[window_frame_name]
local window_frame_width = window_frame.texture_sizes.vertical[1]
local window_size = {
	large_window_size[1] - (600 + window_frame_width * 2),
	large_window_size[2] - window_frame_width * 2
}
local window_text_width = window_size[1] - window_frame_width * 2
local mutator_window_width = window_size[1] - 20
local game_option_size = {
	window_size[1],
	194
}
local wheel_scale = 1.5
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
	parent_window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = large_window_size,
		position = {
			0,
			0,
			1
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "parent_window",
		horizontal_alignment = "right",
		size = window_size,
		position = {
			-window_frame_width,
			0,
			1
		}
	},
	top_panel = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1],
			84
		},
		position = {
			0,
			0,
			6
		}
	},
	title = {
		vertical_alignment = "bottom",
		parent = "top_panel",
		horizontal_alignment = "center",
		size = {
			window_text_width,
			50
		},
		position = {
			0,
			-75,
			6
		}
	},
	wind_title = {
		vertical_alignment = "bottom",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			window_text_width - 10,
			40
		},
		position = {
			0,
			-35,
			3
		}
	},
	level_title = {
		vertical_alignment = "bottom",
		parent = "wind_title",
		horizontal_alignment = "center",
		size = {
			window_text_width - 10,
			40
		},
		position = {
			0,
			-40,
			2
		}
	},
	wind_icon = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			200,
			200
		},
		position = {
			0,
			120,
			2
		}
	},
	wind_icon_bg_glow = {
		vertical_alignment = "center",
		parent = "wind_icon",
		horizontal_alignment = "center",
		size = {
			250,
			250
		},
		position = {
			0,
			0,
			-1
		}
	},
	mutator_window = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "left",
		size = {
			350,
			300
		},
		position = {
			130,
			140,
			8
		}
	},
	mutator_title_text = {
		vertical_alignment = "top",
		parent = "mutator_window",
		horizontal_alignment = "left",
		size = {
			350,
			50
		},
		position = {
			0,
			-5,
			1
		}
	},
	mutator_description_text = {
		vertical_alignment = "top",
		parent = "mutator_title_text",
		horizontal_alignment = "left",
		size = {
			350,
			255
		},
		position = {
			0,
			-40,
			1
		}
	},
	mutator_icon = {
		vertical_alignment = "top",
		parent = "mutator_description_text",
		horizontal_alignment = "left",
		size = {
			40,
			40
		},
		position = {
			-50,
			0,
			5
		}
	},
	objective_window = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			350,
			300
		},
		position = {
			-70,
			140,
			8
		}
	},
	objective_title_text = {
		vertical_alignment = "top",
		parent = "objective_window",
		horizontal_alignment = "left",
		size = {
			350,
			50
		},
		position = {
			0,
			-5,
			1
		}
	},
	objective_description_text = {
		vertical_alignment = "top",
		parent = "objective_title_text",
		horizontal_alignment = "left",
		size = {
			350,
			50
		},
		position = {
			0,
			-40,
			1
		}
	},
	objective = {
		vertical_alignment = "bottom",
		parent = "objective_description_text",
		horizontal_alignment = "center",
		size = {
			350,
			30
		},
		position = {
			0,
			-35,
			3
		}
	},
	play_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			400,
			72
		},
		position = {
			0,
			18,
			20
		}
	},
	play_button_console = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			game_option_size[2]
		},
		position = {
			0,
			-0,
			1
		}
	},
	private_checkbox = {
		vertical_alignment = "top",
		parent = "play_button",
		horizontal_alignment = "left",
		size = {
			400,
			40
		},
		position = {
			200,
			45,
			0
		}
	}
}
local title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = true,
	use_shadow = true,
	font_size = 42,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local score_text_style = {
	font_size = 36,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		10,
		0,
		2
	}
}
local objective_title_text_style = {
	font_size = 32,
	upper_case = false,
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
local objective_description_text_style = {
	font_size = 26,
	upper_case = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local rating_title_text_style = {
	font_size = 28,
	upper_case = true,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		-10,
		0,
		2
	}
}
local level_title_text_style = {
	font_size = 26,
	upper_case = false,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local wind_title_text_style = {
	font_size = 32,
	upper_case = false,
	localize = true,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local mutator_title_text_style = {
	font_size = 32,
	upper_case = false,
	localize = true,
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
local mutator_description_text_style = {
	font_size = 20,
	use_shadow = true,
	localize = true,
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

local function create_objective_widget(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture"
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture"
				},
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
			text = "-",
			title_text = "title_text",
			background = "chest_upgrade_fill_glow",
			icon = "trial_gem"
		},
		style = {
			background = {
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
			icon = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					49,
					44
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				default_offset = {
					-25,
					-2,
					1
				},
				offset = {
					0,
					0,
					1
				}
			},
			title_text = {
				word_wrap = true,
				localize = true,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				size = {
					size[1] - 50,
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					2
				}
			},
			title_text_shadow = {
				word_wrap = true,
				localize = true,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				size = {
					size[1] - 50,
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					1
				}
			},
			text = {
				word_wrap = true,
				font_size = 26,
				localize = true,
				dynamic_font_size_word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-30,
					2
				}
			},
			text_shadow = {
				word_wrap = true,
				font_size = 26,
				localize = true,
				dynamic_font_size_word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-32,
					1
				}
			}
		},
		offset = {
			50,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_checkbox_button(scenegraph_id, size, text, font_size, tooltip_info, disable_with_gamepad)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {}
	local style = {}
	local hotspot_name = "button_hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name
	}
	style[hotspot_name] = {
		size = size,
		offset = {
			0,
			0,
			0
		}
	}
	content.disable_with_gamepad = disable_with_gamepad
	content[hotspot_name] = {}
	local hotspot_content = content[hotspot_name]

	if tooltip_info then
		local tooltip_name = "additional_option_info"
		passes[#passes + 1] = {
			pass_type = "additional_option_tooltip",
			content_id = hotspot_name,
			style_id = tooltip_name,
			additional_option_id = tooltip_name,
			content_check_function = function (content)
				return content.is_hover
			end
		}
		style[tooltip_name] = {
			vertical_alignment = "top",
			max_width = 400,
			horizontal_alignment = "center",
			offset = {
				0,
				0,
				0
			}
		}
		hotspot_content[tooltip_name] = tooltip_info
	end

	local text_name = "text"
	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_name,
		content_check_function = function (content)
			return not content.disable_button
		end
	}
	local text_offset_x = 40
	style[text_name] = {
		word_wrap = true,
		font_size = 22,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		select_text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			text_offset_x,
			3,
			4
		},
		size = size
	}
	hotspot_content[text_name] = text
	local text_disabled_name = "text_disabled"
	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_disabled_name,
		content_check_function = function (content)
			return content.disable_button
		end
	}
	style[text_disabled_name] = {
		horizontal_alignment = "left",
		font_size = 22,
		word_wrap = true,
		vertical_alignment = "center",
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("gray", 255),
		default_text_color = Colors.get_color_table_with_alpha("gray", 255),
		offset = {
			text_offset_x,
			3,
			4
		},
		size = size
	}
	local text_shadow_name = "text_shadow"
	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_shadow_name
	}
	style[text_shadow_name] = {
		vertical_alignment = "center",
		font_size = 22,
		horizontal_alignment = "left",
		word_wrap = true,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			text_offset_x + 2,
			1,
			3
		},
		size = size
	}
	local checkbox_background_name = "checkbox_background"
	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = checkbox_background_name
	}
	local checkbox_size = {
		25,
		25
	}
	local checkbox_offset = {
		0,
		size[2] / 2 - checkbox_size[2] / 2 + 2,
		3
	}
	style[checkbox_background_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2]
		},
		offset = checkbox_offset,
		color = {
			255,
			0,
			0,
			0
		}
	}
	local checkbox_frame_name = "checkbox_frame"
	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = checkbox_frame_name,
		style_id = checkbox_frame_name,
		content_check_function = function (content)
			return not content.is_disabled
		end
	}
	local frame_settings = UIFrameSettings.menu_frame_06
	hotspot_content[checkbox_frame_name] = frame_settings.texture
	style[checkbox_frame_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2]
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset[1],
			checkbox_offset[2],
			checkbox_offset[3] + 1
		},
		color = {
			255,
			255,
			255,
			255
		}
	}
	local checkbox_frame_disabled_name = "checkbox_frame_disabled"
	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = checkbox_frame_name,
		style_id = checkbox_frame_disabled_name,
		content_check_function = function (content)
			return not content.is_disabled
		end
	}
	style[checkbox_frame_disabled_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2]
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset[1],
			checkbox_offset[2],
			checkbox_offset[3] + 1
		},
		color = {
			96,
			255,
			255,
			255
		}
	}
	local checkbox_marker_name = "checkbox_marker"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = checkbox_marker_name,
		style_id = checkbox_marker_name,
		content_check_function = function (content)
			return content.is_selected and not content.disable_button
		end
	}
	hotspot_content[checkbox_marker_name] = "matchmaking_checkbox"
	local marker_size = {
		22,
		16
	}
	local marker_offset = {
		checkbox_offset[1] + 4,
		checkbox_offset[2] + marker_size[2] / 2 - 1,
		checkbox_offset[3] + 2
	}
	style[checkbox_marker_name] = {
		size = marker_size,
		offset = marker_offset,
		color = Colors.get_color_table_with_alpha("white", 255)
	}
	local checkbox_marker_disabled_name = "checkbox_marker_disabled"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = checkbox_marker_name,
		style_id = checkbox_marker_disabled_name,
		content_check_function = function (content)
			return content.is_selected and content.disable_button
		end
	}
	style[checkbox_marker_disabled_name] = {
		size = marker_size,
		offset = marker_offset,
		color = Colors.get_color_table_with_alpha("gray", 255)
	}
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

local function create_player_widget(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.occupied
					end
				},
				{
					texture_id = "player_icon",
					style_id = "player_icon",
					pass_type = "texture",
					content_check_function = function (content)
						return content.occupied
					end
				},
				{
					style_id = "search_icon",
					pass_type = "rotated_texture",
					texture_id = "search_icon",
					content_check_function = function (content)
						return not content.occupied and content.searching
					end,
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0
						progress = (progress + dt) % 1
						local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * math.pi * 2
						style.angle = angle
						style.progress = progress
					end
				},
				{
					texture_id = "empty_icon",
					style_id = "empty_icon",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.occupied and not content.searching
					end
				}
			}
		},
		content = {
			searching = false,
			empty_icon = "friends_icon_profile",
			occupied = false,
			search_icon = "friends_icon_refresh",
			background = "small_unit_frame_portrait_default",
			player_icon = "small_unit_frame_portrait_default"
		},
		style = {
			background = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					0
				}
			},
			player_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2
				}
			},
			empty_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					32,
					32
				},
				color = {
					255,
					120,
					120,
					120
				},
				offset = {
					0,
					5,
					1
				}
			},
			search_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = 0,
				pivot = {
					16,
					16
				},
				texture_size = {
					32,
					32
				},
				color = {
					255,
					120,
					120,
					120
				},
				offset = {
					0,
					0,
					3
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

function create_tooltip_button(scenegraph_id, size, frame_name, background_texture, text, font_size, optional_color_name, optional_detail_texture, optional_detail_offset, disable_with_gamepad, find_party_tooltip_info, find_party_disabled_tooltip_info)
	background_texture = background_texture or "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = optional_detail_texture or "button_detail_01"
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
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "hover_hotspot"
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
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					texture_id = "glass",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass",
					style_id = "glass_bottom",
					pass_type = "texture"
				},
				{
					additional_option_id = "find_party_tooltip",
					style_id = "find_party_tooltip",
					pass_type = "additional_option_tooltip",
					content_id = "hover_hotspot",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return content.is_hover and not button_hotspot.disable_button and not Managers.matchmaking:is_game_matchmaking()
					end
				},
				{
					additional_option_id = "find_party_disabled_tooltip",
					style_id = "find_party_disabled_tooltip",
					pass_type = "additional_option_tooltip",
					content_id = "hover_hotspot",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return content.is_hover and button_hotspot.disable_button
					end
				}
			}
		},
		content = {
			hover_glow = "button_state_default",
			glass = "button_glass_02",
			background_fade = "button_bg_fade",
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
			button_hotspot = {},
			hover_hotspot = {
				find_party_disabled_tooltip = find_party_disabled_tooltip_info,
				find_party_tooltip = find_party_tooltip_info
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
					150,
					150,
					150
				},
				offset = {
					0,
					0,
					0
				}
			},
			background_fade = {
				color = {
					200,
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
					math.min(size[2] - 5, 80)
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
			title_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
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
					0,
					6
				}
			},
			title_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					20,
					0,
					6
				}
			},
			title_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					22,
					-2,
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
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					4
				},
				size = {
					size[1],
					11
				}
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 9,
					4
				},
				size = {
					size[1],
					11
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
					optional_detail_offset and -optional_detail_offset or -9,
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
					size[1] - side_detail_texture_size[1] + (optional_detail_offset or 9),
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			find_party_tooltip = {
				grow_downwards = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				max_width = 400,
				offset = {
					0,
					-14,
					0
				}
			},
			find_party_disabled_tooltip = {
				grow_downwards = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				max_width = 400,
				offset = {
					0,
					-14,
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
end

function create_play_button(scenegraph_id, size, text, font_size, disable_with_gamepad, tooltip_info)
	local button_color_name = nil
	local optional_color_name = "green"

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_08
	local side_detail_glow = "button_detail_05_glow"
	local side_detail_glow_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_glow)
	local side_detail_glow_size = side_detail_glow_settings.size

	return {
		element = {
			passes = {
				{
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "hover_hotspot"
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
					style_id = "clicked_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end
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
					texture_id = "side_detail_right",
					style_id = "side_detail_right",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "side_detail_left",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "side_detail_right",
					style_id = "side_detail_right_disabled",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "side_detail_left",
					style_id = "side_detail_left_disabled",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_glow_right",
					pass_type = "texture_uv",
					content_id = "side_detail_glow",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_glow_left",
					pass_type = "texture",
					content_id = "side_detail_glow",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end
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
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
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
					texture_id = "effect",
					style_id = "effect",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
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
					additional_option_id = "cancel_matchmaking_tooltip",
					style_id = "cancel_matchmaking_tooltip",
					pass_type = "additional_option_tooltip",
					content_id = "hover_hotspot",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return content.is_hover and button_hotspot.disable_button
					end
				}
			}
		},
		content = {
			side_detail_right = "button_detail_05_right",
			effect = "play_button_passive_glow",
			hover_glow = "button_state_hover_green",
			side_detail_left = "button_detail_05_left",
			glow = "button_state_normal_green",
			glass_top = "button_glass_01",
			side_detail_glow = {
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
				texture_id = side_detail_glow
			},
			button_hotspot = {},
			hover_hotspot = {
				cancel_matchmaking_tooltip = tooltip_info
			},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			disable_with_gamepad = disable_with_gamepad,
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
			}
		},
		style = {
			background = {
				color = background_color,
				offset = {
					0,
					0,
					0
				},
				size = {
					size[1],
					size[2]
				}
			},
			clicked_rect = {
				color = {
					100,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				},
				size = {
					size[1],
					size[2]
				}
			},
			disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					0,
					0,
					7
				},
				size = {
					size[1],
					size[2]
				}
			},
			title_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					9
				},
				size = {
					size[1],
					size[2]
				}
			},
			title_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					9
				},
				size = {
					size[1],
					size[2]
				}
			},
			title_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					8
				},
				size = {
					size[1],
					size[2]
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
				},
				size = {
					size[1],
					size[2]
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
					frame_settings.texture_sizes.horizontal[2],
					1
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2)
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
					size[2] - frame_settings.texture_sizes.horizontal[2] - 4,
					6
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
					frame_settings.texture_sizes.horizontal[2] - 1,
					3
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2)
				}
			},
			effect = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					5
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
					0,
					size[2] / 2 - 36,
					9
				},
				size = {
					88,
					72
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
					size[1] - 88,
					size[2] / 2 - 36,
					9
				},
				size = {
					88,
					72
				}
			},
			side_detail_left_disabled = {
				color = {
					255,
					200,
					200,
					200
				},
				offset = {
					0,
					size[2] / 2 - 36,
					9
				},
				size = {
					88,
					72
				}
			},
			side_detail_right_disabled = {
				color = {
					255,
					200,
					200,
					200
				},
				offset = {
					size[1] - 88,
					size[2] / 2 - 36,
					9
				},
				size = {
					88,
					72
				}
			},
			side_detail_glow_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] / 2 - side_detail_glow_size[2] / 2,
					10
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2]
				}
			},
			side_detail_glow_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - side_detail_glow_size[1],
					size[2] / 2 - side_detail_glow_size[2] / 2,
					10
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2]
				}
			},
			cancel_matchmaking_tooltip = {
				vertical_alignment = "top",
				max_width = 400,
				horizontal_alignment = "center",
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
end

function create_start_game_console_play_button(scenegraph_id, text)
	local passes = {}
	local content = {}
	local style = {}
	local text_name = "text"
	local text_name_shadow = text_name .. "_shadow"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_name,
		style_id = text_name,
		content_change_function = function (content, style)
			if content.locked then
				style.text_color = style.disabled_color
			else
				style.text_color = style.normal_color
			end
		end
	}
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_name,
		style_id = text_name_shadow
	}
	content[text_name] = text
	local text_offset = {
		0,
		6,
		1
	}
	local text_style = {
		word_wrap = false,
		upper_case = true,
		localize = false,
		font_size = 48,
		horizontal_alignment = "center",
		vertical_alignment = "center",
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		disabled_color = Colors.get_color_table_with_alpha("dark_gray", 255),
		normal_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			text_offset[1],
			text_offset[2],
			text_offset[3]
		}
	}
	local text_shadow_style = table.clone(text_style)
	text_shadow_style.text_color = {
		255,
		0,
		0,
		0
	}
	text_shadow_style.offset = {
		text_offset[1] + 2,
		text_offset[2] - 2,
		text_offset[3] - 1
	}
	style[text_name] = text_style
	style[text_name_shadow] = text_shadow_style
	local divider_name = "divider"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = divider_name,
		style_id = divider_name
	}
	content[divider_name] = "divider_01_top"
	style[divider_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		texture_size = {
			264,
			32
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			0,
			-36,
			1
		}
	}
	local input_texture_name = "input_texture"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = input_texture_name,
		style_id = input_texture_name,
		content_change_function = function (content, style)
			if content.locked then
				style.saturated = true
			else
				style.saturated = false
			end
		end
	}
	content[input_texture_name] = ""
	style[input_texture_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		texture_size = {
			64,
			64
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			0,
			-34,
			2
		}
	}
	local glow_name = "glow"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = glow_name,
		style_id = glow_name,
		content_check_function = function (content)
			return not content.locked
		end
	}
	content[glow_name] = "play_glow_mask"
	style[glow_name] = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		texture_size = {
			256,
			126
		},
		color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			0,
			33,
			-1
		}
	}
	local widget = {
		element = {
			passes = passes
		},
		content = content,
		style = style,
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

local disable_with_gamepad = true
local widgets = {
	difficulty_title = UIWidgets.create_simple_text("n/a", "difficulty_title", nil, nil, difficulty_title_text_style),
	difficulty_description = UIWidgets.create_simple_text("n/a", "difficulty_description", nil, nil, difficulty_description_text_style),
	difficulty_selected = UIWidgets.create_simple_texture("icons_placeholder", "difficulty_selected"),
	difficulty_selected_effect = UIWidgets.create_simple_texture("weave_difficulty_highlight_effect", "difficulty_selected_effect", nil, nil, {
		255,
		138,
		0,
		187
	}),
	play_button = create_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34, disable_with_gamepad, {
		title = Localize("start_game_weave_disabled_tooltip_title"),
		description = Localize("start_game_weave_disabled_tooltip_description")
	}, disable_with_gamepad),
	play_button_console = create_start_game_console_play_button("play_button_console", Localize("start_game_window_play"))
}
local bottom_hdr_widgets = {
	wind_icon = UIWidgets.create_simple_texture("weave_menu_wind_icon", "wind_icon")
}
local bottom_widgets = {}
local disable_with_gamepad = true
local top_widgets = {
	play_button = create_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34, disable_with_gamepad, {
		title = Localize("start_game_weave_disabled_tooltip_title"),
		description = Localize("start_game_weave_disabled_tooltip_description")
	}),
	play_button_console = create_start_game_console_play_button("play_button_console", Localize("start_game_window_play")),
	title = UIWidgets.create_simple_text("n/a", "title", nil, nil, title_text_style),
	mutator_icon = UIWidgets.create_simple_texture("icons_placeholder", "mutator_icon"),
	mutator_title_text = UIWidgets.create_simple_text("n/a", "mutator_title_text", nil, nil, mutator_title_text_style),
	mutator_description_text = UIWidgets.create_simple_text("n/a", "mutator_description_text", nil, nil, mutator_description_text_style),
	wind_title = UIWidgets.create_simple_text("n/a", "wind_title", nil, nil, wind_title_text_style),
	level_title = UIWidgets.create_simple_text("n/a", "level_title", nil, nil, level_title_text_style),
	private_checkbox = create_checkbox_button("private_checkbox", scenegraph_definition.private_checkbox.size, Localize("start_game_window_disallow_join"), 24, {
		title = Localize("start_game_window_disallow_join"),
		description = Localize("start_game_window_disallow_join_description")
	}),
	objective_title_text = UIWidgets.create_simple_text(Localize("weave_objective_title"), "objective_title_text", nil, nil, objective_title_text_style),
	objective_description_text = UIWidgets.create_simple_text(Localize("menu_weave_play_objective_sub_title"), "objective_description_text", nil, nil, objective_description_text_style)
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeInCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
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
	top_widgets = top_widgets,
	bottom_widgets = bottom_widgets,
	bottom_hdr_widgets = bottom_hdr_widgets,
	create_objective_widget = create_objective_widget,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
