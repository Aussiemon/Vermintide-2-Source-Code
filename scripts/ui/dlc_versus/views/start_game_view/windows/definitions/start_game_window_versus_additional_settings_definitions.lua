-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_additional_settings_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local game_option_size = {
	window_size[1] - 20,
	30,
}
local animation_definitions = {
	on_enter = {
		{
			duration = 0.2,
			name = "fade_in",
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			duration = 0.3,
			name = "fade_out",
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "right",
		parent = "menu_root",
		vertical_alignment = "bottom",
		size = window_size,
		position = {
			-100,
			-400,
			1,
		},
	},
	additional_option = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			game_option_size[1],
			260,
		},
		position = {
			0,
			0,
			0,
		},
	},
	title_text = {
		horizontal_alignment = "left",
		parent = "additional_option",
		vertical_alignment = "top",
		size = {
			game_option_size[1],
			50,
		},
		position = {
			0,
			0,
			10,
		},
	},
	title_divider = {
		horizontal_alignment = "left",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			5,
		},
		position = {
			10,
			2,
			0,
		},
	},
	game_options_right_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2],
		},
		position = {
			195,
			0,
			1,
		},
	},
	game_options_left_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2],
		},
		position = {
			-195,
			0,
			1,
		},
	},
	dedicated_servers_aws_checkbox = {
		horizontal_alignment = "center",
		parent = "additional_option",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 20,
			game_option_size[2],
		},
		position = {
			0,
			-(game_option_size[2] + 5) * 3 - 25,
			10,
		},
	},
	dedicated_servers_aws_checkbox_frame = {
		horizontal_alignment = "center",
		parent = "dedicated_servers_aws_checkbox",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 20,
			game_option_size[2] + 5,
		},
		position = {
			0,
			0,
			10,
		},
	},
	dedicated_servers_win_checkbox = {
		horizontal_alignment = "center",
		parent = "dedicated_servers_aws_checkbox",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 20,
			game_option_size[2],
		},
		position = {
			0,
			game_option_size[2] + 5,
			10,
		},
	},
	dedicated_servers_win_checkbox_frame = {
		horizontal_alignment = "center",
		parent = "dedicated_servers_aws_checkbox",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 20,
			game_option_size[2] + 5,
		},
		position = {
			0,
			0,
			10,
		},
	},
	player_hosted_checkbox = {
		horizontal_alignment = "center",
		parent = "dedicated_servers_win_checkbox",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 20,
			game_option_size[2],
		},
		position = {
			0,
			game_option_size[2] + 5,
			10,
		},
	},
	player_hosted_checkbox_frame = {
		horizontal_alignment = "center",
		parent = "player_hosted_checkbox",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 20,
			game_option_size[2] + 5,
		},
		position = {
			0,
			0,
			10,
		},
	},
	option_tooltip = {
		horizontal_alignment = "center",
		parent = "additional_option",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 40,
			122,
		},
		position = {
			0,
			0,
			0,
		},
	},
	option_tooltip_divider = {
		horizontal_alignment = "left",
		parent = "option_tooltip",
		vertical_alignment = "top",
		size = {
			game_option_size[1],
			5,
		},
		position = {
			-10,
			-24,
			1,
		},
	},
}

function create_option_tooltip(scenegraph_id, size)
	local text_name = "text"
	local text_shadow_name = "text_shadow"
	local passes = {}

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_name,
		style_id = text_name,
		content_check_function = function (content)
			return content[text_name]
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_name,
		style_id = text_shadow_name,
		content_check_function = function (content)
			return content[text_name]
		end,
	}

	local content = {}

	content[text_name] = nil

	local text_offset = {
		0,
		-35,
		1,
	}
	local style = {}

	style[text_name] = {
		font_size = 22,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = text_offset,
	}

	local text_shadow_style = table.clone(style[text_name])

	text_shadow_style.text_color = Colors.get_color_table_with_alpha("black", 255)
	text_shadow_style.offset = {
		text_offset[1] + 2,
		text_offset[2] - 2,
		text_offset[3] - 1,
	}
	style[text_shadow_name] = text_shadow_style

	local widget = {}

	widget.element = {
		passes = passes,
	}
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local title_text_style = {
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	default_text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		10,
		0,
		0,
	},
}
local widgets = {
	background = UIWidgets.create_deus_panel_with_outer_frame("additional_option", scenegraph_definition.additional_option.size),
	title_text = UIWidgets.create_simple_text(Localize("start_game_window_other_options_title"), "title_text", 32, nil, title_text_style),
	title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "title_divider"),
	option_tooltip = create_option_tooltip("option_tooltip", scenegraph_definition.option_tooltip.size),
	option_tooltip_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "option_tooltip_divider"),
	player_hosted_checkbox = UIWidgets.create_default_checkbox_button_console("player_hosted_checkbox", scenegraph_definition.player_hosted_checkbox.size, "Player Hosted", 24, {
		title = Localize("player_hosted_title"),
		description = Localize("player_hosted_desc"),
	}, "menu_frame_03_morris"),
	dedicated_servers_win_checkbox = UIWidgets.create_default_checkbox_button_console("dedicated_servers_win_checkbox", scenegraph_definition.dedicated_servers_win_checkbox.size, "Dedicated servers: Win", 24, {
		title = Localize("dedicated_servers_win_title"),
		description = Localize("dedicated_servers_win_desc"),
	}, "menu_frame_03_morris"),
	dedicated_servers_aws_checkbox = UIWidgets.create_default_checkbox_button_console("dedicated_servers_aws_checkbox", scenegraph_definition.dedicated_servers_aws_checkbox.size, "Dedicated servers: AWS", 24, {
		title = Localize("dedicated_servers_aws_title"),
		description = Localize("dedicated_servers_aws_desc"),
	}, "menu_frame_03_morris"),
}
local gamepad_widget_navigation = {
	"player_hosted_checkbox",
	"dedicated_servers_win_checkbox",
	"dedicated_servers_aws_checkbox",
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	gamepad_widget_navigation = gamepad_widget_navigation,
}
