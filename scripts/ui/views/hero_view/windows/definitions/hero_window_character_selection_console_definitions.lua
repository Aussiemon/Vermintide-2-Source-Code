-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_character_selection_console_definitions.lua

local video_window_width = 426
local video_window_height = 240
local career_info_size = {
	450,
	170,
}
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
			UILayer.default + 100,
		},
	},
	left_side_root = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			1080,
		},
		position = {
			0,
			0,
			1,
		},
	},
	bottom_panel = {
		scale = "fit_width",
		vertical_alignment = "bottom",
		size = {
			1920,
			79,
		},
		position = {
			0,
			0,
			UILayer.default + 101,
		},
	},
	hero_info_panel = {
		horizontal_alignment = "left",
		parent = "left_side_root",
		vertical_alignment = "top",
		size = {
			441,
			118,
		},
		position = {
			150,
			-100,
			1,
		},
	},
	info_text = {
		horizontal_alignment = "left",
		parent = "hero_info_panel",
		vertical_alignment = "top",
		position = {
			0,
			0,
			0,
		},
	},
	hero_info_level_bg = {
		horizontal_alignment = "left",
		parent = "hero_info_panel",
		vertical_alignment = "center",
		size = {
			124,
			138,
		},
		position = {
			-62,
			0,
			2,
		},
	},
	hero_info_divider = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "top",
		size = {
			14,
			790,
		},
		position = {
			0,
			-126,
			-1,
		},
	},
	hero_info_divider_edge = {
		horizontal_alignment = "center",
		parent = "hero_info_divider",
		vertical_alignment = "bottom",
		size = {
			28,
			22,
		},
		position = {
			0,
			-22,
			1,
		},
	},
	info_career_name = {
		horizontal_alignment = "center",
		parent = "hero_info_panel",
		vertical_alignment = "top",
		size = {
			450,
			25,
		},
		position = {
			76,
			-16,
			1,
		},
	},
	info_hero_name = {
		horizontal_alignment = "center",
		parent = "info_career_name",
		vertical_alignment = "top",
		size = {
			450,
			25,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	info_hero_level = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "center",
		size = {
			450,
			25,
		},
		position = {
			0,
			0,
			1,
		},
	},
	locked_info_text = {
		horizontal_alignment = "left",
		parent = "hero_root",
		vertical_alignment = "top",
		size = {
			441,
			50,
		},
		position = {
			0,
			60,
			1,
		},
	},
	hero_root = {
		horizontal_alignment = "center",
		parent = "hero_info_level_bg",
		vertical_alignment = "center",
		size = {
			110,
			130,
		},
		position = {
			80,
			-200,
			1,
		},
	},
	hero_icon_root = {
		horizontal_alignment = "left",
		parent = "hero_root",
		vertical_alignment = "center",
		size = {
			48,
			144,
		},
		position = {
			-59,
			0,
			1,
		},
	},
	select_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			370,
			70,
		},
		position = {
			0,
			25,
			3,
		},
	},
}
local hero_career_style = {
	dynamic_font_size = true,
	font_size = 40,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_name_style = {
	font_size = 30,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local hero_level_style = {
	font_size = 52,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local info_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function create_hero_widget(scenegraph_id, size)
	local frame_settings = UIFrameSettings.menu_frame_12
	local frame_premium_settings = UIFrameSettings.frame_corner_detail_01_gold
	local hover_frame_settings = UIFrameSettings.frame_outer_glow_01
	local hover_frame_width = hover_frame_settings.texture_sizes.horizontal[2]
	local currently_selected_frame_settings = UIFrameSettings.frame_outer_glow_01_white
	local currently_selected_frame_width = currently_selected_frame_settings.texture_sizes.horizontal[2]
	local bot_frame_style = "frame_inner_glow_03"
	local bot_frame_settings = UIFrameSettings[bot_frame_style]

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "portrait",
					texture_id = "portrait",
				},
				{
					pass_type = "rect",
					style_id = "rect",
				},
				{
					pass_type = "texture",
					style_id = "lock_texture",
					texture_id = "lock_texture",
					content_check_function = function (content)
						return content.locked
					end,
				},
				{
					pass_type = "texture",
					style_id = "taken_texture",
					texture_id = "taken_texture",
					content_check_function = function (content)
						return content.taken and not content.locked
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "bot_frame",
					texture_id = "bot_frame",
					content_check_function = function (content)
						return content.bot_selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "bot_texture",
					texture_id = "bot_texture",
					content_check_function = function (content)
						return content.bot_selected
					end,
				},
				{
					pass_type = "text",
					style_id = "bot_text",
					text_id = "bot_priority",
					content_check_function = function (content)
						return content.bot_priority
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame_premium",
					texture_id = "frame_premium",
					content_check_function = function (content)
						return content.is_premium
					end,
				},
				{
					pass_type = "rect",
					style_id = "overlay",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.is_hover and not button_hotspot.is_selected and not content.locked
					end,
				},
				{
					pass_type = "rect",
					style_id = "overlay_locked",
					content_check_function = function (content)
						if content.dlc_name then
							local button_hotspot = content.button_hotspot

							return not button_hotspot.is_hover and not button_hotspot.is_selected and content.locked
						else
							return content.locked
						end
					end,
				},
				{
					pass_type = "rect",
					style_id = "overlay_dlc_selected",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.dlc_name and (button_hotspot.is_hover or button_hotspot.is_selected) and content.locked
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "currently_selected_frame",
					texture_id = "currently_selected_frame",
					content_check_function = function (content)
						return not content.button_hotspot.is_selected and content.is_currently_selected_character
					end,
				},
			},
		},
		content = {
			bot_texture = "bot_selected_icon",
			is_currently_selected_character = false,
			lock_texture = "hero_icon_locked",
			locked = false,
			portrait = "icons_placeholder",
			taken = false,
			taken_texture = "hero_icon_unavailable",
			button_hotspot = {},
			bot_frame = bot_frame_settings.texture,
			frame = frame_settings.texture,
			frame_premium = frame_premium_settings.texture,
			hover_frame = hover_frame_settings.texture,
			currently_selected_frame = currently_selected_frame_settings.texture,
		},
		style = {
			rect = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			portrait = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
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
			},
			lock_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					76,
					87,
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
					5,
				},
			},
			taken_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					112,
					112,
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
					6,
				},
			},
			bot_frame = {
				texture_size = bot_frame_settings.texture_size,
				texture_sizes = bot_frame_settings.texture_sizes,
				color = {
					255,
					244,
					171,
					135,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			bot_texture = {
				texture_size = {
					20,
					20,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					10,
					10,
					6,
				},
			},
			bot_text = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "bottom",
				text_color = {
					255,
					200,
					255,
					255,
				},
				offset = {
					35,
					0,
					6,
				},
			},
			overlay = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
				color = {
					80,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			overlay_locked = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			overlay_dlc_selected = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
				color = {
					90,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					4,
				},
			},
			frame_premium = {
				texture_size = frame_premium_settings.texture_size,
				texture_sizes = frame_premium_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					4,
				},
			},
			hover_frame = {
				size = {
					size[1] + hover_frame_width * 2,
					size[2] + hover_frame_width * 2,
				},
				texture_size = hover_frame_settings.texture_size,
				texture_sizes = hover_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-hover_frame_width,
					-hover_frame_width,
					0,
				},
			},
			currently_selected_frame = {
				size = {
					size[1] + currently_selected_frame_width * 2,
					size[2] + currently_selected_frame_width * 2,
				},
				texture_size = currently_selected_frame_settings.texture_size,
				texture_sizes = currently_selected_frame_settings.texture_sizes,
				color = {
					255,
					50,
					205,
					50,
				},
				offset = {
					-currently_selected_frame_width,
					-currently_selected_frame_width,
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

local function create_hero_icon_widget(scenegraph_id, size)
	local icon_size = {
		80,
		80,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return not content.selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_selected",
					texture_id = "icon_selected",
					content_check_function = function (content)
						return content.selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "holder",
					texture_id = "holder",
				},
			},
		},
		content = {
			holder = "divider_vertical_hero_decoration",
			icon = "hero_icon_large_bright_wizard",
			icon_selected = "hero_icon_large_bright_wizard",
		},
		style = {
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = icon_size,
				color = {
					200,
					80,
					80,
					80,
				},
				offset = {
					-40,
					0,
					1,
				},
			},
			icon_selected = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-40,
					0,
					1,
				},
			},
			holder = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = size,
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

