require("scripts/settings/ui_frame_settings")
require("scripts/settings/ui_player_portrait_frame_settings")

UIWidgets = UIWidgets or {}
UIWidgets.create_talent_slot = function (scenegraph_id, offset)
	local counter_offset = {
		50,
		-10
	}
	local frame_settings = UIFrameSettings.menu_frame_01
	local counter_frame_settings = UIFrameSettings.menu_frame_03

	return {
		element = {
			passes = {
				{
					style_id = "icon",
					pass_type = "hotspot",
					content_id = "hotspot",
					content_check_function = function (content)
						return content.parent.icon
					end
				},
				{
					style_id = "available_rect",
					pass_type = "rect",
					content_check_function = function (content)
						return not content.unavailable and content.num_ranks and content.rank < content.num_ranks
					end
				},
				{
					style_id = "filled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						return not content.unavailable and content.num_ranks and content.num_ranks == content.rank
					end
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				},
				{
					texture_id = "counter_frame",
					style_id = "counter_frame",
					pass_type = "texture_frame",
					content_check_function = function (content)
						return not content.unavailable
					end
				},
				{
					style_id = "counter_rect",
					pass_type = "rect",
					content_check_function = function (content)
						return not content.unavailable
					end
				},
				{
					style_id = "counter_text",
					pass_type = "text",
					text_id = "counter_text",
					content_check_function = function (content)
						return not content.unavailable and content.num_ranks and content.rank < content.num_ranks
					end
				},
				{
					style_id = "counter_text_complete",
					pass_type = "text",
					text_id = "counter_text",
					content_check_function = function (content)
						return not content.unavailable and content.num_ranks and content.num_ranks == content.rank
					end
				},
				{
					style_id = "rect_rotated",
					pass_type = "rect_rotated",
					content_check_function = function (content)
						return content.has_connection
					end
				},
				{
					texture_id = "connection_arrow",
					style_id = "connection_arrow",
					pass_type = "rotated_texture",
					content_check_function = function (content)
						return content.has_connection
					end
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					talent_id = "tooltip",
					style_id = "tooltip",
					pass_type = "talent_tooltip",
					content_check_function = function (content)
						return content.talent_id and content.hotspot.is_hover
					end
				}
			}
		},
		content = {
			num_ranks = 0,
			connection_arrow = "drop_down_menu_arrow",
			counter_text = "0",
			rank = 0,
			unavailable = true,
			icon = "icon_trophy_skull_encased_t2_03",
			tooltip_text = "n/a",
			hotspot = {},
			frame = frame_settings.texture,
			counter_frame = counter_frame_settings.texture
		},
		style = {
			tooltip = {
				draw_side = "right",
				size = {
					64,
					64
				},
				offset = {
					2,
					65,
					50
				}
			},
			tooltip_text = {
				font_size = 24,
				max_width = 500,
				localize = false,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255)
				},
				offset = {
					0,
					0,
					50
				}
			},
			rect_rotated = {
				angle = 0,
				size = {
					5,
					100
				},
				pivot = {
					2.5,
					0
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					32,
					32,
					0
				}
			},
			connection_arrow = {
				angle = 0,
				size = {
					28,
					34
				},
				pivot = {
					14,
					0
				},
				color = Colors.get_color_table_with_alpha("yellow", 255),
				offset = {
					20,
					45,
					4
				}
			},
			counter_frame = {
				texture_size = counter_frame_settings.texture_size,
				texture_sizes = counter_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					counter_offset[1],
					counter_offset[2],
					6
				},
				size = {
					25,
					25
				}
			},
			counter_rect = {
				size = {
					25,
					25
				},
				color = {
					255,
					0,
					0,
					0
				},
				offset = {
					counter_offset[1],
					counter_offset[2],
					5
				}
			},
			available_rect = {
				size = {
					66,
					66
				},
				color = {
					255,
					0,
					255,
					0
				},
				offset = {
					-1,
					-1,
					0
				}
			},
			filled_rect = {
				size = {
					66,
					66
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-1,
					-1,
					0
				}
			},
			counter_text = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				font_size = 15,
				font_type = "hell_shark",
				size = {
					25,
					25
				},
				text_color = Colors.get_color_table_with_alpha("green", 255),
				offset = {
					counter_offset[1],
					counter_offset[2],
					7
				}
			},
			counter_text_complete = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				font_size = 15,
				font_type = "hell_shark",
				size = {
					25,
					25
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					counter_offset[1],
					counter_offset[2],
					7
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				},
				size = {
					64,
					64
				}
			},
			icon = {
				saturated = true,
				size = {
					64,
					64
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			}
		},
		offset = offset or {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end
UIWidgets.create_simple_item_presentation = function (scenegraph_id)
	return {
		element = {
			passes = {
				{
					item_id = "item",
					style_id = "item",
					pass_type = "item_presentation",
					text_id = "item",
					content_check_function = function (content)
						return content.item
					end
				}
			}
		},
		content = {},
		style = {
			item = {
				font_size = 18,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255)
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end
UIWidgets.create_reward_slot = function (texture, scenegraph_id, size, masked, retained)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					retained_mode = retained
				},
				{
					style_id = "hotspot",
					pass_type = "hotspot",
					content_id = "hotspot"
				},
				{
					style_id = "tooltip",
					pass_type = "item_tooltip",
					text_id = "tooltip",
					content_check_function = function (content)
						return content.hotspot.is_hover and content.hotspot.tooltip
					end
				}
			}
		},
		content = {
			tooltip = "tooltip_text",
			texture_id = texture,
			hotspot = {}
		},
		style = {
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked,
				size = size
			},
			hotspot = {
				size = size,
				offset = {
					0,
					0,
					0
				}
			},
			tooltip = {
				draw_side = "right",
				font_type = "hell_shark",
				localize = true,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				max_width = 500,
				size = size,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255)
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end
UIWidgets.create_talent_tree_background = function (scenegraph_id, size, title_text)
	local background_color = Colors.get_color_table_with_alpha("black", 220)
	local slot_color = Colors.get_color_table_with_alpha("gray", 50)
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "rounded_background",
			style_id = "background"
		},
		{
			pass_type = "rect",
			style_id = "inner_background"
		},
		{
			pass_type = "border",
			style_id = "inner_background_broder"
		},
		{
			pass_type = "rounded_background",
			style_id = "title_background"
		},
		{
			pass_type = "rounded_background",
			style_id = "title_inner_background"
		},
		{
			style_id = "title_text",
			pass_type = "text",
			text_id = "title_text"
		}
	}
	local content = {
		title_text = Localize(title_text)
	}
	local style = {
		background = {
			corner_radius = 5,
			color = background_color,
			offset = {
				0,
				0,
				0
			}
		},
		inner_background = {
			color = slot_color,
			offset = {
				5,
				5,
				1
			},
			size = {
				size[1] - 10,
				size[2] - 10
			}
		},
		inner_background_broder = {
			thickness = 1,
			color = slot_color,
			offset = {
				5,
				5,
				2
			},
			size = {
				size[1] - 10,
				size[2] - 10
			}
		},
		title_background = {
			corner_radius = 5,
			color = background_color,
			offset = {
				0,
				size[2] + 5,
				0
			},
			size = {
				size[1],
				40
			}
		},
		title_inner_background = {
			corner_radius = 5,
			color = slot_color,
			offset = {
				5,
				size[2] + 10,
				1
			},
			size = {
				size[1] - 10,
				30
			}
		},
		title_text = {
			vertical_alignment = "top",
			font_type = "hell_shark",
			font_size = 18,
			horizontal_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				size[2] + 5,
				2
			},
			size = {
				size[1],
				30
			}
		},
		text = {
			vertical_alignment = "top",
			font_size = 18,
			horizontal_alignment = "left",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				20,
				20,
				3
			},
			size = {
				size[1] - 40,
				size[2] - 40
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		-40,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_hero_frame = function (scenegraph_id, size, frame_name, background_texture)
	background_texture = background_texture or "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = (frame_name and UIFrameSettings[frame_name]) or UIFrameSettings.menu_frame_02

	return {
		element = {
			passes = {
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				}
			}
		},
		content = {
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						math.min(size[2] / background_texture_settings.size[2], 1)
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_recipe_grid = function (scenegraph_id, size, rows, slots_per_row, slot_width_spacing, slot_height_spacing)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local background_color = {
		255,
		255,
		255,
		255
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		80,
		80
	}
	local slot_size = {
		80,
		80
	}
	slot_width_spacing = slot_width_spacing or 8
	slot_height_spacing = slot_height_spacing or 8
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row
	}
	local style = {}
	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = size[1] - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = size[2] - column_height
	local slot_start_offset = {
		row_difference_to_background / 2,
		size[2] - column_difference_to_background / 2 - slot_size[2]
	}
	local offset_layer = 3

	for i = 1, rows, 1 do
		for k = 1, slots_per_row, 1 do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer
			}
			local item_name = "item" .. name_suffix
			local hotspot_name = "hotspot" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size
			}
			local item_icon_name = "item_icon" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end
			}
			style[item_icon_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					1
				}
			}
			local slot_background_frame_name = "item_frame" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_background_frame_name,
				style_id = slot_background_frame_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end
			}
			style[slot_background_frame_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					4
				}
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
				end
			}
			style[slot_craft_frame_name] = {
				size = {
					98,
					98
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] - 9,
					offset[2] - 9,
					6
				}
			}
			content[hotspot_name][slot_craft_frame_name] = "crafting_bg_03"
			local rarity_texture_name = "rarity_texture" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = rarity_texture_name,
				style_id = rarity_texture_name,
				content_check_function = function (content)
					return content[hotspot_name][item_icon_name] and content[item_name]
				end
			}
			style[rarity_texture_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					0
				}
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
				end
			}
			style[item_tooltip_name] = {
				font_type = "hell_shark",
				localize = true,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				max_width = 500,
				size = slot_size,
				offset = offset,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255)
				},
				offset = offset
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
				end
			}
			style[slot_name] = {
				size = slot_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					0
				}
			}
			content[hotspot_name][slot_name] = "menu_slot_frame_01"
			local amount_text_name = "amount_text" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "text",
				text_id = amount_text_name,
				style_id = amount_text_name,
				content_id = hotspot_name
			}
			style[amount_text_name] = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 28,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = icon_size,
				offset = {
					offset[1],
					offset[2] - 44,
					3
				}
			}
			content[hotspot_name][amount_text_name] = "0/0"
			local amount_text_shadow_name = "amount_text_shadow" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "text",
				text_id = amount_text_name,
				style_id = amount_text_shadow_name,
				content_id = hotspot_name
			}
			style[amount_text_shadow_name] = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 28,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = icon_size,
				offset = {
					offset[1] + 2,
					offset[2] - 44 - 2,
					2
				}
			}
		end
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_grid = function (scenegraph_id, size, rows, slots_per_row, slot_width_spacing, slot_height_spacing, use_pages)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local background_color = {
		255,
		255,
		255,
		255
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		80,
		80
	}
	local slot_size = {
		80,
		80
	}
	slot_width_spacing = slot_width_spacing or 8
	slot_height_spacing = slot_height_spacing or 8
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row
	}
	local style = {}

	if use_pages then
		passes[#passes + 1] = {
			style_id = "page_text",
			pass_type = "text",
			text_id = "page_text",
			content_check_function = function (content)
				local page_hotspot_left = content.page_hotspot_left
				local page_hotspot_right = content.page_hotspot_right
				local disabled = page_hotspot_left.disable_button and page_hotspot_right.disable_button

				return not disabled
			end
		}
		passes[#passes + 1] = {
			style_id = "page_arrow_left",
			pass_type = "hotspot",
			content_id = "page_hotspot_left"
		}
		passes[#passes + 1] = {
			style_id = "page_arrow_right",
			pass_type = "hotspot",
			content_id = "page_hotspot_right"
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = "page_arrow_left",
			texture_id = "texture_id",
			content_id = "stepper_arrow_normal",
			content_check_function = function (content)
				local page_hotspot_left = content.parent.page_hotspot_left

				return not page_hotspot_left.disable_button and not page_hotspot_left.is_hover
			end
		}
		passes[#passes + 1] = {
			style_id = "page_arrow_right",
			pass_type = "texture_uv",
			content_id = "stepper_arrow_normal",
			content_check_function = function (content)
				local page_hotspot_right = content.parent.page_hotspot_right

				return not page_hotspot_right.disable_button and not page_hotspot_right.is_hover
			end
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = "page_arrow_left",
			texture_id = "texture_id",
			content_id = "stepper_arrow_hover",
			content_check_function = function (content)
				local page_hotspot_left = content.parent.page_hotspot_left

				return not page_hotspot_left.disable_button and page_hotspot_left.is_hover
			end
		}
		passes[#passes + 1] = {
			style_id = "page_arrow_right",
			pass_type = "texture_uv",
			content_id = "stepper_arrow_hover",
			content_check_function = function (content)
				local page_hotspot_right = content.parent.page_hotspot_right

				return not page_hotspot_right.disable_button and page_hotspot_right.is_hover
			end
		}
		content.page_hotspot_left = {}
		content.page_hotspot_right = {}
		content.page_text = "n/a"
		content.stepper_arrow_normal = {
			texture_id = "settings_arrow_normal",
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		}
		content.stepper_arrow_hover = {
			texture_id = "settings_arrow_clicked",
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		}
		style.page_arrow_left = {
			color = default_color,
			offset = {
				size[1] * 0.4 - 40,
				23,
				1
			},
			size = {
				28,
				34
			}
		}
		style.page_arrow_right = {
			color = default_color,
			offset = {
				size[1] * 0.6 + 12,
				23,
				1
			},
			size = {
				28,
				34
			}
		}
		style.page_text = {
			vertical_alignment = "center",
			font_type = "hell_shark",
			font_size = 18,
			horizontal_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				size[1] * 0.4,
				25,
				2
			},
			size = {
				size[1] * 0.2,
				30
			}
		}
	end

	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = size[1] - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = size[2] - column_height
	local slot_start_offset = {
		row_difference_to_background / 2,
		size[2] - column_difference_to_background / 2 - slot_size[2]
	}
	local offset_layer = 3

	for i = 1, rows, 1 do
		for k = 1, slots_per_row, 1 do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer
			}
			local item_name = "item" .. name_suffix
			local hotspot_name = "hotspot" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size
			}
			local item_icon_name = "item_icon" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end
			}
			style[item_icon_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					1
				}
			}
			local slot_background_frame_name = "item_frame" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_background_frame_name,
				style_id = slot_background_frame_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end
			}
			style[slot_background_frame_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					4
				}
			}
			content[hotspot_name][slot_background_frame_name] = "item_frame"
			local rarity_texture_name = "rarity_texture" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = rarity_texture_name,
				style_id = rarity_texture_name,
				content_check_function = function (content)
					return content[hotspot_name][item_icon_name] and content[item_name]
				end
			}
			style[rarity_texture_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					0
				}
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
				end
			}
			style[item_tooltip_name] = {
				font_type = "hell_shark",
				localize = true,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				max_width = 500,
				size = slot_size,
				offset = offset,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255)
				},
				offset = offset
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
				end
			}
			style[slot_name] = {
				size = slot_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					0
				}
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
				end
			}
			style[slot_hover_name] = {
				size = {
					128,
					128
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] - (128 - slot_size[1]) / 2,
					offset[2] - (128 - slot_size[2]) / 2,
					0
				}
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
				end
			}
			style[slot_equipped_name] = {
				size = {
					80,
					80
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] - (80 - slot_size[1]) / 2,
					offset[2] - (80 - slot_size[2]) / 2,
					6
				}
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
				end
			}
			style[amount_text_name] = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 32,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = icon_size,
				offset = {
					offset[1] - 7,
					offset[2] - 1,
					3
				}
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
				end
			}
			style[amount_text_shadow_name] = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 32,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = icon_size,
				offset = {
					offset[1] - 7 + 2,
					offset[2] - 1 - 2,
					2
				}
			}
			local disabled_name = "disabled_rect" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "rect",
				content_id = hotspot_name,
				style_id = disabled_name,
				content_check_function = function (content)
					return content[item_icon_name] and (content.reserved or content.unwieldable)
				end
			}
			style[disabled_name] = {
				size = icon_size,
				color = {
					210,
					10,
					10,
					10
				},
				offset = {
					offset[1],
					offset[2],
					3
				}
			}
			local unwieldable_name = "unwieldable_icon" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = unwieldable_name,
				content_id = hotspot_name,
				style_id = unwieldable_name,
				content_check_function = function (content)
					return content[item_icon_name] and content.unwieldable
				end
			}
			style[unwieldable_name] = {
				size = {
					40,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					(offset[1] + icon_size[1] / 2) - 20,
					(offset[2] + icon_size[2] / 2) - 20,
					4
				}
			}
			content[hotspot_name][unwieldable_name] = "tab_menu_icon_03"
			passes[#passes + 1] = {
				pass_type = "drag",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end
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
						local progress = 0.5 + math.sin(Application.time_since_launch() * 5) * 0.5
						style.color[1] = 55 + progress * 200
						local hotspot = content[hotspot_name]

						if hotspot.on_hover_enter and ItemHelper.is_new_backend_id(backend_id) then
							ItemHelper.unmark_backend_id_as_new(backend_id)
						end
					end

					return 
				end
			}
			style[new_icon_name] = {
				size = {
					icon_size[1] + new_frame_width * 2,
					icon_size[2] + new_frame_width * 2
				},
				color = default_color,
				texture_size = new_frame_settings.texture_size,
				texture_sizes = new_frame_settings.texture_sizes,
				offset = {
					offset[1] - new_frame_width,
					offset[2] - new_frame_width,
					10
				}
			}
			content[new_icon_name] = new_frame_settings.texture
		end
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_simple_inventory_item = function (scenegraph_id, size)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {}
	local style = {}
	local hotspot_name = "button_hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name
	}
	style[hotspot_name] = {
		size = size,
		offset = {
			0,
			0,
			0
		}
	}
	content[hotspot_name] = {
		is_selected = false,
		drag_texture_size = size
	}
	local item_icon_name = "item_icon"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = item_icon_name,
		style_id = item_icon_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end
	}
	style[item_icon_name] = {
		size = size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			0,
			0,
			1
		}
	}
	local slot_background_frame_name = "item_frame"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = slot_background_frame_name,
		style_id = slot_background_frame_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end
	}
	style[slot_background_frame_name] = {
		size = size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			0,
			0,
			4
		}
	}
	content[slot_background_frame_name] = "item_frame"
	local rarity_texture_name = "rarity_texture"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = rarity_texture_name,
		style_id = rarity_texture_name,
		content_check_function = function (content)
			return content[item_icon_name]
		end
	}
	style[rarity_texture_name] = {
		size = size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			0,
			0,
			0
		}
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
		end
	}
	style[item_tooltip_name] = {
		font_size = 18,
		font_type = "hell_shark",
		localize = true,
		horizontal_alignment = "left",
		vertical_alignment = "top",
		max_width = 500,
		size = size,
		text_color = Colors.get_color_table_with_alpha("white", 255),
		line_colors = {
			Colors.get_color_table_with_alpha("font_title", 255),
			Colors.get_color_table_with_alpha("white", 255)
		},
		offset = {
			0,
			0,
			0
		}
	}
	content[item_tooltip_name] = "tooltip_text"
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_loadout_grid = function (scenegraph_id, size, rows, spacing, align_horizontal)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local background_color = {
		255,
		255,
		255,
		255
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		80,
		80
	}
	local slot_size = {
		80,
		80
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
		element = {}
	}
	local passes = {}
	local style = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row
	}
	local row_length = slots_per_row * slot_size[1] + slot_width_spacing * (slots_per_row - 1)
	local row_difference_to_background = background_width - row_length
	local column_height = rows * slot_size[2] + slot_height_spacing * (rows - 1)
	local column_difference_to_background = background_height - column_height
	local slot_start_offset = {
		(align_horizontal and row_difference_to_background / 2) or row_difference_to_background / 2,
		background_height - column_difference_to_background / 2 - slot_size[2]
	}
	local offset_layer = 0

	for i = 1, rows, 1 do
		for k = 1, slots_per_row, 1 do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer
			}
			local hotspot_name = "hotspot" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size
			}
			local item_icon_name = "item_icon" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end
			}
			style[item_icon_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					3
				}
			}
			local slot_background_frame_name = "item_frame" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = slot_background_frame_name,
				style_id = slot_background_frame_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end
			}
			style[slot_background_frame_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					4
				}
			}
			content[hotspot_name][slot_background_frame_name] = "item_frame"
			local rarity_texture_name = "rarity_texture" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = rarity_texture_name,
				style_id = rarity_texture_name,
				content_check_function = function (content)
					return content[hotspot_name][item_icon_name]
				end
			}
			style[rarity_texture_name] = {
				size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					0
				}
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
				end
			}
			style[item_tooltip_name] = {
				font_type = "hell_shark",
				localize = true,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				max_width = 500,
				size = slot_size,
				offset = offset,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {
					Colors.get_color_table_with_alpha("font_title", 255),
					Colors.get_color_table_with_alpha("white", 255)
				},
				offset = offset
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
				end
			}
			style[slot_name] = {
				size = slot_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					0
				}
			}
			content[hotspot_name][slot_name] = "menu_slot_frame_01"
			local slot_icon_name = "slot_icon" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				texture_id = slot_icon_name,
				style_id = slot_icon_name,
				content_check_function = function (content)
					return not content[hotspot_name][item_icon_name]
				end
			}
			style[slot_icon_name] = {
				size = {
					34,
					34
				},
				color = {
					200,
					100,
					100,
					100
				},
				offset = {
					offset[1] + (slot_size[1] - 34) / 2,
					(offset[2] + slot_size[2] - 34) - (slot_size[1] - 34) / 2,
					2
				}
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
				end
			}
			style[slot_hover_name] = {
				size = {
					128,
					128
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] - (128 - slot_size[1]) / 2,
					offset[2] - (128 - slot_size[2]) / 2,
					0
				}
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
				end
			}
			style[slot_selected_name] = {
				size = {
					80,
					80
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] - (80 - slot_size[1]) / 2,
					offset[2] - (80 - slot_size[2]) / 2,
					8
				}
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
		0
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
		element = {}
	}
	local passes = {
		{
			style_id = "background",
			pass_type = "texture_uv",
			content_id = "background"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			pass_type = "texture",
			style_id = "divider",
			texture_id = "divider"
		},
		{
			pass_type = "border",
			style_id = "inner_background_broder"
		},
		{
			style_id = "title_text",
			pass_type = "text",
			text_id = "title_text"
		},
		{
			style_id = "value_text",
			pass_type = "text",
			text_id = "value_text"
		},
		{
			style_id = "value_title_text",
			pass_type = "text",
			text_id = "value_title_text"
		}
	}
	local content = {
		value_title_text = "n/a",
		value_text = "n/a",
		divider = "summary_screen_line_breaker",
		frame = frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0
				},
				{
					size[1] / background_texture_settings.size[1],
					size[2] / background_texture_settings.size[2]
				}
			},
			texture_id = background_texture
		},
		title_text = Localize("lorebook_statistics")
	}
	local style = {
		divider = {
			size = {
				350,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] / 2 - 175,
				size[2] - 90,
				1
			}
		},
		background = {
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				0
			}
		},
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				1
			}
		},
		inner_background_broder = {
			thickness = 1,
			color = slot_color,
			offset = {
				5,
				5,
				2
			},
			size = {
				size[1] - 10,
				size[2] - 10
			}
		},
		title_text = {
			vertical_alignment = "top",
			font_type = "hell_shark",
			font_size = 24,
			horizontal_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				size[2] - 55,
				2
			},
			size = {
				size[1],
				30
			}
		},
		value_title_text = {
			vertical_alignment = "top",
			font_size = 18,
			horizontal_alignment = "left",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				15,
				0,
				3
			},
			size = {
				size[1],
				size[2] - 105
			}
		},
		value_text = {
			vertical_alignment = "top",
			font_size = 18,
			horizontal_alignment = "right",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				-15,
				0,
				3
			},
			size = {
				size[1],
				size[2] - 105
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_weapon_statistics = function (scenegraph_id, size)
	local font_default_color = Colors.get_color_table_with_alpha("font_default", 255)
	local font_title_color = Colors.get_color_table_with_alpha("font_title", 255)
	local widget = {
		element = {}
	}
	local passes = {
		{
			texture_id = "divider_right",
			style_id = "divider_left",
			pass_type = "texture"
		},
		{
			texture_id = "divider_left",
			style_id = "divider_right",
			pass_type = "texture"
		},
		{
			style_id = "title_text",
			pass_type = "text",
			text_id = "title_text"
		},
		{
			style_id = "title_text_left",
			pass_type = "text",
			text_id = "title_text_left"
		},
		{
			style_id = "title_text_right",
			pass_type = "text",
			text_id = "title_text_right"
		}
	}
	local content = {
		title_text_left = "n/a",
		title_text = "n/a",
		divider_right = "journal_marker_left",
		title_text_right = "n/a",
		divider_left = "journal_marker_right"
	}
	local style = {
		divider_left = {
			size = {
				124,
				13
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				size[2] - 13,
				0
			}
		},
		divider_right = {
			size = {
				124,
				13
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				size[1] - 124,
				size[2] - 13,
				0
			}
		},
		background = {
			color = Colors.get_color_table_with_alpha("red", 10),
			offset = {
				0,
				0,
				0
			}
		},
		title_text = {
			vertical_alignment = "center",
			font_type = "hell_shark",
			font_size = 18,
			horizontal_alignment = "center",
			text_color = font_title_color,
			offset = {
				0,
				size[2] - 13,
				0
			},
			size = {
				size[1],
				13
			}
		},
		title_text_left = {
			vertical_alignment = "bottom",
			font_type = "hell_shark",
			font_size = 18,
			horizontal_alignment = "left",
			text_color = font_title_color,
			offset = {
				5,
				size[2] - 50,
				0
			},
			size = {
				size[1],
				20
			}
		},
		title_text_right = {
			vertical_alignment = "bottom",
			font_type = "hell_shark",
			font_size = 18,
			horizontal_alignment = "right",
			text_color = font_title_color,
			offset = {
				-5,
				size[2] - 50,
				0
			},
			size = {
				size[1],
				20
			}
		}
	}

	for i = 1, 5, 1 do
		local height_offset = size[2] - 20 * i - 50
		local spacing = {
			2,
			0
		}
		local texture_size = {
			20,
			20
		}
		local value_title_text_name = "value_title_text_" .. i
		passes[#passes + 1] = {
			pass_type = "text",
			style_id = value_title_text_name,
			text_id = value_title_text_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end
		}
		style[value_title_text_name] = {
			vertical_alignment = "center",
			word_wrap = true,
			horizontal_alignment = "center",
			font_size = 18,
			font_type = "hell_shark",
			text_color = font_default_color,
			offset = {
				0,
				height_offset,
				0
			},
			size = {
				size[1],
				20
			}
		}
		local multi_texture_name = "stars_left_bg_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end
		}
		style[multi_texture_name] = {
			direction = 1,
			axis = 1,
			draw_count = 5,
			texture_size = texture_size,
			spacing = spacing,
			color = {
				255,
				50,
				50,
				50
			},
			offset = {
				5,
				height_offset,
				3
			}
		}
		content[multi_texture_name] = {
			"stats_star",
			"stats_star",
			"stats_star",
			"stats_star",
			"stats_star"
		}
		multi_texture_name = "stars_left_1_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end
		}
		style[multi_texture_name] = {
			direction = 1,
			axis = 1,
			draw_count = 0,
			texture_size = texture_size,
			spacing = spacing,
			color = font_default_color,
			offset = {
				5,
				height_offset,
				3
			}
		}
		content[multi_texture_name] = {
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
			"stats_star_left"
		}
		multi_texture_name = "stars_left_2_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end
		}
		style[multi_texture_name] = {
			direction = 1,
			axis = 1,
			draw_count = 0,
			texture_size = texture_size,
			spacing = spacing,
			color = font_default_color,
			offset = {
				5,
				height_offset,
				3
			}
		}
		content[multi_texture_name] = {
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
			"stats_star_right"
		}
		local width_offset = size[1] - 5 - (texture_size[1] * 5 + spacing[1] * 4)
		multi_texture_name = "stars_right_bg_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end
		}
		style[multi_texture_name] = {
			direction = 1,
			axis = 1,
			draw_count = 5,
			texture_size = texture_size,
			spacing = spacing,
			color = {
				255,
				50,
				50,
				50
			},
			offset = {
				width_offset,
				height_offset,
				3
			}
		}
		content[multi_texture_name] = {
			"stats_star",
			"stats_star",
			"stats_star",
			"stats_star",
			"stats_star"
		}
		multi_texture_name = "stars_right_1_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end
		}
		style[multi_texture_name] = {
			direction = 1,
			axis = 1,
			draw_count = 0,
			texture_size = texture_size,
			spacing = spacing,
			color = font_default_color,
			offset = {
				width_offset,
				height_offset,
				3
			}
		}
		content[multi_texture_name] = {
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
			"stats_star_left",
			"stats_star_left"
		}
		multi_texture_name = "stars_right_2_" .. i
		passes[#passes + 1] = {
			pass_type = "multi_texture",
			style_id = multi_texture_name,
			texture_id = multi_texture_name,
			content_check_function = function (content)
				return content[value_title_text_name]
			end
		}
		style[multi_texture_name] = {
			direction = 1,
			axis = 1,
			draw_count = 0,
			texture_size = texture_size,
			spacing = spacing,
			color = font_default_color,
			offset = {
				width_offset,
				height_offset,
				3
			}
		}
		content[multi_texture_name] = {
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
			"stats_star_right",
			"stats_star_right"
		}
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_background_with_frame = function (scenegraph_id, size, background_texture, frame_style)
	background_texture = background_texture or "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local background_size = (background_texture_settings and background_texture_settings.size) or size
	local frame_settings = (frame_style and UIFrameSettings[frame_style]) or UIFrameSettings.menu_frame_02
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "background",
			pass_type = "texture_uv",
			content_id = "background"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		}
	}
	local content = {
		frame = frame_settings.texture,
		background = {
			uvs = {
				{
					0,
					0
				},
				{
					math.min(size[1] / background_size[1], 1),
					math.min(size[2] / background_size[2], 1)
				}
			},
			texture_id = background_texture
		}
	}
	local style = {
		background = {
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				0
			}
		},
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				5
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_rect_with_frame = function (scenegraph_id, size, rect_color, frame_style)
	local frame_settings = (frame_style and UIFrameSettings[frame_style]) or UIFrameSettings.menu_frame_02
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "rect",
			style_id = "background"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		}
	}
	local content = {
		frame = frame_settings.texture
	}
	local style = {
		background = {
			color = rect_color or {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				0
			}
		},
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				5
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_background = function (scenegraph_id, size, background_texture, optional_color)
	background_texture = background_texture or "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "background",
			pass_type = "texture_uv",
			content_id = "background"
		}
	}
	local content = {
		background = {
			uvs = {
				{
					0,
					0
				},
				{
					math.min(size[1] / background_texture_settings.size[1], 1),
					math.min(size[2] / background_texture_settings.size[2], 1)
				}
			},
			texture_id = background_texture
		}
	}
	local style = {
		background = {
			color = optional_color or {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				0
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_frame = function (scenegraph_id, size, frame_style, layer)
	local frame_settings = (frame_style and UIFrameSettings[frame_style]) or UIFrameSettings.menu_frame_02
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		}
	}
	local content = {
		frame = frame_settings.texture
	}
	local style = {
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				layer or 5
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
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
		element = {}
	}
	local passes = {
		{
			style_id = "background",
			pass_type = "texture_uv",
			content_id = "background"
		},
		{
			style_id = "title_text",
			pass_type = "text",
			text_id = "title_text"
		},
		{
			style_id = "sub_title_text",
			pass_type = "text",
			text_id = "sub_title_text"
		},
		{
			style_id = "description_text",
			pass_type = "text",
			text_id = "description_text"
		},
		{
			texture_id = "component_divider",
			style_id = "component_divider_top",
			pass_type = "texture"
		}
	}
	local content = {
		component_divider = "journal_page_divider_01_large",
		title_text = "n/a",
		sub_title_text = "n/a",
		description_text = "n/a",
		background = {
			uvs = {
				{
					0,
					0
				},
				{
					size[1] / background_texture_settings.size[1],
					size[2] / background_texture_settings.size[2]
				}
			},
			texture_id = background_texture
		}
	}
	local style = {
		component_divider_top = {
			size = {
				430,
				20
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] / 2 - 215,
				size[2] - 110,
				1
			}
		},
		background = {
			color = default_color
		},
		title_text = {
			vertical_alignment = "top",
			font_type = "hell_shark_header",
			font_size = 32,
			horizontal_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
			offset = {
				20,
				size[2] - 35,
				3
			},
			size = {
				size[1] - 40,
				30
			}
		},
		sub_title_text = {
			vertical_alignment = "center",
			font_size = 20,
			horizontal_alignment = "center",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
			offset = {
				20,
				size[2] - 75,
				3
			},
			size = {
				size[1] - 40,
				30
			}
		},
		description_text = {
			vertical_alignment = "top",
			font_size = 18,
			horizontal_alignment = "center",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
			offset = {
				20,
				size[2] - 130,
				2
			},
			size = {
				size[1] - 40,
				30
			}
		}
	}
	local icon_size = {
		50,
		50
	}
	local components_start_offset = {
		20,
		size[2] - icon_size[1] - 230,
		3
	}
	local row_height = icon_size[2]
	local row_spacing = 20
	content.component_amount = num_components

	for i = 1, num_components, 1 do
		local index = i - 1
		local name_suffix = "_" .. tostring(i)
		local offset = {
			components_start_offset[1],
			components_start_offset[2] - (index * row_height + index * row_spacing),
			components_start_offset[3]
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
			end
		}
		style[component_icon] = {
			size = icon_size,
			offset = offset,
			color = default_color
		}
		content[component_icon] = "icons_placeholder"
		local component_text = "component_text" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = component_text,
			style_id = component_text,
			content_check_function = function (content)
				return content[component_active]
			end
		}
		style[component_text] = {
			horizontal_alignment = "left",
			font_size = 24,
			word_wrap = true,
			vertical_alignment = "center",
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("loading_screen_stone", 255),
			size = {
				size[1] - components_start_offset[1] * 2 - icon_size[1] - 5,
				icon_size[2]
			},
			offset = {
				offset[1] + icon_size[1] + 5,
				offset[2],
				offset[3]
			},
			color = default_color
		}
		content[component_text] = "n/a"
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
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
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					pass_type = "texture_frame",
					style_id = "glas_frame",
					texture_id = "glas_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and 0 < content.button_hotspot.is_clicked
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "glas_frame_pressed",
					texture_id = "glas_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled or content.button_hotspot.is_clicked == 0
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "arrow_left",
					texture_id = "arrow_left"
				},
				{
					pass_type = "texture",
					style_id = "arrow_right",
					texture_id = "arrow_right"
				},
				{
					pass_type = "texture",
					style_id = "arrow_top",
					texture_id = "arrow_top"
				},
				{
					pass_type = "texture",
					style_id = "arrow_bottom",
					texture_id = "arrow_bottom"
				}
			}
		},
		content = {
			arrow_bottom = "menu_frame_04_bottom",
			arrow_right = "menu_frame_04_right",
			arrow_left = "menu_frame_04_left",
			arrow_top = "menu_frame_04_top",
			button_hotspot = {},
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2]
					}
				},
				texture_id = background_texture
			},
			text = text or "n/a",
			frame = frame_settings.texture,
			glas_frame = glass_frame_settings.texture
		},
		style = {
			arrow_left = {
				size = {
					17,
					21
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-9,
					size[2] / 2 - 10.5,
					5
				}
			},
			arrow_right = {
				size = {
					17,
					21
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 8,
					size[2] / 2 - 10.5,
					5
				}
			},
			arrow_top = {
				size = {
					21,
					17
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] / 2 - 8.5,
					size[2] - 8,
					5
				}
			},
			arrow_bottom = {
				size = {
					21,
					17
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] / 2 - 8.5,
					-9,
					5
				}
			},
			text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					2
				}
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					2
				}
			},
			frame = {
				offset = {
					0,
					0,
					4
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				}
			},
			glas_frame = {
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				texture_size = glass_frame_settings.texture_size,
				texture_sizes = glass_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					3
				}
			},
			glas_frame_pressed = {
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				texture_size = glass_frame_settings.texture_size,
				texture_sizes = glass_frame_settings.texture_sizes,
				color = {
					150,
					255,
					255,
					255
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					3
				}
			},
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked
			},
			texture_id = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked
			},
			texture_hover_id = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked
			},
			texture_selected_id = {
				size = {
					100,
					100
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-25,
					-25,
					0
				},
				masked = masked
			}
		},
		scenegraph_id = scenegraph_id
	}
