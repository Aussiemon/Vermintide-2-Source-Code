-- chunkname: @scripts/helpers/ui_widget_utils.lua

UIWidgetUtils = UIWidgetUtils or {}

UIWidgetUtils.animate_default_button = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_selected = hotspot.is_selected
	local is_hover = is_selected or hotspot.is_hover
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local input_alpha = 255 * input_progress
	local clicked_rect_style = style.clicked_rect

	if clicked_rect_style then
		clicked_rect_style.color[1] = 100 * input_progress
	end

	local hover_glow_style = style.hover_glow

	if hover_glow_style then
		local hover_alpha = 255 * combined_progress

		hover_glow_style.color[1] = hover_alpha
	end

	local text_disabled_style = style.title_text_disabled

	if text_disabled_style then
		local disabled_default_text_color = text_disabled_style.default_text_color
		local disabled_text_color = text_disabled_style.text_color

		disabled_text_color[2] = disabled_default_text_color[2] * 0.4
		disabled_text_color[3] = disabled_default_text_color[3] * 0.4
		disabled_text_color[4] = disabled_default_text_color[4] * 0.4
	end

	local icon_style = style.icon

	if icon_style then
		local icon_color = icon_style.color
		local icon_default_color = icon_style.default_color
		local icon_select_color = icon_style.select_color

		Colors.lerp_color_tables(icon_default_color, icon_select_color, combined_progress, icon_color)
	end

	local title_text_style = style.title_text

	if title_text_style then
		local title_text_color = title_text_style.text_color
		local title_default_text_color = title_text_style.default_text_color
		local title_select_text_color = title_text_style.select_text_color

		Colors.lerp_color_tables(title_default_text_color, title_select_text_color, combined_progress, title_text_color)
	end

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

UIWidgetUtils.animate_default_icon_tabs = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local amount = content.amount
	local speed = 8
	local input_speed = 20

	for i = 1, amount do
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
			input_progress = math.min(input_progress + dt * input_speed, 1)
		else
			input_progress = math.max(input_progress - dt * input_speed, 0)
		end

		local input_easing_out_progress = math.easeOutCubic(input_progress)
		local input_easing_in_progress = math.easeInCubic(input_progress)

		if is_hover then
			hover_progress = math.min(hover_progress + dt * speed, 1)
		else
			hover_progress = math.max(hover_progress - dt * speed, 0)
		end

		local hover_easing_out_progress = math.easeOutCubic(hover_progress)
		local hover_easing_in_progress = math.easeInCubic(hover_progress)

		if is_selected then
			selection_progress = math.min(selection_progress + dt * speed, 1)
		else
			selection_progress = math.max(selection_progress - dt * speed, 0)
		end

		local select_easing_out_progress = math.easeOutCubic(selection_progress)
		local select_easing_in_progress = math.easeInCubic(selection_progress)
		local combined_progress = math.max(hover_progress, selection_progress)
		local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
		local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
		local clicked_rect_name = "clicked_rect" .. name_suffix
		local input_alpha = 255 * input_progress

		style[clicked_rect_name].color[1] = 100 * input_progress

		local hover_glow_name = "hover_glow" .. name_suffix
		local hover_alpha = 255 * combined_progress

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
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local input_alpha = 255 * input_progress
	local clicked_rect_name = "clicked_rect"
	local clicked_rect_style = style[clicked_rect_name]

	if clicked_rect_style then
		clicked_rect_style.color[1] = 100 * input_progress
	end

	local hover_alpha = 255 * hover_progress
	local hover_glow_name = "hover_glow"
	local hover_glow_style = style[hover_glow_name]

	if hover_glow_style then
		hover_glow_style.color[1] = hover_alpha
	end

	local text_disabled_name = "text_disabled"
	local text_disabled_style = style[text_disabled_name]
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color

	disabled_text_color[2] = disabled_default_text_color[2] * 0.4
	disabled_text_color[3] = disabled_default_text_color[3] * 0.4
	disabled_text_color[4] = disabled_default_text_color[4] * 0.4

	local text_name = "text"
	local text_style = style[text_name]
	local text_color = text_style.text_color
	local default_text_color = text_style.default_text_color
	local select_text_color = text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, text_color)

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

