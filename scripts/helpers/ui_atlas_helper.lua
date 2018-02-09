require("scripts/ui/atlas_settings/gui_hud_atlas")
require("scripts/ui/atlas_settings/gui_game_logos_atlas")
require("scripts/ui/atlas_settings/gui_loading_atlas")
require("scripts/ui/atlas_settings/gui_menu_buttons_atlas")
require("scripts/ui/atlas_settings/gui_popup_atlas")
require("scripts/ui/atlas_settings/gui_splash_atlas")
require("scripts/ui/atlas_settings/gui_items_atlas")
require("scripts/ui/atlas_settings/gui_icons_atlas")
require("scripts/ui/atlas_settings/gui_chat_atlas")
require("scripts/ui/atlas_settings/gui_voice_chat_atlas")
require("scripts/ui/atlas_settings/gui_startup_settings_atlas")
require("scripts/ui/atlas_settings/gui_settings_atlas")
require("scripts/ui/atlas_settings/gui_start_screen_atlas")
require("scripts/ui/atlas_settings/gui_level_images_atlas")
require("scripts/ui/atlas_settings/gui_map_locations_atlas")
require("scripts/ui/atlas_settings/gui_frames_atlas")
require("scripts/ui/atlas_settings/gui_menus_atlas")

local platform = PLATFORM

if platform == "win32" then
end