end
UIWidgets.create_reward_slot_grid = function (scenegraph_id, size, slot_size, grid_offset, rows, slots_per_row, background_texture)
	local default_color = {
		255,
		255,
		255,
		255
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
		background_height - column_difference_to_background / 2 - slot_size[2] + grid_offset[2]
	}
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		rows = rows,
		columns = slots_per_row,
		slots = rows * slots_per_row
	}
	local style = {}
	local offset_layer = 0

	for i = 1, rows, 1 do
		for k = 1, slots_per_row, 1 do
			local name_suffix = "_" .. tostring(i) .. "_" .. tostring(k)
			local column_start_index = i - 1
			local row_start_index = k - 1
			local offset = {
				slot_start_offset[1] + row_start_index * (slot_size[1] + slot_width_spacing),
				slot_start_offset[2] - column_start_index * (slot_size[2] + slot_height_spacing),
				offset_layer
			}
			local hotspot_name = "hotspot" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = hotspot_name,
				style_id = hotspot_name
			}
			style[hotspot_name] = {
				size = slot_size,
				offset = offset
			}
			content[hotspot_name] = {
				drag_texture_size = slot_size
			}
			local item_icon_name = "item_icon" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = item_icon_name,
				style_id = item_icon_name,
				content_check_function = function (content)
					return content[item_icon_name]
				end
			}
			style[item_icon_name] = {
				size = slot_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					(offset[2] + slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					4
				}
			}
			local slot_background_rect_name = "slot_bg" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "rounded_background",
				style_id = slot_background_rect_name
			}
			style[slot_background_rect_name] = {
				corner_radius = 0,
				size = slot_size,
				color = slot_color,
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					(offset[2] + slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					2
				}
			}
			local slot_border_name = "slot_border" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture_frame",
				content_id = hotspot_name,
				texture_id = slot_border_name,
				style_id = slot_border_name
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
					255
				},
				offset = {
					offset[1],
					offset[2],
					5
				}
			}
			content[hotspot_name][slot_border_name] = slot_border_settings.texture
			local slot_hover_glow = "slot_glow_hover" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "rounded_background",
				content_id = hotspot_name,
				style_id = slot_hover_glow,
				content_check_function = function (content)
					return content.is_hover
				end
			}
			style[slot_hover_glow] = {
				corner_radius = 0,
				size = slot_size,
				color = slot_hover_color,
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					(offset[2] + slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					2
				}
			}
			local slot_selected_glow = "slot_glow_selected" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "rounded_background",
				content_id = hotspot_name,
				style_id = slot_selected_glow,
				content_check_function = function (content)
					return content.is_selected
				end
			}
			style[slot_selected_glow] = {
				corner_radius = 0,
				size = slot_size,
				color = slot_selected_color,
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					(offset[2] + slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					2
				}
			}
			local item_tooltip_name = "item_tooltip" .. name_suffix
			content[item_tooltip_name] = {}
			passes[#passes + 1] = {
				pass_type = "generic_tooltip",
				style_id = item_tooltip_name,
				content_id = hotspot_name,
				content_check_function = function (content)
					return content.is_hover and content[item_tooltip_name]
				end
			}
			style[item_tooltip_name] = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				max_width = 500,
				size = slot_size,
				offset = {
					offset[1] + (slot_size[1] - slot_size[1]) / 2,
					(offset[2] + slot_size[2] - slot_size[2]) - (slot_size[1] - slot_size[1]) / 2,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255),
				text_styles = {},
				value_styles = {}
			}
		end
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_reward_card = function (scenegraph_id, size)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local background_color = {
		220,
		20,
		15,
		15
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		300,
		300
	}
	local item_offset = {
		size[1] / 2 - icon_size[1] / 2,
		size[2] - icon_size[2] - math.floor(size[2] * 0.1),
		3
	}
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {}
	local style = {}
	local hotspot_name = "button_hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name
	}
	style[hotspot_name] = {
		size = size,
		offset = {
			0,
			0,
			0
		}
	}
	content[hotspot_name] = {
		disable_button = true,
		is_selected = false,
		drag_texture_size = size
	}
	local item_icon_name = "item_icon"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = item_icon_name,
		style_id = item_icon_name,
		content_check_function = function (content)
			return not content.disable_button and content[item_icon_name]
		end
	}
	style[item_icon_name] = {
		size = icon_size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			item_offset[1],
			item_offset[2],
			item_offset[3] + 3
		}
	}
	content[hotspot_name][item_icon_name] = "icons_placeholder"
	local can_use_texture_name = "can_use_texture"
	passes[#passes + 1] = {
		pass_type = "centered_texture_amount",
		texture_id = can_use_texture_name,
		style_id = can_use_texture_name,
		content_check_function = function (content)
			return content[hotspot_name][item_icon_name]
		end
	}
	style[can_use_texture_name] = {
		texture_axis = 1,
		spacing = 5,
		texture_amount = 0,
		texture_size = {
			40,
			40
		},
		size = {
			size[1],
			20
		},
		color = {
			255,
			0,
			0,
			0
		},
		offset = {
			0,
			60,
			4
		}
	}
	content[can_use_texture_name] = {
		"stats_star",
		"stats_star",
		"stats_star",
		"stats_star",
		"stats_star"
	}
	local item_title_text_name = "item_title_text"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = item_title_text_name,
		style_id = item_title_text_name
	}
	style[item_title_text_name] = {
		vertical_alignment = "bottom",
		font_size = 32,
		horizontal_alignment = "center",
		word_wrap = true,
		font_type = "hell_shark",
		size = {
			size[1] - 20,
			item_offset[2] - 40
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			10,
			item_offset[2] - 40,
			item_offset[3] + 4
		}
	}
	content[item_title_text_name] = "n/a"
	local item_type_text_name = "item_type_text"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = item_type_text_name,
		style_id = item_type_text_name
	}
	style[item_type_text_name] = {
		vertical_alignment = "top",
		font_size = 24,
		horizontal_alignment = "center",
		word_wrap = true,
		font_type = "hell_shark",
		size = {
			size[1] - 20,
			item_offset[2] - 40
		},
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			10,
			0,
			item_offset[3] + 4
		}
	}
	content[item_type_text_name] = "n/a"
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
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
		163
	}
	local icon_offset = {
		size[1] / 2 - icon_size[1] / 2,
		size[2] / 2 - icon_size[2] / 2,
		3
	}
	local frame_settings = UIFrameSettings.menu_frame_03

	return {
		element = {
			passes = {
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture",
					content_check_function = function (content)
						return content.icon
					end
				},
				{
					texture_id = "icon_bg",
					style_id = "icon_bg",
					pass_type = "texture"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				}
			}
		},
		content = {
			title_text = "n/a",
			icon_bg = "scoreboard_topic_01",
			description_text = "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2]
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			description_text = {
				default_font_size = 48,
				word_wrap = true,
				font_size = 48,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 0),
				size = {
					size[1] * 0.8,
					size[2] / 2
				},
				offset = {
					size[1] * 0.1,
					10,
					5
				},
				default_offset = {
					size[1] * 0.1,
					10,
					5
				}
			},
			title_text = {
				default_font_size = 24,
				word_wrap = true,
				font_size = 24,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 0),
				size = {
					size[1] * 0.8,
					size[2] * 0.3
				},
				offset = {
					size[1] * 0.1,
					size[2] * 0.72,
					5
				},
				default_offset = {
					size[1] * 0.1,
					size[2] * 0.72,
					5
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				}
			},
			background = {
				size = size,
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			icon = {
				size = icon_size,
				default_size = icon_size,
				offset = {
					icon_offset[1],
					icon_offset[2],
					icon_offset[3] + 1
				},
				default_offset = {
					icon_offset[1],
					icon_offset[2],
					icon_offset[3] + 1
				},
				color = Colors.get_color_table_with_alpha("white", 0)
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
					40
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_experience_entry = function (scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				}
			}
		},
		content = {
			description_text = "n/a",
			title_text = "n/a"
		},
		style = {
			title_text = {
				vertical_alignment = "bottom",
				font_size = 24,
				horizontal_alignment = "center",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 0),
				offset = {
					0,
					0,
					0
				}
			},
			description_text = {
				vertical_alignment = "top",
				font_type = "hell_shark",
				font_size = 20,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 0),
				offset = {
					0,
					-size[2],
					0
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_background_masked_text = function (scenegraph_id, size, text, background_texture, font_size, color, text_style, optional_font_style, retained)
	background_texture = background_texture or "summary_screen_03"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	slot10 = {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					retained_mode = retained
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background",
					retained_mode = retained
				}
			}
		},
		content = {
			text = text,
			color = (text_style and text_style.text_color) or color,
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						math.min(size[2] / background_texture_settings.size[2], 1)
					}
				},
				texture_id = background_texture
			}
		}
	}
	slot11 = {}

	if not text_style then
		slot12 = {
			vertical_alignment = "center",
			localize = true,
			horizontal_alignment = "center",
			word_wrap = true,
			font_size = font_size or 24,
			font_type = optional_font_style or "hell_shark_write_mask",
			text_color = color,
			offset = {
				0,
				0,
				2
			}
		}
	end

	slot11.text = slot12
	slot11.background = {
		masked = true,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			0,
			0,
			0
		}
	}
	slot10.style = slot11
	slot10.offset = {
		0,
		0,
		0
	}
	slot10.scenegraph_id = scenegraph_id

	return slot10
