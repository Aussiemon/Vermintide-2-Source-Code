AreaSettings.bogenhafen = {
	menu_sound_event = "Play_hud_menu_area_bogenhafen",
	name = "bogenhafen",
	display_name = "area_selection_bogenhafen_name",
	description_text = "area_selection_bogenhafen_description",
	store_page_url = "https://store.steampowered.com/app/828790/Warhammer_Vermintide_2__Shadows_Over_Bgenhafen/",
	level_image = "area_icon_bogenhafen",
	dlc_name = "bogenhafen",
	sort_order = 9004,
	video_settings = {
		material_name = "area_video_bogenhafen",
		resource = "video/area_videos/bogenhafen/area_video_bogenhafen"
	},
	acts = {
		"act_bogenhafen"
	},
	create_mission_background_widget = function ()
		local widget = {
			scenegraph_id = "dlc_background",
			element = {
				passes = {
					{
						texture_id = "background",
						style_id = "background",
						pass_type = "tiled_texture"
					},
					{
						texture_id = "net_right",
						style_id = "net_right",
						pass_type = "texture"
					},
					{
						texture_id = "net_left",
						style_id = "net_left",
						pass_type = "texture"
					},
					{
						texture_id = "rope",
						style_id = "rope",
						pass_type = "texture"
					},
					{
						texture_id = "seaweed_big",
						style_id = "seaweed_big",
						pass_type = "texture"
					},
					{
						style_id = "uv_seaweed_top",
						pass_type = "texture_uv",
						content_id = "uv_seaweed_top"
					},
					{
						style_id = "uv_seaweed_right",
						pass_type = "texture_uv",
						content_id = "uv_seaweed_right"
					},
					{
						texture_id = "seaweed_anim_1",
						style_id = "seaweed_anim_1",
						pass_type = "texture"
					},
					{
						texture_id = "seaweed_anim_2",
						style_id = "seaweed_anim_2",
						pass_type = "texture"
					},
					{
						texture_id = "seaweed_anim_3",
						style_id = "seaweed_anim_3",
						pass_type = "texture"
					}
				}
			},
			content = {
				net_right = "background_net_anim_01",
				net_left = "background_net_anim_02",
				seaweed_anim_2 = "background_seaweed_anim_04",
				seaweed_anim_1 = "background_seaweed_anim_02",
				seaweed_big = "background_seaweed_01",
				seaweed_anim_3 = "background_seaweed_anim_04",
				background = "achievement_plank",
				rope = "background_rope",
				uv_seaweed_top = {
					texture_id = "background_seaweed_01",
					uvs = {
						{
							0,
							0.7
						},
						{
							1,
							1
						}
					}
				},
				uv_seaweed_right = {
					texture_id = "background_seaweed_01",
					uvs = {
						{
							0,
							0
						},
						{
							0.3,
							1
						}
					}
				}
			},
			style = {
				background = {
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						0,
						0,
						0
					},
					texture_tiling_size = {
						307,
						200
					}
				},
				net_left = {
					vertical_alignment = "top",
					horizontal_alignment = "center",
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						-380,
						4,
						2
					},
					texture_size = {
						256,
						512
					}
				},
				net_right = {
					vertical_alignment = "top",
					horizontal_alignment = "center",
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						325,
						8,
						2
					},
					texture_size = {
						256,
						512
					}
				},
				rope = {
					vertical_alignment = "center",
					horizontal_alignment = "center",
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						10,
						-20,
						3
					},
					texture_size = {
						596,
						113
					}
				},
				seaweed_big = {
					vertical_alignment = "center",
					horizontal_alignment = "center",
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						-170,
						0,
						1
					},
					texture_size = {
						228,
						184
					}
				},
				seaweed_anim_1 = {
					vertical_alignment = "center",
					horizontal_alignment = "center",
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						40,
						-100,
						1
					},
					texture_size = {
						128,
						256
					}
				},
				seaweed_anim_2 = {
					vertical_alignment = "center",
					horizontal_alignment = "center",
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						-48,
						-120,
						1
					},
					texture_size = {
						128,
						128
					}
				},
				seaweed_anim_3 = {
					vertical_alignment = "center",
					horizontal_alignment = "left",
					color = {
						255,
						200,
						200,
						200
					},
					offset = {
						-20,
						-130,
						1
					},
					texture_size = {
						128,
						128
					}
				},
				uv_seaweed_top = {
					vertical_alignment = "top",
					horizontal_alignment = "center",
					color = {
						255,
						255,
						255,
						255
					},
					offset = {
						-20,
						-7,
						1
					},
					texture_size = {
						228,
						55.199999999999996
					}
				},
				uv_seaweed_right = {
					vertical_alignment = "center",
					horizontal_alignment = "right",
					color = {
						255,
						200,
						200,
						200
					},
					offset = {
						0,
						0,
						1
					},
					texture_size = {
						68.39999999999999,
						184
					}
				}
			},
			offset = {
				0,
				0,
				0
			}
		}

		return widget
	end
}
ActSettings.act_bogenhafen = {
	banner_texture = "menu_frame_bg_01",
	sorting = 2,
	display_name = "area_selection_bogenhafen_name",
	console_offset = 350
}
