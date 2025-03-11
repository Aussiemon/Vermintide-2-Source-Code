-- chunkname: @scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_weekly_event_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1],
	194,
}
local window_text_width = window_size[1]
local min_difficulty_info_size = {
	500,
	200,
}
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
		horizontal_alignment = "left",
		parent = "menu_root",
		vertical_alignment = "center",
		size = window_size,
		position = {
			220,
			0,
			1,
		},
	},
	adventure_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1] + 70,
			260,
		},
		position = {
			0,
			-75,
			1,
		},
	},
	game_option_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-105 + game_option_size[2] * 2,
			1,
		},
	},
	right_window = {
		horizontal_alignment = "right",
		parent = "menu_root",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_size[2],
		},
		position = {
			-100,
			-160,
			1,
		},
	},
	divider = {
		horizontal_alignment = "center",
		parent = "right_window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			4,
		},
		position = {
			20,
			-50,
			2,
		},
	},
	play_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			72,
		},
		position = {
			0,
			-40,
			1,
		},
	},
	difficulty_stepper = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			17.5,
			0,
			0,
		},
	},
	difficulty_info = {
		horizontal_alignment = "center",
		parent = "difficulty_stepper",
		vertical_alignment = "center",
		size = min_difficulty_info_size,
		position = {
			500,
			-10,
			0,
		},
	},
	upsell_button = {
		horizontal_alignment = "center",
		parent = "difficulty_info",
		vertical_alignment = "center",
		size = {
			28,
			28,
		},
		position = {
			218,
			0,
			2,
		},
	},
	info_box = {
		horizontal_alignment = "left",
		parent = "right_window",
		vertical_alignment = "bottom",
		position = {
			20,
			20,
			1,
		},
		size = {
			window_size[1] - 50,
			window_size[2] - 80,
		},
	},
	info_box_anchor = {
		parent = "info_box",
	},
	scrollbar_anchor = {
		horizontal_alignment = "center",
		parent = "right_window",
		vertical_alignment = "top",
		position = {
			0,
			-20,
			1,
		},
		size = {
			window_size[1],
			window_size[2] - 40,
		},
	},
	scrollbar_window = {
		parent = "scrollbar_anchor",
		size = {
			window_size[1] - 20,
			window_size[2] - 40,
		},
	},
}
local timer_text_style = {
	dynamic_font_size = false,
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = false,
	vertical_alignment = "top",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		-10,
		2,
	},
}

local function create_weekly_event_information_box(event_data, offset)
	local widget_definition = {}
	local element = {}
	local passes = {}
	local content = {}
	local style = {}
	local frame_name = "morris_gaze_header"
	local edge_name = "menu_frame_detail_morris"
	local frame_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(frame_name)
	local edge_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(edge_name)

	passes[#passes + 1] = {
		content_id = "frame_top",
		pass_type = "texture_uv",
		style_id = "frame_top",
	}
	passes[#passes + 1] = {
		content_id = "frame_bottom",
		pass_type = "texture_uv",
		style_id = "frame_bottom",
	}
	passes[#passes + 1] = {
		content_id = "frame_right",
		pass_type = "texture_uv",
		style_id = "frame_right",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "frame_left",
		texture_id = "frame_left",
	}
	content.frame_top = {
		texture_id = "morris_gaze_header",
		uvs = {
			{
				0,
				0,
			},
			{
				1,
				0.5,
			},
		},
	}
	content.frame_bottom = {
		texture_id = "morris_gaze_header",
		uvs = {
			{
				0,
				0.5,
			},
			{
				1,
				1,
			},
		},
	}
	content.frame_right = {
		texture_id = "menu_frame_detail_morris",
		uvs = {
			{
				1,
				0,
			},
			{
				0,
				1,
			},
		},
	}
	content.frame_left = "menu_frame_detail_morris"
	style.frame_top = {
		horizontal_alignment = "center",
		vertical_alignment = "top",
		texture_size = {
			scenegraph_definition.right_window.size[1],
			frame_texture_settings.size[2] * 0.5 * scenegraph_definition.right_window.size[1] / frame_texture_settings.size[1],
		},
		offset = {
			0,
			frame_texture_settings.size[2] * 0.5 * scenegraph_definition.right_window.size[1] / frame_texture_settings.size[1] - 13,
			1,
		},
	}
	style.frame_bottom = {
		horizontal_alignment = "center",
		vertical_alignment = "bottom",
		texture_size = {
			scenegraph_definition.right_window.size[1],
			frame_texture_settings.size[2] * 0.5 * scenegraph_definition.right_window.size[1] / frame_texture_settings.size[1],
		},
		offset = {
			0,
			-20,
			1,
		},
	}
	style.frame_right = {
		horizontal_alignment = "right",
		vertical_alignment = "center",
		texture_size = {
			edge_texture_settings.size[1],
			scenegraph_definition.right_window.size[2],
		},
		offset = {
			edge_texture_settings.size[1] - 5,
			0,
			1,
		},
	}
	style.frame_left = {
		horizontal_alignment = "left",
		vertical_alignment = "center",
		texture_size = {
			edge_texture_settings.size[1],
			scenegraph_definition.right_window.size[2],
		},
		offset = {
			-edge_texture_settings.size[1] + 5,
			0,
			1,
		},
	}
	element.passes = passes
	widget_definition.element = element
	widget_definition.content = content
	widget_definition.style = style
	widget_definition.scenegraph_id = "right_window"
	widget_definition.offset = offset or {
		0,
		0,
		0,
	}

	return widget_definition
