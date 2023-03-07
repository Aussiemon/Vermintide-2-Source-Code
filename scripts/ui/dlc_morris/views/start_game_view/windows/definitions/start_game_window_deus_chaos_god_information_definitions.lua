local WIDGET_SIZE = {
	380,
	200
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
		vertical_alignment = "top",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = {
			WIDGET_SIZE[1],
			WIDGET_SIZE[2]
		},
		position = {
			150,
			-170,
			1
		}
	},
	extra_curse = {
		vertical_alignment = "top",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = {
			WIDGET_SIZE[1],
			WIDGET_SIZE[2]
		},
		position = {
			600,
			-170,
			1
		}
	}
}

local function create_widget(scenegraph_id)
	local widget = {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					style_id = "glow_top",
					pass_type = "texture_uv",
					content_id = "glow_top"
				},
				{
					pass_type = "texture",
					style_id = "glow_bottom",
					texture_id = "glow_bottom"
				},
				{
					pass_type = "texture",
					style_id = "header",
					texture_id = "header"
				},
				{
					pass_type = "texture",
					style_id = "glow_icon",
					texture_id = "glow_icon"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					style_id = "title",
					pass_type = "text",
					text_id = "title"
				},
				{
					style_id = "subtitle",
					pass_type = "text",
					text_id = "subtitle"
				},
				{
					style_id = "body",
					pass_type = "text",
					text_id = "body"
				}
			}
		},
		content = {
			glow_bottom = "morris_gaze_glow",
			subtitle = "n/a",
			body = "n/a",
			header = "morris_gaze_header",
			glow_icon = "circular_gradient",
			title = "n/a",
			theme = "khorne",
			background = "morris_gaze_background",
			icon = "icons_placeholder",
			glow_top = {
				texture_id = "morris_gaze_glow",
				uvs = {
					{
						0,
						1
					},
					{
						1,
						0
					}
				}
			}
		},
		style = {
			background = {},
			glow_top = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				texture_size = {
					315,
					42
				},
				color = Colors.get_color_table_with_alpha("tzeentch", 0),
				offset = {
					-3,
					-5,
					1
				}
			},
			glow_bottom = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				texture_size = {
					315,
					42
				},
				color = Colors.get_color_table_with_alpha("tzeentch", 0),
				offset = {
					-3,
					-25,
					2
				}
			},
			header = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				texture_size = {
					387,
					157
				},
				offset = {
					-3,
					70,
					3
				}
			},
			glow_icon = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				color = Colors.get_color_table_with_alpha("tzeentch", 0),
				texture_size = {
					120,
					120
				},
				offset = {
					-3,
					95,
					4
				}
			},
			icon = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				color = Colors.get_color_table_with_alpha("white", 0),
				texture_size = {
					102,
					106
				},
				offset = {
					-3,
					100,
					5
				}
			},
			title = {
				use_shadow = true,
				upper_case = false,
				localize = true,
				font_size = 32,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("tzeentch", 255),
				offset = {
					15,
					-6,
					6
				},
				size = {
					WIDGET_SIZE[1] - 30,
					WIDGET_SIZE[2]
				}
			},
			subtitle = {
				use_shadow = true,
				upper_case = false,
				localize = false,
				font_size = 20,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-40,
					7
				},
				size = {
					WIDGET_SIZE[1],
					WIDGET_SIZE[2]
				}
			},
			body = {
				font_size = 20,
				horizontal_alignment = "left",
				localize = false,
				word_wrap = true,
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					40,
					20,
					8
				},
				size = {
					WIDGET_SIZE[1] - 80,
					WIDGET_SIZE[2] - 40 - 64
				}
			}
		}
	}

	return widget
end

local widgets = {
	god_info_widget = create_widget("window"),
	belakor_info_widget = create_widget("extra_curse")
}
local animation_definitions = {}
animation_definitions.on_enter = {
	{
		name = "fade_in",
		duration = 0.3,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			params.render_settings.alpha_multiplier = 0
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
			params.render_settings.alpha_multiplier = math.easeOutCubic(progress)
		end,
		on_complete = NOP
	}
}
animation_definitions.on_exit = {
	{
		name = "fade_out",
		duration = 0.3,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			params.render_settings.alpha_multiplier = 1
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
			params.render_settings.alpha_multiplier = 1
		end,
		on_complete = NOP
	}
}
animation_definitions.set_theme = {
	{
		name = "fade_in",
		delay = 0,
		duration = 0.5,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			local theme_settings = params.theme_settings
			local theme_color = theme_settings.curse_description_color
			local style = widget.style
			style.glow_top.color[1] = 0
			style.glow_bottom.color[1] = 0
			style.glow_icon.color[1] = 0

			Colors.copy_no_alpha_to(style.glow_top.color, theme_color)
			Colors.copy_no_alpha_to(style.glow_bottom.color, theme_color)
			Colors.copy_no_alpha_to(style.glow_icon.color, theme_color)
			Colors.copy_no_alpha_to(style.title.text_color, theme_color)

			local content = widget.content
			content.icon = theme_settings.icon
			content.title = theme_settings.journey_title
			local localized_deity_name = Localize(theme_settings.deity_name or "lb_unknown")
			content.body = string.format(Localize("gaze_information"), localized_deity_name)
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
			local style = widget.style
			progress = math.easeInCubic(progress)
			local alpha = 255 * progress
			style.glow_top.color[1] = alpha
			style.glow_bottom.color[1] = alpha
			style.glow_icon.color[1] = alpha
		end,
		on_complete = NOP
	},
	{
		name = "fade_in_icon",
		delay = 0,
		duration = 0.25,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			widget.style.icon.color[1] = 0
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
			progress = math.easeInCubic(progress)
			widget.style.icon.color[1] = 255 * progress
		end,
		on_complete = NOP
	}
}
animation_definitions.set_theme_belakor = {
	{
		name = "fade_in",
		delay = 0,
		duration = 0.5,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			local theme_settings = params.theme_settings
			local theme_color = theme_settings.curse_description_color
			local style = widget.style
			style.glow_top.color[1] = 0
			style.glow_bottom.color[1] = 0
			style.glow_icon.color[1] = 0

			Colors.copy_no_alpha_to(style.glow_top.color, theme_color)
			Colors.copy_no_alpha_to(style.glow_bottom.color, theme_color)
			Colors.copy_no_alpha_to(style.glow_icon.color, theme_color)
			Colors.copy_no_alpha_to(style.title.text_color, theme_color)

			local content = widget.content
			content.icon = theme_settings.icon
			content.title = theme_settings.journey_title
			local localized_deity_name = Localize(theme_settings.deity_name or "lb_unknown")
			content.body = string.format(Localize("gaze_information"), localized_deity_name)
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
			local style = widget.style
			progress = math.easeInCubic(progress)
			local alpha = 255 * progress
			style.glow_top.color[1] = alpha
			style.glow_bottom.color[1] = alpha
			style.glow_icon.color[1] = alpha
		end,
		on_complete = NOP
	},
	{
		name = "fade_in_icon",
		delay = 0,
		duration = 0.25,
		init = function (ui_scenegraph, scenegraph_definition, widget, params)
			widget.style.icon.color[1] = 0
		end,
		update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
			progress = math.easeInCubic(progress)
			widget.style.icon.color[1] = 255 * progress
		end,
		on_complete = NOP
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets,
	animation_definitions = animation_definitions
}
