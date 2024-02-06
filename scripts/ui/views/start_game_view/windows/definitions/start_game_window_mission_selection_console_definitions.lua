-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_mission_selection_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local large_window_size = {
	window_size[1] * 2 + window_spacing,
	window_size[2],
}
local info_window_size = {
	window_size[1],
	window_size[2] + 50,
}
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local use_career_completion = true
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
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.3,
			name = "animate_in_window",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				ui_scenegraph.window.local_position[1] = scenegraph_definition.window.position[1] + math.floor(-100 * (1 - anim_progress))
				ui_scenegraph.info_window.local_position[1] = scenegraph_definition.info_window.position[1] + 200 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	window = {
		horizontal_alignment = "left",
		parent = "area_left",
		vertical_alignment = "center",
		size = large_window_size,
		position = {
			100,
			0,
			1,
		},
	},
	window_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			large_window_size[1],
			770,
		},
		position = {
			0,
			0,
			0,
		},
	},
	info_window = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "top",
		size = info_window_size,
		position = {
			info_window_size[1] - 25,
			0,
			1,
		},
	},
	act_root_node = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			large_window_size[1] - 256,
			256,
		},
		position = {
			0,
			0,
			1,
		},
	},
	end_act_root_node = {
		horizontal_alignment = "right",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			261,
			768,
		},
		position = {
			0,
			0,
			1,
		},
	},
	level_root_node = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			210,
			-100,
			10,
		},
	},
	end_level_root_node = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			90,
			-24,
			10,
		},
	},
	act_text_root_node = {
		horizontal_alignment = "center",
		parent = "level_root_node",
		vertical_alignment = "center",
		size = {
			100,
			50,
		},
		position = {
			-150,
			0,
			10,
		},
	},
	title_divider = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			large_window_size[1],
			0,
		},
		position = {
			0,
			768,
			14,
		},
	},
	mission_selection_title = {
		horizontal_alignment = "center",
		parent = "title_divider",
		vertical_alignment = "bottom",
		size = {
			large_window_size[1],
			52,
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
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			100,
		},
		position = {
			0,
			40,
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
			-20,
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
	description_text = {
		horizontal_alignment = "center",
		parent = "level_title_divider",
		vertical_alignment = "top",
		size = {
			window_text_width,
			200,
		},
		position = {
			0,
			-20,
			1,
		},
	},
	progression_divider = {
		horizontal_alignment = "center",
		parent = "description_text",
		vertical_alignment = "bottom",
		size = {
			264,
			32,
		},
		position = {
			0,
			-50,
			1,
		},
	},
	loot_objective = {
		horizontal_alignment = "center",
		parent = "progression_divider",
		vertical_alignment = "top",
		size = {
			window_text_width,
			90,
		},
		position = {
			-25,
			-150,
			1,
		},
	},
	hero_tabs = {
		horizontal_alignment = "center",
		parent = "loot_objective",
		vertical_alignment = "top",
		size = {
			0,
			90,
		},
		position = {
			25,
			-135,
			1,
		},
	},
	select_button = {
		horizontal_alignment = "center",
		parent = "info_window",
		vertical_alignment = "bottom",
		size = {
			460,
			72,
		},
		position = {
			0,
			18,
			20,
		},
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
local heros_completed_text_style = {
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		30,
		10,
	},
}
local locked_level_text_style = {
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
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

local function create_act_widget(index, optional_texture_version)
	local texture_version = optional_texture_version or "09"
	local scenegraph_id = "act_text_root_node"
	local size = scenegraph_definition[scenegraph_id].size
	local draw_divider = index > 1
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text",
		},
		{
			pass_type = "text",
			style_id = "text_shadow",
			text_id = "text",
		},
	}
	local content = {
		background = "menu_frame_bg_01",
		text = "title_text",
		title_bg = "playername_bg_02",
		title_edge = "game_option_divider",
		draw_divider = draw_divider,
		edge_holder_left = "menu_frame_" .. texture_version .. "_divider_left",
		edge_holder_right = "menu_frame_" .. texture_version .. "_divider_right",
		bottom_edge = "menu_frame_" .. texture_version .. "_divider",
	}
	local text_offset = {
		16,
		-3,
		10,
	}
	local style = {
		text = {
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = text_offset,
		},
		text_shadow = {
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				text_offset[1] + 1,
				text_offset[2] - 1,
				text_offset[3] - 1,
			},
		},
		background = {
			offset = {
				0,
				0,
				0,
			},
			color = {
				0,
				100,
				100,
				100,
			},
		},
		bottom_edge = {
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				5,
				size[2] - 4,
				6,
			},
			size = {
				size[1] - 10,
				5,
			},
			texture_tiling_size = {
				size[1] - 10,
				5,
			},
		},
		edge_holder_left = {
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				3,
				size[2] - 10,
				15,
			},
			size = {
				9,
				17,
			},
		},
		edge_holder_right = {
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				size[1] - 12,
				size[2] - 10,
				15,
			},
			size = {
				9,
				17,
			},
		},
		title_bg = {
			size = {
				size[1] / 2,
				40,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				size[2] - 40,
				2,
			},
		},
		title_edge = {
			size = {
				size[1] / 2,
				5,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				size[2] - 40,
				4,
			},
		},
		rect = {
			color = {
				100,
				255,
				255,
				0,
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

local function create_end_act_widget(optional_texture_version)
	local texture_version = optional_texture_version or "09"
	local scenegraph_id = "end_act_root_node"
	local size = scenegraph_definition[scenegraph_id].size
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		background = "menu_frame_bg_01",
		text = "title_text",
		title_bg = "playername_bg_02",
		title_edge = "game_option_divider",
		edge_holder_top = "menu_frame_" .. texture_version .. "_divider_top",
		edge_holder_bottom = "menu_frame_" .. texture_version .. "_divider_bottom",
		edge = "menu_frame_" .. texture_version .. "_divider_vertical",
	}
	local style = {
		text = {
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = true,
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				16,
				-5,
				10,
			},
		},
		text_shadow = {
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = true,
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				18,
				-7,
				9,
			},
		},
		background = {
			offset = {
				0,
				0,
				0,
			},
			color = {
				0,
				100,
				100,
				100,
			},
		},
		edge = {
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				6,
				6,
			},
			size = {
				5,
				size[2] - 9,
			},
			texture_tiling_size = {
				5,
				size[2] - 9,
			},
		},
		edge_holder_top = {
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				-6,
				size[2] - 7,
				20,
			},
			size = {
				17,
				9,
			},
		},
		edge_holder_bottom = {
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				-6,
				3,
				10,
			},
			size = {
				17,
				9,
			},
		},
		title_bg = {
			size = {
				size[1] / 2,
				40,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				size[2] - 40,
				2,
			},
		},
		title_edge = {
			size = {
				size[1] / 2,
				5,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				size[2] - 40,
				4,
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

local function create_loot_widget(texture, text)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local texture_size = texture_settings.size

	return {
		scenegraph_id = "loot_objective",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "counter_text",
					text_id = "counter_text",
				},
				{
					pass_type = "text",
					style_id = "counter_text_shadow",
					text_id = "counter_text",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "background_icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "glow_icon",
					texture_id = "glow_icon",
					content_check_function = function (content, style)
						return not content.disable_glow
					end,
				},
				{
					pass_type = "texture",
					style_id = "checkmark",
					texture_id = "checkmark",
					content_check_function = function (content, style)
						return content.amount >= content.total_amount
					end,
				},
			},
		},
		content = {
			amount = 0,
			checkmark = "matchmaking_checkbox",
			counter_text = "0/0",
			total_amount = 0,
			text = text or "n/a",
			icon = texture,
			glow_icon = texture .. "_glow",
		},
		style = {
			text = {
				dynamic_font_size = false,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				area_size = {
					150,
					300,
				},
				text_color = Colors.get_table("font_title"),
				offset = {
					texture_size[1] + 15,
					texture_size[2] - 50,
					1,
				},
			},
			text_shadow = {
				dynamic_font_size = false,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				area_size = {
					150,
					300,
				},
				text_color = Colors.get_table("black"),
				offset = {
					texture_size[1] + 15 + 1,
					texture_size[2] - 50 - 1,
					0,
				},
			},
			counter_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_table("font_default"),
				default_color = Colors.get_table("font_default"),
				completed_color = Colors.get_table("online_green"),
				offset = {
					texture_size[1] + 15,
					-40,
					10,
				},
			},
			counter_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_table("black"),
				offset = {
					texture_size[1] + 15 + 1,
					-41,
					0,
				},
			},
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
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
				texture_size = texture_size,
			},
			checkmark = {
				horizontal_alignment = "bottom",
				vertical_alignment = "left",
				color = Colors.get_table("online_green"),
				offset = {
					68,
					20,
					5,
				},
				texture_size = {
					27.75,
					23.25,
				},
			},
			background_icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
				texture_size = texture_size,
			},
			glow_icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
				texture_size = texture_size,
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local function create_difficulty_widget(texture, title_text, difficulty_id)
	local texture_size = {
		80,
		90,
	}

	return {
		scenegraph_id = "loot_objective",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "difficulty_text",
					text_id = "difficulty_text",
					content_check_function = function (content, style)
						return content.completed_difficulty_index < 4
					end,
				},
				{
					pass_type = "text",
					style_id = "difficulty_text_completed",
					text_id = "difficulty_text",
					content_check_function = function (content, style)
						return content.completed_difficulty_index >= 4
					end,
				},
				{
					pass_type = "text",
					style_id = "difficulty_text",
					text_id = "difficulty_text",
				},
				{
					pass_type = "text",
					style_id = "difficulty_text_disabled",
					text_id = "difficulty_text",
				},
				{
					pass_type = "text",
					style_id = "difficulty_text_shadow",
					text_id = "difficulty_text",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "background_icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "checkmark",
					texture_id = "checkmark",
					content_check_function = function (content, style)
						return content.completed_difficulty_index >= 4
					end,
				},
			},
		},
		content = {
			checkmark = "matchmaking_checkbox",
			completed_difficulty_index = 0,
			difficulty_text = Localize(difficulty_id),
			text = title_text,
			icon = texture,
		},
		style = {
			text = {
				dynamic_font_size = false,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				area_size = {
					150,
					300,
				},
				text_color = Colors.get_table("font_title"),
				offset = {
					texture_size[1] + 15,
					texture_size[2] - 50,
					1,
				},
			},
			text_shadow = {
				dynamic_font_size = false,
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				area_size = {
					150,
					300,
				},
				text_color = Colors.get_table("black"),
				offset = {
					texture_size[1] + 15 + 1,
					texture_size[2] - 50 - 1,
					0,
				},
			},
			difficulty_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_table("font_default"),
				offset = {
					texture_size[1] + 15,
					-40,
					1,
				},
			},
			difficulty_text_completed = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_table("online_green"),
				offset = {
					texture_size[1] + 15,
					-40,
					2,
				},
			},
			difficulty_text_disabled = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = {
					255,
					130,
					130,
					130,
				},
				offset = {
					texture_size[1] + 15,
					-40,
					1,
				},
			},
			difficulty_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_table("black"),
				offset = {
					texture_size[1] + 15 + 1,
					-41,
					0,
				},
			},
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
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
				texture_size = texture_size,
			},
			background_icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
				texture_size = texture_size,
			},
			checkmark = {
				horizontal_alignment = "bottom",
				vertical_alignment = "left",
				color = Colors.get_table("online_green"),
				offset = {
					68,
					20,
					5,
				},
				texture_size = {
					27.75,
					23.25,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

function create_simple_texture(texture, scenegraph_id, masked, retained, color, offset, texture_size, disable_with_gamepad)
	if type(offset) ~= "table" then
		offset = {
			0,
			0,
			offset or 0,
		}
	end

	if texture_size == "native" then
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
		local settings_size = texture_settings.size

		texture_size = {
			settings_size[1],
			settings_size[2],
		}
	end

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					retained_mode = retained,
				},
			},
		},
		content = {
			texture_id = texture,
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = color or {
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
				masked = masked,
				texture_size = texture_size,
			},
		},
		offset = offset,
		scenegraph_id = scenegraph_id,
	}