UIWidgetUtils.animate_default_checkbox_button_console = function (widget, dt)
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
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local clicked_rect_name = "clicked_rect"
	local input_alpha = 255 * input_progress

	style[clicked_rect_name].color[1] = 100 * input_progress

	local hover_glow_name = "hover_glow"
	local hover_alpha = 255 * hover_progress

	style[hover_glow_name].color[1] = hover_alpha

	local text_disabled_name = "text_disabled"
	local text_disabled_style = style[text_disabled_name]
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color

	disabled_text_color[2] = disabled_default_text_color[2] * 0.4
	disabled_text_color[3] = disabled_default_text_color[3] * 0.4
	disabled_text_color[4] = disabled_default_text_color[4] * 0.4

	local text_name = "text"
	local text_style = style[text_name]
	local text_color = text_style.text_color
	local default_text_color = text_style.default_text_color
	local select_text_color = text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, text_color)

	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

UIWidgetUtils.animate_default_text_tabs = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local amount = content.amount
	local speed = 8
	local input_speed = 20

	for i = 1, amount do
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
			input_progress = math.min(input_progress + dt * input_speed, 1)
		else
			input_progress = math.max(input_progress - dt * input_speed, 0)
		end

		local input_easing_out_progress = math.easeOutCubic(input_progress)
		local input_easing_in_progress = math.easeInCubic(input_progress)

		if is_hover then
			hover_progress = math.min(hover_progress + dt * speed, 1)
		else
			hover_progress = math.max(hover_progress - dt * speed, 0)
		end

		local hover_easing_out_progress = math.easeOutCubic(hover_progress)
		local hover_easing_in_progress = math.easeInCubic(hover_progress)

		if is_selected then
			selection_progress = math.min(selection_progress + dt * speed, 1)
		else
			selection_progress = math.max(selection_progress - dt * speed, 0)
		end

		local select_easing_out_progress = math.easeOutCubic(selection_progress)
		local select_easing_in_progress = math.easeInCubic(selection_progress)
		local combined_progress = math.max(hover_progress, selection_progress)
		local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
		local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
		local clicked_rect_name = "clicked_rect" .. name_suffix
		local input_alpha = 255 * input_progress

		style[clicked_rect_name].color[1] = 100 * input_progress

		local hover_glow_name = "hover_glow" .. name_suffix
		local hover_alpha = 255 * combined_progress

		style[hover_glow_name].color[1] = hover_alpha

		local text_disabled_name = "text_disabled" .. name_suffix
		local text_disabled_style = style[text_disabled_name]
		local disabled_default_text_color = text_disabled_style.default_text_color
		local disabled_text_color = text_disabled_style.text_color

		disabled_text_color[2] = disabled_default_text_color[2] * 0.4
		disabled_text_color[3] = disabled_default_text_color[3] * 0.4
		disabled_text_color[4] = disabled_default_text_color[4] * 0.4

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
end

UIWidgetUtils.animate_option_button = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local has_focus = content.has_focus
	local is_hover = hotspot.is_hover or has_focus
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local input_alpha = 255 * input_progress

	style.button_clicked_rect.color[1] = 100 * input_progress
	style.hover_glow.color[1] = 255 * combined_progress

	local select_alpha = 255 * selection_progress

	style.select_glow.color[1] = select_alpha
	style.icon_selected.color[1] = select_alpha
	style.skull_select_glow.color[1] = select_alpha
	style.icon_bg_glow.color[1] = select_alpha

	local text_disabled_style = style.button_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color

	disabled_text_color[2] = disabled_default_text_color[2] * 0.4
	disabled_text_color[3] = disabled_default_text_color[3] * 0.4
	disabled_text_color[4] = disabled_default_text_color[4] * 0.4

	local button_text_style = style.button_text
	local button_text_color = button_text_style.text_color
	local default_text_color = button_text_style.default_text_color
	local select_text_color = button_text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, button_text_color)

	local icon_color = style.icon.color

	icon_color[2] = button_text_color[2]
	icon_color[3] = button_text_color[3]
	icon_color[4] = button_text_color[4]

	local background_icon_style = style.background_icon
	local background_icon_color = background_icon_style.color
	local background_icon_default_color = background_icon_style.default_color

	background_icon_color[2] = background_icon_default_color[2] + combined_progress * (255 - background_icon_default_color[2])
	background_icon_color[3] = background_icon_default_color[3] + combined_progress * (255 - background_icon_default_color[3])
	background_icon_color[4] = background_icon_default_color[4] + combined_progress * (255 - background_icon_default_color[4])
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

