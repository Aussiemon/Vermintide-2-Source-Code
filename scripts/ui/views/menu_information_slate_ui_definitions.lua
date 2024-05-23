-- chunkname: @scripts/ui/views/menu_information_slate_ui_definitions.lua

local panel_scroll_area = 590
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default + 1,
		},
	},
	area = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	panel = {
		horizontal_alignment = "right",
		parent = "area",
		vertical_alignment = "top",
		size = {
			475,
			800,
		},
		position = {
			-50,
			-50,
			0,
		},
	},
	top_panel = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			475,
			210,
		},
		position = {
			0,
			0,
			0,
		},
	},
	panel_mask = {
		horizontal_alignment = "right",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			475,
			0,
		},
		position = {
			0,
			-210,
			0,
		},
	},
	top_banner = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			475,
			3,
		},
		position = {
			0,
			0,
			1,
		},
	},
	dot = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		size = {
			44,
			44,
		},
		position = {
			10,
			-20,
			1,
		},
	},
	alert_name = {
		horizontal_alignment = "right",
		parent = "dot",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			0,
			28,
		},
	},
	header = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		position = {
			20,
			-55,
			1,
		},
		size = {
			0,
			0,
		},
	},
	sub_header = {
		horizontal_alignment = "left",
		parent = "header",
		vertical_alignment = "top",
		position = {
			0,
			-50,
			0,
		},
		size = {
			0,
			25,
		},
	},
	information = {
		horizontal_alignment = "left",
		parent = "top_panel",
		vertical_alignment = "bottom",
		position = {
			20,
			50,
			1,
		},
		size = {
			0,
			0,
		},
	},
	triangle = {
		horizontal_alignment = "left",
		parent = "top_panel",
		vertical_alignment = "bottom",
		position = {
			180,
			33,
			1,
		},
		size = {
			0,
			0,
		},
	},
	body = {
		horizontal_alignment = "left",
		parent = "top_panel",
		vertical_alignment = "top",
		position = {
			20,
			-210,
			1,
		},
		size = {
			425,
			0,
		},
	},
	body_anchor = {
		parent = "body",
	},
	scrollbar_anchor = {
		horizontal_alignment = "left",
		parent = "top_panel",
		vertical_alignment = "top",
		position = {
			20,
			-210,
			1,
		},
		size = {
			435,
			550,
		},
	},
	scrolbar_window = {
		parent = "scrollbar_anchor",
		size = {
			435,
			550,
		},
	},
}
local alert_name_text_style = {
	font_size = 25,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	vertical_alignment = "top",
	text_color = {
		255,
		164,
		164,
		164,
	},
	offset = {
		0,
		0,
		0,
	},
}
local header_text_style = {
	font_size = 56,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	vertical_alignment = "top",
	text_color = {
		255,
		192,
		192,
		192,
	},
	offset = {
		0,
		0,
		0,
	},
}
local sub_header_text_style = {
	font_size = 25,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	vertical_alignment = "top",
	text_color = {
		255,
		192,
		192,
		192,
	},
	offset = {
		0,
		0,
		0,
	},
}
local info_text_style = {
	font_size = 25,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	vertical_alignment = "top",
	text_color = {
		255,
		128,
		128,
		128,
	},
	base_color = {
		255,
		128,
		128,
		128,
	},
	hover_color = {
		255,
		255,
		255,
		255,
	},
	offset = {
		0,
		0,
		0,
	},
}
local body_text_style = {
	font_size = 25,
	font_type = "hell_shark_masked",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		255,
		255,
		255,
	},
	offset = {
		0,
		0,
		0,
	},
}
local body_parsing_data = {
	text = {
		spacing = 25,
		default_text_style = body_text_style,
	},
	image = {
		spacing = 25,
	},
}

