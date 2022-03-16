local SIZE_X = 1920
local SIZE_Y = 1080
local content_margin = 50
local window_w = 1200
local content_w = window_w - content_margin * 2
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.item_display_popup
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			window_w,
			650
		}
	},
	video = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			100,
			0
		},
		size = {
			640,
			360
		}
	},
	expanded_video = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			200
		},
		size = {
			1920,
			1080
		}
	},
	window_top_detail = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			30
		},
		size = {
			45,
			12
		}
	},
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			-30,
			1
		},
		size = {
			content_w,
			60
		}
	},
	sub_title = {
		vertical_alignment = "top",
		parent = "title",
		horizontal_alignment = "center",
		position = {
			0,
			-40,
			0
		},
		size = {
			content_w,
			50
		}
	},
	body = {
		vertical_alignment = "top",
		parent = "sub_title",
		horizontal_alignment = "center",
		position = {
			0,
			-60,
			0
		},
		size = {
			content_w,
			380
		}
	},
	perks = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			-325,
			0
		},
		size = {
			content_w,
			380
		}
	},
	perk_list = {
		vertical_alignment = "top",
		parent = "perks",
		horizontal_alignment = "center",
		position = {
			100,
			-50,
			0
		},
		size = {
			700,
			380
		}
	},
	use_legacy = {
		vertical_alignment = "top",
		parent = "sub_title",
		horizontal_alignment = "center",
		position = {
			0,
			-20,
			0
		},
		size = {
			content_w,
			380
		}
	},
	use_legacy_option = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			70,
			0
		},
		size = {
			content_w,
			380
		}
	},
	paragraph_divider = {
		vertical_alignment = "top",
		parent = "body",
		horizontal_alignment = "center",
		position = {
			0,
			-150,
			0
		},
		size = {
			400,
			8
		}
	},
	next_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			0,
			-20,
			10
		},
		size = {
			160,
			50
		}
	},
	prev_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			-100,
			-20,
			10
		},
		size = {
			160,
			50
		}
	},
	ok_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		position = {
			100,
			-20,
			10
		},
		size = {
			160,
			50
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 64,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("orange", 255),
	offset = {
		0,
		0,
		2
	}
}
local body_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 20,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local perks_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 20,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local perk_list_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 20,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("orange", 255),
	offset = {
		0,
		0,
		2
	}
}
local use_legacy_title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 40,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local use_legacy_text_style = {
	word_wrap = true,
	upper_case = false,
	localize = false,
	use_shadow = true,
	font_size = 20,
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
local use_legacy_option_text_style = {
	word_wrap = false,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 20,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local disable_with_gamepad = true

local function create_button(scenegraph_id, size, text)
	local widget = UIWidgets.create_default_button(scenegraph_id, size, "button_detail_03_gold", "button_bg_01", text, nil, nil, "button_detail_03_gold", nil, disable_with_gamepad)
	widget.content.draw_frame = false
	local style = widget.style
	style.background.size = {
		size[1],
		size[2] - 8
	}
	style.background.offset = {
		0,
		4,
		0
	}
	style.background_fade.offset = {
		0,
		4,
		2
	}
	style.background_fade.size = {
		size[1],
		size[2] - 8
	}
	style.hover_glow.offset = {
		0,
		5,
		3
	}
	style.clicked_rect.offset = {
		0,
		4,
		7
	}
	style.clicked_rect.size = {
		size[1],
		size[2] - 8
	}
	style.glass_top.offset = {
		0,
		size[2] - 16,
		4
	}
	style.glass_bottom.offset = {
		0,
		-4,
		4
	}

	return widget
end

local function create_video_hover()
	local scenegraph_id = "video"

	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "icon",
					texture_id = "icon",
					pass_type = "texture",
					content_change_function = function (content, style)
						local increase = (content.button_hotspot.is_hover and 1) or -1
						local dt = Managers.time:mean_dt()
						local progress = style.progress
						progress = math.clamp(progress + dt * increase * 2, 0, 1)

						if increase then
							style.color[1] = math.easeOutCubic(progress) * 255
						else
							style.color[1] = math.easeInCubic(progress) * 255
						end

						style.progress = progress
					end
				}
			}
		},
		content = {
			icon = "expand_video_icon",
			button_hotspot = {}
		},
		style = {
			button_hotspot = {},
			icon = {
				vertical_alignment = "center",
				progress = 0,
				horizontal_alignment = "center",
				texture_size = {
					85,
					84
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
					1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local base_widget_definitions = {
	window_background = UIWidgets.create_tiled_texture("window", "menu_frame_bg_02", {
		1065,
		770
	}),
	window_top_detail = UIWidgets.create_simple_texture("tab_selection_01_bottom", "window_top_detail"),
	window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_12_gold", 5),
	screen_background = UIWidgets.create_simple_rect("screen", {
		150,
		0,
		0,
		0
	})
}
local page_widget_definitions = {
	title_text = UIWidgets.create_simple_text(Localize("new_ui_popup_title"), "title", nil, nil, title_text_style),
	paragraph_divider = UIWidgets.create_simple_texture("popup_divider", "paragraph_divider"),
	info_text = UIWidgets.create_simple_text(Localize("new_ui_popup_info"), "body", nil, nil, body_text_style),
	perk_text = UIWidgets.create_simple_text(Localize("new_ui_popup_perks"), "perks", nil, nil, perks_text_style),
	perk_list = UIWidgets.create_simple_text(Localize("new_ui_popup_perk_list"), "perk_list", nil, nil, perk_list_text_style),
	use_legacy_title_text = UIWidgets.create_simple_text(Localize("new_ui_popup_legacy_title"), "title", nil, nil, use_legacy_title_text_style),
	use_legacy_text = UIWidgets.create_simple_text(Localize("new_ui_popup_legacy_text"), "use_legacy", nil, nil, use_legacy_text_style),
	use_legacy_option = UIWidgets.create_simple_text(Localize("new_ui_popup_legacy_option"), "use_legacy_option", nil, nil, use_legacy_option_text_style),
	video_frame = UIWidgets.create_frame("video", scenegraph_definition.video.size, "menu_frame_12_gold", 10, {
		255,
		0,
		0,
		0
	}),
	video_hover = create_video_hover(),
	prev_button = create_button("prev_button", scenegraph_definition.prev_button.size, Localize("input_description_prev_page")),
	next_button = create_button("next_button", scenegraph_definition.next_button.size, Localize("input_description_next_page")),
	ok_button = create_button("ok_button", scenegraph_definition.ok_button.size, Localize("menu_weave_tutorial_popup_confirm_button"))
}
local page_data = {
	{
		widgets = {
			"title_text",
			"info_text",
			"paragraph_divider",
			"perk_text",
			"perk_list"
		}
	},
	{
		widgets = {
			"use_legacy_title_text",
			"use_legacy_text",
			"use_legacy_option",
			"video_frame",
			"video_hover"
		},
		video = {
			video_name = "video/ui_option",
			loop = true,
			material_name = "ui_option"
		}
	}
}
local animation_definitions = {
	transition_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				local page_data = params.page_data

				for _, widget_name in ipairs(page_data.widgets) do
					local widget = widgets[widget_name]
					local widget_content = widget.content
					widget_content.visible = false
				end
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
	page_1 = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				local page_data = params.page_data

				for _, widget_name in ipairs(page_data.widgets) do
					local widget = widgets[widget_name]
					local widget_content = widget.content
					widget_content.visible = false
				end

				widgets.next_button.content.visible = false
				widgets.prev_button.content.visible = false
				widgets.ok_button.content.visible = false
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.title_text
				widget.content.visible = true
			end
		},
		{
			name = "header",
			start_progress = 0.5,
			end_progress = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.title_text
				widget.style.text.text_color[1] = anim_progress * 255
				widget.style.text_shadow.text_color[1] = anim_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.info_text
				widget.content.visible = true
				local widget = widgets.paragraph_divider
				widget.content.visible = true
			end
		},
		{
			name = "info",
			start_progress = 0.8,
			end_progress = 2.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.info_text
				widget.style.text.text_color[1] = anim_progress * 255
				widget.style.text_shadow.text_color[1] = anim_progress * 255
				local widget = widgets.paragraph_divider
				widget.style.texture_id.color[1] = anim_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "perks",
			start_progress = 3.5,
			end_progress = 4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.perk_text
				widget.content.visible = true
				widget.style.text.text_color[1] = anim_progress * 255
				widget.style.text_shadow.text_color[1] = anim_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.perk_list
				widget.content.visible = true
			end
		},
		{
			name = "perk_list",
			start_progress = 4,
			end_progress = 5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.perk_list
				widget.style.text.text_color[1] = anim_progress * 255
				widget.style.text_shadow.text_color[1] = anim_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.next_button.content.visible = true
			end
		}
	},
	page_2 = {
		{
			name = "header",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local page_data = params.page_data

				for _, widget_name in ipairs(page_data.widgets) do
					local widget = widgets[widget_name]
					local widget_content = widget.content
					widget_content.visible = false
				end

				widgets.prev_button.content.visible = false
				widgets.ok_button.content.visible = false
				local video_widget = params.video_widget
				video_widget.content.visible = false
				local widget = widgets.use_legacy_title_text
				widget.content.visible = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.use_legacy_title_text
				widget.style.text.text_color[1] = anim_progress * 255
				widget.style.text_shadow.text_color[1] = anim_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.use_legacy_text
				widget.content.visible = true
			end
		},
		{
			name = "info",
			start_progress = 0.5,
			end_progress = 1.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.use_legacy_text
				widget.style.text.text_color[1] = anim_progress * 255
				widget.style.text_shadow.text_color[1] = anim_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.use_legacy_option
				widget.content.visible = true
				local widget = widgets.video_frame
				widget.content.visible = true
				local widget = widgets.video_hover
				widget.content.visible = true
				local video_widget = params.video_widget
				video_widget.content.visible = true
			end
		},
		{
			name = "video",
			start_progress = 1.8,
			end_progress = 3.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.video_frame
				widget.style.frame.color[1] = anim_progress * 255
				local widget = widgets.use_legacy_option
				widget.style.text.text_color[1] = anim_progress * 255
				widget.style.text_shadow.text_color[1] = anim_progress * 255
				local video_widget = params.video_widget
				video_widget.style.video_style.color[1] = anim_progress * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.prev_button.content.visible = true
				widgets.ok_button.content.visible = true
			end
		}
	}
}
local generic_input_actions = {
	default = {
		{
			input_action = "confirm",
			priority = 2,
			description_text = "button_ok"
		}
	}
}

return {
	create_video = create_video,
	page_data = page_data,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	base_widget_definitions = base_widget_definitions,
	page_widget_definitions = page_widget_definitions,
	animation_definitions = animation_definitions
}
