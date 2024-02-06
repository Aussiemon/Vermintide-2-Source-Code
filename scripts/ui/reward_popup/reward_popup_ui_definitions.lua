-- chunkname: @scripts/ui/reward_popup/reward_popup_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local CLOSE_BUTTON_SIZE = {
	370,
	70,
}
local ITEM_LIST_MAX_COLUMNS = 9
local ITEM_LIST_MAX_ROWS = 7
local PADDING = 5
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.end_screen_banner,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	background = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	background_top = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			2,
		},
		size = {
			518,
			55,
		},
	},
	deus_background_top = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			10,
		},
		size = {
			518,
			122,
		},
	},
	background_top_glow = {
		horizontal_alignment = "center",
		parent = "background_top",
		vertical_alignment = "bottom",
		position = {
			0,
			-0,
			1,
		},
		size = {
			518,
			0,
		},
	},
	deus_background_top_glow = {
		horizontal_alignment = "center",
		parent = "deus_background_top",
		vertical_alignment = "bottom",
		position = {
			0,
			-0,
			9,
		},
		size = {
			518,
			0,
		},
	},
	background_bottom = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "top",
		position = {
			0,
			0,
			2,
		},
		size = {
			518,
			55,
		},
	},
	deus_background_bottom = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "top",
		position = {
			0,
			0,
			10,
		},
		size = {
			518,
			122,
		},
	},
	background_bottom_glow = {
		horizontal_alignment = "center",
		parent = "background_bottom",
		vertical_alignment = "top",
		position = {
			0,
			0,
			9,
		},
		size = {
			518,
			0,
		},
	},
	deus_background_bottom_glow = {
		horizontal_alignment = "center",
		parent = "deus_background_bottom",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			518,
			0,
		},
	},
	background_center = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			472,
			0,
		},
	},
	entry_root = {
		horizontal_alignment = "center",
		parent = "background_center",
		vertical_alignment = "center",
		position = {
			0,
			0,
			5,
		},
		size = {
			1500,
			0,
		},
	},
	deus_item_tooltip = {
		horizontal_alignment = "center",
		parent = "deus_background_top",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			-2,
		},
		size = {
			400,
			0,
		},
		offset = {
			0,
			-5,
			0,
		},
	},
	deus_power_up = {
		horizontal_alignment = "center",
		parent = "deus_background_top",
		vertical_alignment = "top",
		position = {
			0,
			0,
			-2,
		},
		size = {
			330,
			194,
		},
		offset = {
			-60,
			-120,
			0,
		},
	},
	item_tooltip = {
		horizontal_alignment = "center",
		parent = "background_top",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			-5,
		},
		size = {
			400,
			0,
		},
		offset = {
			0,
			-5,
			0,
		},
	},
	title_root = {
		horizontal_alignment = "center",
		parent = "background_top",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			1500,
			0,
		},
		offset = {
			0,
			-80,
			0,
		},
	},
	level_root = {
		horizontal_alignment = "center",
		parent = "entry_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			1500,
			0,
		},
	},
	reward_root = {
		horizontal_alignment = "center",
		parent = "background_bottom",
		vertical_alignment = "center",
		position = {
			0,
			0,
			5,
		},
		size = {
			0,
			0,
		},
	},
	deus_reward_root = {
		horizontal_alignment = "center",
		parent = "deus_background_top",
		vertical_alignment = "center",
		position = {
			0,
			0,
			5,
		},
		size = {
			0,
			0,
		},
	},
	texture_root = {
		horizontal_alignment = "center",
		parent = "reward_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	item_root = {
		horizontal_alignment = "center",
		parent = "reward_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			10,
		},
		size = {
			80,
			80,
		},
	},
	item_list_root = {
		horizontal_alignment = "center",
		parent = "reward_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			10,
		},
		offset = {
			0.5 * PADDING,
			0.5 * PADDING + 80 + 15,
			0,
		},
		size = {
			(80 + PADDING) * ITEM_LIST_MAX_COLUMNS,
			80,
		},
	},
	deus_item_root = {
		horizontal_alignment = "center",
		parent = "deus_reward_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			80,
			80,
		},
		offset = {
			0,
			-10,
			0,
		},
	},
	deus_icon = {
		horizontal_alignment = "center",
		parent = "deus_reward_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			74,
			74,
		},
		offset = {
			0,
			-10,
			0,
		},
	},
	career_root = {
		horizontal_alignment = "center",
		parent = "reward_root",
		vertical_alignment = "center",
		position = {
			0,
			0,
			1,
		},
		size = {
			60,
			70,
		},
	},
	claim_button = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "bottom",
		position = {
			0,
			100,
			1,
		},
		size = CLOSE_BUTTON_SIZE,
	},
}
local title_text_style = {
	font_size = 46,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}
