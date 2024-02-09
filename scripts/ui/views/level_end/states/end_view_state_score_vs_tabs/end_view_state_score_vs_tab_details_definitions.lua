-- chunkname: @scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_details_definitions.lua

local cell_height = 40
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
			920,
		},
	},
	hammers_anchor = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "top",
		position = {
			-174,
			-303,
			10,
		},
		size = {
			580,
			cell_height,
		},
	},
	hammers_pact_anchor = {
		horizontal_alignment = "left",
		parent = "hammers_anchor",
		vertical_alignment = "top",
		position = {
			595,
			0,
			0,
		},
		size = {
			372,
			cell_height,
		},
	},
	hammers_color_edge = {
		horizontal_alignment = "left",
		parent = "hammers_anchor",
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
	hammers_score_bg = {
		horizontal_alignment = "left",
		parent = "hammers_anchor",
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
	hammers_score_bg_top = {
		horizontal_alignment = "left",
		parent = "hammers_score_bg",
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
	hammers_score_bg_edge = {
		horizontal_alignment = "left",
		parent = "hammers_anchor",
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
	hammers_title = {
		horizontal_alignment = "left",
		parent = "hammers_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			199,
			cell_height,
		},
	},
	hammers_names_grid = {
		horizontal_alignment = "left",
		parent = "hammers_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			199,
			cell_height * 5,
		},
	},
	hammers_heroes_grid = {
		horizontal_alignment = "right",
		parent = "hammers_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			383,
			cell_height * 6,
		},
	},
	hammers_heroes_score_grid = {
		horizontal_alignment = "right",
		parent = "hammers_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			383,
			cell_height * 5,
		},
	},
	hammers_heroes_header_grid = {
		horizontal_alignment = "right",
		parent = "hammers_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			383,
			cell_height,
		},
	},
	hammers_pact_grid = {
		horizontal_alignment = "right",
		parent = "hammers_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			372,
			cell_height * 6,
		},
	},
	hammers_pact_score_grid = {
		horizontal_alignment = "right",
		parent = "hammers_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			372,
			cell_height * 5,
		},
	},
	hammers_pact_header_grid = {
		horizontal_alignment = "right",
		parent = "hammers_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			372,
			cell_height,
		},
	},
	skulls_anchor = {
		horizontal_alignment = "left",
		parent = "hammers_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			0,
		},
		size = {
			580,
			cell_height,
		},
	},
	skulls_pact_anchor = {
		horizontal_alignment = "left",
		parent = "skulls_anchor",
		vertical_alignment = "top",
		position = {
			595,
			0,
			0,
		},
		size = {
			372,
			cell_height,
		},
	},
	skulls_color_edge = {
		horizontal_alignment = "left",
		parent = "skulls_anchor",
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
	skulls_score_bg = {
		horizontal_alignment = "left",
		parent = "skulls_anchor",
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
	skulls_score_bg_top = {
		horizontal_alignment = "left",
		parent = "skulls_score_bg",
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
	skulls_score_bg_edge = {
		horizontal_alignment = "left",
		parent = "skulls_anchor",
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
	skulls_title = {
		horizontal_alignment = "left",
		parent = "skulls_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			199,
			cell_height,
		},
	},
	skulls_names_grid = {
		horizontal_alignment = "left",
		parent = "skulls_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			199,
			cell_height * 5,
		},
	},
	skulls_heroes_grid = {
		horizontal_alignment = "right",
		parent = "skulls_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			383,
			cell_height * 5,
		},
	},
	skulls_heroes_score_grid = {
		horizontal_alignment = "right",
		parent = "skulls_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			383,
			cell_height * 5,
		},
	},
	skulls_pact_grid = {
		horizontal_alignment = "right",
		parent = "skulls_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			372,
			cell_height * 5,
		},
	},
	skulls_pact_score_grid = {
		horizontal_alignment = "right",
		parent = "skulls_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			1,
		},
		size = {
			372,
			cell_height * 5,
		},
	},
	heroes_header_bg = {
		horizontal_alignment = "right",
		parent = "hammers_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			0,
		},
		size = {
			383,
			cell_height,
		},
	},
	pact_header_bg = {
		horizontal_alignment = "right",
		parent = "hammers_pact_anchor",
		vertical_alignment = "top",
		position = {
			0,
			cell_height,
			0,
		},
		size = {
			372,
			cell_height,
		},
	},
}
local uneven_field_color = {
	255,
	13,
	13,
	13,
}
local even_field_color = {
	255,
	46,
	46,
	46,
}
local header_bg_color = {
	255,
	24,
	24,
	24,
}
local hammers_team_color = Colors.get_color_table_with_alpha("local_player_team", 255)
local hammers_team_color_light = Colors.get_color_table_with_alpha("local_player_team_lighter", 255)
local hammers_team_color_dark = Colors.get_color_table_with_alpha("local_player_team_darker", 255)
local skulls_team_color = Colors.get_color_table_with_alpha("opponent_team", 255)
local skulls_team_color_light = Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
local skulls_team_color_dark = Colors.get_color_table_with_alpha("opponent_team_darkened", 255)

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
	font_size = 40,
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
	upper_case = true,
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
local title_style = {
	dynamic_font_size = true,
	font_size = 22,
	font_type = "hell_shark",
	horizontal_alignment = "left",
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
	font_size = 35,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = true,
	upper_case = true,
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
local side_title_style = {
	dynamic_font_size = true,
	font_size = 25,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = true,
	upper_case = true,
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
			47,
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
	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = "underline",
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
	passes[#passes + 1] = {
		content_id = "gradient",
		pass_type = "texture_uv",
		style_id = "left_gradient",
	}
	passes[#passes + 1] = {
		content_id = "gradient",
		pass_type = "texture_uv",
		style_id = "right_gradient",
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

local function create_stats(scenegraph_id, fields, optional_font_size, offset, is_me, skip_highscores, highscores)
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = scenegraph_data.size
	local padding = 10
	local cell_size = {
		size[1] / #fields,
		size[2],
	}
	local internal_score_style = table.clone(score_style)

	internal_score_style.font_size = optional_font_size or internal_score_style.font_size
	internal_score_style.text_color = is_me and Colors.get_color_table_with_alpha("local_player_picking", 255) or internal_score_style.text_color

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
	end

	return widget
end

local function create_title(scenegraph_id, title, optional_font_size, offset, is_me, team)
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = table.clone(scenegraph_data.size)

	size[1] = 170

	local team_color = team == "team_hammers" and hammers_team_color or skulls_team_color
	local internal_title_style = table.clone(title_style)

	internal_title_style.font_size = optional_font_size or internal_title_style.font_size
	internal_title_style.text_color = is_me and Colors.get_color_table_with_alpha("local_player_picking", 255) or team_color
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

local function create_team_title(scenegraph_id, team)
	local scenegraph_data = scenegraph_definition[scenegraph_id]
	local size = table.clone(scenegraph_data.size)

	size[1] = 140

	local settings = UISettings.teams_ui_assets
	local team_ui_settings = settings[team]
	local team_color = team == "team_hammers" and hammers_team_color or skulls_team_color
	local team_color_light = team == "team_hammers" and hammers_team_color_light or skulls_team_color_light
	local team_color_dark = team == "team_hammers" and hammers_team_color_dark or skulls_team_color_dark
	local internal_title_style = table.clone(team_title_style)

	internal_title_style.size = size
	internal_title_style.text_color = team_color
	internal_title_style.offset = {
		50,
		0,
		0,
	}

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
		pass_type = "texture",
		style_id = "icon",
		texture_id = "icon",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "icon_bg",
		texture_id = "icon_bg",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "icon_frame",
		texture_id = "icon_frame",
	}
	content.icon = team_ui_settings.team_icon
	content.icon_bg = team_ui_settings.background_texture
	content.icon_frame = team_ui_settings.background_frame
	style.icon = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			20,
			20,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			-70,
			0,
			2,
		},
	}
	style.icon_frame = table.clone(style.icon)
	style.icon_frame.texture_size = {
		32,
		32,
	}
	style.icon_frame.offset[3] = 1
	style.icon_frame.color = team_color_light
	style.icon_bg = table.clone(style.icon)
	style.icon_bg.color = team_color
	style.icon_bg.texture_size = {
		32,
		32,
	}
	style.icon_bg.offset[3] = 0
	style.icon_bg.color = team_color_dark
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
	content.title = tostring(team_ui_settings.display_name)
	style.title = internal_title_style
	style.title_shadow = table.clone(internal_title_style)
	style.title_shadow.text_color = {
		255,
		0,
		0,
		0,
	}
	style.title_shadow.offset = {
		style.title_shadow.offset[1] + 1,
		-1,
		-1,
	}

	return widget
