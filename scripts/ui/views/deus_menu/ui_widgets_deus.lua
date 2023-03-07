UIWidgets = UIWidgets or {}
local health_bar_size = {
	92,
	8
}
local health_bar_offset = {
	-(health_bar_size[1] / 2),
	-25,
	0
}
local items_offset = {
	-15,
	-70
}

local function pulsate_glow(should_pulsate)
	if not should_pulsate then
		return 255
	end

	return 195 + 60 * math.sin(5 * Managers.time:time("ui"))
end

UIWidgets.create_deus_player_status_portrait = function (scenegraph_id, frame_settings_name, level_text, retained_mode)
	local widget = {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "character_portrait",
					texture_id = "character_portrait",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "host_icon",
					texture_id = "host_icon",
					retained_mode = retained_mode,
					content_check_function = function (content)
						return content.is_host
					end
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_bg",
					texture_id = "hp_bar_bg",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_fg",
					texture_id = "hp_bar_fg",
					retained_mode = retained_mode
				},
				{
					style_id = "hp_bar",
					texture_id = "texture_id",
					pass_type = "gradient_mask_texture",
					content_id = "hp_bar",
					content_change_function = function (content, style)
						local bar_value = content.bar_value
						local size = style.size
						local bar_length = health_bar_size[1]
						size[1] = bar_length * bar_value
					end,
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "portrait_icon",
					texture_id = "portrait_icon",
					retained_mode = retained_mode,
					content_check_function = function (content)
						return content.display_portrait_icon
					end
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator",
					texture_id = "talk_indicator",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_glow",
					texture_id = "talk_indicator_glow",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_highlight",
					texture_id = "talk_indicator_highlight",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_highlight_glow",
					texture_id = "talk_indicator_highlight_glow",
					retained_mode = retained_mode
				},
				{
					pass_type = "rotated_texture",
					style_id = "connecting_icon",
					texture_id = "connecting_icon",
					retained_mode = retained_mode,
					content_check_function = function (content)
						return content.connecting
					end
				},
				{
					pass_type = "texture",
					style_id = "ammo_indicator",
					texture_id = "ammo_indicator",
					retained_mode = retained_mode,
					content_check_function = function (content)
						local ammo_progress = content.ammo_percentage

						return ammo_progress and ammo_progress > 0 and ammo_progress <= 0.33
					end
				},
				{
					pass_type = "texture",
					style_id = "ammo_indicator",
					texture_id = "ammo_indicator_empty",
					retained_mode = retained_mode,
					content_check_function = function (content)
						local ammo_progress = content.ammo_percentage

						return ammo_progress and ammo_progress <= 0
					end
				},
				{
					pass_type = "texture",
					style_id = "healthkit_slot",
					texture_id = "healthkit_slot",
					retained_mode = retained_mode,
					content_check_function = function (content)
						return content.healthkit_slot
					end
				},
				{
					pass_type = "texture",
					style_id = "healthkit_slot_bg",
					texture_id = "healthkit_slot_bg",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "healthkit_slot_frame",
					texture_id = "slot_frame",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "potion_slot",
					texture_id = "potion_slot",
					retained_mode = retained_mode,
					content_check_function = function (content)
						return content.potion_slot
					end
				},
				{
					pass_type = "texture",
					style_id = "potion_slot_bg",
					texture_id = "potion_slot_bg",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "potion_slot_frame",
					texture_id = "slot_frame",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "grenade_slot",
					texture_id = "grenade_slot",
					retained_mode = retained_mode,
					content_check_function = function (content)
						return content.grenade_slot
					end
				},
				{
					pass_type = "texture",
					style_id = "grenade_slot_bg",
					texture_id = "grenade_slot_bg",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "grenade_slot_frame",
					texture_id = "slot_frame",
					retained_mode = retained_mode
				},
				{
					pass_type = "texture",
					style_id = "token_icon",
					texture_id = "token_icon",
					retained_mode = retained_mode,
					content_check_function = function (content)
						return content.token_icon and content.show_token_icon
					end
				}
			}
		},
		content = {
			talk_indicator_highlight = "voip_wave",
			character_portrait = "unit_frame_portrait_default",
			display_portrait_icon = false,
			ammo_percentage = 1,
			is_host = false,
			portrait_icon = "status_icon_needs_assist",
			host_icon = "host_icon",
			hp_bar_bg = "hud_teammate_hp_bar_bg",
			ammo_indicator_empty = "unit_frame_ammo_empty",
			connecting_icon = "matchmaking_connecting_icon",
			talk_indicator_highlight_glow = "voip_wave_glow",
			hp_bar_fg = "hud_teammate_hp_bar_frame_dark_pact",
			talk_indicator_glow = "voip_speaker_glow",
			grenade_slot_bg = "hud_inventory_slot_bg_small_01",
			connecting = false,
			healthkit_slot_bg = "hud_inventory_slot_bg_small_01",
			bar_start_side = "left",
			slot_frame = "hud_inventory_slot_small",
			display_portrait_overlay = false,
			potion_slot_bg = "hud_inventory_slot_bg_small_01",
			talk_indicator = "voip_speaker",
			ammo_indicator = "unit_frame_ammo_low",
			hp_bar = {
				texture_id = "teammate_hp_bar_color_tint_1",
				bar_value = 1
			},
			ammo_bar = {
				bar_value = 1,
				texture_id = "hud_teammate_ammo_bar_fill",
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
			}
		},
		style = {
			character_portrait = {
				size = {
					86,
					108
				},
				offset = {
					-43,
					6,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			host_icon = {
				size = {
					40,
					40
				},
				offset = {
					-65,
					-2,
					50
				},
				color = {
					150,
					255,
					255,
					255
				}
			},
			hp_bar_bg = {
				size = {
					100,
					17
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] / 2 - 50,
					health_bar_offset[2] + health_bar_size[2] / 2 - 6.5,
					health_bar_offset[3] + 15
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			hp_bar_fg = {
				size = {
					100,
					24
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] / 2 - 50,
					health_bar_offset[2] + health_bar_size[2] / 2 - 6.5 - 7,
					health_bar_offset[3] + 20
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			hp_bar = {
				gradient_threshold = 1,
				size = {
					health_bar_size[1],
					health_bar_size[2]
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					health_bar_offset[1],
					health_bar_offset[2],
					health_bar_offset[3] + 18
				}
			},
			ammo_indicator = {
				size = {
					32,
					32
				},
				offset = {
					60,
					-40,
					5
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			talk_indicator = {
				size = {
					64,
					64
				},
				offset = {
					60,
					30,
					3
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			talk_indicator_glow = {
				size = {
					64,
					64
				},
				offset = {
					60,
					30,
					2
				},
				color = {
					0,
					0,
					0,
					0
				}
			},
			talk_indicator_highlight = {
				size = {
					64,
					64
				},
				offset = {
					60,
					30,
					3
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			talk_indicator_highlight_glow = {
				size = {
					64,
					64
				},
				offset = {
					60,
					30,
					2
				},
				color = {
					0,
					0,
					0,
					0
				}
			},
			connecting_icon = {
				angle = 0,
				size = {
					53,
					53
				},
				offset = {
					-25,
					34,
					15
				},
				color = {
					255,
					255,
					255,
					255
				},
				pivot = {
					27,
					27
				}
			},
			portrait_icon = {
				size = {
					86,
					108
				},
				offset = {
					-43,
					0,
					1
				},
				color = {
					150,
					255,
					255,
					255
				}
			},
			healthkit_slot_bg = {
				size = {
					29,
					29
				},
				offset = {
					items_offset[1] + -35,
					items_offset[2] + 0,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			healthkit_slot_frame = {
				size = {
					29,
					29
				},
				offset = {
					items_offset[1] + -35,
					items_offset[2] + 0,
					11
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			healthkit_slot = {
				size = {
					25,
					25
				},
				offset = {
					items_offset[1] + -35 + 2.5,
					items_offset[2] + 2,
					8
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			potion_slot_bg = {
				size = {
					29,
					29
				},
				offset = {
					items_offset[1] + 0,
					items_offset[2] + 0,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			potion_slot_frame = {
				size = {
					29,
					29
				},
				offset = {
					items_offset[1] + 0,
					items_offset[2] + 0,
					11
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			potion_slot = {
				size = {
					25,
					25
				},
				offset = {
					items_offset[1] + 2.5,
					items_offset[2] + 2,
					8
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			grenade_slot_bg = {
				size = {
					29,
					29
				},
				offset = {
					items_offset[1] + 35,
					items_offset[2] + 0,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			grenade_slot_frame = {
				size = {
					29,
					29
				},
				offset = {
					items_offset[1] + 35,
					items_offset[2] + 0,
					11
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			grenade_slot = {
				size = {
					25,
					25
				},
				offset = {
					items_offset[1] + 35 + 2.5,
					items_offset[2] + 2,
					8
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			token_icon = {
				size = {
					40,
					40
				},
				offset = {
					15,
					83,
					20
				}
			}
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

UIWidgets.deus_create_player_portraits_frame = function (scenegraph_id, frame_settings_name, level_text, retained_mode, offset)
	local retained_mode = retained_mode
	local scenegraph_id = scenegraph_id
	local widget = {
		element = {
			passes = {}
		},
		content = {},
		style = {}
	}
	local frame_settings = UIPlayerPortraitFrameSettings[frame_settings_name]
	local default_color = {
		255,
		255,
		255,
		255
	}
	local default_offset = offset or {
		0,
		0,
		0
	}
	widget.content.frame_settings_name = frame_settings_name

	for index, data in ipairs(frame_settings) do
		local name = "texture_" .. index
		local texture_name = data.texture or "icons_placeholder"
		local size = nil

		if UIAtlasHelper.has_atlas_settings_by_texture_name(texture_name) then
			local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
			size = texture_settings.size
		else
			size = data.size
		end

		size = size and table.clone(size) or {
			0,
			0
		}
		local offset = {}

		if data.offset then
			offset = table.clone(data.offset)
			offset[1] = default_offset[1] + -(size[1] / 2) + offset[1]
			offset[2] = default_offset[2] + 60 + offset[2]
			offset[3] = data.layer or 0
		else
			offset = table.clone(default_offset)
			offset[1] = -(size[1] / 2) + offset[1]
			offset[2] = offset[2]
			offset[3] = data.layer or 0
		end

		widget.element.passes[#widget.element.passes + 1] = {
			pass_type = "texture",
			texture_id = name,
			style_id = name,
			retained_mode = retained_mode
		}
		widget.content[name] = texture_name
		widget.style[name] = {
			color = data.color or default_color,
			offset = offset,
			size = size
		}
	end

	local portrait_size = {
		86,
		108
	}
	portrait_size[1] = portrait_size[1]
	portrait_size[2] = portrait_size[2]
	local level_offset = {
		0,
		8,
		0
	}
	level_offset[1] = level_offset[1]
	level_offset[2] = level_offset[2]
	level_offset[3] = 15
	local level_name = "level"
	widget.element.passes[#widget.element.passes + 1] = {
		pass_type = "text",
		text_id = level_name,
		style_id = level_name,
		retained_mode = retained_mode
	}
	widget.content[level_name] = level_text
	widget.style[level_name] = {
		vertical_alignment = "center",
		font_type = "hell_shark",
		font_size = 12,
		horizontal_alignment = "center",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = level_offset
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_info_box = function (scenegraph_id, icon, icon_size, icon_frame_name, title, sub_title, info)
	local icon_offset = {
		0,
		130 - icon_size[2] / 2,
		0
	}
	local frame_settings = UIFrameSettings[icon_frame_name]
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local frame_size = {
		icon_size[1] + edge_height * 2,
		icon_size[2] + edge_height * 2
	}
	local frame_offset = {
		icon_offset[1] - edge_height,
		icon_offset[2] - edge_height,
		1
	}
	local icon_text_offset = {
		icon_size[1] + edge_height + 5,
		icon_offset[2] - edge_height - 5
	}
	local title_text = {
		font_size = 36,
		dynamic_font_size = true,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			icon_text_offset[1],
			125,
			0
		},
		size = {
			400 - icon_text_offset[1],
			36
		}
	}
	local title_text_shadow = table.clone(title_text)
	title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	title_text_shadow.offset = {
		title_text.offset[1] + 2,
		title_text.offset[2] - 2,
		title_text.offset[3] - 1
	}
	local sub_title_text = {
		font_size = 20,
		dynamic_font_size = true,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			icon_text_offset[1],
			icon_offset[2],
			0
		},
		size = {
			400 - icon_text_offset[1],
			20
		}
	}
	local sub_title_text_shadow = table.clone(sub_title_text)
	sub_title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	sub_title_text_shadow.offset = {
		sub_title_text.offset[1] + 2,
		sub_title_text.offset[2] - 2,
		sub_title_text.offset[3] - 1
	}
	local info_text = {
		vertical_alignment = "top",
		word_wrap = true,
		dynamic_font_size_word_wrap = true,
		font_size = 20,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			0,
			0,
			0
		},
		size = {
			400,
			icon_text_offset[2]
		}
	}
	local info_text_shadow = table.clone(info_text)
	info_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	info_text_shadow.offset = {
		info_text.offset[1] + 2,
		info_text.offset[2] - 2,
		info_text.offset[3] - 1
	}
	local widget = {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame",
					content_check_function = function (content)
						return content.icon
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						return content.title_text
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						return content.title_text
					end
				},
				{
					style_id = "sub_title_text",
					pass_type = "text",
					text_id = "sub_title_text",
					content_check_function = function (content)
						return content.sub_title_text
					end
				},
				{
					style_id = "sub_title_text_shadow",
					pass_type = "text",
					text_id = "sub_title_text",
					content_check_function = function (content)
						return content.sub_title_text
					end
				},
				{
					style_id = "info_text",
					pass_type = "text",
					text_id = "info_text",
					content_check_function = function (content)
						return content.info_text
					end
				},
				{
					style_id = "info_text_shadow",
					pass_type = "text",
					text_id = "info_text",
					content_check_function = function (content)
						return content.info_text
					end
				}
			}
		},
		content = {
			icon = icon,
			frame = frame_settings.texture,
			title_text = title,
			sub_title_text = sub_title,
			info_text = info
		},
		style = {
			icon = {
				offset = icon_offset,
				texture_size = icon_size or {
					20,
					20
				}
			},
			frame = {
				size = frame_size,
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = frame_offset
			},
			title_text = title_text,
			title_text_shadow = title_text_shadow,
			sub_title_text = sub_title_text,
			sub_title_text_shadow = sub_title_text_shadow,
			info_text = info_text,
			info_text_shadow = info_text_shadow
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

UIWidgets.create_framed_info_box = function (scenegraph_id, title_frame_name, info_frame_name, top_frame_name, top, icon, icon_size, icon_frame_name, title, info, bottom_panel_size)
	bottom_panel_size = bottom_panel_size or {
		340,
		100
	}
	local bottom_frame_settings = UIFrameSettings[info_frame_name]
	local bottom_edge_height = bottom_frame_settings.texture_sizes.horizontal[2]
	local bottom_frame_size = {
		bottom_panel_size[1] + bottom_edge_height * 2,
		bottom_panel_size[2] + bottom_edge_height * 2
	}
	local bottom_frame_offset = {
		-bottom_edge_height,
		-bottom_edge_height,
		1
	}
	local icon_spacing = 12
	local title_panel_size = {
		bottom_panel_size[1],
		icon_size[1] + icon_spacing * 2
	}
	local title_panel_offset = {
		0,
		bottom_panel_size[2] + 2.5 - bottom_frame_offset[2],
		-2
	}
	local title_frame_settings = UIFrameSettings[title_frame_name]
	local title_edge_height = title_frame_settings.texture_sizes.horizontal[2]
	local title_frame_size = {
		title_panel_size[1] + title_edge_height * 2,
		title_panel_size[2] + title_edge_height * 2
	}
	local title_frame_offset = {
		-title_edge_height,
		title_panel_offset[2] - title_edge_height,
		1
	}
	local top_height = 20
	local top_panel_size = {
		bottom_panel_size[1] - icon_size[1],
		top_height
	}
	local top_panel_offset = {
		bottom_panel_size[1] / 2 - top_panel_size[1] / 2,
		title_panel_offset[2] + title_panel_size[2] + title_edge_height * 2,
		-2
	}
	local top_frame_settings = UIFrameSettings[top_frame_name]
	local top_edge_height = top_frame_settings and top_frame_settings.texture_sizes.horizontal[2] or 0
	local top_frame_size = {
		top_panel_size[1] + top_edge_height * 2,
		top_panel_size[2] + top_edge_height * 2
	}
	local top_frame_offset = {
		top_panel_offset[1] - top_edge_height,
		top_panel_offset[2] - top_edge_height,
		1
	}
	local icon_offset = {
		icon_spacing,
		title_panel_offset[2] + icon_spacing,
		0
	}
	local icon_frame_settings = UIFrameSettings[icon_frame_name]
	local icon_edge_height = icon_frame_settings.texture_sizes.horizontal[2]
	local icon_frame_size = {
		icon_size[1] + icon_edge_height * 2,
		icon_size[2] + icon_edge_height * 2
	}
	local icon_frame_offset = {
		icon_offset[1] - icon_edge_height,
		icon_offset[2] - icon_edge_height,
		1
	}
	local total_widget_size = {
		bottom_frame_size[1],
		bottom_frame_size[2] + title_frame_size[2]
	}

	if top_frame_name then
		total_widget_size[2] = total_widget_size[2] + top_frame_size[2]
	end

	local top_text = {
		upper_case = true,
		horizontal_alignment = "center",
		vertical_alignment = "center",
		dynamic_font_size = true,
		font_type = "hell_shark",
		font_size = top_height,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			top_panel_offset[1],
			top_panel_offset[2] + top_panel_size[2] / 2 - top_height / 2,
			0
		},
		size = top_panel_size
	}
	local top_text_shadow = table.clone(top_text)
	top_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	top_text_shadow.offset = {
		top_text.offset[1] + 2,
		top_text.offset[2] - 2,
		top_text.offset[3] - 1
	}
	local title_spacing = 5
	local title_height = 36
	local title_text = {
		vertical_alignment = "center",
		horizontal_alignment = "center",
		dynamic_font_size = true,
		font_type = "hell_shark",
		font_size = title_height,
		text_color = Colors.get_color_table_with_alpha("font_title", 255),
		offset = {
			icon_size[1] + icon_spacing + icon_edge_height + title_spacing,
			title_panel_offset[2] + title_panel_size[2] / 2 - title_height / 2,
			0
		},
		size = {
			title_panel_size[1] - icon_size[1] - icon_spacing * 2 - title_spacing * 2,
			title_height
		}
	}
	local title_text_shadow = table.clone(title_text)
	title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	title_text_shadow.offset = {
		title_text.offset[1] + 2,
		title_text.offset[2] - 2,
		title_text.offset[3] - 1
	}
	local info_spacing = {
		15,
		5
	}
	local info_text = {
		vertical_alignment = "top",
		word_wrap = true,
		dynamic_font_size_word_wrap = true,
		font_size = 20,
		font_type = "hell_shark",
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			info_spacing[1],
			info_spacing[2],
			0
		},
		size = {
			bottom_panel_size[1] - info_spacing[1] * 2,
			bottom_panel_size[2] - info_spacing[2] * 2
		}
	}
	local info_text_shadow = table.clone(info_text)
	info_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	info_text_shadow.offset = {
		info_text.offset[1] + 2,
		info_text.offset[2] - 2,
		info_text.offset[3] - 1
	}
	local widget = {
		element = {
			passes = {
				{
					pass_type = "texture_frame",
					style_id = "top_frame",
					texture_id = "top_frame",
					content_check_function = function (content)
						return content.top_text
					end
				},
				{
					style_id = "top_frame_rect",
					pass_type = "rect",
					content_check_function = function (content)
						return content.top_text
					end
				},
				{
					style_id = "top_text",
					pass_type = "text",
					text_id = "top_text",
					content_check_function = function (content)
						return content.top_text
					end
				},
				{
					style_id = "top_text_shadow",
					pass_type = "text",
					text_id = "top_text",
					content_check_function = function (content)
						return content.top_text
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "title_frame",
					texture_id = "title_frame",
					content_check_function = function (content)
						return content.icon
					end
				},
				{
					pass_type = "rect",
					style_id = "title_frame_rect"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.icon
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "icon_frame",
					texture_id = "icon_frame",
					content_check_function = function (content)
						return content.icon
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						return content.title_text
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						return content.title_text
					end
				},
				{
					pass_type = "texture",
					style_id = "title_glow",
					texture_id = "title_glow",
					content_check_function = function (content)
						return content.title_text
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "bottom_frame",
					texture_id = "bottom_frame",
					content_check_function = function (content)
						return content.info_text
					end
				},
				{
					style_id = "info_text",
					pass_type = "text",
					text_id = "info_text",
					content_check_function = function (content)
						return content.info_text
					end
				},
				{
					style_id = "info_text_shadow",
					pass_type = "text",
					text_id = "info_text",
					content_check_function = function (content)
						return content.info_text
					end
				},
				{
					pass_type = "tiled_texture",
					style_id = "bottom_background",
					texture_id = "bottom_background",
					content_check_function = function (content)
						return content.info_text
					end
				}
			}
		},
		content = {
			bottom_background = "item_tooltip_background",
			title_glow = "tooltip_power_level_header_glow",
			top_frame = top_frame_settings and top_frame_settings.texture,
			title_frame = title_frame_settings.texture,
			bottom_frame = bottom_frame_settings.texture,
			icon = icon,
			icon_frame = icon_frame_settings.texture,
			title_text = title,
			info_text = info,
			top_text = top,
			total_widget_size = total_widget_size
		},
		style = {
			top_frame = {
				size = top_frame_size,
				texture_size = top_frame_settings and top_frame_settings.texture_size,
				texture_sizes = top_frame_settings and top_frame_settings.texture_sizes,
				offset = top_frame_offset
			},
			top_frame_rect = {
				color = {
					255,
					20,
					20,
					20
				},
				offset = top_panel_offset,
				size = top_panel_size
			},
			top_text = top_text,
			top_text_shadow = top_text_shadow,
			title_frame = {
				size = title_frame_size,
				texture_size = title_frame_settings.texture_size,
				texture_sizes = title_frame_settings.texture_sizes,
				offset = title_frame_offset
			},
			title_frame_rect = {
				color = Colors.get_table("black"),
				offset = title_panel_offset,
				size = title_panel_size
			},
			icon = {
				offset = icon_offset,
				texture_size = icon_size or {
					20,
					20
				}
			},
			icon_frame = {
				size = icon_frame_size,
				texture_size = icon_frame_settings.texture_size,
				texture_sizes = icon_frame_settings.texture_sizes,
				offset = icon_frame_offset
			},
			bottom_frame = {
				size = bottom_frame_size,
				texture_size = bottom_frame_settings.texture_size,
				texture_sizes = bottom_frame_settings.texture_sizes,
				offset = bottom_frame_offset
			},
			title_text = title_text,
			title_text_shadow = title_text_shadow,
			title_glow = {
				offset = {
					title_panel_offset[1],
					title_panel_offset[2],
					-1
				},
				size = bottom_panel_size,
				texture_size = {
					title_panel_size[1],
					title_panel_size[2] / 2
				}
			},
			info_text = info_text,
			info_text_shadow = info_text_shadow,
			bottom_background = {
				offset = {
					0,
					0,
					-1
				},
				size = bottom_panel_size,
				texture_tiling_size = bottom_panel_size
			}
		},
		scenegraph_id = scenegraph_id
	}

	return widget
end

UIWidgets.create_icon_info_box = function (scenegraph_id, icon, icon_size, icon_offset, background_icon, background_icon_size, background_icon_offset, sub_text, title_text, title_text_color, width, is_rectangular_icon, hide_text)
	local size = {
		width,
		background_icon_size[2]
	}
	local icon_style = {
		color = {
			255,
			138,
			172,
			235
		},
		offset = icon_offset,
		texture_size = icon_size
	}
	local icon_background_style = {
		color = {
			255,
			255,
			255,
			255
		},
		offset = background_icon_offset,
		texture_size = background_icon_size
	}
	local max_widget_height = icon_background_style.texture_size[2]
	local icon_spacing = 10
	local font_size = 20
	local font_spacing = 2
	local text_height = font_size * 2 + font_spacing
	local text_offset = {
		icon_background_style.texture_size[1] + icon_spacing,
		max_widget_height / 2 - text_height / 2,
		0
	}
	local sub_text_style = {
		vertical_alignment = "center",
		dynamic_font_size = true,
		font_type = "hell_shark",
		font_size = font_size,
		text_color = Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			text_offset[1],
			text_offset[2],
			0
		},
		size = {
			size[1] - text_offset[1],
			font_size
		}
	}
	local sub_text_shadow = table.clone(sub_text_style)
	sub_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	sub_text_shadow.offset = {
		sub_text_style.offset[1] + 2,
		sub_text_style.offset[2] - 2,
		sub_text_style.offset[3] - 1
	}
	local title_text_style = {
		vertical_alignment = "center",
		dynamic_font_size = true,
		font_type = "hell_shark",
		font_size = font_size,
		text_color = title_text_color or Colors.get_color_table_with_alpha("font_default", 255),
		offset = {
			text_offset[1],
			text_offset[2] + sub_text_style.size[2] + font_spacing,
			0
		},
		size = {
			size[1] - text_offset[1],
			font_size
		}
	}
	local title_text_shadow = table.clone(title_text_style)
	title_text_shadow.text_color = Colors.get_color_table_with_alpha("black", 255)
	title_text_shadow.offset = {
		title_text_style.offset[1] + 2,
		title_text_style.offset[2] - 2,
		title_text_style.offset[3] - 1
	}
	local passes = {
		{
			style_id = "icon",
			pass_type = "hotspot",
			content_id = "hotspot"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon"
		},
		{
			style_id = "icon_bg",
			pass_type = "rect",
			content_check_function = function (content)
				return not content.is_rectangular_icon
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_background",
			texture_id = "icon_background"
		},
		{
			style_id = "title_text",
			pass_type = "text",
			text_id = "title_text",
			content_check_function = function (content)
				return not content.hide_text
			end
		},
		{
			style_id = "title_text_shadow",
			pass_type = "text",
			text_id = "title_text",
			content_check_function = function (content)
				return not content.hide_text
			end
		},
		{
			style_id = "sub_text",
			pass_type = "text",
			text_id = "sub_text",
			content_check_function = function (content)
				return not content.hide_text
			end
		},
		{
			style_id = "sub_text_shadow",
			pass_type = "text",
			text_id = "sub_text",
			content_check_function = function (content)
				return not content.hide_text
			end
		}
	}
	local content = {
		hotspot = {},
		icon = icon,
		icon_background = background_icon,
		title_text = title_text,
		sub_text = sub_text,
		total_widget_size = size,
		is_rectangular_icon = is_rectangular_icon,
		hide_text = hide_text
	}
	local style = {
		icon = icon_style,
		icon_bg = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			texture_size = {
				58,
				58
			},
			color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				3,
				0,
				0
			}
		},
		icon_background = icon_background_style,
		title_text = title_text_style,
		title_text_shadow = title_text_shadow,
		sub_text = sub_text_style,
		sub_text_shadow = sub_text_shadow
	}
	local widget = {}
	local element = {
		passes = passes
	}
	widget.element = element
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

UIWidgets.create_start_game_difficulty_stepper = function (scenegraph_id, difficulty_text, difficulty_icon)
	local offset = {
		-12.5,
		0,
		0
	}
	local arrow_highlight_texture = "morris_arrow_highlight"

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					style_id = "info_hotspot",
					pass_type = "hotspot",
					content_id = "info_hotspot"
				},
				{
					style_id = "left_arrow_hotspot",
					pass_type = "hotspot",
					content_id = "left_arrow_hotspot"
				},
				{
					style_id = "left_arrow",
					pass_type = "texture_uv",
					content_id = "left_arrow"
				},
				{
					style_id = "left_arrow_hover",
					pass_type = "texture_uv",
					content_id = "left_arrow_hover",
					content_check_function = function (content)
						return content.parent.left_arrow_hotspot.is_hover
					end
				},
				{
					style_id = "left_arrow_gamepad_highlight",
					pass_type = "texture_uv",
					content_id = "left_arrow_gamepad_highlight",
					content_check_function = function (content)
						return content.parent.left_arrow_pressed
					end
				},
				{
					style_id = "left_arrow_clicked",
					pass_type = "texture_uv",
					content_id = "left_arrow_clicked",
					content_check_function = function (content)
						return content.parent.left_arrow_hotspot.is_clicked == 0
					end
				},
				{
					style_id = "right_arrow_hotspot",
					pass_type = "hotspot",
					content_id = "right_arrow_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "right_arrow",
					texture_id = "right_arrow"
				},
				{
					pass_type = "texture",
					style_id = "right_arrow_hover",
					texture_id = "right_arrow_hover",
					content_check_function = function (content)
						return content.right_arrow_hotspot.is_hover
					end
				},
				{
					pass_type = "texture",
					style_id = "right_arrow_gamepad_highlight",
					texture_id = "right_arrow_gamepad_highlight",
					content_check_function = function (content)
						return content.right_arrow_pressed
					end
				},
				{
					pass_type = "texture",
					style_id = "right_arrow_clicked",
					texture_id = "right_arrow_clicked",
					content_check_function = function (content)
						return content.right_arrow_hotspot.is_clicked == 0
					end
				},
				{
					pass_type = "texture",
					style_id = "difficulty_icon",
					texture_id = "difficulty_icon"
				},
				{
					style_id = "difficulty_text",
					pass_type = "text",
					text_id = "difficulty_text"
				},
				{
					pass_type = "texture",
					style_id = "selected_difficulty_text_bg",
					texture_id = "selected_difficulty_text_bg"
				},
				{
					pass_type = "texture",
					style_id = "selected_difficulty_text_border",
					texture_id = "selected_difficulty_text_border"
				},
				{
					style_id = "selected_difficulty_text_selected",
					texture_id = "selected_difficulty_text_selected",
					pass_type = "texture",
					content_check_function = function (content)
						return content.right_arrow_hotspot.is_hover or content.left_arrow_hotspot.is_hover or not Managers.input:is_device_active("mouse") and content.is_selected
					end,
					content_change_function = function (content, style)
						style.color[1] = pulsate_glow(not Managers.input:is_device_active("mouse"))
					end
				},
				{
					style_id = "selected_difficulty_text",
					pass_type = "text",
					text_id = "selected_difficulty_text"
				}
			}
		},
		content = {
			selected_difficulty_text_border = "morris_difficulty_select_border",
			selected_difficulty_text_bg = "morris_difficulty_select_background",
			right_arrow_pressed = false,
			selected_difficulty_text_selected = "morris_difficulty_select_highlight",
			right_arrow = "morris_arrow_neutral",
			left_arrow_pressed = false,
			background = "morris_difficulty_frame",
			info_hotspot = {},
			left_arrow_hotspot = {},
			left_arrow = {
				texture_id = "morris_arrow_neutral",
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
			},
			left_arrow_hover = {
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
				texture_id = arrow_highlight_texture
			},
			left_arrow_gamepad_highlight = {
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
				texture_id = arrow_highlight_texture
			},
			left_arrow_clicked = {
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
				texture_id = arrow_highlight_texture
			},
			right_arrow_hover = arrow_highlight_texture,
			right_arrow_hotspot = {},
			right_arrow_gamepad_highlight = arrow_highlight_texture,
			right_arrow_clicked = arrow_highlight_texture,
			difficulty_icon = difficulty_icon or "difficulty_option_1",
			difficulty_text = difficulty_text or Localize("not_assigned"),
			selected_difficulty_text = Localize("not_assigned")
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
					offset[1],
					offset[2],
					offset[3] + 5
				},
				size = {
					550,
					180
				}
			},
			info_hotspot = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1],
					offset[2],
					offset[3] + 6
				},
				size = {
					600,
					180
				}
			},
			left_arrow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 125,
					offset[2] + 35,
					offset[3] + 6
				},
				size = {
					52,
					71
				}
			},
			left_arrow_hover = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 125,
					offset[2] + 35,
					offset[3] + 6
				},
				size = {
					52,
					71
				}
			},
			left_arrow_gamepad_highlight = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 125,
					offset[2] + 35,
					offset[3] + 6
				},
				size = {
					52,
					71
				}
			},
			left_arrow_hotspot = {
				color = {
					50,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 125,
					offset[2] + 35,
					offset[3] + 7
				},
				size = {
					52,
					71
				}
			},
			left_arrow_clicked = {
				color = {
					150,
					150,
					150,
					150
				},
				offset = {
					offset[1] + 125,
					offset[2] + 35,
					offset[3] + 7
				},
				size = {
					52,
					71
				}
			},
			right_arrow = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 475,
					offset[2] + 35,
					offset[3] + 6
				},
				size = {
					52,
					71
				}
			},
			right_arrow_hover = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 475,
					offset[2] + 35,
					offset[3] + 6
				},
				size = {
					52,
					71
				}
			},
			right_arrow_gamepad_highlight = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 475,
					offset[2] + 35,
					offset[3] + 6
				},
				size = {
					52,
					71
				}
			},
			right_arrow_hotspot = {
				color = {
					50,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 475,
					offset[2] + 35,
					offset[3] + 7
				},
				size = {
					52,
					71
				}
			},
			right_arrow_clicked = {
				color = {
					150,
					150,
					150,
					150
				},
				offset = {
					offset[1] + 475,
					offset[2] + 35,
					offset[3] + 7
				},
				size = {
					52,
					71
				}
			},
			difficulty_icon = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 12.5,
					offset[2] + 17.5,
					offset[3] + 6
				},
				size = {
					112.5,
					112.5
				}
			},
			difficulty_text = {
				font_size = 26,
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = {
					255,
					193,
					91,
					36
				},
				default_text_color = {
					255,
					193,
					91,
					36
				},
				offset = {
					offset[1] + 180,
					offset[2] + 137.5,
					12
				},
				size = {
					200,
					52
				}
			},
			selected_difficulty_text_bg = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 175,
					offset[2] + 45,
					5
				},
				size = {
					305,
					52
				}
			},
			selected_difficulty_text_border = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 175,
					offset[2] + 45,
					7
				},
				size = {
					305,
					52
				}
			},
			selected_difficulty_text_selected = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					offset[1] + 175,
					offset[2] + 45,
					6
				},
				size = {
					305,
					52
				}
			},
			selected_difficulty_text = {
				font_size = 26,
				upper_case = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					offset[1] + 175,
					offset[2] + 45,
					7
				},
				size = {
					305,
					52
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = offset
	}
