-- chunkname: @scripts/ui/views/versus_menu/ui_widgets_vs.lua

UIWidgets = UIWidgets or {}

UIWidgets.create_new_widget_definition = function (scenegraph_id, offset)
	return {
		element = {
			passes = {},
		},
		content = {},
		style = {},
		offset = offset or {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.add_portrait_frame = function (definition, scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	local passes = definition.element.passes
	local content = {}
	local style = definition.style
	local content_identifier = "portrait_frame"

	definition.content[content_identifier] = content
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
		-60,
		0,
	}

	for index, data in ipairs(frame_settings) do
		local name = "frame_texture_" .. index
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
		offset[2] = offset[2] * scale
		offset[3] = data.layer or 0
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = name,
			style_id = name,
			content_id = content_identifier,
			retained_mode = retained_mode,
		}
		content[name] = texture_name
		style[name] = {
			color = data.color or default_color,
			offset = offset,
			size = size,
			scenegraph_id = scenegraph_id,
		}
	end

	local portrait_size = {
		86,
		108,
	}

	portrait_size[1] = portrait_size[1] * scale
	portrait_size[2] = portrait_size[2] * scale

	if portrait_texture then
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
			content_id = content_identifier,
			retained_mode = retained_mode,
		}
		content[portrait_name] = portrait_texture
		style[portrait_name] = {
			color = default_color,
			offset = portrait_offset,
			size = portrait_size,
			scenegraph_id = scenegraph_id,
		}
	end

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
		content_id = content_identifier,
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
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.add_hotspot = function (definition, content_identifier, style_id)
	local passes = definition.element.passes
	local content = {}
	local style = definition.style

	definition.content[content_identifier] = content
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = content_identifier,
		style_id = style_id,
	}
end

UIWidgets.add_hover_glow = function (definition, glow_texture, glow_texture_id, hotspot_content_id, style_id)
	local passes = definition.element.passes
	local content = definition.content
	local style = definition.style

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = glow_texture_id,
		style_id = style_id,
		content_check_function = function (pass_content)
			return pass_content[hotspot_content_id].is_hover or pass_content.force_hover
		end,
	}
	content[glow_texture_id] = glow_texture
end

UIWidgets.add_simple_text = function (definition, text_id, scenegraph_id, text, size, color, text_style, optional_font_style, retained)
	local passes = definition.element.passes
	local definition_content = definition.content
	local style = definition.style

	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_id,
		style_id = text_id,
		retained_mode = retained,
		content_check_function = function (content)
			return content[text_id]
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = text_id,
		style_id = text_id,
		retained_mode = retained,
		content_check_function = function (content)
			return content[text_id]
		end,
	}
	definition_content[text_id] = text

	local text_offset = text_style and text_style.offset or {
		0,
		0,
		0,
	}
	local text_color = text_style and text_style.text_color or color or {
		255,
		255,
		255,
		255,
	}

	text_style = text_style or {
		horizontal_alignment = "center",
		localize = true,
		vertical_alignment = "center",
		word_wrap = true,
		font_size = size,
		font_type = optional_font_style or "hell_shark",
		text_color = text_color,
		offset = text_offset,
	}
	text_style.scenegraph_id = scenegraph_id

	local text_shadow_style = table.clone(text_style)
	local text_shadow_style_color = text_style.shadow_color or {
		255,
		0,
		0,
		0,
	}

	text_shadow_style_color[1] = text_color[1]
	text_shadow_style.text_color = text_shadow_style_color
	text_shadow_style.offset = {
		text_offset[1] + 2,
		text_offset[2] - 2,
		text_offset[3] - 1,
	}
	style[text_id] = text_style
	style[text_id .. "_shadow"] = text_shadow_style
end

