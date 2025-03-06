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
		1180,
		120,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background_left",
					texture_id = "background_left",
				},
				{
					content_id = "background_right",
					pass_type = "texture_uv",
					style_id = "background_right",
				},
				{
					pass_type = "texture",
					style_id = "left_detail",
					texture_id = "left_detail",
				},
				{
					content_id = "right_detail",
					pass_type = "texture_uv",
					style_id = "right_detail",
				},
				{
					pass_type = "texture",
					style_id = "team_1_frame",
					texture_id = "team_1_frame",
				},
				{
					pass_type = "texture",
					style_id = "team_1_icon",
					texture_id = "team_1_icon",
				},
				{
					pass_type = "texture",
					style_id = "team_2_frame",
					texture_id = "team_2_frame",
				},
				{
					pass_type = "texture",
					style_id = "team_2_icon",
					texture_id = "team_2_icon",
				},
			},
		},
		content = {
			background_left = "headline_bg_60",
			left_detail = "button_detail_12",
			team_1_frame = "team_icon_background",
			team_1_icon = "team_icon_hammers",
			team_2_frame = "team_icon_background",
			team_2_icon = "team_icon_skulls",
			background_right = {
				texture_id = "headline_bg_60",
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
			right_detail = {
				texture_id = "button_detail_12",
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
		},
		style = {
			background_left = {
				size = {
					size[1] * 0.5,
					size[2],
				},
				color = {
					100,
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
			background_right = {
				size = {
					size[1] * 0.5,
					size[2],
				},
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					size[1] * 0.5,
					0,
					1,
				},
			},
			left_detail = {
				size = {
					40,
					180,
				},
				offset = {
					-10,
					0,
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			right_detail = {
				size = {
					40,
					180,
				},
				offset = {
					size[1] - 30,
					0,
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			team_1_frame = {
				size = {
					80,
					80,
				},
				color = Colors.get_color_table_with_alpha("local_player_team_lighter", 255),
				offset = {
					30,
					90,
					2,
				},
			},
			team_1_icon = {
				size = {
					80,
					80,
				},
				color = Colors.get_color_table_with_alpha("local_player_team_lighter", 255),
				offset = {
					30,
					90,
					3,
				},
			},
			team_2_frame = {
				size = {
					80,
					80,
				},
				color = Colors.get_color_table_with_alpha("opponent_team_lighter", 255),
				offset = {
					30,
					10,
					2,
				},
			},
			team_2_icon = {
				size = {
					80,
					80,
				},
				color = Colors.get_color_table_with_alpha("opponent_team_lighter", 255),
				offset = {
					30,
					10,
					3,
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

UIWidgets.create_player_panel = function (scenegraph_id, talent_tooltip_scenegraph_id, index, size, offset)
	fassert(talent_tooltip_scenegraph_id, "[UIWidgets.create_player_panel], A talent tooltip scenegraph id must be provided")

	local size = size or {
		620,
		160,
	}
	local frame_settings = UIFrameSettings.menu_frame_09
	local background_texture = "talent_tree_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local insignia_offset = UISettings.INSIGNIA_OFFSET

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
					pass_type = "texture",
					style_id = "host_texture",
					texture_id = "host_texture",
					content_check_function = function (content)
						return content.show_host
					end,
				},
				{
					pass_type = "texture",
					style_id = "ping_texture",
					texture_id = "ping_texture",
					content_check_function = function (content)
						return content.show_ping
					end,
				},
				{
					pass_type = "text",
					style_id = "ping_text",
					text_id = "ping_text",
					content_check_function = function (content, style)
						return content.show_ping and Application.user_setting("show_numerical_latency")
					end,
				},
				{
					pass_type = "text",
					style_id = "build_private_text",
					text_id = "build_private_text",
					content_check_function = function (content, style)
						return not content.is_build_visible
					end,
				},
				{
					pass_type = "rect",
					style_id = "chat_button_background",
					texture_id = "chat_button_texture",
				},
				{
					pass_type = "texture",
					style_id = "chat_button_frame",
					texture_id = "button_frame",
				},
				{
					pass_type = "texture",
					style_id = "chat_button_hotspot",
					texture_id = "chat_button_texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_chat_button and 255 or 60
					end,
				},
				{
					pass_type = "texture",
					style_id = "chat_button_disabled",
					texture_id = "disabled_texture",
					content_check_function = function (content)
						return content.show_chat_button and content.chat_button_hotspot.is_selected
					end,
				},
				{
					content_id = "chat_button_hotspot",
					pass_type = "hotspot",
					style_id = "chat_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "chat_tooltip_text_mute",
					content_check_function = function (content)
						return content.show_chat_button and not content.chat_button_hotspot.is_selected and content.chat_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "chat_tooltip_text_unmute",
					content_check_function = function (content)
						return content.show_chat_button and content.chat_button_hotspot.is_selected and content.chat_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "rect",
					style_id = "voice_button_background",
					texture_id = "voice_button_texture",
				},
				{
					pass_type = "texture",
					style_id = "voice_chat_button_frame",
					texture_id = "button_frame",
				},
				{
					pass_type = "texture",
					style_id = "voice_button_hotspot",
					texture_id = "voice_button_texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_voice_button and 255 or 60
					end,
				},
				{
					pass_type = "texture",
					style_id = "voice_button_disabled",
					texture_id = "disabled_texture",
					content_check_function = function (content)
						return content.show_voice_button and content.voice_button_hotspot.is_selected
					end,
				},
				{
					content_id = "voice_button_hotspot",
					pass_type = "hotspot",
					style_id = "voice_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "voice_tooltip_text_mute",
					content_check_function = function (content)
						return content.show_voice_button and not content.voice_button_hotspot.is_selected and content.voice_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "voice_tooltip_text_unmute",
					content_check_function = function (content)
						return content.show_voice_button and content.voice_button_hotspot.is_selected and content.voice_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "rect",
					style_id = "kick_button_background",
					texture_id = "kick_button_texture",
				},
				{
					pass_type = "texture",
					style_id = "kick_button_frame",
					texture_id = "button_frame",
				},
				{
					pass_type = "texture",
					style_id = "kick_button_hotspot",
					texture_id = "kick_button_texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_kick_button and 255 or 60
					end,
				},
				{
					content_id = "kick_button_hotspot",
					pass_type = "hotspot",
					style_id = "kick_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "kick_tooltip_text",
					content_check_function = function (content)
						return content.show_kick_button and content.kick_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "rect",
					style_id = "profile_button_background",
					texture_id = "profile_button_texture",
				},
				{
					pass_type = "texture",
					style_id = "profile_button_frame",
					texture_id = "button_frame",
				},
				{
					pass_type = "texture",
					style_id = "profile_button_hotspot",
					texture_id = "profile_button_texture",
					content_change_function = function (content, style)
						style.color[1] = content.show_profile_button and 255 or 60
					end,
				},
				{
					content_id = "profile_button_hotspot",
					pass_type = "hotspot",
					style_id = "profile_button_hotspot",
					content_check_function = function (content)
						return not content.disable_button
					end,
				},
				{
					pass_type = "tooltip_text",
					style_id = "tooltip_text",
					text_id = "profile_tooltip_text",
					content_check_function = function (content)
						return content.show_profile_button and content.profile_button_hotspot.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "name",
					text_id = "name",
					content_check_function = function (content, style)
						if content.button_hotspot.is_selected or content.controller_button_hotspot.is_hover then
							style.text_color = style.hover_color
						else
							style.text_color = style.color
						end

						return true
					end,
				},
				{
					pass_type = "text",
					style_id = "name_shadow",
					text_id = "name",
				},
				{
					pass_type = "text",
					style_id = "hero",
					text_id = "hero",
					content_check_function = function (content, style)
						if content.button_hotspot.is_selected or content.controller_button_hotspot.is_hover then
							style.text_color = style.hover_color
						else
							style.text_color = style.color
						end

						return true
					end,
				},
				{
					pass_type = "text",
					style_id = "hero_shadow",
					text_id = "hero",
				},
				{
					pass_type = "rect",
					style_id = "hp_bar_bg",
					content_check_function = function (content)
						return not content.is_dark_pact or content.is_in_local_player_party
					end,
				},
				{
					content_id = "hp_bar_fg_start",
					pass_type = "texture_uv",
					style_id = "hp_bar_fg_start",
					content_check_function = function (content)
						return not content.parent.is_dark_pact or content.parent.is_in_local_player_party
					end,
				},
				{
					content_id = "hp_bar_fg_middle",
					pass_type = "texture_uv",
					style_id = "hp_bar_fg_middle",
					content_check_function = function (content)
						return not content.parent.is_dark_pact or content.parent.is_in_local_player_party
					end,
				},
				{
					content_id = "hp_bar_fg_end",
					pass_type = "texture_uv",
					style_id = "hp_bar_fg_end",
					content_check_function = function (content)
						return not content.parent.is_dark_pact or content.parent.is_in_local_player_party
					end,
				},
				{
					content_id = "health_bar",
					pass_type = "gradient_mask_texture",
					style_id = "health_bar",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.parent.is_dark_pact or content.parent.is_in_local_player_party
					end,
				},
				{
					content_id = "total_health_bar",
					pass_type = "gradient_mask_texture",
					style_id = "total_health_bar",
					texture_id = "texture_id",
					content_change_function = function (content, style)
						local content = content.parent

						if content.is_knocked_down then
							style.color = Colors.get_color_table_with_alpha("red", 255)
						else
							style.color = Colors.get_color_table_with_alpha("white", 255)
						end
					end,
					content_check_function = function (content)
						return content.parent.is_local_player and not content.parent.is_dark_pact and content.parent.is_in_local_player_party
					end,
				},
				{
					content_id = "ability_bar",
					pass_type = "texture_uv",
					style_id = "ability_bar",
					content_change_function = function (content, style)
						local ability_progress = content.bar_value
						local size = style.texture_size
						local uvs = content.uvs
						local bar_length = style.full_size[1]

						uvs[2][2] = ability_progress
						size[1] = bar_length * ability_progress
					end,
					content_check_function = function (content)
						return content.parent.is_local_player and not content.parent.is_dark_pact and content.parent.is_in_local_player_party
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_melee",
					texture_id = "slot_melee",
					content_check_function = function (content)
						return content.slot_melee
					end,
				},
				{
					content_id = "slot_melee_hotspot",
					pass_type = "hotspot",
					style_id = "slot_melee",
					content_check_function = function (content)
						return content.parent.slot_melee
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_melee_frame",
					texture_id = "slot_melee_frame",
					content_check_function = function (content)
						return content.slot_melee
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_melee_rarity_texture",
					texture_id = "slot_melee_rarity_texture",
					content_check_function = function (content)
						return content.slot_melee
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ranged",
					texture_id = "slot_ranged",
					content_check_function = function (content)
						return content.slot_ranged
					end,
				},
				{
					content_id = "slot_ranged_hotspot",
					pass_type = "hotspot",
					style_id = "slot_ranged",
					content_check_function = function (content)
						return content.parent.slot_ranged
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ranged_frame",
					texture_id = "slot_ranged_frame",
					content_check_function = function (content)
						return content.slot_ranged
					end,
				},
				{
					pass_type = "texture",
					style_id = "slot_ranged_rarity_texture",
					texture_id = "slot_ranged_rarity_texture",
					content_check_function = function (content)
						return content.slot_ranged
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_1_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_1.talent
					end,
				},
				{
					content_id = "talent_1",
					pass_type = "hotspot",
					style_id = "talent_1",
				},
				{
					content_id = "talent_1",
					pass_type = "texture",
					style_id = "talent_1",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_1",
					pass_type = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					scenegraph_id = talent_tooltip_scenegraph_id,
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_2_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_2.talent
					end,
				},
				{
					content_id = "talent_2",
					pass_type = "hotspot",
					style_id = "talent_2",
				},
				{
					content_id = "talent_2",
					pass_type = "texture",
					style_id = "talent_2",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_2",
					pass_type = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					scenegraph_id = talent_tooltip_scenegraph_id,
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_3_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_3.talent
					end,
				},
				{
					content_id = "talent_3",
					pass_type = "hotspot",
					style_id = "talent_3",
				},
				{
					content_id = "talent_3",
					pass_type = "texture",
					style_id = "talent_3",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_3",
					pass_type = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					scenegraph_id = talent_tooltip_scenegraph_id,
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_4_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_4.talent
					end,
				},
				{
					content_id = "talent_4",
					pass_type = "hotspot",
					style_id = "talent_4",
				},
				{
					content_id = "talent_4",
					pass_type = "texture",
					style_id = "talent_4",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_4",
					pass_type = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					scenegraph_id = talent_tooltip_scenegraph_id,
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_5_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_5.talent
					end,
				},
				{
					content_id = "talent_5",
					pass_type = "hotspot",
					style_id = "talent_5",
				},
				{
					content_id = "talent_5",
					pass_type = "texture",
					style_id = "talent_5",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_5",
					pass_type = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					scenegraph_id = talent_tooltip_scenegraph_id,
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "talent_6_frame",
					texture_id = "talent_frame",
					content_check_function = function (content)
						return content.talent_6.talent
					end,
				},
				{
					content_id = "talent_6",
					pass_type = "hotspot",
					style_id = "talent_6",
				},
				{
					content_id = "talent_6",
					pass_type = "texture",
					style_id = "talent_6",
					texture_id = "icon",
					content_check_function = function (content)
						return content.talent
					end,
				},
				{
					content_id = "talent_6",
					pass_type = "talent_tooltip",
					style_id = "talent_tooltip",
					talent_id = "talent",
					scenegraph_id = talent_tooltip_scenegraph_id,
					content_check_function = function (content)
						return content.talent and content.is_hover
					end,
				},
				{
					pass_type = "text",
					style_id = "respawn_text",
					text_id = "respawn_text",
					content_check_function = function (content)
						return content.is_dark_pact and content.respawning
					end,
				},
				content_id = "slot_ranged_hotspot",
			},
		},
		content = {
			build_private_text = "visibility_private",
			button_frame = "reward_pop_up_item_frame",
			chat_button_texture = "tab_menu_icon_02",
			chat_tooltip_text_mute = "input_description_mute_chat",
			chat_tooltip_text_unmute = "input_description_unmute_chat",
			disabled_texture = "tab_menu_icon_03",
			hero = "wh_captain",
			host_texture = "host_icon",
			hp_bar_bg = "hud_teammate_hp_bar_bg",
			kick_button_texture = "tab_menu_icon_04",
			kick_tooltip_text = "input_description_vote_kick_player",
			name = "n/a",
			ping_text = "150",
			ping_texture = "ping_icon_03",
			profile_button_texture = "tab_menu_icon_05",
			profile_tooltip_text = "input_description_show_profile",
			respawn_text = "0",
			show_chat_button = false,
			show_kick_button = false,
			show_ping = false,
			show_profile_button = false,
			show_voice_button = false,
			slot_melee_frame = "reward_pop_up_item_frame",
			slot_melee_rarity_texture = "icon_bg_plentiful",
			slot_ranged_frame = "reward_pop_up_item_frame",
			slot_ranged_rarity_texture = "icon_bg_plentiful",
			talent_frame = "talent_frame",
			voice_button_texture = "tab_menu_icon_01",
			voice_tooltip_text_mute = "input_description_mute_voice",
			voice_tooltip_text_unmute = "input_description_unmute_voice",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0,
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						math.min((size[2] - 50) / background_texture_settings.size[2], 1),
					},
				},
				texture_id = background_texture,
			},
			button_hotspot = {
				allow_multi_hover = true,
			},
			chat_button_hotspot = {},
			kick_button_hotspot = {},
			voice_button_hotspot = {},
			profile_button_hotspot = {},
			controller_button_hotspot = {},
			hp_bar_fg_start = {
				texture_id = "hud_teammate_hp_bar_frame",
				uvs = {
					{
						0,
						0,
					},
					{
						0.2,
						1,
					},
				},
			},
			hp_bar_fg_middle = {
				texture_id = "hud_teammate_hp_bar_frame",
				uvs = {
					{
						0.2,
						0,
					},
					{
						0.8,
						1,
					},
				},
			},
			hp_bar_fg_end = {
				texture_id = "hud_teammate_hp_bar_frame",
				uvs = {
					{
						0.8,
						0,
					},
					{
						1,
						1,
					},
				},
			},
			health_bar = {
				bar_value = 1,
				draw_health_bar = true,
				internal_bar_value = 0,
				texture_id = "teammate_hp_bar_color_tint_" .. math.min(index, 8),
			},
			total_health_bar = {
				bar_value = 1,
				draw_health_bar = true,
				internal_bar_value = 0,
				texture_id = "teammate_hp_bar_" .. math.min(index, 8),
			},
			ability_bar = {
				bar_value = 1,
				texture_id = "hud_teammate_ability_bar_fill",
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
			slot_melee_hotspot = {},
			slot_ranged_hotspot = {},
			talent_1 = {
				is_selected = true,
			},
			talent_2 = {
				is_selected = true,
			},
			talent_3 = {
				is_selected = true,
			},
			talent_4 = {
				is_selected = true,
			},
			talent_5 = {
				is_selected = true,
			},
			talent_6 = {
				is_selected = true,
			},
		},
		style = {
			slot_melee = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-215,
					-10,
					1,
				},
			},
			slot_melee_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-215,
					-10,
					2,
				},
			},
			slot_melee_rarity_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-215,
					-10,
					0,
				},
			},
			slot_ranged = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-165,
					-10,
					1,
				},
			},
			slot_ranged_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-165,
					-10,
					2,
				},
			},
			slot_ranged_rarity_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-165,
					-10,
					0,
				},
			},
			talent_tooltip = {
				draw_downwards = false,
			},
			talent_1 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-215,
					-60,
					1,
				},
			},
			talent_1_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-215,
					-60,
					2,
				},
			},
			talent_2 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-175,
					-60,
					1,
				},
			},
			talent_2_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-175,
					-60,
					2,
				},
			},
			talent_3 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-135,
					-60,
					1,
				},
			},
			talent_3_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-135,
					-60,
					2,
				},
			},
			talent_4 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-95,
					-60,
					1,
				},
			},
			talent_4_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-95,
					-60,
					2,
				},
			},
			talent_5 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-55,
					-60,
					1,
				},
			},
			talent_5_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-55,
					-60,
					2,
				},
			},
			talent_6 = {
				draw_downwards = false,
				draw_right = true,
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					40,
					40,
				},
				texture_size = {
					40,
					40,
				},
				offset = {
					-15 + 0 * -40,
					-60,
					1,
				},
			},
			talent_6_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					40,
					40,
				},
				offset = {
					-15 + 0 * -40,
					-60,
					2,
				},
			},
			health_bar = {
				gradient_threshold = 1,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					200 - insignia_offset,
					18,
				},
				color = {
					255,
					0,
					255,
					0,
				},
				offset = {
					150 + insignia_offset,
					-82,
					14,
				},
			},
			total_health_bar = {
				gradient_threshold = 1,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					200 - insignia_offset,
					18,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					150 + insignia_offset,
					-82,
					13,
				},
			},
			ability_bar = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				full_size = {
					194 - insignia_offset,
					10,
				},
				texture_size = {
					200,
					12,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					153 + insignia_offset,
					-100,
					13,
				},
			},
			hp_bar_bg = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_tiling_size = {
					100,
					20,
				},
				texture_size = {
					200 - insignia_offset,
					30,
				},
				tile_offset = {
					true,
					false,
				},
				offset = {
					150 + insignia_offset,
					-82,
					10,
				},
				color = {
					255,
					30,
					30,
					30,
				},
			},
			hp_bar_fg_start = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					20,
					35,
				},
				offset = {
					150 + insignia_offset,
					-80,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			hp_bar_fg_middle = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					160 - insignia_offset,
					35,
				},
				offset = {
					170 + insignia_offset,
					-80,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			hp_bar_fg_end = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					20,
					35,
				},
				offset = {
					330,
					-80,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
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
			background = {
				size = {
					size[1],
					size[2],
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
					0,
				},
			},
			tooltip_text = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = true,
				max_width = 500,
				vertical_alignment = "top",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			profile_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-170,
					10,
					1,
				},
			},
			profile_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-170,
					10,
					3,
				},
			},
			profile_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-170,
					10,
					2,
				},
			},
			voice_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-120,
					10,
					3,
				},
			},
			voice_chat_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-120,
					10,
					6,
				},
			},
			voice_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-120,
					10,
					4,
				},
			},
			voice_button_disabled = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
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
					-120,
					10,
					5,
				},
			},
			chat_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-70,
					10,
					1,
				},
			},
			chat_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-70,
					10,
					6,
				},
			},
			chat_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-70,
					10,
					4,
				},
			},
			chat_button_disabled = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
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
					-70,
					10,
					5,
				},
			},
			kick_button_background = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					-20 + 0 * -50,
					10,
					3,
				},
			},
			kick_button_frame = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				color = {
					255,
					128,
					128,
					128,
				},
				offset = {
					-20 + 0 * -50,
					10,
					6,
				},
			},
			kick_button_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					40,
					40,
				},
				area_size = {
					40,
					40,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-20 + 0 * -50,
					10,
					4,
				},
			},
			ping_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
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
					-210,
					5,
					5,
				},
			},
			ping_text = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "arial",
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				offset = {
					-255,
					13,
					3,
				},
				text_color = Colors.get_table("font_default"),
				high_ping_color = Colors.get_table("crimson"),
				medium_ping_color = Colors.get_table("gold"),
				low_ping_color = Colors.get_table("lime_green"),
			},
			build_private_text = {
				font_size = 24,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				offset = {
					200,
					-20,
					1,
				},
				text_color = {
					255,
					128,
					128,
					128,
				},
			},
			host_texture = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-215,
					10,
					3,
				},
				texture_size = {
					40,
					40,
				},
			},
			name = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "arial",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				size = {
					210 - insignia_offset,
					30,
				},
				offset = {
					150 + insignia_offset,
					121,
					3,
				},
				color = Colors.get_table("font_default"),
				hover_color = Colors.get_table("font_default"),
				text_color = Colors.get_table("font_default"),
			},
			name_shadow = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "arial",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				size = {
					210 - insignia_offset,
					30,
				},
				offset = {
					152 + insignia_offset,
					119,
					2,
				},
				text_color = Colors.get_table("black"),
			},
			hero = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				size = {
					210 - insignia_offset,
					30,
				},
				offset = {
					150 + insignia_offset,
					90,
					3,
				},
				color = Colors.get_table("font_title"),
				hover_color = Colors.get_table("font_title"),
				text_color = Colors.get_table("font_title"),
			},
			hero_shadow = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				size = {
					210 - insignia_offset,
					30,
				},
				offset = {
					152 + insignia_offset,
					88,
					2,
				},
				text_color = Colors.get_table("black"),
			},
			respawn_text = {
				font_size = 80,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				vertical_alignment = "center",
				size = {
					100,
					120,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					14,
					0,
					20,
				},
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

UIWidgets.create_objective_score_widget = function (scenegraph_id, size, offset)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "progress_background",
					texture_id = "progress_background",
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "progress_bar",
					texture_id = "progress_bar",
				},
				{
					pass_type = "text",
					style_id = "team_1_score",
					text_id = "team_1_score",
					content_change_function = function (content, style)
						if content.is_hero then
							style.text_color = Colors.get_color_table_with_alpha("white_smoke", 255)
						else
							style.text_color = Colors.get_color_table_with_alpha("very_dark_gray", 255)
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "team_2_score",
					text_id = "team_2_score",
					content_change_function = function (content, style)
						if content.is_hero then
							style.text_color = Colors.get_color_table_with_alpha("very_dark_gray", 255)
						else
							style.text_color = Colors.get_color_table_with_alpha("white_smoke", 255)
						end
					end,
				},
				{
					pass_type = "texture",
					style_id = "objective_icon",
					texture_id = "objective_icon",
					content_check_function = function (content)
						return content.pre_round_timer_done
					end,
				},
				{
					pass_type = "text",
					style_id = "pre_round_timer",
					text_id = "pre_round_timer",
					content_check_function = function (content)
						return not content.pre_round_timer_done
					end,
				},
			},
		},
		content = {
			background = "frame_front",
			objective_icon = "icons_placeholder",
			pre_round_timer = " ",
			pre_round_timer_done = false,
			progress_background = "frame_back",
			progress_bar = "versus_objective_progress_bar",
			team_1_score = " ",
			team_2_score = " ",
		},
		style = {
			background = {
				texture_size = size,
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					3,
				},
			},
			progress_background = {
				texture_size = size,
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1,
				},
			},
			progress_bar = {
				gradient_threshold = 0,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					128,
					128,
				},
				offset = {
					0,
					0,
					2,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			objective_icon = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					64,
					64,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					6,
				},
			},
			team_1_score = {
				dynamic_font_size = true,
				font_size = 46,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					100,
					50,
				},
				text_color = Colors.get_color_table_with_alpha("white_smoke", 255),
				shadow_offset = {
					1,
					1,
					4,
				},
				offset = {
					8,
					50,
					4,
				},
			},
			team_2_score = {
				dynamic_font_size = true,
				font_size = 46,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					100,
					50,
				},
				text_color = Colors.get_color_table_with_alpha("white_smoke", 255),
				shadow_offset = {
					1,
					1,
					4,
				},
				offset = {
					195,
					50,
					4,
				},
			},
			pre_round_timer = {
				font_size = 50,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					54,
					50,
				},
				text_color = Colors.get_color_table_with_alpha("white_smoke", 255),
				shadow_offset = {
					1,
					1,
					4,
				},
				offset = {
					size[1] * 0.5 - 27,
					size[2] * 0.25 + 4 - 2,
					5,
				},
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

