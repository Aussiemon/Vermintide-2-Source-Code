local ability_bar_size = {
	250,
	16
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud_inventory
		},
		size = {
			1920,
			1080
		}
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud_inventory
		},
		size = {
			1920,
			1080
		}
	},
	screen_bottom_pivot = {
		parent = "screen",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	ability_bar = {
		vertical_alignment = "center",
		parent = "screen_bottom_pivot",
		horizontal_alignment = "center",
		size = ability_bar_size,
		position = {
			0,
			-200,
			1
		}
	}
}
local frame_settings = UIFrameSettings.frame_outer_glow_01
local frame_corner = frame_settings.texture_sizes.corner
local frame_width = frame_corner[1]
local widget_definitions = {
	ability_bar = {
		scenegraph_id = "ability_bar",
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					style_id = "icon",
					texture_id = "icon",
					pass_type = "texture",
					content_check_function = function (content, style)
						content.gamepad_active = Managers.input:is_device_active("gamepad")

						return content.gamepad_active
					end,
					content_change_function = function (content, style)
						content.icon = ((PLATFORM == "ps4" or Application.user_setting("gamepad_use_ps4_style_input_icons")) and "ps4_button_icon_square") or "xbone_button_icon_x"
					end
				},
				{
					pass_type = "texture",
					style_id = "icon_shadow",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "bar_fg",
					texture_id = "bar_fg"
				},
				{
					pass_type = "rect",
					style_id = "bar_bg"
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "bar_1",
					texture_id = "bar_1"
				},
				{
					pass_type = "rect",
					style_id = "min_threshold"
				},
				{
					pass_type = "rect",
					style_id = "max_threshold"
				},
				{
					style_id = "ability_bar_highlight",
					pass_type = "texture_uv",
					content_id = "ability_bar_highlight"
				},
				{
					style_id = "input_text",
					pass_type = "text",
					text_id = "input_text",
					content_check_function = function (content)
						return not content.gamepad_active
					end,
					content_change_function = function (content, style)
						local input_service = Managers.input:get_service("Player")
						local keymap_binding = input_service:get_keymapping("weapon_reload", "win32")

						if not keymap_binding then
							content.input_text = ""

							return
						end

						local device_type = keymap_binding[1]
						local key_index = keymap_binding[2]
						local key_action_type = keymap_binding[3]
						local is_button_unassigned = key_index == UNASSIGNED_KEY
						content.input_text = string.upper((is_button_unassigned and "") or Keyboard.button_locale_name(key_index) or Keyboard.button_name(key_index))
					end
				},
				{
					style_id = "input_text_shadow",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return not content.gamepad_active
					end
				}
			}
		},
		content = {
			bar_2 = "overcharge_bar_2",
			input_text = "",
			bar_3 = "overcharge_bar_3",
			bar_1 = "active_ability_bar",
			bar_fg = "overcharge_frame",
			icon = ((PLATFORM == "ps4" or Application.user_setting("gamepad_use_ps4_style_input_icons")) and "ps4_button_icon_square") or "xbone_button_icon_x",
			ability_bar_highlight = {
				texture_id = "hud_player_ability_skill_bar_glow",
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
			size = {
				ability_bar_size[1] - 6,
				ability_bar_size[2]
			},
			frame = frame_settings.texture
		},
		style = {
			input_text = {
				word_wrap = false,
				font_size = 24,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					275,
					18
				},
				offset = {
					0,
					-3,
					105
				}
			},
			input_text_shadow = {
				word_wrap = false,
				font_size = 24,
				localize = false,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					275,
					18
				},
				offset = {
					-2,
					-5,
					104
				}
			},
			frame = {
				frame_margins = {
					-(frame_width - 1),
					-(frame_width - 1)
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				size = ability_bar_size
			},
			bar_1 = {
				gradient_threshold = 0,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					3,
					3
				},
				size = {
					ability_bar_size[1] - 6,
					ability_bar_size[2] - 6
				}
			},
			icon = {
				size = {
					34,
					34
				},
				offset = {
					ability_bar_size[1] + 5,
					ability_bar_size[2] / 2 - 17,
					5
				},
				color = {
					100,
					0,
					0,
					1
				}
			},
			icon_shadow = {
				size = {
					34,
					34
				},
				offset = {
					ability_bar_size[1] + 2,
					ability_bar_size[2] / 2 - 17 - 2,
					5
				},
				color = {
					0,
					0,
					0,
					0
				}
			},
			bar_fg = {
				offset = {
					0,
					0,
					5
				},
				color = {
					204,
					255,
					255,
					255
				}
			},
			bar_bg = {
				size = {
					ability_bar_size[1] - 6,
					ability_bar_size[2] - 6
				},
				offset = {
					3,
					3,
					0
				},
				color = {
					100,
					0,
					0,
					0
				}
			},
			min_threshold = {
				pivot = {
					0,
					0
				},
				offset = {
					0,
					3,
					4
				},
				color = {
					204,
					0,
					0,
					0
				},
				size = {
					2,
					ability_bar_size[2] - 6
				}
			},
			max_threshold = {
				pivot = {
					0,
					0
				},
				offset = {
					0,
					3,
					4
				},
				color = {
					204,
					0,
					0,
					0
				},
				size = {
					2,
					ability_bar_size[2] - 6
				}
			},
			ability_bar_highlight = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = {
					265,
					50
				},
				color = {
					128,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					3
				}
			}
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
