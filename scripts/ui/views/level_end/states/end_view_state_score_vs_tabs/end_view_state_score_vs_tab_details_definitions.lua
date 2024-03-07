-- chunkname: @scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_details_definitions.lua

local cell_height = 40
local section_size = 450
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.end_screen,
		},
		size = {
			1920,
			1080,
		},
	},
	panel = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			10,
		},
		size = {
			1800,
			1080,
		},
	},
	local_team_anchor = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		position = {
			280,
			-323,
			10,
		},
		size = {
			370,
			cell_height * 2,
		},
	},
	local_heroes_score_title = {
		horizontal_alignment = "left",
		parent = "local_team_anchor",
		vertical_alignment = "top",
		position = {
			390,
			0,
			10,
		},
		size = {
			section_size,
			cell_height * 2,
		},
	},
	local_pactsworn_score_title = {
		horizontal_alignment = "left",
		parent = "local_heroes_score_title",
		vertical_alignment = "top",
		position = {
			section_size + 20,
			0,
			10,
		},
		size = {
			section_size,
			cell_height * 2,
		},
	},
	local_pactsworn_score_edge = {
		horizontal_alignment = "left",
		parent = "local_pactsworn_score_title",
		vertical_alignment = "top",
		position = {
			section_size,
			0,
			10,
		},
		size = {
			200,
			cell_height * 2,
		},
	},
	local_flag = {
		horizontal_alignment = "left",
		parent = "local_team_anchor",
		vertical_alignment = "top",
		position = {
			-140,
			5,
			100,
		},
		size = {
			232,
			196,
		},
	},
	local_winner_icon = {
		horizontal_alignment = "left",
		parent = "local_flag",
		vertical_alignment = "top",
		position = {
			-20,
			90,
			10,
		},
		size = {
			140,
			140,
		},
	},
	local_names_anchor = {
		horizontal_alignment = "left",
		parent = "local_team_anchor",
		vertical_alignment = "top",
		position = {
			100,
			-80,
			10,
		},
		size = {
			270,
			cell_height,
		},
	},
	local_anchor = {
		horizontal_alignment = "left",
		parent = "local_names_anchor",
		vertical_alignment = "top",
		position = {
			290,
			0,
			10,
		},
		size = {
			section_size,
			cell_height,
		},
	},
	local_pact_anchor = {
		horizontal_alignment = "left",
		parent = "local_anchor",
		vertical_alignment = "top",
		position = {
			section_size + 20,
			0,
			0,
		},
		size = {
			section_size,
			cell_height,
		},
	},
	local_color_edge = {
		horizontal_alignment = "left",
		parent = "local_anchor",
		vertical_alignment = "top",
		position = {
			-2,
			0,
			5,
		},
		size = {
			4,
			cell_height * 5,
		},
	},
	local_score_bg = {
		horizontal_alignment = "left",
		parent = "local_anchor",
		vertical_alignment = "top",
		position = {
			-76,
			0,
			-1,
		},
		size = {
			76,
			54,
		},
	},
	local_score_bg_top = {
		horizontal_alignment = "left",
		parent = "local_score_bg",
		vertical_alignment = "top",
		position = {
			0,
			0,
			-1,
		},
		size = {
			76,
			20,
		},
	},
	local_score_bg_edge = {
		horizontal_alignment = "left",
		parent = "local_anchor",
		vertical_alignment = "top",
		position = {
			-20,
			0,
			-1,
		},
		size = {
			20,
			54,
		},
	},
	local_title = {
		horizontal_alignment = "left",
		parent = "local_team_anchor",
		vertical_alignment = "bottom",
		position = {
			100,
			0,
			1,
		},
		size = {
			270,
			cell_height * 2,
		},
	},
	local_names_grid = {
		horizontal_alignment = "left",
		parent = "local_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			section_size,
			cell_height * 5,
		},
	},
	local_heroes_grid = {
		horizontal_alignment = "right",
		parent = "local_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height * 6,
		},
	},
	local_heroes_score_grid = {
		horizontal_alignment = "right",
		parent = "local_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height * 5,
		},
	},
	local_heroes_header_grid = {
		horizontal_alignment = "right",
		parent = "local_heroes_score_title",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height,
		},
	},
	local_pact_grid = {
		horizontal_alignment = "right",
		parent = "local_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height * 6,
		},
	},
	local_pact_score_grid = {
		horizontal_alignment = "right",
		parent = "local_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height * 5,
		},
	},
	local_pact_header_grid = {
		horizontal_alignment = "left",
		parent = "local_pactsworn_score_title",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height,
		},
	},
	opponent_team_anchor = {
		horizontal_alignment = "left",
		parent = "panel",
		vertical_alignment = "top",
		position = {
			280,
			-323,
			10,
		},
		size = {
			370,
			cell_height * 2,
		},
	},
	opponent_heroes_score_title = {
		horizontal_alignment = "left",
		parent = "opponent_team_anchor",
		vertical_alignment = "top",
		position = {
			390,
			0,
			10,
		},
		size = {
			section_size,
			cell_height * 2,
		},
	},
	opponent_pactsworn_score_title = {
		horizontal_alignment = "left",
		parent = "opponent_heroes_score_title",
		vertical_alignment = "top",
		position = {
			section_size + 20,
			0,
			10,
		},
		size = {
			section_size,
			cell_height * 2,
		},
	},
	opponent_pactsworn_score_edge = {
		horizontal_alignment = "left",
		parent = "opponent_pactsworn_score_title",
		vertical_alignment = "top",
		position = {
			section_size,
			0,
			10,
		},
		size = {
			200,
			cell_height * 2,
		},
	},
	opponent_flag = {
		horizontal_alignment = "left",
		parent = "opponent_team_anchor",
		vertical_alignment = "top",
		position = {
			-140,
			5,
			100,
		},
		size = {
			232,
			196,
		},
	},
	opponent_winner_icon = {
		horizontal_alignment = "left",
		parent = "opponent_flag",
		vertical_alignment = "top",
		position = {
			-20,
			90,
			10,
		},
		size = {
			140,
			140,
		},
	},
	opponent_names_anchor = {
		horizontal_alignment = "left",
		parent = "opponent_team_anchor",
		vertical_alignment = "top",
		position = {
			100,
			-80,
			10,
		},
		size = {
			270,
			cell_height,
		},
	},
	opponent_anchor = {
		horizontal_alignment = "left",
		parent = "opponent_names_anchor",
		vertical_alignment = "top",
		position = {
			290,
			0,
			10,
		},
		size = {
			section_size,
			cell_height,
		},
	},
	opponent_pact_anchor = {
		horizontal_alignment = "left",
		parent = "opponent_anchor",
		vertical_alignment = "top",
		position = {
			section_size + 20,
			0,
			0,
		},
		size = {
			section_size,
			cell_height,
		},
	},
	opponent_color_edge = {
		horizontal_alignment = "left",
		parent = "opponent_anchor",
		vertical_alignment = "top",
		position = {
			-2,
			0,
			5,
		},
		size = {
			4,
			cell_height * 5,
		},
	},
	opponent_score_bg = {
		horizontal_alignment = "left",
		parent = "opponent_anchor",
		vertical_alignment = "top",
		position = {
			-76,
			0,
			-1,
		},
		size = {
			76,
			54,
		},
	},
	opponent_score_bg_top = {
		horizontal_alignment = "left",
		parent = "opponent_score_bg",
		vertical_alignment = "top",
		position = {
			0,
			0,
			-1,
		},
		size = {
			76,
			20,
		},
	},
	opponent_score_bg_edge = {
		horizontal_alignment = "left",
		parent = "opponent_anchor",
		vertical_alignment = "top",
		position = {
			-20,
			0,
			-1,
		},
		size = {
			20,
			54,
		},
	},
	opponent_title = {
		horizontal_alignment = "left",
		parent = "opponent_team_anchor",
		vertical_alignment = "bottom",
		position = {
			100,
			0,
			1,
		},
		size = {
			270,
			cell_height * 2,
		},
	},
	opponent_names_grid = {
		horizontal_alignment = "left",
		parent = "opponent_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			section_size,
			cell_height * 5,
		},
	},
	opponent_heroes_grid = {
		horizontal_alignment = "right",
		parent = "opponent_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height * 6,
		},
	},
	opponent_heroes_score_grid = {
		horizontal_alignment = "right",
		parent = "opponent_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height * 5,
		},
	},
	opponent_pact_grid = {
		horizontal_alignment = "right",
		parent = "opponent_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height * 6,
		},
	},
	opponent_pact_score_grid = {
		horizontal_alignment = "right",
		parent = "opponent_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			section_size,
			cell_height * 5,
		},
	},
	heroes_header_bg = {
		horizontal_alignment = "right",
		parent = "local_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			0,
		},
		size = {
			section_size,
			cell_height,
		},
	},
	pact_header_bg = {
		horizontal_alignment = "right",
		parent = "local_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			0,
		},
		size = {
			section_size,
			cell_height,
		},
	},
}
local header_bg_color = {
	255,
	24,
	24,
	24,
}
local selected_color = {
	255,
	226,
	220,
	209,
}
local local_team_color = Colors.get_color_table_with_alpha("local_player_team", 255)
local local_team_color_light = Colors.get_color_table_with_alpha("local_player_team_lighter", 255)
local local_team_color_dark = Colors.get_color_table_with_alpha("local_player_team_darker", 255)
local opponent_team_color = Colors.get_color_table_with_alpha("opponent_team", 255)
local opponent_team_color_light = Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
local opponent_team_color_dark = Colors.get_color_table_with_alpha("opponent_team_darkened", 255)
local local_even_field_color = Colors.get_table("local_scoreboard_entry_dark")
local local_uneven_field_color = Colors.get_table("local_scoreboard_entry")
local opponent_even_field_color = Colors.get_table("opponent_scoreboard_entry_dark")
local opponent_uneven_field_color = Colors.get_table("opponent_scoreboard_entry")

