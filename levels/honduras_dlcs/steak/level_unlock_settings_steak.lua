-- chunkname: @levels/honduras_dlcs/steak/level_unlock_settings_steak.lua

AreaSettings.scorpion = {
	description_text = "area_selection_scorpion_description",
	display_name = "area_selection_scorpion_name",
	dlc_name = "scorpion",
	level_image = "area_icon_wom",
	long_description_text = "area_selection_scorpion_description_long",
	menu_sound_event = "Play_hud_menu_area_crater",
	name = "scorpion",
	sort_order = 9006,
	store_page_url = "https://store.steampowered.com/app/1033060/Warhammer_Vermintide_2__Winds_of_Magic/",
	unlock_requirement_description = "scorpion_area_selection_unlock_requirements",
	video_settings = {
		material_name = "area_video_scorpion",
		resource = "video/area_videos/scorpion/area_video_scorpion",
	},
	acts = {
		"act_scorpion",
	},
	unlock_requirement_function = function (statistics_db, stats_id)
		if script_data.unlock_all_levels then
			return true
		end

		for _, level_key in pairs(HelmgartLevels) do
			if statistics_db:get_persistent_stat(stats_id, "completed_levels", level_key) < 1 then
				return false
			end
		end

		return true
	end,
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
					texture_id = "area_selection_wom",
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
						500,
						500,
					},
				},
			},
			offset = {
				0,
				40,
				0,
			},
		}

		return widget
	end,
}
ActSettings.act_scorpion = {
	banner_texture = "menu_frame_bg_01",
	console_offset = 175,
	display_name = "area_selection_scorpion_name",
	sorting = 2,
}
