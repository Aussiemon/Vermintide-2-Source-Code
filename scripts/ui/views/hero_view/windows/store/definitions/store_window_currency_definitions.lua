local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	item_root = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			394,
			1
		}
	}
}
local rect_color = {
	200,
	10,
	10,
	10
}
local title_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 64,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	dynamic_font_size = false,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}
local sub_title_text_style = {
	word_wrap = false,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	dynamic_font_size = false,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local description_text_style = {
	font_size = 20,
	upper_case = false,
	localize = false,
	use_shadow = true,
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

local function create_item_definition(scenegraph_id, size)
	local frame_name = "button_frame_02"
	local frame_settings = UIFrameSettings[frame_name]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local masked = false
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "hotspot",
			pass_type = "hotspot",
			content_id = "hotspot"
		},
		{
			pass_type = "rect",
			style_id = "background"
		},
		{
			pass_type = "texture",
			style_id = "background_price",
			texture_id = "background_price"
		},
		{
			pass_type = "texture",
			style_id = "price_icon",
			texture_id = "price_icon"
		},
		{
			style_id = "price_text",
			pass_type = "text",
			text_id = "price_text"
		},
		{
			style_id = "price_text_shadow",
			pass_type = "text",
			text_id = "price_text"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon"
		},
		{
			pass_type = "texture",
			style_id = "type_tag_bg",
			texture_id = "type_tag_bg"
		},
		{
			pass_type = "texture",
			style_id = "type_tag_icon",
			texture_id = "type_tag_icon"
		}
	}
	local content = {
		background_price = "experience_bar_edge_glow",
		rect = "rect_masked",
		type_tag_bg = "store_tag_bg",
		price_icon = "store_icon_currency_ingame_big",
		price_text = "-",
		type_tag_icon = "store_tag_icon_dlc",
		icon = "icons_placeholder",
		hotspot = {},
		frame = frame_settings.texture,
		hover_frame = hover_frame_settings.texture,
		size = size
	}
	local style = {
		hotspot = {
			size = size,
			offset = {
				0,
				-size[2],
				0
			}
		},
		price_text = {
			font_size = 32,
			upper_case = false,
			localize = false,
			word_wrap = true,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark",
			size = {
				size[1] - 70,
				40
			},
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				60,
				-(size[2] - 22),
				5
			}
		},
		price_text_shadow = {
			font_size = 32,
			upper_case = false,
			localize = false,
			word_wrap = true,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark",
			size = {
				size[1] - 70,
				40
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				62,
				-(size[2] - 22) - 2,
				4
			}
		},
		background = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = size,
			color = {
				200,
				0,
				0,
				0
			},
			offset = {
				0,
				0,
				0
			}
		},
		type_tag_bg = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				42,
				48
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] - 42,
				4,
				8
			}
		},
		type_tag_icon = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				42,
				48
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] - 42,
				4,
				9
			}
		},
		background_price = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				200,
				40
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				-(size[2] - 60),
				3
			}
		},
		price_icon = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
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
				-(size[2] - 72),
				4
			}
		},
		icon = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = size,
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
		frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			frame_margins = {
				0,
				0
			},
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
			}
		},
		hover_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				6
			}
		}
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

local widgets = {}
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
	title_button_definitions = title_button_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_item_definition = create_item_definition
}
