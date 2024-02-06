-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_crafting_inventory_console_definitions.lua

local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	item_tooltip = {
		horizontal_alignment = "right",
		parent = "area_right",
		vertical_alignment = "top",
		size = {
			400,
			0,
		},
		position = {
			-60,
			-90,
			0,
		},
	},
	item_grid = {
		horizontal_alignment = "center",
		parent = "area_left",
		vertical_alignment = "top",
		size = {
			520,
			690,
		},
		position = {
			-9,
			-100,
			1,
		},
	},
	search_input = {
		horizontal_alignment = "left",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			420,
			42,
		},
		position = {
			73,
			-5,
			50,
		},
	},
	search_filters = {
		horizontal_alignment = "right",
		parent = "search_input",
		vertical_alignment = "top",
		size = {
			455,
			42,
		},
		position = {
			475,
			0,
			10,
		},
	},
	new_checkbox = {
		horizontal_alignment = "center",
		parent = "search_filters",
		vertical_alignment = "bottom",
		size = {
			455,
			42,
		},
		position = {
			0,
			-390,
			10,
		},
	},
	pc_bg = {
		horizontal_alignment = "left",
		parent = "search_filters",
		vertical_alignment = "top",
		size = {
			455,
			550,
		},
		position = {
			0,
			0,
			2,
		},
	},
	pc_apply_button = {
		horizontal_alignment = "center",
		parent = "pc_bg",
		vertical_alignment = "bottom",
		size = {
			150,
			42,
		},
		position = {
			0,
			20,
			60,
		},
	},
	pc_divider = {
		horizontal_alignment = "center",
		parent = "pc_apply_button",
		vertical_alignment = "top",
		size = {
			350,
			14,
		},
		position = {
			0,
			40,
			61,
		},
	},
	gamepad_background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			100,
		},
	},
	material_text_1 = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			55,
			100,
		},
		position = {
			-210,
			110,
			2,
		},
	},
	material_text_2 = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			55,
			100,
		},
		position = {
			-140,
			110,
			2,
		},
	},
	material_text_3 = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			55,
			100,
		},
		position = {
			-70,
			110,
			2,
		},
	},
	material_text_4 = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			55,
			100,
		},
		position = {
			0,
			110,
			2,
		},
	},
	material_text_5 = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			55,
			100,
		},
		position = {
			70,
			110,
			2,
		},
	},
	material_text_6 = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			55,
			100,
		},
		position = {
			140,
			110,
			2,
		},
	},
	material_text_7 = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "top",
		size = {
			55,
			100,
		},
		position = {
			210,
			110,
			2,
		},
	},
	page_text_area = {
		horizontal_alignment = "center",
		parent = "item_grid",
		vertical_alignment = "bottom",
		size = {
			334,
			60,
		},
		position = {
			0,
			0,
			3,
		},
	},
	input_icon_previous = {
		horizontal_alignment = "center",
		parent = "page_text_area",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-60,
			0,
			1,
		},
	},
	input_icon_next = {
		horizontal_alignment = "center",
		parent = "page_text_area",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			60,
			0,
			1,
		},
	},
	input_arrow_next = {
		horizontal_alignment = "center",
		parent = "input_icon_next",
		vertical_alignment = "center",
		size = {
			19,
			27,
		},
		position = {
			40,
			0,
			1,
		},
	},
	input_arrow_previous = {
		horizontal_alignment = "center",
		parent = "input_icon_previous",
		vertical_alignment = "center",
		size = {
			19,
			27,
		},
		position = {
			-40,
			0,
			1,
		},
	},
	page_button_next = {
		horizontal_alignment = "center",
		parent = "input_icon_next",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			20,
			0,
			1,
		},
	},
	page_button_previous = {
		horizontal_alignment = "center",
		parent = "input_icon_previous",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-20,
			0,
			1,
		},
	},
}
local page_number_left_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "right",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		-172,
		4,
		2,
	},
}
local page_number_right_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "left",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		171,
		4,
		2,
	},
}
local page_number_center_text_style = {
	font_size = 26,
	font_type = "hell_shark",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		4,
		2,
	},
}

