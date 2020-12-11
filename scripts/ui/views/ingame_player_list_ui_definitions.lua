local PLAYER_LIST_SIZE = {
	350,
	500
}
local POPUP_ELEMENT_SIZE = {
	500,
	36
}
local MUTATOR_SUMMARY_SIZE = {
	450,
	0
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
	banner_top = {
		vertical_alignment = "top",
		scale = "fit_width",
		position = {
			0,
			0,
			1
		},
		size = {
			1920,
			200
		}
	},
	banner_bottom = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		position = {
			0,
			0,
			1
		},
		size = {
			1920,
			180
		}
	},
	player_list_input_description = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			190,
			-1
		},
		size = {
			564,
			30
		}
	},
	loot_objective = {
		vertical_alignment = "top",
		parent = "banner_bottom",
		horizontal_alignment = "left",
		position = {
			30,
			0,
			1
		},
		size = {
			200,
			90
		}
	},
	party_title = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			-210,
			1
		},
		size = {
			334,
			60
		}
	},
	player_portrait = {
		vertical_alignment = "center",
		parent = "banner_top",
		horizontal_alignment = "left",
		position = {
			100,
			0,
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
		parent = "banner_top",
		horizontal_alignment = "left",
		position = {
			600,
			-20,
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
			400,
			100
		}
	},
	player_ability_icon = {
		vertical_alignment = "top",
		parent = "banner_top",
		horizontal_alignment = "left",
		position = {
			1100,
			-20,
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
			400,
			100
		}
	},
	game_level_image = {
		vertical_alignment = "top",
		parent = "banner_bottom",
		horizontal_alignment = "right",
		position = {
			-25,
			-20,
			1
		},
		size = {
			300,
			170
		}
	},
	game_level_banner = {
		vertical_alignment = "top",
		parent = "game_level_image",
		horizontal_alignment = "right",
		position = {
			-2,
			-2,
			1
		},
		size = {
			300,
			65
		}
	},
	game_level = {
		vertical_alignment = "top",
		parent = "banner_top",
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
		parent = "banner_bottom",
		horizontal_alignment = "right",
		position = {
			-30,
			0,
			1
		},
		size = MUTATOR_SUMMARY_SIZE
	},
	mutator_summary2 = {
		vertical_alignment = "top",
		parent = "mutator_summary1",
		horizontal_alignment = "right",
		position = {
			-MUTATOR_SUMMARY_SIZE[1],
			0,
			1
		},
		size = MUTATOR_SUMMARY_SIZE
	},
	player_list = {
		vertical_alignment = "center",
		parent = "background",
		horizontal_alignment = "center",
		position = {
			-PLAYER_LIST_SIZE[1] / 2,
			-60,
			1
		},
		size = {
			PLAYER_LIST_SIZE[1],
			PLAYER_LIST_SIZE[2]
		}
	},
	player_list_portrait = {
		vertical_alignment = "top",
		parent = "player_list",
		horizontal_alignment = "center",
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
	game_timer_text = {
		vertical_alignment = "top",
		parent = "private_checkbox",
		horizontal_alignment = "right",
		size = {
			250,
			40
		},
		position = {
			0,
			-45,
			1
		}
	}
}

local function create_edge_divider(scenegraph_id, size)
	local widget = {
		element = {
			passes = {
				{
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_holder_right = "menu_frame_09_divider_right",
			edge_holder_left = "menu_frame_09_divider_left",
			bottom_edge = "menu_frame_09_divider"
		},
		style = {
			bottom_edge = {
				size = {
					[2] = size[2]
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					0,
					6
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-6,
					10
				},
				texture_size = {
					9,
					17
				}
			},
			edge_holder_right = {
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-6,
					10
				},
				texture_size = {
					9,
					17
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

	return widget
end

local function create_loot_widget(texture, text)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local texture_size = texture_settings.size

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
					texture_size[1],
					texture_size[2] - 50,
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
					texture_size[1] + 1,
					texture_size[2] - 50 - 1,
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
					texture_size[1],
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
					texture_size[1],
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
					texture_size[1] + 1,
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
				texture_size = texture_size
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
				texture_size = texture_size
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
				texture_size = texture_size
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

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
local career_perks_name_style = {
	use_shadow = true,
	vertical_alignment = "top",
	localize = false,
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
local career_perks_description_style = {
	font_size = 16,
	word_wrap = true,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0
	}
}
local loot_objective_title_style = {
	vertical_alignment = "top",
	use_shadow = true,
	horizontal_alignment = "center",
	font_size = 32,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		80,
		0
	}
}
local party_title_style = {
	use_shadow = true,
	upper_case = true,
	vertical_alignment = "center",
	horizontal_alignment = "center",
	font_size = 42,
	font_type = "hell_shark_header",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		-3,
		1
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
local game_timer_text_style = {
	vertical_alignment = "center",
	use_shadow = true,
	horizontal_alignment = "center",
	font_size = 24,
	font_type = "hell_shark",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		1
	}
}
local banner_color = {
	200,
	10,
	10,
	10
}
local static_widget_definitions = {
	banner_top = UIWidgets.create_simple_rect("banner_top", banner_color),
	banner_bottom = UIWidgets.create_simple_rect("banner_bottom", banner_color),
	banner_top_edge = create_edge_divider("banner_top", {
		scenegraph_definition.banner_top.size[1],
		5
	}),
	banner_bottom_edge = create_edge_divider("banner_bottom", {
		scenegraph_definition.banner_bottom.size[1],
		5
	}),
	player_name_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "player_name_divider"),
	player_ability_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "player_ability_title", 22, nil, career_perks_title_style),
	player_passive_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "player_passive_title", 22, nil, career_perks_title_style),
	party_title = UIWidgets.create_simple_text(Localize("hero_view_player_list_party"), "party_title", 32, nil, party_title_style),
	party_title_bg = UIWidgets.create_simple_texture("tab_menu_bg_03", "party_title")
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
	}),
	mutator_summary2 = UIWidgets.create_simple_item_presentation("mutator_summary2", {
		"mutators"
	})
}
local specific_widget_definitions = {
	input_description_text = UIWidgets.create_simple_text("player_list_show_mouse_description", "player_list_input_description", nil, nil, input_description_style),
	private_checkbox = UIWidgets.create_checkbox_widget("start_game_window_private_game", "", "private_checkbox", private_checkbox_offset, nil),
	game_timer_text = UIWidgets.create_simple_text("00:00:00", "game_timer_text", nil, nil, difficulty_text_style),
	background = {
		scenegraph_id = "screen",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "gradient_dice_game_reward"
		},
		style = {
			color = {
				255,
				255,
				255,
				255
			}
		}
	}
}
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

