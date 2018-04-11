local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	ability_root = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			10
		},
		size = {
			624,
			66
		}
	}
}

local function create_cooldown_widget(scenegraph_id, amount)
	local scenegraph_id = scenegraph_id
	local size = scenegraph_definition[scenegraph_id].size
	local definition = {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_background",
					texture_id = "texture_background",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			texture_background = "hud_ability_bg"
		},
		style = {
			texture_background = {
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		offset = {
			0,
			0,
			20
		},
		scenegraph_id = scenegraph_id
	}
	local icon_size = {
		25,
		25
	}
	local icon_center_position = {
		size[1] / 2 - icon_size[1] / 2,
		size[2] / 2 - icon_size[2] / 2
	}
	local x = 0
	local y = 0
	local r = 40
	local start_progress = 0.75

	for i = 1, amount, 1 do
		local real_index = i - 1
		local fraction = real_index / amount
		local rotation_progress = (start_progress + fraction) % 1
		local degress = rotation_progress * 360
		local angle = -((degress * math.pi) / 180)
		local ptx = x + r * math.cos(angle)
		local pty = y + r * math.sin(angle)
		local passes = definition.element.passes
		local content = definition.content
		local style = definition.style
		local style_name = "icon_" .. i
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "icon",
			style_id = style_name,
			retained_mode = RETAINED_MODE_ENABLED
		}
		style[style_name] = {
			size = icon_size,
			offset = {
				icon_center_position[1] + ptx,
				icon_center_position[2] + pty,
				1
			},
			color = {
				255,
				255,
				255,
				255
			}
		}
		content.icon = "mask_rect"
		content.amount = amount
	end

	return definition
end

local function create_ability_widget()
	return {
		scenegraph_id = "ability_root",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "ability_effect_right",
					texture_id = "texture_id",
					content_id = "ability_effect",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.parent.on_cooldown
					end
				},
				{
					pass_type = "texture",
					style_id = "ability_effect_top_right",
					texture_id = "texture_id",
					content_id = "ability_effect_top",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.parent.on_cooldown
					end
				},
				{
					style_id = "ability_effect_left",
					pass_type = "texture_uv",
					content_id = "ability_effect",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.parent.on_cooldown
					end
				},
				{
					style_id = "ability_effect_top_left",
					pass_type = "texture_uv",
					content_id = "ability_effect_top",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.parent.on_cooldown
					end
				},
				{
					pass_type = "texture",
					style_id = "ability_bar_highlight",
					texture_id = "ability_bar_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.on_cooldown
					end
				},
				{
					style_id = "input_text",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					style_id = "input_text_shadow",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					style_id = "input_text_gamepad",
					pass_type = "text",
					text_id = "input_text_gamepad",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return Managers.input:is_device_active("gamepad") and not content.on_cooldown
					end
				},
				{
					style_id = "input_text_shadow_gamepad",
					pass_type = "text",
					text_id = "input_text_gamepad",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return Managers.input:is_device_active("gamepad") and not content.on_cooldown
					end
				},
				{
					pass_type = "texture",
					style_id = "input_texture_left_shoulder",
					texture_id = "input_texture_left_shoulder",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return Managers.input:is_device_active("gamepad") and not content.on_cooldown
					end
				},
				{
					pass_type = "texture",
					style_id = "input_texture_right_shoulder",
					texture_id = "input_texture_right_shoulder",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return Managers.input:is_device_active("gamepad") and not content.on_cooldown
					end
				}
			}
		},
		content = {
			input_text_gamepad = "+",
			ability_bar_highlight = "hud_player_ability_bar_glow",
			input_text = "",
			on_cooldown = true,
			ability_effect = {
				texture_id = "ability_effect",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			ability_effect_top = {
				texture_id = "hud_player_ability_icon_glow",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			input_texture_left_shoulder = ButtonTextureByName("left_shoulder", "xb1").texture,
			input_texture_right_shoulder = ButtonTextureByName("right_shoulder", "xb1").texture
		},
		style = {
			input_text = {
				word_wrap = false,
				font_size = 16,
				localize = false,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					22,
					18
				},
				offset = {
					38,
					78,
					2
				}
			},
			input_text_shadow = {
				word_wrap = false,
				font_size = 16,
				localize = false,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					22,
					18
				},
				offset = {
					40,
					76,
					1
				}
			},
			input_text_gamepad = {
				vertical_alignment = "center",
				font_size = 32,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					85,
					20
				}
			},
			input_text_shadow_gamepad = {
				vertical_alignment = "center",
				font_size = 32,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					83,
					19
				}
			},
			input_texture_left_shoulder = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					-40,
					85,
					20
				},
				texture_size = ButtonTextureByName("left_shoulder", "xb1").size
			},
			input_texture_right_shoulder = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					30,
					85,
					20
				},
				texture_size = ButtonTextureByName("right_shoulder", "xb1").size
			},
			ability_effect_right = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					110,
					170
				},
				offset = {
					0,
					-2,
					0
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			ability_effect_top_right = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					110,
					170
				},
				offset = {
					0,
					-2,
					1
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			ability_effect_left = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = {
					110,
					170
				},
				offset = {
					-9,
					-2,
					0
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			ability_effect_top_left = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = {
					110,
					170
				},
				offset = {
					-9,
					-2,
					1
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			ability_bar_highlight = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = {
					488,
					70
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					22,
					2
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

local widget_definitions = {
	ability = create_ability_widget()
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