UIWidgetUtils.animate_start_game_console_setting_button = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local is_selected = content.is_selected
	local selected_progress = content.selected_progress or 0
	local speed = 15

	if is_selected then
		selected_progress = math.min(selected_progress + speed * dt, 1)
	else
		selected_progress = math.max(selected_progress - speed * dt, 0)
	end

	local alpha = 255 * selected_progress

	style.bg_effect.color[1] = alpha
	style.icon_texture_glow.color[1] = alpha
	content.selected_progress = selected_progress
end

UIWidgetUtils.animate_arrow_button = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.hotspot or content.button_hotspot
	local has_focus = content.has_focus
	local is_hover = hotspot.is_hover or has_focus
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local combined_progress = math.max(hover_progress, selection_progress)

	style.texture_hover_id.color[1] = 255 * combined_progress
	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
end

UIWidgetUtils.animate_icon_button = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.hotspot or content.button_hotspot
	local has_focus = content.has_focus
	local is_hover = hotspot.is_hover or has_focus
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local combined_progress = math.max(hover_progress, selection_progress)
	local texture_hover_style = style.texture_hover

	Colors.lerp_color_tables(texture_hover_style.default_color, texture_hover_style.hover_color, combined_progress, texture_hover_style.color)

	local texture_icon_style = style.texture_icon

	Colors.lerp_color_tables(texture_icon_style.default_color, texture_icon_style.hover_color, combined_progress, texture_icon_style.color)

	hotspot.hover_progress = hover_progress
	hotspot.selection_progress = selection_progress
end

