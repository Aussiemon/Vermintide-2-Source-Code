-- chunkname: @levels/honduras_dlcs/celebrate/level_unlock_settings_celebrate.lua

AreaSettings.celebrate = {
	description_text = "area_selection_bogenhafen_description",
	display_name = "area_selection_bogenhafen_name",
	dlc_name = "celebrate",
	exclude_from_area_selection = true,
	level_image = "area_icon_bogenhafen",
	menu_sound_event = "Play_hud_menu_area_bogenhafen",
	name = "celebrate",
	sort_order = 0,
	store_page_url = "https://store.steampowered.com/app/552500/Warhammer_Vermintide_2/",
	video_settings = {
		material_name = "area_video_bogenhafen",
		resource = "video/area_videos/bogenhafen/area_video_bogenhafen",
	},
	acts = {
		"act_celebrate",
	},
}
ActSettings.act_celebrate = {
	banner_texture = "menu_frame_bg_01",
	console_offset = 100,
	sorting = 2,
}
