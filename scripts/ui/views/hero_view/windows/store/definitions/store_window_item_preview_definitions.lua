-- chunkname: @scripts/ui/views/hero_view/windows/store/definitions/store_window_item_preview_definitions.lua

local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local list_size = {
	800,
	600,
}
local list_entry_size = {
	800,
	220,
}
local list_scrollbar_size = {
	16,
	list_size[2] + 100,
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	background = {
		horizontal_alignment = "right",
		scale = "fit_height",
		size = {
			960,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default + 100,
		},
	},
	pivot = {
		horizontal_alignment = "right",
		parent = "background",
		vertical_alignment = "top",
		size = {
			960,
			740,
		},
		position = {
			0,
			-190,
			0,
		},
	},
	viewport = {
		horizontal_alignment = "right",
		parent = "pivot",
		vertical_alignment = "bottom",
		size = {
			960,
			732,
		},
		position = {
			0,
			0,
			1,
		},
	},
	smoke_effect = {
		horizontal_alignment = "center",
		parent = "viewport",
		vertical_alignment = "bottom",
		size = {
			700,
			100,
		},
		position = {
			0,
			0,
			0,
		},
	},
	list_window = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "top",
		size = list_size,
		position = {
			-130,
			-255,
			10,
		},
	},
	list = {
		horizontal_alignment = "right",
		parent = "list_window",
		vertical_alignment = "top",
		size = list_size,
		position = {
			0,
			-list_size[2],
			0,
		},
	},
	list_scrollbar = {
		horizontal_alignment = "right",
		parent = "list_window",
		vertical_alignment = "top",
		size = list_scrollbar_size,
		position = {
			58,
			40,
			1,
		},
	},
	item_root = {
		horizontal_alignment = "left",
		parent = "list",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			20,
			0,
			1,
		},
	},
	list_background = {
		horizontal_alignment = "left",
		parent = "list_window",
		vertical_alignment = "top",
		size = {
			list_size[1] + 62,
			list_size[2] + 130,
		},
		position = {
			-10,
			55,
			0,
		},
	},
	list_detail_top_left = {
		horizontal_alignment = "right",
		parent = "list_scrollbar",
		vertical_alignment = "top",
		size = {
			157,
			97,
		},
		position = {
			45,
			60,
			2,
		},
	},
	list_detail_bottom_left = {
		horizontal_alignment = "right",
		parent = "list_scrollbar",
		vertical_alignment = "bottom",
		size = {
			157,
			97,
		},
		position = {
			45,
			-60,
			2,
		},
	},
	list_detail_top_center = {
		horizontal_alignment = "right",
		parent = "list_detail_top_left",
		vertical_alignment = "top",
		size = {
			750,
			97,
		},
		position = {
			-157,
			0,
			0,
		},
	},
	list_detail_bottom_center = {
		horizontal_alignment = "right",
		parent = "list_detail_bottom_left",
		vertical_alignment = "bottom",
		size = {
			750,
			97,
		},
		position = {
			-157,
			0,
			0,
		},
	},
	list_detail_top_right = {
		horizontal_alignment = "left",
		parent = "list_detail_top_center",
		vertical_alignment = "top",
		size = {
			23,
			97,
		},
		position = {
			-23,
			0,
			0,
		},
	},
	list_detail_bottom_right = {
		horizontal_alignment = "left",
		parent = "list_detail_bottom_center",
		vertical_alignment = "bottom",
		size = {
			23,
			97,
		},
		position = {
			-23,
			0,
			0,
		},
	},
	loading_icon = {
		horizontal_alignment = "center",
		parent = "viewport",
		vertical_alignment = "center",
		size = {
			150,
			150,
		},
		position = {
			0,
			0,
			10,
		},
	},
	unlock_button = {
		horizontal_alignment = "center",
		parent = "viewport",
		vertical_alignment = "bottom",
		size = {
			460,
			68,
		},
		position = {
			20,
			-37,
			15,
		},
	},
	unlock_button_edge = {
		horizontal_alignment = "center",
		parent = "viewport",
		vertical_alignment = "bottom",
		size = {
			826,
			97,
		},
		position = {
			20,
			-45,
			0,
		},
	},
	unlock_button_edge_left = {
		horizontal_alignment = "left",
		parent = "unlock_button_edge",
		vertical_alignment = "center",
		size = {
			23,
			97,
		},
		position = {
			-3,
			0,
			1,
		},
	},
	unlock_button_edge_right = {
		horizontal_alignment = "right",
		parent = "unlock_button_edge",
		vertical_alignment = "center",
		size = {
			23,
			97,
		},
		position = {
			3,
			0,
			1,
		},
	},
	disclaimer_text = {
		horizontal_alignment = "center",
		parent = "unlock_button",
		vertical_alignment = "bottom",
		size = {
			700,
			60,
		},
		position = {
			0,
			-55,
			10,
		},
	},
	disclaimer_divider = {
		horizontal_alignment = "center",
		parent = "disclaimer_text",
		vertical_alignment = "center",
		size = {
			13,
			13,
		},
		position = {
			0,
			0,
			0,
		},
	},
	title_text = {
		horizontal_alignment = "right",
		parent = "pivot",
		vertical_alignment = "bottom",
		size = {
			700,
			60,
		},
		position = {
			-190,
			735,
			8,
		},
	},
	sub_title_text = {
		horizontal_alignment = "center",
		parent = "title_text",
		vertical_alignment = "bottom",
		size = {
			700,
			30,
		},
		position = {
			0,
			-45,
			1,
		},
	},
	career_title_text = {
		horizontal_alignment = "center",
		parent = "sub_title_text",
		vertical_alignment = "bottom",
		size = {
			700,
			45,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	details_button_bg = {
		horizontal_alignment = "right",
		parent = "pivot",
		vertical_alignment = "bottom",
		size = {
			146,
			141,
		},
		position = {
			-20,
			664,
			1,
		},
	},
	details_button = {
		horizontal_alignment = "center",
		parent = "details_button_bg",
		vertical_alignment = "center",
		size = {
			89,
			93,
		},
		position = {
			0,
			0,
			1,
		},
	},
	title_edge = {
		horizontal_alignment = "right",
		parent = "details_button_bg",
		vertical_alignment = "center",
		size = {
			700,
			97,
		},
		position = {
			-146,
			-8,
			1,
		},
	},
	title_edge_detail = {
		horizontal_alignment = "left",
		parent = "title_edge",
		vertical_alignment = "center",
		size = {
			23,
			97,
		},
		position = {
			-23,
			0,
			0,
		},
	},
	details_disabled = {
		horizontal_alignment = "center",
		parent = "details_button_bg",
		vertical_alignment = "center",
		size = {
			93,
			93,
		},
		position = {
			0,
			0,
			1,
		},
	},
}
local title_text_style = {
	dynamic_font_size = true,
	font_size = 64,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		0,
		2,
	},
}
local sub_title_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local type_title_text_style = {
	dynamic_font_size = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local career_title_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = {
		255,
		120,
		120,
		120,
	},
	offset = {
		0,
		0,
		2,
	},
}
local disclaimer_text_style = {
	dynamic_font_size = true,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = {
		255,
		120,
		120,
		120,
	},
	offset = {
		0,
		0,
		2,
	},
}
local loading_widgets = {
	loading_icon = {
		scenegraph_id = "loading_icon",
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0

						progress = (progress + dt) % 1

						local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

						style.angle = angle
						style.progress = progress
					end,
				},
			},
		},
		content = {
			texture_id = "loot_loading",
		},
		style = {
			texture_id = {
				angle = 0,
				pivot = {
					75,
					75,
				},
				color = {
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
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
}

local function create_dlc_entry_definition(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "description_text",
					text_id = "description_text",
				},
			},
		},
		content = {
			background = "rect_masked",
			description_text = "n/a",
			title_text = "n/a",
			size = size,
		},
		style = {
			background = {
				masked = true,
				color = {
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
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header_masked",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					30,
					size[2] - 170,
					2,
				},
				size = {
					size[1] - 60,
					40,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 32,
				font_type = "hell_shark_header_masked",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					32,
					size[2] - 170 - 2,
					1,
				},
				size = {
					size[1] - 60,
					40,
				},
			},
			description_text = {
				font_size = 18,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = {
					255,
					10,
					10,
					10,
				},
				offset = {
					30,
					24,
					2,
				},
				size = {
					size[1] - 60,
					165,
				},
			},
			description_text_shadow = {
				font_size = 18,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					32,
					22,
					1,
				},
				size = {
					size[1] - 60,
					165,
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

local function create_list_mask(scenegraph_id, list_scenegraph_id, size, entry_size)
	local entry_hover_frame_settings = UIFrameSettings.frame_outer_glow_04_big
	local entry_hover_frame_spacing = entry_hover_frame_settings.texture_sizes.horizontal[2]
	local element = {
		passes = {
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
				style_id = "hotspot",
			},
			{
				content_id = "list_hotspot",
				pass_type = "hotspot",
				style_id = "list_hotspot",
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture",
			},
			{
				pass_type = "texture",
				style_id = "mask_top",
				texture_id = "mask_edge",
			},
			{
				pass_type = "rotated_texture",
				style_id = "mask_bottom",
				texture_id = "mask_edge",
			},
		},
	}
	local content = {
		mask_edge = "mask_rect_edge_fade",
		mask_texture = "mask_rect",
		list_hotspot = {},
		button_hotspot = {},
		scrollbar = {
			percentage = 0.1,
			scroll_amount = 0.1,
			scroll_value = 1,
		},
	}
	local style = {
		hotspot = {
			size = {
				size[1],
				size[2],
			},
			offset = {
				0,
				0,
				0,
			},
		},
		list_hotspot = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				size[2] + entry_hover_frame_spacing * 2,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-entry_hover_frame_spacing,
				-entry_hover_frame_spacing,
				0,
			},
		},
		mask = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-entry_hover_frame_spacing,
				0,
				0,
			},
		},
		mask_top = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				entry_hover_frame_spacing,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-entry_hover_frame_spacing,
				size[2],
				0,
			},
		},
		mask_bottom = {
			size = {
				size[1] + entry_hover_frame_spacing * 2,
				entry_hover_frame_spacing,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-entry_hover_frame_spacing,
				-entry_hover_frame_spacing,
				0,
			},
			angle = math.pi,
			pivot = {
				(size[1] + entry_hover_frame_spacing * 2) / 2,
				entry_hover_frame_spacing / 2,
			},
		},
	}
	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local bottom_widgets = {}
