require("scripts/ui/views/deus_menu/ui_widgets_deus")

local RETAINED_MODE_ENABLED = false
local items_pos = {
	-15,
	-120,
	0
}
local portraits_pos = {
	0,
	-55,
	1
}
local frame_pos = {
	0,
	0,
	2
}
local texts_pos = {
	50,
	20,
	0
}
local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	top_info = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			1920,
			64
		},
		position = {
			0,
			0,
			1
		}
	},
	general_info = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			700,
			150
		},
		position = {
			20,
			-200,
			1
		}
	},
	console_cursor = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			100
		}
	},
	node_info_pivot = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			0,
			-4000,
			10
		}
	},
	node_info = {
		vertical_alignment = "center",
		parent = "node_info_pivot",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			0,
			0
		}
	},
	player_state = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			1920,
			200
		},
		position = {
			0,
			0,
			1
		}
	},
	players_container = {
		vertical_alignment = "bottom",
		parent = "player_state",
		horizontal_alignment = "left",
		size = {
			1920,
			200
		},
		position = {
			100,
			30,
			0
		}
	},
	player_1 = {
		vertical_alignment = "bottom",
		parent = "players_container",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			192,
			100,
			1
		}
	},
	player_1_portrait = {
		vertical_alignment = "center",
		parent = "player_1",
		horizontal_alignment = "center",
		position = portraits_pos,
		size = {
			0,
			0
		}
	},
	player_1_texts = {
		vertical_alignment = "center",
		parent = "player_1",
		horizontal_alignment = "center",
		position = texts_pos,
		size = {
			0,
			0
		}
	},
	player_1_frame = {
		vertical_alignment = "center",
		parent = "player_1",
		horizontal_alignment = "center",
		position = frame_pos,
		size = {
			0,
			0
		}
	},
	player_1_items = {
		vertical_alignment = "center",
		parent = "player_1",
		horizontal_alignment = "center",
		position = items_pos,
		size = {
			0,
			0
		}
	},
	player_2 = {
		vertical_alignment = "bottom",
		parent = "players_container",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			576,
			100,
			1
		}
	},
	player_2_portrait = {
		vertical_alignment = "center",
		parent = "player_2",
		horizontal_alignment = "center",
		position = portraits_pos,
		size = {
			0,
			0
		}
	},
	player_2_texts = {
		vertical_alignment = "center",
		parent = "player_2",
		horizontal_alignment = "center",
		position = texts_pos,
		size = {
			0,
			0
		}
	},
	player_2_frame = {
		vertical_alignment = "center",
		parent = "player_2",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			0,
			0
		}
	},
	player_2_items = {
		vertical_alignment = "center",
		parent = "player_2",
		horizontal_alignment = "center",
		position = items_pos,
		size = {
			0,
			0
		}
	},
	player_3 = {
		vertical_alignment = "bottom",
		parent = "players_container",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			960,
			100,
			1
		}
	},
	player_3_portrait = {
		vertical_alignment = "center",
		parent = "player_3",
		horizontal_alignment = "center",
		position = portraits_pos,
		size = {
			0,
			0
		}
	},
	player_3_texts = {
		vertical_alignment = "center",
		parent = "player_3",
		horizontal_alignment = "center",
		position = texts_pos,
		size = {
			0,
			0
		}
	},
	player_3_frame = {
		vertical_alignment = "center",
		parent = "player_3",
		horizontal_alignment = "center",
		position = frame_pos,
		size = {
			0,
			0
		}
	},
	player_3_items = {
		vertical_alignment = "center",
		parent = "player_3",
		horizontal_alignment = "center",
		position = items_pos,
		size = {
			0,
			0
		}
	},
	player_4 = {
		vertical_alignment = "bottom",
		parent = "players_container",
		horizontal_alignment = "left",
		size = {
			0,
			0
		},
		position = {
			1344,
			100,
			1
		}
	},
	player_4_portrait = {
		vertical_alignment = "center",
		parent = "player_4",
		horizontal_alignment = "center",
		position = portraits_pos,
		size = {
			0,
			0
		}
	},
	player_4_texts = {
		vertical_alignment = "center",
		parent = "player_4",
		horizontal_alignment = "center",
		position = texts_pos,
		size = {
			0,
			0
		}
	},
	player_4_frame = {
		vertical_alignment = "center",
		parent = "player_4",
		horizontal_alignment = "center",
		position = frame_pos,
		size = {
			0,
			0
		}
	},
	player_4_items = {
		vertical_alignment = "center",
		parent = "player_4",
		horizontal_alignment = "center",
		position = items_pos,
		size = {
			0,
			0
		}
	}
}

