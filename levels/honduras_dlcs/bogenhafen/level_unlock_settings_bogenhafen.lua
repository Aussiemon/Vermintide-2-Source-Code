-- chunkname: @levels/honduras_dlcs/bogenhafen/level_unlock_settings_bogenhafen.lua

AreaSettings.bogenhafen = {
	description_text = "area_selection_bogenhafen_description",
	display_name = "area_selection_bogenhafen_name",
	dlc_name = "bogenhafen",
	level_image = "area_icon_bogenhafen",
	menu_sound_event = "Play_hud_menu_area_bogenhafen",
	name = "bogenhafen",
	sort_order = 9004,
	store_page_url = "https://store.steampowered.com/app/828790/Warhammer_Vermintide_2__Shadows_Over_Bgenhafen/",
	video_settings = {
		material_name = "area_video_bogenhafen",
		resource = "video/area_videos/bogenhafen/area_video_bogenhafen",
	},
	acts = {
		"act_bogenhafen",
	},
	create_mission_background_widget = function ()
		local widget = {
			scenegraph_id = "dlc_background",
			element = {
				passes = {
					{
						pass_type = "tiled_texture",
						style_id = "background",
						texture_id = "background",
					},
					{
						pass_type = "texture",
						style_id = "net_right",
						texture_id = "net_right",
					},
					{
						pass_type = "texture",
						style_id = "net_left",
						texture_id = "net_left",
					},
					{
						pass_type = "texture",
						style_id = "rope",
						texture_id = "rope",
					},
					{
						pass_type = "texture",
						style_id = "seaweed_big",
						texture_id = "seaweed_big",
					},
					{
						content_id = "uv_seaweed_top",
						pass_type = "texture_uv",
						style_id = "uv_seaweed_top",
					},
					{
						content_id = "uv_seaweed_right",
						pass_type = "texture_uv",
						style_id = "uv_seaweed_right",
					},
					{
						pass_type = "texture",
						style_id = "seaweed_anim_1",
						texture_id = "seaweed_anim_1",
					},
					{
						pass_type = "texture",
						style_id = "seaweed_anim_2",
						texture_id = "seaweed_anim_2",
					},
					{
						pass_type = "texture",
						style_id = "seaweed_anim_3",
						texture_id = "seaweed_anim_3",
					},
				},
			},
			content = {
				background = "achievement_plank",
				net_left = "background_net_anim_02",
				net_right = "background_net_anim_01",
				rope = "background_rope",
				seaweed_anim_1 = "background_seaweed_anim_02",
				seaweed_anim_2 = "background_seaweed_anim_04",
				seaweed_anim_3 = "background_seaweed_anim_04",
				seaweed_big = "background_seaweed_01",
				uv_seaweed_top = {
					texture_id = "background_seaweed_01",
					uvs = {
						{
							0,
							0.7,
						},
						{
							1,
							1,
						},
					},
				},
				uv_seaweed_right = {
					texture_id = "background_seaweed_01",
					uvs = {
						{
							0,
							0,
						},
						{
							0.3,
							1,
						},
					},
				},
			},
			style = {
				background = {
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
					texture_tiling_size = {
						307,
						200,
					},
				},
				net_left = {
					horizontal_alignment = "center",
					vertical_alignment = "top",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						-380,
						4,
						2,
					},
					texture_size = {
						256,
						512,
					},
				},
				net_right = {
					horizontal_alignment = "center",
					vertical_alignment = "top",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						325,
						8,
						2,
					},
					texture_size = {
						256,
						512,
					},
				},
				rope = {
					horizontal_alignment = "center",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						10,
						-20,
						3,
					},
					texture_size = {
						596,
						113,
					},
				},
				seaweed_big = {
					horizontal_alignment = "center",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						-170,
						0,
						1,
					},
					texture_size = {
						228,
						184,
					},
				},
				seaweed_anim_1 = {
					horizontal_alignment = "center",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						40,
						-100,
						1,
					},
					texture_size = {
						128,
						256,
					},
				},
				seaweed_anim_2 = {
					horizontal_alignment = "center",
					vertical_alignment = "center",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						-48,
						-120,
						1,
					},
					texture_size = {
						128,
						128,
					},
				},
				seaweed_anim_3 = {
					horizontal_alignment = "left",
					vertical_alignment = "center",
					color = {
						255,
						200,
						200,
						200,
					},
					offset = {
						-20,
						-130,
						1,
					},
					texture_size = {
						128,
						128,
					},
				},
				uv_seaweed_top = {
					horizontal_alignment = "center",
					vertical_alignment = "top",
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						-20,
						-7,
						1,
					},
					texture_size = {
						228,
						55.199999999999996,
					},
				},
				uv_seaweed_right = {
					horizontal_alignment = "right",
					vertical_alignment = "center",
					color = {
						255,
						200,
						200,
						200,
					},
					offset = {
						0,
						0,
						1,
					},
					texture_size = {
						68.39999999999999,
						184,
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
ActSettings.act_bogenhafen = {
	banner_texture = "menu_frame_bg_01",
	console_offset = 350,
	display_name = "area_selection_bogenhafen_name",
	sorting = 2,
}
