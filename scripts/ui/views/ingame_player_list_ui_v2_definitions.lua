local PLAYER_LIST_SIZE = {
	620,
	160
}
local POPUP_ELEMENT_SIZE = {
	500,
	36
}
local MUTATOR_SUMMARY_SIZE = {
	450,
	0
}
local BANNER_LEFT_SIZE = {
	660,
	1080
}
local BANNER_RIGHT_SIZE = {
	660,
	1080
}
local INPUT_DESCRIPTION_POSITION_X = (BANNER_LEFT_SIZE[1] - BANNER_RIGHT_SIZE[1]) / 2
local banner_color = {
	200,
	10,
	10,
	10
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.ingame_player_list
		},
		size = {
			1920,
			1080
		}
	},
	console_cursor = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			-10
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
			UILayer.ingame_player_list
		},
		size = {
			100,
			100
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			1920,
			1080
		}
	},
	banner_left = {
		scale = "fit_height",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = BANNER_LEFT_SIZE
	},
	banner_left_edge = {
		scale = "fit_height",
		horizontal_alignment = "left",
		position = {
			BANNER_LEFT_SIZE[1],
			0,
			1
		},
		size = {
			5,
			BANNER_LEFT_SIZE[2]
		}
	},
	banner_right = {
		scale = "fit_height",
		horizontal_alignment = "right",
		position = {
			0,
			0,
			1
		},
		size = BANNER_RIGHT_SIZE
	},
	banner_right_edge = {
		scale = "fit_height",
		horizontal_alignment = "right",
		position = {
			-BANNER_LEFT_SIZE[1],
			0,
			1
		},
		size = {
			5,
			BANNER_LEFT_SIZE[2]
		}
	},
	player_list_input_description = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			INPUT_DESCRIPTION_POSITION_X,
			50,
			-1
		},
		size = {
			564,
			30
		}
	},
	node_info = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "left",
		position = {
			20,
			-525,
			1
		},
		offset = {
			0,
			0,
			0
		}
	},
	reward_item = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "left",
		position = {
			122,
			-750,
			1
		},
		offset = {
			0,
			0,
			0
		}
	},
	reward_divider = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "left",
		position = {
			20,
			-700,
			1
		},
		size = {
			264,
			32
		},
		offset = {
			0,
			0,
			0
		}
	},
	loot_objective = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "left",
		position = {
			20,
			-990,
			1
		},
		size = {
			200,
			90
		}
	},
	player_portrait = {
		vertical_alignment = "top",
		parent = "banner_left",
		horizontal_alignment = "left",
		position = {
			100,
			-100,
			10
		},
		size = {
			0,
			0
		}
	},
	player_career_name = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		position = {
			80,
			-11,
			1
		},
		size = {
			400,
			0
		}
	},
	player_name_divider = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		position = {
			80,
			-5,
			1
		},
		size = {
			450,
			4
		}
	},
	mechanism_type_name = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "left",
		position = {
			20,
			-140,
			1
		}
	},
	mission_type_name = {
		vertical_alignment = "top",
		parent = "mechanism_type_name",
		horizontal_alignment = "left",
		position = {
			0,
			-30,
			1
		}
	},
	mission_details_divider = {
		vertical_alignment = "top",
		parent = "mission_type_name",
		horizontal_alignment = "left",
		position = {
			0,
			-30,
			1
		},
		size = {
			450,
			4
		}
	},
	level_description = {
		vertical_alignment = "top",
		parent = "mission_details_divider",
		horizontal_alignment = "left",
		position = {
			0,
			-30,
			1
		},
		size = {
			540,
			400
		}
	},
	collectibles_name = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "left",
		position = {
			20,
			-850,
			1
		}
	},
	collectibles_divider = {
		vertical_alignment = "top",
		parent = "collectibles_name",
		horizontal_alignment = "left",
		position = {
			0,
			-35,
			1
		},
		size = {
			450,
			4
		}
	},
	player_hero_name = {
		vertical_alignment = "center",
		parent = "player_portrait",
		horizontal_alignment = "left",
		position = {
			80,
			-7,
			1
		},
		size = {
			500,
			0
		}
	},
	player_passive_icon = {
		vertical_alignment = "top",
		parent = "banner_left",
		horizontal_alignment = "left",
		position = {
			350,
			-190,
			1
		},
		size = {
			50,
			50
		}
	},
	player_passive_name = {
		vertical_alignment = "top",
		parent = "player_passive_icon",
		horizontal_alignment = "left",
		position = {
			60,
			0,
			1
		},
		size = {
			500,
			30
		}
	},
	player_passive_title = {
		vertical_alignment = "top",
		parent = "player_passive_name",
		horizontal_alignment = "left",
		position = {
			0,
			-30,
			1
		},
		size = {
			500,
			30
		}
	},
	player_passive_description = {
		vertical_alignment = "top",
		parent = "player_passive_icon",
		horizontal_alignment = "left",
		position = {
			0,
			-60,
			1
		},
		size = {
			300,
			100
		}
	},
	player_ability_icon = {
		vertical_alignment = "top",
		parent = "banner_left",
		horizontal_alignment = "left",
		position = {
			20,
			-190,
			1
		},
		size = {
			50,
			50
		}
	},
	player_ability_name = {
		vertical_alignment = "top",
		parent = "player_ability_icon",
		horizontal_alignment = "left",
		position = {
			60,
			0,
			1
		},
		size = {
			500,
			30
		}
	},
	player_ability_title = {
		vertical_alignment = "top",
		parent = "player_ability_name",
		horizontal_alignment = "left",
		position = {
			0,
			-30,
			1
		},
		size = {
			500,
			30
		}
	},
	player_ability_description = {
		vertical_alignment = "top",
		parent = "player_ability_icon",
		horizontal_alignment = "left",
		position = {
			0,
			-60,
			1
		},
		size = {
			300,
			100
		}
	},
	game_level = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "right",
		position = {
			-25,
			-20,
			5
		},
		size = {
			500,
			30
		}
	},
	game_difficulty = {
		vertical_alignment = "top",
		parent = "game_level",
		horizontal_alignment = "right",
		position = {
			0,
			-30,
			5
		},
		size = {
			500,
			30
		}
	},
	mutator_summary1 = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "left",
		position = {
			20,
			-200,
			1
		},
		size = MUTATOR_SUMMARY_SIZE
	},
	mutator_summary2 = {
		vertical_alignment = "top",
		parent = "mutator_summary1",
		horizontal_alignment = "left",
		position = {
			0,
			-100,
			1
		},
		size = MUTATOR_SUMMARY_SIZE
	},
	mutator_summary3 = {
		vertical_alignment = "top",
		parent = "mutator_summary2",
		horizontal_alignment = "left",
		position = {
			0,
			-100,
			1
		},
		size = MUTATOR_SUMMARY_SIZE
	},
	weave_objective_header = {
		vertical_alignment = "top",
		parent = "mutator_summary1",
		horizontal_alignment = "left",
		position = {
			0,
			-200,
			1
		},
		size = MUTATOR_SUMMARY_SIZE
	},
	weave_objective_divider = {
		vertical_alignment = "top",
		parent = "weave_objective_header",
		horizontal_alignment = "left",
		position = {
			0,
			-35,
			1
		},
		size = {
			450,
			4
		}
	},
	weave_main_objective = {
		vertical_alignment = "top",
		parent = "weave_objective_divider",
		horizontal_alignment = "left",
		position = {
			0,
			-20,
			1
		},
		size = {
			450,
			300
		}
	},
	weave_sub_objective = {
		vertical_alignment = "top",
		parent = "weave_main_objective",
		horizontal_alignment = "left",
		position = {
			0,
			-50,
			1
		},
		size = {
			450,
			300
		}
	},
	player_list = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		position = {
			0,
			-370,
			1
		},
		offset = {
			20,
			0,
			0
		},
		size = {
			PLAYER_LIST_SIZE[1],
			PLAYER_LIST_SIZE[2]
		}
	},
	player_list_portrait = {
		vertical_alignment = "center",
		parent = "player_list",
		horizontal_alignment = "left",
		position = {
			80,
			-7,
			1
		},
		size = {
			0,
			0
		}
	},
	popup = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			0,
			-200,
			10
		},
		size = {
			POPUP_ELEMENT_SIZE[1],
			POPUP_ELEMENT_SIZE[2]
		}
	},
	private_checkbox = {
		vertical_alignment = "top",
		parent = "game_difficulty",
		horizontal_alignment = "right",
		size = {
			250,
			40
		},
		position = {
			0,
			-35,
			1
		}
	},
	item_tooltip = {
		vertical_alignment = "bottom",
		parent = "player_list",
		horizontal_alignment = "right",
		position = {
			450,
			0,
			1
		},
		offset = {
			0,
			-5,
			0
		},
		size = {
			400,
			0
		}
	},
	reward_item_tooltip = {
		vertical_alignment = "top",
		parent = "banner_right",
		horizontal_alignment = "right",
		position = {
			0,
			-780,
			1
		},
		offset = {
			-80,
			0,
			0
		},
		size = {
			400,
			0
		}
	},
	talent_tooltip = {
		vertical_alignment = "bottom",
		parent = "player_list",
		horizontal_alignment = "right",
		position = {
			450,
			0,
			1
		},
		offset = {
			0,
			-5,
			0
		},
		size = {
			400,
			0
		}
	}
}

