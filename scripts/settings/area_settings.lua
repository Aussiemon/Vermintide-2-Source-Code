-- chunkname: @scripts/settings/area_settings.lua

AreaSettings = AreaSettings or {}
AreaSettings.helmgart = {
	description_text = "area_selection_helmgart_description",
	display_name = "area_selection_helmgart_name",
	level_image = "area_icon_helmgart",
	long_description_text = "area_selection_helmgart_description_long",
	menu_sound_event = "Play_hud_menu_area_helmgart",
	name = "helmgart",
	sort_order = 1,
	video_settings = {
		material_name = "area_video_helmgart",
		resource = "video/area_videos/helmgart/area_video_helmgart",
	},
	acts = {
		"act_1",
		"act_2",
		"act_3",
		"act_4",
	},
}