UIAtlasHelper = UIAtlasHelper or {}
local none_atlas_textures = {
	loot_presentation_circle_glow_exotic_large = true,
	demo_bg_02 = true,
	twitch_special_group_3 = true,
	twitch_buff_1 = true,
	career_witch_hunter_captain = true,
	mission_map_mask_troll_caves = true,
	loot_presentation_circle_glow_common_large = true,
	unit_frame_portrait_kerillian_maidenguard_twitch = true,
	unit_frame_portrait_bardin_ranger_twitch_icon = true,
	ubersreik_area_icon_banner = true,
	chest_reward_bar = true,
	console_player_hp_bar = true,
	twitch_heal = true,
	twitch_rat_ogre = true,
	level_list_selection_frame = true,
	game_mode_selection_glow_01 = true,
	charge_bar_flames_mask = true,
	gamma_settings_image_01 = true,
	unit_frame_portrait_sienna_unchained_twitch_icon = true,
	gamepad_difficulty_banner_1_masked = true,
	gradient_credits_menu = true,
	unit_frame_portrait_victor_zealot_twitch_icon = true,
	gradient_main_menu = true,
	mission_select_icon = true,
	end_screen_effect_victory_1 = true,
	offscreen_clear = true,
	career_wood_elf_maiden = true,
	career_wood_elf_shade = true,
	start_game_detail_glow_masked = true,
	teammate_hp_bar_1 = true,
	vote_a = true,
	mission_map_mask_farmlands = true,
	selected_window_glow_settings_02 = true,
	teammate_hp_bar_2 = true,
	mission_map_mask_military = true,
	loot_presentation_circle_glow_unique = true,
	end_screen_banner_victory = true,
	play_button_frame_glow = true,
	twitch_buff_3 = true,
	drachenfels_area_icon_glass = true,
	unit_frame_portrait_bardin_ranger_masked = true,
	mask_rect_edge_fade = true,
	unit_frame_portrait_sienna_unchained = true,
	gradient_map_screen = true,
	game_mode_selection_glow_02_masked = true,
	game_mode_selection_glow_01_masked = true,
	unit_frame_portrait_victor_zealot = true,
	gamepad_difficulty_banner_4_masked = true,
	journal_gradient_01 = true,
	gamepad_difficulty_banner_3_masked = true,
	gamepad_difficulty_banner_2_masked = true,
	mission_map_mask_skittergate = true,
	mission_map_mask_catacombs = true,
	unit_frame_portrait_kruber_mercenary_masked = true,
	mask_circular = true,
	unit_frame_portrait_sienna_scholar = true,
	twitch_damage_boost = true,
	career_dwarf_slayer = true,
	quick_play_icon_glow = true,
	unit_frame_portrait_kerillian_waywatcher_twitch_icon = true,
	gamepad_difficulty_banner_5 = true,
	vermintide_logo_title = true,
	mission_select_icon_glow = true,
	end_screen_experience_bar_bubbles = true,
	buff_gradient_mask = true,
	career_bright_wizard_sniper = true,
	gamepad_difficulty_banner_5_masked = true,
	unit_frame_portrait_kruber_knight_twitch = true,
	unit_frame_portrait_victor_captain_twitch = true,
	end_screen_effect_defeat_2 = true,
	unit_frame_portrait_victor_bountyhunter_masked = true,
	unit_frame_portrait_bardin_slayer_twitch = true,
	unit_frame_portrait_sienna_adept = true,
	level_location_selected = true,
	unit_frame_portrait_kerillian_shade_twitch_icon = true,
	glass_indicator = true,
	unit_frame_portrait_kruber_mercenary_twitch_icon = true,
	journal_gradient_02 = true,
	unit_frame_portrait_sienna_scholar_masked = true,
	unit_frame_portrait_bardin_ranger_twitch = true,
	mission_map_mask_skaven_stronghold = true,
	unit_frame_portrait_victor_captain = true,
	world_map_01 = true,
	ability_effect = true,
	teammate_hp_bar_mask = true,
	vermintide_logo_transparent = true,
	unit_frame_portrait_sienna_scholar_twitch = true,
	console_cursor = true,
	twitch_frame_glass = true,
	hud_difficulty_unlocked_glow = true,
	unit_frame_portrait_kruber_huntsman_masked = true,
	selected_window_glow_settings_01 = true,
	journal_gradient_05 = true,
	console_charge_bar_fill = true,
	career_dwarf_ranger = true,
	drachenfels_area_icon_banner = true,
	crafting_button_fill = true,
	unit_frame_portrait_kerillian_maidenguard_twitch_icon = true,
	unit_frame_portrait_sienna_unchained_twitch = true,
	unit_frame_portrait_bardin_slayer_masked = true,
	unit_frame_portrait_sienna_adept_twitch_icon = true,
	console_player_hp_bar_color_tint = true,
	dice_game_curtain = true,
	teammate_hp_bar_3 = true,
	unit_frame_portrait_sienna_adept_masked = true,
	controller_hold_bar = true,
	mission_map_mask_ground_zero = true,
	gradient_dice_game_reward = true,
	mission_map_mask_elven_ruins = true,
	twitch_speed_boost = true,
	unit_frame_portrait_kerillian_maidenguard_masked = true,
	controller_image_xb1 = true,
	mission_map_mask_last_stand_tower = true,
	gamma_settings_image_02 = true,
	loot_presentation_circle_glow_rare = true,
	twitch_logo = true,
	teammate_hp_bar_color_tint_2 = true,
	unit_frame_portrait_bardin_ironbreaker_twitch_icon = true,
	career_bright_wizard_boomer = true,
	boss_portrait_heal = true,
	career_witch_hunter_bounty_hunter = true,
	career_emperor_full_plate = true,
	unit_frame_portrait_kruber_huntsman_twitch_icon = true,
	game_mode_selection_glow_02 = true,
	mission_map_mask_last_stand_chaos = true,
	options_menu_divider_glow_02 = true,
	loot_presentation_circle_glow_plentiful = true,
	unit_frame_portrait_victor_bountyhunter = true,
	journal_gradient_03 = true,
	end_screen_effect_defeat_1 = true,
	hud_panel_banner = true,
	unit_frame_portrait_kruber_knight_masked = true,
	career_emperor_normal = true,
	loot_presentation_circle_glow_common = true,
	gradient_playerlist = true,
	unit_frame_portrait_kerillian_maidenguard = true,
	twitch_special_group_1 = true,
	overcharge_threshold_mask = true,
	esrb_logo = true,
	unit_frame_portrait_victor_bountyhunter_twitch_icon = true,
	loading_screen = true,
	settings_debug_gamma_correction = true,
	unit_frame_portrait_victor_captain_twitch_icon = true,
	unit_frame_portrait_victor_zealot_twitch = true,
	overcharge_bar_2 = true,
	overchargecircle_fill = true,
	unit_frame_portrait_bardin_ironbreaker_twitch = true,
	block_arch_symbol = true,
	selected_window_glow = true,
	gamepad_difficulty_banner_2 = true,
	mask_rect = true,
	loot_presentation_circle_glow_plentiful_large = true,
	loot_presentation_circle_glow_promo = true,
	speech_bubble = true,
	unit_frame_portrait_kruber_mercenary = true,
	unit_frame_portrait_default = true,
	interaction_bar = true,
	unit_frame_portrait_sienna_adept_twitch = true,
	unit_frame_portrait_bardin_slayer_twitch_icon = true,
	beta_text = true,
	end_screen_experience_bar = true,
	game_option_smoke = true,
	quick_play_icon = true,
	play_button_passive_glow = true,
	simple_rect_texture = true,
	vote_b = true,
	charge_bar_flames = true,
	controller_image_ps4 = true,
	loot_presentation_circle_glow_unique_large = true,
	unit_frame_portrait_victor_zealot_masked = true,
	map_area_banner_difficulty_icon = true,
	unit_frame_portrait_kerillian_waywatcher_masked = true,
	ability_outer_effect_mask = true,
	overchargecircle_sidefade = true,
	start_game_detail_glow = true,
	career_dwarf_ironbreaker = true,
	twitch_buff_2 = true,
	unit_frame_portrait_kerillian_shade = true,
	unit_frame_portrait_sienna_scholar_twitch_icon = true,
	start_screen_selection_left = true,
	prestige_banner = true,
	unit_frame_portrait_victor_captain_masked = true,
	unit_frame_portrait_kruber_knight_twitch_icon = true,
	loading_screen_default = true,
	demo_water_mark = true,
	gamepad_difficulty_banner_4 = true,
	teammate_hp_bar_color_tint_3 = true,
	career_wood_elf_waywatcher = true,
	unit_frame_portrait_bardin_ironbreaker = true,
	twitch_icon_damage = true,
	fuzzy_circle = true,
	mission_map_mask_chaos_war_camp = true,
	tile_texture_01 = true,
	twitch_frame_01 = true,
	start_screen_selection_right = true,
	demo_bg_01 = true,
	twitch_validate = true,
	journal_gradient_04 = true,
	unit_frame_portrait_sienna_unchained_masked = true,
	twitch_ammo = true,
	twitch_buff_4 = true,
	mask_rect_side_edge_fade = true,
	unit_frame_portrait_kruber_mercenary_twitch = true,
	options_menu_divider_glow_01 = true,
	buff_cooldown_gradient = true,
	career_witch_hunter_zealot = true,
	unit_frame_portrait_bardin_ranger = true,
	twitch_pow = true,
	career_emperor_poacher = true,
	twitch_icon_ammo = true,
	rect_masked = true,
	mission_objective_top = true,
	mission_objective_bottom = true,
	unit_frame_portrait_kruber_huntsman_twitch = true,
	default = true,
	buff_duration_gradient = true,
	unit_frame_portrait_kerillian_shade_masked = true,
	twitch_special_group_4 = true,
	gradient_item_rarity = true,
	twitch_bg = true,
	end_screen_effect_victory_2 = true,
	down_arrow = true,
	career_bright_wizard_melee = true,
	fatigue_icon_glow = true,
	unit_frame_portrait_victor_bountyhunter_twitch = true,
	unit_frame_portrait_kerillian_shade_twitch = true,
	teammate_hp_bar_color_tint_1 = true,
	twitch_special_group_2 = true,
	unit_frame_portrait_kruber_knight = true,
	unit_frame_portrait_kruber_huntsman = true,
	twitch_icon_heal = true,
	chest_reward_bar_progress = true,
	twitch_small_logo = true,
	mission_map_mask_fort = true,
	hud_ability_bg = true,
	player_hp_bar = true,
	loot_presentation_circle_glow_exotic = true,
	gamepad_difficulty_banner_1 = true,
	loot_presentation_circle_glow_promo_large = true,
	tabs_glow_animated = true,
	karak_azgaraz_location_icon_banner = true,
	mission_map_mask_ussingen = true,
	unit_frame_portrait_kerillian_waywatcher = true,
	gamepad_difficulty_banner_3 = true,
	loot_presentation_circle_glow_rare_large = true,
	ability_outer_effect_1 = true,
	unit_frame_portrait_kerillian_waywatcher_twitch = true,
	overcharge_bar_1 = true,
	overcharge_bar_3 = true,
	unit_frame_portrait_bardin_ironbreaker_masked = true,
	twitch_healing_draught = true,
	end_screen_banner_defeat = true,
	gradient_friend_list = true,
	gradient_enchantment_craft = true,
	unit_frame_portrait_bardin_slayer = true,
	pc_input_overlay = true,
	player_hp_bar_color_tint = true
}
local ui_atlas_setting_tables = {
	gui_startup_settings_atlas = startup_settings_atlas,
	gui_items_atlas = items_atlas,
	gui_icons_atlas = icons_atlas,
	gui_loading_atlas = loading_atlas,
	gui_popup_atlas = popup_atlas,
	gui_hud_atlas = hud_atlas,
	gui_splash_atlas = splash_atlas,
	gui_game_logos_atlas = game_logos_atlas,
	gui_menu_buttons_atlas = menu_buttons_atlas,
	gui_chat_atlas = chat_atlas,
	gui_voice_chat_atlas = voice_chat_atlas,
	gui_settings_atlas = settings_atlas,
	gui_start_screen_atlas = start_screen_atlas,
	gui_map_locations_atlas = map_locations_atlas,
	gui_menus_atlas = menus_atlas,
	gui_frames_atlas = frames_atlas,
	gui_level_images_atlas = level_images_atlas
}
local masked_materials = {
	gui_menus_atlas = "gui_menus_atlas_masked",
	gui_settings_atlas = "gui_settings_atlas_masked",
	gui_frames_atlas = "gui_frames_atlas_masked",
	gui_hud_atlas = "gui_hud_atlas_masked",
	gui_start_screen_atlas = "gui_start_screen_atlas_masked",
	gui_icons_atlas = "gui_icons_atlas_masked",
	gui_items_atlas = "gui_items_atlas_masked",
	gui_map_locations_atlas = "gui_map_locations_atlas_masked"
}
local saturated_materials = {
	gui_menus_atlas = "gui_menus_atlas_saturated",
	gui_level_images_atlas = "gui_level_images_atlas_saturated",
	gui_icons_atlas = "gui_icons_atlas_saturated",
	gui_items_atlas = "gui_items_atlas_saturated",
	gui_menu_buttons_atlas = "gui_menu_buttons_atlas_saturated"
}
local masked_saturated_materials = {
	gui_icons_atlas = "gui_icons_atlas_masked_saturated"
}

