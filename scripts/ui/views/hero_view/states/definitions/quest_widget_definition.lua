﻿-- chunkname: @scripts/ui/views/hero_view/states/definitions/quest_widget_definition.lua

local function create_quest_entry(scenegraph_id, size)
	local frame_settings = UIFrameSettings.menu_frame_12
	local progress_frame_settings = UIFrameSettings.button_frame_01
	local hover_frame_settings = UIFrameSettings.frame_outer_glow_01
	local hover_frame_width = hover_frame_settings.texture_sizes.corner[1]
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local button_background_texture = "button_bg_01"
	local button_background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(button_background_texture)
	local side_detail_texture = "button_detail_03"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local masked = true
	local progress_bar_size = {
		500,
		42,
	}
	local progress_bar_height_offset = 13
	local expand_size = {
		800,
		100,
	}
	local checklist_entry_size = {
		expand_size[1] / 2,
		30,
	}
	local expand_height_offset = -(size[2] - 10)
	local checklist_content = {
		allow_multi_hover = true,
	}
	local checklist_item_styles = {}

	for i = 1, 10 do
		checklist_content[i] = {
			checkbox = "achievement_checkbox",
			checkbox_marker = "matchmaking_checkbox",
			text = "n/a",
			button_hotspot = {
				allow_multi_hover = true,
			},
		}
		checklist_item_styles[i] = {
			list_member_offset = {
				0,
				-checklist_entry_size[2],
				0,
			},
			size = checklist_entry_size,
			text = {
				font_size = 22,
				horizontal_alignment = "left",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					31,
					0,
					2,
				},
			},
			text_shadow = {
				font_size = 22,
				horizontal_alignment = "left",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					33,
					-2,
					1,
				},
			},
			checkbox = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "center",
				texture_size = {
					25,
					25,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					-2,
					1,
				},
			},
			checkbox_marker = {
				horizontal_alignment = "left",
				masked = true,
				vertical_alignment = "center",
				texture_size = {
					37,
					31,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					1,
					2,
				},
			},
		}
	end

	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "button_hotspot",
		},
		{
			pass_type = "texture",
			style_id = "hover_glow",
			texture_id = "hover_glow",
			content_check_function = function (content)
				return content.button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "close_background",
			texture_id = "close_background",
			content_check_function = function (content)
				return content.can_close
			end,
		},
		{
			pass_type = "texture",
			style_id = "close_icon_bg",
			texture_id = "close_icon_bg",
			content_check_function = function (content)
				return content.can_close
			end,
		},
		{
			pass_type = "texture",
			style_id = "close_icon",
			texture_id = "close_icon",
			content_check_function = function (content)
				return content.can_close and not content.close_button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture",
			style_id = "close_icon_hover",
			texture_id = "close_icon_hover",
			content_check_function = function (content)
				return content.can_close and content.close_button_hotspot.is_hover
			end,
		},
		{
			content_id = "close_button_hotspot",
			pass_type = "hotspot",
			style_id = "close_icon",
			content_check_function = function (content)
				return content.parent.can_close
			end,
		},
		{
			pass_type = "tiled_texture",
			style_id = "expand_background",
			texture_id = "expand_background",
			content_check_function = function (content)
				return content.expanded
			end,
		},
		{
			pass_type = "texture",
			style_id = "expand_background_edge",
			texture_id = "expand_background_edge",
			content_check_function = function (content)
				return content.expanded
			end,
		},
		{
			pass_type = "rotated_texture",
			style_id = "expand_background_shadow",
			texture_id = "expand_background_shadow",
			content_check_function = function (content)
				return content.expanded
			end,
		},
		{
			pass_type = "rotated_texture",
			style_id = "arrow",
			texture_id = "arrow",
			content_check_function = function (content)
				return content.expandable and not content.button_hotspot.is_hover and not content.expanded
			end,
		},
		{
			pass_type = "rotated_texture",
			style_id = "arrow",
			texture_id = "arrow_hover",
			content_check_function = function (content)
				return content.expandable and (content.expanded or content.button_hotspot.is_hover)
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "progress_frame",
			texture_id = "progress_frame",
			content_check_function = function (content)
				return content.draw_bar or content.completed and not content.claimed
			end,
		},
		{
			pass_type = "texture",
			style_id = "progress_bar",
			texture_id = "progress_bar",
			content_check_function = function (content)
				return content.draw_bar
			end,
		},
		{
			pass_type = "texture",
			style_id = "progress_bar_bg",
			texture_id = "rect_masked",
			content_check_function = function (content)
				return content.draw_bar
			end,
		},
		{
			pass_type = "text",
			style_id = "progress_text",
			text_id = "progress_text",
			content_check_function = function (content)
				return content.draw_bar
			end,
		},
		{
			pass_type = "text",
			style_id = "progress_text_shadow",
			text_id = "progress_text",
			content_check_function = function (content)
				return content.draw_bar
			end,
		},
		{
			pass_type = "text",
			style_id = "progress_button_text_hover",
			text_id = "progress_button_text",
			content_check_function = function (content)
				return content.completed and not content.claimed and not content.draw_bar and content.progress_button_hotspot.is_hover
			end,
		},
		{
			pass_type = "text",
			style_id = "progress_button_text",
			text_id = "progress_button_text",
			content_check_function = function (content)
				return content.completed and not content.claimed and not content.draw_bar and not content.progress_button_hotspot.is_hover
			end,
		},
		{
			pass_type = "text",
			style_id = "progress_button_text_shadow",
			text_id = "progress_button_text",
			content_check_function = function (content)
				return content.completed and not content.claimed and not content.draw_bar
			end,
		},
		{
			content_id = "progress_button_background",
			pass_type = "texture_uv",
			style_id = "progress_button_background",
			content_check_function = function (content)
				local parent = content.parent

				return parent.completed and not parent.claimed
			end,
		},
		{
			pass_type = "texture",
			style_id = "progress_button_background_fade",
			texture_id = "background_fade",
			content_check_function = function (content)
				return content.completed and not content.claimed
			end,
		},
		{
			content_id = "progress_button_hotspot",
			pass_type = "hotspot",
			style_id = "progress_button_hotspot",
			content_check_function = function (content)
				local parent = content.parent

				return parent.completed and not parent.claimed
			end,
		},
		{
			pass_type = "texture",
			style_id = "progress_button_glass_top",
			texture_id = "glass",
			content_check_function = function (content)
				return content.draw_bar or content.completed and not content.claimed
			end,
		},
		{
			pass_type = "texture",
			style_id = "progress_button_glass_bottom",
			texture_id = "glass",
			content_check_function = function (content)
				return content.draw_bar or content.completed and not content.claimed
			end,
		},
		{
			pass_type = "texture",
			style_id = "progress_button_hover_glow",
			texture_id = "hover_glow",
			content_check_function = function (content)
				return content.completed and not content.claimed and content.progress_button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "progress_button_claim_glow",
			texture_id = "progress_button_claim_glow",
			content_check_function = function (content)
				return content.completed and not content.claimed and not content.claiming
			end,
			content_change_function = function (content, style)
				local progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5

				style.color[1] = 55 + progress * 200
			end,
		},
		{
			content_id = "side_detail",
			pass_type = "texture_uv",
			style_id = "side_detail_right",
			content_check_function = function (content)
				local parent_content = content.parent

				return parent_content.draw_bar or parent_content.completed and not parent_content.claimed
			end,
		},
		{
			content_id = "side_detail",
			pass_type = "texture",
			style_id = "side_detail_left",
			texture_id = "texture_id",
			content_check_function = function (content)
				local parent_content = content.parent

				return parent_content.draw_bar or parent_content.completed and not parent_content.claimed
			end,
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "background_fade",
			texture_id = "background_fade",
		},
		{
			pass_type = "texture",
			style_id = "title_divider",
			texture_id = "title_divider",
		},
		{
			pass_type = "texture",
			style_id = "icon_background_ribbon",
			texture_id = "icon_background_ribbon",
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
		},
		{
			pass_type = "texture",
			style_id = "reward_background",
			texture_id = "reward_background",
		},
		{
			pass_type = "texture",
			style_id = "reward_icon",
			texture_id = "reward_icon",
		},
		{
			pass_type = "texture",
			style_id = "reward_hover",
			texture_id = "reward_hover",
			content_check_function = function (content)
				local reward_button_hotspot = content.reward_button_hotspot

				return reward_button_hotspot.is_hover and reward_button_hotspot.draw
			end,
		},
		{
			item_id = "reward_item",
			pass_type = "item_tooltip",
			style_id = "reward_icon",
			content_check_function = function (content)
				local reward_button_hotspot = content.reward_button_hotspot

				return reward_button_hotspot.is_hover and reward_button_hotspot.draw
			end,
			content_change_function = function (content)
				content.reward_button_hotspot.draw = false
			end,
		},
		{
			pass_type = "texture",
			style_id = "reward_frame",
			texture_id = "reward_frame",
		},
		{
			content_id = "reward_button_hotspot",
			pass_type = "hotspot",
			style_id = "reward_icon",
		},
		{
			pass_type = "texture",
			style_id = "reward_icon_claimed",
			texture_id = "reward_icon_claimed",
			content_check_function = function (content)
				return content.claimed
			end,
		},
		{
			pass_type = "text",
			style_id = "claimed_text",
			text_id = "claimed_text",
			content_check_function = function (content)
				return content.completed and content.claimed
			end,
		},
		{
			pass_type = "text",
			style_id = "claimed_text_shadow",
			text_id = "claimed_text",
			content_check_function = function (content)
				return content.completed and content.claimed
			end,
		},
		{
			pass_type = "text",
			style_id = "locked_text",
			text_id = "locked_text",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "locked_text_shadow",
			text_id = "locked_text",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "title",
			text_id = "title",
		},
		{
			pass_type = "text",
			style_id = "title_shadow",
			text_id = "title",
		},
		{
			pass_type = "text",
			style_id = "description",
			text_id = "description",
		},
		{
			pass_type = "text",
			style_id = "description_shadow",
			text_id = "description",
		},
		{
			content_id = "checklist_1",
			pass_type = "list_pass",
			style_id = "checklist_1",
			content_check_function = function (content)
				return content.parent.expanded
			end,
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "texture",
					style_id = "checkbox",
					texture_id = "checkbox",
				},
				{
					pass_type = "texture",
					style_id = "checkbox_marker",
					texture_id = "checkbox_marker",
				},
			},
		},
		{
			content_id = "checklist_2",
			pass_type = "list_pass",
			style_id = "checklist_2",
			content_check_function = function (content)
				return content.parent.expanded
			end,
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "texture",
					style_id = "checkbox",
					texture_id = "checkbox",
				},
				{
					pass_type = "texture",
					style_id = "checkbox_marker",
					texture_id = "checkbox_marker",
				},
			},
		},
	}
	local content = {
		arrow = "achievement_arrow",
		arrow_hover = "achievement_arrow_hover",
		background = "quests_background",
		background_fade = "options_window_fade_01",
		can_close = false,
		claimed = false,
		claiming = false,
		close_background = "quest_close",
		close_icon = "achievement_refresh_white",
		close_icon_bg = "achievement_refresh_off",
		close_icon_hover = "achievement_refresh_on",
		completed = false,
		description = "n/a",
		draw_bar = true,
		expand_background = "achievement_paper_middle",
		expand_background_edge = "achievement_paper_bottom",
		expand_background_shadow = "edge_fade_small",
		expandable = false,
		expanded = false,
		glass = "button_glass_02",
		hover_glow = "button_state_default",
		icon = "quest_book_skull",
		icon_background = "quest_book_skull",
		icon_background_ribbon = "quest_book_ribbon",
		locked_text = "n/a",
		progress_bar = "chest_upgrade_fill",
		progress_text = "n/a",
		rect_masked = "rect_masked",
		reward_background = "quest_right",
		reward_frame = "item_frame",
		reward_hover = "item_icon_hover",
		reward_icon = "icons_placeholder",
		reward_icon_claimed = "achievement_banner",
		title = "n/a",
		title_divider = "divider_01_bottom",
		button_hotspot = {
			allow_multi_hover = true,
		},
		progress_button_hotspot = {},
		reward_button_hotspot = {},
		claimed_text = Localize("achv_menu_reward_claimed"),
		progress_button_text = Localize("loot_screen_claim_reward"),
		close_button_hotspot = {},
		frame = frame_settings.texture,
		progress_frame = progress_frame_settings.texture,
		progress_button_claim_glow = hover_frame_settings.texture,
		side_detail = {
			uvs = {
				{
					1,
					0,
				},
				{
					0,
					1,
				},
			},
			texture_id = side_detail_texture,
		},
		progress_button_background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(progress_bar_size[1] / button_background_texture_settings.size[1], 1),
					math.min(progress_bar_size[2] / button_background_texture_settings.size[2], 1),
				},
			},
			texture_id = button_background_texture,
		},
		checklist_1 = table.clone(checklist_content),
		checklist_2 = table.clone(checklist_content),
	}
	local style = {
		close_icon = {
			masked = true,
			size = {
				25,
				25,
			},
			offset = {
				size[1] + 50 - 31,
				size[2] - 25,
				13,
			},
			color = {
				255,
				200,
				200,
				200,
			},
		},
		close_icon_hover = {
			masked = true,
			size = {
				25,
				25,
			},
			offset = {
				size[1] + 50 - 31,
				size[2] - 25,
				12,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		close_icon_bg = {
			masked = true,
			size = {
				25,
				25,
			},
			offset = {
				size[1] + 50 - 31,
				size[2] - 25,
				12,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
		},
		close_background = {
			horizontal_alignment = "right",
			masked = true,
			vertical_alignment = "top",
			texture_size = {
				42,
				48,
			},
			offset = {
				50,
				10,
				11,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		button_hotspot = {
			size = {
				size[1] + 100,
				size[2],
			},
			offset = {
				-50,
				0,
				0,
			},
		},
		checklist_1 = {
			horizontal_alignment = "center",
			num_draws = 0,
			start_index = 1,
			vertical_alignment = "center",
			list_member_offset = {
				0,
				0,
				0,
			},
			size = expand_size,
			offset = {
				100,
				-size[2] / 2,
				1,
			},
			item_styles = table.clone(checklist_item_styles),
		},
		checklist_2 = {
			horizontal_alignment = "center",
			num_draws = 0,
			start_index = 1,
			vertical_alignment = "center",
			list_member_offset = {
				0,
				0,
				0,
			},
			size = expand_size,
			offset = {
				500,
				-size[2] / 2,
				1,
			},
			item_styles = table.clone(checklist_item_styles),
		},
		expand_background = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "top",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				expand_height_offset,
				-1,
			},
			texture_size = expand_size,
			texture_tiling_size = {
				800,
				100,
			},
		},
		expand_background_edge = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				-1,
			},
			texture_size = {
				800,
				100,
			},
		},
		expand_background_shadow = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			angle = math.pi,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-14,
				0,
			},
			texture_size = {
				800,
				20,
			},
			pivot = {
				400,
				10,
			},
		},
		arrow = {
			angle = 0,
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-22,
				1,
			},
			texture_size = {
				59,
				31,
			},
			pivot = {
				29.5,
				15.5,
			},
		},
		progress_frame = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			area_size = progress_bar_size,
			texture_size = progress_frame_settings.texture_size,
			texture_sizes = progress_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				progress_bar_height_offset,
				10,
			},
		},
		progress_bar = {
			horizontal_alignment = "left",
			masked = true,
			vertical_alignment = "bottom",
			default_size = progress_bar_size,
			texture_size = progress_bar_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2,
				progress_bar_height_offset,
				6,
			},
		},
		progress_bar_bg = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			default_size = progress_bar_size,
			texture_size = progress_bar_size,
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2,
				progress_bar_height_offset,
				5,
			},
		},
		progress_button_background = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			texture_size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				progress_bar_height_offset,
				6,
			},
		},
		progress_button_background_fade = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			texture_size = {
				progress_bar_size[1] - 10,
				progress_bar_size[2] - 10,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				progress_bar_height_offset + 5,
				7,
			},
		},
		progress_button_glass_top = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			texture_size = {
				progress_bar_size[1] - 10,
				11,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				progress_bar_height_offset + progress_bar_size[2] - 17,
				8,
			},
		},
		progress_button_glass_bottom = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			texture_size = {
				progress_bar_size[1] - 10,
				11,
			},
			color = {
				100,
				255,
				255,
				255,
			},
			offset = {
				0,
				progress_bar_height_offset - 3,
				8,
			},
		},
		progress_button_hover_glow = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			texture_size = {
				progress_bar_size[1] - 10,
				progress_bar_size[2] - 10,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				progress_bar_height_offset + 5,
				9,
			},
		},
		progress_button_hotspot = {
			size = progress_bar_size,
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2,
				progress_bar_height_offset,
				1,
			},
		},
		progress_button_claim_glow = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			area_size = progress_bar_size,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			frame_margins = {
				-(hover_frame_width - 1),
				-(hover_frame_width - 1),
			},
			offset = {
				0,
				progress_bar_height_offset,
				14,
			},
		},
		side_detail_left = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-(progress_bar_size[1] / 2 - side_detail_texture_size[1] / 2) - 9,
				progress_bar_height_offset + progress_bar_size[2] / 2 - side_detail_texture_size[2] / 2,
				15,
			},
			texture_size = side_detail_texture_size,
		},
		side_detail_right = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				progress_bar_size[1] / 2 - side_detail_texture_size[1] / 2 + 9,
				progress_bar_height_offset + progress_bar_size[2] / 2 - side_detail_texture_size[2] / 2,
				15,
			},
			texture_size = side_detail_texture_size,
		},
		hover_glow = {
			masked = true,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				4,
			},
		},
		frame = {
			masked = true,
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
				8,
			},
		},
		background = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "center",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				3,
			},
			texture_size = size,
			texture_tiling_size = {
				50,
				156,
			},
		},
		background_fade = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "center",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				4,
			},
			texture_size = size,
		},
		title_divider = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "top",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-24,
				10,
			},
			texture_size = {
				264,
				21,
			},
		},
		icon_background = {
			horizontal_alignment = "left",
			masked = true,
			vertical_alignment = "center",
			texture_size = {
				165,
				163,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-50,
				0,
				10,
			},
		},
		icon_background_ribbon = {
			horizontal_alignment = "left",
			masked = true,
			vertical_alignment = "center",
			texture_size = {
				154,
				169,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				110,
				11,
				9,
			},
		},
		icon = {
			horizontal_alignment = "left",
			masked = true,
			vertical_alignment = "center",
			texture_size = {
				165,
				163,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-50,
				0,
				11,
			},
		},
		reward_background = {
			horizontal_alignment = "right",
			masked = true,
			vertical_alignment = "center",
			texture_size = {
				314,
				178,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				50,
				8,
				10,
			},
		},
		reward_icon = {
			masked = true,
			saturated = false,
			size = {
				80,
				80,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] - 80 - 3,
				size[2] / 2 - 40 + 3,
				11,
			},
		},
		reward_frame = {
			horizontal_alignment = "right",
			masked = true,
			vertical_alignment = "center",
			texture_size = {
				80,
				80,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-3,
				3,
				15,
			},
		},
		reward_hover = {
			horizontal_alignment = "right",
			masked = true,
			vertical_alignment = "center",
			texture_size = {
				128,
				128,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				21,
				3,
				15,
			},
		},
		reward_icon_claimed = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "bottom",
			texture_size = {
				438,
				54,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-13,
				8,
			},
		},
		progress_text = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2,
				progress_bar_height_offset,
				10,
			},
		},
		progress_text_shadow = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2 + 2,
				progress_bar_height_offset - 2,
				9,
			},
		},
		claimed_text = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "bottom",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2,
				4,
				10,
			},
		},
		claimed_text_shadow = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "bottom",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2 + 2,
				2,
				9,
			},
		},
		locked_text = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "bottom",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("red", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2,
				10,
				10,
			},
		},
		locked_text_shadow = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "bottom",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2 + 2,
				8,
				9,
			},
		},
		progress_button_text = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2,
				progress_bar_height_offset,
				10,
			},
		},
		progress_button_text_hover = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2,
				progress_bar_height_offset,
				10,
			},
		},
		progress_button_text_shadow = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = false,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				progress_bar_size[1],
				progress_bar_size[2],
			},
			offset = {
				size[1] / 2 - progress_bar_size[1] / 2 + 2,
				progress_bar_height_offset - 2,
				9,
			},
		},
		description = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				size[1] - 300,
				size[2],
			},
			offset = {
				150,
				5,
				9,
			},
		},
		description_shadow = {
			font_size = 18,
			horizontal_alignment = "center",
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				size[1] - 300,
				size[2],
			},
			offset = {
				152,
				3,
				8,
			},
		},
		title = {
			dynamic_font_size = true,
			font_size = 28,
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "top",
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				size[1] / 2 - 200,
				-7,
				9,
			},
			size = {
				400,
				size[2],
			},
		},
		title_shadow = {
			dynamic_font_size = true,
			font_size = 28,
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "top",
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				size[1] / 2 - 200 + 2,
				-9,
				8,
			},
			size = {
				400,
				size[2],
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

return create_quest_entry
