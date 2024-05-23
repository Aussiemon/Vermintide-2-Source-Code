-- chunkname: @scripts/ui/views/ingame_player_list_ui_v2_definitions.lua

local PLAYER_LIST_SIZE = {
	620,
	160,
}
local POPUP_ELEMENT_SIZE = {
	500,
	36,
}
local MUTATOR_SUMMARY_SIZE = {
	450,
	0,
}
local BANNER_LEFT_SIZE = {
	660,
	1080,
}
local BANNER_RIGHT_SIZE = {
	660,
	1080,
}
local INPUT_DESCRIPTION_POSITION_X = (BANNER_LEFT_SIZE[1] - BANNER_RIGHT_SIZE[1]) / 2
local banner_color = {
	200,
	10,
	10,
	10,
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.ingame_player_list,
		},
		size = {
			1920,
			1080,
		},
	},
	console_cursor = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			-10,
		},
		size = {
			1920,
			1080,
		},
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.ingame_player_list,
		},
		size = {
			100,
			100,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			1920,
			1080,
		},
	},
	banner_left = {
		horizontal_alignment = "left",
		scale = "fit_height",
		position = {
			0,
			0,
			1,
		},
		size = BANNER_LEFT_SIZE,
	},
	banner_left_edge = {
		horizontal_alignment = "left",
		scale = "fit_height",
		position = {
			BANNER_LEFT_SIZE[1],
			0,
			1,
		},
		size = {
			5,
			BANNER_LEFT_SIZE[2],
		},
	},
	banner_right = {
		horizontal_alignment = "right",
		scale = "fit_height",
		position = {
			0,
			0,
			1,
		},
		size = BANNER_RIGHT_SIZE,
	},
	banner_right_edge = {
		horizontal_alignment = "right",
		scale = "fit_height",
		position = {
			-BANNER_LEFT_SIZE[1],
			0,
			1,
		},
		size = {
			5,
			BANNER_LEFT_SIZE[2],
		},
	},
	player_list_input_description = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			INPUT_DESCRIPTION_POSITION_X,
			50,
			-1,
		},
		size = {
			564,
			30,
		},
	},
	node_info = {
		horizontal_alignment = "left",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			20,
			-200,
			1,
		},
		offset = {
			0,
			0,
			0,
		},
	},
	reward_item = {
		horizontal_alignment = "left",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			122,
			-750,
			1,
		},
		offset = {
			0,
			0,
			0,
		},
	},
	reward_divider = {
		horizontal_alignment = "left",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			20,
			-700,
			1,
		},
		size = {
			264,
			32,
		},
		offset = {
			0,
			0,
			0,
		},
	},
	loot_objective = {
		horizontal_alignment = "left",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			20,
			-990,
			1,
		},
		size = {
			200,
			90,
		},
	},
	player_portrait = {
		horizontal_alignment = "left",
		parent = "banner_left",
		vertical_alignment = "top",
		position = {
			100,
			-100,
			10,
		},
		size = {
			0,
			0,
		},
	},
	player_career_name = {
		horizontal_alignment = "left",
		parent = "player_portrait",
		vertical_alignment = "center",
		position = {
			80,
			-11,
			1,
		},
		size = {
			400,
			0,
		},
	},
	player_name_divider = {
		horizontal_alignment = "left",
		parent = "player_portrait",
		vertical_alignment = "center",
		position = {
			80,
			-5,
			1,
		},
		size = {
			450,
			4,
		},
	},
	mechanism_type_name = {
		horizontal_alignment = "left",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			20,
			-140,
			1,
		},
	},
	mission_type_name = {
		horizontal_alignment = "left",
		parent = "mechanism_type_name",
		vertical_alignment = "top",
		position = {
			0,
			-30,
			1,
		},
	},
	mission_details_divider = {
		horizontal_alignment = "left",
		parent = "mission_type_name",
		vertical_alignment = "top",
		position = {
			0,
			-30,
			1,
		},
		size = {
			450,
			4,
		},
	},
	level_description = {
		horizontal_alignment = "left",
		parent = "mission_details_divider",
		vertical_alignment = "top",
		position = {
			0,
			-30,
			1,
		},
		size = {
			540,
			400,
		},
	},
	collectibles_name = {
		horizontal_alignment = "left",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			20,
			-850,
			1,
		},
	},
	collectibles_divider = {
		horizontal_alignment = "left",
		parent = "collectibles_name",
		vertical_alignment = "top",
		position = {
			0,
			-35,
			1,
		},
		size = {
			450,
			4,
		},
	},
	player_hero_name = {
		horizontal_alignment = "left",
		parent = "player_portrait",
		vertical_alignment = "center",
		position = {
			80,
			-7,
			1,
		},
		size = {
			500,
			0,
		},
	},
	player_passive_icon = {
		horizontal_alignment = "left",
		parent = "banner_left",
		vertical_alignment = "top",
		position = {
			350,
			-190,
			1,
		},
		size = {
			50,
			50,
		},
	},
	player_passive_name = {
		horizontal_alignment = "left",
		parent = "player_passive_icon",
		vertical_alignment = "top",
		position = {
			60,
			0,
			1,
		},
		size = {
			500,
			30,
		},
	},
	player_passive_title = {
		horizontal_alignment = "left",
		parent = "player_passive_name",
		vertical_alignment = "top",
		position = {
			0,
			-30,
			1,
		},
		size = {
			500,
			30,
		},
	},
	player_passive_description = {
		horizontal_alignment = "left",
		parent = "player_passive_icon",
		vertical_alignment = "top",
		position = {
			0,
			-60,
			1,
		},
		size = {
			300,
			100,
		},
	},
	player_ability_icon = {
		horizontal_alignment = "left",
		parent = "banner_left",
		vertical_alignment = "top",
		position = {
			20,
			-190,
			1,
		},
		size = {
			50,
			50,
		},
	},
	player_ability_name = {
		horizontal_alignment = "left",
		parent = "player_ability_icon",
		vertical_alignment = "top",
		position = {
			60,
			0,
			1,
		},
		size = {
			500,
			30,
		},
	},
	player_ability_title = {
		horizontal_alignment = "left",
		parent = "player_ability_name",
		vertical_alignment = "top",
		position = {
			0,
			-30,
			1,
		},
		size = {
			500,
			30,
		},
	},
	player_ability_description = {
		horizontal_alignment = "left",
		parent = "player_ability_icon",
		vertical_alignment = "top",
		position = {
			0,
			-60,
			1,
		},
		size = {
			300,
			100,
		},
	},
	game_level = {
		horizontal_alignment = "right",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			-25,
			-20,
			5,
		},
		size = {
			500,
			30,
		},
	},
	game_difficulty = {
		horizontal_alignment = "right",
		parent = "game_level",
		vertical_alignment = "top",
		position = {
			0,
			-30,
			5,
		},
		size = {
			500,
			30,
		},
	},
	mutator_summary1 = {
		horizontal_alignment = "left",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			20,
			-200,
			1,
		},
		size = MUTATOR_SUMMARY_SIZE,
	},
	mutator_summary2 = {
		horizontal_alignment = "left",
		parent = "mutator_summary1",
		vertical_alignment = "top",
		position = {
			0,
			-100,
			1,
		},
		size = MUTATOR_SUMMARY_SIZE,
	},
	mutator_summary3 = {
		horizontal_alignment = "left",
		parent = "mutator_summary2",
		vertical_alignment = "top",
		position = {
			0,
			-100,
			1,
		},
		size = MUTATOR_SUMMARY_SIZE,
	},
	mutator_summary4 = {
		horizontal_alignment = "left",
		parent = "mutator_summary3",
		vertical_alignment = "top",
		position = {
			0,
			-100,
			1,
		},
		size = MUTATOR_SUMMARY_SIZE,
	},
	mutator_summary5 = {
		horizontal_alignment = "left",
		parent = "mutator_summary4",
		vertical_alignment = "top",
		position = {
			0,
			-100,
			1,
		},
		size = MUTATOR_SUMMARY_SIZE,
	},
	mutator_summary6 = {
		horizontal_alignment = "left",
		parent = "mutator_summary5",
		vertical_alignment = "top",
		position = {
			0,
			-100,
			1,
		},
		size = MUTATOR_SUMMARY_SIZE,
	},
	weave_objective_header = {
		horizontal_alignment = "left",
		parent = "mutator_summary1",
		vertical_alignment = "top",
		position = {
			0,
			-200,
			1,
		},
		size = MUTATOR_SUMMARY_SIZE,
	},
	weave_objective_divider = {
		horizontal_alignment = "left",
		parent = "weave_objective_header",
		vertical_alignment = "top",
		position = {
			0,
			-35,
			1,
		},
		size = {
			450,
			4,
		},
	},
	weave_main_objective = {
		horizontal_alignment = "left",
		parent = "weave_objective_divider",
		vertical_alignment = "top",
		position = {
			0,
			-20,
			1,
		},
		size = {
			450,
			300,
		},
	},
	weave_sub_objective = {
		horizontal_alignment = "left",
		parent = "weave_main_objective",
		vertical_alignment = "top",
		position = {
			0,
			-50,
			1,
		},
		size = {
			450,
			300,
		},
	},
	player_list = {
		horizontal_alignment = "left",
		parent = "screen",
		vertical_alignment = "top",
		position = {
			0,
			-370,
			1,
		},
		offset = {
			20,
			0,
			0,
		},
		size = {
			PLAYER_LIST_SIZE[1],
			PLAYER_LIST_SIZE[2],
		},
	},
	player_list_portrait = {
		horizontal_alignment = "left",
		parent = "player_list",
		vertical_alignment = "center",
		position = {
			80,
			-7,
			1,
		},
		size = {
			0,
			0,
		},
	},
	popup = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			-200,
			10,
		},
		size = {
			POPUP_ELEMENT_SIZE[1],
			POPUP_ELEMENT_SIZE[2],
		},
	},
	private_checkbox = {
		horizontal_alignment = "right",
		parent = "game_difficulty",
		vertical_alignment = "top",
		size = {
			250,
			40,
		},
		position = {
			0,
			-35,
			1,
		},
	},
	item_tooltip = {
		horizontal_alignment = "right",
		parent = "player_list",
		vertical_alignment = "bottom",
		position = {
			450,
			0,
			1,
		},
		offset = {
			0,
			-5,
			0,
		},
		size = {
			400,
			0,
		},
	},
	reward_item_tooltip = {
		horizontal_alignment = "right",
		parent = "banner_right",
		vertical_alignment = "top",
		position = {
			0,
			-780,
			1,
		},
		offset = {
			-80,
			0,
			0,
		},
		size = {
			400,
			0,
		},
	},
	talent_tooltip = {
		horizontal_alignment = "right",
		parent = "player_list",
		vertical_alignment = "bottom",
		position = {
			450,
			0,
			1,
		},
		offset = {
			0,
			-5,
			0,
		},
		size = {
			400,
			0,
		},
	},
}

