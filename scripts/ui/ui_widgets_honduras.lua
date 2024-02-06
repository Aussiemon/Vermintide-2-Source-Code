﻿-- chunkname: @scripts/ui/ui_widgets_honduras.lua

require("scripts/settings/ui_frame_settings")
require("scripts/settings/ui_player_portrait_frame_settings")

UIWidgets = UIWidgets or {}

UIWidgets.create_talent_slot = function (scenegraph_id, offset)
	local counter_offset = {
		50,
		-10,
	}
	local frame_settings = UIFrameSettings.menu_frame_01
	local counter_frame_settings = UIFrameSettings.menu_frame_03

	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "icon",
					content_check_function = function (content)
						return content.parent.icon
					end,
				},
				{
					pass_type = "rect",
					style_id = "available_rect",
					content_check_function = function (content)
						return not content.unavailable and content.num_ranks and content.num_ranks > content.rank
					end,
				},
				{
					pass_type = "rect",
					style_id = "filled_rect",
					content_check_function = function (content)
						return not content.unavailable and content.num_ranks and content.num_ranks == content.rank
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture_frame",
					style_id = "counter_frame",
					texture_id = "counter_frame",
					content_check_function = function (content)
						return not content.unavailable
					end,
				},
				{
					pass_type = "rect",
					style_id = "counter_rect",
					content_check_function = function (content)
						return not content.unavailable
					end,
				},
				{
					pass_type = "text",
					style_id = "counter_text",
					text_id = "counter_text",
					content_check_function = function (content)
						return not content.unavailable and content.num_ranks and content.num_ranks > content.rank
					end,
				},
				{
					pass_type = "text",
					style_id = "counter_text_complete",
					text_id = "counter_text",
					content_check_function = function (content)
						return not content.unavailable and content.num_ranks and content.num_ranks == content.rank
					end,
				},
				{
					pass_type = "rect_rotated",
					style_id = "rect_rotated",
					content_check_function = function (content)
						return content.has_connection
					end,
				},
				{
					pass_type = "rotated_texture",
					style_id = "connection_arrow",
					texture_id = "connection_arrow",
					content_check_function = function (content)
						return content.has_connection
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "talent_tooltip",
					style_id = "tooltip",
					talent_id = "tooltip",
					content_check_function = function (content)
						return content.talent_id and content.hotspot.is_hover
					end,
				},
			},
		},
		content = {
			connection_arrow = "drop_down_menu_arrow",
			counter_text = "0",
			icon = "icon_trophy_skull_encased_t2_03",
			num_ranks = 0,
			rank = 0,
			tooltip_text = "n/a",
			unavailable = true,
			hotspot = {},
			frame = frame_settings.texture,
			counter_frame = counter_frame_settings.texture,
		},
		style = {
			tooltip = {
				draw_side = "right",
				size = {
					64,
					64,
				},
				offset = {
					2,
					65,
					50,
				},
			},
			tooltip_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				max_width = 500,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
				},
				offset = {
					0,
					0,
					50,
				},
			},
			rect_rotated = {
				angle = 0,
				size = {
					5,
					100,
				},
				pivot = {
					2.5,
					0,
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					32,
					32,
					0,
				},
			},
			connection_arrow = {
				angle = 0,
				size = {
					28,
					34,
				},
				pivot = {
					14,
					0,
				},
				color = Colors.get_color_table_with_alpha("yellow", 255),
				offset = {
					20,
					45,
					4,
				},
			},
			counter_frame = {
				texture_size = counter_frame_settings.texture_size,
				texture_sizes = counter_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					counter_offset[1],
					counter_offset[2],
					6,
				},
				size = {
					25,
					25,
				},
			},
			counter_rect = {
				size = {
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
					counter_offset[1],
					counter_offset[2],
					5,
				},
			},
			available_rect = {
				size = {
					66,
					66,
				},
				color = {
					255,
					0,
					255,
					0,
				},
				offset = {
					-1,
					-1,
					0,
				},
			},
			filled_rect = {
				size = {
					66,
					66,
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-1,
					-1,
					0,
				},
			},
			counter_text = {
				font_size = 15,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				size = {
					25,
					25,
				},
				text_color = Colors.get_color_table_with_alpha("green", 255),
				offset = {
					counter_offset[1],
					counter_offset[2],
					7,
				},
			},
			counter_text_complete = {
				font_size = 15,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				size = {
					25,
					25,
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					counter_offset[1],
					counter_offset[2],
					7,
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
					2,
				},
				size = {
					64,
					64,
				},
			},
			icon = {
				saturated = true,
				size = {
					64,
					64,
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
					1,
				},
			},
		},
		offset = offset or {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.create_simple_item_tooltip = function (scenegraph_id, tooltip_passes)
	return {
		element = {
			passes = {
				{
					item_id = "item",
					pass_type = "item_tooltip",
					style_id = "item",
					content_passes = tooltip_passes,
					content_check_function = function (content)
						return content.item
					end,
				},
			},
		},
		content = {},
		style = {
			item = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255),
				},
				offset = {
					0,
					0,
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

UIWidgets.create_simple_item_presentation = function (scenegraph_id, tooltip_passes, force_equipped, pass_styles)
	return {
		element = {
			passes = {
				{
					item_id = "item",
					pass_type = "item_presentation",
					style_id = "item",
					content_passes = tooltip_passes,
					content_check_function = function (content)
						return content.item
					end,
				},
			},
		},
		content = {
			force_equipped = force_equipped,
		},
		style = {
			pass_styles = pass_styles,
			item = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255),
				},
				offset = {
					0,
					0,
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

UIWidgets.create_reward_slot = function (texture, scenegraph_id, size, masked, retained)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					retained_mode = retained,
				},
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "item_tooltip",
					style_id = "tooltip",
					text_id = "tooltip",
					content_check_function = function (content)
						return content.hotspot.is_hover and content.hotspot.tooltip
					end,
				},
			},
		},
		content = {
			tooltip = "tooltip_text",
			texture_id = texture,
			hotspot = {},
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
				masked = masked,
				size = size,
			},
			hotspot = {
				size = size,
				offset = {
					0,
					0,
					0,
				},
			},
			tooltip = {
				draw_side = "right",
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				size = size,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255),
				},
				offset = {
					0,
					0,
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

UIWidgets.create_talent_tree_background = function (scenegraph_id, size, title_text)
	local background_color = Colors.get_color_table_with_alpha("black", 220)
	local slot_color = Colors.get_color_table_with_alpha("gray", 50)
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "rounded_background",
			style_id = "background",
		},
		{
			pass_type = "rect",
			style_id = "inner_background",
		},
		{
			pass_type = "border",
			style_id = "inner_background_broder",
		},
		{
			pass_type = "rounded_background",
			style_id = "title_background",
		},
		{
			pass_type = "rounded_background",
			style_id = "title_inner_background",
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
		},
	}
	local content = {
		title_text = Localize(title_text),
	}
	local style = {
		background = {
			corner_radius = 5,
			color = background_color,
			offset = {
				0,
				0,
				0,
			},
		},
		inner_background = {
			color = slot_color,
			offset = {
				5,
				5,
				1,
			},
			size = {
				size[1] - 10,
				size[2] - 10,
			},
		},
		inner_background_broder = {
			thickness = 1,
			color = slot_color,
			offset = {
				5,
				5,
				2,
			},
			size = {
				size[1] - 10,
				size[2] - 10,
			},
		},
		title_background = {
			corner_radius = 5,
			color = background_color,
			offset = {
				0,
				size[2] + 5,
				0,
			},
			size = {
				size[1],
				40,
			},
		},
		title_inner_background = {
			corner_radius = 5,
			color = slot_color,
			offset = {
				5,
				size[2] + 10,
				1,
			},
			size = {
				size[1] - 10,
				30,
			},
		},
		title_text = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				size[2] + 5,
				2,
			},
			size = {
				size[1],
				30,
			},
		},
		text = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				20,
				20,
				3,
			},
			size = {
				size[1] - 40,
				size[2] - 40,
			},
		},
	}

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		-40,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_hero_frame = function (scenegraph_id, size, frame_name, background_texture)
	background_texture = background_texture or "menu_frame_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.menu_frame_02

	return {
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
			},
		},
		content = {
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						math.min(size[2] / background_texture_settings.size[2], 1),
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
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
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
end

UIWidgets.create_recipe_grid = function (scenegraph_id, size, rows, slots_per_row, slot_width_spacing, slot_height_spacing)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local background_color = {
		255,
		255,
		255,
		255,
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		80,
		80,
	}
	local slot_size = {
		80,
		80,
	}

	slot_width_spacing = slot_width_spacing or 8
	slot_height_spacing = slot_height_spacing or 8

	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row,
	}
	local style = {}
	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = size[1] - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = size[2] - column_height
	local slot_start_offset = {
		row_difference_to_background / 2,
		size[2] - column_difference_to_background / 2 - slot_size[2],
	}
	local offset_layer = 3

	for i = 1, rows do
		for k = 1, slots_per_row do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer,
			}
			local item_name = "item" .. name_suffix
			local hotspot_name = "hotspot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name,
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset,
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size,
			}

			local item_icon_name = "item_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[item_icon_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					1,
				},
			}

			local slot_background_frame_name = "item_frame" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_background_frame_name,
				style_id = slot_background_frame_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[slot_background_frame_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					4,
				},
			}
			content[hotspot_name][slot_background_frame_name] = "item_frame"

			local slot_craft_frame_name = "item_craft_frame" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_craft_frame_name,
				style_id = slot_craft_frame_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[slot_craft_frame_name] = {
				size = {
					98,
					98,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1] - 9,
					offset[2] - 9,
					6,
				},
			}
			content[hotspot_name][slot_craft_frame_name] = "crafting_bg_03"

			local rarity_texture_name = "rarity_texture" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = rarity_texture_name,
				style_id = rarity_texture_name,
				content_check_function = function (content)
					return content[hotspot_name][item_icon_name] and content[item_name]
				end,
			}
			style[rarity_texture_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					0,
				},
			}
			content[rarity_texture_name] = "icon_bg_default"

			local item_tooltip_name = "item_tooltip" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "item_tooltip",
				text_id = item_tooltip_name,
				style_id = item_tooltip_name,
				item_id = "item" .. name_suffix,
				content_check_function = function (content)
					return content[hotspot_name].is_hover and content[item_name]
				end,
			}
			style[item_tooltip_name] = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				size = slot_size,
				offset = offset,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255),
				},
				offset = offset,
			}
			content[item_tooltip_name] = "tooltip_text"

			local slot_name = "slot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_name,
				style_id = slot_name,
				content_check_function = function (content)
					return not content[item_icon_name] and not content.hide_slot
				end,
			}
			style[slot_name] = {
				size = slot_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					0,
				},
			}
			content[hotspot_name][slot_name] = "menu_slot_frame_01"

			local amount_text_name = "amount_text" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = amount_text_name,
				style_id = amount_text_name,
				content_id = hotspot_name,
				content_check_function = function (content)
					return not content.hide_slot
				end,
			}
			style[amount_text_name] = {
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = icon_size,
				offset = {
					offset[1],
					offset[2] - 44,
					3,
				},
			}
			content[hotspot_name][amount_text_name] = "0/0"

			local amount_text_shadow_name = "amount_text_shadow" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = amount_text_name,
				style_id = amount_text_shadow_name,
				content_id = hotspot_name,
			}
			style[amount_text_shadow_name] = {
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = icon_size,
				offset = {
					offset[1] + 2,
					offset[2] - 44 - 2,
					2,
				},
			}
		end
	end

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

UIWidgets.create_grid = function (scenegraph_id, size, rows, slots_per_row, slot_width_spacing, slot_height_spacing, use_pages, offset, disable_mouse_tooltips)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local background_color = {
		255,
		255,
		255,
		255,
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		80,
		80,
	}
	local slot_size = {
		80,
		80,
	}

	slot_width_spacing = slot_width_spacing or 8
	slot_height_spacing = slot_height_spacing or 8

	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row,
		disable_mouse_tooltips = disable_mouse_tooltips,
	}
	local style = {}

	if use_pages then
		passes[#passes + 1] = {
			pass_type = "text",
			style_id = "page_text",
			text_id = "page_text",
			content_check_function = function (content)
				local page_hotspot_left = content.page_hotspot_left
				local page_hotspot_right = content.page_hotspot_right
				local disabled = page_hotspot_left.disable_button and page_hotspot_right.disable_button

				return not disabled
			end,
		}
		passes[#passes + 1] = {
			content_id = "page_hotspot_left",
			pass_type = "hotspot",
			style_id = "page_arrow_left",
		}
		passes[#passes + 1] = {
			content_id = "page_hotspot_right",
			pass_type = "hotspot",
			style_id = "page_arrow_right",
		}
		passes[#passes + 1] = {
			content_id = "stepper_arrow_normal",
			pass_type = "texture",
			style_id = "page_arrow_left",
			texture_id = "texture_id",
			content_check_function = function (content)
				local page_hotspot_left = content.parent.page_hotspot_left

				return not page_hotspot_left.disable_button and not page_hotspot_left.is_hover
			end,
		}
		passes[#passes + 1] = {
			content_id = "stepper_arrow_normal",
			pass_type = "texture_uv",
			style_id = "page_arrow_right",
			content_check_function = function (content)
				local page_hotspot_right = content.parent.page_hotspot_right

				return not page_hotspot_right.disable_button and not page_hotspot_right.is_hover
			end,
		}
		passes[#passes + 1] = {
			content_id = "stepper_arrow_hover",
			pass_type = "texture",
			style_id = "page_arrow_left",
			texture_id = "texture_id",
			content_check_function = function (content)
				local page_hotspot_left = content.parent.page_hotspot_left

				return not page_hotspot_left.disable_button and page_hotspot_left.is_hover
			end,
		}
		passes[#passes + 1] = {
			content_id = "stepper_arrow_hover",
			pass_type = "texture_uv",
			style_id = "page_arrow_right",
			content_check_function = function (content)
				local page_hotspot_right = content.parent.page_hotspot_right

				return not page_hotspot_right.disable_button and page_hotspot_right.is_hover
			end,
		}
		content.page_hotspot_left = {}
		content.page_hotspot_right = {}
		content.page_text = "n/a"
		content.stepper_arrow_normal = {
			texture_id = "settings_arrow_normal",
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
		}
		content.stepper_arrow_hover = {
			texture_id = "settings_arrow_clicked",
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
		}
		style.page_arrow_left = {
			color = default_color,
			offset = {
				size[1] * 0.4 - 40,
				23,
				1,
			},
			size = {
				28,
				34,
			},
		}
		style.page_arrow_right = {
			color = default_color,
			offset = {
				size[1] * 0.6 + 12,
				23,
				1,
			},
			size = {
				28,
				34,
			},
		}
		style.page_text = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				size[1] * 0.4,
				25,
				2,
			},
			size = {
				size[1] * 0.2,
				30,
			},
		}
	end

	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = size[1] - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = size[2] - column_height
	local slot_start_offset = {
		row_difference_to_background / 2,
		size[2] - column_difference_to_background / 2 - slot_size[2],
	}
	local offset_layer = 3

	for i = 1, rows do
		for k = 1, slots_per_row do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer,
			}
			local item_name = "item" .. name_suffix
			local hotspot_name = "hotspot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name,
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset,
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size,
			}

			local item_icon_name = "item_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[item_icon_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					2,
				},
			}

			local illusion_icon_name = "illusion_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = illusion_icon_name,
				style_id = illusion_icon_name,
				content_check_function = function (content)
					local item = content[item_name]
					local item_skin = item and item.skin

					if item_skin then
						return item.data.item_type == "weapon_skin"
					end
				end,
			}
			style[illusion_icon_name] = {
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
					offset[1],
					offset[2],
					3,
				},
			}
			content[illusion_icon_name] = "item_frame_illusion"

			local favorite_icon_name = "favorite_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = favorite_icon_name,
				style_id = favorite_icon_name,
				content_check_function = function (content)
					local item = content[item_name]
					local backend_id = item and item.backend_id

					if backend_id then
						return ItemHelper.is_favorite_backend_id(backend_id, item)
					end
				end,
			}
			style[favorite_icon_name] = {
				size = {
					20,
					20,
				},
				color = {
					255,
					0,
					150,
					0,
				},
				offset = {
					offset[1] + 8,
					offset[2] + icon_size[2] - 30,
					3,
				},
			}
			content[favorite_icon_name] = "item_favorite_icon"

			local illusion_applied_icon_name = "skin_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = illusion_applied_icon_name,
				style_id = illusion_applied_icon_name,
				content_check_function = function (content)
					local item = content[item_name]
					local item_skin = item and item.skin

					if item_skin then
						return item.data.item_type ~= "weapon_skin" and WeaponSkins.default_skins[item.ItemId] ~= item_skin
					end
				end,
			}
			style[illusion_applied_icon_name] = {
				size = {
					20,
					20,
				},
				color = Colors.get_color_table_with_alpha("promo", 255),
				offset = {
					offset[1] + icon_size[1] - 28,
					offset[2] + 8,
					3,
				},
			}
			content[illusion_applied_icon_name] = "item_applied_illusion_icon"

			local equipped_on_other_career_icon_name = "equipped_other_career_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = equipped_on_other_career_icon_name,
				style_id = equipped_on_other_career_icon_name,
				content_check_function = function (content)
					local item = content[item_name]

					if item then
						local item_data = item.data
						local item_id

						if CosmeticUtils.is_cosmetic_item(item_data.slot_type) then
							item_id = item.ItemId
						else
							item_id = item.backend_id
						end

						if item_id then
							local local_player = Managers.player:local_player()

							if not local_player then
								return false
							end

							local career_index = local_player:career_index()
							local profile_index = local_player:profile_index()
							local current_profile = SPProfiles[profile_index]
							local current_career_settings = current_profile.careers[career_index]
							local current_career_name = current_career_settings.name
							local backend_interface = Managers.backend:get_interface("items")
							local career_names = backend_interface:equipped_by(item_id)

							if #career_names == 1 and table.contains(career_names, current_career_name) then
								return false
							end

							return #career_names ~= 0
						end
					end
				end,
			}
			style[equipped_on_other_career_icon_name] = {
				size = {
					20,
					20,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					offset[1] + 8,
					offset[2] + 8,
					3,
				},
			}
			content[equipped_on_other_career_icon_name] = "equip_multiple_careers_stroke"

			local remove_marked_deed_icon_name = "remove_marked_deed" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = remove_marked_deed_icon_name,
				style_id = remove_marked_deed_icon_name,
				content_check_function = function (content)
					local item = content[item_name]

					return item and item.marked_for_deletion
				end,
			}
			style[remove_marked_deed_icon_name] = {
				size = {
					30,
					60,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					offset[1] + (icon_size[1] / 2 - 15),
					offset[2] + 10,
					5,
				},
			}
			content[remove_marked_deed_icon_name] = "salvage_item_icon"

			local slot_background_frame_name = "item_frame" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_background_frame_name,
				style_id = slot_background_frame_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[slot_background_frame_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					5,
				},
			}
			content[hotspot_name][slot_background_frame_name] = "item_frame"

			local rarity_texture_name = "rarity_texture" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = rarity_texture_name,
				style_id = rarity_texture_name,
				content_check_function = function (content)
					return content[hotspot_name][item_icon_name] and content[item_name]
				end,
			}
			style[rarity_texture_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					0,
				},
			}
			content[rarity_texture_name] = "icon_bg_default"

			local item_tooltip_name = "item_tooltip" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "item_tooltip",
				text_id = item_tooltip_name,
				style_id = item_tooltip_name,
				item_id = "item" .. name_suffix,
				content_check_function = function (content)
					return content[hotspot_name].is_hover and content[item_name] and not content.disable_mouse_tooltips
				end,
			}
			style[item_tooltip_name] = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				size = slot_size,
				offset = offset,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255),
				},
				offset = offset,
			}
			content[item_tooltip_name] = "tooltip_text"

			local slot_name = "slot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_name,
				style_id = slot_name,
				content_check_function = function (content)
					return not content[item_icon_name] and not content.hide_slot
				end,
			}
			style[slot_name] = {
				size = slot_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					0,
				},
			}
			content[hotspot_name][slot_name] = "menu_slot_frame_01"

			local slot_hover_name = "slot_hover" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_hover_name,
				style_id = slot_hover_name,
				content_check_function = function (content)
					return content.highlight or content.is_hover or content.is_selected
				end,
			}
			style[slot_hover_name] = {
				size = {
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
					offset[1] - (128 - slot_size[1]) / 2,
					offset[2] - (128 - slot_size[2]) / 2,
					0,
				},
			}
			content[hotspot_name][slot_hover_name] = "item_icon_hover"

			local slot_equipped_name = "slot_equipped" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_equipped_name,
				style_id = slot_equipped_name,
				content_check_function = function (content)
					return content.equipped
				end,
			}
			style[slot_equipped_name] = {
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
					offset[1] - (80 - slot_size[1]) / 2,
					offset[2] - (80 - slot_size[2]) / 2,
					7,
				},
			}
			content[hotspot_name][slot_equipped_name] = "item_icon_selection"

			local amount_text_name = "amount_text" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = amount_text_name,
				style_id = amount_text_name,
				content_id = hotspot_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[amount_text_name] = {
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = icon_size,
				offset = {
					offset[1] - 7,
					offset[2] - 1,
					4,
				},
			}
			content[hotspot_name][amount_text_name] = ""

			local amount_text_shadow_name = "amount_text_shadow" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = amount_text_name,
				style_id = amount_text_shadow_name,
				content_id = hotspot_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[amount_text_shadow_name] = {
				font_size = 32,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = icon_size,
				offset = {
					offset[1] - 7 + 2,
					offset[2] - 1 - 2,
					3,
				},
			}

			local disabled_name = "disabled_rect" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "rect",
				content_id = hotspot_name,
				style_id = disabled_name,
				content_check_function = function (content)
					return content[item_icon_name] and (content.reserved or content.unwieldable)
				end,
			}
			style[disabled_name] = {
				size = icon_size,
				color = {
					210,
					10,
					10,
					10,
				},
				offset = {
					offset[1],
					offset[2],
					4,
				},
			}

			local unwieldable_name = "unwieldable_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = unwieldable_name,
				content_id = hotspot_name,
				style_id = unwieldable_name,
				content_check_function = function (content)
					return content[item_icon_name] and content.unwieldable
				end,
			}
			style[unwieldable_name] = {
				size = {
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
					offset[1] + icon_size[1] / 2 - 20,
					offset[2] + icon_size[2] / 2 - 20,
					5,
				},
			}
			content[hotspot_name][unwieldable_name] = "tab_menu_icon_03"

			local locked_icon_name = "locked_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = locked_icon_name,
				content_id = hotspot_name,
				style_id = locked_icon_name,
				content_check_function = function (content)
					return content.reserved and content[locked_icon_name]
				end,
			}
			style[locked_icon_name] = {
				size = {
					30,
					60,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1] + icon_size[1] / 2 - 15,
					offset[2] + icon_size[2] / 2 - 30,
					5,
				},
			}
			content[hotspot_name][locked_icon_name] = nil
			passes[#passes + 1] = {
				pass_type = "drag",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}

			local new_frame_settings = UIFrameSettings.frame_outer_glow_01
			local new_frame_width = new_frame_settings.texture_sizes.corner[1]
			local new_icon_name = "new_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture_frame",
				texture_id = new_icon_name,
				style_id = new_icon_name,
				content_check_function = function (content)
					local item = content["item" .. name_suffix]

					return content[new_icon_name] and item and ItemHelper.is_new_backend_id(item.backend_id)
				end,
				content_change_function = function (content, style)
					local item = content["item" .. name_suffix]
					local backend_id = item and item.backend_id

					if item and ItemHelper.is_new_backend_id(backend_id) then
						local progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5

						style.color[1] = 55 + progress * 200

						local hotspot = content[hotspot_name]

						if (hotspot.on_hover_enter or hotspot.is_selected) and ItemHelper.is_new_backend_id(backend_id) then
							ItemHelper.unmark_backend_id_as_new(backend_id)
						end
					end
				end,
			}
			style[new_icon_name] = {
				size = {
					icon_size[1] + new_frame_width * 2,
					icon_size[2] + new_frame_width * 2,
				},
				color = default_color,
				texture_size = new_frame_settings.texture_size,
				texture_sizes = new_frame_settings.texture_sizes,
				offset = {
					offset[1] - new_frame_width,
					offset[2] - new_frame_width,
					10,
				},
			}
			content[new_icon_name] = new_frame_settings.texture
		end
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = offset and {
		offset[1] or 0,
		offset[2] or 0,
		offset[3] or 0,
	} or {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_simple_inventory_item = function (scenegraph_id, size)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local hotspot_name = "button_hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name,
	}
	style[hotspot_name] = {
		size = size,
		offset = {
			0,
			0,
			0,
		},
	}
	content[hotspot_name] = {
		is_selected = false,
		drag_texture_size = size,
	}

	local item_icon_name = "item_icon"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = item_icon_name,
		style_id = item_icon_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end,
	}
	style[item_icon_name] = {
		size = size,
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
	}

	local slot_background_frame_name = "item_frame"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = slot_background_frame_name,
		style_id = slot_background_frame_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end,
	}
	style[slot_background_frame_name] = {
		size = size,
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
	}
	content[slot_background_frame_name] = "item_frame"

	local rarity_texture_name = "rarity_texture"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = rarity_texture_name,
		style_id = rarity_texture_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end,
	}
	style[rarity_texture_name] = {
		size = size,
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
	}
	content[rarity_texture_name] = "icon_bg_default"

	local item_tooltip_name = "item_tooltip"

	passes[#passes + 1] = {
		item_id = "item",
		pass_type = "item_tooltip",
		text_id = item_tooltip_name,
		style_id = item_tooltip_name,
		content_check_function = function (content)
			return content[hotspot_name].is_hover and content[item_icon_name]
		end,
	}
	style[item_tooltip_name] = {
		font_size = 18,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = true,
		max_width = 500,
		vertical_alignment = "top",
		size = size,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		line_colors = {
			Colors.get_color_table_with_alpha("font_title", 255),
			Colors.get_color_table_with_alpha("white", 255),
		},
		offset = {
			0,
			0,
			0,
		},
	}
	content[item_tooltip_name] = "tooltip_text"
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

UIWidgets.create_loadout_grid = function (scenegraph_id, size, rows, spacing, align_horizontal)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local background_color = {
		255,
		255,
		255,
		255,
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		80,
		80,
	}
	local slot_size = {
		80,
		80,
	}
	local slots_per_row = 1

	if align_horizontal then
		slots_per_row = rows
		rows = 1
	end

	local slot_width_spacing = spacing or 30
	local slot_height_spacing = spacing or 30
	local background_width = size[1]
	local background_height = size[2]
	local widget = {
		element = {},
	}
	local passes = {}
	local style = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row,
	}
	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = background_width - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = background_height - column_height
	local slot_start_offset = {
		align_horizontal and row_difference_to_background / 2 or row_difference_to_background / 2,
		background_height - column_difference_to_background / 2 - slot_size[2],
	}
	local offset_layer = 0

	for i = 1, rows do
		for k = 1, slots_per_row do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer,
			}
			local hotspot_name = "hotspot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name,
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset,
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size,
			}

			local item_icon_name = "item_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[item_icon_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					3,
				},
			}

			local slot_background_frame_name = "item_frame" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_background_frame_name,
				style_id = slot_background_frame_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[slot_background_frame_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					4,
				},
			}
			content[hotspot_name][slot_background_frame_name] = "item_frame"

			local rarity_texture_name = "rarity_texture" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = rarity_texture_name,
				style_id = rarity_texture_name,
				content_check_function = function (content)
					return content[hotspot_name][item_icon_name]
				end,
			}
			style[rarity_texture_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					0,
				},
			}
			content[rarity_texture_name] = "icon_bg_default"

			local item_tooltip_name = "item_tooltip" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "item_tooltip",
				text_id = item_tooltip_name,
				style_id = item_tooltip_name,
				item_id = "item" .. name_suffix,
				content_check_function = function (content)
					return content[hotspot_name].is_hover and content[hotspot_name][item_icon_name]
				end,
			}
			style[item_tooltip_name] = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				size = slot_size,
				offset = offset,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255),
				},
				offset = offset,
			}
			content[item_tooltip_name] = "tooltip_text"

			local slot_name = "slot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_name,
				style_id = slot_name,
				content_check_function = function (content)
					return not content[item_icon_name]
				end,
			}
			style[slot_name] = {
				size = slot_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					0,
				},
			}
			content[hotspot_name][slot_name] = "menu_slot_frame_01"

			local slot_icon_name = "slot_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = slot_icon_name,
				style_id = slot_icon_name,
				content_check_function = function (content)
					return not content[hotspot_name][item_icon_name]
				end,
			}
			style[slot_icon_name] = {
				size = {
					34,
					34,
				},
				color = {
					200,
					100,
					100,
					100,
				},
				offset = {
					offset[1] + (slot_size[1] - 34) / 2,
					offset[2] + (slot_size[2] - 34) - (slot_size[1] - 34) / 2,
					2,
				},
			}
			content[slot_icon_name] = "tabs_icon_all_selected"

			local slot_hover_name = "slot_hover" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_hover_name,
				style_id = slot_hover_name,
				content_check_function = function (content)
					return content.highlight or content.is_hover
				end,
			}
			style[slot_hover_name] = {
				size = {
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
					offset[1] - (128 - slot_size[1]) / 2,
					offset[2] - (128 - slot_size[2]) / 2,
					0,
				},
			}
			content[hotspot_name][slot_hover_name] = "item_icon_hover"

			local slot_selected_name = "slot_selected" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_selected_name,
				style_id = slot_selected_name,
				content_check_function = function (content)
					return content.is_selected
				end,
			}
			style[slot_selected_name] = {
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
					offset[1] - (80 - slot_size[1]) / 2,
					offset[2] - (80 - slot_size[2]) / 2,
					8,
				},
			}
			content[hotspot_name][slot_selected_name] = "item_icon_selection"
		end
	end

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

