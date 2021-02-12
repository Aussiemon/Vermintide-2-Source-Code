local CHAT_WIDTH = 500
local CHAT_HEIGHT = 200
local CHAT_INPUT_TEXT_WIDTH = CHAT_WIDTH - 10

if not rawget(_G, "Irc") then
	Irc = {
		PARTY_MSG = 7,
		META_MSG = 9,
		LIST_END_MSG = 8,
		PRIVATE_MSG = 0,
		LIST_MSG = 6,
		JOIN_MSG = 3,
		CHANNEL_MSG = 1,
		SYSTEM_MSG = 2,
		LEAVE_MSG = 4,
		NAMES_MSG = 5
	}
end

IRC_CHANNEL_COLORS = {
	[Irc.PRIVATE_MSG] = Colors.get_table("medium_purple"),
	[Irc.CHANNEL_MSG] = Colors.get_table("khaki"),
	[Irc.SYSTEM_MSG] = Colors.get_table("gold"),
	[Irc.PARTY_MSG] = Colors.get_table("khaki"),
	[Irc.TEAM_MSG] = Colors.get_table("khaki"),
	[Irc.ALL_MSG] = Colors.get_table("khaki")
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.chat
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
			UILayer.chat
		},
		size = {
			1920,
			1080
		}
	},
	chat_window_root = {
		parent = "root",
		position = {
			0,
			200,
			0
		},
		size = {
			1,
			1
		}
	},
	chat_window_background = {
		parent = "chat_window_root",
		position = {
			0,
			0,
			1
		},
		size = {
			CHAT_WIDTH,
			CHAT_HEIGHT
		}
	},
	chat_window_frame_top = {
		parent = "chat_window_root",
		position = {
			0,
			CHAT_HEIGHT,
			2
		},
		size = {
			CHAT_WIDTH,
			4
		}
	},
	chat_window_frame_top_info = {
		vertical_alignment = "bottom",
		parent = "chat_window_frame_top",
		horizontal_alignment = "right",
		size = {
			24,
			24
		}
	},
	chat_window_frame_top_enlarge = {
		vertical_alignment = "bottom",
		parent = "chat_window_frame_top",
		horizontal_alignment = "right",
		position = {
			-24,
			0,
			0
		},
		size = {
			24,
			24
		}
	},
	chat_window_frame_top_filter = {
		vertical_alignment = "bottom",
		parent = "chat_window_frame_top",
		horizontal_alignment = "right",
		position = {
			-48,
			0,
			0
		},
		size = {
			24,
			24
		}
	},
	chat_window_frame_bottom = {
		parent = "chat_window_root",
		position = {
			0,
			0,
			2
		},
		size = {
			CHAT_WIDTH,
			4
		}
	},
	chat_window_frame_top_target = {
		vertical_alignment = "bottom",
		parent = "chat_window_frame_top",
		horizontal_alignment = "right",
		position = {
			-72,
			0,
			0
		},
		size = {
			24,
			24
		}
	},
	chat_tab_root = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		position = {
			20,
			20,
			1
		},
		size = {
			60,
			60
		}
	},
	chat_scrollbar_root = {
		parent = "chat_window_root",
		position = {
			CHAT_WIDTH - 7,
			6,
			2
		},
		size = {
			1,
			1
		}
	},
	chat_scrollbar_background = {
		parent = "chat_scrollbar_root",
		position = {
			1,
			1,
			2
		},
		size = {
			2,
			CHAT_HEIGHT - 14
		}
	},
	chat_scrollbar_background_hotspot = {
		parent = "chat_scrollbar_root",
		position = {
			-10,
			0,
			2
		},
		size = {
			24,
			CHAT_HEIGHT - 14
		}
	},
	chat_background_stroke_top = {
		parent = "chat_scrollbar_root",
		position = {
			0,
			CHAT_HEIGHT - 13,
			2
		},
		size = {
			4,
			1
		}
	},
	chat_background_stroke_bottom = {
		parent = "chat_scrollbar_root",
		position = {
			0,
			0,
			2
		},
		size = {
			4,
			1
		}
	},
	chat_background_stroke_left = {
		parent = "chat_scrollbar_root",
		position = {
			0,
			1,
			2
		},
		size = {
			1,
			CHAT_HEIGHT - 14
		}
	},
	chat_background_stroke_right = {
		parent = "chat_scrollbar_root",
		position = {
			3,
			1,
			2
		},
		size = {
			1,
			CHAT_HEIGHT - 14
		}
	},
	chat_scrollbar = {
		parent = "chat_scrollbar_root",
		position = {
			1,
			1,
			3
		},
		size = {
			2,
			65
		}
	},
	chat_scrollbar_stroke_top = {
		parent = "chat_scrollbar",
		position = {
			0,
			65,
			3
		},
		size = {
			2,
			2
		}
	},
	chat_scrollbar_stroke_bottom = {
		parent = "chat_scrollbar",
		position = {
			0,
			-2,
			3
		},
		size = {
			2,
			2
		}
	},
	chat_output_root = {
		parent = "chat_window_root",
		position = {
			8,
			0,
			1
		},
		size = {
			1,
			1
		}
	},
	chat_output_text = {
		parent = "chat_output_root",
		position = {
			0,
			0,
			2
		},
		size = {
			CHAT_WIDTH - 15,
			CHAT_HEIGHT - 26
		}
	},
	chat_input_box = {
		vertical_alignment = "top",
		parent = "chat_window_background",
		horizontal_alignment = "left",
		position = {
			0,
			-CHAT_HEIGHT,
			5
		},
		size = {
			CHAT_WIDTH,
			20
		}
	},
	chat_input_text = {
		vertical_alignment = "center",
		parent = "chat_input_box",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			CHAT_WIDTH,
			20
		}
	},
	chat_mask = {
		parent = "root",
		position = {
			0,
			165,
			0
		},
		size = {
			CHAT_WIDTH,
			CHAT_HEIGHT
		}
	}
}
local chat_window_widget = {
	scenegraph_id = "chat_window_background",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "background"
			}
		}
	},
	content = {},
	style = {
		background = {
			masked = false,
			color = {
				180,
				20,
				20,
				20
			}
		}
	}
}
local chat_input_widget = {
	scenegraph_id = "chat_input_box",
	element = {
		passes = {
			{
				style_id = "info_hotspot",
				pass_type = "hotspot",
				content_id = "info_hotspot"
			},
			{
				style_id = "info_hotspot",
				pass_type = "rect",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end,
				content_change_function = function (content, style)
					style.color = (content.info_hotspot.is_hover and style.selected_color) or style.base_color
				end
			},
			{
				style_id = "info_icon",
				pass_type = "rect",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end
			},
			{
				style_id = "info_icon_text",
				pass_type = "text",
				text_id = "info_icon_text",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end,
				content_change_function = function (content, style)
					style.text_color = (content.info_hotspot.is_hover and style.selected_color) or style.base_color
				end
			},
			{
				style_id = "enlarge_hotspot",
				pass_type = "hotspot",
				content_id = "enlarge_hotspot"
			},
			{
				style_id = "enlarge_hotspot",
				pass_type = "rect",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end,
				content_change_function = function (content, style)
					style.color = (content.enlarge_hotspot.is_hover and style.selected_color) or style.base_color
				end
			},
			{
				style_id = "enlarge_icon",
				pass_type = "rect",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end
			},
			{
				style_id = "filter_hotspot",
				pass_type = "hotspot",
				content_id = "filter_hotspot"
			},
			{
				style_id = "filter_hotspot",
				pass_type = "rect",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end,
				content_change_function = function (content, style)
					style.color = (content.filter_hotspot.is_hover and style.selected_color) or style.base_color
				end
			},
			{
				style_id = "filter_icon",
				pass_type = "triangle",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end
			},
			{
				style_id = "target_hotspot",
				pass_type = "hotspot",
				content_id = "target_hotspot"
			},
			{
				style_id = "target_hotspot",
				pass_type = "rect",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end,
				content_change_function = function (content, style)
					style.color = (content.target_hotspot.is_hover and style.selected_color) or style.base_color
				end
			},
			{
				style_id = "target_icon",
				pass_type = "triangle",
				content_check_function = function (content)
					return GameSettingsDevelopment.use_global_chat
				end
			},
			{
				pass_type = "rect",
				style_id = "background"
			},
			{
				style_id = "background_header",
				pass_type = "rect",
				content_check_function = function (content, style)
					return GameSettingsDevelopment.use_global_chat
				end
			},
			{
				style_id = "background_header_front",
				pass_type = "rect",
				content_check_function = function (content, style)
					return GameSettingsDevelopment.use_global_chat
				end
			},
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			},
			{
				style_id = "channel_text",
				pass_type = "text",
				text_id = "channel_field"
			},
			{
				style_id = "header_text",
				pass_type = "text",
				text_id = "header_field",
				content_check_function = function (content, style)
					return GameSettingsDevelopment.use_global_chat
				end
			}
		}
	},
	content = {
		header_field = "All",
		channel_field = "Party",
		caret_index = 1,
		info_icon_text = "?",
		text_field = "",
		text_index = 1,
		info_hotspot = {},
		enlarge_hotspot = {},
		filter_hotspot = {},
		target_hotspot = {}
	},
	style = {
		background = {
			color = {
				200,
				0,
				0,
				0
			},
			offset = {
				0,
				0,
				1
			}
		},
		info_hotspot = {
			vertical_alignment = "center",
			scenegraph_id = "chat_window_frame_top_info",
			horizontal_alignment = "right",
			color = {
				255,
				255,
				255,
				255
			},
			base_color = {
				255,
				0,
				0,
				0
			},
			selected_color = {
				255,
				255,
				255,
				255
			},
			texture_size = {
				16,
				16
			},
			offset = {
				-4,
				0,
				2
			}
		},
		info_icon_text = {
			scenegraph_id = "chat_window_frame_top_info",
			font_size = 14,
			pixel_perfect = false,
			horizontal_alignment = "right",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "arial",
			text_color = Colors.get_table("white"),
			base_color = {
				255,
				90,
				90,
				90
			},
			selected_color = Colors.get_table("white"),
			offset = {
				-8,
				0,
				5
			}
		},
		info_icon = {
			vertical_alignment = "center",
			scenegraph_id = "chat_window_frame_top_info",
			horizontal_alignment = "right",
			color = {
				255,
				0,
				0,
				0
			},
			texture_size = {
				14,
				14
			},
			offset = {
				-5,
				0,
				5
			}
		},
		enlarge_hotspot = {
			vertical_alignment = "center",
			scenegraph_id = "chat_window_frame_top_enlarge",
			horizontal_alignment = "right",
			color = {
				255,
				255,
				255,
				255
			},
			base_color = {
				255,
				90,
				90,
				90
			},
			selected_color = {
				255,
				255,
				255,
				255
			},
			texture_size = {
				14,
				14
			},
			offset = {
				-4,
				0,
				2
			}
		},
		enlarge_icon = {
			vertical_alignment = "center",
			scenegraph_id = "chat_window_frame_top_enlarge",
			horizontal_alignment = "right",
			color = {
				255,
				0,
				0,
				0
			},
			texture_size = {
				12,
				12
			},
			offset = {
				-5,
				0,
				2
			}
		},
		filter_hotspot = {
			vertical_alignment = "center",
			scenegraph_id = "chat_window_frame_top_filter",
			horizontal_alignment = "right",
			color = {
				255,
				255,
				255,
				255
			},
			base_color = {
				255,
				90,
				90,
				90
			},
			selected_color = {
				255,
				255,
				255,
				255
			},
			texture_size = {
				14,
				14
			},
			offset = {
				-4,
				0,
				2
			}
		},
		filter_icon = {
			vertical_alignment = "center",
			scenegraph_id = "chat_window_frame_top_filter",
			horizontal_alignment = "right",
			triangle_alignment = "top_left",
			color = {
				255,
				0,
				0,
				0
			},
			texture_size = {
				12,
				12
			},
			offset = {
				-5,
				0,
				2
			}
		},
		target_hotspot = {
			vertical_alignment = "center",
			scenegraph_id = "chat_window_frame_top_target",
			horizontal_alignment = "right",
			color = {
				255,
				255,
				255,
				255
			},
			base_color = {
				255,
				90,
				90,
				90
			},
			selected_color = {
				255,
				255,
				255,
				255
			},
			texture_size = {
				14,
				14
			},
			offset = {
				-4,
				-0,
				2
			}
		},
		target_icon = {
			vertical_alignment = "center",
			scenegraph_id = "chat_window_frame_top_target",
			horizontal_alignment = "right",
			triangle_alignment = "top_right",
			color = {
				255,
				0,
				0,
				0
			},
			texture_size = {
				12,
				12
			},
			offset = {
				-5,
				-0,
				2
			}
		},
		background_header = {
			scenegraph_id = "chat_window_frame_top",
			color = Colors.get_table("very_dark_gray"),
			size = {
				CHAT_WIDTH,
				24
			}
		},
		background_header_front = {
			scenegraph_id = "chat_window_frame_top",
			color = Colors.get_table("black"),
			size = {
				CHAT_WIDTH - 2,
				22
			},
			offset = {
				1,
				1,
				1
			}
		},
		text = {
			scenegraph_id = "chat_input_text",
			font_size = 22,
			horizontal_scroll = true,
			pixel_perfect = false,
			dynamic_font = true,
			font_type = "arial",
			text_color = Colors.get_table("white"),
			offset = {
				10,
				0,
				3
			},
			caret_size = {
				2,
				26
			},
			caret_offset = {
				0,
				-6,
				4
			},
			caret_color = Colors.get_table("white")
		},
		channel_text = {
			horizontal_alignment = "left",
			scenegraph_id = "chat_input_text",
			font_size = 22,
			pixel_perfect = false,
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "arial",
			text_color = Colors.get_table("medium_purple"),
			offset = {
				6,
				0,
				3
			}
		},
		header_text = {
			font_size = 18,
			dynamic_font = true,
			scenegraph_id = "chat_window_frame_top",
			pixel_perfect = false,
			font_type = "arial",
			text_color = Colors.get_table("white"),
			offset = {
				8,
				-2,
				3
			}
		}
	}
}
local chat_output_widget = {
	scenegraph_id = "chat_output_root",
	element = UIElements.TextAreaChat,
	content = {
		text_start_offset = 0,
		message_tables = {}
	},
	style = {
		background = {
			corner_radius = 0,
			color = Colors.get_table("black")
		},
		text = {
			font_size = 20,
			scenegraph_id = "chat_output_text",
			pixel_perfect = false,
			vertical_alignment = "top",
			dynamic_font = true,
			word_wrap = true,
			font_type = "chat_output_font",
			text_color = Colors.get_table("white"),
			default_color = Colors.get_table("white"),
			name_color = Colors.get_table("sky_blue"),
			name_color_dev = Colors.get_table("cheeseburger"),
			name_color_system = Colors.get_table("gold"),
			offset = {
				0,
				0,
				3
			}
		}
	}
}
local chat_scrollbar_widget = {
	scenegraph_id = "chat_scrollbar_root",
	element = {
		passes = {
			{
				pass_type = "rect",
				style_id = "background",
				texture_id = "background_rect"
			},
			{
				pass_type = "rect",
				style_id = "background_stroke_top",
				texture_id = "background_stroke_top_rect"
			},
			{
				pass_type = "rect",
				style_id = "background_stroke_bottom",
				texture_id = "background_stroke_bottom_rect"
			},
			{
				pass_type = "rect",
				style_id = "background_stroke_left",
				texture_id = "background_stroke_left_rect"
			},
			{
				pass_type = "rect",
				style_id = "background_stroke_right",
				texture_id = "background_stroke_right_rect"
			},
			{
				style_id = "scrollbar",
				pass_type = "local_offset",
				offset_function = function (ui_scenegraph, ui_style, ui_content)
					local local_position = UISceneGraph.get_local_position(ui_scenegraph, ui_style.scenegraph_id)
					local bar_height = ui_content.scroll_bar_height
					local half_bar_height = bar_height / 2
					local min = ui_content.scroll_offset_min
					local max = ui_content.scroll_offset_max
					local y_pos = math.min(min + (max - min) * ui_content.internal_scroll_value, max - bar_height)
					local_position[2] = y_pos
					ui_content.scroll_value = (y_pos - min) / (max - bar_height - min)
				end
			},
			{
				pass_type = "rect",
				style_id = "scrollbar",
				texture_id = "scrollbar_rect"
			},
			{
				pass_type = "rect",
				style_id = "scrollbar_stroke_top",
				texture_id = "scrollbar_stroke_top_rect"
			},
			{
				pass_type = "rect",
				style_id = "scrollbar_stroke_bottom",
				texture_id = "scrollbar_stroke_bottom_rect"
			},
			{
				pass_type = "hover",
				style_id = "background_hotspot"
			},
			{
				style_id = "background_hotspot",
				pass_type = "held",
				held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
					local cursor = UIInverseScaleVectorToResolution(input_service:get("cursor"))
					local scenegraph_id = ui_style.scenegraph_id
					local world_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)
					local bar_height = ui_content.scroll_bar_height
					local half_bar_size = bar_height / 2
					local start_delta_cursor = half_bar_size
					local y_pos = cursor[2] - start_delta_cursor
					local size = UISceneGraph.get_size(ui_scenegraph, scenegraph_id)
					local current_offset_from_bottom = y_pos - world_position[2]
					local current_offset_center_bar = current_offset_from_bottom
					local min_world_pos = world_position[2] + half_bar_size
					local scroll_offset_max = ui_content.scroll_offset_max
					local max_world_pos = (world_position[2] + scroll_offset_max) - half_bar_size - ui_content.scroll_offset_min
					local current_position = math.clamp(current_offset_center_bar, 0, size[2])
					local delta_value = math.min(current_position / size[2], 1)
					ui_content.internal_scroll_value = delta_value
				end
			}
		}
	},
	content = {
		scroll_bar_height = 65,
		scroll_offset_min = 2,
		internal_scroll_value = 0,
		scroll_value = 0,
		scroll_offset_max = CHAT_HEIGHT - 14
	},
	style = {
		background_hotspot = {
			scenegraph_id = "chat_scrollbar_background_hotspot",
			color = {
				0,
				0,
				0,
				0
			}
		},
		background = {
			scenegraph_id = "chat_scrollbar_background",
			color = Colors.get_table("gray")
		},
		scrollbar = {
			scenegraph_id = "chat_scrollbar",
			color = Colors.get_table("light_gray")
		},
		background_stroke_top = {
			scenegraph_id = "chat_background_stroke_top",
			color = Colors.get_table("black")
		},
		background_stroke_bottom = {
			scenegraph_id = "chat_background_stroke_bottom",
			color = Colors.get_table("black")
		},
		background_stroke_left = {
			scenegraph_id = "chat_background_stroke_left",
			color = Colors.get_table("black")
		},
		background_stroke_right = {
			scenegraph_id = "chat_background_stroke_right",
			color = Colors.get_table("black")
		},
		scrollbar_stroke_top = {
			scenegraph_id = "chat_scrollbar_stroke_top",
			color = Colors.get_table("black")
		},
		scrollbar_stroke_bottom = {
			scenegraph_id = "chat_scrollbar_stroke_bottom",
			color = Colors.get_table("black")
		}
	}
}

