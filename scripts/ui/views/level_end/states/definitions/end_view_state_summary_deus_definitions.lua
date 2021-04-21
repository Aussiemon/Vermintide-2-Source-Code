local definitions = local_require("scripts/ui/views/level_end/states/definitions/end_view_state_summary_definitions")
definitions = table.clone(definitions)
local summary_total = definitions.scenegraph_definition.summary_entry_total_title
summary_total.position[2] = summary_total.position[2] + 60
definitions.scenegraph_definition.coins_retained = {
	vertical_alignment = "center",
	parent = "background",
	horizontal_alignment = "center",
	size = {
		820,
		40
	},
	position = {
		0,
		-240,
		1
	}
}
definitions.scenegraph_definition.deus_progress_reset_text = {
	vertical_alignment = "bottom",
	parent = "background",
	horizontal_alignment = "center",
	size = {
		820,
		40
	},
	position = {
		0,
		20,
		2
	}
}
local coins_retained_title_text_style = {
	font_size = 28,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local coins_retained_title_description_style = {
	font_size = 16,
	upper_case = true,
	word_wrap = true,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = {
		255,
		120,
		120,
		120
	},
	offset = {
		0,
		-24,
		2
	}
}

local function create_coin_total_widget(scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "coin_total_container",
					pass_type = "auto_layout",
					sub_passes = {
						{
							pass_type = "texture",
							style_id = "deus_coin_icon",
							texture_id = "deus_coin_icon_id"
						},
						{
							style_id = "coin_total_text_container",
							pass_type = "auto_layout",
							sub_passes = {
								{
									style_id = "coin_count_text",
									pass_type = "text",
									text_id = "coin_count_text"
								},
								{
									style_id = "coin_count_shadow",
									pass_type = "text",
									text_id = "coin_count_text"
								}
							}
						}
					}
				}
			}
		},
		content = {
			coin_count_text = "999",
			deus_coin_icon_id = "deus_icons_coin"
		},
		style = {
			coin_total_container = {
				vertical_alignment = "center",
				layout_delta_y = 0,
				layout_delta_x = 1,
				horizontal_alignment = "right",
				offset = {
					0,
					0,
					0
				},
				deus_coin_icon = {
					vertical_alignment = "center",
					horizontal_alignment = "center",
					texture_size = {
						28,
						28
					},
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						-5,
						-2,
						10
					},
					size = {
						32,
						28
					}
				},
				coin_total_text_container = {
					vertical_alignment = "center",
					layout_delta_y = 0,
					layout_delta_x = 0,
					dynamic_size = true,
					horizontal_alignment = "center",
					offset = {
						0,
						0,
						0
					},
					coin_count_text = {
						word_wrap = false,
						upper_case = false,
						localize = false,
						font_size = 28,
						horizontal_alignment = "center",
						vertical_alignment = "center",
						dynamic_size = true,
						font_type = "hell_shark_header",
						text_color = Colors.get_color_table_with_alpha("font_default", 255),
						offset = {
							0,
							0,
							1
						}
					},
					coin_count_shadow = {
						word_wrap = false,
						upper_case = false,
						localize = false,
						font_size = 28,
						horizontal_alignment = "center",
						vertical_alignment = "center",
						dynamic_size = true,
						font_type = "hell_shark_header",
						text_color = {
							255,
							0,
							0,
							0
						},
						offset = {
							2,
							2,
							0
						}
					}
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local deus_progress_reset_text_style = {
	word_wrap = true,
	upper_case = true,
	localize = false,
	use_shadow = true,
	font_size = 20,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		10
	}
}
definitions.widgets.coins_retained_title_text = UIWidgets.create_simple_text(Localize("end_screen_deus_coins_retained"), "coins_retained", nil, nil, coins_retained_title_text_style)
definitions.widgets.coins_retained_description_text = UIWidgets.create_simple_text(Localize("end_screen_deus_coins_retained_description"), "coins_retained", nil, nil, coins_retained_title_description_style)
definitions.widgets.coins_retained_total_text = create_coin_total_widget("coins_retained")
definitions.widgets.deus_progress_reset_text = UIWidgets.create_simple_text(Localize("deus_progress_reset"), "deus_progress_reset_text", nil, nil, deus_progress_reset_text_style)

return definitions
