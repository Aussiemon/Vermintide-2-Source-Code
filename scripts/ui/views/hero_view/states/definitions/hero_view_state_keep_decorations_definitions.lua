local list_window_size = {
	450,
	50
}
local list_size = {
	450,
	640
}
local list_scrollbar_size = {
	16,
	list_size[2] - 30
}
local info_window_size = {
	list_size[1],
	list_size[2] + 29
}
local scenegraph_definition = {
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
	list_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = list_window_size,
		position = {
			130,
			-100,
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
			-list_window_size[2],
			0
		}
	},
	list_scrollbar = {
		vertical_alignment = "top",
		parent = "list_window",
		horizontal_alignment = "left",
		size = list_scrollbar_size,
		position = {
			-40,
			-80,
			10
		}
	},
	confirm_button = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			380,
			70
		},
		position = {
			0,
			30,
			10
		}
	},
	close_button = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			300,
			70
		},
		position = {
			-80,
			30,
			10
		}
	},
	info_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = info_window_size,
		position = {
			-70,
			-(100 + list_window_size[2]),
			10
		}
	},
	info_top_left = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "left",
		size = {
			244,
			95
		},
		position = {
			0,
			40,
			2
		}
	},
	info_top_right = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "right",
		size = {
			244,
			95
		},
		position = {
			0,
			40,
			2
		}
	},
	info_bottom_left = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "left",
		size = {
			244,
			95
		},
		position = {
			0,
			-40,
			2
		}
	},
	info_bottom_right = {
		vertical_alignment = "bottom",
		parent = "info_window",
		horizontal_alignment = "right",
		size = {
			244,
			95
		},
		position = {
			0,
			-40,
			2
		}
	},
	title_background = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			413,
			129
		},
		position = {
			0,
			-30,
			1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title_background",
		horizontal_alignment = "center",
		size = {
			250,
			50
		},
		position = {
			0,
			4,
			1
		}
	},
	description_text = {
		vertical_alignment = "center",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			list_size[1] - 50,
			300
		},
		position = {
			0,
			0,
			1
		}
	},
	title_divider = {
		vertical_alignment = "center",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			78,
			28
		},
		position = {
			0,
			140,
			1
		}
	},
	description_divider = {
		vertical_alignment = "center",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			78,
			28
		},
		position = {
			0,
			-140,
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
	upper_case = true,
	localize = false,
	use_shadow = false,
	font_size = 32,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = false,
	font_type = "hell_shark_header",
	text_color = {
		255,
		10,
		10,
		10
	},
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
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_list_widget(scenegraph_id, size, list_scenegraph_id, list_size)
	local background_texture = "menu_frame_bg_02"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local background_size = (background_texture_settings and background_texture_settings.size) or size
	local masked = true
	local num_entries = 100
	local entry_size = {
		list_size[1],
		50
	}
	local list_background_size = {
		list_size[1],
		list_size[2] + size[2]
	}
	local entry_spacing = 16
	local entry_hover_frame_settings = UIFrameSettings.frame_outer_glow_04
	local entry_hover_frame_spacing = entry_hover_frame_settings.texture_sizes.horizontal[2]
	local entry_new_frame_settings = UIFrameSettings.frame_outer_glow_01
	local entry_new_frame_spacing = entry_new_frame_settings.texture_sizes.horizontal[2]
	local element = {
		passes = {
			{
				style_id = "hotspot",
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				style_id = "top_edge",
				texture_id = "top_edge"
			},
			{
				style_id = "bottom_edge",
				pass_type = "texture_uv",
				content_id = "bottom_edge"
			},
			{
				style_id = "title",
				pass_type = "text",
				text_id = "title"
			},
			{
				style_id = "title_shadow",
				pass_type = "text",
				text_id = "title"
			},
			{
				style_id = "title_counter",
				pass_type = "text",
				text_id = "title_counter"
			},
			{
				style_id = "title_counter_shadow",
				pass_type = "text",
				text_id = "title_counter"
			},
			{
				style_id = "mask",
				pass_type = "hotspot",
				content_id = "list_hotspot"
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture"
			},
			{
				pass_type = "scroll",
				content_id = "scrollbar",
				scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
					local axis_input = scroll_axis.y * -1
					local parent_content = ui_content.parent
					local hotspot = parent_content.list_hotspot

					if axis_input ~= 0 and hotspot.is_hover then
						ui_content.axis_input = axis_input
						ui_content.scroll_add = axis_input * ui_content.scroll_amount
					else
						axis_input = ui_content.axis_input
					end

					local scroll_add = ui_content.scroll_add

					if scroll_add then
						local step = scroll_add * dt * 5
						scroll_add = scroll_add - step

						if math.abs(scroll_add) > 0 then
							ui_content.scroll_add = scroll_add
						else
							ui_content.scroll_add = nil
						end

						local current_scroll_value = ui_content.scroll_value
						ui_content.scroll_value = math.clamp(current_scroll_value + step, 0, 1)
					end
				end
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
						style_id = "title",
						pass_type = "text",
						text_id = "title"
					},
					{
						style_id = "title_shadow",
						pass_type = "text",
						text_id = "title"
					},
					{
						style_id = "name",
						pass_type = "text",
						text_id = "name"
					},
					{
						style_id = "name_shadow",
						pass_type = "text",
						text_id = "name"
					},
					{
						pass_type = "texture",
						style_id = "title_divider",
						texture_id = "title_divider",
						content_check_function = function (content)
							return content.title ~= ""
						end
					},
					{
						pass_type = "texture",
						style_id = "background",
						texture_id = "background"
					},
					{
						pass_type = "texture_frame",
						style_id = "hover_frame",
						texture_id = "hover_frame"
					},
					{
						style_id = "new_frame",
						texture_id = "new_frame",
						pass_type = "texture_frame",
						content_check_function = function (content)
							return content.new
						end,
						content_change_function = function (content, style)
							local progress = 0.5 + math.sin(Application.time_since_launch() * 5) * 0.5
							style.color[1] = 55 + progress * 200
						end
					},
					{
						pass_type = "texture",
						style_id = "lock_texture",
						texture_id = "lock_texture",
						content_check_function = function (content)
							return content.locked
						end
					},
					{
						pass_type = "texture",
						style_id = "equipped_texture",
						texture_id = "equipped_texture",
						content_check_function = function (content)
							return content.equipped
						end
					},
					{
						pass_type = "texture",
						style_id = "new_texture",
						texture_id = "new_texture",
						content_check_function = function (content)
							return content.new
						end
					}
				}
			}
		}
	}
	local content = {
		mask_texture = "mask_rect",
		title_counter = "0/0",
		title = "title",
		top_edge = "keep_decorations_01",
		spacing = entry_spacing,
		list_hotspot = {},
		button_hotspot = {},
		bottom_edge = {
			texture_id = "keep_decorations_01",
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
		},
		scrollbar = {
			scroll_amount = 0.1,
			percentage = 0.1,
			scroll_value = 1
		},
		list_content = {
			allow_multi_hover = true
		}
	}
	local list_content = content.list_content

	for i = 1, num_entries, 1 do
		list_content[i] = {
			title = "",
			name = "",
			equipped_texture = "matchmaking_checkbox",
			lock_texture = "achievement_symbol_lock",
			title_divider = "game_option_divider",
			background = "playername_bg_02",
			new_texture = "list_item_tag_new",
			button_hotspot = {},
			hover_frame = entry_hover_frame_settings.texture,
			new_frame = entry_new_frame_settings.texture
		}
	end

	local style = {
		top_edge = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-85,
				-10,
				11
			},
			texture_size = {
				488,
				95
			}
		},
		bottom_edge = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-85,
				-(list_size[2] + 24),
				11
			},
			texture_size = {
				488,
				95
			}
		},
		title_rect = {
			vertical_alignment = "top",
			horizontal_alignment = "right",
			color = {
				80,
				10,
				10,
				50
			},
			offset = {
				0,
				10,
				1
			}
		},
		title = {
			word_wrap = true,
			upper_case = true,
			localize = false,
			font_size = 34,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			normal_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				10,
				10,
				3
			}
		},
		title_shadow = {
			word_wrap = true,
			upper_case = true,
			localize = false,
			font_size = 34,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			normal_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				12,
				8,
				2
			}
		},
		title_counter = {
			word_wrap = true,
			upper_case = true,
			localize = false,
			font_size = 34,
			horizontal_alignment = "right",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			normal_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				10,
				3
			},
			size = {
				size[1] - 50,
				size[2]
			}
		},
		title_counter_shadow = {
			word_wrap = true,
			upper_case = true,
			localize = false,
			font_size = 34,
			horizontal_alignment = "right",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			normal_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				2,
				8,
				2
			},
			size = {
				size[1] - 50,
				size[2]
			}
		},
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
		mask = {
			size = {
				list_size[1] + entry_hover_frame_spacing * 2,
				list_size[2] + entry_hover_frame_spacing * 2
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-entry_hover_frame_spacing,
				-(list_size[2] + entry_hover_frame_spacing * 2),
				0
			}
		},
		list_style = {
			vertical_alignment = "top",
			num_draws = 0,
			start_index = 1,
			horizontal_alignment = "center",
			list_member_offset = {
				0,
				entry_size[2] + entry_spacing,
				0
			},
			size = {
				entry_size[1],
				entry_size[2]
			},
			scenegraph_id = list_scenegraph_id,
			item_styles = {}
		}
	}
	local item_styles = style.list_style.item_styles

	for i = 1, num_entries, 1 do
		item_styles[i] = {
			list_member_offset = {
				0,
				-(entry_size[2] + entry_spacing),
				0
			},
			size = {
				entry_size[1],
				entry_size[2]
			},
			title = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				normal_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					10,
					5,
					2
				}
			},
			title_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				normal_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					12,
					3,
					1
				}
			},
			name = {
				word_wrap = true,
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
				select_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					10,
					0,
					2
				}
			},
			name_shadow = {
				word_wrap = true,
				font_size = 22,
				localize = false,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				normal_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					12,
					-2,
					1
				}
			},
			title_divider = {
				masked = true,
				size = {
					500,
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					10,
					0,
					2
				}
			},
			background = {
				masked = true,
				size = {
					entry_size[1],
					entry_size[2]
				},
				color = {
					180,
					10,
					10,
					10
				},
				offset = {
					0,
					0,
					0
				}
			},
			hover_frame = {
				masked = true,
				texture_size = entry_hover_frame_settings.texture_size,
				texture_sizes = entry_hover_frame_settings.texture_sizes,
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
				},
				size = {
					entry_size[1],
					entry_size[2]
				},
				frame_margins = {
					-entry_hover_frame_spacing,
					-entry_hover_frame_spacing
				}
			},
			new_frame = {
				masked = true,
				texture_size = entry_new_frame_settings.texture_size,
				texture_sizes = entry_new_frame_settings.texture_sizes,
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
				},
				size = {
					entry_size[1],
					entry_size[2]
				},
				frame_margins = {
					-entry_new_frame_spacing,
					-entry_new_frame_spacing
				}
			},
			lock_texture = {
				masked = true,
				size = {
					56,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					entry_size[1] - 56,
					entry_size[2] / 2 - 20,
					2
				}
			},
			equipped_texture = {
				masked = true,
				size = {
					37,
					31
				},
				color = Colors.get_color_table_with_alpha("green", 255),
				offset = {
					entry_size[1] - 37,
					entry_size[2] / 2 - 15.5,
					2
				}
			},
			new_texture = {
				masked = true,
				size = {
					126,
					51
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					entry_size[1] - 120,
					entry_size[2] / 2 - 25.5,
					2
				}
			}
		}
	end

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