local function create_grid(scenegraph_id, num_rows, num_columns, line_width, color)
	local color = color or {
		255,
		10,
		10,
		10,
	}
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = scenegraph_data.size

	size[2] = num_rows * cell_height

	local widget = {
		element = {
			passes = {},
		},
		content = {},
		style = {},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
	local element = widget.element
	local passes = element.passes
	local content = widget.content
	local style = widget.style

	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = "left_border",
	}
	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = "right_border",
	}
	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = "top_border",
	}
	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = "bottom_border",
	}
	style.left_border = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			line_width,
			size[2],
		},
		color = color,
	}
	style.right_border = {
		horizontal_alignment = "right",
		vertical_alignment = "top",
		texture_size = {
			line_width,
			size[2],
		},
		color = color,
	}
	style.top_border = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			size[1],
			line_width,
		},
		color = color,
	}
	style.bottom_border = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			size[1],
			-line_width,
		},
		color = color,
		offset = {
			0,
			-size[2],
			0,
		},
	}

	local offset_y = size[2] / num_rows

	for i = 1, num_rows - 1 do
		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = "row_edge_" .. i,
		}
		style["row_edge_" .. i] = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				size[1],
				line_width,
			},
			offset = {
				0,
				-offset_y * i + line_width * 0.5,
				0,
			},
			color = color,
		}
	end

	local offset_x = size[1] / num_columns

	for i = 1, num_columns - 1 do
		passes[#passes + 1] = {
			pass_type = "rect",
			style_id = "column_edge_" .. i,
		}
		style["column_edge_" .. i] = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				line_width,
				size[2],
			},
			offset = {
				offset_x * i,
				0,
				0,
			},
			color = color,
		}
	end

	return widget