UIWidgets.create_mission_objective_text_widget_still = function (scenegraph_id)
	local size_y = 55

	return {
		alpha_multiplier = 1,
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "area_text_style",
					text_id = "area_text_content",
				},
				{
					pass_type = "text",
					style_id = "area_text_shadow_style",
					text_id = "area_text_content",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "top_center",
					texture_id = "top_center",
				},
				{
					content_id = "top_edge_glow",
					pass_type = "texture_uv",
					style_id = "top_edge_glow",
				},
				{
					pass_type = "texture",
					style_id = "top_detail",
					texture_id = "top_detail",
				},
				{
					pass_type = "texture",
					style_id = "top_detail_glow",
					texture_id = "top_detail_glow",
				},
				{
					pass_type = "texture",
					style_id = "top",
					texture_id = "top",
				},
				{
					pass_type = "texture",
					style_id = "bottom",
					texture_id = "top",
				},
				{
					pass_type = "texture",
					style_id = "bottom_center",
					texture_id = "bottom_center",
				},
				{
					pass_type = "texture",
					style_id = "bottom_edge_glow",
					texture_id = "bottom_edge_glow",
				},
			},
		},
		content = {
			area_text_content = "n/a",
			bottom_center = "mission_objective_02",
			bottom_edge_glow = "mission_objective_glow_01",
			fraction = 1,
			top = "mission_objective_05",
			top_center = "mission_objective_04",
			top_detail = "mission_objective_01",
			top_detail_glow = "mission_objective_glow_02",
			background = {
				texture_id = "mission_objective_bg",
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
			top_edge_glow = {
				texture_id = "mission_objective_glow_01",
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
		},
		style = {
			background = {
				size = {
					544,
					size_y,
				},
				offset = {
					0,
					0,
					0,
				},
				color = {
					100,
					255,
					255,
					255,
				},
			},
			top_center = {
				size = {
					54,
					22,
				},
				offset = {
					245,
					size_y - 11 - 3,
					11,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_edge_glow = {
				size = {
					544,
					16,
				},
				default_size = {
					544,
					16,
				},
				offset = {
					0,
					size_y - 16 - 3,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_detail = {
				size = {
					54,
					22,
				},
				offset = {
					245,
					size_y - 11 - 3,
					12,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top_detail_glow = {
				horizontal_alignment = "center",
				size = {
					54,
					22,
				},
				offset = {
					245,
					size_y - 11 - 3,
					13,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			top = {
				size = {
					544,
					5,
				},
				offset = {
					0,
					size_y - 5,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bottom = {
				size = {
					544,
					5,
				},
				offset = {
					0,
					0,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bottom_center = {
				size = {
					54,
					22,
				},
				offset = {
					245,
					-6,
					11,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bottom_edge_glow = {
				size = {
					544,
					16,
				},
				default_size = {
					544,
					16,
				},
				offset = {
					0,
					3,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			area_text_style = {
				default_font_size = 30,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 20,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-1,
					11,
				},
			},
			area_text_shadow_style = {
				default_font_size = 30,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 20,
				upper_case = true,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-3,
					10,
				},
			},
			duration_text_style = {
				default_font_size = 30,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 20,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-1,
					11,
				},
			},
			duration_text_shadow_style = {
				default_font_size = 30,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				min_font_size = 20,
				upper_case = false,
				vertical_alignment = "center",
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-3,
					10,
				},
			},
		},
		scenegraph_id = scenegraph_id,
	}
end

UIWidgets.create_total_score_progress_bar = function (scenegraph_id, size, max_score, current_score, local_player)
	local animation_speed = 1.5
	local current_score_size = {
		130,
		60,
	}
	local max_score_size = {
		50,
		30,
	}
	local bar_bg = "bar_frame_01_back"
	local bar_bg_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(bar_bg)
	local progress_bar_frame_settings = UIFrameSettings.bar_frame_01
	local max_score_frame_settings = UIFrameSettings.bar_frame_01
	local current_score_glod_frame = UIFrameSettings.button_frame_02_gold
	local current_score_bronze_frame = UIFrameSettings.button_frame_01
	local widget = {}
	local element = {}

	local function is_winning(content, style)
		if content.parent then
			return content.parent.is_winning
		else
			return content.is_winning
		end
	end

	local function is_losing(content, style)
		if content.parent then
			return not content.parent.is_winning
		else
			return not content.is_winning
		end
	end

	local amount = max_score / 25
	local spacing_x = size[1] / amount
	local separator_icon = "bar_frame_01_divider"
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(separator_icon)
	local texture_size = texture_settings.size
	local texture_total_width = texture_size[1] * amount
	local total_spacing = spacing_x * (amount - 1)
	local icon_textures = {}
	local icon_texture_sizes = {}
	local icon_texture_colors = {}

	for i = 1, amount - 1 do
		icon_textures[i] = separator_icon
		icon_texture_sizes[i] = texture_size
		icon_texture_colors[i] = {
			255,
			255,
			255,
			255,
		}
	end

	element.passes = {
		{
			pass_type = "tiled_texture",
			style_id = "bar_background",
			texture_id = "bar_background",
		},
		{
			pass_type = "texture_frame",
			style_id = "bar_frame",
			texture_id = "bar_frame",
		},
		{
			pass_type = "gradient_mask_texture",
			style_id = "bar_fill",
			texture_id = "bar_fill",
			content_change_function = function (content, style)
				style.gradient_threshold = content.current_bar_fil_threshold
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "max_score_detail_frame",
			texture_id = "max_score_detail_frame",
		},
		{
			pass_type = "text",
			style_id = "max_score",
			text_id = "max_score",
		},
		{
			pass_type = "tiled_texture",
			style_id = "current_score_background",
			texture_id = "current_score_background",
		},
		{
			pass_type = "texture_frame",
			style_id = "gold_frame",
			texture_id = "gold_frame",
			content_check_function = is_winning,
		},
		{
			pass_type = "texture",
			style_id = "left_detail_w",
			texture_id = "left_detail_w",
			content_check_function = is_winning,
		},
		{
			content_id = "right_detail_w",
			pass_type = "texture_uv",
			style_id = "right_detail_w",
			content_check_function = is_winning,
		},
		{
			pass_type = "texture_frame",
			style_id = "bronze_frame",
			texture_id = "bronze_frame",
			content_check_function = is_losing,
		},
		{
			pass_type = "texture",
			style_id = "left_detail_l",
			texture_id = "left_detail_l",
			content_check_function = is_losing,
		},
		{
			content_id = "right_detail_l",
			pass_type = "texture_uv",
			style_id = "right_detail_l",
			content_check_function = is_losing,
		},
		{
			pass_type = "text",
			style_id = "current_score",
			text_id = "current_score_text",
		},
		{
			pass_type = "multi_texture",
			style_id = "score_separators",
			texture_id = "score_separators",
		},
	}

	local content = {
		bar_fill_threashold = 0,
		current_bar_fil_threshold = 0,
		current_score_background = "bar_frame_01_back",
		current_score_text = "0",
		is_winning = true,
		left_detail_l = "button_detail_01",
		left_detail_w = "button_detail_01_gold",
		bar_size = size,
		current_score_size = current_score_size,
		local_player_team = local_player,
		bar_background = bar_bg,
		bar_frame = progress_bar_frame_settings.texture,
		bar_fill = local_player and "local_player_score_bar" or "opponent_score_bar",
		max_score_detail_frame = max_score_frame_settings.texture,
		max_score = max_score,
		gold_frame = current_score_glod_frame.texture,
		right_detail_w = {
			texture_id = "button_detail_01_gold",
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
		bronze_frame = current_score_bronze_frame.texture,
		right_detail_l = {
			texture_id = "button_detail_01",
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
		current_score = current_score,
		score_separators = icon_textures,
	}
	local style = {
		bar_background = {
			texture_size = size,
			texture_tiling_size = bar_bg_settings.size,
			color = {
				255,
				255,
				255,
				255,
			},
			default_offset = {
				0,
				0,
				1,
			},
			offset = {
				0,
				0,
				1,
			},
		},
		bar_frame = {
			size = {
				size[1] + 4,
				size[2] + 4,
			},
			texture_size = progress_bar_frame_settings.texture_size,
			texture_sizes = progress_bar_frame_settings.texture_sizes,
			default_offset = {
				0,
				-2,
				10,
			},
			offset = {
				0,
				-2,
				10,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		bar_fill = {
			gradient_threshold = 0.3,
			size = {
				size[1] - max_score_size[1] + 4,
				size[2],
			},
			default_offset = {
				0,
				0,
				9,
			},
			offset = {
				0,
				0,
				9,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		max_score_detail_frame = {
			size = {
				max_score_size[1] + 4,
				max_score_size[2] + 4,
			},
			texture_size = max_score_frame_settings.texture_size,
			texture_sizes = max_score_frame_settings.texture_sizes,
			default_offset = {
				size[1] - 50,
				-2,
				10,
			},
			offset = {
				size[1] - 50,
				-2,
				10,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		max_score = {
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			use_shadow = true,
			vertical_alignment = "center",
			word_wrap = false,
			size = {
				max_score_size[1] - 10,
				size[2],
			},
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_offset = {
				size[1] - 40,
				0,
				5,
			},
			offset = {
				size[1] - 40,
				0,
				5,
			},
		},
		current_score_background = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			texture_size = current_score_size,
			texture_tiling_size = {
				128,
				128,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			default_offset = {
				20,
				0,
				11,
			},
			offset = {
				20,
				0,
				11,
			},
		},
		gold_frame = {
			size = current_score_size,
			texture_size = current_score_glod_frame.texture_size,
			texture_sizes = current_score_glod_frame.texture_sizes,
			default_offset = {
				20,
				-15,
				12,
			},
			offset = {
				20,
				-15,
				12,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		left_detail_w = {
			size = {
				40,
				current_score_size[2],
			},
			default_offset = {
				10,
				-15,
				13,
			},
			offset = {
				10,
				-15,
				13,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		right_detail_w = {
			size = {
				40,
				current_score_size[2],
			},
			default_offset = {
				current_score_size[1] - 10,
				-15,
				13,
			},
			offset = {
				current_score_size[1] - 10,
				-15,
				13,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		bronze_frame = {
			size = current_score_size,
			texture_size = current_score_bronze_frame.texture_size,
			texture_sizes = current_score_bronze_frame.texture_sizes,
			default_offset = {
				20,
				-15,
				12,
			},
			offset = {
				20,
				-15,
				12,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		left_detail_l = {
			size = {
				40,
				current_score_size[2],
			},
			default_offset = {
				10,
				-15,
				13,
			},
			offset = {
				10,
				-15,
				13,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		right_detail_l = {
			size = {
				40,
				current_score_size[2],
			},
			default_offset = {
				current_score_size[1] - 10,
				-15,
				13,
			},
			offset = {
				current_score_size[1] - 10,
				-15,
				13,
			},
			color = {
				255,
				255,
				255,
				255,
			},
		},
		current_score = {
			font_size = 50,
			font_type = "hell_shark_header",
			horizontal_alignment = "center",
			localize = false,
			upper_case = false,
			use_shadow = true,
			vertical_alignment = "center",
			word_wrap = false,
			size = current_score_size,
			text_color = local_player and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255),
			default_offset = {
				20,
				-20,
				13,
			},
			offset = {
				20,
				-20,
				13,
			},
		},
		score_separators = {
			axis = 1,
			direction = 1,
			size = size,
			spacing = {
				spacing_x - 1,
				0,
			},
			texture_sizes = icon_texture_sizes,
			texture_colors = icon_texture_colors,
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
				5,
				3,
			},
			draw_count = amount - 1,
		},
	}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.scenegraph_id = scenegraph_id
	widget.offset = {
		0,
		0,
		0,
	}

	return widget
end

UIWidgets.create_team_banner_info = function (scenegraph_id, is_local_player_team)
	local text_horizontal_alignment = is_local_player_team and "left" or "right"
	local uvs = is_local_player_team and {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	} or {
		{
			1,
			1,
		},
		{
			0,
			0,
		},
	}
	local text_x_offset = is_local_player_team and 45 or -45

	return {
		element = {
			passes = {
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "text",
					style_id = "team_side",
					text_id = "team_side",
				},
				{
					pass_type = "text",
					style_id = "team_name",
					text_id = "team_name",
				},
			},
		},
		content = {
			team_name = "**Hammers",
			background = {
				texture_id = "headline_bg_40",
				uvs = uvs,
			},
			team_side = is_local_player_team and "**Your Team" or "**Enemy",
		},
		style = {
			background = {
				color = {
					100,
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
			team_side = {
				font_size = 22,
				font_type = "hell_shark",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				horizontal_alignment = text_horizontal_alignment,
				text_color = is_local_player_team and Colors.get_color_table_with_alpha("font_button_normal", 255) or Colors.get_color_table_with_alpha("opponent_team", 255),
				offset = {
					text_x_offset,
					-5,
					4,
				},
			},
			team_name = {
				font_size = 60,
				font_type = "hell_shark_header",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "bottom",
				word_wrap = true,
				horizontal_alignment = text_horizontal_alignment,
				text_color = is_local_player_team and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255),
				offset = {
					text_x_offset,
					-5,
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

UIWidgets.create_round_score_progress_bar = function (scenegraph_id, size, offset, local_player, max_score, current_score)
	local bar_bg = "bar_frame_01_back"
	local bar_bg_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(bar_bg)
	local progress_bar_frame_settings = UIFrameSettings.bar_frame_01
	local max_score_frame_settings = UIFrameSettings.bar_frame_01
	local current_score_frame_settings = UIFrameSettings.bar_frame_01
	local score_size = {
		50,
		30,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "bar_background",
					texture_id = "bar_background",
				},
				{
					pass_type = "texture_frame",
					style_id = "bar_frame",
					texture_id = "bar_frame",
				},
				{
					pass_type = "texture_frame",
					style_id = "current_score_frame",
					texture_id = "current_score_frame",
				},
				{
					pass_type = "tiled_texture",
					style_id = "current_score_bg",
					texture_id = "current_score_bg",
				},
				{
					pass_type = "texture_frame",
					style_id = "max_score_frame",
					texture_id = "max_score_frame",
				},
				{
					pass_type = "tiled_texture",
					style_id = "max_score_bg",
					texture_id = "max_score_bg",
				},
				{
					clone = true,
					pass_type = "gradient_mask_texture",
					style_id = "bar_fill",
					texture_id = "bar_fill",
					content_change_function = function (content, style)
						style.gradient_threshold = content.current_bar_fil_threshold
					end,
				},
				{
					pass_type = "text",
					style_id = "current_score",
					text_id = "current_score",
				},
				{
					pass_type = "text",
					style_id = "max_score",
					text_id = "max_score",
				},
			},
		},
		content = {
			bar_fill_threashold = 0,
			current_bar_fil_threshold = 0,
			bar_size = size,
			score_size = score_size,
			local_player_team = local_player,
			bar_background = bar_bg,
			bar_frame = progress_bar_frame_settings.texture,
			bar_fill = local_player and "local_player_score_bar" or "opponent_score_bar",
			max_score_detail_frame = max_score_frame_settings.texture,
			current_score = current_score,
			max_score = max_score,
			current_score_frame = max_score_frame_settings.texture,
			current_score_bg = bar_bg,
			max_score_frame = max_score_frame_settings.texture,
			max_score_bg = bar_bg,
		},
		style = {
			bar_background = {
				texture_size = size,
				texture_tiling_size = bar_bg_settings.size,
				color = {
					255,
					255,
					255,
					255,
				},
				default_offset = {
					0,
					0,
					1,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			bar_frame = {
				size = {
					size[1] + 4,
					size[2] + 4,
				},
				texture_size = max_score_frame_settings.texture_size,
				texture_sizes = max_score_frame_settings.texture_sizes,
				default_offset = {
					0,
					-2,
					10,
				},
				offset = {
					0,
					-2,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			bar_fill = {
				gradient_threshold = 0.3,
				size = {
					size[1] - 50,
					size[2],
				},
				default_offset = {
					0,
					0,
					9,
				},
				offset = {
					0,
					0,
					9,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			current_score_frame = {
				size = {
					score_size[1] + 4,
					score_size[2] + 4,
				},
				texture_size = max_score_frame_settings.texture_size,
				texture_sizes = max_score_frame_settings.texture_sizes,
				default_offset = {
					0,
					-10,
					13,
				},
				offset = {
					0,
					-10,
					13,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			current_score_bg = {
				texture_size = score_size,
				texture_tiling_size = bar_bg_settings.size,
				color = {
					255,
					255,
					255,
					255,
				},
				default_offset = {
					0,
					-10,
					11,
				},
				offset = {
					0,
					-10,
					11,
				},
			},
			max_score_frame = {
				size = {
					score_size[1] + 4,
					score_size[2] + 4,
				},
				texture_size = max_score_frame_settings.texture_size,
				texture_sizes = max_score_frame_settings.texture_sizes,
				default_offset = {
					size[1] - 50,
					-10,
					13,
				},
				offset = {
					size[1] - 50,
					-10,
					13,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			max_score_bg = {
				texture_size = score_size,
				texture_tiling_size = bar_bg_settings.size,
				color = {
					255,
					255,
					255,
					255,
				},
				default_offset = {
					size[1] - 50,
					-10,
					10,
				},
				offset = {
					size[1] - 50,
					-10,
					10,
				},
			},
			max_score = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					score_size[1],
					score_size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_offset = {
					size[1] - 40,
					-10,
					12,
				},
				offset = {
					size[1] - 40,
					-10,
					12,
				},
			},
			current_score = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					score_size[1],
					score_size[2],
				},
				text_color = local_player and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255),
				default_offset = {
					0,
					-10,
					12,
				},
				offset = {
					0,
					-10,
					12,
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

UIWidgets.create_round_end_round_score_bg_widget = function (scenegraph_id, size, offset)
	local size = size or {
		920,
		100,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background_left",
					texture_id = "background_left",
				},
				{
					content_id = "background_right",
					pass_type = "texture_uv",
					style_id = "background_right",
				},
				{
					pass_type = "texture",
					style_id = "left_detail",
					texture_id = "left_detail",
				},
				{
					content_id = "right_detail",
					pass_type = "texture_uv",
					style_id = "right_detail",
				},
			},
		},
		content = {
			background_left = "headline_bg_40",
			left_detail = "button_detail_12",
			background_right = {
				texture_id = "headline_bg_40",
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
			right_detail = {
				texture_id = "button_detail_12",
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
		},
		style = {
			background_left = {
				size = {
					size[1] * 0.5,
					size[2],
				},
				color = {
					100,
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
			background_right = {
				size = {
					size[1] * 0.5,
					size[2],
				},
				color = {
					100,
					255,
					255,
					255,
				},
				offset = {
					size[1] * 0.5,
					0,
					1,
				},
			},
			left_detail = {
				size = {
					40,
					100,
				},
				offset = {
					-10,
					0,
					2,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			right_detail = {
				size = {
					40,
					100,
				},
				offset = {
					size[1] - 30,
					0,
					2,
				},
				color = {
					255,
					255,
					255,
					255,
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

UIWidgets.create_parading_screen_divider = function (scenegraph_id, size, offset)
	local divider_mid = "divider_horizontal_hero_middle_blue"
	local divider_mid_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(divider_mid)

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "divider_edge_left",
					texture_id = "divider_edge_left",
				},
				{
					pass_type = "tiled_texture",
					style_id = "divider_mid",
					texture_id = "divider_mid",
				},
				{
					content_id = "divider_edge_right",
					pass_type = "texture_uv",
					style_id = "divider_edge_right",
				},
			},
		},
		content = {
			divider_edge_left = "divider_horizontal_hero_end_blue",
			divider_mid = divider_mid,
			divider_edge_right = {
				texture_id = "divider_horizontal_hero_end_blue",
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
		},
		style = {
			divider_edge_left = {
				vertical_alignment = "center",
				size = {
					22,
					28,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-22,
					-7,
					1,
				},
			},
			divider_mid = {
				vertical_alignment = "center",
				texture_size = size,
				texture_tiling_size = divider_mid_settings.size,
				color = Colors.get_color_table_with_alpha("white", 255),
				default_offset = {
					0,
					0,
					1,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			divider_edge_right = {
				vertical_alignment = "center",
				size = {
					22,
					28,
				},
				offset = {
					size[1],
					-7,
					2,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
		},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			1,
		},
	}
end

UIWidgets.create_dark_pact_onboarding_tutorial_widget = function (scenegraph_id, size, offset)
	local size = size or {
		400,
		300,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "top_detail",
					texture_id = "detail",
				},
				{
					pass_type = "rotated_texture",
					style_id = "bottom_detail",
					texture_id = "detail",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "text",
					style_id = "hero_text",
					text_id = "hero_text",
				},
				{
					pass_type = "text",
					style_id = "description",
					text_id = "description",
				},
				{
					pass_type = "text",
					style_id = "abilities_tooltip",
					text_id = "abilities_tooltip",
				},
			},
		},
		content = {
			abilities_tooltip = "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
			description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
			detail = "radial_chat_bg_line",
			hero_text = "RATLING GUNNER",
			background = {
				texture_id = "headline_bg_60",
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
		},
		style = {
			top_detail = {
				angle = math.degrees_to_radians(-90),
				offset = {
					200,
					60,
					4,
				},
				pivot = {
					2,
					200,
				},
				texture_size = {
					4,
					400,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
			},
			bottom_detail = {
				angle = math.degrees_to_radians(-90),
				offset = {
					200,
					-size[2] + 60,
					4,
				},
				pivot = {
					2,
					200,
				},
				texture_size = {
					4,
					400,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
			},
			background = {
				vertical_alignment = "center",
				size = {
					size[1] + 20,
					size[2],
				},
				offset = {
					-20,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			hero_text = {
				dynamic_font_size = true,
				font_size = 40,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				use_shadow = false,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-10,
					4,
				},
			},
			description = {
				dynamic_font_size_word_wrap = true,
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				upper_case = false,
				use_shadow = false,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					380,
					120,
				},
				text_color = Colors.get_color_table_with_alpha("light_gray", 255),
				offset = {
					0,
					92,
					4,
				},
			},
			abilities_tooltip = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				word_wrap = true,
				size = {
					380,
					120,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					8,
					4,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			1,
		},
	}
end

UIWidgets.create_hero_onboarding_tutorial_widget = function (scenegraph_id, size, offset)
	local size = size or {
		400,
		300,
	}
	local icon_size_multiplier = 1.25

	return {
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "top_detail",
					texture_id = "detail",
				},
				{
					pass_type = "rotated_texture",
					style_id = "bottom_detail",
					texture_id = "detail",
				},
				{
					content_id = "background",
					pass_type = "texture_uv",
					style_id = "background",
				},
				{
					pass_type = "text",
					style_id = "hero_text",
					text_id = "hero_text",
				},
				{
					pass_type = "texture",
					style_id = "career_icon",
					texture_id = "career_icon",
				},
				{
					pass_type = "texture",
					style_id = "ability_1_icon",
					texture_id = "ability_1_icon",
				},
				{
					pass_type = "texture",
					style_id = "ability_1_icon_frame",
					texture_id = "icon_frame",
				},
				{
					pass_type = "text",
					style_id = "ability_1_name",
					text_id = "ability_1_name",
				},
				{
					pass_type = "text",
					style_id = "ability_1_description",
					text_id = "ability_1_description",
				},
				{
					pass_type = "texture",
					style_id = "ability_2_icon",
					texture_id = "ability_2_icon",
				},
				{
					pass_type = "texture",
					style_id = "ability_2_icon_frame",
					texture_id = "icon_frame",
				},
				{
					pass_type = "text",
					style_id = "ability_2_name",
					text_id = "ability_2_name",
				},
				{
					pass_type = "text",
					style_id = "ability_2_description",
					text_id = "ability_2_description",
				},
			},
		},
		content = {
			ability_1_description = "n/a",
			ability_1_icon = "icons_placeholder",
			ability_1_name = "n/a",
			ability_2_description = "n/a",
			ability_2_icon = "icons_placeholder",
			ability_2_name = "n/a",
			career_icon = "simple_rect_texture",
			detail = "radial_chat_bg_line",
			hero_text = "HERO_TEXT",
			icon_frame = "icon_talent_frame",
			background = {
				texture_id = "headline_bg_60",
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
		},
		style = {
			top_detail = {
				angle = math.degrees_to_radians(-90),
				offset = {
					200,
					160,
					4,
				},
				pivot = {
					2,
					200,
				},
				texture_size = {
					4,
					400,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
			},
			bottom_detail = {
				angle = math.degrees_to_radians(-90),
				offset = {
					200,
					-size[2] + 160,
					4,
				},
				pivot = {
					2,
					200,
				},
				texture_size = {
					4,
					400,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
			},
			background = {
				vertical_alignment = "center",
				size = {
					size[1] + 20,
					size[2],
				},
				offset = {
					-20,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			hero_text = {
				dynamic_font_size = true,
				font_size = 40,
				font_type = "hell_shark_header",
				horizontal_alignment = "right",
				localize = false,
				upper_case = true,
				use_shadow = false,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					size[1],
					50,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-25,
					size[2] - 65,
					4,
				},
			},
			career_icon = {
				size = {
					64,
					64,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					size[2] - 70,
					5,
				},
			},
			ability_1_icon = {
				size = {
					64 * icon_size_multiplier,
					64 * icon_size_multiplier,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					size[1] - (64 * icon_size_multiplier + 20),
					size[2] - (64 * icon_size_multiplier + 80),
					5,
				},
			},
			ability_1_icon_frame = {
				size = {
					64 * icon_size_multiplier,
					64 * icon_size_multiplier,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					size[1] - (64 * icon_size_multiplier + 20),
					size[2] - (64 * icon_size_multiplier + 80),
					6,
				},
			},
			ability_1_name = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					size[1] - (64 * icon_size_multiplier + 25),
					25,
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-10,
					size[2] - 110,
					2,
				},
			},
			ability_1_description = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - (64 * icon_size_multiplier + 25),
					80,
				},
				text_color = Colors.get_color_table_with_alpha("light_gray", 255),
				offset = {
					-10,
					size[2] - (64 * icon_size_multiplier + 60 + 50),
					2,
				},
			},
			ability_2_icon = {
				size = {
					64 * icon_size_multiplier,
					64 * icon_size_multiplier,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					size[1] - (64 * icon_size_multiplier + 20),
					size[2] - (64 * icon_size_multiplier + 220),
					5,
				},
			},
			ability_2_icon_frame = {
				size = {
					64 * icon_size_multiplier,
					64 * icon_size_multiplier,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					size[1] - (64 * icon_size_multiplier + 20),
					size[2] - (64 * icon_size_multiplier + 220),
					6,
				},
			},
			ability_2_name = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				upper_case = true,
				use_shadow = true,
				vertical_alignment = "center",
				word_wrap = false,
				size = {
					size[1] - (64 * icon_size_multiplier + 25),
					25,
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-10,
					size[2] - 245,
					2,
				},
			},
			ability_2_description = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				use_shadow = true,
				vertical_alignment = "top",
				word_wrap = true,
				size = {
					size[1] - (64 * icon_size_multiplier + 25),
					80,
				},
				text_color = Colors.get_color_table_with_alpha("light_gray", 255),
				offset = {
					-10,
					30,
					2,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = offset or {
			0,
			0,
			1,
		},
	}
end

UIWidgets.create_dark_pact_overcharge_bar_widget = function (scenegraph_id, overcharge_bar, bar_foreground, glow_frame, hazard_icon, size, offset)
	local size = size or {
		250,
		56,
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "icon_shadow",
					texture_id = "icon",
				},
				{
					pass_type = "texture",
					style_id = "bar_fg",
					texture_id = "bar_fg",
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "bar_1",
					texture_id = "bar_1",
				},
			},
		},
		content = {
			icon = hazard_icon or "tabs_icon_all_selected",
			bar_1 = overcharge_bar or "dark_pact_overcharge_bar",
			bar_fg = bar_foreground or "circular_bar_background",
			size = {
				size[1] - 6,
				size[2],
			},
		},
		style = {
			bar_1 = {
				gradient_threshold = 0,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					3,
					-1,
					4,
				},
				size = {
					size[1],
					size[2],
				},
			},
			icon = {
				size = {
					0,
					0,
				},
				offset = {
					size[1],
					size[2] / 2,
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			icon_shadow = {
				size = {
					0,
					0,
				},
				offset = {
					size[1] + 2,
					size[2] / 2 - 2,
					5,
				},
				color = {
					0,
					0,
					0,
					0,
				},
			},
			bar_fg = {
				offset = {
					0,
					0,
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				size = size,
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

UIWidgets.create_versus_gameplay_hint_widget = function (scenegraph_id, data, optional_offset, optional_size)
	local has_input = data.close_input
	local size = optional_size or {
		400,
		360,
	}
	local input_data = data.input_data
	local foot_text_string

	if data.foot_text then
		if input_data then
			local input_text = "$KEY;" .. input_data.input_service_name .. "__" .. input_data.input_action .. ":"

			foot_text_string = string.format(Localize(data.foot_text), input_text)
		else
			foot_text_string = Localize(data.foot_text)
		end
	end

	local title_string = Localize(data.title_text)
	local body_string = Localize(data.body_text)
	local element = {
		passes = {
			{
				pass_type = "texture",
				style_id = "detail_bottom",
				texture_id = "detail",
			},
			{
				pass_type = "texture",
				style_id = "detail_top",
				texture_id = "detail",
				content_change_function = function (content, style)
					style.offset[2] = content.size[2] - 4
				end,
			},
			{
				pass_type = "texture",
				style_id = "background",
				texture_id = "background",
				content_change_function = function (content, style)
					style.size[2] = content.size[2]
				end,
			},
			{
				pass_type = "text",
				style_id = "title_text",
				text_id = "title_text",
				content_change_function = function (content, style)
					style.offset[2] = content.size[2] - 40 - 12
				end,
			},
			{
				pass_type = "text",
				style_id = "body_text",
				text_id = "body_text",
				content_change_function = function (content, style)
					style.size = {
						content.size[1] - 20,
						content.size[2],
					}
					style.area_size = {
						content.size[1] - 24,
						content.size[2],
					}
				end,
			},
		},
	}
	local content = {
		background = "simple_rect_texture",
		detail = "radial_chat_bg_line_horz",
		title_text = title_string,
		body_text = body_string,
		size = size,
	}
	local style = {
		detail_top = {
			offset = {
				0,
				size[2] - 4,
				4,
			},
			texture_size = {
				400,
				4,
			},
			color = Colors.get_color_table_with_alpha("black", 255),
		},
		detail_bottom = {
			offset = {
				0,
				0,
				4,
			},
			texture_size = {
				400,
				4,
			},
			color = Colors.get_color_table_with_alpha("black", 255),
		},
		background = {
			size = size,
			offset = {
				0,
				0,
				1,
			},
			color = Colors.get_color_table_with_alpha("black", 165),
		},
		title_text = {
			dynamic_font_size = true,
			font_size = 40,
			font_type = "hell_shark_header",
			horizontal_alignment = "left",
			localize = false,
			upper_case = true,
			use_shadow = false,
			vertical_alignment = "top",
			word_wrap = false,
			text_color = Colors.get_color_table_with_alpha("white", 255),
			size = {
				size[1] - 20,
				40,
			},
			offset = {
				20,
				size[2] - 40 - 12,
				4,
			},
		},
		body_text = {
			dynamic_font_size_word_wrap = true,
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			use_shadow = false,
			vertical_alignment = "top",
			word_wrap = true,
			size = {
				size[1] - 20,
				size[2],
			},
			area_size = {
				size[1] - 20,
				size[2],
			},
			text_color = Colors.get_color_table_with_alpha("light_gray", 255),
			offset = {
				20,
				-52,
				4,
			},
		},
	}

	if data.duration then
		local id = "duration_bar"
		local duration_bar_pass = {
			pass_type = "texture_uv",
			content_id = id,
			style_id = id,
		}
		local duration_bar_content = {
			texture_id = "crafting_bar",
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
		local duration_bar_style = {
			vertical_alignment = "left",
			offset = {
				0,
				6,
				8,
			},
			texture_size = {
				400,
				8,
			},
			color = Colors.get_color_table_with_alpha("local_player_picking", 255),
		}

		element.passes[#element.passes + 1] = duration_bar_pass
		content[id] = duration_bar_content
		style[id] = duration_bar_style
	end

	if data.foot_text then
		local id = "foot_text"
		local foot_text_pass = {
			pass_type = "text",
			text_id = id,
			style_id = id,
		}
		local foot_text = foot_text_string
		local foot_text_style = {
			dynamic_font_size_word_wrap = true,
			font_size = 20,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			use_shadow = false,
			vertical_alignment = "center",
			word_wrap = true,
			size = {
				size[1] - 88,
				48,
			},
			area_size = {
				size[1] - 88,
				48,
			},
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				88,
				30,
				4,
			},
		}

		element.passes[#element.passes + 1] = foot_text_pass
		content[id] = foot_text
		style[id] = foot_text_style
	end

	if data.icon then
		local id = "foot_icon"
		local foot_icon_pass = {
			pass_type = "texture",
			texture_id = id,
			style_id = id,
		}
		local foot_icon = data.icon
		local foot_icon_style = {
			vertical_alignment = "left",
			offset = {
				20,
				20,
				8,
			},
			texture_size = {
				60,
				60,
			},
			color = Colors.get_color_table_with_alpha("white", 255),
		}

		element.passes[#element.passes + 1] = foot_icon_pass
		content[id] = foot_icon
		style[id] = foot_icon_style
	end

	local widget = {}

	widget.element = element
	widget.content = content
	widget.style = style
	widget.scenegraph_id = scenegraph_id
	widget.offset = optional_offset or {
		0,
		0,
		0,
	}

	return widget
end

UIWidgets.create_large_insignia = function (scenegraph_id, optional_level, masked, color, texture_size, offset, retained_mode)
	local widget_def = {}
	local element = {
		passes = {},
	}
	local passes = element.passes
	local content = {}
	local style = {}
	local level = optional_level or ExperienceSettings.get_versus_level()
	local insignia_main_uvs, insignia_addon_uvs = UIAtlasHelper.get_insignia_texture_settings_from_level(level)
	local texture_size = texture_size or {
		100,
		276,
	}

	passes[#passes + 1] = {
		content_id = "insignia_main",
		pass_type = "texture_uv",
		style_id = "insignia_main",
		retained_mode = retained_mode,
	}
	passes[#passes + 1] = {
		content_id = "insignia_addon",
		pass_type = "texture_uv",
		style_id = "insignia_addon",
		content_check_function = function (content, style)
			return content.uvs
		end,
		retained_mode = retained_mode,
	}
	style.insignia_main = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = texture_size,
		color = color,
		offset = {
			0,
			0,
			1,
		},
		retained_mode = retained_mode,
	}
	style.insignia_addon = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = texture_size,
		color = color,
		retained_mode = retained_mode,
	}
	content.insignia_main = {
		uvs = insignia_main_uvs,
		texture_id = masked and "insignias_main_masked" or "insignias_main",
	}
	content.insignia_addon = {
		uvs = insignia_addon_uvs,
		texture_id = masked and "insignias_addon_masked" or "insignias_addon",
	}
	content.level = level
	widget_def.element = element
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset or {
		0,
		0,
		0,
	}

	return widget_def
end

UIWidgets.create_small_insignia = function (scenegraph_id, optional_level, masked, color, offset, retained_mode)
	local widget_def = {}
	local element = {
		passes = {},
	}
	local passes = element.passes
	local content = {}
	local style = {}
	local level = optional_level or ExperienceSettings.get_versus_level()
	local insignia_main_uvs, insignia_addon_uvs = UIAtlasHelper.get_insignia_texture_settings_from_level(level)
	local texture_size = {
		50,
		138,
	}

	passes[#passes + 1] = {
		content_id = "insignia_main",
		pass_type = "texture_uv",
		style_id = "insignia_main",
		retained_mode = retained_mode,
	}
	passes[#passes + 1] = {
		content_id = "insignia_addon",
		pass_type = "texture_uv",
		style_id = "insignia_addon",
		content_check_function = function (content, style)
			return content.uvs
		end,
		retained_mode = retained_mode,
	}
	style.insignia_main = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = texture_size,
		color = color or {
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
	style.insignia_addon = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = texture_size,
		color = color or {
			255,
			255,
			255,
			255,
		},
	}
	content.insignia_main = {
		uvs = insignia_main_uvs,
		texture_id = masked and "insignias_main_small_masked" or "insignias_main_small",
	}
	content.insignia_addon = {
		uvs = insignia_addon_uvs,
		texture_id = masked and "insignias_addon_small_masked" or "insignias_addon_small",
	}
	content.level = level
	content.visible = level > 0
	widget_def.element = element
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset or {
		0,
		0,
		0,
	}

	return widget_def
end

UIWidgets.create_ceremony_award = function (scenegraph_id, award_data, offset)
	local widget_def = {}
	local element = {
		passes = {},
	}
	local passes = element.passes
	local content = {}
	local style = {}
	local player_name = award_data.player_name
	local level = award_data.level
	local is_you = award_data.peer_id == Network.peer_id()
	local is_mvp = award_data.is_mvp
	local header = award_data.header
	local sub_header = award_data.sub_header
	local team_color = award_data.team_color
	local insignia_main_uvs, insignia_addon_uvs = UIAtlasHelper.get_insignia_texture_settings_from_level(level)
	local texture_size = {
		50,
		138,
	}

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "mvp",
		text_id = "mvp",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "mvp_masked",
		text_id = "mvp",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "shine",
		texture_id = "shine",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
		content_change_function = function (content, style)
			local t = Application.time_since_launch()
			local delta = t % 2 / 2

			style.offset[1] = math.lerp(-393, 393, delta)
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "mvp_shadow",
		text_id = "mvp",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "rotated_texture",
		style_id = "sparkle",
		texture_id = "sparkle",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
		content_change_function = function (content, style)
			local time = Application.time_since_launch() % 2 / 2

			style.angle = math.pi * 2 * time
			style.color[1] = math.sin(time * math.pi) * 255
		end,
	}
	passes[#passes + 1] = {
		pass_type = "rotated_texture",
		style_id = "sparkle_2",
		texture_id = "sparkle",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
		content_change_function = function (content, style)
			local time = (Application.time_since_launch() + 1.5) % 2 / 2

			style.angle = math.pi * 2 * time
			style.color[1] = math.sin(time * math.pi) * 255
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "header",
		text_id = "header",
		content_check_function = function (content, style)
			return not content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "header_shadow",
		text_id = "header",
		content_check_function = function (content, style)
			return not content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "sub_header",
		text_id = "sub_header",
		content_check_function = function (content, style)
			return not content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "sub_header_shadow",
		text_id = "sub_header",
		content_check_function = function (content, style)
			return not content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "player_name",
		text_id = "player_name",
		content_change_function = function (content)
			local widget_offset = content.widget_offset

			if not widget_offset then
				return
			end

			local camera = award_data.camera
			local world_pos = award_data.world_pos
			local pos = Camera.world_to_screen(camera, Vector3(world_pos[1], world_pos[2], world_pos[3]))

			pos = UIInverseScaleVectorToResolution(pos, true)
			widget_offset[1] = pos[1] - 145
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "player_name_shadow",
		text_id = "player_name_shadow",
		content_change_function = function (content)
			local widget_offset = content.widget_offset

			if not widget_offset then
				return
			end

			local camera = award_data.camera
			local world_pos = award_data.world_pos
			local pos = Camera.world_to_screen(camera, Vector3(world_pos[1], world_pos[2], world_pos[3]))

			pos = UIInverseScaleVectorToResolution(pos, true)
			widget_offset[1] = pos[1] - 145
		end,
	}
	passes[#passes + 1] = {
		content_id = "insignia_main",
		pass_type = "texture_uv",
		style_id = "insignia_main",
		content_check_function = function (content, style)
			return content.parent.level > 0
		end,
	}
	passes[#passes + 1] = {
		content_id = "divider",
		pass_type = "texture_uv",
		style_id = "divider",
	}
	passes[#passes + 1] = {
		content_id = "insignia_addon",
		pass_type = "texture_uv",
		style_id = "insignia_addon",
		content_check_function = function (content, style)
			return content.uvs and content.parent.level > 0
		end,
	}
	style.mvp = {
		dynamic_font_size = true,
		font_size = 80,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "top",
		area_size = {
			200,
			100,
		},
		text_color = Colors.get_color_table_with_alpha("dark_golden_rod", 255),
		offset = {
			60,
			-25,
			1,
		},
	}
	style.mvp_masked = {
		dynamic_font_size = true,
		font_size = 80,
		font_type = "hell_shark_header_masked",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "top",
		area_size = {
			200,
			100,
		},
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			60,
			-25,
			2,
		},
	}
	style.mvp_shadow = {
		dynamic_font_size = true,
		font_size = 80,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "top",
		area_size = {
			200,
			100,
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			62,
			-27,
			0,
		},
	}
	style.shine = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			393,
			256,
		},
		offset = {
			-393,
			0,
			10,
		},
	}
	style.sparkle = {
		angle = 0,
		horizontal_alignment = "left",
		vertical_alignment = "bottom",
		texture_size = {
			128,
			128,
		},
		pivot = {
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
			-10,
			5,
		},
	}
	style.sparkle_2 = {
		angle = 0,
		horizontal_alignment = "left",
		vertical_alignment = "bottom",
		texture_size = {
			128,
			128,
		},
		pivot = {
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
			130,
			15,
			5,
		},
	}
	style.header = {
		dynamic_font_size = true,
		font_size = 48,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "top",
		area_size = {
			200,
			100,
		},
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			60,
			-25,
			1,
		},
	}
	style.header_shadow = {
		dynamic_font_size = true,
		font_size = 48,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "top",
		area_size = {
			200,
			100,
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			62,
			-27,
			0,
		},
	}
	style.sub_header = {
		dynamic_font_size = true,
		font_size = 22,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "bottom",
		area_size = {
			200,
			100,
		},
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			60,
			45,
			1,
		},
	}
	style.sub_header_shadow = {
		dynamic_font_size = true,
		font_size = 22,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "bottom",
		area_size = {
			200,
			100,
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			62,
			43,
			0,
		},
	}
	style.player_name = {
		dynamic_font_size = true,
		font_size = 26,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "bottom",
		area_size = {
			200,
			100,
		},
		text_color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			60,
			5,
			1,
		},
	}
	style.player_name_shadow = {
		dynamic_font_size = true,
		font_size = 26,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "bottom",
		area_size = {
			200,
			100,
		},
		text_color = {
			255,
			0,
			0,
			0,
		},
		offset = {
			62,
			3,
			0,
		},
	}
	style.insignia_main = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = texture_size,
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
	style.divider = {
		horizontal_alignment = "left",
		vertical_alignment = "bottom",
		texture_size = {
			152,
			2,
		},
		color = team_color or {
			255,
			255,
			255,
			255,
		},
		offset = {
			60,
			40,
			1,
		},
	}
	style.insignia_addon = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = texture_size,
		color = {
			255,
			255,
			255,
			255,
		},
	}
	content.insignia_main = {
		texture_id = "insignias_main_small",
		uvs = insignia_main_uvs,
	}
	content.insignia_addon = {
		texture_id = "insignias_addon_small",
		uvs = insignia_addon_uvs,
	}
	content.level = level
	content.award_data = award_data
	content.divider = {
		texture_id = "horizontal_gradient",
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
	content.is_mvp = is_mvp
	content.mvp = Localize("vs_award_mvp_name")
	content.header = header
	content.sub_header = sub_header
	content.player_name = (is_you and "{#color(255,255,255)}(" .. Localize("versus_hero_selection_view_you") .. ") {#reset()}" or "") .. string.format("{#color(%d,%d,%d)}%s{#reset()}", team_color[2], team_color[3], team_color[4], UIRenderer.crop_text(player_name, is_you and 10 or 17))
	content.player_name_shadow = (is_you and "(" .. Localize("versus_hero_selection_view_you") .. ") " or "") .. string.format("%s", UIRenderer.crop_text(player_name, is_you and 10 or 17))
	content.shine = "diagonal_shine"
	content.sparkle = "sparkle_effect"
	widget_def.element = element
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset or {
		0,
		0,
		0,
	}

	return widget_def
end

local amount_text_style = {
	dynamic_font_size = false,
	font_size = 130,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	vertical_alignment = "top",
	area_size = {
		500,
		200,
	},
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		20,
		-130,
		1,
	},
}

UIWidgets.create_screen_ceremony_award = function (scenegraph_id, award_data, offset, ui_renderer)
	local widget_def = {}
	local element = {
		passes = {},
	}
	local passes = element.passes
	local content = {}
	local style = {}
	local player_name = award_data.player_name
	local level = award_data.level
	local amount = award_data.amount
	local is_you = award_data.peer_id == Network.peer_id()
	local is_mvp = award_data.is_mvp
	local is_local = award_data.is_local
	local header = award_data.header
	local award_material = award_data.award_material or "circle"
	local award_mask_material = award_data.award_mask_material or nil
	local sub_header = is_mvp and Localize("vs_award_mvp_sub_header") or award_data.sub_header
	local team_color = award_data.team_color
	local insignia_main_uvs, insignia_addon_uvs = UIAtlasHelper.get_insignia_texture_settings_from_level(level)
	local texture_size = {
		50,
		138,
	}
	local text_width = UIUtils.get_text_width(ui_renderer, amount_text_style, amount)

	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "mvp",
		text_id = "mvp",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "mvp_masked",
		text_id = "mvp",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "shine",
		texture_id = "shine",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
		content_change_function = function (content, style)
			local t = content.shine_timer
			local delta = t % 2 / 2

			style.offset[1] = math.lerp(-393, 393, delta)
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "mvp_shadow",
		text_id = "mvp",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "rotated_texture",
		style_id = "sparkle",
		texture_id = "sparkle",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
		content_change_function = function (content, style)
			local time = Application.time_since_launch() % 2 / 2

			style.angle = math.pi * 2 * time
			style.color[1] = math.sin(time * math.pi) * 255
		end,
	}
	passes[#passes + 1] = {
		pass_type = "rotated_texture",
		style_id = "sparkle_2",
		texture_id = "sparkle",
		content_check_function = function (content, style)
			return content.is_mvp
		end,
		content_change_function = function (content, style)
			local time = (Application.time_since_launch() + 1) % 2 / 2

			style.angle = math.pi * 2 * time
			style.color[1] = math.sin(time * math.pi) * 255
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "background",
		texture_id = "background",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "award",
		texture_id = "award_texture",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "award_shine_mask",
		texture_id = "award_shine_mask",
		content_change_function = function (content, style)
			local t = content.shine_timer
			local delta = t % 2 / 2

			style.offset[1] = math.lerp(-393, 393, delta)

			local _, dt = Managers.time:time_and_delta("main")

			content.shine_timer = content.shine_timer + dt
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "award_shine",
		texture_id = "award_shine",
		content_check_function = function (content)
			return content.award_shine
		end,
	}
	passes[#passes + 1] = {
		content_id = "team_bg",
		pass_type = "texture_uv",
		style_id = "team_bg",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "frame_top",
		texture_id = "frame",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "frame_bottom",
		texture_id = "frame",
	}
	passes[#passes + 1] = {
		pass_type = "rotated_texture",
		style_id = "frame_right",
		texture_id = "frame",
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		style_id = "frame_middle",
		texture_id = "frame",
	}
	passes[#passes + 1] = {
		content_id = "insignia_main",
		pass_type = "texture_uv",
		style_id = "insignia_main",
		content_check_function = function (content, style)
			return content.parent.level > 0
		end,
	}
	passes[#passes + 1] = {
		content_id = "insignia_addon",
		pass_type = "texture_uv",
		style_id = "insignia_addon",
		content_check_function = function (content, style)
			return content.uvs and content.parent.level > 0
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "header",
		text_id = "header",
		content_check_function = function (content, style)
			return not content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "header_shadow",
		text_id = "header",
		content_check_function = function (content, style)
			return not content.is_mvp
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "sub_header",
		text_id = "sub_header",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "sub_header_shadow",
		text_id = "sub_header",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "player_name",
		text_id = "player_name",
	}
	passes[#passes + 1] = {
		pass_type = "text",
		style_id = "player_name_shadow",
		text_id = "player_name_shadow",
	}
	style.mvp = {
		dynamic_font_size = false,
		font_size = 100,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "top",
		area_size = {
			500,
			200,
		},
		text_color = Colors.get_color_table_with_alpha("dark_golden_rod", 255),
		offset = {
			210,
			-70,
			1,
		},
	}
	style.mvp_masked = {
		dynamic_font_size = false,
		font_size = 100,
		font_type = "hell_shark_header_masked",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "top",
		area_size = {
			500,
			200,
		},
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			210,
			-70,
			2,
		},
	}
	style.mvp_shadow = {
		dynamic_font_size = false,
		font_size = 100,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "top",
		area_size = {
			500,
			200,
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			212,
			-72,
			0,
		},
	}
	style.shine = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			393,
			256,
		},
		offset = {
			-183,
			-70,
			10,
		},
	}
	style.sparkle = {
		angle = 0,
		horizontal_alignment = "left",
		vertical_alignment = "bottom",
		texture_size = {
			128,
			128,
		},
		pivot = {
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
			160,
			95,
			5,
		},
	}
	style.sparkle_2 = {
		angle = 0,
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			128,
			128,
		},
		pivot = {
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
			310,
			-20,
			5,
		},
	}
	style.background = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			450,
			160,
		},
		offset = {
			110,
			-70,
			0,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	style.award = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			225,
			230,
		},
		offset = {
			-15,
			-35,
			10,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	style.award_shine = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			225,
			230,
		},
		offset = {
			-15,
			-35,
			11,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	style.award_shine_mask = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			393,
			256,
		},
		offset = {
			-15,
			-22,
			12,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	style.team_bg = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			450,
			50,
		},
		offset = {
			110,
			-180,
			1,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}

	local thickness = 20

	style.frame_top = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			450,
			thickness,
		},
		offset = {
			110,
			-70 + thickness,
			3,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	style.frame_bottom = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			450,
			thickness,
		},
		offset = {
			110,
			-230 + thickness,
			3,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	style.frame_right = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			156,
			thickness,
		},
		offset = {
			404,
			-70 + thickness,
			4,
		},
		angle = -math.pi * 0.5,
		pivot = {
			156,
			0,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	style.frame_middle = {
		horizontal_alignment = "left",
		vertical_alignment = "top",
		texture_size = {
			446,
			thickness,
		},
		offset = {
			110,
			-180 + thickness,
			3,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}
	style.insignia_main = {
		horizontal_alignment = "right",
		vertical_alignment = "top",
		texture_size = {
			50,
			138,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			50,
			-70,
			10,
		},
	}
	style.insignia_addon = {
		horizontal_alignment = "right",
		vertical_alignment = "top",
		texture_size = {
			50,
			138,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			50,
			-70,
			9,
		},
	}

	local stupid_offset = UTF8Utils.string_length(header) > 10 and 15 or 0

	style.header = {
		dynamic_font_size = true,
		font_size = 65,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "bottom",
		area_size = {
			255,
			200,
		},
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			215,
			140 + stupid_offset,
			3,
		},
	}
	style.header_shadow = {
		dynamic_font_size = true,
		font_size = 65,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "bottom",
		area_size = {
			255,
			200,
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			213,
			138 + stupid_offset,
			2,
		},
	}
	style.sub_header = {
		dynamic_font_size = true,
		font_size = 30,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "bottom",
		word_wrap = false,
		area_size = {
			255,
			200,
		},
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			220,
			120 + stupid_offset * 0.5,
			3,
		},
	}
	style.sub_header_shadow = {
		dynamic_font_size = true,
		font_size = 30,
		font_type = "hell_shark_header",
		horizontal_alignment = "left",
		localize = false,
		upper_case = true,
		vertical_alignment = "bottom",
		word_wrap = false,
		area_size = {
			255,
			200,
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			222,
			118 + stupid_offset * 0.5,
			2,
		},
	}
	style.player_name = {
		dynamic_font_size = true,
		font_size = 30,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "bottom",
		area_size = {
			500,
			100,
		},
		text_color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			220,
			80,
			3,
		},
	}
	style.player_name_shadow = {
		dynamic_font_size = true,
		font_size = 30,
		font_type = "hell_shark",
		horizontal_alignment = "left",
		localize = false,
		vertical_alignment = "bottom",
		area_size = {
			500,
			200,
		},
		text_color = {
			255,
			0,
			0,
			0,
		},
		offset = {
			222,
			78,
			2,
		},
	}
	content.insignia_main = {
		texture_id = "insignias_main_small",
		uvs = insignia_main_uvs,
	}
	content.insignia_addon = {
		texture_id = "insignias_addon_small",
		uvs = insignia_addon_uvs,
	}
	content.level = level
	content.award_data = award_data
	content.divider = {
		texture_id = "horizontal_gradient",
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
	content.is_mvp = is_mvp
	content.mvp = Localize("vs_award_mvp_name")
	content.header = header
	content.sub_header = sub_header
	content.player_name = (is_you and "{#color(128,128,128)}(" .. Localize("versus_hero_selection_view_you") .. ") {#reset()}" or "") .. string.format("{#color(%d,%d,%d)}%s{#reset()}", team_color[2], team_color[3], team_color[4], UIRenderer.crop_text(player_name, is_you and 10 or 17))
	content.player_name_shadow = (is_you and "(" .. Localize("versus_hero_selection_view_you") .. ") " or "") .. string.format("%s", UIRenderer.crop_text(player_name, is_you and 10 or 17))
	content.shine = "diagonal_shine"
	content.award_shine_mask = "diagonal_shine_write_mask"
	content.award_shine = award_mask_material
	content.amount = amount
	content.sparkle = "sparkle_effect"
	content.shine_timer = 0
	content.background = "award_bg"
	content.award_texture = award_material
	content.team_bg = {
		uvs = {
			{
				0,
				0.3125,
			},
			{
				0.9,
				1,
			},
		},
		texture_id = is_local and "award_bg_local_team" or "award_bg_opponent_team",
	}
	content.frame = "divider_01_bottom"
	widget_def.element = element
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset or {
		0,
		0,
		0,
	}

	return widget_def
end

UIWidgets.create_dark_pact_hud_ability_icon_widget = function (scenegraph_id, settings)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_icon_bg",
					texture_id = "texture_icon",
				},
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
					content_check_function = function (content)
						return content.is_cooldown
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_mask",
					texture_id = "icon_mask",
					content_change_function = function (content, style, _, dt)
						style.color[1] = 255 * math.abs(math.sin(Managers.time:time("ui") * 2.5))
					end,
				},
				{
					pass_type = "texture",
					style_id = "texture_frame",
					texture_id = "texture_frame",
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "texture_cooldown",
					texture_id = "texture_cooldown",
					content_check_function = function (content)
						return content.is_cooldown
					end,
					content_change_function = function (content, style, _, dt)
						style.color[1] = 255 * math.abs(math.sin(Managers.time:time("ui") * 2.5))
					end,
				},
				{
					pass_type = "text",
					style_id = "input",
					text_id = "input",
					content_change_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")
						local input = gamepad_active and content.settings.gamepad_input or content.settings.input_action

						if content.current_input_action ~= input then
							content.current_input_action = input

							local input_service = Managers.input:get_service("Player")
							local _, input_text, keymap_binding = UISettings.get_gamepad_input_texture_data(input_service, input, gamepad_active)

							if keymap_binding and keymap_binding[1] == "mouse" or gamepad_active then
								content.input = string.format("$KEY;Player__%s:", input)
								style.offset[1] = 68
							else
								content.input = input_text
								style.offset[1] = 40
							end
						end
					end,
				},
			},
		},
		content = {
			gris = "rect_masked",
			icon_mask = "dark_pact_ability_icon_gradient_mask",
			input = "n/a",
			is_cooldown = false,
			progress = 0,
			set_unsaturated = false,
			texture_cooldown = "dark_pact_ability_icon_cooldown_gradient",
			texture_frame = "health_bar_ability_icon_frame",
			texture_icon = settings and settings.icon or "icons_placeholder",
			settings = settings or {},
		},
		style = {
			texture_icon_bg = {
				saturated = false,
				size = {
					56,
					56,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					12,
					14,
					1,
				},
			},
			texture_icon = {
				masked = true,
				saturated = false,
				size = {
					56,
					56,
				},
				color = {
					255,
					100,
					100,
					100,
				},
				offset = {
					12,
					14,
					2,
				},
			},
			icon_mask = {
				size = {
					56,
					56,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					12,
					14,
					2,
				},
			},
			texture_cooldown = {
				size = {
					56,
					56,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					12,
					14,
					3,
				},
			},
			texture_frame = {
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
					0,
					0,
					4,
				},
			},
			input = {
				font_size = 26,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = false,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					0,
					0,
				},
				area_size = {
					20,
					20,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					68,
					100,
					6,
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

UIWidgets.create_dark_pact_selection_widget = function (scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "portrait_frame",
					texture_id = "portrait_frame",
				},
				{
					pass_type = "texture",
					style_id = "portrait",
					texture_id = "portrait",
				},
				{
					pass_type = "texture",
					style_id = "portrait_frame_selected",
					texture_id = "portrait_frame_selected",
				},
				{
					content_id = "hotspot",
					pass_type = "hotspot",
					style_id = "hotspot",
				},
			},
		},
		content = {
			portrait = "icons_placeholder",
			portrait_frame = "pactsworn_frame_iron",
			portrait_frame_selected = "pactsworn_frame_highlight",
			selected = false,
			hotspot = {},
		},
		style = {
			portrait = {
				texture_size = {
					140,
					140,
				},
				default_size = {
					140,
					140,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					3,
				},
				default_offset = {
					0,
					0,
					3,
				},
			},
			portrait_frame = {
				texture_size = {
					140,
					140,
				},
				default_size = {
					140,
					140,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					5,
				},
				default_offset = {
					0,
					0,
					5,
				},
			},
			hotspot = {
				size = {
					140,
					140,
				},
				default_size = {
					140,
					140,
				},
				offset = {
					0,
					0,
					3,
				},
				default_offset = {
					0,
					0,
					3,
				},
			},
			portrait_frame_selected = {
				texture_size = {
					168,
					168,
				},
				default_size = {
					168,
					168,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-14,
					-14,
					10,
				},
				default_offset = {
					-14,
					-14,
					10,
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

UIWidgets.create_settings_stepper_widget = function (scenegraph_id, data, ui_data, start_value, start_idx, setting_id, on_setting_changed_cb)
	local settings = data.values or {}
	local num_settings = #settings or 0
	local setting_name = "menu_settings_" .. data.setting_name
	local tooltip_text = "tooltip_" .. data.setting_name
	local reset_button_size = {
		24,
		24,
	}
	local stepper_arrow_size = {
		32,
		32,
	}

	local function update_hotspot(content, style, dt)
		local parent = content.parent
		local hover_progress = content.hover_progress or 0
		local hover_speed = 15

		if parent.can_hover and content.is_hover then
			hover_progress = math.min(hover_progress + dt * hover_speed, 1)
		else
			hover_progress = math.max(hover_progress - dt * hover_speed, 0)
		end

		content.hover_progress = hover_progress

		local press_progress = content.press_progress or 1
		local press_speed = 25

		if parent.can_hover and content.is_held then
			press_progress = math.max(press_progress - dt * press_speed, 0.5)
		else
			press_progress = math.min(press_progress + dt * press_speed, 1)
		end

		content.press_progress = press_progress
	end

	local function animate_button(content, style, hotspot, dt)
		local hover_progress = hotspot.hover_progress or 0
		local press_progress = hotspot.press_progress or 1

		style.color[1] = 255 * hover_progress

		if content.can_hover and hotspot.is_hover then
			style.color[1] = 255 * press_progress
		end
	end

	local definition = {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "setting_name",
					text_id = "setting_name",
					content_change_function = function (content, style, _, dt)
						local fade_progress = content.fade_progress or 0

						style.text_color[1] = 100 + 155 * fade_progress
					end,
				},
				{
					content_id = "left_arrow",
					pass_type = "texture_uv",
					style_id = "left_arrow",
					content_change_function = function (content, style, _, dt)
						local fade_progress = content.parent.fade_progress or 0

						style.color[1] = 100 + 155 * fade_progress
					end,
				},
				{
					content_id = "left_arrow_hover",
					pass_type = "texture_uv",
					style_id = "left_arrow_hover",
					content_check_function = function (content, style)
						local parent = content.parent

						return parent.is_server
					end,
					content_change_function = function (content, style, _, dt)
						local parent = content.parent
						local hotspot = parent.left_arrow_hotspot

						animate_button(content, style, hotspot)
					end,
				},
				{
					content_id = "left_arrow_hotspot",
					pass_type = "hotspot",
					style_id = "left_arrow_hotspot",
					content_check_function = function (content, style)
						return content.parent.is_server and content.parent.focused
					end,
					content_change_function = function (content, style, _, dt)
						local parent = content.parent

						update_hotspot(content, style, dt)
					end,
				},
				{
					pass_type = "texture",
					style_id = "setting_value_bg",
					texture_id = "setting_value_bg",
				},
				{
					pass_type = "text",
					style_id = "setting_value",
					text_id = "setting_value",
					content_change_function = function (content, style, _, dt)
						local values = content.data.values
						local ui_data = content.ui_data
						local setting_idx = content.setting_idx
						local new_value = values[setting_idx]

						if content.value ~= new_value then
							content.value = new_value

							local localization_options = ui_data and ui_data.localization_options
							local value_text = ""

							if localization_options and localization_options[new_value] then
								local text = localization_options[new_value]

								value_text = Localize(text)
							else
								value_text = string.format("%s", content.value)
							end

							if (not localization_options or not localization_options[new_value]) and ui_data and ui_data.setting_type then
								local value_suffixes = DLCSettings.carousel and DLCSettings.carousel.custom_game_settigns_values_suffix

								if value_suffixes and value_suffixes[ui_data.setting_type] then
									value_text = value_text .. value_suffixes[ui_data.setting_type]
								end
							end

							content.setting_value = value_text
						end

						if content.value ~= content.default_value then
							style.text_color = style.modified_color
						else
							style.text_color = style.default_color
						end

						local fade_progress = content.fade_progress or 0

						style.text_color[1] = 100 + 155 * fade_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "right_arrow",
					texture_id = "right_arrow",
					content_change_function = function (content, style, _, dt)
						local fade_progress = content.fade_progress or 0

						style.color[1] = 100 + 155 * fade_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "right_arrow_hover",
					texture_id = "right_arrow_hover",
					content_check_function = function (content, style)
						return content.is_server
					end,
					content_change_function = function (content, style, _, dt)
						local hotspot = content.right_arrow_hotspot

						animate_button(content, style, hotspot)
					end,
				},
				{
					content_id = "right_arrow_hotspot",
					pass_type = "hotspot",
					style_id = "right_arrow_hotspot",
					content_check_function = function (content, style)
						return content.parent.is_server and content.parent.focused
					end,
					content_change_function = function (content, style, _, dt)
						local parent = content.parent

						update_hotspot(content, style, dt)
					end,
				},
				{
					pass_type = "texture",
					style_id = "divider",
					texture_id = "divider",
				},
				{
					content_id = "setting_highlight_hotspot",
					pass_type = "hotspot",
					style_id = "setting_highlight_hotspot",
					content_change_function = function (content, style, _, dt)
						local hover_progress = content.hover_progress or 0
						local hover_speed = 15

						if content.parent.can_hover and content.is_hover or content.parent.is_gamepad_active and content.parent.focused and content.parent.is_selected then
							hover_progress = math.min(hover_progress + dt * hover_speed, 1)
						else
							hover_progress = math.max(hover_progress - dt * hover_speed, 0)
						end

						content.hover_progress = hover_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "setting_highlight",
					texture_id = "setting_highlight",
					content_change_function = function (content, style, _, dt)
						local hover_progress = content.setting_highlight_hotspot.hover_progress or 0

						style.color[1] = 255 * hover_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "reset_setting_button",
					texture_id = "reset_setting_button",
					content_check_function = function (content, style)
						local values = content.data.values
						local ui_data = content.ui_data
						local setting_has_changed = content.value ~= content.default_value

						return setting_has_changed and content.is_server and not content.is_gamepad_active
					end,
				},
				{
					pass_type = "texture",
					style_id = "reset_setting_button_hovered",
					texture_id = "reset_setting_button_hovered",
					content_check_function = function (content, style)
						local values = content.data.values
						local ui_data = content.ui_data
						local setting_has_changed = content.value ~= content.default_value

						return setting_has_changed and content.is_server and not content.is_gamepad_active and content.focused
					end,
					content_change_function = function (content, style, _, dt)
						local hotspot = content.reset_setting_button_hotspot

						animate_button(content, style, hotspot)
					end,
				},
				{
					content_id = "reset_setting_button_hotspot",
					pass_type = "hotspot",
					style_id = "reset_setting_button_hotspot",
					content_check_function = function (content, style)
						local parent = content.parent
						local values = parent.data.values
						local ui_data = parent.ui_data
						local setting_idx = parent.setting_idx
						local default_idx = parent.default_idx
						local setting_has_changed = parent.value ~= parent.default_value

						return setting_has_changed and parent.is_server and not parent.is_gamepad_active
					end,
					content_change_function = function (content, style, _, dt)
						local parent = content.parent

						update_hotspot(content, style, dt)
					end,
				},
				{
					pass_type = "option_tooltip",
					style_id = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (content, style)
						return content.can_hover and content.setting_highlight_hotspot.is_hover
					end,
				},
			},
		},
		content = {
			default_idx = 1,
			default_value = 0,
			divider = "rect_masked",
			reset_setting_button = "achievement_refresh_off",
			reset_setting_button_hovered = "achievement_refresh_on",
			right_arrow = "arrow_off_01",
			right_arrow_hover = "arrow_on",
			setting_highlight = "party_selection_glow",
			setting_value_bg = "rect_masked",
			data = data,
			ui_data = ui_data,
			id = setting_id,
			name = data.setting_name,
			on_setting_changed_cb = on_setting_changed_cb,
			settings = settings,
			num_settings = num_settings,
			setting_idx = start_idx,
			setting_value = tostring(start_value),
			setting_name = setting_name,
			left_arrow = {
				texture_id = "arrow_off_01",
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
			left_arrow_hover = {
				texture_id = "arrow_on",
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
			left_arrow_hotspot = {
				allow_multi_hover = true,
			},
			right_arrow_hotspot = {
				allow_multi_hover = true,
			},
			setting_highlight_hotspot = {
				allow_multi_hover = true,
			},
			reset_setting_button_hotspot = {
				allow_multi_hover = true,
			},
			tooltip_text = tooltip_text,
		},
		style = {
			setting_name = {
				font_size = 20,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				masked = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					380,
					30,
				},
				area_size = {
					380,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					3,
				},
			},
			left_arrow = {
				masked = true,
				texture_size = stepper_arrow_size,
				offset = {
					398,
					0,
					3,
				},
				color = Colors.get_color_table_with_alpha("white", 120),
			},
			left_arrow_hover = {
				masked = true,
				texture_size = stepper_arrow_size,
				offset = {
					398,
					0,
					5,
				},
				color = Colors.get_color_table_with_alpha("white", 120),
			},
			left_arrow_hotspot = {
				size = stepper_arrow_size,
				offset = {
					398,
					0,
					3,
				},
			},
			setting_value_bg = {
				masked = true,
				size = {
					128,
					30,
				},
				offset = {
					430,
					0,
					4,
				},
				color = Colors.get_color_table_with_alpha("black", 120),
			},
			setting_value = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				masked = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					128,
					30,
				},
				area_size = {
					128,
					30,
				},
				modified_color = Colors.get_color_table_with_alpha("pale_golden_rod", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 180),
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					430,
					0,
					5,
				},
			},
			right_arrow = {
				masked = true,
				texture_size = stepper_arrow_size,
				offset = {
					560,
					0,
					3,
				},
				color = Colors.get_color_table_with_alpha("white", 120),
			},
			right_arrow_hover = {
				masked = true,
				texture_size = stepper_arrow_size,
				offset = {
					560,
					0,
					4,
				},
				color = Colors.get_color_table_with_alpha("white", 120),
			},
			right_arrow_hotspot = {
				size = stepper_arrow_size,
				offset = {
					560,
					0,
					3,
				},
			},
			divider = {
				masked = true,
				size = {
					620,
					2,
				},
				offset = {
					0,
					-2,
					1,
				},
				color = Colors.get_color_table_with_alpha("gray", 100),
			},
			setting_highlight_hotspot = {
				size = {
					640,
					34,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			setting_highlight = {
				masked = true,
				texture_size = {
					640,
					34,
				},
				offset = {
					0,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			reset_setting_button = {
				masked = true,
				texture_size = reset_button_size,
				offset = {
					594,
					4,
					3,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			reset_setting_button_hovered = {
				masked = true,
				texture_size = reset_button_size,
				offset = {
					594,
					4,
					4,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			reset_setting_button_hotspot = {
				size = reset_button_size,
				offset = {
					594,
					4,
					1,
				},
			},
			tooltip_text = {
				font_size = 24,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					180,
					30,
				},
				area_size = {
					180,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
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
			1,
		},
		scenegraph_id = scenegraph_id,
	}

	return definition
end

UIWidgets.create_settings_slider_widget = function (scenegraph_id, data, ui_data, start_value, start_idx, setting_id, on_setting_changed_cb)
	local settings = data.values or {}
	local num_settings = #settings or 1
	local setting_name = "menu_settings_" .. data.setting_name
	local tooltip_text = "tooltip_" .. data.setting_name
	local reset_button_size = {
		24,
		24,
	}
	local setting_value_size = {
		100,
		30,
	}
	local slider_size = {
		200,
		8,
	}
	local min_offset = 640 - slider_size[1] - 138 + 8
	local max_offset = min_offset + slider_size[1]
	local background_frame_settings = UIFrameSettings.button_frame_02
	local slider_button_size = {
		11.9,
		22.95,
	}
	local slider_button_hovered_size = {
		28.9,
		21.25,
	}
	local setting_idx = start_idx
	local start_slider_value = math.clamp(setting_idx / num_settings, 0, 1)

	local function update_hotspot(content, style, dt)
		local parent = content.parent
		local hover_progress = content.hover_progress or 0
		local hover_speed = 15

		if parent.can_hover and content.is_hover then
			hover_progress = math.min(hover_progress + dt * hover_speed, 1)
		else
			hover_progress = math.max(hover_progress - dt * hover_speed, 0)
		end

		content.hover_progress = hover_progress

		local press_progress = content.press_progress or 1
		local press_speed = 25

		if parent.can_hover and content.is_held then
			press_progress = math.max(press_progress - dt * press_speed, 0.5)
		else
			press_progress = math.min(press_progress + dt * press_speed, 1)
		end

		content.press_progress = press_progress
	end

	local function animate_button(content, style, hotspot, dt)
		local hover_progress = hotspot.hover_progress or 0
		local press_progress = hotspot.press_progress or 1

		style.color[1] = 255 * hover_progress

		if content.can_hover and hotspot.is_hover then
			style.color[1] = 255 * press_progress
		end
	end

	local definition = {
		element = {
			passes = {
				{
					pass_type = "text",
					style_id = "setting_name",
					text_id = "setting_name",
					content_change_function = function (content, style, _, dt)
						local fade_progress = content.fade_progress or 0

						style.text_color[1] = 100 + 155 * fade_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "setting_value_bg",
					texture_id = "setting_value_bg",
				},
				{
					pass_type = "text",
					style_id = "setting_value",
					text_id = "setting_value",
					content_change_function = function (content, style, _, dt)
						local values = content.data.values
						local ui_data = content.ui_data
						local setting_idx = content.setting_idx
						local new_value = values[setting_idx]

						if content.value ~= new_value then
							content.value = new_value

							local localization_options = ui_data and ui_data.localization_options
							local value_text = ""

							if localization_options and localization_options[new_value] then
								local text = localization_options[new_value]

								value_text = Localize(text)
							elseif type(content.value) == "number" and ui_data and ui_data.setting_type == "multiplier" then
								value_text = string.format("%.2f", content.value)
							else
								value_text = string.format("%s", content.value)
							end

							if (not localization_options or not localization_options[new_value]) and ui_data and ui_data.setting_type then
								local value_suffixes = DLCSettings.carousel and DLCSettings.carousel.custom_game_settigns_values_suffix

								if value_suffixes and value_suffixes[ui_data.setting_type] then
									value_text = value_text .. value_suffixes[ui_data.setting_type]
								end
							end

							content.setting_value = value_text
						end

						if content.value ~= content.default_value then
							style.text_color = style.modified_color
						else
							style.text_color = style.default_color
						end

						local fade_progress = content.fade_progress or 0

						style.text_color[1] = 100 + 155 * fade_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "divider",
					texture_id = "divider",
				},
				{
					content_id = "setting_highlight_hotspot",
					pass_type = "hotspot",
					style_id = "setting_highlight_hotspot",
					content_change_function = function (content, style, _, dt)
						local hover_progress = content.hover_progress or 0
						local hover_speed = 15

						if content.parent.can_hover and content.is_hover or content.parent.is_gamepad_active and content.parent.focused and content.parent.is_selected then
							hover_progress = math.min(hover_progress + dt * hover_speed, 1)
						else
							hover_progress = math.max(hover_progress - dt * hover_speed, 0)
						end

						content.hover_progress = hover_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "setting_highlight",
					texture_id = "setting_highlight",
					content_change_function = function (content, style, _, dt)
						local hover_progress = content.setting_highlight_hotspot.hover_progress or 0

						style.color[1] = 255 * hover_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "reset_setting_button",
					texture_id = "reset_setting_button",
					content_check_function = function (content, style)
						local values = content.data.values
						local ui_data = content.ui_data
						local setting_has_changed = content.value ~= content.default_value

						return setting_has_changed and content.is_server and not content.is_gamepad_active
					end,
				},
				{
					pass_type = "texture",
					style_id = "reset_setting_button_hovered",
					texture_id = "reset_setting_button_hovered",
					content_check_function = function (content, style)
						local values = content.data.values
						local ui_data = content.ui_data
						local setting_has_changed = content.value ~= content.default_value

						return setting_has_changed and content.is_server and not content.is_gamepad_active and content.focused
					end,
					content_change_function = function (content, style, _, dt)
						local hotspot = content.reset_setting_button_hotspot

						animate_button(content, style, hotspot)
					end,
				},
				{
					content_id = "reset_setting_button_hotspot",
					pass_type = "hotspot",
					style_id = "reset_setting_button_hotspot",
					content_check_function = function (content, style)
						local parent = content.parent
						local values = parent.data.values
						local ui_data = parent.ui_data
						local setting_idx = parent.setting_idx
						local default_idx = parent.default_idx
						local setting_has_changed = parent.value ~= parent.default_value

						return setting_has_changed and parent.is_server and not parent.is_gamepad_active
					end,
					content_change_function = function (content, style, _, dt)
						local parent = content.parent

						update_hotspot(content, style, dt)
					end,
				},
				{
					pass_type = "option_tooltip",
					style_id = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (content, style)
						return content.can_hover and content.setting_highlight_hotspot.is_hover
					end,
				},
				{
					pass_type = "texture",
					style_id = "slider_background",
					texture_id = "slider_background",
				},
				{
					pass_type = "texture_frame",
					style_id = "background_frame",
					texture_id = "background_frame",
				},
				{
					pass_type = "texture",
					style_id = "slider_button",
					texture_id = "slider_button",
					content_check_function = function (content, style)
						return true
					end,
				},
				{
					pass_type = "texture",
					style_id = "slider_button_hovered",
					texture_id = "slider_button_hovered",
					content_check_function = function (content, style)
						return content.can_hover and content.slider_button_hotspot.is_hover
					end,
				},
				{
					content_check_hover = "slider_button_hotspot",
					pass_type = "held",
					style_id = "slider_background",
					held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						if gamepad_active then
							return
						end

						if not ui_content.can_hover then
							return
						end

						local cursor = UIInverseScaleVectorToResolution(input_service:get("cursor"))
						local scenegraph_id = ui_content.scenegraph_id
						local world_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)
						local size_x = ui_style.size[1]
						local cursor_x = cursor[1]
						local pos_start = world_position[1] + ui_style.offset[1] + 20
						local cursor_x_norm = cursor_x - pos_start
						local value = math.clamp(cursor_x_norm / size_x, 0, 1)

						ui_content.current_slider_value = value
					end,
					release_function = function (ui_scenegraph, ui_style, ui_content, input_service)
						local setting_id = ui_content.id
						local new_idx = ui_content.setting_idx

						ui_content.on_setting_changed_cb(setting_id, new_idx)
					end,
				},
				{
					content_id = "slider_button_hotspot",
					pass_type = "hotspot",
					style_id = "slider_button_hotspot",
					content_check_function = function (content, style)
						return content.parent.can_hover and content.parent.is_server and content.parent.focused
					end,
				},
				{
					pass_type = "local_offset",
					offset_function = function (ui_scenegraph, ui_style, ui_content)
						local internal_value = ui_content.current_slider_value
						local min = 1
						local max = ui_content.num_settings

						if not ui_content.is_gamepad_active then
							local setting_idx = math.clamp(math.round(max * internal_value), min, max)

							ui_content.setting_idx = setting_idx
						end

						local slider_box_style = ui_style.slider_background
						local slider_box_size = slider_box_style.size
						local base_offset_x = slider_box_style.offset[1]
						local size_x = slider_box_size[1] * internal_value
						local slider_icon_style = ui_style.slider_button
						local slider_icon_hover_style = ui_style.slider_button_hovered
						local slider_icon_hotspot_style = ui_style.slider_button_hotspot
						local slider_icon_offset = slider_icon_style.offset
						local slider_icon_size = slider_icon_style.texture_size
						local slider_icon_x = math.max(0, math.min(size_x - slider_icon_size[1], slider_box_size[1] - slider_icon_size[1]))

						slider_icon_style.offset[1] = base_offset_x + size_x - slider_icon_size[1] / 2
						slider_icon_hover_style.offset[1] = slider_icon_style.offset[1] + slider_icon_size[1] / 2 - slider_icon_hover_style.texture_size[1] / 2
						slider_icon_hotspot_style.offset[1] = slider_icon_style.offset[1] + slider_icon_size[1] / 2 - slider_icon_hotspot_style.size[1] / 2
					end,
				},
			},
		},
		content = {
			default_idx = 1,
			default_value = 0,
			divider = "rect_masked",
			reset_setting_button = "achievement_refresh_off",
			reset_setting_button_hovered = "achievement_refresh_on",
			setting_highlight = "party_selection_glow",
			setting_value_bg = "rect_masked",
			slider_background = "rect_masked",
			slider_button = "slider_thumb",
			slider_button_hovered = "slider_thumb_hover",
			data = data,
			ui_data = ui_data,
			id = setting_id,
			name = data.setting_name,
			on_setting_changed_cb = on_setting_changed_cb,
			settings = settings,
			num_settings = num_settings,
			setting_idx = start_idx,
			setting_value = tostring(start_value),
			setting_name = setting_name,
			setting_highlight_hotspot = {
				allow_multi_hover = true,
			},
			reset_setting_button_hotspot = {
				allow_multi_hover = true,
			},
			tooltip_text = tooltip_text,
			background_frame = background_frame_settings.texture,
			slider_button_hotspot = {
				allow_multi_hover = true,
			},
			current_slider_value = start_slider_value,
			min_offset = min_offset,
			max_offset = max_offset,
			scenegraph_id = scenegraph_id,
		},
		style = {
			setting_name = {
				dynamic_font_size = true,
				font_size = 20,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				masked = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					300,
					30,
				},
				area_size = {
					300,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					2,
					3,
				},
			},
			setting_value_bg = {
				masked = true,
				size = {
					setting_value_size[1] - 32,
					setting_value_size[2],
				},
				offset = {
					640 - setting_value_size[1] - 20,
					2,
					4,
				},
				color = Colors.get_color_table_with_alpha("black", 120),
			},
			setting_value = {
				dynamic_font_size = true,
				font_size = 22,
				font_type = "hell_shark_masked",
				horizontal_alignment = "center",
				localize = false,
				masked = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					setting_value_size[1] - 32,
					setting_value_size[2],
				},
				area_size = {
					setting_value_size[1] - 36,
					setting_value_size[2],
				},
				modified_color = Colors.get_color_table_with_alpha("pale_golden_rod", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 180),
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					640 - setting_value_size[1] - 20,
					2,
					5,
				},
			},
			divider = {
				masked = true,
				size = {
					620,
					2,
				},
				offset = {
					0,
					-2,
					1,
				},
				color = Colors.get_color_table_with_alpha("gray", 100),
			},
			setting_highlight_hotspot = {
				size = {
					640,
					34,
				},
				offset = {
					0,
					0,
					1,
				},
			},
			setting_highlight = {
				masked = true,
				texture_size = {
					640,
					34,
				},
				offset = {
					0,
					0,
					1,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			reset_setting_button = {
				masked = true,
				texture_size = reset_button_size,
				offset = {
					594,
					4,
					3,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			reset_setting_button_hovered = {
				masked = true,
				texture_size = reset_button_size,
				offset = {
					594,
					4,
					4,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			reset_setting_button_hotspot = {
				size = reset_button_size,
				offset = {
					594,
					4,
					1,
				},
			},
			tooltip_text = {
				font_size = 24,
				font_type = "hell_shark_masked",
				horizontal_alignment = "left",
				localize = true,
				upper_case = false,
				use_shadow = true,
				vertical_alignment = "center",
				size = {
					180,
					30,
				},
				area_size = {
					180,
					30,
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					4,
					1,
				},
			},
			slider_background = {
				masked = true,
				size = slider_size,
				offset = {
					min_offset,
					8,
					5,
				},
				color = Colors.get_color_table_with_alpha("black", 255),
			},
			background_frame = {
				masked = true,
				frame_margins = {
					-3,
					-3,
				},
				size = slider_size,
				texture_size = background_frame_settings.texture_size,
				texture_sizes = background_frame_settings.texture_sizes,
				offset = {
					min_offset,
					8,
					6,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			slider_button = {
				masked = true,
				texture_size = slider_button_size,
				offset = {
					0,
					2,
					7,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			slider_button_hovered = {
				masked = true,
				texture_size = slider_button_hovered_size,
				offset = {
					0,
					2,
					8,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
			slider_button_hotspot = {
				size = slider_button_hovered_size,
				offset = {
					0,
					2,
					9,
				},
				color = Colors.get_color_table_with_alpha("white", 255),
			},
		},
		offset = {
			0,
			0,
			1,
		},
		scenegraph_id = scenegraph_id,
	}

	return definition
end
