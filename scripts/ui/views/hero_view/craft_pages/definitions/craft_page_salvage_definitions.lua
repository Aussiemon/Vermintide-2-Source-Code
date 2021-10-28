local window_default_settings = UISettings.game_start_windows
local window_background = window_default_settings.background
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_spacing = window_default_settings.spacing
local window_frame_width = UIFrameSettings[window_frame].texture_sizes.vertical[1]
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local window_text_width = window_size[1] - (window_frame_width * 2 + 60)
local auto_fill_button_size = {
	60,
	60
}
local auto_fill_button_offset = auto_fill_button_size[2] + 10
NUM_CRAFT_SLOTS_X = 3
NUM_CRAFT_SLOTS_Y = 3
NUM_CRAFT_SLOTS = NUM_CRAFT_SLOTS_X * NUM_CRAFT_SLOTS_Y
local scenegraph_definition = {
	root = {
		is_root = true,
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
	root_fit = {
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
	menu_root = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			0
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "menu_root",
		horizontal_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1
		}
	},
	item_grid = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			362,
			362
		},
		position = {
			-25,
			-66,
			6
		}
	},
	craft_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			window_size[1] - 100,
			60
		},
		position = {
			0,
			20,
			35
		}
	},
	craft_bar_bg = {
		vertical_alignment = "top",
		parent = "craft_button",
		horizontal_alignment = "center",
		size = {
			400,
			6
		},
		position = {
			0,
			28,
			5
		}
	},
	craft_bar_fg = {
		vertical_alignment = "center",
		parent = "craft_bar_bg",
		horizontal_alignment = "center",
		size = {
			424,
			30
		},
		position = {
			4,
			-4,
			2
		}
	},
	craft_bar = {
		vertical_alignment = "center",
		parent = "craft_bar_bg",
		horizontal_alignment = "left",
		size = {
			400,
			6
		},
		position = {
			0,
			0,
			1
		}
	},
	auto_fill_buttons = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "right",
		size = auto_fill_button_size,
		position = {
			-42,
			74,
			6
		}
	},
	auto_fill_plentiful = {
		vertical_alignment = "top",
		parent = "auto_fill_buttons",
		horizontal_alignment = "left",
		size = auto_fill_button_size,
		position = {
			0,
			-auto_fill_button_offset * 0,
			1
		}
	},
	auto_fill_common = {
		vertical_alignment = "top",
		parent = "auto_fill_buttons",
		horizontal_alignment = "left",
		size = auto_fill_button_size,
		position = {
			0,
			-auto_fill_button_offset * 1,
			1
		}
	},
	auto_fill_rare = {
		vertical_alignment = "top",
		parent = "auto_fill_buttons",
		horizontal_alignment = "left",
		size = auto_fill_button_size,
		position = {
			0,
			-auto_fill_button_offset * 2,
			1
		}
	},
	auto_fill_exotic = {
		vertical_alignment = "top",
		parent = "auto_fill_buttons",
		horizontal_alignment = "left",
		size = auto_fill_button_size,
		position = {
			0,
			-auto_fill_button_offset * 3,
			1
		}
	},
	auto_fill_clear = {
		vertical_alignment = "top",
		parent = "auto_fill_buttons",
		horizontal_alignment = "left",
		size = auto_fill_button_size,
		position = {
			0,
			-auto_fill_button_offset * 4,
			1
		}
	}
}

local function should_show_glow(content)
	local hotspot = content.button_hotspot

	return true
end

local function create_auto_fill_button(scenegraph_id, icon_name, hover_color, hover_texture)
	local size = auto_fill_button_size
	local background_texture = "menu_frame_bg_04"
	local frame_width = 7
	local bg_texture = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)

	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "border",
					pass_type = "texture_uv",
					content_id = "border"
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
					texture_id = "texture_hover",
					style_id = "texture_hover",
					pass_type = "texture",
					content_check_function = should_show_glow
				},
				{
					style_id = "texture_icon",
					pass_type = "texture_uv",
					content_id = "texture_icon"
				}
			}
		},
		content = {
			background_fade = "button_bg_fade",
			button_hotspot = {},
			border = {
				texture_id = "crafting_bg_03",
				uvs = {
					{
						0.08974358974358974,
						0.09183673469387756
					},
					{
						0.9183673469387755,
						0.9183673469387755
					}
				}
			},
			background = {
				uvs = {
					{
						0,
						0
					},
					{
						size[1] / bg_texture.size[1],
						size[2] / bg_texture.size[2]
					}
				},
				texture_id = background_texture
			},
			texture_hover = hover_texture or "crafting_icon_hover",
			texture_icon = {
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
				texture_id = icon_name
			}
		},
		style = {
			border = {
				offset = {
					0,
					0,
					6
				}
			},
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
					1
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			texture_hover = {
				color = {
					0,
					0,
					0,
					0
				},
				default_color = {
					127,
					hover_color[2],
					hover_color[3],
					hover_color[4]
				},
				hover_color = hover_color,
				offset = {
					0,
					frame_width - 2,
					3
				}
			},
			texture_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					0,
					0,
					0,
					0
				},
				default_color = {
					200,
					255,
					255,
					255
				},
				hover_color = {
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
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end

local disable_with_gamepad = true
local widgets = {
	item_grid_bg = UIWidgets.create_simple_texture("crafting_bg_01", "item_grid", nil, nil, nil, -1),
	item_grid = UIWidgets.create_grid("item_grid", scenegraph_definition.item_grid.size, NUM_CRAFT_SLOTS_X, NUM_CRAFT_SLOTS_Y, 20, 20),
	craft_button = UIWidgets.create_default_button("craft_button", scenegraph_definition.craft_button.size, nil, nil, Localize("hero_view_crafting_salvage"), 24, nil, "button_detail_02", nil, disable_with_gamepad),
	craft_bar_fg = UIWidgets.create_simple_texture("crafting_bar_fg", "craft_bar_fg"),
	craft_bar_bg = UIWidgets.create_simple_rect("craft_bar_bg", {
		255,
		0,
		0,
		0
	}),
	craft_bar = UIWidgets.create_simple_texture("crafting_bar", "craft_bar", nil, nil, nil, 2),
	auto_fill_plentiful = create_auto_fill_button("auto_fill_plentiful", "store_tag_icon_weapon_plentiful", Colors.get_table("plentiful")),
	auto_fill_common = create_auto_fill_button("auto_fill_common", "store_tag_icon_weapon_common", Colors.get_table("common")),
	auto_fill_rare = create_auto_fill_button("auto_fill_rare", "store_tag_icon_weapon_rare", Colors.get_table("rare")),
	auto_fill_exotic = create_auto_fill_button("auto_fill_exotic", "store_tag_icon_weapon_exotic", Colors.get_table("exotic")),
	auto_fill_clear = create_auto_fill_button("auto_fill_clear", "layout_button_back", {
		100,
		255,
		100,
		100
	}, "button_state_default")
}
local animation_definitions = {
	on_enter = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = anim_progress
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
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				params.render_settings.alpha_multiplier = 1 - anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	widgets = widgets,
	scenegraph_definition = scenegraph_definition,
	animation_definitions = animation_definitions
}