end

local team_score_style = {
	dynamic_font_size = false,
	font_size = 24,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		-2,
		10,
	},
}
local score_style = {
	dynamic_font_size = true,
	font_size = 20,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = selected_color,
	offset = {
		0,
		-2,
		1,
	},
	size = {
		0,
		0,
	},
}
local title_style = {
	dynamic_font_size = true,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	upper_case = false,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		-2,
		1,
	},
	size = {
		0,
		0,
	},
}
local team_title_style = {
	dynamic_font_size = true,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = true,
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		12,
		-12,
		1,
	},
	size = {
		0,
		0,
	},
}
local team_type_style = {
	dynamic_font_size = true,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = true,
	upper_case = false,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = selected_color,
	offset = {
		12,
		18,
		1,
	},
	size = {
		0,
		0,
	},
}
local side_title_style = {
	dynamic_font_size = true,
	font_size = 20,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = true,
	upper_case = true,
	vertical_alignment = "center",
	word_wrap = false,
	text_color = selected_color,
	offset = {
		0,
		-2,
		1,
	},
	size = {
		0,
		0,
	},
}

local function create_side_title(scenegraph_id, text, color)
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = table.clone(scenegraph_data.size)
	local internal_title_style = table.clone(side_title_style)

	internal_title_style.text_color = color
	internal_title_style.size = size

	local widget = {
		element = {
			passes = {},
		},
		content = {},
		style = {},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			27,
			0,
		},
	}
	local element = widget.element
	local passes = element.passes
	local content = widget.content
	local style = widget.style

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "title",
		text_id = "title",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "title_shadow",
		text_id = "title",
	}
	content.title = tostring(text)
	style.title = internal_title_style
	style.title_shadow = table.clone(internal_title_style)
	style.title_shadow.text_color = {
		255,
		0,
		0,
		0,
	}
	style.title_shadow.offset = {
		2,
		-3,
		-1,
	}
	style.underline = {
		horizontal_alignment = "center",
		vertical_alignment = "bottom",
		color = color,
		texture_size = {
			size[1],
			4,
		},
	}
	content.gradient = {
		texture_id = "vertical_gradient",
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
	}
	style.left_gradient = {
		horizontal_alignment = "left",
		vertical_alignment = "bottom",
		color = color,
		texture_size = {
			4,
			8,
		},
		offset = {
			0,
			-8,
			0,
		},
	}
	style.right_gradient = {
		horizontal_alignment = "right",
		vertical_alignment = "bottom",
		color = color,
		texture_size = {
			4,
			10,
		},
		offset = {
			0,
			-10,
			0,
		},
	}

	return widget
