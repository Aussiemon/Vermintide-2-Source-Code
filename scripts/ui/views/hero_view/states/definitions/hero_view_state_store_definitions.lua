local list_size = {
	800,
	700
}
local list_scrollbar_size = {
	16,
	list_size[2]
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
	screen = {
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
	video_fullscreen_background = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			998
		}
	},
	video_fullscreen = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		scale = "aspect_ratio",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			999
		}
	},
	video_fullscreen_fade = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			1000
		}
	},
	list_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = list_size,
		position = {
			130,
			-215,
			10
		}
	},
	list = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "left",
		size = list_size,
		position = {
			0,
			-list_size[2],
			0
		}
	},
	list_scrollbar = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "left",
		size = list_scrollbar_size,
		position = {
			-58,
			0,
			10
		}
	},
	list_detail_top_left = {
		vertical_alignment = "top",
		parent = "list_scrollbar",
		horizontal_alignment = "left",
		size = {
			157,
			97
		},
		position = {
			-45,
			60,
			2
		}
	},
	list_detail_bottom_left = {
		vertical_alignment = "bottom",
		parent = "list_scrollbar",
		horizontal_alignment = "left",
		size = {
			157,
			97
		},
		position = {
			-45,
			-60,
			2
		}
	},
	list_detail_top_center = {
		vertical_alignment = "top",
		parent = "list_detail_top_left",
		horizontal_alignment = "left",
		size = {
			64,
			97
		},
		position = {
			157,
			0,
			0
		}
	},
	list_detail_bottom_center = {
		vertical_alignment = "bottom",
		parent = "list_detail_bottom_left",
		horizontal_alignment = "left",
		size = {
			200,
			97
		},
		position = {
			157,
			0,
			0
		}
	},
	list_detail_top_right = {
		vertical_alignment = "top",
		parent = "list_detail_top_center",
		horizontal_alignment = "right",
		size = {
			23,
			97
		},
		position = {
			23,
			0,
			0
		}
	},
	list_detail_bottom_right = {
		vertical_alignment = "bottom",
		parent = "list_detail_bottom_center",
		horizontal_alignment = "right",
		size = {
			23,
			97
		},
		position = {
			23,
			0,
			0
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = false,
	localize = true,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local item_name_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 42,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = false,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		2,
		2
	}
}
local widgets = {
	video_fullscreen_fade = {
		scenegraph_id = "video_fullscreen_fade",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background"
				},
				{
					style_id = "rect",
					pass_type = "rect",
					content_change_function = function (content, style, _, dt)
						local progress = content.progress

						if not progress then
							return
						end

						progress = math.min(progress + dt, 1)
						local alpha = 255 - 255 * math.smoothstep(progress, 0, 1)
						style.color[1] = alpha

						if progress == 1 then
							content.progress = nil
						else
							content.progress = progress
						end
					end
				}
			}
		},
		content = {},
		style = {
			rect = {
				color = {
					255,
					0,
					0,
					0
				}
			},
			background = {
				scenegraph_id = "video_fullscreen_background",
				color = {
					255,
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
		}
	}
}
local list_detail_widgets = {
	list_detail_top_left = UIWidgets.create_simple_uv_texture("divider_skull_left", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "list_detail_top_left"),
	list_detail_bottom_left = UIWidgets.create_simple_uv_texture("divider_skull_left", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "list_detail_bottom_left"),
	list_detail_top_center = UIWidgets.create_tiled_texture("list_detail_top_center", "divider_skull_middle", {
		64,
		97
	}),
	list_detail_bottom_center = UIWidgets.create_tiled_texture("list_detail_bottom_center", "divider_skull_middle_down", {
		64,
		97
	}),
	list_detail_top_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "list_detail_top_right"),
	list_detail_bottom_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "list_detail_bottom_right"),
	chain = UIWidgets.create_tiled_texture("list_scrollbar", "chain_link_01_blue", {
		16,
		19
	})
}
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
				params.render_settings.alpha_multiplier = 1
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
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}
animation_definitions.list_detail_on_enter = {
	{
		name = "fade_in",
		start_progress = 0,
		end_progress = 0.3,
		init = function (ui_scenegraph, scenegraph_definition, widgets, params)
			return
		end,
		update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
			local anim_progress = math.easeOutCubic(progress)
			local list_detail_top_left = widgets.list_detail_top_left
			local list_detail_top_right = widgets.list_detail_top_right
			local list_detail_bottom_left = widgets.list_detail_bottom_left
			local list_detail_bottom_center = widgets.list_detail_bottom_center
			local list_detail_top_center = widgets.list_detail_top_center
			local list_detail_bottom_right = widgets.list_detail_bottom_right
			local chain = widgets.chain
			local alpha = 255 * anim_progress
			chain.style.tiling_texture.color[1] = alpha
			list_detail_top_center.style.tiling_texture.color[1] = alpha
			list_detail_bottom_center.style.tiling_texture.color[1] = alpha
			list_detail_top_left.style.texture_id.color[1] = alpha
			list_detail_bottom_left.style.texture_id.color[1] = alpha
			list_detail_top_right.style.texture_id.color[1] = alpha
			list_detail_bottom_right.style.texture_id.color[1] = alpha
		end,
		on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
			return
		end
	}
}
local generic_input_actions = {
	{
		input_action = "confirm",
		priority = 2,
		description_text = "input_description_select"
	},
	{
		input_action = "back",
		priority = 3,
		description_text = "input_description_close"
	}
}

return {
	widgets = widgets,
	generic_input_actions = generic_input_actions,
	list_detail_widgets = list_detail_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
