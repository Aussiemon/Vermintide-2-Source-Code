local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
local slot_size = {
	70,
	64
}
local slot_icon_size = {
	55,
	55
}
local scenegraph_definition = {
	root = {
		scale = "hud_scale_fit",
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
	hud_base = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "right",
		position = {
			0,
			60,
			0
		}
	},
	gamepad_icon_base = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "right",
		size = {
			119,
			137
		},
		position = {
			0,
			60,
			10
		}
	},
	hud_brush = {
		parent = "hud_base",
		position = {
			-25,
			-60,
			0
		}
	},
	health_bar_frame = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			20,
			10
		},
		size = {
			576,
			36
		}
	},
	health_bar_frame_bg = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			32,
			-10
		},
		size = {
			560,
			19
		}
	},
	screen_bottom_pivot = {
		parent = "root",
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
		parent = "root",
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
		parent = "hud_base",
		horizontal_alignment = "right",
		position = {
			-50,
			0,
			100
		},
		size = {
			240,
			60
		}
	},
	slot = {
		vertical_alignment = "bottom",
		parent = "hud_base",
		horizontal_alignment = "right",
		position = {
			-270,
			70,
			100
		},
		size = slot_size
	},
	ammo_background = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "right",
		position = {
			-90,
			40,
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
	},
	reload_ui = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			-220,
			3
		},
		size = {
			0,
			0
		}
	}
}

if not IS_WINDOWS then
	scenegraph_definition.root.scale = "hud_fit"
	scenegraph_definition.root.is_root = nil
	scenegraph_definition.screen.scale = "hud_fit"