if platform ~= "win32" then
	saturated_materials.gui_map_console_atlas = "gui_map_console_atlas_saturated"
end

local masked_point_sample_materials = {
	gui_menus_atlas = "gui_menus_atlas_point_sample_masked",
	gui_settings_atlas = "gui_settings_atlas_point_sample_masked",
	gui_frames_atlas = "gui_frames_atlas_point_sample_masked",
	gui_hud_atlas = "gui_hud_atlas_point_sample_masked",
	gui_start_screen_atlas = "gui_start_screen_atlas_point_sample_masked",
	gui_icons_atlas = "gui_icons_atlas_point_sample_masked",
	gui_items_atlas = "gui_items_atlas_point_sample_masked",
	gui_map_locations_atlas = "gui_map_locations_atlas_point_sample_masked"
}
local masked_saturated_point_sample_materials = {
	gui_icons_atlas = "gui_icons_atlas_point_sample_masked_saturated"
}
local point_sample_materials = {
	controller_image_xb1 = "controller_image_xb1_point_sample",
	gui_settings_atlas = "gui_settings_atlas_point_sample",
	gui_chat_atlas = "gui_chat_atlas_point_sample",
	gui_voice_chat_atlas = "gui_voice_chat_atlas_point_sample",
	gui_start_screen_atlas = "gui_start_screen_atlas_point_sample",
	overchargecircle_fill = "overchargecircle_fill_point_sample",
	gui_map_locations_atlas = "gui_map_locations_atlas_point_sample",
	gui_game_logos_atlas = "gui_game_logos_atlas_point_sample",
	gui_level_images_atlas = "gui_level_images_atlas_point_sample",
	loading_screen_default = "loading_screen_default_point_sample",
	overchargecircle_sidefade = "overchargecircle_fill_point_sample",
	loading_screen = "loading_screen_point_sample",
	end_screen_banner_victory = "end_screen_banner_victory_point_sample",
	gui_icons_atlas = "gui_icons_atlas_point_sample",
	end_screen_effect_victory_1 = "end_screen_effect_victory_1_point_sample",
	end_screen_effect_victory_2 = "end_screen_effect_victory_2_point_sample",
	end_screen_banner_defeat = "end_screen_banner_defeat_point_sample",
	vermintide_logo_transparent = "vermintide_logo_transparent_point_sample",
	gui_hud_atlas = "gui_hud_atlas_point_sample",
	gui_popup_atlas = "gui_popup_atlas_point_sample",
	controller_hold_bar = "controller_hold_bar_point_sample",
	gui_frames_atlas = "gui_frames_atlas_point_sample",
	gui_menu_buttons_atlas = "gui_menu_buttons_atlas_point_sample",
	gui_menus_atlas = "gui_menus_atlas_point_sample",
	gui_loading_atlas = "gui_loading_atlas_point_sample",
	gui_startup_settings_atlas = "gui_startup_settings_atlas_point_sample",
	controller_image_ps4 = "controller_image_ps4_point_sample",
	gui_items_atlas = "gui_items_atlas_point_sample",
	gui_splash_atlas = "gui_splash_atlas_point_sample"
}
local offscreen_materials = {
	gui_menus_atlas = "gui_menus_atlas_offscreen",
	gui_icons_atlas = "gui_icons_atlas_offscreen",
	gui_items_atlas = "gui_items_atlas_offscreen",
	gui_frames_atlas = "gui_frames_atlas_offscreen"
}
local masked_offscreen_materials = {
	gui_menus_atlas = "gui_menus_atlas_masked_offscreen",
	gui_icons_atlas = "gui_icons_atlas_masked_offscreen",
	gui_items_atlas = "gui_items_atlas_masked_offscreen",
	gui_frames_atlas = "gui_frames_atlas_masked_offscreen"
}
local masked_point_sample_offscreen_materials = {
	gui_menus_atlas = "gui_menus_atlas_point_sample_masked_offscreen",
	gui_icons_atlas = "gui_icons_atlas_point_sample_masked_offscreen",
	gui_items_atlas = "gui_items_atlas_point_sample_masked_offscreen",
	gui_frames_atlas = "gui_frames_atlas_point_sample_masked_offscreen"
}
local point_sample_offscreen_materials = {
	gui_menus_atlas = "gui_menus_atlas_point_sample_offscreen",
	gui_icons_atlas = "gui_icons_atlas_point_sample_offscreen",
	gui_items_atlas = "gui_items_atlas_point_sample_offscreen",
	gui_frames_atlas = "gui_frames_atlas_point_sample_offscreen"
}
local saturated_offscreen_materials = {
	gui_items_atlas = "gui_items_atlas_saturated",
	gui_icons_atlas = "gui_icons_atlas_saturated"
}

