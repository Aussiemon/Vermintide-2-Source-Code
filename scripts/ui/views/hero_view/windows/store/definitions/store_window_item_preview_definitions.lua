local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
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
	background = {
		scale = "fit_height",
		horizontal_alignment = "right",
		size = {
			960,
			1080
		},
		position = {
			0,
			0,
			UILayer.default + 100
		}
	},
	pivot = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "right",
		size = {
			960,
			740
		},
		position = {
			0,
			-190,
			0
		}
	},
	viewport = {
		vertical_alignment = "bottom",
		parent = "pivot",
		horizontal_alignment = "right",
		size = {
			960,
			732
		},
		position = {
			0,
			0,
			1
		}
	},
	video_window = {
		vertical_alignment = "bottom",
		parent = "pivot",
		horizontal_alignment = "center",
		size = {
			860,
			200
		},
		position = {
			0,
			40,
			0
		}
	},
	video = {
		vertical_alignment = "center",
		parent = "video_window",
		horizontal_alignment = "left",
		size = {
			256,
			160
		},
		position = {
			20,
			0,
			2
		}
	},
	dlc_lore_root = {
		vertical_alignment = "top",
		parent = "video",
		horizontal_alignment = "left",
		size = {
			500,
			200
		},
		position = {
			276,
			0,
			0
		}
	},
	dlc_lore_title = {
		vertical_alignment = "top",
		parent = "dlc_lore_root",
		horizontal_alignment = "left",
		size = {
			500,
			30
		},
		position = {
			0,
			0,
			0
		}
	},
	dlc_lore_description = {
		vertical_alignment = "top",
		parent = "dlc_lore_title",
		horizontal_alignment = "left",
		size = {
			500,
			120
		},
		position = {
			0,
			-40,
			0
		}
	},
	dlc_lore_scrollbar = {
		vertical_alignment = "top",
		parent = "video_window",
		horizontal_alignment = "right",
		size = {
			16,
			180
		},
		position = {
			-30,
			-10,
			9
		}
	},
	dlc_entry_mask = {
		vertical_alignment = "bottom",
		parent = "video_window",
		horizontal_alignment = "left",
		size = {
			860,
			360
		},
		position = {
			0,
			260,
			0
		}
	},
	dlc_entry_root = {
		vertical_alignment = "center",
		parent = "dlc_entry_mask",
		horizontal_alignment = "left",
		size = {
			286,
			360
		},
		position = {
			0,
			0,
			0
		}
	},
	entry_scrollbar = {
		vertical_alignment = "bottom",
		parent = "dlc_entry_mask",
		horizontal_alignment = "center",
		size = {
			600,
			16
		},
		position = {
			0,
			-38,
			0
		}
	},
	entry_scrollbar_detail_left = {
		vertical_alignment = "center",
		parent = "entry_scrollbar",
		horizontal_alignment = "left",
		size = {
			26,
			28
		},
		position = {
			-23,
			0,
			1
		}
	},
	entry_scrollbar_detail_right = {
		vertical_alignment = "center",
		parent = "entry_scrollbar",
		horizontal_alignment = "right",
		size = {
			26,
			28
		},
		position = {
			23,
			0,
			1
		}
	},
	loading_icon = {
		vertical_alignment = "center",
		parent = "viewport",
		horizontal_alignment = "center",
		size = {
			150,
			150
		},
		position = {
			0,
			0,
			10
		}
	},
	unlock_button = {
		vertical_alignment = "bottom",
		parent = "viewport",
		horizontal_alignment = "center",
		size = {
			460,
			68
		},
		position = {
			0,
			-37,
			15
		}
	},
	unlock_button_edge = {
		vertical_alignment = "bottom",
		parent = "viewport",
		horizontal_alignment = "center",
		size = {
			826,
			97
		},
		position = {
			0,
			-45,
			0
		}
	},
	unlock_button_edge_left = {
		vertical_alignment = "center",
		parent = "unlock_button_edge",
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
	unlock_button_edge_right = {
		vertical_alignment = "center",
		parent = "unlock_button_edge",
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
	title_text = {
		vertical_alignment = "bottom",
		parent = "pivot",
		horizontal_alignment = "right",
		size = {
			700,
			60
		},
		position = {
			-190,
			735,
			8
		}
	},
	sub_title_text = {
		vertical_alignment = "bottom",
		parent = "title_text",
		horizontal_alignment = "center",
		size = {
			700,
			30
		},
		position = {
			0,
			-40,
			1
		}
	},
	details_button_bg = {
		vertical_alignment = "bottom",
		parent = "pivot",
		horizontal_alignment = "right",
		size = {
			146,
			141
		},
		position = {
			-20,
			664,
			1
		}
	},
	details_button = {
		vertical_alignment = "center",
		parent = "details_button_bg",
		horizontal_alignment = "center",
		size = {
			89,
			93
		},
		position = {
			0,
			0,
			1
		}
	},
	title_edge = {
		vertical_alignment = "center",
		parent = "details_button_bg",
		horizontal_alignment = "right",
		size = {
			700,
			97
		},
		position = {
			-146,
			-8,
			1
		}
	},
	title_edge_detail = {
		vertical_alignment = "center",
		parent = "title_edge",
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
	details_disabled = {
		vertical_alignment = "center",
		parent = "details_button_bg",
		horizontal_alignment = "center",
		size = {
			93,
			93
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
local sub_title_text_style = {
	word_wrap = false,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local dlc_lore_title_style = {
	word_wrap = false,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 28,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = false,
	font_type = "hell_shark_header_masked",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local dlc_lore_description_style = {
	font_size = 24,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_header_masked",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local loading_widgets = {
	loading_icon = {
		scenegraph_id = "loading_icon",
		element = {
			passes = {
				{
					style_id = "texture_id",
					pass_type = "rotated_texture",
					texture_id = "texture_id",
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0
						progress = (progress + dt) % 1
						local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * math.pi * 2
						style.angle = angle
						style.progress = progress
					end
				}
			}
		},
		content = {
			texture_id = "loot_loading"
		},
		style = {
			texture_id = {
				angle = 0,
				pivot = {
					75,
					75
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

local function create_dlc_entry_definition(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture"
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
				}
			}
		},
		content = {
			title_text = "n/a",
			background = "rect_masked",
			description_text = "n/a",
			size = size
		},
		style = {
			background = {
				masked = true,
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
			title_text = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 32,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_header_masked",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					30,
					size[2] - 170,
					2
				},
				size = {
					size[1] - 60,
					40
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = true,
				localize = false,
				font_size = 32,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_header_masked",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					32,
					size[2] - 170 - 2,
					1
				},
				size = {
					size[1] - 60,
					40
				}
			},
			description_text = {
				word_wrap = true,
				horizontal_alignment = "left",
				localize = false,
				font_size = 18,
				vertical_alignment = "top",
				font_type = "hell_shark_masked",
				text_color = {
					255,
					10,
					10,
					10
				},
				offset = {
					30,
					24,
					2
				},
				size = {
					size[1] - 60,
					165
				}
			},
			description_text_shadow = {
				word_wrap = true,
				horizontal_alignment = "left",
				localize = false,
				font_size = 18,
				vertical_alignment = "top",
				font_type = "hell_shark_masked",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					32,
					22,
					1
				},
				size = {
					size[1] - 60,
					165
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local test_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
local bottom_widgets = {}
local top_widgets = {
	title_text = UIWidgets.create_simple_text("n/a", "title_text", nil, nil, title_text_style),
	sub_title_text = UIWidgets.create_simple_text("n/a", "sub_title_text", nil, nil, sub_title_text_style),
	unlock_button = UIWidgets.create_store_purchase_button("unlock_button", scenegraph_definition.unlock_button.size, Localize("menu_store_purchase_button_unlock"), 32, disable_with_gamepad),
	unlock_button_edge = UIWidgets.create_tiled_texture("unlock_button_edge", "divider_skull_middle_down", {
		64,
		97
	}),
	unlock_button_edge_left = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			1
		},
		{
			0,
			0
		}
	}, "unlock_button_edge_left"),
	unlock_button_edge_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "unlock_button_edge_right"),
	details_button_bg = UIWidgets.create_simple_texture("button_detail_10", "details_button_bg"),
	title_edge = UIWidgets.create_tiled_texture("title_edge", "divider_skull_middle", {
		64,
		97
	}),
	title_edge_detail = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "title_edge_detail"),
	details_disabled = UIWidgets.create_simple_texture("button_detail_11", "details_disabled"),
	details_button = {
		scenegraph_id = "details_button",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "normal",
					texture_id = "normal",
					content_check_function = function (content)
						return not content.button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					style_id = "normal_glow",
					texture_id = "normal_glow",
					content_check_function = function (content)
						return not content.button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					style_id = "expanded",
					texture_id = "expanded",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					style_id = "expanded_glow",
					texture_id = "expanded_glow",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end
				}
			}
		},
		content = {
			normal_glow = "store_info_expand_on",
			expanded = "store_info_contract_off",
			expanded_glow = "store_info_contract_on",
			normal = "store_info_expand_off",
			button_hotspot = {}
		},
		style = {
			normal = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			normal_glow = {
				color = {
					0,
					255,
					255,
					255
				}
			},
			expanded = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			expanded_glow = {
				color = {
					0,
					255,
					255,
					255
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
local dlc_top_widgets = {
	dlc_lore_scroll = {
		scenegraph_id = "video_window",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					pass_type = "texture",
					texture_id = "mask"
				},
				{
					pass_type = "scroll",
					content_id = "scrollbar",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
						local axis_input = scroll_axis.y * -1
						local parent_content = ui_content.parent
						local hotspot = parent_content.hotspot

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
				}
			}
		},
		content = {
			mask = "mask_rect",
			hotspot = {},
			scrollbar = {
				scroll_amount = 0.1,
				percentage = 0.1,
				scroll_value = 0
			}
		},
		style = {},
		offset = {
			0,
			0,
			0
		}
	},
	lore_scrollbar = UIWidgets.create_chain_scrollbar("dlc_lore_scrollbar", nil, scenegraph_definition.dlc_lore_scrollbar.size, "gold"),
	dlc_lore_title = UIWidgets.create_simple_text("n/a", "dlc_lore_title", nil, nil, dlc_lore_title_style),
	dlc_lore_description = UIWidgets.create_simple_text(test_text, "dlc_lore_description", nil, nil, dlc_lore_description_style),
	video_window_frame = UIWidgets.create_frame("video_window", scenegraph_definition.video_window.size, "menu_frame_15", 10),
	video_frame = UIWidgets.create_frame("video", scenegraph_definition.video.size, "button_frame_01_gold", 10),
	video_button = {
		scenegraph_id = "video",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "icon_glow",
					texture_id = "icon_glow"
				},
				{
					pass_type = "rect",
					style_id = "background"
				}
			}
		},
		content = {
			icon = "store_button_play",
			icon_glow = "store_button_play_glow",
			button_hotspot = {}
		},
		style = {
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					154,
					154
				},
				color = {
					255,
					200,
					200,
					200
				},
				offset = {
					0,
					0,
					4
				}
			},
			icon_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					154,
					154
				},
				color = {
					150,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					3
				}
			},
			background = {
				color = {
					100,
					5,
					5,
					5
				},
				offset = {
					0,
					0,
					2
				}
			}
		},
		offset = {
			0,
			0,
			1
		}
	},
	video_fullscreen_fade = {
		scenegraph_id = "video_fullscreen_fade",
		element = {
			passes = {
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
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
}
local dlc_bottom_widgets = {
	video_window = UIWidgets.create_tiled_texture("video_window", "menu_frame_bg_03", {
		256,
		256
	}, nil, nil, {
		255,
		255,
		255,
		255
	}),
	entry_scrollbar = UIWidgets.create_horizontal_chain_scrollbar("entry_scrollbar", nil, scenegraph_definition.entry_scrollbar.size, "gold"),
	entry_scrollbar_detail_left = UIWidgets.create_simple_texture("chain_link_horizontal_01_end", "entry_scrollbar_detail_left"),
	entry_scrollbar_detail_right = UIWidgets.create_simple_texture("chain_link_horizontal_01_end", "entry_scrollbar_detail_right"),
	dlc_entry_scroll = {
		scenegraph_id = "dlc_entry_mask",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					pass_type = "texture",
					texture_id = "mask"
				},
				{
					pass_type = "texture",
					style_id = "left_mask",
					texture_id = "left_mask"
				},
				{
					style_id = "right_mask",
					pass_type = "texture_uv",
					content_id = "right_mask"
				},
				{
					pass_type = "scroll",
					content_id = "scrollbar",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
						local axis_input = scroll_axis.y * -1
						local parent_content = ui_content.parent
						local hotspot = parent_content.hotspot

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
				}
			}
		},
		content = {
			mask = "mask_rect",
			left_mask = "mask_rect_side_edge_fade",
			hotspot = {},
			scrollbar = {
				scroll_amount = 0.1,
				percentage = 0.1,
				scroll_value = 0
			},
			right_mask = {
				texture_id = "mask_rect_side_edge_fade",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			}
		},
		style = {
			mask = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					740,
					360
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			left_mask = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					60,
					360
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			right_mask = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				texture_size = {
					60,
					360
				},
				color = {
					255,
					255,
					255,
					255
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
local animation_definitions = {
	on_enter = {
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
	expand = {
		{
			name = "move",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local addition_width = 255
				local addition_height = 130
				local animated_width = math.floor(addition_width * anim_progress)
				local animated_height = math.floor(addition_height * anim_progress)
				local default_background_size = scenegraph_definition.background.size
				ui_scenegraph.background.size[1] = default_background_size[1] + animated_width
				local default_viewport_size = scenegraph_definition.viewport.size
				local default_viewport_position = scenegraph_definition.viewport.position
				ui_scenegraph.viewport.size[1] = default_viewport_size[1] + animated_width
				ui_scenegraph.viewport.size[2] = default_viewport_size[2] + animated_height
				local text_alpha = 255 - 255 * anim_progress
				local title_text = widgets.title_text
				title_text.style.text.text_color[1] = text_alpha
				title_text.style.text_shadow.text_color[1] = text_alpha
				local sub_title_text = widgets.sub_title_text
				sub_title_text.style.text.text_color[1] = text_alpha
				sub_title_text.style.text_shadow.text_color[1] = text_alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	collapse = {
		{
			name = "move",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local addition_width = 255
				local addition_height = 130
				local animated_width = math.floor(addition_width * anim_progress)
				local animated_height = math.floor(addition_height * anim_progress)
				local default_background_size = scenegraph_definition.background.size
				ui_scenegraph.background.size[1] = (default_background_size[1] + addition_width) - animated_width
				local default_viewport_size = scenegraph_definition.viewport.size
				local default_viewport_position = scenegraph_definition.viewport.position
				ui_scenegraph.viewport.size[1] = (default_viewport_size[1] + addition_width) - animated_width
				ui_scenegraph.viewport.size[2] = (default_viewport_size[2] + addition_height) - animated_height
				local text_alpha = 255 * anim_progress
				local title_text = widgets.title_text
				title_text.style.text.text_color[1] = text_alpha
				title_text.style.text_shadow.text_color[1] = text_alpha
				local sub_title_text = widgets.sub_title_text
				sub_title_text.style.text.text_color[1] = text_alpha
				sub_title_text.style.text_shadow.text_color[1] = text_alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	create_dlc_entry_definition = create_dlc_entry_definition,
	top_widgets = top_widgets,
	bottom_widgets = bottom_widgets,
	dlc_top_widgets = dlc_top_widgets,
	dlc_bottom_widgets = dlc_bottom_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	loading_widgets = loading_widgets
}