local function create_vertical_edge_divider(scenegraph_id, size)
	local scenegraph_definition = scenegraph_definition[scenegraph_id]
	local horizontal_alignment = scenegraph_definition.horizontal_alignment == "right" and "left" or "right"
	local offset_multiplier = horizontal_alignment == "left" and -1 or 1
	local widget = {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "edge",
					texture_id = "edge",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_top",
					texture_id = "edge_holder_top",
				},
				{
					pass_type = "texture",
					style_id = "edge_holder_bottom",
					texture_id = "edge_holder_bottom",
				},
			},
		},
		content = {
			edge = "menu_frame_09_divider_vertical",
			edge_holder_bottom = "menu_frame_09_divider_bottom",
			edge_holder_top = "menu_frame_09_divider_top",
		},
		style = {
			edge = {
				texture_size = {
					size[1],
					size[2],
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					5 * offset_multiplier,
					0,
					6,
				},
				texture_tiling_size = {
					5,
					size[2],
				},
				horizontal_alignment = horizontal_alignment,
			},
			edge_holder_top = {
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					11 * offset_multiplier,
					0,
					10,
				},
				texture_size = {
					17,
					9,
				},
				horizontal_alignment = horizontal_alignment,
			},
			edge_holder_bottom = {
				vertical_alignment = "bottom",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					11 * offset_multiplier,
					0,
					10,
				},
				texture_size = {
					17,
					9,
				},
				horizontal_alignment = horizontal_alignment,
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