local function create_vertical_edge_divider(scenegraph_id, size)
	local scenegraph_definition = scenegraph_definition[scenegraph_id]
	local horizontal_alignment = scenegraph_definition.horizontal_alignment == "right" and "left" or "right"
	local offset_multiplier = horizontal_alignment == "left" and -1 or 1
	local widget = {
		element = {
			passes = {
				{
					texture_id = "edge",
					style_id = "edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_top",
					style_id = "edge_holder_top",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_bottom",
					style_id = "edge_holder_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_top = "menu_frame_09_divider_top",
			edge_holder_bottom = "menu_frame_09_divider_bottom"
		},
		style = {
			edge = {
				texture_size = {
					size[1],
					size[2]
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5 * offset_multiplier,
					0,
					6
				},
				texture_tiling_size = {
					5,
					size[2]
				},
				horizontal_alignment = horizontal_alignment
			},
			edge_holder_top = {
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					11 * offset_multiplier,
					0,
					10
				},
				texture_size = {
					17,
					9
				},
				horizontal_alignment = horizontal_alignment
			},
			edge_holder_bottom = {
				vertical_alignment = "bottom",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					11 * offset_multiplier,
					0,
					10
				},
				texture_size = {
					17,
					9
				},
				horizontal_alignment = horizontal_alignment
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end

local function create_loot_widget(texture, text, scale)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local texture_size = texture_settings.size
	scale = scale or 1

	return {
		scenegraph_id = "loot_objective",
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "counter_text",
					pass_type = "text",
					text_id = "counter_text",
					content_check_function = function (content)
						return content.amount > 0
					end
				},
				{
					style_id = "counter_text_disabled",
					pass_type = "text",
					text_id = "counter_text",
					content_check_function = function (content)
						return content.amount == 0
					end
				},
				{
					style_id = "counter_text_shadow",
					pass_type = "text",
					text_id = "counter_text"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.amount > 0
					end
				},
				{
					pass_type = "texture",
					style_id = "background_icon",
					texture_id = "icon"
				},
				{
					pass_type = "texture",
					style_id = "glow_icon",
					texture_id = "glow_icon"
				}
			}
		},
		content = {
			counter_text = "x9",
			amount = 0,
			text = text or "n/a",
			icon = texture,
			glow_icon = texture .. "_glow"
		},
		style = {
			text = {
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				font_size = 32,
				horizontal_alignment = "left",
				text_color = Colors.get_table("font_title"),
				offset = {
					scale * texture_size[1],
					scale * texture_size[2] - 50,
					1
				}
			},
			text_shadow = {
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				font_size = 32,
				horizontal_alignment = "left",
				text_color = Colors.get_table("black"),
				offset = {
					scale * texture_size[1] + 1,
					scale * texture_size[2] - 50 - 1,
					0
				}
			},
			counter_text = {
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				font_size = 32,
				horizontal_alignment = "left",
				text_color = Colors.get_table("font_default"),
				offset = {
					scale * texture_size[1],
					-40,
					1
				}
			},
			counter_text_disabled = {
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				font_size = 32,
				horizontal_alignment = "left",
				text_color = {
					255,
					130,
					130,
					130
				},
				offset = {
					scale * texture_size[1],
					-40,
					1
				}
			},
			counter_text_shadow = {
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				font_size = 32,
				horizontal_alignment = "left",
				text_color = Colors.get_table("black"),
				offset = {
					scale * texture_size[1] + 1,
					-41,
					0
				}
			},
			icon = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				},
				texture_size = {
					scale * texture_size[1],
					scale * texture_size[2]
				}
			},
			background_icon = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				},
				texture_size = {
					scale * texture_size[1],
					scale * texture_size[2]
				}
			},
			glow_icon = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				},
				texture_size = {
					scale * texture_size[1],
					scale * texture_size[2]
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

local function create_node_info_widget()
	return {
		scenegraph_id = "node_info",
		element = {
			passes = {
				{
					texture_id = "divider_id",
					style_id = "divider",
					pass_type = "texture"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_id"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text_id"
				},
				{
					style_id = "node_info",
					pass_type = "auto_layout",
					content_id = "node_info",
					sub_passes = {
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
					}
				}
			}
		},
		content = {
			divider_id = "infoslate_frame_02_horizontal",
			text_id = Utf8.upper(Localize("hero_view_prestige_information")),
			node_info = {
				terror_event_power_up_text = "terror_event_power_up_text",
				curse_icon = "deus_icons_map_khorne",
				curse_text = "curse_text",
				breed_text = "breed_text",
				terror_event_power_up_icon = "mutator_icon_elite_run",
				breed_icon = "mutator_icon_elite_run",
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
			divider = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					450,
					4
				},
				offset = {
					0,
					-30,
					0
				}
			},
			text = {
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				font_size = 26,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					1
				}
			},
			text_shadow = {
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				font_size = 26,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					0
				}
			},
			node_info = {
				layout_delta_x = 0,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				layout_delta_y = -1,
				offset = {
					10,
					-50,
					0
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
							40,
							40
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
							40,
							40
						}
					},
					curse_text = {
						font_size = 20,
						word_wrap = false,
						localize = false,
						dynamic_width = true,
						horizontal_alignment = "left",
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
							40,
							40
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
							40,
							40
						}
					},
					text = {
						font_size = 20,
						word_wrap = false,
						localize = false,
						dynamic_width = true,
						horizontal_alignment = "left",
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
							40,
							40
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
							40,
							40
						}
					},
					breed_text = {
						font_size = 20,
						word_wrap = false,
						localize = false,
						dynamic_width = true,
						horizontal_alignment = "left",
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
							40,
							40
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
							40,
							40
						}
					},
					terror_event_power_up_text = {
						font_size = 20,
						word_wrap = false,
						localize = false,
						dynamic_width = true,
						horizontal_alignment = "left",
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
				}
			}
		}
	}
