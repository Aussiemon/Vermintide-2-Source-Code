local entry_size = {
	1200,
	350
}
local slate_size = {
	1200,
	250
}
local screen_resolution = {
	1920,
	1080
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.options_menu
		},
		size = screen_resolution
	},
	screen = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "right",
		position = {
			0,
			0,
			0
		},
		size = screen_resolution
	},
	fullscreen_video = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center"
	},
	fade_area_bg = {
		vertical_alignment = "top",
		horizontal_alignment = "right",
		scale = "fit_height",
		position = {
			0,
			0,
			UILayer.options_menu
		},
		size = {
			1320,
			1080
		}
	},
	fade_area_edge = {
		vertical_alignment = "top",
		horizontal_alignment = "right",
		scale = "fit_height",
		position = {
			-1320,
			0,
			UILayer.options_menu
		},
		size = {
			600,
			1080
		}
	},
	fade_area_edge_hotspot = {
		vertical_alignment = "top",
		parent = "fade_area_edge",
		horizontal_alignment = "right",
		position = {
			-175,
			0,
			UILayer.options_menu
		},
		size = {
			5000,
			1080
		}
	},
	screen_anchor = {
		parent = "screen"
	},
	canvas = {
		vertical_alignment = "top",
		parent = "screen_anchor",
		horizontal_alignment = "left",
		position = {
			600,
			-180,
			10
		},
		size = {
			entry_size[1],
			700
		}
	},
	video_area = {
		parent = "canvas",
		position = {
			-10,
			-50,
			0
		},
		size = {
			entry_size[1] + 20,
			700
		}
	},
	video_area_top = {
		vertical_alignment = "top",
		parent = "video_area",
		position = {
			0,
			50,
			0
		},
		size = {
			entry_size[1] + 20,
			50
		}
	},
	video_area_bottom = {
		vertical_alignment = "bottom",
		parent = "video_area",
		position = {
			0,
			-50,
			0
		},
		size = {
			entry_size[1] + 20,
			50
		}
	},
	scrollbar = {
		vertical_alignment = "center",
		parent = "video_area",
		horizontal_alignment = "right",
		position = {
			50,
			0,
			0
		},
		size = {
			13,
			700
		}
	},
	anchor_start = {
		vertical_alignment = "top",
		parent = "canvas",
		horizontal_alignment = "left",
		position = {
			0,
			-91,
			0
		},
		size = slate_size
	},
	anchor_point = {
		parent = "anchor_start"
	}
}
local title_text_style = {
	word_wrap = false,
	upper_case = true,
	localize = true,
	font_size = 56,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		60,
		1
	}
}
local title_text_style_shadow = {
	word_wrap = false,
	upper_case = true,
	localize = true,
	font_size = 56,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = {
		255,
		0,
		0,
		0
	},
	offset = {
		2,
		58,
		0
	}
}

local function create_video_area()
	local definition = {
		scenegraph_id = "video_area",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					pass_type = "texture",
					texture_id = "mask"
				}
			}
		},
		content = {
			mask = "mask_rect",
			hotspot = {}
		},
		style = {}
	}

	return definition
end

