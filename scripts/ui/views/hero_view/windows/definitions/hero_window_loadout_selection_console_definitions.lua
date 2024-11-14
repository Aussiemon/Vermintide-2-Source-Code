-- chunkname: @scripts/ui/views/hero_view/windows/definitions/hero_window_loadout_selection_console_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_size = window_default_settings.size
local console_menu_scenegraphs = UISettings.console_menu_scenegraphs
local button_size = {
	48,
	48,
}
local button_spacing = 5
local context_menu_width = 400
local scenegraph_definition = {
	screen = console_menu_scenegraphs.screen,
	area = console_menu_scenegraphs.area,
	area_left = console_menu_scenegraphs.area_left,
	area_right = console_menu_scenegraphs.area_right,
	area_divider = console_menu_scenegraphs.area_divider,
	background = {
		horizontal_alignment = "center",
		scale = "fit",
		vertical_alignment = "center",
		position = {
			0,
			0,
			550,
		},
		size = {
			1920,
			1080,
		},
	},
	anchor = {
		horizontal_alignment = "center",
		parent = "background",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
	},
	add_loadout_button = {
		horizontal_alignment = "right",
		parent = "anchor",
		vertical_alignment = "bottom",
		position = {
			-180,
			150,
			100,
		},
		size = button_size,
	},
	button = {
		horizontal_alignment = "left",
		parent = "add_loadout_button",
		vertical_alignment = "bottom",
		position = {
			-button_size[1] - button_spacing,
			0,
			-5,
		},
		size = button_size,
		offset = {
			0,
			0,
			0,
		},
	},
	context_menu = {
		horizontal_alignment = "right",
		parent = "button",
		vertical_alignment = "bottom",
		position = {
			0,
			button_size[2],
			-10,
		},
		size = {
			context_menu_width,
			475,
		},
		offset = {
			0,
			0,
			0,
		},
	},
	context_menu_anchor = {
		horizontal_alignment = "left",
		parent = "context_menu",
		vertical_alignment = "top",
		position = {
			10,
			-10,
			1,
		},
		size = {
			0,
			0,
		},
	},
	icon = {
		horizontal_alignment = "left",
		parent = "context_menu_anchor",
		vertical_alignment = "top",
		position = {
			0,
			0,
			15,
		},
		size = button_size,
	},
	header = {
		horizontal_alignment = "left",
		parent = "context_menu_anchor",
		vertical_alignment = "top",
		position = {
			button_size[1] + button_spacing,
			-5,
			15,
		},
	},
	equipment_header = {
		horizontal_alignment = "left",
		parent = "icon",
		vertical_alignment = "top",
		position = {
			0,
			-55,
			15,
		},
	},
	equipment = {
		horizontal_alignment = "left",
		parent = "equipment_header",
		vertical_alignment = "top",
		position = {
			10,
			-45,
			15,
		},
	},
	talents_header = {
		horizontal_alignment = "left",
		parent = "equipment",
		vertical_alignment = "top",
		position = {
			-10,
			-70,
			15,
		},
	},
	talents = {
		horizontal_alignment = "left",
		parent = "talents_header",
		vertical_alignment = "top",
		position = {
			5,
			-35,
			15,
		},
	},
	cosmetics_header = {
		horizontal_alignment = "left",
		parent = "talents",
		vertical_alignment = "top",
		position = {
			0,
			-60,
			15,
		},
	},
	cosmetics = {
		horizontal_alignment = "left",
		parent = "cosmetics_header",
		vertical_alignment = "top",
		position = {
			10,
			-40,
			15,
		},
	},
	right_divider = {
		horizontal_alignment = "right",
		parent = "context_menu",
		vertical_alignment = "bottom",
		position = {
			0,
			77,
			15,
		},
		size = {
			context_menu_width * 0.5,
			4,
		},
	},
	left_divider = {
		horizontal_alignment = "left",
		parent = "context_menu",
		vertical_alignment = "bottom",
		position = {
			0,
			77,
			15,
		},
		size = {
			context_menu_width * 0.5,
			4,
		},
	},
	bot_checkbox = {
		horizontal_alignment = "left",
		parent = "context_menu",
		vertical_alignment = "bottom",
		size = {
			200,
			50,
		},
		position = {
			10,
			10,
			20,
		},
	},
	delete_button = {
		horizontal_alignment = "right",
		parent = "context_menu",
		vertical_alignment = "bottom",
		position = {
			-10,
			10,
			15,
		},
		size = {
			180,
			50,
		},
	},
	delete_button_bar = {
		horizontal_alignment = "left",
		parent = "delete_button",
		vertical_alignment = "bottom",
		size = {
			180,
			50,
		},
		position = {
			0,
			0,
			3,
		},
	},
	delete_button_bar_edge = {
		horizontal_alignment = "right",
		parent = "delete_button_bar",
		vertical_alignment = "center",
		size = {
			8,
			50,
		},
		position = {
			8,
			0,
			4,
		},
	},
	talent_tooltip = {
		horizontal_alignment = "left",
		parent = "context_menu",
		vertical_alignment = "center",
		position = {
			-20 - context_menu_width,
			170,
			15,
		},
	},
	weapon_tooltip = {
		horizontal_alignment = "center",
		parent = "context_menu",
		vertical_alignment = "center",
		position = {
			-20,
			40,
			15,
		},
	},
}
local context_menu_header_style = {
	dynamic_font_size = true,
	font_size = 36,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = false,
	upper_case = true,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	area_size = {
		400 - button_size[1] - button_spacing - 10,
		50,
	},
	offset = {
		0,
		0,
		0,
	},
}
local context_menu_text_style = {
	dynamic_font_size = true,
	font_size = 26,
	font_type = "hell_shark_header",
	horizontal_alignment = "left",
	localize = true,
	upper_case = false,
	vertical_alignment = "top",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	area_size = {
		400 - button_spacing - 10,
		50,
	},
	offset = {
		0,
		0,
		0,
	},
}
local talent_icon_size = {
	58,
	58,
}
local talent_spacing = 6
local equipment_icon_size = {
	46.25,
	45.5,
}
local equipment_frame_size = {
	111,
	109.2,
}
local weapon_spacing = 32
local equipment_slots = {
	"slot_melee",
	"slot_ranged",
	"slot_necklace",
	"slot_ring",
	"slot_trinket_1",
}
local cosmetic_slots = {
	"slot_hat",
	"slot_skin",
	"slot_frame",
	"slot_pose",
}