function create_hotspot_text(text, scenegraph_id, text_style)
	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_change_function = function (content, style)
						local is_hover = content.hotspot.is_hover

						if is_hover then
							style.text_color = style.hover_color
						else
							style.text_color = style.base_color
						end
					end,
				},
			},
		},
		content = {
			hotspot = {},
			text = text,
		},
		style = {
			text = text_style,
			hotspot = {
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				area_size = {
					435,
					60,
				},
				offset = {
					0,
					-50,
					0,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

function create_gamepad_input(scenegraph_id, color)
	local definition = {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "xb_input",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")
						local use_ps4_input_icons = UISettings.use_ps4_input_icons
						local input_device = Managers.input:get_most_recent_device()
						local device_type = input_device.type()
						local is_ps_pad = device_type == "sce_pad"

						use_ps4_input_icons = is_ps_pad or use_ps4_input_icons

						return gamepad_active and not use_ps4_input_icons
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "ps_input",
					content_check_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")
						local use_ps4_input_icons = UISettings.use_ps4_input_icons
						local input_device = Managers.input:get_most_recent_device()
						local device_type = input_device.type()
						local is_ps_pad = device_type == "sce_pad"

						use_ps4_input_icons = is_ps_pad or use_ps4_input_icons

						return gamepad_active and use_ps4_input_icons
					end,
				},
			},
		},
		content = {
			xb_input = IS_CONSOLE and "xbone_button_icon_menu_large" or "xbone_button_icon_x",
			ps_input = IS_CONSOLE and "ps4_button_icon_options" or "ps4_button_icon_square",
		},
		style = {
			texture_id = {
				texture_size = {
					34,
					34,
				},
				color = color or {
					255,
					255,
					255,
					255,
				},
				offset = {
					-12,
					-17,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}

	return definition
end

local disable_with_gamepad = true
local widgets = {
	panel = UIWidgets.create_simple_rect("panel", {
		192,
		0,
		0,
		0,
	}, nil, nil, scenegraph_definition.top_panel.size),
	panel_mask = UIWidgets.create_simple_texture("mask_rect", "panel_mask", nil, nil, {
		255,
		255,
		255,
		255,
	}),
	top_banner = UIWidgets.create_simple_rect("top_banner", {
		255,
		255,
		255,
		255,
	}, 0, {
		0,
		0,
		0,
	}),
	dot_glow = UIWidgets.create_simple_texture("dot_glow", "dot", nil, nil, {
		255,
		255,
		255,
		255,
	}),
	dot = UIWidgets.create_simple_texture("dot", "dot", nil, nil, {
		255,
		255,
		255,
		255,
	}, {
		0,
		0,
		10,
	}),
	alert_name = UIWidgets.create_simple_text("ALERT NAME", "alert_name", 25, {
		255,
		255,
		255,
		255,
	}, alert_name_text_style),
	header = UIWidgets.create_simple_text("Header", "header", 25, {
		255,
		255,
		255,
		255,
	}, header_text_style),
	sub_header = UIWidgets.create_simple_text("Sub Header", "sub_header", 25, {
		255,
		255,
		255,
		255,
	}, sub_header_text_style),
	more_information = create_hotspot_text(Managers.localizer:exists("info_slate_more_information") and Localize("info_slate_more_information") or "More Information", "information", info_text_style),
	less_information = create_hotspot_text(Managers.localizer:exists("info_slate_less_information") and Localize("info_slate_less_information") or "Less Information", "information", info_text_style),
	triangle_right = UIWidgets.create_simple_triangle("triangle", {
		255,
		255,
		255,
		255,
	}, "right", {
		10,
		10,
	}, disable_with_gamepad),
	triangle_down = UIWidgets.create_simple_triangle("triangle", {
		255,
		255,
		255,
		255,
	}, "down", {
		10,
		10,
	}, disable_with_gamepad),
	input = create_gamepad_input("triangle", {
		255,
		255,
		255,
		255,
	}),
}
local animation_definitions = {
	animate_in = {
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				ui_scenegraph.panel.position[1] = 200
				widgets.more_information.content.visible = true
				widgets.less_information.content.visible = false
				widgets.triangle_right.content.visible = true
				widgets.triangle_down.content.visible = false
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress * anim_progress
				ui_scenegraph.panel.position[1] = 200 - 250 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	animate_out = {
		{
			end_progress = 0.25,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
				params.render_settings.scrollbar_alpha = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress * anim_progress
				ui_scenegraph.panel.position[1] = 250 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				ui_scenegraph.panel_mask.size[2] = 0
				widgets.panel.style.rect.texture_size[2] = scenegraph_definition.top_panel.size[2]
			end,
		},
	},
	expand = {
		{
			end_progress = 0.5,
			name = "expand",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				ui_scenegraph.panel_mask.size[2] = 0
				widgets.more_information.content.visible = false
				widgets.less_information.content.visible = true
				widgets.triangle_right.content.visible = false
				widgets.triangle_down.content.visible = true
				params.render_settings.scrollbar_alpha = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				ui_scenegraph.panel_mask.size[2] = 590 * anim_progress
				widgets.panel.style.rect.texture_size[2] = math.lerp(scenegraph_definition.top_panel.size[2], scenegraph_definition.panel.size[2], anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.75,
			name = "fade_scrollbar",
			start_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.scrollbar_alpha = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	collapse = {
		{
			end_progress = 0.5,
			name = "collapse",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				ui_scenegraph.panel_mask.size[2] = 590
				widgets.more_information.content.visible = true
				widgets.less_information.content.visible = false
				widgets.triangle_right.content.visible = true
				widgets.triangle_down.content.visible = false
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				ui_scenegraph.panel_mask.size[2] = 590 * (1 - anim_progress)
				widgets.panel.style.rect.texture_size[2] = math.lerp(scenegraph_definition.panel.size[2], scenegraph_definition.top_panel.size[2], anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widget_definitions = widgets,
	body_parsing_data = body_parsing_data,
	animation_definitions = animation_definitions,
	scenegraph_definition = scenegraph_definition,
	panel_scroll_area = panel_scroll_area,
}