end

local function create_stats(scenegraph_id, fields, optional_font_size, offset, is_me, skip_highscores, highscores, optional_team)
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = scenegraph_data.size
	local padding = 12
	local cell_size = {
		size[1] / #fields,
		size[2],
	}
	local internal_score_style = table.clone(score_style)

	internal_score_style.font_size = optional_font_size or internal_score_style.font_size
	internal_score_style.text_color = is_me and {
		255,
		177,
		144,
		31,
	} or internal_score_style.text_color

	if optional_team then
		internal_score_style.text_color = optional_team == "local_team" and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
	end

	local widget = {
		element = {
			passes = {},
		},
		content = {},
		style = {},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			0,
		},
	}
	local element = widget.element
	local passes = element.passes
	local content = widget.content
	local style = widget.style

	for i = 1, #fields do
		local id = "stat_" .. i

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = id,
			style_id = id,
		}

		if not skip_highscores then
			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = "highscore_marker",
				style_id = id .. "_highscore_marker",
				content_check_function = function (content, style)
					return content[id .. "_is_highscore"]
				end,
			}
			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = "highscore_marker",
				style_id = id .. "_highscore_marker_shadow",
				content_check_function = function (content, style)
					return content[id .. "_is_highscore"]
				end,
			}
		end

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = id,
			style_id = id .. "_shadow",
		}

		local value = fields[i]

		if type(value) == "number" then
			value = math.round(value)
		end

		content[id] = tostring(value)
		content.highscore_marker = "scoreboard_marker"
		content.offset = offset
		content[id .. "_is_highscore"] = not skip_highscores and highscores and highscores[i] == value and value > 0 or false
		style[id] = table.clone(internal_score_style)
		style[id].offset[1] = (i - 1) * cell_size[1] + padding
		style[id].size = {
			cell_size[1] - padding * 2,
			cell_size[2],
		}
		style[id .. "_shadow"] = table.clone(internal_score_style)
		style[id .. "_shadow"].offset = {
			(i - 1) * cell_size[1] + 2 + padding,
			-3,
			-1,
		}
		style[id .. "_shadow"].size = {
			cell_size[1] - padding * 2,
			cell_size[2],
		}
		style[id .. "_shadow"].text_color = {
			255,
			0,
			0,
			0,
		}
		style[id .. "_highscore_marker"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				71,
				39,
			},
			offset = {
				(i - 1) * cell_size[1],
				0,
				5,
			},
			size = {
				cell_size[1],
				cell_size[2],
			},
		}
		style[id .. "_highscore_marker_shadow"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				71,
				39,
			},
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				(i - 1) * cell_size[1] + 1,
				-1,
				4,
			},
			size = {
				cell_size[1],
				cell_size[2],
			},
		}
	end

	return widget