local function create_loadout_equipment(scenegraph_id, offset, slots)
	local widget_def = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local offset = offset or {
		0,
		0,
		0,
	}

	for i, slot_name in ipairs(slots) do
		passes[#passes + 1] = {
			pass_type = "hotspot",
			style_id = slot_name .. "_hotspot",
			content_id = slot_name,
			content_check_function = function (content)
				return true
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "weapon_frame",
			style_id = slot_name .. "_frame",
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "equipment_hover_frame",
			style_id = slot_name .. "_frame",
			content_check_function = function (content, style)
				return content[slot_name].is_hover or content[slot_name].is_selected
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "icon",
			style_id = slot_name .. "_icon",
			content_id = slot_name,
			content_check_function = function (content)
				return content.item and content.icon
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "mask",
			style_id = slot_name .. "_mask",
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "rarity",
			style_id = slot_name .. "_mask",
			content_id = slot_name,
		}
		passes[#passes + 1] = {
			item_id = "item",
			pass_type = "item_tooltip",
			scenegraph_id = "weapon_tooltip",
			style_id = "weapon_tooltip",
			content_id = slot_name,
			content_check_function = function (content)
				return content.item and (content.is_hover or content.is_selected)
			end,
		}
		content[slot_name] = {
			is_selected = false,
			no_equipped_item = true,
			rarity = "icon_bg_default",
		}
		style[slot_name] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = equipment_icon_size,
			texture_size = equipment_icon_size,
			offset = {
				(i - 1) * (equipment_icon_size[1] + weapon_spacing),
				0,
				0,
			},
		}
		style[slot_name .. "_hotspot"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				equipment_frame_size[1] * 0.7,
				equipment_frame_size[2] * 0.7,
			},
			offset = {
				(i - 1) * (equipment_icon_size[1] + weapon_spacing),
				0,
				10,
			},
		}
		style[slot_name .. "_icon"] = {
			horizontal_alignment = "center",
			masked = true,
			vertical_alignment = "center",
			area_size = {
				54,
				54,
			},
			texture_size = {
				54,
				54,
			},
			offset = {
				(i - 1) * (equipment_icon_size[1] + weapon_spacing),
				0,
				2,
			},
		}
		style[slot_name .. "_mask"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = equipment_icon_size,
			texture_size = equipment_icon_size,
			offset = {
				(i - 1) * (equipment_icon_size[1] + weapon_spacing),
				0,
				1,
			},
		}
		style[slot_name .. "_frame"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = equipment_frame_size,
			offset = {
				(i - 1) * (equipment_icon_size[1] + weapon_spacing),
				0,
				1,
			},
		}
		style[slot_name .. "_hover_frame"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = equipment_frame_size,
			offset = {
				(i - 1) * (equipment_icon_size[1] + weapon_spacing),
				0,
				10,
			},
		}
	end

	content.equipment_hover_frame = "loadout_item_slot_glow_console"
	content.background = "icon_bg_default"
	content.mask = "mask_rect"
	content.weapon_frame = "loadout_item_slot_console"
	style.weapon_tooltip = {
		draw_downwards = false,
	}
	widget_def.element.passes = passes
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset

	return widget_def