end

UIWidgets.create_deus_panel_with_outer_frame = function (scenegraph_id, size)
	local frame_border = UIFrameSettings.border_tiled
	local corner_size = frame_border.texture_sizes.corner
	corner_size = {
		corner_size[1] + 1,
		corner_size[2] + 1
	}

	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		},
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					pass_type = "texture_frame",
					style_id = "border",
					texture_id = "border"
				}
			}
		},
		content = {
			background = "bg_tile",
			border = frame_border.texture
		},
		style = {
			background = {
				texture_tiling_size = {
					256,
					256
				},
				texture_size = size,
				offset = {
					0,
					0,
					1
				},
				color = {
					200,
					255,
					255,
					255
				}
			},
			border = {
				use_tiling = true,
				texture_size = frame_border.texture_size,
				texture_sizes = frame_border.texture_sizes,
				size = {
					size[1] + 2 * corner_size[1],
					size[2] + 2 * corner_size[2]
				},
				offset = {
					-corner_size[1],
					-corner_size[2],
					2
				},
				color = {
					200,
					0,
					0,
					0
				}
			}
		}
	}
end

UIWidgets.create_start_game_deus_play_button = function (scenegraph_id, size, text, font_size, disable_with_gamepad)
	local background_texture = "background_tiled_morris"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local background_texture_size = background_texture_settings.size
	local frame_settings = UIFrameSettings.menu_frame_05_morris
	local glass = "button_glass_02"
	local glass_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(glass)
	local glass_size = glass_settings.size
	local glass_offset_y = frame_settings.texture_sizes.horizontal[2]
	local side_detail = "button_detail_01_morris"
	local side_detail_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail)
	local side_detail_size = side_detail_settings.size
	local side_detail_offset = {
		45,
		4
	}
	local side_detail_glow = "button_detail_01_hover_morris"
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
					texture_id = "background",
					style_id = "background",
					pass_type = "tiled_texture"
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
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_left_disabled",
					pass_type = "texture",
					content_id = "side_detail",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_right_disabled",
					pass_type = "texture_uv",
					content_id = "side_detail",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_glow_left",
					pass_type = "texture",
					content_id = "side_detail_glow",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end,
					content_change_function = function (content, style)
						style.color[1] = pulsate_glow(content.parent.is_selected)
					end
				},
				{
					style_id = "side_detail_glow_right",
					pass_type = "texture_uv",
					content_id = "side_detail_glow",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button
					end,
					content_change_function = function (content, style)
						style.color[1] = pulsate_glow(content.parent.is_selected)
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
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "nop"
				},
				{
					texture_id = "effect",
					style_id = "effect",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_hover or content.is_selected)
					end
				},
				{
					texture_id = "effect",
					style_id = "effect_active",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not button_hotspot.is_hover
					end
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and (button_hotspot.is_hover or content.is_selected)
					end
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow_active",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and not button_hotspot.is_hover
					end
				},
				{
					texture_id = "glow",
					style_id = "glow",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button and button_hotspot.is_hover
					end
				},
				{
					style_id = "fade_right",
					pass_type = "texture",
					content_id = "fade"
				},
				{
					style_id = "fade_left",
					pass_type = "texture_uv",
					content_id = "fade"
				}
			}
		},
		content = {
			effect = "play_button_passive_glow",
			hover_glow = "button_state_hover_green",
			glow = "play_button_glow",
			is_selected = false,
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
				texture_id = side_detail
			},
			fade = {
				texture_id = "horizontal_gradient",
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
			},
			glass = glass,
			button_hotspot = {},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			disable_with_gamepad = disable_with_gamepad,
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
			},
			background = background_texture
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
				},
				texture_tiling_size = {
					background_texture_size[1],
					background_texture_size[2]
				},
				texture_size = {
					size[1],
					size[2]
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
				},
				size = {
					size[1],
					size[2]
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
				},
				size = {
					size[1],
					size[2]
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
					9
				},
				size = {
					size[1],
					size[2]
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
					9
				},
				size = {
					size[1],
					size[2]
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
				offset = {
					2,
					-2,
					8
				},
				size = {
					size[1],
					size[2]
				}
			},
			frame = {
				use_tiling = true,
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
				},
				size = {
					size[1],
					size[2]
				}
			},
			hover_glow = {
				color = {
					192,
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
			hover_glow_active = {
				color = {
					60,
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
					size[2] - glass_size[2] - glass_offset_y,
					6
				},
				size = {
					size[1],
					glass_size[2]
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
					glass_offset_y - 8,
					6
				},
				size = {
					size[1],
					glass_size[2]
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
					glass_offset_y - 1,
					3
				},
				size = {
					size[1],
					math.min(60, size[2] - glass_offset_y * 2)
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
			effect_active = {
				color = {
					128,
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
					-side_detail_offset[1],
					(size[2] - side_detail_size[2]) / 2 + side_detail_offset[2],
					9
				},
				size = {
					side_detail_size[1],
					side_detail_size[2]
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
					size[1] - side_detail_size[1] + side_detail_offset[1],
					(size[2] - side_detail_size[2]) / 2 + side_detail_offset[2],
					9
				},
				size = {
					side_detail_size[1],
					side_detail_size[2]
				}
			},
			side_detail_left_disabled = {
				color = {
					255,
					200,
					200,
					200
				},
				offset = {
					-side_detail_offset[1],
					(size[2] - side_detail_size[2]) / 2 + side_detail_offset[2],
					9
				},
				size = {
					side_detail_size[1],
					side_detail_size[2]
				}
			},
			side_detail_right_disabled = {
				color = {
					255,
					200,
					200,
					200
				},
				offset = {
					size[1] - side_detail_size[1] + side_detail_offset[1],
					(size[2] - side_detail_size[2]) / 2 + side_detail_offset[2],
					9
				},
				size = {
					side_detail_size[1],
					side_detail_size[2]
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
					-side_detail_offset[1],
					(size[2] - side_detail_glow_size[2]) / 2 + side_detail_offset[2],
					10
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
					size[1] - side_detail_glow_size[1] + side_detail_offset[1],
					(size[2] - side_detail_glow_size[2]) / 2 + side_detail_offset[2],
					10
				},
				size = {
					side_detail_glow_size[1],
					side_detail_glow_size[2]
				}
			},
			fade_left = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = Colors.get_color_table_with_alpha("black", 255),
				texture_size = {
					100,
					size[2]
				},
				offset = {
					0,
					0,
					0
				}
			},
			fade_right = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				color = Colors.get_color_table_with_alpha("black", 255),
				texture_size = {
					100,
					size[2]
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

UIWidgets.create_deus_default_button = function (scenegraph_id, size, text, font_size, disable_with_gamepad)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "menu_frame_01_morris"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_width = frame_settings.texture_sizes.corner[1]
	local frame_height = frame_settings.texture_sizes.horizontal[2]
	local side_detail_texture = "button_detail_02_morris"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size
	local side_detail_glow_texture = "button_detail_02_hover_morris"
	local extra_detail_offset_x = 30
	local extra_detail_offset_y = 5

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
					pass_type = "texture_frame",
					content_check_function = function (content)
						return content.draw_frame
					end
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
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail"
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail_glow",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button and button_hotspot.is_hover
					end
				},
				{
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail_glow",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.disable_button and button_hotspot.is_hover
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
			hover_glow = "button_state_default",
			background_fade = "button_bg_fade",
			glass = "button_glass_02",
			draw_frame = true,
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
				texture_id = side_detail_glow_texture
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
			},
			disable_with_gamepad = disable_with_gamepad
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
				dynamic_font_size = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					20,
					0,
					6
				}
			},
			title_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					20,
					0,
					6
				}
			},
			title_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					size[1] - 40,
					size[2]
				},
				offset = {
					22,
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
					size[2] - (frame_height + 11),
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
					frame_height - 9,
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
					-extra_detail_offset_x,
					size[2] / 2 - side_detail_texture_size[2] / 2 + extra_detail_offset_y,
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
					size[1] - side_detail_texture_size[1] + extra_detail_offset_x,
					size[2] / 2 - side_detail_texture_size[2] / 2 + extra_detail_offset_y,
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

UIWidgets.create_start_game_deus_journey_stepper = function (scenegraph_id)
	return {
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		},
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "rect"
				}
			}
		},
		content = {},
		style = {
			rect = {
				color = {
					255,
					0,
					0,
					255
				}
			}
		}
	}
