local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local list_size = {
	800,
	700
}
local list_entry_size = {
	800,
	220
}
local list_scrollbar_size = {
	16,
	list_size[2]
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	list_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = list_size,
		position = {
			-130,
			-215,
			10
		}
	},
	list = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "right",
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
		horizontal_alignment = "right",
		size = list_scrollbar_size,
		position = {
			58,
			0,
			10
		}
	},
	list_detail_top_left = {
		vertical_alignment = "top",
		parent = "list_scrollbar",
		horizontal_alignment = "right",
		size = {
			157,
			97
		},
		position = {
			45,
			60,
			2
		}
	},
	list_detail_bottom_left = {
		vertical_alignment = "bottom",
		parent = "list_scrollbar",
		horizontal_alignment = "right",
		size = {
			157,
			97
		},
		position = {
			45,
			-60,
			2
		}
	},
	list_detail_top_center = {
		vertical_alignment = "top",
		parent = "list_detail_top_left",
		horizontal_alignment = "right",
		size = {
			750,
			97
		},
		position = {
			-157,
			0,
			0
		}
	},
	list_detail_bottom_center = {
		vertical_alignment = "bottom",
		parent = "list_detail_bottom_left",
		horizontal_alignment = "right",
		size = {
			750,
			97
		},
		position = {
			-157,
			0,
			0
		}
	},
	list_detail_top_right = {
		vertical_alignment = "top",
		parent = "list_detail_top_center",
		horizontal_alignment = "left",
		size = {
			23,
			97
		},
		position = {
			-23,
			0,
			0
		}
	},
	list_detail_bottom_right = {
		vertical_alignment = "bottom",
		parent = "list_detail_bottom_center",
		horizontal_alignment = "left",
		size = {
			23,
			97
		},
		position = {
			-23,
			0,
			0
		}
	},
	title_text = {
		vertical_alignment = "top",
		parent = "list_detail_top_center",
		horizontal_alignment = "left",
		size = {
			780,
			60
		},
		position = {
			5,
			20,
			1
		}
	},
	item_root = {
		vertical_alignment = "top",
		parent = "list",
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
	}
}
local title_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 64,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_list_mask(scenegraph_id, list_scenegraph_id, size, entry_size)
	local masked = true
	local entry_hover_frame_settings = UIFrameSettings.frame_outer_glow_04_big
	local entry_hover_frame_spacing = entry_hover_frame_settings.texture_sizes.horizontal[2]
	local element = {
		passes = {
			{
				style_id = "hotspot",
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				style_id = "list_hotspot",
				pass_type = "hotspot",
				content_id = "list_hotspot"
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture"
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge"
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge"
			}
		}
	}
	local content = {
		mask_edge = "mask_rect_edge_fade",
		mask_texture = "mask_rect",
		list_hotspot = {},
		button_hotspot = {},
		scrollbar = {
			scroll_amount = 0.1,
			percentage = 0.1,
			scroll_value = 1
		}
	}
	local style = {
		hotspot = {
			size = {
				size[1],
				size[2]
			},
			offset = {
				0,
				0,
				0
			}
		},
		list_hotspot = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				size[2] + entry_hover_frame_spacing * 2
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-entry_hover_frame_spacing,
				-entry_hover_frame_spacing,
				0
			}
		},
		mask = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			texture_size = {
				size[1] + entry_hover_frame_spacing * 2,
				size[2]
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				entry_hover_frame_spacing,
				0,
				0
			}
		},
		mask_top = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			texture_size = {
				size[1] + entry_hover_frame_spacing * 2,
				entry_hover_frame_spacing
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				entry_hover_frame_spacing,
				size[2],
				0
			}
		},
		mask_bottom = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			texture_size = {
				size[1] + entry_hover_frame_spacing * 2,
				entry_hover_frame_spacing
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				entry_hover_frame_spacing,
				-entry_hover_frame_spacing,
				0
			},
			angle = math.pi,
			pivot = {
				(size[1] + entry_hover_frame_spacing * 2) / 2,
				entry_hover_frame_spacing / 2
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

local widgets = {
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	list = create_list_mask("list_window", "list", list_size, list_entry_size),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", "list_window", scenegraph_definition.list_scrollbar.size, "gold"),
	list_detail_top_left = UIWidgets.create_simple_uv_texture("divider_skull_left", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "list_detail_top_left"),
	list_detail_bottom_left = UIWidgets.create_simple_uv_texture("divider_skull_left", {
		{
			1,
			1
		},
		{
			0,
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
			1,
			0
		},
		{
			0,
			1
		}
	}, "list_detail_top_right"),
	list_detail_bottom_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			1
		},
		{
			0,
			0
		}
	}, "list_detail_bottom_right")
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0.3,
			end_progress = 0.6,
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
	on_item_list_initialized = {
		{
			name = "delay",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_in",
			start_progress = 0.3,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.list_alpha_multiplier = 0
				local widgets_by_name = widgets.widgets_by_name
				local list_widget = widgets_by_name.list
				local style = list_widget.style
				local mask_style = style.mask
				local mask_default_width = mask_style.texture_size[1]
				params.mask_default_width = mask_default_width
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.list_alpha_multiplier = anim_progress
				local widgets_by_name = widgets.widgets_by_name
				local list_widgets = widgets.list_widgets
				local longest_anim_distance = 0

				for index, widget in ipairs(list_widgets) do
					local content = widget.content
					local offset = widget.offset
					local default_offset = widget.default_offset
					local row = content.row
					local column = content.column
					local anim_offset = math.min(row * 50 + (4 - column) * 20, 300)
					offset[1] = math.floor(default_offset[1] - anim_offset + anim_offset * anim_progress)
					longest_anim_distance = math.max(longest_anim_distance, anim_offset)
				end

				local mask_default_width = params.mask_default_width
				local mask_size = math.floor((mask_default_width + longest_anim_distance) - longest_anim_distance * anim_progress)
				local list_widget = widgets_by_name.list
				local style = list_widget.style
				style.mask.texture_size[1] = mask_size
				style.mask_top.texture_size[1] = mask_size
				style.mask_bottom.texture_size[1] = mask_size
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_item_list_updated = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.list_alpha_multiplier = 0
				local widgets_by_name = widgets.widgets_by_name
				local list_widget = widgets_by_name.list
				local style = list_widget.style
				local mask_style = style.mask
				local mask_default_width = mask_style.texture_size[1]
				params.mask_default_width = mask_default_width
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.list_alpha_multiplier = anim_progress
				local widgets_by_name = widgets.widgets_by_name
				local list_widgets = widgets.list_widgets
				local longest_anim_distance = 0

				for index, widget in ipairs(list_widgets) do
					local content = widget.content
					local offset = widget.offset
					local default_offset = widget.default_offset
					local row = content.row
					local column = content.column
					local anim_offset = math.min(row * 50 + (4 - column) * 20, 300)
					offset[1] = math.floor(default_offset[1] - anim_offset + anim_offset * anim_progress)
					longest_anim_distance = math.max(longest_anim_distance, anim_offset)
				end

				local mask_default_width = params.mask_default_width
				local mask_size = math.floor((mask_default_width + longest_anim_distance) - longest_anim_distance * anim_progress)
				local list_widget = widgets_by_name.list
				local style = list_widget.style
				style.mask.texture_size[1] = mask_size
				style.mask_top.texture_size[1] = mask_size
				style.mask_bottom.texture_size[1] = mask_size
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
	animation_definitions = animation_definitions
}