local function create_scrollbar(num_elements)
	local area_length = scenegraph_definition.video_area.size[2]
	local list_length = num_elements * entry_size[2]
	local disable = area_length >= list_length
	local scroller_percentage = area_length / list_length
	local definition = {
		scenegraph_id = "scrollbar",
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot",
					content_change_function = function (content, style)
						local parent_content = content.parent
						local scroller_hotspot = parent_content.scroller_hotspot

						if scroller_hotspot.selected then
							parent_content.scrollbar_hover_progress = 0

							return
						end

						local is_hover = content.is_hover
						local t, dt = Managers.time:time_and_delta("main")
						local speed = 4
						local scrollbar_hover_progress = parent_content.scrollbar_hover_progress or 0
						scrollbar_hover_progress = math.clamp(scrollbar_hover_progress + dt * speed * (is_hover and 1 or -1), 0, 1)
						parent_content.scrollbar_hover_progress = scrollbar_hover_progress
					end
				},
				{
					style_id = "scroller",
					pass_type = "hotspot",
					content_id = "scroller_hotspot",
					content_change_function = function (content, style)
						local parent_content = content.parent
						local is_hover = content.is_hover or content.selected
						local t, dt = Managers.time:time_and_delta("main")
						local speed = 4
						local hover_progress = parent_content.hover_progress or 0
						hover_progress = math.clamp(hover_progress + dt * speed * (is_hover and 1 or -1), 0, 1)
						parent_content.hover_progress = hover_progress
					end
				},
				{
					style_id = "scrollbar_bg",
					pass_type = "rounded_background",
					content_change_function = function (content, style)
						local t = math.easeOutCubic(content.scrollbar_hover_progress)
						style.color[2] = math.lerp(30, 60, t)
						style.color[3] = math.lerp(30, 60, t)
						style.color[4] = math.lerp(30, 60, t)
					end
				},
				{
					pass_type = "rounded_background",
					style_id = "scrollbar_fg"
				},
				{
					style_id = "scroller",
					pass_type = "rounded_background",
					content_change_function = function (content, style)
						local hotspot = content.scroller_hotspot
						local t = math.easeOutCubic(content.hover_progress)
						style.color[2] = math.lerp(30, 128, t)
						style.color[3] = math.lerp(30, 128, t)
						style.color[4] = math.lerp(30, 128, t)
					end
				}
			}
		},
		content = {
			mask = "mask_rect",
			hotspot = {},
			scroller_hotspot = {},
			num_elements = num_elements
		},
		style = {
			scrollbar_bg = {
				corner_radius = 6,
				color = {
					255,
					30,
					30,
					30
				}
			},
			scrollbar_fg = {
				corner_radius = 6,
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					1,
					1,
					1
				},
				size = {
					scenegraph_definition.scrollbar.size[1] - 2,
					scenegraph_definition.scrollbar.size[2] - 2
				}
			},
			scroller = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				corner_radius = 6,
				color = {
					255,
					30,
					30,
					30
				},
				offset = {
					1,
					0,
					2
				},
				rect_size = {
					scenegraph_definition.scrollbar.size[1] - 2,
					(scenegraph_definition.scrollbar.size[2] - 2) * scroller_percentage
				},
				area_size = {
					scenegraph_definition.scrollbar.size[1] - 2,
					(scenegraph_definition.scrollbar.size[2] - 2) * scroller_percentage
				}
			}
		}
	}

	return definition
end

local widget_definitions = {
	fade_edge = UIWidgets.create_simple_texture("horizontal_gradient", "fade_area_edge", nil, nil, {
		235,
		0,
		0,
		0
	}),
	fade_edge_hotspot = UIWidgets.create_simple_hotspot("fade_area_edge_hotspot"),
	fade_background = UIWidgets.create_simple_rect("fade_area_bg", {
		235,
		0,
		0,
		0
	}),
	title_text = UIWidgets.create_simple_text("start_menu_cinematics", "canvas", nil, nil, title_text_style),
	title_text_shadow = UIWidgets.create_simple_text("start_menu_cinematics", "canvas", nil, nil, title_text_style_shadow),
	video_area = create_video_area(),
	video_area_top = UIWidgets.create_simple_texture("vertical_gradient_write_mask", "video_area_top"),
	video_area_bottom = UIWidgets.create_simple_uv_texture("vertical_gradient_write_mask", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "video_area_bottom")
}

