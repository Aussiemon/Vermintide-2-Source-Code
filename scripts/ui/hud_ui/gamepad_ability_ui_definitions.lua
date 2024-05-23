-- chunkname: @scripts/ui/hud_ui/gamepad_ability_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local RETAINED_MODE_ENABLED = true
local scenegraph_definition = {
	root = {
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
		scale = IS_WINDOWS and "hud_scale_fit" or "hud_fit",
	},
	ability_root = {
		horizontal_alignment = "right",
		parent = "root",
		vertical_alignment = "bottom",
		position = {
			0,
			60,
			0,
		},
		size = {
			0,
			0,
		},
	},
	ability_charges = {
		horizontal_alignment = "left",
		parent = "ability_root",
		vertical_alignment = "top",
		position = {
			-134,
			92,
			11,
		},
		size = {
			0,
			0,
		},
	},
}

local function create_ability_widget()
	return {
		scenegraph_id = "ability_root",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "ability_effect",
					texture_id = "ability_effect",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						content.gamepad_active = Managers.input:is_device_active("gamepad")

						return (not content.on_cooldown or content.usable) and not content.hide_effect
					end,
					content_change_function = function (content, style)
						local player = Managers.player:local_player()
						local player_unit = player and player.player_unit

						if not ALIVE[player_unit] then
							return
						end

						local career_ext = ScriptUnit.extension(player_unit, "career_system")
						local career_name = career_ext:career_name()
						local career_data = UISettings.gamepad_ability_ui_data[career_name] or UISettings.gamepad_ability_ui_data.default

						for content_id, content_value in pairs(career_data) do
							content[content_id] = content_value
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "ability_effect_top",
					texture_id = "ability_top_texture_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return (not content.on_cooldown or content.usable) and not content.hide_effect
					end,
				},
				{
					pass_type = "texture",
					style_id = "ability_effect_top",
					texture_id = "lit_frame_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return (not content.on_cooldown or content.usable) and content.lit_frame_id
					end,
				},
				{
					pass_type = "texture",
					style_id = "activate_ability",
					texture_id = "activate_ability_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return (not content.on_cooldown or content.always_show_activated_ability_input or content.usable) and content.activate_ability_id and content.gamepad_active
					end,
				},
				{
					pass_type = "text",
					style_id = "input_text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return (not content.on_cooldown or content.always_show_activated_ability_input or content.usable or content.usable) and not content.gamepad_active
					end,
				},
				{
					pass_type = "text",
					style_id = "input_text_shadow",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return (not content.on_cooldown or content.always_show_activated_ability_input or content.usable or content.usable) and not content.gamepad_active
					end,
				},
				{
					pass_type = "text",
					style_id = "ability_cooldown",
					text_id = "ability_cooldown",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui") and not content.can_use_ability
					end,
				},
				{
					pass_type = "text",
					style_id = "ability_cooldown_shadow",
					text_id = "ability_cooldown",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui") and not content.can_use_ability
					end,
				},
			},
		},
		content = {
			ability_cooldown = "-:-",
			ability_effect = "gamepad_ability_effect_cog",
			ability_top_texture_id = "icon_rotarygun",
			can_use_ability = false,
			input_text = "",
			on_cooldown = true,
		},
		style = {
			input_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					22,
					18,
				},
				offset = {
					-77,
					150,
					110,
				},
			},
			input_text_shadow = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					22,
					18,
				},
				offset = {
					-75,
					148,
					109,
				},
			},
			ability_effect = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					152,
					240,
				},
				offset = {
					13,
					-10,
					100,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			ability_effect_top = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					118,
					136,
				},
				offset = {
					-3,
					2,
					101,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			activate_ability = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					0,
					0,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-45,
					140,
					111,
				},
			},
			ability_cooldown = {
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = {
					255,
					250,
					250,
					250,
				},
				offset = {
					-115,
					148,
					22,
				},
				size = {
					100,
					18,
				},
			},
			ability_cooldown_shadow = {
				font_size = 22,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-114,
					147,
					21,
				},
				size = {
					100,
					18,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
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
				end,
			},
			{
				pass_type = "texture",
				style_id = "ability_effect_top",
				texture_id = "ability_top_texture_id",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.is_active and not content.hide_top_effect
				end,
			},
		},
	},
	content = {
		ability_effect = "gamepad_ability_effect_thornsister",
		ability_top_texture_id = "gamepad_ability_effect_top_thornsister",
		is_active = true,
	},
	style = {
		ability_effect = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			texture_size = {
				152,
				240,
			},
			offset = {
				13,
				-10,
				103,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		ability_effect_top = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			texture_size = {
				118,
				136,
			},
			offset = {
				-3,
				2,
				104,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
	},
	offset = {
		0,
		0,
		0,
	},
}
local widget_definitions = {
	ability = create_ability_widget(),
	thornsister_passive = thornsister_passive_widget_definition,
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
