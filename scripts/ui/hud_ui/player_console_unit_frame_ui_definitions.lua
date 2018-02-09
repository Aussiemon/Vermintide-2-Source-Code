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
			-70,
			100,
			1
		},
		size = {
			0,
			0
		}
	}
}
local inventory_consumable_icons = {
	wpn_grimoire_01 = "consumables_grimoire",
	potion_speed_boost_01 = "consumables_speed",
	potion_healing_draught_01 = "consumables_potion_01",
	grenade_frag_02 = "consumables_frag",
	[3.0] = "default_potion_icon",
	grenade_frag_01 = "consumables_frag",
	grenade_smoke_02 = "consumables_smoke",
	grenade_fire_01 = "consumables_fire",
	grenade_fire_02 = "consumables_fire",
	[1.0] = "default_heal_icon",
	[2.0] = "default_grenade_icon",
	grenade_smoke_01 = "consumables_smoke",
	wpn_side_objective_tome_01 = "consumables_book",
	potion_damage_boost_01 = "consumables_strength",
	healthkit_first_aid_kit_01 = "consumables_medpack"
}
local inventory_index_by_slot = {
	slot_potion = 3,
	slot_grenade = 2,
	slot_healthkit = 1
}
local weapon_slot_widget_settings = {
	ammo_fields = {
		slot_ranged = "ammo_text_weapon_slot_2",
		slot_melee = "ammo_text_weapon_slot_1"
	}
}
local settings = {
	weapon = {
		scale = 0.7,
		x = -486,
		y = 14
	},
	portrait = {
		x = 0,
		y = -2
	},
	hp_bar = {
		scale = 2,
		x = -489,
		y = -25
	},
	consumables = {
		y = 10,
		x = -244,
		slot_1 = {
			x = 0,
			y = 0
		},
		slot_2 = {
			x = 60,
			y = 0
		},
		slot_3 = {
			x = 120,
			y = 0
		}
	}
}

