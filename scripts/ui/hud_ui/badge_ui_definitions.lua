local ROOT_SIZE_X = 1920
local ROOT_SIZE_Y = 1080
local BADGE_SIZE_X = 200
local BADGE_SIZE_Y = 200
local BADGE_OFFSET_X = 0
local BADGE_OFFSET_Y = -150
local FONT_SIZE = 28
local TEXT_SIZE_X = ROOT_SIZE_X / 2
local TEXT_SIZE_Y = FONT_SIZE + 20
local TEXT_OFFSET_X = 0
local TEXT_OFFSET_Y = 130
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			ROOT_SIZE_X,
			ROOT_SIZE_Y
		}
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			ROOT_SIZE_X,
			ROOT_SIZE_Y
		}
	},
	temp = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			ROOT_SIZE_X,
			BADGE_SIZE_X
		},
		position = {
			0,
			0,
			UILayer.hud
		}
	},
	badge_placement = {
		vertical_alignment = "center",
		parent = "temp",
		horizontal_alignment = "center",
		size = {
			BADGE_SIZE_X,
			BADGE_SIZE_Y
		},
		position = {
			BADGE_OFFSET_X,
			BADGE_OFFSET_Y,
			0
		}
	},
	text_background_placement = {
		vertical_alignment = "center",
		parent = "temp",
		horizontal_alignment = "center",
		size = {
			TEXT_SIZE_X,
			TEXT_SIZE_Y
		},
		position = {
			TEXT_OFFSET_X + BADGE_OFFSET_X,
			BADGE_OFFSET_Y + TEXT_OFFSET_Y,
			0
		}
	},
	text_placement = {
		vertical_alignment = "center",
		parent = "text_background_placement",
		horizontal_alignment = "center",
		size = {
			TEXT_SIZE_X,
			TEXT_SIZE_Y
		},
		position = {
			0,
			0,
			1
		}
	}
}

if PLATFORM ~= "win32" then
	scenegraph_definition.screen.scale = "hud_fit"
end

local style = {
	vertical_alignment = "center",
	scenegraph_id = "text_placement",
	horizontal_alignment = "center",
	word_wrap = true,
	font_type = "hell_shark",
	font_size = FONT_SIZE,
	text_color = Colors.get_color_table_with_alpha("white", 255)
}

local function create_widget(badge_texture, text_name, text_desc, text_bg_texture, badge_texture_scenegraph_id, text_scenegraph_id, text_bg_scenegraph_id, text_style)
	return {
		element = {
			passes = {
				{
					texture_id = "badge_texture_id",
					style_id = "texture_id",
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
			badge_texture_id = badge_texture,
			text_name = text_name,
			text_desc = text_desc,
			text_bg_texture_id = text_bg_texture
		},
		style = {
			text_name = text_style,
			text_desc = text_style,
			text_bg_texture_id = {
				visible = false,
				scenegraph_id = text_bg_scenegraph_id
			}
		},
		scenegraph_id = badge_texture_scenegraph_id
	}
end

local widget_definitions = {
	widget = create_widget("button_detail_11", "placeholder_text_name", "placeholder_text_desc", "bg_center_fade", "badge_placement", "text_placement", "text_background_placement", style)
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in_scale_up",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
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
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
				local size_x = scenegraph_definition.badge_placement.size[1] * 1.5
				local size_y = scenegraph_definition.badge_placement.size[2] * 1.5
				params.ui_scenegraph.badge_placement.size = {
					size_x * anim_progress,
					size_y * anim_progress
				}
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
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
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.ui_scenegraph.text_background_placement.size = {
					0,
					0
				}
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local start_size_x = params.start_size[1]
				local start_size_y = params.start_size[2]
				local wanted_size_x = scenegraph_definition.badge_placement.size[1]
				local wanted_size_y = scenegraph_definition.badge_placement.size[2]
				local dt_x = start_size_x - wanted_size_x
				local dt_y = start_size_y - wanted_size_y
				params.ui_scenegraph.badge_placement.size = {
					start_size_x - dt_x * progress,
					start_size_y - dt_y * progress
				}
				params.ui_scenegraph.text_background_placement.size = {
					scenegraph_definition.text_background_placement.size[1] * progress,
					scenegraph_definition.text_background_placement.size[2]
				}
				local text_color = 255 * progress
				widgets.style.text_name.text_color = {
					text_color,
					text_color,
					text_color,
					text_color
				}
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out_name",
			start_progress = 3.6,
			end_progress = 3.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local text_color = 255 * (1 - progress)
				widgets.style.text_name.text_color = {
					text_color,
					text_color,
					text_color,
					text_color
				}
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_in_description",
			start_progress = 3.7,
			end_progress = 3.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local text_color = 255 * progress
				widgets.style.text_desc.text_color = {
					text_color,
					text_color,
					text_color,
					text_color
				}
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		},
		{
			name = "fade_out_everything",
			start_progress = 4.8,
			end_progress = 5.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1 - progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions
}
