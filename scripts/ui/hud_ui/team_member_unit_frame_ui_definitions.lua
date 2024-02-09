-- chunkname: @scripts/ui/hud_ui/team_member_unit_frame_ui_definitions.lua

local SIZE_X, SIZE_Y = 1920, 1080
local RETAINED_MODE_ENABLED = true
local portrait_scale = 1
local slot_scale = 1
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
	pivot_parent = {
		horizontal_alignment = "left",
		parent = "root",
		vertical_alignment = "top",
		position = {
			0,
			0,
			1,
		},
		size = {
			0,
			0,
		},
	},
	pivot = {
		parent = "pivot_parent",
		position = {
			0,
			0,
			0,
		},
		size = {
			0,
			0,
		},
	},
	pivot_dragger = {
		parent = "pivot",
		position = {
			0,
			0,
			0,
		},
		size = {
			100,
			200,
		},
	},
	portrait_pivot = {
		horizontal_alignment = "center",
		parent = "pivot",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			0,
			0,
		},
	},
}
local platform = PLATFORM

if platform ~= "win32" then
	scenegraph_definition.root.scale = "hud_fit"
	scenegraph_definition.root.is_root = nil
end

local inventory_consumable_icons = IS_WINDOWS and {
	[1] = "teammate_consumable_icon_medpack_empty",
	[2] = "teammate_consumable_icon_potion_empty",
	[3] = "teammate_consumable_icon_grenade_empty",
	grenade_fire_01 = "teammate_consumable_icon_fire",
	grenade_fire_02 = "teammate_consumable_icon_fire",
	grenade_frag_01 = "teammate_consumable_icon_frag",
	grenade_frag_02 = "teammate_consumable_icon_frag",
	grenade_smoke_01 = "teammate_consumable_icon_smoke",
	grenade_smoke_02 = "teammate_consumable_icon_smoke",
	healthkit_first_aid_kit_01 = "teammate_consumable_icon_medpack",
	potion_cooldown_reduction_01 = "teammate_consumable_icon_speed",
	potion_damage_boost_01 = "teammate_consumable_icon_strength",
	potion_healing_draught_01 = "teammate_consumable_icon_potion_01",
	potion_speed_boost_01 = "teammate_consumable_icon_speed",
	wpn_grimoire_01 = "teammate_consumable_icon_grimoire",
	wpn_side_objective_tome_01 = "teammate_consumable_icon_book",
} or {
	[1] = "default_heal_icon",
	[2] = "default_grenade_icon",
	[3] = "default_potion_icon",
	grenade_fire_01 = "consumables_fire",
	grenade_fire_02 = "consumables_fire",
	grenade_frag_01 = "consumables_frag",
	grenade_frag_02 = "consumables_frag",
	grenade_smoke_01 = "consumables_smoke",
	grenade_smoke_02 = "consumables_smoke",
	healthkit_first_aid_kit_01 = "consumables_medpack",
	potion_cooldown_reduction_01 = "consumables_speed",
	potion_damage_boost_01 = "consumables_strength",
	potion_healing_draught_01 = "consumables_potion_01",
	potion_speed_boost_01 = "consumables_speed",
	wpn_grimoire_01 = "consumables_grimoire",
	wpn_side_objective_tome_01 = "consumables_book",
}
local inventory_index_by_slot = IS_WINDOWS and {
	slot_grenade = 3,
	slot_healthkit = 1,
	slot_potion = 2,
} or {
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
local health_bar_size_fraction = 1
local health_bar_size = {
	health_bar_size_fraction * 92,
	health_bar_size_fraction * 9,
}
local health_bar_offset = {
	-(health_bar_size[1] / 2),
	-25 * health_bar_size_fraction,
	0,
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
					pass_type = "text",
					style_id = "player_name",
					text_id = "player_name",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "text",
					style_id = "player_name_shadow",
					text_id = "player_name",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_bg",
					texture_id = "hp_bar_bg",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "hp_bar_fg",
					texture_id = "hp_bar_fg",
					retained_mode = RETAINED_MODE_ENABLED,
				},
				{
					pass_type = "texture",
					style_id = "ability_bar_bg",
					texture_id = "ability_bar_bg",
					retained_mode = RETAINED_MODE_ENABLED,
				},
			},
		},
		content = {
			ability_bar_bg = "hud_teammate_ability_bar_bg",
			character_portrait = "unit_frame_portrait_default",
			host_icon = "host_icon",
			hp_bar_bg = "hud_teammate_hp_bar_bg",
			hp_bar_fg = "hud_teammate_hp_bar_frame",
			is_host = false,
			player_level = "",
			player_name = "n/a",
		},
		style = {
			character_portrait = {
				size = {
					86 * portrait_scale,
					108 * portrait_scale,
				},
				offset = {
					-43 * portrait_scale,
					-54 * portrait_scale + 55 * portrait_scale,
					0,
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
					-65,
					-2,
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
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				vertical_alignment = "top",
				text_color = Colors.get_table("cheeseburger"),
				offset = {
					health_bar_offset[1],
					health_bar_offset[2] - 130,
					health_bar_offset[3] + 15,
				},
			},
			player_name = {
				font_size = 18,
				font_type = "arial",
				vertical_alignment = "bottom",
				text_color = Colors.get_table("white"),
				horizontal_alignment = IS_PS4 and "left" or "center",
				offset = {
					IS_PS4 and -43 * portrait_scale or 0,
					110 * portrait_scale,
					health_bar_offset[3] + 15,
				},
			},
			player_name_shadow = {
				font_size = 18,
				font_type = "arial",
				vertical_alignment = "bottom",
				text_color = Colors.get_table("black"),
				horizontal_alignment = IS_PS4 and "left" or "center",
				offset = {
					(IS_PS4 and -43 * portrait_scale or 0) + 2,
					110 * portrait_scale - 2,
					health_bar_offset[3] + 14,
				},
			},
			hp_bar_bg = {
				size = {
					100,
					17,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] / 2 - 50,
					health_bar_offset[2] + health_bar_size[2] / 2 - 8.5,
					health_bar_offset[3] + 15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			hp_bar_fg = {
				size = {
					100,
					24,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] / 2 - 50,
					health_bar_offset[2] + health_bar_size[2] / 2 - 8.5 - 7,
					health_bar_offset[3] + 20,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			ability_bar_bg = {
				size = {
					92,
					5,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] / 2 - 46,
					health_bar_offset[2] - 9,
					health_bar_offset[3] + 15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
		offset = {
			0,
			-55 * portrait_scale,
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
				{
					pass_type = "texture",
					style_id = "ammo_indicator",
					texture_id = "ammo_indicator",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local ammo_progress = content.ammo_percent

						return ammo_progress and ammo_progress > 0 and ammo_progress <= 0.33
					end,
				},
				{
					pass_type = "texture",
					style_id = "ammo_indicator",
					texture_id = "ammo_indicator_empty",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local ammo_progress = content.ammo_percent

						return ammo_progress and ammo_progress <= 0
					end,
				},
				{
					pass_type = "text",
					retained_mode = false,
					style_id = "respawn_countdown_text",
					text_id = "respawn_countdown_text",
					content_check_function = function (content)
						return true
					end,
				},
				{
					pass_type = "texture",
					style_id = "ammo_indicator",
					texture_id = "numeric_ui_ammo_indicator",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						local ammo_progress = content.ammo_percent
						local should_hide = ammo_progress and (ammo_progress > 0 and ammo_progress <= 0.33 or ammo_progress <= 0)

						return Application.user_setting("numeric_ui") and content.has_ranged_weapon and not should_hide
					end,
				},
				{
					pass_type = "texture",
					style_id = "ability_cooldown_indicator",
					texture_id = "ability_cooldown_indicator",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui") and content.on_cooldown
					end,
				},
				{
					pass_type = "text",
					style_id = "ammo_count",
					text_id = "ammo_count",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui") and content.has_ranged_weapon
					end,
				},
				{
					pass_type = "text",
					style_id = "ammo_count_shadow",
					text_id = "ammo_count",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui") and content.has_ranged_weapon
					end,
				},
				{
					pass_type = "text",
					style_id = "ability_cooldown",
					text_id = "ability_cooldown",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui") and content.on_cooldown
					end,
				},
				{
					pass_type = "text",
					style_id = "ability_cooldown_shadow",
					text_id = "ability_cooldown",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui") and content.on_cooldown
					end,
				},
				{
					pass_type = "texture",
					style_id = "brush_stroke",
					texture_id = "brush_stroke",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui")
					end,
				},
			},
		},
		content = {
			ability_cooldown = "",
			ability_cooldown_indicator = "numeric_ui_ultimatecd_icon",
			ammo_count = "",
			ammo_indicator = "unit_frame_ammo_low",
			ammo_indicator_empty = "unit_frame_ammo_empty",
			bar_start_side = "left",
			brush_stroke = "numeric_ui_brush_stroke",
			can_use_ability = false,
			connecting = false,
			connecting_icon = "matchmaking_connecting_icon",
			display_portrait_icon = false,
			display_portrait_overlay = false,
			has_ranged_weapon = false,
			last_counts = 4,
			numeric_ui_ammo_indicator = "unit_frame_ammo",
			on_cooldown = false,
			portrait_icon = "status_icon_needs_assist",
			respawn_countdown_text = "",
			respawn_timer = 0,
			state = "hidden",
			talk_indicator = "voip_speaker",
			talk_indicator_glow = "voip_speaker_glow",
			talk_indicator_highlight = "voip_wave",
			talk_indicator_highlight_glow = "voip_wave_glow",
			total_countdown_time = 0,
			total_fadeout_time = 0.66,
			ammo_bar = {
				bar_value = 1,
				texture_id = "hud_teammate_ammo_bar_fill",
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
			ammo_indicator = {
				size = {
					32,
					32,
				},
				offset = {
					60,
					-40,
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			talk_indicator = {
				size = {
					64,
					64,
				},
				offset = {
					60,
					30,
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
				size = {
					64,
					64,
				},
				offset = {
					60,
					30,
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
				size = {
					64,
					64,
				},
				offset = {
					60,
					30,
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
				size = {
					64,
					64,
				},
				offset = {
					60,
					30,
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
				size = {
					53,
					53,
				},
				offset = {
					-25,
					34,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				pivot = {
					27,
					27,
				},
			},
			portrait_icon = {
				size = {
					86 * portrait_scale,
					108 * portrait_scale,
				},
				offset = {
					-(86 * portrait_scale) / 2,
					0,
					1,
				},
				color = {
					150,
					255,
					255,
					255,
				},
			},
			respawn_countdown_text = {
				font_size = 64,
				font_type = "hell_shark",
				horizontal_alignment = "center",
				scenegraph_id = "portrait_pivot",
				vertical_alignment = "center",
				text_color = {
					255,
					255,
					168,
					0,
				},
				offset = {
					0,
					0,
					16,
				},
			},
			ability_cooldown_indicator = {
				size = {
					32,
					32,
				},
				offset = {
					60,
					health_bar_offset[2] + health_bar_size[2] / 2 - 6 - 1 + 1 - 45,
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			ammo_count = {
				font_size = 18,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				text_color = {
					255,
					250,
					250,
					250,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] + 50,
					health_bar_offset[2] + health_bar_size[2] / 2 - 8.5 - 1 + 1,
					health_bar_offset[3] + 22,
				},
				size = health_bar_size,
			},
			ammo_count_shadow = {
				font_size = 18,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] + 50 + 1,
					health_bar_offset[2] + health_bar_size[2] / 2 - 8.5 - 1 + 1,
					health_bar_offset[3] + 21,
				},
				size = health_bar_size,
			},
			ability_cooldown = {
				font_size = 18,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					250,
					250,
					250,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] + 50,
					health_bar_offset[2] + health_bar_size[2] / 2 - 6 - 1 + 1 - 32,
					health_bar_offset[3] + 22,
				},
				size = health_bar_size,
			},
			ability_cooldown_shadow = {
				font_size = 18,
				font_type = "hell_shark_header",
				horizontal_alignment = "left",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] + 50 + 1,
					health_bar_offset[2] + health_bar_size[2] / 2 - 6 - 1 + 1 - 32,
					health_bar_offset[3] + 21,
				},
				size = health_bar_size,
			},
			brush_stroke = {
				size = {
					210,
					74,
				},
				offset = {
					-60,
					-76,
					0,
				},
				color = {
					255,
					0,
					0,
					0,
				},
			},
		},
		offset = {
			0,
			-55 * portrait_scale,
			0,
		},
	}
end

local function create_static_loadout_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {},
		},
		content = {},
		style = {},
		offset = {
			50,
			-55,
			0,
		},
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
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_bg_1",
					texture_id = "item_slot_bg_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_frame_1",
					texture_id = "slot_frame",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_1",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_2",
					texture_id = "item_slot_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_bg_2",
					texture_id = "item_slot_bg_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_frame_2",
					texture_id = "slot_frame",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_2",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_3",
					texture_id = "item_slot_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_bg_3",
					texture_id = "item_slot_bg_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_frame_3",
					texture_id = "slot_frame",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					style_id = "item_slot_highlight_3",
					texture_id = "item_slot_highlight",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.draw_health_bar
					end,
				},
				{
					pass_type = "text",
					style_id = "item_count_1",
					text_id = "item_count_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_1
					end,
				},
				{
					pass_type = "text",
					style_id = "item_count_shadow_1",
					text_id = "item_count_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_1
					end,
				},
				{
					pass_type = "text",
					style_id = "item_count_2",
					text_id = "item_count_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_2
					end,
				},
				{
					pass_type = "text",
					style_id = "item_count_shadow_2",
					text_id = "item_count_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_2
					end,
				},
				{
					pass_type = "text",
					style_id = "item_count_3",
					text_id = "item_count_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_3
					end,
				},
				{
					pass_type = "text",
					style_id = "item_count_shadow_3",
					text_id = "item_count_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.draw_health_bar and content.item_count_3
					end,
				},
			},
		},
		content = {
			draw_health_bar = true,
			item_slot_1 = "icons_placeholder",
			item_slot_2 = "icons_placeholder",
			item_slot_3 = "icons_placeholder",
			item_slot_bg_1 = "hud_inventory_slot_bg_small_01",
			item_slot_bg_2 = "hud_inventory_slot_bg_small_01",
			item_slot_bg_3 = "hud_inventory_slot_bg_small_01",
			item_slot_highlight = "hud_inventory_slot_small_pickup",
			slot_frame = "hud_inventory_slot_small",
		},
		style = {
			item_slot_bg_1 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					-35,
					0,
					7,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_frame_1 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					-35,
					0,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_1 = {
				size = {
					25,
					25,
				},
				offset = {
					-32.5,
					2,
					8,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_highlight_1 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					-35,
					0,
					10,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			item_slot_bg_2 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					0,
					0,
					7,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_frame_2 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					0,
					0,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_2 = {
				size = {
					25,
					25,
				},
				offset = {
					2.5,
					2,
					8,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_highlight_2 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					0,
					0,
					10,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			item_slot_bg_3 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					35,
					0,
					7,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_frame_3 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					35,
					0,
					15,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_3 = {
				size = {
					25,
					25,
				},
				offset = {
					37.5,
					2,
					8,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			item_slot_highlight_3 = {
				size = {
					29 * slot_scale,
					29 * slot_scale,
				},
				offset = {
					35,
					0,
					10,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			item_count_1 = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-9,
					-1,
					12,
				},
			},
			item_count_shadow_1 = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-8,
					0,
					11,
				},
			},
			item_count_2 = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					26,
					-1,
					12,
				},
			},
			item_count_shadow_2 = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					27,
					0,
					11,
				},
			},
			item_count_3 = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					61,
					-1,
					12,
				},
			},
			item_count_shadow_3 = {
				font_size = 14,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				localize = false,
				vertical_alignment = "bottom",
				word_wrap = false,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					62,
					0,
					11,
				},
			},
		},
		offset = {
			-15,
			health_bar_offset[2] - 96,
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
						return content.hp_bar.draw_health_bar
					end,
					content_change_function = function (content, style)
						local hp_bar_content = content.hp_bar
						local internal_bar_value = hp_bar_content.internal_bar_value
						local actual_active_percentage = content.actual_active_percentage or 1
						local grim_progress = math.max(internal_bar_value, actual_active_percentage)
						local offset = style.offset

						offset[1] = health_bar_offset[1] + health_bar_size[1] * grim_progress
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
						local bar_length = health_bar_size[1]

						uvs[1][1] = grim_progress
						size[1] = bar_length * (1 - grim_progress)
						offset[1] = 2 + health_bar_offset[1] + bar_length * grim_progress
					end,
				},
				{
					pass_type = "texture",
					style_id = "hp_bar",
					texture_id = "hp_bar_mask",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.hp_bar.draw_health_bar
					end,
				},
				{
					pass_type = "texture",
					texture_id = "portrait_icon",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return content.display_portrait_icon
					end,
				},
				{
					pass_type = "text",
					style_id = "numeric_health",
					text_id = "numeric_health",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui")
					end,
				},
				{
					pass_type = "text",
					style_id = "numeric_health_shadow",
					text_id = "numeric_health",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content)
						return Application.user_setting("numeric_ui")
					end,
				},
			},
		},
		content = {
			bar_start_side = "left",
			grimoire_debuff_divider = "hud_teammate_hp_bar_grim_divider",
			hp_bar_highlight = "hud_teammate_hp_bar_highlight",
			hp_bar_mask = "teammate_hp_bar_mask",
			numeric_health = "-/-",
			hp_bar = {
				bar_value = 1,
				draw_health_bar = true,
				internal_bar_value = 0,
				texture_id = "teammate_hp_bar_color_tint_1",
			},
			total_health_bar = {
				bar_value = 1,
				draw_health_bar = true,
				internal_bar_value = 0,
				texture_id = "teammate_hp_bar_1",
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
				size = {
					health_bar_size[1],
					health_bar_size[2],
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					health_bar_offset[1],
					health_bar_offset[2],
					health_bar_offset[3] + 17,
				},
			},
			hp_bar = {
				gradient_threshold = 1,
				size = {
					health_bar_size[1],
					health_bar_size[2],
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					health_bar_offset[1],
					health_bar_offset[2],
					health_bar_offset[3] + 18,
				},
			},
			grimoire_bar = {
				size = {
					health_bar_size[1],
					health_bar_size[2],
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					health_bar_offset[1],
					health_bar_offset[2],
					health_bar_offset[3] + 19,
				},
			},
			grimoire_debuff_divider = {
				masked = true,
				size = {
					3,
					28,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					health_bar_offset[1],
					health_bar_offset[2],
					23,
				},
			},
			hp_bar_highlight = {
				size = {
					100,
					17,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] / 2 - 50,
					health_bar_offset[2] - 7,
					health_bar_offset[3] + 20,
				},
				color = {
					0,
					255,
					255,
					255,
				},
			},
			numeric_health = {
				font_size = 12,
				font_type = "arial",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					250,
					250,
					250,
				},
				offset = {
					health_bar_offset[1] - 4,
					health_bar_offset[2] - 10,
					health_bar_offset[3] + 22,
				},
				size = {
					100,
					30,
				},
			},
			numeric_health_shadow = {
				font_size = 12,
				font_type = "arial",
				horizontal_alignment = "center",
				vertical_alignment = "center",
				word_wrap = true,
				text_color = {
					255,
					0,
					0,
					0,
				},
				offset = {
					health_bar_offset[1] - 4 + 1,
					health_bar_offset[2] - 10 + 1,
					health_bar_offset[3] + 21,
				},
				size = {
					100,
					30,
				},
			},
		},
		offset = {
			0,
			-55 * portrait_scale,
			0,
		},
	}
