-- chunkname: @scripts/ui/hud_ui/dark_pact_player_unit_frame_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local RETAINED_MODE_ENABLED = true
local portrait_scale = 1
local HP_BAR_SIZE = {
	412,
	18,
}
local HP_BAR_BG_SIZE = {
	464,
	80,
}
local HP_BAR = {
	y = 18,
	z = 8,
	x = -(HP_BAR_SIZE[1] * 0.5),
}
local scenegraph_definition = {
	root = {
		scale = "hud_scale_fit",
		position = {
			0,
			0,
			UILayer.hud,
		},
		size = {
			SIZE_X,
			SIZE_Y,
		},
	},
	pivot = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			5,
		},
		size = {
			0,
			0,
		},
	},
	portrait_pivot = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "bottom",
		position = {
			130,
			80,
			10,
		},
		size = {
			0,
			0,
		},
	},
	respawn_countdown_pivot = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		position = {
			0,
			30,
			10,
		},
		size = {
			0,
			0,
		},
	},
	insignia_pivot_parent = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "bottom",
		position = {
			0,
			0,
			10,
		},
		size = {
			0,
			0,
		},
	},
	insignia_pivot = {
		horizontal_alignment = "left",
		parent = "insignia_pivot_parent",
		vertical_alignment = "top",
		position = {
			40,
			80,
			0,
		},
		size = {
			0,
			0,
		},
	},
}
local inventory_consumable_icons = {
	"hud_inventory_icon_heal_01",
	"hud_inventory_icon_bomb",
	"hud_inventory_icon_potion",
	grenade_engineer_01 = "hud_inventory_icon_bomb",
	grenade_fire_01 = "hud_inventory_icon_bomb",
	grenade_fire_02 = "hud_inventory_icon_bomb",
	grenade_frag_01 = "hud_inventory_icon_bomb",
	grenade_frag_02 = "hud_inventory_icon_bomb",
	grenade_smoke_01 = "hud_inventory_icon_bomb",
	grenade_smoke_02 = "hud_inventory_icon_bomb",
	healthkit_first_aid_kit_01 = "hud_inventory_icon_heal_01",
	potion_cooldown_reduction_01 = "hud_inventory_icon_potion_cooldown_reduction",
	potion_damage_boost_01 = "hud_inventory_icon_potion_strength",
	potion_healing_draught_01 = "hud_inventory_icon_heal_02",
	potion_speed_boost_01 = "hud_inventory_icon_potion_speed",
	wpn_grimoire_01 = "hud_inventory_icon_grimoire",
	wpn_side_objective_tome_01 = "hud_inventory_icon_tome",
}
local inventory_index_by_slot = {
	slot_grenade = 2,
	slot_healthkit = 1,
	slot_potion = 3,
}
local weapon_slot_widget_settings = {
	ammo_fields = {
		slot_melee = "ammo_text_weapon_slot_1",
		slot_ranged = "ammo_text_weapon_slot_2",
	},
}

