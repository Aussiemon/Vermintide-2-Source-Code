-- chunkname: @scripts/ui/hud_ui/dark_pact_selection_ui_definitions.lua

local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.main_menu,
		},
		size = {
			1920,
			1080,
		},
	},
	pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			0,
		},
		size = {
			1920,
			1080,
		},
	},
	selection_pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			130,
			0,
		},
		size = {
			0,
			0,
		},
	},
	info_text = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			80,
			0,
		},
		size = {
			800,
			60,
		},
	},
}
local ordered_ps_names = GameModeSettings.versus.dark_pact_profile_order
local ordered_pactsworn_slots = {}

for i = 1, #ordered_ps_names do
	local name = ordered_ps_names[i]
	local profile_index = FindProfileIndex(name)
	local profile = SPProfiles[profile_index]
	local enemy_role = profile.enemy_role

	if ordered_pactsworn_slots[enemy_role] then
		local slot = ordered_pactsworn_slots[enemy_role]

		slot[#slot + 1] = name
	else
		ordered_pactsworn_slots[enemy_role] = {}

		local slot = ordered_pactsworn_slots[enemy_role]

		slot[#slot + 1] = name
	end
end

local function create_selection_widget(scenegraph_id, size)
	local frame_style = "versus_hero_selection_hero_portrait_frame"
	local frame_settings = UIFrameSettings[frame_style]
	local frame_width = frame_settings.texture_sizes.horizontal[2]
	local size = size and size or {
		110,
		130,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "profile_texture",
					texture_id = "profile_texture",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "hovered_frame",
					texture_id = "hovered_frame",
					content_check_function = function (content)
						return content.hotspot.is_hover or content.selected
					end,
				},
			},
		},
		content = {
			hovered_frame = "versus_hero_selection_frame",
			profile_texture = "icons_placeholder",
			selected = false,
			frame = frame_settings.texture,
			hotspot = {},
		},
		style = {
			profile_texture = {
				size = size,
				default_size = size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					1,
				},
				default_offset = {
					0,
					0,
					1,
				},
			},
			frame = {
				size = {
					size[1] - 2,
					size[2] - 4,
				},
				default_size = {
					size[1] - 2,
					size[2] - 4,
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				frame_margins = {
					-frame_width,
					-frame_width,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					2,
					4,
				},
				default_offset = {
					0,
					2,
					4,
				},
			},
			hotspot = {
				size = size,
				offset = {
					0,
					0,
					0,
				},
			},
			hovered_frame = {
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				texture_size = {
					size[1] + 26,
					size[2] + 30,
				},
				default_size = {
					size[1] + 26,
					size[2] + 30,
				},
				color = {
					255,
					0,
					245,
					0,
				},
				offset = {
					-14,
					-16,
					21,
				},
				default_offset = {
					-14,
					-16,
					21,
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

local selection_frame_definition = {
	scenegraph_id = "pivot",
	element = {
		passes = {
			{
				content_id = "hotspot",
				pass_type = "hotspot",
				style_id = "hotspot",
			},
			{
				pass_type = "texture",
				style_id = "gritty_border",
				texture_id = "gritty_border",
			},
			{
				pass_type = "texture",
				style_id = "profile_texture",
				texture_id = "profile_texture",
			},
		},
	},
	content = {
		gritty_border = "gritty_border",
		profile_texture = "icons_placeholder",
		hotspot = {},
	},
	style = {
		hotspot = {
			area_size = {
				110,
				130,
			},
			offset = {
				0,
				80,
				0,
			},
		},
		gritty_border = {
			texture_size = {
				150,
				160,
			},
			color = Colors.get_table("black"),
			offset = {
				-20,
				60,
				0,
			},
		},
		profile_texture = {
			texture_size = {
				110,
				130,
			},
			offset = {
				0,
				80,
				0,
			},
		},
	},
}
local color_disabled = {
	255,
	Colors.from_hex("545454"),
}
local color_available = {
	255,
	Colors.from_hex("b65b00"),
}
local info_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	vertical_alignment = "center",
	text_color = Colors.get_color_table_with_alpha("light_gray", 255),
	rect_color = Colors.get_color_table_with_alpha("black", 180),
	line_colors = {},
	offset = {
		0,
		0,
		50,
	},
}
local widget_definitions = {
	overlay = UIWidgets.create_simple_rect("screen", {
		255,
		0,
		0,
		0,
	}),
	chrome = {
		scenegraph_id = "pivot",
		offset = {
			0,
			0,
			1,
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "bottom_glow",
					texture_id = "bottom_glow",
				},
				{
					pass_type = "texture",
					style_id = "top_detail",
					texture_id = "top_detail",
				},
				{
					pass_type = "rotated_texture",
					style_id = "bottom_detail",
					texture_id = "bottom_detail",
				},
				{
					pass_type = "text",
					style_id = "category_text",
					text_id = "category_text",
				},
				{
					pass_type = "text",
					style_id = "pick_text",
					text_id = "pick_text",
				},
				{
					pass_type = "texture",
					style_id = "textured_backdrop",
					texture_id = "textured_backdrop",
				},
			},
		},
		content = {
			bottom_detail = "gritty_frame_wide",
			bottom_glow = "bottom_glow",
			category_text = "FULL",
			pick_text = "",
			textured_backdrop = "textured_backdrop",
			top_detail = "gritty_frame_wide",
			color_disabled = color_disabled,
			color_available = color_available,
		},
		style = {
			bottom_glow = {
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					-2,
				},
				texture_size = {
					2800,
					344,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			top_detail = {
				horizontal_alignment = "center",
				offset = {
					0,
					340,
					0,
				},
				texture_size = {
					522,
					65,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
			},
			bottom_detail = {
				horizontal_alignment = "center",
				angle = math.degrees_to_radians(180),
				pivot = {
					0,
					0,
				},
				offset = {
					522,
					300,
					0,
				},
				texture_size = {
					522,
					65,
				},
				color = Colors.get_color_table_with_alpha("black", 0),
			},
			category_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				use_shadow = true,
				text_color = Colors.get_color_table_with_alpha("local_player_picking", 255),
				offset = {
					0,
					324,
					0,
				},
			},
			pick_text = {
				font_size = 36,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				use_shadow = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					280,
					0,
				},
			},
			textured_backdrop = {
				horizontal_alignment = "center",
				offset = {
					0,
					270,
					-3,
				},
				texture_size = {
					616,
					96,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
		},
	},
	info_text = UIWidgets.create_simple_rect_text("info_text", "", nil, nil, nil, info_text_style),
}
local animation_definitions = {
	on_enter = {
		{
			duration = 0.6,
			name = "fade_in_glow",
			init = NOP,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local t = progress

				widgets_by_name.chrome.style.bottom_glow.color[1] = 255 * t
				widgets_by_name.chrome.style.textured_backdrop.color[1] = 255 * t
				widgets_by_name.overlay.style.rect.color[1] = 30 * t
			end,
			on_complete = NOP,
		},
		{
			duration = 0.5,
			name = "fade_slide_in_bg",
			init = NOP,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local t = math.easeOutCubic(progress)
				local widget = widgets_by_name.chrome
				local alpha, dy, by = 0 * t, 480 * t, 285 * t

				widget.style.top_detail.color[1] = alpha
				widget.style.top_detail.offset[2] = dy
				widget.style.bottom_detail.color[1] = alpha
				widget.style.bottom_detail.offset[2] = by
			end,
			on_complete = NOP,
		},
		{
			delay = 0.3,
			duration = 0.4,
			name = "fade_in_text",
			init = function (ui_scenegraph, scenegraph_def, widgets_by_name, params)
				local widget = widgets_by_name.chrome

				widget.style.category_text.text_color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local t = math.easeOutCubic(progress)
				local widget = widgets_by_name.chrome
				local alpha = 255 * t

				widget.style.category_text.text_color[1] = alpha
			end,
			on_complete = NOP,
		},
		{
			delay = 0.4,
			duration = 0.5,
			name = "fade_in_pick_text",
			init = function (ui_scenegraph, scenegraph_def, widgets_by_name, params)
				local widget = widgets_by_name.chrome

				widget.style.pick_text.text_color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local t = math.easeOutCubic(progress)
				local widget = widgets_by_name.chrome
				local alpha = 255 * t

				widget.style.pick_text.text_color[1] = alpha
			end,
			on_complete = NOP,
		},
		{
			delay = 0,
			duration = 0.5,
			name = "slide_in_frames",
			init = function (ui_scenegraph, scenegraph_def, widgets_by_name, params)
				local selector_widgets = params._selector_widgets

				for i = 1, #selector_widgets do
					local widget = selector_widgets[i]

					widget.offset[2] = -1000
				end
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local t = 1 - math.easeOutCubic(progress)
				local selector_widgets = params._selector_widgets

				for i = 1, #selector_widgets do
					local widget = selector_widgets[i]

					widget.offset[2] = (400 + 100 * i) * t
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets_by_name, params)
				params:_capture_input()
			end,
		},
		{
			delay = 0.5,
			duration = 0.2,
			name = "fade_in_info_text",
			init = function (ui_scenegraph, scenegraph_def, widgets_by_name, params)
				local widget = widgets_by_name.info_text

				widget.style.text.text_color[1] = 0
				widget.style.text.rect_color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local widget = widgets_by_name.info_text

				widget.style.text.text_color[1] = 255 * math.easeOutCubic(progress)
				widget.style.text.rect_color[1] = 125 * math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets_by_name, params)
				return
			end,
		},
	},
	on_exit = {
		{
			duration = 0.6,
			name = "fade_out_glow",
			init = function (ui_scenegraph, scenegraph_def, widgets_by_name, params)
				params:_release_input()
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local t = 1 - progress

				widgets_by_name.chrome.style.bottom_glow.color[1] = 255 * t
				widgets_by_name.chrome.style.textured_backdrop.color[1] = 255 * t
				widgets_by_name.overlay.style.rect.color[1] = 30 * t
			end,
			on_complete = NOP,
		},
		{
			duration = 0.5,
			name = "fade_slide_out",
			init = NOP,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local t = 1 - math.easeOutCubic(progress)
				local widget = widgets_by_name.chrome
				local alpha = 0 * t

				widget.style.top_detail.color[1] = alpha
				widget.style.bottom_detail.color[1] = alpha
				widget.style.category_text.text_color[1] = alpha
				widget.style.pick_text.text_color[1] = alpha
			end,
			on_complete = NOP,
		},
		{
			duration = 0.5,
			name = "slide_out_frames",
			init = function (ui_scenegraph, scenegraph_def, widgets_by_name, params)
				local selector_widgets = params._selector_widgets

				for i = 1, #selector_widgets do
					local widget = selector_widgets[i]

					widget.offset[2] = 0
				end
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local t = math.easeOutCubic(progress)
				local selector_widgets = params._selector_widgets

				for i = 1, #selector_widgets do
					local widget = selector_widgets[i]

					widget.offset[2] = -(400 + 100 * i) * t
				end
			end,
			on_complete = NOP,
		},
		{
			duration = 0.5,
			name = "fade_out_info_text",
			init = NOP,
			update = function (ui_scenegraph, scenegraph_def, widgets_by_name, progress, params)
				local widget = widgets_by_name.info_text

				widget.style.text.text_color[1] = 255 * (1 - math.easeOutCubic(progress))
				widget.style.text.rect_color[1] = 150 * (1 - math.easeOutCubic(progress))
			end,
			on_complete = NOP,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	selection_frame_definition = selection_frame_definition,
	ordered_pactsworn_slots = ordered_pactsworn_slots,
	create_selection_widget = create_selection_widget,
}