end

function create_hero_widgets(scenegraph_id)
	local icon_size = {
		75.60000000000001,
		97.2,
	}
	local frame_size = {
		90,
		90,
	}
	local slot_icons = {}

	for i = 1, #ProfilePriority do
		local profile_index = ProfilePriority[i]
		local profile = SPProfiles[profile_index]
		local careers = profile.careers
		local default_career = careers[1]

		slot_icons[#slot_icons + 1] = default_career.picking_image
	end

	local hero_entry_size_scale = 0.75
	local hero_entry_width = 96 * hero_entry_size_scale
	local hero_entry_height = 112 * hero_entry_size_scale
	local hero_entry_spacing = 25 * hero_entry_size_scale
	local hero_entry_frame_size = {
		86 * hero_entry_size_scale,
		108 * hero_entry_size_scale,
	}
	local slot_spacing = hero_entry_spacing
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local amount = #slot_icons
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local slot_width_spacing = slot_spacing or 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local start_width_offset = 0
	local frame_settings = UIPlayerPortraitFrameSettings.default

	for k = 1, amount do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1

		total_length = total_length + icon_size[1] + slot_width_spacing

		local offset = {
			start_width_offset,
			0,
			offset_layer,
		}
		local icon_data_name = "icon_data" .. name_suffix

		content[icon_data_name] = {}

		local icon_data_content = content[icon_data_name]
		local icon_texture = slot_icons[k]
		local icon_name = "icon" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = icon_data_name,
			texture_id = icon_name,
			style_id = icon_name,
			content_check_function = function (content)
				return not content.icon_disabled
			end,
		}
		style[icon_name] = {
			masked = true,
			size = icon_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 2,
			},
		}
		icon_data_content[icon_name] = icon_texture

		local icon_texture = slot_icons[k]
		local icon_name = "icon" .. name_suffix .. "_disabled"

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = icon_data_name,
			texture_id = icon_name,
			style_id = icon_name,
			content_check_function = function (content)
				return content.icon_disabled
			end,
		}
		style[icon_name] = {
			masked = true,
			saturated = true,
			size = icon_size,
			color = default_color,
			default_color = default_color,
			disabled_color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				offset[1],
				offset[2],
				offset[3] + 2,
			},
		}
		icon_data_content[icon_name] = icon_texture

		local frame_name = "frame" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = icon_data_name,
			texture_id = frame_name,
			style_id = frame_name,
		}
		style[frame_name] = {
			size = {
				frame_size[1],
				frame_size[2],
			},
			color = default_color,
			offset = {
				offset[1] + icon_size[1] / 2 - frame_size[1] / 2,
				offset[2] + icon_size[2] / 2 - frame_size[2] / 2,
				offset[3] + 3,
			},
		}
		icon_data_content[frame_name] = "map_frame_00"

		local frame_name = "frame" .. name_suffix .. "_mask"

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = icon_data_name,
			texture_id = frame_name,
			style_id = frame_name,
		}
		style[frame_name] = {
			size = {
				frame_size[1],
				frame_size[2],
			},
			color = default_color,
			offset = {
				offset[1] + icon_size[1] / 2 - frame_size[1] / 2,
				offset[2] + icon_size[2] / 2 - frame_size[2] / 2,
				offset[3] + 3,
			},
		}
		icon_data_content[frame_name] = "map_frame_mask"
		start_width_offset = start_width_offset + icon_size[1] + slot_width_spacing
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		-total_length / 2,
		-5,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local end_act_widget = create_end_act_widget()
