-- chunkname: @scripts/ui/views/console_friends_view_definitions.lua

local friend_entry_size = {
	350,
	40,
}
local num_visible_friends = 6
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.chat,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			500,
			700,
		},
		position = {
			0,
			0,
			1,
		},
	},
	header = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "top",
	},
	party_header = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			75,
			210,
			2,
		},
	},
	header_divider = {
		horizontal_alignment = "center",
		parent = "header",
		vertical_alignment = "top",
		size = {
			264,
			32,
		},
		position = {
			0,
			-80,
			1,
		},
	},
	bottom_rect = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			1920,
			65,
		},
	},
	party_divider = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			264,
			32,
		},
		position = {
			0,
			0,
			1,
		},
	},
	friends_header = {
		horizontal_alignment = "left",
		parent = "background",
		vertical_alignment = "center",
		size = {
			350,
			100,
		},
		position = {
			75,
			-32,
			2,
		},
	},
	friends_base = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "bottom",
		size = friend_entry_size,
		position = {
			0,
			friend_entry_size[2] * num_visible_friends + 40,
			10,
		},
	},
	friends_mask = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "bottom",
		size = {
			friend_entry_size[1],
			friend_entry_size[2] * num_visible_friends,
		},
		position = {
			0,
			40,
			4,
		},
	},
	open_profile_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			250,
			70,
		},
		position = {
			-125,
			120,
			10,
		},
	},
	invite_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			250,
			70,
		},
		position = {
			125,
			120,
			10,
		},
	},
	selection_handler = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		size = {
			500,
			500,
		},
		position = {
			0,
			0,
			50,
		},
	},
}

local function create_party_entry(name, career, offset_y)
	local career_portrait = "small_unit_frame_portrait_default"

	if career then
		career_portrait = "small_" .. career.portrait_image
	end

	return {
		scenegraph_id = "party_header",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_id",
				},
				{
					pass_type = "texture",
					style_id = "texture",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			text_id = name or Localize("friends_view_free_slot"),
			texture_id = career_portrait,
		},
		style = {
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = career and Colors.get_color_table_with_alpha("white", 255) or {
					255,
					80,
					80,
					80,
				},
				offset = {
					35,
					0,
					1,
				},
			},
			texture = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					30,
					35,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					0,
				},
			},
		},
		offset = {
			0,
			offset_y and offset_y or 0,
			0,
		},
	}
end

