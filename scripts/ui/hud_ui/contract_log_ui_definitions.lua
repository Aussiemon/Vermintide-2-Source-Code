local SIZE_X = 1920
local SIZE_Y = 1080
local ENTRY_LENGTH = 300
local RETAINED_MODE_ENABLED = true
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	pivot = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "right",
		position = {
			-ENTRY_LENGTH - 10,
			-80,
			1
		},
		size = {
			0,
			0
		}
	}
}

local function create_log_entry(index)
	local icon_width = 20
	local icon_height = 20

	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_icon_bg",
					texture_id = "texture_icon_bg",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_fade_bg",
					texture_id = "texture_fade_bg",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "task_text",
					pass_type = "text",
					text_id = "task_text",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			texture_fade_bg = "ingame_contract_bg_02",
			title_text = "n/a",
			texture_icon_bg = "hud_quest_icon_01_bg",
			task_text = "n/a",
			texture_icon = "hud_quest_icon_01_fg"
		},
		style = {
			texture_icon = {
				size = {
					icon_width,
					icon_height
				},
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					ENTRY_LENGTH - 20,
					10,
					4
				}
			},
			texture_icon_bg = {
				size = {
					icon_width,
					icon_height
				},
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					ENTRY_LENGTH - 20,
					10,
					3
				}
			},
			texture_fade_bg = {
				size = {
					ENTRY_LENGTH + 60,
					5
				},
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					-40,
					-15,
					2
				}
			},
			title_text = {
				vertical_alignment = "bottom",
				font_size = 16,
				horizontal_alignment = "right",
				font_type = "hell_shark",
				size = {
					ENTRY_LENGTH,
					10
				},
				offset = {
					(icon_width + 3) - -5,
					10,
					4
				},
				text_color = {
					170,
					255,
					255,
					255
				}
			},
			task_text = {
				dynamic_height = true,
				font_size = 20,
				word_wrap = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				font_type = "hell_shark",
				size = {
					ENTRY_LENGTH*2,
					20
				},
				offset = {
					ENTRY_LENGTH - -5,
					10,
					4
				},
				text_color = {
					170,
					255,
					255,
					255
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

local widget_definitions = {
	title_text = {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_fade_bg",
					texture_id = "texture_fade_bg",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			texture_fade_bg = "ingame_contract_bg_02",
			title_text = Localize("dlc1_3_1_hud_contract_log_title") .. ":"
		},
		style = {
			title_text = {
				vertical_alignment = "bottom",
				font_size = 24,
				horizontal_alignment = "right",
				font_type = "hell_shark",
				size = {
					ENTRY_LENGTH,
					50
				},
				offset = {
					-20,
					30,
					5
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 200)
			},
			texture_fade_bg = {
				size = {
					ENTRY_LENGTH + 60,
					30
				},
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					-40,
					33,
					4
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
}
local entry_widget_definitions = {}

for i = 1, 3, 1 do
	entry_widget_definitions[i] = create_log_entry(i)
end

return {
	scenegraph_definition = scenegraph_definition,
	entry_widget_definitions = entry_widget_definitions,
	widget_definitions = widget_definitions,
	ENTRY_LENGTH = ENTRY_LENGTH
}
