-- chunkname: @scripts/ui/active_event/active_event_popup_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local content_margin = 50
local window_width = 600
local window_height = 900

local_require("scripts/ui/views/deus_menu/ui_widgets_deus")

local content_width = window_width - content_margin * 2
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.item_display_popup,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			0,
			2,
		},
		size = {
			window_width,
			window_height,
		},
	},
	logo = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		position = {
			0,
			-40,
			2,
		},
		size = {
			0,
			0,
		},
	},
	window_top_detail = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		position = {
			0,
			0,
			6,
		},
		size = {
			45,
			12,
		},
	},
	window_mask = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		position = {
			0,
			0,
			10,
		},
		size = {
			window_width,
			window_height,
		},
	},
	body_text = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			540,
			300,
		},
	},
	close_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		position = {
			0,
			-16,
			10,
		},
		size = {
			480,
			42,
		},
	},
	action_buttons_anchor = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		position = {
			0,
			80,
			10,
		},
		size = {
			0,
			0,
		},
	},
}
local title_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	size = {
		540,
		300,
	},
	area_size = {
		540,
		300,
	},
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local disable_with_gamepad = true
local skip_side_detail = true
local widget_definitions = {
	logo = UIWidgets.create_simple_texture("hero_view_home_logo", "logo", nil, nil, nil, {
		-234,
		-236.39999999999998,
		1,
	}, {
		468,
		236.39999999999998,
	}),
	window_mask = UIWidgets.create_simple_texture("mask_rect", "window_mask"),
	window_background = UIWidgets.create_simple_texture("icons_placeholder", "screen", true, nil, nil, nil, {
		1920,
		1080,
	}),
	background_fade = UIWidgets.create_simple_texture("event_upsell_background_fade", "window", nil, nil, {
		160,
		255,
		255,
		255,
	}),
	window_top_detail = UIWidgets.create_simple_texture("tab_selection_01_bottom", "window_top_detail"),
	window_frame = UIWidgets.create_frame("window", {
		scenegraph_definition.window.size[1] + 50,
		scenegraph_definition.window.size[2] + 50,
	}, "menu_frame_02", 5),
	screen_background = UIWidgets.create_simple_rect("screen", {
		50,
		0,
		0,
		0,
	}),
	body_text = UIWidgets.create_simple_text("not_assigned", "body_text", nil, nil, title_text_style),
	close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, nil, nil, "n/a", nil, nil, nil, 34, disable_with_gamepad, skip_side_detail),
}

function create_simple_action_button(scenegraph_id, size, button_text, frame_name, background_texture, icon_name)
	background_texture = background_texture or "menu_frame_bg_06"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.menu_frame_02
	local frame_width = frame_settings.texture_sizes.corner[1]

	local function animate_button(content, style, hotspot, dt)
		local hover_progress = hotspot.hover_progress or 0
		local press_progress = hotspot.press_progress or 1

		if style.color then
			style.color[1] = 255 * hover_progress

			if hotspot.is_hover then
				style.color[1] = 255 * press_progress
			end
		elseif style.text_color then
			style.text_color[1] = 255 * hover_progress

			if hotspot.is_hover then
				style.text_color[1] = 255 * press_progress
			end
		end
	end

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
					content_change_function = function (content, style, _, dt)
						local parent = content.parent
						local hover_progress = content.hover_progress or 0
						local hover_speed = 15

						if content.is_hover or parent.is_gamepad_active and content.is_selected then
							hover_progress = math.min(hover_progress + dt * hover_speed, 1)
						else
							hover_progress = math.max(hover_progress - dt * hover_speed, 0)
						end

						content.hover_progress = hover_progress

						local press_progress = content.press_progress or 1
						local press_speed = 25

						if content.is_held then
							press_progress = math.max(press_progress - dt * press_speed, 0.5)
						else
							press_progress = math.min(press_progress + dt * press_speed, 1)
						end

						content.press_progress = press_progress
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass_bottom",
				},
				{
					pass_type = "texture",
					style_id = "texture_hover",
					texture_id = "texture_hover",
					content_change_function = function (content, style, _, dt)
						local hotspot = content.button_hotspot

						animate_button(content, style, hotspot, dt)
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (not button_hotspot.is_selected or not button_hotspot.is_hover)
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_hovered",
					text_id = "button_text",
					content_change_function = function (content, style, _, dt)
						local hotspot = content.button_hotspot

						animate_button(content, style, hotspot, dt)
					end,
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			glass_bottom = "tabs_glass_bottom",
			glass_top = "tabs_glass_top",
			texture_hover = "button_state_default",
			button_hotspot = {
				allow_multi_hover = true,
			},
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						size[2] / background_texture_settings.size[2],
					},
				},
				texture_id = background_texture,
			},
			button_text = button_text or "n/a",
		},
		style = {
			button_hotspot = {
				size = size,
				offset = {
					0,
					0,
					1,
				},
			},
			background = {
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					0,
					0,
				},
				size = size,
				texture_size = size,
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					1,
				},
				texture_size = size,
			},
			frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				size = {
					size[1] - 4,
					size[2] - 4,
				},
				frame_margins = {
					-4,
					-4,
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					0,
					2,
					10,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			texture_hover = {
				color = {
					0,
					255,
					255,
					255,
				},
				default_color = {
					0,
					255,
					255,
					255,
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
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 3,
					5,
				},
				size = {
					size[1],
					3,
				},
			},
			glass_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					5,
				},
				size = {
					size[1],
					3,
				},
			},
			button_text = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = size,
				area_size = size,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			button_text_hovered = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = size,
				area_size = size,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					3,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
end

local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.15,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1 - math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if params.on_exit_func then
					params.on_exit_func()
				end
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_vertical",
			priority = 1,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 2,
		},
		{
			description = "button_ok",
			input_action = "back",
			priority = 3,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
	create_simple_action_button = create_simple_action_button,
}