local function create_cinematic_entry(renderer, config, index, seen, parent)
	local header = config.header
	local description = config.description
	local time = config.time
	local release_date = config.release_date
	local seen = seen
	local video_data = config.video_data
	local resource = video_data.resource
	local thumbnail = config.thumbnail
	local reference_name = config.header .. " " .. Application.guid()
	local set_loop = false

	if not renderer.video_players[reference_name] then
		if video_data.set_loop ~= nil then
			set_loop = video_data.set_loop
		end

		UIRenderer.create_video_player(renderer, reference_name, renderer.world, resource, set_loop)
	end

	local video_player = renderer.video_players[reference_name]
	local num_frames = VideoPlayer.number_of_frames(video_player)
	local seconds = num_frames / (video_data.frames_per_second or 30)
	local time = UIUtils.format_time(seconds)

	UIRenderer.destroy_video_player(renderer, reference_name, renderer.world)

	local definition = {
		scenegraph_id = "anchor_point",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "bg_background_top",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "bg_background_bottom",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "bg_background_left",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "bg_background_right",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "fg_background",
					texture_id = "rect_masked"
				},
				{
					style_id = "header",
					pass_type = "text",
					text_id = "header"
				},
				{
					style_id = "header_shadow",
					pass_type = "text",
					text_id = "header"
				},
				{
					pass_type = "texture",
					style_id = "divider",
					texture_id = "rect_masked"
				},
				{
					style_id = "play_icon",
					texture_id = "play_icon",
					pass_type = "texture",
					content_check_function = function (content, style)
						return not parent:is_video_active(content.video_content.video_player_reference)
					end,
					content_change_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad") or Managers.input:is_device_active("keyboard")

						if gamepad_active then
							if index == parent:current_gamepad_selection() then
								style.color[1] = 255
							else
								style.color[1] = 63
							end
						else
							local hover_progress = content.hover_progress
							local alpha_value = math.easeOutCubic(hover_progress)
							style.color[1] = 63 + 192 * alpha_value
						end
					end
				},
				{
					style_id = "description",
					pass_type = "text",
					text_id = "description"
				},
				{
					style_id = "time",
					pass_type = "text",
					text_id = "time"
				},
				{
					style_id = "release_date",
					pass_type = "text",
					text_id = "release_date"
				},
				{
					style_id = "hotspot",
					pass_type = "hotspot",
					content_id = "hotspot",
					content_check_function = function (content, style)
						local parent_content = content.parent

						return not parent:is_video_active(parent_content.reference_name)
					end,
					content_change_function = function (content, style)
						local parent_content = content.parent

						if content.on_pressed then
							local video_content = parent_content.video_content

							parent:activate_video(video_content, index)
						elseif content.on_hover_enter then
							parent:_play_sound("play_gui_start_menu_button_hover")
						end

						local t, dt = Managers.time:time_and_delta("main")
						local speed = 4
						local hover_progress = parent_content.hover_progress
						hover_progress = math.clamp(hover_progress + dt * speed * (content.is_hover and 1 or -1), 0, 1)
						parent_content.hover_progress = hover_progress
					end
				},
				{
					scenegraph_id = "fullscreen_video",
					style_id = "video_style",
					pass_type = "video",
					content_id = "video_content",
					content_check_function = function (content, style)
						return parent:is_video_active(content.video_player_reference)
					end
				},
				{
					style_id = "video_fade",
					pass_type = "rect",
					scenegraph_id = "fullscreen_video",
					content_check_function = function (content, style)
						local active = parent:is_video_active(content.reference_name)
						content.fade_progress = active and content.fade_progress or 0

						return active
					end,
					content_change_function = function (content, style)
						local fade_progress = content.fade_progress
						local alpha = math.easeInCubic(fade_progress)
						style.color[1] = (1 - alpha) * 255
						local t, dt = Managers.time:time_and_delta("main")
						content.fade_progress = math.min(fade_progress + dt * 0.5, 1)
					end
				},
				{
					scenegraph_id = "root",
					style_id = "video_background",
					pass_type = "rect",
					content_check_function = function (content)
						if not parent:is_video_active(content.reference_name) then
							return false
						end

						local w, h = Gui.resolution()
						local aspect_ratio = w / h
						local default_aspect_ratio = 1.7777777777777777
						local height = h
						local width = w

						if math.abs(aspect_ratio - default_aspect_ratio) > 0.005 then
							return true
						end
					end
				},
				{
					pass_type = "texture",
					style_id = "bg_video_left",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "bg_video_right",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "bg_video_top",
					texture_id = "rect_masked"
				},
				{
					pass_type = "texture",
					style_id = "bg_video_bottom",
					texture_id = "rect_masked"
				},
				{
					style_id = "thumbnail",
					texture_id = "thumbnail",
					pass_type = "texture",
					content_check_function = function (content)
						return content.thumbnail
					end,
					content_change_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad") or Managers.input:is_device_active("keyboard")

						if gamepad_active then
							if index == parent:current_gamepad_selection() then
								style.color[1] = 255
							else
								style.color[1] = 63
							end
						else
							local hover_progress = content.hover_progress
							local alpha_value = math.easeOutCubic(hover_progress)
							style.color[1] = 127 + 128 * alpha_value
						end
					end
				}
			}
		},
		content = {
			fade_progress = 0,
			hover_progress = 0,
			rect_masked = "rect_masked",
			play_icon = "play_icon_masked",
			hotspot = {},
			fullscreen_hotspot = {},
			header = header,
			description = description,
			time = time,
			release_date = release_date,
			reference_name = reference_name,
			thumbnail = thumbnail,
			video_content = {
				video_completed = false,
				material_name = "video_default",
				video_player_reference = reference_name,
				video_data = video_data
			}
		},
		style = {
			bg_background_top = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					56,
					43,
					34
				},
				offset = {
					-2,
					2,
					1
				},
				texture_size = {
					slate_size[1] + 4,
					2
				}
			},
			bg_background_bottom = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				color = {
					255,
					56,
					43,
					34
				},
				offset = {
					-2,
					-2,
					1
				},
				texture_size = {
					slate_size[1] + 4,
					2
				}
			},
			bg_background_left = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					56,
					43,
					34
				},
				offset = {
					-2,
					2,
					1
				},
				texture_size = {
					2,
					slate_size[2] + 4
				}
			},
			bg_background_right = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				color = {
					255,
					56,
					43,
					34
				},
				offset = {
					2,
					2,
					1
				},
				texture_size = {
					2,
					slate_size[2] + 4
				}
			},
			fg_background = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					2
				},
				texture_size = slate_size
			},
			header = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				font_size = 36,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header_masked",
				text_color = {
					255,
					140,
					128,
					90
				},
				offset = {
					0,
					41,
					3
				}
			},
			header_shadow = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				font_size = 36,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header_masked",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					2,
					39,
					2
				}
			},
			description = {
				word_wrap = true,
				font_type = "hell_shark_masked",
				localize = true,
				dynamic_font_size_word_wrap = true,
				font_size = 21,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					slate_size[1] * 0.62,
					slate_size[2] * 0.55
				},
				text_color = {
					255,
					118,
					118,
					118
				},
				offset = {
					slate_size[1] * 0.35,
					-10,
					3
				}
			},
			time = {
				vertical_alignment = "bottom",
				font_size = 26,
				localize = false,
				horizontal_alignment = "left",
				word_wrap = false,
				font_type = "hell_shark_header_masked",
				text_color = {
					255,
					118,
					118,
					118
				},
				offset = {
					slate_size[1] * 0.35,
					35,
					3
				}
			},
			release_date = {
				vertical_alignment = "bottom",
				font_size = 26,
				localize = false,
				horizontal_alignment = "left",
				word_wrap = false,
				font_type = "hell_shark_header_masked",
				text_color = {
					255,
					118,
					118,
					118
				},
				offset = {
					slate_size[1] * 0.35,
					5,
					3
				}
			},
			divider = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					entry_size[1] * 0.63,
					2
				},
				offset = {
					slate_size[1] * 0.35,
					-35,
					3
				},
				color = {
					255,
					118,
					118,
					118
				}
			},
			video_style = {
				color = {
					255,
					255,
					255,
					255
				},
				size = {
					1920,
					1080
				},
				offset = {
					0,
					0,
					100
				}
			},
			video_fade = {
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					101
				}
			},
			video_background = {
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					99
				}
			},
			hotspot = {
				size = {
					393.59999999999997,
					221.39999999999998
				},
				offset = {
					10,
					13,
					13
				}
			},
			play_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					76,
					76
				},
				offset = {
					168.79999999999998,
					0,
					14
				}
			},
			bg_video_left = {
				color = {
					255,
					118,
					118,
					118
				},
				texture_size = {
					2,
					225.39999999999998
				},
				offset = {
					8,
					11,
					10
				}
			},
			bg_video_right = {
				color = {
					255,
					118,
					118,
					118
				},
				texture_size = {
					2,
					225.39999999999998
				},
				offset = {
					403.59999999999997,
					11,
					10
				}
			},
			bg_video_top = {
				color = {
					255,
					118,
					118,
					118
				},
				texture_size = {
					397.59999999999997,
					2
				},
				offset = {
					8,
					236.39999999999998,
					10
				}
			},
			bg_video_bottom = {
				color = {
					255,
					118,
					118,
					118
				},
				texture_size = {
					397.59999999999997,
					2
				},
				offset = {
					8,
					11,
					10
				}
			},
			thumbnail = {
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					393.59999999999997,
					221.39999999999998
				},
				offset = {
					10,
					13,
					11
				}
			}
		},
		offset = {
			0,
			-(index - 1) * entry_size[2],
			0
		}
	}

	return definition
