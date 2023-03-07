local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local game_option_size = {
	window_size[1] - 20,
	30
}
local animation_definitions = {}
animation_definitions.on_enter = {
	{
		name = "fade_in",
		start_progress = 0,
		end_progress = 0.2,
		init = function (ui_scenegraph, scenegraph_definition, widgets, params)
			params.render_settings.alpha_multiplier = 0
		end,
		update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
			local anim_progress = math.easeOutCubic(progress)
			params.render_settings.alpha_multiplier = anim_progress
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
			return
		end
	}
}
animation_definitions.on_exit = {
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
		horizontal_alignment = "left",
		size = window_size,
		position = {
			860,
			0,
			1
		}
	},
	additional_option = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			260
		},
		position = {
			0,
			0,
			0
		}
	},
	title_text = {
		vertical_alignment = "top",
		parent = "additional_option",
		horizontal_alignment = "left",
		size = {
			game_option_size[1],
			50
		},
		position = {
			0,
			0,
			1
		}
	},
	title_divider = {
		vertical_alignment = "bottom",
		parent = "title_text",
		horizontal_alignment = "left",
		size = {
			game_option_size[1],
			5
		},
		position = {
			10,
			2,
			0
		}
	},
	play_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			game_option_size[1],
			72
		},
		position = {
			0,
			18,
			20
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
	private_button = {
		vertical_alignment = "top",
		parent = "additional_option",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			game_option_size[2]
		},
		position = {
			0,
			-(game_option_size[2] + 5) * 3 - 25,
			10
		}
	},
	private_button_frame = {
		vertical_alignment = "bottom",
		parent = "private_button",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			game_option_size[2] + 5
		},
		position = {
			0,
			0,
			10
		}
	},
	host_button = {
		vertical_alignment = "top",
		parent = "private_button",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			game_option_size[2]
		},
		position = {
			0,
			game_option_size[2] + 5,
			10
		}
	},
	host_button_frame = {
		vertical_alignment = "bottom",
		parent = "host_button",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			game_option_size[2] + 5
		},
		position = {
			0,
			0,
			10
		}
	},
	strict_matchmaking_button = {
		vertical_alignment = "top",
		parent = "host_button",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			game_option_size[2]
		},
		position = {
			0,
			game_option_size[2] + 5,
			10
		}
	},
	strict_matchmaking_button_frame = {
		vertical_alignment = "bottom",
		parent = "strict_matchmaking_button",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 20,
			game_option_size[2] + 5
		},
		position = {
			0,
			0,
			10
		}
	},
	option_tooltip = {
		vertical_alignment = "bottom",
		parent = "additional_option",
		horizontal_alignment = "center",
		size = {
			game_option_size[1] - 40,
			122
		},
		position = {
			0,
			0,
			0
		}
	},
	option_tooltip_divider = {
		vertical_alignment = "top",
		parent = "option_tooltip",
		horizontal_alignment = "left",
		size = {
			game_option_size[1],
			5
		},
		position = {
			-10,
			-24,
			1
		}
	}
}

function create_option_tooltip(scenegraph_id, size)
	local text_name = "text"
	local text_shadow_name = "text_shadow"
	local passes = {
		[#passes + 1] = {
			pass_type = "text",
			text_id = text_name,
			style_id = text_name,
			content_check_function = function (content)
				return content[text_name]
			end
		},
		[#passes + 1] = {
			pass_type = "text",
			text_id = text_name,
			style_id = text_shadow_name,
			content_check_function = function (content)
				return content[text_name]
			end
		}
	}
	local content = {
		[text_name] = nil
	}
	local text_offset = {
		0,
		-35,
		1
	}
	local style = {
		[text_name] = {
			vertical_alignment = "top",
			font_size = 22,
			horizontal_alignment = "left",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = text_offset
		}
	}
	local text_shadow_style = table.clone(style[text_name])
	text_shadow_style.text_color = Colors.get_color_table_with_alpha("black", 255)
	text_shadow_style.offset = {
		text_offset[1] + 2,
		text_offset[2] - 2,
		text_offset[3] - 1
	}
	style[text_shadow_name] = text_shadow_style
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

local title_text_style = {
	font_size = 32,
	upper_case = true,
	localize = false,
	word_wrap = true,
	horizontal_alignment = "left",
	use_shadow = true,
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		10,
		0,
		0
	}
}
local widgets = {
	background = UIWidgets.create_rect_with_outer_frame("additional_option", scenegraph_definition.additional_option.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	title_text = UIWidgets.create_simple_text(Localize("start_game_window_other_options_title"), "title_text", 32, nil, title_text_style),
	title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "title_divider"),
	option_tooltip = create_option_tooltip("option_tooltip", scenegraph_definition.option_tooltip.size),
	option_tooltip_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "option_tooltip_divider"),
	private_button = UIWidgets.create_default_checkbox_button_console("private_button", scenegraph_definition.private_button.size, Localize("start_game_window_other_options_private"), 24, {
		title = Localize("start_game_window_other_options_private"),
		description = Localize("start_game_window_other_options_private_description")
	}),
	host_button = UIWidgets.create_default_checkbox_button_console("host_button", scenegraph_definition.host_button.size, Localize("start_game_window_other_options_always_host"), 24, {
		title = Localize("start_game_window_other_options_always_host"),
		description = Localize("start_game_window_other_options_always_host_description")
	}),
	strict_matchmaking_button = UIWidgets.create_default_checkbox_button_console("strict_matchmaking_button", scenegraph_definition.strict_matchmaking_button.size, Localize("start_game_window_other_options_strict_matchmaking"), 24, {
		title = Localize("start_game_window_other_options_strict_matchmaking"),
		description = Localize("start_game_window_other_options_strict_matchmaking_description")
	})
}
local gamepad_widget_navigation = {
	"strict_matchmaking_button",
	"host_button",
	"private_button"
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	gamepad_widget_navigation = gamepad_widget_navigation
}
