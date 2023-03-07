local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
local slot_size = {
	46,
	46
}
local slot_icon_size = {
	40,
	40
}
local scenegraph_definition = {
	root_parent = {
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
	root = {
		parent = "root_parent",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			SIZE_X,
			SIZE_Y
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
			66
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
	slot = {
		vertical_alignment = "bottom",
		parent = "background_panel",
		horizontal_alignment = "left",
		position = {
			149,
			44,
			-8
		},
		size = slot_size
	},
	ammo_background_parent = {
		vertical_alignment = "bottom",
		parent = "root_parent",
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
	ammo_background = {
		vertical_alignment = "bottom",
		parent = "ammo_background_parent",
		horizontal_alignment = "left",
		position = {
			0,
			0,
			0
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

local function create_slot_widget(index, total_amount)
	local actual_index = index - 1
	local spacing = 24
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
					style_id = "texture_frame",
					texture_id = "texture_frame",
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
					style_id = "texture_selected",
					texture_id = "texture_selected",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.selected
					end
				},
				{
					pass_type = "rotated_texture",
					style_id = "texture_highlight",
					texture_id = "texture_highlight",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "input_text",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "input_text_shadow",
					pass_type = "text",
					text_id = "input_text",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "use_count_text",
					pass_type = "text",
					text_id = "use_count_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.has_additional_slots
					end
				},
				{
					style_id = "use_count_text_shadow",
					pass_type = "text",
					text_id = "use_count_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.has_additional_slots
					end
				},
				{
					style_id = "can_swap_text",
					pass_type = "text",
					text_id = "can_swap_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.can_swap
					end
				},
				{
					style_id = "can_swap_text_shadow",
					pass_type = "text",
					text_id = "can_swap_text",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.can_swap
					end
				}
			}
		},
		content = {
			use_count_text = "",
			can_swap_text = "+",
			is_expired = false,
			input_text = "-",
			texture_frame = "hud_inventory_slot",
			texture_selected = "hud_inventory_slot_selection",
			texture_background = "hud_inventory_slot_bg_01",
			texture_icon = "journal_icon_02",
			selected = false,
			visible = false,
			can_swap = false,
			has_additional_slots = false,
			use_count = 0,
			texture_highlight = "hud_inventory_slot_small_pickup",
			hud_index = index
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
				vertical_alignment = "top",
				font_size = 18,
				localize = false,
				horizontal_alignment = "left",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					1,
					0,
					12
				}
			},
			can_swap_text_shadow = {
				vertical_alignment = "top",
				font_size = 18,
				localize = false,
				horizontal_alignment = "left",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					3,
					-2,
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
					1
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
			texture_selected = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				offset = {
					0,
					4,
					4
				},
				texture_size = {
					38,
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
local extra_storage_x = 4 * (slot_size[1] + 24)

function create_inventory_panel(default_texture, scenegraph_id)
	local texture_size = scenegraph_definition[scenegraph_id].size
	local offset = {
		0,
		0,
		1
	}
	local masked = nil
	local retained = RETAINED_MODE_ENABLED

	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					retained_mode = retained
				}
			}
		},
		content = {
			texture_id = default_texture
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
				texture_size = texture_size
			}
		},
		offset = offset,
		scenegraph_id = scenegraph_id
	}
end

local widget_definitions = {
	background_panel = create_inventory_panel("hud_inventory_panel", "background_panel"),
	background_panel_bg = UIWidgets.create_simple_texture("hud_inventory_panel_bg", "background_panel_bg", nil, RETAINED_MODE_ENABLED),
	extra_storage_bg = {
		scenegraph_id = "slot",
		offset = {
			extra_storage_x,
			22,
			-31
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
	}, "overcharge", nil, RETAINED_MODE_ENABLED),
	reload_tip_text = UIWidgets.create_simple_text("", "reload_ui", nil, Colors.get_color_table_with_alpha("white", 0), reload_tip_text_style, nil, false, true)
}
local slots = InventorySettings.slots
local slot_widget_definitions = {}
local career_skill_weapon_widget_definition = {
	scenegraph_id = "background_panel",
	offset = {
		0,
		0,
		1
	},
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
				style_id = "texture_selected",
				texture_id = "texture_selected",
				retained_mode = RETAINED_MODE_ENABLED
			},
			{
				style_id = "input_text",
				pass_type = "text",
				text_id = "input_text",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.can_reload
				end
			},
			{
				style_id = "input_text_shadow",
				pass_type = "text",
				text_id = "input_text",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.can_reload
				end
			},
			{
				pass_type = "texture",
				style_id = "reload_icon",
				texture_id = "reload_icon",
				retained_mode = RETAINED_MODE_ENABLED,
				content_check_function = function (content)
					return content.can_reload or content.is_exhausted
				end
			}
		}
	},
	content = {
		reload_icon = "hud_ability_cog_reload",
		visible = false,
		input_text = "-",
		selected = false,
		texture_selected = "hud_ability_cog_selected",
		can_reload = false,
		texture_icon = "hud_ability_cog_icon",
		hud_index = InventorySettings.slots_by_name.slot_career_skill_weapon.hud_index
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
				263.5,
				25,
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
				263.5,
				25,
				11
			}
		},
		texture_icon = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			offset = {
				28,
				19.5,
				3
			},
			texture_size = {
				33,
				32
			},
			color = {
				0,
				255,
				255,
				255
			}
		},
		texture_selected = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			offset = {
				18,
				9,
				2
			},
			texture_size = {
				53,
				53
			},
			color = {
				0,
				255,
				255,
				255
			}
		},
		reload_icon = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			offset = {
				-31,
				21,
				0
			},
			texture_size = {
				29,
				29
			},
			color = {
				255,
				255,
				255,
				255
			}
		}
	}
}

for i = 1, #slots do
	local slot = slots[i]
	local hud_index = slot.hud_index

	if hud_index then
		local widget_def = nil

		if slot.name == "slot_career_skill_weapon" then
			widget_def = career_skill_weapon_widget_definition
		else
			widget_def = create_slot_widget(hud_index, 6)
		end

		slot_widget_definitions[#slot_widget_definitions + 1] = widget_def
	end
end

local extra_storage_icons = 2
local extra_storage_icon_definitions = {}

for i = 1, extra_storage_icons do
	extra_storage_icon_definitions[i] = {
		scenegraph_id = "slot",
		offset = {
			extra_storage_x,
			30 + i * (slot_icon_size[2] + 4),
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
	ammo_widget_definitions = ammo_widget_definitions,
	slot_widget_definitions = slot_widget_definitions,
	extra_storage_icon_definitions = extra_storage_icon_definitions,
	animations_definitions = animations_definitions
}
