-- chunkname: @scripts/ui/ui_elements.lua

require("scripts/ui/ui_layer")

UIElements = {}
UIElements.ButtonMenuSteps = {
	passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			content_check_function = function (content)
				return not content.disabled
			end,
		},
		{
			pass_type = "texture",
			style_id = "texture",
			texture_id = "texture_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_hover and button_hotspot.is_clicked > 0 and not button_hotspot.is_selected
			end,
		},
		{
			pass_type = "texture",
			style_id = "texture",
			texture_id = "texture_hover_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "texture",
			texture_id = "texture_click_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and button_hotspot.is_clicked == 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "texture",
			texture_id = "texture_selected_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and button_hotspot.is_selected and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "texture",
			texture_id = "texture_disabled_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return button_hotspot.disabled
			end,
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "text",
			style_id = "text_hover",
			text_id = "text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "text",
			style_id = "text_selected",
			text_id = "text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and (button_hotspot.is_selected or button_hotspot.is_clicked == 0)
			end,
		},
		{
			pass_type = "text",
			style_id = "text_disabled",
			text_id = "text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return button_hotspot.disabled
			end,
		},
	},
}
UIElements.ButtonMenuStepsWithTimer = {
	passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			content_check_function = function (content)
				return not content.disabled
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_hover and button_hotspot.is_clicked > 0 and not button_hotspot.is_selected
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_hover_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_click_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and button_hotspot.is_clicked == 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_selected_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and button_hotspot.is_selected and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_disabled_id",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return button_hotspot.disabled
			end,
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "text",
			style_id = "text_hover",
			text_id = "text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "text",
			style_id = "text_selected",
			text_id = "text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and (button_hotspot.is_selected or button_hotspot.is_clicked == 0)
			end,
		},
		{
			pass_type = "text",
			style_id = "text_disabled",
			text_id = "text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return button_hotspot.disabled
			end,
		},
		{
			pass_type = "text",
			style_id = "timer_text_field",
			text_id = "timer_text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "text",
			style_id = "timer_text_field_hover",
			text_id = "timer_text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "text",
			style_id = "timer_text_field_selected",
			text_id = "timer_text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.disabled and (button_hotspot.is_selected or button_hotspot.is_clicked == 0)
			end,
		},
		{
			pass_type = "text",
			style_id = "timer_text_field_disabled",
			text_id = "timer_text_field",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return button_hotspot.disabled
			end,
		},
	},
}
UIElements.ToggleIconButton = {
	passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture",
			style_id = "normal_texture",
			texture_id = "normal_texture",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "hover_texture",
			texture_id = "hover_texture",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return button_hotspot.is_hover and button_hotspot.is_clicked ~= 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "click_texture",
			texture_id = "click_texture",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return button_hotspot.is_hover and button_hotspot.is_clicked == 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "toggle_texture",
			texture_id = "toggle_texture",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return content.toggled and not button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "toggle_hover_texture",
			texture_id = "toggle_hover_texture",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return content.toggled and button_hotspot.is_hover and button_hotspot.is_clicked ~= 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_texture",
			texture_id = "icon_texture",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not button_hotspot.is_hover and not content.toggled
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_hover_texture",
			texture_id = "icon_hover_texture",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return (button_hotspot.is_hover or content.toggled) and button_hotspot.is_clicked ~= 0
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_click_texture",
			texture_id = "icon_texture",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return button_hotspot.is_hover and button_hotspot.is_clicked == 0
			end,
		},
		{
			pass_type = "tooltip_text",
			style_id = "tooltip_text",
			text_id = "tooltip_text",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not content.toggled and button_hotspot.is_hover and button_hotspot.is_clicked ~= 0
			end,
		},
		{
			pass_type = "tooltip_text",
			style_id = "tooltip_text",
			text_id = "toggled_tooltip_text",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return content.toggled and button_hotspot.is_hover and button_hotspot.is_clicked == 0
			end,
		},
	},
}
UIElements.SimpleTexture = {
	passes = {
		{
			pass_type = "texture",
			texture_id = "texture_id",
		},
	},
}
UIElements.SimpleRotatedTexture = {
	passes = {
		{
			pass_type = "rotated_texture",
			texture_id = "texture_id",
		},
	},
}
UIElements.SimpleButton = {
	passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture",
			texture_id = "texture_id",
			content_check_function = function (content)
				return not content.button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_hover_id",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end,
		},
	},
}
UIElements.Button = {
	passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hover",
		},
		{
			content_id = "button_hotspot",
			pass_type = "click",
		},
		{
			pass_type = "texture",
			texture_id = "texture_id",
			content_check_function = function (content)
				return not content.button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_hover_id",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end,
		},
		{
			localize = true,
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
		},
	},
}
UIElements.StandardWindow = {
	passes = {
		{
			content_id = "background",
			pass_type = "rounded_background",
			style_id = "background",
		},
		{
			content_id = "background_border",
			pass_type = "border",
			style_id = "background_border",
		},
		{
			content_id = "top_drag_bar",
			pass_type = "hover",
			scenegraph_id = "top_drag_bar",
		},
		{
			content_id = "right_drag_bar",
			pass_type = "hover",
			scenegraph_id = "right_drag_bar",
		},
		{
			content_id = "left_drag_bar",
			pass_type = "hover",
			scenegraph_id = "left_drag_bar",
		},
		{
			content_id = "right_drag_bar",
			pass_type = "hover",
			scenegraph_id = "right_drag_bar",
		},
	},
}
UIElements.ScrollBar = {
	passes = {
		{
			pass_type = "rounded_background",
			style_id = "background",
		},
		{
			content_id = "scrollbar_up_hotspot",
			pass_type = "hover",
			style_id = "bg_up",
		},
		{
			content_id = "scrollbar_up_hotspot",
			pass_type = "click",
			style_id = "bg_up",
		},
		{
			pass_type = "rounded_background",
			style_id = "bg_up",
		},
		{
			content_id = "scrollbar_down_hotspot",
			pass_type = "hover",
			style_id = "bg_down",
		},
		{
			content_id = "scrollbar_down_hotspot",
			pass_type = "click",
			style_id = "bg_down",
		},
		{
			pass_type = "rounded_background",
			style_id = "bg_down",
		},
		{
			click_check_content_id = "scrollbar_down_hotspot",
			pass_type = "on_click",
			click_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				ui_content.internal_scroll_value = math.max(0, ui_content.internal_scroll_value - ui_content.scroll_step_size)
			end,
		},
		{
			click_check_content_id = "scrollbar_up_hotspot",
			pass_type = "on_click",
			click_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				ui_content.internal_scroll_value = math.min(1, ui_content.internal_scroll_value + ui_content.scroll_step_size)
			end,
		},
		{
			pass_type = "local_offset",
			style_id = "scrollbar",
			offset_function = function (ui_scenegraph, ui_style, ui_content)
				local local_position = UISceneGraph.get_local_position(ui_scenegraph, ui_style.scenegraph_id)
				local bar_height = ui_content.scroll_bar_height
				local half_bar_height = bar_height / 2
				local min = ui_content.scroll_offset_min
				local max = ui_content.scroll_offset_max
				local y_pos = math.min(min + (max - min) * ui_content.internal_scroll_value, max - bar_height)

				local_position[2] = y_pos
				ui_content.scroll_value = (y_pos - min) / (max - bar_height - min)
			end,
		},
		{
			pass_type = "rounded_background",
			style_id = "scrollbar",
		},
		{
			pass_type = "hover",
			style_id = "background",
		},
		{
			pass_type = "held",
			style_id = "background",
			held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local cursor = UIInverseScaleVectorToResolution(input_service:get("cursor"))
				local scenegraph_id = ui_style.scenegraph_id
				local world_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)
				local bar_height = ui_content.scroll_bar_height
				local half_bar_size = bar_height / 2
				local start_delta_cursor = half_bar_size
				local y_pos = cursor[2] - start_delta_cursor
				local size = UISceneGraph.get_size(ui_scenegraph, scenegraph_id)
				local current_offset_from_bottom = y_pos - world_position[2]
				local current_offset_center_bar = current_offset_from_bottom
				local min_world_pos = world_position[2] + half_bar_size
				local scroll_offset_max = ui_content.scroll_offset_max
				local max_world_pos = world_position[2] + scroll_offset_max - half_bar_size - ui_content.scroll_offset_min
				local current_position = math.clamp(current_offset_center_bar, 0, size[2])
				local delta_value = math.min(current_position / size[2], 1)

				ui_content.internal_scroll_value = delta_value
			end,
		},
	},
}
UIElements.StaticTextField = {
	passes = {
		{
			pass_type = "rounded_background",
			style_id = "background",
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
		},
	},
}
UIElements.TextAreaChat = {
	passes = {
		{
			pass_type = "rounded_background",
			style_id = "background",
		},
		{
			pass_type = "text_area_chat",
			style_id = "text",
			text_id = "text_field",
		},
	},
}
UIElements.StaticText = {
	passes = {
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
		},
	},
}
UIElements.StaticTextWrappedAroundFields = {
	passes = {
		{
			pass_type = "wrapped_text_around_fields",
			style_id = "text",
			text_id = "text_field",
		},
	},
}
UIElements.LorebookMultipleTexts = {
	passes = {
		{
			pass_type = "lorebook_multiple_texts",
			style_id = "text",
			text_id = "text_field",
		},
	},
}
UIElements.TextButton = {
	passes = {
		{
			content_id = "button_text",
			pass_type = "hover",
		},
		{
			content_id = "button_text",
			pass_type = "click",
		},
		{
			pass_type = "text",
			style_id = "text_hover",
			text_id = "text_field",
			content_check_function = function (content)
				return content.button_text.is_hover
			end,
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
			content_check_function = function (content)
				return not content.button_text.is_hover
			end,
		},
	},
}
UIElements.RotatedTexture = {
	passes = {
		{
			pass_type = "rotated_texture",
			style_id = "rotating_texture",
		},
	},
}
UIElements.Viewport = {
	passes = {
		{
			pass_type = "viewport",
			style_id = "viewport",
		},
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
	},
}
UIElements.Button3States = {
	passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture",
			texture_id = "texture_id",
			content_check_function = function (content)
				return not content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_hover_id",
			content_check_function = function (content)
				return content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_click_id",
			content_check_function = function (content)
				return content.button_hotspot.is_clicked == 0 or content.button_hotspot.is_selected
			end,
		},
		{
			localize = true,
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
		},
	},
}
UIElements.Button4States = {
	passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			content_check_function = function (content)
				return not content.disabled
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_id",
			content_check_function = function (content)
				return not content.disabled and not content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_hover_id",
			content_check_function = function (content)
				return not content.disabled and content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_click_id",
			content_check_function = function (content)
				return not content.disabled and content.button_hotspot.is_clicked == 0 or content.button_hotspot.is_selected
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_disabled_id",
			content_check_function = function (content)
				return content.disabled
			end,
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "text_field",
			content_check_function = function (content, style)
				if style.text_color_disabled and style.text_color_enabled then
					if content.disabled then
						style.text_color = style.text_color_disabled
					else
						style.text_color = style.text_color_enabled
					end
				end

				return true
			end,
		},
	},
}
UIElements.Button3StatesNoText = {
	passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture",
			texture_id = "texture_id",
			content_check_function = function (content)
				return not content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_hover_id",
			content_check_function = function (content)
				return content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
			end,
		},
		{
			pass_type = "texture",
			texture_id = "texture_click_id",
			content_check_function = function (content)
				return content.button_hotspot.is_clicked == 0 or content.button_hotspot.is_selected
			end,
		},
	},
}

UIElements.GamepadButton = function (button_type)
	return {
		passes = {
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
			},
			{
				content_id = "gamepad_button",
				pass_type = "game_pad_connected",
			},
			{
				content_id = "gamepad_button",
				pass_type = "gamepad_button_click_" .. button_type,
				content_check_function = function (content)
					return content.gamepad_connected
				end,
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0 and content.gamepad_button.is_clicked > 0
				end,
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					return content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
				end,
			},
			{
				pass_type = "texture",
				texture_id = "texture_click_id",
				content_check_function = function (content)
					return content.button_hotspot.is_clicked == 0 or content.gamepad_button.is_clicked == 0 or content.button_hotspot.is_selected
				end,
			},
			{
				localize = true,
				pass_type = "text",
				style_id = "text",
				text_id = "text_field",
			},
			{
				localize = false,
				pass_type = "text",
				style_id = "button_type_text",
				text_id = "button_type_text_field",
				content_check_function = function (content)
					return content.gamepad_button.gamepad_connected
				end,
			},
		},
	}
end