end

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
					style_id = "melee_weapon_texture_glow",
					texture_id = "melee_weapon_texture_glow_id",
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
					style_id = "ranged_weapon_texture_glow",
					texture_id = "ranged_weapon_texture_glow_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.wielded_slot == "ranged"
					end
				},
				{
					pass_type = "texture",
					style_id = "switch",
					texture_id = "switch_id",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "wield_switch",
					texture_id = "wield_switch_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.wield_switch_id
					end
				},
				{
					style_id = "input_text",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						content.gamepad_active = Managers.input:is_device_active("gamepad")

						return not content.gamepad_active
					end
				},
				{
					style_id = "input_text_shadow",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return not content.gamepad_active
					end
				}
			}
		},
		content = {
			melee_weapon_texture_id = "hud_icon_melee",
			is_expired = false,
			visible = true,
			input_text = "",
			selected = false,
			deselected_weapon_texture_id = "hud_icon_melee",
			ranged_weapon_texture_glow_id = "hud_icon_ranged_glow",
			melee_weapon_texture_glow_id = "hud_icon_melee_glow",
			highlight_weapon_texture_id = "hud_inventory_slot_selection",
			background_texture_id = "hud_inventory_slot_bg_01",
			ranged_weapon_texture_id = "hud_icon_ranged",
			switch_id = "button_y",
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
				texture_size = {
					58,
					49
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					10,
					-20,
					1
				}
			},
			melee_weapon_texture_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					68,
					59
				},
				color = {
					255,
					243,
					159,
					0
				},
				offset = {
					10,
					-20,
					0
				}
			},
			ranged_weapon_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					57,
					58
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					10,
					-20,
					1
				}
			},
			ranged_weapon_texture_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					67,
					68
				},
				color = {
					255,
					243,
					159,
					0
				},
				offset = {
					10,
					-20,
					0
				}
			},
			switch = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					58,
					40
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					40,
					-50,
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
				texture_size = {
					58,
					49
				},
				color = {
					255,
					63,
					63,
					63
				},
				offset = {
					10,
					-20,
					1
				}
			},
			wield_switch = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					40,
					-50,
					1
				}
			},
			input_text = {
				word_wrap = false,
				font_size = 24,
				localize = false,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					22,
					18
				},
				offset = {
					170,
					-40,
					4
				}
			},
			input_text_shadow = {
				word_wrap = false,
				font_size = 24,
				localize = false,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					22,
					18
				},
				offset = {
					172,
					-42,
					3
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
		(actual_index - 1) * (slot_width + spacing),
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
		slot_healthkit = "hud_icon_heal_01",
		slot_grenade = "hud_icon_bomb_01",
		slot_potion = "hud_icon_heal_02"
	}

	return {
		scenegraph_id = "slot",
		element = {
			passes = {
				{
					style_id = "input_text",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad") and content.is_filled
					end
				},
				{
					style_id = "input_text_shadow",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return not Managers.input:is_device_active("gamepad") and content.is_filled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_selected",
					texture_id = "texture_selected",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "texture_selected_up_arrow",
					texture_id = "texture_selected_up_arrow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_up_enabled and content.is_filled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_selected_left_arrow",
					texture_id = "texture_selected_left_arrow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_left_enabled and content.is_filled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_selected_right_arrow",
					texture_id = "texture_selected_right_arrow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_right_enabled and content.is_filled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_selected_up_arrow_glow",
					texture_id = "texture_selected_up_arrow_glow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_up_enabled and content.selected
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_selected_left_arrow_glow",
					texture_id = "texture_selected_left_arrow_glow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_left_enabled and content.selected
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_selected_right_arrow_glow",
					texture_id = "texture_selected_right_arrow_glow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_arrow_right_enabled and content.selected
					end
				},
				{
					style_id = "use_count_text",
					pass_type = "text",
					text_id = "use_count_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.is_filled and content.has_additional_slots
					end
				},
				{
					style_id = "use_count_text_shadow",
					pass_type = "text",
					text_id = "use_count_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.is_filled and content.has_additional_slots
					end
				},
				{
					style_id = "can_swap_text",
					pass_type = "text",
					text_id = "can_swap_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.is_filled and content.can_swap
					end
				},
				{
					style_id = "can_swap_text_shadow",
					pass_type = "text",
					text_id = "can_swap_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.is_filled and content.can_swap
					end
				}
			}
		},
		content = {
			texture_selected_left_arrow = "hud_icon_left",
			is_expired = false,
			texture_selected_right_arrow = "hud_icon_right",
			input_text = "-",
			selected = false,
			texture_selected_up_arrow_glow = "hud_icon_up_glow",
			texture_background = "hud_inventory_slot_bg_01",
			use_count_text = "",
			can_swap_text = "+",
			texture_selected_up_arrow = "hud_icon_up",
			texture_selected_right_arrow_glow = "hud_icon_right_glow",
			visible = true,
			has_additional_slots = false,
			texture_frame = "hud_inventory_slot",
			texture_selected = "hud_inventory_slot_selection",
			texture_icon = "journal_icon_02",
			is_filled = false,
			texture_arrow = "console_consumable_icon_arrow_02",
			texture_selected_left_arrow_glow = "hud_icon_left_glow",
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
			use_count_text = {
				vertical_alignment = "bottom",
				font_size = 18,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-4,
					0,
					12
				}
			},
			use_count_text_shadow = {
				vertical_alignment = "bottom",
				font_size = 18,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-2,
					-2,
					11
				}
			},
			can_swap_text = {
				vertical_alignment = "bottom",
				font_size = 18,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-4,
					20,
					12
				}
			},
			can_swap_text_shadow = {
				vertical_alignment = "bottom",
				font_size = 18,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-2,
					18,
					11
				}
			},
			texture_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = slot_icon_size,
				color = {
					0,
					128,
					128,
					128
				},
				offset = {
					0,
					0,
					5
				}
			},
			texture_selected_left_arrow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					32,
					32
				},
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					0,
					-32,
					5
				}
			},
			texture_selected_up_arrow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					32,
					32
				},
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					0,
					-32,
					5
				}
			},
			texture_selected_right_arrow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					32,
					32
				},
				color = {
					255,
					128,
					128,
					128
				},
				offset = {
					0,
					-32,
					5
				}
			},
			texture_selected_left_arrow_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					32,
					32
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					-32,
					6
				}
			},
			texture_selected_up_arrow_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					32,
					32
				},
				color = {
					128,
					255,
					255,
					255
				},
				offset = {
					0,
					-32,
					6
				}
			},
			texture_selected_right_arrow_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					32,
					32
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					-32,
					6
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
					6
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
				vertical_alignment = "center",
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					6
				},
				texture_size = {
					55,
					55
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
	font_size = 65,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "right",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 255),
	default_text_color = Colors.get_color_table_with_alpha("white", 255),
	offset = {
		-5,
		0,
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
		-12,
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
		-12,
		2
	}
}

