-- chunkname: @scripts/ui/hud_ui/ability_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local RETAINED_MODE_ENABLED = true
local scenegraph_definition = {
	screen = {
		scale = "hud_scale_fit",
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	ability_root = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			10,
		},
		size = {
			624,
			66,
		},
	},
	ability_charges = {
		horizontal_alignment = "right",
		parent = "ability_root",
		vertical_alignment = "center",
		position = {
			-10,
			-10,
			11,
		},
		size = {
			0,
			0,
		},
	},
}
local ability_widget_definition = {
	scenegraph_id = "ability_root",
	element = {
		passes = {
			{
				content_id = "ability_effect",
				pass_type = "texture",
				style_id = "ability_effect_right",
				texture_id = "texture_id",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.parent.can_use
				end,
			},
			{
				content_id = "ability_effect_top",
				pass_type = "texture",
				style_id = "ability_effect_top_right",
				texture_id = "texture_id",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.parent.can_use
				end,
			},
			{
				content_id = "ability_effect",
				pass_type = "texture_uv",
				style_id = "ability_effect_left",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.parent.can_use
				end,
			},
			{
				content_id = "ability_effect_top",
				pass_type = "texture_uv",
				style_id = "ability_effect_top_left",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.parent.can_use
				end,
			},
			{
				pass_type = "texture",
				style_id = "ability_bar_highlight",
				texture_id = "ability_bar_highlight",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return not content.on_cooldown
				end,
			},
			{
				pass_type = "text",
				style_id = "input_text",
				text_id = "input_text",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content, style)
					return not Managers.input:is_device_active("gamepad")
				end,
			},
			{
				pass_type = "text",
				style_id = "input_text_shadow",
				text_id = "input_text",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content, style)
					return not Managers.input:is_device_active("gamepad")
				end,
			},
			{
				pass_type = "text",
				style_id = "input_text_gamepad",
				text_id = "input_text_gamepad",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content, style)
					return Managers.input:is_device_active("gamepad")
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
		ability_bar_highlight = "hud_player_ability_bar_glow",
		ability_cooldown = "-:-",
		can_use = false,
		can_use_ability = false,
		input_text = "",
		input_text_gamepad = "$KEY;Player__ability:",
		on_cooldown = false,
		ability_effect = {
			texture_id = "ability_effect",
			uvs = {
				{
					0,
					0,
				},
				{
					1,
					1,
				},
			},
		},
		ability_effect_top = {
			texture_id = "ability_effect_top",
			uvs = {
				{
					0,
					0,
				},
				{
					1,
					1,
				},
			},
		},
	},
	style = {
		input_text = {
			font_size = 16,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			size = {
				22,
				18,
			},
			offset = {
				38,
				78,
				2,
			},
		},
		input_text_shadow = {
			font_size = 16,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				22,
				18,
			},
			offset = {
				40,
				76,
				1,
			},
		},
		input_text_gamepad = {
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				38,
				78,
				2,
			},
		},
		ability_effect_right = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			texture_size = {
				110,
				170,
			},
			offset = {
				0,
				-2,
				0,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
		ability_effect_top_right = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			texture_size = {
				110,
				170,
			},
			offset = {
				0,
				-2,
				1,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
		ability_effect_left = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				110,
				170,
			},
			offset = {
				-9,
				-2,
				0,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
		ability_effect_top_left = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				110,
				170,
			},
			offset = {
				-9,
				-2,
				1,
			},
			color = {
				0,
				255,
				255,
				255,
			},
		},
		ability_bar_highlight = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				488,
				70,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				22,
				2,
			},
		},
		ability_cooldown = {
			font_size = 18,
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
				524,
				90,
				22,
			},
			size = {
				100,
				18,
			},
		},
		ability_cooldown_shadow = {
			font_size = 18,
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
				525,
				87,
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
local widget_definitions = {
	ability = ability_widget_definition,
	thornsister_passive = thornsister_passive_widget_definition,
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
}
