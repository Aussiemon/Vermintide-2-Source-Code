-- chunkname: @scripts/ui/views/deus_menu/deus_map_ui_definitions_v2.lua

require("scripts/ui/views/deus_menu/ui_widgets_deus")

local RETAINED_MODE_ENABLED = false
local portraits_pos = {
	0,
	-55,
	1,
}
local frame_pos = {
	0,
	0,
	2,
}
local texts_pos = {
	50,
	20,
	0,
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	top_info = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			1920,
			64,
		},
		position = {
			0,
			0,
			1,
		},
	},
	general_info = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			700,
			150,
		},
		position = {
			20,
			-200,
			1,
		},
	},
	console_cursor = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			100,
		},
	},
	node_info_pivot = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			0,
			-4000,
			10,
		},
	},
	node_info = {
		horizontal_alignment = "center",
		parent = "node_info_pivot",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			0,
		},
	},
	player_pivot = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			75,
			-120,
			1,
		},
	},
	player_1 = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "bottom",
		size = {
			0,
			0,
		},
		position = {
			75,
			150,
			1,
		},
	},
	player_1_portrait = {
		horizontal_alignment = "center",
		parent = "player_1",
		vertical_alignment = "center",
		position = portraits_pos,
		size = {
			0,
			0,
		},
	},
	player_1_texts = {
		horizontal_alignment = "center",
		parent = "player_1",
		vertical_alignment = "center",
		position = texts_pos,
		size = {
			0,
			0,
		},
	},
	player_1_frame = {
		horizontal_alignment = "center",
		parent = "player_1",
		vertical_alignment = "center",
		position = frame_pos,
		size = {
			0,
			0,
		},
	},
	player_2 = {
		horizontal_alignment = "left",
		parent = "player_pivot",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-220 * 0,
			1,
		},
	},
	player_2_portrait = {
		horizontal_alignment = "center",
		parent = "player_2",
		vertical_alignment = "center",
		position = portraits_pos,
		size = {
			0,
			0,
		},
	},
	player_2_texts = {
		horizontal_alignment = "center",
		parent = "player_2",
		vertical_alignment = "center",
		position = texts_pos,
		size = {
			0,
			0,
		},
	},
	player_2_frame = {
		horizontal_alignment = "center",
		parent = "player_2",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			0,
			0,
		},
	},
	player_3 = {
		horizontal_alignment = "left",
		parent = "player_pivot",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-220,
			1,
		},
	},
	player_3_portrait = {
		horizontal_alignment = "center",
		parent = "player_3",
		vertical_alignment = "center",
		position = portraits_pos,
		size = {
			0,
			0,
		},
	},
	player_3_texts = {
		horizontal_alignment = "center",
		parent = "player_3",
		vertical_alignment = "center",
		position = texts_pos,
		size = {
			0,
			0,
		},
	},
	player_3_frame = {
		horizontal_alignment = "center",
		parent = "player_3",
		vertical_alignment = "center",
		position = frame_pos,
		size = {
			0,
			0,
		},
	},
	player_4 = {
		horizontal_alignment = "left",
		parent = "player_pivot",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-440,
			1,
		},
	},
	player_4_portrait = {
		horizontal_alignment = "center",
		parent = "player_4",
		vertical_alignment = "center",
		position = portraits_pos,
		size = {
			0,
			0,
		},
	},
	player_4_texts = {
		horizontal_alignment = "center",
		parent = "player_4",
		vertical_alignment = "center",
		position = texts_pos,
		size = {
			0,
			0,
		},
	},
	player_4_frame = {
		horizontal_alignment = "center",
		parent = "player_4",
		vertical_alignment = "center",
		position = frame_pos,
		size = {
			0,
			0,
		},
	},
}

local function create_general_info_widget(scenegraph_id)
	local frame_settings = UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local size = scenegraph_definition[scenegraph_id].size

	return {
		element = {
			passes = {
				{
					pass_type = "text",
					retained_mode = false,
					style_id = "time",
					text_id = "time",
				},
			},
		},
		content = {
			time = "00:00",
		},
		style = {
			time = {
				font_size = 64,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				scenegraph_id = "screen",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-110,
					1,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_top_info_widget(scenegraph_id)
	local frame_settings = UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local size = scenegraph_definition[scenegraph_id].size
	local frame_size = {
		size[1] + edge_height * 2,
		size[2] + edge_height * 2,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "rect",
					style_id = "rect",
				},
				{
					pass_type = "text",
					style_id = "title",
					text_id = "title",
				},
				{
					pass_type = "text",
					style_id = "journey_name_label",
					text_id = "journey_name_label",
				},
			},
		},
		content = {
			journey_name_label = "journey_cave_name",
			title = "deus_map_title",
			frame = frame_settings.texture,
		},
		style = {
			frame = {
				only_corners = false,
				color = UISettings.console_menu_rect_color,
				size = frame_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					-edge_height,
					-edge_height,
					0,
				},
			},
			rect = {
				color = UISettings.console_menu_rect_color,
				offset = {
					0,
					0,
					0,
				},
			},
			title = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					-4,
					0,
				},
			},
			journey_name_label = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-34,
					1,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local coins_icon = {
	offset = {
		10,
		-30,
		0,
	},
	texture_size = {
		20,
		20,
	},
}