local level_text_style = {
	font_size = 46,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function create_icon_widget(texture, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "frame",
					texture_id = "frame",
				},
			},
		},
		content = {
			background = "reward_pop_up_item_bg",
			frame = "reward_pop_up_item_frame",
			texture_id = texture,
		},
		style = {
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
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
					0,
					0,
					1,
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
					2,
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
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_item_widget(texture, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture",
					style_id = "rarity_texture",
					texture_id = "rarity_texture",
				},
			},
		},
		content = {
			frame = "reward_pop_up_item_frame",
			rarity_texture = "icon_bg_plentiful",
			texture_id = texture,
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
					1,
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
					2,
				},
			},
			rarity_texture = {
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

local function create_item_list_widget(scenegraph_id)
	local passes = {}
	local content = {
		frame = "reward_pop_up_item_frame",
		illusion = "item_frame_illusion",
		no_equipped_item = true,
	}
	local style = {}

	for i = 1, ITEM_LIST_MAX_COLUMNS * ITEM_LIST_MAX_ROWS do
		local rarity_key = "rarity" .. i
		local icon_key = "icon" .. i
		local illusion_key = "illusion" .. i
		local frame_key = "frame" .. i
		local tooltip_key = "tooltip" .. i
		local item_key = "item" .. i

		local function content_check_function(arg_content)
			return arg_content[item_key]
		end

		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = rarity_key,
			texture_id = rarity_key,
			content_check_function = content_check_function,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			style_id = icon_key,
			texture_id = icon_key,
			content_check_function = content_check_function,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "illusion",
			style_id = illusion_key,
			content_check_function = function (arg_content)
				return arg_content[item_key] and arg_content[illusion_key]
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "frame",
			style_id = frame_key,
			content_check_function = content_check_function,
		}
		passes[#passes + 1] = {
			pass_type = "hover",
			style_id = tooltip_key,
			content_check_function = content_check_function,
		}
		passes[#passes + 1] = {
			pass_type = "item_tooltip",
			item_id = item_key,
			style_id = tooltip_key,
			content_check_function = function (arg_content)
				if not arg_content[item_key] then
					return false
				end

				local selected_i = arg_content.selected_i

				if selected_i then
					return selected_i == i
				else
					return arg_content.is_hover
				end
			end,
		}
		content[rarity_key] = "icons_placeholder"
		content[icon_key] = "icons_placeholder"
		content[illusion_key] = false
		style[rarity_key] = {
			offset = {
				0,
				0,
				0,
			},
			size = {
				80,
				80,
			},
		}
		style[icon_key] = {
			offset = {
				0,
				0,
				1,
			},
			size = {
				80,
				80,
			},
		}
		style[illusion_key] = {
			offset = {
				0,
				0,
				3,
			},
			size = {
				80,
				80,
			},
		}
		style[frame_key] = {
			offset = {
				0,
				0,
				4,
			},
			size = {
				80,
				80,
			},
		}
		style[tooltip_key] = {
			font_size = 18,
			font_type = "hell_shark",
			horizontal_alignment = "left",
			localize = true,
			max_width = 500,
			vertical_alignment = "top",
			offset = {
				0,
				0,
				5,
			},
			size = {
				80,
				80,
			},
			text_color = Colors.get_color_table_with_alpha("white", 255),
			line_colors = {
				Colors.get_color_table_with_alpha("font_title", 255),
				Colors.get_color_table_with_alpha("white", 255),
			},
		}
	end

	local cursor_frame_settings = UIFrameSettings.frame_outer_glow_04_big

	passes[#passes + 1] = {
		pass_type = "texture_frame",
		style_id = "cursor",
		texture_id = "cursor",
		content_check_function = function (arg_content)
			return arg_content.selected_i
		end,
	}
	content.cursor = cursor_frame_settings.texture
	style.cursor = {
		size = {
			80,
			80,
		},
		texture_size = cursor_frame_settings.texture_size,
		texture_sizes = cursor_frame_settings.texture_sizes,
		frame_margins = {
			-22,
			-22,
		},
		offset = {
			0,
			0,
			4,
		},
		color = {
			255,
			255,
			255,
			255,
		},
	}

	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0,
		},
		element = {
			passes = passes,
		},
		content = content,
		style = style,
	}
