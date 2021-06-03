UIElement = UIElement or {}

UIElement.init = function (element_definition, content, style, style_global)
	local pass_data = {}

	for i, pass in ipairs(element_definition.passes) do
		local pass_type = pass.pass_type

		assert(pass_type, "No pass type in element definition.")

		local ui_pass = UIPasses[pass_type]

		fassert(ui_pass, "No such pass-type: %s", pass_type)

		pass_data[i] = ui_pass.init(pass, content, style, style_global)
		local global_color_id = pass.global_color_id

		if global_color_id then
			local style_id = pass.style_id

			if style_id then
				local color = style_global[global_color_id]

				fassert(color, "No global_color for id: %s.", global_color_id)

				if pass_type == "text" then
					style[style_id].text_color = color
				else
					style[style_id].color = color
				end
			end
		end
	end

	return {
		pass_data = pass_data,
		passes = element_definition.passes
	}
end

UIElement.destroy = function (ui_renderer, element)
	for i, pass in ipairs(element.passes) do
		local pass_type = pass.pass_type

		assert(pass_type, "No pass type in element definition.")

		local ui_pass = UIPasses[pass_type]

		fassert(ui_pass, "No such pass-type: %s", pass_type)

		local pass_data = element.pass_data[i]

		if ui_pass.destroy then
			ui_pass.destroy(ui_renderer, pass_data, pass)
		end
	end
end

UIWidget = UIWidget or {}

UIWidget.init = function (widget_definition)
	local content = table.clone(widget_definition.content)
	local style = table.clone(widget_definition.style or {})
	local style_global = table.clone(widget_definition.style_global or {})
	local offset = widget_definition.offset and table.clone(widget_definition.offset)

	return {
		element = UIElement.init(widget_definition.element, content, style, style_global),
		content = content,
		style = style,
		style_global = style_global,
		scenegraph_id = widget_definition.scenegraph_id,
		offset = offset,
		animations = {}
	}
end

UIWidget.destroy = function (ui_renderer, widget)
	UIElement.destroy(ui_renderer, widget.element)
end

UIWidget.animate = function (widget, animation)
	widget.animations[animation] = true
end

UIWidget.stop_animations = function (widget)
	table.clear(widget.animations)
end

UIWidget.has_animation = function (widget)
	return (next(widget.animations) and true) or false
end

return
