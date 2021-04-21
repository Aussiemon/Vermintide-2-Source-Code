local ROOT_SIZE = {
	1920,
	1080
}
local BADGE_SIZE = {
	128,
	128
}
local BADGE_OFFSET = {
	0,
	-150,
	0
}
local FONT_SIZE = 28
local TEXT_SIZE = {
	ROOT_SIZE[1] / 2,
	FONT_SIZE + 20
}
local TEXT_OFFSET = {
	0,
	100,
	0
}
local ICON_SIZE = {
	0.703125 * BADGE_SIZE[1],
	0.703125 * BADGE_SIZE[2]
}
local ICON_OFFSET = {
	0,
	0.1015625 * BADGE_SIZE[1],
	0
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud
		},
		size = ROOT_SIZE
	},
	screen = {
		scale = (IS_WINDOWS and "fit") or "hud_fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = ROOT_SIZE
	},
	pivot = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			ROOT_SIZE[1],
			BADGE_SIZE[1]
		},
		position = {
			0,
			-130,
			UILayer.hud
		}
	},
	badge_placement = {
		vertical_alignment = "center",
		parent = "pivot",
		horizontal_alignment = "center",
		size = BADGE_SIZE,
		position = BADGE_OFFSET
	},
	text_background_placement = {
		vertical_alignment = "center",
		parent = "pivot",
		horizontal_alignment = "center",
		size = TEXT_SIZE,
		position = {
			TEXT_OFFSET[1] + BADGE_OFFSET[1],
			BADGE_OFFSET[2] + TEXT_OFFSET[2],
			0
		}
	},
	text_placement = {
		vertical_alignment = "center",
		parent = "text_background_placement",
		horizontal_alignment = "center",
		size = TEXT_SIZE,
		position = {
			0,
			0,
			1
		}
	}
}
local badge_widget_definition = {
	scenegraph_id = "badge_placement",
	element = {
		passes = {
			{
				texture_id = "frame_smoke",
				style_id = "frame_smoke",
				pass_type = "texture"
			},
			{
				texture_id = "frame_impact",
				style_id = "frame_impact",
				pass_type = "texture"
			},
			{
				texture_id = "frame",
				style_id = "frame",
				pass_type = "texture"
			},
			{
				texture_id = "frame_glow",
				style_id = "frame_glow",
				pass_type = "texture"
			},
			{
				texture_id = "icon_glow",
				style_id = "icon_glow",
				pass_type = "texture"
			},
			{
				texture_id = "icon",
				style_id = "icon",
				pass_type = "texture"
			},
			{
				style_id = "text_name",
				pass_type = "text",
				text_id = "text_name"
			},
			{
				style_id = "text_desc",
				pass_type = "text",
				text_id = "text_desc"
			},
			{
				texture_id = "text_bg_texture_id",
				style_id = "text_bg_texture_id",
				pass_type = "texture"
			}
		}
	},
	content = {
		text_desc = "placeholder_text_desc",
		frame = "badge_frame_pactsworn",
		text_bg_texture_id = "bg_center_fade",
		text_name = "placeholder_text_name",
		frame_smoke = "badge_frame_pactsworn_smoke",
		frame_impact = "badge_frame_pactsworn_impact",
		frame_glow = "badge_frame_pactsworn_glow",
		icon = "versus_badge_icon",
		icon_glow = "versus_badge_glow"
	},
	style = {
		frame_smoke = {
			color = {
				255,
				0,
				0,
				0
			}
		},
		frame_impact = {
			color = {
				255,
				127,
				127,
				127
			}
		},
		frame_glow = {
			color = {
				255,
				255,
				0,
				255
			}
		},
		icon = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = ICON_SIZE,
			offset = ICON_OFFSET,
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = ICON_SIZE,
			offset = ICON_OFFSET,
			color = {
				255,
				255,
				0,
				255
			}
		},
		text = {
			vertical_alignment = "center",
			scenegraph_id = "text_placement",
			horizontal_alignment = "center",
			word_wrap = true,
			font_type = "hell_shark",
			font_size = FONT_SIZE,
			text_color = Colors.get_color_table_with_alpha("white", 255)
		},
		text_name = {
			vertical_alignment = "center",
			scenegraph_id = "text_placement",
			horizontal_alignment = "center",
			word_wrap = true,
			font_type = "hell_shark",
			font_size = FONT_SIZE,
			text_color = Colors.get_color_table_with_alpha("white", 255)
		},
		text_desc = {
			vertical_alignment = "center",
			scenegraph_id = "text_placement",
			horizontal_alignment = "center",
			word_wrap = true,
			font_type = "hell_shark",
			font_size = FONT_SIZE,
			text_color = Colors.get_color_table_with_alpha("white", 255)
		},
		text_bg_texture_id = {
			visible = false,
			scenegraph_id = "text_background_placement"
		}
	}
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in_scale_down",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				params.render_settings.alpha_multiplier = 0

				WwiseWorld.trigger_event(params.wwise_world, "play_gui_mission_summary_chest_upgrade")

				params.ui_scenegraph.badge_placement.size = {
					0,
					0
				}
				widgets.style.text_name.text_color = {
					0,
					0,
					0,
					0
				}
				widgets.style.text_desc.text_color = {
					0,
					0,
					0,
					0
				}
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
				local size_x = scenegraph_def.badge_placement.size[1] * 1.5
				local size_y = scenegraph_def.badge_placement.size[2] * 1.5
				params.ui_scenegraph.badge_placement.size = {
					size_x * anim_progress,
					size_y * anim_progress
				}
			end,
			on_complete = function (ui_scenegraph, scenegraph_def, widgets, params)
				params.start_size = {
					params.ui_scenegraph.badge_placement.size[1],
					params.ui_scenegraph.badge_placement.size[2]
				}
			end
		},
		{
			name = "scale_down",
			start_progress = 0.5,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				params.ui_scenegraph.text_background_placement.size = {
					0,
					0
				}
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				local start_size_x = params.start_size[1]
				local start_size_y = params.start_size[2]
				local wanted_size_x = scenegraph_def.badge_placement.size[1]
				local wanted_size_y = scenegraph_def.badge_placement.size[2]
				local dt_x = start_size_x - wanted_size_x
				local dt_y = start_size_y - wanted_size_y
				params.ui_scenegraph.badge_placement.size = {
					start_size_x - dt_x * progress,
					start_size_y - dt_y * progress
				}
				params.ui_scenegraph.text_background_placement.size = {
					scenegraph_def.text_background_placement.size[1] * progress,
					scenegraph_def.text_background_placement.size[2]
				}
				local text_color = 255 * progress
				widgets.style.text_name.text_color = {
					text_color,
					text_color,
					text_color,
					text_color
				}
			end,
			on_complete = NOP
		},
		{
			name = "fade_out_name",
			start_progress = 3.6,
			end_progress = 3.7,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				local text_color = 255 * (1 - progress)
				widgets.style.text_name.text_color = {
					text_color,
					text_color,
					text_color,
					text_color
				}
			end,
			on_complete = NOP
		},
		{
			name = "fade_in_description",
			start_progress = 3.7,
			end_progress = 3.8,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				local text_color = 255 * progress
				widgets.style.text_desc.text_color = {
					text_color,
					text_color,
					text_color,
					text_color
				}
			end,
			on_complete = NOP
		},
		{
			name = "fade_out_everything",
			start_progress = 4.8,
			end_progress = 5.3,
			init = function (ui_scenegraph, scenegraph_def, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_def, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1 - progress
			end,
			on_complete = NOP
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	badge_widget_definition = badge_widget_definition,
	animation_definitions = animation_definitions
}