end

local function create_weapon_skin_widget(texture, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
				{
					pass_type = "texture",
					style_id = "frame",
					texture_id = "frame",
				},
				{
					pass_type = "texture",
					style_id = "rarity_texture",
					texture_id = "rarity_texture",
				},
				{
					pass_type = "texture",
					style_id = "illusion_overlay",
					texture_id = "illusion_overlay",
				},
			},
		},
		content = {
			frame = "reward_pop_up_item_frame",
			illusion_overlay = "item_frame_illusion",
			rarity_texture = "icon_bg_plentiful",
			texture_id = texture,
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
					1,
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
					3,
				},
			},
			illusion_overlay = {
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
			rarity_texture = {
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

local function create_description_text_widget(text, scenegraph_id)
	local text_offset = {
		0,
		6,
		2,
	}
	local text_style = {
		font_size = 28,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		vertical_alignment = "bottom",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = text_offset,
	}
	local text_shadow_style = table.clone(text_style)

	text_shadow_style.text_color = {
		255,
		0,
		0,
		1,
	}
	text_shadow_style.offset = {
		text_offset[1] + 2,
		text_offset[2] - 2,
		text_offset[3] - 1,
	}

	local title_text_offset = {
		0,
		0,
		2,
	}
	local title_text_style = {
		font_size = 46,
		font_type = "hell_shark_header",
		horizontal_alignment = "center",
		vertical_alignment = "top",
		word_wrap = true,
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = title_text_offset,
	}
	local title_text_shadow_style = table.clone(title_text_style)

	title_text_shadow_style.text_color = {
		255,
		0,
		0,
		1,
	}
	title_text_shadow_style.offset = {
		title_text_offset[1] + 2,
		title_text_offset[2] - 2,
		title_text_offset[3] - 1,
	}

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
					style_id = "title_text_shadow",
					text_id = "title_text",
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
				},
			},
		},
		content = {
			text = text,
			title_text = text,
		},
		style = {
			title_text = title_text_style,
			title_text_shadow = title_text_shadow_style,
			text = text_style,
			text_shadow = text_shadow_style,
		},
		offset = {
			0,
			0,
			0,
		},
		scenegraph_id = scenegraph_id,
	}
end

