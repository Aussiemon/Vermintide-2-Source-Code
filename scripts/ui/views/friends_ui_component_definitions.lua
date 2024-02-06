-- chunkname: @scripts/ui/views/friends_ui_component_definitions.lua

local ui_size = {
	400,
	550,
}
local top_info_box_size = {
	ui_size[1],
	50,
}
local top_info_box_divider = {
	top_info_box_size[1] - 6,
	0,
}
local tabs_size = {
	ui_size[1],
	50,
}
local tabs_active_size = {
	ui_size[1],
	ui_size[2] - top_info_box_size[2] - tabs_size[2] * 1,
}
local scenegraph_info = {
	ui_size = ui_size,
	tabs_size = tabs_size,
	tabs_active_size = tabs_active_size,
}
local FRIEND_LIST_LIMIT = 400

if IS_XB1 then
	FRIEND_LIST_LIMIT = 1000
elseif IS_PS4 then
	FRIEND_LIST_LIMIT = 2000
end

local friends_entry_size = {
	ui_size[1],
	40,
}
local list_info = {
	friend_list_limit = FRIEND_LIST_LIMIT,
	friends_entry_size = friends_entry_size,
}
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
	friends_button_root = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			60,
			60,
		},
		position = {
			90,
			20,
			1,
		},
	},
	main_background = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = ui_size,
		position = {
			20,
			100,
			1,
		},
	},
	top_info_box = {
		horizontal_alignment = "center",
		parent = "main_background",
		vertical_alignment = "top",
		size = top_info_box_size,
		position = {
			0,
			0,
			1,
		},
	},
	top_info_box_divider = {
		horizontal_alignment = "center",
		parent = "top_info_box",
		vertical_alignment = "bottom",
		size = top_info_box_divider,
		position = {
			0,
			0,
			5,
		},
	},
	exit_button = {
		horizontal_alignment = "right",
		parent = "top_info_box",
		vertical_alignment = "center",
		size = {
			32,
			32,
		},
		position = {
			-10,
			0,
			1,
		},
	},
	refresh_button = {
		horizontal_alignment = "left",
		parent = "exit_button",
		vertical_alignment = "center",
		size = {
			32,
			32,
		},
		position = {
			-29,
			0,
			1,
		},
	},
	online_tab = {
		horizontal_alignment = "center",
		parent = "top_info_box",
		vertical_alignment = "bottom",
		size = {
			tabs_size[1],
			tabs_size[2],
		},
		position = {
			0,
			-tabs_size[2],
			0,
		},
	},
	offline_tab = {
		horizontal_alignment = "center",
		parent = "online_tab",
		vertical_alignment = "bottom",
		size = {
			tabs_size[1],
			tabs_size[2],
		},
		position = {
			0,
			-tabs_size[2],
			0,
		},
	},
	online_tab_list = {
		horizontal_alignment = "center",
		parent = "online_tab",
		vertical_alignment = "top",
		size = {
			friends_entry_size[1],
			friends_entry_size[2] * FRIEND_LIST_LIMIT,
		},
		position = {
			0,
			-tabs_size[2],
			1,
		},
	},
	offline_tab_list = {
		horizontal_alignment = "center",
		parent = "offline_tab",
		vertical_alignment = "top",
		size = {
			friends_entry_size[1],
			friends_entry_size[2] * FRIEND_LIST_LIMIT,
		},
		position = {
			0,
			-tabs_size[2],
			1,
		},
	},
}

