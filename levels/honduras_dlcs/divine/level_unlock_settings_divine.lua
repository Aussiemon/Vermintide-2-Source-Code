-- chunkname: @levels/honduras_dlcs/divine/level_unlock_settings_divine.lua

AreaSettings.divine = {
	description_text = "area_selection_divine_description",
	display_name = "area_selection_divine_name",
	dlc_name = "divine",
	level_image = "area_icon_divine",
	long_description_text = "area_selection_divine_description_long",
	menu_sound_event = "Play_hud_menu_area_dlc_reikwald_river",
	name = "divine",
	sort_order = 6,
	video_settings = {
		material_name = "area_video_divine",
		resource = "video/area_videos/divine/area_video_divine",
	},
	acts = {
		"act_divine",
	},
}
ActSettings.act_divine = {
	banner_texture = "menu_frame_bg_01",
	console_offset = 100,
	sorting = 2,
}
