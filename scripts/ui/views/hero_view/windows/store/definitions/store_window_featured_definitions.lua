local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	slideshow = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			788,
			0
		},
		position = {
			100,
			-160,
			10
		}
	},
	list_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			788,
			0
		},
		position = {
			-100,
			-160,
			10
		}
	},
	item_root = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			1
		}
	},
	fence = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			153
		},
		position = {
			0,
			35,
			UILayer.default + 30
		}
	},
	skull_front_left = {
		vertical_alignment = "center",
		parent = "fence",
		horizontal_alignment = "left",
		size = {
			287,
			258
		},
		position = {
			-1,
			15,
			1
		}
	},
	skull_front_right = {
		vertical_alignment = "center",
		parent = "fence",
		horizontal_alignment = "right",
		size = {
			287,
			258
		},
		position = {
			1,
			15,
			1
		}
	},
	skull_back_left = {
		vertical_alignment = "center",
		parent = "fence",
		horizontal_alignment = "left",
		size = {
			287,
			258
		},
		position = {
			-1,
			15,
			-1
		}
	},
	skull_back_right = {
		vertical_alignment = "center",
		parent = "fence",
		horizontal_alignment = "right",
		size = {
			287,
			258
		},
		position = {
			1,
			15,
			-1
		}
	},
	skull_center = {
		vertical_alignment = "center",
		parent = "fence",
		horizontal_alignment = "center",
		size = {
			502,
			249
		},
		position = {
			0,
			15,
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

local function create_slideshow_definition(scenegraph_id, size)
	local frame_name = "menu_frame_16"
	local frame_settings = UIFrameSettings[frame_name]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
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
			pass_type = "rect",
			style_id = "text_background"
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
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame"
		},
		{
			pass_type = "texture",
			style_id = "timer_bg",
			texture_id = "timer_bg"
		},
		{
			style_id = "timer_bar",
			pass_type = "texture_uv",
			content_id = "timer_bar"
		},
		{
			style_id = "icon_1",
			pass_type = "texture_uv",
			content_id = "icon_1"
		},
		{
			style_id = "icon_2",
			pass_type = "texture_uv",
			content_id = "icon_2"
		},
		{
			style_id = "list_style",
			pass_type = "list_pass",
			content_id = "list_content",
			passes = {
				{
					style_id = "background",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				}
			}
		}
	}
	local content = {
		title_text = "n/a",
		rect = "rect_masked",
		wait_time = 3,
		timer_bg = "store_slideshow_bg",
		description_text = "n/a",
		hotspot = {},
		frame = frame_settings.texture,
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		timer_bar = {
			texture_id = "store_slideshow_fill",
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
		icon_1 = {
			texture_id = "icons_placeholder",
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
		icon_2 = {
			texture_id = "icons_placeholder",
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
		size = size,
		list_content = {
			allow_multi_hover = true
		}
	}
	local list_content = content.list_content

	for i = 1, 10, 1 do
		list_content[i] = {
			background = "store_slideshow_off",
			icon = "store_slideshow_on",
			button_hotspot = {}
		}
	end

	local style = {
		hotspot = {
			size = size,
			offset = {
				0,
				-size[2],
				0
			}
		},
		title_text = {
			font_size = 36,
			upper_case = false,
			localize = false,
			word_wrap = true,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			size = {
				size[1] * 0.33 - 30,
				40
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				15,
				-80,
				6
			}
		},
		title_text_shadow = {
			font_size = 36,
			upper_case = false,
			localize = false,
			word_wrap = true,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			size = {
				size[1] * 0.33 - 30,
				40
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				17,
				-82,
				5
			}
		},
		description_text = {
			font_size = 20,
			upper_case = false,
			localize = false,
			word_wrap = true,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark",
			size = {
				size[1] * 0.33 - 30,
				size[2] - 120
			},
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				15,
				-size[2],
				6
			}
		},
		description_text_shadow = {
			font_size = 20,
			upper_case = false,
			localize = false,
			word_wrap = true,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark",
			size = {
				size[1] * 0.33 - 30,
				size[2] - 120
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				17,
				-size[2] - 2,
				5
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
		text_background = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				size[1] * 0.33,
				size[2]
			},
			color = {
				150,
				10,
				10,
				10
			},
			offset = {
				0,
				0,
				3
			}
		},
		timer_bar = {
			vertical_alignment = "bottom",
			texture_width = 144,
			horizontal_alignment = "left",
			size = size,
			masked = masked,
			texture_size = {
				0,
				3
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] / 2 - 72,
				-size[2] + 10 + 3,
				9
			}
		},
		timer_bg = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			size = size,
			masked = masked,
			texture_size = {
				150,
				9
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				-size[2] + 10,
				8
			}
		},
		icon_1 = {
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
				2
			}
		},
		icon_2 = {
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
				2
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
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				6
			}
		},
		pulse_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing
			},
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				12
			}
		},
		list_style = {
			num_draws = 0,
			start_index = 1,
			offset = {
				0,
				-size[2] + 20,
				9
			},
			list_member_offset = {
				0,
				0,
				0
			},
			size = {
				33,
				39
			},
			item_styles = {}
		}
	}
	local item_styles = style.list_style.item_styles

	for i = 1, 10, 1 do
		item_styles[i] = {
			list_member_offset = {
				33,
				0,
				0
			},
			size = {
				33,
				39
			},
			background = {
				masked = masked,
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
			icon = {
				masked = masked,
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			}
		}
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

local content_widgets = {
	slideshow = create_slideshow_definition("slideshow", {
		920,
		680
	})
}
local widgets = {
	skull_front_right = UIWidgets.create_simple_uv_texture("store_fence_skulls_front", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "skull_front_right"),
	skull_front_left = UIWidgets.create_simple_uv_texture("store_fence_skulls_front", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "skull_front_left"),
	skull_back_right = UIWidgets.create_simple_uv_texture("store_fence_skulls_back", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "skull_back_right"),
	skull_back_left = UIWidgets.create_simple_uv_texture("store_fence_skulls_back", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "skull_back_left"),
	skull_center = UIWidgets.create_simple_texture("store_fence_skulls_center", "skull_center")
}
local animation_definitions = {
	on_enter = {
		{
			name = "fence_fade_in",
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
		},
		{
			name = "fade_in",
			start_progress = 0.2,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.content_alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.content_alpha_multiplier = anim_progress
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
	content_widgets = content_widgets,
	title_button_definitions = title_button_definitions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