local function create_friends_button(scenegraph_id, size)
	local frame_settings = UIFrameSettings.menu_frame_12
	local element = {
		passes = {
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
				style_id = "button",
			},
			{
				pass_type = "rect",
				style_id = "button",
			},
			{
				pass_type = "texture_frame",
				style_id = "frame",
				texture_id = "frame",
			},
			{
				pass_type = "texture",
				style_id = "icon",
				texture_id = "icon",
				content_check_function = function (content)
					return not content.button_hotspot.is_hover
				end,
			},
			{
				pass_type = "texture",
				style_id = "icon_hover",
				texture_id = "icon",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end,
			},
			{
				pass_type = "texture",
				style_id = "hover",
				texture_id = "hover",
				content_check_function = function (content)
					return content.button_hotspot.is_hover
				end,
			},
		},
	}
	local content = {
		hover = "button_state_default_2",
		icon = "friends_icon_01",
		button_hotspot = {},
		frame = frame_settings.texture,
	}
	local style = {
		button = {
			color = Colors.get_color_table_with_alpha("black", 200),
			offset = {
				0,
				0,
				0,
			},
		},
		icon = {
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			offset = {
				0,
				0,
				3,
			},
		},
		icon_hover = {
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				3,
			},
		},
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		hover = {
			color = {
				255,
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
	}
	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_window_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "bottom_edge",
					texture_id = "bottom_edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_left",
					texture_id = "edge_holder_left",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_right",
					texture_id = "edge_holder_right",
				},
			},
		},
		content = {
			bottom_edge = "menu_frame_12_divider",
			edge_holder_left = "menu_frame_12_divider_left",
			edge_holder_right = "menu_frame_12_divider_right",
		},
		style = {
			bottom_edge = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					6,
				},
				size = {
					size[1],
					5,
				},
				texture_tiling_size = {
					size[1] - 10,
					5,
				},
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 9,
					-6,
					10,
				},
				size = {
					9,
					17,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}

	return widget
end

