local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
local portrait_scale = 1
local slot_scale = 1
local scenegraph_definition = {
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
	pivot = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		position = {
			70,
			0,
			1
		},
		size = {
			0,
			0
		}
	},
	portrait_pivot = {
		vertical_alignment = "center",
		parent = "pivot",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			0
		},
		size = {
			0,
			0
		}
	}
}
local platform = PLATFORM
local inventory_consumable_icons = (platform == "win32" and {
	wpn_grimoire_01 = "teammate_consumable_icon_grimoire",
	potion_cooldown_reduction_01 = "teammate_consumable_icon_speed",
	potion_healing_draught_01 = "teammate_consumable_icon_potion_01",
	grenade_frag_02 = "teammate_consumable_icon_frag",
	[3.0] = "teammate_consumable_icon_grenade_empty",
	grenade_frag_01 = "teammate_consumable_icon_frag",
	grenade_smoke_02 = "teammate_consumable_icon_smoke",
	grenade_smoke_01 = "teammate_consumable_icon_smoke",
	grenade_fire_01 = "teammate_consumable_icon_fire",
	grenade_fire_02 = "teammate_consumable_icon_fire",
	[1.0] = "teammate_consumable_icon_medpack_empty",
	[2.0] = "teammate_consumable_icon_potion_empty",
	wpn_side_objective_tome_01 = "teammate_consumable_icon_book",
	potion_damage_boost_01 = "teammate_consumable_icon_strength",
	healthkit_first_aid_kit_01 = "teammate_consumable_icon_medpack",
	potion_speed_boost_01 = "teammate_consumable_icon_speed"
}) or {
	wpn_grimoire_01 = "consumables_grimoire",
	potion_cooldown_reduction_01 = "consumables_speed",
	potion_healing_draught_01 = "consumables_potion_01",
	grenade_frag_02 = "consumables_frag",
	[3.0] = "default_potion_icon",
	grenade_frag_01 = "consumables_frag",
	grenade_smoke_02 = "consumables_smoke",
	grenade_smoke_01 = "consumables_smoke",
	grenade_fire_01 = "consumables_fire",
	grenade_fire_02 = "consumables_fire",
	[1.0] = "default_heal_icon",
	[2.0] = "default_grenade_icon",
	wpn_side_objective_tome_01 = "consumables_book",
	potion_damage_boost_01 = "consumables_strength",
	healthkit_first_aid_kit_01 = "consumables_medpack",
	potion_speed_boost_01 = "consumables_speed"
}
local inventory_consumable_slot_backgrounds = {
	wpn_grimoire_01 = "hud_inventory_slot_bg_small_04",
	potion_cooldown_reduction_01 = "hud_inventory_slot_bg_small_05",
	potion_healing_draught_01 = "hud_inventory_slot_bg_small_03",
	grenade_frag_02 = "hud_inventory_slot_bg_small_02",
	potion_speed_boost_01 = "hud_inventory_slot_bg_small_05",
	grenade_frag_01 = "hud_inventory_slot_bg_small_02",
	grenade_smoke_02 = "hud_inventory_slot_bg_small_02",
	grenade_smoke_01 = "hud_inventory_slot_bg_small_02",
	grenade_fire_01 = "hud_inventory_slot_bg_small_02",
	grenade_fire_02 = "hud_inventory_slot_bg_small_02",
	default = "hud_inventory_slot_bg_small_01",
	wpn_side_objective_tome_01 = "hud_inventory_slot_bg_small_04",
	potion_damage_boost_01 = "hud_inventory_slot_bg_small_05",
	healthkit_first_aid_kit_01 = "hud_inventory_slot_bg_small_03"
}
local inventory_index_by_slot = (platform == "win32" and {
	slot_healthkit = 1,
	slot_grenade = 3,
	slot_potion = 2
}) or {
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
local health_bar_size_fraction = 1
local health_bar_size = {
	health_bar_size_fraction*92,
	health_bar_size_fraction*9
}
local health_bar_offset = {
	-(health_bar_size[1]/2),
	health_bar_size_fraction*-25,
	0
}

local function create_static_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "character_portrait",
					texture_id = "character_portrait",
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
				},
				{
					style_id = "player_name",
					pass_type = "text",
					text_id = "player_name",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "player_name_shadow",
					pass_type = "text",
					text_id = "player_name",
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
					pass_type = "texture",
					style_id = "ammo_bar_bg",
					texture_id = "ammo_bar_bg",
					retained_mode = RETAINED_MODE_ENABLED
				}
			}
		},
		content = {
			character_portrait = "unit_frame_portrait_default",
			player_name = "n/a",
			host_icon = "host_icon",
			hp_bar_bg = "hud_teammate_hp_bar_bg",
			is_host = false,
			player_level = "",
			hp_bar_fg = "hud_teammate_hp_bar_frame",
			ammo_bar_bg = "hud_teammate_ammo_bar_bg"
		},
		style = {
			character_portrait = {
				size = {
					portrait_scale*96,
					portrait_scale*112
				},
				offset = {
					portrait_scale*-48,
					portrait_scale*-56 + portrait_scale*55,
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
					-50,
					10,
					15
				},
				color = {
					150,
					255,
					255,
					255
				}
			},
			player_level = {
				vertical_alignment = "top",
				font_type = "hell_shark",
				font_size = 14,
				horizontal_alignment = "center",
				text_color = Colors.get_table("cheeseburger"),
				offset = {
					health_bar_offset[1],
					health_bar_offset[2] - 130,
					health_bar_offset[3] + 15
				}
			},
			player_name = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 20,
				horizontal_alignment = "center",
				text_color = Colors.get_table("white"),
				offset = {
					0,
					portrait_scale*110,
					health_bar_offset[3] + 15
				}
			},
			player_name_shadow = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 20,
				horizontal_alignment = "center",
				text_color = Colors.get_table("black"),
				offset = {
					2,
					portrait_scale*110 - 2,
					health_bar_offset[3] + 14
				}
			},
			hp_bar_bg = {
				size = {
					100,
					17
				},
				offset = {
					(health_bar_offset[1] + health_bar_size[1]/2) - 50,
					(health_bar_offset[2] + health_bar_size[2]/2) - 8.5,
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
					(health_bar_offset[1] + health_bar_size[1]/2) - 50,
					(health_bar_offset[2] + health_bar_size[2]/2) - 8.5 - 7,
					health_bar_offset[3] + 20
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			ammo_bar_bg = {
				size = {
					92,
					5
				},
				offset = {
					(health_bar_offset[1] + health_bar_size[1]/2) - 46,
					health_bar_offset[2] - 9,
					health_bar_offset[3] + 15
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
			portrait_scale*-55,
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
					style_id = "hp_bar_highlight",
					texture_id = "hp_bar_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return not content.has_shield
					end
				},
				{
					style_id = "grimoire_debuff_divider",
					texture_id = "grimoire_debuff_divider",
					pass_type = "texture",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.hp_bar.draw_health_bar
					end,
					content_change_function = function (content, style)
						local hp_bar_content = content.hp_bar
						local internal_bar_value = hp_bar_content.internal_bar_value
						local actual_active_percentage = hp_bar_content.actual_active_percentage or 1
						local grim_progress = math.max(internal_bar_value, actual_active_percentage)
						local offset = style.offset
						offset[1] = health_bar_offset[1] + health_bar_size[1]*grim_progress

						return 
					end
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "hp_bar",
					texture_id = "texture_id",
					content_id = "hp_bar",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "total_health_bar",
					texture_id = "texture_id",
					content_id = "total_health_bar",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "hp_bar",
					texture_id = "hp_bar_mask",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.hp_bar.draw_health_bar
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
				},
				{
					style_id = "ammo_bar",
					pass_type = "texture_uv",
					content_id = "ammo_bar",
					retained_mode = RETAINED_MODE_ENABLED,
					content_change_function = function (content, style)
						local ammo_progress = content.bar_value
						local size = style.size
						local uvs = content.uvs
						local offset = style.offset
						local bar_length = 92
						uvs[2][2] = ammo_progress
						size[1] = bar_length*ammo_progress

						return 
					end
				}
			}
		},
		content = {
			talk_indicator_highlight = "speaking_icon",
			grimoire_debuff_divider = "hud_teammate_hp_bar_grim_divider",
			display_portrait_icon = false,
			connecting = false,
			bar_start_side = "left",
			portrait_icon = "status_icon_needs_assist",
			hp_bar_highlight = "hud_teammate_hp_bar_highlight",
			display_portrait_overlay = false,
			connecting_icon = "matchmaking_connecting_icon",
			hp_bar_mask = "teammate_hp_bar_mask",
			hp_bar = {
				bar_value = 1,
				internal_bar_value = 0,
				texture_id = "teammate_hp_bar_color_tint_1",
				draw_health_bar = true
			},
			total_health_bar = {
				bar_value = 1,
				internal_bar_value = 0,
				texture_id = "teammate_hp_bar_1",
				draw_health_bar = true
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
			talk_indicator_highlight = {
				size = {
					40,
					30
				},
				offset = {
					-65,
					55,
					3
				},
				color = {
					0,
					255,
					255,
					255
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
					portrait_scale*86,
					portrait_scale*108
				},
				offset = {
					-(portrait_scale*86)/2,
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
			total_health_bar = {
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
					health_bar_offset[3] + 17
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
			ammo_bar = {
				size = {
					92,
					5
				},
				offset = {
					(health_bar_offset[1] + health_bar_size[1]/2) - 46,
					health_bar_offset[2] - 9,
					health_bar_offset[3] + 18
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			grimoire_debuff_divider = {
				masked = true,
				size = {
					3,
					28
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
					23
				}
			},
			hp_bar_highlight = {
				size = {
					100,
					17
				},
				offset = {
					(health_bar_offset[1] + health_bar_size[1]/2) - 50,
					health_bar_offset[2] - 7,
					health_bar_offset[3] + 19
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
			portrait_scale*-55,
			0
		}
	}
end

local function create_static_loadout_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {}
		},
		content = {},
		style = {},
		offset = {
			50,
			-55,
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
					pass_type = "texture",
					style_id = "item_slot_1",
					texture_id = "item_slot_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_bg_1",
					texture_id = "item_slot_bg_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_frame_1",
					texture_id = "slot_frame",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_1",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_2",
					texture_id = "item_slot_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_bg_2",
					texture_id = "item_slot_bg_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_frame_2",
					texture_id = "slot_frame",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_2",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_3",
					texture_id = "item_slot_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_bg_3",
					texture_id = "item_slot_bg_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_frame_3",
					texture_id = "slot_frame",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_3",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end
				}
			}
		},
		content = {
			item_slot_2 = "icons_placeholder",
			item_slot_1 = "icons_placeholder",
			item_slot_bg_2 = "hud_inventory_slot_bg_small_01",
			draw_health_bar = true,
			item_slot_bg_3 = "hud_inventory_slot_bg_small_01",
			item_slot_highlight = "hud_inventory_slot_small_pickup",
			slot_frame = "hud_inventory_slot_small",
			item_slot_bg_1 = "hud_inventory_slot_bg_small_01",
			item_slot_3 = "icons_placeholder"
		},
		style = {
			item_slot_bg_1 = {
				size = {
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					-35,
					0,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_frame_1 = {
				size = {
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					-35,
					0,
					11
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
					25,
					25
				},
				offset = {
					-32.5,
					5,
					8
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
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					-35,
					0,
					10
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			item_slot_bg_2 = {
				size = {
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					0,
					0,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_frame_2 = {
				size = {
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					0,
					0,
					11
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
					25,
					25
				},
				offset = {
					2.5,
					5,
					8
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
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					0,
					0,
					10
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			item_slot_bg_3 = {
				size = {
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					35,
					0,
					7
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			item_slot_frame_3 = {
				size = {
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					35,
					0,
					11
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
					25,
					25
				},
				offset = {
					37.5,
					5,
					8
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
					slot_scale*29,
					slot_scale*34
				},
				offset = {
					35,
					0,
					10
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
			-15,
			health_bar_offset[2] - 105,
			0
		}
	}
end

local widget_definitions = {
	default_dynamic = create_dynamic_potrait_widget(),
	loadout_static = create_static_loadout_widget(),
	loadout_dynamic = create_dynamic_loadout_widget(),
	portrait_static = UIWidgets.create_portrait_frame("portrait_pivot", "default", "-", portrait_scale, RETAINED_MODE_ENABLED),
	default_dynamic = create_dynamic_potrait_widget(),
	default_static = create_static_widget()
}
local features_list = {
	equipment = true,
	ammo = true
}
local widget_name_by_feature = {
	static = {
		default = "default_static",
		weapons = "loadout_dynamic",
		status_icon = "default_dynamic",
		health = "default_static",
		portrait_frame = "portrait_static",
		equipment = "loadout_dynamic",
		player_name = "default_static",
		level = "default_static"
	},
	dynamic = {
		default = "default_dynamic",
		player_name = "default_static",
		weapons = "loadout_dynamic",
		portrait_frame = "portrait_static",
		ammo = "default_dynamic",
		equipment = "loadout_dynamic",
		status_icon = "default_dynamic",
		health = "default_dynamic",
		level = "default_static"
	}
}

return {
	inventory_consumable_slot_backgrounds = inventory_consumable_slot_backgrounds,
	weapon_slot_widget_settings = weapon_slot_widget_settings,
	inventory_index_by_slot = inventory_index_by_slot,
	inventory_consumable_icons = inventory_consumable_icons,
	features_list = features_list,
	widget_name_by_feature = widget_name_by_feature,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