local function create_loot_widget(texture, text, scale)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local texture_size = texture_settings.size

	scale = scale or 1

	return {
		scenegraph_id = "loot_objective",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "counter_text",
					text_id = "counter_text",
					content_check_function = function (content)
						return content.amount > 0
					end,
				},
				{
					pass_type = "text",
					style_id = "counter_text_disabled",
					text_id = "counter_text",
					content_check_function = function (content)
						return content.amount == 0
					end,
				},
				{
					pass_type = "text",
					style_id = "counter_text_shadow",
					text_id = "counter_text",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.amount > 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "background_icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "glow_icon",
					texture_id = "glow_icon",
				},
			},
		},
		content = {
			amount = 0,
			counter_text = "x9",
			text = text or "n/a",
			icon = texture,
			glow_icon = texture .. "_glow",
		},
		style = {
			text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				text_color = Colors.get_table("font_title"),
				offset = {
					scale * texture_size[1],
					scale * texture_size[2] - 50,
					1,
				},
			},
			text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				text_color = Colors.get_table("black"),
				offset = {
					scale * texture_size[1] + 1,
					scale * texture_size[2] - 50 - 1,
					0,
				},
			},
			counter_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_table("font_default"),
				offset = {
					scale * texture_size[1],
					-40,
					1,
				},
			},
			counter_text_disabled = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = {
					255,
					130,
					130,
					130,
				},
				offset = {
					scale * texture_size[1],
					-40,
					1,
				},
			},
			counter_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_table("black"),
				offset = {
					scale * texture_size[1] + 1,
					-41,
					0,
				},
			},
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
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
				texture_size = {
					scale * texture_size[1],
					scale * texture_size[2],
				},
			},
			background_icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					0,
				},
				texture_size = {
					scale * texture_size[1],
					scale * texture_size[2],
				},
			},
			glow_icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
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
				texture_size = {
					scale * texture_size[1],
					scale * texture_size[2],
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

local function create_node_info_widget()
	return {
		scenegraph_id = "node_info",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "divider",
					texture_id = "divider_id",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_id",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text_id",
				},
				{
					content_id = "node_info",
					pass_type = "auto_layout",
					style_id = "node_info",
					sub_passes = {
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
				},
			},
		},
		content = {
			divider_id = "infoslate_frame_02_horizontal",
			text_id = Utf8.upper(Localize("hero_view_prestige_information")),
			node_info = {
				breed_icon = "mutator_icon_elite_run",
				breed_text = "breed_text",
				curse_icon = "deus_icons_map_khorne",
				curse_text = "curse_text",
				terror_event_power_up_icon = "mutator_icon_elite_run",
				terror_event_power_up_text = "terror_event_power_up_text",
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
			divider = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					450,
					4,
				},
				offset = {
					0,
					-30,
					0,
				},
			},
			text = {
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			text_shadow = {
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					0,
				},
			},
			node_info = {
				horizontal_alignment = "left",
				layout_delta_x = 0,
				layout_delta_y = -1,
				vertical_alignment = "top",
				offset = {
					10,
					-50,
					0,
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
							40,
							40,
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
							40,
							40,
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
							40,
							40,
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
							40,
							40,
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
							40,
							40,
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
							40,
							40,
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
							40,
							40,
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
							40,
							40,
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
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local function create_weave_sub_objective_widget(scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
			},
		},
		content = {
			background = "chest_upgrade_fill_glow",
			icon = "trial_gem",
			text = "-",
			title_text = "title_text",
		},
		style = {
			background = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					49,
					44,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				default_offset = {
					-25,
					-2,
					1,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - 50,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - 50,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					1,
				},
			},
			text = {
				dynamic_font_size_word_wrap = true,
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-30,
					2,
				},
			},
			text_shadow = {
				dynamic_font_size_word_wrap = true,
				font_size = 26,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-32,
					1,
				},
			},
		},
		offset = {
			50,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_description_text(text, scenegraph_id)
	local definition = {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "description_text",
					text_id = "description_text",
					content_check_function = function (content)
						return content.text ~= ""
					end,
				},
				{
					pass_type = "text",
					style_id = "level_description_text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "level_description_text_shadow",
					text_id = "text",
				},
			},
		},
		content = {
			text = text,
			description_text = Localize("lb_mission"),
		},
		style = {
			description_text = {
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_table("font_title"),
				offset = {
					0,
					0,
					1,
				},
			},
			level_description_text = {
				dynamic_font_size_word_wrap = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					620,
					220,
				},
				text_color = Colors.get_table("white"),
				offset = {
					0,
					-30,
					1,
				},
			},
			level_description_text_shadow = {
				dynamic_font_size_word_wrap = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					620,
					220,
				},
				text_color = Colors.get_table("black"),
				offset = {
					2,
					-32,
					0,
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

	return definition
end

local function create_reward_item(offset_x, item)
	local definition = {
		scenegraph_id = "reward_item",
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon_id",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "frame_id",
				},
				{
					item_id = "item",
					pass_type = "item_tooltip",
					scenegraph_id = "reward_item_tooltip",
					content_check_function = function (content)
						return content.hotspot.is_hover and content.item
					end,
				},
			},
		},
		content = {
			frame_id = "item_frame",
			hotspot = {},
			icon_id = item.data.inventory_icon,
			item = item,
		},
		style = {
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					60,
					60,
				},
				area_size = {
					60,
					60,
				},
				offset = {
					0,
					0,
					0,
				},
			},
		},
		offset = {
			offset_x,
			0,
			0,
		},
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
					texture_id = "frame",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "host_texture",
					texture_id = "host_texture",
					content_check_function = function (content)
						return content.show_host
					end,
				},
				{
					pass_type = "texture",
					style_id = "ping_texture",
					texture_id = "ping_texture",
					content_check_function = function (content)
						return content.show_ping
					end,
				},
				{
					pass_type = "text",
					style_id = "ping_text",
					text_id = "ping_text",
					content_check_function = function (content, style)
						return content.show_ping and Application.user_setting("show_numerical_latency")
					end,
				},
				{
					pass_type = "text",
					style_id = "build_private_text",
					text_id = "build_private_text",
					content_check_function = function (content, style)
						return not content.is_build_visible
					end,
				},
				{
					pass_type = "rect",
					style_id = "chat_button_background",
					texture_id = "chat_button_texture",
				},
				{
					pass_type = "texture",
					style_id = "chat_button_frame",
					texture_id = "button_frame",
				},
				{
					pass_type = "texture",
					style_id = "chat_button_hotspot",
					texture_id = "chat_button_texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_chat_button and 255 or 60
					end,
				},
				{
					pass_type = "texture",
					style_id = "chat_button_disabled",
					texture_id = "disabled_texture",
					content_check_function = function (content)
						return content.show_chat_button and content.chat_button_hotspot.is_selected
					end,
				},
				{
					content_id = "chat_button_hotspot",
					pass_type = "hotspot",
					style_id = "chat_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "chat_tooltip_text_mute",
					content_check_function = function (content)
						return content.show_chat_button and not content.chat_button_hotspot.is_selected and content.chat_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "chat_tooltip_text_unmute",
					content_check_function = function (content)
						return content.show_chat_button and content.chat_button_hotspot.is_selected and content.chat_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "rect",
					style_id = "voice_button_background",
					texture_id = "voice_button_texture",
				},
				{
					pass_type = "texture",
					style_id = "voice_chat_button_frame",
					texture_id = "button_frame",
				},
				{
					pass_type = "texture",
					style_id = "voice_button_hotspot",
					texture_id = "voice_button_texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_voice_button and 255 or 60
					end,
				},
				{
					pass_type = "texture",
					style_id = "voice_button_disabled",
					texture_id = "disabled_texture",
					content_check_function = function (content)
						return content.show_voice_button and content.voice_button_hotspot.is_selected
					end,
				},
				{
					content_id = "voice_button_hotspot",
					pass_type = "hotspot",
					style_id = "voice_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "voice_tooltip_text_mute",
					content_check_function = function (content)
						return content.show_voice_button and not content.voice_button_hotspot.is_selected and content.voice_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "voice_tooltip_text_unmute",
					content_check_function = function (content)
						return content.show_voice_button and content.voice_button_hotspot.is_selected and content.voice_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "rect",
					style_id = "kick_button_background",
					texture_id = "kick_button_texture",
				},
				{
					pass_type = "texture",
					style_id = "kick_button_frame",
					texture_id = "button_frame",
				},
				{
					pass_type = "texture",
					style_id = "kick_button_hotspot",
					texture_id = "kick_button_texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_kick_button and 255 or 60
					end,
				},
				{
					content_id = "kick_button_hotspot",
					pass_type = "hotspot",
					style_id = "kick_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "kick_tooltip_text",
					content_check_function = function (content)
						return content.show_kick_button and content.kick_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "rect",
					style_id = "profile_button_background",
					texture_id = "profile_button_texture",
				},
				{
					pass_type = "texture",
					style_id = "profile_button_frame",
					texture_id = "button_frame",
				},
				{
					pass_type = "texture",
					style_id = "profile_button_hotspot",
					texture_id = "profile_button_texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_profile_button and 255 or 60
					end,
				},
				{
					content_id = "profile_button_hotspot",
					pass_type = "hotspot",
					style_id = "profile_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "profile_tooltip_text",
					content_check_function = function (content)
						return content.show_profile_button and content.profile_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "name",
					text_id = "name",
					content_check_function = function (content, style)
						if content.button_hotspot.is_selected or content.controller_button_hotspot.is_hover then
							style.text_color = style.hover_color
						else
							style.text_color = style.color
						end

						return true
					end,
				},
				{
					pass_type = "text",
					style_id = "name_shadow",
					text_id = "name",
				},
				{
					pass_type = "text",
					style_id = "hero",
					text_id = "hero",
					content_check_function = function (content, style)
						if content.button_hotspot.is_selected or content.controller_button_hotspot.is_hover then
							style.text_color = style.hover_color
						else
							style.text_color = style.color
						end

						return true
					end,
				},
				{
					pass_type = "text",
					style_id = "hero_shadow",
					text_id = "hero",
				},
				{
					pass_type = "rect",
					style_id = "hp_bar_bg",
				},
				{
					content_id = "hp_bar_fg_start",
					pass_type = "texture_uv",
					style_id = "hp_bar_fg_start",
				},
				{
					content_id = "hp_bar_fg_middle",
					pass_type = "texture_uv",
					style_id = "hp_bar_fg_middle",
				},
				{
					content_id = "hp_bar_fg_end",
					pass_type = "texture_uv",
					style_id = "hp_bar_fg_end",
				},
				{
					content_id = "health_bar",
					pass_type = "gradient_mask_texture",
					style_id = "health_bar",
					texture_id = "texture_id",
				},
				{
					content_id = "total_health_bar",
					pass_type = "gradient_mask_texture",
					style_id = "total_health_bar",
					texture_id = "texture_id",
				},
				{
					content_id = "ability_bar",
					pass_type = "texture_uv",
					style_id = "ability_bar",
					content_change_function = function (content, style)
						local ability_progress = content.bar_value
						local size = style.texture_size
						local uvs = content.uvs
						local bar_length = style.full_size[1]

						uvs[2][2] = ability_progress
						size[1] = bar_length * ability_progress
					end,
				},
				{
					content_id = "grimoire_bar",
					pass_type = "texture_uv",
					style_id = "grimoire_bar",
					content_change_function = function (content, style)
						style.texture_size[1] = 200 * style.grimoire_debuff
						content.uvs[1][1] = 1 - style.grimoire_debuff
					end,
				},
				{
					pass_type = "texture",
					style_id = "grimoire_debuff_divider",
					texture_id = "grimoire_debuff_divider",
					content_change_function = function (content, style)
						local grimoire_debuff = style.grimoire_debuff
						local offset = style.offset

						offset[1] = style.base_offset[1] - 200 * grimoire_debuff
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_melee",
					texture_id = "slot_melee",
					content_check_function = function (content)
						return content.slot_melee
					end,
				},
				{
					content_id = "slot_melee_hotspot",
					pass_type = "hotspot",
					style_id = "slot_melee",
					content_check_function = function (content)
						return content.parent.slot_melee
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_melee_frame",
					texture_id = "slot_melee_frame",
					content_check_function = function (content)
						return content.slot_melee
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_melee_rarity_texture",
					texture_id = "slot_melee_rarity_texture",
					content_check_function = function (content)
						return content.slot_melee
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ranged",
					texture_id = "slot_ranged",
					content_check_function = function (content)
						return content.slot_ranged
					end,
				},
				{
					content_id = "slot_ranged_hotspot",
					pass_type = "hotspot",
					style_id = "slot_ranged",
					content_check_function = function (content)
						return content.parent.slot_ranged
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ranged_frame",
					texture_id = "slot_ranged_frame",
					content_check_function = function (content)
						return content.slot_ranged
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ranged_rarity_texture",
					texture_id = "slot_ranged_rarity_texture",
					content_check_function = function (content)
						return content.slot_ranged
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_necklace",
					texture_id = "slot_necklace",
					content_check_function = function (content)
						return content.slot_necklace
					end,
				},
				{
					content_id = "slot_necklace_hotspot",
					pass_type = "hotspot",
					style_id = "slot_necklace",
					content_check_function = function (content)
						return content.parent.slot_necklace
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_necklace_frame",
					texture_id = "slot_necklace_frame",
					content_check_function = function (content)
						return content.slot_necklace
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_necklace_rarity_texture",
					texture_id = "slot_necklace_rarity_texture",
					content_check_function = function (content)
						return content.slot_necklace
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ring",
					texture_id = "slot_ring",
					content_check_function = function (content)
						return content.slot_ring
					end,
				},
				{
					content_id = "slot_ring_hotspot",
					pass_type = "hotspot",
					style_id = "slot_ring",
					content_check_function = function (content)
						return content.parent.slot_ring
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ring_frame",
					texture_id = "slot_ring_frame",
					content_check_function = function (content)
						return content.slot_ring
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ring_rarity_texture",
					texture_id = "slot_ring_rarity_texture",
					content_check_function = function (content)
						return content.slot_ring
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_trinket_1",
					texture_id = "slot_trinket_1",
					content_check_function = function (content)
						return content.slot_trinket_1
					end,
				},
				{
					content_id = "slot_trinket_1_hotspot",
					pass_type = "hotspot",
					style_id = "slot_trinket_1",
					content_check_function = function (content)
						return content.parent.slot_trinket_1
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_trinket_1_frame",
					texture_id = "slot_trinket_1_frame",
					content_check_function = function (content)
						return content.slot_trinket_1
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_trinket_1_rarity_texture",
					texture_id = "slot_trinket_1_rarity_texture",
					content_check_function = function (content)
						return content.slot_trinket_1
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_1_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_1.talent
					end,
				},
				{
					content_id = "talent_1",
					pass_type = "hotspot",
					style_id = "talent_1",
				},
				{
					content_id = "talent_1",
					pass_type = "texture",
					style_id = "talent_1",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_1",
					pass_type = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_2_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_2.talent
					end,
				},
				{
					content_id = "talent_2",
					pass_type = "hotspot",
					style_id = "talent_2",
				},
				{
					content_id = "talent_2",
					pass_type = "texture",
					style_id = "talent_2",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_2",
					pass_type = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_3_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_3.talent
					end,
				},
				{
					content_id = "talent_3",
					pass_type = "hotspot",
					style_id = "talent_3",
				},
				{
					content_id = "talent_3",
					pass_type = "texture",
					style_id = "talent_3",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_3",
					pass_type = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_4_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_4.talent
					end,
				},
				{
					content_id = "talent_4",
					pass_type = "hotspot",
					style_id = "talent_4",
				},
				{
					content_id = "talent_4",
					pass_type = "texture",
					style_id = "talent_4",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_4",
					pass_type = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_5_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_5.talent
					end,
				},
				{
					content_id = "talent_5",
					pass_type = "hotspot",
					style_id = "talent_5",
				},
				{
					content_id = "talent_5",
					pass_type = "texture",
					style_id = "talent_5",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_5",
					pass_type = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_6_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_6.talent
					end,
				},
				{
					content_id = "talent_6",
					pass_type = "hotspot",
					style_id = "talent_6",
				},
				{
					content_id = "talent_6",
					pass_type = "texture",
					style_id = "talent_6",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_6",
					pass_type = "talent_tooltip",
					scenegraph_id = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
			},
		},
		content = {
			build_private_text = "visibility_private",
			button_frame = "reward_pop_up_item_frame",
			chat_button_texture = "tab_menu_icon_02",
			chat_tooltip_text_mute = "input_description_mute_chat",
			chat_tooltip_text_unmute = "input_description_unmute_chat",
			disabled_texture = "tab_menu_icon_03",
			grimoire_debuff_divider = "hud_player_hp_bar_grim_divider",
			hero = "wh_captain",
			host_texture = "host_icon",
			hp_bar_bg = "hud_teammate_hp_bar_bg",
			kick_button_texture = "tab_menu_icon_04",
			kick_tooltip_text = "input_description_vote_kick_player",
			name = "n/a",
			ping_text = "150",
			ping_texture = "ping_icon_03",
			profile_button_texture = "tab_menu_icon_05",
			profile_tooltip_text = "input_description_show_profile",
			show_chat_button = false,
			show_kick_button = false,
			show_ping = false,
			show_profile_button = false,
			show_voice_button = false,
			slot_melee_frame = "reward_pop_up_item_frame",
			slot_melee_rarity_texture = "icon_bg_plentiful",
			slot_necklace_frame = "reward_pop_up_item_frame",
			slot_necklace_rarity_texture = "icon_bg_plentiful",
			slot_ranged_frame = "reward_pop_up_item_frame",
			slot_ranged_rarity_texture = "icon_bg_plentiful",
			slot_ring_frame = "reward_pop_up_item_frame",
			slot_ring_rarity_texture = "icon_bg_plentiful",
			slot_trinket_1_frame = "reward_pop_up_item_frame",
			slot_trinket_1_rarity_texture = "icon_bg_plentiful",
			talent_frame = "talent_frame",
			voice_button_texture = "tab_menu_icon_01",
			voice_tooltip_text_mute = "input_description_mute_voice",
			voice_tooltip_text_unmute = "input_description_unmute_voice",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						math.min((size[2] - 50) / background_texture_settings.size[2], 1),
					},
				},
				texture_id = background_texture,
			},
			button_hotspot = {
				allow_multi_hover = true,
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
						0,
					},
					{
						0.2,
						1,
					},
				},
			},
			hp_bar_fg_middle = {
				texture_id = "hud_teammate_hp_bar_frame",
				uvs = {
					{
						0.2,
						0,
					},
					{
						0.8,
						1,
					},
				},
			},
			hp_bar_fg_end = {
				texture_id = "hud_teammate_hp_bar_frame",
				uvs = {
					{
						0.8,
						0,
					},
					{
						1,
						1,
					},
				},
			},
			health_bar = {
				bar_value = 1,
				draw_health_bar = true,
				internal_bar_value = 0,
				texture_id = "teammate_hp_bar_color_tint_" .. math.min(index, 4),
			},
			total_health_bar = {
				bar_value = 1,
				draw_health_bar = true,
				internal_bar_value = 0,
				texture_id = "teammate_hp_bar_" .. math.min(index, 4),
			},
			grimoire_bar = {
				texture_id = "hud_panel_hp_bar_bg_grimoire",
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
			ability_bar = {
				bar_value = 1,
				texture_id = "hud_teammate_ability_bar_fill",
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
			slot_melee_hotspot = {},
			slot_ranged_hotspot = {},
			slot_necklace_hotspot = {},
			slot_ring_hotspot = {},
			slot_trinket_1_hotspot = {},
			talent_1 = {
				is_selected = true,
			},
			talent_2 = {
				is_selected = true,
			},
			talent_3 = {
				is_selected = true,
			},
			talent_4 = {
				is_selected = true,
			},
			talent_5 = {
				is_selected = true,
			},
			talent_6 = {
				is_selected = true,
			},
		},
		style = {
			slot_melee = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-215,
					-10,
					1,
				},
			},
			slot_melee_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-215,
					-10,
					2,
				},
			},
			slot_melee_rarity_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-215,
					-10,
					0,
				},
			},
			slot_ranged = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-165,
					-10,
					1,
				},
			},
			slot_ranged_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-165,
					-10,
					2,
				},
			},
			slot_ranged_rarity_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-165,
					-10,
					0,
				},
			},
			slot_necklace = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-115,
					-10,
					1,
				},
			},
			slot_necklace_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-115,
					-10,
					2,
				},
			},
			slot_necklace_rarity_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-115,
					-10,
					0,
				},
			},
			slot_ring = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-65,
					-10,
					1,
				},
			},
			slot_ring_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-65,
					-10,
					2,
				},
			},
			slot_ring_rarity_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-65,
					-10,
					0,
				},
			},
			slot_trinket_1 = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-15 + 0 * -50,
					-10,
					1,
				},
			},
			slot_trinket_1_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-15 + 0 * -50,
					-10,
					2,
				},
			},
			slot_trinket_1_rarity_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-15 + 0 * -50,
					-10,
					0,
				},
			},
			talent_tooltip = {
				draw_downwards = false,
			},
			talent_1 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-215,
					-60,
					0,
				},
			},
			talent_1_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-215,
					-60,
					1,
				},
			},
			talent_2 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-175,
					-60,
					0,
				},
			},
			talent_2_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-175,
					-60,
					1,
				},
			},
			talent_3 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-135,
					-60,
					0,
				},
			},
			talent_3_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-135,
					-60,
					1,
				},
			},
			talent_4 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-95,
					-60,
					0,
				},
			},
			talent_4_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-95,
					-60,
					1,
				},
			},
			talent_5 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-55,
					-60,
					0,
				},
			},
			talent_5_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-55,
					-60,
					1,
				},
			},
			talent_6 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-15 + 0 * -40,
					-60,
					0,
				},
			},
			talent_6_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-15 + 0 * -40,
					-60,
					1,
				},
			},
			health_bar = {
				gradient_threshold = 1,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					200,
					18,
				},
				color = {
					255,
					0,
					255,
					0,
				},
				offset = {
					150,
					-82,
					14,
				},
			},
			total_health_bar = {
				gradient_threshold = 1,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					200,
					18,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					150,
					-82,
					13,
				},
			},
			ability_bar = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				full_size = {
					194,
					10,
				},
				texture_size = {
					200,
					12,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					153,
					-100,
					13,
				},
			},
			grimoire_bar = {
				grimoire_debuff = 0,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					200,
					18,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-PLAYER_LIST_SIZE[1] + 150 + 200,
					-82,
					13,
				},
			},
			grimoire_debuff_divider = {
				grimoire_debuff = 0,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					5,
					18,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				base_offset = {
					-PLAYER_LIST_SIZE[1] + 150 + 200 + 1.5,
					-84,
					20,
				},
				offset = {
					-PLAYER_LIST_SIZE[1] + 150 + 200,
					-82,
					20,
				},
			},
			hp_bar_bg = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_tiling_size = {
					100,
					20,
				},
				texture_size = {
					200,
					30,
				},
				tile_offset = {
					true,
					false,
				},
				offset = {
					150,
					-82,
					10,
				},
				color = {
					255,
					30,
					30,
					30,
				},
			},
			hp_bar_fg_start = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					20,
					35,
				},
				offset = {
					150,
					-80,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			hp_bar_fg_middle = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					160,
					35,
				},
				offset = {
					170,
					-80,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			hp_bar_fg_end = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					20,
					35,
				},
				offset = {
					330,
					-80,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
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
					1,
				},
			},
			background = {
				size = {
					size[1],
					size[2],
				},
				color = {
					banner_color[1],
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			tooltip_text = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			profile_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-170,
					10,
					1,
				},
			},
			profile_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-170,
					10,
					3,
				},
			},
			profile_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-170,
					10,
					2,
				},
			},
			voice_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-120,
					10,
					3,
				},
			},
			voice_chat_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-120,
					10,
					6,
				},
			},
			voice_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-120,
					10,
					4,
				},
			},
			voice_button_disabled = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					0,
					0,
				},
				offset = {
					-120,
					10,
					5,
				},
			},
			chat_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-70,
					10,
					1,
				},
			},
			chat_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-70,
					10,
					6,
				},
			},
			chat_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-70,
					10,
					4,
				},
			},
			chat_button_disabled = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					0,
					0,
				},
				offset = {
					-70,
					10,
					5,
				},
			},
			kick_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-20 + 0 * -50,
					10,
					3,
				},
			},
			kick_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-20 + 0 * -50,
					10,
					6,
				},
			},
			kick_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-20 + 0 * -50,
					10,
					4,
				},
			},
			ping_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					54,
					50,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-210,
					5,
					5,
				},
			},
			ping_text = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "arial",
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				offset = {
					-255,
					13,
					3,
				},
				text_color = Colors.get_table("font_default"),
				high_ping_color = Colors.get_table("crimson"),
				medium_ping_color = Colors.get_table("gold"),
				low_ping_color = Colors.get_table("lime_green"),
			},
			build_private_text = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				offset = {
					200,
					-20,
					1,
				},
				text_color = {
					255,
					128,
					128,
					128,
				},
			},
			host_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-215,
					10,
					3,
				},
				texture_size = {
					40,
					40,
				},
			},
			name = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "arial",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				size = {
					210,
					30,
				},
				offset = {
					150,
					121,
					3,
				},
				color = Colors.get_table("font_default"),
				hover_color = Colors.get_table("font_default"),
				text_color = Colors.get_table("font_default"),
			},
			name_shadow = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "arial",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				size = {
					210,
					30,
				},
				offset = {
					152,
					119,
					2,
				},
				text_color = Colors.get_table("black"),
			},
			hero = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				size = {
					210,
					30,
				},
				offset = {
					150,
					90,
					3,
				},
				color = Colors.get_table("font_title"),
				hover_color = Colors.get_table("font_title"),
				text_color = Colors.get_table("font_title"),
			},
			hero_shadow = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				size = {
					210,
					30,
				},
				offset = {
					152,
					88,
					2,
				},
				text_color = Colors.get_table("black"),
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}

	return definition
