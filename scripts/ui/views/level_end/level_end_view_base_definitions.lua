-- chunkname: @scripts/ui/views/level_end/level_end_view_base_definitions.lua

local transition_scenegraph_definition = {
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
}
local transition_widget_definition = {
	transition_fade = UIWidgets.create_simple_rect("screen", {
		255,
		0,
		0,
		0,
	}),
}
local transition_animations = {
	transition = {
		{
			end_progress = 1,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, transition_scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, transition_scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = alpha_progress
			end,
			on_complete = function (ui_scenegraph, transition_scenegraph_definition, widgets, params)
				local parent = params.parent

				if parent.game_won then
					params.parent:play_sound("Stop_parading_screen_amb")
				end
			end,
		},
		{
			end_progress = 1,
			name = "position_camera",
			start_progress = 1,
			init = function (ui_scenegraph, transition_scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, transition_scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, transition_scenegraph_definition, widgets, params)
				local parent = params.parent

				parent:transition_camera(params.transition_data)

				local world = parent._world
				local shading_settings = World.get_data(world, "shading_settings")

				shading_settings[1] = "default"
			end,
		},
		{
			end_progress = 2,
			name = "fade_in",
			start_progress = 1,
			init = function (ui_scenegraph, transition_scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, transition_scenegraph_definition, widgets, progress, params)
				local alpha_progress = math.easeInCubic(progress)

				params.render_settings.alpha_multiplier = 1 - alpha_progress
			end,
			on_complete = function (ui_scenegraph, transition_scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	default = {
		end_progress = 0,
		name = "default",
		start_progress = 0,
		init = function (ui_scenegraph, transition_scenegraph_definition, widgets, params)
			return
		end,
		update = function (ui_scenegraph, transition_scenegraph_definition, widgets, progress, params)
			return
		end,
		on_complete = function (ui_scenegraph, transition_scenegraph_definition, widgets, params)
			return
		end,
	},
}

return {
	transition_scenegraph_definition = transition_scenegraph_definition,
	transition_widget_definition = transition_widget_definition,
	transition_animations = transition_animations,
}