UIWidgets.create_loadout_grid_console = function (scenegraph_id, size, rows, spacing, align_horizontal, allow_customization)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local background_color = {
		255,
		255,
		255,
		255,
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		80,
		80,
	}
	local slot_size = {
		80,
		80,
	}
	local slots_per_row = 1

	if align_horizontal then
		slots_per_row = rows
		rows = 1
	end

	local slot_width_spacing = spacing or 30
	local slot_height_spacing = spacing or 30
	local background_width = size[1]
	local background_height = size[2]
	local widget = {
		element = {},
	}
	local passes = {}
	local style = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row,
	}
	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = background_width - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = background_height - column_height
	local slot_start_offset = {
		align_horizontal and row_difference_to_background / 2 or row_difference_to_background / 2,
		background_height - column_difference_to_background / 2 - slot_size[2],
	}
	local offset_layer = 0

	for i = 1, rows do
		for k = 1, slots_per_row do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer,
			}
			local hotspot_name = "hotspot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name,
			}
			style[hotspot_name] = {
				size = {
					slot_size[1] + 414,
					slot_size[2] + 40,
				},
				offset = {
					offset[1] - 20,
					offset[2] - 20,
				},
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size,
			}

			if allow_customization then
				local cog_icon_size = {
					58,
					58,
				}
				local customize_hotspot_name = "customize_hotspot" .. name_suffix

				passes[#passes + 1] = {
					pass_type = "hotspot",
					content_id = customize_hotspot_name,
					style_id = customize_hotspot_name,
					content_check_function = function (content)
						local item_id = "item" .. name_suffix
						local parent_content = content.parent
						local item = parent_content[item_id]

						if not item then
							parent_content[item_id .. "_disabled"] = true

							return false
						end

						local item_data = item.data
						local rarity = item.rarity or item_data.rarity or "default"

						if rarity == "default" or rarity == "promo" then
							parent_content[item_id .. "_disabled"] = true

							return false
						end

						return true
					end,
				}
				style[customize_hotspot_name] = {
					horizontal_alignment = "left",
					vertical_alignment = "center",
					color = {
						255,
						96,
						96,
						96,
					},
					size = cog_icon_size,
					texture_size = cog_icon_size,
					offset = {
						offset[1] - cog_icon_size[1] - 25,
						offset[2] + slot_size[2] * 0.5 - cog_icon_size[2] * 0.5,
						30,
					},
				}
				content[customize_hotspot_name] = {
					drag_texture_size = slot_size,
				}

				local customize_item_name = "customize_item" .. name_suffix

				passes[#passes + 1] = {
					pass_type = "texture",
					texture_id = "customize_id",
					style_id = customize_hotspot_name,
					content_check_function = function (content)
						local item_customization_disabled_id = "item" .. name_suffix .. "_disabled"
						local item_customization_disabled = content[item_customization_disabled_id]

						if item_customization_disabled then
							return false
						end

						local hotspot = content[customize_hotspot_name]

						return not hotspot.is_hover
					end,
				}
				content.customize_id = "cog_icon"

				local customize_item_hover_name = "customize_item_hover" .. name_suffix

				passes[#passes + 1] = {
					pass_type = "texture",
					texture_id = "customize_hover_id",
					style_id = customize_item_hover_name,
					content_check_function = function (content)
						local item_customization_disabled_id = "item" .. name_suffix .. "_disabled"
						local item_customization_disabled = content[item_customization_disabled_id]

						if item_customization_disabled then
							return false
						end

						if content.is_gamepad_active then
							local hotspot = content["hotspot" .. name_suffix]

							return hotspot.is_selected
						else
							local hotspot = content[customize_hotspot_name]

							return hotspot.is_hover
						end
					end,
				}
				content.customize_hover_id = "cog_icon_selected"
				style[customize_item_hover_name] = {
					horizontal_alignment = "left",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					size = cog_icon_size,
					texture_size = cog_icon_size,
					offset = {
						offset[1] - cog_icon_size[1] - 25,
						offset[2] + slot_size[2] * 0.5 - cog_icon_size[2] * 0.5,
						30,
					},
				}
			end

			local tooltip_hotspot_name = "tooltip_hotspot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = tooltip_hotspot_name,
				style_id = tooltip_hotspot_name,
			}
			style[tooltip_hotspot_name] = {
				size = slot_size,
				offset = offset,
			}
			content[tooltip_hotspot_name] = {
				drag_texture_size = slot_size,
			}

			local item_icon_name = "item_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[item_icon_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					3,
				},
			}

			local slot_background_frame_name = "item_frame" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_background_frame_name,
				style_id = slot_background_frame_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[slot_background_frame_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					4,
				},
			}
			content[hotspot_name][slot_background_frame_name] = "item_frame"

			local rarity_texture_name = "rarity_texture" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = rarity_texture_name,
				style_id = rarity_texture_name,
				content_check_function = function (content)
					return content[hotspot_name][item_icon_name]
				end,
			}
			style[rarity_texture_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					0,
				},
			}
			content[rarity_texture_name] = "icon_bg_default"

			local item_id = "item" .. name_suffix
			local item_tooltip_name = "item_tooltip" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "item_tooltip",
				text_id = item_tooltip_name,
				style_id = item_tooltip_name,
				item_id = item_id,
				content_check_function = function (content)
					return content[tooltip_hotspot_name].is_hover and content[hotspot_name][item_icon_name]
				end,
			}
			style[item_tooltip_name] = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				size = slot_size,
				offset = offset,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255),
				},
				offset = offset,
			}
			content[item_tooltip_name] = "tooltip_text"

			local slot_name = "slot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_name,
				style_id = slot_name,
			}
			style[slot_name] = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				size = slot_size,
				texture_size = {
					185,
					182,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					-2,
				},
			}
			content[hotspot_name][slot_name] = "loadout_item_slot_console"

			local title_bg_name = "title_bg" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture_uv",
				content_id = title_bg_name,
				style_id = title_bg_name,
			}
			style[title_bg_name] = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				size = slot_size,
				texture_size = {
					414,
					118,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					offset[1] + slot_size[1] / 2,
					offset[2],
					-5,
				},
			}
			content[title_bg_name] = {
				texture_id = "item_slot_side_fade",
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
			}

			local title_bg_effect_name = "title_bg_effect" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = title_bg_effect_name,
				style_id = title_bg_effect_name,
				content_check_function = function (content)
					local hotspot = content[hotspot_name]

					return hotspot.highlight or hotspot.is_hover
				end,
			}
			style[title_bg_effect_name] = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				size = slot_size,
				texture_size = {
					414,
					126,
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					offset[1] + slot_size[1] / 2,
					offset[2],
					-4,
				},
			}
			content[title_bg_effect_name] = "item_slot_side_effect"

			local title_text_name = "title_text" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = title_text_name,
				style_id = title_text_name,
				content_check_function = function (content)
					local hotspot = content[hotspot_name]

					return content[item_id] and not hotspot.highlight and not hotspot.is_hover
				end,
				content_change_function = function (content, style)
					local item = content[item_id]
					local item_data = item.data
					local item_type = item_data.item_type

					content[title_text_name] = item_type
				end,
			}
			style[title_text_name] = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				size = slot_size,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					offset[1] + 130,
					offset[2] - 6,
					5,
				},
			}
			content[title_text_name] = Localize("not_assigned")

			local title_text_selected_name = "title_text_selected" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = title_text_name,
				style_id = title_text_selected_name,
				content_check_function = function (content)
					local hotspot = content[hotspot_name]

					return content[item_id] and (hotspot.highlight or hotspot.is_hover)
				end,
				content_change_function = function (content, style)
					local item = content[item_id]
					local item_data = item.data
					local item_type = item_data.item_type

					content[title_text_name] = item_type
				end,
			}
			style[title_text_selected_name] = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				size = slot_size,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					offset[1] + 130,
					offset[2] - 6,
					5,
				},
			}

			local title_shadow_text_name = "title_shadow_text" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = title_text_name,
				style_id = title_shadow_text_name,
				content_check_function = function (content)
					return content[item_id]
				end,
			}
			style[title_shadow_text_name] = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				size = slot_size,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					offset[1] + 130 + 2,
					offset[2] - 8,
					4,
				},
			}

			local sub_title_text_name = "sub_title_text" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = sub_title_text_name,
				style_id = sub_title_text_name,
				content_check_function = function (content)
					return content[item_id]
				end,
				content_change_function = function (content, style)
					local item = content[item_id]
					local _, display_name = UIUtils.get_ui_information_from_item(item)

					content[sub_title_text_name] = display_name
				end,
			}
			style[sub_title_text_name] = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "top",
				size = slot_size,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					offset[1] + 130,
					offset[2] - 46,
					5,
				},
			}
			content[hotspot_name][sub_title_text_name] = Localize("not_assigned")

			local sub_title_shadow_text_name = "sub_title_shadow_text" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				text_id = sub_title_text_name,
				style_id = sub_title_shadow_text_name,
				content_check_function = function (content)
					return content[item_id]
				end,
			}
			style[sub_title_shadow_text_name] = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				vertical_alignment = "top",
				size = slot_size,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					offset[1] + 130 + 2,
					offset[2] - 48,
					4,
				},
			}

			local slot_icon_name = "slot_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = slot_icon_name,
				style_id = slot_icon_name,
				content_check_function = function (content)
					return not content[hotspot_name][item_icon_name]
				end,
			}
			style[slot_icon_name] = {
				size = {
					34,
					34,
				},
				color = {
					200,
					100,
					100,
					100,
				},
				offset = {
					offset[1] + (slot_size[1] - 34) / 2,
					offset[2] + (slot_size[2] - 34) - (slot_size[1] - 34) / 2,
					2,
				},
			}
			content[slot_icon_name] = "tabs_icon_all_selected"

			local slot_hover_name = "slot_hover" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_hover_name,
				style_id = slot_hover_name,
				content_check_function = function (content)
					return content.highlight or content.is_hover
				end,
			}
			style[slot_hover_name] = {
				size = {
					185,
					182,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1] - (185 - slot_size[1]) / 2,
					offset[2] - (182 - slot_size[2]) / 2,
					4,
				},
			}
			content[hotspot_name][slot_hover_name] = "loadout_item_slot_glow_console"

			local slot_selected_name = "slot_selected" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_selected_name,
				style_id = slot_selected_name,
				content_check_function = function (content)
					return content.is_selected
				end,
			}
			style[slot_selected_name] = {
				size = {
					80,
					80,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					offset[1] - (80 - slot_size[1]) / 2,
					offset[2] - (80 - slot_size[2]) / 2,
					8,
				},
			}
			content[hotspot_name][slot_selected_name] = "item_icon_selection"
		end
	end

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

UIWidgets.create_inventory_statistics = function (scenegraph_id, size, background_texture)
	local background_color = Colors.get_color_table_with_alpha("black", 220)
	local slot_color = Colors.get_color_table_with_alpha("gray", 50)

	background_texture = background_texture or "menu_frame_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_02
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "background",
			pass_type = "texture_uv",
			style_id = "background",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "divider",
			texture_id = "divider",
		},
		{
			pass_type = "border",
			style_id = "inner_background_broder",
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "value_text",
			text_id = "value_text",
		},
		{
			pass_type = "text",
			style_id = "value_title_text",
			text_id = "value_title_text",
		},
	}
	local content = {
		divider = "summary_screen_line_breaker",
		value_text = "n/a",
		value_title_text = "n/a",
		frame = frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					size[1] / background_texture_settings.size[1],
					size[2] / background_texture_settings.size[2],
				},
			},
			texture_id = background_texture,
		},
		title_text = Localize("lorebook_statistics"),
	}
	local style = {
		divider = {
			size = {
				350,
				22,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] / 2 - 175,
				size[2] - 90,
				1,
			},
		},
		background = {
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
		inner_background_broder = {
			thickness = 1,
			color = slot_color,
			offset = {
				5,
				5,
				2,
			},
			size = {
				size[1] - 10,
				size[2] - 10,
			},
		},
		title_text = {
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				size[2] - 55,
				2,
			},
			size = {
				size[1],
				30,
			},
		},
		value_title_text = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				15,
				0,
				3,
			},
			size = {
				size[1],
				size[2] - 105,
			},
		},
		value_text = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "right",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				-15,
				0,
				3,
			},
			size = {
				size[1],
				size[2] - 105,
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

UIWidgets.create_weapon_statistics = function (scenegraph_id, size)
	local font_default_color = Colors.get_color_table_with_alpha("font_default", 255)
	local font_title_color = Colors.get_color_table_with_alpha("font_title", 255)
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture",
			style_id = "divider_left",
			texture_id = "divider_right",
		},
		{
			pass_type = "texture",
			style_id = "divider_right",
			texture_id = "divider_left",
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "title_text_left",
			text_id = "title_text_left",
		},
		{
			pass_type = "text",
			style_id = "title_text_right",
			text_id = "title_text_right",
		},
	}
	local content = {
		divider_left = "journal_marker_right",
		divider_right = "journal_marker_left",
		title_text = "n/a",
		title_text_left = "n/a",
		title_text_right = "n/a",
	}
	local style = {
		divider_left = {
			size = {
				124,
				13,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				size[2] - 13,
				0,
			},
		},
		divider_right = {
			size = {
				124,
				13,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				size[1] - 124,
				size[2] - 13,
				0,
			},
		},
		background = {
			color = Colors.get_color_table_with_alpha("red", 10),
			offset = {
				0,
				0,
				0,
			},
		},
		title_text = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			text_color = font_title_color,
			offset = {
				0,
				size[2] - 13,
				0,
			},
			size = {
				size[1],
				13,
			},
		},
		title_text_left = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			text_color = font_title_color,
			offset = {
				5,
				size[2] - 50,
				0,
			},
			size = {
				size[1],
				20,
			},
		},
		title_text_right = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			text_color = font_title_color,
			offset = {
				-5,
				size[2] - 50,
				0,
			},
			size = {
				size[1],
				20,
			},
		},
	}

	for i = 1, 5 do
		local height_offset = size[2] - 20 * i - 50
		local spacing = {
			2,
			0,
		}
		local texture_size = {
			20,
			20,
		}
		local value_title_text_name = "value_title_text_" .. i

		passes[#passes + 1] = {
			pass_type = "text",
			style_id = value_title_text_name,
			text_id = value_title_text_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end,
		}
		style[value_title_text_name] = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = font_default_color,
			offset = {
				0,
				height_offset,
				0,
			},
			size = {
				size[1],
				20,
			},
		}

		local multi_texture_name = "stars_left_bg_" .. i

		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end,
		}
		style[multi_texture_name] = {
			axis = 1,
			direction = 1,
			draw_count = 5,
			texture_size = texture_size,
			spacing = spacing,
			color = {
				255,
				50,
				50,
				50,
			},
			offset = {
				5,
				height_offset,
				3,
			},
		}
		content[multi_texture_name] = {
			"stats_star",
			"stats_star",
			"stats_star",
			"stats_star",
			"stats_star",
		}
		multi_texture_name = "stars_left_1_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end,
		}
		style[multi_texture_name] = {
			axis = 1,
			direction = 1,
			draw_count = 0,
			texture_size = texture_size,
			spacing = spacing,
			color = font_default_color,
			offset = {
				5,
				height_offset,
				3,
			},
		}
		content[multi_texture_name] = {
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
		}
		multi_texture_name = "stars_left_2_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end,
		}
		style[multi_texture_name] = {
			axis = 1,
			direction = 1,
			draw_count = 0,
			texture_size = texture_size,
			spacing = spacing,
			color = font_default_color,
			offset = {
				5,
				height_offset,
				3,
			},
		}
		content[multi_texture_name] = {
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
		}

		local width_offset = size[1] - 5 - (texture_size[1] * 5 + spacing[1] * 4)

		multi_texture_name = "stars_right_bg_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end,
		}
		style[multi_texture_name] = {
			axis = 1,
			direction = 1,
			draw_count = 5,
			texture_size = texture_size,
			spacing = spacing,
			color = {
				255,
				50,
				50,
				50,
			},
			offset = {
				width_offset,
				height_offset,
				3,
			},
		}
		content[multi_texture_name] = {
			"stats_star",
			"stats_star",
			"stats_star",
			"stats_star",
			"stats_star",
		}
		multi_texture_name = "stars_right_1_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end,
		}
		style[multi_texture_name] = {
			axis = 1,
			direction = 1,
			draw_count = 0,
			texture_size = texture_size,
			spacing = spacing,
			color = font_default_color,
			offset = {
				width_offset,
				height_offset,
				3,
			},
		}
		content[multi_texture_name] = {
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
		}
		multi_texture_name = "stars_right_2_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end,
		}
		style[multi_texture_name] = {
			axis = 1,
			direction = 1,
			draw_count = 0,
			texture_size = texture_size,
			spacing = spacing,
			color = font_default_color,
			offset = {
				width_offset,
				height_offset,
				3,
			},
		}
		content[multi_texture_name] = {
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
		}
	end

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

UIWidgets.create_background_with_frame = function (scenegraph_id, size, background_texture, frame_style, bottom_aligned)
	background_texture = background_texture or "menu_frame_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local background_size = background_texture_settings and background_texture_settings.size or size
	local frame_settings = frame_style and UIFrameSettings[frame_style] or UIFrameSettings.menu_frame_02
	local uvs

	if bottom_aligned then
		uvs = {
			{
				1 - math.min(size[1] / background_size[1], 1),
				1 - math.min(size[2] / background_size[2], 1),
			},
			{
				1,
				1,
			},
		}
	else
		uvs = {
			{
				0,
				0,
			},
			{
				math.min(size[1] / background_size[1], 1),
				math.min(size[2] / background_size[2], 1),
			},
		}
	end

	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "background",
			pass_type = "texture_uv",
			style_id = "background",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
	}
	local content = {
		frame = frame_settings.texture,
		background = {
			uvs = uvs,
			texture_id = background_texture,
		},
	}
	local style = {
		background = {
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
				10,
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

UIWidgets.create_rect_with_frame = function (scenegraph_id, size, rect_color, frame_style)
	local frame_settings = frame_style and UIFrameSettings[frame_style] or UIFrameSettings.menu_frame_02
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "rect",
			style_id = "background",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
	}
	local content = {
		frame = frame_settings.texture,
	}
	local style = {
		background = {
			color = rect_color or {
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
				5,
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

UIWidgets.create_rect_with_inner_rect_frame = function (scenegraph_id, size, background_color, rect_color, retained_mode)
	local rect_thickness = 1
	local rect_z_offset = 1
	local passes = {
		{
			pass_type = "rect",
			style_id = "background",
			retained_mode = retained_mode,
		},
		{
			pass_type = "rect",
			style_id = "bot_rect",
			retained_mode = retained_mode,
		},
		{
			pass_type = "rect",
			style_id = "top_rect",
			retained_mode = retained_mode,
		},
		{
			pass_type = "rect",
			style_id = "left_rect",
			retained_mode = retained_mode,
		},
		{
			pass_type = "rect",
			style_id = "right_rect",
			retained_mode = retained_mode,
		},
	}
	local content = {}
	local style = {
		background = {
			color = background_color,
		},
		bot_rect = {
			color = rect_color,
			size = {
				size[1],
				rect_thickness,
			},
			offset = {
				0,
				0,
				rect_z_offset,
			},
		},
		top_rect = {
			color = rect_color,
			size = {
				size[1],
				rect_thickness,
			},
			offset = {
				0,
				size[2] - rect_thickness,
				rect_z_offset,
			},
		},
		left_rect = {
			color = rect_color,
			size = {
				rect_thickness,
				size[2],
			},
			offset = {
				0,
				0,
				rect_z_offset,
			},
		},
		right_rect = {
			color = rect_color,
			size = {
				rect_thickness,
				size[2],
			},
			offset = {
				size[1] - rect_thickness,
				0,
				rect_z_offset,
			},
		},
	}
	local widget = {
		element = {
			passes = passes,
		},
		content = content,
		style = style,
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}

	return widget
end

UIWidgets.create_background = function (scenegraph_id, size, background_texture, optional_color)
	background_texture = background_texture or "menu_frame_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "background",
			pass_type = "texture_uv",
			style_id = "background",
		},
	}
	local content = {
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
	}
	local style = {
		background = {
			color = optional_color or {
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

UIWidgets.create_frame = function (scenegraph_id, size, frame_style, layer, color, frame_margins, masked, use_tiling, mirrored_tiling, skip_background)
	local frame_settings = frame_style and UIFrameSettings[frame_style] or UIFrameSettings.menu_frame_02
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
	}
	local content = {
		frame = frame_settings.texture,
	}
	local style = {
		frame = {
			masked = masked,
			frame_margins = frame_margins,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = color or {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				layer or 5,
			},
			skip_background = skip_background,
			use_tiling = use_tiling,
			mirrored_tiling = mirrored_tiling,
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

UIWidgets.create_rect_with_outer_frame = function (scenegraph_id, size, frame_style, layer, color, frame_color)
	color = color or {
		255,
		255,
		255,
		255,
	}

	local frame_settings = frame_style and UIFrameSettings[frame_style] or UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local frame_size = {
		size[1] + edge_height * 2,
		size[2] + edge_height * 2,
	}
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "rect",
			style_id = "rect",
		},
	}
	local content = {
		frame = frame_settings.texture,
	}
	local style = {
		frame = {
			color = frame_color or color,
			size = frame_size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			offset = {
				-edge_height,
				-edge_height,
				layer or 0,
			},
		},
		rect = {
			color = color,
			offset = {
				0,
				0,
				layer or 0,
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

UIWidgets.create_craft_recipe_window = function (scenegraph_id, size, num_components, background_texture)
	local default_color = Colors.get_color_table_with_alpha("white", 255)
	local background_texture = background_texture or "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local title_detail_length = size[1] * 0.3
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "background",
			pass_type = "texture_uv",
			style_id = "background",
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
		},
		{
			pass_type = "text",
			style_id = "sub_title_text",
			text_id = "sub_title_text",
		},
		{
			pass_type = "text",
			style_id = "description_text",
			text_id = "description_text",
		},
		{
			pass_type = "texture",
			style_id = "component_divider_top",
			texture_id = "component_divider",
		},
	}
	local content = {
		component_divider = "journal_page_divider_01_large",
		description_text = "n/a",
		sub_title_text = "n/a",
		title_text = "n/a",
		background = {
			uvs = {
				{
					0,
					0,
				},
				{
					size[1] / background_texture_settings.size[1],
					size[2] / background_texture_settings.size[2],
				},
			},
			texture_id = background_texture,
		},
	}
	local style = {
		component_divider_top = {
			size = {
				430,
				20,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] / 2 - 215,
				size[2] - 110,
				1,
			},
		},
		background = {
			color = default_color,
		},
		title_text = {
			font_size = 32,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			vertical_alignment = "top",
			text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
			offset = {
				20,
				size[2] - 35,
				3,
			},
			size = {
				size[1] - 40,
				30,
			},
		},
		sub_title_text = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
			offset = {
				20,
				size[2] - 75,
				3,
			},
			size = {
				size[1] - 40,
				30,
			},
		},
		description_text = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
			offset = {
				20,
				size[2] - 130,
				2,
			},
			size = {
				size[1] - 40,
				30,
			},
		},
	}
	local icon_size = {
		50,
		50,
	}
	local components_start_offset = {
		20,
		size[2] - icon_size[1] - 230,
		3,
	}
	local row_height = icon_size[2]
	local row_spacing = 20

	content.component_amount = num_components

	for i = 1, num_components do
		local index = i - 1
		local name_suffix = "_" .. tostring(i)
		local offset = {
			components_start_offset[1],
			components_start_offset[2] - (index * row_height + index * row_spacing),
			components_start_offset[3],
		}
		local component_active = "component_active" .. name_suffix

		content[component_active] = false

		local component_icon = "component_icon" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = component_icon,
			style_id = component_icon,
			content_check_function = function (content)
				return content[component_active]
			end,
		}
		style[component_icon] = {
			size = icon_size,
			offset = offset,
			color = default_color,
		}
		content[component_icon] = "icons_placeholder"

		local component_text = "component_text" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = component_text,
			style_id = component_text,
			content_check_function = function (content)
				return content[component_active]
			end,
		}
		style[component_text] = {
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
			size = {
				size[1] - components_start_offset[1] * 2 - icon_size[1] - 5,
				icon_size[2],
			},
			offset = {
				offset[1] + icon_size[1] + 5,
				offset[2],
				offset[3],
			},
			color = default_color,
		}
		content[component_text] = Localize("not_assigned")
	end

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

UIWidgets.create_hero_view_button = function (scenegraph_id, size, text, background_texture, masked)
	background_texture = background_texture or "button_frame_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local glass_frame_settings = UIFrameSettings.menu_frame_glass_01
	local frame_settings = UIFrameSettings.menu_frame_04

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					content_check_function = function (content)
						return not content.disabled
					end,
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "glas_frame",
					texture_id = "glas_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and content.button_hotspot.is_clicked > 0
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "glas_frame_pressed",
					texture_id = "glas_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled or content.button_hotspot.is_clicked == 0
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled
					end,
				},
				{
					pass_type = "text",
					style_id = "text_disabled",
					text_id = "text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled
					end,
				},
				{
					pass_type = "texture",
					style_id = "arrow_left",
					texture_id = "arrow_left",
				},
				{
					pass_type = "texture",
					style_id = "arrow_right",
					texture_id = "arrow_right",
				},
				{
					pass_type = "texture",
					style_id = "arrow_top",
					texture_id = "arrow_top",
				},
				{
					pass_type = "texture",
					style_id = "arrow_bottom",
					texture_id = "arrow_bottom",
				},
			},
		},
		content = {
			arrow_bottom = "menu_frame_04_bottom",
			arrow_left = "menu_frame_04_left",
			arrow_right = "menu_frame_04_right",
			arrow_top = "menu_frame_04_top",
			button_hotspot = {},
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2],
					},
				},
				texture_id = background_texture,
			},
			text = text or "n/a",
			frame = frame_settings.texture,
			glas_frame = glass_frame_settings.texture,
		},
		style = {
			arrow_left = {
				size = {
					17,
					21,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-9,
					size[2] / 2 - 10.5,
					5,
				},
			},
			arrow_right = {
				size = {
					17,
					21,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 8,
					size[2] / 2 - 10.5,
					5,
				},
			},
			arrow_top = {
				size = {
					21,
					17,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] / 2 - 8.5,
					size[2] - 8,
					5,
				},
			},
			arrow_bottom = {
				size = {
					21,
					17,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] / 2 - 8.5,
					-9,
					5,
				},
			},
			text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					2,
				},
			},
			text_disabled = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					2,
				},
			},
			frame = {
				offset = {
					0,
					0,
					4,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
			},
			glas_frame = {
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				texture_size = glass_frame_settings.texture_size,
				texture_sizes = glass_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					3,
				},
			},
			glas_frame_pressed = {
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				texture_size = glass_frame_settings.texture_size,
				texture_sizes = glass_frame_settings.texture_sizes,
				color = {
					150,
					255,
					255,
					255,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					3,
				},
			},
			background = {
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
				masked = masked,
			},
			texture_id = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					0,
				},
				masked = masked,
			},
			texture_hover_id = {
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
				masked = masked,
			},
			texture_selected_id = {
				size = {
					100,
					100,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-25,
					-25,
					0,
				},
				masked = masked,
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.create_reward_slot_grid = function (scenegraph_id, size, slot_size, grid_offset, rows, slots_per_row, background_texture)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 50)
	local slot_hover_color = Colors.get_color_table_with_alpha("gray", 50)
	local slot_selected_color = Colors.get_color_table_with_alpha("font_title", 50)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local slot_width_spacing = 10
	local slot_height_spacing = 10
	local background_width = size[1]
	local background_height = size[2]
	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = background_width - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = background_height - column_height
	local slot_start_offset = {
		row_difference_to_background / 2 + grid_offset[1],
		background_height - column_difference_to_background / 2 - slot_size[2] + grid_offset[2],
	}
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row,
	}
	local style = {}
	local offset_layer = 0

	for i = 1, rows do
		for k = 1, slots_per_row do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer,
			}
			local hotspot_name = "hotspot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name,
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset,
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size,
			}

			local item_icon_name = "item_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end,
			}
			style[item_icon_name] = {
				size = slot_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					offset[2] + (slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					4,
				},
			}

			local slot_background_rect_name = "slot_bg" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "rounded_background",
				style_id = slot_background_rect_name,
			}
			style[slot_background_rect_name] = {
				corner_radius = 0,
				size = slot_size,
				color = slot_color,
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					offset[2] + (slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					2,
				},
			}

			local slot_border_name = "slot_border" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture_frame",
				content_id = hotspot_name,
				texture_id = slot_border_name,
				style_id = slot_border_name,
			}

			local slot_border_settings = UIFrameSettings.menu_frame_01

			style[slot_border_name] = {
				size = slot_size,
				texture_size = slot_border_settings.texture_size,
				texture_sizes = slot_border_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					offset[1],
					offset[2],
					5,
				},
			}
			content[hotspot_name][slot_border_name] = slot_border_settings.texture

			local slot_hover_glow = "slot_glow_hover" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "rounded_background",
				content_id = hotspot_name,
				style_id = slot_hover_glow,
				content_check_function = function (content)
					return content.is_hover
				end,
			}
			style[slot_hover_glow] = {
				corner_radius = 0,
				size = slot_size,
				color = slot_hover_color,
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					offset[2] + (slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					2,
				},
			}

			local slot_selected_glow = "slot_glow_selected" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "rounded_background",
				content_id = hotspot_name,
				style_id = slot_selected_glow,
				content_check_function = function (content)
					return content.is_selected
				end,
			}
			style[slot_selected_glow] = {
				corner_radius = 0,
				size = slot_size,
				color = slot_selected_color,
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					offset[2] + (slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					2,
				},
			}

			local item_tooltip_name = "item_tooltip" .. name_suffix

			content[item_tooltip_name] = {}
			passes[#passes + 1] = {
				pass_type = "generic_tooltip",
				style_id = item_tooltip_name,
				content_id = hotspot_name,
				content_check_function = function (content)
					return content.is_hover and content[item_tooltip_name]
				end,
			}
			style[item_tooltip_name] = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				max_width = 500,
				vertical_alignment = "top",
				size = slot_size,
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					offset[2] + (slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					2,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				text_styles = {},
				value_styles = {},
			}
		end
	end

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