end

local function create_header(header, offset_y, header_type)
	local widget_definition = {}
	local element = {}
	local passes = {}
	local content = {}
	local style = {}

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "header",
		text_id = "header",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "plus_horizontal",
		texture_id = "masked_rect",
		content_check_function = function (content, style)
			return header_type and header_type == "boon"
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "plus_vertical",
		texture_id = "masked_rect",
		content_check_function = function (content, style)
			return header_type and header_type == "boon"
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "minus",
		texture_id = "masked_rect",
		content_check_function = function (content, style)
			return header_type and header_type == "curse"
		end,
	}
	content.header = header
	content.masked_rect = "rect_masked"

	local font_size = 32

	style.header = {
		font_type = "hell_shark_header_masked",
		horizontal_alignment = "left",
		localize = true,
		upper_case = true,
		vertical_alignment = "top",
		font_size = font_size,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			header_type and 25 or 0,
			0,
			2,
		},
	}
	style.plus_horizontal = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		color = {
			255,
			255,
			255,
			0,
		},
		texture_size = {
			20,
			4,
		},
		offset = {
			0,
			-14,
			0,
		},
	}
	style.plus_vertical = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		color = {
			255,
			255,
			255,
			0,
		},
		texture_size = {
			4,
			20,
		},
		offset = {
			8,
			-6,
			0,
		},
	}
	style.minus = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		color = {
			255,
			255,
			0,
			0,
		},
		texture_size = {
			20,
			4,
		},
		offset = {
			0,
			-14,
			0,
		},
	}
	element.passes = passes
	widget_definition.element = element
	widget_definition.content = content
	widget_definition.style = style
	widget_definition.scenegraph_id = "info_box_anchor"
	widget_definition.offset = {
		0,
		offset_y,
		2,
	}

	return widget_definition
end

local function create_entry_widget(icon, title, description, offset_y)
	local widget_definition = {}
	local element = {}
	local passes = {}
	local content = {}
	local style = {}

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "title",
		text_id = "title",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "desc",
		text_id = "desc",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "icon",
		texture_id = "icon",
	}
	content.title = title
	content.desc = description
	content.icon = icon

	local indentation = 10

	style.title = {
		font_size = 22,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		localize = true,
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			35 + indentation,
			-3,
			2,
		},
		area_size = {
			scenegraph_definition.info_box.size[1] - 35 - indentation,
			50,
		},
	}
	style.desc = {
		font_size = 22,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			35 + indentation,
			-30,
			2,
		},
		area_size = {
			scenegraph_definition.info_box.size[1] - 35 - indentation,
			50,
		},
	}
	style.icon = {
		horizontal_alignment = "left",
		masked = true,
		vertical_alignment = "top",
		color = {
			255,
			255,
			255,
			255,
		},
		texture_size = {
			25,
			25,
		},
		offset = {
			indentation,
			-5,
			0,
		},
	}
	element.passes = passes
	widget_definition.element = element
	widget_definition.content = content
	widget_definition.style = style
	widget_definition.scenegraph_id = "info_box_anchor"
	widget_definition.offset = {
		0,
		offset_y,
		2,
	}

	return widget_definition
