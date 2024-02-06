﻿-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_pet_nameplate.lua

local NAME = "pet_nameplate"

WorldMarkerTemplates = WorldMarkerTemplates or {}

local template = WorldMarkerTemplates[NAME] or {}

WorldMarkerTemplates[NAME] = template
template.position_offset = {
	0,
	0,
	1.9,
}
template.check_line_of_sight = true
template.screen_clamp = false

template.create_widget_definition = function (scenegraph_id)
	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "progress_background",
				},
				{
					pass_type = "rect",
					style_id = "progress_foreground",
					content_change_function = function (content, style)
						style.texture_size[1] = content.progress * style.max_width
					end,
				},
				{
					pass_type = "texture",
					style_id = "text_bg",
					texture_id = "text_bg",
					content_check_function = function (content)
						return content.text
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end,
				},
			},
		},
		content = {
			progress = 0.5,
			text_bg = "tab_menu_bg_03",
		},
		style = {
			progress_background = {
				vertical_alignment = "top",
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					25,
					0,
					0,
				},
				texture_size = {
					50,
					10,
				},
			},
			progress_foreground = {
				max_width = 46,
				vertical_alignment = "top",
				color = {
					255,
					87,
					161,
					34,
				},
				offset = {
					27,
					-2,
					1,
				},
				texture_size = {
					0,
					6,
				},
			},
			text_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				offset = {
					40,
					10,
					-1,
				},
				texture_size = {
					200,
					30,
				},
				color = {
					155,
					255,
					255,
					255,
				},
			},
			text = {
				font_size = 16,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "top",
				text_color = {
					255,
					215,
					215,
					215,
				},
				offset = {
					0,
					10,
					3,
				},
				size = {
					100,
					10,
				},
			},
		},
	}
end

template.on_enter = function (widget)
	local content = widget.content

	content.progress = 1
end