local widgets = {
	level_title = UIWidgets.create_simple_text("level_title", "level_title", nil, nil, level_text_style),
	selected_level = create_level_widget(nil, "level_texture_frame"),
	description_text = UIWidgets.create_simple_text("", "description_text", nil, nil, description_text_style),
	helper_text = UIWidgets.create_simple_text(Localize("tutorial_map"), "helper_text", nil, nil, helper_text_style),
	description_background = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	locked_text = UIWidgets.create_simple_text("", "locked_text", nil, nil, locked_level_text_style),
	progression_divider = UIWidgets.create_simple_texture("divider_01_top", "progression_divider"),
	heros_completed_text = UIWidgets.create_simple_text(Localize("heroes_completed"), "hero_tabs", nil, nil, heros_completed_text_style),
}
local hero_icons = {}

for i = 1, #ProfilePriority do
	local profile_index = ProfilePriority[i]
	local profile = SPProfiles[profile_index]

	hero_icons[#hero_icons + 1] = profile.ui_portrait
end

local hero_entry_size_scale = 0.75
local hero_entry_width = 96 * hero_entry_size_scale
local hero_entry_height = 112 * hero_entry_size_scale
local hero_entry_spacing = 10 * hero_entry_size_scale
local hero_entry_frame_size = {
	86 * hero_entry_size_scale,
	108 * hero_entry_size_scale,
}

if use_career_completion then
	widgets.hero_tabs = create_hero_widgets("hero_tabs")
else
	widgets.hero_tabs = UIWidgets.create_icon_selector("hero_tabs", {
		hero_entry_width,
		hero_entry_height,
	}, hero_icons, hero_entry_spacing, true, hero_entry_frame_size, true, true)
end

local node_widgets = {}

for i = 1, 20 do
	node_widgets[i] = create_level_widget(i)
end

local act_widgets = {}

for i = 1, 5 do
	act_widgets[i] = create_act_widget(i)
end

local mission_settings = {
	{
		key = "tome",
		stat_name = "collected_tomes",
		texture = "loot_objective_icon_02",
		title_text = "dlc1_3_1_tomes",
		widget_name = "tome_counter",
	},
	{
		key = "painting_scrap",
		stat_name = "collected_painting_scraps",
		texture = "loot_objective_icon_06",
		title_text = "keep_decoration_painting",
		total_amount_func = "_calculate_paint_scrap_amount",
		widget_name = "painting_scrap_counter",
	},
	{
		key = "grimoire",
		stat_name = "collected_grimoires",
		texture = "loot_objective_icon_01",
		title_text = "dlc1_3_1_grimoires",
		widget_name = "grimoire_counter",
	},
}

return {
	widgets = widgets,
	act_widgets = act_widgets,
	node_widgets = node_widgets,
	end_act_widget = end_act_widget,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	large_window_size = large_window_size,
	mission_settings = mission_settings,
	create_loot_widget = create_loot_widget,
	create_difficulty_widget = create_difficulty_widget,
	use_career_completion = use_career_completion,
}