end

local function create_loadout_talents(scenegraph_id, offset)
	local widget_def = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local offset = offset or {
		0,
		0,
		0,
	}
	local hover_frame = "frame_outer_glow_01"
	local frame_settings = UIFrameSettings[hover_frame]

	for i = 1, MaxTalentPoints do
		local talent_id = "talent_" .. i

		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "talent_frame",
			style_id = talent_id .. "_frame",
		}
		passes[#passes + 1] = {
			pass_type = "texture_frame",
			texture_id = "talent_hover_frame",
			style_id = talent_id .. "_hover_frame",
			content_check_function = function (content, style)
				return content[talent_id].is_hover or content[talent_id].is_selected
			end,
		}
		passes[#passes + 1] = {
			pass_type = "hotspot",
			style_id = talent_id,
			content_id = talent_id,
			content_check_function = function (content)
				return content.talent
			end,
		}
		passes[#passes + 1] = {
			pass_type = "texture",
			texture_id = "icon",
			style_id = talent_id,
			content_id = talent_id,
			content_check_function = function (content)
				return content.talent and content.icon
			end,
		}
		passes[#passes + 1] = {
			pass_type = "talent_tooltip",
			scenegraph_id = "talent_tooltip",
			style_id = "talent_tooltip",
			talent_id = "talent",
			content_id = talent_id,
			content_check_function = function (content)
				return content.talent and (content.is_hover or content.is_selected)
			end,
		}
		content[talent_id] = {
			is_selected = false,
		}
		style[talent_id] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = talent_icon_size,
			texture_size = talent_icon_size,
			offset = {
				(i - 1) * (talent_icon_size[1] + talent_spacing),
				0,
				0,
			},
		}
		style[talent_id .. "_frame"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = talent_icon_size,
			offset = {
				(i - 1) * (talent_icon_size[1] + talent_spacing),
				0,
				1,
			},
		}
		style[talent_id .. "_hover_frame"] = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				(i - 1) * (talent_icon_size[1] + talent_spacing),
				0,
				0,
			},
			area_size = {
				talent_icon_size[1] * 1.55,
				talent_icon_size[2] * 1.55,
			},
		}
	end

	content.talent_hover_frame = frame_settings.texture
	content.talent_frame = "talent_frame"
	style.talent_tooltip = {
		draw_downwards = false,
	}
	widget_def.element.passes = passes
	widget_def.content = content
	widget_def.style = style
	widget_def.scenegraph_id = scenegraph_id
	widget_def.offset = offset

	return widget_def
end

