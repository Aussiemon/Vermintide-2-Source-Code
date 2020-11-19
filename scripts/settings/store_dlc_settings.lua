StoreDlcSettings = {
	{
		dlc_name = "cog",
		name = "store_cog_title",
		store_texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
		information_text = "store_cog_desc",
		store_page_url = "https://store.steampowered.com/app/1443780",
		slideshow_texture = "store_slideshow_dlc_cog",
		slideshow_text = "store_cog_desc",
		store_banner_texture_paths = "gui/1080p/single_textures/dlc_store/cog/dlc_store_banner_cog",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_helmgart",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/bardin/dr_engineer"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_logo_cog"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_cog_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					text = "dlc_cog_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_helmgart",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/bardin/dr_engineer"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_logo_cog"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_cog_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					text = "dlc_cog_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_cog_upgrade_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_cog_upgrade_slate_05_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_05",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_upgrade_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				id = "dlc_feature_8",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_upgrade_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				id = "dlc_feature_9",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_upgrade_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		}
	},
	{
		information_text = "store_cog_upgrade_desc",
		name = "store_cog_upgrade_title",
		store_page_url = "https://store.steampowered.com/app/1443790",
		store_texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
		disable_on_consoles = true,
		dlc_name = "cog_upgrade",
		slideshow_texture = "store_slideshow_dlc_cog",
		slideshow_text = "store_cog_upgrade_slideshow_desc",
		store_banner_texture_paths = "gui/1080p/single_textures/dlc_store/cog/dlc_store_banner_cog_upgrade",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_helmgart",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/bardin/dr_engineer"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_logo_cog"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_cog_upgrade_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_cog_upgrade_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_cog_upgrade_slate_05_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_05",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_upgrade_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_upgrade_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_cog_upgrade_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		}
	},
	{
		dlc_name = "lake",
		name = "store_lake_title",
		store_texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
		information_text = "store_lake_desc",
		store_page_url = "https://store.steampowered.com/app/1343500",
		slideshow_texture = "store_slideshow_dlc_lake",
		slideshow_text = "store_lake_desc",
		store_banner_texture_paths = "gui/1080p/single_textures/dlc_store/lake/dlc_store_banner_lake",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_helmgart",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kruber/es_questingknight"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_logo_lake"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_lake_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					text = "dlc_lake_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_helmgart",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kruber/es_questingknight"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_logo_lake"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_lake_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					text = "dlc_lake_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_lake_upgrade_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_lake_upgrade_slate_05_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_05",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_upgrade_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				id = "dlc_feature_8",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_upgrade_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				id = "dlc_feature_9",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_upgrade_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		}
	},
	{
		information_text = "store_lake_upgrade_desc",
		name = "store_lake_upgrade_title",
		store_page_url = "https://store.steampowered.com/app/1345990",
		store_texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
		disable_on_consoles = true,
		dlc_name = "lake_upgrade",
		slideshow_texture = "store_slideshow_dlc_lake",
		slideshow_text = "store_lake_upgrade_slideshow_desc",
		store_banner_texture_paths = "gui/1080p/single_textures/dlc_store/lake/dlc_store_banner_lake_upgrade",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_helmgart",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kruber/es_questingknight"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_logo_lake_upgrade"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_lake_upgrade_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_lake_upgrade_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_lake_upgrade_slate_05_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_05",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_upgrade_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_upgrade_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_lake_upgrade_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		}
	},
	{
		dlc_name = "scorpion",
		name = "store_wom_title",
		store_texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
		information_text = "store_wom_desc",
		store_page_url = "https://store.steampowered.com/app/1033060/Warhammer_Vermintide_2__Winds_of_Magic/",
		slideshow_texture = "store_slideshow_dlc_wom",
		slideshow_text = "store_wom_slideshow_desc",
		store_banner_texture_paths = "gui/1080p/single_textures/dlc_store/wom/dlc_store_banner_wom",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_ubersreik",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/scorpion/area_video_scorpion"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/dlc_store_logo_wom"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_wom_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_wom_slate_05_description",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_05",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					text = "dlc_wom_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_wom_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_wom_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_wom_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "spacing"
			},
			{
				id = "weave_title_logo",
				type = "dlc_logo",
				settings = {
					alignment = "center",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_06",
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_size = {
						491,
						89
					}
				}
			},
			{
				type = "body_text",
				settings = {
					text = "start_game_window_weave_title",
					font_size = 52,
					localize = true,
					alignment = "center",
					height_offset = 34,
					font_type = "hell_shark_header_masked"
				}
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_new_game_mode",
					localize = true,
					alignment = "center"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "dlc_wom_slate_06_description",
					localize = true,
					alignment = "center"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_pullet_point",
				settings = {
					text = "dlc_wom_slate_07_description",
					localize = true,
					alignment = "left"
				}
			},
			{
				id = "dlc_feature_8",
				type = "dlc_feature_pullet_point",
				settings = {
					text = "dlc_wom_slate_08_description",
					localize = true,
					alignment = "left"
				}
			},
			{
				id = "dlc_feature_9",
				type = "dlc_feature_pullet_point",
				settings = {
					text = "dlc_wom_slate_09_description",
					localize = true,
					alignment = "left"
				}
			},
			{
				id = "dlc_feature_10",
				type = "dlc_feature_pullet_point",
				settings = {
					text = "dlc_wom_slate_10_description",
					localize = true,
					alignment = "left"
				}
			},
			{
				id = "dlc_feature_11",
				type = "dlc_feature_pullet_point",
				settings = {
					text = "dlc_wom_slate_11_description",
					localize = true,
					alignment = "left"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		}
	},
	{
		dlc_name = "holly",
		name = "store_ubersreik_title",
		store_texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly",
		information_text = "store_ubersreik_desc",
		store_page_url = "https://store.steampowered.com/app/975400/Warhammer_Vermintide_2__Back_to_Ubersreik/",
		slideshow_texture = "store_slideshow_dlc_btu",
		slideshow_text = "store_ubersreik_slideshow_desc",
		store_banner_texture_paths = "gui/1080p/single_textures/dlc_store/holly/dlc_store_banner_holly",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_ubersreik",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/holly/area_video_holly"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly",
					texture_path = "gui/1080p/single_textures/dlc_store/holly/dlc_store_logo_holly"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_ubersreik_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_ubersreik_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/holly/slate_ubersreik_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_ubersreik_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/holly/slate_ubersreik_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_ubersreik_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/holly/slate_ubersreik_03",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		}
	},
	{
		dlc_name = "bogenhafen",
		name = "store_bogenhafen_title",
		store_texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen",
		information_text = "store_bogenhafen_desc",
		store_page_url = "https://store.steampowered.com/app/828790/Warhammer_Vermintide_2__Shadows_Over_Bgenhafen/",
		slideshow_texture = "store_slideshow_dlc_bgh",
		slideshow_text = "store_bogenhafen_slideshow_desc",
		store_banner_texture_paths = "gui/1080p/single_textures/dlc_store/bogenhafen/dlc_store_banner_bogenhafen",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_bogenhafen",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/bogenhafen/area_video_bogenhafen"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen",
					texture_path = "gui/1080p/single_textures/dlc_store/bogenhafen/dlc_store_logo_bogenhafen"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_bogenhafen_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_bogenhafen_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/bogenhafen/slate_bgh_01",
					localize = true,
					alignment = "center",
					texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_bogenhafen_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/bogenhafen/slate_bgh_02",
					localize = true,
					alignment = "center",
					texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen"
				}
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_bogenhafen_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/bogenhafen/slate_bgh_03",
					localize = true,
					alignment = "center",
					texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		}
	},
	{
		dlc_name = "pre_order",
		name = "store_premium_edition_title",
		store_texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
		information_text = "store_premium_edition_desc",
		store_page_url = "https://store.steampowered.com/app/737040/Warhammer_Vermintide_2__Collectors_Edition_Upgrade/",
		slideshow_texture = "store_slideshow_dlc_premium",
		slideshow_text = "store_premium_edition_slideshow_desc",
		store_banner_texture_paths = "gui/1080p/single_textures/dlc_store/premium/dlc_store_banner_premium",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_helmgart",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/helmgart/area_video_helmgart"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/dlc_store_logo_premium"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_premium_edition_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_01_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_01",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_06_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_06",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_premium_edition_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_03",
					localize = true,
					alignment = "center",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_05_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_05",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_07_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_07",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_02_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_02",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				type = "body_text",
				settings = {
					text = "dlc_premium_edition_additional_information",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					sound_event = "Play_hud_menu_area_helmgart",
					set_loop = true,
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/helmgart/area_video_helmgart"
				}
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/dlc_store_logo_premium"
				}
			},
			{
				type = "body_text",
				settings = {
					text = "store_premium_edition_desc",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			},
			{
				type = "spacing"
			},
			{
				type = "header_text",
				settings = {
					text = "menu_store_dlc_title_including",
					localize = true
				}
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_07_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_07",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_06_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_06",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical",
				settings = {
					text = "dlc_premium_edition_slate_04_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_04",
					localize = true,
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				type = "spacing"
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical_long",
				settings = {
					text = "dlc_premium_edition_slate_03_description",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_03",
					localize = true,
					alignment = "center",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium"
				}
			},
			{
				type = "spacing"
			},
			{
				type = "body_text",
				settings = {
					text = "dlc_premium_edition_additional_information",
					localize = true
				}
			},
			{
				type = "spacing"
			},
			{
				type = "divider_horizontal"
			}
		}
	}
}
StoreDlcSettingsByName = {}

for _, settings in ipairs(StoreDlcSettings) do
	StoreDlcSettingsByName[settings.dlc_name] = settings
end

return