local function create_friend_entry(name, online, offset_y, friend)
	return {
		scenegraph_id = "friends_base",
		element = {
			passes = {
				{
					content_id = "entry_hotspot",
					pass_type = "hotspot",
					style_id = "hover",
				},
				{
					pass_type = "texture",
					style_id = "indicator_texture",
					texture_id = "indicator_texture_id",
				},
				{
					pass_type = "texture",
					style_id = "invite_texture",
					texture_id = "invite_texture_id",
				},
				{
					pass_type = "texture",
					style_id = "selected_texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.selected
					end,
				},
				{
					pass_type = "texture",
					style_id = "hover",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.entry_hotspot.is_hover and not content.selected
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_id",
				},
			},
		},
		content = {
			indicator_texture_id = "page_indicator",
			invite_texture_id = "friends_icon_invite",
			selected = false,
			texture_id = "rect_masked",
			entry_hotspot = {},
			text_id = name,
			friend = friend,
		},
		style = {
			text = {
				font_size = 20,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = online and Colors.get_color_table_with_alpha("font_title", 255) or {
					255,
					80,
					80,
					80,
				},
				offset = {
					35,
					0,
					2,
				},
			},
			texture = {
				color = online and {
					255,
					0,
					255,
					0,
				} or {
					255,
					255,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			selected_texture = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			hover = {
				color = {
					128,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			invite_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				texture_size = {
					32,
					32,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					40,
					0,
					10,
				},
			},
			indicator_texture = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "center",
				texture_size = {
					20,
					20,
				},
				color = online and {
					255,
					0,
					255,
					0,
				} or {
					255,
					255,
					0,
					0,
				},
				offset = {
					10,
					0,
					2,
				},
			},
		},
		offset = {
			0,
			offset_y and offset_y or 0,
			0,
		},
	}
end

function create_selection_handler(scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "down_hotspot",
					pass_type = "hotspot",
					style_id = "down_arrow_background",
				},
				{
					content_id = "up_hotspot",
					pass_type = "hotspot",
					style_id = "up_arrow_background",
				},
				{
					content_id = "arrow",
					pass_type = "texture",
					style_id = "down_arrow",
					texture_id = "texture_id",
					content_check_function = function (content, style)
						if Managers.input:is_device_active("gamepad") then
							return false
						end

						return true
					end,
				},
				{
					content_id = "arrow",
					pass_type = "texture_uv",
					style_id = "up_arrow",
					texture_id = "texture_id",
					content_check_function = function (content, style)
						if Managers.input:is_device_active("gamepad") then
							return false
						end

						return true
					end,
				},
				{
					content_id = "arrow_hover_down",
					pass_type = "texture",
					style_id = "down_arrow_hover",
					texture_id = "texture_id",
					content_check_function = function (content)
						local parent_content = content.parent
						local down_hotspot = parent_content.down_hotspot

						return down_hotspot.is_hover
					end,
				},
				{
					content_id = "arrow_hover",
					pass_type = "texture_uv",
					style_id = "up_arrow_hover",
					texture_id = "texture_id",
					content_check_function = function (content)
						local parent_content = content.parent
						local up_hotspot = parent_content.up_hotspot

						return up_hotspot.is_hover
					end,
				},
			},
		},
		content = {
			rect_masked = "rect_masked",
			up_hotspot = {},
			down_hotspot = {},
			arrow = {
				texture_id = "drop_down_menu_arrow",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
			arrow_hover = {
				texture_id = "drop_down_menu_arrow_clicked",
				uvs = {
					{
						0,
						1,
					},
					{
						1,
						0,
					},
				},
			},
			arrow_hover_down = {
				texture_id = "drop_down_menu_arrow_clicked",
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
			up_arrow = {
				horizontal_alignment = "right",
				masked = false,
				vertical_alignment = "bottom",
				offset = {
					-25,
					150,
					2,
				},
				texture_size = {
					31,
					15,
				},
			},
			up_arrow_background = {
				offset = {
					430,
					142,
					2,
				},
				size = {
					60,
					30,
				},
				color = {
					200,
					20,
					20,
					20,
				},
			},
			down_arrow = {
				horizontal_alignment = "right",
				masked = false,
				vertical_alignment = "bottom",
				offset = {
					-25,
					-50,
					3,
				},
				texture_size = {
					31,
					15,
				},
			},
			up_arrow_hover = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				offset = {
					-25,
					130,
					0,
				},
				texture_size = {
					31,
					28,
				},
			},
			down_arrow_hover = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				offset = {
					-25,
					-43,
					2,
				},
				texture_size = {
					31,
					28,
				},
			},
			down_arrow_background = {
				offset = {
					430,
					-55,
					2,
				},
				size = {
					60,
					30,
				},
				color = {
					200,
					20,
					20,
					20,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_loading_icon()
	return {
		scenegraph_id = "friends_mask",
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "loading_icon",
					texture_id = "loading_icon_id",
					content_change_function = function (content, style)
						style.angle = style.angle + 0.25
					end,
				},
			},
		},
		content = {
			loading_icon_id = "friends_icon_refresh",
		},
		style = {
			loading_icon = {
				angle = 0,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				pivot = {
					16,
					16,
				},
				texture_size = {
					32,
					32,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
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

local generic_input_actions = {
	default = {
		{
			description_text = "input_description_back",
			input_action = "back",
			priority = 5,
		},
	},
	only_refresh = {
		actions = {
			{
				input_action = "special_1",
				priority = 1,
				description_text = IS_PS4 and "matchmaking_join_game" or "menu_description_refresh",
			},
		},
	},
	friend = {
		actions = {
			{
				description_text = "input_description_show_profile",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
	friend_refresh = {
		actions = {
			{
				input_action = "special_1",
				priority = 1,
				description_text = IS_PS4 and "matchmaking_join_game" or "menu_description_refresh",
			},
			{
				description_text = "input_description_show_profile",
				input_action = "confirm",
				priority = 2,
			},
		},
	},
	friend_invite = {
		actions = {
			{
				description_text = "input_description_show_profile",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_invite",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
	friend_invite_refresh = {
		actions = {
			{
				input_action = "special_1",
				priority = 1,
				description_text = IS_PS4 and "matchmaking_join_game" or "menu_description_refresh",
			},
			{
				description_text = "input_description_show_profile",
				input_action = "confirm",
				priority = 2,
			},
			{
				description_text = "input_description_invite",
				input_action = "refresh",
				priority = 3,
			},
		},
	},
}
local header_text_style = {
	font_size = 56,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		-20,
		2,
	},
}
local party_header_text_style = {
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		0,
	},
}
local disable_with_gamepad = true
local widget_definitions = {
	background = UIWidgets.create_background_with_frame("background", {
		500,
		700,
	}, "mission_select_screen_bg", "menu_frame_12"),
	header = UIWidgets.create_simple_text("friend_list_friends", "header", nil, nil, header_text_style),
	party_header = UIWidgets.create_simple_text(string.upper(Localize("hero_view_player_list_party")), "party_header", nil, nil, party_header_text_style),
	friends_header = UIWidgets.create_simple_text(string.upper(Localize("lb_search_type_friends")), "friends_header", nil, nil, party_header_text_style),
	header_divider = UIWidgets.create_simple_texture("divider_01_top", "header_divider"),
	party_divider = UIWidgets.create_simple_texture("divider_01_top", "party_divider"),
	mask = UIWidgets.create_simple_texture("mask_rect", "friends_mask"),
	friends_bg = UIWidgets.create_background_with_frame("friends_mask", {
		friend_entry_size[1] + 20,
		friend_entry_size[2] * num_visible_friends + 20,
	}, "mission_select_screen_bg", "menu_frame_12"),
	loading_icon = create_loading_icon(),
	screen_fade = UIWidgets.create_simple_texture("gradient_dice_game_reward", "screen"),
	open_profile_button = UIWidgets.create_default_button("open_profile_button", scenegraph_definition.open_profile_button.size, nil, nil, Localize("input_description_show_profile"), 22, nil, nil, nil, disable_with_gamepad),
	invite_button = UIWidgets.create_default_button("invite_button", scenegraph_definition.invite_button.size, nil, nil, Localize("friend_list_invite"), 22, nil, nil, nil, disable_with_gamepad),
	selection_handler = create_selection_handler("selection_handler"),
}
local entry_definitions = {
	create_party_entry = create_party_entry,
	create_friend_entry = create_friend_entry,
	friend_entry_size = friend_entry_size,
}

return {
	generic_input_actions = generic_input_actions,
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	entry_definitions = entry_definitions,
	num_visible_friends = num_visible_friends,
}