end

local function create_title(scenegraph_id, title, optional_font_size, offset, is_me, team)
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = table.clone(scenegraph_data.size)

	size[1] = 170

	local team_color = selected_color
	local internal_title_style = table.clone(title_style)

	internal_title_style.font_size = optional_font_size or internal_title_style.font_size
	internal_title_style.text_color = is_me and {
		255,
		177,
		144,
		31,
	} or team_color
	internal_title_style.size = size

	local widget = {
		element = {
			passes = {},
		},
		content = {},
		style = {},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			0,
		},
	}
	local element = widget.element
	local passes = element.passes
	local content = widget.content
	local style = widget.style

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "title",
		text_id = "title",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "title_shadow",
		text_id = "title",
	}
	content.title = tostring(title)
	style.title = internal_title_style
	style.title_shadow = table.clone(internal_title_style)
	style.title_shadow.text_color = {
		255,
		0,
		0,
		0,
	}
	style.title_shadow.offset = {
		2,
		-3,
		-1,
	}

	return widget
end

local function create_team_title(team, local_team_name, opponent_team_name)
	local is_local_team = team == "local_team"
	local scenegraph_id = is_local_team and "local_title" or "opponent_title"
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = table.clone(scenegraph_data.size)
	local team_name = is_local_team and local_team_name or opponent_team_name
	local team_settings = UISettings.teams_ui_assets[team_name]
	local team_color = is_local_team and local_team_color or opponent_team_color
	local team_color_light = is_local_team and local_team_color_light or opponent_team_color_light
	local team_color_dark = is_local_team and local_team_color_dark or opponent_team_color_dark
	local title_color = is_local_team and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
	local internal_title_style = table.clone(team_title_style)

	internal_title_style.size = size
	internal_title_style.text_color = title_color

	local widget = {
		element = {
			passes = {},
		},
		content = {},
		style = {},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
	local element = widget.element
	local passes = element.passes
	local content = widget.content
	local style = widget.style

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "title",
		text_id = "title",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "title_shadow",
		text_id = "title",
	}
	content.title = team_settings.display_name
	style.title = internal_title_style
	style.title_shadow = table.clone(internal_title_style)
	style.title_shadow.text_color = {
		255,
		0,
		0,
		0,
	}
	style.title_shadow.offset[1] = style.title_shadow.offset[1] + 2
	style.title_shadow.offset[2] = style.title_shadow.offset[2] - 2
	style.title_shadow.offset[3] = style.title_shadow.offset[3] - 1
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "team_type",
		text_id = "team_type",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "team_type_shadow",
		text_id = "team_type",
	}
	content.team_type = is_local_team and "vs_lobby_your_team" or "vs_lobby_enemy_team"

	local internal_type_style = table.clone(team_type_style)

	internal_type_style.size = size
	style.team_type = internal_type_style
	style.team_type_shadow = table.clone(internal_type_style)
	style.team_type_shadow.text_color = {
		255,
		0,
		0,
		0,
	}
	style.team_type_shadow.offset[1] = style.team_type_shadow.offset[1] + 2
	style.team_type_shadow.offset[2] = style.team_type_shadow.offset[2] - 2
	style.team_type_shadow.offset[3] = style.team_type_shadow.offset[3] - 1

	return widget
end

local widget_definitions = {
	background = UIWidgets.create_simple_rect("screen", {
		128,
		0,
		0,
		0,
	}),
	heroes_side_title = create_side_title("local_heroes_header_grid", "vs_as_heroes", selected_color),
	pactsworn_side_title = create_side_title("local_pact_header_grid", "vs_as_pactsworn", selected_color),
	local_gradient = UIWidgets.create_simple_uv_texture("horizontal_gradient", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "local_pactsworn_score_edge", nil, nil, {
		200,
		0,
		0,
		0,
	}),
	opponent_gradient = UIWidgets.create_simple_uv_texture("horizontal_gradient", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "opponent_pactsworn_score_edge", nil, nil, {
		200,
		0,
		0,
		0,
	}),
}