end
UIWidgets.create_summary_entry = function (scenegraph_id, size, index)
	return {
		element = {
			passes = {
				{
					style_id = "summary_text",
					pass_type = "text",
					text_id = "summary_text"
				},
				{
					style_id = "summary_text_shadow",
					pass_type = "text",
					text_id = "summary_text"
				},
				{
					style_id = "xp_text",
					pass_type = "text",
					text_id = "xp_text"
				},
				{
					style_id = "xp_text_shadow",
					pass_type = "text",
					text_id = "xp_text"
				}
			}
		},
		content = {
			xp_text = "n/a",
			summary_text = "n/a"
		},
		style = {
			summary_text = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				font_size = 26,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 0),
				offset = {
					0,
					0,
					2
				}
			},
			summary_text_shadow = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				font_size = 26,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					2,
					-2,
					1
				}
			},
			xp_text = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "right",
				font_size = 26,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 0),
				offset = {
					0,
					0,
					2
				}
			},
			xp_text_shadow = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "right",
				font_size = 26,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					2,
					-2,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_chest_score_entry = function (scenegraph_id, size, index)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id"
				},
				{
					pass_type = "texture",
					style_id = "texture_id_saturated",
					texture_id = "texture_id"
				},
				{
					pass_type = "texture",
					style_id = "texture_id_glow",
					texture_id = "texture_id_glow"
				},
				{
					pass_type = "texture",
					style_id = "checkbox",
					texture_id = "checkbox"
				},
				{
					pass_type = "texture",
					style_id = "checkbox_shadow",
					texture_id = "checkbox"
				},
				{
					pass_type = "texture",
					style_id = "marker",
					texture_id = "marker"
				}
			}
		},
		content = {
			text = "n/a",
			texture_id_glow = "icons_placeholder",
			texture_id = "icons_placeholder",
			marker = "tooltip_marker",
			checkbox = "matchmaking_checkbox"
		},
		style = {
			marker = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					13,
					13
				},
				default_size = {
					13,
					13
				},
				color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-10,
					0,
					1
				}
			},
			texture_id = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					80,
					90
				},
				default_size = {
					80,
					90
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			texture_id_saturated = {
				vertical_alignment = "center",
				saturated = true,
				horizontal_alignment = "left",
				texture_size = {
					80,
					90
				},
				default_size = {
					80,
					90
				},
				color = {
					255,
					100,
					100,
					100
				},
				offset = {
					0,
					0,
					0
				}
			},
			checkbox = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					37,
					31
				},
				default_size = {
					37,
					31
				},
				color = Colors.get_color_table_with_alpha("green", 0),
				offset = {
					-18,
					4,
					7
				}
			},
			checkbox_shadow = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					37,
					31
				},
				default_size = {
					37,
					31
				},
				color = Colors.get_color_table_with_alpha("black", 0),
				offset = {
					-16,
					2,
					6
				}
			},
			texture_id_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					80,
					90
				},
				default_size = {
					80,
					90
				},
				color = Colors.get_color_table_with_alpha("font_title", 0),
				offset = {
					0,
					0,
					2
				}
			},
			text = {
				vertical_alignment = "center",
				upper_case = false,
				word_wrap = true,
				horizontal_alignment = "left",
				font_size = 20,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 0),
				offset = {
					80,
					0,
					2
				}
			},
			text_disabled = {
				vertical_alignment = "center",
				upper_case = false,
				word_wrap = true,
				horizontal_alignment = "left",
				font_size = 20,
				font_type = "hell_shark",
				text_color = {
					255,
					50,
					50,
					50
				},
				offset = {
					80,
					0,
					2
				}
			},
			text_shadow = {
				vertical_alignment = "center",
				upper_case = false,
				word_wrap = true,
				horizontal_alignment = "left",
				font_size = 20,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					82,
					-2,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
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
		row_height + row_spacing
	}
	local horizontal_divider_size = {
		size[1],
		horizontal_divider_texture_settings.size[2]
	}
	local top_offset = -100
	local score_top_offset = -120
	local passes = {
		{
			pass_type = "hotspot",
			content_id = "button_hotspot"
		}
	}
	local content = {
		button_hotspot = {},
		frame = frame_settings.texture,
		rows = rows
	}
	local style = {
		frame = {
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				1
			}
		}
	}

	for i = 1, rows, 1 do
		local name_suffix = "_" .. tostring(i)
		local offset = {
			0,
			size[2] - (row_height + row_spacing) * i + score_top_offset,
			0
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		content[hotspot_name] = {
			hover_texture_size = row_size,
			vertical_divider_texture_id = vertical_divider_texture
		}
		style[hotspot_name] = {
			size = row_size,
			offset = {
				offset[1],
				offset[2],
				offset[3]
			}
		}
		local row_bg = "row_bg" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "hover_texture_id",
			pass_type = "tiled_texture",
			content_id = row_bg,
			style_id = row_bg,
			content_check_function = function (content)
				return content.has_background
			end
		}
		content[row_bg] = {
			hover_texture_id = "scoreboard_topic_bg",
			has_background = false
		}
		style[row_bg] = {
			size = row_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				offset[3] + 10
			},
			texture_tiling_size = row_bg_settings.size
		}
		local horizontal_divider = "horizontal_divider" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "horizontal_divider_texture_id",
			pass_type = "tiled_texture",
			content_id = horizontal_divider,
			style_id = horizontal_divider,
			content_check_function = function (content)
				return content.has_horizontal_divider
			end
		}
		content[horizontal_divider] = {
			has_horizontal_divider = false,
			horizontal_divider_texture_id = horizontal_divider_texture
		}
		style[horizontal_divider] = {
			size = horizontal_divider_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] - horizontal_divider_texture_settings.size[2] * 0.5,
				offset[3]
			},
			texture_tiling_size = horizontal_divider_texture_settings.size
		}
		local title_text = "title_text" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = title_text,
			style_id = title_text,
			content_check_function = function (content)
				return content.text ~= nil
			end
		}
		content[title_text] = {}
		style[title_text] = {
			vertical_alignment = "bottom",
			word_wrap = true,
			horizontal_alignment = "left",
			font_type = "hell_shark",
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] + 20,
				offset[2],
				offset[3] + 2
			}
		}
		local player_1_text = "score_player_1" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = player_1_text,
			style_id = player_1_text,
			content_check_function = function (content)
				return content.text ~= nil
			end
		}
		content[player_1_text] = {}
		style[player_1_text] = {
			vertical_alignment = "bottom",
			word_wrap = true,
			horizontal_alignment = "center",
			font_type = "hell_shark",
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] - 450,
				offset[2],
				offset[3] + 2
			}
		}
		local player_2_text = "score_player_2" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = player_2_text,
			style_id = player_2_text,
			content_check_function = function (content)
				return content.text ~= nil
			end
		}
		content[player_2_text] = {}
		style[player_2_text] = {
			vertical_alignment = "bottom",
			word_wrap = true,
			horizontal_alignment = "center",
			font_type = "hell_shark",
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] - 150,
				offset[2],
				offset[3] + 2
			}
		}
		local player_3_text = "score_player_3" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = player_3_text,
			style_id = player_3_text,
			content_check_function = function (content)
				return content.text ~= nil
			end
		}
		content[player_3_text] = {}
		style[player_3_text] = {
			vertical_alignment = "bottom",
			word_wrap = true,
			horizontal_alignment = "center",
			font_type = "hell_shark",
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] + 150,
				offset[2],
				offset[3] + 2
			}
		}
		local player_4_text = "score_player_4" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = "text",
			content_id = player_4_text,
			style_id = player_4_text,
			content_check_function = function (content)
				return content.text ~= nil
			end
		}
		content[player_4_text] = {}
		style[player_4_text] = {
			vertical_alignment = "bottom",
			word_wrap = true,
			horizontal_alignment = "center",
			font_type = "hell_shark",
			font_size = font_size,
			text_color = Colors.get_color_table_with_alpha("white", 200),
			offset = {
				offset[1] + 450,
				offset[2],
				offset[3] + 2
			}
		}
		local high_score_marker_1 = "high_score_marker_1" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "high_score_marker_texture_id",
			pass_type = "texture",
			content_id = high_score_marker_1,
			style_id = high_score_marker_1,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil and content.has_highscore
			end
		}
		content[high_score_marker_1] = {
			high_score_marker_texture_id = "scoreboard_marker",
			has_highscore = false
		}
		style[high_score_marker_1] = {
			size = {
				71,
				39
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] - 450 + 800 + 120,
				offset[2],
				offset[3]
			}
		}
		local high_score_marker_2 = "high_score_marker_2" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "high_score_marker_texture_id",
			pass_type = "texture",
			content_id = high_score_marker_2,
			style_id = high_score_marker_2,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil and content.has_highscore
			end
		}
		content[high_score_marker_2] = {
			high_score_marker_texture_id = "scoreboard_marker",
			has_highscore = false
		}
		style[high_score_marker_2] = {
			size = {
				71,
				39
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] - 150 + 800 + 120,
				offset[2],
				offset[3]
			}
		}
		local high_score_marker_3 = "high_score_marker_3" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "high_score_marker_texture_id",
			pass_type = "texture",
			content_id = high_score_marker_3,
			style_id = high_score_marker_3,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil and content.has_highscore
			end
		}
		content[high_score_marker_3] = {
			high_score_marker_texture_id = "scoreboard_marker",
			has_highscore = false
		}
		style[high_score_marker_3] = {
			size = {
				71,
				39
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + 150 + 800 + 120,
				offset[2],
				offset[3]
			}
		}
		local high_score_marker_4 = "high_score_marker_4" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "high_score_marker_texture_id",
			pass_type = "texture",
			content_id = high_score_marker_4,
			style_id = high_score_marker_4,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil and content.has_highscore
			end
		}
		content[high_score_marker_4] = {
			high_score_marker_texture_id = "scoreboard_marker",
			has_highscore = false
		}
		style[high_score_marker_4] = {
			size = {
				71,
				39
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + 450 + 800 + 120,
				offset[2],
				offset[3]
			}
		}
		local line_divider_1 = "line_divider_1" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "vertical_divider_texture_id",
			pass_type = "texture",
			content_id = hotspot_name,
			style_id = line_divider_1,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end
		}
		style[line_divider_1] = {
			size = {
				4,
				row_height
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] - 450 + 800,
				offset[2],
				offset[3]
			}
		}
		local line_divider_2 = "line_divider_2" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "vertical_divider_texture_id",
			pass_type = "texture",
			content_id = hotspot_name,
			style_id = line_divider_2,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end
		}
		style[line_divider_2] = {
			size = {
				4,
				row_height
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] - 150 + 800,
				offset[2],
				offset[3]
			}
		}
		local line_divider_3 = "line_divider_3" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "vertical_divider_texture_id",
			pass_type = "texture",
			content_id = hotspot_name,
			style_id = line_divider_3,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end
		}
		style[line_divider_3] = {
			size = {
				4,
				row_height
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + 150 + 800,
				offset[2],
				offset[3]
			}
		}
		local line_divider_4 = "line_divider_4" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "vertical_divider_texture_id",
			pass_type = "texture",
			content_id = hotspot_name,
			style_id = line_divider_4,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end
		}
		style[line_divider_4] = {
			size = {
				4,
				row_height
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + 450 + 800,
				offset[2],
				offset[3]
			}
		}
		local line_divider_5 = "line_divider_5" .. name_suffix
		passes[#passes + 1] = {
			texture_id = "vertical_divider_texture_id",
			pass_type = "texture",
			content_id = hotspot_name,
			style_id = line_divider_5,
			content_check_function = function (content)
				return content.parent["title_text" .. name_suffix].text ~= nil and content.parent["score_player_1" .. name_suffix].text ~= nil
			end
		}
		style[line_divider_5] = {
			size = {
				4,
				row_height
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + 750 + 800,
				offset[2],
				offset[3]
			}
		}
	end

	local widget = {
		element = {
			passes = passes
		},
		content = content,
		style = style,
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end
UIWidgets.create_level_up_widget = function (scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "level_text",
					pass_type = "text",
					text_id = "level_text"
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				}
			}
		},
		content = {
			background = "level_up_bg",
			title_text = "Level up",
			level_text = "9999"
		},
		style = {
			title_text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 36,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 0),
				offset = {
					0,
					35,
					1
				}
			},
			level_text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 40,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 0),
				offset = {
					0,
					-35,
					1
				}
			},
			background = {
				offset = {
					-10,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_experience_bar = function (scenegraph_id, size, masked)
	local frame_settings = UIFrameSettings.menu_frame_06

	return {
		element = {
			passes = {
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame",
					content_check_function = function (content)
						return content.draw_frame
					end
				},
				{
					texture_id = "glass",
					style_id = "glass",
					pass_type = "texture"
				},
				{
					style_id = "level_text_from",
					pass_type = "text",
					text_id = "level_text_from"
				},
				{
					style_id = "level_text_to",
					pass_type = "text",
					text_id = "level_text_to"
				},
				{
					style_id = "counter_text",
					pass_type = "text",
					text_id = "counter_text"
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					style_id = "experience_bar",
					pass_type = "texture_uv",
					content_id = "experience_bar"
				},
				{
					pass_type = "texture",
					style_id = "mask_rect",
					texture_id = "mask_rect"
				}
			}
		},
		content = {
			counter_text = "",
			level_text_to = "",
			mask_rect = "mask_rect",
			glass = "xp_bar_glass",
			level_text_from = "",
			background = "xp_bar_bg",
			draw_frame = true,
			experience_bar = {
				texture_id = "end_screen_experience_bar",
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
			},
			frame = frame_settings.texture
		},
		style = {
			mask_rect = {
				size = {
					size[1],
					size[2] + 100,
					size[3]
				},
				offset = {
					0,
					-50,
					0
				}
			},
			background = {
				masked = masked,
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					0
				}
			},
			experience_bar = {
				masked = masked,
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				default_size = {
					size[1] - frame_settings.texture_sizes.horizontal[2],
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					2
				}
			},
			glass = {
				masked = masked,
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - frame_settings.texture_sizes.horizontal[2] * 2,
					size[2] - frame_settings.texture_sizes.vertical[1] * 2
				},
				offset = {
					frame_settings.texture_sizes.horizontal[2],
					frame_settings.texture_sizes.vertical[1],
					4
				}
			},
			frame = {
				masked = masked,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					3
				}
			},
			counter_text = {
				vertical_alignment = "top",
				font_size = 28,
				horizontal_alignment = "center",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					-size[2] - 5,
					0
				}
			},
			level_text_from = {
				vertical_alignment = "center",
				font_size = 36,
				horizontal_alignment = "right",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					-size[1] - 10,
					0,
					0
				}
			},
			level_text_to = {
				vertical_alignment = "center",
				font_size = 36,
				horizontal_alignment = "left",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					size[1] + 10,
					0,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_summary_experience_bar = function (scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					style_id = "counter_text",
					pass_type = "text",
					text_id = "counter_text"
				},
				{
					style_id = "counter_text_shadow",
					pass_type = "text",
					text_id = "counter_text"
				},
				{
					texture_id = "experience_bar",
					style_id = "experience_bar",
					pass_type = "texture"
				},
				{
					texture_id = "experience_bar_end",
					style_id = "experience_bar_end",
					pass_type = "texture"
				}
			}
		},
		content = {
			experience_bar = "summary_screen_fill",
			level_text_from = "",
			level_text_to = "",
			counter_text = "",
			experience_bar_end = "summary_screen_fill_glow"
		},
		style = {
			experience_bar = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = size,
				default_size = size,
				offset = {
					0,
					0,
					2
				}
			},
			experience_bar_end = {
				color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					132,
					size[2]
				},
				offset = {
					0,
					0,
					2
				}
			},
			counter_text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 28,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					0,
					0,
					4
				}
			},
			counter_text_shadow = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 28,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					3
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_talent_tab = function (scenegraph_id, size)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local background_color = {
		220,
		20,
		15,
		15
	}
	local slot_color = Colors.get_color_table_with_alpha("dim_gray", 40)
	local border_color = Colors.get_color_table_with_alpha("white", 150)
	local icon_size = {
		120,
		120
	}
	local offset = {
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
	local hotspot_name = "button_hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name
	}
	style[hotspot_name] = {
		size = size,
		offset = offset
	}
	content[hotspot_name] = {
		is_selected = false,
		drag_texture_size = size
	}
	local icon_name = "icon"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = icon_name,
		style_id = icon_name,
		content_check_function = function (content)
			return content[icon_name]
		end
	}
	style[icon_name] = {
		size = icon_size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1] + (size[1] - icon_size[1]) / 2,
			(offset[2] + size[2] - icon_size[2]) - (size[1] - icon_size[1]) / 2,
			3
		}
	}
	content[hotspot_name][icon_name] = "placeholder_loot_chest"
	local frame_background_rect_name = "frame_bg"
	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = frame_background_rect_name
	}
	style[frame_background_rect_name] = {
		thickness = 1,
		size = size,
		color = background_color,
		offset = {
			offset[1] + (size[1] - size[1]) / 2,
			(offset[2] + size[2] - size[2]) - (size[1] - size[1]) / 2,
			2
		}
	}
	local selection_background_rect_name = "selection_frame_bg"
	passes[#passes + 1] = {
		pass_type = "border",
		style_id = selection_background_rect_name,
		content_check_function = function (content)
			return content[hotspot_name].is_selected
		end
	}
	style[selection_background_rect_name] = {
		size = {
			size[1] + 2,
			size[2] + 2
		},
		color = {
			255,
			0,
			255,
			0
		},
		offset = {
			(offset[1] + (size[1] - size[1]) / 2) - 0.5,
			(offset[2] + size[2] - size[2]) - (size[1] - size[1]) / 2 - 1,
			0
		}
	}
	local slot_hover_name = "slot_hover"
	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = slot_border_name,
		style_id = slot_hover_name,
		content_check_function = function (content)
			return content[icon_name] and content.is_hover
		end
	}
	style[slot_hover_name] = {
		size = size,
		texture_size = {
			258,
			258
		},
		texture_sizes = {
			corner = {
				20,
				20
			},
			vertical = {
				6,
				1
			},
			horizontal = {
				1,
				6
			}
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2],
			5
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_tab_selector = function (scenegraph_id, size, height, slot_icons, slot_texts)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local background_texture = "tab_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local use_texts = slot_texts ~= nil
	local amount = (use_texts and #slot_texts) or #slot_icons
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		amount = amount
	}
	local style = {}
	local slot_width_spacing = 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local slot_size = {
		tab_width,
		height
	}
	local icon_size = {
		34,
		34
	}
	local start_width_offset = 0
	local frame_settings = UIFrameSettings.menu_tab_frame_01

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		total_length = total_length + slot_size[1] + slot_width_spacing
		local offset = {
			start_width_offset,
			0,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = slot_size,
			offset = offset
		}
		content[hotspot_name] = {}
		local hotspot_content = content[hotspot_name]
		local background_name = "background" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_uv",
			content_id = background_name,
			style_id = background_name
		}
		style[background_name] = {
			size = slot_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				0
			}
		}
		content[background_name] = {
			uvs = {
				{
					0,
					0
				},
				{
					slot_size[1] / background_texture_settings.size[1],
					slot_size[2] / background_texture_settings.size[2]
				}
			},
			texture_id = background_texture
		}
		local background_glow_name = "background_glow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = background_glow_name,
			style_id = background_glow_name,
			content_check_function = function (content)
				return content.is_selected or content.is_hover
			end
		}
		style[background_glow_name] = {
			size = {
				slot_size[1],
				30
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				2
			}
		}
		hotspot_content[background_glow_name] = "tabs_glow"
		local glass_bottom_name = "glass_bottom" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_bottom_name,
			style_id = glass_bottom_name
		}
		style[glass_bottom_name] = {
			size = {
				slot_size[1],
				3
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] + frame_settings.texture_sizes.vertical[1],
				1
			}
		}
		hotspot_content[glass_bottom_name] = "tabs_glass_bottom"
		local glass_top_name = "glass_top" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_top_name,
			style_id = glass_top_name
		}
		style[glass_top_name] = {
			size = {
				slot_size[1],
				3
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				(offset[2] + slot_size[2]) - (frame_settings.texture_sizes.vertical[1] + 3),
				1
			}
		}
		hotspot_content[glass_top_name] = "tabs_glass_top"
		local frame_name = "frame" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_frame",
			content_id = hotspot_name,
			texture_id = frame_name,
			style_id = frame_name
		}
		style[frame_name] = {
			size = slot_size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				3
			}
		}
		hotspot_content[frame_name] = frame_settings.texture

		if use_texts then
			local title_text_name = "title_text" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "text",
				content_id = hotspot_name,
				text_id = title_text_name,
				style_id = title_text_name
			}
			style[title_text_name] = {
				vertical_alignment = "center",
				font_size = 24,
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = slot_size,
				offset = {
					offset[1],
					offset[2],
					7
				}
			}
			hotspot_content[title_text_name] = slot_texts[k] or "n/a"
		else
			local icon_texture = slot_icons[k]
			local icon_name = "icon" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = icon_name,
				style_id = icon_name
			}
			style[icon_name] = {
				size = icon_size,
				color = default_color,
				offset = {
					(offset[1] + slot_size[1] / 2) - icon_size[1] / 2,
					(offset[2] + slot_size[2] / 2) - icon_size[1] / 2,
					2
				}
			}
			hotspot_content[icon_name] = icon_texture
		end

		local edge_fade_name = "edge_fade" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = edge_fade_name,
			style_id = edge_fade_name,
			content_check_function = function (content)
				return not content.is_selected
			end
		}
		style[edge_fade_name] = {
			size = {
				slot_size[1],
				15
			},
			color = {
				200,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] + frame_settings.texture_sizes.vertical[1],
				5
			}
		}
		hotspot_content[edge_fade_name] = "edge_fade_small"
		local selection_top_line_name = "selection_top_line" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = selection_top_line_name,
			style_id = selection_top_line_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_top_line_name] = {
			size = {
				slot_size[1] - 2,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + 1,
				(offset[2] + slot_size[2]) - 13,
				5
			}
		}
		hotspot_content[selection_top_line_name] = "tab_selection_01_stretch"
		local selection_top_detail_name = "selection_top_detail" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = selection_top_detail_name,
			style_id = selection_top_detail_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_top_detail_name] = {
			size = {
				35,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + slot_size[1] / 2 - 17.5,
				(offset[2] + slot_size[2]) - 13,
				6
			}
		}
		hotspot_content[selection_top_detail_name] = "tab_selection_01_middle"
		local selection_top_left_name = "selection_top_left" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = selection_top_left_name,
			style_id = selection_top_left_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_top_left_name] = {
			size = {
				11,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] - 4,
				(offset[2] + slot_size[2]) - 13,
				6
			}
		}
		hotspot_content[selection_top_left_name] = "tab_selection_01_left"
		local selection_top_right_name = "selection_top_right" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = selection_top_right_name,
			style_id = selection_top_right_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_top_right_name] = {
			size = {
				11,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(offset[1] + slot_size[1]) - 7,
				(offset[2] + slot_size[2]) - 13,
				6
			}
		}
		hotspot_content[selection_top_right_name] = "tab_selection_01_right"
		local selection_bottom_detail_name = "selection_bottom_detail" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = selection_bottom_detail_name,
			style_id = selection_bottom_detail_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_bottom_detail_name] = {
			size = {
				45,
				12
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + slot_size[1] / 2 - 22.5,
				offset[2] - 4,
				50
			}
		}
		hotspot_content[selection_bottom_detail_name] = "tab_selection_01_bottom"
		start_width_offset = start_width_offset + tab_width + slot_width_spacing
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		-frame_settings.texture_sizes.vertical[1],
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_character_selection_frame = function (scenegraph_id, size)
	local background_texture = "tab_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_06
	local portrait_center_position = {
		0,
		size[2] / 2
	}
	local text_width_offset = 75

	return {
		element = {
			passes = {
				{
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "glass_top",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass_bottom",
					style_id = "glass_bottom",
					pass_type = "texture"
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end
				},
				{
					texture_id = "portrait",
					style_id = "portrait",
					pass_type = "texture"
				},
				{
					texture_id = "portrait_frame",
					style_id = "portrait_frame",
					pass_type = "texture"
				},
				{
					texture_id = "fade_texture",
					style_id = "fade_texture",
					pass_type = "rotated_texture"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "level_text",
					pass_type = "text",
					text_id = "level_text"
				}
			}
		},
		content = {
			portrait = "unit_frame_portrait_dead",
			title_text = "n/a",
			level_text = "n/a",
			portrait_frame = "unit_frame_01",
			fade_texture = "edge_fade_small",
			glow = "tabs_glow",
			glass_top = "tabs_glass_top",
			glass_bottom = "tabs_glass_bottom",
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2]
					}
				},
				texture_id = background_texture
			},
			button_hotspot = {},
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2]
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				}
			},
			glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					3
				},
				size = {
					size[1],
					3
				}
			},
			glass_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					3
				},
				size = {
					size[1],
					3
				}
			},
			fade_texture = {
				size = {
					size[2],
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					portrait_center_position[1] - 20,
					-15,
					2
				},
				pivot = {
					size[2],
					15
				},
				angle = math.degrees_to_radians(90)
			},
			portrait = {
				size = {
					66,
					101
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					portrait_center_position[1] - 33,
					portrait_center_position[2] - 50.5,
					5
				}
			},
			portrait_frame = {
				size = {
					141,
					198
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					portrait_center_position[1] - 70.5,
					portrait_center_position[2] - 99,
					6
				}
			},
			title_text = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 20,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = {
					size[1] - text_width_offset,
					35
				},
				offset = {
					text_width_offset,
					size[2] - 35,
					4
				}
			},
			level_text = {
				vertical_alignment = "top",
				font_type = "hell_shark",
				font_size = 18,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				size = {
					size[1] - text_width_offset,
					35
				},
				offset = {
					text_width_offset,
					size[2] - 70,
					4
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end
UIWidgets.create_career_summary_window = function (scenegraph_id, size)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = UIFrameSettings.menu_frame_06
	local icon_size = {
		60,
		60
	}

	return {
		element = {
			passes = {
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					style_id = "active_ability_title_text",
					pass_type = "text",
					text_id = "active_ability_title_text"
				},
				{
					style_id = "passive_ability_title_text",
					pass_type = "text",
					text_id = "passive_ability_title_text"
				},
				{
					style_id = "active_ability_description_text",
					pass_type = "text",
					text_id = "active_ability_description_text"
				},
				{
					style_id = "passive_ability_description_text",
					pass_type = "text",
					text_id = "passive_ability_description_text"
				},
				{
					texture_id = "active_ability",
					style_id = "active_ability",
					pass_type = "texture"
				},
				{
					texture_id = "passive_ability",
					style_id = "passive_ability",
					pass_type = "texture"
				}
			}
		},
		content = {
			passive_ability_description_text = "n/a",
			title_text = "n/a",
			passive_ability_title_text = "n/a",
			active_ability_title_text = "n/a",
			passive_ability = "icons_placeholder",
			active_ability = "icons_placeholder",
			active_ability_description_text = "n/a",
			description_text = "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2]
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			title_text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					size[2] - 55,
					2
				},
				size = {
					size[1],
					30
				}
			},
			description_text = {
				vertical_alignment = "top",
				font_size = 20,
				horizontal_alignment = "left",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					size[2] - 100,
					2
				},
				size = {
					size[1] - 40,
					30
				}
			},
			active_ability = {
				color = {
					255,
					255,
					255,
					255
				},
				size = {
					60,
					60
				},
				offset = {
					20,
					size[2] - 300,
					3
				}
			},
			passive_ability = {
				color = {
					255,
					255,
					255,
					255
				},
				size = icon_size,
				offset = {
					20,
					size[2] - 500,
					3
				}
			},
			active_ability_title_text = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 22,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					icon_size[1] + 40,
					size[2] - 300,
					2
				},
				size = {
					size[1] - (icon_size[1] + 60),
					icon_size[2]
				}
			},
			passive_ability_title_text = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 22,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					icon_size[1] + 40,
					size[2] - 500,
					2
				},
				size = {
					size[1] - (icon_size[1] + 60),
					icon_size[2]
				}
			},
			active_ability_description_text = {
				vertical_alignment = "top",
				font_type = "hell_shark",
				font_size = 20,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					0,
					2
				},
				size = {
					size[1] - 40,
					size[2] - size[2] - 300 - 20
				}
			},
			passive_ability_description_text = {
				vertical_alignment = "top",
				font_type = "hell_shark",
				font_size = 20,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					0,
					2
				},
				size = {
					size[1] - 40,
					size[2] - size[2] - 500 - 20
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end
UIWidgets.create_default_button = function (scenegraph_id, size, frame_name, background_texture, text, font_size, optional_color_name, optional_detail_texture, optional_detail_offset)
	background_texture = background_texture or "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = (frame_name and UIFrameSettings[frame_name]) or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = optional_detail_texture or "button_detail_01"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size

	return {
		element = {
			passes = {
				{
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "background_fade",
					style_id = "background_fade",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect"
				},
				{
					style_id = "disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail"
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					texture_id = "glass",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass",
					style_id = "glass_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			background_fade = "button_bg_fade",
			side_detail = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				texture_id = side_detail_texture
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150
				},
				offset = {
					0,
					0,
					0
				}
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					frame_width,
					frame_width - 2,
					2
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 2,
					3
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80)
				}
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				}
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20
				},
				offset = {
					0,
					0,
					1
				}
			},
			title_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					6
				}
			},
			title_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					6
				}
			},
			title_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					5
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					8
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					4
				},
				size = {
					size[1],
					11
				}
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 9,
					4
				},
				size = {
					size[1],
					11
				}
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					(optional_detail_offset and -optional_detail_offset) or -9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - side_detail_texture_size[1] + (optional_detail_offset or 9),
					size[2] / 2 - side_detail_texture_size[2] / 2,
					9
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_default_image_button = function (scenegraph_id, size, frame_name, background_texture, text, font_size, background_icon, optional_color_name, optional_detail_texture, optional_detail_offset)
	background_texture = background_texture or "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = (frame_name and UIFrameSettings[frame_name]) or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = optional_detail_texture or "button_detail_01"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	background_icon = background_icon or "loot_chest_icon"
	local background_icon_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_icon)
	local background_icon_size = (background_icon_settings and background_icon_settings.size) or {
		200,
		200
	}
	local background_icon_scale = 1 - math.min(size[2] / background_icon_size[2], 1)
	local background_icon_width_fraction = 0.9
	local background_icon_size = {
		background_icon_size[1] * background_icon_width_fraction,
		size[2]
	}

	return {
		element = {
			passes = {
				{
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "background_fade",
					style_id = "background_fade",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect"
				},
				{
					style_id = "disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail"
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					texture_id = "glass",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass",
					style_id = "glass_bottom",
					pass_type = "texture"
				},
				{
					style_id = "background_icon",
					pass_type = "texture_uv",
					content_id = "background_icon"
				},
				{
					texture_id = "new_texture",
					style_id = "new_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.new
					end
				}
			}
		},
		content = {
			hover_glow = "button_state_default",
			glass = "button_glass_02",
			background_fade = "button_bg_fade",
			new_texture = "list_item_tag_new",
			side_detail = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				texture_id = side_detail_texture
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background_icon = {
				uvs = {
					{
						0,
						0.5 * background_icon_scale
					},
					{
						background_icon_width_fraction,
						1 - background_icon_scale / 2
					}
				},
				texture_id = background_icon
			},
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150
				},
				offset = {
					0,
					0,
					0
				}
			},
			background_icon = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					size[1] - background_icon_size[1],
					size[2] / 2 - background_icon_size[2] / 2,
					1
				},
				size = background_icon_size
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					frame_width,
					frame_width - 2,
					3
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 2,
					4
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80)
				}
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					8
				}
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20
				},
				offset = {
					0,
					0,
					2
				}
			},
			new_texture = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 126,
					size[2] / 2 - 25.5,
					7
				},
				size = {
					126,
					51
				}
			},
			title_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					30,
					0,
					7
				}
			},
			title_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					30,
					0,
					7
				}
			},
			title_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					32,
					-2,
					6
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					9
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					5
				},
				size = {
					size[1],
					11
				}
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 9,
					5
				},
				size = {
					size[1],
					11
				}
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					(optional_detail_offset and -optional_detail_offset) or -9,
					size[2] / 2 - side_detail_texture_size[2] / 2,
					10
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - side_detail_texture_size[1] + (optional_detail_offset or 9),
					size[2] / 2 - side_detail_texture_size[2] / 2,
					10
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_default_icon_tabs = function (scenegraph_id, size, amount)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		amount = amount
	}
	local style = {}
	local slot_width_spacing = 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local button_size = {
		tab_width,
		size[2]
	}
	local icon_size = {
		34,
		34
	}
	local start_width_offset = 0

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		total_length = total_length + button_size[1] + slot_width_spacing
		local offset = {
			start_width_offset,
			0,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = button_size,
			offset = offset
		}
		content[hotspot_name] = {}
		local hotspot_content = content[hotspot_name]
		local background_name = "background" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_uv",
			content_id = background_name,
			style_id = background_name
		}
		style[background_name] = {
			size = button_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				0
			}
		}
		content[background_name] = {
			uvs = {
				{
					0,
					1 - math.min(button_size[2] / background_texture_settings.size[2], 1)
				},
				{
					math.min(button_size[1] / background_texture_settings.size[1], 1),
					1
				}
			},
			texture_id = background_texture
		}
		local background_fade_name = "background_fade" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = background_fade_name,
			style_id = background_fade_name
		}
		style[background_fade_name] = {
			size = {
				button_size[1],
				button_size[2]
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				1
			}
		}
		hotspot_content[background_fade_name] = "button_bg_fade"
		local hover_glow_name = "hover_glow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = hover_glow_name,
			style_id = hover_glow_name
		}
		style[hover_glow_name] = {
			size = {
				button_size[1],
				math.min(button_size[2] - 5, 80)
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] + 5,
				2
			}
		}
		hotspot_content[hover_glow_name] = "button_state_default"
		local clicked_rect_name = "clicked_rect" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rect",
			content_id = hotspot_name,
			style_id = clicked_rect_name
		}
		style[clicked_rect_name] = {
			size = button_size,
			color = {
				100,
				0,
				0,
				0
			},
			offset = {
				offset[1],
				offset[2],
				6
			}
		}
		local glass_top_name = "glass_top" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_top_name,
			style_id = glass_top_name
		}
		style[glass_top_name] = {
			size = {
				button_size[1],
				11
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				(offset[2] + button_size[2]) - 11,
				5
			}
		}
		hotspot_content[glass_top_name] = "button_glass_02"
		local glass_bottom_name = "glass_bottom" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_bottom_name,
			style_id = glass_bottom_name
		}
		style[glass_bottom_name] = {
			size = {
				button_size[1],
				11
			},
			color = {
				100,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] - 3,
				5
			}
		}
		hotspot_content[glass_bottom_name] = "button_glass_02"
		local icon_name = "icon" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = icon_name,
			style_id = icon_name
		}
		style[icon_name] = {
			size = icon_size,
			color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				(offset[1] + button_size[1] / 2) - icon_size[1] / 2,
				(offset[2] + button_size[2] / 2) - icon_size[1] / 2 + 4,
				4
			}
		}
		hotspot_content[icon_name] = "tabs_inventory_icon_trinkets_selected"
		local icon_shadow_name = "icon_shadow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = icon_name,
			style_id = icon_shadow_name
		}
		style[icon_shadow_name] = {
			size = icon_size,
			color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				(offset[1] + button_size[1] / 2) - icon_size[1] / 2 + 2,
				(offset[2] + button_size[2] / 2) - icon_size[1] / 2 + 2,
				3
			}
		}
		start_width_offset = start_width_offset + tab_width + slot_width_spacing
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_default_checkbox_button = function (scenegraph_id, size, text, font_size, tooltip_info)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {}
	local style = {}
	local offset = {
		0,
		0,
		0
	}
	local hotspot_name = "button_hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name
	}
	style[hotspot_name] = {
		size = size,
		offset = offset
	}
	content[hotspot_name] = {}
	local hotspot_content = content[hotspot_name]
	local background_name = "background"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name
	}
	style[background_name] = {
		size = size,
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2],
			0
		}
	}
	content[background_name] = {
		uvs = {
			{
				0,
				1 - math.min(size[2] / background_texture_settings.size[2], 1)
			},
			{
				math.min(size[1] / background_texture_settings.size[1], 1),
				1
			}
		},
		texture_id = background_texture
	}
	local background_fade_name = "background_fade"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = background_fade_name,
		style_id = background_fade_name
	}
	style[background_fade_name] = {
		size = {
			size[1],
			size[2]
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2],
			1
		}
	}
	hotspot_content[background_fade_name] = "button_bg_fade"
	local hover_glow_name = "hover_glow"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = hover_glow_name,
		style_id = hover_glow_name
	}
	style[hover_glow_name] = {
		size = {
			size[1],
			math.min(size[2] - 5, 80)
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2] + 5,
			2
		}
	}
	hotspot_content[hover_glow_name] = "button_state_default"
	local clicked_rect_name = "clicked_rect"
	passes[#passes + 1] = {
		pass_type = "rect",
		content_id = hotspot_name,
		style_id = clicked_rect_name
	}
	style[clicked_rect_name] = {
		size = size,
		color = {
			100,
			0,
			0,
			0
		},
		offset = {
			offset[1],
			offset[2],
			6
		}
	}
	local glass_top_name = "glass_top"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_top_name,
		style_id = glass_top_name
	}
	style[glass_top_name] = {
		size = {
			size[1],
			11
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			(offset[2] + size[2]) - 11,
			5
		}
	}
	hotspot_content[glass_top_name] = "button_glass_02"
	local glass_bottom_name = "glass_bottom"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_bottom_name,
		style_id = glass_bottom_name
	}
	style[glass_bottom_name] = {
		size = {
			size[1],
			11
		},
		color = {
			100,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2] - 3,
			5
		}
	}
	hotspot_content[glass_bottom_name] = "button_glass_02"

	if tooltip_info then
		local tooltip_name = "additional_option_info"
		passes[#passes + 1] = {
			pass_type = "additional_option_tooltip",
			content_id = hotspot_name,
			style_id = background_name,
			additional_option_id = tooltip_name,
			content_check_function = function (content)
				return content.is_hover
			end
		}
		hotspot_content[tooltip_name] = tooltip_info
	end

	local text_name = "text"
	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_name,
		content_check_function = function (content)
			return not content.disable_button
		end
	}
	style[text_name] = {
		upper_case = true,
		word_wrap = true,
		font_size = 24,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		select_text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			offset[1] + 10,
			offset[2] + 3,
			4
		},
		size = size
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
		end
	}
	style[text_disabled_name] = {
		upper_case = true,
		font_size = 24,
		word_wrap = true,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("gray", 255),
		default_text_color = Colors.get_color_table_with_alpha("gray", 255),
		offset = {
			offset[1] + 10,
			offset[2] + 3,
			4
		},
		size = size
	}
	local text_shadow_name = "text_shadow"
	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_shadow_name
	}
	style[text_shadow_name] = {
		font_size = 24,
		upper_case = true,
		word_wrap = true,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			offset[1] + 10 + 2,
			offset[2] + 1,
			3
		},
		size = size
	}
	local checkbox_background_name = "checkbox_background"
	passes[#passes + 1] = {
		pass_type = "rect",
		style_id = checkbox_background_name
	}
	local checkbox_size = {
		25,
		25
	}
	local checkbox_offset = {
		(size[1] - checkbox_size[1] + offset[1]) - 20,
		(offset[2] + size[2] / 2) - checkbox_size[2] / 2 + 2,
		3
	}
	style[checkbox_background_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2]
		},
		offset = checkbox_offset,
		color = {
			255,
			0,
			0,
			0
		}
	}
	local checkbox_frame_name = "checkbox_frame"
	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = checkbox_frame_name,
		style_id = checkbox_frame_name,
		content_check_function = function (content)
			return not content.is_disabled
		end
	}
	local frame_settings = UIFrameSettings.menu_frame_06
	hotspot_content[checkbox_frame_name] = frame_settings.texture
	style[checkbox_frame_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2]
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset[1],
			checkbox_offset[2],
			checkbox_offset[3] + 1
		},
		color = {
			255,
			255,
			255,
			255
		}
	}
	local checkbox_frame_disabled_name = "checkbox_frame_disabled"
	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = checkbox_frame_name,
		style_id = checkbox_frame_disabled_name,
		content_check_function = function (content)
			return not content.is_disabled
		end
	}
	style[checkbox_frame_disabled_name] = {
		size = {
			checkbox_size[1],
			checkbox_size[2]
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset[1],
			checkbox_offset[2],
			checkbox_offset[3] + 1
		},
		color = {
			96,
			255,
			255,
			255
		}
	}
	local checkbox_marker_name = "checkbox_marker"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = checkbox_marker_name,
		style_id = checkbox_marker_name,
		content_check_function = function (content)
			return content.is_selected and not content.disable_button
		end
	}
	hotspot_content[checkbox_marker_name] = "matchmaking_checkbox"
	local marker_size = {
		22,
		16
	}
	local marker_offset = {
		checkbox_offset[1] + 4,
		(checkbox_offset[2] + marker_size[2] / 2) - 1,
		checkbox_offset[3] + 2
	}
	style[checkbox_marker_name] = {
		size = marker_size,
		offset = marker_offset,
		color = Colors.get_color_table_with_alpha("white", 255)
	}
	local checkbox_marker_disabled_name = "checkbox_marker_disabled"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = checkbox_marker_name,
		style_id = checkbox_marker_disabled_name,
		content_check_function = function (content)
			return content.is_selected and content.disable_button
		end
	}
	style[checkbox_marker_disabled_name] = {
		size = marker_size,
		offset = marker_offset,
		color = Colors.get_color_table_with_alpha("gray", 255)
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_default_text_tabs = function (scenegraph_id, size, amount)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		amount = amount
	}
	local style = {}
	local slot_width_spacing = 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local button_size = {
		tab_width,
		size[2]
	}
	local icon_size = {
		34,
		34
	}
	local start_width_offset = 0

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		total_length = total_length + button_size[1] + slot_width_spacing
		local offset = {
			start_width_offset,
			0,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = button_size,
			offset = offset
		}
		content[hotspot_name] = {}
		local hotspot_content = content[hotspot_name]
		local background_name = "background" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_uv",
			content_id = background_name,
			style_id = background_name
		}
		style[background_name] = {
			size = button_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				0
			}
		}
		content[background_name] = {
			uvs = {
				{
					0,
					1 - math.min(button_size[2] / background_texture_settings.size[2], 1)
				},
				{
					math.min(button_size[1] / background_texture_settings.size[1], 1),
					1
				}
			},
			texture_id = background_texture
		}
		local background_fade_name = "background_fade" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = background_fade_name,
			style_id = background_fade_name
		}
		style[background_fade_name] = {
			size = {
				button_size[1],
				button_size[2]
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				1
			}
		}
		hotspot_content[background_fade_name] = "button_bg_fade"
		local hover_glow_name = "hover_glow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = hover_glow_name,
			style_id = hover_glow_name
		}
		style[hover_glow_name] = {
			size = {
				button_size[1],
				math.min(button_size[2] - 5, 80)
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] + 5,
				2
			}
		}
		hotspot_content[hover_glow_name] = "button_state_default"
		local clicked_rect_name = "clicked_rect" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rect",
			content_id = hotspot_name,
			style_id = clicked_rect_name
		}
		style[clicked_rect_name] = {
			size = button_size,
			color = {
				100,
				0,
				0,
				0
			},
			offset = {
				offset[1],
				offset[2],
				6
			}
		}
		local glass_top_name = "glass_top" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_top_name,
			style_id = glass_top_name
		}
		style[glass_top_name] = {
			size = {
				button_size[1],
				11
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				(offset[2] + button_size[2]) - 11,
				5
			}
		}
		hotspot_content[glass_top_name] = "button_glass_02"
		local glass_bottom_name = "glass_bottom" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_bottom_name,
			style_id = glass_bottom_name
		}
		style[glass_bottom_name] = {
			size = {
				button_size[1],
				11
			},
			color = {
				100,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] - 3,
				5
			}
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
			end
		}
		style[text_name] = {
			upper_case = true,
			word_wrap = true,
			font_size = 24,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				offset[1],
				offset[2] + 3,
				4
			},
			size = button_size
		}
		hotspot_content[text_name] = "n/a"
		local text_disabled_name = "text_disabled" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			content_id = hotspot_name,
			text_id = text_name,
			style_id = text_disabled_name,
			content_check_function = function (content)
				return content.disable_button
			end
		}
		style[text_disabled_name] = {
			upper_case = true,
			font_size = 24,
			word_wrap = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("gray", 255),
			default_text_color = Colors.get_color_table_with_alpha("gray", 255),
			offset = {
				offset[1],
				offset[2] + 3,
				4
			},
			size = button_size
		}
		local text_shadow_name = "text_shadow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			content_id = hotspot_name,
			text_id = text_name,
			style_id = text_shadow_name
		}
		style[text_shadow_name] = {
			font_size = 24,
			upper_case = true,
			word_wrap = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				offset[1] + 2,
				offset[2] + 1,
				3
			},
			size = button_size
		}
		start_width_offset = start_width_offset + tab_width + slot_width_spacing
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
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
					style_id = "background",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "background_fade",
					style_id = "background_fade",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect"
				},
				{
					style_id = "disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					texture_id = "glass",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass",
					style_id = "glass_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			glass = "button_glass_02",
			hover_glow = "button_state_default",
			background_fade = "button_bg_fade",
			button_hotspot = {},
			title_text = text or "n/a",
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = {
					255,
					150,
					150,
					150
				},
				offset = {
					0,
					0,
					0
				}
			},
			background_fade = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					2
				},
				size = {
					size[1],
					size[2]
				}
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					3
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80)
				}
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				}
			},
			disabled_rect = {
				color = {
					150,
					20,
					20,
					20
				},
				offset = {
					0,
					0,
					1
				}
			},
			title_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					3,
					6
				}
			},
			title_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					3,
					6
				}
			},
			title_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					1,
					5
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 11,
					4
				},
				size = {
					size[1],
					11
				}
			},
			glass_bottom = {
				color = {
					100,
					255,
					255,
					255
				},
				offset = {
					0,
					-3,
					4
				},
				size = {
					size[1],
					11
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_window_category_button = function (scenegraph_id, size, button_text, icon_name, background_icon)
	icon_name = icon_name or "options_button_icon_quickplay"
	local icon_glow_name = icon_name .. "_glow"
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
					style_id = "background",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "background_fade",
					style_id = "background_fade",
					pass_type = "texture"
				},
				{
					style_id = "background_icon",
					pass_type = "texture",
					texture_id = "background_icon",
					content_check_function = function (content)
						return content.background_icon
					end,
					content_change_function = function (content, style)
						local button_hotspot = content.button_hotspot

						if not button_hotspot.disable_button and not button_hotspot.is_selected then
						end

						return 
					end
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					texture_id = "new_texture",
					style_id = "new_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.new
					end
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "icon",
					style_id = "icon_disabled",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "icon_selected",
					style_id = "icon_selected",
					pass_type = "texture"
				},
				{
					texture_id = "icon_frame",
					style_id = "icon_frame",
					pass_type = "texture"
				},
				{
					texture_id = "icon_glass",
					style_id = "icon_glass",
					pass_type = "texture"
				},
				{
					texture_id = "icon_bg_glow",
					style_id = "icon_bg_glow",
					pass_type = "texture"
				},
				{
					texture_id = "glass",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass",
					style_id = "glass_bottom",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture"
				},
				{
					texture_id = "select_glow",
					style_id = "select_glow",
					pass_type = "texture"
				},
				{
					texture_id = "skull_select_glow",
					style_id = "skull_select_glow",
					pass_type = "texture"
				},
				{
					style_id = "button_text",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "button_text_disabled",
					pass_type = "text",
					text_id = "button_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "button_text_shadow",
					pass_type = "text",
					text_id = "button_text"
				},
				{
					pass_type = "rect",
					style_id = "button_clicked_rect"
				},
				{
					style_id = "button_disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				}
			}
		},
		content = {
			icon_glass = "menu_options_button_fg",
			hover_glow = "button_state_default",
			icon_frame = "menu_options_button_bg",
			skull_select_glow = "menu_options_button_glow_03",
			select_glow = "button_state_default_2",
			glass = "button_glass_02",
			background_fade = "button_bg_fade",
			icon_bg_glow = "menu_options_button_glow_01",
			new_texture = "list_item_tag_new",
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
						1 - math.min(size[2] / background_texture_settings.size[2], 1)
					},
					{
						math.min(size[1] / background_texture_settings.size[1], 1),
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = {
					255,
					200,
					200,
					200
				},
				offset = {
					0,
					0,
					0
				},
				size = size
			},
			background_fade = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					frame_width,
					frame_width,
					1
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			background_icon = {
				vertical_alignment = "center",
				saturated = false,
				horizontal_alignment = "right",
				color = {
					150,
					100,
					100,
					100
				},
				default_color = {
					150,
					100,
					100,
					100
				},
				texture_size = {
					350,
					108
				},
				offset = {
					0,
					0,
					3
				}
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					5,
					2
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80)
				}
			},
			select_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					5,
					3
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80)
				}
			},
			button_text = {
				upper_case = true,
				word_wrap = true,
				font_size = 32,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					130,
					0,
					6
				},
				size = {
					size[1] - 130,
					size[2]
				}
			},
			button_text_disabled = {
				upper_case = true,
				font_size = 32,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					130,
					0,
					6
				},
				size = {
					size[1] - 130,
					size[2]
				}
			},
			button_text_shadow = {
				upper_case = true,
				font_size = 32,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					132,
					-2,
					5
				},
				size = {
					size[1] - 130,
					size[2]
				}
			},
			button_clicked_rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				},
				size = size
			},
			button_disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					0,
					0,
					5
				},
				size = size
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - (frame_width + 9),
					6
				},
				size = {
					size[1],
					11
				}
			},
			glass_bottom = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 11,
					6
				},
				size = {
					size[1],
					11
				}
			},
			frame = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					10
				},
				size = size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			new_texture = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 126,
					size[2] - 56,
					6
				},
				size = {
					126,
					51
				}
			},
			icon_frame = {
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					116,
					108
				},
				offset = {
					0,
					0,
					11
				}
			},
			icon_glass = {
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = {
					116,
					108
				},
				offset = {
					0,
					0,
					15
				}
			},
			icon_bg_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				texture_size = {
					116,
					108
				},
				offset = {
					0,
					0,
					14
				}
			},
			icon = {
				color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_color = Colors.get_color_table_with_alpha("white", 255),
				texture_size = {
					60,
					60
				},
				offset = {
					24,
					24,
					12
				}
			},
			icon_disabled = {
				color = {
					255,
					40,
					40,
					40
				},
				default_color = {
					255,
					40,
					40,
					40
				},
				select_color = {
					255,
					40,
					40,
					40
				},
				texture_size = {
					60,
					60
				},
				offset = {
					24,
					24,
					12
				}
			},
			icon_selected = {
				color = {
					0,
					255,
					255,
					255
				},
				texture_size = {
					60,
					60
				},
				offset = {
					24,
					24,
					13
				}
			},
			skull_select_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					12
				},
				size = {
					28,
					size[2]
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}

	return widget
