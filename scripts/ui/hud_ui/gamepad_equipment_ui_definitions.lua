local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
local slot_size = {
	60,
	60
}
local slot_icon_size = {
	56,
	56
}
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	screen_bottom_pivot = {
		parent = "screen",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	pivot = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			69,
			4
		},
		size = {
			0,
			0
		}
	},
	background_panel = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			624,
			139
		}
	},
	background_panel_bg = {
		vertical_alignment = "bottom",
		parent = "background_panel",
		horizontal_alignment = "center",
		position = {
			0,
			10,
			-5
		},
		size = {
			464,
			29
		}
	},
	crosshair_pivot = {
		vertical_alignment = "center",
		parent = "screen_bottom_pivot",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	weapon_slot = {
		vertical_alignment = "bottom",
		parent = "background_panel",
		horizontal_alignment = "left",
		position = {
			275,
			40,
			100
		},
		size = {
			240,
			60
		}
	},
	slot = {
		vertical_alignment = "bottom",
		parent = "background_panel",
		horizontal_alignment = "left",
		position = {
			15,
			42,
			100
		},
		size = slot_size
	},
	ammo_background = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "right",
		position = {
			-50,
			100,
			10
		},
		size = {
			383,
			86
		}
	},
	ammo_text_center = {
		vertical_alignment = "bottom",
		parent = "ammo_background",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			5
		},
		size = {
			0,
			20
		}
	},
	ammo_text_clip = {
		vertical_alignment = "bottom",
		parent = "ammo_text_center",
		horizontal_alignment = "right",
		position = {
			-5,
			0,
			1
		},
		size = {
			20,
			20
		}
	},
	ammo_text_remaining = {
		vertical_alignment = "bottom",
		parent = "ammo_text_center",
		horizontal_alignment = "left",
		position = {
			10,
			0,
			1
		},
		size = {
			20,
			20
		}
	},
	overcharge_background = {
		vertical_alignment = "center",
		parent = "ammo_background",
		horizontal_alignment = "center",
		position = {
			15,
			0,
			1
		},
		size = {
			80,
			26
		}
	},
	overcharge = {
		vertical_alignment = "center",
		parent = "overcharge_background",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			1
		},
		size = {
			80,
			26
		}
	}
}

local function create_weapon_slot_widget(scenegraph_id)
	local frame_settings = UIFrameSettings.menu_frame_06

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "melee_weapon_texture",
					texture_id = "melee_weapon_texture_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.wielded_slot == "melee"
					end
				},
				{
					pass_type = "texture",
					style_id = "deselected_weapon",
					texture_id = "deselected_weapon_texture_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.wielded_slot ~= "melee" and content.wielded_slot ~= "ranged"
					end
				},
				{
					pass_type = "texture",
					style_id = "ranged_weapon_texture",
					texture_id = "ranged_weapon_texture_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.wielded_slot == "ranged"
					end
				},
				{
					pass_type = "texture",
					style_id = "highlight_weapon_texture",
					texture_id = "highlight_weapon_texture_id",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			background_texture_id = "hud_inventory_slot_bg_01",
			deselected_weapon_texture_id = "weapon_generic_icon_melee_deselected",
			visible = true,
			selected = false,
			is_expired = false,
			highlight_weapon_texture_id = "hud_inventory_slot_selection",
			melee_weapon_texture_id = "weapon_generic_icon_melee",
			ranged_weapon_texture_id = "weapon_generic_icon_range",
			weapon_frame = frame_settings.texture
		},
		style = {
			weapon_frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				size = {
					300,
					60
				},
				offset = {
					0,
					0,
					-31
				}
			},
			background = {
				color = {
					255,
					30,
					30,
					30
				},
				offset = {
					0,
					0,
					-33
				},
				size = {
					240,
					60
				}
			},
			melee_weapon_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					0,
					0,
					1
				}
			},
			ranged_weapon_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					0,
					0,
					1
				}
			},
			highlight_weapon_texture = {
				vertical_alignment = "bottom",
				angle = 0,
				horizontal_alignment = "center",
				pivot = {
					18,
					23
				},
				color = {
					192,
					255,
					255,
					255
				},
				texture_size = {
					277,
					20
				},
				offset = {
					14,
					4,
					-32
				}
			},
			deselected_weapon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					128,
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