local function create_rect_with_frame(scenegraph_id, size, rect_color)
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "rect",
			style_id = "background"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		}
	}
	local content = {
		frame = "menu_frame_13"
	}
	local style = {
		background = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = size,
			color = rect_color or {
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
		frame = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			area_size = size,
			texture_size = {
				84,
				84
			},
			texture_sizes = {
				corner = {
					32,
					32
				},
				vertical = {
					27,
					1
				},
				horizontal = {
					1,
					27
				}
			},
			frame_margins = {
				-27,
				-27
			},
			color = rect_color or {
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

local disable_with_gamepad = true
local widgets_definitions = {
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	title_background = UIWidgets.create_simple_texture("keep_decorations_title_bg", "title_background"),
	title_divider = UIWidgets.create_simple_texture("keep_decorations_divider_02", "title_divider"),
	description_text = UIWidgets.create_simple_text("n/a", "description_text", nil, nil, description_text_style),
	description_divider = UIWidgets.create_simple_texture("keep_decorations_divider_02", "description_divider"),
	background = UIWidgets.create_simple_texture("options_window_fade_01", "screen"),
	info_window = create_rect_with_frame("info_window", {
		info_window_size[1] - 20,
		info_window_size[2]
	}, rect_color),
	info_bottom_right = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			0.5,
			1
		},
		{
			1,
			0
		}
	}, "info_bottom_right"),
	info_bottom_left = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			1,
			1
		},
		{
			0.5,
			0
		}
	}, "info_bottom_left"),
	info_top_right = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			0.5,
			0
		},
		{
			1,
			1
		}
	}, "info_top_right"),
	info_top_left = UIWidgets.create_simple_uv_texture("keep_decorations_01", {
		{
			1,
			0
		},
		{
			0.5,
			1
		}
	}, "info_top_left"),
	list = create_list_widget("list_window", scenegraph_definition.list_window.size, "list", scenegraph_definition.list.size),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", scenegraph_definition.list_scrollbar.size, "gold"),
	confirm_button = UIWidgets.create_default_button("confirm_button", scenegraph_definition.confirm_button.size, "button_frame_01_gold", nil, Localize("menu_settings_apply"), 32, nil, "button_detail_01_gold", nil, disable_with_gamepad),
	close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, "button_frame_01_gold", nil, Localize("interaction_action_close"), 32, nil, "button_detail_01_gold", nil, disable_with_gamepad)
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
local generic_input_actions = {
	{
		input_action = "back",
		priority = 3,
		description_text = "input_description_close"
	}
}

return {
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	widgets_definitions = widgets_definitions
}