end

local widget_definitions = {
	heroes_side_title = create_side_title("hammers_heroes_header_grid", "vs_as_heroes", Colors.get_color_table_with_alpha("heroes_color", 255)),
	pactsworn_side_title = create_side_title("hammers_pact_header_grid", "vs_as_pactsworn", Colors.get_color_table_with_alpha("pactsworn_color", 255)),
	team_hammers_score = UIWidgets.create_simple_text("0", "hammers_score_bg", scenegraph_definition.hammers_score_bg.size, nil, team_score_style),
	team_skulls_score = UIWidgets.create_simple_text("0", "skulls_score_bg", scenegraph_definition.hammers_score_bg.size, nil, team_score_style),
	team_hammers_title = create_team_title("hammers_title", "team_hammers"),
	hammers_score_bg = UIWidgets.create_simple_rounded_rect("hammers_score_bg", 10, hammers_team_color),
	hammers_score_bg_top = UIWidgets.create_simple_rect("hammers_score_bg_top", hammers_team_color),
	hammers_score_bg_edge = UIWidgets.create_simple_rect("hammers_score_bg_edge", hammers_team_color),
	team_skulls_title = create_team_title("skulls_title", "team_skulls"),
	skulls_score_bg = UIWidgets.create_simple_rounded_rect("skulls_score_bg", 10, skulls_team_color),
	skulls_score_bg_top = UIWidgets.create_simple_rect("skulls_score_bg_top", skulls_team_color),
	skulls_score_bg_edge = UIWidgets.create_simple_rect("skulls_score_bg_edge", skulls_team_color),
	heroes_header_bg = UIWidgets.create_simple_rect("heroes_header_bg", header_bg_color),
	pact_header_bg = UIWidgets.create_simple_rect("pact_header_bg", header_bg_color),
}

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