local empty_hero_widget_size = {
	110,
	130,
}
local empty_hero_widget = {
	scenegraph_id = "hero_root",
	offset = {
		0,
		0,
		0,
	},
	element = {
		passes = {
			{
				pass_type = "hover",
			},
			{
				pass_type = "texture",
				style_id = "bg",
				texture_id = "bg",
			},
			{
				pass_type = "texture",
				style_id = "icon",
				texture_id = "icon",
				content_change_function = function (content, style)
					local target = content.is_hover and 255 or 184

					style.color[1] = math.ceil(style.color[1] + 0.1 * (target - style.color[1]))
				end,
			},
		},
	},
	content = {
		bg = "character_slot_empty",
		icon = "icon_hourglass",
	},
	style = {
		bg = {
			texture_size = empty_hero_widget_size,
			offset = {
				0,
				0,
				0,
			},
		},
		icon = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = UIAtlasHelper.get_atlas_settings_by_texture_name("icon_hourglass").size,
			color = {
				184,
				255,
				255,
				255,
			},
		},
	},
}
local disable_with_gamepad = true
local widgets = {
	background = UIWidgets.create_simple_rect("screen", {
		128,
		0,
		0,
		0,
	}, 4),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("input_description_confirm"), nil, nil, nil, nil, disable_with_gamepad),
	info_text = UIWidgets.create_simple_text(Localize("manage_inventory_select"), "locked_info_text", nil, nil, info_text_style),
	hero_info_panel = UIWidgets.create_simple_texture("item_slot_side_fade", "hero_info_panel", nil, nil, {
		255,
		0,
		0,
		0,
	}),
	hero_info_panel_glow = UIWidgets.create_simple_texture("item_slot_side_effect", "hero_info_panel", nil, nil, Colors.get_color_table_with_alpha("font_title", 255), 1),
	hero_info_level_bg = UIWidgets.create_simple_texture("hero_level_bg", "hero_info_level_bg"),
	hero_info_divider = UIWidgets.create_simple_texture("divider_vertical_hero_middle", "hero_info_divider"),
	hero_info_divider_edge = UIWidgets.create_simple_texture("divider_vertical_hero_end", "hero_info_divider_edge"),
	info_career_name = UIWidgets.create_simple_text("n/a", "info_career_name", nil, nil, hero_career_style),
	info_hero_name = UIWidgets.create_simple_text("n/a", "info_hero_name", nil, nil, hero_name_style),
	info_hero_level = UIWidgets.create_simple_text("n/a", "info_hero_level", nil, nil, hero_level_style),
	bottom_panel = UIWidgets.create_simple_uv_texture("menu_panel_bg", {
		{
			0,
			1,
		},
		{
			1,
			0,
		},
	}, "bottom_panel", nil, nil, UISettings.console_menu_rect_color),
}
local generic_input_actions = {
	default = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_select_inventory",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	},
	hero_unavailable = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 2,
		},
	},
	dlc_unavailable = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "menu_store_purchase_button_unlock",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 3,
		},
	},
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 1,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	widgets = widgets,
	hero_widget = create_hero_widget("hero_root", scenegraph_definition.hero_root.size),
	empty_hero_widget = empty_hero_widget,
	hero_icon_widget = create_hero_icon_widget("hero_icon_root", scenegraph_definition.hero_icon_root.size),
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