for i = 1, popup_buttons_n, 1 do
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
					texture_id = "bottom_edge",
					style_id = "bottom_edge",
					pass_type = "tiled_texture"
				},
				{
					texture_id = "edge_holder_left",
					style_id = "edge_holder_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_holder_right",
					style_id = "edge_holder_right",
					pass_type = "texture"
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "bottom_edge_sements",
					texture_id = "bottom_edge_sements"
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "bottom_edge_sements_bottom",
					texture_id = "bottom_edge_sements_bottom"
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "bottom_edge_sements_top",
					texture_id = "bottom_edge_sements_top"
				},
				{
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end
				},
				{
					pass_type = "controller_hotspot",
					content_id = "controller_button_hotspot"
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					pass_type = "rect",
					style_id = "options_background"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "hero_name_divider",
					texture_id = "hero_name_divider"
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
					pass_type = "texture",
					style_id = "chat_button_background",
					texture_id = "chat_button_texture"
				},
				{
					pass_type = "texture",
					style_id = "chat_button_hotspot",
					texture_id = "chat_button_texture",
					content_check_function = function (content)
						return content.show_chat_button
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
					pass_type = "texture",
					style_id = "voice_button_background",
					texture_id = "voice_button_texture"
				},
				{
					pass_type = "texture",
					style_id = "voice_button_hotspot",
					texture_id = "voice_button_texture",
					content_check_function = function (content)
						return content.show_voice_button
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
					pass_type = "texture",
					style_id = "kick_button_background",
					texture_id = "kick_button_texture"
				},
				{
					pass_type = "texture",
					style_id = "kick_button_hotspot",
					texture_id = "kick_button_texture",
					content_check_function = function (content)
						return content.show_kick_button
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
					pass_type = "texture",
					style_id = "profile_button_background",
					texture_id = "profile_button_texture"
				},
				{
					pass_type = "texture",
					style_id = "profile_button_hotspot",
					texture_id = "profile_button_texture",
					content_check_function = function (content)
						return content.show_profile_button
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
				}
			}
		},
		content = {
			voice_button_texture = "tab_menu_icon_01",
			name = "n/a",
			show_chat_button = false,
			ping_texture = "ping_icon_03",
			edge_holder_left = "menu_frame_09_divider_left",
			hover_texture = "playerlist_hover",
			edge_holder_right = "menu_frame_09_divider_right",
			bottom_edge_sements_top = "menu_frame_09_divider_top",
			host_texture = "host_icon",
			hero = "wh_captain",
			voice_tooltip_text_unmute = "input_description_unmute_voice",
			profile_tooltip_text = "input_description_show_profile",
			kick_tooltip_text = "input_description_vote_kick_player",
			profile_button_texture = "tab_menu_icon_05",
			show_kick_button = false,
			chat_tooltip_text_unmute = "input_description_unmute_chat",
			show_profile_button = false,
			show_ping = false,
			voice_tooltip_text_mute = "input_description_mute_voice",
			chat_button_texture = "tab_menu_icon_02",
			hero_name_divider = "divider_01_top",
			ping_text = "n/a",
			chat_tooltip_text_mute = "input_description_mute_chat",
			bottom_edge_sements_bottom = "menu_frame_09_divider_bottom",
			bottom_edge_sements = "menu_frame_09_divider_vertical",
			bottom_edge = "menu_frame_09_divider",
			kick_button_texture = "tab_menu_icon_04",
			disabled_texture = "tab_menu_icon_03",
			show_voice_button = false,
			frame = frame_settings.texture,
			button_hotspot = {
				allow_multi_hover = true
			},
			chat_button_hotspot = {},
			kick_button_hotspot = {},
			voice_button_hotspot = {},
			profile_button_hotspot = {},
			controller_button_hotspot = {},
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
			}
		},
		style = {
			bottom_edge_sements = {
				texture_axis = 1,
				spacing = 8,
				texture_amount = 3,
				texture_size = {
					5,
					45
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					5,
					6
				}
			},
			bottom_edge_sements_top = {
				texture_axis = 1,
				spacing = 8,
				texture_amount = 3,
				texture_size = {
					17,
					9
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					43,
					11
				}
			},
			bottom_edge_sements_bottom = {
				texture_axis = 1,
				spacing = 8,
				texture_amount = 3,
				texture_size = {
					17,
					9
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					4,
					11
				}
			},
			bottom_edge = {
				size = {
					size[1] - 10,
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					50,
					6
				},
				texture_tiling_size = {
					size[1] - 10,
					5
				}
			},
			edge_holder_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					3,
					44,
					10
				},
				size = {
					9,
					17
				}
			},
			edge_holder_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 12,
					44,
					10
				},
				size = {
					9,
					17
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
					size[2] - 50
				},
				color = {
					banner_color[1],
					255,
					255,
					255
				},
				offset = {
					0,
					50,
					0
				}
			},
			options_background = {
				size = {
					size[1],
					50
				},
				color = banner_color,
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
				size = {
					40,
					40
				},
				color = {
					255,
					50,
					50,
					50
				},
				offset = {
					size[1] / 2 - 20 - size[1] / 4 * 1.5,
					10,
					3
				}
			},
			profile_button_hotspot = {
				size = {
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
					size[1] / 2 - 20 - size[1] / 4 * 1.5,
					10,
					4
				}
			},
			chat_button_background = {
				size = {
					40,
					40
				},
				color = {
					255,
					50,
					50,
					50
				},
				offset = {
					size[1] / 2 - 20 - size[1] / 4 * 0.5,
					10,
					3
				}
			},
			chat_button_hotspot = {
				size = {
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
					size[1] / 2 - 20 - size[1] / 4 * 0.5,
					10,
					4
				}
			},
			chat_button_disabled = {
				size = {
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
					size[1] / 2 - 20 - size[1] / 4 * 0.5,
					10,
					5
				}
			},
			voice_button_background = {
				size = {
					40,
					40
				},
				color = {
					255,
					50,
					50,
					50
				},
				offset = {
					size[1] / 2 - 20 + size[1] / 4 * 0.5,
					10,
					3
				}
			},
			voice_button_hotspot = {
				size = {
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
					size[1] / 2 - 20 + size[1] / 4 * 0.5,
					10,
					4
				}
			},
			voice_button_disabled = {
				size = {
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
					size[1] / 2 - 20 + size[1] / 4 * 0.5,
					10,
					5
				}
			},
			kick_button_background = {
				size = {
					40,
					40
				},
				color = {
					255,
					50,
					50,
					50
				},
				offset = {
					size[1] / 2 - 20 + size[1] / 4 * 1.5,
					10,
					3
				}
			},
			kick_button_hotspot = {
				size = {
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
					size[1] / 2 - 20 + size[1] / 4 * 1.5,
					10,
					4
				}
			},
			ping_texture = {
				size = {
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
					size[1] - 60,
					size[2] - 50,
					3
				}
			},
			ping_text = {
				horizontal_alignment = "center",
				font_size = 20,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "arial",
				size = {
					60,
					50
				},
				offset = {
					size[1] - 110,
					size[2] - 52,
					3
				},
				text_color = Colors.get_table("font_default"),
				high_ping_color = Colors.get_table("crimson"),
				medium_ping_color = Colors.get_table("gold"),
				low_ping_color = Colors.get_table("lime_green")
			},
			hover_texture = {
				offset = {
					0,
					0,
					1
				},
				color = Colors.get_table("white"),
				size = {
					size[1],
					size[2]
				}
			},
			host_texture = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					20,
					size[2] - 30,
					3
				},
				size = {
					18,
					14
				}
			},
			hero_name_divider = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] / 2 - 132,
					size[2] - 150,
					3
				},
				size = {
					264,
					32
				}
			},
			name = {
				font_size = 26,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "arial",
				size = {
					size[1] - 20,
					size[2]
				},
				offset = {
					10,
					55,
					3
				},
				color = Colors.get_table("font_default"),
				hover_color = Colors.get_table("font_default"),
				text_color = Colors.get_table("font_default")
			},
			name_shadow = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				font_type = "arial",
				dynamic_font_size = true,
				font_size = 26,
				size = {
					size[1] - 20,
					size[2]
				},
				offset = {
					12,
					53,
					2
				},
				text_color = Colors.get_table("black")
			},
			hero = {
				upper_case = true,
				localize = true,
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				size = {
					size[1] - 20,
					size[2]
				},
				offset = {
					10,
					-80,
					3
				},
				color = Colors.get_table("font_title"),
				hover_color = Colors.get_table("font_title"),
				text_color = Colors.get_table("font_title")
			},
			hero_shadow = {
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				font_size = 28,
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				size = {
					size[1] - 20,
					size[2]
				},
				offset = {
					12,
					-82,
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

return {
	PLAYER_LIST_SIZE = PLAYER_LIST_SIZE,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	specific_widget_definitions = specific_widget_definitions,
	static_widget_definitions = static_widget_definitions,
	player_widget_definition = player_widget_definition,
	popup_widget_definition = popup_widget_definition,
	create_loot_widget = create_loot_widget,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor")
}