end

local function create_reward_widget(reward_data, offset_y)
	local widget_definition = {}
	local element = {}
	local passes = {}
	local content = {}
	local style = {}

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "difficulty",
		text_id = "difficulty",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "desc",
		text_id = "desc",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "icon",
		texture_id = "icon",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "checkmark",
		texture_id = "checkmark",
		content_check_function = function (content)
			return content.collected
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "frame",
		texture_id = "frame",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "num_rewards",
		text_id = "num_rewards_text",
		content_check_function = function (content)
			return content.num_rewards > 1
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "num_rewards_shadow",
		text_id = "num_rewards_text",
		content_check_function = function (content)
			return content.num_rewards > 1
		end,
	}
	content.frame = "button_frame_01"
	content.difficulty = reward_data.difficulty_name or "MISSING DIFFICULTY"
	content.desc = reward_data.desc or "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
	content.icon = reward_data.icon or "icon_placeholder"
	content.num_rewards = reward_data.num_rewards
	content.num_rewards_text = "x" .. content.num_rewards
	content.checkmark = "plain_checkmark"
	content.collected = reward_data.collected

	local indentation = 40

	style.difficulty = {
		font_size = 22,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			50 + indentation,
			0,
			2,
		},
		area_size = {
			scenegraph_definition.info_box.size[1] - 50 - indentation,
			50,
		},
	}
	style.desc = {
		font_size = 22,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			50 + indentation,
			-22,
			2,
		},
		area_size = {
			scenegraph_definition.info_box.size[1] - 50 - indentation,
			50,
		},
	}
	style.num_rewards = {
		font_size = 22,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			indentation + 20,
			-22,
			6,
		},
	}
	style.num_rewards_shadow = {
		font_size = 25,
		font_type = "hell_shark_masked",
		horizontal_alignment = "left",
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			indentation + 20 + 1,
			-23,
			5,
		},
	}
	style.icon = {
		horizontal_alignment = "left",
		masked = true,
		vertical_alignment = "top",
		color = {
			255,
			255,
			255,
			255,
		},
		texture_size = {
			40,
			40,
		},
		offset = {
			indentation,
			-5,
			0,
		},
	}
	style.frame = {
		horizontal_alignment = "left",
		masked = true,
		vertical_alignment = "top",
		color = {
			255,
			255,
			255,
			255,
		},
		texture_size = {
			40,
			40,
		},
		offset = {
			indentation,
			-5,
			1,
		},
	}
	style.checkmark = {
		horizontal_alignment = "left",
		masked = true,
		vertical_alignment = "top",
		color = {
			255,
			0,
			255,
			0,
		},
		texture_size = {
			15,
			15,
		},
		offset = {
			10,
			-20,
			0,
		},
	}
	element.passes = passes
	widget_definition.element = element
	widget_definition.content = content
	widget_definition.style = style
	widget_definition.scenegraph_id = "info_box_anchor"
	widget_definition.offset = {
		0,
		offset_y,
		2,
	}

	return widget_definition
end

