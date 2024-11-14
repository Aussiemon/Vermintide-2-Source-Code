-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_mission_selection_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local large_window_size = {
	window_size[1] * 3 - 76,
	window_size[2],
}
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	root_fit = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
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
	window = {
		horizontal_alignment = "center",
		parent = "menu_root",
		vertical_alignment = "center",
		size = large_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	info_window = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_size[2],
		},
		position = {
			0,
			0,
			1,
		},
	},
	background = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_size[2],
		},
		position = {
			0,
			0,
			0,
		},
	},
	mask = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		size = {
			660,
			window_size[2] + 10,
		},
		position = {
			-30,
			10,
			0,
		},
	},
	level_image = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "top",
		size = {
			194,
			116,
		},
		position = {
			-500,
			-30,
			1,
		},
	},
	grid_anchor = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
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
	scroller = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "top",
		position = {
			-40,
			10,
			0,
		},
		size = {
			20,
			window_size[2] + 10,
		},
	},
	description_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			window_size[2] / 2,
		},
		position = {
			0,
			0,
			1,
		},
	},
	locked_text = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			window_text_width,
			100,
		},
		position = {
			0,
			-20,
			1,
		},
	},
	level_texture_frame = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "top",
		size = {
			180,
			180,
		},
		position = {
			0,
			-80,
			2,
		},
	},
	level_texture = {
		horizontal_alignment = "center",
		parent = "level_texture_frame",
		vertical_alignment = "center",
		size = {
			168,
			168,
		},
		position = {
			0,
			0,
			-1,
		},
	},
	level_texture_lock = {
		horizontal_alignment = "center",
		parent = "level_texture_frame",
		vertical_alignment = "center",
		size = {
			146,
			146,
		},
		position = {
			0,
			0,
			1,
		},
	},
	level_title_divider = {
		horizontal_alignment = "center",
		parent = "level_texture_frame",
		vertical_alignment = "bottom",
		size = {
			264,
			32,
		},
		position = {
			0,
			-90,
			1,
		},
	},
	level_title = {
		horizontal_alignment = "center",
		parent = "level_title_divider",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			20,
			1,
		},
	},
	helper_text = {
		horizontal_alignment = "center",
		parent = "level_title_divider",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			-50,
			1,
		},
	},
}
local grid_settings = {
	columns = 4,
	margin = 20,
	area_spacing = {
		0,
		-40,
		0,
	},
	act_spacing = {
		5,
		-33,
		1,
	},
	level_spacing = {
		137.5,
		-87.5,
		0,
	},
	level_size = {
		121.25,
		72.5,
	},
	section_spacing = {
		0,
		-60,
		0,
	},
}
local description_text_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
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
local level_text_style = {
	dynamic_font_size = true,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local helper_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
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
local locked_level_text_style = {
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		0,
	},
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.3,
			name = "animate_in_window",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				ui_scenegraph.window.local_position[1] = scenegraph_def.window.position[1] + math.floor(-100 * (1 - anim_progress))
				ui_scenegraph.info_window.local_position[1] = scenegraph_def.info_window.position[1] + math.floor(-80 * (1 - anim_progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets, params)
				return
			end,
		},
	},
}

local function create_area_entry(area_data, offset)
	local frame_settings = UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local widget = {
		scenegraph_id = "grid_anchor",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text_id",
					text_id = "text_id",
				},
				{
					pass_type = "text",
					style_id = "text_id_shadow",
					text_id = "text_id",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background_id",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
			},
		},
		content = {
			background_id = "rect_masked",
			text_id = area_data.area_display_name,
			frame = frame_settings.texture,
		},
		style = {
			text_id = {
				font_size = 28,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					10,
					-10,
					2,
				},
			},
			text_id_shadow = {
				font_size = 28,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					12,
					-12,
					1,
				},
			},
			background = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					160,
					0,
					0,
					0,
				},
				texture_size = {
					grid_settings.level_spacing[1] * grid_settings.columns + grid_settings.margin * 2,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			frame = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "top",
				color = {
					160,
					0,
					0,
					0,
				},
				edge_height = edge_height,
				area_size = {
					grid_settings.level_spacing[1] * grid_settings.columns + grid_settings.margin * 2 + edge_height * 2,
					200,
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					-edge_height,
					edge_height,
					0,
				},
			},
		},
		offset = offset,
	}

	return widget
