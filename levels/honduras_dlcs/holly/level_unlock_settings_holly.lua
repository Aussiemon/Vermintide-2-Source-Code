-- chunkname: @levels/honduras_dlcs/holly/level_unlock_settings_holly.lua

AreaSettings.holly = {
	description_text = "area_selection_holly_description",
	display_name = "area_selection_holly_name",
	dlc_name = "holly",
	level_image = "area_icon_ubersreik",
	long_description_text = "area_selection_holly_description_long",
	menu_sound_event = "Play_hud_menu_area_ubersreik",
	name = "holly",
	sort_order = 9005,
	store_page_url = "https://store.steampowered.com/app/975400/Warhammer_Vermintide_2__Back_to_Ubersreik/",
	video_settings = {
		material_name = "area_video_holly",
		resource = "video/area_videos/holly/area_video_holly",
	},
	acts = {
		"act_holly",
	},
	create_mission_background_widget = function ()
		local widget = {
			scenegraph_id = "dlc_background",
			element = {
				passes = {
					{
						content_id = "background",
						pass_type = "texture_uv",
						style_id = "background",
					},
				},
			},
			content = {
				background = {
					texture_id = "background_ubersreik",
					uvs = {
						{
							1,
							0,
						},
						{
							0,
							1,
						},
					},
				},
			},
			style = {
				background = {
					horizontal_alignment = "center",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						3,
						0,
						0,
					},
					texture_size = {
						846,
						766,
					},
				},
			},
			offset = {
				0,
				0,
				0,
			},
		}

		return widget
	end,
}
ActSettings.act_holly = {
	banner_texture = "menu_frame_bg_01",
	console_offset = 175,
	display_name = "area_selection_holly_name",
	sorting = 2,
}
ActSettings.act_holly_final = {
	banner_texture = "menu_frame_bg_01",
	console_offset = 175,
	display_name = "area_selection_holly_name",
	sorting = 2,
}