UIWidgets.create_reward_card = function (scenegraph_id, size)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local background_color = {
		220,
		20,
		15,
		15,
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		300,
		300,
	}
	local item_offset = {
		size[1] / 2 - icon_size[1] / 2,
		size[2] - icon_size[2] - math.floor(size[2] * 0.1),
		3,
	}
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local hotspot_name = "button_hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name,
	}
	style[hotspot_name] = {
		size = size,
		offset = {
			0,
			0,
			0,
		},
	}
	content[hotspot_name] = {
		disable_button = true,
		is_selected = false,
		drag_texture_size = size,
	}

	local item_icon_name = "item_icon"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = item_icon_name,
		style_id = item_icon_name,
		content_check_function = function (content)
			return not content.disable_button and content[item_icon_name]
		end,
	}
	style[item_icon_name] = {
		size = icon_size,
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			item_offset[1],
			item_offset[2],
			item_offset[3] + 3,
		},
	}
	content[hotspot_name][item_icon_name] = "icons_placeholder"

	local can_use_texture_name = "can_use_texture"

	passes[#passes + 1] = {
		pass_type = "centered_texture_amount",
		texture_id = can_use_texture_name,
		style_id = can_use_texture_name,
		content_check_function = function (content)
			return content[hotspot_name][item_icon_name]
		end,
	}
	style[can_use_texture_name] = {
		spacing = 5,
		texture_amount = 0,
		texture_axis = 1,
		texture_size = {
			40,
			40,
		},
		size = {
			size[1],
			20,
		},
		color = {
			255,
			0,
			0,
			0,
		},
		offset = {
			0,
			60,
			4,
		},
	}
	content[can_use_texture_name] = {
		"stats_star",
		"stats_star",
		"stats_star",
		"stats_star",
		"stats_star",
	}

	local item_title_text_name = "item_title_text"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = item_title_text_name,
		style_id = item_title_text_name,
	}
	style[item_title_text_name] = {
		font_size = 32,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		vertical_alignment = "bottom",
		word_wrap = true,
		size = {
			size[1] - 20,
			item_offset[2] - 40,
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			10,
			item_offset[2] - 40,
			item_offset[3] + 4,
		},
	}
	content[item_title_text_name] = Localize("not_assigned")

	local item_type_text_name = "item_type_text"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = item_type_text_name,
		style_id = item_type_text_name,
	}
	style[item_type_text_name] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		vertical_alignment = "top",
		word_wrap = true,
		size = {
			size[1] - 20,
			item_offset[2] - 40,
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			10,
			0,
			item_offset[3] + 4,
		},
	}
	content[item_type_text_name] = Localize("not_assigned")
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

UIWidgets.create_score_topic = function (scenegraph_id, size)
	local background_texture = "menu_frame_bg_04"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local inner_background_texture = "menu_frame_bg_02"
	local inner_background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(inner_background_texture)
	local icon_size = {
		148,
		163,
	}
	local icon_offset = {
		size[1] / 2 - icon_size[1] / 2,
		size[2] / 2 - icon_size[2] / 2,
		3,
	}
	local frame_settings = UIFrameSettings.menu_frame_03

	return {
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
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_bg",
					texture_id = "icon_bg",
				},
				{
					pass_type = "text",
					style_id = "description_text",
					text_id = "description_text",
				},
			},
		},
		content = {
			description_text = "n/a",
			icon_bg = "scoreboard_topic_01",
			title_text = "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2],
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			description_text = {
				default_font_size = 48,
				font_size = 48,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 0),
				size = {
					size[1] * 0.8,
					size[2] / 2,
				},
				offset = {
					size[1] * 0.1,
					10,
					5,
				},
				default_offset = {
					size[1] * 0.1,
					10,
					5,
				},
			},
			title_text = {
				default_font_size = 24,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 0),
				size = {
					size[1] * 0.8,
					size[2] * 0.3,
				},
				offset = {
					size[1] * 0.1,
					size[2] * 0.72,
					5,
				},
				default_offset = {
					size[1] * 0.1,
					size[2] * 0.72,
					5,
				},
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			background = {
				size = size,
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
				size = icon_size,
				default_size = icon_size,
				offset = {
					icon_offset[1],
					icon_offset[2],
					icon_offset[3] + 1,
				},
				default_offset = {
					icon_offset[1],
					icon_offset[2],
					icon_offset[3] + 1,
				},
				color = Colors.get_color_table_with_alpha("white", 0),
			},
			icon_bg = {
				size = icon_size,
				offset = icon_offset,
				default_size = icon_size,
				default_offset = icon_offset,
				color = {
					0,
					40,
					40,
					40,
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
end

UIWidgets.create_experience_entry = function (scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "description_text",
					text_id = "description_text",
				},
			},
		},
		content = {
			description_text = "n/a",
			title_text = "n/a",
		},
		style = {
			title_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 0),
				offset = {
					0,
					0,
					0,
				},
			},
			description_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_title", 0),
				offset = {
					0,
					-size[2],
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
end

UIWidgets.create_background_masked_text = function (scenegraph_id, size, text, background_texture, font_size, color, text_style, optional_font_style, retained)
	background_texture = background_texture or "reward_pop_up_item_bg"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)

	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					retained_mode = retained,
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
					retained_mode = retained,
				},
			},
		},
		content = {
			text = text,
			color = text_style and text_style.text_color or color,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						math.min(size[2] / background_texture_settings.size[2], 1),
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			text = text_style or {
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				font_type = optional_font_style or "hell_shark_write_mask",
				text_color = color,
				offset = {
					0,
					0,
					2,
				},
			},
			background = {
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

UIWidgets.create_summary_entry = function (scenegraph_id, size, index)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "summary_text",
					text_id = "summary_text",
				},
				{
					pass_type = "text",
					style_id = "summary_text_shadow",
					text_id = "summary_text",
				},
				{
					pass_type = "text",
					style_id = "xp_text",
					text_id = "xp_text",
				},
				{
					pass_type = "text",
					style_id = "xp_text_shadow",
					text_id = "xp_text",
				},
			},
		},
		content = {
			summary_text = "n/a",
			xp_text = "n/a",
		},
		style = {
			summary_text = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 0),
				offset = {
					0,
					0,
					2,
				},
			},
			summary_text_shadow = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					2,
					-2,
					1,
				},
			},
			xp_text = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 0),
				offset = {
					0,
					0,
					2,
				},
			},
			xp_text_shadow = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					2,
					-2,
					1,
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
end

UIWidgets.create_chest_score_entry = function (scenegraph_id, size, index)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_disabled",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "texture_id_saturated",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "texture_id_glow",
					texture_id = "texture_id_glow",
				},
				{
					pass_type = "texture",
					style_id = "checkbox",
					texture_id = "checkbox",
				},
				{
					pass_type = "texture",
					style_id = "checkbox_shadow",
					texture_id = "checkbox",
				},
				{
					pass_type = "texture",
					style_id = "marker",
					texture_id = "marker",
				},
			},
		},
		content = {
			checkbox = "matchmaking_checkbox",
			marker = "tooltip_marker",
			text = "n/a",
			texture_id = "icons_placeholder",
			texture_id_glow = "icons_placeholder",
		},
		style = {
			marker = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					13,
					13,
				},
				default_size = {
					13,
					13,
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-10,
					0,
					1,
				},
			},
			texture_id = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					80,
					90,
				},
				default_size = {
					80,
					90,
				},
				color = {
					0,
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
			texture_id_saturated = {
				horizontal_alignment = "left",
				saturated = true,
				vertical_alignment = "center",
				texture_size = {
					80,
					90,
				},
				default_size = {
					80,
					90,
				},
				color = {
					255,
					100,
					100,
					100,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			checkbox = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					37,
					31,
				},
				default_size = {
					37,
					31,
				},
				color = Colors.get_color_table_with_alpha("green", 0),
				offset = {
					-18,
					4,
					7,
				},
			},
			checkbox_shadow = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					37,
					31,
				},
				default_size = {
					37,
					31,
				},
				color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					-16,
					2,
					6,
				},
			},
			texture_id_glow = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					80,
					90,
				},
				default_size = {
					80,
					90,
				},
				color = Colors.get_color_table_with_alpha("font_title", 0),
				offset = {
					0,
					0,
					2,
				},
			},
			text = {
				dynamic_font_size = false,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 0),
				offset = {
					80,
					0,
					2,
				},
				size = {
					size[1] - 80,
					size[2],
				},
			},
			text_disabled = {
				dynamic_font_size = false,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					50,
					50,
					50,
				},
				offset = {
					80,
					0,
					2,
				},
				size = {
					size[1] - 80,
					size[2],
				},
			},
			text_shadow = {
				dynamic_font_size = false,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					82,
					-2,
					1,
				},
				size = {
					size[1] - 80,
					size[2],
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
end

UIWidgets.create_score_list = function (scenegraph_id, size, rows)
	local metal_bg_texture = "menu_frame_bg_01"
	local paper_bg_texture = "scoreboard_bg"
	local paper_bg_top_texture = "scoreboard_bg_top"
	local row_bg = "scoreboard_topic_bg"
	local vertical_divider_texture = "scoreboard_divider_01"
	local horizontal_divider_texture = "scoreboard_divider_02"
	local metal_bg_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(metal_bg_texture)
	local paper_bg_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(paper_bg_texture)
	local paper_bg_top_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(paper_bg_top_texture)
	local row_bg_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(row_bg)
	local vertical_divider_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(vertical_divider_texture)
	local horizontal_divider_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(horizontal_divider_texture)
	local frame_settings = UIFrameSettings.menu_frame_06
	local font_size = 24
	local row_height = 39
	local row_spacing = 0
	local row_size = {
		size[1],
		row_height + row_spacing,
	}
	local horizontal_divider_size = {
		size[1],
		horizontal_divider_texture_settings.size[2],
	}
	local top_offset = -100
	local score_top_offset = -120
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
	}
	local content = {
		button_hotspot = {},
		frame = frame_settings.texture,
		rows = rows,
	}
	local style = {
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
	}

	for i = 1, rows do
		local name_suffix = "_" .. tostring(i)
		local offset = {
			0,
			size[2] - (row_height + row_spacing) * i + score_top_offset,
			0,
		}
		local hotspot_name = "hotspot" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name,
		}
		content[hotspot_name] = {
			hover_texture_size = row_size,
			vertical_divider_texture_id = vertical_divider_texture,
		}
		style[hotspot_name] = {
			size = row_size,
			offset = {
				offset[1],
				offset[2],
				offset[3],
			},
		}

		local row_bg = "row_bg" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "tiled_texture",
			texture_id = "hover_texture_id",
			content_id = row_bg,
			style_id = row_bg,
			content_check_function = function (content)
				return content.has_background
			end,
		}
		content[row_bg] = {
			has_background = false,
			hover_texture_id = "scoreboard_topic_bg",
		}
		style[row_bg] = {
			size = row_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				offset[3] + 10,
			},
			texture_tiling_size = row_bg_settings.size,
		}

		local horizontal_divider = "horizontal_divider" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "tiled_texture",
			texture_id = "horizontal_divider_texture_id",
			content_id = horizontal_divider,
			style_id = horizontal_divider,
			content_check_function = function (content)
				return content.has_horizontal_divider
			end,
		}
		content[horizontal_divider] = {
			has_horizontal_divider = false,
			horizontal_divider_texture_id = horizontal_divider_texture,
		}
		style[horizontal_divider] = {
			size = horizontal_divider_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] - horizontal_divider_texture_settings.size[2] * 0.5,
				offset[3],
			},
			texture_tiling_size = horizontal_divider_texture_settings.size,
		}

		local title_text = "title_text" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = title_text,
			style_id = title_text,
			content_check_function = function (content)
				return content.text ~= nil
			end,
		}
		content[title_text] = {}
		style[title_text] = {
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			word_wrap = true,
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] + 20,
				offset[2],
				offset[3] + 2,
			},
		}

		local player_1_text = "score_player_1" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = player_1_text,
			style_id = player_1_text,
			content_check_function = function (content)
				return content.text ~= nil
			end,
		}
		content[player_1_text] = {}
		style[player_1_text] = {
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			word_wrap = true,
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] - 450,
				offset[2],
				offset[3] + 2,
			},
		}

		local player_2_text = "score_player_2" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = player_2_text,
			style_id = player_2_text,
			content_check_function = function (content)
				return content.text ~= nil
			end,
		}
		content[player_2_text] = {}
		style[player_2_text] = {
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			word_wrap = true,
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] - 150,
				offset[2],
				offset[3] + 2,
			},
		}

		local player_3_text = "score_player_3" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = player_3_text,
			style_id = player_3_text,
			content_check_function = function (content)
				return content.text ~= nil
			end,
		}
		content[player_3_text] = {}
		style[player_3_text] = {
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			word_wrap = true,
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] + 150,
				offset[2],
				offset[3] + 2,
			},
		}

		local player_4_text = "score_player_4" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = player_4_text,
			style_id = player_4_text,
			content_check_function = function (content)
				return content.text ~= nil
			end,
		}
		content[player_4_text] = {}
		style[player_4_text] = {
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			word_wrap = true,
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] + 450,
				offset[2],
				offset[3] + 2,
			},
		}

		local high_score_marker_1 = "high_score_marker_1" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "high_score_marker_texture_id",
			content_id = high_score_marker_1,
			style_id = high_score_marker_1,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil and content.has_highscore
			end,
		}
		content[high_score_marker_1] = {
			has_highscore = false,
			high_score_marker_texture_id = "scoreboard_marker",
		}
		style[high_score_marker_1] = {
			size = {
				71,
				39,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] - 450 + 800 + 120,
				offset[2],
				offset[3],
			},
		}

		local high_score_marker_2 = "high_score_marker_2" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "high_score_marker_texture_id",
			content_id = high_score_marker_2,
			style_id = high_score_marker_2,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil and content.has_highscore
			end,
		}
		content[high_score_marker_2] = {
			has_highscore = false,
			high_score_marker_texture_id = "scoreboard_marker",
		}
		style[high_score_marker_2] = {
			size = {
				71,
				39,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] - 150 + 800 + 120,
				offset[2],
				offset[3],
			},
		}

		local high_score_marker_3 = "high_score_marker_3" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "high_score_marker_texture_id",
			content_id = high_score_marker_3,
			style_id = high_score_marker_3,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil and content.has_highscore
			end,
		}
		content[high_score_marker_3] = {
			has_highscore = false,
			high_score_marker_texture_id = "scoreboard_marker",
		}
		style[high_score_marker_3] = {
			size = {
				71,
				39,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] + 150 + 800 + 120,
				offset[2],
				offset[3],
			},
		}

		local high_score_marker_4 = "high_score_marker_4" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "high_score_marker_texture_id",
			content_id = high_score_marker_4,
			style_id = high_score_marker_4,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil and content.has_highscore
			end,
		}
		content[high_score_marker_4] = {
			has_highscore = false,
			high_score_marker_texture_id = "scoreboard_marker",
		}
		style[high_score_marker_4] = {
			size = {
				71,
				39,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] + 450 + 800 + 120,
				offset[2],
				offset[3],
			},
		}

		local line_divider_1 = "line_divider_1" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "vertical_divider_texture_id",
			content_id = hotspot_name,
			style_id = line_divider_1,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end,
		}
		style[line_divider_1] = {
			size = {
				4,
				row_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] - 450 + 800,
				offset[2],
				offset[3],
			},
		}

		local line_divider_2 = "line_divider_2" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "vertical_divider_texture_id",
			content_id = hotspot_name,
			style_id = line_divider_2,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end,
		}
		style[line_divider_2] = {
			size = {
				4,
				row_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] - 150 + 800,
				offset[2],
				offset[3],
			},
		}

		local line_divider_3 = "line_divider_3" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "vertical_divider_texture_id",
			content_id = hotspot_name,
			style_id = line_divider_3,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end,
		}
		style[line_divider_3] = {
			size = {
				4,
				row_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] + 150 + 800,
				offset[2],
				offset[3],
			},
		}

		local line_divider_4 = "line_divider_4" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "vertical_divider_texture_id",
			content_id = hotspot_name,
			style_id = line_divider_4,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end,
		}
		style[line_divider_4] = {
			size = {
				4,
				row_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] + 450 + 800,
				offset[2],
				offset[3],
			},
		}

		local line_divider_5 = "line_divider_5" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "vertical_divider_texture_id",
			content_id = hotspot_name,
			style_id = line_divider_5,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end,
		}
		style[line_divider_5] = {
			size = {
				4,
				row_height,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] + 750 + 800,
				offset[2],
				offset[3],
			},
		}
	end

	local widget = {
		element = {
			passes = passes,
		},
		content = content,
		style = style,
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}

	return widget
end

UIWidgets.create_level_up_widget = function (scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "level_text",
					text_id = "level_text",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
			},
		},
		content = {
			background = "level_up_bg",
			level_text = "9999",
			title_text = "Level up",
		},
		style = {
			title_text = {
				font_size = 36,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 0),
				offset = {
					0,
					35,
					1,
				},
			},
			level_text = {
				font_size = 40,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 0),
				offset = {
					0,
					-35,
					1,
				},
			},
			background = {
				offset = {
					-10,
					0,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
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
end

UIWidgets.create_experience_bar = function (scenegraph_id, size, masked)
	local frame_settings = UIFrameSettings.menu_frame_06

	return {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.draw_frame
					end,
				},
				{
					pass_type = "texture",
					style_id = "glass",
					texture_id = "glass",
				},
				{
					pass_type = "text",
					style_id = "level_text_from",
					text_id = "level_text_from",
				},
				{
					pass_type = "text",
					style_id = "level_text_to",
					text_id = "level_text_to",
				},
				{
					pass_type = "text",
					style_id = "counter_text",
					text_id = "counter_text",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					content_id = "experience_bar",
					pass_type = "texture_uv",
					style_id = "experience_bar",
				},
				{
					pass_type = "texture",
					style_id = "mask_rect",
					texture_id = "mask_rect",
				},
			},
		},
		content = {
			background = "xp_bar_bg",
			counter_text = "",
			draw_frame = true,
			glass = "xp_bar_glass",
			level_text_from = "",
			level_text_to = "",
			mask_rect = "mask_rect",
			experience_bar = {
				texture_id = "end_screen_experience_bar",
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
			frame = frame_settings.texture,
		},
		style = {
			mask_rect = {
				size = {
					size[1],
					size[2] + 100,
					size[3],
				},
				offset = {
					0,
					-50,
					0,
				},
			},
			background = {
				masked = masked,
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					0,
				},
			},
			experience_bar = {
				masked = masked,
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				default_size = {
					size[1] - frame_settings.texture_sizes.horizontal[2],
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					2,
				},
			},
			glass = {
				masked = masked,
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					4,
				},
			},
			frame = {
				masked = masked,
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
					3,
				},
			},
			counter_text = {
				font_size = 28,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-size[2] - 5,
					0,
				},
			},
			level_text_from = {
				font_size = 36,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-size[1] - 10,
					0,
					0,
				},
			},
			level_text_to = {
				font_size = 36,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					size[1] + 10,
					0,
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
end

UIWidgets.create_statistics_bar = function (scenegraph_id, size, optional_detail_texture, optional_detail_offset)
	local frame_settings = UIFrameSettings.menu_frame_06
	local hover_frame_settings = UIFrameSettings.frame_outer_glow_02
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local side_detail_texture = optional_detail_texture or "button_detail_03"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
					content_check_function = function (content)
						return content.hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "star",
					texture_id = "star",
					content_check_function = function (content)
						return content.has_star
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.draw_frame
					end,
				},
				{
					pass_type = "texture",
					style_id = "glass",
					texture_id = "glass",
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
					style_id = "value_text",
					text_id = "value_text",
				},
				{
					pass_type = "text",
					style_id = "value_text_shadow",
					text_id = "value_text",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "experience_bar_edge",
					texture_id = "experience_bar_edge",
					content_change_function = function (content, style)
						local parent_style = style.parent
						local experience_bar_style = parent_style.experience_bar
						local start_offset = experience_bar_style.offset[1]

						style.offset[1] = math.floor(experience_bar_style.size[1] + start_offset)
						style.size[1] = math.min(40, experience_bar_style.default_size[1] - (style.offset[1] - start_offset))
					end,
				},
				{
					content_id = "experience_bar",
					pass_type = "texture_uv",
					style_id = "experience_bar",
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			background = "xp_bar_bg",
			draw_frame = true,
			experience_bar_edge = "experience_bar_edge_glow",
			glass = "xp_bar_glass",
			star = "list_item_tag_new",
			title_text = "n/a",
			value_text = "n/a",
			hotspot = {},
			hover_frame = hover_frame_settings.texture,
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
			experience_bar = {
				texture_id = "experience_bar_fill",
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
			frame = frame_settings.texture,
		},
		style = {
			background = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					0,
				},
			},
			experience_bar = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				default_size = {
					size[1] - frame_settings.texture_sizes.horizontal[2],
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					2,
				},
			},
			experience_bar_edge = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					40,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					0,
					frame_settings.texture_sizes.vertical[1],
					2,
				},
			},
			glass = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2,
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					3,
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
					4,
				},
			},
			hover_frame = {
				texture_size = hover_frame_settings.texture_size,
				texture_sizes = hover_frame_settings.texture_sizes,
				frame_margins = {
					-hover_frame_spacing,
					-hover_frame_spacing,
				},
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					6,
				},
			},
			star = {
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-100,
					-4,
					6,
				},
				texture_size = {
					126,
					51,
				},
			},
			title_text = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_shadow = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					22,
					-2,
					5,
				},
			},
			value_text = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-20,
					0,
					6,
				},
			},
			value_text_shadow = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-18,
					-2,
					5,
				},
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					optional_detail_offset and -optional_detail_offset or -9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					5,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - side_detail_texture_size[1] + (optional_detail_offset or 9),
					size[2] / 2 - side_detail_texture_size[2] / 2,
					5,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
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
end

local function has_locked(content)
	return content.has_locked
end

local function has_available(content)
	return content.has_available
end

local function has_completed(content)
	return content.has_completed
end

local function is_hover(content)
	return content.is_hover
end

UIWidgets.create_quest_bar = function (scenegraph_id, size)
	local side_detail_texture = "chain_end"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local paper_width = 20
	local paper_offset = 30
	local group_offset = 135
	local group_align = -31
	local tooltip_size = {
		95 + paper_width,
		58,
	}

	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "locked_slot",
					texture_id = "slot",
					content_check_function = has_locked,
				},
				{
					pass_type = "texture",
					style_id = "locked_icon_cooldown",
					texture_id = "icon_cooldown",
					content_check_function = function (content)
						return content.has_locked and content.cooldown_lock
					end,
				},
				{
					pass_type = "texture",
					style_id = "locked_icon_locked",
					texture_id = "icon_locked",
					content_check_function = function (content)
						return content.has_locked and not content.cooldown_lock
					end,
				},
				{
					pass_type = "tiled_texture",
					style_id = "locked_count_bg_center",
					texture_id = "count_bg_center",
					content_check_function = has_locked,
				},
				{
					pass_type = "texture",
					style_id = "locked_count_bg_right",
					texture_id = "count_bg_right",
					content_check_function = has_locked,
				},
				{
					pass_type = "text",
					style_id = "locked_text",
					text_id = "locked_text",
					content_check_function = has_locked,
				},
				{
					content_id = "locked_tooltip",
					pass_type = "hover",
					style_id = "locked_tooltip",
					content_check_function = function (content)
						return content.parent.has_locked
					end,
				},
				{
					content_id = "locked_tooltip",
					pass_type = "tooltip_text",
					style_id = "locked_tooltip",
					text_id = "text_id",
					content_check_function = is_hover,
				},
				{
					pass_type = "texture",
					style_id = "available_slot",
					texture_id = "slot",
					content_check_function = has_available,
				},
				{
					pass_type = "texture",
					style_id = "available_slot_frame",
					texture_id = "slot_frame",
					content_check_function = has_available,
				},
				{
					pass_type = "texture",
					style_id = "available_icon_available",
					texture_id = "icon_available",
					content_check_function = has_available,
				},
				{
					pass_type = "tiled_texture",
					style_id = "available_count_bg_center",
					texture_id = "count_bg_center",
					content_check_function = has_available,
				},
				{
					pass_type = "texture",
					style_id = "available_count_bg_right",
					texture_id = "count_bg_right",
					content_check_function = has_available,
				},
				{
					pass_type = "text",
					style_id = "available_text",
					text_id = "available_text",
					content_check_function = has_available,
				},
				{
					content_id = "available_tooltip",
					pass_type = "hover",
					style_id = "available_tooltip",
					content_check_function = function (content)
						return content.parent.has_available
					end,
				},
				{
					content_id = "available_tooltip",
					pass_type = "tooltip_text",
					style_id = "available_tooltip",
					text_id = "text_id",
					content_check_function = is_hover,
				},
				{
					pass_type = "texture",
					style_id = "completed_slot",
					texture_id = "slot",
					content_check_function = has_completed,
				},
				{
					pass_type = "texture",
					style_id = "completed_slot_frame",
					texture_id = "slot_frame",
					content_check_function = has_completed,
				},
				{
					pass_type = "texture",
					style_id = "completed_icon_loot",
					texture_id = "icon_loot",
					content_check_function = has_completed,
				},
				{
					pass_type = "tiled_texture",
					style_id = "completed_count_bg_center",
					texture_id = "count_bg_center",
					content_check_function = has_completed,
				},
				{
					pass_type = "texture",
					style_id = "completed_count_bg_right",
					texture_id = "count_bg_right",
					content_check_function = has_completed,
				},
				{
					pass_type = "text",
					style_id = "completed_text",
					text_id = "completed_text",
					content_check_function = has_completed,
				},
				{
					content_id = "completed_tooltip",
					pass_type = "hover",
					style_id = "completed_tooltip",
					content_check_function = function (content)
						return content.parent.has_completed
					end,
				},
				{
					content_id = "completed_tooltip",
					pass_type = "tooltip_text",
					style_id = "completed_tooltip",
					text_id = "text_id",
					content_check_function = is_hover,
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
				},
				{
					pass_type = "texture",
					style_id = "refresh_icon",
					texture_id = "refresh_icon",
				},
				{
					pass_type = "texture",
					style_id = "refresh_icon_bg",
					texture_id = "refresh_icon_bg",
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
				},
				{
					pass_type = "tiled_texture",
					style_id = "background",
					texture_id = "background",
				},
			},
		},
		content = {
			available_text = "n/a",
			background = "chain_link_horizontal_01",
			completed_text = "n/a",
			count_bg_center = "store_thumbnail_pricetag_middle",
			count_bg_right = "store_thumbnail_pricetag_right",
			has_available = true,
			has_completed = true,
			has_locked = true,
			icon_available = "achievement_symbol_skull",
			icon_cooldown = "achievement_symbol_hourglass",
			icon_locked = "achievement_symbol_lock",
			icon_loot = "achievement_symbol_loot",
			locked_text = "n/a",
			refresh_icon = "achievement_refresh_on",
			refresh_icon_bg = "achievement_refresh_off",
			slot = "achievement_symbol_book",
			slot_flames = "achievement_small_book_glow",
			slot_frame = "achievement_symbol_book_glow_1",
			locked_tooltip = {
				text_id = "achv_menu_summary_locked_quests",
			},
			available_tooltip = {
				text_id = "achv_menu_summary_available_quests",
			},
			completed_tooltip = {
				text_id = "achv_menu_summary_completed_quests",
			},
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
		},
		style = {
			background = {
				offset = {
					0,
					0,
					0,
				},
				texture_tiling_size = {
					19,
					16,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			locked_slot = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					63,
					58,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					group_align - group_offset,
					0,
					2,
				},
			},
			locked_icon_cooldown = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					56,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					group_align - group_offset,
					0,
					3,
				},
			},
			locked_icon_locked = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					56,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					group_align - group_offset,
					0,
					3,
				},
			},
			locked_count_bg_center = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					paper_width,
					36,
				},
				texture_tiling_size = {
					10,
					36,
				},
				color = {
					255,
					230,
					230,
					230,
				},
				offset = {
					group_align - group_offset + paper_offset,
					0,
					1,
				},
			},
			locked_count_bg_right = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					32,
					40,
				},
				color = {
					255,
					230,
					230,
					230,
				},
				offset = {
					group_align - group_offset + paper_offset + paper_width,
					0,
					1,
				},
			},
			locked_text = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					group_align - group_offset + paper_offset + 12,
					0,
					2,
				},
			},
			locked_tooltip = {
				cursor_side = "right",
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				max_width = 500,
				vertical_alignment = "center",
				text_color = Colors.get_table("white"),
				line_colors = {
					Colors.get_table("orange_red"),
				},
				cursor_offset = {
					20,
					-57,
				},
				offset = {
					-group_offset,
					0,
					50,
				},
				area_size = tooltip_size,
			},
			available_slot = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					63,
					58,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					group_align,
					0,
					2,
				},
			},
			available_slot_frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					63,
					58,
				},
				color = {
					255,
					238,
					122,
					20,
				},
				offset = {
					group_align,
					0,
					0,
				},
			},
			available_icon_available = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					34,
					34,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					group_align,
					0,
					3,
				},
			},
			available_count_bg_center = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					paper_width,
					36,
				},
				texture_tiling_size = {
					10,
					36,
				},
				color = {
					255,
					230,
					230,
					230,
				},
				offset = {
					group_align + paper_offset,
					0,
					1,
				},
			},
			available_count_bg_right = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					32,
					40,
				},
				color = {
					255,
					230,
					230,
					230,
				},
				offset = {
					group_align + paper_offset + paper_width,
					0,
					1,
				},
			},
			available_text = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					group_align + paper_offset + 12,
					0,
					2,
				},
			},
			available_tooltip = {
				cursor_side = "right",
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				max_width = 500,
				vertical_alignment = "center",
				text_color = Colors.get_table("white"),
				line_colors = {
					Colors.get_table("orange_red"),
				},
				cursor_offset = {
					15,
					-55,
				},
				offset = {
					0,
					0,
					50,
				},
				area_size = tooltip_size,
			},
			completed_slot = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					63,
					58,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					group_align + group_offset,
					0,
					2,
				},
			},
			completed_slot_frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					63,
					58,
				},
				color = {
					255,
					238,
					122,
					20,
				},
				offset = {
					group_align + group_offset,
					0,
					0,
				},
			},
			completed_icon_loot = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					42,
					29,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					group_align + group_offset,
					0,
					3,
				},
			},
			completed_count_bg_center = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					paper_width,
					36,
				},
				texture_tiling_size = {
					10,
					36,
				},
				color = {
					255,
					230,
					230,
					230,
				},
				offset = {
					group_align + group_offset + paper_offset,
					0,
					1,
				},
			},
			completed_count_bg_right = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					32,
					40,
				},
				color = {
					255,
					230,
					230,
					230,
				},
				offset = {
					group_align + group_offset + paper_offset + paper_width,
					0,
					1,
				},
			},
			completed_text = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					group_align + group_offset + paper_offset + 12,
					0,
					2,
				},
			},
			completed_tooltip = {
				cursor_side = "right",
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = true,
				max_width = 500,
				vertical_alignment = "center",
				text_color = Colors.get_table("white"),
				line_colors = {
					Colors.get_table("orange_red"),
				},
				cursor_offset = {
					20,
					27,
				},
				offset = {
					group_offset,
					0,
					50,
				},
				area_size = tooltip_size,
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-side_detail_texture_size[1],
					size[2] / 2 - side_detail_texture_size[2] / 2,
					5,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1],
					size[2] / 2 - side_detail_texture_size[2] / 2,
					5,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			refresh_icon_bg = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 10,
					size[2] / 2 - 12.5,
					6,
				},
				size = {
					25,
					25,
				},
			},
			refresh_icon = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 10,
					size[2] / 2 - 12.5,
					7,
				},
				size = {
					25,
					25,
				},
			},
		},
	}