end

local function create_act_entry(act_name, offset)
	local widget = {
		scenegraph_id = "grid_anchor",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text_id",
					text_id = "text_id",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background_id",
				},
			},
		},
		content = {
			background_id = "rect_masked",
			text_id = act_name,
		},
		style = {
			text_id = {
				font_size = 20,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					10,
					-10,
					1,
				},
			},
			background = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = UISettings.console_start_game_menu_rect_color,
				texture_size = {
					grid_settings.level_spacing[1] * grid_settings.columns + 5,
					25,
				},
				offset = {
					0,
					-10,
					0,
				},
			},
		},
		offset = offset,
	}

	return widget
end

local function create_level_entry(level_settings, offset, selected_index, my_index, is_disabled, disabled_reason, preferred_levels)
	local fallback_image = "icons_placeholder"
	local texture_name = LevelHelper:get_small_level_image(level_settings.level_id)
	local texture_settings = UIAtlasHelper.has_texture_by_name(texture_name) and UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name) or UIAtlasHelper.get_atlas_settings_by_texture_name(fallback_image)
	local frame_settings = UIFrameSettings.frame_outer_glow_01
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local box_size = math.min(grid_settings.level_size[1], grid_settings.level_size[2])
	local widget = {
		scenegraph_id = "grid_anchor",
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content, style)
						return content.index[1] == content.selected_index[1] and content.index[2] == content.selected_index[2]
					end,
					content_change_function = function (content, style)
						local time = Managers.time:time("game")

						style.color[1] = 192 + math.sin(time * 6) * 63
					end,
				},
				{
					pass_type = "texture",
					style_id = "gold_lock",
					texture_id = "gold_lock",
					content_check_function = function (content)
						return content.show_gold_lock
					end,
				},
				{
					pass_type = "texture",
					style_id = "forbidden",
					texture_id = "forbidden",
					content_check_function = function (content)
						return content.show_forbidden
					end,
				},
			},
		},
		content = {
			fade_id = "text_gradient",
			forbidden = "hero_icon_unavailable",
			gold_lock = "hero_icon_locked_gold",
			selection_id = "rect_masked",
			button_hotspot = {
				disable_button = is_disabled,
			},
			texture_id = texture_settings.texture_name,
			level_settings = level_settings,
			index = my_index,
			selected_index = selected_index,
			frame = frame_settings.texture,
			is_disabled = is_disabled,
			show_gold_lock = is_disabled and disabled_reason == "dlc",
			show_forbidden = is_disabled and disabled_reason ~= "dlc",
		},
		style = {
			button_hotspot = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = grid_settings.level_size,
				offset = {
					10,
					-10,
					2,
				},
			},
			texture_id = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = grid_settings.level_size,
				saturated = is_disabled,
				offset = {
					10,
					-10,
					2,
				},
			},
			frame = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				edge_height = edge_height,
				area_size = {
					math.ceil(grid_settings.level_size[1] + edge_height * 2),
					grid_settings.level_size[2] + edge_height * 2,
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					-4,
					4,
					4,
				},
			},
			gold_lock = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				offset = {
					38,
					-10,
					4,
				},
				texture_size = {
					box_size * 0.8735632183908046,
					box_size,
				},
			},
			forbidden = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				offset = {
					35,
					-10,
					4,
				},
				texture_size = {
					box_size,
					box_size,
				},
			},
		},
		offset = offset,
	}

	return widget
end