end
UIWidgets.create_play_button = function (scenegraph_id, size, text, font_size)
	local button_color_name = nil
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
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					style_id = "clicked_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot
						local is_clicked = button_hotspot.is_clicked

						return not is_clicked or is_clicked == 0
					end
				},
				{
					style_id = "disabled_rect",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "side_detail_right",
					style_id = "side_detail_right",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "side_detail_left",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "side_detail_right",
					style_id = "side_detail_right_disabled",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "side_detail_left",
					style_id = "side_detail_left_disabled",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_glow_right",
					pass_type = "texture_uv",
					content_id = "side_detail_glow",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_glow_left",
					pass_type = "texture",
					content_id = "side_detail_glow",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					texture_id = "glass_top",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture"
				},
				{
					texture_id = "effect",
					style_id = "effect",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end
				}
			}
		},
		content = {
			side_detail_right = "button_detail_05_right",
			effect = "play_button_passive_glow",
			hover_glow = "button_state_hover_green",
			side_detail_left = "button_detail_05_left",
			glow = "button_state_normal_green",
			glass_top = "button_glass_01",
			side_detail_glow = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				texture_id = side_detail_glow
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = background_color,
				offset = {
					0,
					0,
					0
				}
			},
			clicked_rect = {
				color = {
					100,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				}
			},
			disabled_rect = {
				color = {
					150,
					5,
					5,
					5
				},
				offset = {
					0,
					0,
					7
				}
			},
			title_text = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					7
				}
			},
			title_text_disabled = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = {
					255,
					68,
					68,
					68
				},
				offset = {
					0,
					0,
					7
				}
			},
			title_text_shadow = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					6
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					7
				}
			},
			hover_glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					1
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2)
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_settings.texture_sizes.horizontal[2] - 4,
					6
				},
				size = {
					size[1],
					5
				}
			},
			glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2] - 1,
					3
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2)
				}
			},
			effect = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					5
				},
				size = {
					size[1],
					size[2]
				}
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] / 2 - 36,
					8
				},
				size = {
					88,
					72
				}
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 88,
					size[2] / 2 - 36,
					8
				},
				size = {
					88,
					72
				}
			},
			side_detail_left_disabled = {
				color = {
					255,
					100,
					100,
					100
				},
				offset = {
					0,
					size[2] / 2 - 36,
					8
				},
				size = {
					88,
					72
				}
			},
			side_detail_right_disabled = {
				color = {
					255,
					100,
					100,
					100
				},
				offset = {
					size[1] - 88,
					size[2] / 2 - 36,
					8
				},
				size = {
					88,
					72
				}
			},
			side_detail_glow_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] / 2 - side_detail_glow_size[2] / 2,
					9
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2]
				}
			},
			side_detail_glow_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - side_detail_glow_size[1],
					size[2] / 2 - side_detail_glow_size[2] / 2,
					9
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2]
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_icon_button = function (scenegraph_id, size, frame_name, background_texture, text, font_size)
	background_texture = background_texture or "tab_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_settings = (frame_name and UIFrameSettings[frame_name]) or UIFrameSettings.menu_frame_06

	return {
		element = {
			passes = {
				{
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "glass_top",
					style_id = "glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass_bottom",
					style_id = "glass_bottom",
					pass_type = "texture"
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end
				}
			}
		},
		content = {
			glow = "tabs_glow",
			glass_top = "tabs_glass_top",
			glass_bottom = "tabs_glass_bottom",
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						size[1] / background_texture_settings.size[1],
						size[2] / background_texture_settings.size[2]
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			title_text = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					3
				}
			},
			title_text_disabled = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					3
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				}
			},
			glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					3
				},
				size = {
					size[1],
					3
				}
			},
			glass_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					3
				},
				size = {
					size[1],
					3
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
UIWidgets.create_stepper = function (scenegraph_id, size, frame_name, background_texture, text)
	background_texture = background_texture or "tab_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local background_size = (background_texture_settings and background_texture_settings.size) or size
	local frame_settings = (frame_name and UIFrameSettings[frame_name]) or UIFrameSettings.menu_frame_06
	local arrow_icon_size = {
		28,
		34
	}
	local arrow_button_size = {
		50,
		size[2]
	}
	local left_button_offset = {
		-arrow_button_size[1],
		0,
		0
	}
	local right_button_offset = {
		size[1],
		0,
		0
	}

	return {
		element = {
			passes = {
				{
					style_id = "setting_text",
					pass_type = "text",
					text_id = "setting_text"
				},
				{
					style_id = "left_frame",
					pass_type = "hotspot",
					content_id = "button_hotspot_left"
				},
				{
					pass_type = "texture_frame",
					style_id = "left_frame",
					texture_id = "frame"
				},
				{
					style_id = "left_background",
					pass_type = "texture_uv",
					content_id = "arrow_background"
				},
				{
					texture_id = "glow",
					style_id = "left_glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot_left

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end
				},
				{
					texture_id = "glass_top",
					style_id = "left_glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass_bottom",
					style_id = "left_glass_bottom",
					pass_type = "texture"
				},
				{
					pass_type = "texture",
					style_id = "left_button_icon",
					texture_id = "button_icon"
				},
				{
					pass_type = "texture",
					style_id = "left_button_icon_clicked",
					texture_id = "button_icon_clicked"
				},
				{
					style_id = "right_frame",
					pass_type = "hotspot",
					content_id = "button_hotspot_right"
				},
				{
					pass_type = "texture_frame",
					style_id = "right_frame",
					texture_id = "frame"
				},
				{
					style_id = "right_background",
					pass_type = "texture_uv",
					content_id = "arrow_background"
				},
				{
					texture_id = "glow",
					style_id = "right_glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot_right

						return not button_hotspot.disable_button and (button_hotspot.is_selected or button_hotspot.is_hover)
					end
				},
				{
					texture_id = "glass_top",
					style_id = "right_glass_top",
					pass_type = "texture"
				},
				{
					texture_id = "glass_bottom",
					style_id = "right_glass_bottom",
					pass_type = "texture"
				},
				{
					pass_type = "rotated_texture",
					style_id = "right_button_icon",
					texture_id = "button_icon"
				},
				{
					pass_type = "rotated_texture",
					style_id = "right_button_icon_clicked",
					texture_id = "button_icon_clicked"
				}
			}
		},
		content = {
			button_icon = "settings_arrow_normal",
			button_icon_clicked = "settings_arrow_clicked",
			glow = "tabs_glow",
			glass_top = "tabs_glass_top",
			glass_bottom = "tabs_glass_bottom",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						size[1] / background_size[1],
						size[2] / background_size[2]
					}
				},
				texture_id = background_texture
			},
			arrow_background = {
				uvs = {
					{
						0,
						0
					},
					{
						arrow_button_size[1] / background_size[1],
						arrow_button_size[2] / background_size[2]
					}
				},
				texture_id = background_texture
			},
			button_hotspot = {},
			setting_text = text or "test_text",
			button_hotspot_left = {},
			button_hotspot_right = {}
		},
		style = {
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				}
			},
			glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					3
				},
				size = {
					size[1],
					3
				}
			},
			glass_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2],
					3
				},
				size = {
					size[1],
					3
				}
			},
			background = {
				size = size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			setting_text = {
				font_size = 22,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					4
				}
			},
			left_glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					left_button_offset[1],
					arrow_button_size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					4
				},
				size = {
					arrow_button_size[1],
					3
				}
			},
			left_glass_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					left_button_offset[1],
					frame_settings.texture_sizes.horizontal[2],
					4
				},
				size = {
					arrow_button_size[1],
					3
				}
			},
			left_glow = {
				size = arrow_button_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					left_button_offset[1],
					left_button_offset[2],
					1
				}
			},
			left_frame = {
				size = arrow_button_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					left_button_offset[1],
					left_button_offset[2],
					5
				}
			},
			left_background = {
				size = arrow_button_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = left_button_offset
			},
			left_button_icon = {
				size = arrow_icon_size,
				offset = {
					left_button_offset[1] + arrow_button_size[1] / 2 - arrow_icon_size[1] / 2,
					left_button_offset[2] + arrow_button_size[2] / 2 - arrow_icon_size[2] / 2,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			left_button_icon_clicked = {
				color = {
					0,
					255,
					255,
					255
				},
				size = arrow_icon_size,
				offset = {
					left_button_offset[1] + arrow_button_size[1] / 2 - arrow_icon_size[1] / 2,
					left_button_offset[2] + arrow_button_size[2] / 2 - arrow_icon_size[2] / 2,
					3
				}
			},
			right_glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					right_button_offset[1],
					arrow_button_size[2] - frame_settings.texture_sizes.horizontal[2] - 3,
					4
				},
				size = {
					arrow_button_size[1],
					3
				}
			},
			right_glass_bottom = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					right_button_offset[1],
					frame_settings.texture_sizes.horizontal[2],
					4
				},
				size = {
					arrow_button_size[1],
					3
				}
			},
			right_glow = {
				size = arrow_button_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					right_button_offset[1],
					right_button_offset[2],
					1
				}
			},
			right_frame = {
				size = arrow_button_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					right_button_offset[1],
					right_button_offset[2],
					5
				}
			},
			right_background = {
				size = arrow_button_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = right_button_offset
			},
			right_button_icon = {
				angle = math.degrees_to_radians(180),
				pivot = {
					14,
					17
				},
				size = arrow_icon_size,
				offset = {
					right_button_offset[1] + arrow_button_size[1] / 2 - arrow_icon_size[1] / 2,
					right_button_offset[2] + arrow_button_size[2] / 2 - arrow_icon_size[2] / 2,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			right_button_icon_clicked = {
				angle = math.degrees_to_radians(180),
				color = {
					0,
					255,
					255,
					255
				},
				pivot = {
					14,
					17
				},
				size = arrow_icon_size,
				offset = {
					right_button_offset[1] + arrow_button_size[1] / 2 - arrow_icon_size[1] / 2,
					right_button_offset[2] + arrow_button_size[2] / 2 - arrow_icon_size[2] / 2,
					3
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end
UIWidgets.create_title_and_tooltip = function (scenegraph_id, size, text, tooltip_text, text_style, tooltip_style)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "hotspot",
					content_id = "tooltip_hotspot",
					content_check_function = function (ui_content)
						return not ui_content.disabled
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return ui_content.tooltip_hotspot.is_hover
					end
				}
			}
		},
		content = {
			tooltip_hotspot = {
				allow_multi_hover = true
			},
			tooltip_text = tooltip_text,
			text = text
		},
		style = {
			text = text_style or {
				vertical_alignment = "center",
				font_size = 20,
				horizontal_alignment = "left",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			tooltip_text = tooltip_style or {
				font_size = 24,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					50
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end
UIWidgets.create_icon_selector = function (scenegraph_id, icon_size, slot_icons, slot_spacing, use_frame, optional_frame_size)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local background_texture = "tab_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local amount = #slot_icons
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		amount = amount
	}
	local style = {}
	local slot_width_spacing = slot_spacing or 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local start_width_offset = 0
	local frame_settings = UIPlayerPortraitFrameSettings.default

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		total_length = total_length + icon_size[1] + slot_width_spacing
		local offset = {
			start_width_offset,
			0,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = icon_size,
			offset = offset
		}
		content[hotspot_name] = {}
		local hotspot_content = content[hotspot_name]
		local icon_texture = slot_icons[k]
		local icon_name = "icon" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = icon_name,
			style_id = icon_name
		}
		style[icon_name] = {
			size = icon_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 2
			}
		}
		hotspot_content[icon_name] = icon_texture
		local selection_icon_name = "selection_icon" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = selection_icon_name,
			style_id = selection_icon_name,
			content_check_function = function (content)
				return content[selection_icon_name] and content.is_selected
			end
		}
		style[selection_icon_name] = {
			size = icon_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 3
			},
			default_offset = {
				offset[1],
				offset[2],
				offset[3] + 4
			}
		}
		local disabled_name = "disabled" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = disabled_name,
			style_id = disabled_name,
			content_check_function = function (content)
				return content.disable_button and not content.locked
			end
		}
		style[disabled_name] = {
			size = icon_size,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				offset[3] + 4
			}
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
			end
		}
		style[locked_name] = {
			size = {
				30,
				38
			},
			color = default_color,
			offset = {
				(offset[1] + icon_size[1] / 2) - 15,
				(offset[2] + icon_size[2] / 2) - 19,
				offset[3] + 5
			}
		}
		hotspot_content[locked_name] = "locked_icon_01"

		if use_frame then
			local frame_name = "frame" .. name_suffix
			passes[#passes + 1] = {
				pass_type = "texture",
				content_id = hotspot_name,
				texture_id = frame_name,
				style_id = frame_name
			}
			local frame_size = (optional_frame_size and table.clone(optional_frame_size)) or {
				86,
				108
			}
			style[frame_name] = {
				size = {
					frame_size[1],
					frame_size[2]
				},
				color = default_color,
				offset = {
					(offset[1] + icon_size[1] / 2) - frame_size[1] / 2,
					(offset[2] + icon_size[2] / 2) - frame_size[2] / 2,
					offset[3] + 3
				}
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
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_title_widget = function (scenegraph_id, size, title_text, use_fade, disable_detail, flip_fade, font_size)
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "title_text",
			pass_type = "text",
			text_id = "title_text"
		}
	}
	local content = {
		title_text = title_text or "n/a"
	}
	local style = {
		title_text = {
			vertical_alignment = "center",
			upper_case = true,
			horizontal_alignment = "center",
			font_type = "hell_shark",
			font_size = font_size or 24,
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				0,
				size[2] - 40,
				3
			},
			size = {
				size[1],
				30
			}
		}
	}

	if not disable_detail then
		local title_detail_length = size[1] * 0.3
		passes[#passes + 1] = {
			texture_id = "title_detail_center",
			style_id = "title_detail_center",
			pass_type = "texture"
		}
		passes[#passes + 1] = {
			texture_id = "title_detail_line",
			style_id = "title_detail_line",
			pass_type = "texture"
		}
		passes[#passes + 1] = {
			texture_id = "title_detail_left",
			style_id = "title_detail_left",
			pass_type = "texture"
		}
		passes[#passes + 1] = {
			texture_id = "title_detail_right",
			style_id = "title_detail_right",
			pass_type = "texture"
		}
		style.title_detail_center = {
			size = {
				85,
				17
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] / 2 - 42.5,
				size[2] - 60,
				4
			}
		}
		style.title_detail_line = {
			size = {
				title_detail_length,
				17
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] / 2 - title_detail_length / 2,
				size[2] - 60,
				3
			}
		}
		style.title_detail_left = {
			size = {
				7,
				17
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] / 2 - title_detail_length / 2 - 7,
				size[2] - 60,
				3
			}
		}
		style.title_detail_right = {
			size = {
				7,
				17
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] / 2 + title_detail_length / 2,
				size[2] - 60,
				3
			}
		}
		content.title_detail_center = "title_detail_01_middle"
		content.title_detail_line = "title_detail_01_tile"
		content.title_detail_left = "title_detail_01_left"
		content.title_detail_right = "title_detail_01_right"
	end

	if use_fade then
		passes[#passes + 1] = {
			texture_id = "title_bg_fade",
			style_id = "title_bg_fade",
			pass_type = "rotated_texture"
		}
		content.title_bg_fade = "edge_fade_small"

		if flip_fade then
			style.title_bg_fade = {
				angle = 0,
				pivot = {
					size[1] / 2,
					40
				},
				size = {
					size[1],
					80
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 80,
					1
				}
			}
		else
			style.title_bg_fade = {
				pivot = {
					size[1] / 2,
					40
				},
				angle = math.degrees_to_radians(180),
				size = {
					size[1],
					80
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - 80,
					1
				}
			}
		end
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
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
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail"
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				}
			}
		},
		content = {
			glow = "button_state_normal",
			side_detail = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				texture_id = side_detail_texture
			},
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			}
		},
		style = {
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			glow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_settings.texture_sizes.horizontal[2] - 1,
					2
				},
				size = {
					size[1],
					math.min(60, size[2] - frame_settings.texture_sizes.horizontal[2] * 2)
				}
			},
			title_text = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					5
				}
			},
			title_text_disabled = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					5
				}
			},
			title_text_shadow = {
				vertical_alignment = "center",
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					4
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					7
				}
			},
			side_detail_left = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-32,
					0,
					8
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			side_detail_right = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] - 48,
					0,
					8
				},
				size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end