local function create_general_info_widget(scenegraph_id)
	local frame_settings = UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local size = scenegraph_definition[scenegraph_id].size
	local frame_size = {
		size[1] + edge_height * 2,
		size[2] + edge_height * 2
	}
	local title_style = {
		vertical_alignment = "top",
		horizontal_alignment = "left",
		localize = false,
		dynamic_font_size = true,
		font_size = 32,
		font_type = "hell_shark_header",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			0,
			0,
			1
		}
	}
	local description_style = {
		vertical_alignment = "top",
		font_size = 32,
		localize = false,
		horizontal_alignment = "left",
		word_wrap = true,
		font_type = "hell_shark_header",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			0,
			-50,
			1
		}
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					style_id = "rect",
					pass_type = "rect",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "title",
					pass_type = "text",
					text_id = "title"
				},
				{
					style_id = "description",
					pass_type = "text",
					text_id = "description"
				},
				{
					retained_mode = false,
					style_id = "time",
					pass_type = "text",
					text_id = "time"
				}
			}
		},
		content = {
			title = "...",
			time = "00:00",
			description = "...",
			frame = frame_settings.texture
		},
		style = {
			frame = {
				color = UISettings.console_menu_rect_color,
				size = frame_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					-edge_height,
					-edge_height,
					0
				}
			},
			rect = {
				color = UISettings.console_menu_rect_color,
				offset = {
					0,
					0,
					0
				}
			},
			title = title_style,
			description = description_style,
			time = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				localize = false,
				font_size = 32,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_top_info_widget(scenegraph_id)
	local frame_settings = UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local size = scenegraph_definition[scenegraph_id].size
	local frame_size = {
		size[1] + edge_height * 2,
		size[2] + edge_height * 2
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					style_id = "rect",
					pass_type = "rect",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "title",
					pass_type = "text",
					text_id = "title",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "journey_name_label",
					pass_type = "text",
					text_id = "journey_name_label",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			title = "deus_map_title",
			journey_name_label = "journey_cave_name",
			frame = frame_settings.texture
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
					0
				}
			},
			rect = {
				color = UISettings.console_menu_rect_color,
				offset = {
					0,
					0,
					0
				}
			},
			title = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				localize = true,
				font_size = 32,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					-4,
					0
				}
			},
			journey_name_label = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				localize = true,
				font_size = 32,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-34,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_player_texts_widget(scenegraph_id)
	local name_text = {
		vertical_alignment = "center",
		horizontal_alignment = "left",
		dynamic_font_size = true,
		font_size = 24,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			0,
			0,
			0
		},
		size = {
			180,
			24
		}
	}
	local name_text_shadow = table.clone(name_text)
	name_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	name_text_shadow.offset = {
		name_text.offset[1] + 2,
		name_text.offset[2] - 2,
		name_text.offset[3] - 1
	}
	local vote_text = {
		font_size = 16,
		horizontal_alignment = "left",
		localize = true,
		vertical_alignment = "center",
		dynamic_font_size = true,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			0,
			-20,
			0
		},
		size = {
			100,
			20
		}
	}
	local vote_text_shadow = table.clone(vote_text)
	vote_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	vote_text_shadow.offset = {
		vote_text.offset[1] + 2,
		vote_text.offset[2] - 2,
		vote_text.offset[3] - 1
	}
	local coins_icon = {
		offset = {
			0,
			-45,
			0
		},
		texture_size = {
			20,
			20
		}
	}
	local coins_text = {
		vertical_alignment = "center",
		horizontal_alignment = "left",
		dynamic_font_size = true,
		font_size = 26,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			coins_icon.offset[1] + coins_icon.texture_size[1] + 5,
			coins_icon.offset[2] - 1,
			coins_icon.offset[3]
		},
		size = {
			100,
			20
		}
	}
	local coins_text_shadow = table.clone(coins_text)
	coins_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	coins_text_shadow.offset = {
		coins_text.offset[1] + 2,
		coins_text.offset[2] - 2,
		coins_text.offset[3] - 1
	}

	return {
		element = {
			passes = {
				{
					style_id = "name_text",
					pass_type = "text",
					text_id = "name_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					style_id = "name_text_shadow",
					pass_type = "text",
					text_id = "name_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					style_id = "vote_text",
					pass_type = "text",
					text_id = "vote_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					style_id = "vote_text_shadow",
					pass_type = "text",
					text_id = "vote_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					style_id = "coins_text",
					pass_type = "text",
					text_id = "coins_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					style_id = "coins_text_shadow",
					pass_type = "text",
					text_id = "coins_text",
					content_check_function = function (content)
						return content.visible
					end
				},
				{
					pass_type = "texture",
					style_id = "coins_icon",
					texture_id = "coins_icon",
					content_check_function = function (content)
						return content.visible
					end
				}
			}
		},
		content = {
			state_text = "",
			visible = true,
			name_text = "",
			coins_icon = "deus_icons_coin",
			coins_text = "0"
		},
		style = {
			name_text = name_text,
			name_text_shadow = name_text_shadow,
			vote_text = vote_text,
			vote_text_shadow = vote_text_shadow,
			coins_text = coins_text,
			coins_text_shadow = coins_text_shadow,
			coins_icon = coins_icon
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_player_state_background_widget(scenegraph_id)
	local frame_settings = UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local size = scenegraph_definition[scenegraph_id].size
	local frame_size = {
		size[1] + edge_height * 2,
		size[2] + edge_height * 2
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					pass_type = "rect",
					style_id = "player_state_background"
				}
			}
		},
		content = {
			frame = frame_settings.texture
		},
		style = {
			frame = {
				color = UISettings.console_menu_rect_color,
				size = frame_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					-edge_height,
					-edge_height,
					0
				}
			},
			player_state_background = {
				color = {
					100,
					0,
					0,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_node_info_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "node_info",
					pass_type = "auto_layout",
					content_id = "node_info",
					sub_passes = {
						{
							style_id = "title",
							pass_type = "text",
							text_id = "title"
						},
						{
							style_id = "click_to_vote",
							pass_type = "text",
							text_id = "click_to_vote",
							content_check_function = function (content)
								return content.click_to_vote ~= ""
							end
						},
						{
							pass_type = "texture",
							style_id = "pre_description_divider",
							texture_id = "pre_description_divider"
						},
						{
							style_id = "description",
							pass_type = "text",
							text_id = "description"
						},
						{
							pass_type = "texture",
							style_id = "post_description_divider",
							texture_id = "post_description_divider"
						},
						{
							style_id = "curse_section",
							pass_type = "auto_layout",
							content_check_function = function (content)
								return content.curse_text ~= ""
							end,
							sub_passes = {
								{
									texture_id = "curse_icon",
									style_id = "curse_icon",
									pass_type = "texture"
								},
								{
									style_id = "curse_text",
									pass_type = "text",
									text_id = "curse_text"
								}
							}
						},
						{
							style_id = "breed_section",
							pass_type = "auto_layout",
							content_check_function = function (content)
								return content.breed_text ~= ""
							end,
							sub_passes = {
								{
									texture_id = "breed_icon",
									style_id = "breed_icon",
									pass_type = "texture"
								},
								{
									style_id = "breed_text",
									pass_type = "text",
									text_id = "breed_text"
								}
							}
						},
						{
							style_id = "minor_modifier_section",
							pass_type = "auto_layout",
							content_id = "minor_modifier_1_section",
							content_check_function = function (content)
								return content.text ~= ""
							end,
							sub_passes = {
								{
									texture_id = "icon",
									style_id = "icon",
									pass_type = "texture"
								},
								{
									style_id = "text",
									pass_type = "text",
									text_id = "text"
								}
							}
						},
						{
							style_id = "minor_modifier_section",
							pass_type = "auto_layout",
							content_id = "minor_modifier_2_section",
							content_check_function = function (content)
								return content.text ~= ""
							end,
							sub_passes = {
								{
									texture_id = "icon",
									style_id = "icon",
									pass_type = "texture"
								},
								{
									style_id = "text",
									pass_type = "text",
									text_id = "text"
								}
							}
						},
						{
							style_id = "minor_modifier_section",
							pass_type = "auto_layout",
							content_id = "minor_modifier_3_section",
							content_check_function = function (content)
								return content.text ~= ""
							end,
							sub_passes = {
								{
									texture_id = "icon",
									style_id = "icon",
									pass_type = "texture"
								},
								{
									style_id = "text",
									pass_type = "text",
									text_id = "text"
								}
							}
						},
						{
							style_id = "terror_event_power_up_section",
							pass_type = "auto_layout",
							content_check_function = function (content)
								return content.terror_event_power_up_text ~= ""
							end,
							sub_passes = {
								{
									texture_id = "terror_event_power_up_icon",
									style_id = "terror_event_power_up_icon",
									pass_type = "texture"
								},
								{
									style_id = "terror_event_power_up_text",
									pass_type = "text",
									text_id = "terror_event_power_up_text"
								}
							}
						}
					},
					background_passes = {
						{
							style_id = "frame",
							pass_type = "texture_frame",
							texture_id = "frame",
							content_change_function = function (content, style)
								content.frame = UIFrameSettings[content.frame_settings_name].texture
								style.texture_size = UIFrameSettings[content.frame_settings_name].texture_size
								style.texture_sizes = UIFrameSettings[content.frame_settings_name].texture_sizes
							end
						},
						{
							pass_type = "rect",
							style_id = "bg"
						}
					}
				}
			}
		},
		content = {
			node_info = {
				description = "description",
				terror_event_power_up_text = "terror_event_power_up_text",
				curse_icon = "deus_icons_map_khorne",
				frame_settings_name = "menu_frame_12",
				title = "title",
				breed_text = "breed_text",
				breed_icon = "mutator_icon_elite_run",
				terror_event_power_up_icon = "mutator_icon_elite_run",
				curse_text = "curse_text",
				pre_description_divider = "weave_forge_slot_divider_tooltip",
				post_description_divider = "weave_forge_slot_divider_tooltip",
				click_to_vote = "click_to_vote",
				minor_modifier_1_section = {
					text = "minor_modifier_text",
					icon = "trinket_increase_grenade_radius"
				},
				minor_modifier_2_section = {
					text = "minor_modifier_text",
					icon = "trinket_increase_grenade_radius"
				},
				minor_modifier_3_section = {
					text = "minor_modifier_text",
					icon = "trinket_increase_grenade_radius"
				}
			}
		},
		style = {
			node_info = {
				layout_delta_x = 0,
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				layout_delta_y = -1,
				offset = {
					-50,
					50,
					0
				},
				screen_padding = {
					top = 50,
					left = 50,
					right = 50
				},
				title = {
					font_size = 28,
					horizontal_alignment = "center",
					localize = false,
					word_wrap = true,
					vertical_alignment = "bottom",
					dynamic_size = true,
					font_type = "hell_shark_header",
					text_color = Colors.get_color_table_with_alpha("font_title", 255),
					offset = {
						0,
						0,
						0
					},
					size = {
						300,
						0
					}
				},
				click_to_vote = {
					font_size = 18,
					horizontal_alignment = "center",
					localize = true,
					word_wrap = true,
					vertical_alignment = "bottom",
					dynamic_size = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("font_default", 255),
					offset = {
						0,
						0,
						0
					},
					size = {
						300,
						0
					}
				},
				pre_description_divider = {
					layout_bottom_padding = 4,
					layout_top_padding = 4,
					horizontal_alignment = "center",
					height_margin = 5,
					vertical_alignment = "bottom",
					texture_size = {
						200,
						3
					},
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
					size = {
						300,
						3
					}
				},
				description = {
					font_size = 18,
					horizontal_alignment = "center",
					localize = false,
					word_wrap = true,
					vertical_alignment = "center",
					dynamic_size = true,
					font_type = "hell_shark",
					text_color = {
						255,
						120,
						120,
						120
					},
					offset = {
						0,
						0,
						0
					},
					size = {
						300,
						0
					}
				},
				post_description_divider = {
					layout_bottom_padding = 4,
					layout_top_padding = 4,
					horizontal_alignment = "center",
					height_margin = 5,
					vertical_alignment = "center",
					texture_size = {
						200,
						3
					},
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
					size = {
						300,
						3
					}
				},
				curse_section = {
					dynamic_size = true,
					layout_delta_y = 0,
					layout_delta_x = 1,
					curse_icon = {
						layout_left_padding = 4,
						layout_right_padding = 4,
						horizontal_alignment = "left",
						height_margin = 0,
						vertical_alignment = "center",
						texture_size = {
							30,
							30
						},
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
						size = {
							30,
							30
						}
					},
					curse_text = {
						word_wrap = false,
						horizontal_alignment = "left",
						localize = false,
						font_size = 20,
						vertical_alignment = "center",
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0
						},
						size = {
							250,
							30
						}
					}
				},
				minor_modifier_section = {
					layout_delta_y = 0,
					dynamic_size = true,
					layout_delta_x = 1,
					icon = {
						layout_left_padding = 4,
						layout_right_padding = 4,
						horizontal_alignment = "left",
						height_margin = 0,
						vertical_alignment = "center",
						texture_size = {
							30,
							30
						},
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
						size = {
							30,
							30
						}
					},
					text = {
						word_wrap = false,
						horizontal_alignment = "left",
						localize = false,
						font_size = 20,
						vertical_alignment = "center",
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0
						},
						size = {
							250,
							30
						}
					}
				},
				breed_section = {
					dynamic_size = true,
					layout_delta_y = 0,
					layout_delta_x = 1,
					breed_icon = {
						layout_left_padding = 4,
						layout_right_padding = 4,
						horizontal_alignment = "left",
						height_margin = 0,
						vertical_alignment = "center",
						texture_size = {
							30,
							30
						},
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
						size = {
							30,
							30
						}
					},
					breed_text = {
						word_wrap = false,
						horizontal_alignment = "left",
						localize = false,
						font_size = 20,
						vertical_alignment = "center",
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0
						},
						size = {
							250,
							30
						}
					}
				},
				terror_event_power_up_section = {
					layout_delta_y = 0,
					dynamic_size = true,
					layout_delta_x = 1,
					terror_event_power_up_icon = {
						layout_left_padding = 4,
						layout_right_padding = 4,
						horizontal_alignment = "left",
						height_margin = 0,
						vertical_alignment = "center",
						texture_size = {
							30,
							30
						},
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
						size = {
							30,
							30
						}
					},
					terror_event_power_up_text = {
						word_wrap = false,
						horizontal_alignment = "left",
						localize = false,
						font_size = 20,
						vertical_alignment = "center",
						font_type = "hell_shark",
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							0
						},
						size = {
							250,
							30
						}
					}
				},
				bg = {
					layout_left_padding = 10,
					layout_top_padding = 10,
					layout_right_padding = 10,
					layout_bottom_padding = 10,
					color = {
						255,
						3,
						3,
						3
					},
					offset = {
						0,
						0,
						-5
					}
				},
				frame = {
					layout_left_padding = 10,
					layout_top_padding = 10,
					layout_right_padding = 10,
					layout_bottom_padding = 10,
					offset = {
						0,
						0,
						-3
					}
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local widget_definitions = {
	console_cursor = UIWidgets.create_console_cursor("console_cursor"),
	top_info = create_top_info_widget("top_info"),
	general_info = create_general_info_widget("general_info"),
	node_info = create_node_info_widget("node_info"),
	player_state_background_widget = create_player_state_background_widget("player_state"),
	player_1_portrait = UIWidgets.create_deus_player_status_portrait("player_1_portrait", "default", "-", RETAINED_MODE_ENABLED),
	player_1_texts = create_player_texts_widget("player_1_texts"),
	player_2_portrait = UIWidgets.create_deus_player_status_portrait("player_2_portrait", "default", "-", RETAINED_MODE_ENABLED),
	player_2_texts = create_player_texts_widget("player_2_texts"),
	player_3_portrait = UIWidgets.create_deus_player_status_portrait("player_3_portrait", "default", "-", RETAINED_MODE_ENABLED),
	player_3_texts = create_player_texts_widget("player_3_texts"),
	player_4_portrait = UIWidgets.create_deus_player_status_portrait("player_4_portrait", "default", "-", RETAINED_MODE_ENABLED),
	player_4_texts = create_player_texts_widget("player_4_texts")
}

return {
	widget_definitions = widget_definitions,
	scenegraph_definition = scenegraph_definition,
	retained_mode = RETAINED_MODE_ENABLED
}