local function create_power_up(scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "shrine_bg",
					texture_id = "shrine_bg",
				},
				{
					content_id = "shrine_bg_frame_left",
					pass_type = "texture_uv",
					style_id = "shrine_bg_frame_left",
				},
				{
					content_id = "shrine_bg_frame_right",
					pass_type = "texture_uv",
					style_id = "shrine_bg_frame_right",
				},
				{
					pass_type = "texture",
					style_id = "icon_glow",
					texture_id = "icon_glow",
				},
				{
					pass_type = "texture",
					style_id = "icon_frame",
					texture_id = "icon_frame",
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
					style_id = "rarity_text",
					text_id = "rarity_text",
				},
				{
					pass_type = "text",
					style_id = "rarity_text_shadow",
					text_id = "rarity_text",
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
			},
		},
		content = {
			description_text = "",
			icon_frame = "weapon_icon_glow_white",
			icon_glow = "popup_icon_glow_white",
			rarity_text = "",
			shrine_bg = "shrine_blessing_bg_hover",
			title_text = "",
			visible = true,
			shrine_bg_frame_left = {
				texture_id = "shrine_blessing_frame",
				uvs = {
					{
						0,
						0,
					},
					{
						0.5,
						1,
					},
				},
			},
			shrine_bg_frame_right = {
				texture_id = "shrine_blessing_frame",
				uvs = {
					{
						0.5,
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
			shrine_bg = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
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
				texture_size = {
					484,
					194,
				},
			},
			shrine_bg_frame_left = {
				horizontal_alignment = "left",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					242,
					scenegraph_definition.deus_power_up.size[2],
				},
				offset = {
					0,
					0,
					1,
				},
			},
			shrine_bg_frame_right = {
				horizontal_alignment = "right",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				texture_size = {
					242,
					scenegraph_definition.deus_power_up.size[2],
				},
				offset = {
					114,
					0,
					1,
				},
			},
			icon_glow = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					60,
					127,
					15,
				},
				texture_size = {
					180,
					180,
				},
			},
			icon_frame = {
				horizontal_alignment = "center",
				vertical_alignment = "top",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					60,
					83,
					20,
				},
				texture_size = {
					82,
					82,
				},
			},
			title_text = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				area_size = {
					240,
					scenegraph_definition.deus_power_up.size[2],
				},
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					60,
					-30,
					3,
				},
			},
			rarity_text = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					50,
					-30,
					3,
				},
			},
			description_text = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					320,
					110,
				},
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					60,
					-60,
					3,
				},
			},
			title_text_shadow = {
				dynamic_font_size = true,
				font_size = 28,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				localize = false,
				upper_case = true,
				vertical_alignment = "top",
				word_wrap = false,
				area_size = {
					240,
					scenegraph_definition.deus_power_up.size[2],
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					62,
					-32,
					2,
				},
			},
			rarity_text_shadow = {
				font_size = 22,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "top",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					52,
					-32,
					2,
				},
			},
			description_text_shadow = {
				dynamic_font_size_word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				localize = false,
				vertical_alignment = "top",
				word_wrap = true,
				area_size = {
					320,
					110,
				},
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					62,
					-62,
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

local function create_deus_icon(scenegraph_id)
	return {
		element = {
			passes = {
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
					content_check_function = function (content)
						return content.icon
					end,
				},
				{
					pass_type = "rect",
					style_id = "rectangular_bg",
					content_check_function = function (content)
						return content.icon
					end,
				},
			},
		},
		content = {
			icon_bg = "button_frame_01",
		},
		style = {
			icon = {
				horizontal_alignment = "center",
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
					2,
				},
				texture_size = {
					58,
					58,
				},
				default_texture_size = {
					58,
					58,
				},
			},
			icon_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-6,
					0,
				},
				texture_size = {
					70,
					70,
				},
				default_texture_size = {
					70,
					70,
				},
			},
			rectangular_bg = {
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					0,
					0,
					1,
				},
				texture_size = {
					58,
					58,
				},
				default_texture_size = {
					58,
					58,
				},
			},
		},
		offset = {
			0,
			0,
			10,
		},
		scenegraph_id = scenegraph_id,
	}
end

local tooltip_passes = {
	"item_titles",
	"skin_applied",
	"fatigue",
	"item_power_level",
	"properties",
	"traits",
	"keywords",
}
local widget_definitions = {
	title = UIWidgets.create_simple_text("n/a", "title_root", nil, nil, title_text_style),
	level = UIWidgets.create_simple_text("n/a", "level_root", nil, nil, level_text_style),
	description = create_description_text_widget("n/a", "title_root"),
	texture = {
		scenegraph_id = "item_root",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
				},
			},
		},
		content = {
			texture_id = "icons_placeholder",
		},
		style = {
			texture_id = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
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
	},
	icon = create_icon_widget("icons_placeholder", "item_root"),
	item = create_item_widget("icons_placeholder", "item_root"),
	frame = create_item_widget("icons_placeholder", "item_root"),
	weapon_skin = create_weapon_skin_widget("icons_placeholder", "item_root"),
	keep_decoration_painting = create_weapon_skin_widget("icons_placeholder", "item_root"),
	skin = create_weapon_skin_widget("icons_placeholder", "item_root"),
	loot_chest = create_item_widget("icons_placeholder", "item_root"),
	career = UIWidgets.create_simple_texture("icons_placeholder", "career_root"),
	item_list = create_item_list_widget("item_list_root"),
	background_top = UIWidgets.create_simple_texture("reward_popup_panel", "background_top"),
	background_center = UIWidgets.create_simple_uv_texture("reward_pop_up_01_bg", {
		{
			0,
			0.5,
		},
		{
			1,
			0.5,
		},
	}, "background_center"),
	background_bottom = UIWidgets.create_simple_uv_texture("reward_popup_panel", {
		{
			1,
			1,
		},
		{
			0,
			0,
		},
	}, "background_bottom"),
	background_bottom_glow = UIWidgets.create_simple_uv_texture("mission_objective_bottom", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "background_bottom_glow"),
	background_top_glow = UIWidgets.create_simple_uv_texture("mission_objective_top", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "background_top_glow"),
	screen_background = UIWidgets.create_simple_rect("screen", {
		100,
		0,
		0,
		0,
	}),
	claim_button = UIWidgets.create_default_button("claim_button", CLOSE_BUTTON_SIZE, nil, nil, Localize("welcome_currency_popup_button_claim"), nil, nil, nil, nil, true),
	deus_background_top = UIWidgets.create_simple_texture("reward_popup_panel_morris", "deus_background_top"),
	deus_background_bottom = UIWidgets.create_simple_uv_texture("reward_popup_panel_morris", {
		{
			1,
			1,
		},
		{
			0,
			0,
		},
	}, "deus_background_bottom"),
	deus_background_top_glow = UIWidgets.create_simple_uv_texture("mission_objective_top", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "deus_background_top_glow"),
	deus_background_bottom_glow = UIWidgets.create_simple_uv_texture("mission_objective_bottom", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "deus_background_bottom_glow"),
	deus_item = create_item_widget("icons_placeholder", "deus_item_root"),
	deus_item_tooltip = UIWidgets.create_simple_item_presentation("deus_item_tooltip", tooltip_passes),
	item_tooltip = UIWidgets.create_simple_item_presentation("item_tooltip", tooltip_passes),
	deus_power_up = create_power_up("deus_power_up"),
	deus_icon = create_deus_icon("deus_icon"),
}