end

local animation_definitions = {
	on_enter = {
		{
			name = "slide_and_fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition_data, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition_data, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				ui_scenegraph.screen_anchor.local_position[1] = math.lerp(1920, 0, anim_progress)
				ui_scenegraph.fade_area_bg.local_position[1] = math.lerp(1920 + scenegraph_definition.fade_area_bg.position[1], scenegraph_definition.fade_area_bg.position[1], anim_progress)
				ui_scenegraph.fade_area_edge.local_position[1] = math.lerp(1920 + scenegraph_definition.fade_area_edge.position[1], scenegraph_definition.fade_area_edge.position[1], anim_progress)
				params.render_settings.alpha_multiplier = anim_progress * anim_progress * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition_data, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end
		}
	},
	on_exit = {
		{
			name = "slide_and_fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition_data, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition_data, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				ui_scenegraph.screen_anchor.local_position[1] = math.lerp(0, 1920, anim_progress)
				ui_scenegraph.fade_area_bg.local_position[1] = math.lerp(scenegraph_definition.fade_area_bg.position[1], 1920 + scenegraph_definition.fade_area_bg.position[1], anim_progress)
				ui_scenegraph.fade_area_edge.local_position[1] = math.lerp(scenegraph_definition.fade_area_edge.position[1], 1920 + scenegraph_definition.fade_area_edge.position[1], anim_progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress * anim_progress * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition_data, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end
		}
	}
}
local generic_input_actions = {
	default = {
		{
			input_action = "d_vertical",
			priority = 1,
			description_text = "input_description_navigate",
			ignore_keybinding = true
		},
		{
			input_action = "confirm",
			priority = 2,
			description_text = "input_description_play"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_back"
		}
	}
}

return {
	create_cinematic_entry = create_cinematic_entry,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	entry_size = entry_size,
	create_scrollbar = create_scrollbar,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions
}