UIWidgets.add_ready_icon = function (definition, content_identifier, scenegraph_id, offset)
	local passes = definition.element.passes
	local content = {}
	local style = definition.style

	definition.content[content_identifier] = content
	content.ready = false
	content.ready_texture = "matchmaking_checkbox"

	local texture_size = {
		37,
		31,
	}
	local not_ready_name = "not_ready"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = "ready_texture",
		content_id = content_identifier,
		style_id = not_ready_name,
		content_check_function = function (content)
			return content.slot_taken and not content.ready
		end,
	}
	style[not_ready_name] = {
		size = table.clone(texture_size),
		offset = offset or {
			0,
			0,
			0,
		},
		color = {
			255,
			255,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}

	local ready_name = "ready"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = "ready_texture",
		content_id = content_identifier,
		style_id = ready_name,
		content_check_function = function (content)
			return content.slot_taken and content.ready
		end,
	}
	style[ready_name] = {
		size = table.clone(texture_size),
		offset = offset or {
			0,
			0,
			0,
		},
		color = {
			255,
			0,
			255,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.add_loadout_grid = function (definition, content_identifier, scenegraph_id, size, rows, spacing, align_horizontal, base_offset)
	local passes = definition.element.passes
	local content = definition.content
	local style = definition.style
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
		60,
		60,
	}
	local slot_size = {
		60,
		60,
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

	content.rows = rows
	content.columns = slots_per_row
	content.slots = rows * slots_per_row

	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = background_width - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = background_height - column_height
	local slot_start_offset = {
		align_horizontal and row_difference_to_background / 2 or row_difference_to_background / 2,
		background_height - column_difference_to_background / 2 - slot_size[2],
	}

	base_offset = base_offset or {
		0,
		0,
		0,
	}

	local offset_layer = 0

	for i = 1, rows do
		for k = 1, slots_per_row do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local slot_content_id = content_identifier .. name_suffix
			local slot_content = {}

			definition.content[slot_content_id] = slot_content

			local offset = {
				base_offset[1] + slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				base_offset[2] + slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				base_offset[3] + offset_layer,
			}
			local hotspot_name = content_identifier .. "_hotspot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = slot_content_id,
				style_id = hotspot_name,
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset,
				scenegraph_id = scenegraph_id,
			}
			slot_content.drag_texture_size = slot_size

			local item_icon_name = "item_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = slot_content_id,
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
				scenegraph_id = scenegraph_id,
			}

			local slot_background_frame_name = "item_frame" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = slot_content_id,
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
				scenegraph_id = scenegraph_id,
			}
			slot_content[slot_background_frame_name] = "item_frame"

			local rarity_texture_name = "rarity_texture" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = slot_content_id,
				texture_id = rarity_texture_name,
				style_id = rarity_texture_name,
				content_check_function = function (content)
					return content[item_icon_name]
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
				scenegraph_id = scenegraph_id,
			}
			slot_content[rarity_texture_name] = "icon_bg_default"

			local slot_name = "slot" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = slot_content_id,
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
				scenegraph_id = scenegraph_id,
			}
			slot_content[slot_name] = "menu_slot_frame_01"

			local slot_icon_name = "slot_icon" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = slot_content_id,
				texture_id = slot_icon_name,
				style_id = slot_icon_name,
				content_check_function = function (content)
					return not content[item_icon_name]
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
				scenegraph_id = scenegraph_id,
			}
			slot_content[slot_icon_name] = "tabs_icon_all_selected"

			local slot_hover_name = "slot_hover" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = slot_content_id,
				texture_id = slot_hover_name,
				style_id = slot_hover_name,
				content_check_function = function (content)
					return content.highlight or content.is_hover
				end,
			}
			style[slot_hover_name] = {
				size = {
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
					offset[1] - (96 - slot_size[1]) / 2,
					offset[2] - (96 - slot_size[2]) / 2,
					0,
				},
				scenegraph_id = scenegraph_id,
			}
			slot_content[slot_hover_name] = "item_icon_hover"

			local slot_selected_name = "slot_selected" .. name_suffix

			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = slot_content_id,
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
				scenegraph_id = scenegraph_id,
			}
			slot_content[slot_selected_name] = "item_icon_selection"
		end
	end
end

