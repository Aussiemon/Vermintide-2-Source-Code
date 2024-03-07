﻿-- chunkname: @scripts/ui/views/end_screen_ui_definitions.lua

local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.end_screen_banner,
		},
		size = {
			1920,
			1080,
		},
	},
}
local widget_definitions = {
	background_rect = {
		scenegraph_id = "screen",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "rect",
				},
			},
		},
		content = {},
		style = {
			rect = {
				color = {
					0,
					0,
					0,
					0,
				},
			},
		},
	},
}
local animations = {
	fade_in_background = {
		{
			end_progress = 0.2,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local mechanism_manager = Managers.mechanism
				local mechanism_name = mechanism_manager:current_mechanism_name()

				params.draw_background = mechanism_name ~= "versus"
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_fraction = math.easeOutCubic(local_progress)
				local widget = widgets[1]
				local color = widget.style.rect.color
				local alpha = 255 * anim_fraction

				color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	fade_out_background = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_fraction = math.easeOutCubic(local_progress)
				local widget = widgets[1]
				local color = widget.style.rect.color
				local alpha = 255 - anim_fraction * 255

				color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.draw_background = false
			end,
		},
	},
	auto_display_text = {
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				params.draw_flags.draw_text = true

				local anim_fraction = math.easeOutCubic(local_progress)
				local widget = widgets[1]

				widget.style.banner_effect_texture.color[1] = anim_fraction * 255
				widget.style.banner_texture.color[1] = anim_fraction * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 4.5,
			name = "fade_out",
			start_progress = 4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, local_progress, params)
				local anim_fraction = math.easeOutCubic(local_progress)
				local widget = widgets[1]

				widget.style.banner_effect_texture.color[1] = (1 - anim_fraction) * 255
				widget.style.banner_texture.color[1] = (1 - anim_fraction) * 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.draw_text = false
			end,
		},
	},
}
local screens = {
	victory = {
		class_name = "VictoryEndScreenUI",
		file_name = "scripts/ui/views/end_screens/victory_end_screen_ui",
	},
	defeat = {
		class_name = "DefeatEndScreenUI",
		file_name = "scripts/ui/views/end_screens/defeat_end_screen_ui",
	},
	none = {
		class_name = "NoneEndScreenUI",
		file_name = "scripts/ui/views/end_screens/none_end_screen_ui",
	},
}

DLCUtils.merge("ui_end_screens", screens)

for name, definition in pairs(screens) do
	fassert(definition.file_name, "end screen (%s) needs a file name", name)
	fassert(definition.class_name, "end screen (%s) needs a class name", name)
end

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widget_definitions,
	animations = animations,
	screens = screens,
}
