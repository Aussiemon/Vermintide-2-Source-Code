local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = true
local portrait_scale = 1
local slot_scale = 1
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
	pivot_parent = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "left",
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
		parent = "pivot_parent",
		position = {
			0,
			0,
			0
		},
		size = {
			0,
			0
		}
	},
	pivot_dragger = {
		parent = "pivot",
		position = {
			0,
			0,
			0
		},
		size = {
			100,
			200
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

if platform ~= "win32" then
	scenegraph_definition.root.scale = "hud_fit"
	scenegraph_definition.root.is_root = nil
end

local inventory_consumable_icons = (IS_WINDOWS and {
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
local inventory_index_by_slot = (IS_WINDOWS and {
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
	health_bar_size_fraction * 92,
	health_bar_size_fraction * 9
}
local health_bar_offset = {
	-(health_bar_size[1] / 2),
	-25 * health_bar_size_fraction,
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
					style_id = "ability_bar_bg",
					texture_id = "ability_bar_bg",
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
			ability_bar_bg = "hud_teammate_ability_bar_bg"
		},
		style = {
			character_portrait = {
				size = {
					86 * portrait_scale,
					108 * portrait_scale
				},
				offset = {
					-43 * portrait_scale,
					-54 * portrait_scale + 55 * portrait_scale,
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
					50
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
				font_type = "arial",
				font_size = 18,
				text_color = Colors.get_table("white"),
				horizontal_alignment = (IS_PS4 and "left") or "center",
				offset = {
					(IS_PS4 and -43 * portrait_scale) or 0,
					110 * portrait_scale,
					health_bar_offset[3] + 15
				}
			},
			player_name_shadow = {
				vertical_alignment = "bottom",
				font_type = "arial",
				font_size = 18,
				text_color = Colors.get_table("black"),
				horizontal_alignment = (IS_PS4 and "left") or "center",
				offset = {
					((IS_PS4 and -43 * portrait_scale) or 0) + 2,
					110 * portrait_scale - 2,
					health_bar_offset[3] + 14
				}
			},
			hp_bar_bg = {
				size = {
					100,
					17
				},
				offset = {
					(health_bar_offset[1] + health_bar_size[1] / 2) - 50,
					(health_bar_offset[2] + health_bar_size[2] / 2) - 8.5,
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
					(health_bar_offset[1] + health_bar_size[1] / 2) - 50,
					(health_bar_offset[2] + health_bar_size[2] / 2) - 8.5 - 7,
					health_bar_offset[3] + 20
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			ability_bar_bg = {
				size = {
					92,
					5
				},
				offset = {
					(health_bar_offset[1] + health_bar_size[1] / 2) - 46,
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
			-55 * portrait_scale,
			0
		}
	}
end

local function create_dynamic_portait_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
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
					style_id = "talk_indicator",
					texture_id = "talk_indicator",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_glow",
					texture_id = "talk_indicator_glow",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_highlight",
					texture_id = "talk_indicator_highlight",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_highlight_glow",
					texture_id = "talk_indicator_highlight_glow",
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
					pass_type = "texture",
					style_id = "ammo_indicator",
					texture_id = "ammo_indicator",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local ammo_progress = content.ammo_percent

						return ammo_progress and ammo_progress > 0 and ammo_progress <= 0.33
					end
				},
				{
					pass_type = "texture",
					style_id = "ammo_indicator",
					texture_id = "ammo_indicator_empty",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local ammo_progress = content.ammo_percent

						return ammo_progress and ammo_progress <= 0
					end
				},
				{
					style_id = "respawn_countdown_text",
					pass_type = "text",
					text_id = "respawn_countdown_text",
					retained_mode = false,
					content_check_function = function (content)
						return true
					end
				}
			}
		},
		content = {
			respawn_timer = 0,
			ammo_indicator_empty = "unit_frame_ammo_empty",
			display_portrait_icon = false,
			state = "hidden",
			last_counts = 4,
			portrait_icon = "status_icon_needs_assist",
			talk_indicator_highlight = "voip_wave",
			total_countdown_time = 0,
			respawn_countdown_text = "",
			total_fadeout_time = 0.66,
			connecting_icon = "matchmaking_connecting_icon",
			talk_indicator_highlight_glow = "voip_wave_glow",
			talk_indicator_glow = "voip_speaker_glow",
			connecting = false,
			bar_start_side = "left",
			display_portrait_overlay = false,
			talk_indicator = "voip_speaker",
			ammo_indicator = "unit_frame_ammo_low",
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
					86 * portrait_scale,
					108 * portrait_scale
				},
				offset = {
					-(86 * portrait_scale) / 2,
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
			respawn_countdown_text = {
				vertical_alignment = "center",
				scenegraph_id = "portrait_pivot",
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = 64,
				text_color = {
					255,
					255,
					168,
					0
				},
				offset = {
					0,
					0,
					16
				}
			}
		},
		offset = {
			0,
			-55 * portrait_scale,
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
				},
				{
					style_id = "item_count_1",
					pass_type = "text",
					text_id = "item_count_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_1
					end
				},
				{
					style_id = "item_count_shadow_1",
					pass_type = "text",
					text_id = "item_count_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_1
					end
				},
				{
					style_id = "item_count_2",
					pass_type = "text",
					text_id = "item_count_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_2
					end
				},
				{
					style_id = "item_count_shadow_2",
					pass_type = "text",
					text_id = "item_count_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_2
					end
				},
				{
					style_id = "item_count_3",
					pass_type = "text",
					text_id = "item_count_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_3
					end
				},
				{
					style_id = "item_count_shadow_3",
					pass_type = "text",
					text_id = "item_count_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_3
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
					29 * slot_scale,
					29 * slot_scale
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
					29 * slot_scale,
					29 * slot_scale
				},
				offset = {
					-35,
					0,
					15
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
					2,
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
					29 * slot_scale,
					29 * slot_scale
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
					29 * slot_scale,
					29 * slot_scale
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
					29 * slot_scale,
					29 * slot_scale
				},
				offset = {
					0,
					0,
					15
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
					2,
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
					29 * slot_scale,
					29 * slot_scale
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
					29 * slot_scale,
					29 * slot_scale
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
					29 * slot_scale,
					29 * slot_scale
				},
				offset = {
					35,
					0,
					15
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
					2,
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
					29 * slot_scale,
					29 * slot_scale
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
			},
			item_count_1 = {
				vertical_alignment = "bottom",
				font_size = 14,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-9,
					-1,
					12
				}
			},
			item_count_shadow_1 = {
				vertical_alignment = "bottom",
				font_size = 14,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-8,
					0,
					11
				}
			},
			item_count_2 = {
				vertical_alignment = "bottom",
				font_size = 14,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					26,
					-1,
					12
				}
			},
			item_count_shadow_2 = {
				vertical_alignment = "bottom",
				font_size = 14,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					27,
					0,
					11
				}
			},
			item_count_3 = {
				vertical_alignment = "bottom",
				font_size = 14,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					61,
					-1,
					12
				}
			},
			item_count_shadow_3 = {
				vertical_alignment = "bottom",
				font_size = 14,
				localize = false,
				horizontal_alignment = "right",
				word_wrap = false,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					62,
					0,
					11
				}
			}
		},
		offset = {
			-15,
			health_bar_offset[2] - 96,
			0
		}
	}