end

UIWidgets.create_start_game_deus_gamemode_info_box = function (scenegraph_id, background_size, gamemode_header_text, game_mode_text, is_twitch)
	local header_text_color_alpha = is_twitch and 0 or 255
	local info_hotspot_height = is_twitch and background_size[2] / 2 or background_size[2]
	local info_hotspot_offset_y = is_twitch and background_size[2] / 2 or 0

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					style_id = "info_hotspot",
					pass_type = "hotspot",
					content_id = "info_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "header_box_title_frame",
					texture_id = "header_box_title_frame"
				},
				{
					style_id = "header_text",
					pass_type = "text",
					text_id = "header_text"
				},
				{
					pass_type = "texture",
					style_id = "box_left_detail",
					texture_id = "box_left_detail"
				},
				{
					pass_type = "texture",
					style_id = "box_right_detail",
					texture_id = "box_right_detail"
				},
				{
					style_id = "game_mode_text",
					pass_type = "text",
					text_id = "game_mode_text"
				},
				{
					style_id = "expedition_highlight_text",
					pass_type = "text",
					text_id = "expedition_highlight_text",
					content_check_function = function (content)
						return not content.show_note
					end
				},
				{
					style_id = "note_text",
					pass_type = "text",
					text_id = "note_text",
					content_check_function = function (content)
						return content.show_note
					end
				},
				{
					style_id = "press_key_text",
					pass_type = "text",
					text_id = "press_key_text",
					content_check_function = function (content)
						return not content.show_note
					end
				}
			}
		},
		content = {
			box_left_detail = "morris_header_end",
			header_box_title_frame = "morris_header_frame",
			is_showing_info = false,
			fade_out_done = false,
			background = "morris_header_background",
			show_note = false,
			box_right_detail = "morris_header_end",
			info_hotspot = {},
			header_text = gamemode_header_text or Localize("not_assigned"),
			game_mode_text = game_mode_text or Localize("not_assigned"),
			expedition_highlight_text = Localize("expedition_highlight_text"),
			note_text = Localize("expedition_info_note") or Localize("not_assigned"),
			press_key_text = string.format(Localize("for_more_info"), "$KEY;start_game_view__show_information:") or Localize("not_assigned")
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
				},
				size = background_size
			},
			info_hotspot = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					info_hotspot_offset_y,
					0
				},
				size = {
					background_size[1],
					info_hotspot_height
				}
			},
			header_box_title_frame = {
				color = {
					255,
					255,
					255,
					255
				},
				size = {
					846,
					162
				},
				offset = {
					-125,
					background_size[2] - 30,
					1
				}
			},
			header_text = {
				word_wrap = false,
				upper_case = true,
				localize = false,
				font_size = 50,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = {
					header_text_color_alpha,
					193,
					91,
					36
				},
				size = {
					background_size[1],
					50
				},
				offset = {
					0,
					background_size[2],
					2
				}
			},
			box_left_detail = {
				color = {
					255,
					200,
					200,
					200
				},
				offset = {
					-19,
					background_size[2] - 182,
					0
				},
				size = {
					43,
					background_size[2] - background_size[2] / 5
				}
			},
			box_right_detail = {
				color = {
					255,
					200,
					200,
					200
				},
				offset = {
					background_size[1] - 19,
					background_size[2] - 182,
					0
				},
				size = {
					43,
					background_size[2] - background_size[2] / 5
				}
			},
			game_mode_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				dynamic_font_size_word_wrap = false,
				font_size = 28,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					25,
					is_twitch and background_size[2] / 2 - 20 or background_size[2] / 2 - 40,
					2
				},
				size = {
					background_size[1] - 50,
					is_twitch and background_size[2] / 2 - 10 or background_size[2] / 2 + 10
				}
			},
			expedition_highlight_text = {
				font_size = 28,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					25,
					background_size[2] / 2 - 30,
					3
				},
				size = {
					background_size[1] - 50,
					background_size[2] / 2
				}
			},
			note_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				dynamic_font_size_word_wrap = true,
				font_size = 28,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = {
					255,
					209,
					0,
					28
				},
				offset = {
					25,
					25,
					2
				},
				size = {
					background_size[1] - 50,
					40
				}
			},
			press_key_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				dynamic_font_size_word_wrap = true,
				font_size = 28,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					25,
					25,
					2
				},
				size = {
					background_size[1] - 50,
					background_size[2] - 50
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

UIWidgets.create_expedition_widget_func = function (scenegraph_id, i, journey_data, journey_name, journey_widget_settings, multiplier)
	local journey_widget_settings = journey_widget_settings or {
		width = 72,
		spacing_x = 40
	}
	local size = {
		180,
		180
	}
	local multiplier = multiplier or 1
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "hotspot",
			pass_type = "hotspot",
			content_id = "button_hotspot",
			content_check_function = function (content)
				return not content.parent.locked
			end
		},
		{
			style_id = "level_icon",
			pass_type = "level_tooltip",
			level_id = "level_data",
			content_check_function = function (content)
				return content.button_hotspot.is_hover or content.gamepad_selected
			end
		},
		{
			style_id = "icon_glow",
			texture_id = "icon_glow",
			pass_type = "texture",
			content_check_function = function (content)
				local mouse_active = Managers.input:is_device_active("mouse")

				return (content.button_hotspot.is_hover or content.gamepad_selected and not mouse_active) and not content.button_hotspot.is_selected
			end,
			content_change_function = function (content, style)
				style.color[1] = pulsate_glow(content.gamepad_selected)
			end
		},
		{
			pass_type = "texture",
			style_id = "level_icon",
			texture_id = "level_icon",
			content_check_function = function (content, style)
				return not content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "level_icon_locked",
			texture_id = "level_icon",
			content_check_function = function (content)
				return content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "lock",
			texture_id = "lock",
			content_check_function = function (content)
				return content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "lock_fade",
			texture_id = "lock_fade",
			content_check_function = function (content)
				return content.locked
			end
		},
		{
			pass_type = "rotated_texture",
			style_id = "path",
			texture_id = "path",
			content_check_function = function (content)
				return content.draw_path and not content.draw_path_fill
			end
		},
		{
			pass_type = "rotated_texture",
			style_id = "path_glow",
			texture_id = "path_glow",
			content_check_function = function (content)
				return content.draw_path and content.draw_path_fill and not content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "theme_icon",
			texture_id = "theme_icon",
			content_check_function = function (content)
				return content.theme_icon ~= nil
			end
		},
		{
			pass_type = "rotated_texture",
			style_id = "level_icon_mask",
			texture_id = "level_icon_mask",
			content_check_function = function (content)
				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "level_icon_frame",
			texture_id = "level_icon_frame",
			content_check_function = function (content, style)
				return not content.locked
			end
		},
		{
			pass_type = "texture",
			style_id = "purple_glow",
			texture_id = "purple_glow"
		},
		{
			pass_type = "texture",
			style_id = "name_frame",
			texture_id = "name_frame",
			content_check_function = function (content, style)
				local gamepad_active = Managers.input:is_device_active("gamepad")

				if gamepad_active then
					return content.gamepad_selected
				else
					return content.button_hotspot.is_selected
				end
			end
		},
		{
			style_id = "journey_name",
			pass_type = "text",
			text_id = "journey_name_text",
			content_check_function = function (content, style)
				local gamepad_active = Managers.input:is_device_active("gamepad")

				if gamepad_active then
					return content.gamepad_selected
				else
					return content.button_hotspot.is_selected
				end
			end
		}
	}
	local content = {
		level_icon = "level_icon_01",
		draw_path = false,
		level_icon_frame = "morris_expedition_select_border",
		chaos_symbol = "map_frame_chaos_slot_01",
		path = "mission_select_screen_trail",
		lock_fade = "map_frame_fade",
		name_frame = "morris_expedition_name_frame",
		locked = true,
		level_icon_mask = "mask_rect",
		purple_glow = "morris_expedition_glow",
		lock = "morris_expedition_locked",
		icon_glow = "morris_expedition_hover",
		path_glow = "mission_select_screen_trail_fill",
		draw_path_fill = false,
		gamepad_selected = false,
		draw_chaos_symbol = true,
		button_hotspot = {},
		journey_data = journey_data,
		journey_name = journey_name,
		journey_name_text = journey_data.display_name
	}
	local style = {
		hotspot = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			area_size = {
				150 * multiplier,
				150 * multiplier
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
				3
			}
		},
		path = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			angle = 0,
			pivot = {
				0,
				6.5
			},
			texture_size = {
				journey_widget_settings.spacing_x,
				10
			},
			offset = {
				(journey_widget_settings.width + journey_widget_settings.spacing_x) * 0.5,
				-2,
				2
			},
			color = {
				255,
				255,
				0,
				0
			}
		},
		path_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			angle = 0,
			pivot = {
				0,
				21.5
			},
			texture_size = {
				journey_widget_settings.spacing_x,
				30
			},
			offset = {
				(journey_widget_settings.width + journey_widget_settings.spacing_x) * 0.5,
				-2,
				2
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		lock = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				160 * multiplier,
				160 * multiplier
			},
			offset = {
				0,
				0,
				9
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		lock_fade = {
			vertical_alignment = "center",
			masked = true,
			horizontal_alignment = "center",
			texture_size = {
				180 * multiplier,
				180 * multiplier
			},
			offset = {
				0,
				0,
				5
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		level_icon_mask = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			color = {
				255,
				255,
				255,
				255
			},
			texture_size = {
				90 * multiplier,
				90 * multiplier
			},
			angle = math.degrees_to_radians(45),
			pivot = {
				90 * multiplier * 0.5,
				90 * multiplier * 0.5
			}
		},
		level_icon_frame = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			color = {
				255,
				255,
				255,
				255
			},
			texture_size = {
				160 * multiplier,
				160 * multiplier
			},
			offset = {
				0,
				0,
				5
			}
		},
		level_icon = {
			vertical_alignment = "center",
			masked = true,
			horizontal_alignment = "center",
			texture_size = {
				160 * multiplier,
				160 * multiplier
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
				3
			}
		},
		level_icon_locked = {
			vertical_alignment = "center",
			saturated = true,
			masked = true,
			horizontal_alignment = "center",
			texture_size = {
				168 * multiplier,
				168 * multiplier
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
				3
			}
		},
		purple_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				240 * multiplier * 0.9,
				330 * multiplier * 0.9
			},
			offset = {
				0,
				45 * multiplier,
				4
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_glow = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				187 * multiplier + 6,
				170 * multiplier + 6
			},
			offset = {
				-1,
				-12,
				4
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		chaos_symbol = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				80 * multiplier,
				80 * multiplier
			},
			offset = {
				0,
				80 * multiplier,
				8
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		theme_icon = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = {
				40 * multiplier,
				40 * multiplier
			},
			offset = {
				0,
				65 * multiplier,
				8
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		name_frame = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			texture_size = {
				294 * multiplier,
				100 * multiplier
			},
			offset = {
				5,
				-130,
				0
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		journey_name = {
			font_size = 28,
			localize = true,
			word_wrap = false,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font_size = true,
			font_type = "hell_shark_header",
			area_size = {
				250,
				80
			},
			offset = {
				0,
				-120,
				2
			},
			text_color = Colors.get_color_table_with_alpha("font_default", 255)
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

UIWidgets.create_start_game_deus_difficulty_info_box = function (scenegraph_id, size)
	local frame_border = UIFrameSettings.border_tiled
	local corner_size = frame_border.texture_sizes.corner
	corner_size = {
		corner_size[1] + 1,
		corner_size[2] + 1
	}

	return {
		element = {
			passes = {
				{
					style_id = "background",
					texture_id = "background",
					pass_type = "tiled_texture",
					content_change_function = function (content, style)
						local new_offset = {
							0 + content.resize_offset[1],
							0 + content.resize_offset[2],
							1
						}

						if content.should_resize then
							style.texture_size = content.resize_size
							style.offset = new_offset
						end
					end
				},
				{
					style_id = "border",
					texture_id = "border",
					pass_type = "texture_frame",
					content_change_function = function (content, style)
						local new_offset = {
							-corner_size[1] + content.resize_offset[1],
							-corner_size[2] + content.resize_offset[2],
							2
						}
						local new_size = content.resize_size

						if content.should_resize then
							style.size = {
								new_size[1] + 2 * corner_size[1],
								new_size[2] + 2 * corner_size[2]
							}
							style.offset = new_offset
						end
					end
				},
				{
					style_id = "difficulty_description",
					pass_type = "text",
					text_id = "difficulty_description",
					content_change_function = function (content, style)
						local new_offset = {
							25 + content.resize_offset[1],
							160 - content.resize_offset[2],
							2
						}

						if content.should_resize then
							style.offset = new_offset
							style.offset = new_offset
						end
					end
				},
				{
					style_id = "highest_obtainable_level",
					pass_type = "text",
					text_id = "highest_obtainable_level",
					content_change_function = function (content, style)
						local new_offset = {
							25 + content.resize_offset[1],
							140 - content.difficulty_description_text_size - content.resize_offset[2],
							2
						}

						if content.should_resize then
							style.offset = new_offset
						end
					end
				},
				{
					style_id = "difficulty_separator",
					texture_id = "difficulty_separator",
					pass_type = "texture",
					content_change_function = function (content, style)
						local new_offset = {
							size[1] / 4 + content.resize_offset[1],
							120 - content.difficulty_description_text_size - content.resize_offset[2],
							2
						}

						if content.should_resize then
							style.offset = new_offset
						end
					end
				},
				{
					style_id = "widget_hotspot",
					pass_type = "hotspot",
					content_id = "widget_hotspot"
				},
				{
					style_id = "difficulty_lock_text",
					pass_type = "text",
					text_id = "difficulty_lock_text",
					content_check_function = function (content)
						return content.should_show_diff_lock_text
					end,
					content_change_function = function (content, style)
						local new_offset = {
							7.5 + content.resize_offset[1],
							-content.difficulty_description_text_size - content.resize_offset[2] + 90,
							2
						}

						if content.should_resize then
							style.offset = new_offset
						end
					end
				},
				{
					style_id = "dlc_lock_text",
					pass_type = "text",
					text_id = "dlc_lock_text",
					content_check_function = function (content)
						return content.should_show_dlc_lock
					end,
					content_change_function = function (content, style)
						local new_offset = {
							2.5 + content.resize_offset[1],
							-content.difficulty_description_text_size - content.resize_offset[2] + 70 - content.difficulty_lock_text_height,
							2
						}

						if content.should_resize then
							style.offset = new_offset
						end
					end
				}
			}
		},
		content = {
			should_show_diff_lock_text = false,
			difficulty_description = "difficulty description",
			should_show_dlc_lock = false,
			highest_obtainable_level = "highest obtainable level",
			should_resize = false,
			background = "bg_tile",
			difficulty_separator = "divider_01_bottom",
			difficulty_description_text_size = 0,
			difficulty_lock_text_height = 0,
			border = frame_border.texture,
			widget_hotspot = {},
			difficulty_lock_text = Localize("required_power_level"),
			dlc_lock_text = Localize("cataclysm_no_wom"),
			resize_offset = {
				0,
				0,
				0
			},
			resize_size = {
				0,
				0
			}
		},
		style = {
			background = {
				texture_tiling_size = {
					256,
					256
				},
				texture_size = size,
				offset = {
					0,
					0,
					1
				},
				color = {
					200,
					255,
					255,
					255
				}
			},
			border = {
				use_tiling = true,
				texture_size = frame_border.texture_size,
				texture_sizes = frame_border.texture_sizes,
				size = {
					size[1] + 2 * corner_size[1],
					size[2] + 2 * corner_size[2]
				},
				offset = {
					-corner_size[1],
					-corner_size[2],
					2
				},
				color = {
					200,
					0,
					0,
					0
				}
			},
			difficulty_description = {
				font_size = 20,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					25,
					-75,
					2
				},
				size = {
					450,
					20
				}
			},
			highest_obtainable_level = {
				font_size = 22,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = {
					255,
					250,
					250,
					250
				},
				offset = {
					25,
					0,
					2
				},
				size = {
					450,
					20
				}
			},
			difficulty_separator = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					size[1] / 4,
					0,
					2
				},
				size = {
					264,
					21
				}
			},
			widget_hotspot = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				},
				size = size
			},
			difficulty_lock_text = {
				font_size = 20,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = {
					255,
					199,
					199,
					199
				},
				offset = {
					7.5,
					0,
					1
				},
				size = {
					485,
					20
				}
			},
			dlc_lock_text = {
				font_size = 20,
				upper_case = false,
				localize = false,
				word_wrap = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = {
					255,
					220,
					148,
					64
				},
				offset = {
					2.5,
					0,
					1
				},
				size = {
					485,
					20
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