end

UIWidgets.create_summary_experience_bar = function (scenegraph_id, size, masked)
	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "counter_text",
					text_id = "counter_text",
				},
				{
					pass_type = "text",
					style_id = "counter_text_shadow",
					text_id = "counter_text",
				},
				{
					pass_type = "texture",
					style_id = "experience_bar",
					texture_id = "experience_bar",
				},
				{
					pass_type = "texture",
					style_id = "experience_bar_end",
					texture_id = "experience_bar_end",
				},
			},
		},
		content = {
			counter_text = "",
			experience_bar = "summary_screen_fill",
			experience_bar_end = "summary_screen_fill_glow",
			level_text_from = "",
			level_text_to = "",
		},
		style = {
			experience_bar = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = size,
				masked = masked,
				default_size = size,
				offset = {
					0,
					0,
					2,
				},
			},
			experience_bar_end = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					132,
					size[2],
				},
				masked = masked,
				offset = {
					0,
					0,
					2,
				},
			},
			counter_text = {
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					4,
				},
			},
			counter_text_shadow = {
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					3,
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
end

UIWidgets.create_career_summary_window = function (scenegraph_id, size)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_06
	local icon_size = {
		60,
		60,
	}

	return {
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
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "description_text",
					text_id = "description_text",
				},
				{
					pass_type = "text",
					style_id = "active_ability_title_text",
					text_id = "active_ability_title_text",
				},
				{
					pass_type = "text",
					style_id = "passive_ability_title_text",
					text_id = "passive_ability_title_text",
				},
				{
					pass_type = "text",
					style_id = "active_ability_description_text",
					text_id = "active_ability_description_text",
				},
				{
					pass_type = "text",
					style_id = "passive_ability_description_text",
					text_id = "passive_ability_description_text",
				},
				{
					pass_type = "texture",
					style_id = "active_ability",
					texture_id = "active_ability",
				},
				{
					pass_type = "texture",
					style_id = "passive_ability",
					texture_id = "passive_ability",
				},
			},
		},
		content = {
			active_ability = "icons_placeholder",
			active_ability_description_text = "n/a",
			active_ability_title_text = "n/a",
			description_text = "n/a",
			passive_ability = "icons_placeholder",
			passive_ability_description_text = "n/a",
			passive_ability_title_text = "n/a",
			title_text = "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2],
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
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
			title_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					size[2] - 55,
					2,
				},
				size = {
					size[1],
					30,
				},
			},
			description_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					size[2] - 100,
					2,
				},
				size = {
					size[1] - 40,
					30,
				},
			},
			active_ability = {
				color = {
					255,
					255,
					255,
					255,
				},
				size = {
					60,
					60,
				},
				offset = {
					20,
					size[2] - 300,
					3,
				},
			},
			passive_ability = {
				color = {
					255,
					255,
					255,
					255,
				},
				size = icon_size,
				offset = {
					20,
					size[2] - 500,
					3,
				},
			},
			active_ability_title_text = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					icon_size[1] + 40,
					size[2] - 300,
					2,
				},
				size = {
					size[1] - (icon_size[1] + 60),
					icon_size[2],
				},
			},
			passive_ability_title_text = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					icon_size[1] + 40,
					size[2] - 500,
					2,
				},
				size = {
					size[1] - (icon_size[1] + 60),
					icon_size[2],
				},
			},
			active_ability_description_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					0,
					2,
				},
				size = {
					size[1] - 40,
					size[2] - (size[2] - 300) - 20,
				},
			},
			passive_ability_description_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					0,
					2,
				},
				size = {
					size[1] - 40,
					size[2] - (size[2] - 500) - 20,
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

UIWidgets.create_default_button = function (scenegraph_id, size, frame_name, background_texture, text, font_size, optional_color_name, optional_detail_texture, optional_detail_offset, disable_with_gamepad, skip_side_detail, masked)
	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = optional_detail_texture or "button_detail_01"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local extra_detail_offset_x, extra_detail_offset_y

	if optional_detail_offset then
		if type(optional_detail_offset) == "table" then
			extra_detail_offset_x = optional_detail_offset[1]
			extra_detail_offset_y = optional_detail_offset[2]
		else
			extra_detail_offset_x = optional_detail_offset
		end
	end

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.draw_frame
					end,
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect",
				},
				{
					pass_type = "rect",
					style_id = "disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
					content_check_function = function (content)
						return not content.skip_side_detail
					end,
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.skip_side_detail
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			draw_frame = true,
			glass = "button_glass_02",
			hover_glow = "button_state_default",
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
				skip_side_detail = skip_side_detail,
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					0,
					0,
				},
				masked = masked,
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width - 2,
					2,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
				masked = masked,
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 2,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
				masked = masked,
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_disabled = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				font_type = masked and "hell_shark_masked" or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				offset = {
					22,
					-2,
					5,
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
					8,
				},
				masked = masked,
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					4,
				},
				size = {
					size[1],
					11,
				},
				masked = masked,
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 9,
					4,
				},
				size = {
					size[1],
					11,
				},
				masked = masked,
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					extra_detail_offset_x and -extra_detail_offset_x or -9,
					size[2] / 2 - side_detail_texture_size[2] / 2 + (extra_detail_offset_y or 0),
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
				masked = masked,
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - side_detail_texture_size[1] + (extra_detail_offset_x or 9),
					size[2] / 2 - side_detail_texture_size[2] / 2 + (extra_detail_offset_y or 0),
					9,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
				masked = masked,
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
end

UIWidgets.create_default_image_button = function (scenegraph_id, size, frame_name, background_texture, text, font_size, background_icon, optional_color_name, optional_detail_texture, optional_detail_offset)
	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = optional_detail_texture or "button_detail_01"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size

	background_icon = background_icon or "loot_chest_icon"

	local background_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_icon)
	local background_icon_size = background_icon_settings and background_icon_settings.size or {
		200,
		200,
	}
	local background_icon_scale = 1 - math.min(size[2] / background_icon_size[2], 1)
	local background_icon_width_fraction = 0.9
	local background_icon_size = {
		background_icon_size[1] * background_icon_width_fraction,
		size[2],
	}

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
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
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect",
				},
				{
					pass_type = "rect",
					style_id = "disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
				{
					content_id = "background_icon",
					pass_type = "texture_uv",
					style_id = "background_icon",
				},
				{
					pass_type = "texture",
					style_id = "new_texture",
					texture_id = "new_texture",
					content_check_function = function (content)
						return content.new
					end,
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			new_texture = "list_item_tag_new",
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
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background_icon = {
				uvs = {
					{
						0,
						0.5 * background_icon_scale,
					},
					{
						background_icon_width_fraction,
						1 - background_icon_scale / 2,
					},
				},
				texture_id = background_icon,
			},
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			background_icon = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					size[1] - background_icon_size[1],
					size[2] / 2 - background_icon_size[2] / 2,
					1,
				},
				size = background_icon_size,
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width - 2,
					3,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 2,
					4,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					8,
				},
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			new_texture = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 126,
					size[2] / 2 - 25.5,
					7,
				},
				size = {
					126,
					51,
				},
			},
			title_text = {
				font_type = "hell_shark",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					30,
					0,
					7,
				},
			},
			title_text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					30,
					0,
					7,
				},
			},
			title_text_shadow = {
				font_type = "hell_shark",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					32,
					-2,
					6,
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
					9,
				},
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					5,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 9,
					5,
				},
				size = {
					size[1],
					11,
				},
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					optional_detail_offset and -optional_detail_offset or -9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					10,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - side_detail_texture_size[1] + (optional_detail_offset or 9),
					size[2] / 2 - side_detail_texture_size[2] / 2,
					10,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
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
end

UIWidgets.create_default_icon_tabs = function (scenegraph_id, size, amount)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		amount = amount,
	}
	local style = {}
	local slot_width_spacing = 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local button_size = {
		tab_width,
		size[2],
	}
	local icon_size = {
		34,
		34,
	}
	local start_width_offset = 0

	for k = 1, amount do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1

		total_length = total_length + button_size[1] + slot_width_spacing

		local offset = {
			start_width_offset,
			0,
			offset_layer,
		}
		local hotspot_name = "hotspot" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name,
		}
		style[hotspot_name] = {
			size = button_size,
			offset = offset,
		}
		content[hotspot_name] = {}

		local hotspot_content = content[hotspot_name]
		local background_name = "background" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture_uv",
			content_id = background_name,
			style_id = background_name,
		}
		style[background_name] = {
			size = button_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				0,
			},
		}
		content[background_name] = {
			uvs = {
				{
					0,
					1 - math.min(button_size[2] / background_texture_settings.size[2], 1),
				},
				{
					math.min(button_size[1] / background_texture_settings.size[1], 1),
					1,
				},
			},
			texture_id = background_texture,
		}

		local background_fade_name = "background_fade" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = background_fade_name,
			style_id = background_fade_name,
		}
		style[background_fade_name] = {
			size = {
				button_size[1],
				button_size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				1,
			},
		}
		hotspot_content[background_fade_name] = "button_bg_fade"

		local hover_glow_name = "hover_glow" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = hover_glow_name,
			style_id = hover_glow_name,
		}
		style[hover_glow_name] = {
			size = {
				button_size[1],
				math.min(button_size[2] - 5, 80),
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] + 5,
				2,
			},
		}
		hotspot_content[hover_glow_name] = "button_state_default"

		local clicked_rect_name = "clicked_rect" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "rect",
			content_id = hotspot_name,
			style_id = clicked_rect_name,
		}
		style[clicked_rect_name] = {
			size = button_size,
			color = {
				100,
				0,
				0,
				0,
			},
			offset = {
				offset[1],
				offset[2],
				6,
			},
		}

		local glass_top_name = "glass_top" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_top_name,
			style_id = glass_top_name,
		}
		style[glass_top_name] = {
			size = {
				button_size[1],
				11,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] + button_size[2] - 11,
				5,
			},
		}
		hotspot_content[glass_top_name] = "button_glass_02"

		local glass_bottom_name = "glass_bottom" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_bottom_name,
			style_id = glass_bottom_name,
		}
		style[glass_bottom_name] = {
			size = {
				button_size[1],
				11,
			},
			color = {
				100,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] - 3,
				5,
			},
		}
		hotspot_content[glass_bottom_name] = "button_glass_02"

		local icon_name = "icon" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = icon_name,
			style_id = icon_name,
		}
		style[icon_name] = {
			size = icon_size,
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1] + button_size[1] / 2 - icon_size[1] / 2,
				offset[2] + button_size[2] / 2 - icon_size[1] / 2 + 4,
				4,
			},
		}
		hotspot_content[icon_name] = "tabs_inventory_icon_trinkets_selected"

		local icon_shadow_name = "icon_shadow" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = icon_name,
			style_id = icon_shadow_name,
		}
		style[icon_shadow_name] = {
			size = icon_size,
			color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				offset[1] + button_size[1] / 2 - icon_size[1] / 2 + 2,
				offset[2] + button_size[2] / 2 - icon_size[1] / 2 + 2,
				3,
			},
		}
		start_width_offset = start_width_offset + tab_width + slot_width_spacing
	end

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

UIWidgets.create_default_checkbox_button = function (scenegraph_id, size, text, font_size, tooltip_info, draw_tooltip_above, checkbox_frame_settings_name)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local offset = {
		0,
		0,
		0,
	}
	local hotspot_name = "button_hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name,
	}
	style[hotspot_name] = {
		size = size,
		offset = offset,
	}
	content[hotspot_name] = {}

	local hotspot_content = content[hotspot_name]
	local background_name = "background"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name,
	}
	style[background_name] = {
		size = size,
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2],
			0,
		},
	}
	content[background_name] = {
		uvs = {
			{
				0,
				1 - math.min(size[2] / background_texture_settings.size[2], 1),
			},
			{
				math.min(size[1] / background_texture_settings.size[1], 1),
				1,
			},
		},
		texture_id = background_texture,
	}

	local background_fade_name = "background_fade"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = background_fade_name,
		style_id = background_fade_name,
	}
	style[background_fade_name] = {
		size = {
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
			offset[1],
			offset[2],
			1,
		},
	}
	hotspot_content[background_fade_name] = "button_bg_fade"

	local hover_glow_name = "hover_glow"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = hover_glow_name,
		style_id = hover_glow_name,
	}
	style[hover_glow_name] = {
		size = {
			size[1],
			math.min(size[2] - 5, 80),
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + 5,
			2,
		},
	}
	hotspot_content[hover_glow_name] = "button_state_default"

	local clicked_rect_name = "clicked_rect"

	passes[#passes + 1] = {
		pass_type = "rect",
		content_id = hotspot_name,
		style_id = clicked_rect_name,
	}
	style[clicked_rect_name] = {
		size = size,
		color = {
			100,
			0,
			0,
			0,
		},
		offset = {
			offset[1],
			offset[2],
			6,
		},
	}

	local glass_top_name = "glass_top"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_top_name,
		style_id = glass_top_name,
	}
	style[glass_top_name] = {
		size = {
			size[1],
			11,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + size[2] - 11,
			5,
		},
	}
	hotspot_content[glass_top_name] = "button_glass_02"

	local glass_bottom_name = "glass_bottom"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_bottom_name,
		style_id = glass_bottom_name,
	}
	style[glass_bottom_name] = {
		size = {
			size[1],
			11,
		},
		color = {
			100,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] - 3,
			5,
		},
	}
	hotspot_content[glass_bottom_name] = "button_glass_02"

	if tooltip_info then
		local tooltip_name = "additional_option_info"

		passes[#passes + 1] = {
			pass_type = "additional_option_tooltip",
			content_id = hotspot_name,
			style_id = tooltip_name,
			additional_option_id = tooltip_name,
			content_check_function = function (content)
				return content.is_hover
			end,
		}
		hotspot_content[tooltip_name] = tooltip_info
		style[tooltip_name] = {
			grow_downwards = false,
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			offset = {
				draw_tooltip_above and size[1] or 0,
				draw_tooltip_above and size[2] or 0,
				0,
			},
		}
	end

	local text_name = "text"

	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_name,
		content_check_function = function (content)
			return not content.disable_button
		end,
	}
	style[text_name] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		select_text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			offset[1] + 10,
			offset[2] + 3,
			4,
		},
		size = size,
	}
	hotspot_content[text_name] = text

	local text_disabled_name = "text_disabled"

	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_disabled_name,
		content_check_function = function (content)
			return content.disable_button
		end,
	}
	style[text_disabled_name] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("gray", 255),
		default_text_color = Colors.get_color_table_with_alpha("gray", 255),
		offset = {
			offset[1] + 10,
			offset[2] + 3,
			4,
		},
		size = size,
	}

	local text_shadow_name = "text_shadow"

	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_shadow_name,
	}
	style[text_shadow_name] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			offset[1] + 10 + 2,
			offset[2] + 1,
			3,
		},
		size = size,
	}

	local checkbox_background_name = "checkbox_background"

	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = checkbox_background_name,
	}

	local checkbox_size = {
		25,
		25,
	}
	local checkbox_offset = {
		size[1] - checkbox_size[1] + offset[1] - 20,
		offset[2] + size[2] / 2 - checkbox_size[2] / 2 + 2,
		3,
	}

	style[checkbox_background_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2],
		},
		offset = checkbox_offset,
		color = {
			255,
			0,
			0,
			0,
		},
	}

	local checkbox_frame_name = "checkbox_frame"

	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = checkbox_frame_name,
		style_id = checkbox_frame_name,
		content_check_function = function (content)
			return not content.is_disabled
		end,
	}
	checkbox_frame_settings_name = checkbox_frame_settings_name or "menu_frame_06"

	local frame_settings = UIFrameSettings[checkbox_frame_settings_name]

	hotspot_content[checkbox_frame_name] = frame_settings.texture
	style[checkbox_frame_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2],
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset[1],
			checkbox_offset[2],
			checkbox_offset[3] + 1,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}

	local checkbox_frame_disabled_name = "checkbox_frame_disabled"

	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = checkbox_frame_name,
		style_id = checkbox_frame_disabled_name,
		content_check_function = function (content)
			return not content.is_disabled
		end,
	}
	style[checkbox_frame_disabled_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2],
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset[1],
			checkbox_offset[2],
			checkbox_offset[3] + 1,
		},
		color = {
			96,
			255,
			255,
			255,
		},
	}

	local checkbox_marker_name = "checkbox_marker"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = checkbox_marker_name,
		style_id = checkbox_marker_name,
		content_check_function = function (content)
			return content.is_selected and not content.disable_button
		end,
	}
	hotspot_content[checkbox_marker_name] = "matchmaking_checkbox"

	local marker_size = {
		22,
		16,
	}
	local marker_offset = {
		checkbox_offset[1] + 4,
		checkbox_offset[2] + marker_size[2] / 2 - 1,
		checkbox_offset[3] + 2,
	}

	style[checkbox_marker_name] = {
		size = marker_size,
		offset = marker_offset,
		color = Colors.get_color_table_with_alpha("white", 255),
	}

	local checkbox_marker_disabled_name = "checkbox_marker_disabled"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = checkbox_marker_name,
		style_id = checkbox_marker_disabled_name,
		content_check_function = function (content)
			return content.is_selected and content.disable_button
		end,
	}
	style[checkbox_marker_disabled_name] = {
		size = marker_size,
		offset = marker_offset,
		color = Colors.get_color_table_with_alpha("gray", 255),
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

UIWidgets.create_default_checkbox_button_console = function (scenegraph_id, size, text, font_size, tooltip_info, checkbox_frame_settings_name)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local offset = {
		0,
		0,
		0,
	}
	local hotspot_name = "button_hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name,
	}
	style[hotspot_name] = {
		size = size,
		offset = offset,
	}
	content[hotspot_name] = {}

	local hotspot_content = content[hotspot_name]
	local hover_glow_name = "hover_glow"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = hover_glow_name,
		style_id = hover_glow_name,
	}
	style[hover_glow_name] = {
		size = {
			size[1],
			math.min(size[2] - 5, 80),
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + 5,
			2,
		},
	}
	hotspot_content[hover_glow_name] = "button_state_default"

	local clicked_rect_name = "clicked_rect"

	passes[#passes + 1] = {
		pass_type = "rect",
		content_id = hotspot_name,
		style_id = clicked_rect_name,
	}
	style[clicked_rect_name] = {
		size = size,
		color = {
			100,
			0,
			0,
			0,
		},
		offset = {
			offset[1],
			offset[2],
			6,
		},
	}

	if tooltip_info then
		content.tooltip_info = tooltip_info
	end

	local checkbox_size = {
		25,
		25,
	}
	local text_base_offset = {
		offset[1] + checkbox_size[1] + 15,
		offset[2] + 4,
		4,
	}
	local text_name = "text"

	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_name,
		content_check_function = function (content)
			return not content.disable_button
		end,
	}
	style[text_name] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		select_text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			text_base_offset[1],
			text_base_offset[2],
			text_base_offset[3],
		},
		size = size,
	}
	hotspot_content[text_name] = text

	local text_disabled_name = "text_disabled"

	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_disabled_name,
		content_check_function = function (content)
			return content.disable_button
		end,
	}
	style[text_disabled_name] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("gray", 255),
		default_text_color = Colors.get_color_table_with_alpha("gray", 255),
		offset = {
			text_base_offset[1],
			text_base_offset[2],
			text_base_offset[3],
		},
		size = size,
	}

	local text_shadow_name = "text_shadow"

	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_shadow_name,
	}
	style[text_shadow_name] = {
		font_size = 24,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			text_base_offset[1] + 2,
			text_base_offset[2] - 2,
			text_base_offset[3] - 1,
		},
		size = size,
	}

	local checkbox_background_name = "checkbox_background"

	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = checkbox_background_name,
	}

	local checkbox_offset = {
		offset[1] + 10,
		offset[2] + size[2] / 2 - checkbox_size[2] / 2 + 2,
		3,
	}

	style[checkbox_background_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2],
		},
		offset = checkbox_offset,
		color = {
			255,
			0,
			0,
			0,
		},
	}

	local checkbox_frame_name = "checkbox_frame"

	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = checkbox_frame_name,
		style_id = checkbox_frame_name,
		content_check_function = function (content)
			return not content.is_disabled
		end,
	}
	checkbox_frame_settings_name = checkbox_frame_settings_name or "menu_frame_06"

	local frame_settings = UIFrameSettings[checkbox_frame_settings_name]

	hotspot_content[checkbox_frame_name] = frame_settings.texture
	style[checkbox_frame_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2],
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset[1],
			checkbox_offset[2],
			checkbox_offset[3] + 1,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}

	local checkbox_frame_disabled_name = "checkbox_frame_disabled"

	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = checkbox_frame_name,
		style_id = checkbox_frame_disabled_name,
		content_check_function = function (content)
			return not content.is_disabled
		end,
	}
	style[checkbox_frame_disabled_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2],
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset[1],
			checkbox_offset[2],
			checkbox_offset[3] + 1,
		},
		color = {
			96,
			255,
			255,
			255,
		},
	}

	local checkbox_marker_name = "checkbox_marker"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = checkbox_marker_name,
		style_id = checkbox_marker_name,
		content_check_function = function (content)
			return content.is_selected and not content.disable_button
		end,
	}
	hotspot_content[checkbox_marker_name] = "matchmaking_checkbox"

	local marker_size = {
		22,
		16,
	}
	local marker_offset = {
		checkbox_offset[1] + 4,
		checkbox_offset[2] + marker_size[2] / 2 - 1,
		checkbox_offset[3] + 2,
	}

	style[checkbox_marker_name] = {
		size = marker_size,
		offset = marker_offset,
		color = Colors.get_color_table_with_alpha("white", 255),
	}

	local checkbox_marker_disabled_name = "checkbox_marker_disabled"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = checkbox_marker_name,
		style_id = checkbox_marker_disabled_name,
		content_check_function = function (content)
			return content.is_selected and content.disable_button
		end,
	}
	style[checkbox_marker_disabled_name] = {
		size = marker_size,
		offset = marker_offset,
		color = Colors.get_color_table_with_alpha("gray", 255),
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

UIWidgets.create_default_text_tabs = function (scenegraph_id, size, amount)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		amount = amount,
	}
	local style = {}
	local slot_width_spacing = 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local button_size = {
		tab_width,
		size[2],
	}
	local icon_size = {
		34,
		34,
	}
	local start_width_offset = 0

	for k = 1, amount do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1

		total_length = total_length + button_size[1] + slot_width_spacing

		local offset = {
			start_width_offset,
			0,
			offset_layer,
		}
		local hotspot_name = "hotspot" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name,
		}
		style[hotspot_name] = {
			size = button_size,
			offset = offset,
		}
		content[hotspot_name] = {}

		local hotspot_content = content[hotspot_name]
		local background_name = "background" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture_uv",
			content_id = background_name,
			style_id = background_name,
		}
		style[background_name] = {
			size = button_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				0,
			},
		}
		content[background_name] = {
			uvs = {
				{
					0,
					1 - math.min(button_size[2] / background_texture_settings.size[2], 1),
				},
				{
					math.min(button_size[1] / background_texture_settings.size[1], 1),
					1,
				},
			},
			texture_id = background_texture,
		}

		local background_fade_name = "background_fade" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = background_fade_name,
			style_id = background_fade_name,
		}
		style[background_fade_name] = {
			size = {
				button_size[1],
				button_size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				1,
			},
		}
		hotspot_content[background_fade_name] = "button_bg_fade"

		local hover_glow_name = "hover_glow" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = hover_glow_name,
			style_id = hover_glow_name,
		}
		style[hover_glow_name] = {
			size = {
				button_size[1],
				math.min(button_size[2] - 5, 80),
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] + 5,
				2,
			},
		}
		hotspot_content[hover_glow_name] = "button_state_default"

		local clicked_rect_name = "clicked_rect" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "rect",
			content_id = hotspot_name,
			style_id = clicked_rect_name,
		}
		style[clicked_rect_name] = {
			size = button_size,
			color = {
				100,
				0,
				0,
				0,
			},
			offset = {
				offset[1],
				offset[2],
				6,
			},
		}

		local glass_top_name = "glass_top" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_top_name,
			style_id = glass_top_name,
		}
		style[glass_top_name] = {
			size = {
				button_size[1],
				11,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] + button_size[2] - 11,
				5,
			},
		}
		hotspot_content[glass_top_name] = "button_glass_02"

		local glass_bottom_name = "glass_bottom" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_bottom_name,
			style_id = glass_bottom_name,
		}
		style[glass_bottom_name] = {
			size = {
				button_size[1],
				11,
			},
			color = {
				100,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2] - 3,
				5,
			},
		}
		hotspot_content[glass_bottom_name] = "button_glass_02"

		local text_name = "text" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			content_id = hotspot_name,
			text_id = text_name,
			style_id = text_name,
			content_check_function = function (content)
				return not content.disable_button
			end,
		}
		style[text_name] = {
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1],
				offset[2] + 3,
				4,
			},
			size = button_size,
		}
		hotspot_content[text_name] = Localize("not_assigned")

		local text_disabled_name = "text_disabled" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			content_id = hotspot_name,
			text_id = text_name,
			style_id = text_disabled_name,
			content_check_function = function (content)
				return content.disable_button
			end,
		}
		style[text_disabled_name] = {
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("gray", 255),
			default_text_color = Colors.get_color_table_with_alpha("gray", 255),
			offset = {
				offset[1],
				offset[2] + 3,
				4,
			},
			size = button_size,
		}

		local text_shadow_name = "text_shadow" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			content_id = hotspot_name,
			text_id = text_name,
			style_id = text_shadow_name,
		}
		style[text_shadow_name] = {
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				offset[1] + 2,
				offset[2] + 1,
				3,
			},
			size = button_size,
		}
		start_width_offset = start_width_offset + tab_width + slot_width_spacing
	end

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