local function create_static_widget()
	return {
		scenegraph_id = "portrait_pivot",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "character_portrait",
					texture_id = "character_portrait",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "text",
					style_id = "player_level",
					text_id = "player_level",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "host_icon",
					texture_id = "host_icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.is_host
					end,
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_frame",
					texture_id = "hp_bar_frame",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.show_health_bar
					end,
				},
			},
		},
		content = {
			character_portrait = "unit_frame_portrait_default",
			host_icon = "host_icon",
			hp_bar_frame = "health_bar_frame",
			is_host = false,
			player_level = "",
			show_health_bar = true,
		},
		style = {
			character_portrait = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				texture_size = {
					86,
					108,
				},
				offset = {
					0,
					0,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			host_icon = {
				size = {
					40,
					40,
				},
				offset = {
					-57,
					-68,
					50,
				},
				color = {
					150,
					255,
					255,
					255,
				},
			},
			player_level = {
				font_size = 18,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_table("cheeseburger"),
				offset = {
					0,
					-65,
					3,
				},
			},
			hp_bar_frame = {
				scenegraph_id = "pivot",
				size = HP_BAR_BG_SIZE,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					-(HP_BAR_BG_SIZE[1] * 0.5),
					-1,
					1,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local function create_respawn_countdown_widget()
	return {
		scenegraph_id = "respawn_countdown_pivot",
		element = {
			passes = {
				{
					pass_type = "text",
					retained_mode = false,
					style_id = "respawn_info_text",
					text_id = "respawn_info_text",
				},
				{
					pass_type = "text",
					retained_mode = false,
					style_id = "respawn_countdown_text",
					text_id = "respawn_countdown_text",
				},
			},
		},
		content = {
			last_counts = 4,
			respawn_countdown_text = "",
			respawn_info_text = "",
			respawn_timer = 0,
			state = "hidden",
			total_countdown_time = 0,
			total_fadeout_time = 0,
		},
		style = {
			respawn_info_text = {
				font_size = 24,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("light_gray", 255),
				offset = {
					0,
					-48,
					3,
				},
			},
			respawn_countdown_text = {
				font_size = 120,
				font_type = "hell_shark_header",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-140,
					3,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
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
					end,
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator",
					texture_id = "talk_indicator",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_glow",
					texture_id = "talk_indicator_glow",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_highlight",
					texture_id = "talk_indicator_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "talk_indicator_highlight_glow",
					texture_id = "talk_indicator_highlight_glow",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "rotated_texture",
					style_id = "connecting_icon",
					texture_id = "connecting_icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.connecting
					end,
				},
			},
		},
		content = {
			connecting = false,
			connecting_icon = "matchmaking_connecting_icon",
			display_portrait_icon = false,
			display_portrait_overlay = false,
			portrait_icon = "status_icon_needs_assist",
			talk_indicator = "voip_speaker",
			talk_indicator_glow = "voip_speaker_glow",
			talk_indicator_highlight = "voip_wave",
			talk_indicator_highlight_glow = "voip_wave_glow",
		},
		style = {
			talk_indicator = {
				scenegraph_id = "portrait_pivot",
				size = {
					64,
					64,
				},
				offset = {
					60,
					6,
					3,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			talk_indicator_glow = {
				scenegraph_id = "portrait_pivot",
				size = {
					64,
					64,
				},
				offset = {
					60,
					6,
					2,
				},
				color = {
					0,
					0,
					0,
					0,
				},
			},
			talk_indicator_highlight = {
				scenegraph_id = "portrait_pivot",
				size = {
					64,
					64,
				},
				offset = {
					60,
					6,
					3,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			talk_indicator_highlight_glow = {
				scenegraph_id = "portrait_pivot",
				size = {
					64,
					64,
				},
				offset = {
					60,
					6,
					2,
				},
				color = {
					0,
					0,
					0,
					0,
				},
			},
			connecting_icon = {
				angle = 0,
				horizontal_alignment = "center",
				scenegraph_id = "portrait_pivot",
				vertical_alignment = "center",
				pivot = {
					26.5,
					26.5,
				},
				texture_size = {
					53,
					53,
				},
				offset = {
					0,
					0,
					12,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			portrait_icon = {
				horizontal_alignment = "center",
				scenegraph_id = "portrait_pivot",
				vertical_alignment = "center",
				texture_size = {
					86,
					108,
				},
				offset = {
					0,
					0,
					7,
				},
				color = {
					150,
					255,
					255,
					255,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
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
					end,
				},
				{
					pass_type = "texture",
					style_id = "grimoire_debuff_divider",
					texture_id = "grimoire_debuff_divider",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local hp_bar_content = content.hp_bar
						local internal_bar_value = hp_bar_content.internal_bar_value
						local actual_active_percentage = content.actual_active_percentage or 1
						local grim_progress = math.max(internal_bar_value, actual_active_percentage)

						return grim_progress < 1
					end,
					content_change_function = function (content, style)
						local hp_bar_content = content.hp_bar
						local internal_bar_value = hp_bar_content.internal_bar_value
						local actual_active_percentage = content.actual_active_percentage or 1
						local grim_progress = math.max(internal_bar_value, actual_active_percentage)
						local offset = style.offset

						offset[1] = HP_BAR.x - 7 + 553 * grim_progress
					end,
				},
				{
					content_id = "hp_bar",
					pass_type = "gradient_mask_texture",
					style_id = "hp_bar",
					texture_id = "texture_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					content_id = "total_health_bar",
					pass_type = "gradient_mask_texture",
					style_id = "total_health_bar",
					texture_id = "texture_id",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					content_id = "grimoire_bar",
					pass_type = "texture_uv",
					style_id = "grimoire_bar",
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
						local bar_length = 553

						uvs[1][1] = grim_progress
						size[1] = bar_length * (1 - grim_progress)
						offset[1] = 2 + HP_BAR.x + bar_length * grim_progress
					end,
				},
			},
		},
		content = {
			bar_start_side = "left",
			grimoire_debuff_divider = "hud_player_hp_bar_grim_divider",
			hp_bar_highlight = "hud_player_hp_bar_highlight",
			visible = true,
			hp_bar = {
				bar_value = 1,
				draw_health_bar = true,
				internal_bar_value = 0,
				texture_id = "dark_pact_boss_player_hp_bar_color_tint",
			},
			total_health_bar = {
				bar_value = 1,
				draw_health_bar = true,
				internal_bar_value = 0,
				texture_id = "dark_pact_boss_player_hp_bar",
			},
			grimoire_bar = {
				texture_id = "hud_panel_hp_bar_bg_grimoire",
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
		},
		style = {
			total_health_bar = {
				gradient_threshold = 1,
				size = HP_BAR_SIZE,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					HP_BAR.x + 1,
					HP_BAR.y,
					HP_BAR.z + 2,
				},
			},
			hp_bar = {
				gradient_threshold = 1,
				size = HP_BAR_SIZE,
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					HP_BAR.x + 1,
					HP_BAR.y,
					HP_BAR.z + 3,
				},
			},
			grimoire_bar = {
				size = {
					553,
					18,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					HP_BAR.x,
					HP_BAR.y,
					HP_BAR.z + 4,
				},
			},
			grimoire_debuff_divider = {
				size = {
					21,
					36,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					HP_BAR.x + 10,
					HP_BAR.y - 8,
					HP_BAR.z + 20,
				},
			},
			hp_bar_highlight = {
				size = {
					156,
					16,
				},
				offset = {
					HP_BAR.x + 1,
					HP_BAR.y + 27 - 2,
					HP_BAR.z + 5,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
		},
		offset = {
			0,
			0,
			0,
		},
	}
end

local widget_definitions = {
	portrait_static = UIWidgets.create_portrait_frame("portrait_pivot", "default", "-", portrait_scale, RETAINED_MODE_ENABLED),
	default_dynamic = create_dynamic_portait_widget(),
	default_static = create_static_widget(),
	health_dynamic = create_dynamic_health_widget(),
	respawn_dynamic = create_respawn_countdown_widget(),
	versus_insignia_static = UIWidgets.create_small_insignia("insignia_pivot", 1, nil, nil, nil, RETAINED_MODE_ENABLED),
}
local damage_widget_definitions = UnitFramesUiUtils.create_damage_widget("player", 4)
local features_list = {
	ability = false,
	damage = true,
	equipment = false,
	respawn = true,
	weapons = false,
}
local widget_name_by_feature = {
	static = {
		default = "default_static",
		level = "default_static",
		portrait_frame = "portrait_static",
		versus_insignia = "versus_insignia_static",
	},
	dynamic = {
		damage = "damage_dynamic",
		default = "default_dynamic",
		health = "health_dynamic",
		respawn = "respawn_dynamic",
		status_icon = "default_dynamic",
	},
}

return {
	weapon_slot_widget_settings = weapon_slot_widget_settings,
	inventory_index_by_slot = inventory_index_by_slot,
	inventory_consumable_icons = inventory_consumable_icons,
	features_list = features_list,
	widget_name_by_feature = widget_name_by_feature,
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	damage_widget_definitions = damage_widget_definitions,
}
