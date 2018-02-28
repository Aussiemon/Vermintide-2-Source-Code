UIWidgetUtils = UIWidgetUtils or {}
UIWidgetUtils.animate_default_button = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt*input_speed, 1)
	else
		input_progress = math.max(input_progress - dt*input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt*speed, 1)
	else
		hover_progress = math.max(hover_progress - dt*speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt*speed, 1)
	else
		selection_progress = math.max(selection_progress - dt*speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local input_alpha = input_progress*255
	style.clicked_rect.color[1] = input_progress*100
	local hover_alpha = hover_progress*255
	style.hover_glow.color[1] = hover_alpha
	local text_disabled_style = style.title_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color
	disabled_text_color[2] = disabled_default_text_color[2]*0.4
	disabled_text_color[3] = disabled_default_text_color[3]*0.4
	disabled_text_color[4] = disabled_default_text_color[4]*0.4
	local title_text_style = style.title_text
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	local title_select_text_color = title_text_style.select_text_color

	Colors.lerp_color_tables(title_default_text_color, title_select_text_color, combined_progress, title_text_color)

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress

	return 
end
UIWidgetUtils.animate_default_icon_tabs = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local amount = content.amount
	local speed = 8
	local input_speed = 20

	for i = 1, amount, 1 do
		local name_suffix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_suffix
		local hotspot = content[hotspot_name]
		local is_hover = hotspot.is_hover
		local is_selected = hotspot.is_selected
		local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
		local input_progress = hotspot.input_progress or 0
		local hover_progress = hotspot.hover_progress or 0
		local selection_progress = hotspot.selection_progress or 0

		if input_pressed then
			input_progress = math.min(input_progress + dt*input_speed, 1)
		else
			input_progress = math.max(input_progress - dt*input_speed, 0)
		end

		local input_easing_out_progress = math.easeOutCubic(input_progress)
		local input_easing_in_progress = math.easeInCubic(input_progress)

		if is_hover then
			hover_progress = math.min(hover_progress + dt*speed, 1)
		else
			hover_progress = math.max(hover_progress - dt*speed, 0)
		end

		local hover_easing_out_progress = math.easeOutCubic(hover_progress)
		local hover_easing_in_progress = math.easeInCubic(hover_progress)

		if is_selected then
			selection_progress = math.min(selection_progress + dt*speed, 1)
		else
			selection_progress = math.max(selection_progress - dt*speed, 0)
		end

		local select_easing_out_progress = math.easeOutCubic(selection_progress)
		local select_easing_in_progress = math.easeInCubic(selection_progress)
		local combined_progress = math.max(hover_progress, selection_progress)
		local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
		local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
		local clicked_rect_name = "clicked_rect" .. name_suffix
		local input_alpha = input_progress*255
		style[clicked_rect_name].color[1] = input_progress*100
		local hover_glow_name = "hover_glow" .. name_suffix
		local hover_alpha = combined_progress*255
		style[hover_glow_name].color[1] = hover_alpha
		local icon_name = "icon" .. name_suffix
		local icon_style = style[icon_name]
		local icon_color = icon_style.color
		local icon_default_color = icon_style.default_color
		local icon_select_color = icon_style.select_color

		Colors.lerp_color_tables(icon_default_color, icon_select_color, combined_progress, icon_color)

		hotspot.hover_progress = hover_progress
		hotspot.input_progress = input_progress
		hotspot.selection_progress = selection_progress
	end

	return 
end
UIWidgetUtils.animate_default_checkbox_button = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local speed = 8
	local input_speed = 20
	local hotspot_name = "button_hotspot"
	local hotspot = content[hotspot_name]
	local is_hover = not hotspot.disable_button and hotspot.is_hover
	local is_selected = not hotspot.disable_button and hotspot.is_selected
	local input_pressed = hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0

	if input_pressed then
		input_progress = math.min(input_progress + dt*input_speed, 1)
	else
		input_progress = math.max(input_progress - dt*input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt*speed, 1)
	else
		hover_progress = math.max(hover_progress - dt*speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt*speed, 1)
	else
		selection_progress = math.max(selection_progress - dt*speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local clicked_rect_name = "clicked_rect"
	local input_alpha = input_progress*255
	style[clicked_rect_name].color[1] = input_progress*100
	local hover_glow_name = "hover_glow"
	local hover_alpha = combined_progress*255
	style[hover_glow_name].color[1] = hover_alpha
	local text_disabled_name = "text_disabled"
	local text_disabled_style = style[text_disabled_name]
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color
	disabled_text_color[2] = disabled_default_text_color[2]*0.4
	disabled_text_color[3] = disabled_default_text_color[3]*0.4
	disabled_text_color[4] = disabled_default_text_color[4]*0.4
	local text_name = "text"
	local text_style = style[text_name]
	local text_color = text_style.text_color
	local default_text_color = text_style.default_text_color
	local select_text_color = text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, text_color)

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress

	return 
end
UIWidgetUtils.animate_default_text_tabs = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local amount = content.amount
	local speed = 8
	local input_speed = 20

	for i = 1, amount, 1 do
		local name_suffix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_suffix
		local hotspot = content[hotspot_name]
		local is_hover = hotspot.is_hover
		local is_selected = hotspot.is_selected
		local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
		local input_progress = hotspot.input_progress or 0
		local hover_progress = hotspot.hover_progress or 0
		local selection_progress = hotspot.selection_progress or 0

		if input_pressed then
			input_progress = math.min(input_progress + dt*input_speed, 1)
		else
			input_progress = math.max(input_progress - dt*input_speed, 0)
		end

		local input_easing_out_progress = math.easeOutCubic(input_progress)
		local input_easing_in_progress = math.easeInCubic(input_progress)

		if is_hover then
			hover_progress = math.min(hover_progress + dt*speed, 1)
		else
			hover_progress = math.max(hover_progress - dt*speed, 0)
		end

		local hover_easing_out_progress = math.easeOutCubic(hover_progress)
		local hover_easing_in_progress = math.easeInCubic(hover_progress)

		if is_selected then
			selection_progress = math.min(selection_progress + dt*speed, 1)
		else
			selection_progress = math.max(selection_progress - dt*speed, 0)
		end

		local select_easing_out_progress = math.easeOutCubic(selection_progress)
		local select_easing_in_progress = math.easeInCubic(selection_progress)
		local combined_progress = math.max(hover_progress, selection_progress)
		local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
		local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
		local clicked_rect_name = "clicked_rect" .. name_suffix
		local input_alpha = input_progress*255
		style[clicked_rect_name].color[1] = input_progress*100
		local hover_glow_name = "hover_glow" .. name_suffix
		local hover_alpha = combined_progress*255
		style[hover_glow_name].color[1] = hover_alpha
		local text_disabled_name = "text_disabled" .. name_suffix
		local text_disabled_style = style[text_disabled_name]
		local disabled_default_text_color = text_disabled_style.default_text_color
		local disabled_text_color = text_disabled_style.text_color
		disabled_text_color[2] = disabled_default_text_color[2]*0.4
		disabled_text_color[3] = disabled_default_text_color[3]*0.4
		disabled_text_color[4] = disabled_default_text_color[4]*0.4
		local text_name = "text" .. name_suffix
		local text_style = style[text_name]
		local text_color = text_style.text_color
		local default_text_color = text_style.default_text_color
		local select_text_color = text_style.select_text_color

		Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, text_color)

		hotspot.hover_progress = hover_progress
		hotspot.input_progress = input_progress
		hotspot.selection_progress = selection_progress
	end

	return 
end

return 