UIWidgets.create_simple_window_button = function (scenegraph_id, size, text, font_size, background_texture)
	background_texture = background_texture or "button_bg_01"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "background",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect",
				},
				{
					pass_type = "rect",
					style_id = "disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			button_hotspot = {},
			title_text = text or "n/a",
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					2,
				},
				size = {
					size[1],
					size[2],
				},
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			title_text = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					3,
					6,
				},
			},
			title_text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					3,
					6,
				},
			},
			title_text_shadow = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					1,
					5,
				},
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 11,
					4,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					0,
					-3,
					4,
				},
				size = {
					size[1],
					11,
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
end

UIWidgets.create_window_category_button = function (scenegraph_id, size, button_text, icon_name, background_icon, dynamic_font_size)
	icon_name = icon_name or "options_button_icon_quickplay"

	local icon_glow_name = icon_name .. "_glow"
	local icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_name)
	local icon_size = icon_settings.size
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local new_frame_name = "frame_outer_glow_01"
	local new_frame_settings = UIFrameSettings[new_frame_name]
	local new_frame_width = new_frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "background",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "background_icon",
					texture_id = "background_icon",
					content_check_function = function (content)
						return content.background_icon
					end,
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot

						if not button_hotspot.disable_button and not button_hotspot.is_selected then
							-- Nothing
						end

						if false then
							-- Nothing
						end
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture",
					style_id = "new_texture",
					texture_id = "new_texture",
					content_check_function = function (content)
						return content.new
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_disabled",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_selected",
					texture_id = "icon_selected",
				},
				{
					pass_type = "texture",
					style_id = "icon_frame",
					texture_id = "icon_frame",
				},
				{
					pass_type = "texture",
					style_id = "icon_glass",
					texture_id = "icon_glass",
				},
				{
					pass_type = "texture",
					style_id = "icon_bg_glow",
					texture_id = "icon_bg_glow",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "texture",
					style_id = "select_glow",
					texture_id = "select_glow",
				},
				{
					pass_type = "texture",
					style_id = "skull_select_glow",
					texture_id = "skull_select_glow",
				},
				{
					pass_type = "text",
					style_id = "button_text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_disabled",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_shadow",
					text_id = "button_text",
				},
				{
					pass_type = "rect",
					style_id = "button_clicked_rect",
				},
				{
					pass_type = "rect",
					style_id = "button_disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			icon_bg_glow = "menu_options_button_glow_01",
			icon_frame = "menu_options_button_bg",
			icon_glass = "menu_options_button_fg",
			new_texture = "list_item_tag_new",
			select_glow = "button_state_default_2",
			skull_select_glow = "menu_options_button_glow_03",
			background_icon = background_icon,
			icon = icon_name,
			icon_selected = icon_glow_name,
			frame = frame_settings.texture,
			button_hotspot = {},
			button_text = button_text or "n/a",
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
				color = {
					255,
					200,
					200,
					200,
				},
				offset = {
					0,
					0,
					0,
				},
				size = size,
			},
			background_fade = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width,
					1,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			background_icon = {
				horizontal_alignment = "right",
				saturated = false,
				vertical_alignment = "center",
				color = {
					150,
					100,
					100,
					100,
				},
				default_color = {
					150,
					100,
					100,
					100,
				},
				texture_size = {
					350,
					108,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					2,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			select_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			button_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					130,
					0,
					6,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			button_text_disabled = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					130,
					0,
					6,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			button_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					132,
					-2,
					5,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			button_clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
				size = size,
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					0,
					0,
					5,
				},
				size = size,
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - (frame_width + 9),
					6,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 11,
					6,
				},
				size = {
					size[1],
					11,
				},
			},
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			new_texture = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 126,
					size[2] - 56,
					6,
				},
				size = {
					126,
					51,
				},
			},
			icon_frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					0,
					0,
					11,
				},
			},
			icon_glass = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					0,
					0,
					15,
				},
			},
			icon_bg_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					0,
					0,
					14,
				},
			},
			icon = {
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_color = Colors.get_color_table_with_alpha("white", 255),
				texture_size = icon_size,
				offset = {
					54 - icon_size[1] / 2,
					54 - icon_size[2] / 2,
					12,
				},
			},
			icon_disabled = {
				color = {
					255,
					40,
					40,
					40,
				},
				default_color = {
					255,
					40,
					40,
					40,
				},
				select_color = {
					255,
					40,
					40,
					40,
				},
				texture_size = icon_size,
				offset = {
					54 - icon_size[1] / 2,
					54 - icon_size[2] / 2,
					12,
				},
			},
			icon_selected = {
				color = {
					0,
					255,
					255,
					255,
				},
				texture_size = icon_size,
				offset = {
					54 - icon_size[1] / 2,
					54 - icon_size[2] / 2,
					13,
				},
			},
			skull_select_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					12,
				},
				size = {
					28,
					size[2],
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

	return widget
end

UIWidgets.create_window_category_button_mirrored = function (scenegraph_id, size, button_text, icon_name, background_icon, dynamic_font_size)
	icon_name = icon_name or "options_button_icon_quickplay"

	local icon_glow_name = icon_name .. "_glow"
	local icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_name)
	local icon_size = icon_settings.size
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_08"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local new_frame_name = "frame_outer_glow_01"
	local new_frame_settings = UIFrameSettings[new_frame_name]
	local new_frame_width = new_frame_settings.texture_sizes.corner[1]
	local widget = {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "background",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					content_id = "background_icon",
					pass_type = "texture_uv",
					style_id = "background_icon",
					content_check_function = function (content)
						return content.texture_id
					end,
					content_change_function = function (content, style)
						local parent_content = content.parent
						local button_hotspot = parent_content.button_hotspot

						if not button_hotspot.disable_button and not button_hotspot.is_selected then
							-- Nothing
						end

						if false then
							-- Nothing
						end
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "new_texture",
					pass_type = "texture_uv",
					style_id = "new_texture",
					content_check_function = function (content)
						local parent_content = content.parent

						return parent_content.new
					end,
				},
				{
					content_id = "icon",
					pass_type = "texture_uv",
					style_id = "icon",
					content_check_function = function (content)
						local parent_content = content.parent
						local button_hotspot = parent_content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					content_id = "icon",
					pass_type = "texture_uv",
					style_id = "icon_disabled",
					content_check_function = function (content)
						local parent_content = content.parent
						local button_hotspot = parent_content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_selected",
					texture_id = "icon_selected",
				},
				{
					content_id = "icon_frame",
					pass_type = "texture_uv",
					style_id = "icon_frame",
				},
				{
					pass_type = "texture",
					style_id = "icon_glass",
					texture_id = "icon_glass",
				},
				{
					pass_type = "texture",
					style_id = "icon_bg_glow",
					texture_id = "icon_bg_glow",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "texture",
					style_id = "select_glow",
					texture_id = "select_glow",
				},
				{
					content_id = "skull_select_glow",
					pass_type = "texture_uv",
					style_id = "skull_select_glow",
				},
				{
					pass_type = "text",
					style_id = "button_text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_disabled",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_shadow",
					text_id = "button_text",
				},
				{
					pass_type = "rect",
					style_id = "button_clicked_rect",
				},
				{
					pass_type = "rect",
					style_id = "button_disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			icon_bg_glow = "menu_options_button_glow_01",
			icon_glass = "menu_options_button_fg",
			select_glow = "button_state_default_2",
			background_icon = {
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
				texture_id = background_icon,
			},
			icon = {
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
				texture_id = icon_name,
			},
			icon_frame = {
				texture_id = "menu_options_button_bg",
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
			},
			new_texture = {
				texture_id = "list_item_tag_new",
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
			},
			skull_select_glow = {
				texture_id = "menu_options_button_glow_03",
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
			},
			icon_selected = icon_glow_name,
			frame = frame_settings.texture,
			button_hotspot = {},
			button_text = button_text or "n/a",
			background = {
				uvs = {
					{
						0,
						1 - math.min(size[2] / background_texture_settings.size[2], 1),
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
				color = {
					255,
					200,
					200,
					200,
				},
				offset = {
					0,
					0,
					0,
				},
				size = size,
			},
			background_fade = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width,
					1,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
				},
			},
			background_icon = {
				horizontal_alignment = "left",
				saturated = false,
				vertical_alignment = "center",
				color = {
					150,
					100,
					100,
					100,
				},
				default_color = {
					150,
					100,
					100,
					100,
				},
				texture_size = {
					350,
					108,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					2,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			select_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			button_text = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "right",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					10,
					0,
					6,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			button_text_disabled = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "right",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					10,
					0,
					6,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			button_text_shadow = {
				font_size = 32,
				font_type = "hell_shark_header",
				horizontal_alignment = "right",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				dynamic_font_size = dynamic_font_size,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					12,
					-2,
					5,
				},
				size = {
					size[1] - 140,
					size[2],
				},
			},
			button_clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
				size = size,
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					0,
					0,
					5,
				},
				size = size,
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - (frame_width + 9),
					6,
				},
				size = {
					size[1],
					11,
				},
			},
			glass_bottom = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 11,
					6,
				},
				size = {
					size[1],
					11,
				},
			},
			frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					10,
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
			},
			new_texture = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 56,
					6,
				},
				size = {
					126,
					51,
				},
			},
			icon_frame = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					size[1] - 116,
					0,
					11,
				},
			},
			icon_glass = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					size[1] - 108,
					0,
					15,
				},
			},
			icon_bg_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				texture_size = {
					116,
					108,
				},
				offset = {
					size[1] - 108,
					0,
					14,
				},
			},
			icon = {
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_color = Colors.get_color_table_with_alpha("white", 255),
				texture_size = icon_size,
				offset = {
					size[1] - icon_size[1] - (54 - icon_size[1] / 2),
					54 - icon_size[2] / 2,
					12,
				},
			},
			icon_disabled = {
				color = {
					255,
					40,
					40,
					40,
				},
				default_color = {
					255,
					40,
					40,
					40,
				},
				select_color = {
					255,
					40,
					40,
					40,
				},
				texture_size = icon_size,
				offset = {
					size[1] - icon_size[1] - (54 - icon_size[1] / 2),
					54 - icon_size[2] / 2,
					12,
				},
			},
			icon_selected = {
				color = {
					0,
					255,
					255,
					255,
				},
				texture_size = icon_size,
				offset = {
					size[1] - icon_size[1] - (54 - icon_size[1] / 2),
					54 - icon_size[2] / 2,
					13,
				},
			},
			skull_select_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 28,
					0,
					12,
				},
				size = {
					28,
					size[2],
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

	return widget
end

UIWidgets.create_play_button = function (scenegraph_id, size, text, font_size, disable_with_gamepad)
	local button_color_name
	local optional_color_name = "green"

	if optional_color_name then
		button_color_name = "button_" .. optional_color_name
	else
		button_color_name = "button_normal"
	end

	local background_color = Colors.get_color_table_with_alpha(button_color_name, 255)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_08
	local side_detail_glow = "button_detail_05_glow"
	local side_detail_glow_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_glow)
	local side_detail_glow_size = side_detail_glow_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
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
					pass_type = "rect",
					style_id = "clicked_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end,
				},
				{
					pass_type = "rect",
					style_id = "disabled_rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "side_detail_right",
					texture_id = "side_detail_right",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "side_detail_left",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "side_detail_right_disabled",
					texture_id = "side_detail_right",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "side_detail_left_disabled",
					texture_id = "side_detail_left",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail_glow",
					pass_type = "texture_uv",
					style_id = "side_detail_glow_right",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					content_id = "side_detail_glow",
					pass_type = "texture",
					style_id = "side_detail_glow_left",
					texture_id = "texture_id",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow",
				},
				{
					pass_type = "texture",
					style_id = "effect",
					texture_id = "effect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
			},
		},
		content = {
			effect = "play_button_passive_glow",
			glass_top = "button_glass_01",
			glow = "button_state_normal_green",
			hover_glow = "button_state_hover_green",
			side_detail_left = "button_detail_05_left",
			side_detail_right = "button_detail_05_right",
			side_detail_glow = {
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
				texture_id = side_detail_glow,
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			disable_with_gamepad = disable_with_gamepad,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
				color = background_color,
				offset = {
					0,
					0,
					0,
				},
				size = {
					size[1],
					size[2],
				},
			},
			clicked_rect = {
				color = {
					100,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
				size = {
					size[1],
					size[2],
				},
			},
			disabled_rect = {
				color = {
					150,
					5,
					5,
					5,
				},
				offset = {
					0,
					0,
					7,
				},
				size = {
					size[1],
					size[2],
				},
			},
			title_text = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					9,
				},
				size = {
					size[1],
					size[2],
				},
			},
			title_text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					9,
				},
				size = {
					size[1],
					size[2],
				},
			},
			title_text_shadow = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					8,
				},
				size = {
					size[1],
					size[2],
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
					8,
				},
				size = {
					size[1],
					size[2],
				},
			},
			hover_glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					1,
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2),
				},
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - frame_settings.texture_sizes.horizontal[2] - 4,
					6,
				},
				size = {
					size[1],
					5,
				},
			},
			glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2] - 1,
					3,
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2),
				},
			},
			effect = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					5,
				},
				size = {
					size[1],
					size[2],
				},
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] / 2 - 36,
					9,
				},
				size = {
					88,
					72,
				},
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 88,
					size[2] / 2 - 36,
					9,
				},
				size = {
					88,
					72,
				},
			},
			side_detail_left_disabled = {
				color = {
					255,
					200,
					200,
					200,
				},
				offset = {
					0,
					size[2] / 2 - 36,
					9,
				},
				size = {
					88,
					72,
				},
			},
			side_detail_right_disabled = {
				color = {
					255,
					200,
					200,
					200,
				},
				offset = {
					size[1] - 88,
					size[2] / 2 - 36,
					9,
				},
				size = {
					88,
					72,
				},
			},
			side_detail_glow_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] / 2 - side_detail_glow_size[2] / 2,
					10,
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2],
				},
			},
			side_detail_glow_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - side_detail_glow_size[1],
					size[2] / 2 - side_detail_glow_size[2] / 2,
					10,
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2],
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
end

UIWidgets.create_icon_button = function (scenegraph_id, size, frame_name, background_texture, icon_name)
	background_texture = background_texture or "menu_frame_bg_06"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.menu_frame_06
	local frame_width = frame_settings.texture_sizes.corner[1]
	local icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_name)
	local icon_size = icon_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "frame",
				},
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
					style_id = "background_fade",
					texture_id = "background_fade",
				},
				{
					pass_type = "texture",
					style_id = "glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "glass_bottom",
					texture_id = "glass_bottom",
				},
				{
					pass_type = "texture",
					style_id = "texture_hover",
					texture_id = "texture_hover",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			glass_bottom = "tabs_glass_bottom",
			glass_top = "tabs_glass_top",
			texture_hover = "button_state_default",
			texture_icon = icon_name,
			button_hotspot = {},
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2],
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255,
				},
				offset = {
					frame_width,
					frame_width - 2,
					1,
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2,
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
					6,
				},
			},
			texture_hover = {
				color = {
					0,
					255,
					255,
					255,
				},
				default_color = {
					0,
					255,
					255,
					255,
				},
				hover_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_width - 2,
					3,
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80),
				},
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					5,
				},
				size = {
					size[1],
					3,
				},
			},
			glass_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					5,
				},
				size = {
					size[1],
					3,
				},
			},
			texture_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = icon_size,
				color = {
					200,
					255,
					255,
					255,
				},
				default_color = {
					200,
					255,
					255,
					255,
				},
				hover_color = {
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
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
end

UIWidgets.create_stepper = function (scenegraph_id, size, frame_name, background_texture, text)
	background_texture = background_texture or "menu_frame_bg_06"

	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local background_size = background_texture_settings and background_texture_settings.size or size
	local frame_settings = frame_name and UIFrameSettings[frame_name] or UIFrameSettings.menu_frame_06
	local arrow_icon_size = {
		28,
		34,
	}
	local arrow_button_size = {
		50,
		size[2],
	}
	local left_button_offset = {
		-arrow_button_size[1],
		0,
		0,
	}
	local right_button_offset = {
		size[1],
		0,
		0,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "setting_text",
					text_id = "setting_text",
					content_check_function = function (content)
						local button_hotspot_left = content.button_hotspot_left
						local button_hotspot_right = content.button_hotspot_right

						return not button_hotspot_left.disable_button and not button_hotspot_right.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "setting_text_disabled",
					text_id = "setting_text",
					content_check_function = function (content)
						local button_hotspot_left = content.button_hotspot_left
						local button_hotspot_right = content.button_hotspot_right

						return button_hotspot_left.disable_button and button_hotspot_right.disable_button
					end,
				},
				{
					content_id = "button_hotspot_left",
					pass_type = "hotspot",
					style_id = "left_frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "left_frame",
					texture_id = "frame",
				},
				{
					content_id = "arrow_background",
					pass_type = "texture_uv",
					style_id = "left_background",
				},
				{
					pass_type = "texture",
					style_id = "left_glow",
					texture_id = "glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot_left

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
				{
					pass_type = "texture",
					style_id = "left_glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "left_glass_bottom",
					texture_id = "glass_bottom",
				},
				{
					pass_type = "texture",
					style_id = "left_button_icon",
					texture_id = "button_icon",
				},
				{
					pass_type = "texture",
					style_id = "left_button_icon_clicked",
					texture_id = "button_icon_clicked",
				},
				{
					content_id = "button_hotspot_right",
					pass_type = "hotspot",
					style_id = "right_frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "right_frame",
					texture_id = "frame",
				},
				{
					content_id = "arrow_background",
					pass_type = "texture_uv",
					style_id = "right_background",
				},
				{
					pass_type = "texture",
					style_id = "right_glow",
					texture_id = "glow",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot_right

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end,
				},
				{
					pass_type = "texture",
					style_id = "right_glass_top",
					texture_id = "glass_top",
				},
				{
					pass_type = "texture",
					style_id = "right_glass_bottom",
					texture_id = "glass_bottom",
				},
				{
					pass_type = "rotated_texture",
					style_id = "right_button_icon",
					texture_id = "button_icon",
				},
				{
					pass_type = "rotated_texture",
					style_id = "right_button_icon_clicked",
					texture_id = "button_icon_clicked",
				},
			},
		},
		content = {
			button_icon = "settings_arrow_normal",
			button_icon_clicked = "settings_arrow_clicked",
			glass_bottom = "tabs_glass_bottom",
			glass_top = "tabs_glass_top",
			glow = "tabs_glow",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						size[1] / background_size[1],
						size[2] / background_size[2],
					},
				},
				texture_id = background_texture,
			},
			arrow_background = {
				uvs = {
					{
						0,
						0,
					},
					{
						arrow_button_size[1] / background_size[1],
						arrow_button_size[2] / background_size[2],
					},
				},
				texture_id = background_texture,
			},
			button_hotspot = {},
			setting_text = text or "test_text",
			button_hotspot_left = {},
			button_hotspot_right = {},
		},
		style = {
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
					4,
				},
			},
			glow = {
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
			glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					3,
				},
				size = {
					size[1],
					3,
				},
			},
			glass_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					3,
				},
				size = {
					size[1],
					3,
				},
			},
			background = {
				size = size,
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
			setting_text = {
				dynamic_font = true,
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				pixel_perfect = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					4,
				},
			},
			setting_text_disabled = {
				dynamic_font = true,
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				pixel_perfect = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("gray", 128),
				offset = {
					0,
					0,
					4,
				},
			},
			left_glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					left_button_offset[1],
					arrow_button_size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					4,
				},
				size = {
					arrow_button_size[1],
					3,
				},
			},
			left_glass_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					left_button_offset[1],
					frame_settings.texture_sizes.horizontal[2],
					4,
				},
				size = {
					arrow_button_size[1],
					3,
				},
			},
			left_glow = {
				size = arrow_button_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					left_button_offset[1],
					left_button_offset[2],
					1,
				},
			},
			left_frame = {
				size = arrow_button_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					left_button_offset[1],
					left_button_offset[2],
					5,
				},
			},
			left_background = {
				size = arrow_button_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = left_button_offset,
			},
			left_button_icon = {
				size = arrow_icon_size,
				offset = {
					left_button_offset[1] + (arrow_button_size[1] / 2 - arrow_icon_size[1] / 2),
					left_button_offset[2] + (arrow_button_size[2] / 2 - arrow_icon_size[2] / 2),
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			left_button_icon_clicked = {
				color = {
					0,
					255,
					255,
					255,
				},
				size = arrow_icon_size,
				offset = {
					left_button_offset[1] + (arrow_button_size[1] / 2 - arrow_icon_size[1] / 2),
					left_button_offset[2] + (arrow_button_size[2] / 2 - arrow_icon_size[2] / 2),
					3,
				},
			},
			right_glass_top = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					right_button_offset[1],
					arrow_button_size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					4,
				},
				size = {
					arrow_button_size[1],
					3,
				},
			},
			right_glass_bottom = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					right_button_offset[1],
					frame_settings.texture_sizes.horizontal[2],
					4,
				},
				size = {
					arrow_button_size[1],
					3,
				},
			},
			right_glow = {
				size = arrow_button_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					right_button_offset[1],
					right_button_offset[2],
					1,
				},
			},
			right_frame = {
				size = arrow_button_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					right_button_offset[1],
					right_button_offset[2],
					5,
				},
			},
			right_background = {
				size = arrow_button_size,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = right_button_offset,
			},
			right_button_icon = {
				angle = math.degrees_to_radians(180),
				pivot = {
					14,
					17,
				},
				size = arrow_icon_size,
				offset = {
					right_button_offset[1] + (arrow_button_size[1] / 2 - arrow_icon_size[1] / 2),
					right_button_offset[2] + (arrow_button_size[2] / 2 - arrow_icon_size[2] / 2),
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			right_button_icon_clicked = {
				angle = math.degrees_to_radians(180),
				color = {
					0,
					255,
					255,
					255,
				},
				pivot = {
					14,
					17,
				},
				size = arrow_icon_size,
				offset = {
					right_button_offset[1] + (arrow_button_size[1] / 2 - arrow_icon_size[1] / 2),
					right_button_offset[2] + (arrow_button_size[2] / 2 - arrow_icon_size[2] / 2),
					3,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.create_title_and_tooltip = function (scenegraph_id, size, text, tooltip_text, text_style, tooltip_style)
	local text_style_disabled

	if text_style then
		text_style_disabled = table.clone(text_style)
		text_style_disabled.text_color = Colors.get_color_table_with_alpha("gray", 128)
	end

	return {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (ui_content)
						return not ui_content.disabled
					end,
				},
				{
					pass_type = "text",
					style_id = "text_disabled",
					text_id = "text",
					content_check_function = function (ui_content)
						return ui_content.disabled
					end,
				},
				{
					content_id = "tooltip_hotspot",
					pass_type = "hotspot",
					content_check_function = function (ui_content)
						return not ui_content.disabled
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return not ui_content.disabled and ui_content.tooltip_hotspot.is_hover
					end,
				},
			},
		},
		content = {
			tooltip_hotspot = {
				allow_multi_hover = true,
			},
			tooltip_text = tooltip_text,
			text = text,
		},
		style = {
			text = text_style or {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
			},
			text_disabled = text_style_disabled or {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("gray", 128),
			},
			tooltip_text = tooltip_style or {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					50,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.create_icon_selector = function (scenegraph_id, icon_size, slot_icons, slot_spacing, use_frame, optional_frame_size, optional_allow_multi_hover, disable_cross)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local amount = #slot_icons
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		amount = amount,
		disable_cross = disable_cross,
	}
	local style = {}
	local slot_width_spacing = slot_spacing or 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local start_width_offset = 0
	local frame_settings = UIPlayerPortraitFrameSettings.default

	for k = 1, amount do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1

		total_length = total_length + icon_size[1] + slot_width_spacing

		local offset = {
			start_width_offset,
			0,
			offset_layer,
		}
		local hotspot_name = "hotspot" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name,
		}
		style[hotspot_name] = {
			size = icon_size,
			offset = offset,
		}
		content[hotspot_name] = {
			allow_multi_hover = optional_allow_multi_hover,
		}

		local hotspot_content = content[hotspot_name]
		local icon_texture = slot_icons[k]
		local icon_name = "icon" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = icon_name,
			style_id = icon_name,
			content_check_function = function (content)
				return not content.disable_button
			end,
		}
		style[icon_name] = {
			size = icon_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 2,
			},
		}
		hotspot_content[icon_name] = icon_texture

		local icon_texture = slot_icons[k]
		local icon_name = "icon" .. name_suffix .. "_saturated"

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = icon_name,
			style_id = icon_name,
			content_check_function = function (content)
				return content.disable_button
			end,
		}
		style[icon_name] = {
			size = icon_size,
			color = default_color,
			default_color = default_color,
			disabled_color = {
				255,
				30,
				30,
				30,
			},
			offset = {
				offset[1],
				offset[2],
				offset[3] + 2,
			},
		}
		hotspot_content[icon_name] = icon_texture .. "_saturated"

		local selection_icon_name = "selection_icon" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = selection_icon_name,
			style_id = selection_icon_name,
			content_check_function = function (content)
				return content[selection_icon_name] and content.is_selected
			end,
		}
		style[selection_icon_name] = {
			size = icon_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 3,
			},
			default_offset = {
				offset[1],
				offset[2],
				offset[3] + 4,
			},
		}

		local disabled_name = "disabled" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = disabled_name,
			style_id = disabled_name,
			content_check_function = function (content)
				return content.disable_button and not content.locked and not content.parent.disable_cross
			end,
		}
		style[disabled_name] = {
			saturated = true,
			size = icon_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 4,
			},
		}
		hotspot_content[disabled_name] = "kick_player_icon"

		local locked_name = "locked" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = locked_name,
			style_id = locked_name,
			content_check_function = function (content)
				return content.locked
			end,
		}
		style[locked_name] = {
			size = {
				30,
				38,
			},
			color = default_color,
			offset = {
				offset[1] + icon_size[1] / 2 - 15,
				offset[2] + icon_size[2] / 2 - 19,
				offset[3] + 5,
			},
		}
		hotspot_content[locked_name] = "locked_icon_01"

		if use_frame then
			local frame_name = "frame" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = frame_name,
				style_id = frame_name,
			}

			local frame_size = optional_frame_size and table.clone(optional_frame_size) or {
				86,
				108,
			}

			style[frame_name] = {
				size = {
					frame_size[1],
					frame_size[2],
				},
				color = default_color,
				offset = {
					offset[1] + icon_size[1] / 2 - frame_size[1] / 2,
					offset[2] + icon_size[2] / 2 - frame_size[2] / 2,
					offset[3] + 3,
				},
			}
			hotspot_content[frame_name] = "portrait_frame_hero_selection"
		end

		start_width_offset = start_width_offset + icon_size[1] + slot_width_spacing
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		-total_length / 2,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_title_widget = function (scenegraph_id, size, title_text, use_fade, disable_detail, flip_fade, font_size)
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
		},
	}
	local content = {
		title_text = title_text or "n/a",
	}
	local style = {
		title_text = {
			font_type = "hell_shark",
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "center",
			font_size = font_size or 24,
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				size[2] - 40,
				3,
			},
			size = {
				size[1],
				30,
			},
		},
	}

	if not disable_detail then
		local title_detail_length = size[1] * 0.3

		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = "title_detail_center",
			texture_id = "title_detail_center",
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = "title_detail_line",
			texture_id = "title_detail_line",
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = "title_detail_left",
			texture_id = "title_detail_left",
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = "title_detail_right",
			texture_id = "title_detail_right",
		}
		style.title_detail_center = {
			size = {
				85,
				17,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] / 2 - 42.5,
				size[2] - 60,
				4,
			},
		}
		style.title_detail_line = {
			size = {
				title_detail_length,
				17,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] / 2 - title_detail_length / 2,
				size[2] - 60,
				3,
			},
		}
		style.title_detail_left = {
			size = {
				7,
				17,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] / 2 - title_detail_length / 2 - 7,
				size[2] - 60,
				3,
			},
		}
		style.title_detail_right = {
			size = {
				7,
				17,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				size[1] / 2 + title_detail_length / 2,
				size[2] - 60,
				3,
			},
		}
		content.title_detail_center = "title_detail_01_middle"
		content.title_detail_line = "title_detail_01_tile"
		content.title_detail_left = "title_detail_01_left"
		content.title_detail_right = "title_detail_01_right"
	end

	if use_fade then
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			style_id = "title_bg_fade",
			texture_id = "title_bg_fade",
		}
		content.title_bg_fade = "edge_fade_small"

		if flip_fade then
			style.title_bg_fade = {
				angle = 0,
				pivot = {
					size[1] / 2,
					40,
				},
				size = {
					size[1],
					80,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 80,
					1,
				},
			}
		else
			style.title_bg_fade = {
				pivot = {
					size[1] / 2,
					40,
				},
				angle = math.degrees_to_radians(180),
				size = {
					size[1],
					80,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					size[2] - 80,
					1,
				},
			}
		end
	end

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

