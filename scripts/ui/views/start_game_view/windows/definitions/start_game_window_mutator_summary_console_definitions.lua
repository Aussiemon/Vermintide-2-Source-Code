﻿-- chunkname: @scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_summary_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local game_option_size = {
	window_size[1] - 20,
	700,
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
			850,
			0,
			1,
		},
	},
	game_options_right_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2],
		},
		position = {
			195,
			0,
			1,
		},
	},
	game_options_left_chain = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			16,
			window_size[2],
		},
		position = {
			-195,
			0,
			1,
		},
	},
	game_option_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = game_option_size,
		position = {
			0,
			0,
			2,
		},
	},
	item_presentation = {
		horizontal_alignment = "center",
		parent = "game_option_1",
		vertical_alignment = "top",
		size = {
			game_option_size[1] - 10,
			0,
		},
		position = {
			0,
			0,
			1,
		},
	},
	confirm_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1] - 40,
			72,
		},
		position = {
			0,
			18,
			20,
		},
	},
}

local function create_placeholder_option(scenegraph_id, size)
	local background_texture = "game_options_bg_04"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local widget = {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
			},
		},
		content = {
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			background = {
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
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}

	return widget
end

local widgets = {
	game_option_placeholder = create_placeholder_option("game_option_1", scenegraph_definition.game_option_1.size),
	item_presentation = UIWidgets.create_simple_item_presentation("item_presentation", UISettings.console_tooltip_pass_definitions),
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
}