local function create_level_widget(i, specific_scenegraph_id)
	local scenegraph_id = specific_scenegraph_id
	local size = {
		180,
		180,
	}

	if not scenegraph_id then
		scenegraph_id = "level_root_" .. i
		scenegraph_definition[scenegraph_id] = {
			horizontal_alignment = "center",
			parent = "level_root_node",
			vertical_alignment = "center",
			size = size,
			position = {
				0,
				0,
				1,
			},
		}
	end

	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "icon",
			content_check_function = function (content)
				return not content.parent.locked
			end,
		},
		{
			level_id = "level_data",
			pass_type = "level_tooltip",
			style_id = "icon",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_glow",
			texture_id = "icon_glow",
		},
		{
			pass_type = "texture",
			style_id = "icon_unlock_guidance_glow",
			texture_id = "icon_unlock_guidance_glow",
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_locked",
			texture_id = "icon",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "lock",
			texture_id = "lock",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "lock_fade",
			texture_id = "lock_fade",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "texture",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "glass",
			texture_id = "glass",
		},
		{
			pass_type = "texture",
			style_id = "boss_icon",
			texture_id = "boss_icon",
			content_check_function = function (content)
				return content.boss_level
			end,
		},
	}
	local content = {
		boss_icon = "boss_icon",
		boss_level = true,
		draw_path = false,
		draw_path_fill = false,
		frame = "map_frame_00",
		glass = "act_presentation_fg_glass",
		icon = "level_icon_01",
		icon_glow = "map_frame_glow_02",
		icon_unlock_guidance_glow = "map_frame_glow_03",
		lock = "map_frame_lock",
		lock_fade = "map_frame_fade",
		locked = true,
		button_hotspot = {},
	}
	local style = {
		glass = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				216,
				216,
			},
			offset = {
				0,
				0,
				7,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		frame = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				180,
				180,
			},
			offset = {
				0,
				0,
				6,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lock = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				180,
				180,
			},
			offset = {
				0,
				0,
				9,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		lock_fade = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				180,
				180,
			},
			offset = {
				0,
				0,
				5,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		icon = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				168,
				168,
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
				3,
			},
		},
		icon_locked = {
			horizontal_alignment = "center",
			saturated = true,
			vertical_alignment = "center",
			texture_size = {
				168,
				168,
			},
			color = {
				255,
				100,
				100,
				100,
			},
			offset = {
				0,
				0,
				3,
			},
		},
		icon_glow = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				270,
				270,
			},
			offset = {
				0,
				0,
				4,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
		icon_unlock_guidance_glow = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				180,
				180,
			},
			offset = {
				0,
				0,
				7,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
		boss_icon = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				68,
				68,
			},
			offset = {
				0,
				-60,
				8,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
	}

	widget.element.passes = passes
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

local function create_scroller(scenegraph_id)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "rect",
					style_id = "inner_rect",
				},
				{
					pass_type = "rect",
					style_id = "scroller",
				},
			},
		},
		content = {},
		style = {
			background = {
				color = {
					255,
					5,
					5,
					5,
				},
			},
			inner_rect = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					15,
					15,
					15,
				},
				offset = {
					3,
					-3,
					1,
				},
				texture_size = {
					scenegraph_definition[scenegraph_id].size[1] - 6,
					scenegraph_definition[scenegraph_id].size[2] - 6,
				},
			},
			scroller = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					50,
					50,
					50,
				},
				offset = {
					3,
					-3,
					2,
				},
				texture_size = {
					scenegraph_definition[scenegraph_id].size[1] - 6,
					94,
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

	return widget
end

local widget_functions = {
	create_area_entry = create_area_entry,
	create_act_entry = create_act_entry,
	create_level_entry = create_level_entry,
}
local widgets = {
	background = UIWidgets.create_rect_with_outer_frame("background", scenegraph_definition.background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	mask = UIWidgets.create_simple_texture("mask_rect", "mask"),
	scroller = create_scroller("scroller"),
	level_title = UIWidgets.create_simple_text("", "level_title", nil, nil, level_text_style),
	selected_level = create_level_widget(nil, "level_texture_frame"),
	level_title_divider = UIWidgets.create_simple_texture("divider_01_top", "level_title_divider"),
	description_text = UIWidgets.create_simple_text("", "description_text", nil, nil, description_text_style),
	helper_text = UIWidgets.create_simple_text(Localize("tutorial_map"), "helper_text", nil, nil, helper_text_style),
	description_background = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	locked_text = UIWidgets.create_simple_text("", "locked_text", nil, nil, locked_level_text_style),
}

return {
	widgets = widgets,
	widget_functions = widget_functions,
	grid_settings = grid_settings,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