local function create_tweaked_default_button(scenegraph_id, size, frame_name, background_texture, text, font_size, optional_color_name, optional_detail_texture, optional_detail_offset, disable_with_gamepad, skip_side_detail, masked, optional_offset, fit_background_texture, optional_area_size)
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
					pass_type = "rect",
					style_id = "background_rect",
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
				{
					pass_type = "texture",
					style_id = "bot_equipped_icon",
					texture_id = "bot_equipped_icon",
					content_check_function = function (content, style)
						local game_mode = Managers.state.game_mode:game_mode_key()

						if not InventorySettings.bot_loadout_allowed_game_modes[game_mode] then
							return false
						end

						local career_name = content.career_name
						local bot_equipment = PlayerData.loadout_selection.bot_equipment
						local bot_equipped = bot_equipment[career_name] == content.loadout_index

						return bot_equipped
					end,
				},
			},
		},
		content = {
			background_fade = "button_bg_fade",
			bot_equipped_icon = "bot_selected_icon",
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
						1 - (fit_background_texture and 1 or size[2] / background_texture_settings.size[2]),
					},
					{
						fit_background_texture and 1 or size[1] / background_texture_settings.size[1],
						1,
					},
				},
				texture_id = background_texture,
			},
			disable_with_gamepad = disable_with_gamepad,
		},
		style = {
			background = {
				horizontal_alignment = "center",
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
					1,
				},
				masked = masked,
				texture_size = fit_background_texture and {
					size[1] * 0.7,
					size[2] * 0.7,
				} or nil,
			},
			background_rect = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
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
				masked = masked,
				texture_size = size,
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
				area_size = optional_area_size,
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
				area_size = optional_area_size,
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
				area_size = optional_area_size,
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
			bot_equipped_icon = {
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				texture_size = {
					20,
					20,
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
					10,
				},
			},
		},
		scenegraph_id = scenegraph_id,
		offset = optional_offset or {
			0,
			0,
			0,
		},
	}
end

local button_frame_name, button_font_size, button_optional_color_name, button_optional_detail_texture, button_optional_detail_offset
local button_disable_with_gamepad = false
local button_skip_side_detail = true
local button_masked = false
local fit_background_texture = true
local disable_delete_button_with_gamepad = false
local loadout_button_widgets = {}

for idx, loadout_data in ipairs(InventorySettings.loadouts) do
	if loadout_data.loadout_type == "custom" then
		loadout_button_widgets[#loadout_button_widgets + 1] = create_tweaked_default_button("button", button_size, button_frame_name, loadout_data.loadout_icon, "", button_font_size, button_optional_color_name, button_optional_detail_texture, button_optional_detail_offset, button_disable_with_gamepad, button_skip_side_detail, button_masked, {
			(button_size[1] + button_spacing) * (loadout_data.loadout_index - 1),
			0,
			0,
		}, fit_background_texture)
	end
end

