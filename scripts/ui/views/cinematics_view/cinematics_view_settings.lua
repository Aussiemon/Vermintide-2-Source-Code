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
CinematicsViewSettings = {
	{
		{
			description = "menu_cinematics_vermintide_description",
			release_date = "2015/10/21",
			time = "01:42",
			header = "menu_cinematics_vermintide_title",
			thumbnail = "vermintide_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_1_release_trailer",
				resource = "video/vermintide_intro",
				subtitle_template_settings = vermintide_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_honduras_description",
			release_date = "2018/03/08",
			time = "04:55",
			header = "menu_cinematics_honduras_title",
			thumbnail = "honduras_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_release_trailer",
				resource = "video/vermintide_2_release_trailer"
			}
		},
		{
			description = "menu_cinematics_prologue_description",
			release_date = "2018/03/08",
			time = "01:43",
			header = "menu_cinematics_prologue_title",
			thumbnail = "prologue_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_prologue_intro_cinematic",
				frames_per_second = 24,
				resource = "video/vermintide_2_prologue_intro",
				subtitle_template_settings = prologue_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_bogenhafen_description",
			release_date = "2018/08/28",
			time = "02:56",
			header = "menu_cinematics_bogenhafen_title",
			thumbnail = "bogenhafen_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_bogenhafen_intro",
				resource = "video/vermintide_2_bogenhafen_intro",
				subtitle_template_settings = bogenhafen_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_holly_description",
			release_date = "2018/12/10",
			time = "00:48",
			header = "menu_cinematics_holly_title",
			thumbnail = "holly_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_ubersreik_intro",
				resource = "video/vermintide_2_ubersreik_intro"
			}
		},
		{
			description = "menu_cinematics_celebrate_description",
			release_date = "2019/03/08",
			time = "02:16",
			header = "menu_cinematics_celebrate_title",
			thumbnail = "celebrate_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_figurine_trailer",
				resource = "video/vermintide_2_figurine_trailer"
			}
		},
		{
			description = "menu_cinematics_scorpion_description",
			release_date = "2019/08/13",
			time = "02:07",
			header = "menu_cinematics_scorpion_title",
			thumbnail = "scorpion_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "cinematic_intro_wom",
				resource = "video/vermintide_2_wom_intro",
				subtitle_template_settings = wom_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_penny_description",
			release_date = "2020/01/23",
			time = "00:52",
			header = "menu_cinematics_penny_title",
			thumbnail = "penny_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "cinematic_intro_penny",
				resource = "video/vermintide_2_penny_intro",
				subtitle_template_settings = penny_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_lake_description",
			release_date = "2020/06/23",
			time = "02:21",
			header = "menu_cinematics_lake_title",
			thumbnail = "lake_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_lake_intro",
				resource = "video/vermintide_2_lake_intro"
			}
		},
		{
			description = "menu_cinematics_cog_description",
			release_date = "2020/11/19",
			time = "01:26",
			header = "menu_cinematics_cog_title",
			thumbnail = "cog_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_cog_intro",
				resource = "video/vermintide_2_cog_intro",
				subtitle_template_settings = cog_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_morris_description",
			release_date = "2021/04/20",
			time = "01:59",
			header = "menu_cinematics_morris_title",
			thumbnail = "morris_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_MORRIS_INTRO_FINAL_AUDIO",
				resource = "video/vermintide_2_morris_intro",
				subtitle_template_settings = morris_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_woods_description",
			release_date = "2021/06/03",
			time = "01:56",
			header = "menu_cinematics_woods_title",
			thumbnail = "woods_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_woods_intro",
				resource = "video/vermintide_2_woods_intro",
				subtitle_template_settings = woods_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_bless_description",
			release_date = "2021/12/10",
			time = "01:39",
			header = "menu_cinematics_bless_title",
			thumbnail = "bless_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_bless_intro_trailer",
				resource = "video/vermintide_2_bless_intro",
				subtitle_template_settings = bless_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_belakor_description",
			release_date = "2022/06/14",
			time = "01:09",
			header = "menu_cinematics_belakor_title",
			thumbnail = "belakor_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_belakor_intro",
				resource = "video/vermintide_2_belakor_intro",
				subtitle_template_settings = belakor_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_trails_description",
			release_date = "2022/06/14",
			time = "01:11",
			header = "menu_cinematics_trails_title",
			thumbnail = "trails_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_trails_intro",
				resource = "video/vermintide_2_trails_intro",
				subtitle_template_settings = trails_intro_video_subtitle_settings
			}
		},
		category_name = "all"
	},
	{
		{
			description = "menu_cinematics_bogenhafen_description",
			release_date = "2018/08/28",
			time = "02:56",
			header = "menu_cinematics_bogenhafen_title",
			thumbnail = "bogenhafen_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_bogenhafen_intro",
				resource = "video/vermintide_2_bogenhafen_intro",
				subtitle_template_settings = bogenhafen_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_holly_description",
			release_date = "2018/12/10",
			time = "00:48",
			header = "menu_cinematics_holly_title",
			thumbnail = "holly_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_ubersreik_intro",
				resource = "video/vermintide_2_ubersreik_intro"
			}
		},
		{
			description = "menu_cinematics_scorpion_description",
			release_date = "2019/08/13",
			time = "02:07",
			header = "menu_cinematics_scorpion_title",
			thumbnail = "scorpion_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "cinematic_intro_wom",
				resource = "video/vermintide_2_wom_intro",
				subtitle_template_settings = wom_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_morris_description",
			release_date = "2021/04/20",
			time = "01:59",
			header = "menu_cinematics_morris_title",
			thumbnail = "morris_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_MORRIS_INTRO_FINAL_AUDIO",
				resource = "video/vermintide_2_morris_intro",
				subtitle_template_settings = morris_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_penny_description",
			release_date = "2020/01/23",
			time = "00:52",
			header = "menu_cinematics_penny_title",
			thumbnail = "penny_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "cinematic_intro_penny",
				resource = "video/vermintide_2_penny_intro",
				subtitle_template_settings = penny_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_belakor_description",
			release_date = "2022/06/14",
			time = "01:09",
			header = "menu_cinematics_belakor_title",
			thumbnail = "belakor_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_belakor_intro",
				resource = "video/vermintide_2_belakor_intro",
				subtitle_template_settings = belakor_intro_video_subtitle_settings
			}
		},
		category_name = "additional_content"
	},
	{
		{
			description = "menu_cinematics_lake_description",
			release_date = "2020/06/23",
			time = "02:21",
			header = "menu_cinematics_lake_title",
			thumbnail = "lake_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_lake_intro",
				resource = "video/vermintide_2_lake_intro"
			}
		},
		{
			description = "menu_cinematics_cog_description",
			release_date = "2020/11/19",
			time = "01:26",
			header = "menu_cinematics_cog_title",
			thumbnail = "cog_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_cog_intro",
				resource = "video/vermintide_2_cog_intro",
				subtitle_template_settings = cog_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_woods_description",
			release_date = "2021/06/03",
			time = "01:56",
			header = "menu_cinematics_woods_title",
			thumbnail = "woods_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_woods_intro",
				resource = "video/vermintide_2_woods_intro",
				subtitle_template_settings = woods_intro_video_subtitle_settings
			}
		},
		{
			description = "menu_cinematics_bless_description",
			release_date = "2021/12/10",
			time = "01:39",
			header = "menu_cinematics_bless_title",
			thumbnail = "bless_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_bless_intro_trailer",
				resource = "video/vermintide_2_bless_intro",
				subtitle_template_settings = bless_intro_video_subtitle_settings
			}
		},
		category_name = "news_feed_career_title"
	},
	{
		{
			description = "menu_cinematics_honduras_description",
			release_date = "2018/03/08",
			time = "04:55",
			header = "menu_cinematics_honduras_title",
			thumbnail = "honduras_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_release_trailer",
				resource = "video/vermintide_2_release_trailer"
			}
		},
		{
			description = "menu_cinematics_celebrate_description",
			release_date = "2019/03/08",
			time = "02:16",
			header = "menu_cinematics_celebrate_title",
			thumbnail = "celebrate_thumbnail",
			video_data = {
				sound_stop = "Stop_all_cinematics",
				sound_start = "Play_vermintide_2_figurine_trailer",
				resource = "video/vermintide_2_figurine_trailer"
			}
		},
		category_name = "settings_view_header_misc"
	}
}
