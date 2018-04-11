local CHAT_WIDTH = 600
local CHAT_HEIGHT = 200

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
	[Irc.PARTY_MSG] = Colors.get_table("sky_blue")
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
			CHAT_HEIGHT - 4,
			2
		},
		size = {
			CHAT_WIDTH,
			4
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
			CHAT_WIDTH - 54,
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
			CHAT_WIDTH - 74,
			CHAT_HEIGHT - 26
		}
	},
	chat_input_root = {
		parent = "chat_window_root",
		position = {
			2,
			4,
			1
		},
		size = {
			CHAT_WIDTH - 61,
			24
		}
	},
	chat_input_text_ref = {
		parent = "chat_input_root",
		position = {
			0,
			0,
			2
		},
		size = {
			CHAT_WIDTH - 74,
			24
		}
	},
	chat_input_text = {
		parent = "chat_input_root",
		position = {
			0,
			0,
			2
		},
		size = {
			CHAT_WIDTH - 74,
			CHAT_HEIGHT - 26 - 176
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
	scenegraph_id = "chat_window_root",
	element = {
		passes = {
			{
				style_id = "frame_top",
				pass_type = "texture_uv",
				content_id = "frame_top"
			},
			{
				style_id = "frame_bottom",
				pass_type = "texture_uv",
				content_id = "frame_bottom"
			},
			{
				style_id = "background",
				pass_type = "texture_uv",
				content_id = "background"
			}
		}
	},
	content = {
		background = {
			texture_id = "infoslate_bg",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		},
		frame_top = {
			texture_id = "infoslate_frame_02_horizontal",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		},
		frame_bottom = {
			texture_id = "infoslate_frame_02_horizontal",
			uvs = {
				{
					0,
					0
				},
				{
					1,
					1
				}
			}
		}
	},
	style = {
		frame_top = {
			scenegraph_id = "chat_window_frame_top",
			masked = false,
			color = Colors.get_table("white")
		},
		frame_bottom = {
			scenegraph_id = "chat_window_frame_bottom",
			masked = false,
			color = Colors.get_table("white")
		},
		background = {
			scenegraph_id = "chat_window_background",
			masked = false,
			color = Colors.get_table("white")
		}
	}
}
local chat_input_widget = {
	scenegraph_id = "chat_input_root",
	element = {
		passes = {
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
		caret_index = 1,
		header_field = "All",
		channel_field = "Party",
		text_index = 1,
		text_field = ""
	},
	style = {
		background = {
			color = Colors.get_table("black"),
			size = {
				CHAT_WIDTH - 61,
				CHAT_HEIGHT - 26 - 176
			}
		},
		background_header = {
			scenegraph_id = "chat_window_frame_top",
			color = Colors.get_table("very_dark_gray"),
			size = {
				CHAT_WIDTH - 50,
				24
			}
		},
		background_header_front = {
			scenegraph_id = "chat_window_frame_top",
			color = Colors.get_table("black"),
			size = {
				CHAT_WIDTH - 52,
				22
			},
			offset = {
				1,
				1,
				1
			}
		},
		text = {
			font_size = 22,
			scenegraph_id = "chat_input_text",
			horizontal_scroll = true,
			pixel_perfect = false,
			vertical_alignment = "top",
			dynamic_font = true,
			font_type = "hell_shark_arial",
			text_color = Colors.get_table("white"),
			offset = {
				8,
				6,
				3
			},
			caret_size = {
				2,
				26
			},
			caret_offset = {
				-3,
				-4,
				4
			},
			caret_color = Colors.get_table("white")
		},
		channel_text = {
			vertical_alignment = "top",
			dynamic_font = true,
			font_size = 22,
			pixel_perfect = false,
			font_type = "hell_shark_arial",
			scenegraph_id = "chat_input_text",
			text_color = Colors.get_table("medium_purple"),
			offset = {
				8,
				6,
				3
			}
		},
		header_text = {
			horizontal_alignment = "left",
			scenegraph_id = "chat_window_frame_top",
			font_size = 18,
			pixel_perfect = false,
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark_arial",
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
			word_wrap = true,
			scenegraph_id = "chat_output_text",
			font_size = 20,
			pixel_perfect = false,
			vertical_alignment = "top",
			dynamic_font = true,
			font_type = "hell_shark_arial",
			text_color = Colors.get_table("white"),
			name_color = Colors.get_table("sky_blue"),
			name_color_dev = Colors.get_table("cheeseburger"),
			name_color_system = Colors.get_table("white"),
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

					return 
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
					local cursor = UIInverseScaleVectorToResolution(input_service.get(input_service, "cursor"))
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

					return 
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

return {
	CHAT_WIDTH = CHAT_WIDTH,
	CHAT_HEIGHT = CHAT_HEIGHT,
	scenegraph_definition = scenegraph_definition,
	chat_window_widget = chat_window_widget,
	chat_output_widget = chat_output_widget,
	chat_input_widget = chat_input_widget,
	chat_scrollbar_widget = chat_scrollbar_widget,
	chat_tab_widget = create_chat_button("chat_tab_root", scenegraph_definition.chat_tab_root.size)
}
