local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
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
	loading_overlay = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default + 100
		}
	},
	loading_detail = {
		vertical_alignment = "center",
		parent = "loading_overlay",
		horizontal_alignment = "center",
		size = {
			314,
			33
		},
		position = {
			0,
			0,
			1
		}
	},
	detailed_button = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			50,
			50
		},
		position = {
			0,
			-100,
			1
		}
	},
	detailed_list = {
		vertical_alignment = "top",
		parent = "detailed_button",
		horizontal_alignment = "right",
		size = {
			window_size[1] - 100,
			window_size[2]
		},
		position = {
			0,
			-40,
			1
		}
	}
}
local title_text_style = {
	vertical_alignment = "bottom",
	upper_case = true,
	localize = false,
	horizontal_alignment = "center",
	font_size = 42,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local adventure_title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	font_size = 36,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local reward_title_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	font_size = 32,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local description_text_style = {
	vertical_alignment = "top",
	font_size = 18,
	localize = false,
	horizontal_alignment = "center",
	word_wrap = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}

local function create_detailed_stat_widget(scenegraph_id, size, list_scenegraph_id, list_size)
	local background_texture = "menu_frame_bg_02"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local background_size = (background_texture_settings and background_texture_settings.size) or size
	local masked = true
	local num_entries = 50
	local entry_size = {
		list_size[1],
		30
	}
	local list_background_size = {
		list_size[1],
		list_size[2] + size[2]
	}
	local element = {
		passes = {
			{
				style_id = "hotspot",
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "rotated_texture",
				style_id = "drop_down_arrow",
				texture_id = "drop_down_arrow"
			},
			{
				pass_type = "tiled_texture",
				style_id = "drop_down_edge",
				texture_id = "drop_down_edge",
				content_check_function = function (content)
					return content.active
				end
			},
			{
				style_id = "title",
				pass_type = "text",
				text_id = "title",
				content_check_function = function (content)
					return content.active
				end
			},
			{
				style_id = "title_shadow",
				pass_type = "text",
				text_id = "title",
				content_check_function = function (content)
					return content.active
				end
			},
			{
				style_id = "title_rect",
				pass_type = "rect",
				content_check_function = function (content)
					return content.active
				end
			},
			{
				style_id = "scrollbar",
				pass_type = "scrollbar_hotspot",
				content_id = "scrollbar",
				content_check_function = function (content)
					return content.active
				end
			},
			{
				style_id = "scrollbar",
				pass_type = "scrollbar",
				content_id = "scrollbar",
				content_check_function = function (content)
					return content.active
				end
			},
			{
				style_id = "list_background",
				pass_type = "hotspot",
				content_id = "list_hotspot"
			},
			{
				style_id = "list_background",
				pass_type = "texture_uv",
				content_id = "list_background",
				content_check_function = function (content)
					return content.parent.active
				end
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture",
				content_check_function = function (content)
					return content.active
				end
			},
			{
				style_id = "list_background",
				pass_type = "scroll",
				content_id = "scrollbar",
				scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
					local axis_input = scroll_axis.y
					local parent_content = ui_content.parent
					local list_hotspot = parent_content.list_hotspot

					if axis_input ~= 0 and list_hotspot.is_hover then
						ui_content.axis_input = axis_input
						local scroll_start = ui_content.scroll_value
						local scroll_end = math.clamp(ui_content.scroll_value + axis_input * ui_content.scroll_amount, 0, 1)
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
				content_check_function = function (content)
					return content.active
				end,
				passes = {
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
						style_id = "value",
						pass_type = "text",
						text_id = "value"
					},
					{
						style_id = "value_shadow",
						pass_type = "text",
						text_id = "value"
					},
					{
						pass_type = "texture",
						style_id = "title_divider",
						texture_id = "title_divider",
						content_check_function = function (content)
							return content.title ~= ""
						end
					}
				}
			}
		}
	}
	local content = {
		drop_down_arrow = "drop_down_menu_arrow",
		title = "n/a",
		drop_down_edge = "menu_frame_09_divider",
		active = false,
		mask_texture = "mask_rect",
		list_hotspot = {},
		button_hotspot = {},
		list_background = {
			uvs = {
				{
					0,
					0
				},
				{
					math.min(list_background_size[1] / background_size[1], 1),
					math.min(list_background_size[2] / background_size[2], 1)
				}
			},
			texture_id = background_texture
		},
		scrollbar = {
			scroll_amount = 0.1,
			percentage = 0.1,
			scroll_value = 1
		},
		list_content = {
			active = false,
			allow_multi_hover = true
		}
	}
	local list_content = content.list_content

	for i = 1, num_entries, 1 do
		list_content[i] = {
			title_divider = "game_option_divider",
			name = "",
			value = "",
			title = "",
			button_hotspot = {}
		}
	end

	local style = {
		drop_down_edge = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
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
			},
			texture_size = {
				list_background_size[1],
				5
			},
			texture_tiling_size = {
				list_background_size[1],
				5
			}
		},
		title_rect = {
			vertical_alignment = "top",
			horizontal_alignment = "right",
			color = {
				220,
				5,
				5,
				5
			},
			offset = {
				0,
				0,
				1
			},
			texture_size = {
				list_background_size[1],
				size[2]
			}
		},
		title = {
			word_wrap = true,
			upper_case = true,
			localize = false,
			font_size = 30,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			normal_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				-(list_background_size[1] - size[1]) + 10,
				0,
				3
			},
			size = {
				list_background_size[1],
				size[2]
			}
		},
		title_shadow = {
			word_wrap = true,
			upper_case = true,
			localize = false,
			font_size = 30,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			normal_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				-(list_background_size[1] - size[1]) + 12,
				-2,
				2
			},
			size = {
				list_background_size[1],
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
		drop_down_arrow = {
			vertical_alignment = "top",
			horizontal_alignment = "right",
			angle = 0,
			texture_size = {
				31,
				15
			},
			pivot = {
				15.5,
				7.5
			},
			offset = {
				-12,
				-14,
				3
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		scrollbar = {
			hotspot_width_modifier = 5,
			min_scrollbar_height = 30,
			size = {
				4,
				list_size[2] - 20
			},
			offset = {
				size[1] - 20,
				-list_size[2] + 12,
				100
			},
			background_color = Colors.get_color_table_with_alpha("very_dark_gray", 255),
			scrollbar_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			scroll_area_size = {
				size[1],
				list_size[2]
			},
			scroll_area_offset = {
				-size[1] + 19,
				-10,
				0
			}
		},
		mask = {
			size = {
				list_size[1],
				list_size[2]
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-(list_size[1] - size[1]),
				-list_size[2],
				0
			}
		},
		list_background = {
			size = list_background_size,
			color = {
				150,
				255,
				255,
				255
			},
			offset = {
				-(list_size[1] - size[1]),
				-list_size[2],
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
				entry_size[2],
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
				-entry_size[2],
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
					1
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
					0
				}
			},
			name = {
				word_wrap = true,
				font_size = 22,
				localize = false,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				normal_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					10,
					0,
					1
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
					0
				}
			},
			value = {
				word_wrap = true,
				font_size = 22,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				normal_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-40,
					0,
					1
				}
			},
			value_shadow = {
				word_wrap = true,
				font_size = 22,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				normal_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-38,
					-2,
					0
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
					1
				}
			},
			rect = {
				size = {
					entry_size[1],
					entry_size[2]
				},
				color = {
					100,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					100
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

local loading_overlay_widgets = {
	loading_overlay = UIWidgets.create_simple_rect("loading_overlay", {
		255,
		12,
		12,
		12
	}),
	loading_overlay_loading_glow = UIWidgets.create_simple_texture("loading_title_divider", "loading_detail", nil, nil, nil, 2),
	loading_overlay_loading_frame = UIWidgets.create_simple_texture("loading_title_divider_background", "loading_detail", nil, nil, nil, 1)
}
local camera_position_by_character = {
	witch_hunter = {
		z = 0.6,
		x = 0.6,
		y = -1.3
	},
	bright_wizard = {
		z = 0.4,
		x = 0.6,
		y = -1.3
	},
	dwarf_ranger = {
		z = 0,
		x = 0.6,
		y = -1.2
	},
	wood_elf = {
		z = 0.35,
		x = 0.6,
		y = -1.3
	},
	empire_soldier = {
		z = 0.5,
		x = 0.6,
		y = -1.3
	},
	empire_soldier_tutorial = {
		z = 0.5,
		x = 0.6,
		y = -1.3
	}
}
local widgets = {
	detailed = create_detailed_stat_widget("detailed_button", scenegraph_definition.detailed_button.size, "detailed_list", scenegraph_definition.detailed_list.size)
}
local background_rect = UIWidgets.create_simple_texture("gradient_dice_game_reward", "screen", nil, nil, {
	80,
	255,
	255,
	255
})
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
	background_rect = background_rect,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	camera_position_by_character = camera_position_by_character,
	loading_overlay_widgets = loading_overlay_widgets
}
