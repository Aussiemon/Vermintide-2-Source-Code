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
	list_detail_top = {
		vertical_alignment = "top",
		parent = "list_scrollbar",
		horizontal_alignment = "left",
		size = {
			918,
			95
		},
		position = {
			-45,
			60,
			1
		}
	},
	list_detail_bottom = {
		vertical_alignment = "bottom",
		parent = "list_scrollbar",
		horizontal_alignment = "left",
		size = {
			918,
			95
		},
		position = {
			-45,
			-60,
			1
		}
	},
	title_text = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "left",
		size = {
			500,
			70
		},
		position = {
			list_size[1] + 30,
			0,
			1
		}
	},
	sub_title_text = {
		vertical_alignment = "bottom",
		parent = "title_text",
		horizontal_alignment = "left",
		size = {
			500,
			30
		},
		position = {
			0,
			-40,
			1
		}
	},
	description_text = {
		vertical_alignment = "top",
		parent = "sub_title_text",
		horizontal_alignment = "left",
		size = {
			400,
			600
		},
		position = {
			0,
			-40,
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
			size = {
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
				-entry_hover_frame_spacing,
				0,
				0
			}
		},
		mask_top = {
			size = {
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
				-entry_hover_frame_spacing,
				size[2],
				0
			}
		},
		mask_bottom = {
			size = {
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
				-entry_hover_frame_spacing,
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
	list = create_list_mask("list_window", "list", list_size, list_entry_size),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", "list_window", scenegraph_definition.list_scrollbar.size, "gold", true)
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				local widgets_by_name = widgets.widgets_by_name
				local list_widget = widgets_by_name.list
				local style = list_widget.style
				local mask_style = style.mask
				local mask_default_width = mask_style.size[1]
				params.mask_default_width = mask_default_width
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
				local widgets_by_name = widgets.widgets_by_name
				local list_widgets = widgets.list_widgets
				local longest_anim_distance = 0

				for index, widget in ipairs(list_widgets) do
					local content = widget.content
					local offset = widget.offset
					local default_offset = widget.default_offset
					local row = content.row
					local column = content.column
					local anim_offset = math.min(row * 50 + column * 20, 300)
					offset[1] = math.floor((default_offset[1] + anim_offset) - anim_offset * anim_progress)
					longest_anim_distance = math.max(longest_anim_distance, anim_offset)
				end

				local mask_default_width = params.mask_default_width
				local mask_size = math.floor((mask_default_width + longest_anim_distance) - longest_anim_distance * anim_progress)
				local list_widget = widgets_by_name.list
				local style = list_widget.style
				style.mask.size[1] = mask_size
				style.mask_top.size[1] = mask_size
				style.mask_bottom.size[1] = mask_size
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
	animation_definitions = animation_definitions
}