UIWidgets.create_large_window_title = function (scenegraph_id, size, text, font_size)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.button_frame_01
	local side_detail_texture = "frame_title_detail_06"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "side_detail",
					pass_type = "texture_uv",
					style_id = "side_detail_right",
				},
				{
					content_id = "side_detail",
					pass_type = "texture",
					style_id = "side_detail_left",
					texture_id = "texture_id",
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
			},
		},
		content = {
			glow = "button_state_normal",
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
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2],
					},
					{
						size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
		},
		style = {
			background = {
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
			glow = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2] - 1,
					2,
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2),
				},
			},
			title_text = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					5,
				},
			},
			title_text_disabled = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					5,
				},
			},
			title_text_shadow = {
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					4,
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
					7,
				},
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-32,
					0,
					8,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
				},
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					size[1] - 48,
					0,
					8,
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2],
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
end

GAMEPAD_CURSOR_SIZE = 64

UIWidgets.create_console_cursor = function (scenegraph_id)
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "gamepad_cursor",
			style_id = "cursor",
			texture_id = "cursor",
			content_check_function = function (content, style)
				return not Managers.popup:has_popup()
			end,
		},
	}
	local content = {
		cursor = "console_cursor",
	}
	local style = {
		cursor = {
			size = {
				GAMEPAD_CURSOR_SIZE,
				GAMEPAD_CURSOR_SIZE,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				-GAMEPAD_CURSOR_SIZE * 0.5,
				-GAMEPAD_CURSOR_SIZE * 0.5,
				1000,
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

UIWidgets.create_difficulty_selector = function (scenegraph_id, size, spacing, amount, image_size)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		amount = amount,
	}
	local style = {
		background = {
			color = {
				255,
				5,
				5,
				5,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		background_top = {
			size = {
				size[1] - 2,
				size[2] - 2,
			},
			color = {
				255,
				15,
				15,
				15,
			},
			offset = {
				2,
				0,
				1,
			},
		},
	}
	local slot_width_spacing = spacing or 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount

	image_size = image_size or {
		194,
		190,
	}

	local slot_size = {
		tab_width,
		size[2],
	}
	local start_width_offset = 0
	local frame_settings = UIFrameSettings.menu_frame_06

	for k = 1, amount do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1

		total_length = total_length + slot_size[1] + slot_width_spacing

		local offset = {
			start_width_offset,
			0,
			offset_layer,
		}
		local hotspot_name = "hotspot" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name,
		}
		style[hotspot_name] = {
			size = slot_size,
			offset = offset,
		}
		content[hotspot_name] = {}

		local hotspot_content = content[hotspot_name]
		local background_image_name = "background_image" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = background_image_name,
			style_id = background_image_name,
		}
		style[background_image_name] = {
			size = image_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1] + slot_size[1] / 2 - image_size[1] / 2,
				offset[2] + slot_size[2] - image_size[2],
				2,
			},
		}
		hotspot_content[background_image_name] = "difficulty_option_" .. k

		local background_glow_name = "background_glow" .. name_suffix

		style[background_glow_name] = {
			size = {
				slot_size[1],
				slot_size[2],
			},
			color = {
				200,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				1,
			},
		}
		hotspot_content[background_glow_name] = "tabs_glow"

		local background_glow_select_name = "background_glow_select" .. name_suffix

		style[background_glow_select_name] = {
			size = {
				slot_size[1],
				slot_size[2],
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				2,
			},
		}
		hotspot_content[background_glow_select_name] = "tabs_glow_animated"

		local title_text_name = "title_text" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_name,
		}
		style[title_text_name] = {
			font_size = 32,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				slot_size[1],
				slot_size[2] * 0.2 - frame_settings.texture_sizes.vertical[1],
			},
			offset = {
				offset[1],
				offset[2],
				7,
			},
		}
		hotspot_content[title_text_name] = "title_text"
		start_width_offset = start_width_offset + tab_width + slot_width_spacing
	end

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

UIWidgets.create_base_portrait_frame = function (scenegraph_id, frame_settings_name, scale, offset, masked, skip_offset)
	scale = scale or 1

	local frame_settings_name = frame_settings_name or "default"
	local frame_settings = UIPlayerPortraitFrameSettings[frame_settings_name]
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local default_offset = {
		0,
		0,
		0,
	}
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		scale = scale,
		frame_settings_name = frame_settings_name,
	}
	local style = {}

	for index, data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = data.texture or "icons_placeholder"
		local size = data.size

		if UIAtlasHelper.has_atlas_settings_by_texture_name(texture_name) then
			local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)

			size = texture_settings.size
		else
			size = data.size
		end

		size = size and table.clone(size) or {
			0,
			0,
		}
		size[1] = size[1] * scale
		size[2] = size[2] * scale

		local offset = table.clone(not skip_offset and data.offset or default_offset)

		offset[1] = offset[1] * scale
		offset[2] = offset[2] * scale
		offset[3] = data.layer or 0
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = name,
			style_id = name,
		}
		content[name] = texture_name
		style[name] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			color = data.color or default_color,
			offset = offset,
			texture_size = size,
		}
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = offset or {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_portrait_frame = function (scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	scale = scale or 1

	local frame_settings_name = frame_settings_name or "default"
	local frame_settings = UIPlayerPortraitFrameSettings[frame_settings_name]
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local default_offset = {
		0,
		-60,
		0,
	}
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		scale = scale,
		frame_settings_name = frame_settings_name,
	}
	local style = {}

	for index, data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = data.texture or "icons_placeholder"
		local size = data.size

		if UIAtlasHelper.has_atlas_settings_by_texture_name(texture_name) then
			local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)

			size = texture_settings.size
		else
			size = data.size
		end

		size = size and table.clone(size) or {
			0,
			0,
		}
		size[1] = size[1] * scale
		size[2] = size[2] * scale

		local offset = table.clone(data.offset or default_offset)

		offset[1] = -(size[1] / 2) + offset[1] * scale
		offset[2] = offset[2] * scale
		offset[3] = data.layer or 0
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = name,
			style_id = name,
			retained_mode = retained_mode,
		}
		content[name] = texture_name
		style[name] = {
			color = data.color or default_color,
			offset = offset,
			size = size,
		}
	end

	if portrait_texture then
		local portrait_size = {
			86,
			108,
		}

		portrait_size[1] = portrait_size[1] * scale
		portrait_size[2] = portrait_size[2] * scale

		local portrait_offset = {
			0,
			0,
			0,
		}

		portrait_offset[1] = -(portrait_size[1] / 2) + portrait_offset[1] * scale
		portrait_offset[2] = -(portrait_size[2] / 2) + portrait_offset[2] * scale
		portrait_offset[3] = 1

		local portrait_name = "portrait"

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = portrait_name,
			style_id = portrait_name,
			retained_mode = retained_mode,
		}
		content[portrait_name] = portrait_texture
		style[portrait_name] = {
			color = default_color,
			offset = portrait_offset,
			size = portrait_size,
		}
	end

	local portrait_size = {
		86,
		108,
	}

	portrait_size[1] = portrait_size[1] * scale
	portrait_size[2] = portrait_size[2] * scale

	local level_size = {
		22,
		15,
	}
	local level_offset = {
		0,
		0,
		0,
	}

	level_offset[1] = level_offset[1] * scale - level_size[1] / 2 - 1
	level_offset[2] = -(portrait_size[2] / 2) + level_offset[2] * scale - 4
	level_offset[3] = 15

	local level_name = "level"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = level_name,
		style_id = level_name,
		retained_mode = retained_mode,
	}
	content[level_name] = level_text
	style[level_name] = {
		font_size = 12,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		vertical_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = level_offset,
		size = level_size,
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

UIWidgets.create_portrait_frame_button = function (scenegraph_id, frame_settings_name, scale, retained_mode, portrait_texture)
	scale = scale or 1

	local frame_settings = UIPlayerPortraitFrameSettings[frame_settings_name]
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local default_offset = {
		0,
		0,
		0,
	}
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		scale = scale,
		frame_settings_name = frame_settings_name,
	}
	local style = {}

	for index, data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = data.texture or "icons_placeholder"
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
		local size = data.size or texture_settings.size

		size = size and table.clone(size) or {
			0,
			0,
		}
		size[1] = size[1] * scale
		size[2] = size[2] * scale

		local offset = table.clone(data.offset or default_offset)

		offset[1] = -(size[1] / 2) + offset[1] * scale
		offset[2] = -(size[2] / 2) + offset[2] * scale
		offset[3] = data.layer or 0
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = name,
			style_id = name,
			retained_mode = retained_mode,
		}
		content[name] = texture_name
		style[name] = {
			color = data.color or default_color,
			offset = offset,
			size = size,
		}
	end

	local portrait_size = {
		86,
		108,
	}

	portrait_size[1] = portrait_size[1] * scale
	portrait_size[2] = portrait_size[2] * scale

	local offset = table.clone(default_offset)

	offset[1] = -(portrait_size[1] / 2) + offset[1] * scale
	offset[2] = -(portrait_size[2] / 2) + 25 * scale
	offset[3] = 20

	local portrait_name = "portrait"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = portrait_name,
		style_id = portrait_name,
		retained_mode = retained_mode,
	}
	content[portrait_name] = portrait_texture
	style[portrait_name] = {
		color = default_color,
		offset = offset,
		size = portrait_size,
	}

	local button_hotspot = "button_hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = button_hotspot,
		style_id = button_hotspot,
		retained_mode = retained_mode,
	}
	content[button_hotspot] = {}
	style[button_hotspot] = {
		size = portrait_size,
		offset = offset,
	}

	local hover_texture = "hover_texture"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = hover_texture,
		style_id = hover_texture,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.button_hotspot.is_hover
		end,
	}
	content[hover_texture] = "ability_inner_effect_1"
	style[hover_texture] = {
		color = default_color,
		offset = {
			offset[1],
			offset[2],
			-2,
		},
		size = portrait_size,
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

UIWidgets.create_score_entry = function (scenegraph_id, size, num_rows, side)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		num_rows = num_rows,
	}
	local style = {}
	local frame_settings = UIFrameSettings.menu_frame_09
	local row_bg_texture = "scoreboard_topic_bg"
	local row_bg_texture_highlight = "scoreboard_topic_bg_highlight"
	local row_bg_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(row_bg_texture)
	local row_size = {
		size[1],
		row_bg_settings.size[2],
	}
	local offset = {
		0,
		0,
		0,
	}
	local hotspot_name = "hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name,
	}
	style[hotspot_name] = {
		size = size,
		offset = offset,
	}
	content[hotspot_name] = {
		allow_multi_hover = true,
	}

	local hotspot_content = content[hotspot_name]
	local background_name = "background"

	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = background_name,
	}
	style[background_name] = {
		size = size,
		color = {
			200,
			0,
			0,
			0,
		},
		offset = {
			offset[1],
			offset[2],
			0,
		},
	}

	local background_glow_left_name = "background_left_glow"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_glow_left_name,
		style_id = background_glow_left_name,
	}
	style[background_glow_left_name] = {
		size = {
			size[1] / 2,
			size[2],
		},
		color = Colors.get_color_table_with_alpha("blue", 255),
		offset = {
			offset[1],
			offset[2],
			1,
		},
	}
	content[background_glow_left_name] = {
		texture_id = "talent_bg_glow_01",
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

	local background_glow_right_name = "background_right_glow"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_glow_right_name,
		style_id = background_glow_right_name,
	}
	style[background_glow_right_name] = {
		size = {
			size[1] / 2,
			size[2],
		},
		color = Colors.get_color_table_with_alpha("blue", 255),
		offset = {
			offset[1] + size[1] / 2,
			offset[2],
			1,
		},
	}
	content[background_glow_right_name] = {
		texture_id = "talent_bg_glow_01",
		uvs = {
			{
				1,
				1,
			},
			{
				0,
				0,
			},
		},
	}

	local glass_bottom_name = "glass_bottom"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_bottom_name,
		style_id = glass_bottom_name,
	}
	style[glass_bottom_name] = {
		size = {
			size[1],
			3,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + frame_settings.texture_sizes.vertical[1],
			2,
		},
	}
	hotspot_content[glass_bottom_name] = "tabs_glass_bottom"

	local glass_top_name = "glass_top"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_top_name,
		style_id = glass_top_name,
	}
	style[glass_top_name] = {
		size = {
			size[1],
			3,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + size[2] - (frame_settings.texture_sizes.vertical[1] + 3),
			2,
		},
	}
	hotspot_content[glass_top_name] = "tabs_glass_top"

	local frame_name = "frame"

	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = frame_name,
		style_id = frame_name,
	}
	style[frame_name] = {
		size = size,
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		color = default_color,
		offset = {
			offset[1],
			offset[2],
			10,
		},
	}
	hotspot_content[frame_name] = frame_settings.texture

	local edge_fade_name = "edge_fade"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = edge_fade_name,
		style_id = edge_fade_name,
		content_check_function = function (content)
			return not content.is_selected
		end,
	}
	style[edge_fade_name] = {
		size = {
			size[1],
			15,
		},
		color = {
			200,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + frame_settings.texture_sizes.vertical[1],
			5,
		},
	}
	hotspot_content[edge_fade_name] = "edge_fade_small"

	for k = 1, num_rows do
		local line_suffix = "_" .. k
		local line_height_offset = -(k * row_size[2])
		local row_offset = {
			offset[1],
			offset[2] + size[2] - 80 + line_height_offset,
			offset[3] + 5,
		}
		local row_name = "row_bg" .. line_suffix

		passes[#passes + 1] = {
			pass_type = "tiled_texture",
			texture_id = "texture_id",
			content_id = row_name,
			style_id = row_name,
			content_check_function = function (content)
				local hover_index = content.parent.hover_index

				if hover_index and hover_index == k then
					return false
				end

				return content.has_background
			end,
		}
		content[row_name] = {
			has_background = false,
			texture_id = row_bg_texture,
		}
		style[row_name] = {
			size = row_size,
			color = {
				150,
				255,
				255,
				255,
			},
			offset = row_offset,
			texture_tiling_size = row_bg_settings.size,
		}

		if k ~= 1 then
			local highlight_row_name = "highlight_row_bg" .. line_suffix

			passes[#passes + 1] = {
				pass_type = "tiled_texture",
				texture_id = "texture_id",
				content_id = highlight_row_name,
				style_id = highlight_row_name,
				content_check_function = function (content)
					local hover_index = content.parent.hover_index

					return hover_index and hover_index == k
				end,
			}
			style[highlight_row_name] = {
				size = row_size,
				color = Colors.get_color_table_with_alpha("white", 20),
				offset = {
					row_offset[1],
					row_offset[2],
					row_offset[3] + 1,
				},
				texture_tiling_size = row_bg_settings.size,
			}
			content[highlight_row_name] = {
				has_background = false,
				texture_id = row_bg_texture_highlight,
			}
		end

		local score_text_name = "score_text" .. line_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			content_id = row_name,
			text_id = score_text_name,
			style_id = score_text_name,
		}
		style[score_text_name] = {
			font_size = 22,
			font_type = "arial",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = k == 1 and select_color or Colors.get_color_table_with_alpha("font_default", 255),
			size = row_size,
			offset = {
				row_offset[1],
				row_offset[2],
				row_offset[3] + 20,
			},
		}
		content[row_name][score_text_name] = ""

		local score_text_shadow_name = "score_text_shadow" .. line_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			content_id = row_name,
			text_id = score_text_name,
			style_id = score_text_shadow_name,
		}
		style[score_text_shadow_name] = {
			font_size = 22,
			font_type = "arial",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = row_size,
			offset = {
				row_offset[1] + 2,
				row_offset[2] - 2,
				row_offset[3] + 19,
			},
		}

		if k ~= 1 then
			local score_text_highlight_name = "score_text_highlight" .. line_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				content_id = row_name,
				text_id = score_text_name,
				style_id = score_text_highlight_name,
				content_check_function = function (content)
					local hover_index = content.parent.hover_index

					return hover_index and hover_index == k
				end,
			}
			style[score_text_highlight_name] = {
				font_size = 22,
				font_type = "arial",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = row_size,
				offset = {
					row_offset[1],
					row_offset[2],
					row_offset[3] + 30,
				},
			}
		end

		local marker_name = "marker" .. line_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = marker_name,
			style_id = marker_name,
			content_check_function = function (content)
				return content[row_name].has_highscore
			end,
		}
		style[marker_name] = {
			size = {
				71,
				39,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				row_offset[1] + row_size[1] / 2 - 35.5,
				row_offset[2] + row_size[2] / 2 - 19.5,
				row_offset[3] + 4,
			},
		}
		content[marker_name] = "scoreboard_marker"
	end

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

UIWidgets.create_score_topics = function (scenegraph_id, size, hover_hotspot_length, num_rows)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		num_rows = num_rows,
	}
	local style = {}
	local frame_settings = UIFrameSettings.menu_frame_09
	local row_bg_texture = "scoreboard_topic_bg"
	local row_bg_texture_highlight = "scoreboard_topic_bg_highlight"
	local row_bg_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(row_bg_texture)
	local row_size = {
		size[1],
		row_bg_settings.size[2],
	}
	local row_start = 80
	local offset = {
		0,
		0,
		0,
	}
	local box_size = {
		size[1],
		size[2] - row_start,
	}
	local hotspot_name = "hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name,
	}
	style[hotspot_name] = {
		size = size,
		offset = offset,
	}
	content[hotspot_name] = {
		allow_multi_hover = true,
	}

	local hotspot_content = content[hotspot_name]
	local background_name = "background"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name,
	}

	local bg_color_multiplier = 0.8

	style[background_name] = {
		size = box_size,
		color = {
			200,
			0,
			0,
			0,
		},
		offset = {
			offset[1],
			offset[2],
			0,
		},
	}
	content[background_name] = {
		uvs = {
			{
				0,
				0,
			},
			{
				math.min(box_size[1] / background_texture_settings.size[1], 1),
				math.min(box_size[2] / background_texture_settings.size[2], 1),
			},
		},
		texture_id = background_texture,
	}

	local glass_bottom_name = "glass_bottom"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_bottom_name,
		style_id = glass_bottom_name,
	}
	style[glass_bottom_name] = {
		size = {
			box_size[1],
			3,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + frame_settings.texture_sizes.vertical[1],
			1,
		},
	}
	hotspot_content[glass_bottom_name] = "tabs_glass_bottom"

	local glass_top_name = "glass_top"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_top_name,
		style_id = glass_top_name,
	}
	style[glass_top_name] = {
		size = {
			box_size[1],
			3,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + box_size[2] - (frame_settings.texture_sizes.vertical[1] + 3),
			1,
		},
	}
	hotspot_content[glass_top_name] = "tabs_glass_top"

	local frame_name = "frame"

	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = frame_name,
		style_id = frame_name,
	}
	style[frame_name] = {
		size = box_size,
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		color = default_color,
		offset = {
			offset[1],
			offset[2],
			10,
		},
	}
	hotspot_content[frame_name] = frame_settings.texture

	local edge_fade_name = "edge_fade"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = edge_fade_name,
		style_id = edge_fade_name,
		content_check_function = function (content)
			return not content.is_selected
		end,
	}
	style[edge_fade_name] = {
		size = {
			box_size[1],
			15,
		},
		color = {
			200,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + frame_settings.texture_sizes.vertical[1],
			5,
		},
	}
	hotspot_content[edge_fade_name] = "edge_fade_small"

	for k = 1, num_rows do
		local line_suffix = "_" .. k
		local row_name = "row_bg" .. line_suffix
		local line_height_offset = -(k * row_size[2])
		local row_offset = {
			offset[1],
			offset[2] + size[2] - row_start + line_height_offset,
			offset[3] + 5,
		}

		passes[#passes + 1] = {
			pass_type = "tiled_texture",
			texture_id = "texture_id",
			content_id = row_name,
			style_id = row_name,
			content_check_function = function (content)
				local hover_index = content.parent.hover_index

				if hover_index and hover_index == k then
					return false
				end

				return content.has_background
			end,
		}
		content[row_name] = {
			has_background = false,
			texture_id = row_bg_texture,
		}

		if k ~= 1 then
			local row_hotspot_name = "hotspot" .. line_suffix

			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = row_hotspot_name,
				style_id = row_hotspot_name,
			}
			content[row_hotspot_name] = {
				allow_multi_hover = true,
			}
			style[row_hotspot_name] = {
				size = {
					hover_hotspot_length,
					row_size[2],
				},
				color = {
					150,
					255,
					255,
					255,
				},
				offset = {
					row_offset[1] - hover_hotspot_length / 2 + row_size[1] / 2,
					row_offset[2],
					row_offset[3],
				},
			}

			local highlight_row_name = "highlight_row_bg" .. line_suffix

			passes[#passes + 1] = {
				pass_type = "tiled_texture",
				texture_id = "texture_id",
				content_id = highlight_row_name,
				style_id = highlight_row_name,
				content_check_function = function (content)
					local hover_index = content.parent.hover_index

					return hover_index and hover_index == k
				end,
			}
			style[highlight_row_name] = {
				size = row_size,
				color = Colors.get_color_table_with_alpha("white", 20),
				offset = {
					row_offset[1],
					row_offset[2],
					row_offset[3] + 1,
				},
				texture_tiling_size = row_bg_settings.size,
			}
			content[highlight_row_name] = {
				has_background = false,
				texture_id = row_bg_texture_highlight,
			}
		end

		style[row_name] = {
			size = row_size,
			color = {
				150,
				255,
				255,
				255,
			},
			offset = row_offset,
			texture_tiling_size = row_bg_settings.size,
		}

		local score_text_name = "score_text" .. line_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			content_id = row_name,
			text_id = score_text_name,
			style_id = score_text_name,
		}
		style[score_text_name] = {
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = row_size,
			offset = {
				row_offset[1],
				row_offset[2],
				row_offset[3] + 3,
			},
		}
		content[row_name][score_text_name] = ""

		local score_text_shadow_name = "score_text_shadow" .. line_suffix

		passes[#passes + 1] = {
			pass_type = "text",
			content_id = row_name,
			text_id = score_text_name,
			style_id = score_text_shadow_name,
		}
		style[score_text_shadow_name] = {
			dynamic_font_size = true,
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = row_size,
			offset = {
				row_offset[1] + 2,
				row_offset[2] - 2,
				row_offset[3] + 2,
			},
		}

		if k ~= 1 then
			local score_text_highlight_name = "score_text_highlight" .. line_suffix

			passes[#passes + 1] = {
				pass_type = "text",
				content_id = row_name,
				text_id = score_text_name,
				style_id = score_text_highlight_name,
				content_check_function = function (content)
					local hover_index = content.parent.hover_index

					return hover_index and hover_index == k
				end,
			}
			style[score_text_highlight_name] = {
				dynamic_font_size = true,
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = row_size,
				offset = {
					row_offset[1],
					row_offset[2],
					row_offset[3] + 4,
				},
			}
		end

		local marker_name = "marker" .. line_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = marker_name,
			style_id = marker_name,
			content_check_function = function (content)
				return content[row_name].has_highscore
			end,
		}
		style[marker_name] = {
			size = {
				71,
				39,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				row_offset[1] + row_size[1] / 2 - 35.5,
				row_offset[2] + row_size[2] / 2 - 19.5,
				row_offset[3] + 2,
			},
		}
		content[marker_name] = "scoreboard_marker"
	end

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

UIWidgets.create_page_dot_selector = function (scenegraph_id, amount)
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		amount = amount,
	}
	local style = {}
	local slot_size = {
		20,
		20,
	}
	local slot_width_spacing = 40
	local offset_layer = 0
	local total_length = 0
	local length_with_spacing = slot_size[1] * amount + slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local start_width_offset = -length_with_spacing / 2

	for k = 1, amount do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1

		total_length = total_length + slot_size[1] + slot_width_spacing

		local offset = {
			start_width_offset,
			0,
			offset_layer,
		}
		local hotspot_name = "hotspot" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name,
		}
		style[hotspot_name] = {
			size = slot_size,
			offset = offset,
		}
		content[hotspot_name] = {}

		local hotspot_content = content[hotspot_name]
		local selection_texture_name = "selection_texture" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = selection_texture_name,
			style_id = selection_texture_name,
			content_check_function = function (content)
				return content[hotspot_name].is_selected or content[hotspot_name].is_hover
			end,
		}
		style[selection_texture_name] = {
			size = slot_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				1,
			},
		}
		content[selection_texture_name] = "page_indicator_selection"

		local background_texture_name = "background_texture" .. name_suffix

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = background_texture_name,
			style_id = background_texture_name,
		}
		style[background_texture_name] = {
			size = slot_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset[1],
				offset[2],
				0,
			},
		}
		content[background_texture_name] = "page_indicator"
		start_width_offset = start_width_offset + slot_size[1] + slot_width_spacing
	end

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

UIWidgets.create_text_input_rect = function (scenegraph_id, size, text_offset, max_length)
	local passes = {
		{
			pass_type = "rect",
			style_id = "background",
		},
		{
			pass_type = "border",
			style_id = "background_border",
		},
		{
			pass_type = "hotspot",
			style_id = "background",
		},
		{
			input_text_id = "input",
			pass_type = "keystrokes",
		},
		{
			pass_type = "text",
			style_id = "text",
			text_id = "input",
		},
	}
	local content = {
		caret_index = 1,
		input = "",
		input_mode = "insert",
		text_index = 1,
		max_length = max_length,
	}
	local style = {
		background = {
			color = {
				255,
				0,
				0,
				0,
			},
			size = table.clone(size),
		},
		background_border = {
			thickness = 2,
			color = {
				255,
				255,
				255,
				255,
			},
			size = table.clone(size),
		},
		text = {
			font_size = 36,
			font_type = "hell_shark",
			horizontal_scroll = true,
			size = table.clone(size),
			text_color = Colors.get_color_table_with_alpha("white", 255),
			caret_size = {
				4,
				30,
			},
			caret_offset = {
				-5,
				-5,
				0,
			},
			caret_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				text_offset[1],
				text_offset[2],
				text_offset[3] + 1,
			},
		},
	}
	local widget = {
		element = {
			passes = passes,
		},
		content = content,
		style = style,
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}

	return widget
end

UIWidgets.create_craft_material_widget = function (scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "rotated_texture",
					style_id = "effect",
					texture_id = "effect",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return not content.warning
					end,
				},
				{
					pass_type = "text",
					style_id = "text_warning",
					text_id = "text",
					content_check_function = function (content)
						return content.warning
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
				{
					pass_type = "rect",
					style_id = "text_bg",
					content_check_function = function (content)
						return content.draw_background
					end,
				},
				{
					pass_type = "rect",
					style_id = "text_bg_2",
					content_check_function = function (content)
						return content.draw_background
					end,
				},
				{
					item_id = "item",
					pass_type = "item_tooltip",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and content.item
					end,
				},
			},
		},
		content = {
			draw_background = true,
			effect = "sparkle_effect",
			icon = "icon_crafting_dust_01_small",
			text = "0",
			warning = false,
			button_hotspot = {},
		},
		style = {
			text_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					60,
					80,
				},
				color = {
					0,
					10,
					10,
					10,
				},
				offset = {
					2,
					10,
					1,
				},
			},
			text_bg_2 = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				texture_size = {
					60,
					25,
				},
				color = {
					180,
					5,
					5,
					5,
				},
				offset = {
					0,
					12,
					0,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					50,
					50,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-10,
					3,
				},
			},
			effect = {
				angle = 0,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				offset = {
					110,
					120,
					4,
				},
				pivot = {
					128,
					128,
				},
				texture_size = {
					256,
					256,
				},
				color = Colors.get_color_table_with_alpha("white", 0),
			},
			text = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					10,
					3,
				},
			},
			text_warning = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					10,
					3,
				},
			},
			text_shadow = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					8,
					2,
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
end

UIWidgets.create_console_craft_button = function (scenegraph_id, icon)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_hover",
					texture_id = "icon",
					content_check_function = function (content)
						return content.button_hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_glow",
					texture_id = "icon_glow",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_glow",
					texture_id = "background_glow",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button
					end,
					content_change_function = function (content, style)
						local progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5

						style.color[1] = 55 + progress * 200
					end,
				},
			},
		},
		content = {
			background = "console_crafting_disc_small",
			background_glow = "console_crafting_disc_small_outer_glow",
			icon_glow = "console_crafting_disc_small_inner_glow",
			button_hotspot = {
				hover_type = "circle",
			},
			icon = icon,
		},
		style = {
			button_hotspot = {
				size = {
					128,
					128,
				},
				offset = {
					-64,
					-64,
					0,
				},
			},
			icon = {
				horizontal_alignment = "center",
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
					0,
					0,
					3,
				},
			},
			icon_hover = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					128,
					128,
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					3,
				},
			},
			icon_glow = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					126,
					126,
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
					2,
				},
			},
			background = {
				horizontal_alignment = "center",
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
					0,
					0,
					1,
				},
			},
			background_glow = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					213,
					213,
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
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
	}
end

