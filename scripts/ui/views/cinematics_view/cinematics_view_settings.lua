-- chunkname: @scripts/ui/views/cinematics_view/cinematics_view_settings.lua

local vermintide_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_vermintide_intro")
local prologue_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_trailer")
local bogenhafen_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_bogenhafen_intro")
local penny_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_penny_intro")
local cog_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_cog_intro")
local morris_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_morris_intro")
local woods_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_woods_intro")
local bless_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_bless_intro")
local wom_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_wom_intro")
local belakor_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_belakor_intro")
local trails_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_trails_intro")
local tower_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_tower_intro")
local karak_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_karak_intro")
local shovel_intro_video_subtitle_settings = local_require("scripts/ui/cutscene_overlay_templates/cutscene_template_shovel_intro")

CinematicsViewSettings = {
	{
		{
			description = "menu_cinematics_vermintide_description",
			header = "menu_cinematics_vermintide_title",
			release_date = "2015/10/21",
			thumbnail = "vermintide_thumbnail",
			time = "01:42",
			video_data = {
				resource = "video/vermintide_intro",
				sound_start = "Play_vermintide_1_release_trailer",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = vermintide_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_honduras_description",
			header = "menu_cinematics_honduras_title",
			release_date = "2018/03/08",
			thumbnail = "honduras_thumbnail",
			time = "04:55",
			video_data = {
				resource = "video/vermintide_2_release_trailer",
				sound_start = "Play_vermintide_2_release_trailer",
				sound_stop = "Stop_all_cinematics",
			},
		},
		{
			description = "menu_cinematics_prologue_description",
			header = "menu_cinematics_prologue_title",
			release_date = "2018/03/08",
			thumbnail = "prologue_thumbnail",
			time = "01:43",
			video_data = {
				frames_per_second = 24,
				resource = "video/vermintide_2_prologue_intro",
				sound_start = "Play_vermintide_2_prologue_intro_cinematic",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = prologue_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_bogenhafen_description",
			header = "menu_cinematics_bogenhafen_title",
			release_date = "2018/08/28",
			thumbnail = "bogenhafen_thumbnail",
			time = "02:56",
			video_data = {
				resource = "video/vermintide_2_bogenhafen_intro",
				sound_start = "Play_vermintide_2_bogenhafen_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = bogenhafen_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_holly_description",
			header = "menu_cinematics_holly_title",
			release_date = "2018/12/10",
			thumbnail = "holly_thumbnail",
			time = "00:48",
			video_data = {
				resource = "video/vermintide_2_ubersreik_intro",
				sound_start = "Play_vermintide_2_ubersreik_intro",
				sound_stop = "Stop_all_cinematics",
			},
		},
		{
			description = "menu_cinematics_celebrate_description",
			header = "menu_cinematics_celebrate_title",
			release_date = "2019/03/08",
			thumbnail = "celebrate_thumbnail",
			time = "02:16",
			video_data = {
				resource = "video/vermintide_2_figurine_trailer",
				sound_start = "Play_vermintide_2_figurine_trailer",
				sound_stop = "Stop_all_cinematics",
			},
		},
		{
			description = "menu_cinematics_scorpion_description",
			header = "menu_cinematics_scorpion_title",
			release_date = "2019/08/13",
			thumbnail = "scorpion_thumbnail",
			time = "02:07",
			video_data = {
				resource = "video/vermintide_2_wom_intro",
				sound_start = "cinematic_intro_wom",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = wom_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_penny_description",
			header = "menu_cinematics_penny_title",
			release_date = "2020/01/23",
			thumbnail = "penny_thumbnail",
			time = "00:52",
			video_data = {
				resource = "video/vermintide_2_penny_intro",
				sound_start = "cinematic_intro_penny",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = penny_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_lake_description",
			header = "menu_cinematics_lake_title",
			release_date = "2020/06/23",
			thumbnail = "lake_thumbnail",
			time = "02:21",
			video_data = {
				resource = "video/vermintide_2_lake_intro",
				sound_start = "Play_vermintide_2_lake_intro",
				sound_stop = "Stop_all_cinematics",
			},
		},
		{
			description = "menu_cinematics_cog_description",
			header = "menu_cinematics_cog_title",
			release_date = "2020/11/19",
			thumbnail = "cog_thumbnail",
			time = "01:26",
			video_data = {
				resource = "video/vermintide_2_cog_intro",
				sound_start = "Play_vermintide_2_cog_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = cog_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_morris_description",
			header = "menu_cinematics_morris_title",
			release_date = "2021/04/20",
			thumbnail = "morris_thumbnail",
			time = "01:59",
			video_data = {
				resource = "video/vermintide_2_morris_intro",
				sound_start = "Play_MORRIS_INTRO_FINAL_AUDIO",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = morris_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_woods_description",
			header = "menu_cinematics_woods_title",
			release_date = "2021/06/03",
			thumbnail = "woods_thumbnail",
			time = "01:56",
			video_data = {
				resource = "video/vermintide_2_woods_intro",
				sound_start = "Play_vermintide_2_woods_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = woods_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_bless_description",
			header = "menu_cinematics_bless_title",
			release_date = "2021/12/10",
			thumbnail = "bless_thumbnail",
			time = "01:39",
			video_data = {
				resource = "video/vermintide_2_bless_intro",
				sound_start = "Play_vermintide_2_bless_intro_trailer",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = bless_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_belakor_description",
			header = "menu_cinematics_belakor_title",
			release_date = "2022/06/14",
			thumbnail = "belakor_thumbnail",
			time = "01:09",
			video_data = {
				resource = "video/vermintide_2_belakor_intro",
				sound_start = "Play_vermintide_2_belakor_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = belakor_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_trails_description",
			header = "menu_cinematics_trails_title",
			release_date = "2022/06/14",
			thumbnail = "trails_thumbnail",
			time = "01:11",
			video_data = {
				resource = "video/vermintide_2_trails_intro",
				sound_start = "Play_vermintide_2_trails_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = trails_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_tower_description",
			header = "menu_cinematics_tower_title",
			release_date = "2023/03/28",
			thumbnail = "tower_thumbnail",
			time = "01:27",
			video_data = {
				resource = "video/vermintide_2_tower_intro",
				sound_start = "Play_vermintide_2_tower_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = tower_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_karak_description",
			header = "menu_cinematics_karak_title",
			release_date = "2023/06/13",
			thumbnail = "karak_thumbnail",
			time = "01:33",
			video_data = {
				resource = "video/vermintide_2_karak_intro",
				sound_start = "Play_vermintide_2_karak_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = karak_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_shovel_description",
			header = "menu_cinematics_shovel_title",
			release_date = "2023/10/19",
			thumbnail = "shovel_thumbnail",
			time = "02:07",
			video_data = {
				resource = "video/vermintide_2_shovel_intro",
				sound_start = "Play_vermintide_2_shovel_intro_trailer",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = shovel_intro_video_subtitle_settings,
			},
		},
		{
			description = "carousel_intro_subtitle_01",
			header = "area_selection_carousel_name",
			release_date = "2024/11/13",
			thumbnail = "versus_thumbnail",
			time = "01:05",
			video_data = {
				resource = "video/vermintide_2_versus_trailer",
				sound_start = "Play_vermintide_2_versus_release_trailer",
				sound_stop = "Stop_all_cinematics",
			},
		},
		category_name = "all",
	},
	{
		{
			description = "menu_cinematics_bogenhafen_description",
			header = "menu_cinematics_bogenhafen_title",
			release_date = "2018/08/28",
			thumbnail = "bogenhafen_thumbnail",
			time = "02:56",
			video_data = {
				resource = "video/vermintide_2_bogenhafen_intro",
				sound_start = "Play_vermintide_2_bogenhafen_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = bogenhafen_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_holly_description",
			header = "menu_cinematics_holly_title",
			release_date = "2018/12/10",
			thumbnail = "holly_thumbnail",
			time = "00:48",
			video_data = {
				resource = "video/vermintide_2_ubersreik_intro",
				sound_start = "Play_vermintide_2_ubersreik_intro",
				sound_stop = "Stop_all_cinematics",
			},
		},
		{
			description = "menu_cinematics_scorpion_description",
			header = "menu_cinematics_scorpion_title",
			release_date = "2019/08/13",
			thumbnail = "scorpion_thumbnail",
			time = "02:07",
			video_data = {
				resource = "video/vermintide_2_wom_intro",
				sound_start = "cinematic_intro_wom",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = wom_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_morris_description",
			header = "menu_cinematics_morris_title",
			release_date = "2021/04/20",
			thumbnail = "morris_thumbnail",
			time = "01:59",
			video_data = {
				resource = "video/vermintide_2_morris_intro",
				sound_start = "Play_MORRIS_INTRO_FINAL_AUDIO",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = morris_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_penny_description",
			header = "menu_cinematics_penny_title",
			release_date = "2020/01/23",
			thumbnail = "penny_thumbnail",
			time = "00:52",
			video_data = {
				resource = "video/vermintide_2_penny_intro",
				sound_start = "cinematic_intro_penny",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = penny_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_belakor_description",
			header = "menu_cinematics_belakor_title",
			release_date = "2022/06/14",
			thumbnail = "belakor_thumbnail",
			time = "01:09",
			video_data = {
				resource = "video/vermintide_2_belakor_intro",
				sound_start = "Play_vermintide_2_belakor_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = belakor_intro_video_subtitle_settings,
			},
		},
		category_name = "additional_content",
	},
	{
		{
			description = "menu_cinematics_lake_description",
			header = "menu_cinematics_lake_title",
			release_date = "2020/06/23",
			thumbnail = "lake_thumbnail",
			time = "02:21",
			video_data = {
				resource = "video/vermintide_2_lake_intro",
				sound_start = "Play_vermintide_2_lake_intro",
				sound_stop = "Stop_all_cinematics",
			},
		},
		{
			description = "menu_cinematics_cog_description",
			header = "menu_cinematics_cog_title",
			release_date = "2020/11/19",
			thumbnail = "cog_thumbnail",
			time = "01:26",
			video_data = {
				resource = "video/vermintide_2_cog_intro",
				sound_start = "Play_vermintide_2_cog_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = cog_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_woods_description",
			header = "menu_cinematics_woods_title",
			release_date = "2021/06/03",
			thumbnail = "woods_thumbnail",
			time = "01:56",
			video_data = {
				resource = "video/vermintide_2_woods_intro",
				sound_start = "Play_vermintide_2_woods_intro",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = woods_intro_video_subtitle_settings,
			},
		},
		{
			description = "menu_cinematics_bless_description",
			header = "menu_cinematics_bless_title",
			release_date = "2021/12/10",
			thumbnail = "bless_thumbnail",
			time = "01:39",
			video_data = {
				resource = "video/vermintide_2_bless_intro",
				sound_start = "Play_vermintide_2_bless_intro_trailer",
				sound_stop = "Stop_all_cinematics",
				subtitle_template_settings = bless_intro_video_subtitle_settings,
			},
		},
		category_name = "news_feed_career_title",
	},
	{
		{
			description = "menu_cinematics_honduras_description",
			header = "menu_cinematics_honduras_title",
			release_date = "2018/03/08",
			thumbnail = "honduras_thumbnail",
			time = "04:55",
			video_data = {
				resource = "video/vermintide_2_release_trailer",
				sound_start = "Play_vermintide_2_release_trailer",
				sound_stop = "Stop_all_cinematics",
			},
		},
		{
			description = "menu_cinematics_celebrate_description",
			header = "menu_cinematics_celebrate_title",
			release_date = "2019/03/08",
			thumbnail = "celebrate_thumbnail",
			time = "02:16",
			video_data = {
				resource = "video/vermintide_2_figurine_trailer",
				sound_start = "Play_vermintide_2_figurine_trailer",
				sound_stop = "Stop_all_cinematics",
			},
		},
		category_name = "settings_view_header_misc",
	},
}