UIWidgetUtils.animate_play_button = function (widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_disabled = hotspot.disable_button
	local is_selected = hotspot.is_selected or content.is_selected
	local is_hover = is_selected or hotspot.is_hover
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local hover_alpha = 255 * hover_progress

	style.text.text_color[1] = 255 - hover_alpha
	style.text_hover.text_color[1] = hover_alpha
	style.texture_icon_id.color[1] = 255 - hover_alpha
	style.texture_icon_hover_id.color[1] = hover_alpha
	style.texture_text_bg_effect_id.color[1] = hover_alpha

	local active_progress = is_disabled and 0 or 1
	local active_alpha_progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5
	local active_alpha = math.max(hover_alpha, active_progress * (active_alpha_progress * 200 + 55))

	style.texture_hover_id.color[1] = active_alpha
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

UIWidgetUtils.get_level_frame_by_difficulty_index = function (difficulty_index)
	local difficulty_key = DefaultDifficulties[difficulty_index]

	if difficulty_key then
		local settings = DifficultySettings[difficulty_key]

		return settings.completed_frame_texture
	end

	return "map_frame_00"
end

UIWidgetUtils.animate_game_option_button = function (widget, dt)
	local function update_progress(hotspot, dt)
		local is_disabled = hotspot.disable_button
		local is_selected = hotspot.is_selected
		local on_hover_enter = hotspot.on_hover_enter
		local is_hover = hotspot.is_hover
		local gamepad_active = Managers.input:is_device_active("gamepad")
		local speed = (is_hover or is_selected) and 14 or 200
		local pulse_speed = 3
		local hover_progress = hotspot.hover_progress or 0
		local pulse_progress = hotspot.pulse_progress or 1
		local selection_progress = hotspot.selection_progress or 0

		if is_hover then
			hover_progress = math.min(hover_progress + dt * speed, 1)
		else
			hover_progress = math.max(hover_progress - dt * speed, 0)
		end

		if on_hover_enter then
			pulse_progress = 0
		end

		pulse_progress = math.min(pulse_progress + dt * pulse_speed, 1)

		if is_selected then
			selection_progress = math.min(selection_progress + dt * speed, 1)
		else
			selection_progress = math.max(selection_progress - dt * speed, 0)
		end

		hotspot.hover_progress = hover_progress
		hotspot.pulse_progress = pulse_progress
		hotspot.selection_progress = selection_progress
	end

	local content = widget.content
	local style = widget.style
	local button_hotspot = content.button_hotspot

	if button_hotspot then
		update_progress(button_hotspot, dt)

		local hover_progress = button_hotspot.hover_progress
		local pulse_progress = button_hotspot.pulse_progress
		local selection_progress = button_hotspot.selection_progress
		local combined_progress = math.max(hover_progress, selection_progress)
		local is_disabled = button_hotspot.disable_button
		local is_selected = button_hotspot.is_selected
		local alpha = 255 * combined_progress

		if style.background then
			style.background.color[1] = 50 * combined_progress
		end

		style.hover_frame.color[1] = alpha
		style.inner_frame.color[1] = 200 * combined_progress

		local icon_texture_style = style.icon_texture

		if icon_texture_style then
			local clolor_value = 200 + 55 * combined_progress
			local icon_texture_color = icon_texture_style.color

			icon_texture_color[2] = clolor_value
			icon_texture_color[3] = clolor_value
			icon_texture_color[4] = clolor_value
		end

		local icon_texture_locked_style = style.icon_texture_locked

		if icon_texture_locked_style then
			local clolor_value = 200 + 55 * combined_progress
			local icon_texture_color = icon_texture_locked_style.color

			icon_texture_color[2] = clolor_value
			icon_texture_color[3] = clolor_value
			icon_texture_color[4] = clolor_value
		end

		local pulse_alpha = 255 - 255 * pulse_progress

		style.pulse_frame.color[1] = pulse_alpha

		local title_text_style = style.title_text
		local text_color = title_text_style.text_color
		local default_text_color = title_text_style.default_text_color

		if default_text_color then
			local select_text_color = title_text_style.select_text_color

			Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, text_color)
		end

		local input_text_style = style.input_text

		if input_text_style then
			local input_text_color = input_text_style.text_color
			local default_input_text_color = input_text_style.default_text_color
			local select_text_color = input_text_style.select_text_color

			Colors.lerp_color_tables(default_input_text_color, select_text_color, combined_progress, input_text_color)
		end

		local input_text_unavailable_style = style.input_text_unavailable

		if input_text_unavailable_style then
			local input_text_color = input_text_unavailable_style.text_color
			local default_input_text_color = input_text_unavailable_style.default_text_color
			local select_text_color = input_text_unavailable_style.select_text_color

			Colors.lerp_color_tables(default_input_text_color, select_text_color, combined_progress, input_text_color)
		end

		local input_text_locked_style = style.input_text_locked

		if input_text_locked_style then
			local input_text_color = input_text_locked_style.text_color
			local default_input_text_color = input_text_locked_style.default_text_color
			local select_text_color = input_text_locked_style.select_text_color

			Colors.lerp_color_tables(default_input_text_color, select_text_color, combined_progress, input_text_color)
		end

		local input_text_locked_style = style.lock_texture

		if input_text_locked_style then
			local locked_color = input_text_locked_style.color

			locked_color[2] = text_color[2]
			locked_color[3] = text_color[3]
			locked_color[4] = text_color[4]
		end
	end

	local num_options = content.num_options

	if num_options then
		for i = 1, num_options do
			local hotspot_name = "button_hotspot_" .. i
			local hotspot = content[hotspot_name]

			update_progress(hotspot, dt)

			local hover_progress = hotspot.hover_progress
			local selection_progress = hotspot.selection_progress
			local is_disabled = hotspot.disable_button
			local is_selected = hotspot.is_selected
			local combined_progress = math.max(hover_progress, selection_progress)
			local option_text_name = "option_text_" .. i
			local option_text_style = style[option_text_name]

			if option_text_style then
				local text_color = option_text_style.text_color
				local default_text_color = option_text_style.default_text_color
				local select_text_color = option_text_style.select_text_color

				Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, text_color)

				local icon_name = "icon_" .. i
				local icon_style = style[icon_name]

				if icon_style then
					icon_style.color[2] = text_color[2]
					icon_style.color[3] = text_color[3]
					icon_style.color[4] = text_color[4]
				end
			end

			local icon_background_highlight_name = "icon_background_highlight_" .. i
			local icon_highlight_style = style[icon_background_highlight_name]

			if icon_highlight_style then
				icon_highlight_style.color[1] = combined_progress * 255
			end
		end
	end
end