if platform ~= "win32" then
end

local ui_atlas_settings = {}

for material, material_settings in pairs(ui_atlas_setting_tables) do
	for texture_name, texture_settings in pairs(material_settings) do
		local settings = table.clone(texture_settings)
		settings.material_name = material
		settings.masked_material_name = masked_materials[material]
		settings.point_sample_material_name = point_sample_materials[material]
		settings.masked_point_sample_material_name = masked_point_sample_materials[material]
		settings.saturated_material_name = saturated_materials[material]
		settings.masked_saturated_material_name = masked_saturated_materials[material]
		settings.masked_saturated_point_sample_material_name = masked_saturated_point_sample_materials[material]
		settings.offscreen_material_name = offscreen_materials[material]
		settings.masked_offscreen_material_name = masked_offscreen_materials[material]
		settings.masked_point_sample_offscreen_material_name = masked_point_sample_offscreen_materials[material]
		settings.point_sample_offscreen_material_name = point_sample_offscreen_materials[material]
		settings.saturated_offscreen_material_name = saturated_offscreen_materials[material]
		local existing_material_name = ui_atlas_settings[texture_name] and ui_atlas_settings[texture_name].material_name

		fassert(ui_atlas_settings[texture_name] == nil, "[UIAtlasHelper] - Texture (%s) in material (%s) already exist in material (%s). Make sure to use unique texture names.", texture_name, material, existing_material_name)

		ui_atlas_settings[texture_name] = settings
	end
end

UIAtlasHelper.has_atlas_settings_by_texture_name = function (texture_name)
	return (ui_atlas_settings[texture_name] and true) or false
end
UIAtlasHelper.get_atlas_settings_by_texture_name = function (texture_name)
	assert(texture_name, "[UIAtlasHelper] - Trying to access atlas settings for a texture without a name")

	if none_atlas_textures[texture_name] then
		return 
	end

	local texture_settings = ui_atlas_settings[texture_name]

	assert(texture_settings, "[UIAtlasHelper] - Atlas texture settings for (%s) does not exist.", texture_name)

	return texture_settings
end
UIAtlasHelper.has_texture_by_name = function (texture_name)
	if none_atlas_textures[texture_name] or ui_atlas_settings[texture_name] then
		return true
	end

	return false
end

return 