local item_widgets = {
	unlock_button_edge = UIWidgets.create_tiled_texture("unlock_button_edge", "divider_skull_middle_down", {
		64,
		97,
	}),
	unlock_button_edge_left = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			1,
		},
		{
			0,
			0,
		},
	}, "unlock_button_edge_left"),
	unlock_button_edge_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "unlock_button_edge_right"),
	details_button_bg = UIWidgets.create_simple_texture("button_detail_10", "details_button_bg"),
	title_edge = UIWidgets.create_tiled_texture("title_edge", "divider_skull_middle", {
		64,
		97,
	}),
	title_edge_detail = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "title_edge_detail"),
	details_button = {
		scenegraph_id = "details_button",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "normal",
					texture_id = "normal",
					content_check_function = function (content)
						return not content.button_hotspot.is_selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "normal_glow",
					texture_id = "normal_glow",
					content_check_function = function (content)
						return not content.button_hotspot.is_selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "expanded",
					texture_id = "expanded",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "expanded_glow",
					texture_id = "expanded_glow",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end,
				},
			},
		},
		content = {
			expanded = "store_info_contract_off",
			expanded_glow = "store_info_contract_on",
			normal = "store_info_expand_off",
			normal_glow = "store_info_expand_on",
			button_hotspot = {},
		},
		style = {
			normal = {
				color = {
					255,
					255,
					255,
					255,
				},
			},
			normal_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
			},
			expanded = {
				color = {
					255,
					255,
					255,
					255,
				},
			},
			expanded_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
}
local disable_with_gamepad = false
local top_widgets = {
	smoke_effect = UIWidgets.create_simple_uv_texture("item_preview_smoke_01", {
		{
			0,
			0,
		},
		{
			1,
			0.5,
		},
	}, "smoke_effect", nil, nil, Colors.get_color_table_with_alpha("gold", 255)),
	disclaimer_divider = UIWidgets.create_simple_texture("tooltip_marker_gold", "disclaimer_divider"),
	disclaimer_text = UIWidgets.create_simple_text("Headgear is sold separatly", "disclaimer_text", nil, nil, disclaimer_text_style),
	expire_timer_text = UIWidgets.create_simple_text("", "disclaimer_text", nil, nil, disclaimer_text_style),
	title_text = UIWidgets.create_simple_text("", "title_text", nil, nil, title_text_style),
	sub_title_text = UIWidgets.create_simple_text("", "sub_title_text", nil, nil, sub_title_text_style),
	type_title_text = UIWidgets.create_simple_text("", "sub_title_text", nil, nil, type_title_text_style),
	career_title_text = UIWidgets.create_simple_text("", "career_title_text", nil, nil, career_title_text_style),
	unlock_button = UIWidgets.create_store_purchase_button("unlock_button", scenegraph_definition.unlock_button.size, not IS_PS4 and Localize("menu_store_purchase_button_unlock") or "", 32, disable_with_gamepad),
	viewport_button = UIWidgets.create_simple_hotspot("viewport"),
}
local background_color = {
	255,
	0,
	0,
	0,
}
local background_frame = "shadow_frame_02"
local background_frame_settings = UIFrameSettings[background_frame]
local background_frame_texture_sizes = background_frame_settings.texture_sizes
local background_frame_corner_size = background_frame_texture_sizes.corner
local background_frame_margins = {
	-background_frame_corner_size[1],
	-background_frame_corner_size[2],
}
local dlc_top_widgets = {
	list = create_list_mask("list_window", "list", list_size, list_entry_size),
	list_scrollbar = UIWidgets.create_chain_scrollbar("list_scrollbar", "list_window", scenegraph_definition.list_scrollbar.size, "gold", nil, true),
	list_detail_top_left = UIWidgets.create_simple_uv_texture("divider_skull_left", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "list_detail_top_left"),
	list_detail_bottom_left = UIWidgets.create_simple_uv_texture("divider_skull_left", {
		{
			1,
			1,
		},
		{
			0,
			0,
		},
	}, "list_detail_bottom_left"),
	list_detail_top_center = UIWidgets.create_tiled_texture("list_detail_top_center", "divider_skull_middle", {
		64,
		97,
	}),
	list_detail_bottom_center = UIWidgets.create_tiled_texture("list_detail_bottom_center", "divider_skull_middle_down", {
		64,
		97,
	}),
	list_detail_top_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "list_detail_top_right"),
	list_detail_bottom_right = UIWidgets.create_simple_uv_texture("divider_skull_right", {
		{
			1,
			1,
		},
		{
			0,
			0,
		},
	}, "list_detail_bottom_right"),
}
local dlc_bottom_widgets = {
	list_background = UIWidgets.create_simple_rect("list_background", background_color),
	list_background_frame = UIWidgets.create_frame("list_background", scenegraph_definition.list_background.size, "shadow_frame_01", 0, background_color, background_frame_margins),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "delay",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.6,
			name = "fade_in",
			start_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	expand = {
		{
			end_progress = 0.3,
			name = "move",
			start_progress = 0,
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

				local type_title_text = widgets.type_title_text

				type_title_text.style.text.text_color[1] = text_alpha
				type_title_text.style.text_shadow.text_color[1] = text_alpha

				local career_title_text = widgets.career_title_text

				career_title_text.style.text.text_color[1] = text_alpha
				career_title_text.style.text_shadow.text_color[1] = text_alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	collapse = {
		{
			end_progress = 0.3,
			name = "move",
			start_progress = 0,
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

				ui_scenegraph.background.size[1] = default_background_size[1] + addition_width - animated_width

				local default_viewport_size = scenegraph_definition.viewport.size
				local default_viewport_position = scenegraph_definition.viewport.position

				ui_scenegraph.viewport.size[1] = default_viewport_size[1] + addition_width - animated_width
				ui_scenegraph.viewport.size[2] = default_viewport_size[2] + addition_height - animated_height

				local text_alpha = 255 * anim_progress
				local title_text = widgets.title_text

				title_text.style.text.text_color[1] = text_alpha
				title_text.style.text_shadow.text_color[1] = text_alpha

				local sub_title_text = widgets.sub_title_text

				sub_title_text.style.text.text_color[1] = text_alpha
				sub_title_text.style.text_shadow.text_color[1] = text_alpha

				local type_title_text = widgets.type_title_text

				type_title_text.style.text.text_color[1] = text_alpha
				type_title_text.style.text_shadow.text_color[1] = text_alpha

				local career_title_text = widgets.career_title_text

				career_title_text.style.text.text_color[1] = text_alpha
				career_title_text.style.text_shadow.text_color[1] = text_alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "buy_now",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 3,
		},
	},
	item_preview_purchase = {
		{
			description_text = "menu_store_purchase_button_unlock",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_toggle_hero_details",
			input_action = "special_1",
			priority = 4,
			content_check_function = function ()
				return IS_PS4 or IS_XB1
			end,
		},
		{
			description_text = "input_description_rotate",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 5,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 6,
		},
	},
	item_preview_purchase_no_details = {
		{
			description_text = "menu_store_purchase_button_unlock",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_rotate",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
		},
	},
	item_preview_owned = {
		{
			description_text = "input_description_toggle_hero_details",
			input_action = "special_1",
			priority = 4,
		},
		{
			description_text = "input_description_rotate",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
		},
	},
	item_preview_owned_no_details = {
		{
			description_text = "input_description_rotate",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
		},
	},
	dlc_preview_purchase = {
		{
			input_action = "confirm",
			priority = 2,
			description_text = IS_WINDOWS and "interaction_action_unlock" or "dlc1_4_input_description_storepage",
		},
		{
			description_text = "input_description_scroll_details",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 5,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 6,
		},
	},
	dlc_preview_owned = {
		{
			description_text = "input_description_scroll_details",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
		},
	},
	dlc_bundle_purchase = {
		{
			input_action = "confirm",
			priority = 2,
			description_text = IS_WINDOWS and "interaction_action_unlock" or "dlc1_4_input_description_storepage",
		},
		{
			description_text = "input_description_view_content",
			input_action = "special_1",
			priority = 4,
		},
		{
			description_text = "input_description_scroll_details",
			ignore_keybinding = true,
			input_action = "right_stick",
			priority = 5,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 6,
		},
	},
}

return {
	generic_input_actions = generic_input_actions,
	create_dlc_entry_definition = create_dlc_entry_definition,
	item_widgets = item_widgets,
	top_widgets = top_widgets,
	bottom_widgets = bottom_widgets,
	dlc_top_widgets = dlc_top_widgets,
	dlc_bottom_widgets = dlc_bottom_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	loading_widgets = loading_widgets,
}
