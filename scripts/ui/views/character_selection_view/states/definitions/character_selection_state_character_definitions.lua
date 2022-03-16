local video_window_width = 426
local video_window_height = 240
local career_info_size = {
	450,
	170
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.default
		}
	},
	right_side_root = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			0,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	left_side_root = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			0,
			1080
		},
		position = {
			0,
			0,
			1
		}
	},
	bottom_panel = {
		vertical_alignment = "bottom",
		scale = "fit_width",
		size = {
			1920,
			79
		},
		position = {
			0,
			0,
			UILayer.default + 1
		}
	},
	hero_info_panel = {
		vertical_alignment = "top",
		parent = "left_side_root",
		horizontal_alignment = "left",
		size = {
			441,
			118
		},
		position = {
			112,
			-62,
			1
		}
	},
	hero_info_level_bg = {
		vertical_alignment = "center",
		parent = "hero_info_panel",
		horizontal_alignment = "left",
		size = {
			124,
			138
		},
		position = {
			-62,
			0,
			2
		}
	},
	hero_info_divider = {
		vertical_alignment = "top",
		parent = "hero_info_level_bg",
		horizontal_alignment = "center",
		size = {
			14,
			790
		},
		position = {
			0,
			-126,
			-1
		}
	},
	hero_info_divider_edge = {
		vertical_alignment = "bottom",
		parent = "hero_info_divider",
		horizontal_alignment = "center",
		size = {
			28,
			22
		},
		position = {
			0,
			-22,
			1
		}
	},
	info_career_name = {
		vertical_alignment = "top",
		parent = "hero_info_panel",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			76,
			-16,
			1
		}
	},
	info_hero_name = {
		vertical_alignment = "top",
		parent = "info_career_name",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			0,
			-40,
			1
		}
	},
	info_hero_level = {
		vertical_alignment = "center",
		parent = "hero_info_level_bg",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			0,
			0,
			1
		}
	},
	locked_info_text = {
		vertical_alignment = "top",
		parent = "hero_root",
		horizontal_alignment = "left",
		size = {
			641,
			50
		},
		position = {
			0,
			60,
			1
		}
	},
	hero_root = {
		vertical_alignment = "center",
		parent = "hero_info_level_bg",
		horizontal_alignment = "center",
		size = {
			110,
			130
		},
		position = {
			80,
			-200,
			100
		}
	},
	hero_icon_root = {
		vertical_alignment = "center",
		parent = "hero_root",
		horizontal_alignment = "left",
		size = {
			48,
			144
		},
		position = {
			-59,
			0,
			100
		}
	},
	info_window = {
		vertical_alignment = "top",
		parent = "right_side_root",
		horizontal_alignment = "right",
		size = {
			career_info_size[1] + 20,
			885
		},
		position = {
			-50,
			-75,
			1
		}
	},
	info_window_video = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = {
			video_window_width,
			video_window_height
		},
		position = {
			0,
			-10,
			1
		}
	},
	info_video_edge_left = {
		vertical_alignment = "top",
		parent = "info_window_video",
		horizontal_alignment = "right",
		size = {
			230,
			59
		},
		position = {
			-213,
			12,
			13
		}
	},
	info_video_edge_right = {
		vertical_alignment = "top",
		parent = "info_window_video",
		horizontal_alignment = "left",
		size = {
			230,
			59
		},
		position = {
			213,
			12,
			13
		}
	},
	passive_window = {
		vertical_alignment = "top",
		parent = "info_window",
		horizontal_alignment = "center",
		size = career_info_size,
		position = {
			0,
			-260,
			1
		}
	},
	passive_icon = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "left",
		size = {
			80,
			80
		},
		position = {
			10,
			-50,
			5
		}
	},
	passive_icon_frame = {
		vertical_alignment = "center",
		parent = "passive_icon",
		horizontal_alignment = "center",
		size = {
			80,
			80
		},
		position = {
			0,
			0,
			1
		}
	},
	passive_title_text = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] * 0.65,
			50
		},
		position = {
			10,
			-5,
			1
		}
	},
	passive_title_divider = {
		vertical_alignment = "bottom",
		parent = "passive_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			10,
			1
		}
	},
	passive_type_title = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "right",
		size = {
			career_info_size[1] * 0.3,
			50
		},
		position = {
			-10,
			-5,
			1
		}
	},
	passive_description_text = {
		vertical_alignment = "top",
		parent = "passive_icon",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 90
		},
		position = {
			90,
			0,
			1
		}
	},
	active_window = {
		vertical_alignment = "top",
		parent = "passive_window",
		horizontal_alignment = "left",
		size = career_info_size,
		position = {
			0,
			-career_info_size[2],
			1
		}
	},
	active_icon = {
		vertical_alignment = "top",
		parent = "active_window",
		horizontal_alignment = "left",
		size = {
			80,
			80
		},
		position = {
			10,
			-50,
			5
		}
	},
	active_icon_frame = {
		vertical_alignment = "center",
		parent = "active_icon",
		horizontal_alignment = "center",
		size = {
			80,
			80
		},
		position = {
			0,
			0,
			1
		}
	},
	active_title_text = {
		vertical_alignment = "top",
		parent = "active_window",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] * 0.6,
			50
		},
		position = {
			10,
			-5,
			1
		}
	},
	active_title_divider = {
		vertical_alignment = "bottom",
		parent = "active_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			10,
			1
		}
	},
	active_type_title = {
		vertical_alignment = "top",
		parent = "active_window",
		horizontal_alignment = "right",
		size = {
			career_info_size[1] * 0.3,
			50
		},
		position = {
			-10,
			-5,
			1
		}
	},
	active_description_text = {
		vertical_alignment = "top",
		parent = "active_icon",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] - 110,
			career_info_size[2] - 90
		},
		position = {
			90,
			0,
			1
		}
	},
	perk_title_text = {
		vertical_alignment = "bottom",
		parent = "active_window",
		horizontal_alignment = "left",
		size = {
			career_info_size[1] * 0.6,
			50
		},
		position = {
			10,
			-50,
			1
		}
	},
	perk_title_divider = {
		vertical_alignment = "bottom",
		parent = "perk_title_text",
		horizontal_alignment = "left",
		size = {
			450,
			4
		},
		position = {
			0,
			10,
			1
		}
	},
	career_perk_1 = {
		vertical_alignment = "bottom",
		parent = "perk_title_divider",
		horizontal_alignment = "left",
		size = {
			420,
			1
		},
		position = {
			10,
			-30,
			1
		}
	},
	career_perk_2 = {
		vertical_alignment = "center",
		parent = "career_perk_1",
		horizontal_alignment = "left",
		size = {
			420,
			1
		},
		position = {
			0,
			0,
			1
		}
	},
	career_perk_3 = {
		vertical_alignment = "center",
		parent = "career_perk_2",
		horizontal_alignment = "left",
		size = {
			420,
			1
		},
		position = {
			0,
			0,
			1
		}
	},
	select_button = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			370,
			70
		},
		position = {
			0,
			25,
			3
		}
	},
	bot_priority_button = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			370,
			70
		},
		position = {
			135,
			25,
			103
		}
	},
	back_button = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			200,
			70
		},
		position = {
			135,
			25,
			103
		}
	}
}
local description_text_style = {
	word_wrap = true,
	use_shadow = true,
	localize = false,
	dynamic_font_size_word_wrap = true,
	font_size = 18,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local type_title_text_style = {
	word_wrap = true,
	use_shadow = true,
	localize = false,
	font_size = 18,
	horizontal_alignment = "right",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("gray", 200),
	offset = {
		0,
		0,
		2
	}
}
local sub_title_text_style = {
	font_size = 32,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_career_style = {
	font_size = 40,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_name_style = {
	word_wrap = true,
	font_size = 30,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_level_style = {
	word_wrap = true,
	font_size = 52,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local bot_header_text_style = {
	word_wrap = false,
	font_size = 65,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		100,
		20
	}
}

local function create_hero_widget(scenegraph_id, size)
	local frame_settings = UIFrameSettings.menu_frame_12
	local frame_premium_settings = UIFrameSettings.frame_corner_detail_01_gold
	local hover_frame_settings = UIFrameSettings.frame_outer_glow_01
	local hover_frame_width = hover_frame_settings.texture_sizes.horizontal[2]
	local bot_frame_style = "frame_inner_glow_02"
	local bot_frame_settings = UIFrameSettings[bot_frame_style]

	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "portrait",
					style_id = "portrait",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "rect"
				},
				{
					texture_id = "lock_texture",
					style_id = "lock_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.locked
					end
				},
				{
					texture_id = "taken_texture",
					style_id = "taken_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.taken and not content.locked
					end
				},
				{
					texture_id = "bot_frame",
					style_id = "bot_frame",
					pass_type = "texture_frame",
					content_check_function = function (content)
						return content.bot_selected
					end
				},
				{
					texture_id = "bot_texture",
					style_id = "bot_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.bot_selected
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					pass_type = "texture_frame",
					style_id = "frame_premium",
					texture_id = "frame_premium",
					content_check_function = function (content)
						return content.is_premium
					end
				},
				{
					style_id = "overlay",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.is_hover and not button_hotspot.is_selected and not content.locked
					end
				},
				{
					style_id = "overlay_locked",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.locked
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
					content_check_function = function (content)
						local mouse_active = Managers.input:is_device_active("mouse")

						return content.button_hotspot.is_selected and (not content.bot_selection_active or not mouse_active)
					end
				}
			}
		},
		content = {
			portrait = "icons_placeholder",
			locked = false,
			lock_texture = "hero_icon_locked",
			taken_texture = "hero_icon_unavailable",
			taken = false,
			bot_selection_active = false,
			bot_texture = "friends_icon_01",
			button_hotspot = {},
			bot_frame = bot_frame_settings.texture,
			frame = frame_settings.texture,
			frame_premium = frame_premium_settings.texture,
			hover_frame = hover_frame_settings.texture
		},
		style = {
			rect = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				}
			},
			portrait = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
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
			lock_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					76,
					87
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
					5
				}
			},
			taken_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					112,
					112
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
					6
				}
			},
			bot_frame = {
				texture_size = bot_frame_settings.texture_size,
				texture_sizes = bot_frame_settings.texture_sizes,
				color = {
					200,
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
			bot_texture = {
				texture_size = {
					40,
					40
				},
				color = {
					255,
					200,
					255,
					255
				},
				offset = {
					0,
					0,
					6
				}
			},
			bot_text = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				localize = false,
				font_size = 24,
				font_type = "hell_shark_header",
				text_color = {
					255,
					200,
					255,
					255
				},
				offset = {
					35,
					0,
					6
				}
			},
			overlay = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					80,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					2
				}
			},
			overlay_locked = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					2
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
			frame_premium = {
				texture_size = frame_premium_settings.texture_size,
				texture_sizes = frame_premium_settings.texture_sizes,
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
			hover_frame = {
				size = {
					size[1] + hover_frame_width * 2,
					size[2] + hover_frame_width * 2
				},
				texture_size = hover_frame_settings.texture_size,
				texture_sizes = hover_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-hover_frame_width,
					-hover_frame_width,
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

local function create_hero_icon_widget(scenegraph_id, size)
	local icon_size = {
		80,
		80
	}

	return {
		element = {
			passes = {
				{
					pass_type = "hover",
					style_id = "hourglass_icon"
				},
				{
					pass_type = "texture",
					style_id = "bg",
					texture_id = "bg",
					content_check_function = function (content, style)
						return content.use_empty_icon
					end
				},
				{
					style_id = "hourglass_icon",
					texture_id = "hourglass_icon",
					pass_type = "texture",
					content_check_function = function (content, style)
						return content.use_empty_icon
					end,
					content_change_function = function (content, style)
						local target = (content.is_hover and 255) or 184
						style.color[1] = math.ceil(style.color[1] + 0.1 * (target - style.color[1]))
					end
				},
				{
					pass_type = "texture",
					style_id = "bot_order_texture",
					texture_id = "bot_order_texture_id",
					content_check_function = function (content, style)
						return content.bot_selection_active
					end
				},
				{
					pass_type = "texture",
					style_id = "bot_order_bg",
					texture_id = "bot_order_bg_id",
					content_check_function = function (content, style)
						return content.bot_selection_active
					end
				},
				{
					style_id = "bot_order_hotspot",
					pass_type = "hotspot",
					content_id = "bot_order_hotspot",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					style_id = "bot_order_button",
					texture_id = "bot_order_button",
					pass_type = "texture",
					content_check_function = function (content, style)
						local hotspot = content.bot_change_order_hotspot

						return not Managers.input:is_device_active("gamepad") and not hotspot.is_hover and not content.bot_change_order_active and content.bot_selection_active
					end,
					content_change_function = function (content, style)
						style.color[1] = 128
					end
				},
				{
					style_id = "bot_order_button",
					texture_id = "bot_order_highlight_button",
					pass_type = "texture",
					content_check_function = function (content, style)
						local hotspot = content.bot_change_order_hotspot

						return not Managers.input:is_device_active("gamepad") and hotspot.is_hover and not content.bot_change_order_active and content.bot_selection_active
					end,
					content_change_function = function (content, style)
						style.color[1] = 255
					end
				},
				{
					style_id = "bot_change_order_hotspot",
					pass_type = "hotspot",
					content_id = "bot_change_order_hotspot",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad")
					end
				},
				{
					style_id = "bot_change_order_button",
					texture_id = "bot_change_order_button",
					pass_type = "texture",
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad") and content.bot_change_order_active and content.bot_selection_active and not content.bot_change_order_hotspot.is_hover
					end,
					content_change_function = function (content, style)
						local hotspot = content.bot_change_order_hotspot
						style.color[1] = (hotspot.is_hover and 255) or 128
					end
				},
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.selected and not content.bot_selection_active
					end
				},
				{
					texture_id = "icon_selected",
					style_id = "icon_selected",
					pass_type = "texture",
					content_check_function = function (content)
						return content.selected and not content.bot_selection_active
					end
				},
				{
					texture_id = "holder",
					style_id = "holder",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.bot_selection_active
					end
				}
			}
		},
		content = {
			bot_order_bg_id = "bot_order_base",
			holder = "divider_vertical_hero_decoration",
			bot_order_highlight_button = "cog_icon_selected",
			bot_selection_active = false,
			bg = "character_slot_empty",
			bot_change_order_active = false,
			hourglass_icon = "icon_hourglass",
			use_empty_icon = false,
			bot_order_button = "cog_icon",
			bot_change_order_button = "athanor_icon_loading",
			icon = "hero_icon_large_bright_wizard",
			bot_order_texture_id = "bot_order_1",
			icon_selected = "hero_icon_large_bright_wizard",
			bot_order_hotspot = {},
			bot_change_order_hotspot = {}
		},
		style = {
			bg = {
				size = {
					110,
					130
				},
				offset = {
					58,
					7,
					0
				}
			},
			hourglass_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				size = {
					110,
					130
				},
				texture_size = UIAtlasHelper.get_atlas_settings_by_texture_name("icon_hourglass").size,
				color = {
					184,
					255,
					255,
					255
				},
				offset = {
					58,
					7,
					0
				}
			},
			bot_order_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					110,
					130
				},
				offset = {
					0,
					0,
					1
				}
			},
			bot_order_bg = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					110,
					130
				}
			},
			bot_order_hotspot = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				area_size = {
					58,
					58
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					550,
					0,
					100
				}
			},
			bot_order_button = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				texture_size = {
					58,
					58
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					550,
					0,
					0
				}
			},
			bot_change_order_button = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				texture_size = {
					29,
					30.16
				},
				color = {
					255,
					249,
					239,
					222
				},
				offset = {
					536.25,
					0,
					0
				}
			},
			bot_change_order_hotspot = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				area_size = {
					1920,
					144
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
					100
				}
			},
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = icon_size,
				color = {
					200,
					80,
					80,
					80
				},
				offset = {
					-40,
					0,
					1
				}
			},
			icon_selected = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-40,
					0,
					1
				}
			},
			holder = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
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
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_career_perk_text(scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					style_id = "description_text_shadow",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon"
				}
			}
		},
		content = {
			icon = "tooltip_marker",
			title_text = "n/a",
			description_text = "n/a"
		},
		style = {
			icon = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = {
					13,
					13
				},
				offset = {
					0,
					6,
					2
				}
			},
			title_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					20,
					-5,
					2
				}
			},
			title_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					22,
					-7,
					0
				}
			},
			description_text = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					20,
					0,
					2
				}
			},
			description_text_shadow = {
				word_wrap = true,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					22,
					-2,
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

local empty_hero_widget_size = {
	110,
	130
}
local empty_hero_widget = {
	scenegraph_id = "hero_root",
	offset = {
		0,
		0,
		0
	},
	element = {
		passes = {
			{
				pass_type = "hover"
			},
			{
				pass_type = "texture",
				style_id = "bg",
				texture_id = "bg"
			},
			{
				style_id = "icon",
				texture_id = "icon",
				pass_type = "texture",
				content_change_function = function (content, style)
					local target = (content.is_hover and 255) or 184
					style.color[1] = math.ceil(style.color[1] + 0.1 * (target - style.color[1]))
				end
			}
		}
	},
	content = {
		icon = "icon_hourglass",
		bg = "character_slot_empty"
	},
	style = {
		bg = {
			texture_size = empty_hero_widget_size,
			offset = {
				0,
				0,
				0
			}
		},
		icon = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			texture_size = UIAtlasHelper.get_atlas_settings_by_texture_name("icon_hourglass").size,
			color = {
				184,
				255,
				255,
				255
			}
		}
	}
}