local function create_chat_button(scenegraph_id, size)
	local frame_settings = UIFrameSettings.menu_frame_12
	local element = {
		passes = {
			{
				style_id = "button",
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "rect",
				style_id = "button"
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame"
			},
			{
				pass_type = "texture",
				style_id = "icon",
				texture_id = "icon",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				style_id = "icon_hover",
				texture_id = "icon",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				style_id = "hover",
				texture_id = "hover",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				style_id = "button_notification",
				texture_id = "button_notification"
			}
		}
	}
	local content = {
		button_notification = "chat_icon_glow",
		hover = "button_state_default_2",
		icon = "chat_icon_01",
		button_hotspot = {},
		frame = frame_settings.texture
	}
	local style = {
		button = {
			color = Colors.get_color_table_with_alpha("black", 200),
			offset = {
				0,
				0,
				0
			}
		},
		icon = {
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				4
			}
		},
		icon_hover = {
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				4
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
				3
			}
		},
		hover = {
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
		},
		button_notification = {
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
	}
	local widget = {
		element = element,
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

function create_additional_chat_tooltip(scenegraph_id, size, content_passes, tooltip_data, max_width, horizontal_alignment, vertical_alignment, grow_downwards, offset)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "tooltip",
					additional_option_id = "tooltip",
					pass_type = "additional_option_tooltip",
					content_passes = content_passes or {
						"additional_option_info"
					},
					content_check_function = function (content)
						return content.tooltip and content.button_hotspot.is_hover and GameSettingsDevelopment.use_global_chat
					end
				}
			}
		},
		content = {
			tooltip = tooltip_data or nil,
			button_hotspot = {
				allow_multi_hover = true
			}
		},
		style = {
			tooltip = {
				grow_downwards = grow_downwards,
				max_width = max_width or 300,
				horizontal_alignment = horizontal_alignment or "center",
				vertical_alignment = vertical_alignment or "bottom",
				offset = offset or {
					0,
					0,
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

local widgets = {
	chat_target_tooltip = create_additional_chat_tooltip("chat_window_frame_top_target", scenegraph_definition.chat_window_frame_top_filter.size, nil, {
		title = Localize("chat_menu_tooltip_target_title"),
		description = Localize("menu_chat_tooltip_target_description")
	}, nil, nil, "top", nil),
	chat_filter_tooltip = create_additional_chat_tooltip("chat_window_frame_top_filter", scenegraph_definition.chat_window_frame_top_filter.size, nil, {
		title = Localize("chat_menu_tooltip_filter_title"),
		description = Localize("menu_chat_tooltip_filter_description")
	}, nil, nil, "top", nil),
	chat_enlarge_tooltip = create_additional_chat_tooltip("chat_window_frame_top_enlarge", scenegraph_definition.chat_window_frame_top_enlarge.size, nil, {
		title = Localize("chat_menu_tooltip_enlarge_title"),
		description = Localize("menu_chat_tooltip_enlarge_description")
	}, nil, nil, "top", nil),
	chat_info_tooltip = create_additional_chat_tooltip("chat_window_frame_top_info", scenegraph_definition.chat_window_frame_top_info.size, nil, {
		title = Localize("chat_menu_tooltip_info_title"),
		description = Localize("menu_chat_tooltip_info_description")
	}, nil, nil, "top", nil)
}

return {
	CHAT_WIDTH = CHAT_WIDTH,
	CHAT_HEIGHT = CHAT_HEIGHT,
	CHAT_INPUT_TEXT_WIDTH = CHAT_INPUT_TEXT_WIDTH,
	scenegraph_definition = scenegraph_definition,
	chat_window_widget = chat_window_widget,
	chat_output_widget = chat_output_widget,
	chat_input_widget = chat_input_widget,
	chat_scrollbar_widget = chat_scrollbar_widget,
	chat_tab_widget = create_chat_button("chat_tab_root", scenegraph_definition.chat_tab_root.size),
	widgets = widgets
}
