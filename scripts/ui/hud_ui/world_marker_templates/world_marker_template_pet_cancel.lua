-- chunkname: @scripts/ui/hud_ui/world_marker_templates/world_marker_template_pet_cancel.lua

local NAME = "pet_cancel"

WorldMarkerTemplates = WorldMarkerTemplates or {}

local template = WorldMarkerTemplates[NAME] or {}

WorldMarkerTemplates[NAME] = template
template.position_offset = {
	0,
	0,
	0.2,
}
template.unit_node = "j_spine"
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
			text = "[LEFT] Cancel command",
			text_bg = "tab_menu_bg_03",
		},
		style = {
			text_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				offset = {
					40,
					0,
					-1,
				},
				texture_size = {
					200,
					30,
				},
			},
			text = {
				font_size = 16,
				font_type = "hell_shark_header",
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
					-15,
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