local function scale_to_percent(style, fraction)
	local dst = style.texture_size
	local src = style.default_texture_size

	dst[1] = src[1] * (2 - fraction)
	dst[2] = src[2] * (2 - fraction)
end

local animations = {
	entry_enter = {
		{
			duration = 0.2,
			name = "fade_in_title_text",
			init = NOP,
			update = function (ui_scenegraph, scenegraph_definition, widget_type, progress, params)
				if not params.played_text_reveal_sound_1 then
					params.played_text_reveal_sound_1 = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_compleation_ver2")
				end

				local anim_fraction = math.easeOutCubic(progress)

				for _, data in pairs(widget_type) do
					local widget = data.widget
					local widget_type = data.widget_type

					data.alpha_multiplier = anim_fraction

					if widget_type == "level" then
						local text_style = widget.style.text

						text_style.font_size = level_text_style.font_size * math.catmullrom(anim_fraction, -0.5, 1, 1, -0.5)
					elseif widget_type == "item" then
						local scenegraph_id = widget.scenegraph_id
						local default_size = scenegraph_definition[scenegraph_id].size
						local size = ui_scenegraph[scenegraph_id].size
						local size_fraction = math.ease_out_exp(progress)

						size[1] = default_size[1] + default_size[1] * (1 - size_fraction)
						size[2] = default_size[2] + default_size[2] * (1 - size_fraction)
					elseif widget_type == "deus_item" then
						local scenegraph_id = widget.scenegraph_id
						local default_size = scenegraph_definition[scenegraph_id].size
						local size = ui_scenegraph[scenegraph_id].size
						local size_fraction = math.ease_out_exp(progress)

						size[1] = default_size[1] + default_size[1] * (1 - size_fraction) * 3
						size[2] = default_size[2] + default_size[2] * (1 - size_fraction) * 3
					elseif widget_type == "deus_icon" then
						local size_fraction = math.ease_out_exp(progress)

						scale_to_percent(widget.style.icon, 2 - size_fraction)
						scale_to_percent(widget.style.icon_bg, 2 - size_fraction)
						scale_to_percent(widget.style.rectangular_bg, 2 - size_fraction)
					end
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget_type, params)
				return
			end,
		},
	},
	entry_exit = {
		{
			duration = 0.2,
			name = "fade_out_title_text",
			init = function (ui_scenegraph, scenegraph_definition, widget_type, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget_type, progress, params)
				local alpha_multiplier = 1 - math.easeOutCubic(progress)

				for _, data in pairs(widget_type) do
					data.alpha_multiplier = alpha_multiplier
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget_type, params)
				return
			end,
		},
	},
	open = {
		{
			end_progress = 0,
			name = "reset",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local deus_background_top_widget = widgets.deus_background_top
				local deus_background_bottom_widget = widgets.deus_background_bottom
				local background_top_widget = widgets.background_top
				local background_bottom_widget = widgets.background_bottom
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size

				current_background_center_size[2] = 0
				background_top_widget.style.texture_id.color[1] = 0
				background_bottom_widget.style.texture_id.color[1] = 0
				deus_background_top_widget.style.texture_id.color[1] = 0
				deus_background_bottom_widget.style.texture_id.color[1] = 0
				background_center_widget.style.texture_id.color[1] = 255

				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position

				current_background_top_position[2] = default_background_top_position[2]

				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position

				current_background_bottom_position[2] = default_background_bottom_position[2]
				widgets.claim_button.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.3,
			name = "fade_in_blur",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)

				params.blur_progress = anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "background_fade_in",
			start_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if not params.played_start_sound then
					params.played_start_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_start")
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local background_top_widget = widgets.background_top
				local background_bottom_widget = widgets.background_bottom
				local alpha = 255 * anim_fraction

				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.4,
			name = "background_entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local background_top_widget = widgets.background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_size = scenegraph_definition[background_top_scenegraph_id].size
				local current_background_top_size = ui_scenegraph[background_top_scenegraph_id].size
				local background_bottom_widget = widgets.background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_size = scenegraph_definition[background_bottom_scenegraph_id].size
				local current_background_bottom_size = ui_scenegraph[background_bottom_scenegraph_id].size
				local anim_size_fraction = math.catmullrom(progress, -4, 1, 1, -1)

				current_background_top_size[1] = default_background_top_size[1] * anim_size_fraction
				current_background_top_size[2] = default_background_top_size[2] * anim_size_fraction
				current_background_bottom_size[1] = default_background_bottom_size[1] * anim_size_fraction
				current_background_bottom_size[2] = default_background_bottom_size[2] * anim_size_fraction
				widgets.claim_button.content.alpha_multiplier = progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "background_expand",
			start_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local background_top_widget = widgets.background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				local background_bottom_widget = widgets.background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size
				local default_background_center_size = scenegraph_definition[background_center_scenegraph_id].size

				current_background_center_size[2] = math.ceil(default_background_center_size[2] * anim_fraction)

				local half_center_height = default_background_center_size[2] / 2
				local height_fraction = default_background_center_size[2] / 82
				local center_uvs = background_center_widget.content.texture_id.uvs
				local total_uv_change = height_fraction * anim_fraction

				center_uvs[1][2] = math.min(0.5 + total_uv_change, 1)
				center_uvs[2][2] = math.max(0.5 - total_uv_change, 0)
				current_background_top_position[2] = default_background_top_position[2] + half_center_height * anim_fraction
				current_background_bottom_position[2] = default_background_bottom_position[2] - half_center_height * anim_fraction

				local background_top_glow_widget = widgets.background_top_glow

				background_top_glow_widget.content.texture_id.uvs[2][2] = anim_fraction

				local new_top_glow_height = 55 * anim_fraction

				ui_scenegraph.background_top_glow.size[2] = new_top_glow_height
				ui_scenegraph.background_top_glow.local_position[2] = -new_top_glow_height

				local background_bottom_glow_widget = widgets.background_bottom_glow

				background_bottom_glow_widget.content.texture_id.uvs[2][2] = anim_fraction

				local new_bottom_glow_height = 55 * anim_fraction

				ui_scenegraph.background_bottom_glow.size[2] = new_bottom_glow_height
				ui_scenegraph.background_bottom_glow.local_position[2] = new_bottom_glow_height
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	close = {
		{
			end_progress = 0.15,
			name = "background_collapse",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local inv_anim_fraction = 1 - math.easeInCubic(progress)
				local background_top_widget = widgets.background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				local background_bottom_widget = widgets.background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size
				local default_background_center_size = scenegraph_definition[background_center_scenegraph_id].size

				current_background_center_size[2] = math.ceil(default_background_center_size[2] - default_background_center_size[2] * anim_fraction)

				local half_center_height = default_background_center_size[2] / 2
				local height_fraction = default_background_center_size[2] / 82
				local center_uvs = background_center_widget.content.texture_id.uvs
				local total_uv_change = height_fraction * inv_anim_fraction

				center_uvs[1][2] = math.min(0.5 + total_uv_change, 1)
				center_uvs[2][2] = math.max(0.5 - total_uv_change, 0)
				current_background_top_position[2] = default_background_top_position[2] + half_center_height - half_center_height * anim_fraction
				current_background_bottom_position[2] = default_background_bottom_position[2] - half_center_height + half_center_height * anim_fraction

				local background_top_glow_widget = widgets.background_top_glow

				background_top_glow_widget.content.texture_id.uvs[2][2] = inv_anim_fraction

				local new_top_glow_height = 55 * inv_anim_fraction

				ui_scenegraph.background_top_glow.size[2] = new_top_glow_height
				ui_scenegraph.background_top_glow.local_position[2] = -new_top_glow_height

				local background_bottom_glow_widget = widgets.background_bottom_glow

				background_bottom_glow_widget.content.texture_id.uvs[2][2] = inv_anim_fraction

				local new_bottom_glow_height = 55 * inv_anim_fraction

				ui_scenegraph.background_bottom_glow.size[2] = new_bottom_glow_height
				ui_scenegraph.background_bottom_glow.local_position[2] = new_bottom_glow_height
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if not params.played_end_sound then
					params.played_end_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_end")
				end
			end,
		},
		{
			end_progress = 0.4,
			name = "fade_out_background",
			start_progress = 0.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local background_top_widget = widgets.background_top
				local background_center_widget = widgets.background_center
				local background_bottom_widget = widgets.background_bottom
				local anim_fraction = math.easeOutCubic(progress)
				local alpha = 255 - 255 * anim_fraction

				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
				background_center_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.5,
			name = "fade_out_blur",
			start_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(1 - progress)

				params.blur_progress = anim_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	deus_open = {
		{
			end_progress = 0,
			name = "reset",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local background_top_widget = widgets.background_top
				local background_bottom_widget = widgets.background_bottom
				local deus_background_top_widget = widgets.deus_background_top
				local deus_background_bottom_widget = widgets.deus_background_bottom
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size

				current_background_center_size[2] = 0
				background_top_widget.style.texture_id.color[1] = 0
				background_bottom_widget.style.texture_id.color[1] = 0
				deus_background_top_widget.style.texture_id.color[1] = 0
				deus_background_bottom_widget.style.texture_id.color[1] = 0
				background_center_widget.style.texture_id.color[1] = 0

				local background_top_scenegraph_id = deus_background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position

				current_background_top_position[2] = default_background_top_position[2]

				local background_bottom_scenegraph_id = deus_background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position

				current_background_bottom_position[2] = default_background_bottom_position[2]
				params.skip_blur = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.3,
			name = "background_fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if not params.played_start_sound then
					params.played_start_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_start")
				end
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local background_top_widget = widgets.deus_background_top
				local background_bottom_widget = widgets.deus_background_bottom
				local alpha = 255 * anim_fraction

				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.4,
			name = "background_entry",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local background_top_widget = widgets.deus_background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_size = scenegraph_definition[background_top_scenegraph_id].size
				local current_background_top_size = ui_scenegraph[background_top_scenegraph_id].size
				local background_bottom_widget = widgets.deus_background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_size = scenegraph_definition[background_bottom_scenegraph_id].size
				local current_background_bottom_size = ui_scenegraph[background_bottom_scenegraph_id].size
				local anim_size_fraction = math.ease_in_exp(progress)

				current_background_top_size[2] = default_background_top_size[2] * anim_size_fraction
				current_background_bottom_size[2] = default_background_bottom_size[2] * anim_size_fraction
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.4,
			name = "background_expand",
			start_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeOutCubic(progress)
				local background_top_widget = widgets.deus_background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				local background_bottom_widget = widgets.deus_background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size
				local default_background_center_size = scenegraph_definition[background_center_scenegraph_id].size

				current_background_center_size[2] = math.ceil(default_background_center_size[2] * anim_fraction)

				local half_center_height = default_background_center_size[2] / 2
				local height_fraction = default_background_center_size[2] / 82
				local center_uvs = background_center_widget.content.texture_id.uvs
				local total_uv_change = height_fraction * anim_fraction

				center_uvs[1][2] = math.min(0.5 + total_uv_change, 1)
				center_uvs[2][2] = math.max(0.5 - total_uv_change, 0)
				current_background_top_position[2] = default_background_top_position[2] + half_center_height * anim_fraction
				current_background_bottom_position[2] = default_background_bottom_position[2] - half_center_height * anim_fraction

				local background_top_glow_widget = widgets.deus_background_top_glow

				background_top_glow_widget.content.texture_id.uvs[2][2] = anim_fraction

				local new_top_glow_height = 55 * anim_fraction

				ui_scenegraph.deus_background_top_glow.size[2] = new_top_glow_height
				ui_scenegraph.deus_background_top_glow.local_position[2] = -new_top_glow_height

				local background_bottom_glow_widget = widgets.deus_background_bottom_glow

				background_bottom_glow_widget.content.texture_id.uvs[2][2] = anim_fraction

				local new_bottom_glow_height = 55 * anim_fraction

				ui_scenegraph.deus_background_bottom_glow.size[2] = new_bottom_glow_height
				ui_scenegraph.deus_background_bottom_glow.local_position[2] = new_bottom_glow_height
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	deus_close = {
		{
			end_progress = 0.15,
			name = "background_collapse",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local inv_anim_fraction = 1 - math.easeInCubic(progress)
				local background_top_widget = widgets.deus_background_top
				local background_top_scenegraph_id = background_top_widget.scenegraph_id
				local default_background_top_position = scenegraph_definition[background_top_scenegraph_id].position
				local current_background_top_position = ui_scenegraph[background_top_scenegraph_id].local_position
				local background_bottom_widget = widgets.deus_background_bottom
				local background_bottom_scenegraph_id = background_bottom_widget.scenegraph_id
				local default_background_bottom_position = scenegraph_definition[background_bottom_scenegraph_id].position
				local current_background_bottom_position = ui_scenegraph[background_bottom_scenegraph_id].local_position
				local background_center_widget = widgets.background_center
				local background_center_scenegraph_id = background_center_widget.scenegraph_id
				local current_background_center_size = ui_scenegraph[background_center_scenegraph_id].size
				local default_background_center_size = scenegraph_definition[background_center_scenegraph_id].size

				current_background_center_size[2] = math.ceil(default_background_center_size[2] - default_background_center_size[2] * anim_fraction)

				local half_center_height = default_background_center_size[2] / 2
				local height_fraction = default_background_center_size[2] / 82
				local center_uvs = background_center_widget.content.texture_id.uvs
				local total_uv_change = height_fraction * inv_anim_fraction

				center_uvs[1][2] = math.min(0.5 + total_uv_change, 1)
				center_uvs[2][2] = math.max(0.5 - total_uv_change, 0)
				current_background_top_position[2] = default_background_top_position[2] + half_center_height - half_center_height * anim_fraction
				current_background_bottom_position[2] = default_background_bottom_position[2] - half_center_height + half_center_height * anim_fraction

				local background_top_glow_widget = widgets.deus_background_top_glow

				background_top_glow_widget.content.texture_id.uvs[2][2] = inv_anim_fraction

				local new_top_glow_height = 55 * inv_anim_fraction

				ui_scenegraph.deus_background_top_glow.size[2] = new_top_glow_height
				ui_scenegraph.deus_background_top_glow.local_position[2] = -new_top_glow_height

				local background_bottom_glow_widget = widgets.deus_background_bottom_glow

				background_bottom_glow_widget.content.texture_id.uvs[2][2] = inv_anim_fraction

				local new_bottom_glow_height = 55 * inv_anim_fraction

				ui_scenegraph.deus_background_bottom_glow.size[2] = new_bottom_glow_height
				ui_scenegraph.deus_background_bottom_glow.local_position[2] = new_bottom_glow_height
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if not params.played_end_sound then
					params.played_end_sound = true

					WwiseWorld.trigger_event(params.wwise_world, "hud_difficulty_increased_end")
				end
			end,
		},
		{
			end_progress = 0.4,
			name = "fade_out_background",
			start_progress = 0.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local background_top_widget = widgets.deus_background_top
				local background_bottom_widget = widgets.deus_background_bottom
				local background_center_widget = widgets.background_center
				local anim_fraction = math.easeOutCubic(progress)
				local alpha = 255 - 255 * anim_fraction

				background_top_widget.style.texture_id.color[1] = alpha
				background_bottom_widget.style.texture_id.color[1] = alpha
				background_center_widget.style.texture_id.color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
local generic_input_actions = {
	default = {
		{
			description_text = "welcome_currency_popup_button_claim",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 2,
		},
		{
			description_text = "input_description_tooltip",
			input_action = "right_stick_press",
			priority = 3,
		},
	},
}

return {
	animations = animations,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	item_list_max_columns = ITEM_LIST_MAX_COLUMNS,
	item_list_max_rows = ITEM_LIST_MAX_ROWS,
	item_list_padding = PADDING,
	generic_input_actions = generic_input_actions,
}