local function create_search_input_widget(parent)
	local frame_settings = UIFrameSettings.button_frame_01
	local glow_settings = UIFrameSettings.frame_outer_glow_01
	local glow_width = glow_settings.texture_sizes.horizontal[2]
	local size = scenegraph_definition.search_input.size

	return {
		scenegraph_id = "search_input",
		offset = {
			0,
			0,
			0,
		},
		element = {
			passes = {
				{
					content_id = "hotspot",
					pass_type = "hotspot",
				},
				{
					pass_type = "texture",
					style_id = "bg_texture",
					texture_id = "bg_texture",
					content_change_function = function (content, style)
						style.color = content.hotspot.disable_button and style.disabled_color or style.base_color
					end,
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					content_id = "details",
					pass_type = "texture",
					style_id = "detail_left",
				},
				{
					pass_type = "texture_frame",
					style_id = "glow",
					texture_id = "glow",
					content_change_function = function (content, style)
						local parent = content.parent
						local filter_selected = parent:filter_selected()
						local filter_active = parent:filter_active()

						if filter_selected or content.input_active then
							style.color[1] = 255
						elseif content.hotspot.is_hover and not filter_active then
							style.color[1] = 100
						else
							style.color[1] = 0
						end
					end,
				},
				{
					pass_type = "text",
					style_id = "search_placeholder",
					text_id = "search_placeholder",
					content_check_function = function (content)
						return content.search_query == "" and not content.input_active and not content.hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "disabled_text",
					text_id = "disabled_text",
					content_check_function = function (content)
						return content.hotspot.disable_button
					end,
				},
				{
					pass_type = "text",
					style_id = "search_query",
					text_id = "search_query",
					content_check_function = function (content)
						return not content.hotspot.disable_button
					end,
					content_change_function = function (content, style)
						if not content.input_active then
							style.caret_color[1] = 0
						else
							style.caret_color[1] = 127 + 128 * math.sin(5 * Managers.time:time("ui"))
						end
					end,
				},
				{
					content_id = "search_filters_hotspot",
					pass_type = "hotspot",
					style_id = "search_filters_hotspot",
					content_check_function = function ()
						return not Managers.input:is_device_active("gamepad")
					end,
					content_change_function = function (content, style)
						local parent = content.parent.parent
						local filter_active = parent:filter_active()

						if filter_active ~= content.filter_active then
							content.filter_active = filter_active

							if filter_active then
								Colors.copy_to(style.parent.search_filters_glow.color, Colors.color_definitions.white)
							else
								Colors.copy_to(style.parent.search_filters_glow.color, Colors.color_definitions.font_title)
							end
						end

						local alpha = 0

						if content.is_hover then
							alpha = 255
						elseif content.filter_active then
							alpha = 200
						end

						style.parent.search_filters_glow.color[1] = alpha
					end,
				},
				{
					pass_type = "texture",
					style_id = "search_filters_bg",
					texture_id = "search_filters_bg",
					content_change_function = function (content, style)
						style.color = content.search_filters_hotspot.disable_button and style.disabled_color or style.base_color
					end,
				},
				{
					pass_type = "texture",
					style_id = "search_filters_icon",
					texture_id = "search_filters_icon",
					content_change_function = function (content, style)
						style.color = content.search_filters_hotspot.disable_button and style.disabled_color or style.base_color
					end,
				},
				{
					pass_type = "texture",
					style_id = "search_filters_glow",
					texture_id = "search_filters_glow",
					content_change_function = function (content, style)
						local gamepad_active = Managers.input:is_device_active("gamepad")

						if not gamepad_active then
							return
						end

						local parent = content.parent
						local filter_selected = parent:filter_selected()
						local filter_active = parent:filter_active()

						style.parent.search_filters_glow.color[1] = not (not filter_selected and not filter_active) and 255 or 0
					end,
				},
				{
					content_id = "clear_hotspot",
					pass_type = "hotspot",
					style_id = "clear_icon",
				},
				{
					pass_type = "texture",
					style_id = "clear_icon",
					texture_id = "clear_icon",
					content_check_function = function (content)
						return content.search_query ~= "" and not content.hotspot.disable_button
					end,
					content_change_function = function (content, style)
						local clear_hotspot = content.clear_hotspot
						local is_hover = clear_hotspot.is_hover

						if is_hover ~= clear_hotspot.was_hover then
							clear_hotspot.was_hover = is_hover

							if is_hover then
								Colors.copy_to(style.color, Colors.color_definitions.font_title)
							else
								Colors.copy_to(style.color, Colors.color_definitions.very_dark_gray)
							end
						end
					end,
				},
			},
		},
		content = {
			bg_texture = "search_bar_texture",
			caret_index = 1,
			clear_icon = "friends_icon_close",
			disabled_text = "inventory_search_disabled",
			input_active = false,
			search_filters_bg = "search_filters_bg",
			search_filters_glow = "search_filters_icon_glow",
			search_filters_icon = "search_filters_icon",
			search_placeholder = "inventory_search_prompt",
			search_query = "",
			text_index = 1,
			hotspot = {
				allow_multi_hover = true,
			},
			frame = frame_settings.texture,
			glow = glow_settings.texture,
			details = {
				texture_id = "button_detail_04",
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
			search_filters_hotspot = {},
			clear_hotspot = {},
			parent = parent,
		},
		style = {
			bg_texture = {
				color = {
					255,
					200,
					200,
					200,
				},
				base_color = {
					255,
					200,
					200,
					200,
				},
				disabled_color = {
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
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					0,
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
			detail_left = {
				horizontal_alignment = "left",
				offset = {
					-34,
					0,
					3,
				},
				texture_size = {
					60,
					42,
				},
			},
			detail_right = {
				horizontal_alignment = "right",
				offset = {
					34,
					0,
					3,
				},
				texture_size = {
					60,
					42,
				},
			},
			glow = {
				frame_margins = {
					-glow_width,
					-glow_width,
				},
				texture_size = glow_settings.texture_size,
				texture_sizes = glow_settings.texture_sizes,
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
			search_placeholder = {
				dynamic_font = true,
				font_size = 25,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				pixel_perfect = true,
				vertical_alignment = "center",
				text_color = {
					255,
					25,
					25,
					25,
				},
				offset = {
					47,
					-3,
					5,
				},
			},
			disabled_text = {
				dynamic_font = true,
				font_size = 25,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = true,
				pixel_perfect = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = {
					128,
					0,
					0,
					0,
				},
				offset = {
					47,
					-3,
					5,
				},
			},
			search_query = {
				dynamic_font = true,
				font_size = 25,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				horizontal_scroll = true,
				pixel_perfect = true,
				vertical_alignment = "center",
				word_wrap = false,
				text_color = Colors.get_table("black"),
				offset = {
					47,
					13,
					3,
				},
				caret_size = {
					2,
					26,
				},
				caret_offset = {
					0,
					-6,
					6,
				},
				caret_color = Colors.get_table("black"),
				size = {
					size[1] - 90,
					size[2],
				},
			},
			search_filters_hotspot = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				area_size = {
					96,
					96,
				},
				offset = {
					-42,
					28,
					7,
				},
			},
			search_filters_bg = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				color = Colors.get_color_table_with_alpha("white", 255),
				base_color = Colors.get_color_table_with_alpha("white", 255),
				disabled_color = {
					255,
					128,
					128,
					128,
				},
				texture_size = {
					128,
					128,
				},
				offset = {
					-80,
					-4,
					58,
				},
			},
			search_filters_icon = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				color = Colors.get_color_table_with_alpha("white", 255),
				base_color = Colors.get_color_table_with_alpha("white", 255),
				disabled_color = {
					128,
					128,
					128,
					128,
				},
				texture_size = {
					128,
					128,
				},
				offset = {
					-80,
					-4,
					58,
				},
			},
			search_filters_glow = {
				horizontal_alignment = "left",
				vertical_alignment = "center",
				color = Colors.get_color_table_with_alpha("font_title", 255),
				texture_size = {
					128,
					128,
				},
				offset = {
					-80,
					-4,
					59,
				},
			},
			clear_icon = {
				horizontal_alignment = "right",
				vertical_alignment = "center",
				color = {
					255,
					80,
					80,
					80,
				},
				texture_size = {
					32,
					32,
				},
				area_size = {
					32,
					32,
				},
				offset = {
					-15,
					0,
					7,
				},
			},
			help_tooltip = {
				cursor_side = "right",
				draw_downwards = true,
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				max_width = 1500,
				vertical_alignment = "center",
				text_color = Colors.get_table("white"),
				line_colors = {
					Colors.get_table("orange_red"),
				},
				cursor_offset = {
					0,
					30,
				},
				offset = {
					0,
					0,
					50,
				},
				area_size = {
					45,
					45,
				},
			},
		},
	}
end

local FILTER_COLOR_DEFAULT = {
	255,
	32,
	32,
	32,
}
local FILTER_COLOR_SELECTED = {
	255,
	139,
	69,
	19,
}

local function create_search_filters_widget(scenegraph_id, ui_renderer, search_definitions)
	local sg_size = scenegraph_definition[scenegraph_id].size
	local size = {
		sg_size[1],
		450,
	}
	local base_offset = -20
	local frame_settings = UIFrameSettings.button_frame_01
	local widget = {
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
					style_id = "bg",
					texture_id = "bg",
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "text",
					style_id = "sort_text",
					text_id = "sort_text",
				},
				{
					pass_type = "texture",
					style_id = "divider_top",
					texture_id = "divider_top",
				},
				{
					pass_type = "text",
					style_id = "filter_text",
					text_id = "filter_text",
				},
				{
					pass_type = "texture",
					style_id = "filter_divider_top",
					texture_id = "divider_top",
				},
				{
					pass_type = "rotated_texture",
					style_id = "divider_left",
					texture_id = "divider_left",
				},
				{
					content_id = "area_hotspot",
					pass_type = "hotspot",
					style_id = "area_hotspot",
				},
				{
					content_id = "close_filter_hotspot",
					pass_type = "hotspot",
					style_id = "close_filter_hotspot",
				},
				{
					content_id = "reset_filter_hotspot",
					pass_type = "hotspot",
					style_id = "reset_filter_hotspot",
					content_change_function = function (hotspot, style)
						if hotspot.on_pressed then
							local content = hotspot.parent
							local query = content.query

							if not table.is_empty(query) then
								table.clear(query.sort)
								table.clear(query.filter)

								query.only_new = nil
								content.query_dirty = true
							end
						end

						style.parent.reset_filter_fg.color[1] = hotspot.is_hover and 255 or 0
					end,
				},
				{
					pass_type = "texture",
					style_id = "reset_filter_bg",
					texture_id = "reset_filter_bg",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end,
				},
				{
					pass_type = "texture",
					style_id = "reset_filter_fg",
					texture_id = "reset_filter_fg",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end,
				},
				{
					pass_type = "hover",
					style_id = "hover",
				},
			},
		},
		content = {
			bg = "button_bg_01",
			divider_left = "divider_01_bottom",
			divider_top = "edge_divider_04_horizontal",
			filter_text = "filters",
			query_dirty = false,
			reset_filter_bg = "achievement_refresh_off",
			reset_filter_fg = "achievement_refresh_on",
			sort_text = "Sort by",
			visible = true,
			frame = frame_settings.texture,
			reset_filter_hotspot = {},
			close_filter_hotspot = {},
			area_hotspot = {},
			query = {
				sort = {},
				filter = {},
			},
			gamepad_button_index = {
				1,
				1,
			},
		},
		style = {
			hover = {
				vertical_alignment = "top",
				offset = {
					0,
					0,
					0,
				},
				area_size = size,
			},
			bg = {
				vertical_alignment = "top",
				offset = {
					0,
					0,
					1,
				},
				color = {
					255,
					64,
					64,
					64,
				},
				texture_size = size,
			},
			gamepad_background = {
				offset = {
					0,
					0,
					-1,
				},
				color = {
					128,
					0,
					0,
					0,
				},
			},
			frame = {
				vertical_alignment = "top",
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				area_size = size,
				offset = {
					0,
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
			sort_text = {
				font_size = 40,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				text_color = Colors.get_table("font_title"),
				offset = {
					0,
					-10 + base_offset,
					3,
				},
			},
			divider_top = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					350,
					14,
				},
				offset = {
					0,
					-50 + base_offset,
					3,
				},
			},
			filter_text = {
				font_size = 40,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				localize = true,
				upper_case = true,
				vertical_alignment = "top",
				text_color = Colors.get_table("font_title"),
				offset = {
					0,
					-10 + base_offset - 150,
					3,
				},
			},
			filter_divider_top = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				texture_size = {
					350,
					14,
				},
				offset = {
					0,
					-50 + base_offset - 150,
					3,
				},
			},
			divider_left = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				texture_size = {
					0,
					21,
				},
				offset = {
					170,
					-60 + base_offset + -20,
					3,
				},
				angle = math.pi * 0.5,
				pivot = {
					0,
					0,
				},
			},
			reset_filter_hotspot = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				area_size = {
					37.5,
					37.5,
				},
				offset = {
					-15,
					-15 + base_offset + 20,
					3,
				},
			},
			close_filter_hotspot = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					75,
					75,
				},
				offset = {
					-20,
					10,
					3,
				},
			},
			area_hotspot = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				area_size = {
					455,
					500,
				},
				offset = {
					0,
					0,
					0,
				},
			},
			reset_filter_bg = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					37.5,
					37.5,
				},
				offset = {
					-15,
					-15 + base_offset + 20,
					4,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			reset_filter_fg = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				texture_size = {
					37.5,
					37.5,
				},
				offset = {
					-15,
					-15 + base_offset + 20,
					5,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
		},
	}
	local passes = widget.element.passes
	local content = widget.content
	local style = widget.style

	content.current_gamepad_index = {
		1,
		1,
	}
	content.gamepad_input_matrix = {}

	local current_input_row = 1
	local font_data = {
		font_size = 24,
		font_type = "hell_shark",
	}
	local font, size_of_font = UIFontByResolution(font_data)
	local font_material, font_size, font_name = font[1], size_of_font, font[3]
	local sort_by = {
		{
			name = "rarity",
			text = Utf8.upper(Localize("search_filter_rarity")),
		},
		{
			name = "power_level",
			text = Utf8.upper(Localize("search_filter_power")),
		},
	}
	local spacing = 50
	local offset = 0
	local row_size = -spacing * 0.5
	local widths = {}

	for i = 1, #sort_by do
		local text = sort_by[i].text
		local width = UIRenderer.text_size(ui_renderer, text, font_material, font_size, size[1])

		widths[#widths + 1] = width
		row_size = row_size + width + spacing
	end

	offset = size[1] * 0.5 - row_size * 0.5

	for i = 1, #sort_by do
		local sort = sort_by[i]
		local text = sort.text
		local name = "sort_items_" .. sort.name

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = name .. "_hotspot",
			style_id = name .. "_hotspot",
			content_change_function = function (content, style)
				if content.on_pressed or content.on_double_click or content.gamepad_pressed then
					local query_sort = content.parent.query.sort
					local sort_option = query_sort[name]

					table.clear(query_sort)

					if sort_option == "descending" then
						query_sort[name] = "ascending"
					elseif not sort_option then
						query_sort[name] = "descending"
					end

					content.gamepad_pressed = nil
				end
			end,
		}
		passes[#passes + 1] = {
			pass_type = "text",
			text_id = name .. "_text",
			style_id = name .. "_text",
			content_change_function = function (content, style)
				local gamepad_active = Managers.input:is_device_active("gamepad")
				local current_gamepad_index = content.current_gamepad_index
				local current_row = current_gamepad_index[1]
				local current_column = current_gamepad_index[2]
				local current_gamepad_hotspot = content.gamepad_input_matrix[current_row][current_column]
				local hotspot_name = name .. "_hotspot"
				local gamepad_selected = gamepad_active and hotspot_name == current_gamepad_hotspot
				local hotspot = content[hotspot_name]
				local is_hover = hotspot.is_hover or gamepad_selected

				style.text_color[1] = is_hover and 255 or 128
				style.text_color[2] = not (not content.query.sort[name] and not is_hover) and 255 or 128
				style.text_color[3] = not (not content.query.sort[name] and not is_hover) and 255 or 128
				style.text_color[4] = not (not content.query.sort[name] and not is_hover) and 255 or 128
			end,
		}
		passes[#passes + 1] = {
			pass_type = "rounded_background",
			style_id = name .. "_foreground",
		}
		passes[#passes + 1] = {
			pass_type = "rounded_background",
			style_id = name .. "_background",
			content_change_function = function (content, style)
				local hotspot = content[name .. "_hotspot"]

				style.color[1] = content.query.sort[name] and 255 or 128
			end,
		}
		passes[#passes + 1] = {
			pass_type = "triangle",
			style_id = name .. "_arrow_up",
			content_check_function = function (content, style)
				return content.query.sort[name] == "ascending"
			end,
		}
		passes[#passes + 1] = {
			pass_type = "triangle",
			style_id = name .. "_arrow_down",
			content_check_function = function (content, style)
				return content.query.sort[name] == "descending"
			end,
		}
		passes[#passes + 1] = {
			pass_type = "triangle",
			style_id = name .. "_small_arrow_up",
			content_check_function = function (content, style)
				return not content.query.sort[name]
			end,
		}
		passes[#passes + 1] = {
			pass_type = "triangle",
			style_id = name .. "_small_arrow_down",
			content_check_function = function (content, style)
				return not content.query.sort[name]
			end,
		}
		content[name .. "_text"] = text
		content[name .. "_hotspot"] = {}
		content.gamepad_input_matrix[current_input_row] = content.gamepad_input_matrix[current_input_row] or {}
		content.gamepad_input_matrix[current_input_row][#content.gamepad_input_matrix[current_input_row] + 1] = name .. "_hotspot"
		style[name .. "_hotspot"] = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			area_size = {
				widths[i] + 40,
				35,
			},
			offset = {
				offset,
				-110,
				51,
			},
		}
		style[name .. "_text"] = {
			horizontal_alignment = "left",
			vertical_alignment = "center",
			font_size = font_data.font_size,
			font_type = font_data.font_type,
			text_color = {
				255,
				128,
				128,
				128,
			},
			offset = {
				offset,
				-110,
				51,
			},
		}
		style[name .. "_foreground"] = {
			corner_radius = 5,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			rect_size = {
				widths[i] + 40,
				35,
			},
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				offset - 10,
				-112,
				50,
			},
		}
		style[name .. "_background"] = {
			corner_radius = 5,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			rect_size = {
				widths[i] + 40 + 2,
				37,
			},
			color = {
				255,
				128,
				128,
				128,
			},
			offset = {
				offset - 10 - 1,
				-111,
				49,
			},
		}
		style[name .. "_arrow_up"] = {
			horizontal_alignment = "left",
			triangle_alignment = "up",
			vertical_alignment = "center",
			texture_size = {
				16,
				12,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset + 5 + widths[i],
				-110,
				53,
			},
		}
		style[name .. "_arrow_down"] = {
			horizontal_alignment = "left",
			triangle_alignment = "down",
			vertical_alignment = "center",
			texture_size = {
				16,
				12,
			},
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				offset + 5 + widths[i],
				-108,
				53,
			},
		}
		style[name .. "_small_arrow_up"] = {
			horizontal_alignment = "left",
			triangle_alignment = "up",
			vertical_alignment = "center",
			texture_size = {
				8,
				6,
			},
			color = {
				128,
				128,
				128,
				128,
			},
			offset = {
				offset + 10 + widths[i],
				-105,
				53,
			},
		}
		style[name .. "_small_arrow_down"] = {
			horizontal_alignment = "left",
			triangle_alignment = "down",
			vertical_alignment = "center",
			texture_size = {
				8,
				6,
			},
			color = {
				128,
				128,
				128,
				128,
			},
			offset = {
				offset + 10 + widths[i],
				-115,
				53,
			},
		}
		offset = offset + widths[i] + spacing
	end

	current_input_row = current_input_row + 1

	local rarities = {}

	for _, rarity_data in pairs(RaritySettings) do
		rarities[#rarities + 1] = rarity_data
	end

	local function sort_func(a, b)
		return a.order < b.order
	end

	table.sort(rarities, sort_func)

	local entries_per_row = 3
	local spacing = 26
	local row_size = -spacing * 0.5
	local offsets = {}
	local widths = {}

	for i = 1, #rarities do
		local rarity_data = rarities[i]
		local width = UIRenderer.text_size(ui_renderer, Localize(rarity_data.display_name), font_material, font_size, size[1])

		widths[#widths + 1] = width
		row_size = row_size + width + spacing

		if i % entries_per_row == 0 or i == #rarities then
			offsets[#offsets + 1] = size[1] * 0.5 - row_size * 0.5
			row_size = -spacing * 0.5
		end
	end

	local current_index = 1
	local offset = offsets[current_index]

	for i = 1, #rarities do
		local rarity_data = rarities[i]
		local offset_index = math.ceil(i / entries_per_row)

		if offset_index ~= current_index then
			offset = offsets[offset_index]
			current_index = offset_index
			current_input_row = current_input_row + 1
		end

		passes[#passes + 1] = {
			pass_type = "hotspot",
			content_id = rarity_data.name .. "_hotspot",
			style_id = rarity_data.name .. "_hotspot",
			content_change_function = function (content, style)
				if content.on_pressed or content.on_double_click or content.gamepad_pressed then
					if not content.parent.query.filter[rarity_data.name] then
						content.parent.query.filter[rarity_data.name] = true
					else
						content.parent.query.filter[rarity_data.name] = nil
					end

					content.gamepad_pressed = nil
				end
			end,
		}
		content[rarity_data.name .. "_hotspot"] = {}
		content.gamepad_input_matrix[current_input_row] = content.gamepad_input_matrix[current_input_row] or {}
		content.gamepad_input_matrix[current_input_row][#content.gamepad_input_matrix[current_input_row] + 1] = rarity_data.name .. "_hotspot"
		style[rarity_data.name .. "_hotspot"] = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			area_size = {
				widths[i] + 20,
				42,
				0,
			},
			offset = {
				offset - 10,
				-250 + (current_index - 1) * -50 - 15,
				50,
			},
		}
		passes[#passes + 1] = {
			pass_type = "rect_text",
			text_id = rarity_data.name,
			style_id = rarity_data.name,
			content_change_function = function (content, style)
				local gamepad_active = Managers.input:is_device_active("gamepad")
				local current_gamepad_index = content.current_gamepad_index
				local current_row = current_gamepad_index[1]
				local current_column = current_gamepad_index[2]
				local current_gamepad_hotspot = content.gamepad_input_matrix[current_row][current_column]
				local hotspot_name = rarity_data.name .. "_hotspot"
				local gamepad_selected = gamepad_active and hotspot_name == current_gamepad_hotspot

				if content[hotspot_name].is_hover or gamepad_selected then
					style.border_color = not content.query.filter[rarity_data.name] and style.hovered_border_color or style.default_border_color
					style.text_color = style.hovered_text_color
				elseif not content.query.filter[rarity_data.name] then
					style.border_color = style.selected_border_color
					style.text_color = style.selected_text_color
				else
					style.border_color = style.default_border_color
					style.text_color = style.default_text_color
				end
			end,
		}
		content[rarity_data.name] = rarity_data.display_name
		style[rarity_data.name] = {
			border = 1,
			horizontal_alignment = "left",
			localize = true,
			vertical_alignment = "top",
			font_size = font_data.font_size,
			font_type = font_data.font_type,
			rect_color = {
				255,
				10,
				10,
				10,
			},
			text_color = {
				160,
				rarity_data.color[2],
				rarity_data.color[3],
				rarity_data.color[4],
			},
			border_color = {
				160,
				rarity_data.frame_color[2],
				rarity_data.frame_color[3],
				rarity_data.frame_color[4],
			},
			selected_border_color = {
				160,
				rarity_data.frame_color[2],
				rarity_data.frame_color[3],
				rarity_data.frame_color[4],
			},
			selected_text_color = {
				160,
				rarity_data.color[2],
				rarity_data.color[3],
				rarity_data.color[4],
			},
			hovered_border_color = {
				255,
				rarity_data.frame_color[2],
				rarity_data.frame_color[3],
				rarity_data.frame_color[4],
			},
			hovered_text_color = {
				255,
				rarity_data.color[2],
				rarity_data.color[3],
				rarity_data.color[4],
			},
			default_border_color = {
				160,
				90,
				90,
				90,
			},
			default_text_color = {
				160,
				90,
				90,
				90,
			},
			line_colors = {},
			offset = {
				offset,
				-250 + (current_index - 1) * -50,
				50,
			},
		}
		offset = offset + widths[i] + spacing
	end

	passes[#passes + 1] = {
		content_id = "checkbox_hotspot",
		pass_type = "hotspot",
		scenegraph_id = "new_checkbox",
		style_id = "checkbox_hotspot",
		content_change_function = function (content, style)
			if content.on_pressed or content.on_double_click or content.gamepad_pressed then
				local query = content.parent.query
				local only_new = not query.only_new

				content.parent.query.only_new = only_new and true
				content.gamepad_pressed = false
			end
		end,
	}
	passes[#passes + 1] = {
		pass_type = "text",
		scenegraph_id = "new_checkbox",
		style_id = "checkbox_text",
		text_id = "checkbox_text",
		content_change_function = function (content, style)
			local gamepad_active = Managers.input:is_device_active("gamepad")
			local current_gamepad_index = content.current_gamepad_index
			local current_row = current_gamepad_index[1]
			local current_column = current_gamepad_index[2]
			local current_gamepad_hotspot = content.gamepad_input_matrix[current_row][current_column]
			local hotspot_name = "checkbox_hotspot"
			local gamepad_selected = gamepad_active and hotspot_name == current_gamepad_hotspot

			style.text_color = not (not content.checkbox_hotspot.is_hover and not gamepad_selected) and style.selected_color or style.base_color
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture",
		scenegraph_id = "new_checkbox",
		style_id = "checkbox_marker",
		texture_id = "checkbox_marker",
		content_check_function = function (content, style)
			local query = content.query

			return query.only_new
		end,
	}
	passes[#passes + 1] = {
		pass_type = "texture_frame",
		scenegraph_id = "new_checkbox",
		style_id = "checkbox_frame",
		texture_id = "checkbox_frame",
		content_change_function = function (content, style)
			local gamepad_active = Managers.input:is_device_active("gamepad")
			local current_gamepad_index = content.current_gamepad_index
			local current_row = current_gamepad_index[1]
			local current_column = current_gamepad_index[2]
			local current_gamepad_hotspot = content.gamepad_input_matrix[current_row][current_column]
			local hotspot_name = "checkbox_hotspot"
			local gamepad_selected = gamepad_active and hotspot_name == current_gamepad_hotspot

			style.text_color = not (not content.checkbox_hotspot.is_hover and not gamepad_selected) and style.selected_color or style.base_color
		end,
	}
	passes[#passes + 1] = {
		pass_type = "rect",
		scenegraph_id = "new_checkbox",
		style_id = "checkbox_background",
	}

	local frame_settings = UIFrameSettings.menu_frame_06

	content.checkbox_frame = frame_settings.texture
	content.checkbox_marker = "matchmaking_checkbox"
	content.checkbox_hotspot = {}
	content.checkbox_text = Localize("only_new_filter")
	current_input_row = current_input_row + 1
	content.gamepad_input_matrix[current_input_row] = content.gamepad_input_matrix[current_input_row] or {}
	content.gamepad_input_matrix[current_input_row][#content.gamepad_input_matrix[current_input_row] + 1] = "checkbox_hotspot"

	local width = UIRenderer.text_size(ui_renderer, content.checkbox_text, font_material, font_size, size[1])
	local checkbox_offset = width * 0.5 + 20

	style.checkbox_text = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		font_size = font_data.font_size,
		font_type = font_data.font_type,
		text_color = Colors.get_color_table_with_alpha("gray", 255),
		base_color = Colors.get_color_table_with_alpha("gray", 255),
		selected_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			0,
			0,
			4,
		},
	}
	style.checkbox_marker = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			29.6,
			24.8,
		},
		offset = {
			checkbox_offset + 4,
			3,
			1,
		},
		color = Colors.get_color_table_with_alpha("font_title", 255),
	}
	style.checkbox_background = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		texture_size = {
			30,
			30,
		},
		offset = {
			checkbox_offset,
			0,
			0,
		},
		color = {
			255,
			0,
			0,
			0,
		},
	}
	style.checkbox_frame = {
		horizontal_alignment = "center",
		vertical_alignment = "center",
		area_size = {
			30,
			30,
		},
		texture_size = frame_settings.texture_size,
		texture_sizes = frame_settings.texture_sizes,
		offset = {
			checkbox_offset,
			0,
			1,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}

	return widget
end

local widgets = {
	material_text_1 = UIWidgets.create_craft_material_widget("material_text_1"),
	material_text_2 = UIWidgets.create_craft_material_widget("material_text_2"),
	material_text_3 = UIWidgets.create_craft_material_widget("material_text_3"),
	material_text_4 = UIWidgets.create_craft_material_widget("material_text_4"),
	material_text_5 = UIWidgets.create_craft_material_widget("material_text_5"),
	material_text_6 = UIWidgets.create_craft_material_widget("material_text_6"),
	material_text_7 = UIWidgets.create_craft_material_widget("material_text_7"),
	item_tooltip = UIWidgets.create_simple_item_presentation("item_tooltip", UISettings.console_tooltip_pass_definitions),
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, 6, 5, 16, 10, false),
	page_button_next = UIWidgets.create_arrow_button("page_button_next", math.pi),
	page_button_previous = UIWidgets.create_arrow_button("page_button_previous"),
	input_icon_next = UIWidgets.create_simple_texture("xbone_button_icon_a", "input_icon_next"),
	input_icon_previous = UIWidgets.create_simple_texture("xbone_button_icon_a", "input_icon_previous"),
	input_arrow_next = UIWidgets.create_simple_uv_texture("settings_arrow_normal", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "input_arrow_next"),
	input_arrow_previous = UIWidgets.create_simple_texture("settings_arrow_normal", "input_arrow_previous"),
	page_text_center = UIWidgets.create_simple_text("/", "page_text_area", nil, nil, page_number_center_text_style),
	page_text_left = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_left_text_style),
	page_text_right = UIWidgets.create_simple_text("0", "page_text_area", nil, nil, page_number_right_text_style),
	page_text_area = UIWidgets.create_simple_texture("tab_menu_bg_03", "page_text_area"),
}
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
				ui_scenegraph.area_left.local_position[1] = scenegraph_definition.area_left.position[1] + -100 * (1 - anim_progress)
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
local frame_settings = UIFrameSettings.button_frame_01
local frame_style = {
	texture_size = frame_settings.texture_size,
	texture_sizes = frame_settings.texture_sizes,
	offset = {
		0,
		0,
		2,
	},
	color = {
		255,
		255,
		255,
		255,
	},
}
local pc_filter_widgets = {
	pc_frame = UIWidgets.create_simple_frame(frame_settings.texture, frame_settings.texture_size, frame_settings.texture_sizes.corner, frame_settings.texture_sizes.vertical, frame_settings.texture_sizes.horizontal, "pc_bg", frame_style),
	pc_bg = UIWidgets.create_simple_texture("button_bg_01", "pc_bg", nil, nil, {
		255,
		64,
		64,
		64,
	}),
	divider = UIWidgets.create_simple_texture("edge_divider_04_horizontal", "pc_divider"),
	apply_button = UIWidgets.create_default_button("pc_apply_button", scenegraph_definition.pc_apply_button.size, nil, nil, Localize("input_description_apply"), 18, nil, nil, nil, true, true),
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	create_search_input_widget = create_search_input_widget,
	create_search_filters_widget = create_search_filters_widget,
	pc_filter_widgets = pc_filter_widgets,
}
