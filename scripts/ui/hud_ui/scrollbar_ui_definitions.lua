local function create_scrollbar(scenegraph_id, area_size, scroll_size)
	return {
		element = {
			passes = {
				{
					style_id = "scroller_hotspot",
					pass_type = "hotspot",
					content_id = "scroller_hotspot"
				},
				{
					style_id = "scrollbar_hotspot",
					pass_type = "hotspot",
					content_id = "scrollbar_hotspot"
				},
				{
					pass_type = "rounded_background",
					style_id = "scrollbar_bg"
				},
				{
					pass_type = "rounded_background",
					style_id = "scrollbar_bg_bg"
				},
				{
					style_id = "scroller",
					pass_type = "rounded_background",
					content_change_function = function (content, style)
						local scroller_height = style.rect_size[2]
						local scrollbar_height = style.parent.scrollbar_bg.rect_size[2]
						local height_offset = content.progress * (scrollbar_height - scroller_height) * -1
						style.offset[2] = height_offset
						style.parent.scroller_hotspot.offset[2] = height_offset
					end
				}
			}
		},
		content = {
			scroller_hotspot = {},
			scrollbar_hotspot = {}
		},
		style = {
			scroller_hotspot = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				area_size = {
					18,
					math.max((1 - scroll_size / (scroll_size + area_size[2])) * area_size[2], 40)
				},
				offset = {
					9,
					0,
					102
				}
			},
			scrollbar_hotspot = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				area_size = {
					22,
					area_size[2] + 2
				},
				offset = {
					11,
					-1,
					101
				}
			},
			scroller = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				corner_radius = 4,
				rect_size = {
					8,
					math.max((1 - scroll_size / (scroll_size + area_size[2])) * area_size[2], 40)
				},
				color = {
					128,
					40,
					40,
					40
				},
				offset = {
					4,
					0,
					102
				}
			},
			scrollbar_bg = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				corner_radius = 4,
				rect_size = {
					10,
					area_size[2]
				},
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					5,
					0,
					101
				}
			},
			scrollbar_bg_bg = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				corner_radius = 4,
				rect_size = {
					12,
					area_size[2] + 2
				},
				color = {
					128,
					40,
					40,
					40
				},
				offset = {
					6,
					-1,
					100
				}
			}
		},
		offset = {
			0,
			0,
			100
		},
		scenegraph_id = scenegraph_id
	}
end

local widget_func_definitions = {
	scrollbar = create_scrollbar
}

local function setup_func(ui_scenegraph, scenegraph_id, scroll_height)
	local widgets = {}
	local widgets_by_name = {}
	local size = ui_scenegraph[scenegraph_id].size

	for name, widget_func_definition in pairs(widget_func_definitions) do
		local widget_definition = widget_func_definition(scenegraph_id, size, scroll_height)
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	return widgets, widgets_by_name
end

return {
	setup_func = setup_func
}