local function create_tab(scenegraph_id, size, text, list_scenegraph_id, edge_tab)
	local divider_size = {
		size[1] - 6,
		size[2],
	}
	local element = {
		passes = {
			{
				content_id = "button_hotspot",
				pass_type = "hotspot",
				style_id = "hotspot",
			},
			{
				pass_type = "text",
				style_id = "text",
				text_id = "real_text",
				content_check_function = function (content)
					return not content.active and not content.button_hotspot.is_hover
				end,
			},
			{
				pass_type = "text",
				style_id = "text_hover",
				text_id = "real_text",
				content_check_function = function (content)
					return content.active or content.button_hotspot.is_hover
				end,
			},
			{
				pass_type = "rotated_texture",
				style_id = "drop_down_arrow",
				texture_id = "drop_down_arrow",
			},
			{
				content_id = "scrollbar",
				pass_type = "scrollbar_hotspot",
				style_id = "scrollbar",
				content_check_function = function (content)
					return content.active
				end,
			},
			{
				content_id = "scrollbar",
				pass_type = "scrollbar",
				style_id = "scrollbar",
				content_check_function = function (content)
					return content.active
				end,
			},
			{
				pass_type = "texture",
				style_id = "mask",
				texture_id = "mask_texture",
				content_check_function = function (content)
					return content.active
				end,
			},
			{
				content_id = "list_content",
				pass_type = "list_pass",
				style_id = "list_style",
				content_check_function = function (content)
					return content.active
				end,
				passes = {
					{
						pass_type = "text",
						style_id = "name",
						text_id = "name",
					},
					{
						content_id = "invite_button",
						pass_type = "hotspot",
						style_id = "invite_button",
						content_check_function = function (content)
							return content.allow_invite
						end,
					},
					{
						content_id = "invite_button",
						pass_type = "texture",
						style_id = "invite_button",
						texture_id = "invite_button_texture",
						content_check_function = function (content)
							return content.allow_invite and not content.is_hover
						end,
					},
					{
						content_id = "invite_button",
						pass_type = "texture",
						style_id = "invite_button_hover",
						texture_id = "invite_button_texture",
						content_check_function = function (content)
							return content.allow_invite and content.is_hover
						end,
					},
					{
						content_id = "profile_button",
						pass_type = "hotspot",
						style_id = "profile_button",
						content_check_function = function (content)
							return content.allow_profile
						end,
					},
					{
						content_id = "profile_button",
						pass_type = "texture",
						style_id = "profile_button",
						texture_id = "profile_button_texture",
						content_check_function = function (content)
							return content.allow_profile and not content.is_hover
						end,
					},
					{
						content_id = "profile_button",
						pass_type = "texture",
						style_id = "profile_button_hover",
						texture_id = "profile_button_texture",
						content_check_function = function (content)
							return content.allow_profile and content.is_hover
						end,
					},
					{
						content_id = "join_button",
						pass_type = "hotspot",
						style_id = "join_button",
						content_check_function = function (content)
							return content.allow_join
						end,
					},
					{
						content_id = "join_button",
						pass_type = "texture",
						style_id = "join_button",
						texture_id = "join_button_texture",
						content_check_function = function (content)
							return content.allow_join and not content.is_hover
						end,
					},
					{
						content_id = "join_button",
						pass_type = "texture",
						style_id = "join_button_hover",
						texture_id = "join_button_texture",
						content_check_function = function (content)
							return content.allow_join and content.is_hover
						end,
					},
				},
			},
			{
				pass_type = "tiled_texture",
				style_id = "bottom_edge",
				texture_id = "bottom_edge",
			},
		},
	}
	local content = {
		bottom_edge = "menu_frame_12_divider",
		drop_down_arrow = "drop_down_menu_arrow",
		edge_holder_left = "menu_frame_12_divider_left",
		edge_holder_right = "menu_frame_12_divider_right",
		edge_tab = true,
		mask_texture = "mask_rect",
		button_hotspot = {},
		text = text,
		real_text = text .. " (0)",
		scrollbar = {
			percentage = 0.1,
			scroll_amount = 0.1,
			scroll_value = 1,
		},
		list_content = {
			allow_multi_hover = true,
		},
	}
	local list_content = content.list_content

	for i = 1, FRIEND_LIST_LIMIT do
		list_content[i] = {
			name = "friends_view_unknown",
			button_hotspot = {},
			invite_button = {
				allow_invite = true,
				invite_button_texture = "friends_icon_invite",
			},
			profile_button = {
				allow_profile = true,
				profile_button_texture = "friends_icon_profile",
			},
			join_button = {
				allow_join = true,
				join_button_texture = "friends_icon_join",
			},
		}
	end

	local style = {
		hotspot = {
			size = {
				size[1],
				size[2],
			},
			offset = {
				0,
				0,
				0,
			},
		},
		text = {
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			normal_color = Colors.get_color_table_with_alpha("font_default", 255),
			highlighted_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				13,
				-8,
				5,
			},
		},
		text_hover = {
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = false,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("white", 255),
			normal_color = Colors.get_color_table_with_alpha("font_default", 255),
			highlighted_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				13,
				-8,
				5,
			},
		},
		drop_down_arrow = {
			angle = 0,
			horizontal_alignment = "right",
			vertical_alignment = "top",
			texture_size = {
				31,
				15,
			},
			pivot = {
				15.5,
				7.5,
			},
			offset = {
				-12,
				-14,
				1,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		scrollbar = {
			hotspot_width_modifier = 5,
			min_scrollbar_height = 30,
			size = {
				2,
				tabs_active_size[2] - tabs_size[2] - 10,
			},
			offset = {
				tabs_active_size[1] - 15,
				10,
				100,
			},
			background_color = Colors.get_color_table_with_alpha("very_dark_gray", 255),
			scrollbar_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			scroll_area_size = {
				ui_size[1],
				tabs_active_size[2] - tabs_size[2],
			},
			scroll_area_offset = {
				-ui_size[1] + 19,
				-10,
				0,
			},
		},
		scrollbar_scroll_area = {},
		mask = {
			size = {
				size[1],
				tabs_active_size[2] - tabs_size[2],
			},
			color = {
				150,
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
		list_style = {
			horizontal_alignment = "center",
			num_draws = 0,
			start_index = 1,
			vertical_alignment = "top",
			list_member_offset = {
				0,
				friends_entry_size[2],
				0,
			},
			size = {
				friends_entry_size[1],
				friends_entry_size[2],
			},
			scenegraph_id = list_scenegraph_id,
			item_styles = {},
		},
		bottom_edge = {
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				3,
				0,
				6,
			},
			size = {
				divider_size[1],
				5,
			},
			texture_tiling_size = {
				divider_size[1] - 10,
				5,
			},
			content_check_function = function (content)
				return not content.edge_tab or not content.active
			end,
		},
	}
	local item_styles = style.list_style.item_styles

	for i = 1, FRIEND_LIST_LIMIT do
		item_styles[i] = {
			list_member_offset = {
				0,
				-friends_entry_size[2],
				0,
			},
			size = {
				friends_entry_size[1],
				friends_entry_size[2],
			},
			name = {
				font_size = 22,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				normal_color = Colors.get_color_table_with_alpha("font_default", 255),
				highlighted_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					13,
					0,
					1,
				},
			},
			join_button = {
				masked = true,
				size = {
					32,
					32,
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					tabs_size[1] - 112,
					3,
					1,
				},
			},
			join_button_hover = {
				masked = true,
				size = {
					32,
					32,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					tabs_size[1] - 112,
					3,
					1,
				},
			},
			invite_button = {
				masked = true,
				size = {
					32,
					32,
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					tabs_size[1] - 80,
					3,
					1,
				},
			},
			invite_button_hover = {
				masked = true,
				size = {
					32,
					32,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					tabs_size[1] - 80,
					3,
					1,
				},
			},
			profile_button = {
				masked = true,
				size = {
					32,
					32,
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					tabs_size[1] - 48,
					3,
					1,
				},
			},
			profile_button_hover = {
				masked = true,
				size = {
					32,
					32,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					tabs_size[1] - 48,
					3,
					1,
				},
			},
			rect = {
				size = {
					friends_entry_size[1],
					friends_entry_size[2],
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
					100,
				},
			},
		}
	end

	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_info_box_button(scenegraph_id, texture)
	local size = scenegraph_definition[scenegraph_id].size
	local element = {
		passes = {
			{
				pass_type = "hotspot",
			},
			{
				pass_type = "texture",
				style_id = "button_texture",
				texture_id = "button_texture",
				content_check_function = function (content)
					return not content.is_hover
				end,
			},
			{
				pass_type = "texture",
				style_id = "button_texture_hover",
				texture_id = "button_texture",
				content_check_function = function (content)
					return content.is_hover
				end,
			},
		},
	}
	local content = {
		button_texture = texture,
	}
	local style = {
		size = {
			size[1],
			size[2],
		},
		color = {
			255,
			255,
			255,
			255,
		},
		button_texture_hover = {
			size = {
				size[1],
				size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		button_texture = {
			size = {
				size[1],
				size[2],
			},
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		},
	}
	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_info_box_button_rotated_texture(scenegraph_id, texture)
	local size = scenegraph_definition[scenegraph_id].size
	local element = {
		passes = {
			{
				pass_type = "hotspot",
			},
			{
				pass_type = "rotated_texture",
				style_id = "button_texture",
				texture_id = "button_texture",
				content_check_function = function (content)
					return not content.is_hover
				end,
			},
			{
				pass_type = "rotated_texture",
				style_id = "button_texture_hover",
				texture_id = "button_texture",
				content_check_function = function (content)
					return content.is_hover
				end,
			},
		},
	}
	local content = {
		button_texture = texture,
	}
	local style = {
		size = {
			size[1],
			size[2],
		},
		color = {
			255,
			255,
			255,
			255,
		},
		button_texture_hover = {
			size = {
				size[1],
				size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
			angle = math.pi,
			pivot = {
				size[1] * 0.5,
				size[2] * 0.5,
			},
			offset = {
				0,
				0,
				1,
			},
		},
		button_texture = {
			angle = 0,
			size = {
				size[1],
				size[2],
			},
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			pivot = {
				size[1] * 0.5,
				size[2] * 0.5,
			},
			offset = {
				0,
				0,
				1,
			},
		},
	}
	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local function create_hotspot_area(scenegraph_id, size)
	local passes = {}
	local content = {
		allow_multi_hover = true,
	}
	local style = {}

	passes[#passes + 1] = {
		pass_type = "hotspot",
		style_id = "hotspot",
	}
	style.hotspot = {
		allow_multi_hover = true,
		size = size,
	}

	local widget = {
		element = {},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local info_box_text_style = {
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		13,
		2,
		5,
	},
}
local widget_definitions = {
	friends_button = create_friends_button("friends_button_root", scenegraph_definition.friends_button_root.size),
	main_background = UIWidgets.create_simple_rect("main_background", Colors.get_color_table_with_alpha("black", 220)),
	main_background_frame = UIWidgets.create_frame("main_background", scenegraph_definition.main_background.size, "menu_frame_12", 20),
	top_info_box_text = UIWidgets.create_simple_text(Localize("friends_view"), "top_info_box", 22, nil, info_box_text_style),
	top_info_box_divider = create_window_divider("top_info_box_divider", scenegraph_definition.top_info_box_divider.size),
	exit_button = create_info_box_button("exit_button", "friends_icon_close"),
	refresh_button = create_info_box_button_rotated_texture("refresh_button", "friends_icon_refresh"),
	online_tab = create_tab("online_tab", scenegraph_definition.online_tab.size, Localize("friends_view_online"), "online_tab_list"),
	offline_tab = create_tab("offline_tab", scenegraph_definition.offline_tab.size, Localize("friends_view_offline"), "offline_tab_list", true),
	hotspot_area = create_hotspot_area("main_background", scenegraph_definition.main_background.size),
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	scenegraph_info = scenegraph_info,
	list_info = list_info,
}