UIWidgets.create_player_panel_widget = function (scenegraph_id, size, left_aligned)
	local background_texture = "talent_tree_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_style = "button_frame_02"
	local frame_settings = UIFrameSettings[frame_style]
	local shadow_frame_style = "shadow_frame_02"
	local shadow_frame_settings = UIFrameSettings[shadow_frame_style]
	local hover_frame_style = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_style]
	local empty_hover_frame_style = "frame_outer_glow_01"
	local empty_hover_frame_settings = UIFrameSettings[empty_hover_frame_style]
	local empty_frame_style = "frame_bevel_01"
	local empty_frame_settings = UIFrameSettings[empty_frame_style]
	local item_slot_width_spacing = 5
	local item_slot_height_spacing = 4
	local item_slot_size = {
		size[2] / 2 - item_slot_height_spacing,
		size[2] / 2 - item_slot_height_spacing,
	}
	local item_slot_1_offset = {
		left_aligned and size[1] + item_slot_width_spacing or -(item_slot_size[1] + item_slot_width_spacing),
		size[2] - item_slot_size[2],
		0,
	}
	local item_slot_2_offset = {
		left_aligned and size[1] + item_slot_width_spacing or -(item_slot_size[1] + item_slot_width_spacing),
		0,
		0,
	}
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
		},
		{
			content_id = "background",
			pass_type = "texture_uv",
			style_id = "background",
			content_check_function = function (content)
				return not content.parent.empty
			end,
		},
		{
			pass_type = "texture",
			style_id = "ready_texture",
			texture_id = "ready_texture",
			content_check_function = function (content)
				return content.ready
			end,
		},
		{
			pass_type = "texture",
			style_id = "unready_texture",
			texture_id = "unready_texture",
			content_check_function = function (content)
				return not content.ready and not content.empty
			end,
		},
		{
			pass_type = "rect",
			style_id = "empty_background",
			content_check_function = function (content)
				return content.empty
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return not content.empty and content.is_local_player and button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "empty_hover_frame",
			texture_id = "empty_hover_frame",
			content_check_function = function (content)
				local button_hotspot = content.button_hotspot

				return content.empty and button_hotspot.is_hover
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "empty_frame",
			texture_id = "empty_frame",
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
			content_check_function = function (content)
				return not content.empty
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "shadow_frame",
			texture_id = "shadow_frame",
			content_check_function = function (content)
				return not content.empty
			end,
		},
		{
			pass_type = "text",
			style_id = "open_slot_text",
			text_id = "open_slot_text",
			content_check_function = function (content)
				return content.empty
			end,
		},
		{
			pass_type = "text",
			style_id = "open_slot_text_shadow",
			text_id = "open_slot_text",
			content_check_function = function (content)
				return content.empty
			end,
		},
		{
			pass_type = "text",
			style_id = "player_name",
			text_id = "player_name",
			content_check_function = function (content)
				return not content.empty
			end,
		},
		{
			pass_type = "text",
			style_id = "career_name",
			text_id = "career_name",
			content_check_function = function (content)
				return not content.empty
			end,
		},
		{
			content_id = "item_hotspot_1",
			pass_type = "hotspot",
			style_id = "item_slot_bg_1",
			content_check_function = function (content)
				return content.parent.is_local_player
			end,
		},
		{
			content_id = "item_hotspot_2",
			pass_type = "hotspot",
			style_id = "item_slot_bg_2",
			content_check_function = function (content)
				return content.parent.is_local_player
			end,
		},
		{
			pass_type = "rect",
			style_id = "item_slot_bg_1",
			content_check_function = function (content)
				return content.is_local_player
			end,
		},
		{
			pass_type = "texture",
			style_id = "item_icon_1",
			texture_id = "item_icon_1",
			content_check_function = function (content)
				return content.is_local_player
			end,
		},
		{
			pass_type = "texture",
			style_id = "item_icon_2",
			texture_id = "item_icon_2",
			content_check_function = function (content)
				return content.is_local_player
			end,
		},
		{
			pass_type = "rect",
			style_id = "item_slot_bg_2",
			content_check_function = function (content)
				return content.is_local_player
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "item_slot_hover_1",
			texture_id = "hover_frame",
			content_check_function = function (content)
				local hotspot = content.item_hotspot_1

				return content.is_local_player and hotspot.is_hover
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "item_slot_hover_2",
			texture_id = "hover_frame",
			content_check_function = function (content)
				local hotspot = content.item_hotspot_2

				return content.is_local_player and hotspot.is_hover
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "item_slot_frame_1",
			texture_id = "frame",
			content_check_function = function (content)
				return content.is_local_player
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "item_slot_frame_2",
			texture_id = "frame",
			content_check_function = function (content)
				return content.is_local_player
			end,
		},
	}
	local content = {
		career_name = "career_name",
		empty = true,
		is_local_player = false,
		item_icon_1 = "ping_icon_01",
		item_icon_2 = "ping_icon_01",
		player_name = "player_name",
		ready_texture = "ping_icon_01",
		unready_texture = "ping_icon_03",
		button_hotspot = {},
		item_hotspot_1 = {},
		item_hotspot_2 = {},
		frame = frame_settings.texture,
		shadow_frame = shadow_frame_settings.texture,
		hover_frame = hover_frame_settings.texture,
		empty_hover_frame = empty_hover_frame_settings.texture,
		empty_frame = empty_frame_settings.texture,
		background = {
			uvs = {
				{
					0.5,
					1,
				},
				{
					0.5 - math.min(size[1] / background_texture_settings.size[1], 1),
					1 - math.min(size[2] / background_texture_settings.size[2], 1),
				},
			},
			texture_id = background_texture,
		},
		open_slot_text = Localize("vs_lobby_slot_available"),
	}
	local style = {
		empty_background = {
			color = {
				80,
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
		item_icon_1 = {
			color = {
				255,
				255,
				255,
				255,
			},
			size = item_slot_size,
			offset = {
				item_slot_1_offset[1],
				item_slot_1_offset[2],
				1,
			},
		},
		item_icon_2 = {
			color = {
				255,
				255,
				255,
				255,
			},
			size = item_slot_size,
			offset = {
				item_slot_2_offset[1],
				item_slot_2_offset[2],
				1,
			},
		},
		item_slot_bg_1 = {
			color = {
				80,
				0,
				0,
				0,
			},
			size = item_slot_size,
			offset = item_slot_1_offset,
		},
		item_slot_bg_2 = {
			color = {
				80,
				0,
				0,
				0,
			},
			size = item_slot_size,
			offset = item_slot_2_offset,
		},
		item_slot_hover_1 = {
			size = item_slot_size,
			frame_margins = {
				-14,
				-14,
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				item_slot_1_offset[1],
				item_slot_1_offset[2],
				2,
			},
		},
		item_slot_hover_2 = {
			size = item_slot_size,
			frame_margins = {
				-14,
				-14,
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				item_slot_2_offset[1],
				item_slot_2_offset[2],
				2,
			},
		},
		item_slot_frame_1 = {
			size = item_slot_size,
			texture_size = empty_frame_settings.texture_size,
			texture_sizes = empty_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				item_slot_2_offset[1],
				item_slot_1_offset[2],
				4,
			},
		},
		item_slot_frame_2 = {
			size = item_slot_size,
			texture_size = empty_frame_settings.texture_size,
			texture_sizes = empty_frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				item_slot_2_offset[1],
				item_slot_2_offset[2],
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
				3,
			},
		},
		empty_frame = {
			texture_size = empty_frame_settings.texture_size,
			texture_sizes = empty_frame_settings.texture_sizes,
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
		shadow_frame = {
			frame_margins = {
				-14,
				-14,
			},
			texture_size = shadow_frame_settings.texture_size,
			texture_sizes = shadow_frame_settings.texture_sizes,
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
		},
		hover_frame = {
			frame_margins = {
				-14,
				-14,
			},
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
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
		empty_hover_frame = {
			frame_margins = {
				-14,
				-14,
			},
			texture_size = empty_hover_frame_settings.texture_size,
			texture_sizes = empty_hover_frame_settings.texture_sizes,
			color = {
				255,
				100,
				100,
				100,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		ready_texture = {
			vertical_alignment = "center",
			texture_size = {
				54,
				50,
			},
			horizontal_alignment = left_aligned and "left" or "right",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				left_aligned and -55 or 55,
				0,
				1,
			},
		},
		unready_texture = {
			vertical_alignment = "center",
			texture_size = {
				54,
				50,
			},
			horizontal_alignment = left_aligned and "left" or "right",
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				left_aligned and -55 or 55,
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
		open_slot_text = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "center",
			word_wrap = true,
			size = {
				size[1],
				size[2],
			},
			text_color = {
				255,
				60,
				60,
				60,
			},
			offset = {
				0,
				0,
				2,
			},
		},
		open_slot_text_shadow = {
			font_size = 24,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			upper_case = true,
			vertical_alignment = "center",
			word_wrap = true,
			size = {
				size[1],
				size[2],
			},
			text_color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				2,
				-2,
				1,
			},
		},
		career_name = {
			dynamic_font_size = true,
			font_size = 36,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = true,
			size = {
				size[1] - 138,
				size[2],
			},
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				130,
				15,
				2,
			},
		},
		player_name = {
			dynamic_font_size = true,
			font_size = 20,
			font_type = "arial",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "center",
			word_wrap = true,
			size = {
				size[1] - 138,
				size[2],
			},
			text_color = {
				255,
				160,
				160,
				160,
			},
			offset = {
				130,
				-20,
				2,
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

UIWidgets.create_team_banner_widget = function (scenegraph_id, team_icon, background_texture, background_frame, size_multiplier, offset, color)
	local size_multiplier = size_multiplier or 2
	local icon_size = {
		32 * size_multiplier,
		32 * size_multiplier,
	}
	local bg_size = {
		48 * size_multiplier,
		56 * size_multiplier,
	}
	local color = color or Colors.get_color_table_with_alpha("local_player_team", 255)

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "team_icon",
					texture_id = "team_icon",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_frame",
					texture_id = "background_frame",
				},
			},
		},
		content = {
			team_icon = team_icon or "icons_placeholder",
			background = background_texture or "team_icon_bg",
			background_frame = background_frame or "team_icon_bg_frame",
		},
		style = {
			team_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					10,
				},
				texture_size = icon_size,
			},
			background = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = color or Colors.get_color_table_with_alpha("local_player_team", 255),
				offset = {
					0,
					0,
					1,
				},
				texture_size = bg_size,
			},
			background_frame = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				color = color or Colors.get_color_table_with_alpha("local_player_team", 255),
				offset = {
					0,
					0,
					2,
				},
				texture_size = bg_size,
			},
		},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			0,
		},
	}