local widgets = {
	loadout_frame = UIWidgets.create_rect_with_outer_frame("button", button_size, "frame_outer_glow_01", nil, {
		0,
		255,
		255,
		255,
	}, {
		220,
		255,
		255,
		255,
	}),
	hover_loadout_frame = UIWidgets.create_rect_with_outer_frame("button", button_size, "frame_outer_glow_01_white", nil, {
		0,
		255,
		255,
		255,
	}, {
		220,
		255,
		255,
		255,
	}),
	add_loadout_button = UIWidgets.create_default_button("add_loadout_button", button_size, button_frame_name, nil, "+", 32, button_optional_color_name, button_optional_detail_texture, button_optional_detail_offset, button_disable_with_gamepad, button_skip_side_detail, nil, nil, nil, button_size),
}
local context_menu_widgets = {
	context_menu_hotspot = UIWidgets.create_simple_hotspot("context_menu"),
	context_menu_background = UIWidgets.create_simple_texture("button_bg_01", "context_menu", nil, nil, {
		255,
		128,
		128,
		128,
	}, {
		0,
		0,
		1,
	}),
	context_menu_bg = UIWidgets.create_rect_with_outer_frame("context_menu", scenegraph_definition.context_menu.size, "frame_outer_glow_01", -10, {
		255,
		0,
		0,
		0,
	}, {
		220,
		255,
		255,
		255,
	}, -20),
	context_menu_bg_white = UIWidgets.create_rect_with_outer_frame("context_menu", scenegraph_definition.context_menu.size, "frame_outer_glow_01_white", -10, {
		255,
		0,
		0,
		0,
	}, {
		220,
		255,
		255,
		255,
	}, -20),
	icon = UIWidgets.create_simple_texture("icons_placeholder", "icon"),
	header = UIWidgets.create_simple_text("", "header", nil, nil, context_menu_header_style),
	equipment_header = UIWidgets.create_simple_text("hero_window_equipment", "equipment_header", nil, nil, context_menu_text_style),
	equipment = create_loadout_equipment("equipment", nil, equipment_slots),
	talents_header = UIWidgets.create_simple_text("hero_window_talents", "talents_header", nil, nil, context_menu_text_style),
	talents = create_loadout_talents("talents", nil),
	cosmetics_header = UIWidgets.create_simple_text("hero_window_cosmetics", "cosmetics_header", nil, nil, context_menu_text_style),
	cosmetics = create_loadout_equipment("cosmetics", nil, cosmetic_slots),
	right_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "right_divider"),
	left_divider = UIWidgets.create_simple_uv_texture("infoslate_frame_02_horizontal", {
		{
			1,
			0,
		},
		{
			0,
			1,
		},
	}, "left_divider"),
	bot_checkbox = UIWidgets.create_default_checkbox_button_console("bot_checkbox", scenegraph_definition.bot_checkbox.size, Localize("input_description_equip_for_bot"), 16, {
		description = "This is a descirption",
		title = Localize("input_description_equip_for_bot"),
	}, "menu_frame_03_morris", true),
	delete_button = UIWidgets.create_default_button("delete_button", scenegraph_definition.delete_button.size, nil, nil, Localize("input_description_delete_loadout"), nil, nil, nil, nil, disable_delete_button_with_gamepad, button_skip_side_detail),
	delete_button_bar_edge = UIWidgets.create_simple_texture("experience_bar_edge_glow", "delete_button_bar_edge"),
	delete_button_bar = UIWidgets.create_simple_uv_texture("experience_bar_fill", {
		{
			0,
			0,
		},
		{
			1,
			1,
		},
	}, "delete_button_bar"),
}
local gamepad_specific_widgets = {
	background = UIWidgets.create_simple_rect("background", {
		128,
		0,
		0,
		0,
	}),
}
local animation_definitions = {
	on_enter = {
		{
			end_progress = 0.5,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
				ui_scenegraph.anchor.position[1] = 50
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress * anim_progress
				ui_scenegraph.anchor.position[1] = 50 - 50 * anim_progress
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
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "input_description_toggle_loadout_details",
			input_action = "special_1",
			priority = 2,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 3,
		},
		{
			description_text = "input_description_delete_loadout",
			input_action = "refresh",
			priority = 4,
		},
		{
			description_text = "input_description_equip_for_bot",
			input_action = "left_stick_press",
			priority = 5,
			content_check_function = function ()
				local game_mode_key = Managers.state.game_mode:game_mode_key()

				return InventorySettings.bot_loadout_allowed_game_modes[game_mode_key]
			end,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 6,
		},
	},
	default_no_delete = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "input_description_toggle_loadout_details",
			input_action = "special_1",
			priority = 2,
		},
		{
			description_text = "input_description_select",
			input_action = "confirm",
			priority = 3,
		},
		{
			description_text = "input_description_equip_for_bot",
			input_action = "left_stick_press",
			priority = 4,
			content_check_function = function ()
				local game_mode_key = Managers.state.game_mode:game_mode_key()

				return InventorySettings.bot_loadout_allowed_game_modes[game_mode_key]
			end,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 5,
		},
	},
	details = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_pad",
			priority = 1,
		},
		{
			description_text = "input_description_delete_loadout",
			input_action = "refresh",
			priority = 2,
		},
		{
			description_text = "menu_back",
			input_action = "back",
			priority = 3,
		},
	},
	add_loadout = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "input_description_add_loadout",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "menu_back",
			input_action = "back",
			priority = 3,
		},
	},
	add_loadout_no_add = {
		{
			description_text = "input_description_navigate",
			ignore_keybinding = true,
			input_action = "d_horizontal",
			priority = 1,
		},
		{
			description_text = "menu_back",
			input_action = "back",
			priority = 3,
		},
	},
}

return {
	widgets = widgets,
	loadout_button_widgets = loadout_button_widgets,
	gamepad_specific_widgets = gamepad_specific_widgets,
	context_menu_widgets = context_menu_widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions,
	button_size = button_size,
	button_spacing = button_spacing,
	equipment_slots = equipment_slots,
	cosmetic_slots = cosmetic_slots,
	generic_input_actions = generic_input_actions,
}
