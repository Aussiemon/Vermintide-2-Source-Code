local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
local scenegraph_definition = {
	root = {
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		},
		scale = (IS_WINDOWS and "hud_scale_fit") or "hud_fit"
	},
	ability_root = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "right",
		size = {
			0,
			0
		},
		position = {
			0,
			60,
			0
		}
	}
}
local career_specific_data = {
	dr_engineer = {
		always_show_activated_ability_input = true,
		ability_top_texture_id = "icon_rotarygun",
		ability_effect = "gamepad_ability_effect_cog",
		lit_frame_id = "lit_frame_engineer"
	},
	default = {
		always_show_activated_ability_input = false,
		ability_top_texture_id = "ability_glow",
		ability_effect = "gamepad_ability_effect",
		lit_frame_id = false
	}
}

local function create_ability_widget()
	return {
		scenegraph_id = "ability_root",
		element = {
			passes = {
				{
					style_id = "ability_effect",
					texture_id = "ability_effect",
					pass_type = "texture",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return (not content.on_cooldown or content.usable) and not content.hide_effect
					end,
					content_change_function = function (content, style)
						content.gamepad_active = Managers.input:is_device_active("gamepad")
						local player = Managers.player:local_player()
						local player_unit = player and player.player_unit

						if not ALIVE[player_unit] then
							return
						end

						local career_ext = ScriptUnit.extension(player_unit, "career_system")
						local career_name = career_ext:career_name()
						local career_data = career_specific_data[career_name] or career_specific_data.default

						for content_id, content_value in pairs(career_data) do
							content[content_id] = content_value
						end
					end
				},
				{
					pass_type = "texture",
					style_id = "ability_effect_top",
					texture_id = "ability_top_texture_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return (not content.on_cooldown or content.usable) and not content.hide_effect
					end
				},
				{
					pass_type = "texture",
					style_id = "ability_effect_top",
					texture_id = "lit_frame_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return (not content.on_cooldown or content.usable) and content.lit_frame_id
					end
				},
				{
					pass_type = "texture",
					style_id = "activate_ability",
					texture_id = "activate_ability_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return (not content.on_cooldown or content.always_show_activated_ability_input or content.usable) and content.activate_ability_id and content.gamepad_active
					end
				},
				{
					style_id = "input_text",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return ((not content.on_cooldown or content.always_show_activated_ability_input or content.usable) and not content.gamepad_active) or content.usable
					end
				},
				{
					style_id = "input_text_shadow",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return ((not content.on_cooldown or content.always_show_activated_ability_input or content.usable) and not content.gamepad_active) or content.usable
					end
				}
			}
		},
		content = {
			on_cooldown = true,
			ability_top_texture_id = "icon_rotarygun",
			ability_effect = "gamepad_ability_effect_cog",
			input_text = ""
		},
		style = {
			input_text = {
				word_wrap = false,
				font_size = 24,
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
					-77,
					150,
					110
				}
			},
			input_text_shadow = {
				word_wrap = false,
				font_size = 24,
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
					-75,
					148,
					109
				}
			},
			ability_effect = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					152,
					240
				},
				offset = {
					13,
					-10,
					100
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			ability_effect_top = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					118,
					136
				},
				offset = {
					-3,
					2,
					101
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			activate_ability = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-45,
					140,
					111
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

local thornsister_passive_widget_definition = {
	scenegraph_id = "ability_root",
	element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "ability_effect",
				texture_id = "ability_effect",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.is_active
				end
			},
			{
				pass_type = "texture",
				style_id = "ability_effect_top",
				texture_id = "ability_top_texture_id",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.is_active and not content.hide_top_effect
				end
			},
			{
				pass_type = "texture",
				style_id = "horns",
				texture_id = "horns",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.is_active
				end
			}
		}
	},
	content = {
		horns = "thornsister_passive_effect",
		ability_top_texture_id = "gamepad_ability_effect_top_thornsister",
		ability_effect = "gamepad_ability_effect_thornsister",
		is_active = true
	},
	style = {
		ability_effect = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			texture_size = {
				152,
				240
			},
			offset = {
				13,
				-10,
				103
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		ability_effect_top = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			texture_size = {
				118,
				136
			},
			offset = {
				-3,
				2,
				104
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		horns = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			texture_size = {
				129.8,
				97.9
			},
			offset = {
				3,
				65,
				105
			},
			color = {
				0,
				255,
				255,
				255
			}
		}
	},
	offset = {
		0,
		0,
		0
	}
}
local widget_definitions = {
	ability = create_ability_widget(),
	thornsister_passive = thornsister_passive_widget_definition
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