end

UIWidgets.create_score_widget = function (scenegraph_id, color)
	local color = color or Colors.get_color_table_with_alpha("local_player_team", 255)
	local score_text = "n/a"

	return {
		element = {
			passes = {
				{
					pass_type = "rounded_background",
					style_id = "score_background",
				},
				{
					pass_type = "rounded_background",
					style_id = "dark_score_background",
					content_check_function = function (content, style)
						return not content.is_hero
					end,
				},
				{
					pass_type = "text",
					style_id = "score_text",
					text_id = "score_text",
				},
			},
		},
		content = {
			is_hero = true,
			score_text = score_text,
		},
		style = {
			score_background = {
				corner_radius = 30,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = color,
				offset = {
					0,
					0,
					1,
				},
			},
			dark_score_background = {
				corner_radius = 30,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = {
					160,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					10,
				},
			},
			score_text = {
				font_size = 80,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-5,
					5,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			1,
		},
	}
end

UIWidgets.create_round_end_banner_widget = function (scenegraph_id, size, offset, color)
	local size = size or {
		500,
		80,
	}
	local color = color or Colors.get_color_table_with_alpha("local_player_team", 255)
	local background_texture = "menu_frame_bg_04"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)

	return {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "rect",
					style_id = "team_icon_background",
				},
				{
					pass_type = "texture",
					style_id = "team_icon",
					texture_id = "team_icon",
				},
				{
					pass_type = "text",
					style_id = "side_text",
					text_id = "side_text",
				},
				{
					pass_type = "text",
					style_id = "team_text",
					text_id = "team_text",
				},
			},
		},
		content = {
			side_text = "Side",
			team_icon = "team_hammers_icon",
			team_text = "TEAM_NAME",
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
			background = {
				offset = offset or {
					0,
					0,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			team_icon_background = {
				horizontal_alignment = "left",
				size = {
					72,
					72,
				},
				color = color,
				offset = {
					4,
					4,
					2,
				},
			},
			team_icon = {
				horizontal_alignment = "left",
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
					8,
					8,
					3,
				},
			},
			side_text = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - 90,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					90,
					-5,
					4,
				},
			},
			team_text = {
				font_size = 38,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				size = {
					size[1] - 90,
					size[2],
				},
				text_color = color,
				offset = {
					90,
					5,
					5,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			10,
		},
	}
