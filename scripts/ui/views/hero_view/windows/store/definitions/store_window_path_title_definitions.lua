local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	panel = {
		vertical_alignment = "top",
		scale = "fit_width",
		size = {
			1920,
			80
		},
		position = {
			0,
			-90,
			UILayer.default + 1
		}
	},
	breadcrumbs = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			64,
			48
		},
		position = {
			100,
			-90,
			100
		}
	}
}

local function create_breadcrumbs_definition()
	return {
		scenegraph_id = "breadcrumbs",
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id"
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
			text = "store_icon_breadcrumb",
			texture_id = "store_icon_breadcrumb",
			button_hotspot = {}
		},
		style = {
			button_hotspot = {
				size = {
					200,
					48
				},
				color = {
					150,
					255,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				}
			},
			texture_id = {
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
			text = {
				font_size = 28,
				upper_case = false,
				localize = false,
				horizontal_alignment = "left",
				use_shadow = true,
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					70,
					0,
					1
				}
			},
			text_shadow = {
				font_size = 28,
				upper_case = false,
				localize = false,
				use_shadow = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					72,
					-2,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

local widgets = {}
local animation_definitions = {}
animation_definitions.on_enter = {
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

return {
	widgets = widgets,
	create_breadcrumbs_definition = create_breadcrumbs_definition,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
