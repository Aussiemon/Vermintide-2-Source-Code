﻿-- chunkname: @scripts/ui/dlc_upsell/alterantive_reminder_popup_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local content_margin = 50
local window_w = 455
local window_h = 636
local content_w = window_w - content_margin * 2
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.item_display_popup,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			0,
			2,
		},
		size = {
			window_w,
			window_h,
		},
	},
	window_top_detail = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		position = {
			0,
			0,
			6,
		},
		size = {
			45,
			12,
		},
	},
	body = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		position = {
			0,
			75,
			0,
		},
		size = {
			content_w,
			380,
		},
	},
	ok_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		position = {
			0,
			50,
			10,
		},
		size = {
			320,
			76,
		},
	},
}
local body_text_style = {
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		2,
	},
}
local disable_with_gamepad = true
local widget_definitions = {
	window_background = UIWidgets.create_simple_texture("wom_upsell_popup_bg", "window"),
	window_top_detail = UIWidgets.create_simple_texture("tab_selection_01_bottom", "window_top_detail"),
	window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, "upsell_image_keyart_frame", 5),
	screen_background = UIWidgets.create_simple_rect("screen", {
		150,
		0,
		0,
		0,
	}),
	body_text = UIWidgets.create_simple_text("not_assigned", "body", nil, nil, body_text_style),
	ok_button = UIWidgets.create_default_button("ok_button", scenegraph_definition.ok_button.size, "upsell_image_button_frame", "button_bg_01", "", nil, nil, nil, nil, disable_with_gamepad, true),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.5,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1 - math.easeOutCubic(progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
}