UIWidgets.create_start_game_console_setting_button = function (scenegraph_id, title_text, input_text, icon_texture, icon_frame_texture, button_size, render_icon_above_glow)
	icon_texture = icon_texture or "level_icon_01"

	local icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon_texture)
	local icon_texture_size = icon_texture_settings and icon_texture_settings.size or {
		150,
		150,
	}
	local passes = {}
	local content = {}
	local style = {}
	local hotspot_name = "button_hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
	}
	content[hotspot_name] = {}

	local background_name = "selection_background"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name,
	}
	content[background_name] = {
		texture_id = "item_slot_side_fade",
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
	}

	local bg_offset = {
		168,
		0,
		-2,
	}

	style[background_name] = {
		horizontal_alignment = "left",
		vertical_alignment = "center",
		texture_size = {
			414,
			118,
		},
		color = UISettings.console_start_game_menu_rect_color,
		offset = bg_offset,
	}

	local bg_effect_name = "bg_effect"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = bg_effect_name,
		style_id = bg_effect_name,
	}
	style[bg_effect_name] = {
		horizontal_alignment = "left",
		vertical_alignment = "center",
		texture_size = {
			414,
			126,
		},
		color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			bg_offset[1],
			bg_offset[2],
			bg_offset[3] + 1,
		},
	}
	content[bg_effect_name] = "item_slot_side_effect"

	local text_title_name = "text_title"
	local text_title_shadow_name = text_title_name .. "_shadow"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_title_name,
		style_id = text_title_name,
		content_change_function = function (content, style)
			if content.is_selected then
				style.text_color = style.selected_color
			else
				style.text_color = style.default_color
			end
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_title_name,
		style_id = text_title_shadow_name,
	}
	content[text_title_name] = title_text

	local title_text_offset = {
		225,
		16,
		5,
	}
	local title_text_style = {
		font_size = 32,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = false,
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		selected_color = Colors.get_color_table_with_alpha("white", 255),
		default_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			title_text_offset[1],
			title_text_offset[2],
			title_text_offset[3],
		},
	}
	local title_text_shadow_style = table.clone(title_text_style)

	title_text_shadow_style.text_color = {
		255,
		0,
		0,
		0,
	}
	title_text_shadow_style.offset = {
		title_text_offset[1] + 2,
		title_text_offset[2] - 2,
		title_text_offset[3] - 1,
	}
	style[text_title_name] = title_text_style
	style[text_title_shadow_name] = title_text_shadow_style

	local input_text_name = "input_text"
	local input_text_shadow_name = input_text_name .. "shadow"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = input_text_name,
		style_id = input_text_name,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = input_text_name,
		style_id = input_text_shadow_name,
	}
	content[input_text_name] = Localize("not_assigned")

	local input_text_style = {
		font_size = 22,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "center",
		word_wrap = false,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			title_text_offset[1],
			-18,
			title_text_offset[3],
		},
	}
	local input_text_offset = input_text_style.offset
	local input_text_shadow_style = table.clone(input_text_style)

	input_text_shadow_style.text_color = {
		255,
		0,
		0,
		0,
	}
	input_text_shadow_style.offset = {
		input_text_offset[1] + 2,
		input_text_offset[2] - 2,
		input_text_offset[3] - 1,
	}
	style[input_text_name] = input_text_style
	style[input_text_shadow_name] = input_text_shadow_style

	local icon_offset = {
		-(button_size[1] / 2) + 108,
		0,
		5,
	}
	local icon_background_offset = {
		icon_offset[1],
		icon_offset[2],
		icon_offset[3] - 1,
	}
	local icon_frame_offset = {
		icon_offset[1],
		icon_offset[2],
		icon_offset[3] + 2,
	}
	local icon_glow_offset = {
		icon_offset[1],
		icon_offset[2],
		icon_offset[3] + 1,
	}

	if render_icon_above_glow then
		icon_background_offset[3] = icon_offset[3] - 2
		icon_glow_offset[3] = icon_offset[3] - 1
	end

	local icon_texture_name = "icon_texture"

	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = icon_texture_name,
		texture_id = icon_texture_name,
		content_check_function = function (content, style)
			return content[icon_texture_name]
		end,
		content_change_function = function (content, style)
			if content.button_hotspot.disable_button then
				style.saturated = true
			else
				style.saturated = false
			end
		end,
	}
	content[icon_texture_name] = icon_texture
	style[icon_texture_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = icon_texture_size,
		color = {
			255,
			255,
			255,
			255,
		},
		offset = icon_offset,
	}

	local icon_background_name = "icon_background"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = icon_background_name,
		style_id = icon_background_name,
	}
	content[icon_background_name] = "level_icon_09"
	style[icon_background_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = icon_texture_size,
		color = UISettings.console_start_game_menu_rect_color,
		offset = icon_background_offset,
	}

	local icon_frame_texture_name = "icon_frame_texture"

	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = icon_frame_texture_name,
		texture_id = icon_frame_texture_name,
		content_check_function = function (content, style)
			return content[icon_texture_name]
		end,
		content_change_function = function (content, style)
			if content.button_hotspot.disable_button then
				style.saturated = true
			else
				style.saturated = false
			end
		end,
	}
	content[icon_frame_texture_name] = icon_frame_texture or "map_frame_00"
	style[icon_frame_texture_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			180,
			180,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = icon_frame_offset,
	}

	local icon_texture_glow_name = "icon_texture_glow"

	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = icon_texture_glow_name,
		texture_id = icon_texture_glow_name,
		content_check_function = function (content)
			return content.is_selected
		end,
	}
	content[icon_texture_glow_name] = "map_frame_glow_02"
	style[icon_texture_glow_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			270,
			270,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = icon_glow_offset,
	}

	local widget = {}

	widget.element = {
		passes = passes,
	}
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

UIWidgets.create_start_game_console_play_button = function (scenegraph_id)
	local passes = {}
	local content = {}
	local style = {}
	local text_name = "text"
	local text_name_shadow = text_name .. "_shadow"

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_name,
		style_id = text_name,
		content_change_function = function (content, style)
			if content.locked then
				style.text_color = style.disabled_color
			else
				style.text_color = style.normal_color
			end
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_name,
		style_id = text_name_shadow,
	}
	content[text_name] = Localize("start_game_window_play")

	local text_offset = {
		0,
		6,
		1,
	}
	local text_style = {
		font_size = 80,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		localize = false,
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = false,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		disabled_color = Colors.get_color_table_with_alpha("dark_gray", 255),
		normal_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			text_offset[1],
			text_offset[2],
			text_offset[3],
		},
	}
	local text_shadow_style = table.clone(text_style)

	text_shadow_style.text_color = {
		255,
		0,
		0,
		0,
	}
	text_shadow_style.offset = {
		text_offset[1] + 2,
		text_offset[2] - 2,
		text_offset[3] - 1,
	}
	style[text_name] = text_style
	style[text_name_shadow] = text_shadow_style

	local divider_name = "divider"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = divider_name,
		style_id = divider_name,
	}
	content[divider_name] = "divider_01_top"
	style[divider_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			264,
			32,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			0,
			-36,
			1,
		},
	}

	local input_texture_name = "input_texture"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = input_texture_name,
		style_id = input_texture_name,
		content_change_function = function (content, style)
			if content.locked then
				style.saturated = true
			else
				style.saturated = false
			end
		end,
	}
	content[input_texture_name] = ""
	style[input_texture_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			64,
			64,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			0,
			-34,
			2,
		},
	}

	local glow_name = "glow"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = glow_name,
		style_id = glow_name,
		content_check_function = function (content)
			return not content.locked
		end,
	}
	content[glow_name] = "play_glow_mask"
	style[glow_name] = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			256,
			126,
		},
		color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			0,
			33,
			-1,
		},
	}

	local widget = {}

	widget.element = {
		passes = passes,
	}
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

UIWidgets.create_arrow_button = function (scenegraph_id, angle)
	return {
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						local is_gamepad_active = content.is_gamepad_active

						return not is_gamepad_active and not content.hotspot.disable_button
					end,
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_disabled_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						local is_gamepad_active = content.is_gamepad_active

						return not is_gamepad_active and content.hotspot.disable_button
					end,
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_hover_id",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						local is_gamepad_active = content.is_gamepad_active

						return not is_gamepad_active
					end,
				},
			},
		},
		content = {
			texture_hover_id = "page_button_arrow_glow",
			texture_id = "page_button_arrow",
			hotspot = {},
		},
		style = {
			hotspot = {
				size = {
					81,
					33,
				},
				offset = {
					-40.5,
					-16.5,
					0,
				},
			},
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					81,
					33,
				},
				pivot = {
					40.5,
					16.5,
				},
				angle = angle or 0,
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
			texture_disabled_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					81,
					33,
				},
				pivot = {
					40.5,
					16.5,
				},
				angle = angle or 0,
				color = {
					255,
					120,
					120,
					120,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			texture_hover_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					43,
					48,
				},
				pivot = {
					50.5,
					24,
				},
				angle = angle or 0,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-29,
					0,
					1,
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

UIWidgets.create_icon_and_name_button = function (scenegraph_id, icon, text)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_disabled_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_hover_id",
					texture_id = "texture_hover_id",
				},
				{
					pass_type = "texture",
					style_id = "texture_icon_id",
					texture_id = "texture_icon_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_icon_hover_id",
					texture_id = "texture_icon_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_icon_disabled_id",
					texture_id = "texture_icon_id",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_text_bg_id",
					texture_id = "texture_text_bg_id",
				},
				{
					pass_type = "texture",
					style_id = "texture_text_bg_effect_id",
					texture_id = "texture_text_bg_effect_id",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "text_hover",
					text_id = "text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "text_disabled",
					text_id = "text",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
			},
		},
		content = {
			texture_hover_id = "button_small_glow",
			texture_id = "button_small",
			texture_text_bg_effect_id = "item_slot_side_effect",
			texture_text_bg_id = "item_slot_side_fade",
			text = text or "n/a",
			texture_icon_id = icon or "icons_placeholder",
			button_hotspot = {},
		},
		style = {
			button_hotspot = {
				size = {
					350,
					114,
				},
				offset = {
					-50,
					-57,
					0,
				},
			},
			texture_icon_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					50,
					50,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					5,
					3,
				},
			},
			texture_icon_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					50,
					50,
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					5,
					3,
				},
			},
			texture_icon_hover_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					50,
					50,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					5,
					4,
				},
			},
			texture_icon_disabled_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					50,
					50,
				},
				color = {
					255,
					70,
					70,
					70,
				},
				offset = {
					0,
					5,
					4,
				},
			},
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					113,
					114,
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
					2,
				},
			},
			texture_disabled_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					113,
					114,
				},
				color = {
					255,
					120,
					120,
					120,
				},
				offset = {
					0,
					0,
					2,
				},
			},
			texture_hover_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					113,
					114,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			texture_text_bg_id = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					300,
					72,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					5,
					0,
				},
			},
			texture_text_bg_effect_id = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					300,
					76,
				},
				color = Colors.get_color_table_with_alpha("font_title", 0),
				offset = {
					0,
					5,
					1,
				},
			},
			text = {
				font_size = 52,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				size = {
					300,
					50,
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					60,
					-28,
					3,
				},
			},
			text_hover = {
				font_size = 52,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				size = {
					300,
					50,
				},
				text_color = Colors.get_color_table_with_alpha("white", 0),
				offset = {
					60,
					-28,
					4,
				},
			},
			text_disabled = {
				font_size = 52,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				size = {
					300,
					50,
				},
				text_color = {
					255,
					70,
					70,
					70,
				},
				offset = {
					60,
					-28,
					3,
				},
			},
			text_shadow = {
				font_size = 52,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				size = {
					300,
					50,
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					62,
					-30,
					2,
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

UIWidgets.create_layout_button = function (scenegraph_id, texture, hover_texture, offset)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local texture_size = texture_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "texture_shadow_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "texture_hover_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "selected_texture",
					texture_id = "selected_texture",
				},
			},
		},
		content = {
			button_hotspot = {},
			texture_id = texture,
			selected_texture = hover_texture,
		},
		style = {
			button_hotspot = {
				size = {
					60,
					60,
				},
				offset = {
					-30,
					-30,
					0,
				},
			},
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					texture_size[1],
					texture_size[2],
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			texture_shadow_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					texture_size[1],
					texture_size[2],
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					2,
					-2,
					0,
				},
			},
			texture_hover_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					texture_size[1],
					texture_size[2],
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			selected_texture = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					texture_size[1],
					texture_size[2],
				},
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					3,
				},
			},
		},
		offset = offset or {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.create_weave_equipment_button = function (scenegraph_id)
	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "texture_background",
					texture_id = "texture_background",
				},
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
				},
				{
					pass_type = "texture",
					style_id = "texture_hover",
					texture_id = "texture_hover",
				},
				{
					pass_type = "texture",
					style_id = "texture_highlight",
					texture_id = "texture_highlight",
					content_check_function = function (content)
						return content.highlighted
					end,
				},
			},
		},
		content = {
			highlighted = false,
			texture_background = "button_round_bg",
			texture_highlight = "tutorial_overlay_round",
			texture_hover = "button_round_highlight",
			texture_icon = "icon_switch",
			button_hotspot = {
				allow_multi_hover = false,
			},
		},
		style = {
			texture_background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					74,
					74,
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
			},
			texture_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					50,
					45,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				hover_color = {
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
			},
			texture_hover = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					96,
					96,
				},
				color = {
					0,
					0,
					0,
					0,
				},
				default_color = {
					0,
					255,
					255,
					255,
				},
				hover_color = {
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
			},
			texture_highlight = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					96,
					96,
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
					1,
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

UIWidgets.create_athanor_upgrade_button = function (scenegraph_id, size, icon, text, font_size, disable_with_gamepad)
	local icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(icon)
	local icon_size = icon_settings.size
	local loading_icon = "athanor_icon_loading"
	local loading_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(loading_icon)
	local loading_icon_size = loading_icon_settings.size

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					additional_option_id = "tooltip",
					pass_type = "additional_option_tooltip",
					style_id = "tooltip",
					content_passes = {
						"weave_progression_slot_titles",
					},
					content_check_function = function (content)
						return content.tooltip and content.button_hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "price_icon",
					texture_id = "price_icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "price_icon_disabled",
					texture_id = "price_icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.icon and not button_hotspot.disable_button and not content.upgrading
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_disabled",
					texture_id = "icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button and content.icon and not content.upgrading
					end,
				},
				{
					pass_type = "texture",
					style_id = "hover_glow",
					texture_id = "hover_glow",
				},
				{
					pass_type = "texture",
					style_id = "texture_highlight",
					texture_id = "texture_highlight",
					content_check_function = function (content)
						return content.highlighted
					end,
				},
				{
					pass_type = "texture",
					style_id = "clicked_rect",
					texture_id = "overlay",
				},
				{
					pass_type = "texture",
					style_id = "disabled_rect",
					texture_id = "overlay",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_disabled",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "rotated_texture",
					style_id = "loading_icon",
					texture_id = "loading_icon",
					content_check_function = function (content)
						return content.upgrading
					end,
					content_change_function = function (content, style, _, dt)
						local progress = style.progress or 0

						progress = (progress + dt) % 1

						local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

						style.angle = angle
						style.progress = progress
					end,
				},
			},
		},
		content = {
			background = "athanor_button_upgrade",
			highlighted = false,
			hover_glow = "athanor_button_upgrade_highlight",
			overlay = "athanor_button_upgrade_overlay",
			price_icon = "icon_crafting_essence_small",
			texture_highlight = "tutorial_overlay_round",
			icon = icon,
			loading_icon = loading_icon,
			button_hotspot = {},
			title_text = text or "n/a",
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			tooltip = {
				grow_downwards = false,
				horizontal_alignment = "center",
				max_width = 325,
				vertical_alignment = "top",
				offset = {
					0,
					-10,
					0,
				},
			},
			button_hotspot = {
				size = {
					size[1] - 80,
					size[2] - 50,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					30,
					25,
					0,
				},
			},
			icon = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					icon_size[1],
					icon_size[2],
				},
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					45,
					2,
					6,
				},
			},
			loading_icon = {
				angle = 0,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				pivot = {
					loading_icon_size[1] / 2,
					loading_icon_size[2] / 2,
				},
				texture_size = {
					loading_icon_size[1],
					loading_icon_size[2],
				},
				color = {
					255,
					80,
					80,
					80,
				},
				offset = {
					42,
					0,
					6,
				},
			},
			icon_disabled = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					icon_size[1],
					icon_size[2],
				},
				color = {
					255,
					80,
					80,
					80,
				},
				offset = {
					45,
					2,
					6,
				},
			},
			price_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					32,
					32,
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
					6,
				},
			},
			price_icon_disabled = {
				horizontal_alignment = "center",
				saturated = true,
				vertical_alignment = "center",
				texture_size = {
					32,
					32,
				},
				color = {
					255,
					120,
					120,
					120,
				},
				offset = {
					0,
					0,
					6,
				},
			},
			background = {
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
			hover_glow = {
				color = {
					0,
					255,
					255,
					255,
				},
				offset = {
					0,
					0,
					3,
				},
			},
			texture_highlight = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					size[2] - 30,
					size[2] - 30,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					18,
					0,
					7,
				},
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					7,
				},
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				default_offset = {
					20,
					0,
					6,
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_disabled = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				default_offset = {
					20,
					0,
					6,
				},
				offset = {
					20,
					0,
					6,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2],
				},
				default_offset = {
					22,
					-2,
					5,
				},
				offset = {
					22,
					-2,
					5,
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
end

UIWidgets.create_weave_panel_button = function (scenegraph_id, size, text, font_size, optional_offset, optional_horizontal_alignment)
	local new_marker_offset = {
		-19,
		-25,
		10,
	}
	local selection_offset = {
		0,
		-8,
		0,
	}
	local shadow_offset = {
		2,
		3,
		3,
	}
	local marker_offset = {
		0,
		0,
		2,
	}

	return {
		element = {
			passes = {
				{
					content_id = "button_hotspot",
					pass_type = "hotspot",
					style_id = "button_hotspot",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text_field",
				},
				{
					pass_type = "text",
					style_id = "text_hover",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and (content.button_hotspot.is_hover or content.button_hotspot.is_selected)
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and not content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end,
				},
				{
					pass_type = "text",
					style_id = "text_disabled",
					text_id = "text_field",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end,
				},
				{
					pass_type = "texture",
					style_id = "new_marker",
					texture_id = "new_marker",
					content_check_function = function (content)
						return content.new
					end,
				},
			},
		},
		content = {
			new_marker = "list_item_tag_new",
			button_hotspot = {},
			text_field = text,
			default_font_size = font_size,
			size = size,
		},
		style = {
			button_hotspot = {
				size = size,
			},
			text = {
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_offset = {
					0,
					10,
					4,
				},
				offset = {
					0,
					5,
					4,
				},
				size = size,
			},
			text_shadow = {
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_offset = shadow_offset,
				offset = shadow_offset,
				size = size,
			},
			text_hover = {
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_offset = {
					0,
					10,
					4,
				},
				offset = {
					0,
					5,
					4,
				},
				size = size,
			},
			text_disabled = {
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				localize = true,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = false,
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("gray", 50),
				default_offset = {
					0,
					10,
					4,
				},
				offset = {
					0,
					5,
					4,
				},
				size = size,
			},
			new_marker = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					math.floor(88.19999999999999),
					math.floor(35.699999999999996),
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					new_marker_offset[1],
					new_marker_offset[2],
					new_marker_offset[3],
				},
				size = size,
			},
		},
		offset = optional_offset or {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.create_game_option_mission_preview = function (scenegraph_id, size)
	local passes = {
		{
			pass_type = "texture",
			style_id = "icon_texture",
			texture_id = "icon_texture",
		},
		{
			pass_type = "texture",
			style_id = "level_frame",
			texture_id = "level_frame",
		},
		{
			pass_type = "texture",
			style_id = "boss_texture",
			texture_id = "boss_texture",
			content_check_function = function (content)
				return content.boss_level
			end,
		},
		{
			pass_type = "texture",
			style_id = "difficulty_texture",
			texture_id = "difficulty_texture",
			content_check_function = function (content)
				return content.difficulty_texture
			end,
		},
		{
			pass_type = "texture",
			style_id = "divider",
			texture_id = "divider",
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
			style_id = "description_text",
			text_id = "description_text",
		},
		{
			pass_type = "text",
			style_id = "description_text_shadow",
			text_id = "description_text",
		},
		{
			pass_type = "text",
			style_id = "requirement_title",
			text_id = "requirement_title",
			content_check_function = function (content)
				return content.requirement_text
			end,
		},
		{
			pass_type = "text",
			style_id = "requirement_title_shadow",
			text_id = "requirement_title",
			content_check_function = function (content)
				return content.requirement_text
			end,
		},
		{
			pass_type = "text",
			style_id = "requirement_text",
			text_id = "requirement_text",
			content_check_function = function (content)
				return content.requirement_text
			end,
		},
		{
			pass_type = "text",
			style_id = "requirement_text_shadow",
			text_id = "requirement_text",
			content_check_function = function (content)
				return content.requirement_text
			end,
		},
	}
	local content = {
		boss_level = false,
		boss_texture = "boss_icon",
		difficulty_texture = "icon_difficulty_1",
		divider = "divider_01_bottom",
		icon_texture = "level_image_any",
		level_frame = "map_frame_00",
		requirement_title = "[localize this] Required completed missions:",
		size = size,
		title_text = Localize("map_screen_quickplay_button"),
		description_text = Localize("map_screen_quickmatch_description"),
	}
	local style = {
		icon_texture = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				168,
				168,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-36,
				4,
			},
		},
		level_frame = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				180,
				180,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-30,
				5,
			},
		},
		boss_texture = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				68,
				68,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-150,
				6,
			},
		},
		difficulty_texture = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				50,
				50,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-16,
				6,
			},
		},
		divider = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				264,
				21,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-270,
				5,
			},
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 52,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			size = {
				size[1] - 20,
				50,
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				10,
				size[2] - 280,
				5,
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			font_size = 52,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "bottom",
			word_wrap = true,
			size = {
				size[1] - 20,
				50,
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				12,
				size[2] - 280 - 2,
				4,
			},
		},
		description_text = {
			dynamic_font_size_word_wrap = true,
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				size[1] - 20,
				size[2] - 310,
			},
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				10,
				0,
				5,
			},
		},
		description_text_shadow = {
			dynamic_font_size_word_wrap = true,
			font_size = 28,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				size[1] - 20,
				size[2] - 310,
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				12,
				-2,
				4,
			},
		},
		requirement_title = {
			dynamic_font_size = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "bottom",
			word_wrap = true,
			size = {
				size[1] - 20,
				40,
			},
			text_color = Colors.get_color_table_with_alpha("red", 255),
			offset = {
				10,
				60,
				5,
			},
		},
		requirement_title_shadow = {
			dynamic_font_size = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "bottom",
			word_wrap = true,
			size = {
				size[1] - 20,
				40,
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				12,
				58,
				4,
			},
		},
		requirement_text = {
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				size[1] - 20,
				40,
			},
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				10,
				20,
				5,
			},
		},
		requirement_text_shadow = {
			dynamic_font_size = true,
			font_size = 22,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				size[1] - 20,
				40,
			},
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				12,
				18,
				4,
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