local function create_static_potrait_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "portrait_frame",
					texture_id = "portrait_frame",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "character_portrait",
					texture_id = "character_portrait",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "rotated_texture",
					style_id = "player_level_bg",
					texture_id = "player_level_bg",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "player_level",
					pass_type = "text",
					text_id = "player_level",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "host_icon",
					texture_id = "host_icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.is_host
					end
				}
			}
		},
		content = {
			player_level_bg = "unit_frame_lvl_bg",
			character_portrait = "unit_frame_portrait_default",
			host_icon = "host_icon",
			portrait_frame = "unit_frame_01",
			is_host = false,
			player_level = "-"
		},
		style = {
			portrait_frame = {
				size = {
					141,
					198
				},
				offset = {
					settings.portrait.x - 71,
					settings.portrait.y - 99,
					5
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			character_portrait = {
				size = {
					66,
					101
				},
				offset = {
					settings.portrait.x - 33,
					settings.portrait.y - 50.5,
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
					18,
					14
				},
				offset = {
					settings.portrait.x - 30,
					settings.portrait.y - 48,
					4
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			player_level_bg = {
				angle = math.degrees_to_radians(0),
				pivot = {
					28.5,
					14
				},
				size = {
					57,
					28
				},
				offset = {
					settings.portrait.x - 29,
					settings.portrait.y - 80,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			player_level = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 18,
				horizontal_alignment = "center",
				text_color = Colors.get_table("cheeseburger"),
				offset = {
					settings.portrait.x + 0,
					settings.portrait.y - 65,
					3
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

local function create_dynamic_potrait_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "portrait_overlay",
					texture_id = "portrait_overlay",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.display_portrait_overlay
					end
				},
				{
					pass_type = "texture",
					style_id = "portrait_icon",
					texture_id = "portrait_icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.display_portrait_icon
					end
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_highlight",
					texture_id = "talk_indicator_highlight",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "rotated_texture",
					style_id = "connecting_icon",
					texture_id = "connecting_icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.connecting
					end
				}
			}
		},
		content = {
			display_portrait_overlay = false,
			connecting = false,
			display_portrait_icon = false,
			portrait_overlay = "unit_frame_red_overlay",
			connecting_icon = "matchmaking_connecting_icon",
			portrait_icon = "unit_frame_icon_01",
			talk_indicator_highlight = "talk_indicator_frame"
		},
		style = {
			talk_indicator_highlight = {
				size = {
					70,
					105
				},
				offset = {
					settings.portrait.x - 35,
					settings.portrait.y - 50,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			connecting_icon = {
				angle = 0,
				size = {
					50,
					50
				},
				offset = {
					settings.portrait.x - 25,
					settings.portrait.y - 25,
					4
				},
				color = {
					255,
					255,
					255,
					255
				},
				pivot = {
					25,
					25
				}
			},
			portrait_overlay = {
				size = {
					66,
					101
				},
				offset = {
					settings.portrait.x - 33,
					settings.portrait.y - 50.5,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			portrait_icon = {
				size = {
					33,
					39
				},
				offset = {
					settings.portrait.x - 5,
					settings.portrait.y - 48,
					4
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

local function create_static_loadout_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "rotated_texture",
					style_id = "arrow_slot_1",
					texture_id = "arrow_slot",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "arrow_slot_2",
					texture_id = "arrow_slot",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "rotated_texture",
					style_id = "arrow_slot_3",
					texture_id = "arrow_slot",
					retained_mode = RETAINED_MODE_ENABLED
				},
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
					style_id = "weapon_bg",
					pass_type = "texture_uv",
					content_id = "weapon_bg",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			hp_bar_bg = "console_player_hp_bar_bg",
			player_name = "n/a",
			arrow_slot = "console_consumable_icon_arrow_01",
			hp_bar_fg = "console_player_hp_bar_fg",
			weapon_bg = {
				texture_id = "console_weapon_slot",
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
			weapon_bg = {
				size = {
					224,
					56
				},
				offset = {
					settings.weapon.x,
					settings.weapon.y,
					1
				},
				color = {
					180,
					255,
					255,
					255
				}
			},
			arrow_slot_1 = {
				size = {
					54,
					14
				},
				offset = {
					(settings.consumables.x + settings.consumables.slot_1.x) - 32,
					settings.consumables.y + settings.consumables.slot_1.y + 26,
					7
				},
				color = {
					100,
					255,
					255,
					255
				},
				angle = math.degrees_to_radians(-90),
				pivot = {
					27,
					6
				}
			},
			arrow_slot_2 = {
				size = {
					54,
					14
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_2.x + 5,
					settings.consumables.y + settings.consumables.slot_2.y + 62,
					7
				},
				color = {
					100,
					255,
					255,
					255
				}
			},
			arrow_slot_3 = {
				size = {
					54,
					14
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_3.x + 42,
					settings.consumables.y + settings.consumables.slot_3.y + 26,
					7
				},
				color = {
					100,
					255,
					255,
					255
				},
				angle = math.degrees_to_radians(90),
				pivot = {
					27,
					6
				}
			},
			hp_bar_bg = {
				size = {
					428,
					30
				},
				offset = {
					settings.hp_bar.x,
					settings.hp_bar.y,
					1
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
					428,
					30
				},
				offset = {
					settings.hp_bar.x,
					settings.hp_bar.y,
					5
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			player_name = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 18,
				horizontal_alignment = "left",
				text_color = Colors.get_table("white"),
				offset = {
					settings.hp_bar.x + 5,
					settings.hp_bar.y + 15,
					0
				}
			}
		},
		offset = {
			0,
			-30,
			0
		}
	}
end

local function create_dynamic_loadout_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					style_id = "ammo_text_weapon_slot_1",
					pass_type = "text",
					text_id = "ammo_text_weapon_slot_1",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "ammo_text_weapon_slot_1_2",
					pass_type = "text",
					text_id = "ammo_text_weapon_slot_1_2",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "ammo_text_weapon_slot_1_3",
					pass_type = "text",
					text_id = "ammo_text_weapon_slot_1_3",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "ammo_text_weapon_slot_2",
					pass_type = "text",
					text_id = "ammo_text_weapon_slot_2",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "ammo_text_weapon_slot_2_2",
					pass_type = "text",
					text_id = "ammo_text_weapon_slot_2_2",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "ammo_text_weapon_slot_2_3",
					pass_type = "text",
					text_id = "ammo_text_weapon_slot_2_3",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "overcharge_fg",
					texture_id = "overcharge_fg",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.has_overcharge
					end
				},
				{
					style_id = "overcharge_fill",
					pass_type = "texture_uv",
					content_id = "overcharge_fill",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.has_overcharge
					end
				},
				{
					pass_type = "texture",
					style_id = "equipped_weapon",
					texture_id = "equipped_weapon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.equipped_weapon
					end
				},
				{
					pass_type = "texture",
					style_id = "equipped_weapon_lit",
					texture_id = "equipped_weapon_lit",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.equipped_weapon_lit
					end
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_highlight",
					texture_id = "hp_bar_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return not content.has_shield
					end
				},
				{
					pass_type = "texture",
					style_id = "shield_bar_highlight",
					texture_id = "hp_bar_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.has_shield
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
					style_id = "grimoire_debuff",
					pass_type = "texture_uv",
					content_id = "grimoire_debuff",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "hp_bar",
					pass_type = "texture_uv",
					content_id = "hp_bar",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "hp_bar_divider",
					texture_id = "hp_bar_divider",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return 0 < style.texture_amount
					end
				},
				{
					style_id = "hp_bar_shield",
					pass_type = "texture_uv",
					content_id = "hp_bar_shield",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.has_shield
					end
				},
				{
					pass_type = "texture",
					style_id = "bg_slot_1",
					texture_id = "bg_slot",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "bg_slot_2",
					texture_id = "bg_slot",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "bg_slot_3",
					texture_id = "bg_slot",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "item_slot_1",
					texture_id = "item_slot_1",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "item_slot_1_lit",
					texture_id = "item_slot_1_lit",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.item_slot_1_lit
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_1",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "item_slot_2",
					texture_id = "item_slot_2",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "item_slot_2_lit",
					texture_id = "item_slot_2_lit",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.item_slot_2_lit
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_2",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "item_slot_3",
					texture_id = "item_slot_3",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "item_slot_3_lit",
					texture_id = "item_slot_3_lit",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.item_slot_3_lit
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_3",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			ammo_text_weapon_slot_2_3 = " ",
			hp_bar_divider = "console_player_hp_bar_divider",
			item_slot_highlight = "weapon_icon_glow",
			overcharge_fg = "console_charge_bar_fg",
			ammo_text_weapon_slot_2 = " ",
			ammo_text_weapon_slot_1 = " ",
			ammo_text_weapon_slot_2_2 = " ",
			bg_slot = "consumables_frame_bg_lit",
			bar_start_side = "right",
			ammo_text_weapon_slot_1_2 = " ",
			hp_bar_highlight = "console_player_hp_bar_highlight",
			ammo_text_weapon_slot_1_3 = " ",
			overcharge_fill = {
				bar_value = 0,
				texture_id = "console_charge_bar_fill",
				internal_bar_value = 0,
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
			},
			item_slot_1 = inventory_consumable_icons[1],
			item_slot_2 = inventory_consumable_icons[2],
			item_slot_3 = inventory_consumable_icons[3],
			hp_bar = {
				internal_bar_value = 0,
				wounded_texture_id = "console_player_hp_bar",
				texture_id = "console_player_hp_bar",
				draw_health_bar = true,
				bar_value = 1,
				normal_texture_id = "console_player_hp_bar_color_tint",
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
			},
			grimoire_debuff = {
				bar_value = 0,
				texture_id = "console_player_hp_bar_overlay",
				internal_bar_value = 0,
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
			},
			hp_bar_shield = {
				bar_value_position = 0,
				bar_value_size = 0,
				texture_id = "console_player_hp_bar",
				internal_bar_value_position = 0,
				bar_value = 0,
				bar_value_offset = 0,
				internal_bar_value = 0,
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
			},
			hp_bar_grimoire_icon = {
				hp_bar_grimoire_icon = "grimoire_icon",
				active = false
			},
			hp_bar_max_health_divider = {
				hp_bar_max_health_divider = "console_max_health_divider",
				active = false
			}
		},
		style = {
			overcharge_fg = {
				size = {
					54,
					16
				},
				offset = {
					settings.hp_bar.x + 5,
					settings.hp_bar.y + 41,
					8
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			overcharge_fill = {
				uv_scale_pixels = 50,
				uv_start_pixels = 0,
				offset_scale = 1,
				scale_axis = 1,
				size = {
					50,
					12
				},
				offset = {
					settings.hp_bar.x + 6,
					settings.hp_bar.y + 42,
					7
				},
				color = {
					255,
					255,
					255,
					255
				},
				start_offset = settings.hp_bar.x + 6,
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
			},
			hp_bar_max_health_divider = {
				size = {
					2,
					23
				},
				offset = {
					settings.hp_bar.x - 3,
					settings.hp_bar.y + 3,
					8
				},
				color = {
					255,
					255,
					255,
					255
				},
				start_offset = settings.hp_bar.x - 0
			},
			hp_bar_grimoire_icon = {
				size = {
					24,
					16
				},
				offset = {
					settings.hp_bar.x + 12,
					settings.hp_bar.y + 8,
					8
				},
				color = {
					255,
					255,
					255,
					255
				},
				start_offset = settings.hp_bar.x - 12
			},
			hp_bar = {
				uv_start_pixels = 0,
				uv_scale_pixels = 410,
				offset_scale = 1,
				scale_axis = 1,
				size = {
					410,
					30
				},
				color = {
					255,
					255,
					255,
					255
				},
				default_offset = {
					settings.hp_bar.x + 9,
					settings.hp_bar.y + 0,
					3
				},
				offset = {
					settings.hp_bar.x + 9,
					settings.hp_bar.y + 0,
					3
				}
			},
			hp_bar_shield = {
				uv_scale_pixels = 410,
				uv_start_pixels = 0,
				offset_scale = 1,
				scale_axis = 1,
				size = {
					0,
					30
				},
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
					settings.hp_bar.x + 9,
					settings.hp_bar.y + 0,
					4
				},
				start_offset = settings.hp_bar.x + 9
			},
			grimoire_debuff = {
				uv_start_pixels = 0,
				uv_scale_pixels = 428,
				offset_scale = 1,
				scale_axis = 1,
				size = {
					0,
					30
				},
				color = {
					255,
					255,
					255,
					255
				},
				start_offset = settings.hp_bar.x + 0,
				offset = {
					settings.hp_bar.x + 0,
					settings.hp_bar.y + 0,
					7
				}
			},
			hp_bar_highlight = {
				size = {
					428,
					30
				},
				offset = {
					settings.hp_bar.x + 0,
					settings.hp_bar.y + 0,
					5
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			shield_bar_highlight = {
				size = {
					428,
					30
				},
				offset = {
					settings.hp_bar.x + 0,
					settings.hp_bar.y + 0,
					5
				},
				color = {
					255,
					140,
					180,
					255
				}
			},
			hp_bar_divider = {
				texture_axis = 1,
				texture_amount = 0,
				texture_size = {
					3,
					20
				},
				size = {
					420,
					20
				},
				offset = {
					settings.hp_bar.x + 4,
					settings.hp_bar.y + 5,
					6
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			ammo_text_weapon_slot_1 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				font_size = 22,
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				offset = {
					(settings.weapon.x + 35) - 100,
					settings.weapon.y + 24,
					4
				},
				size = {
					100,
					0
				}
			},
			ammo_text_weapon_slot_1_2 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				font_size = 22,
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				offset = {
					settings.weapon.x + 35,
					settings.weapon.y + 24,
					4
				}
			},
			ammo_text_weapon_slot_1_3 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				font_size = 22,
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				offset = {
					settings.weapon.x + 37,
					settings.weapon.y + 24,
					4
				},
				size = {
					100,
					0
				}
			},
			ammo_text_weapon_slot_2 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				font_size = 22,
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				offset = {
					(settings.weapon.x + 35) - 100,
					settings.weapon.y - 0,
					4
				},
				size = {
					100,
					0
				}
			},
			ammo_text_weapon_slot_2_2 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				font_size = 22,
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				offset = {
					settings.weapon.x + 35,
					settings.weapon.y - 0,
					4
				}
			},
			ammo_text_weapon_slot_2_3 = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				font_size = 22,
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				offset = {
					settings.weapon.x + 37,
					settings.weapon.y - 0,
					4
				},
				size = {
					100,
					0
				}
			},
			equipped_weapon = {
				size = {
					settings.weapon.scale*256,
					settings.weapon.scale*64
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					settings.weapon.x + 35,
					settings.weapon.y + 5,
					3
				}
			},
			equipped_weapon_lit = {
				size = {
					settings.weapon.scale*256,
					settings.weapon.scale*64
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					settings.weapon.x + 35,
					settings.weapon.y + 5,
					3
				}
			},
			bg_slot_1 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_1.x,
					settings.consumables.y + settings.consumables.slot_1.y,
					5
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_1 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_1.x,
					settings.consumables.y + settings.consumables.slot_1.y,
					6
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_1_lit = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_1.x,
					settings.consumables.y + settings.consumables.slot_1.y,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_highlight_1 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_1.x,
					settings.consumables.y + settings.consumables.slot_1.y,
					8
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			bg_slot_2 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_2.x,
					settings.consumables.y + settings.consumables.slot_2.y,
					5
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_2 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_2.x,
					settings.consumables.y + settings.consumables.slot_2.y,
					6
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_2_lit = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_2.x,
					settings.consumables.y + settings.consumables.slot_2.y,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_highlight_2 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_2.x,
					settings.consumables.y + settings.consumables.slot_2.y,
					8
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			bg_slot_3 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_3.x,
					settings.consumables.y + settings.consumables.slot_3.y,
					5
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_3 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_3.x,
					settings.consumables.y + settings.consumables.slot_3.y,
					6
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_3_lit = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_3.x,
					settings.consumables.y + settings.consumables.slot_3.y,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_highlight_3 = {
				size = {
					64,
					64
				},
				offset = {
					settings.consumables.x + settings.consumables.slot_3.x,
					settings.consumables.y + settings.consumables.slot_3.y,
					8
				},
				color = {
					0,
					255,
					255,
					255
				}
			}
		},
		offset = {
			0,
			-30,
			0
		}
	}
end

local widget_definitions = {
	portait_static = create_static_potrait_widget(),
	portait_dynamic = create_dynamic_potrait_widget(),
	loadout_static = create_static_loadout_widget(),
	loadout_dynamic = create_dynamic_loadout_widget()
}
local features_list = {
	equipment = true,
	weapons = true
}

return {
	weapon_slot_widget_settings = weapon_slot_widget_settings,
	inventory_index_by_slot = inventory_index_by_slot,
	inventory_consumable_icons = inventory_consumable_icons,
	features_list = features_list,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
