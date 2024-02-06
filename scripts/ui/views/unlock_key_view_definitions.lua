-- chunkname: @scripts/ui/views/unlock_key_view_definitions.lua

local scenegraph_definition = {
	root = {
		position = {
			0,
			0,
			UILayer.default,
		},
		size = {
			1920,
			1080,
		},
	},
	key_entry_background = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			536,
			100,
		},
	},
	unlock_key_title_background = {
		horizontal_alignment = "center",
		parent = "key_entry_background",
		vertical_alignment = "center",
		size = {
			370,
			56,
		},
		position = {
			0,
			90,
			0,
		},
	},
	unlock_key_title = {
		horizontal_alignment = "center",
		parent = "unlock_key_title_background",
		vertical_alignment = "center",
		size = {
			370,
			56,
		},
	},
	processing_icon = {
		horizontal_alignment = "center",
		parent = "key_entry_background",
		vertical_alignment = "center",
		size = {
			52,
			52,
		},
		position = {
			-222,
			0,
			0,
		},
	},
	text_input = {
		horizontal_alignment = "center",
		parent = "key_entry_background",
		vertical_alignment = "center",
		size = {
			424,
			44,
		},
		position = {
			28,
			0,
			0,
		},
	},
	accept_button = {
		horizontal_alignment = "left",
		parent = "key_entry_background",
		vertical_alignment = "bottom",
		size = {
			188,
			50,
		},
		position = {
			40,
			-60,
			1,
		},
	},
	cancel_button = {
		horizontal_alignment = "right",
		parent = "key_entry_background",
		vertical_alignment = "bottom",
		size = {
			188,
			50,
		},
		position = {
			-40,
			-60,
			1,
		},
	},
	back_button = {
		horizontal_alignment = "right",
		parent = "root",
		vertical_alignment = "top",
		size = {
			36,
			36,
		},
		position = {
			0,
			0,
			1,
		},
	},
	confirm_gamepad_button = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "top",
		size = {
			220,
			62,
		},
		position = {
			-460,
			0,
			1,
		},
	},
	back_gamepad_button = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "top",
		size = {
			220,
			62,
		},
		position = {
			-230,
			0,
			1,
		},
	},
}
local BUTTON_TYPES = {
	back = "(B)",
	confirm = "(A)",
}

local function create_gamepad_button_widget(button_type, scenegraph_id)
	return {
		element = UIElements.GamepadButton(button_type),
		content = {
			text_field = "",
			texture_click_id = "small_button_gold_selected",
			texture_hover_id = "small_button_gold_hover",
			texture_id = "small_button_gold_normal",
			button_hotspot = {},
			gamepad_button = {
				is_clicked = 10,
			},
			button_type_text_field = BUTTON_TYPES[button_type],
		},
		style = {
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					4,
				},
			},
			button_type_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					60,
					2,
					4,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local widget_definitions = {
	confirm_gamepad_button_widget = create_gamepad_button_widget("confirm", "confirm_gamepad_button"),
	back_gamepad_button_widget = create_gamepad_button_widget("back", "back_gamepad_button"),
	processing_icon = {
		scenegraph_id = "processing_icon",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "processing_icon",
					texture_id = "processing_icon",
				},
				{
					pass_type = "texture",
					style_id = "processing_part_1",
					texture_id = "processing_part_1",
				},
				{
					pass_type = "texture",
					style_id = "processing_part_2",
					texture_id = "processing_part_2",
				},
				{
					pass_type = "rotated_texture",
					style_id = "processing_part_3",
					texture_id = "processing_part_3",
				},
				{
					pass_type = "rotated_texture",
					style_id = "processing_part_4",
					texture_id = "processing_part_4",
				},
			},
		},
		content = {
			processing_icon = "matchmaking_loading_icon_part_03",
			processing_part_1 = "matchmaking_loading_icon_part_01",
			processing_part_2 = "matchmaking_loading_icon_part_02",
			processing_part_3 = "matchmaking_loading_icon_part_01",
			processing_part_4 = "matchmaking_loading_icon_part_02",
		},
		style = {
			processing_icon = {
				offset = {
					0,
					0,
					4,
				},
				size = {
					52,
					52,
				},
			},
			processing_part_1 = {
				offset = {
					0,
					0,
					1,
				},
				size = {
					52,
					52,
				},
			},
			processing_part_2 = {
				offset = {
					0,
					0,
					1,
				},
				size = {
					52,
					52,
				},
			},
			processing_part_3 = {
				offset = {
					0,
					0,
					2,
				},
				size = {
					52,
					52,
				},
				angle = math.pi / 4,
				pivot = {
					26,
					26,
				},
			},
			processing_part_4 = {
				offset = {
					0,
					0,
					3,
				},
				size = {
					52,
					52,
				},
				angle = math.pi / 4,
				pivot = {
					26,
					26,
				},
			},
		},
	},
	title = {
		scenegraph_id = "unlock_key_title",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_field",
				},
			},
		},
		content = {
			text_field = "unlock_key_title",
		},
		style = {
			text = {
				dynamic_font = true,
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				pixel_perfect = true,
				vertical_alignment = "center",
				text_color = Colors.color_definitions.yellow,
				offset = {
					0,
					6,
					2,
				},
			},
		},
	},
	accept_button = {
		scenegraph_id = "accept_button",
		element = UIElements.Button3States,
		content = {
			texture_click_id = "medium_button_selected",
			texture_hover_id = "medium_button_hover",
			texture_id = "medium_button_normal",
			text_field = Localize("unlock_key_accept"),
			button_hotspot = {},
		},
		style = {
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2,
				},
			},
		},
	},
	cancel_button = {
		scenegraph_id = "cancel_button",
		element = UIElements.Button3States,
		content = {
			texture_click_id = "medium_button_selected",
			texture_hover_id = "medium_button_hover",
			texture_id = "medium_button_normal",
			text_field = Localize("unlock_key_cancel"),
			button_hotspot = {},
		},
		style = {
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2,
				},
			},
		},
	},
	text_input = {
		scenegraph_id = "text_input",
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "text_input_rect",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_field",
				},
			},
		},
		content = {
			caret_index = 1,
			text_field = "",
			text_index = 1,
		},
		style = {
			text_input_rect = {
				color = {
					180,
					0,
					0,
					0,
				},
			},
			text = {
				dynamic_font = true,
				font_size = 36,
				font_type = "hell_shark",
				horizontal_scroll = true,
				pixel_perfect = true,
				vertical_alignment = "top",
				text_color = Colors.color_definitions.white,
				offset = {
					6,
					8,
					1,
				},
				caret_size = {
					3,
					26,
				},
				caret_offset = {
					0,
					0,
					1,
				},
				caret_color = Colors.color_definitions.white,
			},
		},
	},
}
local simple_texture_template = {
	scenegraph_id = "",
	element = UIElements.SimpleTexture,
	content = {
		texture_id = "",
	},
	style = {},
}

local function create_simple_texture_widget(texture_id, scenegraph_id)
	simple_texture_template.content.texture_id = texture_id
	simple_texture_template.scenegraph_id = scenegraph_id

	return UIWidget.init(simple_texture_template)
end

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	create_simple_texture_widget = create_simple_texture_widget,
}
