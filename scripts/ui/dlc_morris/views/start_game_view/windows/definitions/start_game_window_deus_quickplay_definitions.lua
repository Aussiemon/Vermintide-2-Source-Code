-- chunkname: @scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_quickplay_definitions.lua

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
}
local disable_with_gamepad = true
local widget_definitions = {
	quickplay_gamemode_info_box = UIWidgets.create_start_game_deus_gamemode_info_box("adventure_background", scenegraph_definition.adventure_background.size, Localize("start_game_window_adventure_title"), Localize("start_game_window_deus_quickplay_desc"), false),
	difficulty_stepper = UIWidgets.create_start_game_difficulty_stepper("difficulty_stepper", Localize("start_game_window_difficulty"), "difficulty_option_1"),
	difficulty_info = UIWidgets.create_start_game_deus_difficulty_info_box("difficulty_info", scenegraph_definition.difficulty_info.size),
	upsell_button = UIWidgets.create_simple_two_state_button("upsell_button", "icon_redirect", "icon_redirect_hover"),
	play_button = UIWidgets.create_start_game_deus_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34, disable_with_gamepad),
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
}