GAMEPAD_CURSOR_SIZE = 64
UIWidgets.create_console_cursor = function (scenegraph_id)
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "gamepad_cursor",
			style_id = "cursor",
			texture_id = "cursor",
			content_check_function = function (content, style)
				return not Managers.popup:has_popup()
			end
		}
	}
	local content = {
		cursor = "console_cursor"
	}
	local style = {
		cursor = {
			size = {
				GAMEPAD_CURSOR_SIZE,
				GAMEPAD_CURSOR_SIZE
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-GAMEPAD_CURSOR_SIZE * 0.5,
				-GAMEPAD_CURSOR_SIZE * 0.5,
				1000
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_difficulty_selector = function (scenegraph_id, size, spacing, amount, image_size)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local background_texture = "tab_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		amount = amount
	}
	local style = {
		background = {
			color = {
				255,
				5,
				5,
				5
			},
			offset = {
				0,
				0,
				0
			}
		},
		background_top = {
			size = {
				size[1] - 2,
				size[2] - 2
			},
			color = {
				255,
				15,
				15,
				15
			},
			offset = {
				2,
				0,
				1
			}
		}
	}
	local slot_width_spacing = spacing or 0
	local offset_layer = 0
	local total_length = -slot_width_spacing
	local length_with_spacing = size[1] - slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	image_size = image_size or {
		194,
		190
	}
	local slot_size = {
		tab_width,
		size[2]
	}
	local start_width_offset = 0
	local frame_settings = UIFrameSettings.menu_frame_06

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		total_length = total_length + slot_size[1] + slot_width_spacing
		local offset = {
			start_width_offset,
			0,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = slot_size,
			offset = offset
		}
		content[hotspot_name] = {}
		local hotspot_content = content[hotspot_name]
		local background_image_name = "background_image" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = background_image_name,
			style_id = background_image_name
		}
		style[background_image_name] = {
			size = image_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(offset[1] + slot_size[1] / 2) - image_size[1] / 2,
				(offset[2] + slot_size[2]) - image_size[2],
				2
			}
		}
		hotspot_content[background_image_name] = "difficulty_option_" .. k
		local background_glow_name = "background_glow" .. name_suffix
		style[background_glow_name] = {
			size = {
				slot_size[1],
				slot_size[2]
			},
			color = {
				200,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				1
			}
		}
		hotspot_content[background_glow_name] = "tabs_glow"
		local background_glow_select_name = "background_glow_select" .. name_suffix
		style[background_glow_select_name] = {
			size = {
				slot_size[1],
				slot_size[2]
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				2
			}
		}
		hotspot_content[background_glow_select_name] = "tabs_glow_animated"
		local title_text_name = "title_text" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = title_text_name,
			style_id = title_text_name
		}
		style[title_text_name] = {
			upper_case = false,
			font_size = 32,
			word_wrap = false,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			font_type = "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				slot_size[1],
				slot_size[2] * 0.2 - frame_settings.texture_sizes.vertical[1]
			},
			offset = {
				offset[1],
				offset[2],
				7
			}
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
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_portrait_frame = function (scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	scale = scale or 1
	local frame_settings = UIPlayerPortraitFrameSettings[frame_settings_name]
	local default_color = {
		255,
		255,
		255,
		255
	}
	local default_offset = {
		0,
		-60,
		0
	}
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		scale = scale,
		frame_settings_name = frame_settings_name
	}
	local style = {}

	for index, data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = data.texture or "icons_placeholder"
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
		local size = data.size or texture_settings.size
		size = (size and table.clone(size)) or {
			0,
			0
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
			retained_mode = retained_mode
		}
		content[name] = texture_name
		style[name] = {
			color = data.color or default_color,
			offset = offset,
			size = size
		}
	end

	if portrait_texture then
		local portrait_size = {
			portrait_size[1] * scale,
			portrait_size[2] * scale
		}
		local portrait_offset = {
			-(portrait_size[1] / 2) + portrait_offset[1] * scale,
			-(portrait_size[2] / 2) + portrait_offset[2] * scale,
			1
		}
		local portrait_name = "portrait"
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = portrait_name,
			style_id = portrait_name,
			retained_mode = retained_mode
		}
		content[portrait_name] = portrait_texture
		style[portrait_name] = {
			color = default_color,
			offset = portrait_offset,
			size = portrait_size
		}
	end

	local portrait_size = {
		portrait_size[1] * scale,
		portrait_size[2] * scale
	}
	local level_size = {
		22,
		15
	}
	local level_offset = {
		level_offset[1] * scale - level_size[1] / 2 - 1,
		(-(portrait_size[2] / 2) + level_offset[2] * scale) - 4,
		15
	}
	local level_name = "level"
	passes[#passes + 1] = {
		pass_type = "text",
		text_id = level_name,
		style_id = level_name,
		retained_mode = retained_mode
	}
	content[level_name] = level_text
	style[level_name] = {
		vertical_alignment = "center",
		font_type = "hell_shark",
		font_size = 12,
		horizontal_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = level_offset,
		size = level_size
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
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
	local content = {
		scale = scale,
		frame_settings_name = frame_settings_name
	}
	local style = {}

	for index, data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = data.texture or "icons_placeholder"
		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
		local size = data.size or texture_settings.size
		size = (size and table.clone(size)) or {
			0,
			0
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
			retained_mode = retained_mode
		}
		content[name] = texture_name
		style[name] = {
			color = data.color or default_color,
			offset = offset,
			size = size
		}
	end

	local portrait_size = {
		portrait_size[1] * scale,
		portrait_size[2] * scale
	}
	local offset = table.clone(default_offset)
	offset[1] = -(portrait_size[1] / 2) + offset[1] * scale
	offset[2] = -(portrait_size[2] / 2) + 25 * scale
	offset[3] = 20
	local portrait_name = "portrait"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = portrait_name,
		style_id = portrait_name,
		retained_mode = retained_mode
	}
	content[portrait_name] = portrait_texture
	style[portrait_name] = {
		color = default_color,
		offset = offset,
		size = portrait_size
	}
	local button_hotspot = "button_hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = button_hotspot,
		style_id = button_hotspot,
		retained_mode = retained_mode
	}
	content[button_hotspot] = {}
	style[button_hotspot] = {
		size = portrait_size,
		offset = offset
	}
	local hover_texture = "hover_texture"
	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = hover_texture,
		style_id = hover_texture,
		retained_mode = retained_mode,
		content_check_function = function (content)
			return content.button_hotspot.is_hover
		end
	}
	content[hover_texture] = "ability_inner_effect_1"
	style[hover_texture] = {
		color = default_color,
		offset = {
			offset[1],
			offset[2],
			-2
		},
		size = portrait_size
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_cosmetic_list = function (scenegraph_id, size, amount)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local background_texture = "tab_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		amount = amount
	}
	local style = {}
	local slot_height_spacing = 5
	local total_slots_height = size[2] - (amount - 1) * slot_height_spacing
	local slot_size = {
		size[1] * 0.9,
		total_slots_height / amount
	}
	local start_width_offset = size[1] / 2 - slot_size[1] / 2
	local start_height_offset = size[2] - slot_size[2]
	local frame_settings = UIFrameSettings.menu_tab_frame_01
	local offset_layer = 0
	local use_pages = true

	if use_pages then
		passes[#passes + 1] = {
			style_id = "page_text",
			pass_type = "text",
			text_id = "page_text",
			content_check_function = function (content)
				local page_hotspot_left = content.page_hotspot_left
				local page_hotspot_right = content.page_hotspot_right
				local disabled = page_hotspot_left.disable_button and page_hotspot_right.disable_button

				return not disabled
			end
		}
		passes[#passes + 1] = {
			style_id = "page_arrow_left",
			pass_type = "hotspot",
			content_id = "page_hotspot_left"
		}
		passes[#passes + 1] = {
			style_id = "page_arrow_right",
			pass_type = "hotspot",
			content_id = "page_hotspot_right"
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = "page_arrow_left",
			texture_id = "texture_id",
			content_id = "stepper_arrow_normal",
			content_check_function = function (content)
				local page_hotspot_left = content.parent.page_hotspot_left

				return not page_hotspot_left.disable_button and not page_hotspot_left.is_hover
			end
		}
		passes[#passes + 1] = {
			style_id = "page_arrow_right",
			pass_type = "texture_uv",
			content_id = "stepper_arrow_normal",
			content_check_function = function (content)
				local page_hotspot_right = content.parent.page_hotspot_right

				return not page_hotspot_right.disable_button and not page_hotspot_right.is_hover
			end
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = "page_arrow_left",
			texture_id = "texture_id",
			content_id = "stepper_arrow_hover",
			content_check_function = function (content)
				local page_hotspot_left = content.parent.page_hotspot_left

				return not page_hotspot_left.disable_button and page_hotspot_left.is_hover
			end
		}
		passes[#passes + 1] = {
			style_id = "page_arrow_right",
			pass_type = "texture_uv",
			content_id = "stepper_arrow_hover",
			content_check_function = function (content)
				local page_hotspot_right = content.parent.page_hotspot_right

				return not page_hotspot_right.disable_button and page_hotspot_right.is_hover
			end
		}
		content.page_hotspot_left = {}
		content.page_hotspot_right = {}
		content.page_text = "n/a"
		content.stepper_arrow_normal = {
			texture_id = "settings_arrow_normal",
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		}
		content.stepper_arrow_hover = {
			texture_id = "settings_arrow_clicked",
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		}
		style.page_arrow_left = {
			color = default_color,
			offset = {
				size[1] * 0.4 - 40,
				-46,
				1
			},
			size = {
				28,
				34
			}
		}
		style.page_arrow_right = {
			color = default_color,
			offset = {
				size[1] * 0.6 + 12,
				-46,
				1
			},
			size = {
				28,
				34
			}
		}
		style.page_text = {
			vertical_alignment = "center",
			font_type = "hell_shark",
			font_size = 18,
			horizontal_alignment = "center",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			offset = {
				size[1] * 0.4,
				-48,
				2
			},
			size = {
				size[1] * 0.2,
				30
			}
		}
	end

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		local offset = {
			start_width_offset,
			start_height_offset,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = slot_size,
			offset = offset
		}
		content[hotspot_name] = {}
		local hotspot_content = content[hotspot_name]
		local item_name = "item" .. name_suffix
		hotspot_content[item_name] = nil
		local glow_name = "glow" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glow_name,
			style_id = glow_name,
			content_check_function = function (content)
				return not content.disable_button and (content.is_selected or content.is_hover)
			end
		}
		style[glow_name] = {
			size = slot_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				1
			}
		}
		hotspot_content[glow_name] = "tabs_glow"
		local background_texture = "tab_bg_01"
		local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
		local background_name = "background" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_uv",
			content_id = background_name,
			style_id = background_name,
			content_check_function = function (content)
				return not content.parent[hotspot_name].disable_button
			end
		}
		style[background_name] = {
			size = slot_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				0
			}
		}
		content[background_name] = {
			uvs = {
				{
					0,
					0
				},
				{
					slot_size[1] / background_texture_settings.size[1],
					slot_size[2] / background_texture_settings.size[2]
				}
			},
			texture_id = background_texture
		}
		local equipped_texture_name = "equipped" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = equipped_texture_name,
			style_id = equipped_texture_name,
			content_check_function = function (content)
				return not content.disable_button and content.equipped
			end
		}
		style[equipped_texture_name] = {
			size = {
				20,
				20
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(offset[1] + slot_size[1]) - 30,
				(offset[2] + slot_size[2] / 2) - 10,
				5
			}
		}
		hotspot_content[equipped_texture_name] = "stats_icon_yes"
		local glass_bottom_name = "glass_bottom" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_bottom_name,
			style_id = glass_bottom_name,
			content_check_function = function (content)
				return not content.disable_button
			end
		}
		style[glass_bottom_name] = {
			size = {
				slot_size[1],
				3
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] + frame_settings.texture_sizes.vertical[1],
				3
			}
		}
		hotspot_content[glass_bottom_name] = "tabs_glass_bottom"
		local glass_top_name = "glass_top" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = glass_top_name,
			style_id = glass_top_name,
			content_check_function = function (content)
				return not content.disable_button
			end
		}
		style[glass_top_name] = {
			size = {
				slot_size[1],
				3
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				(offset[2] + slot_size[2]) - (frame_settings.texture_sizes.vertical[1] + 3),
				3
			}
		}
		hotspot_content[glass_top_name] = "tabs_glass_top"
		local slot_frame_settings = UIFrameSettings.menu_slot_frame_01
		local background_slot_name = "background_slot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_frame",
			content_id = hotspot_name,
			texture_id = background_slot_name,
			style_id = background_slot_name,
			content_check_function = function (content)
				return content.disable_button
			end
		}
		style[background_slot_name] = {
			size = slot_size,
			texture_size = slot_frame_settings.texture_size,
			texture_sizes = slot_frame_settings.texture_sizes,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				0
			}
		}
		hotspot_content[background_slot_name] = slot_frame_settings.texture
		local frame_name = "frame" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_frame",
			content_id = hotspot_name,
			texture_id = frame_name,
			style_id = frame_name,
			content_check_function = function (content)
				return not content.disable_button
			end
		}
		style[frame_name] = {
			size = slot_size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = default_color,
			offset = {
				offset[1],
				offset[2],
				3
			}
		}
		hotspot_content[frame_name] = frame_settings.texture
		local hover_frame_settings = UIFrameSettings.item_hover_01
		local corner_size = hover_frame_settings.texture_sizes.corner
		local hover_frame_name = "hover_frame" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture_frame",
			content_id = hotspot_name,
			texture_id = hover_frame_name,
			style_id = hover_frame_name,
			content_check_function = function (content)
				return content.is_hover
			end
		}
		style[hover_frame_name] = {
			size = {
				slot_size[1] + corner_size[1] * 2,
				slot_size[2] + corner_size[2] * 2
			},
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			color = default_color,
			offset = {
				offset[1] - corner_size[1],
				offset[2] - corner_size[2],
				0
			}
		}
		hotspot_content[hover_frame_name] = hover_frame_settings.texture
		local edge_fade_name = "edge_fade" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			content_id = hotspot_name,
			texture_id = edge_fade_name,
			style_id = edge_fade_name,
			content_check_function = function (content)
				return not content.disable_button
			end
		}
		style[edge_fade_name] = {
			size = {
				slot_size[1],
				40
			},
			color = {
				200,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2] + frame_settings.texture_sizes.vertical[1],
				1
			}
		}
		hotspot_content[edge_fade_name] = "edge_fade_small"
		local title_text_name = "title_text" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			content_id = hotspot_name,
			text_id = title_text_name,
			style_id = title_text_name,
			content_check_function = function (content)
				return not content.disable_button and content.parent[item_name] ~= nil
			end
		}
		style[title_text_name] = {
			vertical_alignment = "center",
			font_size = 20,
			horizontal_alignment = "left",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
			size = slot_size,
			offset = {
				offset[1] + frame_settings.texture_sizes.vertical[1] + 5,
				offset[2],
				3
			}
		}
		hotspot_content[title_text_name] = ""
		local selection_left_line_name = "selection_left_line" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			content_id = hotspot_name,
			texture_id = selection_left_line_name,
			style_id = selection_left_line_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_left_line_name] = {
			pivot = {
				0,
				0
			},
			angle = math.degrees_to_radians(-90),
			size = {
				slot_size[2] - 2,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] + 13,
				offset[2] + 1,
				5
			}
		}
		hotspot_content[selection_left_line_name] = "tab_selection_01_stretch"
		local selection_left_detail_name = "selection_left_detail" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			content_id = hotspot_name,
			texture_id = selection_left_detail_name,
			style_id = selection_left_detail_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_left_detail_name] = {
			pivot = {
				17.5,
				11
			},
			angle = math.degrees_to_radians(-90),
			size = {
				35,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] - 17.5 + 2,
				(offset[2] + slot_size[2] / 2) - 11,
				6
			}
		}
		hotspot_content[selection_left_detail_name] = "tab_selection_01_middle"
		local selection_left_bottom_name = "selection_left_bottom" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			content_id = hotspot_name,
			texture_id = selection_left_bottom_name,
			style_id = selection_left_bottom_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_left_bottom_name] = {
			pivot = {
				5.5,
				11
			},
			angle = math.degrees_to_radians(-90),
			size = {
				11,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] - 5.5 + 2,
				offset[2] - 8,
				6
			}
		}
		hotspot_content[selection_left_bottom_name] = "tab_selection_01_left"
		local selection_left_top_name = "selection_left_top" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			content_id = hotspot_name,
			texture_id = selection_left_top_name,
			style_id = selection_left_top_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_left_top_name] = {
			pivot = {
				5.5,
				11
			},
			angle = math.degrees_to_radians(-90),
			size = {
				11,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1] - 5.5 + 2,
				(offset[2] + slot_size[2]) - 14,
				6
			}
		}
		hotspot_content[selection_left_top_name] = "tab_selection_01_right"
		local selection_right_line_name = "selection_right_line" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			content_id = hotspot_name,
			texture_id = selection_right_line_name,
			style_id = selection_right_line_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_right_line_name] = {
			pivot = {
				0,
				0
			},
			angle = math.degrees_to_radians(90),
			size = {
				slot_size[2] - 2,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(offset[1] + slot_size[1]) - 13,
				(offset[2] + slot_size[2]) - 1,
				5
			}
		}
		hotspot_content[selection_right_line_name] = "tab_selection_01_stretch"
		local selection_right_detail_name = "selection_right_detail" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			content_id = hotspot_name,
			texture_id = selection_right_detail_name,
			style_id = selection_right_detail_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_right_detail_name] = {
			pivot = {
				17.5,
				11
			},
			angle = math.degrees_to_radians(90),
			size = {
				35,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(slot_size[1] + offset[1] - 17.5) - 2,
				(offset[2] + slot_size[2] / 2) - 11,
				6
			}
		}
		hotspot_content[selection_right_detail_name] = "tab_selection_01_middle"
		local selection_right_bottom_name = "selection_right_bottom" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			content_id = hotspot_name,
			texture_id = selection_right_bottom_name,
			style_id = selection_right_bottom_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_right_bottom_name] = {
			pivot = {
				5.5,
				11
			},
			angle = math.degrees_to_radians(90),
			size = {
				11,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(slot_size[1] + offset[1] - 5.5) - 2,
				offset[2] - 8,
				6
			}
		}
		hotspot_content[selection_right_bottom_name] = "tab_selection_01_right"
		local selection_right_top_name = "selection_right_top" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "rotated_texture",
			content_id = hotspot_name,
			texture_id = selection_right_top_name,
			style_id = selection_right_top_name,
			content_check_function = function (content)
				return content.is_selected
			end
		}
		style[selection_right_top_name] = {
			pivot = {
				5.5,
				11
			},
			angle = math.degrees_to_radians(90),
			size = {
				11,
				22
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(slot_size[1] + offset[1] - 5.5) - 2,
				(offset[2] + slot_size[2]) - 14,
				6
			}
		}
		hotspot_content[selection_right_top_name] = "tab_selection_01_left"
		start_height_offset = start_height_offset - slot_size[2] - slot_height_spacing
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		-frame_settings.texture_sizes.vertical[1],
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_score_entry = function (scenegraph_id, size, num_rows, side)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		num_rows = num_rows
	}
	local style = {}
	local frame_settings = UIFrameSettings.menu_frame_09
	local row_bg_texture = "scoreboard_topic_bg"
	local row_bg_texture_highlight = "scoreboard_topic_bg_highlight"
	local row_bg_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(row_bg_texture)
	local row_size = {
		size[1],
		row_bg_settings.size[2]
	}
	local offset = {
		0,
		0,
		0
	}
	local hotspot_name = "hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name
	}
	style[hotspot_name] = {
		size = size,
		offset = offset
	}
	content[hotspot_name] = {
		allow_multi_hover = true
	}
	local hotspot_content = content[hotspot_name]
	local background_name = "background"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name
	}
	local bg_color_multiplier = 0.8
	style[background_name] = {
		size = size,
		color = {
			200,
			0,
			0,
			0
		},
		offset = {
			offset[1],
			offset[2],
			0
		}
	}
	content[background_name] = {
		uvs = {
			{
				0,
				0
			},
			{
				math.min(size[1] / background_texture_settings.size[1], 1),
				math.min(size[2] / background_texture_settings.size[2], 1)
			}
		},
		texture_id = background_texture
	}
	local background_glow_left_name = "background_left_glow"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_glow_left_name,
		style_id = background_glow_left_name
	}
	local bg_color_multiplier = 0.8
	style[background_glow_left_name] = {
		size = {
			size[1] / 2,
			size[2]
		},
		color = Colors.get_color_table_with_alpha("blue", 255),
		offset = {
			offset[1],
			offset[2],
			1
		}
	}
	content[background_glow_left_name] = {
		texture_id = "talent_bg_glow_01",
		uvs = {
			{
				0,
				1
			},
			{
				1,
				0
			}
		}
	}
	local background_glow_right_name = "background_right_glow"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_glow_right_name,
		style_id = background_glow_right_name
	}
	local bg_color_multiplier = 0.8
	style[background_glow_right_name] = {
		size = {
			size[1] / 2,
			size[2]
		},
		color = Colors.get_color_table_with_alpha("blue", 255),
		offset = {
			offset[1] + size[1] / 2,
			offset[2],
			1
		}
	}
	content[background_glow_right_name] = {
		texture_id = "talent_bg_glow_01",
		uvs = {
			{
				1,
				1
			},
			{
				0,
				0
			}
		}
	}
	local glass_bottom_name = "glass_bottom"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_bottom_name,
		style_id = glass_bottom_name
	}
	style[glass_bottom_name] = {
		size = {
			size[1],
			3
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2] + frame_settings.texture_sizes.vertical[1],
			2
		}
	}
	hotspot_content[glass_bottom_name] = "tabs_glass_bottom"
	local glass_top_name = "glass_top"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_top_name,
		style_id = glass_top_name
	}
	style[glass_top_name] = {
		size = {
			size[1],
			3
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			(offset[2] + size[2]) - (frame_settings.texture_sizes.vertical[1] + 3),
			2
		}
	}
	hotspot_content[glass_top_name] = "tabs_glass_top"
	local frame_name = "frame"
	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = frame_name,
		style_id = frame_name
	}
	style[frame_name] = {
		size = size,
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		color = default_color,
		offset = {
			offset[1],
			offset[2],
			10
		}
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
		end
	}
	style[edge_fade_name] = {
		size = {
			size[1],
			15
		},
		color = {
			200,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2] + frame_settings.texture_sizes.vertical[1],
			5
		}
	}
	hotspot_content[edge_fade_name] = "edge_fade_small"

	for k = 1, num_rows, 1 do
		local line_suffix = "_" .. k
		local line_height_offset = -(k * row_size[2])
		local row_offset = {
			offset[1],
			(offset[2] + size[2]) - 80 + line_height_offset,
			offset[3] + 5
		}
		local row_name = "row_bg" .. line_suffix
		passes[#passes + 1] = {
			texture_id = "texture_id",
			pass_type = "tiled_texture",
			content_id = row_name,
			style_id = row_name,
			content_check_function = function (content)
				local hover_index = content.parent.hover_index

				if hover_index and hover_index == k then
					return false
				end

				return content.has_background
			end
		}
		content[row_name] = {
			has_background = false,
			texture_id = row_bg_texture
		}
		style[row_name] = {
			size = row_size,
			color = {
				150,
				255,
				255,
				255
			},
			offset = row_offset,
			texture_tiling_size = row_bg_settings.size
		}

		if k ~= 1 then
			local highlight_row_name = "highlight_row_bg" .. line_suffix
			passes[#passes + 1] = {
				texture_id = "texture_id",
				pass_type = "tiled_texture",
				content_id = highlight_row_name,
				style_id = highlight_row_name,
				content_check_function = function (content)
					local hover_index = content.parent.hover_index

					return hover_index and hover_index == k
				end
			}
			style[highlight_row_name] = {
				size = row_size,
				color = Colors.get_color_table_with_alpha("white", 20),
				offset = {
					row_offset[1],
					row_offset[2],
					row_offset[3] + 1
				},
				texture_tiling_size = row_bg_settings.size
			}
			content[highlight_row_name] = {
				has_background = false,
				texture_id = row_bg_texture_highlight
			}
		end

		local score_text_name = "score_text" .. line_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			content_id = row_name,
			text_id = score_text_name,
			style_id = score_text_name
		}
		style[score_text_name] = {
			vertical_alignment = "center",
			font_size = 24,
			horizontal_alignment = "center",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = (k == 1 and select_color) or Colors.get_color_table_with_alpha("font_default", 255),
			size = row_size,
			offset = {
				row_offset[1],
				row_offset[2],
				row_offset[3] + 20
			}
		}
		content[row_name][score_text_name] = ""
		local score_text_shadow_name = "score_text_shadow" .. line_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			content_id = row_name,
			text_id = score_text_name,
			style_id = score_text_shadow_name
		}
		style[score_text_shadow_name] = {
			vertical_alignment = "center",
			font_size = 24,
			horizontal_alignment = "center",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = row_size,
			offset = {
				row_offset[1] + 2,
				row_offset[2] - 2,
				row_offset[3] + 19
			}
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
				end
			}
			style[score_text_highlight_name] = {
				vertical_alignment = "center",
				font_size = 24,
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = row_size,
				offset = {
					row_offset[1],
					row_offset[2],
					row_offset[3] + 30
				}
			}
		end

		local marker_name = "marker" .. line_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = marker_name,
			style_id = marker_name,
			content_check_function = function (content)
				return content[row_name].has_highscore
			end
		}
		style[marker_name] = {
			size = {
				71,
				39
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(row_offset[1] + row_size[1] / 2) - 35.5,
				(row_offset[2] + row_size[2] / 2) - 19.5,
				row_offset[3] + 4
			}
		}
		content[marker_name] = "scoreboard_marker"
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		-frame_settings.texture_sizes.vertical[1],
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_score_topics = function (scenegraph_id, size, hover_hotspot_length, num_rows)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local select_color = Colors.get_color_table_with_alpha("font_title", 255)
	local background_texture = "menu_frame_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		num_rows = num_rows
	}
	local style = {}
	local frame_settings = UIFrameSettings.menu_frame_09
	local row_bg_texture = "scoreboard_topic_bg"
	local row_bg_texture_highlight = "scoreboard_topic_bg_highlight"
	local row_bg_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(row_bg_texture)
	local row_size = {
		size[1],
		row_bg_settings.size[2]
	}
	local row_start = 80
	local offset = {
		0,
		0,
		0
	}
	local box_size = {
		size[1],
		size[2] - row_start
	}
	local hotspot_name = "hotspot"
	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name
	}
	style[hotspot_name] = {
		size = size,
		offset = offset
	}
	content[hotspot_name] = {
		allow_multi_hover = true
	}
	local hotspot_content = content[hotspot_name]
	local background_name = "background"
	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name
	}
	local bg_color_multiplier = 0.8
	style[background_name] = {
		size = box_size,
		color = {
			200,
			0,
			0,
			0
		},
		offset = {
			offset[1],
			offset[2],
			0
		}
	}
	content[background_name] = {
		uvs = {
			{
				0,
				0
			},
			{
				math.min(box_size[1] / background_texture_settings.size[1], 1),
				math.min(box_size[2] / background_texture_settings.size[2], 1)
			}
		},
		texture_id = background_texture
	}
	local glass_bottom_name = "glass_bottom"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_bottom_name,
		style_id = glass_bottom_name
	}
	style[glass_bottom_name] = {
		size = {
			box_size[1],
			3
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2] + frame_settings.texture_sizes.vertical[1],
			1
		}
	}
	hotspot_content[glass_bottom_name] = "tabs_glass_bottom"
	local glass_top_name = "glass_top"
	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_top_name,
		style_id = glass_top_name
	}
	style[glass_top_name] = {
		size = {
			box_size[1],
			3
		},
		color = {
			255,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			(offset[2] + box_size[2]) - (frame_settings.texture_sizes.vertical[1] + 3),
			1
		}
	}
	hotspot_content[glass_top_name] = "tabs_glass_top"
	local frame_name = "frame"
	passes[#passes + 1] = {
		pass_type = "texture_frame",
		content_id = hotspot_name,
		texture_id = frame_name,
		style_id = frame_name
	}
	style[frame_name] = {
		size = box_size,
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		color = default_color,
		offset = {
			offset[1],
			offset[2],
			10
		}
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
		end
	}
	style[edge_fade_name] = {
		size = {
			box_size[1],
			15
		},
		color = {
			200,
			255,
			255,
			255
		},
		offset = {
			offset[1],
			offset[2] + frame_settings.texture_sizes.vertical[1],
			5
		}
	}
	hotspot_content[edge_fade_name] = "edge_fade_small"

	for k = 1, num_rows, 1 do
		local line_suffix = "_" .. k
		local row_name = "row_bg" .. line_suffix
		local line_height_offset = -(k * row_size[2])
		local row_offset = {
			offset[1],
			(offset[2] + size[2]) - row_start + line_height_offset,
			offset[3] + 5
		}
		passes[#passes + 1] = {
			texture_id = "texture_id",
			pass_type = "tiled_texture",
			content_id = row_name,
			style_id = row_name,
			content_check_function = function (content)
				local hover_index = content.parent.hover_index

				if hover_index and hover_index == k then
					return false
				end

				return content.has_background
			end
		}
		content[row_name] = {
			has_background = false,
			texture_id = row_bg_texture
		}

		if k ~= 1 then
			local row_hotspot_name = "hotspot" .. line_suffix
			passes[#passes + 1] = {
				pass_type = "hotspot",
				content_id = row_hotspot_name,
				style_id = row_hotspot_name
			}
			content[row_hotspot_name] = {
				allow_multi_hover = true
			}
			style[row_hotspot_name] = {
				size = {
					hover_hotspot_length,
					row_size[2]
				},
				color = {
					150,
					255,
					255,
					255
				},
				offset = {
					row_offset[1] - hover_hotspot_length / 2 + row_size[1] / 2,
					row_offset[2],
					row_offset[3]
				}
			}
			local highlight_row_name = "highlight_row_bg" .. line_suffix
			passes[#passes + 1] = {
				texture_id = "texture_id",
				pass_type = "tiled_texture",
				content_id = highlight_row_name,
				style_id = highlight_row_name,
				content_check_function = function (content)
					local hover_index = content.parent.hover_index

					return hover_index and hover_index == k
				end
			}
			style[highlight_row_name] = {
				size = row_size,
				color = Colors.get_color_table_with_alpha("white", 20),
				offset = {
					row_offset[1],
					row_offset[2],
					row_offset[3] + 1
				},
				texture_tiling_size = row_bg_settings.size
			}
			content[highlight_row_name] = {
				has_background = false,
				texture_id = row_bg_texture_highlight
			}
		end

		style[row_name] = {
			size = row_size,
			color = {
				150,
				255,
				255,
				255
			},
			offset = row_offset,
			texture_tiling_size = row_bg_settings.size
		}
		local score_text_name = "score_text" .. line_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			content_id = row_name,
			text_id = score_text_name,
			style_id = score_text_name
		}
		style[score_text_name] = {
			vertical_alignment = "center",
			font_size = 24,
			horizontal_alignment = "center",
			word_wrap = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = row_size,
			offset = {
				row_offset[1],
				row_offset[2],
				row_offset[3] + 3
			}
		}
		content[row_name][score_text_name] = ""
		local score_text_shadow_name = "score_text_shadow" .. line_suffix
		passes[#passes + 1] = {
			pass_type = "text",
			content_id = row_name,
			text_id = score_text_name,
			style_id = score_text_shadow_name
		}
		style[score_text_shadow_name] = {
			font_size = 24,
			word_wrap = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font_size = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = row_size,
			offset = {
				row_offset[1] + 2,
				row_offset[2] - 2,
				row_offset[3] + 2
			}
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
				end
			}
			style[score_text_highlight_name] = {
				font_size = 24,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				size = row_size,
				offset = {
					row_offset[1],
					row_offset[2],
					row_offset[3] + 4
				}
			}
		end

		local marker_name = "marker" .. line_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = marker_name,
			style_id = marker_name,
			content_check_function = function (content)
				return content[row_name].has_highscore
			end
		}
		style[marker_name] = {
			size = {
				71,
				39
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				(row_offset[1] + row_size[1] / 2) - 35.5,
				(row_offset[2] + row_size[2] / 2) - 19.5,
				row_offset[3] + 2
			}
		}
		content[marker_name] = "scoreboard_marker"
	end

	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		-frame_settings.texture_sizes.vertical[1],
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_page_dot_selector = function (scenegraph_id, amount)
	local default_color = {
		255,
		255,
		255,
		255
	}
	local widget = {
		element = {}
	}
	local passes = {}
	local content = {
		amount = amount
	}
	local style = {}
	local slot_size = {
		20,
		20
	}
	local slot_width_spacing = 40
	local offset_layer = 0
	local total_length = 0
	local length_with_spacing = slot_size[1] * amount + slot_width_spacing * (amount - 1)
	local tab_width = length_with_spacing / amount
	local start_width_offset = -length_with_spacing / 2

	for k = 1, amount, 1 do
		local name_suffix = "_" .. tostring(k)
		local row_start_index = k - 1
		total_length = total_length + slot_size[1] + slot_width_spacing
		local offset = {
			start_width_offset,
			0,
			offset_layer
		}
		local hotspot_name = "hotspot" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = hotspot_name,
			style_id = hotspot_name
		}
		style[hotspot_name] = {
			size = slot_size,
			offset = offset
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
			end
		}
		style[selection_texture_name] = {
			size = slot_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				1
			}
		}
		content[selection_texture_name] = "page_indicator_selection"
		local background_texture_name = "background_texture" .. name_suffix
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = background_texture_name,
			style_id = background_texture_name
		}
		style[background_texture_name] = {
			size = slot_size,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				offset[1],
				offset[2],
				0
			}
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
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end
UIWidgets.create_text_input_rect = function (scenegraph_id, size, text_offset)
	local passes = {
		{
			pass_type = "rect",
			style_id = "background"
		},
		{
			pass_type = "border",
			style_id = "background_border"
		},
		{
			pass_type = "hotspot",
			style_id = "background"
		},
		{
			pass_type = "keystrokes",
			input_text_id = "input"
		},
		{
			style_id = "text",
			pass_type = "text",
			text_id = "input"
		}
	}
	local content = {
		text_index = 1,
		caret_index = 1,
		input_mode = "insert",
		input = ""
	}
	local style = {
		background = {
			color = {
				255,
				0,
				0,
				0
			},
			size = table.clone(size)
		},
		background_border = {
			thickness = 2,
			color = {
				255,
				255,
				255,
				255
			},
			size = table.clone(size)
		},
		text = {
			font_size = 36,
			horizontal_scroll = true,
			font_type = "hell_shark",
			size = table.clone(size),
			text_color = Colors.get_color_table_with_alpha("white", 255),
			caret_size = {
				4,
				30
			},
			caret_offset = {
				-5,
				-5,
				0
			},
			caret_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				text_offset[1],
				text_offset[2],
				text_offset[3] + 1
			}
		}
	}
	local widget = {
		element = {
			passes = passes
		},
		content = content,
		style = style,
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

return 