end

local function create_weave_sub_objective_widget(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					texture_id = "background",
					style_id = "background",
					pass_type = "texture"
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = "-",
			title_text = "title_text",
			background = "chest_upgrade_fill_glow",
			icon = "trial_gem"
		},
		style = {
			background = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			icon = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					49,
					44
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				default_offset = {
					-25,
					-2,
					1
				},
				offset = {
					0,
					0,
					1
				}
			},
			title_text = {
				word_wrap = true,
				localize = true,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				size = {
					size[1] - 50,
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					2
				}
			},
			title_text_shadow = {
				word_wrap = true,
				localize = true,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				size = {
					size[1] - 50,
					size[2]
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					1
				}
			},
			text = {
				word_wrap = true,
				font_size = 26,
				localize = true,
				dynamic_font_size_word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-30,
					2
				}
			},
			text_shadow = {
				word_wrap = true,
				font_size = 26,
				localize = true,
				dynamic_font_size_word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-32,
					1
				}
			}
		},
		offset = {
			50,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_description_text(text, scenegraph_id)
	local definition = {
		element = {
			passes = {
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text",
					content_check_function = function (content)
						return content.text ~= ""
					end
				},
				{
					style_id = "level_description_text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "level_description_text_shadow",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = text,
			description_text = Localize("lb_mission")
		},
		style = {
			description_text = {
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				font_size = 28,
				horizontal_alignment = "left",
				text_color = Colors.get_table("font_title"),
				offset = {
					0,
					0,
					1
				}
			},
			level_description_text = {
				font_size = 24,
				word_wrap = true,
				font_type = "hell_shark",
				dynamic_font_size_word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					620,
					220
				},
				text_color = Colors.get_table("white"),
				offset = {
					0,
					-30,
					1
				}
			},
			level_description_text_shadow = {
				font_size = 24,
				word_wrap = true,
				font_type = "hell_shark",
				dynamic_font_size_word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					620,
					220
				},
				text_color = Colors.get_table("black"),
				offset = {
					2,
					-32,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return definition
end

local function create_reward_item(offset_x, item)
	local definition = {
		scenegraph_id = "reward_item",
		element = {
			passes = {
				{
					style_id = "icon",
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					texture_id = "icon_id",
					style_id = "icon",
					pass_type = "texture"
				},
				{
					texture_id = "frame_id",
					style_id = "icon",
					pass_type = "texture"
				},
				{
					scenegraph_id = "reward_item_tooltip",
					item_id = "item",
					pass_type = "item_tooltip",
					content_check_function = function (content)
						return content.hotspot.is_hover and content.item
					end
				}
			}
		},
		content = {
			frame_id = "item_frame",
			hotspot = {},
			icon_id = item.data.inventory_icon,
			item = item
		},
		style = {
			icon = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					60,
					60
				},
				area_size = {
					60,
					60
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		offset = {
			offset_x,
			0,
			0
		}
	}

	return definition
end

local function player_widget_definition(index)
	local scenegraph_id = "player_list"
	local size = scenegraph_definition[scenegraph_id].size
	local frame_settings = UIFrameSettings.menu_frame_09
	local background_texture = "talent_tree_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local definition = {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "host_texture",
					texture_id = "host_texture",
					content_check_function = function (content)
						return content.show_host
					end
				},
				{
					pass_type = "texture",
					style_id = "ping_texture",
					texture_id = "ping_texture",
					content_check_function = function (content)
						return content.show_ping
					end
				},
				{
					style_id = "ping_text",
					pass_type = "text",
					text_id = "ping_text",
					content_check_function = function (content, style)
						return content.show_ping and Application.user_setting("show_numerical_latency")
					end
				},
				{
					style_id = "build_private_text",
					pass_type = "text",
					text_id = "build_private_text",
					content_check_function = function (content, style)
						return not content.is_build_visible
					end
				},
				{
					pass_type = "rect",
					style_id = "chat_button_background",
					texture_id = "chat_button_texture"
				},
				{
					texture_id = "button_frame",
					style_id = "chat_button_frame",
					pass_type = "texture"
				},
				{
					style_id = "chat_button_hotspot",
					texture_id = "chat_button_texture",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_chat_button and 255 or 60
					end
				},
				{
					pass_type = "texture",
					style_id = "chat_button_disabled",
					texture_id = "disabled_texture",
					content_check_function = function (content)
						return content.show_chat_button and content.chat_button_hotspot.is_selected
					end
				},
				{
					style_id = "chat_button_hotspot",
					pass_type = "hotspot",
					content_id = "chat_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "chat_tooltip_text_mute",
					content_check_function = function (content)
						return content.show_chat_button and not content.chat_button_hotspot.is_selected and content.chat_button_hotspot.is_hover
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "chat_tooltip_text_unmute",
					content_check_function = function (content)
						return content.show_chat_button and content.chat_button_hotspot.is_selected and content.chat_button_hotspot.is_hover
					end
				},
				{
					pass_type = "rect",
					style_id = "voice_button_background",
					texture_id = "voice_button_texture"
				},
				{
					texture_id = "button_frame",
					style_id = "voice_chat_button_frame",
					pass_type = "texture"
				},
				{
					style_id = "voice_button_hotspot",
					texture_id = "voice_button_texture",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_voice_button and 255 or 60
					end
				},
				{
					pass_type = "texture",
					style_id = "voice_button_disabled",
					texture_id = "disabled_texture",
					content_check_function = function (content)
						return content.show_voice_button and content.voice_button_hotspot.is_selected
					end
				},
				{
					style_id = "voice_button_hotspot",
					pass_type = "hotspot",
					content_id = "voice_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "voice_tooltip_text_mute",
					content_check_function = function (content)
						return content.show_voice_button and not content.voice_button_hotspot.is_selected and content.voice_button_hotspot.is_hover
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "voice_tooltip_text_unmute",
					content_check_function = function (content)
						return content.show_voice_button and content.voice_button_hotspot.is_selected and content.voice_button_hotspot.is_hover
					end
				},
				{
					pass_type = "rect",
					style_id = "kick_button_background",
					texture_id = "kick_button_texture"
				},
				{
					texture_id = "button_frame",
					style_id = "kick_button_frame",
					pass_type = "texture"
				},
				{
					style_id = "kick_button_hotspot",
					texture_id = "kick_button_texture",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_kick_button and 255 or 60
					end
				},
				{
					style_id = "kick_button_hotspot",
					pass_type = "hotspot",
					content_id = "kick_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "kick_tooltip_text",
					content_check_function = function (content)
						return content.show_kick_button and content.kick_button_hotspot.is_hover
					end
				},
				{
					pass_type = "rect",
					style_id = "profile_button_background",
					texture_id = "profile_button_texture"
				},
				{
					texture_id = "button_frame",
					style_id = "profile_button_frame",
					pass_type = "texture"
				},
				{
					style_id = "profile_button_hotspot",
					texture_id = "profile_button_texture",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_profile_button and 255 or 60
					end
				},
				{
					style_id = "profile_button_hotspot",
					pass_type = "hotspot",
					content_id = "profile_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "profile_tooltip_text",
					content_check_function = function (content)
						return content.show_profile_button and content.profile_button_hotspot.is_hover
					end
				},
				{
					style_id = "name",
					pass_type = "text",
					text_id = "name",
					content_check_function = function (content, style)
						if content.button_hotspot.is_selected or content.controller_button_hotspot.is_hover then
							style.text_color = style.hover_color
						else
							style.text_color = style.color
						end

						return true
					end
				},
				{
					style_id = "name_shadow",
					pass_type = "text",
					text_id = "name"
				},
				{
					style_id = "hero",
					pass_type = "text",
					text_id = "hero",
					content_check_function = function (content, style)
						if content.button_hotspot.is_selected or content.controller_button_hotspot.is_hover then
							style.text_color = style.hover_color
						else
							style.text_color = style.color
						end

						return true
					end
				},
				{
					style_id = "hero_shadow",
					pass_type = "text",
					text_id = "hero"
				},
				{
					pass_type = "rect",
					style_id = "hp_bar_bg"
				},
				{
					style_id = "hp_bar_fg_start",
					pass_type = "texture_uv",
					content_id = "hp_bar_fg_start"
				},
				{
					style_id = "hp_bar_fg_middle",
					pass_type = "texture_uv",
					content_id = "hp_bar_fg_middle"
				},
				{
					style_id = "hp_bar_fg_end",
					pass_type = "texture_uv",
					content_id = "hp_bar_fg_end"
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "health_bar",
					texture_id = "texture_id",
					content_id = "health_bar"
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "total_health_bar",
					texture_id = "texture_id",
					content_id = "total_health_bar"
				},
				{
					style_id = "ability_bar",
					pass_type = "texture_uv",
					content_id = "ability_bar",
					content_change_function = function (content, style)
						local ability_progress = content.bar_value
						local size = style.texture_size
						local uvs = content.uvs
						local bar_length = style.full_size[1]
						uvs[2][2] = ability_progress
						size[1] = bar_length * ability_progress
					end
				},
				{
					style_id = "grimoire_bar",
					pass_type = "texture_uv",
					content_id = "grimoire_bar",
					content_change_function = function (content, style)
						style.texture_size[1] = 200 * style.grimoire_debuff
						content.uvs[1][1] = 1 - style.grimoire_debuff
					end
				},
				{
					style_id = "grimoire_debuff_divider",
					texture_id = "grimoire_debuff_divider",
					pass_type = "texture",
					content_change_function = function (content, style)
						local grimoire_debuff = style.grimoire_debuff
						local offset = style.offset
						offset[1] = style.base_offset[1] - 200 * grimoire_debuff
					end
				},
				{
					texture_id = "slot_melee",
					style_id = "slot_melee",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_melee
					end
				},
				{
					style_id = "slot_melee",
					pass_type = "hotspot",
					content_id = "slot_melee_hotspot",
					content_check_function = function (content)
						return content.parent.slot_melee
					end
				},
				{
					texture_id = "slot_melee_frame",
					style_id = "slot_melee_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_melee
					end
				},
				{
					texture_id = "slot_melee_rarity_texture",
					style_id = "slot_melee_rarity_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_melee
					end
				},
				{
					texture_id = "slot_ranged",
					style_id = "slot_ranged",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_ranged
					end
				},
				{
					style_id = "slot_ranged",
					pass_type = "hotspot",
					content_id = "slot_ranged_hotspot",
					content_check_function = function (content)
						return content.parent.slot_ranged
					end
				},
				{
					texture_id = "slot_ranged_frame",
					style_id = "slot_ranged_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_ranged
					end
				},
				{
					texture_id = "slot_ranged_rarity_texture",
					style_id = "slot_ranged_rarity_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_ranged
					end
				},
				{
					texture_id = "slot_necklace",
					style_id = "slot_necklace",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_necklace
					end
				},
				{
					style_id = "slot_necklace",
					pass_type = "hotspot",
					content_id = "slot_necklace_hotspot",
					content_check_function = function (content)
						return content.parent.slot_necklace
					end
				},
				{
					texture_id = "slot_necklace_frame",
					style_id = "slot_necklace_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_necklace
					end
				},
				{
					texture_id = "slot_necklace_rarity_texture",
					style_id = "slot_necklace_rarity_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_necklace
					end
				},
				{
					texture_id = "slot_ring",
					style_id = "slot_ring",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_ring
					end
				},
				{
					style_id = "slot_ring",
					pass_type = "hotspot",
					content_id = "slot_ring_hotspot",
					content_check_function = function (content)
						return content.parent.slot_ring
					end
				},
				{
					texture_id = "slot_ring_frame",
					style_id = "slot_ring_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_ring
					end
				},
				{
					texture_id = "slot_ring_rarity_texture",
					style_id = "slot_ring_rarity_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_ring
					end
				},
				{
					texture_id = "slot_trinket_1",
					style_id = "slot_trinket_1",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_trinket_1
					end
				},
				{
					style_id = "slot_trinket_1",
					pass_type = "hotspot",
					content_id = "slot_trinket_1_hotspot",
					content_check_function = function (content)
						return content.parent.slot_trinket_1
					end
				},
				{
					texture_id = "slot_trinket_1_frame",
					style_id = "slot_trinket_1_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_trinket_1
					end
				},
				{
					texture_id = "slot_trinket_1_rarity_texture",
					style_id = "slot_trinket_1_rarity_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.slot_trinket_1
					end
				},
				{
					texture_id = "talent_frame",
					style_id = "talent_1_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.talent_1.talent
					end
				},
				{
					style_id = "talent_1",
					pass_type = "hotspot",
					content_id = "talent_1"
				},
				{
					texture_id = "icon",
					style_id = "talent_1",
					pass_type = "texture",
					content_id = "talent_1",
					content_check_function = function (content)
						return content.talent
					end
				},
				{
					style_id = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					pass_type = "talent_tooltip",
					talent_id = "talent",
					content_id = "talent_1",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end
				},
				{
					texture_id = "talent_frame",
					style_id = "talent_2_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.talent_2.talent
					end
				},
				{
					style_id = "talent_2",
					pass_type = "hotspot",
					content_id = "talent_2"
				},
				{
					texture_id = "icon",
					style_id = "talent_2",
					pass_type = "texture",
					content_id = "talent_2",
					content_check_function = function (content)
						return content.talent
					end
				},
				{
					style_id = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					pass_type = "talent_tooltip",
					talent_id = "talent",
					content_id = "talent_2",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end
				},
				{
					texture_id = "talent_frame",
					style_id = "talent_3_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.talent_3.talent
					end
				},
				{
					style_id = "talent_3",
					pass_type = "hotspot",
					content_id = "talent_3"
				},
				{
					texture_id = "icon",
					style_id = "talent_3",
					pass_type = "texture",
					content_id = "talent_3",
					content_check_function = function (content)
						return content.talent
					end
				},
				{
					style_id = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					pass_type = "talent_tooltip",
					talent_id = "talent",
					content_id = "talent_3",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end
				},
				{
					texture_id = "talent_frame",
					style_id = "talent_4_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.talent_4.talent
					end
				},
				{
					style_id = "talent_4",
					pass_type = "hotspot",
					content_id = "talent_4"
				},
				{
					texture_id = "icon",
					style_id = "talent_4",
					pass_type = "texture",
					content_id = "talent_4",
					content_check_function = function (content)
						return content.talent
					end
				},
				{
					style_id = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					pass_type = "talent_tooltip",
					talent_id = "talent",
					content_id = "talent_4",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end
				},
				{
					texture_id = "talent_frame",
					style_id = "talent_5_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.talent_5.talent
					end
				},
				{
					style_id = "talent_5",
					pass_type = "hotspot",
					content_id = "talent_5"
				},
				{
					texture_id = "icon",
					style_id = "talent_5",
					pass_type = "texture",
					content_id = "talent_5",
					content_check_function = function (content)
						return content.talent
					end
				},
				{
					style_id = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					pass_type = "talent_tooltip",
					talent_id = "talent",
					content_id = "talent_5",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end
				},
				{
					texture_id = "talent_frame",
					style_id = "talent_6_frame",
					pass_type = "texture",
					content_check_function = function (content)
						return content.talent_6.talent
					end
				},
				{
					style_id = "talent_6",
					pass_type = "hotspot",
					content_id = "talent_6"
				},
				{
					texture_id = "icon",
					style_id = "talent_6",
					pass_type = "texture",
					content_id = "talent_6",
					content_check_function = function (content)
						return content.talent
					end
				},
				{
					style_id = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					pass_type = "talent_tooltip",
					talent_id = "talent",
					content_id = "talent_6",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end
				}
			}
		},
		content = {
			name = "n/a",
			show_chat_button = false,
			disabled_texture = "tab_menu_icon_03",
			grimoire_debuff_divider = "hud_player_hp_bar_grim_divider",
			profile_tooltip_text = "input_description_show_profile",
			slot_melee_frame = "reward_pop_up_item_frame",
			slot_trinket_1_rarity_texture = "icon_bg_plentiful",
			chat_tooltip_text_unmute = "input_description_unmute_chat",
			voice_tooltip_text_unmute = "input_description_unmute_voice",
			talent_frame = "talent_frame",
			kick_tooltip_text = "input_description_vote_kick_player",
			slot_trinket_1_frame = "reward_pop_up_item_frame",
			slot_ring_rarity_texture = "icon_bg_plentiful",
			chat_button_texture = "tab_menu_icon_02",
			build_private_text = "visibility_private",
			button_frame = "reward_pop_up_item_frame",
			voice_tooltip_text_mute = "input_description_mute_voice",
			host_texture = "host_icon",
			slot_necklace_rarity_texture = "icon_bg_plentiful",
			hero = "wh_captain",
			voice_button_texture = "tab_menu_icon_01",
			ping_text = "150",
			slot_melee_rarity_texture = "icon_bg_plentiful",
			show_kick_button = false,
			chat_tooltip_text_mute = "input_description_mute_chat",
			show_ping = false,
			profile_button_texture = "tab_menu_icon_05",
			kick_button_texture = "tab_menu_icon_04",
			slot_necklace_frame = "reward_pop_up_item_frame",
			hp_bar_bg = "hud_teammate_hp_bar_bg",
			show_profile_button = false,
			ping_texture = "ping_icon_03",
			show_voice_button = false,
			slot_ranged_rarity_texture = "icon_bg_plentiful",
			slot_ranged_frame = "reward_pop_up_item_frame",
			slot_ring_frame = "reward_pop_up_item_frame",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						math.min((size[2] - 50) / background_texture_settings.size[2], 1)
					}
				},
				texture_id = background_texture
			},
			button_hotspot = {
				allow_multi_hover = true
			},
			chat_button_hotspot = {},
			kick_button_hotspot = {},
			voice_button_hotspot = {},
			profile_button_hotspot = {},
			controller_button_hotspot = {},
			hp_bar_fg_start = {
				texture_id = "hud_teammate_hp_bar_frame",
				uvs = {
					{
						0,
						0
					},
					{
						0.2,
						1
					}
				}
			},
			hp_bar_fg_middle = {
				texture_id = "hud_teammate_hp_bar_frame",
				uvs = {
					{
						0.2,
						0
					},
					{
						0.8,
						1
					}
				}
			},
			hp_bar_fg_end = {
				texture_id = "hud_teammate_hp_bar_frame",
				uvs = {
					{
						0.8,
						0
					},
					{
						1,
						1
					}
				}
			},
			health_bar = {
				bar_value = 1,
				internal_bar_value = 0,
				draw_health_bar = true,
				texture_id = "teammate_hp_bar_color_tint_" .. math.min(index, 4)
			},
			total_health_bar = {
				bar_value = 1,
				internal_bar_value = 0,
				draw_health_bar = true,
				texture_id = "teammate_hp_bar_" .. math.min(index, 4)
			},
			grimoire_bar = {
				texture_id = "hud_panel_hp_bar_bg_grimoire",
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
			ability_bar = {
				bar_value = 1,
				texture_id = "hud_teammate_ability_bar_fill",
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
			slot_melee_hotspot = {},
			slot_ranged_hotspot = {},
			slot_necklace_hotspot = {},
			slot_ring_hotspot = {},
			slot_trinket_1_hotspot = {},
			talent_1 = {
				is_selected = true
			},
			talent_2 = {
				is_selected = true
			},
			talent_3 = {
				is_selected = true
			},
			talent_4 = {
				is_selected = true
			},
			talent_5 = {
				is_selected = true
			},
			talent_6 = {
				is_selected = true
			}
		},
		style = {
			slot_melee = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-215,
					-10,
					1
				}
			},
			slot_melee_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-215,
					-10,
					2
				}
			},
			slot_melee_rarity_texture = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-215,
					-10,
					0
				}
			},
			slot_ranged = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-165,
					-10,
					1
				}
			},
			slot_ranged_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-165,
					-10,
					2
				}
			},
			slot_ranged_rarity_texture = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-165,
					-10,
					0
				}
			},
			slot_necklace = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-115,
					-10,
					1
				}
			},
			slot_necklace_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-115,
					-10,
					2
				}
			},
			slot_necklace_rarity_texture = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-115,
					-10,
					0
				}
			},
			slot_ring = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-65,
					-10,
					1
				}
			},
			slot_ring_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-65,
					-10,
					2
				}
			},
			slot_ring_rarity_texture = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-65,
					-10,
					0
				}
			},
			slot_trinket_1 = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-15 + 0 * -50,
					-10,
					1
				}
			},
			slot_trinket_1_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-15 + 0 * -50,
					-10,
					2
				}
			},
			slot_trinket_1_rarity_texture = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-15 + 0 * -50,
					-10,
					0
				}
			},
			talent_tooltip = {
				draw_downwards = false
			},
			talent_1 = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				draw_right = true,
				draw_downwards = false,
				area_size = {
					40,
					40
				},
				texture_size = {
					40,
					40
				},
				offset = {
					-215,
					-60,
					0
				}
			},
			talent_1_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					-215,
					-60,
					1
				}
			},
			talent_2 = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				draw_right = true,
				draw_downwards = false,
				area_size = {
					40,
					40
				},
				texture_size = {
					40,
					40
				},
				offset = {
					-175,
					-60,
					0
				}
			},
			talent_2_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					-175,
					-60,
					1
				}
			},
			talent_3 = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				draw_right = true,
				draw_downwards = false,
				area_size = {
					40,
					40
				},
				texture_size = {
					40,
					40
				},
				offset = {
					-135,
					-60,
					0
				}
			},
			talent_3_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					-135,
					-60,
					1
				}
			},
			talent_4 = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				draw_right = true,
				draw_downwards = false,
				area_size = {
					40,
					40
				},
				texture_size = {
					40,
					40
				},
				offset = {
					-95,
					-60,
					0
				}
			},
			talent_4_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					-95,
					-60,
					1
				}
			},
			talent_5 = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				draw_right = true,
				draw_downwards = false,
				area_size = {
					40,
					40
				},
				texture_size = {
					40,
					40
				},
				offset = {
					-55,
					-60,
					0
				}
			},
			talent_5_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					-55,
					-60,
					1
				}
			},
			talent_6 = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				draw_right = true,
				draw_downwards = false,
				area_size = {
					40,
					40
				},
				texture_size = {
					40,
					40
				},
				offset = {
					-15 + 0 * -40,
					-60,
					0
				}
			},
			talent_6_frame = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					-15 + 0 * -40,
					-60,
					1
				}
			},
			health_bar = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				gradient_threshold = 1,
				texture_size = {
					200,
					18
				},
				color = {
					255,
					0,
					255,
					0
				},
				offset = {
					150,
					-82,
					14
				}
			},
			total_health_bar = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				gradient_threshold = 1,
				texture_size = {
					200,
					18
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					150,
					-82,
					13
				}
			},
			ability_bar = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				full_size = {
					194,
					10
				},
				texture_size = {
					200,
					12
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					153,
					-100,
					13
				}
			},
			grimoire_bar = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				grimoire_debuff = 0,
				texture_size = {
					200,
					18
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-PLAYER_LIST_SIZE[1] + 150 + 200,
					-82,
					13
				}
			},
			grimoire_debuff_divider = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				grimoire_debuff = 0,
				texture_size = {
					5,
					18
				},
				color = {
					255,
					255,
					255,
					255
				},
				base_offset = {
					-PLAYER_LIST_SIZE[1] + 150 + 200 + 1.5,
					-84,
					20
				},
				offset = {
					-PLAYER_LIST_SIZE[1] + 150 + 200,
					-82,
					20
				}
			},
			hp_bar_bg = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_tiling_size = {
					100,
					20
				},
				texture_size = {
					200,
					30
				},
				tile_offset = {
					true,
					false
				},
				offset = {
					150,
					-82,
					10
				},
				color = {
					255,
					30,
					30,
					30
				}
			},
			hp_bar_fg_start = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					20,
					35
				},
				offset = {
					150,
					-80,
					15
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			hp_bar_fg_middle = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					160,
					35
				},
				offset = {
					170,
					-80,
					15
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			hp_bar_fg_end = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					20,
					35
				},
				offset = {
					330,
					-80,
					15
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			frame = {
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
					1
				}
			},
			background = {
				size = {
					size[1],
					size[2]
				},
				color = {
					banner_color[1],
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			tooltip_text = {
				vertical_alignment = "top",
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				font_size = 18,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1
				}
			},
			profile_button_background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					-170,
					10,
					1
				}
			},
			profile_button_frame = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					-170,
					10,
					3
				}
			},
			profile_button_hotspot = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-170,
					10,
					2
				}
			},
			voice_button_background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					-120,
					10,
					3
				}
			},
			voice_chat_button_frame = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					-120,
					10,
					6
				}
			},
			voice_button_hotspot = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-120,
					10,
					4
				}
			},
			voice_button_disabled = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					0,
					0
				},
				offset = {
					-120,
					10,
					5
				}
			},
			chat_button_background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					-70,
					10,
					1
				}
			},
			chat_button_frame = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					-70,
					10,
					6
				}
			},
			chat_button_hotspot = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-70,
					10,
					4
				}
			},
			chat_button_disabled = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					255,
					0,
					0
				},
				offset = {
					-70,
					10,
					5
				}
			},
			kick_button_background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					-20 + 0 * -50,
					10,
					3
				}
			},
			kick_button_frame = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					-20 + 0 * -50,
					10,
					6
				}
			},
			kick_button_hotspot = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				area_size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-20 + 0 * -50,
					10,
					4
				}
			},
			ping_texture = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					54,
					50
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-210,
					5,
					5
				}
			},
			ping_text = {
				horizontal_alignment = "right",
				font_size = 20,
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "arial",
				offset = {
					-255,
					13,
					3
				},
				text_color = Colors.get_table("font_default"),
				high_ping_color = Colors.get_table("crimson"),
				medium_ping_color = Colors.get_table("gold"),
				low_ping_color = Colors.get_table("lime_green")
			},
			build_private_text = {
				vertical_alignment = "top",
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_type = "hell_shark_header",
				font_size = 24,
				offset = {
					200,
					-20,
					1
				},
				text_color = {
					255,
					128,
					128,
					128
				}
			},
			host_texture = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-215,
					10,
					3
				},
				texture_size = {
					40,
					40
				}
			},
			name = {
				font_size = 20,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "arial",
				size = {
					210,
					30
				},
				offset = {
					150,
					121,
					3
				},
				color = Colors.get_table("font_default"),
				hover_color = Colors.get_table("font_default"),
				text_color = Colors.get_table("font_default")
			},
			name_shadow = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				font_type = "arial",
				dynamic_font_size = true,
				font_size = 20,
				size = {
					210,
					30
				},
				offset = {
					152,
					119,
					2
				},
				text_color = Colors.get_table("black")
			},
			hero = {
				upper_case = true,
				localize = true,
				font_size = 28,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				size = {
					210,
					30
				},
				offset = {
					150,
					90,
					3
				},
				color = Colors.get_table("font_title"),
				hover_color = Colors.get_table("font_title"),
				text_color = Colors.get_table("font_title")
			},
			hero_shadow = {
				upper_case = true,
				localize = true,
				horizontal_alignment = "left",
				font_size = 28,
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				size = {
					210,
					30
				},
				offset = {
					152,
					88,
					2
				},
				text_color = Colors.get_table("black")
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return definition
end

local popup_buttons = {
	{
		text = "player_list_kick_player",
		func_name = "kick_player",
		availability_func = "kick_player_available"
	},
	{
		text = "player_list_mute_player",
		func_name = "popup_test_func"
	}
}
local popup_widget_definition = {
	scenegraph_id = "popup",
	element = {
		passes = {
			{
				style_id = "list_style",
				pass_type = "list_pass",
				content_id = "list_content",
				passes = {
					{
						pass_type = "hotspot",
						content_id = "button_hotspot",
						content_check_function = function (content, style)
							return content.button_hotspot.disable_button ~= true
						end
					},
					{
						style_id = "button_text",
						pass_type = "text",
						text_id = "button_text",
						content_check_function = function (content, style)
							if content.button_hotspot.disable_button ~= true then
								if content.button_hotspot.is_hover then
									style.button_text.text_color = style.button_text.hover_color
								else
									style.button_text.text_color = style.button_text.base_color
								end
							end

							return true
						end
					}
				}
			}
		}
	},
	content = {
		list_content = {
			allow_multi_hover = true
		}
	},
	style = {
		list_style = {
			start_index = 1,
			num_draws = 0,
			item_styles = {}
		}
	}
}
local popup_buttons_n = #popup_buttons

for i = 1, popup_buttons_n do
	local popup_button = popup_buttons[i]
	local content = {
		button_hotspot = {},
		button_text = popup_button.text,
		button_func_name = popup_button.func_name,
		button_availability_func_name = popup_button.availability_func
	}
	local style = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		size = {
			POPUP_ELEMENT_SIZE[1],
			POPUP_ELEMENT_SIZE[2]
		},
		list_member_offset = {
			0,
			-POPUP_ELEMENT_SIZE[2],
			0
		},
		button_text = {
			font_size = 28,
			localize = true,
			horizontal_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			base_color = Colors.get_table("dark_gray"),
			hover_color = Colors.get_table("white"),
			disabled_color = Colors.get_table("dim_gray"),
			text_color = Colors.get_table("dark_gray")
		}
	}
	popup_widget_definition.content.list_content[i] = content
	popup_widget_definition.style.list_style.item_styles[i] = style
