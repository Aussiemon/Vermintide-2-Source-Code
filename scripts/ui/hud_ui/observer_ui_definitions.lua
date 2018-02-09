local RETAINED_MODE_ENABLED = true
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.hud_inventory
		},
		size = {
			1920,
			1080
		}
	},
	observer_root = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1,
			1
		},
		position = {
			0,
			115,
			0
		}
	},
	divider = {
		vertical_alignment = "center",
		parent = "observer_root",
		horizontal_alignment = "center",
		size = {
			386,
			22
		},
		position = {
			0,
			0,
			0
		}
	},
	player_name = {
		vertical_alignment = "top",
		parent = "divider",
		horizontal_alignment = "center",
		size = {
			800,
			40
		},
		position = {
			0,
			-18,
			0
		}
	},
	hero_name = {
		vertical_alignment = "bottom",
		parent = "divider",
		horizontal_alignment = "center",
		size = {
			800,
			40
		},
		position = {
			0,
			20,
			0
		}
	},
	hp_bar = {
		vertical_alignment = "top",
		parent = "divider",
		horizontal_alignment = "center",
		position = {
			0,
			-60,
			0
		},
		size = {
			198,
			24
		}
	},
	hp_bar_bg = {
		parent = "hp_bar",
		position = {
			0,
			0,
			2
		},
		size = {
			198,
			24
		}
	},
	hp_bar_fg = {
		parent = "hp_bar_bg",
		position = {
			0,
			0,
			2
		},
		size = {
			198,
			24
		}
	},
	hp_bar_fill = {
		parent = "hp_bar_bg",
		position = {
			10,
			0,
			1
		},
		size = {
			178,
			24
		}
	},
	hp_bar_grimoire_debuff_fill = {
		parent = "hp_bar_bg",
		position = {
			6,
			0,
			4
		},
		size = {
			188,
			24
		}
	},
	hp_bar_shield_fill = {
		parent = "hp_bar_bg",
		position = {
			10,
			0,
			1
		},
		size = {
			178,
			24
		}
	},
	hp_bar_divider = {
		vertical_alignment = "center",
		parent = "hp_bar_fg",
		position = {
			10,
			0,
			1
		},
		size = {
			178,
			14
		}
	},
	hp_bar_max_health_divider = {
		vertical_alignment = "center",
		parent = "hp_bar_grimoire_debuff_fill",
		position = {
			186,
			0,
			5
		},
		size = {
			2,
			24
		}
	},
	hp_bar_grimoire_icon = {
		vertical_alignment = "center",
		parent = "hp_bar_grimoire_debuff_fill",
		position = {
			174,
			0,
			1
		},
		size = {
			24,
			16
		}
	}
}
local temp_offext = {
	0,
	0,
	0
}
local widget_definitions = {
	divider = UIWidgets.create_simple_texture("summary_screen_line_breaker", "divider", false, RETAINED_MODE_ENABLED),
	player_name = UIWidgets.create_simple_text("n/a", "player_name", 28, Colors.get_table("white"), nil, nil, RETAINED_MODE_ENABLED),
	hero_name = UIWidgets.create_simple_text("n/a", "hero_name", 24, Colors.get_table("cheeseburger"), nil, nil, RETAINED_MODE_ENABLED),
	hp_bar = {
		scenegraph_id = "hp_bar",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "hp_bar_bg",
					texture_id = "hp_bar_bg",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_fg",
					texture_id = "hp_bar_fg",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_highlight",
					texture_id = "hp_bar_highlight",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "hp_bar",
					pass_type = "texture_uv_dynamic_color_uvs_size_offset",
					content_id = "hp_bar",
					content_check_function = function (content)
						return content.draw_health_bar
					end,
					dynamic_function = function (content, style, size, dt, ui_renderer)
						local bar_value = content.bar_value
						local is_wounded = content.is_wounded
						local inverted_bar_value = bar_value - 1

						if is_wounded then
							content.texture_id = content.wounded_texture_id
						else
							content.texture_id = content.normal_texture_id
							local gui = ui_renderer.gui
							local gui_material = Gui.material(gui, content.texture_id)

							if content.is_knocked_down then
								Material.set_vector2(gui_material, "color_tint_uv", Vector2(1, 0.5))
							else
								Material.set_vector2(gui_material, "color_tint_uv", Vector2(inverted_bar_value, 0.5))
							end
						end

						local uv_start_pixels = style.uv_start_pixels
						local uv_scale_pixels = style.uv_scale_pixels
						local uv_pixels = uv_start_pixels + uv_scale_pixels*bar_value
						local uvs = style.uvs
						local uv_scale_axis = style.scale_axis
						local offset_scale = style.offset_scale
						uvs[2][uv_scale_axis] = uv_pixels/(uv_start_pixels + uv_scale_pixels)
						size[uv_scale_axis] = uv_pixels

						return style.color, uvs, size
					end
				},
				{
					style_id = "hp_bar_grimoire_debuff",
					pass_type = "texture_uv_dynamic_color_uvs_size_offset",
					content_id = "hp_bar_grimoire_debuff",
					dynamic_function = function (content, style, size, dt)
						local bar_value = content.bar_value
						local alpha_value = 0
						local color = style.color
						color[2] = 255
						color[3] = 255
						color[4] = 255
						local uv_start_pixels = style.uv_start_pixels
						local uv_scale_pixels = style.uv_scale_pixels
						local uv_pixels = uv_start_pixels + uv_scale_pixels*bar_value
						local uvs = style.uvs
						local uv_scale_axis = style.scale_axis
						local offset_scale = style.offset_scale
						local offset = temp_offext
						offset[1] = 0
						offset[2] = 0
						offset[3] = 0
						uvs[2][uv_scale_axis] = uv_pixels/(uv_start_pixels + uv_scale_pixels)
						size[uv_scale_axis] = uv_pixels
						offset[uv_scale_axis] = ((uv_start_pixels + uv_scale_pixels) - uv_pixels)*offset_scale

						return color, uvs, size, offset
					end
				},
				{
					style_id = "hp_bar_shield",
					pass_type = "texture_uv_dynamic_color_uvs_size_offset",
					content_id = "hp_bar_shield",
					dynamic_function = function (content, style, size, dt, ui_renderer)
						local bar_value_position = content.bar_value_position
						local bar_value_offset = content.bar_value_offset
						local bar_value_size = content.bar_value_size
						local uv_start_pixels = style.uv_start_pixels
						local uv_scale_pixels = style.uv_scale_pixels
						local uv_pixels = uv_start_pixels + uv_scale_pixels*bar_value_position
						local uvs = style.uvs
						local uv_scale_axis = style.scale_axis
						local offset_scale = style.offset_scale
						local offset = temp_offext
						offset[1] = 0
						offset[2] = 0
						offset[3] = 0
						uvs[2][uv_scale_axis] = uv_pixels/(uv_start_pixels + uv_scale_pixels)
						local shield_size = uv_start_pixels + uv_scale_pixels*bar_value_size
						size[uv_scale_axis] = shield_size
						local bar_offset = bar_value_offset*uv_scale_pixels
						local pos = uv_scale_pixels - shield_size - bar_offset

						if shield_size + uv_pixels < uv_scale_pixels - bar_offset then
							pos = uv_pixels
						end

						offset[uv_scale_axis] = pos

						return style.color, uvs, size, offset
					end
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "hp_bar_divider",
					texture_id = "hp_bar_divider",
					content_check_function = function (content, style)
						return 0 < style.texture_amount
					end
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_grimoire_icon",
					texture_id = "hp_bar_grimoire_icon",
					content_id = "hp_bar_grimoire_icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.active
					end
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_max_health_divider",
					texture_id = "hp_bar_max_health_divider",
					content_id = "hp_bar_max_health_divider",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.active
					end
				}
			}
		},
		content = {
			hp_bar_bg = "player_hp_bar_bg",
			hp_bar_highlight = "player_hp_bar_highlight",
			hp_bar_divider = "player_hp_bar_divider",
			hp_bar_fg = "player_hp_bar_fg",
			hp_bar = {
				low_health = false,
				wounded_texture_id = "player_hp_bar",
				texture_id = "player_hp_bar",
				draw_health_bar = true,
				bar_value = 1,
				is_knocked_down = false,
				is_wounded = false,
				normal_texture_id = "player_hp_bar_color_tint"
			},
			hp_bar_grimoire_debuff = {
				texture_id = "player_hp_bar_overlay",
				bar_value = 0
			},
			hp_bar_shield = {
				texture_id = "player_hp_bar",
				bar_value_offset = 0,
				bar_value_position = 0,
				bar_value_size = 0
			},
			hp_bar_grimoire_icon = {
				hp_bar_grimoire_icon = "grimoire_icon",
				active = false
			},
			hp_bar_max_health_divider = {
				hp_bar_max_health_divider = "max_health_divider",
				active = false
			}
		},
		style = {
			hp_bar_fg = {
				scenegraph_id = "hp_bar_fg"
			},
			hp_bar_bg = {
				scenegraph_id = "hp_bar_bg"
			},
			hp_bar = {
				uv_start_pixels = 0,
				scenegraph_id = "hp_bar_fill",
				uv_scale_pixels = 178,
				offset_scale = 1,
				scale_axis = 1,
				color = {
					255,
					255,
					255,
					255
				},
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				offset = {
					0,
					0,
					0
				}
			},
			hp_bar_grimoire_debuff = {
				uv_start_pixels = 0,
				scenegraph_id = "hp_bar_grimoire_debuff_fill",
				uv_scale_pixels = 188,
				offset_scale = 1,
				scale_axis = 1,
				color = {
					255,
					0,
					0,
					0
				},
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				offset = {
					0,
					0,
					0
				}
			},
			hp_bar_shield = {
				uv_start_pixels = 0,
				scenegraph_id = "hp_bar_shield_fill",
				uv_scale_pixels = 178,
				offset_scale = 1,
				scale_axis = 1,
				color = {
					255,
					0,
					166,
					255
				},
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				},
				offset = {
					0,
					0,
					0
				}
			},
			hp_bar_divider = {
				texture_axis = 1,
				scenegraph_id = "hp_bar_divider",
				texture_amount = 9,
				texture_size = {
					4,
					14
				}
			},
			hp_bar_grimoire_icon = {
				scenegraph_id = "hp_bar_grimoire_icon",
				offset = {
					0,
					0,
					0
				}
			},
			hp_bar_max_health_divider = {
				scenegraph_id = "hp_bar_max_health_divider",
				offset = {
					0,
					0,
					0
				}
			},
			hp_bar_highlight = {
				scenegraph_id = "hp_bar_fg",
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

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
