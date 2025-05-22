-- chunkname: @scripts/ui/views/level_end/states/definitions/end_view_state_parading_definitions.lua

local scenegraph_definitions = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.end_screen,
		},
	},
	continue_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			300,
			75,
		},
		position = {
			0,
			-200,
			0,
		},
	},
}
local DISABLE_WITH_GAMEPAD = true
local widget_definitions = {
	continue_button = UIWidgets.create_default_button("continue_button", scenegraph_definitions.continue_button.size, nil, nil, Localize("continue_menu_button_name"), 25, nil, nil, nil, DISABLE_WITH_GAMEPAD),
}
local animation_definitions = {
	animate_continue_button = {
		{
			end_progress = 0.3,
			name = "translate",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local eased_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = eased_progress

				local widget = widgets.continue_button

				widget.offset[2] = math.lerp(-200, 280, eased_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "continue_menu_button_name",
			input_action = "confirm",
			priority = 1,
		},
	},
}

return {
	scenegraph_definitions = scenegraph_definitions,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	generic_input_actions = generic_input_actions,
}
