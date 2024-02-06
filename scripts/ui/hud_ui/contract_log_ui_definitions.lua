-- chunkname: @scripts/ui/hud_ui/contract_log_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local ENTRY_LENGTH = 300
local RETAINED_MODE_ENABLED = true
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	pivot = {
		horizontal_alignment = "right",
		parent = "root",
		vertical_alignment = "top",
		position = {
			-ENTRY_LENGTH - 10,
			-80,
			1,
		},
		size = {
			0,
			0,
		},
	},
}

local function create_log_entry(index)
	local icon_width, icon_height = 20, 20

	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "texture_icon_bg",
					texture_id = "texture_icon_bg",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "texture_fade_bg",
					texture_id = "texture_fade_bg",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "text",
					style_id = "task_text",
					text_id = "task_text",
					retained_mode = RETAINED_MODE_ENABLED,
				},
			},
		},
		content = {
			task_text = "n/a",
			texture_fade_bg = "ingame_contract_bg_02",
			texture_icon = "hud_quest_icon_01_fg",
			texture_icon_bg = "hud_quest_icon_01_bg",
			title_text = "n/a",
		},
		style = {
			texture_icon = {
				size = {
					icon_width,
					icon_height,
				},
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					ENTRY_LENGTH - 20,
					10,
					4,
				},
			},
			texture_icon_bg = {
				size = {
					icon_width,
					icon_height,
				},
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					ENTRY_LENGTH - 20,
					10,
					3,
				},
			},
			texture_fade_bg = {
				size = {
					ENTRY_LENGTH + 60,
					5,
				},
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					-40,
					-15,
					2,
				},
			},
			title_text = {
				font_size = 16,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				size = {
					ENTRY_LENGTH,
					10,
				},
				offset = {
					-5 - (icon_width + 3),
					10,
					4,
				},
				text_color = {
					170,
					255,
					255,
					255,
				},
			},
			task_text = {
				dynamic_height = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					ENTRY_LENGTH * 2,
					20,
				},
				offset = {
					-5 - ENTRY_LENGTH,
					10,
					4,
				},
				text_color = {
					170,
					255,
					255,
					255,
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

local widget_definitions = {
	title_text = {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "texture_fade_bg",
					texture_id = "texture_fade_bg",
					retained_mode = RETAINED_MODE_ENABLED,
				},
			},
		},
		content = {
			texture_fade_bg = "ingame_contract_bg_02",
			title_text = Localize("dlc1_3_1_hud_contract_log_title") .. ":",
		},
		style = {
			title_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				size = {
					ENTRY_LENGTH,
					50,
				},
				offset = {
					-20,
					30,
					5,
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 200),
			},
			texture_fade_bg = {
				size = {
					ENTRY_LENGTH + 60,
					30,
				},
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					-40,
					33,
					4,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	},
}
local entry_widget_definitions = {}

for i = 1, 3 do
	entry_widget_definitions[i] = create_log_entry(i)
end

return {
	scenegraph_definition = scenegraph_definition,
	entry_widget_definitions = entry_widget_definitions,
	widget_definitions = widget_definitions,
	ENTRY_LENGTH = ENTRY_LENGTH,
}