end

UIWidgets.create_round_end_score_widget = function (scenegraph_id, size, offset)
	local size = size or {
		500,
		80,
	}
	local progress_bar_size = {
		350,
		20,
	}
	local inner_shadow_frame_settings = UIFrameSettings.frame_inner_glow_03
	local progress_bar_frame_settings = UIFrameSettings.button_frame_02_gold

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "texture_frame",
					style_id = "highlight_glow",
					texture_id = "highlight_glow",
					content_check_function = function (content)
						return content.highlight
					end,
				},
				{
					pass_type = "rect",
					style_id = "progress_bar_bg",
				},
				{
					pass_type = "texture_frame",
					style_id = "progress_bar_frame",
					texture_id = "progress_bar_frame",
				},
				{
					content_id = "score_progress_bar",
					pass_type = "texture_uv",
					style_id = "score_progress_bar",
					content_change_function = function (content, style)
						local score_progress = content.parent.score_progress
						local progress_bar_size = content.parent.progress_bar_max_size
						local progress = math.min(progress_bar_size * score_progress / progress_bar_size, 1)

						content.uvs = {
							{
								0,
								0,
							},
							{
								progress,
								1,
							},
						}
						style.texture_size[1] = progress_bar_size * progress
					end,
					content_check_function = function (content)
						return content.parent.score_progress ~= 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "current_score_icon",
					texture_id = "current_score_icon",
				},
				{
					pass_type = "text",
					style_id = "current_score_text",
					text_id = "current_score_text",
				},
				{
					pass_type = "text",
					style_id = "round_text",
					text_id = "round_text",
				},
				{
					pass_type = "rect",
					style_id = "max_points",
				},
				{
					pass_type = "text",
					style_id = "max_points_text",
					text_id = "max_points_text",
				},
				{
					pass_type = "rect",
					style_id = "top_detail_rect",
				},
			},
		},
		content = {
			current_score = 0,
			current_score_icon = "round_end_score_bar_slider",
			current_score_text = "0",
			highlight = false,
			max_points_text = "0",
			max_score = 0,
			round_text = "Round 1",
			score_progress = 0,
			unclaimed_points = 0,
			highlight_glow = inner_shadow_frame_settings.texture,
			progress_bar_frame = progress_bar_frame_settings.texture,
			progress_bar_max_size = progress_bar_size[1],
			score_progress_bar = {
				texture_id = "score_bar_fill",
				uvs = {
					{
						0,
						0,
					},
					{
						0,
						1,
					},
				},
			},
		},
		style = {
			background = {
				size = size,
				color = {
					255,
					90,
					90,
					90,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			highlight_glow = {
				frame_margins = {
					2,
					2,
				},
				texture_size = inner_shadow_frame_settings.texture_size,
				texture_sizes = inner_shadow_frame_settings.texture_sizes,
				color = Colors.get_color_table_with_alpha("gold", 255),
				offset = {
					0,
					0,
					15,
				},
			},
			progress_bar_bg = {
				size = progress_bar_size,
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					75,
					15,
					3,
				},
			},
			score_progress_bar = {
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					350,
					20,
				},
				offset = {
					75,
					15,
					6,
				},
			},
			progress_bar_frame = {
				size = {
					progress_bar_size[1] + 4,
					progress_bar_size[2] + 4,
				},
				default_size = progress_bar_size,
				texture_size = progress_bar_frame_settings.texture_size,
				texture_sizes = progress_bar_frame_settings.texture_sizes,
				frame_margins = {
					0,
					0,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					73,
					13,
					7,
				},
				default_offset = {
					73,
					13,
					20,
				},
			},
			max_points = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				size = {
					34,
					30,
				},
				color = {
					255,
					58,
					58,
					58,
				},
				offset = {
					size[1] - 75,
					10,
					10,
				},
			},
			current_score_icon = {
				horizontal_alignment = "left",
				size = {
					32,
					24,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					43,
					13,
					10,
				},
			},
			round_text = {
				font_size = 28,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - 90,
					size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					70,
					-5,
					4,
				},
			},
			current_score_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					32,
					24,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					43,
					15,
					11,
				},
			},
			max_points_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "bottom",
				word_wrap = false,
				size = {
					15,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					size[1] - 72,
					8,
					11,
				},
			},
			top_detail_rect = {
				size = {
					size[1],
					4,
				},
				color = {
					255,
					145,
					145,
					145,
				},
				offset = {
					0,
					size[2] - 4,
					12,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			10,
		},
	}
