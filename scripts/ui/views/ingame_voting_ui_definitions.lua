local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.ingame_voting
		},
		size = {
			1920,
			1080
		}
	},
	voting_box_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "right",
		position = {
			-450,
			0,
			0
		},
		size = {
			1,
			1
		}
	},
	info_box = {
		vertical_alignment = "bottom",
		parent = "voting_box_root",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			360,
			140
		}
	},
	bar_frame = {
		vertical_alignment = "bottom",
		parent = "info_box",
		horizontal_alignment = "center",
		position = {
			0,
			4,
			4
		},
		size = {
			260,
			6
		}
	},
	info_text = {
		vertical_alignment = "top",
		parent = "info_box",
		horizontal_alignment = "left",
		position = {
			15,
			14,
			1
		},
		size = {
			328,
			53
		}
	},
	option_box = {
		vertical_alignment = "bottom",
		parent = "info_box",
		horizontal_alignment = "left",
		position = {
			0,
			-84,
			0
		},
		size = {
			358,
			84
		}
	},
	option_yes = {
		vertical_alignment = "top",
		parent = "option_box",
		horizontal_alignment = "center",
		position = {
			0,
			32,
			4
		},
		size = {
			200,
			25
		}
	},
	option_no = {
		vertical_alignment = "top",
		parent = "option_box",
		horizontal_alignment = "center",
		position = {
			0,
			32,
			4
		},
		size = {
			200,
			25
		}
	},
	input_icon_pivot_yes = {
		vertical_alignment = "bottom",
		parent = "option_yes",
		horizontal_alignment = "center",
		position = {
			0,
			4,
			1
		},
		size = {
			0,
			0
		}
	},
	input_icon_pivot_no = {
		vertical_alignment = "bottom",
		parent = "option_no",
		horizontal_alignment = "center",
		position = {
			0,
			4,
			1
		},
		size = {
			0,
			0
		}
	}
}
local text_box_element = {
	passes = {
		{
			pass_type = "rect",
			style_id = "rect"
		},
		{
			pass_type = "border",
			style_id = "border"
		},
		{
			style_id = "text",
			pass_type = "text",
			text_id = "text"
		}
	}
}
local option_element = {
	passes = {
		{
			style_id = "bar",
			pass_type = "rect",
			content_check_function = function (content)
				return content.can_vote and not content.has_voted and content.input_icon
			end
		},
		{
			style_id = "bar_bg",
			pass_type = "rect",
			content_check_function = function (content)
				return content.can_vote and not content.has_voted and content.input_icon
			end
		},
		{
			style_id = "option_text",
			pass_type = "text",
			text_id = "option_text",
			content_check_function = function (content)
				return content.can_vote and not content.has_voted
			end
		},
		{
			style_id = "option_text_shadow",
			pass_type = "text",
			text_id = "option_text",
			content_check_function = function (content)
				return content.can_vote and not content.has_voted
			end
		},
		{
			style_id = "result_text",
			pass_type = "text",
			text_id = "result_text",
			content_check_function = function (content)
				return content.has_voted
			end
		},
		{
			style_id = "result_text_shadow",
			pass_type = "text",
			text_id = "result_text",
			content_check_function = function (content)
				return content.has_voted
			end
		},
		{
			style_id = "input_text",
			pass_type = "text",
			text_id = "input_text",
			content_check_function = function (content)
				return content.can_vote and not content.has_voted
			end
		},
		{
			style_id = "input_text_shadow",
			pass_type = "text",
			text_id = "input_text",
			content_check_function = function (content)
				return content.can_vote and not content.has_voted
			end
		},
		{
			pass_type = "texture",
			style_id = "input_icon",
			texture_id = "input_icon",
			content_check_function = function (content)
				return content.can_vote and not content.has_voted and content.input_icon
			end
		}
	}
}
local widget_definitions = {
	background = {
		scenegraph_id = "voting_box_root",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "top_divider",
					texture_id = "top_divider"
				},
				{
					pass_type = "texture",
					style_id = "bottom_divider",
					texture_id = "bottom_divider"
				},
				{
					pass_type = "texture",
					style_id = "input_glow",
					texture_id = "input_glow",
					content_check_function = function (content)
						return not content.can_vote and not content.has_voted
					end
				},
				{
					style_id = "input_text",
					pass_type = "text",
					text_id = "input_text",
					content_check_function = function (content)
						return not content.has_voted and not content.can_vote
					end
				},
				{
					style_id = "input_text_shadow",
					pass_type = "text",
					text_id = "input_text",
					content_check_function = function (content)
						return not content.has_voted and not content.can_vote
					end
				},
				{
					style_id = "time_text",
					pass_type = "text",
					text_id = "time_text"
				},
				{
					style_id = "time_text_shadow",
					pass_type = "text",
					text_id = "time_text"
				},
				{
					style_id = "info_text",
					pass_type = "text",
					text_id = "info_text"
				},
				{
					style_id = "info_text_shadow",
					pass_type = "text",
					text_id = "info_text"
				},
				{
					pass_type = "texture",
					style_id = "timer_bg",
					texture_id = "timer_bg"
				},
				{
					pass_type = "texture",
					style_id = "gamepad_input_icon",
					texture_id = "gamepad_input_icon",
					content_check_function = function (content)
						return content.gamepad_input_icon and content.is_gamepad_active and not content.has_voted
					end
				}
			}
		},
		content = {
			top_divider = "divider_01_top",
			bottom_divider = "divider_01_bottom",
			can_vote = false,
			input_text = "voting_open_description",
			has_voted = false,
			timer_bg = "tab_menu_bg_03",
			time_text = "",
			background = "info_window_background",
			input_glow = "mission_objective_glow_01",
			info_text = ""
		},
		style = {
			background = {
				scenegraph_id = "info_box",
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
			timer_bg = {
				vertical_alignment = "bottom",
				scenegraph_id = "info_box",
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-58,
					0
				},
				texture_size = {
					334,
					60
				}
			},
			bottom_divider = {
				vertical_alignment = "bottom",
				scenegraph_id = "info_box",
				horizontal_alignment = "center",
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
				},
				texture_size = {
					264,
					21
				}
			},
			top_divider = {
				vertical_alignment = "top",
				scenegraph_id = "info_box",
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					12,
					3
				},
				texture_size = {
					264,
					32
				}
			},
			input_glow = {
				vertical_alignment = "bottom",
				scenegraph_id = "info_box",
				horizontal_alignment = "center",
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
				texture_size = {
					264,
					24
				}
			},
			input_text = {
				vertical_alignment = "bottom",
				scenegraph_id = "info_box",
				localize = true,
				horizontal_alignment = "center",
				font_size = 32,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					5
				}
			},
			input_text_shadow = {
				vertical_alignment = "bottom",
				scenegraph_id = "info_box",
				localize = true,
				horizontal_alignment = "center",
				font_size = 32,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					4
				}
			},
			info_text = {
				scenegraph_id = "info_box",
				localize = false,
				word_wrap = true,
				font_size = 32,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("font_default", 255)
				},
				offset = {
					0,
					-14,
					3
				}
			},
			info_text_shadow = {
				font_size = 32,
				scenegraph_id = "info_box",
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-16,
					2
				}
			},
			time_text = {
				vertical_alignment = "bottom",
				scenegraph_id = "info_box",
				localize = false,
				horizontal_alignment = "center",
				font_size = 36,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-56,
					3
				}
			},
			time_text_shadow = {
				vertical_alignment = "bottom",
				scenegraph_id = "info_box",
				localize = false,
				horizontal_alignment = "center",
				font_size = 36,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-58,
					2
				}
			}
		}
	},
	option_yes = {
		scenegraph_id = "option_yes",
		element = option_element,
		content = {
			input_text = "",
			has_voted = false,
			can_vote = false,
			option_text = "",
			result_text = "0",
			gamepad_active = false,
			left_side = true
		},
		style = {
			bar = {
				default_width = 130,
				scenegraph_id = "bar_frame",
				size = {
					130,
					6
				},
				color = {
					255,
					0,
					255,
					0
				},
				offset = {
					0,
					0,
					2
				},
				default_offset = {
					0,
					0,
					2
				}
			},
			bar_bg = {
				default_width = 130,
				scenegraph_id = "bar_frame",
				size = {
					130,
					6
				},
				color = {
					255,
					0,
					100,
					0
				},
				offset = {
					0,
					0,
					1
				},
				default_offset = {
					0,
					0,
					1
				}
			},
			input_icon = {
				scenegraph_id = "input_icon_pivot_yes",
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
			option_text = {
				font_size = 24,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				vertical_alignment = "bottom",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("green", 255),
				offset = {
					0,
					0,
					1
				}
			},
			option_text_shadow = {
				vertical_alignment = "bottom",
				localize = false,
				font_size = 24,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					0
				}
			},
			result_text = {
				scenegraph_id = "bar_frame",
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				font_size = 36,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("green", 255),
				offset = {
					-40,
					16,
					1
				}
			},
			result_text_shadow = {
				font_size = 36,
				scenegraph_id = "bar_frame",
				localize = false,
				word_wrap = false,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-38,
					14,
					0
				}
			},
			input_text = {
				font_size = 24,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				pixel_perfect = true,
				vertical_alignment = "bottom",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					1
				}
			},
			input_text_shadow = {
				vertical_alignment = "bottom",
				localize = false,
				font_size = 24,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					0
				}
			}
		}
	},
	option_no = {
		scenegraph_id = "option_no",
		element = option_element,
		content = {
			input_text = "",
			has_voted = false,
			can_vote = false,
			option_text = "",
			result_text = "0",
			gamepad_active = false
		},
		style = {
			bar = {
				default_width = 130,
				scenegraph_id = "bar_frame",
				size = {
					130,
					6
				},
				color = {
					255,
					255,
					0,
					0
				},
				offset = {
					130,
					0,
					2
				},
				default_offset = {
					130,
					0,
					2
				}
			},
			bar_bg = {
				default_width = 130,
				scenegraph_id = "bar_frame",
				size = {
					130,
					6
				},
				color = {
					255,
					100,
					0,
					0
				},
				offset = {
					130,
					0,
					1
				},
				default_offset = {
					130,
					0,
					1
				}
			},
			input_icon = {
				scenegraph_id = "input_icon_pivot_no",
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
			option_text = {
				vertical_alignment = "bottom",
				localize = false,
				font_size = 24,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					0,
					1
				}
			},
			option_text_shadow = {
				vertical_alignment = "bottom",
				localize = false,
				font_size = 24,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					0
				}
			},
			result_text = {
				font_size = 36,
				scenegraph_id = "bar_frame",
				localize = false,
				word_wrap = false,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					40,
					16,
					1
				}
			},
			result_text_shadow = {
				font_size = 36,
				scenegraph_id = "bar_frame",
				localize = false,
				word_wrap = false,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					42,
					14,
					0
				}
			},
			input_text = {
				vertical_alignment = "bottom",
				localize = false,
				font_size = 24,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					1
				}
			},
			input_text_shadow = {
				vertical_alignment = "bottom",
				localize = false,
				font_size = 24,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					0
				}
			}
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