UIWidgets.create_game_option_window = function (scenegraph_id, size, background_color)
	local frame_settings = UIFrameSettings.frame_outer_glow_01
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local passes = {
		{
			pass_type = "rect",
			style_id = "background",
		},
		{
			pass_type = "tiled_texture",
			style_id = "pattern",
			texture_id = "pattern",
		},
		{
			pass_type = "texture",
			style_id = "pattern_mask",
			texture_id = "pattern_mask",
		},
		{
			pass_type = "tiled_texture",
			style_id = "top_edge",
			texture_id = "edge",
		},
		{
			pass_type = "tiled_texture",
			style_id = "bottom_edge",
			texture_id = "edge",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			content_id = "top_corner_right",
			pass_type = "texture_uv",
			style_id = "top_corner_right",
		},
		{
			content_id = "top_corner_left",
			pass_type = "texture_uv",
			style_id = "top_corner_left",
		},
		{
			content_id = "bottom_corner_right",
			pass_type = "texture_uv",
			style_id = "bottom_corner_right",
		},
		{
			content_id = "bottom_corner_left",
			pass_type = "texture_uv",
			style_id = "bottom_corner_left",
		},
		{
			pass_type = "texture",
			style_id = "detail_top",
			texture_id = "detail",
		},
		{
			pass_type = "texture",
			style_id = "detail_bottom",
			texture_id = "detail",
		},
	}
	local content = {
		background = "headline_bg_40",
		detail = "divider_01_top",
		edge = "edge_divider_01_horizontal",
		pattern = "background_pattern_01_transparent",
		pattern_mask = "background_pattern_fade_write_mask",
		top_corner_right = {
			texture_id = "divider_corner_01",
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
		},
		top_corner_left = {
			texture_id = "divider_corner_01",
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
		bottom_corner_right = {
			texture_id = "divider_corner_01",
			uvs = {
				{
					1,
					1,
				},
				{
					0,
					0,
				},
			},
		},
		bottom_corner_left = {
			texture_id = "divider_corner_01",
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
		},
		frame = frame_settings.texture,
		size = size,
	}
	local style = {
		background = {
			color = background_color or {
				0,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		frame = {
			frame_margins = {
				-edge_height,
				-edge_height,
			},
			color = {
				150,
				0,
				0,
				0,
			},
			default_color = {
				150,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				0,
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
		},
		pattern = {
			texture_tiling_size = {
				256,
				256,
			},
			color = {
				255,
				10,
				10,
				10,
			},
			default_color = {
				255,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				3,
			},
		},
		pattern_mask = {
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
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
		top_edge = {
			horizontal_alignment = "left",
			use_parent_height = false,
			use_parent_width = true,
			vertical_alignment = "top",
			texture_size = {
				64,
				4,
			},
			texture_tiling_size = {
				64,
				4,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
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
		bottom_edge = {
			horizontal_alignment = "left",
			use_parent_height = false,
			use_parent_width = true,
			vertical_alignment = "bottom",
			texture_size = {
				64,
				4,
			},
			texture_tiling_size = {
				64,
				4,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
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
		top_corner_right = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				28,
				28,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				9,
			},
		},
		top_corner_left = {
			horizontal_alignment = "right",
			vertical_alignment = "top",
			texture_size = {
				28,
				28,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				9,
			},
		},
		bottom_corner_right = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				28,
				28,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				9,
			},
		},
		bottom_corner_left = {
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			texture_size = {
				28,
				28,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				9,
			},
		},
		detail_top = {
			horizontal_alignment = "center",
			vertical_alignment = "top",
			texture_size = {
				264,
				32,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				11,
				12,
			},
		},
		detail_bottom = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			texture_size = {
				264,
				32,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-17,
				12,
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

UIWidgets.create_item_option_overview = function (scenegraph_id, size)
	local text_spacing = 10
	local title_size = {
		size[1] - 20,
		40,
	}
	local icon_size = {
		80,
		80,
	}
	local fade_height = 20
	local frame_name = "frame_outer_glow_01"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_spacing = frame_settings.texture_sizes.horizontal[2]
	local inner_frame_name = "frame_inner_glow_01"
	local inner_frame_settings = UIFrameSettings[inner_frame_name]
	local inner_frame_spacing = inner_frame_settings.texture_sizes.horizontal[2]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "bottom_edge_bright",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "bottom_edge_dark",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "title_background",
			texture_id = "title_background",
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
			pass_type = "texture",
			style_id = "icon_texture",
			texture_id = "icon_texture",
		},
		{
			pass_type = "texture",
			style_id = "illusion_texture",
			texture_id = "illusion_texture",
			content_check_function = function (content)
				local item = content.item

				if not item then
					return false
				end

				local item_key = item.key
				local default_skin = WeaponSkins.default_skins[item_key]
				local current_skin = item.skin

				return current_skin and current_skin ~= default_skin
			end,
		},
		{
			pass_type = "texture",
			style_id = "icon_bg",
			texture_id = "icon_bg",
		},
		{
			pass_type = "text",
			style_id = "input_text",
			text_id = "input_text",
		},
		{
			pass_type = "text",
			style_id = "input_text_shadow",
			text_id = "input_text",
		},
		{
			pass_type = "text",
			style_id = "sub_title",
			text_id = "sub_title",
		},
		{
			pass_type = "text",
			style_id = "sub_title_shadow",
			text_id = "sub_title",
		},
	}
	local content = {
		background = "gradient_straight",
		icon_bg = "icons_placeholder",
		icon_texture = "icons_placeholder",
		illusion_texture = "item_applied_illusion_icon",
		input_text = "Title Text",
		locked = false,
		sub_title = "Sub Text",
		title_background = "headline_bg_40",
		title_text = "overview",
		unavailable = false,
		button_hotspot = {},
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		frame = frame_settings.texture,
		size = size,
		text_spacing = text_spacing,
	}
	local style = {
		background = {
			size = {
				size[1],
				size[2] - 2,
			},
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				0,
				2,
				0,
			},
		},
		inner_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			size = size,
			area_size = size,
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
			color = {
				0,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		hover_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			size = size,
			area_size = size,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
		},
		pulse_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			size = size,
			area_size = size,
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				12,
			},
		},
		bottom_edge_dark = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				2,
			},
			color = {
				100,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		bottom_edge_bright = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				2,
			},
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				0,
				-2,
				1,
			},
		},
		title_background = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = title_size,
			color = {
				120,
				255,
				255,
				255,
			},
			offset = {
				0,
				-12,
				1,
			},
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				text_spacing,
				-14,
				3,
			},
			size = {
				title_size[1] - text_spacing * 2,
				size[2],
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				text_spacing + 2,
				-16,
				2,
			},
			size = {
				title_size[1] - text_spacing,
				size[2],
			},
		},
		frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			size = size,
			area_size = icon_size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			frame_margins = {
				-frame_spacing,
				-frame_spacing,
			},
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				10,
				10,
				4,
			},
		},
		icon_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = icon_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				10,
				-60,
				5,
			},
		},
		illusion_texture = {
			size = {
				20,
				20,
			},
			color = Colors.get_color_table_with_alpha("promo", 255),
			offset = {
				10 + icon_size[1] - 28,
				13,
				10,
			},
		},
		icon_bg = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = icon_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				10,
				-60,
				4,
			},
		},
		input_text = {
			dynamic_font_size = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				16 + icon_size[1] + text_spacing,
				-63,
				3,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		input_text_shadow = {
			dynamic_font_size = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				16 + icon_size[1] + text_spacing + 2,
				-65,
				2,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		sub_title = {
			font_size = 26,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				16 + icon_size[1] + text_spacing,
				-103,
				3,
			},
			size = {
				title_size[1] - (text_spacing + icon_size[1]),
				size[2],
			},
		},
		sub_title_shadow = {
			font_size = 26,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				16 + icon_size[1] + text_spacing + 2,
				-105,
				2,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

UIWidgets.create_item_option_properties = function (scenegraph_id, size)
	local text_spacing = 10
	local title_size = {
		size[1] - 20,
		40,
	}
	local fade_height = 20
	local inner_frame_name = "frame_inner_glow_01"
	local inner_frame_settings = UIFrameSettings[inner_frame_name]
	local inner_frame_spacing = inner_frame_settings.texture_sizes.horizontal[2]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "bottom_edge_bright",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "bottom_edge_dark",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "title_background",
			texture_id = "title_background",
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
	}
	local content = {
		background = "gradient_straight",
		title_background = "headline_bg_40",
		button_hotspot = {},
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		size = size,
		title_text = Localize("tooltips_properties"),
		text_spacing = text_spacing,
	}
	local style = {
		background = {
			size = {
				size[1],
				size[2] - 2,
			},
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				0,
				2,
				0,
			},
		},
		inner_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			size = size,
			area_size = size,
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
			color = {
				0,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		hover_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			size = size,
			area_size = size,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
		},
		pulse_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			size = size,
			area_size = size,
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				12,
			},
		},
		bottom_edge_dark = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				2,
			},
			color = {
				100,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		bottom_edge_bright = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				2,
			},
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				0,
				-2,
				1,
			},
		},
		title_background = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = title_size,
			color = {
				120,
				255,
				255,
				255,
			},
			offset = {
				0,
				-7,
				1,
			},
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			disabled_text_color = {
				255,
				120,
				120,
				120,
			},
			offset = {
				text_spacing,
				-9,
				3,
			},
			size = {
				title_size[1] - text_spacing * 2,
				size[2],
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				text_spacing + 2,
				-11,
				2,
			},
			size = {
				title_size[1] - text_spacing,
				size[2],
			},
		},
	}
	local num_options = 2
	local option_size = {
		size[1],
		40,
	}
	local icon_size = {
		13,
		13,
	}
	local icon_background_size = {
		26,
		26,
	}
	local icon_background_highlight_size = {
		46,
		46,
	}
	local spacing = 0
	local start_x_offset = 10
	local start_y_offset = size[2] - (title_size[2] + option_size[2] + 14)

	content.num_options = num_options

	for i = 1, num_options do
		local hotspot_name = "button_hotspot_" .. i
		local icon_name = "icon_" .. i
		local icon_disabled_name = "icon_disabled_" .. i
		local option_text_name = "option_text_" .. i
		local option_text_shadow_name = "option_text_shadow_" .. i
		local option_text_disabled_name = "option_text_disabled_" .. i
		local option_text_disabled_shadow_name = "option_text_disabled_shadow_" .. i

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name,
		}
		content[hotspot_name] = {
			disable_button = true,
		}
		style[hotspot_name] = {
			size = size,
			offset = {
				0,
				0,
				1,
			},
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_name,
			style_id = icon_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return not hotspot.disable_button
			end,
		}
		content[icon_name] = "icon_list_dot"
		style[icon_name] = {
			color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
			size = icon_size,
			offset = {
				start_x_offset + 6,
				start_y_offset + option_size[2] / 2 - icon_size[2] / 2,
				5,
			},
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = icon_name,
			style_id = icon_disabled_name,
			content_check_function = function (content)
				local hotspot = content[hotspot_name]

				return hotspot.disable_button
			end,
		}
		style[icon_disabled_name] = {
			color = {
				255,
				80,
				80,
				80,
			},
			size = icon_size,
			offset = {
				start_x_offset + 6,
				start_y_offset + option_size[2] / 2 - icon_size[2] / 2,
				5,
			},
		}
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = option_text_name,
			style_id = option_text_name,
			content_check_function = function (content)
				return not content[hotspot_name].disable_button
			end,
		}
		content[option_text_name] = "n/a"

		local color_multiplier = 0.8

		style[option_text_name] = {
			dynamic_font_size = true,
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
			default_text_color = {
				255,
				math.floor(100 * color_multiplier),
				math.floor(149 * color_multiplier),
				math.floor(237 * color_multiplier),
			},
			select_text_color = Colors.get_color_table_with_alpha("corn_flower_blue", 255),
			offset = {
				start_x_offset + icon_background_size[1] + text_spacing,
				start_y_offset + 2,
				5,
			},
			size = {
				option_size[1] - (text_spacing * 2 + start_x_offset + icon_background_size[1]),
				option_size[2],
			},
		}
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = option_text_name,
			style_id = option_text_shadow_name,
			content_check_function = function (content)
				return not content[hotspot_name].disable_button
			end,
		}
		style[option_text_shadow_name] = {
			dynamic_font_size = true,
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				start_x_offset + icon_background_size[1] + text_spacing + 2,
				start_y_offset,
				4,
			},
			size = {
				option_size[1] - (text_spacing * 2 + start_x_offset + icon_background_size[1]),
				option_size[2],
			},
		}
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = option_text_disabled_name,
			style_id = option_text_disabled_name,
			content_check_function = function (content)
				return content[hotspot_name].disable_button
			end,
		}
		content[option_text_disabled_name] = "Locked"
		style[option_text_disabled_name] = {
			dynamic_font_size = true,
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = {
				255,
				80,
				80,
				80,
			},
			offset = {
				start_x_offset + icon_background_size[1] + text_spacing,
				start_y_offset + 2,
				5,
			},
			size = {
				option_size[1] - (text_spacing * 2 + start_x_offset + icon_background_size[1]),
				option_size[2],
			},
		}
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = option_text_disabled_name,
			style_id = option_text_disabled_shadow_name,
			content_check_function = function (content)
				return content[hotspot_name].disable_button
			end,
		}
		style[option_text_disabled_shadow_name] = {
			dynamic_font_size = true,
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				start_x_offset + icon_background_size[1] + text_spacing + 2,
				start_y_offset,
				4,
			},
			size = {
				option_size[1] - (text_spacing * 2 + start_x_offset + icon_background_size[1]),
				option_size[2],
			},
		}
		start_y_offset = start_y_offset - (option_size[2] + spacing)
	end

	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

UIWidgets.create_item_option_trait = function (scenegraph_id, size)
	local text_spacing = 10
	local icon_size = {
		40,
		40,
	}
	local title_size = {
		size[1] - 20,
		40,
	}
	local fade_height = 20
	local inner_frame_name = "frame_inner_glow_01"
	local inner_frame_settings = UIFrameSettings[inner_frame_name]
	local inner_frame_spacing = inner_frame_settings.texture_sizes.horizontal[2]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local color_multiplier = 0.8
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "bottom_edge_bright",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "bottom_edge_dark",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "title_background",
			texture_id = "title_background",
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
			pass_type = "texture",
			style_id = "icon_texture",
			texture_id = "icon_texture",
			content_check_function = function (content)
				return content.icon_texture
			end,
		},
		{
			pass_type = "text",
			style_id = "input_text",
			text_id = "input_text",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "input_text_shadow",
			text_id = "input_text",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "input_text_locked",
			text_id = "input_text_locked",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "input_text_locked_shadow",
			text_id = "input_text_locked",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "sub_title",
			text_id = "sub_title",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "sub_title_shadow",
			text_id = "sub_title",
			content_check_function = function (content)
				return not content.locked
			end,
		},
	}
	local content = {
		background = "gradient_straight",
		input_text = "n/a",
		input_text_locked = "Locked",
		locked = true,
		sub_title = "n/a",
		title_background = "headline_bg_40",
		title_text = "trait",
		button_hotspot = {},
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		size = size,
		text_spacing = text_spacing,
	}
	local style = {
		background = {
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				0,
				2,
				0,
			},
		},
		inner_frame = {
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
			color = {
				0,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		hover_frame = {
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
		},
		pulse_frame = {
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				12,
			},
		},
		bottom_edge_dark = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				2,
			},
			color = {
				100,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				0,
			},
		},
		bottom_edge_bright = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			texture_size = {
				size[1],
				2,
			},
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				0,
				-2,
				1,
			},
		},
		title_background = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = title_size,
			color = {
				120,
				255,
				255,
				255,
			},
			offset = {
				0,
				-7,
				1,
			},
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				text_spacing,
				-9,
				3,
			},
			size = {
				title_size[1] - text_spacing * 2,
				size[2],
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				text_spacing + 2,
				-11,
				2,
			},
			size = {
				title_size[1] - text_spacing,
				size[2],
			},
		},
		icon_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = icon_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				10,
				-55,
				5,
			},
		},
		input_text = {
			dynamic_font_size = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			default_text_color = {
				255,
				math.floor(193 * color_multiplier),
				math.floor(91 * color_multiplier),
				math.floor(36 * color_multiplier),
			},
			select_text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				16 + icon_size[1] + text_spacing,
				-58,
				3,
			},
			size = {
				title_size[1] - (text_spacing + icon_size[1]),
				size[2],
			},
		},
		input_text_shadow = {
			dynamic_font_size = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				16 + icon_size[1] + text_spacing + 2,
				-60,
				2,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		input_text_locked = {
			dynamic_font_size = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = {
				255,
				80,
				80,
				80,
			},
			default_text_color = {
				255,
				80,
				80,
				80,
			},
			select_text_color = {
				255,
				120,
				120,
				120,
			},
			offset = {
				16,
				-58,
				3,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		input_text_locked_shadow = {
			dynamic_font_size = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				18,
				-60,
				2,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		sub_title = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				16 + icon_size[1] + text_spacing,
				-98,
				3,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		sub_title_shadow = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				16 + icon_size[1] + text_spacing + 2,
				-100,
				2,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

UIWidgets.create_item_option_upgrade = function (scenegraph_id, size)
	local text_spacing = 10
	local icon_size = {
		13,
		13,
	}
	local title_size = {
		size[1] - 20,
		40,
	}
	local fade_height = 20
	local inner_frame_name = "frame_inner_glow_01"
	local inner_frame_settings = UIFrameSettings[inner_frame_name]
	local inner_frame_spacing = inner_frame_settings.texture_sizes.horizontal[2]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local color_multiplier = 0.8
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			pass_type = "texture_frame",
			style_id = "inner_frame",
			texture_id = "inner_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame",
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "bottom_edge_bright",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "bottom_edge_dark",
			texture_id = "background",
		},
		{
			pass_type = "texture",
			style_id = "title_background",
			texture_id = "title_background",
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
			pass_type = "texture",
			style_id = "icon_texture",
			texture_id = "icon_texture",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "input_text",
			text_id = "input_text",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "input_text_shadow",
			text_id = "input_text",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "input_text_locked",
			text_id = "input_text_locked",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "input_text_locked_shadow",
			text_id = "input_text_locked",
			content_check_function = function (content)
				return content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "sub_title",
			text_id = "sub_title",
			content_check_function = function (content)
				return not content.locked
			end,
		},
		{
			pass_type = "text",
			style_id = "sub_title_shadow",
			text_id = "sub_title",
			content_check_function = function (content)
				return not content.locked
			end,
		},
	}
	local content = {
		background = "gradient_straight",
		icon_texture = "icon_list_dot",
		locked = false,
		sub_title = "n/a",
		title_background = "headline_bg_40",
		button_hotspot = {},
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		inner_frame = inner_frame_settings.texture,
		size = size,
		title_text = Localize("hero_view_crafting_upgrade"),
		text_spacing = text_spacing,
		input_text_locked = string.upper(Localize("menu_weave_forge_upgrade_loadout_button_cap")),
		input_text = Localize("next_upgrade_desc"),
	}
	local style = {
		background = {
			color = {
				50,
				255,
				255,
				255,
			},
			offset = {
				0,
				2,
				0,
			},
		},
		inner_frame = {
			texture_size = inner_frame_settings.texture_size,
			texture_sizes = inner_frame_settings.texture_sizes,
			color = {
				0,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		hover_frame = {
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				6,
			},
		},
		pulse_frame = {
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing,
			},
			color = {
				0,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				12,
			},
		},
		bottom_edge_dark = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				size[1],
				2,
			},
			color = {
				100,
				0,
				0,
				0,
			},
			offset = {
				0,
				2,
				0,
			},
		},
		bottom_edge_bright = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = {
				size[1],
				2,
			},
			color = {
				50,
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
		title_background = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = title_size,
			color = {
				120,
				255,
				255,
				255,
			},
			offset = {
				0,
				-7,
				1,
			},
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				text_spacing,
				-9,
				3,
			},
			size = {
				title_size[1] - text_spacing * 2,
				size[2],
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			font_size = 34,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			upper_case = true,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				text_spacing + 2,
				-11,
				2,
			},
			size = {
				title_size[1] - text_spacing,
				size[2],
			},
		},
		icon_texture = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			texture_size = icon_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				16,
				-70,
				5,
			},
		},
		input_text = {
			dynamic_font_size = true,
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				16 + icon_size[1] + text_spacing,
				-64,
				3,
			},
			size = {
				title_size[1] - (text_spacing + icon_size[1]),
				size[2],
			},
		},
		input_text_shadow = {
			dynamic_font_size = true,
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				16 + icon_size[1] + text_spacing + 2,
				-66,
				2,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		input_text_locked = {
			dynamic_font_size = false,
			font_size = 36,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = {
				255,
				80,
				80,
				80,
			},
			default_text_color = {
				255,
				80,
				80,
				80,
			},
			select_text_color = {
				255,
				120,
				120,
				120,
			},
			offset = {
				icon_size[1],
				-64,
				3,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		input_text_locked_shadow = {
			dynamic_font_size = true,
			font_size = 36,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				icon_size[1] + 2,
				-66,
				2,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		sub_title = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				16 + icon_size[1] + text_spacing,
				-98,
				3,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
		sub_title_shadow = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				16 + icon_size[1] + text_spacing + 2,
				-100,
				2,
			},
			size = {
				title_size[1] - (text_spacing * 2 + icon_size[1]),
				size[2],
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

UIWidgets.create_item_feature = function (scenegraph_id, size, title_text, value_text, value_texture, masked)
	local texture_settings = value_texture and UIAtlasHelper.get_atlas_settings_by_texture_name(value_texture)
	local texture_size = texture_settings and texture_settings.size
	local passes = {
		{
			pass_type = "texture",
			style_id = "value_texture",
			texture_id = "value_texture",
			content_check_function = function (content)
				return content.value_texture
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text",
			text_id = "title_text",
			content_check_function = function (content)
				return content.title_text
			end,
		},
		{
			pass_type = "text",
			style_id = "title_text_shadow",
			text_id = "title_text",
			content_check_function = function (content)
				return content.title_text
			end,
		},
		{
			pass_type = "text",
			style_id = "value_text",
			text_id = "value_text",
			content_check_function = function (content)
				return content.value_text
			end,
		},
		{
			pass_type = "text",
			style_id = "value_text_shadow",
			text_id = "value_text",
			content_check_function = function (content)
				return content.value_text
			end,
		},
	}
	local content = {
		size = size,
		value_texture = value_texture,
		value_text = value_text,
		title_text = title_text,
	}
	local style = {
		value_texture = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = texture_size or {
				64,
				64,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				0,
				-15,
				0,
			},
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 28,
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				size[1] - 10,
				20,
			},
			offset = {
				5,
				size[2] - 40,
				1,
			},
		},
		title_text_shadow = {
			dynamic_font_size = true,
			font_size = 28,
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "bottom",
			word_wrap = true,
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				size[1] - 10,
				20,
			},
			offset = {
				7,
				size[2] - 40 - 2,
				0,
			},
		},
		value_text = {
			dynamic_font_size = true,
			font_size = 72,
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "top",
			word_wrap = true,
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			size = {
				size[1] - 10,
				size[2] - 20,
			},
			offset = {
				5,
				-10,
				1,
			},
		},
		value_text_shadow = {
			dynamic_font_size = true,
			font_size = 72,
			horizontal_alignment = "center",
			localize = false,
			vertical_alignment = "top",
			word_wrap = true,
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				size[1] - 10,
				size[2] - 20,
			},
			offset = {
				7,
				-12,
				0,
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

UIWidgets.create_weapon_diagram_widget = function (scenegraph_id, size, nodes_progress, masked, starting_progress)
	local center_offset = {
		0,
		13,
		0,
	}
	local center_position = {
		size[1] / 2,
		size[2] / 2,
	}
	local passes = {
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "background",
		},
		{
			content_id = "icon_hotspot_1",
			pass_type = "hotspot",
			style_id = "node_icon_1",
		},
		{
			content_id = "icon_hotspot_2",
			pass_type = "hotspot",
			style_id = "node_icon_2",
		},
		{
			content_id = "icon_hotspot_3",
			pass_type = "hotspot",
			style_id = "node_icon_3",
		},
		{
			content_id = "icon_hotspot_4",
			pass_type = "hotspot",
			style_id = "node_icon_4",
		},
		{
			content_id = "icon_hotspot_5",
			pass_type = "hotspot",
			style_id = "node_icon_5",
		},
		{
			pass_type = "text",
			style_id = "node_icon_info_1",
			text_id = "icon_info_1",
			content_check_function = function (content)
				return content.icon_hotspot_1.is_hover or content.show_info
			end,
		},
		{
			pass_type = "text",
			style_id = "node_icon_info_2",
			text_id = "icon_info_2",
			content_check_function = function (content)
				return content.icon_hotspot_2.is_hover or content.show_info
			end,
		},
		{
			pass_type = "text",
			style_id = "node_icon_info_3",
			text_id = "icon_info_3",
			content_check_function = function (content)
				return content.icon_hotspot_3.is_hover or content.show_info
			end,
		},
		{
			pass_type = "text",
			style_id = "node_icon_info_4",
			text_id = "icon_info_4",
			content_check_function = function (content)
				return content.icon_hotspot_4.is_hover or content.show_info
			end,
		},
		{
			pass_type = "text",
			style_id = "node_icon_info_5",
			text_id = "icon_info_5",
			content_check_function = function (content)
				return content.icon_hotspot_5.is_hover or content.show_info
			end,
		},
		{
			pass_type = "texture",
			style_id = "node_icon_1",
			texture_id = "node_icon_1",
		},
		{
			pass_type = "texture",
			style_id = "node_icon_2",
			texture_id = "node_icon_2",
		},
		{
			pass_type = "texture",
			style_id = "node_icon_3",
			texture_id = "node_icon_3",
		},
		{
			pass_type = "texture",
			style_id = "node_icon_4",
			texture_id = "node_icon_4",
		},
		{
			pass_type = "texture",
			style_id = "node_icon_5",
			texture_id = "node_icon_5",
		},
		{
			pass_type = "texture",
			style_id = "tutorial_node_1",
			texture_id = "node_dot_1",
			content_check_function = function (content)
				return content.available_actions[1]
			end,
		},
		{
			pass_type = "text",
			style_id = "tutorial_text_1",
			text_id = "tutorial_text_1",
			content_check_function = function (content)
				return content.available_actions[1]
			end,
		},
		{
			pass_type = "text",
			style_id = "tutorial_text_1_shadow",
			text_id = "tutorial_text_1",
			content_check_function = function (content)
				return content.available_actions[1]
			end,
		},
		{
			pass_type = "texture",
			style_id = "tutorial_node_2",
			texture_id = "node_dot_2",
			content_check_function = function (content)
				return content.available_actions[2]
			end,
		},
		{
			pass_type = "text",
			style_id = "tutorial_text_2",
			text_id = "tutorial_text_2",
			content_check_function = function (content)
				return content.available_actions[2]
			end,
		},
		{
			pass_type = "text",
			style_id = "tutorial_text_2_shadow",
			text_id = "tutorial_text_2",
			content_check_function = function (content)
				return content.available_actions[2]
			end,
		},
	}
	local content = {
		background = "diagram_bg",
		node_dot_1 = "ping_icon_02",
		node_dot_2 = "ping_icon_03",
		node_icon_1 = "icon_damage_vs_armor",
		node_icon_2 = "icon_targets",
		node_icon_3 = "icon_speed",
		node_icon_4 = "icon_stagger",
		node_icon_5 = "icon_damage",
		node_line = "diagram_line",
		show_info = false,
		icon_hotspot_1 = {},
		icon_hotspot_2 = {},
		icon_hotspot_3 = {},
		icon_hotspot_4 = {},
		icon_hotspot_5 = {},
		icon_info_1 = Localize("weapon_keyword_armour_piercing"),
		icon_info_2 = Localize("tooltip_item_cleave"),
		icon_info_3 = Localize("properties_attack_speed_plain"),
		icon_info_4 = Localize("markus_knight_power_level_impact"),
		icon_info_5 = Localize("inventory_screen_compare_damage_tooltip"),
		tutorial_text_1 = Localize("tutorial_tooltip_light_attack"),
		tutorial_text_2 = Localize("tutorial_tooltip_heavy_attack"),
	}
	local style = {
		background = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				268,
				255,
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
		},
		node_icon_1 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				64,
				58,
			},
			area_size = {
				64,
				58,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				center_offset[1] + 110,
				center_offset[2] + 142,
				1,
			},
		},
		node_icon_2 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				67,
				59,
			},
			area_size = {
				67,
				59,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				center_offset[1] + 162,
				center_offset[2] - 44,
				1,
			},
		},
		node_icon_3 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				60,
				61,
			},
			area_size = {
				60,
				61,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				center_offset[1] - 5,
				center_offset[2] - 168,
				1,
			},
		},
		node_icon_4 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				82,
				69,
			},
			area_size = {
				82,
				69,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				center_offset[1] - 172,
				center_offset[2] - 44,
				1,
			},
		},
		node_icon_5 = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			masked = masked,
			texture_size = {
				55,
				50,
			},
			area_size = {
				55,
				50,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				center_offset[1] - 110,
				center_offset[2] + 137,
				1,
			},
		},
		node_icon_info_1 = {
			draw_rect_border = true,
			draw_text_rect = true,
			font_size = 28,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			masked = masked,
			rect_color = {
				255,
				0,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			texture_size = {
				50,
				50,
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				center_offset[1] + 110,
				center_offset[2] + 142 + 40,
				10,
			},
		},
		node_icon_info_2 = {
			draw_rect_border = true,
			draw_text_rect = true,
			font_size = 28,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			masked = masked,
			rect_color = {
				255,
				0,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			texture_size = {
				50,
				50,
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				center_offset[1] + 162,
				center_offset[2] - 44 + 40,
				10,
			},
		},
		node_icon_info_3 = {
			draw_rect_border = true,
			draw_text_rect = true,
			font_size = 28,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			masked = masked,
			rect_color = {
				255,
				0,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			texture_size = {
				50,
				50,
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				center_offset[1] - 5,
				center_offset[2] - 168 + 40,
				10,
			},
		},
		node_icon_info_4 = {
			draw_rect_border = true,
			draw_text_rect = true,
			font_size = 28,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			masked = masked,
			rect_color = {
				255,
				0,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			texture_size = {
				50,
				50,
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				center_offset[1] - 172,
				center_offset[2] - 44 + 40,
				10,
			},
		},
		node_icon_info_5 = {
			draw_rect_border = true,
			draw_text_rect = true,
			font_size = 28,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			word_wrap = true,
			masked = masked,
			rect_color = {
				255,
				0,
				0,
				0,
			},
			font_type = masked and "hell_shark_masked" or "hell_shark",
			texture_size = {
				50,
				50,
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				center_offset[1] - 110,
				center_offset[2] + 137 + 40,
				10,
			},
		},
		tutorial_node_1 = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			masked = masked,
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
				size[1] - (size[1] / 3 + 60),
				35,
				1,
			},
		},
		tutorial_node_2 = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			masked = masked,
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
				size[1] - (size[1] / 3 + 60),
				-5,
				1,
			},
		},
		tutorial_text_1 = {
			dynamic_font_size = true,
			font_size = 28,
			horizontal_alignment = "left",
			localize = false,
			use_shadow = true,
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				size[1] / 3,
				20,
			},
			offset = {
				size[1] - (size[1] / 3 + 10),
				50,
				3,
			},
		},
		tutorial_text_1_shadow = {
			dynamic_font_size = true,
			font_size = 28,
			horizontal_alignment = "left",
			localize = false,
			use_shadow = true,
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				size[1] / 3,
				20,
			},
			offset = {
				size[1] - (size[1] / 3 + 10) + 2,
				48,
				2,
			},
		},
		tutorial_text_2 = {
			dynamic_font_size = true,
			font_size = 28,
			horizontal_alignment = "left",
			localize = false,
			use_shadow = true,
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				size[1] / 3,
				20,
			},
			offset = {
				size[1] - (size[1] / 3 + 10),
				10,
				3,
			},
		},
		tutorial_text_2_shadow = {
			dynamic_font_size = true,
			font_size = 28,
			horizontal_alignment = "left",
			localize = false,
			use_shadow = true,
			vertical_alignment = "center",
			word_wrap = true,
			font_type = masked and "hell_shark_header_masked" or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				size[1] / 3,
				20,
			},
			offset = {
				size[1] - (size[1] / 3 + 10) + 2,
				8,
				2,
			},
		},
	}
	local node_positions = {
		{
			82,
			112,
			1,
		},
		{
			132,
			-44,
			1,
		},
		{
			0,
			-138,
			1,
		},
		{
			-132,
			-44,
			1,
		},
		{
			-82,
			112,
			1,
		},
	}
	local available_actions = {}
	local num_nodes = #node_positions

	for j = 1, 2 do
		local line_color = j == 1 and Colors.get_color_table_with_alpha("font_title", 255) or {
			255,
			255,
			0,
			0,
		}
		local index = num_nodes * (j - 1)
		local layer = j

		for i = 1, num_nodes do
			local node_index = index + i
			local progress = nodes_progress[node_index]
			local node_position = node_positions[i]
			local x = node_position[1] * progress
			local y = node_position[2] * progress

			available_actions[j] = progress > (starting_progress or 0) or available_actions[j] or false

			local dot_style_id = "node_dot_" .. node_index

			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = "node_dot_" .. j,
				style_id = dot_style_id,
				content_check_function = function (content)
					return content.available_actions[j]
				end,
			}
			style[dot_style_id] = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
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
					center_offset[1] + x,
					center_offset[2] + y,
					layer + 3,
				},
				content_check_function = function (content)
					return content.available_actions[j]
				end,
			}

			local line_style_id = "node_line_" .. node_index

			passes[#passes + 1] = {
				pass_type = "rotated_texture",
				texture_id = "node_line",
				style_id = line_style_id,
				content_check_function = function (content)
					return content.available_actions[j]
				end,
			}

			local next_i = i % num_nodes + 1
			local next_node_index = index + next_i
			local next_end_position = node_positions[next_i]
			local next_node_progress = nodes_progress[next_node_index]
			local next_position_x = next_end_position[1] * next_node_progress
			local next_position_y = next_end_position[2] * next_node_progress
			local angle = math.angle(x, y, next_position_x, next_position_y)

			angle = next_position_y < y and math.abs(angle) or -angle

			local distance = math.distance_2d(x, y, next_position_x, next_position_y)

			style[line_style_id] = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				texture_size = {
					distance,
					6,
				},
				angle = angle,
				pivot = {
					0,
					3,
				},
				color = line_color,
				offset = {
					center_offset[1] + center_position[1] + x,
					center_offset[2] + y,
					layer,
				},
			}
		end
	end

	content.nodes_progress = nodes_progress
	content.node_positions = node_positions
	content.available_actions = available_actions

	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
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

UIWidgets.create_level_widget = function (scenegraph_id)
	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture",
					style_id = "glass",
					texture_id = "glass",
				},
				{
					pass_type = "texture",
					style_id = "frame_glow",
					texture_id = "frame_glow",
				},
			},
		},
		content = {
			frame = "map_frame_00",
			frame_glow = "map_frame_glow_02",
			glass = "act_presentation_fg_glass",
			icon = "level_icon_01",
		},
		style = {
			frame_glow = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					270,
					270,
				},
				offset = {
					0,
					0,
					4,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			glass = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					216,
					216,
				},
				offset = {
					0,
					0,
					3,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				offset = {
					0,
					0,
					2,
				},
				texture_size = {
					180,
					180,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					168,
					168,
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
			},
		},
	}
end
