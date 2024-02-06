-- chunkname: @scripts/ui/hud_ui/scrollbar_ui_definitions.lua

local function create_scrollbar(scenegraph_id, area_size, scroll_size, horizontal_scrollbar)
	return {
		element = {
			passes = {
				{
					content_id = "scroller_hotspot",
					pass_type = "hotspot",
					style_id = "scroller_hotspot",
				},
				{
					content_id = "scrollbar_hotspot",
					pass_type = "hotspot",
					style_id = "scrollbar_hotspot",
				},
				{
					pass_type = "rounded_background",
					style_id = "scrollbar_bg",
				},
				{
					pass_type = "rounded_background",
					style_id = "scrollbar_bg_bg",
				},
				{
					pass_type = "rounded_background",
					style_id = "scroller",
					content_change_function = function (content, style)
						if content.horizontal_scrollbar then
							local scroller_height = style.rect_size[1]
							local scrollbar_height = style.parent.scrollbar_bg.rect_size[1]
							local height_offset = content.progress * (scrollbar_height - scroller_height) * -1

							style.offset[1] = -height_offset
							style.parent.scroller_hotspot.offset[1] = -height_offset
						else
							local scroller_height = style.rect_size[2]
							local scrollbar_height = style.parent.scrollbar_bg.rect_size[2]
							local height_offset = content.progress * (scrollbar_height - scroller_height) * -1

							style.offset[2] = height_offset
							style.parent.scroller_hotspot.offset[2] = height_offset
						end
					end,
				},
			},
		},
		content = {
			scroller_hotspot = {},
			scrollbar_hotspot = {},
			horizontal_scrollbar = horizontal_scrollbar,
		},
		style = {
			scroller_hotspot = {
				area_size = horizontal_scrollbar and {
					math.max((1 - scroll_size / (scroll_size + area_size[1])) * area_size[1], 40),
					18,
				} or {
					18,
					math.max((1 - scroll_size / (scroll_size + area_size[2])) * area_size[2], 40),
				},
				vertical_alignment = horizontal_scrollbar and "bottom" or "top",
				horizontal_alignment = horizontal_scrollbar and "left" or "right",
				offset = horizontal_scrollbar and {
					0,
					-1,
					102,
				} or {
					9,
					0,
					102,
				},
			},
			scrollbar_hotspot = {
				vertical_alignment = "bottom",
				area_size = horizontal_scrollbar and {
					area_size[1] + 2,
					22,
				} or {
					22,
					area_size[2] + 2,
				},
				horizontal_alignment = horizontal_scrollbar and "left" or "right",
				offset = horizontal_scrollbar and {
					-1,
					1,
					101,
				} or {
					11,
					-1,
					101,
				},
			},
			scroller = {
				corner_radius = 4,
				rect_size = horizontal_scrollbar and {
					math.max((1 - scroll_size / (scroll_size + area_size[1])) * area_size[1], 40),
					8,
				} or {
					8,
					math.max((1 - scroll_size / (scroll_size + area_size[2])) * area_size[2], 40),
				},
				vertical_alignment = horizontal_scrollbar and "bottom" or "top",
				horizontal_alignment = horizontal_scrollbar and "left" or "right",
				color = {
					128,
					255,
					255,
					255,
				},
				offset = horizontal_scrollbar and {
					0,
					6,
					102,
				} or {
					4,
					0,
					102,
				},
			},
			scrollbar_bg = {
				corner_radius = 4,
				vertical_alignment = "bottom",
				rect_size = horizontal_scrollbar and {
					area_size[1],
					10,
				} or {
					10,
					area_size[2],
				},
				horizontal_alignment = horizontal_scrollbar and "left" or "right",
				color = {
					255,
					0,
					0,
					0,
				},
				offset = horizontal_scrollbar and {
					0,
					5,
					101,
				} or {
					5,
					0,
					101,
				},
			},
			scrollbar_bg_bg = {
				corner_radius = 4,
				vertical_alignment = "bottom",
				rect_size = horizontal_scrollbar and {
					area_size[1] + 2,
					12,
				} or {
					12,
					area_size[2] + 2,
				},
				horizontal_alignment = horizontal_scrollbar and "left" or "right",
				color = {
					128,
					255,
					255,
					255,
				},
				offset = horizontal_scrollbar and {
					-1,
					4,
					100,
				} or {
					6,
					-1,
					100,
				},
			},
		},
		offset = {
			0,
			0,
			100,
		},
		scenegraph_id = scenegraph_id,
	}
end

local widget_func_definitions = {
	scrollbar = create_scrollbar,
}

local function setup_func(ui_scenegraph, scenegraph_id, scroll_height, horizontal_scrollbar)
	local widgets = {}
	local widgets_by_name = {}
	local size = ui_scenegraph[scenegraph_id].size

	for name, widget_func_definition in pairs(widget_func_definitions) do
		local widget_definition = widget_func_definition(scenegraph_id, size, scroll_height, horizontal_scrollbar)
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	return widgets, widgets_by_name
end

return {
	setup_func = setup_func,
}
