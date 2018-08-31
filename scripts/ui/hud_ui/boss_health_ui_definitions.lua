local_require("scripts/ui/ui_widgets")

local retained_mode = false
local bar_length = 440
local scenegraph_definition = {
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
	pivot = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			440,
			14
		},
		position = {
			33,
			-100,
			0
		}
	}
}

if platform ~= "win32" then
	scenegraph_definition.screen.scale = "hud_fit"
end

local function create_health_bar_widget()
	local default_color = {
		255,
		255,
		255,
		255
	}
	local default_offset = {
		0,
		0,
		0
	}
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {}
	local style = {}
	local text_style_ids = {}
	local bar_bg_name = "bar_bg"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = bar_bg_name,
		style_id = bar_bg_name,
		retained_mode = retained_mode
	}
	content[bar_bg_name] = "boss_hp_bar_bg"
	style[bar_bg_name] = {
		color = table.clone(default_color),
		offset = {
			0,
			0,
			0
		}
	}
	text_style_ids[#text_style_ids + 1] = bar_bg_name
	local bar_name = "bar"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = bar_name,
		style_id = bar_name,
		retained_mode = retained_mode
	}
	style[bar_name] = {
		color = {
			255,
			255,
			255,
			255
		},
		size = {
			440,
			14
		},
		offset = {
			0,
			0,
			2
		},
		default_offset = {
			0,
			0,
			2
		},
		default_size = {
			440,
			14
		}
	}
	content[bar_name] = {
		texture_id = "boss_hp_bar_fill",
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
	}
	text_style_ids[#text_style_ids + 1] = bar_name
	local healing_bar_name = "healing_bar"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = healing_bar_name,
		style_id = healing_bar_name,
		retained_mode = retained_mode
	}
	style[healing_bar_name] = {
		color = {
			200,
			255,
			255,
			255
		},
		size = {
			440,
			14
		},
		offset = {
			0,
			0,
			3
		},
		default_offset = {
			0,
			0,
			3
		},
		default_size = {
			440,
			14
		}
	}
	content[healing_bar_name] = {
		texture_id = "boss_hp_bar_healing",
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
	}
	text_style_ids[#text_style_ids + 1] = healing_bar_name
	local dead_space_bar_name = "dead_space_bar"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = dead_space_bar_name,
		style_id = dead_space_bar_name,
		retained_mode = retained_mode
	}
	style[dead_space_bar_name] = {
		color = {
			255,
			255,
			255,
			255
		},
		size = {
			440,
			14
		},
		offset = {
			0,
			0,
			1
		},
		default_offset = {
			0,
			0,
			1
		},
		default_size = {
			440,
			14
		}
	}
	content[dead_space_bar_name] = {
		texture_id = "boss_hp_bar_dead_space",
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
	}
	text_style_ids[#text_style_ids + 1] = dead_space_bar_name
	local dead_space_bar_divider_name = "dead_space_bar_divider"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = dead_space_bar_divider_name,
		style_id = dead_space_bar_divider_name,
		retained_mode = retained_mode,
		content_check_function = function (content)
			local max_health_fraction = content.max_health_fraction or 1

			return max_health_fraction ~= 1
		end
	}
	content[dead_space_bar_divider_name] = "boss_hp_divider"
	style[dead_space_bar_divider_name] = {
		default_width_offset = 11,
		color = table.clone(default_color),
		offset = {
			429,
			-8,
			7
		},
		size = {
			21,
			29
		}
	}
	text_style_ids[#text_style_ids + 1] = dead_space_bar_divider_name
	local bar_edge_name = "bar_edge"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = bar_edge_name,
		style_id = bar_edge_name,
		retained_mode = retained_mode,
		content_check_function = function (content)
			local bar_edge_fraction = content.bar_edge_fraction or 1

			return bar_edge_fraction ~= 1
		end
	}
	content[bar_edge_name] = "boss_hp_bar_edge"
	style[bar_edge_name] = {
		default_width_offset = 7,
		color = table.clone(default_color),
		offset = {
			433,
			0,
			4
		},
		size = {
			13,
			14
		}
	}
	text_style_ids[#text_style_ids + 1] = bar_edge_name
	local bar_fg_name = "bar_fg"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = bar_fg_name,
		style_id = bar_fg_name,
		retained_mode = retained_mode
	}
	content[bar_fg_name] = "boss_hp_bar"
	style[bar_fg_name] = {
		size = {
			450,
			70
		},
		offset = {
			-6,
			-52,
			5
		},
		color = {
			255,
			255,
			255,
			255
		}
	}
	text_style_ids[#text_style_ids + 1] = bar_fg_name
	local portrait_name = "portrait"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = portrait_name,
		style_id = portrait_name,
		retained_mode = retained_mode
	}
	content[portrait_name] = "boss_hp_bar"
	style[portrait_name] = {
		size = {
			60,
			70
		},
		offset = {
			-62,
			-52,
			6
		},
		color = {
			255,
			255,
			255,
			255
		}
	}
	text_style_ids[#text_style_ids + 1] = portrait_name
	local portrait_healing_name = "portrait_healing"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = portrait_healing_name,
		style_id = portrait_healing_name,
		retained_mode = retained_mode
	}
	content[portrait_healing_name] = "boss_portrait_heal"
	style[portrait_healing_name] = {
		size = {
			52,
			62
		},
		offset = {
			-58,
			-48,
			7
		},
		color = {
			255,
			0,
			255,
			0
		}
	}
	text_style_ids[#text_style_ids + 1] = portrait_healing_name
	local title_text = "title_text"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = title_text,
		style_id = title_text,
		retained_mode = retained_mode
	}
	content[title_text] = ""
	style[title_text] = {
		vertical_alignment = "top",
		upper_case = true,
		horizontal_alignment = "left",
		font_size = 24,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		offset = {
			4,
			-18,
			7
		}
	}
	text_style_ids[#text_style_ids + 1] = title_text
	local title_text_shadow = "title_text_shadow_shadow"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = title_text,
		style_id = title_text_shadow,
		retained_mode = retained_mode
	}
	content[title_text_shadow] = ""
	style[title_text_shadow] = {
		vertical_alignment = "top",
		upper_case = true,
		horizontal_alignment = "left",
		font_size = 24,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			6,
			-20,
			6
		}
	}
	text_style_ids[#text_style_ids + 1] = title_text_shadow
	content.text_style_ids = text_style_ids
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = "pivot"

	return widget
end

local widgets = {
	bar = create_health_bar_widget()
}

return {
	scenegraph_definition = scenegraph_definition,
	bar_length = bar_length,
	widgets = widgets
}
