require("scripts/ui/ui_layer")

UIElements = {
	ButtonMenuSteps = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot",
				content_check_function = function (content)
					return not content.disabled
				end
			},
			{
				texture_id = "texture_id",
				style_id = "texture",
				pass_type = "texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_hover and 0 < button_hotspot.is_clicked and not button_hotspot.is_selected
				end
			},
			{
				texture_id = "texture_hover_id",
				style_id = "texture",
				pass_type = "texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and 0 < button_hotspot.is_clicked
				end
			},
			{
				texture_id = "texture_click_id",
				style_id = "texture",
				pass_type = "texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and button_hotspot.is_clicked == 0
				end
			},
			{
				texture_id = "texture_selected_id",
				style_id = "texture",
				pass_type = "texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and button_hotspot.is_selected and 0 < button_hotspot.is_clicked
				end
			},
			{
				texture_id = "texture_disabled_id",
				style_id = "texture",
				pass_type = "texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return button_hotspot.disabled
				end
			},
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected and 0 < button_hotspot.is_clicked
				end
			},
			{
				style_id = "text_hover",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and 0 < button_hotspot.is_clicked
				end
			},
			{
				style_id = "text_selected",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and (button_hotspot.is_selected or button_hotspot.is_clicked == 0)
				end
			},
			{
				style_id = "text_disabled",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return button_hotspot.disabled
				end
			}
		}
	},
	ButtonMenuStepsWithTimer = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot",
				content_check_function = function (content)
					return not content.disabled
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_hover and 0 < button_hotspot.is_clicked and not button_hotspot.is_selected
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and 0 < button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_click_id",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and button_hotspot.is_clicked == 0
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_selected_id",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and button_hotspot.is_selected and 0 < button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_disabled_id",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return button_hotspot.disabled
				end
			},
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected and 0 < button_hotspot.is_clicked
				end
			},
			{
				style_id = "text_hover",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and 0 < button_hotspot.is_clicked
				end
			},
			{
				style_id = "text_selected",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and (button_hotspot.is_selected or button_hotspot.is_clicked == 0)
				end
			},
			{
				style_id = "text_disabled",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return button_hotspot.disabled
				end
			},
			{
				style_id = "timer_text_field",
				pass_type = "text",
				text_id = "timer_text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected and 0 < button_hotspot.is_clicked
				end
			},
			{
				style_id = "timer_text_field_hover",
				pass_type = "text",
				text_id = "timer_text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and 0 < button_hotspot.is_clicked
				end
			},
			{
				style_id = "timer_text_field_selected",
				pass_type = "text",
				text_id = "timer_text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and (button_hotspot.is_selected or button_hotspot.is_clicked == 0)
				end
			},
			{
				style_id = "timer_text_field_disabled",
				pass_type = "text",
				text_id = "timer_text_field",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return button_hotspot.disabled
				end
			}
		}
	},
	ToggleIconButton = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				style_id = "normal_texture",
				texture_id = "normal_texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				style_id = "hover_texture",
				texture_id = "hover_texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return button_hotspot.is_hover and button_hotspot.is_clicked ~= 0
				end
			},
			{
				pass_type = "texture",
				style_id = "click_texture",
				texture_id = "click_texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return button_hotspot.is_hover and button_hotspot.is_clicked == 0
				end
			},
			{
				pass_type = "texture",
				style_id = "toggle_texture",
				texture_id = "toggle_texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return content.toggled and not button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				style_id = "toggle_hover_texture",
				texture_id = "toggle_hover_texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return content.toggled and button_hotspot.is_hover and button_hotspot.is_clicked ~= 0
				end
			},
			{
				pass_type = "texture",
				style_id = "icon_texture",
				texture_id = "icon_texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.is_hover and not content.toggled
				end
			},
			{
				pass_type = "texture",
				style_id = "icon_hover_texture",
				texture_id = "icon_hover_texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return (button_hotspot.is_hover or content.toggled) and button_hotspot.is_clicked ~= 0
				end
			},
			{
				pass_type = "texture",
				style_id = "icon_click_texture",
				texture_id = "icon_texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return button_hotspot.is_hover and button_hotspot.is_clicked == 0
				end
			},
			{
				style_id = "tooltip_text",
				pass_type = "tooltip_text",
				text_id = "tooltip_text",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not content.toggled and button_hotspot.is_hover and button_hotspot.is_clicked ~= 0
				end
			},
			{
				style_id = "tooltip_text",
				pass_type = "tooltip_text",
				text_id = "toggled_tooltip_text",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return content.toggled and button_hotspot.is_hover and not button_hotspot.is_clicked ~= 0
				end
			}
		}
	},
	ClickButton3States = {
		passes = {
			{
				pass_type = "hover",
				content_id = "button_hotspot"
			},
			{
				pass_type = "click",
				content_id = "button_hotspot"
			},
			{
				state_content_id = "button_hotspot",
				pass_type = "state_texture",
				texture_content_id = "texture_states"
			}
		}
	},
	SimpleWindow = {
		passes = {
			{
				pass_type = "rounded_background",
				style_id = "background"
			}
		}
	},
	SimpleTexture = {
		passes = {
			{
				pass_type = "texture",
				texture_id = "texture_id"
			}
		}
	},
	SimpleRotatedTexture = {
		passes = {
			{
				pass_type = "rotated_texture",
				texture_id = "texture_id"
			}
		}
	},
	SimpleVideo = {
		passes = {
			{
				pass_type = "video",
				style_id = "video"
			}
		}
	},
	SimpleTextBox = {
		passes = {
			{
				pass_type = "texture",
				texture_id = "texture_id"
			},
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			}
		}
	},
	SimpleButton = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end
			}
		}
	},
	Simple3StatesButton = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					return content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_click_id",
				content_check_function = function (content)
					return content.button_hotspot.is_clicked == 0 or content.button_hotspot.is_selected
				end
			}
		}
	},
	Simple3StatesButtonText = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					return content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_click_id",
				content_check_function = function (content)
					return content.button_hotspot.is_clicked == 0 or content.button_hotspot.is_selected
				end
			},
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			}
		}
	},
	BorderedRect = {
		passes = {
			{
				pass_type = "rect",
				style_id = "rect"
			},
			{
				pass_type = "border",
				style_id = "border"
			}
		}
	},
	DoubleTextureHoldButton = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "held",
				content_id = "button_hotspot"
			},
			{
				style_id = "background_texture",
				state_content_id = "button_hotspot",
				pass_type = "state_texture",
				texture_content_id = "background_texture"
			},
			{
				style_id = "foreground_texture",
				state_content_id = "button_hotspot",
				pass_type = "state_texture",
				texture_content_id = "foreground_texture"
			}
		}
	},
	Button = {
		passes = {
			{
				pass_type = "hover",
				content_id = "button_hotspot"
			},
			{
				pass_type = "click",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end
			},
			{
				localize = true,
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			}
		}
	},
	StandardWindow = {
		passes = {
			{
				style_id = "background",
				pass_type = "rounded_background",
				content_id = "background"
			},
			{
				style_id = "background_border",
				pass_type = "border",
				content_id = "background_border"
			},
			{
				scenegraph_id = "top_drag_bar",
				pass_type = "hover",
				content_id = "top_drag_bar"
			},
			{
				scenegraph_id = "right_drag_bar",
				pass_type = "hover",
				content_id = "right_drag_bar"
			},
			{
				scenegraph_id = "left_drag_bar",
				pass_type = "hover",
				content_id = "left_drag_bar"
			},
			{
				scenegraph_id = "right_drag_bar",
				pass_type = "hover",
				content_id = "right_drag_bar"
			}
		}
	},
	ScrollBar = {
		passes = {
			{
				pass_type = "rounded_background",
				style_id = "background"
			},
			{
				style_id = "bg_up",
				pass_type = "hover",
				content_id = "scrollbar_up_hotspot"
			},
			{
				style_id = "bg_up",
				pass_type = "click",
				content_id = "scrollbar_up_hotspot"
			},
			{
				pass_type = "rounded_background",
				style_id = "bg_up"
			},
			{
				style_id = "bg_down",
				pass_type = "hover",
				content_id = "scrollbar_down_hotspot"
			},
			{
				style_id = "bg_down",
				pass_type = "click",
				content_id = "scrollbar_down_hotspot"
			},
			{
				pass_type = "rounded_background",
				style_id = "bg_down"
			},
			{
				pass_type = "on_click",
				click_check_content_id = "scrollbar_down_hotspot",
				click_function = function (ui_scenegraph, ui_style, ui_content, input_service)
					ui_content.internal_scroll_value = math.max(0, ui_content.internal_scroll_value - ui_content.scroll_step_size)

					return 
				end
			},
			{
				pass_type = "on_click",
				click_check_content_id = "scrollbar_up_hotspot",
				click_function = function (ui_scenegraph, ui_style, ui_content, input_service)
					ui_content.internal_scroll_value = math.min(1, ui_content.internal_scroll_value + ui_content.scroll_step_size)

					return 
				end
			},
			{
				style_id = "scrollbar",
				pass_type = "local_offset",
				offset_function = function (ui_scenegraph, ui_style, ui_content)
					local local_position = UISceneGraph.get_local_position(ui_scenegraph, ui_style.scenegraph_id)
					local bar_height = ui_content.scroll_bar_height
					local half_bar_height = bar_height / 2
					local min = ui_content.scroll_offset_min
					local max = ui_content.scroll_offset_max
					local y_pos = math.min(min + (max - min) * ui_content.internal_scroll_value, max - bar_height)
					local_position[2] = y_pos
					ui_content.scroll_value = (y_pos - min) / (max - bar_height - min)

					return 
				end
			},
			{
				pass_type = "rounded_background",
				style_id = "scrollbar"
			},
			{
				pass_type = "hover",
				style_id = "background"
			},
			{
				style_id = "background",
				pass_type = "held",
				held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
					local cursor = UIInverseScaleVectorToResolution(input_service.get(input_service, "cursor"))
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
					local max_world_pos = (world_position[2] + scroll_offset_max) - half_bar_size - ui_content.scroll_offset_min
					local current_position = math.clamp(current_offset_center_bar, 0, size[2])
					local delta_value = math.min(current_position / size[2], 1)
					ui_content.internal_scroll_value = delta_value

					return 
				end
			}
		}
	},
	StaticTextField = {
		passes = {
			{
				pass_type = "rounded_background",
				style_id = "background"
			},
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			}
		}
	},
	TextAreaChat = {
		passes = {
			{
				pass_type = "rounded_background",
				style_id = "background"
			},
			{
				style_id = "text",
				pass_type = "text_area_chat",
				text_id = "text_field"
			}
		}
	},
	StaticText = {
		passes = {
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			}
		}
	},
	StaticTextWrappedAroundFields = {
		passes = {
			{
				style_id = "text",
				pass_type = "wrapped_text_around_fields",
				text_id = "text_field"
			}
		}
	},
	LorebookMultipleTexts = {
		passes = {
			{
				style_id = "text",
				pass_type = "lorebook_multiple_texts",
				text_id = "text_field"
			}
		}
	},
	TextButton = {
		passes = {
			{
				pass_type = "hover",
				content_id = "button_text"
			},
			{
				pass_type = "click",
				content_id = "button_text"
			},
			{
				style_id = "text_hover",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					return content.button_text.is_hover
				end
			},
			{
				style_id = "text",
				pass_type = "text",
				text_id = "text_field",
				content_check_function = function (content)
					return not content.button_text.is_hover
				end
			}
		}
	},
	RotatedTexture = {
		passes = {
			{
				pass_type = "rotated_texture",
				style_id = "rotating_texture"
			}
		}
	},
	Viewport = {
		passes = {
			{
				style_id = "viewport",
				pass_type = "viewport",
				content_id = "viewport"
			},
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			}
		}
	},
	Button3States = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					return content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_click_id",
				content_check_function = function (content)
					return content.button_hotspot.is_clicked == 0 or content.button_hotspot.is_selected
				end
			},
			{
				localize = true,
				style_id = "text",
				pass_type = "text",
				text_id = "text_field"
			}
		}
	},
	Button4States = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot",
				content_check_function = function (content)
					return not content.disabled
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					return not content.disabled and not content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					return not content.disabled and content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_click_id",
				content_check_function = function (content)
					return (not content.disabled and content.button_hotspot.is_clicked == 0) or content.button_hotspot.is_selected
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_disabled_id",
				content_check_function = function (content)
					return content.disabled
				end
			},
			{
				style_id = "text",
				pass_type = "text",
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
				end
			}
		}
	},
	Button3StatesNoText = {
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				pass_type = "texture",
				texture_id = "texture_id",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_hover_id",
				content_check_function = function (content)
					return content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
				end
			},
			{
				pass_type = "texture",
				texture_id = "texture_click_id",
				content_check_function = function (content)
					return content.button_hotspot.is_clicked == 0 or content.button_hotspot.is_selected
				end
			}
		}
	},
	GamepadButton = function (button_type)
		return {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "game_pad_connected",
					content_id = "gamepad_button"
				},
				{
					content_id = "gamepad_button",
					pass_type = "gamepad_button_click_" .. button_type,
					content_check_function = function (content)
						return content.gamepad_connected
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked and 0 < content.gamepad_button.is_clicked
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and 0 < content.button_hotspot.is_clicked
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_click_id",
					content_check_function = function (content)
						return content.button_hotspot.is_clicked == 0 or content.gamepad_button.is_clicked == 0 or content.button_hotspot.is_selected
					end
				},
				{
					localize = true,
					style_id = "text",
					pass_type = "text",
					text_id = "text_field"
				},
				{
					localize = false,
					style_id = "button_type_text",
					pass_type = "text",
					text_id = "button_type_text_field",
					content_check_function = function (content)
						return content.gamepad_button.gamepad_connected
					end
				}
			}
		}
	end
}

return 