end

local popup_buttons = {
	{
		availability_func = "kick_player_available",
		func_name = "kick_player",
		text = "player_list_kick_player",
	},
	{
		func_name = "popup_test_func",
		text = "player_list_mute_player",
	},
}
local popup_widget_definition = {
	scenegraph_id = "popup",
	element = {
		passes = {
			{
				content_id = "list_content",
				pass_type = "list_pass",
				style_id = "list_style",
				passes = {
					{
						content_id = "button_hotspot",
						pass_type = "hotspot",
						content_check_function = function (content, style)
							return content.button_hotspot.disable_button ~= true
						end,
					},
					{
						pass_type = "text",
						style_id = "button_text",
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
						end,
					},
				},
			},
		},
	},
	content = {
		list_content = {
			allow_multi_hover = true,
		},
	},
	style = {
		list_style = {
			num_draws = 0,
			start_index = 1,
			item_styles = {},
		},
	},
}
local popup_buttons_n = #popup_buttons

for i = 1, popup_buttons_n do
	local popup_button = popup_buttons[i]
	local content = {
		button_hotspot = {},
		button_text = popup_button.text,
		button_func_name = popup_button.func_name,
		button_availability_func_name = popup_button.availability_func,
	}
	local style = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		size = {
			POPUP_ELEMENT_SIZE[1],
			POPUP_ELEMENT_SIZE[2],
		},
		list_member_offset = {
			0,
			-POPUP_ELEMENT_SIZE[2],
			0,
		},
		button_text = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = true,
			base_color = Colors.get_table("dark_gray"),
			hover_color = Colors.get_table("white"),
			disabled_color = Colors.get_table("dim_gray"),
			text_color = Colors.get_table("dark_gray"),
		},
	}

	popup_widget_definition.content.list_content[i] = content
	popup_widget_definition.style.list_style.item_styles[i] = style