local function create_background(scenegraph_id, color, layer)
	return {
		element = {
			passes = {
				{
					style_id = "rect",
					pass_type = "rect",
					content_check_function = function (content)
						return true
					end
				}
			}
		},
		content = {},
		style = {
			rect = {
				color = color or {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					layer or 0
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

local function create_info_text(text, scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_change_function = function (content, style)
						style.text_color = (content.locked and style.locked_text_color) or style.default_text_color
					end
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.use_shadow
					end
				}
			}
		},
		content = {
			use_shadow = true,
			disable_with_gamepad = true,
			text = text,
			original_text = text
		},
		style = {
			text = {
				word_wrap = true,
				font_size = 26,
				localize = false,
				use_shadow = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("red", 255),
				default_text_color = Colors.get_color_table_with_alpha("light_blue", 255),
				locked_text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					0,
					2
				}
			},
			text_shadow = {
				word_wrap = true,
				font_size = 26,
				localize = false,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				skip_button_rendering = true,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					2,
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

local disable_with_gamepad = true
local widgets = {
	background = create_background("screen", {
		0,
		0,
		0,
		0
	}, 100),
	bottom_panel = UIWidgets.create_simple_uv_texture("menu_panel_bg", {
		{
			0,
			1
		},
		{
			1,
			0
		}
	}, "bottom_panel", nil, nil, UISettings.console_menu_rect_color),
	info_window_background = UIWidgets.create_rect_with_outer_frame("info_window", scenegraph_definition.info_window.size, "frame_outer_fade_02", 0, UISettings.console_menu_rect_color),
	info_window_video = UIWidgets.create_frame("info_window_video", scenegraph_definition.info_window_video.size, "menu_frame_06"),
	info_video_edge_left = UIWidgets.create_simple_texture("frame_detail_03", "info_video_edge_left"),
	info_video_edge_right = UIWidgets.create_simple_uv_texture("frame_detail_03", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "info_video_edge_right"),
	perk_title_text = UIWidgets.create_simple_text(Localize("hero_view_perk_title"), "perk_title_text", nil, nil, sub_title_text_style),
	perk_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "perk_title_divider"),
	career_perk_1 = create_career_perk_text("career_perk_1"),
	career_perk_2 = create_career_perk_text("career_perk_2"),
	career_perk_3 = create_career_perk_text("career_perk_3"),
	passive_title_text = UIWidgets.create_simple_text("n/a", "passive_title_text", nil, nil, sub_title_text_style),
	passive_type_title = UIWidgets.create_simple_text(Localize("hero_view_passive_ability"), "passive_type_title", nil, nil, type_title_text_style),
	passive_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "passive_title_divider"),
	passive_description_text = UIWidgets.create_simple_text("n/a", "passive_description_text", nil, nil, description_text_style),
	passive_icon = UIWidgets.create_simple_texture("icons_placeholder", "passive_icon"),
	passive_icon_frame = UIWidgets.create_simple_texture("talent_frame", "passive_icon_frame"),
	active_title_text = UIWidgets.create_simple_text("n/a", "active_title_text", nil, nil, sub_title_text_style),
	active_type_title = UIWidgets.create_simple_text(Localize("hero_view_activated_ability"), "active_type_title", nil, nil, type_title_text_style),
	active_title_divider = UIWidgets.create_simple_texture("infoslate_frame_02_horizontal", "active_title_divider"),
	active_description_text = UIWidgets.create_simple_text("n/a", "active_description_text", nil, nil, description_text_style),
	active_icon = UIWidgets.create_simple_texture("icons_placeholder", "active_icon"),
	active_icon_frame = UIWidgets.create_simple_texture("talent_frame", "active_icon_frame")
}
local info_widgets = {
	locked_info_text = create_info_text(Localize("career_locked_info"), "locked_info_text"),
	hero_info_panel = UIWidgets.create_simple_texture("item_slot_side_fade", "hero_info_panel", nil, nil, {
		255,
		0,
		0,
		0
	}),
	hero_info_panel_glow = UIWidgets.create_simple_texture("item_slot_side_effect", "hero_info_panel", nil, nil, Colors.get_color_table_with_alpha("font_title", 255), 1),
	hero_info_level_bg = UIWidgets.create_simple_texture("hero_level_bg", "hero_info_level_bg"),
	hero_info_divider = UIWidgets.create_simple_texture("divider_vertical_hero_middle", "hero_info_divider"),
	hero_info_divider_edge = UIWidgets.create_simple_texture("divider_vertical_hero_end", "hero_info_divider_edge"),
	info_career_name = UIWidgets.create_simple_text("n/a", "info_career_name", nil, nil, hero_career_style),
	info_hero_name = UIWidgets.create_simple_text("n/a", "info_hero_name", nil, nil, hero_name_style),
	info_hero_level = UIWidgets.create_simple_text("n/a", "info_hero_level", nil, nil, hero_level_style),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("input_description_confirm"), nil, nil, nil, nil, disable_with_gamepad),
	bot_priority_button = UIWidgets.create_default_button("bot_priority_button", scenegraph_definition.bot_priority_button.size, nil, nil, Localize("input_description_prio_bot"), nil, nil, nil, nil, disable_with_gamepad)
}
local bot_selection_widgets = {
	bot_header_text = UIWidgets.create_simple_text(string.upper(Localize("input_description_prio_bot")), "locked_info_text", nil, nil, bot_header_text_style),
	bot_info_text = create_info_text(Localize("assign_career_tooltip"), "locked_info_text"),
	back_button = UIWidgets.create_default_button("back_button", scenegraph_definition.back_button.size, nil, nil, Localize("back_menu_button_name"), nil, nil, nil, nil, disable_with_gamepad)
}
local generic_input_actions = {
	default = {
		{
			input_action = "refresh",
			priority = 1,
			description_text = "input_description_prio_bot"
		}
	},
	default_back = {
		{
			input_action = "refresh",
			priority = 1,
			description_text = "input_description_prio_bot"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_close"
		}
	},
	available = {
		actions = {
			{
				input_action = "confirm",
				priority = 2,
				description_text = "input_description_select"
			}
		}
	},
	purchase = {
		actions = {
			{
				input_action = "confirm",
				priority = 2,
				description_text = "buy_now"
			}
		}
	},
	prioritize_bots = {
		{
			input_action = "refresh",
			priority = 1,
			description_text = "input_description_change_bot_prio"
		},
		{
			input_action = "back",
			priority = 3,
			description_text = "input_description_back"
		}
	},
	bot_selection_available = {
		actions = {
			{
				input_action = "confirm",
				priority = 2,
				description_text = "input_description_assign_bot"
			}
		}
	}
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.main_alpha_multiplier = 0
				params.render_settings.info_alpha_multiplier = 0
				params.render_settings.bot_selection_window_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.main_alpha_multiplier = anim_progress
				params.render_settings.info_alpha_multiplier = anim_progress
				params.render_settings.bot_selection_alpha_multiplier = 0
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
				ui_scenegraph.right_side_root.local_position[1] = scenegraph_definition.right_side_root.position[1] + 100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.main_alpha_multiplier = 1
				params.render_settings.info_alpha_multiplier = 1
				params.render_settings.bot_selection_alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.main_alpha_multiplier = 1 - anim_progress
				params.render_settings.info_alpha_multiplier = 1 - anim_progress
				params.render_settings.bot_selection_alpha_multiplier = 0
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * anim_progress
				ui_scenegraph.right_side_root.local_position[1] = scenegraph_definition.right_side_root.position[1] + 100 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_enter_bot_selection = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.info_alpha_multiplier = 0
				params.render_settings.bot_selection_alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.bot_selection_alpha_multiplier = anim_progress
				params.render_settings.info_alpha_multiplier = 0
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	},
	on_exit_bot_selection = {
		{
			name = "fade_out",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.info_alpha_multiplier = 0
				params.render_settings.bot_selection_alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.info_alpha_multiplier = anim_progress
				params.render_settings.bot_selection_alpha_multiplier = 0
				ui_scenegraph.left_side_root.local_position[1] = scenegraph_definition.left_side_root.position[1] + -100 * (1 - anim_progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	info_widgets = info_widgets,
	bot_selection_widgets = bot_selection_widgets,
	hero_widget = create_hero_widget("hero_root", scenegraph_definition.hero_root.size),
	empty_hero_widget = empty_hero_widget,
	hero_icon_widget = create_hero_icon_widget("hero_icon_root", scenegraph_definition.hero_icon_root.size),
	character_selection_widgets = widgets,
	generic_input_actions = generic_input_actions,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