local function create_fields(anchor, num_fields, base_name, widgets)
	local field_size = scenegraph_definition[anchor].size

	for i = 1, num_fields do
		local offset = {
			0,
			(i - 1) * -field_size[2],
		}

		widgets[base_name .. "_" .. i] = UIWidgets.create_simple_rect(anchor, i % 2 == 0 and even_field_color or uneven_field_color, nil, offset)
	end
end

local function create_team_grid_fields(team, num_fields, ui_scenegraph)
	local widgets = {}

	if team == "team_hammers" then
		create_fields("hammers_anchor", num_fields + 1, "hammers_heroes", widgets)
		create_fields("hammers_pact_anchor", num_fields + 1, "hammers_pact", widgets)

		widgets.hammers_names_grid = create_grid("hammers_names_grid", num_fields + 1, 1, 2, nil)
		widgets.hammers_heroes_grid = create_grid("hammers_heroes_grid", num_fields + 2, 3, 2, nil)
		widgets.hammers_pact_grid = create_grid("hammers_pact_grid", num_fields + 2, 3, 2, nil)
		widgets.hammers_color_edge = create_edge("hammers_color_edge", hammers_team_color, (num_fields + 1) * cell_height)
		ui_scenegraph.skulls_anchor.local_position[2] = scenegraph_definition.skulls_anchor.position[2] - (num_fields + 2) * cell_height
	else
		create_fields("skulls_anchor", num_fields + 1, "skulls_heroes", widgets)
		create_fields("skulls_pact_anchor", num_fields + 1, "skulls_pact", widgets)

		widgets.skulls_names_grid = create_grid("skulls_names_grid", num_fields + 1, 1, 2, nil)
		widgets.skulls_heroes_grid = create_grid("skulls_heroes_grid", num_fields + 1, 3, 2, nil)
		widgets.skulls_pact_grid = create_grid("skulls_pact_grid", num_fields + 1, 3, 2, nil)
		widgets.skulls_color_edge = create_edge("skulls_color_edge", skulls_team_color, (num_fields + 1) * cell_height)
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
}