end

popup_widget_definition.style.list_style.num_draws = popup_buttons_n
local level_title_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 32,
	horizontal_alignment = "right",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		2
	}
}
local difficulty_text_style = {
	use_shadow = true,
	vertical_alignment = "top",
	horizontal_alignment = "right",
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		2
	}
}
local player_career_name_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 36,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0
	}
}
local player_hero_name_style = {
	use_shadow = true,
	vertical_alignment = "top",
	localize = false,
	horizontal_alignment = "left",
	font_size = 24,
	font_type = "hell_shark",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0
	}
}
local career_perks_title_style = {
	vertical_alignment = "top",
	use_shadow = true,
	horizontal_alignment = "left",
	font_size = 18,
	font_type = "hell_shark",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0
	}
}
local right_banner_header = {
	vertical_alignment = "top",
	use_shadow = true,
	horizontal_alignment = "left",
	font_size = 28,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0
	}
}
local main_weave_objective_style = {
	vertical_alignment = "top",
	use_shadow = true,
	horizontal_alignment = "left",
	font_size = 28,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		0
	}
}
local right_banner_sub_header = {
	vertical_alignment = "top",
	use_shadow = true,
	horizontal_alignment = "left",
	font_size = 22,
	font_type = "hell_shark",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		0
	}
}
local rewards_title = {
	vertical_alignment = "top",
	use_shadow = true,
	horizontal_alignment = "center",
	font_size = 22,
	font_type = "hell_shark",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		30,
		0
	}
}
local career_perks_name_style = {
	font_type = "hell_shark_header",
	use_shadow = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	area_size = {
		260,
		100
	},
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0
	}
}
local career_perks_description_style = {
	font_type = "hell_shark",
	font_size = 24,
	localize = false,
	dynamic_font_size_word_wrap = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	area_size = {
		300,
		100
	},
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0
	}
}
local input_description_style = {
	font_size = 24,
	upper_case = true,
	localize = true,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		1
	}
}
local mutator_pass_styles = {
	mutators = {
		text = {
			font_size = 26,
			word_wrap = true,
			font_type = "hell_shark",
			dynamic_font_size_word_wrap = true,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			area_size = {
				540,
				100
			},
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			line_colors = {
				Colors.get_color_table_with_alpha("font_title", 255),
				Colors.get_color_table_with_alpha("font_default", 255)
			}
		},
		text_shadow = {
			word_wrap = true,
			font_size = 26,
			font_type = "hell_shark",
			dynamic_font_size_word_wrap = true,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			area_size = {
				540,
				100
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				1,
				-1,
				-1
			}
		}
	}
}
local static_widget_definitions = {
	banner_left = UIWidgets.create_simple_rect("banner_left", banner_color),
	banner_right = UIWidgets.create_simple_rect("banner_right", banner_color),
	banner_left_edge = create_vertical_edge_divider("banner_left", {
		5,
		scenegraph_definition.banner_left.size[2]
	}),
	banner_right_edge = create_vertical_edge_divider("banner_right", {
		5,
		scenegraph_definition.banner_right.size[2]
	}),
	player_name_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "player_name_divider"),
	mission_details_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "mission_details_divider"),
	mechanism_type_name = UIWidgets.create_simple_text(string.upper(Localize("not_assigned")), "mechanism_type_name", 22, nil, right_banner_header),
	mission_type_name = UIWidgets.create_simple_text(string.upper(Localize("not_assigned")), "mission_type_name", 22, nil, right_banner_sub_header),
	player_ability_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "player_ability_title", 22, nil, career_perks_title_style),
	player_passive_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "player_passive_title", 22, nil, career_perks_title_style)
}
local private_checkbox_offset = 0
local widget_definitions = {
	player_ability_name = UIWidgets.create_simple_text("n/a", "player_ability_name", 22, nil, career_perks_name_style),
	player_ability_description = UIWidgets.create_simple_text("n/a", "player_ability_description", 22, nil, career_perks_description_style),
	player_ability_icon = UIWidgets.create_simple_texture("icons_placeholder", "player_ability_icon"),
	player_passive_name = UIWidgets.create_simple_text("n/a", "player_passive_name", 22, nil, career_perks_name_style),
	player_passive_description = UIWidgets.create_simple_text("n/a", "player_passive_description", 22, nil, career_perks_description_style),
	player_passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "player_passive_icon"),
	game_level = UIWidgets.create_simple_text("n/a", "game_level", 22, nil, level_title_style),
	game_difficulty = UIWidgets.create_simple_text("n/a", "game_difficulty", 22, nil, difficulty_text_style),
	player_career_name = UIWidgets.create_simple_text("n/a", "player_career_name", 22, nil, player_career_name_style),
	player_hero_name = UIWidgets.create_simple_text("n/a", "player_hero_name", 22, nil, player_hero_name_style),
	mutator_summary1 = UIWidgets.create_simple_item_presentation("mutator_summary1", {
		"mutators"
	}, nil, mutator_pass_styles),
	mutator_summary2 = UIWidgets.create_simple_item_presentation("mutator_summary2", {
		"mutators"
	}, nil, mutator_pass_styles),
	mutator_summary3 = UIWidgets.create_simple_item_presentation("mutator_summary3", {
		"mutators"
	}, nil, mutator_pass_styles)
}
local weave_objective_widgets = {
	weave_objective_header = UIWidgets.create_simple_text(Utf8.upper(Localize("menu_weave_play_objective_title")), "weave_objective_header", 22, nil, right_banner_header),
	weave_objective_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "weave_objective_divider"),
	main_objective_text = UIWidgets.create_simple_text(Localize("menu_weave_play_objective_sub_title"), "weave_main_objective", 22, nil, main_weave_objective_style)
}
local specific_widget_definitions = {
	reward_header = UIWidgets.create_simple_text(Localize("deed_reward_title"), "reward_divider", 22, nil, rewards_title),
	reward_divider = UIWidgets.create_simple_texture("divider_01_top", "reward_divider"),
	collectibles_name = UIWidgets.create_simple_text(Utf8.upper(Localize("collectibles_name")), "collectibles_name", 22, nil, right_banner_header),
	collectibles_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "collectibles_divider"),
	level_description = create_description_text("", "level_description"),
	input_description_text = UIWidgets.create_simple_text("player_list_show_mouse_description", "player_list_input_description", nil, nil, input_description_style),
	private_checkbox = UIWidgets.create_checkbox_widget("start_game_window_private_game", "", "private_checkbox", private_checkbox_offset, nil)
}

return {
	PLAYER_LIST_SIZE = PLAYER_LIST_SIZE,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	specific_widget_definitions = specific_widget_definitions,
	static_widget_definitions = static_widget_definitions,
	player_widget_definition = player_widget_definition,
	weave_objective_widgets = weave_objective_widgets,
	create_weave_sub_objective_widget = create_weave_sub_objective_widget,
	popup_widget_definition = popup_widget_definition,
	create_loot_widget = create_loot_widget,
	create_reward_item = create_reward_item,
	create_node_info_widget = create_node_info_widget,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor"),
	item_tooltip = UIWidgets.create_simple_item_presentation("item_tooltip", UISettings.console_tooltip_pass_definitions)
}