end

local function create_dynamic_health_widget()
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
						local actual_active_percentage = content.actual_active_percentage or 1
						local grim_progress = math.max(internal_bar_value, actual_active_percentage)
						local offset = style.offset
						offset[1] = health_bar_offset[1] + health_bar_size[1] * grim_progress
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
					style_id = "grimoire_bar",
					pass_type = "texture_uv",
					content_id = "grimoire_bar",
					retained_mode = RETAINED_MODE_ENABLED,
					content_change_function = function (content, style)
						local parent_content = content.parent
						local hp_bar_content = parent_content.hp_bar
						local internal_bar_value = hp_bar_content.internal_bar_value
						local actual_active_percentage = parent_content.actual_active_percentage or 1
						local grim_progress = math.max(internal_bar_value, actual_active_percentage)
						local size = style.size
						local uvs = content.uvs
						local offset = style.offset
						local bar_length = health_bar_size[1]
						uvs[1][1] = grim_progress
						size[1] = bar_length * (1 - grim_progress)
						offset[1] = 2 + health_bar_offset[1] + bar_length * grim_progress
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
				}
			}
		},
		content = {
			grimoire_debuff_divider = "hud_teammate_hp_bar_grim_divider",
			hp_bar_highlight = "hud_teammate_hp_bar_highlight",
			bar_start_side = "left",
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
			grimoire_bar = {
				texture_id = "hud_panel_hp_bar_bg_grimoire",
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
			grimoire_bar = {
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
					health_bar_offset[3] + 19
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
					(health_bar_offset[1] + health_bar_size[1] / 2) - 50,
					health_bar_offset[2] - 7,
					health_bar_offset[3] + 20
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
			-55 * portrait_scale,
			0
		}
	}
end

local function create_dynamic_ability_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					style_id = "ability_bar",
					pass_type = "texture_uv",
					content_id = "ability_bar",
					retained_mode = RETAINED_MODE_ENABLED,
					content_change_function = function (content, style)
						local ability_progress = content.bar_value
						local size = style.size
						local uvs = content.uvs
						local bar_length = 92
						uvs[2][2] = ability_progress
						size[1] = bar_length * ability_progress
					end
				}
			}
		},
		content = {
			bar_start_side = "left",
			ability_bar = {
				bar_value = 1,
				texture_id = "hud_teammate_ability_bar_fill",
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
			ability_bar = {
				size = {
					92,
					5
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					(health_bar_offset[1] + health_bar_size[1] / 2) - 46,
					health_bar_offset[2] - 9,
					health_bar_offset[3] + 18
				}
			}
		},
		offset = {
			0,
			-55 * portrait_scale,
			0
		}
	}
end

local widget_definitions = {
	loadout_dynamic = create_dynamic_loadout_widget(),
	portrait_static = UIWidgets.create_portrait_frame("portrait_pivot", "default", "-", portrait_scale, RETAINED_MODE_ENABLED),
	default_dynamic = create_dynamic_portait_widget(),
	default_static = create_static_widget(),
	health_dynamic = create_dynamic_health_widget(),
	ability_dynamic = create_dynamic_ability_widget()
}
local features_list = {
	equipment = true,
	ammo = true,
	damage = true,
	ability = true
}
local widget_name_by_feature = {
	static = {
		default = "default_static",
		player_name = "default_static",
		level = "default_static",
		portrait_frame = "portrait_static"
	},
	dynamic = {
		default = "default_dynamic",
		weapons = "loadout_dynamic",
		status_icon = "default_dynamic",
		health = "health_dynamic",
		equipment = "loadout_dynamic",
		ammo = "default_dynamic",
		ability = "ability_dynamic",
		damage = "damage_dynamic"
	}
}

return {
	weapon_slot_widget_settings = weapon_slot_widget_settings,
	inventory_index_by_slot = inventory_index_by_slot,
	inventory_consumable_icons = inventory_consumable_icons,
	features_list = features_list,
	widget_name_by_feature = widget_name_by_feature,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions
}
