-- chunkname: @scripts/ui/dlc_versus/views/start_game_view/windows/definitions/start_game_window_versus_quickplay_definitions.lua

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
				widgets.style.expedition_highlight_text.text_color[1] = 255 * (1 - anim_progress)

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
					widgets.content.game_mode_text = Localize("start_game_window_deus_quickplay_desc")
					widgets.content.show_note = false
				end

				widgets.style.game_mode_text.text_color[1] = 255 * math.easeOutCubic(progress)
				widgets.style.press_key_text.text_color[1] = 255 * math.easeOutCubic(progress)
				widgets.style.expedition_highlight_text.text_color[1] = 255 * math.easeOutCubic(progress)

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
	window_game_mode_root = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_frame_height,
		},
		position = {
			0,
			-window_frame_height,
			1,
		},
	},
	quickplay_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1] + 70,
			460,
		},
		position = {
			0,
			-110,
			1,
		},
	},
	quickplay_title = {
		horizontal_alignment = "center",
		parent = "quickplay_background",
		vertical_alignment = "top",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			-30,
			1,
		},
	},
	quickplay_sub_title = {
		horizontal_alignment = "center",
		parent = "quickplay_background",
		vertical_alignment = "top",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			-70,
			1,
		},
	},
	quickplay_divider = {
		horizontal_alignment = "center",
		parent = "quickplay_sub_title",
		vertical_alignment = "top",
		size = {
			264,
			32,
		},
		position = {
			0,
			-44,
			1,
		},
	},
	quickplay_description = {
		horizontal_alignment = "center",
		parent = "quickplay_divider",
		vertical_alignment = "top",
		size = {
			window_text_width,
			200,
		},
		position = {
			0,
			-36,
			1,
		},
	},
	game_option_3 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-15,
			1,
		},
	},
	game_option_2 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-15 + game_option_size[2],
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
	play_button_console = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			0,
			-42,
			1,
		},
	},
	play_button = {
		horizontal_alignment = "center",
		parent = "play_button_console",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-165,
			0,
			1,
		},
	},
}
local quickplay_title_style = {
	dynamic_font_size = true,
	font_size = 50,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local quickplay_sub_title_style = {
	font_size = 34,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2,
	},
}
local quickplay_description_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
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
local quickplay_disabled_disclaimer_text_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		40,
		-60,
		2,
	},
	size = {
		600,
		30,
	},
	area_size = {
		600,
		30,
	},
}
local disable_with_gamepad = true
local widget_definitions = {
	quickplay_description_background = UIWidgets.create_rect_with_outer_frame("quickplay_background", scenegraph_definition.quickplay_background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	quickplay_title = UIWidgets.create_simple_text(Localize("menu_store_panel_title_versus"), "quickplay_title", nil, nil, quickplay_title_style),
	quickplay_sub_title = UIWidgets.create_simple_text(Localize("versus_start_game_window_dedicated_server"), "quickplay_sub_title", nil, nil, quickplay_sub_title_style),
	quickplay_description = UIWidgets.create_simple_text(Localize("vs_quick_play_description"), "quickplay_description", nil, nil, quickplay_description_style),
	quickplay_divider = UIWidgets.create_simple_texture("divider_01_top", "quickplay_divider"),
	play_button = UIWidgets.create_icon_and_name_button("play_button", "options_button_icon_quickplay", Localize("versus_start_game_button_queue_up")),
	quickplay_disabled_disclaimer = UIWidgets.create_simple_text("", "play_button", nil, nil, quickplay_disabled_disclaimer_text_style),
}
local selector_input_definitions = {
	{
		widget_name = "play_button",
		enter_requirements = function (self)
			local gamepad_active = Managers.input:is_device_active("gamepad")

			return gamepad_active and not self.gamepad_active_last_frame
		end,
		on_enter = function (self, dt, t)
			local selection_widgets_by_name = self._widgets_by_name
			local difficulty_setting_widget = selection_widgets_by_name.play_button

			difficulty_setting_widget.content.is_selected = true
		end,
		update = function (self, input_service, can_play, dt, t)
			if input_service:get("confirm_press") and can_play or input_service:get("skip_press") then
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
}