local function create_equipment_background(texture, scenegraph_id, masked, retained, color, layer, horizontal_alignment, vertical_alignment, content_check_function)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local definition = {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					retained_mode = retained,
					content_check_function = content_check_function
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = {
				texture_size = texture_settings.size,
				color = color or {
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
				horizontal_alignment = horizontal_alignment,
				vertical_alignment = vertical_alignment
			}
		},
		offset = {
			0,
			0,
			layer or 0
		},
		scenegraph_id = scenegraph_id
	}

	return definition
end

local function create_engineer_background(scenegraph_id, layer, retained)
	local button_texture_data = ButtonTextureByName("x", "xb1")
	local button_texture = button_texture_data.texture
	local button_size = button_texture_data.size

	return {
		element = {
			passes = {
				{
					texture_id = "minigun_id",
					style_id = "minigun",
					pass_type = "texture",
					retained_mode = retained,
					content_check_function = function (content, style)
						content.using_career_skill_weapon = false
						content.visible = false
						local player = Managers.player:local_player()
						local player_unit = player and player.player_unit

						if not ALIVE[player_unit] then
							return false
						end

						local career_extension = ScriptUnit.extension(player_unit, "career_system")
						local career_name = career_extension and career_extension:career_name()
						content.visible = career_name == "dr_engineer"
						local ability_cooldown, max_cooldown = career_extension:current_ability_cooldown()
						content.on_cooldown = ability_cooldown / max_cooldown ~= 0
						local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
						content.using_career_skill_weapon = inventory_extension and inventory_extension:get_wielded_slot_name() == "slot_career_skill_weapon"
						local buff_ext = ScriptUnit.extension(player_unit, "buff_system")
						content.is_reloading = buff_ext and (buff_ext:has_buff_type("bardin_engineer_pump_buff_long") or buff_ext:has_buff_type("bardin_engineer_pump_buff"))
						local _, dt = Managers.time:time_and_delta("game")
						local time = content.time + dt
						content.time = content.is_reloading and time or 0
						content.using_gamepad = Managers.input:is_device_active("gamepad")

						return not content.using_career_skill_weapon and content.visible
					end
				},
				{
					pass_type = "texture",
					style_id = "reload_button",
					texture_id = "reload_button_id",
					retained_mode = retained,
					content_check_function = function (content, style)
						return content.on_cooldown and content.reload_button_id and content.using_career_skill_weapon and content.using_gamepad
					end
				},
				{
					pass_type = "texture",
					style_id = "ability_effect",
					texture_id = "ability_effect",
					content_check_function = function (content, style)
						return not content.on_cooldown and content.using_career_skill_weapon and content.visible
					end
				},
				{
					texture_id = "reload_icon_frame_id",
					style_id = "reload_icon_frame",
					pass_type = "texture",
					retained_mode = retained,
					content_check_function = function (content, style)
						return not content.on_cooldown and content.using_career_skill_weapon and content.visible
					end
				},
				{
					texture_id = "reload_id",
					style_id = "reload",
					pass_type = "texture",
					retained_mode = retained,
					content_check_function = function (content, style)
						return content.using_career_skill_weapon and content.visible
					end
				},
				{
					style_id = "reload_icon",
					pass_type = "texture",
					texture_id = "reload_icon_id",
					retained_mode = retained,
					content_check_function = function (content, style)
						return content.using_career_skill_weapon and content.visible and content.is_reloading
					end,
					content_change_function = function (content, style)
						style.color[1] = 160 + -math.cos(content.time * 2 * math.pi) * 95
					end
				},
				{
					style_id = "reload_mask",
					pass_type = "texture",
					texture_id = "reload_mask_id",
					retained_mode = retained,
					content_check_function = function (content, style)
						return content.visible and content.is_reloading
					end,
					content_change_function = function (content, style)
						content.reload_mask_id = content.using_career_skill_weapon and "reload_icon_mask" or "minigun_icon_mask"
					end
				},
				{
					style_id = "reload_overlay",
					pass_type = "texture",
					texture_id = "reload_overlay_id",
					retained_mode = retained,
					content_check_function = function (content, style)
						return content.visible and content.is_reloading
					end,
					content_change_function = function (content, style)
						local value = content.time % 1
						style.offset[2] = math.lerp(-137, 137, value)
					end
				},
				{
					style_id = "input_text",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.on_cooldown and content.visible and not content.using_gamepad and content.using_career_skill_weapon
					end,
					content_change_function = function (content, style)
						local input_service = Managers.input:get_service("Player")
						local keymap_binding = input_service:get_keymapping("weapon_reload", "win32")

						if not keymap_binding then
							content.input_text = ""

							return
						end

						local device_type = keymap_binding[1]
						local key_index = keymap_binding[2]
						local input_text = ""

						if key_index ~= UNASSIGNED_KEY then
							local device = device_type == "mouse" and Mouse or Keyboard
							input_text = device.button_locale_name(key_index) or device.button_name(key_index) or Localize("lb_unknown")
							input_text = Utf8.upper(input_text)
						end

						content.input_text = input_text
					end
				},
				{
					style_id = "input_text_shadow",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.on_cooldown and content.visible and not content.using_gamepad and content.using_career_skill_weapon
					end
				}
			}
		},
		content = {
			time = 0,
			reload_icon_frame_id = "lit_frame_engineer",
			minigun_id = "rotarygun_bg",
			reload_overlay_id = "glowtexture_mask_red",
			input_text = "",
			reload_mask_id = "minigun_icon_mask",
			ability_effect = "gamepad_ability_effect_cog",
			reload_icon_id = "icon_reload",
			reload_id = "reload_bg",
			reload_button_id = button_texture
		},
		style = {
			input_text = {
				word_wrap = false,
				font_size = 24,
				localize = false,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				size = {
					22,
					18
				},
				offset = {
					48,
					150,
					105
				}
			},
			input_text_shadow = {
				word_wrap = false,
				font_size = 24,
				localize = false,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				size = {
					22,
					18
				},
				offset = {
					46,
					148,
					104
				}
			},
			minigun = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
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
				},
				texture_size = {
					119,
					137
				}
			},
			ability_effect = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					152,
					240
				},
				offset = {
					15,
					-10,
					100
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			reload = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
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
				texture_size = {
					119,
					137
				}
			},
			reload_button = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					140,
					20
				},
				texture_size = button_size
			},
			reload_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
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
				texture_size = {
					119,
					137
				}
			},
			reload_icon_frame = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-1,
					2,
					101
				},
				texture_size = {
					118,
					136
				}
			},
			reload_mask = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
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
				texture_size = {
					119,
					137
				}
			},
			reload_overlay = {
				vertical_alignment = "center",
				masked = true,
				horizontal_alignment = "center",
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
				texture_size = {
					119,
					137
				}
			}
		},
		offset = {
			-2,
			0,
			layer or 0
		},
		scenegraph_id = scenegraph_id
	}