end

popup_widget_definition.style.list_style.num_draws = popup_buttons_n

local level_title_style = {
	dynamic_font_size = true,
	font_size = 32,
	font_type = "hell_shark_header",
	horizontal_alignment = "right",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		2,
	},
}
local difficulty_text_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		2,
	},
}
local player_career_name_style = {
	dynamic_font_size = true,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "bottom",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0,
	},
}
local player_hero_name_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0,
	},
}
local career_perks_title_style = {
	font_size = 18,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0,
	},
}
local right_banner_header = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0,
	},
}
local main_weave_objective_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		0,
	},
}
local right_banner_sub_header = {
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		0,
	},
}
local rewards_title = {
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	use_shadow = true,
	vertical_alignment = "top",
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		30,
		0,
	},
}
local career_perks_name_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	area_size = {
		260,
		100,
	},
	text_color = Colors.get_table("font_title"),
	offset = {
		0,
		0,
		0,
	},
}
local career_perks_description_style = {
	dynamic_font_size_word_wrap = true,
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	area_size = {
		300,
		100,
	},
	text_color = Colors.get_table("font_default"),
	offset = {
		0,
		0,
		0,
	},
}
local input_description_style = {
	font_size = 24,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	use_shadow = true,
	vertical_alignment = "center",
	text_color = Colors.get_table("white"),
	offset = {
		0,
		0,
		1,
	},
}
local mutator_pass_styles = {
	mutators = {
		text = {
			dynamic_font_size_word_wrap = true,
			font_size = 26,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			area_size = {
				540,
				100,
			},
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			line_colors = {
				Colors.get_color_table_with_alpha("font_title", 255),
				Colors.get_color_table_with_alpha("font_default", 255),
			},
		},
		text_shadow = {
			dynamic_font_size_word_wrap = true,
			font_size = 26,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			area_size = {
				540,
				100,
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				1,
				-1,
				-1,
			},
		},
	},
}
local static_widget_definitions = {
	banner_left = UIWidgets.create_simple_rect("banner_left", banner_color),
	banner_right = UIWidgets.create_simple_rect("banner_right", banner_color),
	banner_left_edge = create_vertical_edge_divider("banner_left", {
		5,
		scenegraph_definition.banner_left.size[2],
	}),
	banner_right_edge = create_vertical_edge_divider("banner_right", {
		5,
		scenegraph_definition.banner_right.size[2],
	}),
	player_name_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "player_name_divider"),
	mission_details_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "mission_details_divider"),
	mechanism_type_name = UIWidgets.create_simple_text(string.upper(Localize("not_assigned")), "mechanism_type_name", 22, nil, right_banner_header),
	mission_type_name = UIWidgets.create_simple_text(string.upper(Localize("not_assigned")), "mission_type_name", 22, nil, right_banner_sub_header),
	player_ability_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "player_ability_title", 22, nil, career_perks_title_style),
	player_passive_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "player_passive_title", 22, nil, career_perks_title_style),
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
		"mutators",
	}, nil, mutator_pass_styles),
	mutator_summary2 = UIWidgets.create_simple_item_presentation("mutator_summary2", {
		"mutators",
	}, nil, mutator_pass_styles),
	mutator_summary3 = UIWidgets.create_simple_item_presentation("mutator_summary3", {
		"mutators",
	}, nil, mutator_pass_styles),
	mutator_summary4 = UIWidgets.create_simple_item_presentation("mutator_summary4", {
		"mutators",
	}, nil, mutator_pass_styles),
	mutator_summary5 = UIWidgets.create_simple_item_presentation("mutator_summary5", {
		"mutators",
	}, nil, mutator_pass_styles),
	mutator_summary6 = UIWidgets.create_simple_item_presentation("mutator_summary6", {
		"mutators",
	}, nil, mutator_pass_styles),
}
local weave_objective_widgets = {
	weave_objective_header = UIWidgets.create_simple_text(Utf8.upper(Localize("menu_weave_play_objective_title")), "weave_objective_header", 22, nil, right_banner_header),
	weave_objective_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "weave_objective_divider"),
	main_objective_text = UIWidgets.create_simple_text(Localize("menu_weave_play_objective_sub_title"), "weave_main_objective", 22, nil, main_weave_objective_style),
}
local specific_widget_definitions = {
	reward_header = UIWidgets.create_simple_text(Localize("deed_reward_title"), "reward_divider", 22, nil, rewards_title),
	reward_divider = UIWidgets.create_simple_texture("divider_01_top", "reward_divider"),
	collectibles_name = UIWidgets.create_simple_text(Utf8.upper(Localize("collectibles_name")), "collectibles_name", 22, nil, right_banner_header),
	collectibles_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "collectibles_divider"),
	level_description = create_description_text("", "level_description"),
	input_description_text = UIWidgets.create_simple_text("player_list_show_mouse_description", "player_list_input_description", nil, nil, input_description_style),
	private_checkbox = UIWidgets.create_checkbox_widget("start_game_window_private_game", "", "private_checkbox", private_checkbox_offset, nil),
}
local disable_unsupported = true

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
	item_tooltip = UIWidgets.create_simple_item_presentation("item_tooltip", UISettings.console_tooltip_pass_definitions, nil, nil, disable_unsupported),
}
