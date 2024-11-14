-- chunkname: @scripts/ui/hint_ui/hint_ui_versus_how_to_play_definitions.lua

local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.popup,
		},
	},
	hint_anchor = {
		horizontal_alignment = "right",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-400,
			0,
			1,
		},
	},
}
local widget_definitions = {}
local animation_definitions = {
	enter = {
		{
			end_progress = 0.75,
			name = "slide_and_fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				params.render_settings.alpha_multiplier = 0

				local wwise_world = params.wwise_world

				WwiseWorld.trigger_event(wwise_world, "Play_hud_gameplay_hint")
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				if not widget then
					return
				end

				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = progress
				widget.offset[1] = 400 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
		},
	},
	exit = {
		{
			end_progress = 0.5,
			name = "slide_and_fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				if not widget then
					return
				end

				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - progress
				widget.offset[1] = 400 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				local self = params.self

				self:hide()
			end,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
}