end

UIWidgets.create_round_end_total_score_widget = function (scenegraph_id, size, offset)
	local size = size or {
		1100,
		120,
	}
	local frame_settings = UIFrameSettings.menu_frame_04
	local progress_bar_frame_settings = UIFrameSettings.button_frame_02_gold

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background",
				},
				{
					pass_type = "text",
					style_id = "status_text",
					text_id = "status_text",
				},
				{
					pass_type = "rect",
					style_id = "team_1_progress_bar_bg",
				},
				{
					content_id = "score_progress_bar",
					pass_type = "texture_uv",
					style_id = "score_progress_bar_team_1",
					content_change_function = function (content, style)
						local score_progress = content.parent.team_1_score_progress
						local progress_bar_size = size[1] - 150
						local progress = math.min(progress_bar_size * score_progress / progress_bar_size, 1)

						content.uvs = {
							{
								0,
								0,
							},
							{
								progress,
								1,
							},
						}
						style.texture_size[1] = progress_bar_size * progress
					end,
					content_check_function = function (content)
						return content.parent.team_1_score_progress ~= 0
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "progress_bar_team_1_frame",
					texture_id = "progress_bar_frame",
				},
				{
					pass_type = "rect",
					style_id = "team_2_progress_bar_bg",
				},
				{
					content_id = "score_progress_bar",
					pass_type = "texture_uv",
					style_id = "score_progress_bar_team_2",
					content_change_function = function (content, style)
						local score_progress = content.parent.team_2_score_progress
						local progress_bar_size = size[1] - 150
						local progress = math.min(progress_bar_size * score_progress / progress_bar_size, 1)

						content.uvs = {
							{
								0,
								0,
							},
							{
								progress,
								1,
							},
						}
						style.texture_size[1] = progress_bar_size * progress
					end,
					content_check_function = function (content)
						return content.parent.team_2_score_progress ~= 0
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "progress_bar_team_2_frame",
					texture_id = "progress_bar_frame",
				},
				{
					pass_type = "texture",
					style_id = "team_1_current_score_icon",
					texture_id = "team_1_current_score_icon",
				},
				{
					pass_type = "text",
					style_id = "team_1_current_score_text",
					text_id = "team_1_current_score_text",
				},
				{
					pass_type = "texture",
					style_id = "team_2_current_score_icon",
					texture_id = "team_2_current_score_icon",
				},
				{
					pass_type = "text",
					style_id = "team_2_current_score_text",
					text_id = "team_2_current_score_text",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "rect",
					style_id = "min_score",
				},
				{
					pass_type = "rect",
					style_id = "max_score",
				},
				{
					pass_type = "text",
					style_id = "min_score_text",
					text_id = "min_score_text",
				},
				{
					pass_type = "text",
					style_id = "max_score_text",
					text_id = "max_score_text",
				},
			},
		},
		content = {
			max_score_text = "50",
			min_score_text = "0",
			status_text = "Your team is winning",
			team_1_current_score_icon = "round_end_score_bar_slider",
			team_1_current_score_text = "0",
			team_1_score = 0,
			team_1_score_progress = 0,
			team_2_current_score_icon = "round_end_score_bar_slider",
			team_2_current_score_text = "0",
			team_2_score = 0,
			team_2_score_progress = 0,
			frame = frame_settings.texture,
			progress_bar_frame = progress_bar_frame_settings.texture,
			score_progress_bar = {
				texture_id = "score_bar_fill",
				uvs = {
					{
						0,
						0,
					},
					{
						0,
						1,
					},
				},
			},
		},
		style = {
			background = {
				size = size,
				color = {
					255,
					90,
					90,
					90,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			status_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					500,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					size[1] / 2 - 250,
					size[2] - 45,
					11,
				},
			},
			team_1_progress_bar_bg = {
				size = {
					size[1] - 150,
					20,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					75,
					48,
					3,
				},
			},
			progress_bar_team_1_frame = {
				size = {
					size[1] - 150 + 4,
					24,
				},
				default_size = {
					size[1] - 150,
					20,
				},
				texture_size = progress_bar_frame_settings.texture_size,
				texture_sizes = progress_bar_frame_settings.texture_sizes,
				frame_margins = {
					0,
					0,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					73,
					46,
					7,
				},
				default_offset = {
					73,
					46,
					20,
				},
			},
			score_progress_bar_team_1 = {
				color = Colors.get_color_table_with_alpha("local_player_team", 0),
				texture_size = {
					size[1] - 150,
					20,
				},
				offset = {
					75,
					48,
					5,
				},
			},
			team_2_progress_bar_bg = {
				size = {
					size[1] - 150,
					20,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					75,
					20,
					3,
				},
			},
			progress_bar_team_2_frame = {
				size = {
					size[1] - 150 + 4,
					24,
				},
				default_size = {
					size[1] - 150,
					20,
				},
				texture_size = progress_bar_frame_settings.texture_size,
				texture_sizes = progress_bar_frame_settings.texture_sizes,
				frame_margins = {
					0,
					0,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					73,
					18,
					7,
				},
				default_offset = {
					73,
					18,
					20,
				},
			},
			score_progress_bar_team_2 = {
				color = Colors.get_color_table_with_alpha("opponent_team", 0),
				texture_size = {
					size[1] - 150,
					20,
				},
				offset = {
					75,
					20,
					3,
				},
			},
			team_1_current_score_icon = {
				horizontal_alignment = "left",
				size = {
					32,
					24,
				},
				color = Colors.get_color_table_with_alpha("local_player_team", 255),
				offset = {
					59,
					46,
					10,
				},
			},
			team_2_current_score_icon = {
				horizontal_alignment = "left",
				size = {
					32,
					24,
				},
				color = Colors.get_color_table_with_alpha("opponent_team", 255),
				offset = {
					59,
					18,
					10,
				},
			},
			team_1_current_score_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					32,
					24,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					67,
					48,
					11,
				},
			},
			team_2_current_score_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					32,
					24,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					67,
					20,
					11,
				},
			},
			frame = {
				size = {
					size[1] + 4,
					size[2] + 4,
				},
				default_size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				frame_margins = {
					0,
					0,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-2,
					-2,
					4,
				},
				default_offset = {
					-2,
					-2,
					20,
				},
			},
			max_score = {
				size = {
					45,
					60,
				},
				color = {
					255,
					58,
					58,
					58,
				},
				offset = {
					size[1] - 75,
					15,
					10,
				},
			},
			max_score_text = {
				font_size = 38,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					45,
					60,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					size[1] - 75,
					15,
					11,
				},
			},
			min_score = {
				size = {
					45,
					60,
				},
				color = {
					255,
					58,
					58,
					58,
				},
				offset = {
					35,
					15,
					25,
				},
			},
			min_score_text = {
				font_size = 38,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = true,
				size = {
					45,
					60,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					35,
					15,
					26,
				},
			},
		},
		offset = offset or {
			0,
			0,
			1,
		},
		scenegraph_id = scenegraph_id,
	}
end