local disable_with_gamepad = true
local widget_definitions = {
	quickplay_gamemode_info_box = UIWidgets.create_start_game_deus_gamemode_info_box("adventure_background", scenegraph_definition.adventure_background.size, Localize("cw_weekly_expedition_name_long"), string.gsub(Localize("cw_weekly_expedition_description"), Localize("expedition_highlight_text"), "{#color(255,168,0)}" .. Localize("expedition_highlight_text") .. "{#reset()}"), false, true),
	difficulty_stepper = UIWidgets.create_start_game_difficulty_stepper("difficulty_stepper", Localize("start_game_window_difficulty"), "difficulty_option_1"),
	difficulty_info = UIWidgets.create_start_game_deus_difficulty_info_box("difficulty_info", scenegraph_definition.difficulty_info.size),
	upsell_button = UIWidgets.create_simple_two_state_button("upsell_button", "icon_redirect", "icon_redirect_hover"),
	play_button = UIWidgets.create_start_game_deus_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34, disable_with_gamepad),
	info_box_bg = UIWidgets.create_simple_rect("right_window", {
		164,
		0,
		0,
		0,
	}),
	info_box_mask = UIWidgets.create_simple_texture("mask_rect", "info_box", nil, nil, {
		255,
		255,
		255,
		255,
	}),
	timer = UIWidgets.create_simple_text("4 Days, 11h 49min", "right_window", 28, nil, timer_text_style),
	divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "divider"),
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
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	gamemode_text_swap = {
		{
			end_progress = 0.2,
			name = "gamemode_swap_text_fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				widgets.style.game_mode_text.text_color[1] = 255 * (1 - anim_progress)
				widgets.style.press_key_text.text_color[1] = 255 * (1 - anim_progress)

				if widgets.content.show_note then
					widgets.style.note_text.text_color[1] = 255 * (1 - anim_progress)
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.4,
			name = "gamemode_swap_text_fade_in",
			start_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if widgets.content.is_showing_info then
					widgets.content.game_mode_text = Localize("expedition_info")
					widgets.content.show_note = true
				else
					widgets.content.game_mode_text = string.gsub(Localize("cw_weekly_expedition_description"), Localize("expedition_highlight_text"), "{#color(255,168,0)}" .. Localize("expedition_highlight_text") .. "{#reset()}")
					widgets.content.show_note = false
				end

				widgets.style.game_mode_text.text_color[1] = 255 * math.easeOutCubic(progress)
				widgets.style.press_key_text.text_color[1] = 255 * math.easeOutCubic(progress)

				if widgets.content.show_note then
					widgets.style.note_text.text_color[1] = 255 * math.easeOutCubic(progress)
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	right_arrow_flick = {
		{
			end_progress = 0.6,
			name = "right_arrow_flick",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.right_key.color[1] = 255 * (1 - math.easeOutCubic(progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.content.right_arrow_pressed = false
			end,
		},
	},
	left_arrow_flick = {
		{
			end_progress = 0.6,
			name = "left_arrow_flick",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.left_key.color[1] = 255 * (1 - math.easeOutCubic(progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.content.left_arrow_pressed = false
			end,
		},
	},
	difficulty_info_enter = {
		{
			end_progress = 0.6,
			name = "difficulty_info_enter",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.difficulty_info.content.visible = true

				local diff_info_style = widgets.difficulty_info.style

				diff_info_style.background.color[1] = 0
				diff_info_style.border.color[1] = 0
				diff_info_style.difficulty_description.text_color[1] = 0
				diff_info_style.highest_obtainable_level.text_color[1] = 0
				diff_info_style.difficulty_separator.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local diff_info = widgets.difficulty_info
				local diff_info_style = widgets.difficulty_info.style
				local diff_info_content = widgets.difficulty_info.content

				diff_info.offset[1] = 50 * anim_progress
				widgets.upsell_button.offset[1] = 50 * anim_progress

				local alpha = 200 * anim_progress

				diff_info_style.background.color[1] = alpha
				diff_info_style.border.color[1] = alpha
				alpha = 255 * anim_progress
				diff_info_style.difficulty_description.text_color[1] = alpha
				diff_info_style.highest_obtainable_level.text_color[1] = alpha
				diff_info_style.difficulty_separator.color[1] = alpha

				if diff_info_content.should_show_diff_lock_text then
					diff_info_style.difficulty_lock_text.text_color[1] = alpha
				end

				if diff_info_content.should_show_dlc_lock then
					diff_info_style.dlc_lock_text.text_color[1] = alpha
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local selector_input_definitions = {
	{
		widget_name = "difficulty_stepper",
		enter_requirements = function (self)
			return true
		end,
		on_enter = function (self, dt, t)
			local widgets_by_name = self._widgets_by_name
			local difficulty_setting_widget = widgets_by_name.difficulty_stepper

			difficulty_setting_widget.content.is_selected = true
		end,
		update = function (self, input_service, dt, t)
			local widgets_by_name = self._widgets_by_name
			local difficulty_stepper = widgets_by_name.difficulty_stepper
			local widgets = {
				difficulty_info = self._widgets_by_name.difficulty_info,
				upsell_button = self._widgets_by_name.upsell_button,
			}

			if not self.diff_info_anim_played then
				self._diff_anim_id = self._ui_animator:start_animation("difficulty_info_enter", widgets, scenegraph_definition)
				self.diff_info_anim_played = true
			end

			local anim_params = {}

			if input_service:get("move_left") then
				self:_option_selected("difficulty_stepper", "left_arrow", t)

				difficulty_stepper.content.left_arrow_pressed = true
				anim_params.left_key = difficulty_stepper.style.left_arrow_gamepad_highlight

				if self._arrow_anim_id then
					self._ui_animator:stop_animation(self._arrow_anim_id)

					difficulty_stepper.style.right_arrow_gamepad_highlight.color[1] = 0
				end

				local anim_id = self._ui_animator:start_animation("left_arrow_flick", difficulty_stepper, scenegraph_definition, anim_params)

				self._arrow_anim_id = anim_id
			elseif input_service:get("move_right") then
				self:_option_selected("difficulty_stepper", "right_arrow", t)

				difficulty_stepper.content.right_arrow_pressed = true
				anim_params.right_key = difficulty_stepper.style.right_arrow_gamepad_highlight

				if self._arrow_anim_id then
					self._ui_animator:stop_animation(self._arrow_anim_id)

					difficulty_stepper.style.left_arrow_gamepad_highlight.color[1] = 0
				end

				local anim_id = self._ui_animator:start_animation("right_arrow_flick", difficulty_stepper, scenegraph_definition, anim_params)

				self._arrow_anim_id = anim_id
			end

			if input_service:get("confirm_press", true) and self._dlc_locked then
				Managers.unlock:open_dlc_page(self._dlc_name)
			end

			self:_update_difficulty_lock()
		end,
		on_exit = function (self, dt, t)
			local widgets_by_name = self._widgets_by_name
			local difficulty_setting_widget = widgets_by_name.difficulty_stepper

			difficulty_setting_widget.content.is_selected = false

			local upsell_button = self._widgets_by_name.upsell_button
			local difficulty_info = self._widgets_by_name.difficulty_info

			if self._diff_anim_id then
				self._ui_animator:stop_animation(self._diff_anim_id)
			end

			difficulty_info.content.visible = false
			upsell_button.content.visible = false
			self.diff_info_anim_played = false
		end,
	},
	{
		widget_name = "play_button",
		enter_requirements = function (self)
			local gamepad_active = Managers.input:is_device_active("gamepad")

			return not gamepad_active
		end,
		on_enter = function (self, dt, t)
			local selection_widgets_by_name = self._widgets_by_name
			local difficulty_setting_widget = selection_widgets_by_name.play_button

			difficulty_setting_widget.content.is_selected = true
		end,
		update = function (self, input_service, dt, t)
			if input_service:get("confirm_press") or input_service:get("skip_press") then
				self:_option_selected("play_button", nil, t)
			end
		end,
		on_exit = function (self, dt, t)
			local selection_widgets_by_name = self._widgets_by_name
			local difficulty_setting_widget = selection_widgets_by_name.play_button

			difficulty_setting_widget.content.is_selected = false
		end,
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	selector_input_definitions = selector_input_definitions,
	create_weekly_event_information_box = create_weekly_event_information_box,
	create_header = create_header,
	create_entry_widget = create_entry_widget,
	create_reward_widget = create_reward_widget,
}