end

local widget_definitions = {
	ability_base = create_equipment_background("ability_base", "hud_base", nil, RETAINED_MODE_ENABLED, nil, 5, "right", "bottom"),
	hud_brushstroke = UIWidgets.create_simple_atlas_texture("hud_brushstroke", "hud_brush", nil, RETAINED_MODE_ENABLED, nil, nil, "right", "bottom"),
	weapon_slot = create_weapon_slot_widget("weapon_slot"),
	extra_storage_bg = {
		scenegraph_id = "slot",
		offset = {
			1 * (slot_size[1] + 0),
			22,
			-100
		},
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "texture",
					texture_id = "texture",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			texture = "loot_objective_bg"
		},
		style = {
			texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				pivot = {
					191.5,
					31.5
				},
				angle = math.pi / 2,
				texture_size = {
					383,
					63
				},
				color = {
					0,
					255,
					255,
					255
				}
			}
		}
	}
}
local reload_tip_text_style = {
	word_wrap = false,
	localize = false,
	font_size = 30,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("white", 0),
	default_text_color = Colors.get_color_table_with_alpha("white", 0),
	offset = {
		0,
		0,
		2
	}
}
local career_widget_definitions = {
	engineer_base = create_engineer_background("gamepad_icon_base", 10)
}
local frame_definitions = {
	health_bar_frame = UIWidgets.create_simple_texture("console_hp_bar_frame", "health_bar_frame", nil, RETAINED_MODE_ENABLED),
	background_panel_bg = UIWidgets.create_simple_texture("console_hp_bar_background", "health_bar_frame_bg", nil, RETAINED_MODE_ENABLED)
}
local ammo_widget_definitions = {
	ammo_text_clip = UIWidgets.create_simple_text("-", "ammo_text_clip", nil, nil, ammo_text_clip_style, nil, RETAINED_MODE_ENABLED),
	ammo_text_remaining = UIWidgets.create_simple_text("-", "ammo_text_remaining", nil, nil, ammo_text_remaining_style, nil, RETAINED_MODE_ENABLED),
	ammo_text_center = UIWidgets.create_simple_text("/", "ammo_text_center", nil, nil, ammo_text_center_style, nil, RETAINED_MODE_ENABLED),
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
	}, "overcharge", nil, RETAINED_MODE_ENABLED),
	reload_tip_text = UIWidgets.create_simple_text("", "reload_ui", nil, Colors.get_color_table_with_alpha("white", 0), reload_tip_text_style, nil, RETAINED_MODE_ENABLED, false)
}
local slots = InventorySettings.slots
local slot_widget_definitions = {}

