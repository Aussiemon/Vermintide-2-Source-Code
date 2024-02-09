-- chunkname: @scripts/ui/hud_ui/unit_frames_ui_utils.lua

UnitFramesUiUtils = UnitFramesUiUtils or {}

local DAMAGE_FONT_SIZE = 24
local DAMAGE_PART_FONT_SIZE = 16

UnitFramesUiUtils.create_damage_widget = function (widget_type, rows)
	local entries = {}
	local is_team_portrait = widget_type == "team"
	local offset = is_team_portrait and {
		100,
		50,
		0,
	} or {
		-15,
		40,
		0,
	}
	local damage_icon_size = 24
	local start_name_x = damage_icon_size + 16

	for i = 1, rows do
		local text_offset = is_team_portrait and {
			start_name_x,
			20 - i * 20,
			0,
		} or {
			start_name_x,
			30 + i * 20,
			0,
		}
		local damage_icon_offset = {
			-damage_icon_size - 4,
			text_offset[2] - damage_icon_size * 0.45,
		}
		local widget_definition = {
			scenegraph_id = "portrait_pivot",
			element = {
				passes = {
					{
						pass_type = "text",
						style_id = "text",
						text_id = "text",
					},
					{
						pass_type = "text",
						style_id = "text_total_sum",
						text_id = "text_total_sum",
					},
					{
						pass_type = "text",
						style_id = "text_total_sum_decimal_part",
						text_id = "text_total_sum_decimal_part",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg",
						text_id = "text_last_dmg",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_2",
						text_id = "text_last_dmg_2",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_3",
						text_id = "text_last_dmg_3",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_4",
						text_id = "text_last_dmg_4",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_5",
						text_id = "text_last_dmg_5",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_6",
						text_id = "text_last_dmg_6",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_7",
						text_id = "text_last_dmg_7",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_8",
						text_id = "text_last_dmg_8",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_9",
						text_id = "text_last_dmg_9",
					},
					{
						pass_type = "text",
						style_id = "text_last_dmg_10",
						text_id = "text_last_dmg_10",
					},
					{
						pass_type = "texture",
						style_id = "damage_icon",
						texture_id = "damage_icon",
					},
				},
			},
			content = {
				damage_icon = "icon_damage",
				text = "",
				text_last_dmg = "",
				text_last_dmg_10 = "",
				text_last_dmg_2 = "",
				text_last_dmg_3 = "",
				text_last_dmg_4 = "",
				text_last_dmg_5 = "",
				text_last_dmg_6 = "",
				text_last_dmg_7 = "",
				text_last_dmg_8 = "",
				text_last_dmg_9 = "",
				text_total_sum = "",
				text_total_sum_decimal_part = "",
				visible = false,
			},
			style = {
				text = {
					debug_draw_box = true,
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_FONT_SIZE,
					text_color = Colors.get_table("gray"),
					offset = text_offset,
				},
				text_total_sum = {
					debug_draw_box = true,
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_FONT_SIZE,
					text_color = Colors.get_table("green"),
					offset = text_offset,
				},
				text_total_sum_decimal_part = {
					debug_draw_box = true,
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "left",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("white"),
					offset = text_offset,
				},
				text_last_dmg = {
					debug_draw_box = true,
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_2 = {
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_3 = {
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_4 = {
					debug_draw_box = true,
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_5 = {
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_6 = {
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_7 = {
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_8 = {
					debug_draw_box = true,
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_9 = {
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				text_last_dmg_10 = {
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					vertical_alignment = "center",
					font_size = DAMAGE_PART_FONT_SIZE,
					text_color = Colors.get_table("yellow"),
					offset = text_offset,
				},
				damage_icon = {
					size = {
						damage_icon_size,
						damage_icon_size,
					},
					offset = damage_icon_offset,
					color = {
						255,
						199,
						194,
						194,
					},
				},
			},
			offset = offset,
		}

		entries[#entries + i] = widget_definition
	end

	return entries
end