local function create_winner_icon(winning_team)
	local scenegraph_id = winning_team == "local_team" and "local_winner_icon" or "opponent_winner_icon"

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
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
			},
		},
		content = {
			text_id = "WINNER",
			texture_id = "winner_icon",
		},
		style = {
			texture_id = {
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
			},
			text = {
				dynamic_font_size = false,
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				vertical_alignment = "right",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("local_player_picking", 255),
				offset = {
					90,
					46,
					1,
				},
			},
			text_shadow = {
				dynamic_font_size = false,
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				vertical_alignment = "right",
				word_wrap = false,
				text_color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					92,
					44,
					0,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_flag(team, local_team_name, opponent_team_name)
	local texture_name = "icons_placeholder"
	local scenegraph_id = ""

	if team == "local_team" then
		local team_settings = UISettings.teams_ui_assets[local_team_name]

		texture_name = team_settings.local_flag_texture or texture_name
		scenegraph_id = "local_flag"
	else
		local team_settings = UISettings.teams_ui_assets[opponent_team_name]

		texture_name = team_settings.opponent_flag_texture or texture_name
		scenegraph_id = "opponent_flag"
	end

	return UIWidgets.create_simple_texture(texture_name, scenegraph_id)
end

local function create_edge(scenegraph_id, color, size_y)
	local size = scenegraph_definition[scenegraph_id].size

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "rect",
				},
			},
		},
		content = {},
		style = {
			rect = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = color or {
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
				texture_size = {
					size[1],
					size_y,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_fields(anchor, num_fields, base_name, widgets, even_field_color, uneven_field_color)
	local field_size = scenegraph_definition[anchor].size

	for i = 1, num_fields do
		local offset = {
			0,
			(i - 1) * -field_size[2],
		}
		local color = i % 2 == 0 and even_field_color or uneven_field_color or {
			128,
			0,
			0,
			0,
		}

		widgets[base_name .. "_" .. i] = UIWidgets.create_simple_rect(anchor, color, nil, offset)
	end
end

local function create_team_grid_fields(team, num_fields, ui_scenegraph)
	local widgets = {}

	if team == "local_team" then
		create_fields("local_team_anchor", 1, "local_team", widgets)
		create_fields("local_heroes_score_title", 1, "local_team_heroes", widgets)
		create_fields("local_pactsworn_score_title", 1, "local_team_pactsworn", widgets)
		create_fields("local_names_anchor", num_fields, "local_names", widgets, local_even_field_color, local_uneven_field_color)
		create_fields("local_anchor", num_fields, "local_heroes", widgets, local_even_field_color, local_uneven_field_color)
		create_fields("local_pact_anchor", num_fields, "local_pact", widgets, local_even_field_color, local_uneven_field_color)

		ui_scenegraph.opponent_team_anchor.local_position[2] = scenegraph_definition.local_team_anchor.position[2] - 5 * cell_height - scenegraph_definition.local_team_anchor.size[2]
	else
		create_fields("opponent_team_anchor", 1, "opponent_team", widgets)
		create_fields("opponent_heroes_score_title", 1, "opponent_team_heroes", widgets)
		create_fields("opponent_pactsworn_score_title", 1, "opponent_team_pactsworn", widgets)
		create_fields("opponent_names_anchor", num_fields, "opponent_names", widgets, opponent_even_field_color, opponent_uneven_field_color)
		create_fields("opponent_anchor", num_fields, "opponent_heroes", widgets, opponent_even_field_color, opponent_uneven_field_color)
		create_fields("opponent_pact_anchor", num_fields, "opponent_pact", widgets, opponent_even_field_color, opponent_uneven_field_color)
	end

	return widgets
end

local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions,
	create_stats_func = create_stats,
	create_title_func = create_title,
	create_team_grid_fields_func = create_team_grid_fields,
	create_team_title_func = create_team_title,
	create_flag_func = create_flag,
	create_winner_icon_func = create_winner_icon,
}