local function create_player_texts_widget(scenegraph_id)
	local name_text = {
		dynamic_font_size = true,
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			10,
			0,
			0,
		},
		size = {
			180,
			24,
		},
	}
	local name_text_shadow = table.clone(name_text)

	name_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	name_text_shadow.offset = {
		name_text.offset[1] + 2,
		name_text.offset[2] - 2,
		name_text.offset[3] - 1,
	}

	local coins_text = {
		dynamic_font_size = true,
		font_size = 26,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			coins_icon.offset[1] + coins_icon.texture_size[1] + 5,
			coins_icon.offset[2] - 1,
			coins_icon.offset[3],
		},
		size = {
			100,
			20,
		},
	}
	local coins_text_shadow = table.clone(coins_text)

	coins_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	coins_text_shadow.offset = {
		coins_text.offset[1] + 2,
		coins_text.offset[2] - 2,
		coins_text.offset[3] - 1,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "name_text",
					text_id = "name_text",
					content_check_function = function (content)
						return content.visible
					end,
				},
				{
					pass_type = "text",
					style_id = "name_text_shadow",
					text_id = "name_text",
					content_check_function = function (content)
						return content.visible
					end,
				},
				{
					pass_type = "text",
					style_id = "coins_text",
					text_id = "coins_text",
					content_check_function = function (content)
						return content.visible
					end,
				},
				{
					pass_type = "text",
					style_id = "coins_text_shadow",
					text_id = "coins_text",
					content_check_function = function (content)
						return content.visible
					end,
				},
				{
					pass_type = "texture",
					style_id = "coins_icon",
					texture_id = "coins_icon",
					content_check_function = function (content)
						return content.visible
					end,
				},
			},
		},
		content = {
			coins_icon = "deus_icons_coin",
			coins_text = "0",
			name_text = "",
			visible = true,
		},
		style = {
			name_text = name_text,
			name_text_shadow = name_text_shadow,
			coins_text = coins_text,
			coins_text_shadow = coins_text_shadow,
			coins_icon = coins_icon,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_node_info_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "node_info",
					pass_type = "auto_layout",
					style_id = "node_info",
					sub_passes = {
						{
							content_id = "none_modifier_info",
							pass_type = "auto_layout",
							style_id = "none_modifier_info",
							text_id = "none_modifier_info",
							sub_passes = {
								{
									pass_type = "text",
									style_id = "title",
									text_id = "title",
								},
								{
									pass_type = "text",
									style_id = "click_to_vote",
									text_id = "click_to_vote",
									content_check_function = function (content)
										return content.click_to_vote ~= ""
									end,
								},
								{
									pass_type = "texture",
									style_id = "pre_description_divider",
									texture_id = "pre_description_divider",
								},
								{
									pass_type = "text",
									style_id = "description",
									text_id = "description",
								},
								{
									pass_type = "texture",
									style_id = "post_description_divider",
									texture_id = "post_description_divider",
								},
							},
						},
						{
							pass_type = "auto_layout",
							style_id = "curse_section",
							content_check_function = function (content)
								return content.curse_text ~= ""
							end,
							sub_passes = {
								{
									pass_type = "texture",
									style_id = "curse_icon",
									texture_id = "curse_icon",
								},
								{
									pass_type = "text",
									style_id = "curse_text",
									text_id = "curse_text",
								},
							},
						},
						{
							pass_type = "auto_layout",
							style_id = "breed_section",
							content_check_function = function (content)
								return content.breed_text ~= ""
							end,
							sub_passes = {
								{
									pass_type = "texture",
									style_id = "breed_icon",
									texture_id = "breed_icon",
								},
								{
									pass_type = "text",
									style_id = "breed_text",
									text_id = "breed_text",
								},
							},
						},
						{
							content_id = "minor_modifier_1_section",
							pass_type = "auto_layout",
							style_id = "minor_modifier_section",
							content_check_function = function (content)
								return content.text ~= ""
							end,
							sub_passes = {
								{
									pass_type = "texture",
									style_id = "icon",
									texture_id = "icon",
								},
								{
									pass_type = "text",
									style_id = "text",
									text_id = "text",
								},
							},
						},
						{
							content_id = "minor_modifier_2_section",
							pass_type = "auto_layout",
							style_id = "minor_modifier_section",
							content_check_function = function (content)
								return content.text ~= ""
							end,
							sub_passes = {
								{
									pass_type = "texture",
									style_id = "icon",
									texture_id = "icon",
								},
								{
									pass_type = "text",
									style_id = "text",
									text_id = "text",
								},
							},
						},
						{
							content_id = "minor_modifier_3_section",
							pass_type = "auto_layout",
							style_id = "minor_modifier_section",
							content_check_function = function (content)
								return content.text ~= ""
							end,
							sub_passes = {
								{
									pass_type = "texture",
									style_id = "icon",
									texture_id = "icon",
								},
								{
									pass_type = "text",
									style_id = "text",
									text_id = "text",
								},
							},
						},
						{
							pass_type = "auto_layout",
							style_id = "terror_event_power_up_section",
							content_check_function = function (content)
								return content.terror_event_power_up_text ~= ""
							end,
							sub_passes = {
								{
									pass_type = "texture",
									style_id = "terror_event_power_up_icon",
									texture_id = "terror_event_power_up_icon",
								},
								{
									pass_type = "text",
									style_id = "terror_event_power_up_text",
									text_id = "terror_event_power_up_text",
								},
							},
						},
					},
					background_passes = {
						{
							pass_type = "texture_frame",
							style_id = "frame",
							texture_id = "frame",
							content_change_function = function (content, style)
								content.frame = UIFrameSettings[content.frame_settings_name].texture
								style.texture_size = UIFrameSettings[content.frame_settings_name].texture_size
								style.texture_sizes = UIFrameSettings[content.frame_settings_name].texture_sizes
							end,
						},
						{
							pass_type = "rect",
							style_id = "bg",
						},
					},
				},
			},
		},
		content = {
			node_info = {
				breed_icon = "mutator_icon_elite_run",
				breed_text = "breed_text",
				curse_icon = "deus_icons_map_khorne",
				curse_text = "curse_text",
				frame_settings_name = "menu_frame_12",
				terror_event_power_up_icon = "mutator_icon_elite_run",
				terror_event_power_up_text = "terror_event_power_up_text",
				none_modifier_info = {
					click_to_vote = "click_to_vote",
					description = "description",
					post_description_divider = "weave_forge_slot_divider_tooltip",
					pre_description_divider = "weave_forge_slot_divider_tooltip",
					title = "title",
				},
				minor_modifier_1_section = {
					icon = "trinket_increase_grenade_radius",
					text = "minor_modifier_text",
				},
				minor_modifier_2_section = {
					icon = "trinket_increase_grenade_radius",
					text = "minor_modifier_text",
				},
				minor_modifier_3_section = {
					icon = "trinket_increase_grenade_radius",
					text = "minor_modifier_text",
				},
			},
		},
		style = {
			node_info = {
				horizontal_alignment = "right",
				layout_delta_x = 0,
				layout_delta_y = -1,
				vertical_alignment = "bottom",
				offset = {
					-50,
					50,
					0,
				},
				screen_padding = {
					left = 50,
					right = 50,
					top = 50,
				},
				none_modifier_info = {
					dynamic_size = true,
					horizontal_alignment = "center",
					layout_delta_x = 0,
					layout_delta_y = -1,
					vertical_alignment = "bottom",
					title = {
						dynamic_size = true,
						font_size = 28,
						font_type = "hell_shark_header",
						horizontal_alignment = "center",
						localize = false,
						vertical_alignment = "bottom",
						word_wrap = true,
						text_color = Colors.get_color_table_with_alpha("font_title", 255),
						offset = {
							0,
							0,
							0,
						},
						size = {
							300,
							0,
						},
					},
					click_to_vote = {
						dynamic_size = true,
						font_size = 18,
						font_type = "hell_shark",
						horizontal_alignment = "center",
						localize = true,
						vertical_alignment = "bottom",
						word_wrap = true,
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0,
						},
						size = {
							300,
							0,
						},
					},
					pre_description_divider = {
						height_margin = 5,
						horizontal_alignment = "center",
						layout_bottom_padding = 4,
						layout_top_padding = 4,
						vertical_alignment = "bottom",
						texture_size = {
							200,
							3,
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
							0,
						},
						size = {
							300,
							3,
						},
					},
					description = {
						dynamic_size = true,
						font_size = 18,
						font_type = "hell_shark",
						horizontal_alignment = "center",
						localize = false,
						vertical_alignment = "center",
						word_wrap = true,
						text_color = {
							255,
							120,
							120,
							120,
						},
						offset = {
							0,
							0,
							0,
						},
						size = {
							300,
							0,
						},
					},
					post_description_divider = {
						height_margin = 5,
						horizontal_alignment = "center",
						layout_bottom_padding = 4,
						layout_top_padding = 4,
						vertical_alignment = "center",
						texture_size = {
							200,
							3,
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
							0,
						},
						size = {
							300,
							3,
						},
					},
				},
				curse_section = {
					dynamic_size = true,
					layout_delta_x = 1,
					layout_delta_y = 0,
					curse_icon = {
						height_margin = 0,
						horizontal_alignment = "left",
						layout_left_padding = 4,
						layout_right_padding = 4,
						vertical_alignment = "center",
						texture_size = {
							30,
							30,
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
							0,
						},
						size = {
							30,
							30,
						},
					},
					curse_text = {
						dynamic_width = true,
						font_size = 20,
						font_type = "hell_shark",
						horizontal_alignment = "left",
						localize = false,
						vertical_alignment = "center",
						word_wrap = false,
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0,
						},
						size = {
							250,
							30,
						},
					},
				},
				minor_modifier_section = {
					dynamic_size = true,
					layout_delta_x = 1,
					layout_delta_y = 0,
					icon = {
						height_margin = 0,
						horizontal_alignment = "left",
						layout_left_padding = 4,
						layout_right_padding = 4,
						vertical_alignment = "center",
						texture_size = {
							30,
							30,
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
							0,
						},
						size = {
							30,
							30,
						},
					},
					text = {
						dynamic_width = true,
						font_size = 20,
						font_type = "hell_shark",
						horizontal_alignment = "left",
						localize = false,
						vertical_alignment = "center",
						word_wrap = false,
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0,
						},
						size = {
							250,
							30,
						},
					},
				},
				breed_section = {
					dynamic_size = true,
					layout_delta_x = 1,
					layout_delta_y = 0,
					breed_icon = {
						height_margin = 0,
						horizontal_alignment = "left",
						layout_left_padding = 4,
						layout_right_padding = 4,
						vertical_alignment = "center",
						texture_size = {
							30,
							30,
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
							0,
						},
						size = {
							30,
							30,
						},
					},
					breed_text = {
						dynamic_width = true,
						font_size = 20,
						font_type = "hell_shark",
						horizontal_alignment = "left",
						localize = false,
						vertical_alignment = "center",
						word_wrap = false,
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0,
						},
						size = {
							250,
							30,
						},
					},
				},
				terror_event_power_up_section = {
					dynamic_size = true,
					layout_delta_x = 1,
					layout_delta_y = 0,
					terror_event_power_up_icon = {
						height_margin = 0,
						horizontal_alignment = "left",
						layout_left_padding = 4,
						layout_right_padding = 4,
						vertical_alignment = "center",
						texture_size = {
							30,
							30,
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
							0,
						},
						size = {
							30,
							30,
						},
					},
					terror_event_power_up_text = {
						dynamic_width = true,
						font_size = 20,
						font_type = "hell_shark",
						horizontal_alignment = "left",
						localize = false,
						vertical_alignment = "center",
						word_wrap = false,
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0,
						},
						size = {
							250,
							30,
						},
					},
				},
				bg = {
					layout_bottom_padding = 10,
					layout_left_padding = 10,
					layout_right_padding = 10,
					layout_top_padding = 10,
					color = {
						255,
						3,
						3,
						3,
					},
					offset = {
						0,
						0,
						-5,
					},
				},
				frame = {
					layout_bottom_padding = 10,
					layout_left_padding = 10,
					layout_right_padding = 10,
					layout_top_padding = 10,
					offset = {
						0,
						0,
						-3,
					},
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

local widget_definitions = {
	console_cursor = UIWidgets.create_console_cursor("console_cursor"),
	top_info = create_top_info_widget("top_info"),
	general_info = create_general_info_widget("general_info"),
	node_info = create_node_info_widget("node_info"),
	player_1_portrait = UIWidgets.create_deus_player_status_portrait("player_1_portrait", "default", "-"),
	player_1_texts = create_player_texts_widget("player_1_texts"),
	player_2_portrait = UIWidgets.create_deus_player_status_portrait("player_2_portrait", "default", "-"),
	player_2_texts = create_player_texts_widget("player_2_texts"),
	player_3_portrait = UIWidgets.create_deus_player_status_portrait("player_3_portrait", "default", "-"),
	player_3_texts = create_player_texts_widget("player_3_texts"),
	player_4_portrait = UIWidgets.create_deus_player_status_portrait("player_4_portrait", "default", "-"),
	player_4_texts = create_player_texts_widget("player_4_texts"),
}

return {
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
}
