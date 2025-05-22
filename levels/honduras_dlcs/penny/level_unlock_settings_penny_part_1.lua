-- chunkname: @levels/honduras_dlcs/penny/level_unlock_settings_penny_part_1.lua

AreaSettings.penny = {
	description_text = "area_selection_penny_description",
	display_name = "area_selection_penny_name",
	dlc_name = "penny",
	level_image = "area_icon_drachenfels",
	long_description_text = "area_selection_penny_description_long",
	menu_sound_event = "Play_hud_menu_area_drachenfels",
	name = "penny",
	sort_order = 2,
	store_page_url = "https://store.steampowered.com/app/552500/Warhammer_Vermintide_2/",
	video_settings = {
		material_name = "area_video_bogenhafen",
		resource = "video/area_videos/penny/area_video_penny",
	},
	acts = {
		"act_penny",
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
					{
						pass_type = "texture",
						style_id = "banner_left",
						texture_id = "banner",
					},
					{
						pass_type = "texture",
						style_id = "banner_right",
						texture_id = "banner",
					},
					{
						pass_type = "texture",
						style_id = "banner_holder_left",
						texture_id = "banner_holder",
					},
					{
						pass_type = "texture",
						style_id = "banner_holder_right",
						texture_id = "banner_holder",
					},
				},
			},
			content = {
				banner = "area_selection_banner_drachenfels",
				banner_holder = "area_selection_banner_head_drachenfels",
				background = {
					texture_id = "area_selection_drachenfels",
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
				banner_left = {
					horizontal_alignment = "left",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						-30,
						-25,
						1,
					},
					texture_size = {
						256,
						512,
					},
				},
				banner_right = {
					horizontal_alignment = "right",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						30,
						-25,
						1,
					},
					texture_size = {
						256,
						512,
					},
				},
				banner_holder_left = {
					horizontal_alignment = "left",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						25,
						200,
						2,
					},
					texture_size = {
						147,
						152,
					},
				},
				banner_holder_right = {
					horizontal_alignment = "right",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						-25,
						200,
						2,
					},
					texture_size = {
						147,
						152,
					},
				},
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
						0,
						0,
						0,
					},
					texture_size = {
						1060,
						699,
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
ActSettings.act_penny = {
	banner_texture = "menu_frame_bg_01",
	console_offset = 320,
	display_name = "area_selection_penny_name",
	sorting = 2,
}