local function create_slot_widget(index, total_amount)
	local actual_index = index - 1
	local spacing = 0
	local slot_width = slot_size[1]
	local total_slot_width = slot_width * total_amount
	local total_width = total_slot_width + spacing * (total_amount - 1)
	local frame_offset = {
		actual_index * (slot_width + spacing),
		0,
		-30
	}
	local bg_color = {
		255,
		36,
		215,
		231
	}
	local generic_console_hud_icons = {
		slot_healthkit = "default_heal_icon",
		slot_grenade = "default_grenade_icon",
		slot_potion = "default_potion_icon"
	}

	return {
		scenegraph_id = "slot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_background",
					texture_id = "texture_background",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_empty_slot",
					texture_id = "empty_slot_texture",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_selected",
					texture_id = "texture_selected",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_highlight",
					texture_id = "texture_highlight",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_arrow_left",
					texture_id = "texture_arrow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_left_enabled
					end
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_arrow_up",
					texture_id = "texture_arrow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_up_enabled
					end
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_arrow_right",
					texture_id = "texture_arrow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_right_enabled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_arrow_selected_left",
					texture_id = "texture_arrow_selected",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_left_enabled and content.selected
					end
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_arrow_selected_up",
					texture_id = "texture_arrow_selected",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_up_enabled and content.selected
					end
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_arrow_selected_right",
					texture_id = "texture_arrow_selected",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_right_enabled and content.selected
					end
				}
			}
		},
		content = {
			is_expired = false,
			texture_arrow_selected = "console_consumable_icon_arrow_02",
			selected = false,
			input_text = "-",
			texture_frame = "hud_inventory_slot",
			texture_selected = "hud_inventory_slot_selection",
			texture_background = "hud_inventory_slot_bg_01",
			texture_icon = "journal_icon_02",
			texture_arrow = "console_consumable_icon_arrow_02",
			visible = true,
			texture_highlight = "hud_inventory_slot_small_pickup",
			console_hud_index = index,
			empty_slot_texture = generic_console_hud_icons[InventorySettings.slots_by_console_hud_index[index].name],
			texture_arrow_left_enabled = index == 2,
			texture_arrow_up_enabled = index == 3,
			texture_arrow_right_enabled = index == 4
		},
		style = {
			input_text = {
				vertical_alignment = "top",
				font_size = 18,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-2,
					24,
					12
				}
			},
			input_text_shadow = {
				vertical_alignment = "top",
				font_size = 18,
				localize = false,
				horizontal_alignment = "center",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					0,
					22,
					11
				}
			},
			texture_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = slot_icon_size,
				color = {
					0,
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
			texture_frame = {
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
					0,
					0,
					3
				}
			},
			texture_highlight = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				angle = math.pi,
				pivot = {
					18,
					23
				},
				texture_size = {
					36,
					46
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
					4
				}
			},
			texture_arrow_left = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					15,
					40
				},
				color = {
					0,
					128,
					128,
					128
				},
				offset = {
					-37,
					0,
					1
				}
			},
			texture_arrow_up = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = math.pi * 0.5,
				pivot = {
					7.5,
					20
				},
				texture_size = {
					15,
					40
				},
				color = {
					0,
					128,
					128,
					128
				},
				offset = {
					0,
					37,
					1
				}
			},
			texture_arrow_right = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = math.pi,
				pivot = {
					7.5,
					20
				},
				texture_size = {
					15,
					40
				},
				color = {
					0,
					128,
					128,
					128
				},
				offset = {
					37,
					0,
					1
				}
			},
			texture_arrow_selected_left = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					15,
					40
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					-37,
					0,
					2
				}
			},
			texture_arrow_selected_up = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = math.pi * 0.5,
				pivot = {
					7.5,
					20
				},
				texture_size = {
					15,
					40
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					37,
					2
				}
			},
			texture_arrow_selected_right = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = math.pi,
				pivot = {
					7.5,
					20
				},
				texture_size = {
					15,
					40
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					37,
					0,
					2
				}
			},
			texture_arrow_selected = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				angle = math.pi,
				pivot = {
					18,
					23
				},
				texture_size = {
					36,
					46
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
					4
				}
			},
			texture_selected = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				offset = {
					0,
					2,
					4
				},
				texture_size = {
					52,
					22
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			texture_background = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = slot_icon_size,
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
			rect_background = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				rect_size = slot_icon_size,
				color = {
					255,
					0,
					0,
					0
				}
			},
			texture_empty_slot = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = slot_icon_size,
				color = {
					128,
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
		offset = frame_offset
	}
end

local ammo_text_clip_style = {
	word_wrap = false,
	font_size = 72,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "right",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	default_text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		-5,
		-8,
		2
	}
}
local ammo_text_remaining_style = {
	word_wrap = false,
	font_size = 40,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	default_text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		3,
		0,
		2
	}
}
local ammo_text_center_style = {
	word_wrap = false,
	font_size = 40,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	default_text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		0,
		0,
		2
	}
}
local widget_definitions = {
	background_panel = UIWidgets.create_simple_texture("hud_inventory_panel_gamepad", "background_panel", nil, RETAINED_MODE_ENABLED),
	background_panel_bg = UIWidgets.create_simple_texture("hud_inventory_panel_bg", "background_panel_bg", nil, RETAINED_MODE_ENABLED),
	weapon_slot = create_weapon_slot_widget("weapon_slot")
}
local ammo_widget_definitions = {
	ammo_text_clip = UIWidgets.create_simple_text("-", "ammo_text_clip", nil, nil, ammo_text_clip_style, nil, RETAINED_MODE_ENABLED),
	ammo_text_remaining = UIWidgets.create_simple_text("-", "ammo_text_remaining", nil, nil, ammo_text_remaining_style, nil, RETAINED_MODE_ENABLED),
	ammo_text_center = UIWidgets.create_simple_text("/", "ammo_text_center", nil, nil, ammo_text_center_style, nil, RETAINED_MODE_ENABLED),
	ammo_background = UIWidgets.create_simple_texture("loot_objective_bg", "ammo_background", nil, RETAINED_MODE_ENABLED, {
		200,
		255,
		255,
		255
	}),
	overcharge_background = UIWidgets.create_simple_texture("hud_inventory_charge_icon", "overcharge_background", nil, RETAINED_MODE_ENABLED),
	overcharge = UIWidgets.create_simple_uv_texture("hud_inventory_charge_icon", {
		{
			0,
			0
		},
		{
			1,
			1
		}
	}, "overcharge", nil, RETAINED_MODE_ENABLED)
}
local slots = InventorySettings.slots
local slot_widget_definitions = {}

for i = 1, #slots, 1 do
	local slot = slots[i]
	local console_hud_index = slot.console_hud_index

	if console_hud_index then
		slot_widget_definitions[#slot_widget_definitions + 1] = create_slot_widget(console_hud_index, 6)
	end
end

return {
	slot_size = slot_size,
	NUM_SLOTS = #slot_widget_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	ammo_widget_definitions = ammo_widget_definitions,
	slot_widget_definitions = slot_widget_definitions
}
