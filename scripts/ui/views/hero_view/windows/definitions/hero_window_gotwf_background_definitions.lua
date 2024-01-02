local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	viewport = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			800,
			500
		},
		position = {
			0,
			-115,
			1
		}
	},
	loading_overlay = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default + 100
		}
	},
	loading_detail = {
		vertical_alignment = "center",
		parent = "loading_overlay",
		horizontal_alignment = "center",
		size = {
			314,
			33
		},
		position = {
			0,
			0,
			1
		}
	}
}
local loading_overlay_widgets = {
	loading_overlay = UIWidgets.create_simple_rect("loading_overlay", {
		255,
		12,
		12,
		12
	}),
	loading_overlay_loading_glow = UIWidgets.create_simple_texture("loading_title_divider", "loading_detail", nil, nil, nil, 2),
	loading_overlay_loading_frame = UIWidgets.create_simple_texture("loading_title_divider_background", "loading_detail", nil, nil, nil, 1)
}

local function create_rect_fade(scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "rect",
					pass_type = "rect",
					content_check_function = function (content)
						local fade_start = content.fade_start

						return fade_start <= content.progress or content.progress <= 1 - fade_start
					end,
					content_change_function = function (content, style)
						local fade_start = content.fade_start

						if fade_start < content.progress then
							local fade_progress = (content.progress - fade_start) / (1 - fade_start)
							style.color[1] = fade_progress * 255
						else
							local fade_progress = 1 - content.progress / (1 - fade_start)
							style.color[1] = fade_progress * 255
						end
					end
				}
			}
		},
		content = {
			fade_start = 0.99,
			progress = 0
		},
		style = {
			rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					-1
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local viewport_widgets = {
	background_fade = create_rect_fade("screen")
}
local background_rect = UIWidgets.create_simple_texture("gradient_dice_game_reward", "screen", nil, nil, {
	80,
	255,
	255,
	255
})
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	viewport_widgets = viewport_widgets,
	background_rect = background_rect,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	loading_overlay_widgets = loading_overlay_widgets
}