for i = 1, #slots do
	local slot = slots[i]
	local console_hud_index = slot.console_hud_index

	if console_hud_index then
		slot_widget_definitions[#slot_widget_definitions + 1] = create_slot_widget(console_hud_index, 6)
	end
end

local extra_storage_icons = 2
local extra_storage_icon_definitions = {}

for i = 1, extra_storage_icons do
	local bomb_slot_index = 2
	local spacing = 0
	local slot_width = slot_size[1]
	extra_storage_icon_definitions[i] = {
		scenegraph_id = "slot",
		offset = {
			(bomb_slot_index - 1) * (slot_width + spacing),
			55 + i * (slot_icon_size[2] - 10),
			5
		},
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_icon",
					texture_id = "texture_icon"
				},
				{
					pass_type = "texture",
					style_id = "texture_glow",
					texture_id = "texture_glow"
				}
			}
		},
		content = {
			t_until_fade = 0,
			visible = true,
			texture_glow = "hud_icon_bomb_01_glow",
			texture_icon = "hud_icon_bomb_01"
		},
		style = {
			texture_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					6
				},
				texture_size = slot_icon_size,
				color = {
					0,
					255,
					255,
					255
				}
			},
			texture_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					5
				},
				texture_size = slot_icon_size,
				color = {
					0,
					255,
					255,
					255
				}
			}
		}
	}
end

animations_definitions = {
	show_reload_tip = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				widget.content.visible = true
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local alpha = 255 * anim_progress
				widget.style.text.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end
		},
		{
			name = "fade_out",
			start_progress = 2.3,
			end_progress = 2.6,
			init = function (ui_scenegraph, scenegraph_definition, widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widget, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local alpha = 255 * (1 - anim_progress)
				widget.style.text.text_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widget, params)
				widget.content.visible = false
			end
		}
	}
}

return {
	slot_size = slot_size,
	NUM_SLOTS = #slot_widget_definitions,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	career_widget_definitions = career_widget_definitions,
	frame_definitions = frame_definitions,
	ammo_widget_definitions = ammo_widget_definitions,
	slot_widget_definitions = slot_widget_definitions,
	extra_storage_icon_definitions = extra_storage_icon_definitions,
	animations_definitions = animations_definitions
}
