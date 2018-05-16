local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
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
	pivot = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "right",
		position = {
			-310,
			80,
			1
		},
		size = {
			0,
			0
		}
	},
	selection = {
		parent = "pivot",
		position = {
			-9,
			-8,
			1
		},
		size = {
			82,
			80
		}
	},
	selection_input_icon = {
		vertical_alignment = "top",
		parent = "selection_input_bg",
		horizontal_alignment = "center",
		position = {
			0,
			-1,
			5
		},
		size = {
			26,
			26
		}
	},
	selection_input_bg = {
		vertical_alignment = "top",
		parent = "selection",
		horizontal_alignment = "center",
		position = {
			0,
			18,
			-1
		},
		size = {
			45,
			39
		}
	},
	background = {
		parent = "pivot",
		position = {
			-4,
			-4,
			0
		},
		size = {
			198,
			72
		}
	}
}

local function create_consumable_widget(angle, icon_offset, ammo_offset)
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					texture_id = "texture_bg",
					style_id = "texture_bg",
					pass_type = "texture",
					retained_mode = true
				},
				{
					texture_id = "texture_icon",
					style_id = "texture_icon",
					pass_type = "texture",
					retained_mode = true
				},
				{
					texture_id = "texture_icon_lit",
					style_id = "texture_icon_lit",
					pass_type = "texture",
					retained_mode = true,
					content_check_function = function (content)
						return content.has_data and content.wielded
					end
				},
				{
					style_id = "text_ammo",
					pass_type = "text",
					text_id = "text_ammo",
					retained_mode = true,
					content_check_function = function (content)
						return content.has_data and content.show_ammo
					end
				}
			}
		},
		content = {
			text_ammo = "x2",
			total_ammo = 0,
			texture_highlight = "consumables_frame_lit",
			texture_icon = "default_heal_ally_icon",
			texture_icon_lit = "default_heal_ally_icon_lit",
			texture_bg = "consumables_frame_bg_lit",
			has_data = false
		},
		style = {
			text_ammo = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 20,
				horizontal_alignment = "center",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = ammo_offset
			},
			texture_bg = {
				size = {
					64,
					64
				},
				offset = {
					0,
					0,
					0
				},
				color = {
					100,
					255,
					255,
					255
				}
			},
			texture_highlight = {
				size = {
					64,
					64
				},
				offset = {
					0,
					0,
					3
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			texture_icon = {
				size = {
					64,
					64
				},
				offset = {
					0,
					0,
					1
				},
				color = {
					50,
					255,
					255,
					255
				}
			},
			texture_icon_lit = {
				size = {
					64,
					64
				},
				offset = {
					0,
					0,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		offset = {
			0,
			0,
			0
		}
	}
end

local degrees_to_radians = math.degrees_to_radians
local widget_definitions = {
	slot_potion = create_consumable_widget(degrees_to_radians(0), {
		-36,
		-30,
		2
	}, {
		20,
		-20,
		3
	}),
	slot_grenade = create_consumable_widget(degrees_to_radians(180), {
		-26,
		-30,
		2
	}, {
		20,
		-20,
		3
	}),
	slot_healthkit = create_consumable_widget(degrees_to_radians(90), {
		-32,
		-26,
		2
	}, {
		20,
		-20,
		3
	}),
	selection = UIWidgets.create_gamepad_selection("selection", true),
	background = UIWidgets.create_simple_texture("player_consumable_bg", "background")
}
local animations = {
	pickup = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_fraction = math.easeInCubic(progress)
				local widget = widgets[1]
				local highlight_color = widget.style.texture_highlight.color
				local alpha = 255 * anim_fraction
				highlight_color[1] = alpha
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	animations = animations
}