end

local function create_dynamic_ability_widget()
	return {
		scenegraph_id = "pivot",
		element = {
			passes = {
				{
					content_id = "ability_bar",
					pass_type = "texture_uv",
					style_id = "ability_bar",
					retained_mode = RETAINED_MODE_ENABLED,
					content_change_function = function (content, style)
						local ability_progress = content.bar_value
						local size = style.size
						local uvs = content.uvs
						local bar_length = 92

						uvs[2][2] = ability_progress
						size[1] = bar_length * ability_progress
					end,
				},
			},
		},
		content = {
			bar_start_side = "left",
			ability_bar = {
				bar_value = 1,
				texture_id = "hud_teammate_ability_bar_fill",
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
			ability_bar = {
				size = {
					92,
					5,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					health_bar_offset[1] + health_bar_size[1] / 2 - 46,
					health_bar_offset[2] - 9,
					health_bar_offset[3] + 18,
				},
			},
		},
		offset = {
			0,
			-55 * portrait_scale,
			0,
		},
	}
end

local widget_definitions = {
	loadout_dynamic = create_dynamic_loadout_widget(),
	portrait_static = UIWidgets.create_portrait_frame("portrait_pivot", "default", "-", portrait_scale, RETAINED_MODE_ENABLED),
	default_dynamic = create_dynamic_portait_widget(),
	default_static = create_static_widget(),
	health_dynamic = create_dynamic_health_widget(),
	ability_dynamic = create_dynamic_ability_widget(),
}
local features_list = {
	ability = true,
	ammo = true,
	damage = false,
	equipment = true,
}
local widget_name_by_feature = {
	static = {
		default = "default_static",
		level = "default_static",
		player_name = "default_static",
		portrait_frame = "portrait_static",
	},
	dynamic = {
		ability = "ability_dynamic",
		ammo = "default_dynamic",
		damage = "damage_dynamic",
		default = "default_dynamic",
		equipment = "loadout_dynamic",
		health = "health_dynamic",
		status_icon = "default_dynamic",
		weapons = "loadout_dynamic",
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
}
