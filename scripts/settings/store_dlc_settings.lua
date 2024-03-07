-- chunkname: @scripts/settings/store_dlc_settings.lua

StoreDlcSettings = {
	{
		dlc_name = "premium_career_bundle",
		information_text = "description_five_premium_career_bundle",
		name = "display_name_premium_career_bundle",
		prio = 10,
		show_in_slideshow = true,
		slideshow_text = "description_five_premium_career_bundle",
		slideshow_texture = "store_slideshow_dlc_premium_career_bundle",
		store_page_url = "https://store.steampowered.com/bundle/38849",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_premium_career_bundle",
		store_texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
		available_platforms = {
			"win32",
			"xb1",
			"ps4",
		},
		layout = {
			{
				id = "dlc_big_image",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_dlc_premium_career_bundle",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_five_premium_career_bundle",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_lake_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_banner_lake",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_cog_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_banner_cog",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_woods_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/dlc_store_banner_woods",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_bless_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/dlc_store_banner_bless",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_shovel_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/dlc_store_banner_shovel",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
		layout_console = {
			{
				id = "dlc_big_image",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_dlc_premium_career_bundle",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_five_premium_career_bundle",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_lake_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_banner_lake",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_cog_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_banner_cog",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_woods_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/dlc_store_banner_woods",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_bless_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/dlc_store_banner_bless",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_shovel_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/dlc_store_banner_shovel",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "premium_career_bundle_upgrade",
		information_text = "description_premium_career_bundle_upgrade",
		name = "display_name_premium_career_bundle_upgrade",
		prio = 10,
		show_in_slideshow = true,
		slideshow_text = "description_premium_career_bundle_upgrade",
		slideshow_texture = "store_slideshow_dlc_premium_career_bundle_upgrade",
		store_page_url = "https://store.steampowered.com/bundle/38850",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_premium_career_bundle_upgrade",
		store_texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
		available_platforms = {
			"win32",
		},
		layout = {
			{
				id = "dlc_big_image",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_dlc_premium_career_bundle_upgrade",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_premium_career_bundle_upgrade",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_lake_upgrade_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_banner_lake_upgrade",
				},
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_04_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_05_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_01_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_02_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_03_description",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_cog_upgrade_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_banner_cog_upgrade",
				},
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_04_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_05_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_01_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_02_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_03_description",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_woods_upgrade_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/dlc_store_banner_woods_upgrade",
				},
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_04_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_05_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_06_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_01_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_02_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_03_description",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_bless_upgrade_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/dlc_store_banner_bless_upgrade",
				},
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_04_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_05_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_06_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_01_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_02_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_03_description",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					add_frame = true,
					localize = true,
					text = "store_shovel_upgrade_desc",
					texture_package = "resource_packages/store/dlc_icons/premium_career_bundle/premium_career_bundle",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/dlc_store_banner_shovel_upgrade",
				},
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_03_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_04_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_05_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_02_description",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_03_description",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "five_career_bundle_0007",
		information_text = "description_five_career_bundle_0007",
		is_bundle = true,
		name = "display_name_five_career_bundle_0007",
		optional_dlc_display_name = "display_name_five_career_bundle_0007",
		optional_dlc_subtitle = "five_career_bundle_0001_subtitle",
		show_in_slideshow = true,
		slideshow_text = "description_five_career_bundle_0007",
		slideshow_texture = "store_slideshow_bundle_five_career_bundle_0007",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_five_career_bundle_0007",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_five_career_bundle_0007",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_five_career_bundle_0007",
		bundle_contains = {
			"skin_dr_slayer_1002",
			"slayer_hat_1005",
			"skin_ww_waywatcher_1002",
			"waywatcher_hat_1005",
			"skin_es_mercenary_1002",
			"mercenary_hat_1003",
			"skin_bw_scholar_1002",
			"scholar_hat_1004",
			"witchhunter_hat_1004",
			"skin_wh_captain_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
		layout_console = {
			{
				id = "dlc_logo",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/bundle_icons/store_item_icon_five_career_bundle_0007",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_five_career_bundle_0007",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_dr_slayer_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "slayer_hat_1005",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_slayer_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_slayer_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_ww_waywatcher_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "waywatcher_hat_1005",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_waywatcher_bundle_0001",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_waywatcher_bundle_0001",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_es_mercenary_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "mercenary_hat_1003",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_mercenary_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_mercenary_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_bw_scholar_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "scholar_hat_1004",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_scholar_bundle_0003",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_scholar_bundle_0003",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_wh_captain_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "witchhunter_hat_1004",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_witchhunter_bundle_0001",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_witchhunter_bundle_0001",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
		},
	},
	{
		dlc_name = "slayer_bundle_0002",
		information_text = "description_slayer_bundle_0002",
		is_bundle = true,
		name = "display_name_slayer_bundle_0002",
		optional_dlc_display_name = "display_name_slayer_bundle_0002",
		optional_dlc_subtitle = "dr_slayer",
		show_in_slideshow = true,
		slideshow_text = "description_slayer_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_slayer_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_slayer_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_slayer_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_slayer_bundle_0002",
		bundle_contains = {
			"skin_dr_slayer_1002",
			"slayer_hat_1005",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "waywatcher_bundle_0001",
		information_text = "description_waywatcher_bundle_0001",
		is_bundle = true,
		name = "display_name_waywatcher_bundle_0001",
		optional_dlc_display_name = "display_name_waywatcher_bundle_0001",
		optional_dlc_subtitle = "we_waywatcher",
		show_in_slideshow = true,
		slideshow_text = "description_waywatcher_bundle_0001",
		slideshow_texture = "store_slideshow_bundle_waywatcher_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_waywatcher_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_waywatcher_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_waywatcher_bundle_0001",
		bundle_contains = {
			"skin_ww_waywatcher_1002",
			"waywatcher_hat_1005",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "mercenary_bundle_0002",
		information_text = "description_mercenary_bundle_0002",
		is_bundle = true,
		name = "display_name_mercenary_bundle_0002",
		optional_dlc_display_name = "display_name_mercenary_bundle_0002",
		optional_dlc_subtitle = "es_mercenary",
		show_in_slideshow = true,
		slideshow_text = "description_mercenary_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_mercenary_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_mercenary_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_mercenary_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_mercenary_bundle_0002",
		bundle_contains = {
			"skin_es_mercenary_1002",
			"mercenary_hat_1003",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "scholar_bundle_0003",
		information_text = "description_scholar_bundle_0003",
		is_bundle = true,
		name = "display_name_scholar_bundle_0003",
		optional_dlc_display_name = "display_name_scholar_bundle_0003",
		optional_dlc_subtitle = "bw_scholar",
		show_in_slideshow = true,
		slideshow_text = "description_scholar_bundle_0003",
		slideshow_texture = "store_slideshow_bundle_scholar_bundle_0003",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_scholar_bundle_0003",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_scholar_bundle_0003",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_scholar_bundle_0003",
		bundle_contains = {
			"skin_bw_scholar_1002",
			"scholar_hat_1004",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "witchhunter_bundle_0001",
		information_text = "description_witchhunter_bundle_0001",
		is_bundle = true,
		name = "display_name_witchhunter_bundle_0001",
		optional_dlc_display_name = "display_name_witchhunter_bundle_0001",
		optional_dlc_subtitle = "wh_captain",
		show_in_slideshow = true,
		slideshow_text = "description_witchhunter_bundle_0001",
		slideshow_texture = "store_slideshow_bundle_witchhunter_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_witchhunter_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_witchhunter_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_witchhunter_bundle_0001",
		bundle_contains = {
			"skin_wh_captain_1002",
			"witchhunter_hat_1004",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "shovel",
		information_text = "store_shovel_desc",
		name = "store_shovel_title",
		slideshow_text = "store_shovel_desc",
		slideshow_texture = "store_slideshow_dlc_shovel",
		store_page_url = "https://store.steampowered.com/app/2585630",
		store_texture = "gui/1080p/single_textures/dlc_store/shovel/dlc_store_banner_shovel",
		store_texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/sienna/bw_necromancer",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/dlc_store_logo_shovel",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_shovel_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_shovel_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_shovel_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_shovel_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/sienna/bw_necromancer",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/dlc_store_logo_shovel",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_shovel_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_shovel_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_06",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_01",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "shovel_upgrade",
		information_text = "store_shovel_upgrade_desc",
		name = "store_shovel_upgrade_title",
		slideshow_text = "store_shovel_upgrade_desc",
		slideshow_texture = "store_slideshow_dlc_shovel_upgrade",
		store_page_url = "https://store.steampowered.com/app/2585640",
		store_texture = "gui/1080p/single_textures/dlc_store/shovel/dlc_store_banner_shovel_upgrade",
		store_texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
		available_platforms = {
			"win32",
		},
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/sienna/bw_necromancer",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/dlc_store_logo_shovel",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_shovel_upgrade_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_06",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_shovel_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_01",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/shovel/store_dlc_icons_shovel",
					texture_path = "gui/1080p/single_textures/dlc_store/shovel/slate_shovel_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "q2_2023_hat_collection",
		information_text = "description_q2_2023_hat_collection",
		is_bundle = true,
		name = "display_name_q2_2023_hat_collection",
		optional_dlc_display_name = "display_name_q2_2023_hat_collection",
		optional_dlc_subtitle = "five_career_bundle_0001_subtitle",
		show_in_slideshow = true,
		slideshow_text = "description_q2_2023_hat_collection",
		slideshow_texture = "store_slideshow_bundle_five_career_bundle_0004",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q2_2023_hat_collection",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_q2_2023_hat_collection",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_q2_2023_hat_collection",
		bundle_contains = {
			"adept_hat_1003",
			"ironbreaker_hat_1005",
			"huntsman_hat_1003",
			"shade_hat_1004",
			"bountyhunter_hat_1004",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
		layout_console = {
			{
				id = "dlc_logo",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/bundle_icons/store_item_icon_q2_2023_hat_collection",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q2_2023_hat_collection",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						260,
						0,
					},
				},
			},
			{
				id = "adept_hat_1003",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_adept_hat_1003",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_adept_hat_1003",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						260,
						0,
					},
				},
			},
			{
				id = "ironbreaker_hat_1005",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_ironbreaker_hat_1005",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_ironbreaker_hat_1005",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						260,
						0,
					},
				},
			},
			{
				id = "huntsman_hat_1003",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_huntsman_hat_1003",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_huntsman_hat_1003",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						260,
						0,
					},
				},
			},
			{
				id = "shade_hat_1004",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_shade_hat_1004",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_shade_hat_1004",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						260,
						0,
					},
				},
			},
			{
				id = "bountyhunter_hat_1004",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_bountyhunter_hat_1004",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_bountyhunter_hat_1004",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
		},
	},
	{
		dlc_name = "adept_bundle_0002",
		information_text = "description_adept_bundle_0002",
		is_bundle = true,
		name = "display_name_adept_bundle_0002",
		optional_dlc_display_name = "display_name_adept_bundle_0002",
		optional_dlc_subtitle = "bw_adept",
		show_in_slideshow = true,
		slideshow_text = "description_adept_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_adept_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_adept_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_adept_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_adept_bundle_0002",
		bundle_contains = {
			"skin_bw_adept_1002",
			"adept_hat_1005",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "maidenguard_bundle_0003",
		information_text = "description_maidenguard_bundle_0003",
		is_bundle = true,
		name = "display_name_maidenguard_bundle_0003",
		optional_dlc_display_name = "display_name_maidenguard_bundle_0003",
		optional_dlc_subtitle = "we_maidenguard",
		show_in_slideshow = true,
		slideshow_text = "description_maidenguard_bundle_0003",
		slideshow_texture = "store_slideshow_bundle_maidenguard_bundle_0003",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_maidenguard_bundle_0003",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_maidenguard_bundle_0003",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_maidenguard_bundle_0003",
		bundle_contains = {
			"skin_ww_maidenguard_1002",
			"maidenguard_hat_1005",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "five_career_bundle_0005",
		information_text = "description_five_career_bundle_0005",
		is_bundle = true,
		name = "display_name_five_career_bundle_0005",
		optional_dlc_display_name = "display_name_five_career_bundle_0005",
		optional_dlc_subtitle = "five_career_bundle_0001_subtitle",
		show_in_slideshow = true,
		slideshow_text = "description_five_career_bundle_0005",
		slideshow_texture = "store_slideshow_bundle_five_career_bundle_0005",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_five_career_bundle_0005",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_five_career_bundle_0005",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_five_career_bundle_0005",
		bundle_contains = {
			"skin_dr_ranger_1002",
			"ranger_hat_1006",
			"skin_ww_shade_1002",
			"shade_hat_1003",
			"skin_es_knight_1002",
			"knight_hat_1002",
			"skin_bw_unchained_1002",
			"unchained_hat_1004",
			"bountyhunter_hat_1005",
			"skin_wh_bountyhunter_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
		layout_console = {
			{
				id = "dlc_logo",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/bundle_icons/store_item_icon_five_career_bundle_0005",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_five_career_bundle_0005",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_dr_ranger_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "ranger_hat_1006",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_ranger_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_ranger_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_ww_shade_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "shade_hat_1003",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_shade_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_shade_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_es_knight_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "knight_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_knight_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_knight_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_bw_unchained_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "unchained_hat_1004",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_unchained_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_unchained_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_wh_bountyhunter_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "bountyhunter_hat_1005",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_bountyhunter_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_bountyhunter_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
		},
	},
	{
		dlc_name = "ranger_bundle_0002",
		information_text = "description_ranger_bundle_0002",
		is_bundle = true,
		name = "display_name_ranger_bundle_0002",
		optional_dlc_display_name = "display_name_ranger_bundle_0002",
		optional_dlc_subtitle = "dr_ranger",
		show_in_slideshow = true,
		slideshow_text = "description_ranger_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_ranger_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_ranger_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_ranger_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_ranger_bundle_0002",
		bundle_contains = {
			"skin_dr_ranger_1002",
			"ranger_hat_1006",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "shade_bundle_0002",
		information_text = "description_shade_bundle_0002",
		is_bundle = true,
		name = "display_name_shade_bundle_0002",
		optional_dlc_display_name = "display_name_shade_bundle_0002",
		optional_dlc_subtitle = "we_shade",
		show_in_slideshow = true,
		slideshow_text = "description_shade_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_shade_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_shade_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_shade_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_shade_bundle_0002",
		bundle_contains = {
			"skin_ww_shade_1002",
			"shade_hat_1003",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "footknight_bundle_0002",
		information_text = "description_knight_bundle_0002",
		is_bundle = true,
		name = "display_name_knight_bundle_0002",
		optional_dlc_display_name = "display_name_knight_bundle_0002",
		optional_dlc_subtitle = "es_knight",
		show_in_slideshow = true,
		slideshow_text = "description_knight_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_knight_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_knight_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_knight_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_knight_bundle_0002",
		bundle_contains = {
			"skin_es_knight_1002",
			"knight_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "unchained_bundle_0002",
		information_text = "description_unchained_bundle_0002",
		is_bundle = true,
		name = "display_name_unchained_bundle_0002",
		optional_dlc_display_name = "display_name_unchained_bundle_0002",
		optional_dlc_subtitle = "bw_unchained",
		show_in_slideshow = true,
		slideshow_text = "description_unchained_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_unchained_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_unchained_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_unchained_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_unchained_bundle_0002",
		bundle_contains = {
			"skin_bw_unchained_1002",
			"unchained_hat_1004",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "bountyhunter_bundle_0002",
		information_text = "description_bountyhunter_bundle_0002",
		is_bundle = true,
		name = "display_name_bountyhunter_bundle_0002",
		optional_dlc_display_name = "display_name_bountyhunter_bundle_0002",
		optional_dlc_subtitle = "wh_bountyhunter",
		show_in_slideshow = true,
		slideshow_text = "description_bountyhunter_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_bountyhunter_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_bountyhunter_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_bountyhunter_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_bountyhunter_bundle_0002",
		bundle_contains = {
			"skin_wh_bountyhunter_1002",
			"bountyhunter_hat_1005",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "five_career_bundle_0004",
		information_text = "description_five_career_bundle_0004",
		is_bundle = true,
		name = "display_name_five_career_bundle_0004",
		optional_dlc_display_name = "display_name_five_career_bundle_0004",
		optional_dlc_subtitle = "five_career_bundle_0001_subtitle",
		show_in_slideshow = true,
		slideshow_text = "description_five_career_bundle_0004",
		slideshow_texture = "store_slideshow_bundle_five_career_bundle_0004",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_five_career_bundle_0004",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_five_career_bundle_0004",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_five_career_bundle_0004",
		bundle_contains = {
			"skin_dr_ironbreaker_1001",
			"ironbreaker_hat_1002",
			"skin_ww_maidenguard_1001",
			"maidenguard_hat_1002",
			"skin_es_huntsman_1001",
			"huntsman_hat_1002",
			"skin_bw_scholar_1001",
			"scholar_hat_1003",
			"skin_wh_flagellant",
			"zealot_hat_1007",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
		layout_console = {
			{
				id = "dlc_logo",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/bundle_icons/store_item_icon_five_career_bundle_0004",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_five_career_bundle_0004",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_dr_ironbreaker_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "ironbreaker_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_ironbreaker_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_ironbreaker_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_ww_maidenguard_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "maidenguard_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_maidenguard_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_maidenguard_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_es_huntsman_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "huntsman_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_huntsman_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_huntsman_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_bw_scholar_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "scholar_hat_1003",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_scholar_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_scholar_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_wh_flagellant",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "zealot_hat_1007",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_zealot_bundle_0002",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_zealot_bundle_0002",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
		},
	},
	{
		dlc_name = "ironbreaker_bundle_0002",
		information_text = "description_ironbreaker_bundle_0002",
		is_bundle = true,
		name = "display_name_ironbreaker_bundle_0002",
		optional_dlc_display_name = "display_name_ironbreaker_bundle_0002",
		optional_dlc_subtitle = "dr_ironbreaker",
		show_in_slideshow = true,
		slideshow_text = "description_ironbreaker_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_ironbreaker_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_ironbreaker_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_ironbreaker_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_ironbreaker_bundle_0002",
		bundle_contains = {
			"skin_dr_ironbreaker_1001",
			"ironbreaker_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "maidenguard_bundle_0002",
		information_text = "description_maidenguard_bundle_0002",
		is_bundle = true,
		name = "display_name_maidenguard_bundle_0002",
		optional_dlc_display_name = "display_name_maidenguard_bundle_0002",
		optional_dlc_subtitle = "we_maidenguard",
		show_in_slideshow = true,
		slideshow_text = "description_maidenguard_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_maidenguard_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_maidenguard_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_maidenguard_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_maidenguard_bundle_0002",
		bundle_contains = {
			"skin_ww_maidenguard_1001",
			"maidenguard_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "huntsman_bundle_0002",
		information_text = "description_huntsman_bundle_0002",
		is_bundle = true,
		name = "display_name_huntsman_bundle_0002",
		optional_dlc_display_name = "display_name_huntsman_bundle_0002",
		optional_dlc_subtitle = "es_huntsman",
		show_in_slideshow = true,
		slideshow_text = "description_huntsman_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_huntsman_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_huntsman_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_huntsman_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_huntsman_bundle_0002",
		bundle_contains = {
			"skin_es_huntsman_1001",
			"huntsman_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "scholar_bundle_0002",
		information_text = "description_scholar_bundle_0002",
		is_bundle = true,
		name = "display_name_scholar_bundle_0002",
		optional_dlc_display_name = "display_name_scholar_bundle_0002",
		optional_dlc_subtitle = "bw_scholar",
		show_in_slideshow = true,
		slideshow_text = "description_scholar_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_scholar_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_scholar_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_scholar_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_scholar_bundle_0002",
		bundle_contains = {
			"skin_bw_scholar_1001",
			"scholar_hat_1003",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "zealot_bundle_0002",
		information_text = "description_zealot_bundle_0002",
		is_bundle = true,
		name = "display_name_zealot_bundle_0002",
		optional_dlc_display_name = "display_name_zealot_bundle_0002",
		optional_dlc_subtitle = "wh_zealot",
		show_in_slideshow = true,
		slideshow_text = "description_zealot_bundle_0002",
		slideshow_texture = "store_slideshow_bundle_zealot_bundle_0002",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_zealot_bundle_0002",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_zealot_bundle_0002",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_zealot_bundle_0002",
		bundle_contains = {
			"skin_wh_flagellant",
			"zealot_hat_1007",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "q1_collection_bundle",
		information_text = "description_q1_collection_bundle",
		is_bundle = true,
		name = "display_name_q1_collection_bundle",
		optional_dlc_display_name = "display_name_q1_collection_bundle",
		optional_dlc_subtitle = "five_career_bundle_0001_subtitle",
		show_in_slideshow = true,
		slideshow_text = "description_q1_collection_bundle",
		slideshow_texture = "store_slideshow_bundle_q1_collection_bundle",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q1_collection_bundle",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_q1_collection_bundle",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_q1_collection_bundle",
		bundle_contains = {
			"skin_dr_ranger_1001",
			"ranger_hat_1005",
			"skin_ww_waywatcher_1001",
			"waywatcher_hat_1004",
			"skin_es_knight_1001",
			"knight_hat_1003",
			"skin_bw_unchained_1001",
			"unchained_hat_1003",
			"skin_wh_captain_1001",
			"witchhunter_hat_1003",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
		layout_console = {
			{
				id = "dlc_logo",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/bundle_icons/store_item_icon_q1_collection_bundle",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q1_collection_bundle",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_dr_ranger_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "ranger_hat_1005",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_q1_ranger_bundle",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_q1_ranger_bundle",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_ww_waywatcher_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "waywatcher_hat_1004",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_q1_waywatcher_bundle",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_q1_waywatcher_bundle",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_es_knight_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "knight_hat_1003",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_q1_footknight_bundle",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_q1_footknight_bundle",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_bw_unchained_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "unchained_hat_1003",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_q1_unchained_bundle",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_q1_unchained_bundle",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_wh_captain_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "witchhunter_hat_1003",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_q1_wh_captain_bundle",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_q1_wh_captain_bundle",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
		},
	},
	{
		dlc_name = "q1_ranger_bundle",
		information_text = "description_q1_ranger_bundle",
		is_bundle = true,
		name = "display_name_q1_ranger_bundle",
		optional_dlc_display_name = "display_name_q1_ranger_bundle",
		optional_dlc_subtitle = "dr_ranger",
		show_in_slideshow = true,
		slideshow_text = "description_q1_ranger_bundle",
		slideshow_texture = "store_slideshow_bundle_q1_ranger_bundle",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q1_ranger_bundle",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_q1_ranger_bundle",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_q1_ranger_bundle",
		bundle_contains = {
			"skin_dr_ranger_1001",
			"ranger_hat_1005",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "q1_waywatcher_bundle",
		information_text = "description_q1_waywatcher_bundle",
		is_bundle = true,
		name = "display_name_q1_waywatcher_bundle",
		optional_dlc_display_name = "display_name_q1_waywatcher_bundle",
		optional_dlc_subtitle = "we_waywatcher",
		show_in_slideshow = true,
		slideshow_text = "description_q1_waywatcher_bundle",
		slideshow_texture = "store_slideshow_bundle_q1_waywatcher_bundle",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q1_waywatcher_bundle",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_q1_waywatcher_bundle",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_q1_waywatcher_bundle",
		bundle_contains = {
			"skin_ww_waywatcher_1001",
			"waywatcher_hat_1004",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "q1_footknight_bundle",
		information_text = "description_q1_footknight_bundle",
		is_bundle = true,
		name = "display_name_q1_footknight_bundle",
		optional_dlc_display_name = "display_name_q1_footknight_bundle",
		optional_dlc_subtitle = "es_knight",
		show_in_slideshow = true,
		slideshow_text = "description_q1_footknight_bundle",
		slideshow_texture = "store_slideshow_bundle_q1_footknight_bundle",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q1_footknight_bundle",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_q1_footknight_bundle",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_q1_footknight_bundle",
		bundle_contains = {
			"skin_es_knight_1001",
			"knight_hat_1003",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "q1_unchained_bundle",
		information_text = "description_q1_unchained_bundle",
		is_bundle = true,
		name = "display_name_q1_unchained_bundle",
		optional_dlc_display_name = "display_name_q1_unchained_bundle",
		optional_dlc_subtitle = "bw_unchained",
		show_in_slideshow = true,
		slideshow_text = "description_q1_unchained_bundle",
		slideshow_texture = "store_slideshow_bundle_q1_unchained_bundle",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q1_unchained_bundle",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_q1_unchained_bundle",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_q1_unchained_bundle",
		bundle_contains = {
			"skin_bw_unchained_1001",
			"unchained_hat_1003",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "q1_wh_captain_bundle",
		information_text = "description_q1_wh_captain_bundle",
		is_bundle = true,
		name = "display_name_q1_wh_captain_bundle",
		optional_dlc_display_name = "display_name_q1_wh_captain_bundle",
		optional_dlc_subtitle = "wh_captain",
		show_in_slideshow = true,
		slideshow_text = "description_q1_wh_captain_bundle",
		slideshow_texture = "store_slideshow_bundle_q1_wh_captain_bundle",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_q1_wh_captain_bundle",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_q1_wh_captain_bundle",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_q1_wh_captain_bundle",
		bundle_contains = {
			"skin_wh_captain_1001",
			"witchhunter_hat_1003",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		additional_content_added = true,
		dlc_name = "bless",
		information_text = "store_bless_desc",
		name = "store_bless_title",
		prio = 5,
		show_in_slideshow = true,
		slideshow_text = "store_bless_desc",
		slideshow_texture = "store_slideshow_dlc_bless",
		store_page_url = "https://store.steampowered.com/app/1782450",
		store_texture = "gui/1080p/single_textures/dlc_store/bless/dlc_store_banner_bless",
		store_texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
		available_platforms = {
			"win32",
			"ps4",
			"xb1",
		},
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/victor/wh_priest",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/dlc_store_logo_bless",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_bless_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_bless_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/victor/wh_priest",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/dlc_store_logo_bless",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_bless_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_bless_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "title_screen_store_new_additional_content",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					add_frame = true,
					localize = true,
					text = "display_name_skin_wh_priest_1001_2023_q1",
					texture_package = "resource_packages/store/item_icons/store_item_icon_skin_wh_priest_1001",
					texture_path = "gui/1080p/single_textures/store_item_icons/store_item_icon_skin_wh_priest_1001/store_item_icon_skin_wh_priest_1001",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					add_frame = true,
					localize = true,
					text = "display_name_priest_hat_1001_2023_q1",
					texture_package = "resource_packages/store/item_icons/store_item_icon_priest_hat_1001",
					texture_path = "gui/1080p/single_textures/store_item_icons/store_item_icon_priest_hat_1001/store_item_icon_priest_hat_1001",
				},
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_01",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_02",
				},
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_03",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_8",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_9",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_06_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_06",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_10",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_01",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_11",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_02",
				},
			},
			{
				id = "dlc_feature_12",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "bless_upgrade",
		information_text = "store_bless_upgrade_desc",
		name = "store_bless_upgrade_title",
		slideshow_text = "store_bless_upgrade_desc",
		slideshow_texture = "store_slideshow_dlc_bless",
		store_page_url = "https://store.steampowered.com/app/1782451",
		store_texture = "gui/1080p/single_textures/dlc_store/bless/dlc_store_banner_bless_upgrade",
		store_texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
		available_platforms = {
			"win32",
		},
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/victor/wh_priest",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/dlc_store_logo_bless",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_bless_upgrade_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_06_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_06",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_01",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_bless_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/bless/store_dlc_icons_bless",
					texture_path = "gui/1080p/single_textures/dlc_store/bless/slate_bless_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "woods",
		information_text = "store_woods_desc",
		name = "store_woods_title",
		prio = 4,
		show_in_slideshow = true,
		slideshow_text = "store_woods_desc",
		slideshow_texture = "store_slideshow_dlc_woods",
		store_page_url = "https://store.steampowered.com/app/1629000",
		store_texture = "gui/1080p/single_textures/dlc_store/woods/dlc_store_banner_woods",
		store_texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
		available_platforms = {
			"win32",
			"ps4",
			"xb1",
		},
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kerillian/we_thornsister",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/dlc_store_logo_woods",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_woods_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_woods_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kerillian/we_thornsister",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/dlc_store_logo_woods",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_woods_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_woods_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_03",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4x",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_5x",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_6x",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_06_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_06",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1x",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_01",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_2x",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_02",
				},
			},
			{
				id = "dlc_feature_3x",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "woods_upgrade",
		information_text = "store_woods_upgrade_desc",
		name = "store_woods_upgrade_title",
		slideshow_text = "store_woods_upgrade_desc",
		slideshow_texture = "store_slideshow_dlc_woods",
		store_page_url = "https://store.steampowered.com/app/1629010",
		store_texture = "gui/1080p/single_textures/dlc_store/woods/dlc_store_banner_woods_upgrade",
		store_texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
		available_platforms = {
			"win32",
		},
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kerillian/we_thornsister",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/dlc_store_logo_woods",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_woods_upgrade_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_06_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_06",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_01",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_woods_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/woods/store_dlc_icons_woods",
					texture_path = "gui/1080p/single_textures/dlc_store/woods/slate_woods_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "fall_collection_2021_bundle",
		information_text = "description_fall_collection_2021_bundle",
		is_bundle = true,
		name = "display_name_five_career_bundle_0002",
		optional_dlc_display_name = "display_name_five_career_bundle_0002",
		optional_dlc_subtitle = "five_career_bundle_0001_subtitle",
		slideshow_text = "description_fall_collection_2021_bundle",
		slideshow_texture = "store_slideshow_bundle_fall_collection_2021_bundle",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_fall_collection_2021_bundle",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_fall_collection_2021_bundle",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_fall_collection_2021_bundle",
		bundle_contains = {
			"skin_bw_adept_1001",
			"adept_hat_1002",
			"skin_dr_slayer_1001",
			"slayer_hat_1002",
			"skin_es_longshark",
			"huntsman_hat_1005",
			"skin_ww_moonmantle",
			"maidenguard_hat_1004",
			"skin_wh_zealot_1001",
			"zealot_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
		layout_console = {
			{
				id = "dlc_logo",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/bundle_icons/store_item_icon_fall_collection_2021_bundle",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_fall_collection_2021_bundle",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_bw_adept_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "adept_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_adept_bundle_0001",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_adept_bundle_0001",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_dr_slayer_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "slayer_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_slayer_bundle_0001",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_slayer_bundle_0001",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_es_longshark",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "huntsman_hat_1005",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_huntsman_bundle_0001",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_huntsman_bundle_0001",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_ww_moonmantle",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "maidenguard_hat_1004",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_maidenguard_bundle_0001",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_maidenguard_bundle_0001",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_wh_zealot_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "zealot_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "display_name_zealot_bundle_0001",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "description_zealot_bundle_0001",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
		},
	},
	{
		dlc_name = "adept_bundle_0001",
		information_text = "description_adept_bundle_0001",
		is_bundle = true,
		name = "display_name_adept_bundle_0001",
		optional_dlc_display_name = "display_name_adept_bundle_0001",
		optional_dlc_subtitle = "bw_adept",
		show_in_slideshow = true,
		slideshow_text = "description_adept_bundle_0001",
		slideshow_texture = "store_slideshow_bundle_adept_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_adept_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_adept_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_adept_bundle_0001",
		bundle_contains = {
			"skin_bw_adept_1001",
			"adept_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "slayer_bundle_0001",
		information_text = "description_slayer_bundle_0001",
		is_bundle = true,
		name = "display_name_slayer_bundle_0001",
		optional_dlc_display_name = "display_name_slayer_bundle_0001",
		optional_dlc_subtitle = "dr_slayer",
		show_in_slideshow = true,
		slideshow_text = "description_slayer_bundle_0001",
		slideshow_texture = "store_slideshow_bundle_slayer_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_slayer_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_slayer_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_slayer_bundle_0001",
		bundle_contains = {
			"skin_dr_slayer_1001",
			"slayer_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "huntsman_bundle_0001",
		information_text = "description_huntsman_bundle_0001",
		is_bundle = true,
		name = "display_name_huntsman_bundle_0001",
		optional_dlc_display_name = "display_name_huntsman_bundle_0001",
		optional_dlc_subtitle = "es_huntsman",
		show_in_slideshow = true,
		slideshow_text = "description_huntsman_bundle_0001",
		slideshow_texture = "store_slideshow_bundle_huntsman_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_huntsman_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_huntsman_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_huntsman_bundle_0001",
		bundle_contains = {
			"skin_es_longshark",
			"huntsman_hat_1005",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "maidenguard_bundle_0001",
		information_text = "description_maidenguard_bundle_0001",
		is_bundle = true,
		name = "display_name_maidenguard_bundle_0001",
		optional_dlc_display_name = "display_name_maidenguard_bundle_0001",
		optional_dlc_subtitle = "we_maidenguard",
		show_in_slideshow = true,
		slideshow_text = "description_maidenguard_bundle_0001",
		slideshow_texture = "store_slideshow_bundle_maidenguard_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_maidenguard_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_maidenguard_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_maidenguard_bundle_0001",
		bundle_contains = {
			"skin_ww_moonmantle",
			"maidenguard_hat_1004",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "zealot_bundle_0001",
		information_text = "description_zealot_bundle_0001",
		is_bundle = true,
		name = "display_name_zealot_bundle_0001",
		optional_dlc_display_name = "display_name_zealot_bundle_0001",
		optional_dlc_subtitle = "wh_zealot",
		show_in_slideshow = true,
		slideshow_text = "description_zealot_bundle_0001",
		slideshow_texture = "store_slideshow_bundle_zealot_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_zealot_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_zealot_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_zealot_bundle_0001",
		bundle_contains = {
			"skin_wh_zealot_1001",
			"zealot_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "five_career_bundle",
		information_text = "five_career_bundle_0001_desc",
		is_bundle = true,
		name = "five_career_bundle_0001",
		optional_dlc_display_name = "five_career_bundle_0001",
		optional_dlc_subtitle = "five_career_bundle_0001_subtitle",
		slideshow_text = "five_career_bundle_0001_desc",
		slideshow_texture = "store_slideshow_bundle_five_career_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_five_career_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_five_career_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_five_career_bundle_0001",
		bundle_contains = {
			"skin_ww_shade_1001",
			"shade_hat_1002",
			"skin_wh_bountyhunter_1001",
			"bountyhunter_hat_1002",
			"skin_dr_irondrake",
			"ironbreaker_hat_1004",
			"skin_es_mercenary_1001",
			"mercenary_hat_1002",
			"skin_bw_myrmidia",
			"scholar_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
		layout_console = {
			{
				id = "dlc_logo",
				type = "big_image",
				settings = {
					localize = false,
					show_frame = true,
					text = "",
					texture_package = "resource_packages/store/bundle_icons/store_item_icon_five_career_bundle_0001",
					texture_path = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_five_career_bundle_0001",
					image_size = {
						800.4,
						591.6,
					},
					size = {
						800.4,
						591.6,
					},
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_ww_shade_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "shade_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "shade_bundle_01",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "shade_bundle_01_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_dr_irondrake",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "ironbreaker_hat_1004",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "ironbreaker_bundle_01",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "ironbreaker_bundle_01_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_bw_myrmidia",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "scholar_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "pyromancer_bundle_01",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "pyromancer_bundle_01_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_wh_bountyhunter_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "bountyhunter_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "bounty_hunter_bundle_01",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "bounty_hunter_bundle_01_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "skin_es_mercenary_1001",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				id = "mercenary_hat_1002",
				type = "bundle_item",
				settings = {
					hide_new = true,
					hide_price = true,
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "mercenary_bundle_01",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "mercenary_bundle_01_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
		},
	},
	{
		dlc_name = "shade_bundle",
		information_text = "shade_bundle_01_desc",
		is_bundle = true,
		name = "shade_bundle_01",
		optional_dlc_display_name = "shade_bundle_01",
		optional_dlc_subtitle = "we_shade",
		prio = 2,
		show_in_slideshow = true,
		slideshow_text = "shade_bundle_01_desc",
		slideshow_texture = "store_slideshow_bundle_shade_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_shade_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_shade_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_shade_bundle_0001",
		bundle_contains = {
			"skin_ww_shade_1001",
			"shade_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "bountyhunter_bundle",
		information_text = "bounty_hunter_bundle_01_desc",
		is_bundle = true,
		name = "bounty_hunter_bundle_01",
		optional_dlc_display_name = "bounty_hunter_bundle_01",
		optional_dlc_subtitle = "wh_bountyhunter",
		prio = 1,
		show_in_slideshow = true,
		slideshow_text = "bounty_hunter_bundle_01_desc",
		slideshow_texture = "store_slideshow_bundle_bountyhunter_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_bountyhunter_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_bountyhunter_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_bountyhunter_bundle_0001",
		bundle_contains = {
			"skin_wh_bountyhunter_1001",
			"bountyhunter_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "ironbreaker_bundle",
		information_text = "ironbreaker_bundle_01_desc",
		is_bundle = true,
		name = "ironbreaker_bundle_01",
		optional_dlc_display_name = "ironbreaker_bundle_01",
		optional_dlc_subtitle = "dr_ironbreaker",
		slideshow_text = "ironbreaker_bundle_01_desc",
		slideshow_texture = "store_slideshow_bundle_ironbreaker_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_ironbreaker_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_ironbreaker_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_ironbreaker_bundle_0001",
		bundle_contains = {
			"skin_dr_irondrake",
			"ironbreaker_hat_1004",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "mercenary_bundle",
		information_text = "mercenary_bundle_01_desc",
		is_bundle = true,
		name = "mercenary_bundle_01",
		optional_dlc_display_name = "mercenary_bundle_01",
		optional_dlc_subtitle = "es_mercenary",
		slideshow_text = "mercenary_bundle_01_desc",
		slideshow_texture = "store_slideshow_bundle_mercenary_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_mercenary_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_mercenary_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_mercenary_bundle_0001",
		bundle_contains = {
			"skin_es_mercenary_1001",
			"mercenary_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "scholar_bundle",
		information_text = "pyromancer_bundle_01_desc",
		is_bundle = true,
		name = "pyromancer_bundle_01",
		optional_dlc_display_name = "pyromancer_bundle_01",
		optional_dlc_subtitle = "bw_scholar",
		slideshow_text = "pyromancer_bundle_01_desc",
		slideshow_texture = "store_slideshow_bundle_scholar_bundle_0001",
		store_bundle_big_image = "gui/1080p/single_textures/store/slideshow/store_slideshow_bundle_scholar_bundle_0001",
		store_texture = "gui/1080p/single_textures/store_bundle/store_item_icon_scholar_bundle_0001",
		store_texture_package = "resource_packages/store/bundle_icons/store_item_icon_scholar_bundle_0001",
		bundle_contains = {
			"skin_bw_myrmidia",
			"scholar_hat_1002",
		},
		available_platforms = {
			"xb1",
			"ps4",
		},
	},
	{
		dlc_name = "grass",
		information_text = "store_grass_desc",
		name = "store_grass_title",
		prio = 3,
		show_in_slideshow = true,
		slideshow_text = "store_grass_desc",
		slideshow_texture = "store_slideshow_dlc_grass",
		store_page_url = "https://store.steampowered.com/app/1592630",
		store_texture = "gui/1080p/single_textures/dlc_store/grass/dlc_store_banner_grass",
		store_texture_package = "resource_packages/store/dlc_icons/grass/store_dlc_icons_grass",
		layout = {
			{
				type = "spacing",
				settings = {
					size = {
						177.5,
						0,
					},
				},
			},
			{
				id = "dlc_logo",
				type = "big_image",
				settings = {
					localize = false,
					text = "",
					texture_package = "resource_packages/store/dlc_icons/grass/store_dlc_icons_grass",
					texture_path = "gui/1080p/single_textures/dlc_store/grass/dlc_store_logo_grass",
					image_size = {
						440,
						64,
					},
					size = {
						440,
						64,
					},
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_grass_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_grass_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/grass/store_dlc_icons_grass",
					texture_path = "gui/1080p/single_textures/dlc_store/grass/slate_grass_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_grass_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/grass/store_dlc_icons_grass",
					texture_path = "gui/1080p/single_textures/dlc_store/grass/slate_grass_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_grass_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/grass/store_dlc_icons_grass",
					texture_path = "gui/1080p/single_textures/dlc_store/grass/slate_grass_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_grass_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/grass/store_dlc_icons_grass",
					texture_path = "gui/1080p/single_textures/dlc_store/grass/slate_grass_04",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_grass_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/grass/store_dlc_icons_grass",
					texture_path = "gui/1080p/single_textures/dlc_store/grass/slate_grass_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_grass_slate_07_description",
					texture_package = "resource_packages/store/dlc_icons/grass/store_dlc_icons_grass",
					texture_path = "gui/1080p/single_textures/dlc_store/grass/slate_grass_07",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		additional_content_added = true,
		dlc_name = "cog",
		information_text = "store_cog_desc",
		name = "store_cog_title",
		slideshow_text = "store_cog_desc",
		slideshow_texture = "store_slideshow_dlc_cog",
		store_page_url = "https://store.steampowered.com/app/1443780",
		store_texture = "gui/1080p/single_textures/dlc_store/cog/dlc_store_banner_cog",
		store_texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/bardin/dr_engineer",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_logo_cog",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_cog_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_cog_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/bardin/dr_engineer",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_logo_cog",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_cog_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_cog_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "title_screen_store_new_additional_content",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					add_frame = true,
					localize = true,
					text = "display_name_skin_dr_engineer_1001",
					texture_package = "resource_packages/store/item_icons/store_item_icon_skin_dr_engineer_1001",
					texture_path = "gui/1080p/single_textures/store_item_icons/store_item_icon_skin_dr_engineer_1001/store_item_icon_skin_dr_engineer_1001",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					add_frame = true,
					localize = true,
					text = "display_name_engineer_hat_1002",
					texture_package = "resource_packages/store/item_icons/store_item_icon_engineer_hat_1002",
					texture_path = "gui/1080p/single_textures/store_item_icons/store_item_icon_engineer_hat_1002/store_item_icon_engineer_hat_1002",
				},
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_01",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_02",
				},
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_03",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_8",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_9",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_01",
				},
			},
			{
				id = "dlc_feature_10",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_02",
				},
			},
			{
				id = "dlc_feature_11",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "cog_upgrade",
		information_text = "store_cog_upgrade_desc",
		name = "store_cog_upgrade_title",
		slideshow_text = "store_cog_upgrade_desc",
		slideshow_texture = "store_slideshow_dlc_cog",
		store_page_url = "https://store.steampowered.com/app/1443790",
		store_texture = "gui/1080p/single_textures/dlc_store/cog/dlc_store_banner_cog_upgrade",
		store_texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
		available_platforms = {
			"win32",
		},
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/bardin/dr_engineer",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/dlc_store_logo_cog",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_cog_upgrade_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_cog_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/cog/store_dlc_icons_cog",
					texture_path = "gui/1080p/single_textures/dlc_store/cog/slate_cog_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		additional_content_added = true,
		dlc_name = "lake",
		information_text = "store_lake_desc",
		name = "store_lake_title",
		slideshow_text = "store_lake_desc",
		slideshow_texture = "store_slideshow_dlc_lake",
		store_page_url = "https://store.steampowered.com/app/1343500",
		store_texture = "gui/1080p/single_textures/dlc_store/lake/dlc_store_banner_lake",
		store_texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kruber/es_questingknight",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_logo_lake",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_lake_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_lake_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kruber/es_questingknight",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_logo_lake",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_lake_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_lake_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_04",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "title_screen_store_new_additional_content",
				},
			},
			{
				type = "spacing",
				settings = {
					size = {
						130,
						0,
					},
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					add_frame = true,
					localize = true,
					text = "display_name_skin_es_questing_knight_1001",
					texture_package = "resource_packages/store/item_icons/store_item_icon_skin_es_questingknight_1001",
					texture_path = "gui/1080p/single_textures/store_item_icons/store_item_icon_skin_es_questingknight_1001/store_item_icon_skin_es_questingknight_1001",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					add_frame = true,
					localize = true,
					text = "display_name_questing_knight_hat_1001",
					texture_package = "resource_packages/store/item_icons/store_item_icon_questing_knight_hat_1001",
					texture_path = "gui/1080p/single_textures/store_item_icons/store_item_icon_questing_knight_hat_1001/store_item_icon_questing_knight_hat_1001",
				},
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_01",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_02",
				},
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_03",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_8",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_9",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_01",
				},
			},
			{
				id = "dlc_feature_10",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_02",
				},
			},
			{
				id = "dlc_feature_11",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "lake_upgrade",
		information_text = "store_lake_upgrade_desc",
		name = "store_lake_upgrade_title",
		slideshow_text = "store_lake_upgrade_slideshow_desc",
		slideshow_texture = "store_slideshow_dlc_lake",
		store_page_url = "https://store.steampowered.com/app/1345990",
		store_texture = "gui/1080p/single_textures/dlc_store/lake/dlc_store_banner_lake_upgrade",
		store_texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
		available_platforms = {
			"win32",
		},
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/career_videos/kruber/es_questingknight",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/dlc_store_logo_lake_upgrade",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_lake_upgrade_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_lake_upgrade_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/lake/store_dlc_icons_lake",
					texture_path = "gui/1080p/single_textures/dlc_store/lake/slate_lake_upgrade_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "scorpion",
		information_text = "store_wom_desc",
		name = "store_wom_title",
		slideshow_text = "store_wom_slideshow_desc",
		slideshow_texture = "store_slideshow_dlc_wom",
		store_page_url = "https://store.steampowered.com/app/1033060/Warhammer_Vermintide_2__Winds_of_Magic/",
		store_texture = "gui/1080p/single_textures/dlc_store/wom/dlc_store_banner_wom",
		store_texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/scorpion/area_video_scorpion",
					set_loop = true,
					sound_event = "Play_hud_menu_area_ubersreik",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/dlc_store_logo_wom",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_wom_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical_long",
				settings = {
					localize = true,
					text = "dlc_wom_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_05",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_horizontal",
				settings = {
					localize = true,
					text = "dlc_wom_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_wom_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_01",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_wom_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_03",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_wom_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_02",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "spacing",
			},
			{
				id = "weave_title_logo",
				type = "dlc_logo",
				settings = {
					alignment = "center",
					texture_package = "resource_packages/store/dlc_icons/wom/store_dlc_icons_wom",
					texture_path = "gui/1080p/single_textures/dlc_store/wom/slate_wom_06",
					texture_size = {
						491,
						89,
					},
				},
			},
			{
				type = "body_text",
				settings = {
					alignment = "center",
					font_size = 52,
					font_type = "hell_shark_header_masked",
					height_offset = 34,
					localize = true,
					text = "start_game_window_weave_title",
				},
			},
			{
				type = "header_text",
				settings = {
					alignment = "center",
					localize = true,
					text = "menu_store_dlc_title_new_game_mode",
				},
			},
			{
				type = "body_text",
				settings = {
					alignment = "center",
					localize = true,
					text = "dlc_wom_slate_06_description",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_pullet_point",
				settings = {
					alignment = "left",
					localize = true,
					text = "dlc_wom_slate_07_description",
				},
			},
			{
				id = "dlc_feature_8",
				type = "dlc_feature_pullet_point",
				settings = {
					alignment = "left",
					localize = true,
					text = "dlc_wom_slate_08_description",
				},
			},
			{
				id = "dlc_feature_9",
				type = "dlc_feature_pullet_point",
				settings = {
					alignment = "left",
					localize = true,
					text = "dlc_wom_slate_09_description",
				},
			},
			{
				id = "dlc_feature_10",
				type = "dlc_feature_pullet_point",
				settings = {
					alignment = "left",
					localize = true,
					text = "dlc_wom_slate_10_description",
				},
			},
			{
				id = "dlc_feature_11",
				type = "dlc_feature_pullet_point",
				settings = {
					alignment = "left",
					localize = true,
					text = "dlc_wom_slate_11_description",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "holly",
		information_text = "store_ubersreik_desc",
		name = "store_ubersreik_title",
		slideshow_text = "store_ubersreik_slideshow_desc",
		slideshow_texture = "store_slideshow_dlc_btu",
		store_page_url = "https://store.steampowered.com/app/975400/Warhammer_Vermintide_2__Back_to_Ubersreik/",
		store_texture = "gui/1080p/single_textures/dlc_store/holly/dlc_store_banner_holly",
		store_texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/holly/area_video_holly",
					set_loop = true,
					sound_event = "Play_hud_menu_area_ubersreik",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly",
					texture_path = "gui/1080p/single_textures/dlc_store/holly/dlc_store_logo_holly",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_ubersreik_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_ubersreik_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly",
					texture_path = "gui/1080p/single_textures/dlc_store/holly/slate_ubersreik_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_ubersreik_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly",
					texture_path = "gui/1080p/single_textures/dlc_store/holly/slate_ubersreik_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_ubersreik_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/holly/store_dlc_icons_holly",
					texture_path = "gui/1080p/single_textures/dlc_store/holly/slate_ubersreik_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "bogenhafen",
		information_text = "store_bogenhafen_desc",
		name = "store_bogenhafen_title",
		slideshow_text = "store_bogenhafen_slideshow_desc",
		slideshow_texture = "store_slideshow_dlc_bgh",
		store_page_url = "https://store.steampowered.com/app/828790/Warhammer_Vermintide_2__Shadows_Over_Bgenhafen/",
		store_texture = "gui/1080p/single_textures/dlc_store/bogenhafen/dlc_store_banner_bogenhafen",
		store_texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/bogenhafen/area_video_bogenhafen",
					set_loop = true,
					sound_event = "Play_hud_menu_area_bogenhafen",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen",
					texture_path = "gui/1080p/single_textures/dlc_store/bogenhafen/dlc_store_logo_bogenhafen",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_bogenhafen_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					alignment = "center",
					localize = true,
					text = "dlc_bogenhafen_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen",
					texture_path = "gui/1080p/single_textures/dlc_store/bogenhafen/slate_bgh_01",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					alignment = "center",
					localize = true,
					text = "dlc_bogenhafen_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen",
					texture_path = "gui/1080p/single_textures/dlc_store/bogenhafen/slate_bgh_02",
				},
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical",
				settings = {
					alignment = "center",
					localize = true,
					text = "dlc_bogenhafen_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/bogenhafen/store_dlc_icons_bogenhafen",
					texture_path = "gui/1080p/single_textures/dlc_store/bogenhafen/slate_bgh_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
	{
		dlc_name = "pre_order",
		information_text = "store_premium_edition_desc",
		name = "store_premium_edition_title",
		slideshow_text = "store_premium_edition_slideshow_desc",
		slideshow_texture = "store_slideshow_dlc_premium",
		store_page_url = "https://store.steampowered.com/app/737040/Warhammer_Vermintide_2__Collectors_Edition_Upgrade/",
		store_texture = "gui/1080p/single_textures/dlc_store/premium/dlc_store_banner_premium",
		store_texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
		layout = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/helmgart/area_video_helmgart",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/dlc_store_logo_premium",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_premium_edition_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_1",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_01_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_01",
				},
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_06_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_06",
				},
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical_long",
				settings = {
					alignment = "center",
					localize = true,
					text = "dlc_premium_edition_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_03",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_5",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_05_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_05",
				},
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_07_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_07",
				},
			},
			{
				id = "dlc_feature_2",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_02_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_02",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_premium_edition_additional_information",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
		layout_console = {
			{
				id = "header_video",
				type = "dlc_header_video",
				settings = {
					masked_material_name = "video_masked",
					material_name = "video_default",
					resource = "video/area_videos/helmgart/area_video_helmgart",
					set_loop = true,
					sound_event = "Play_hud_menu_area_helmgart",
				},
			},
			{
				id = "dlc_logo",
				type = "dlc_logo",
				settings = {
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/dlc_store_logo_premium",
				},
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "store_premium_edition_desc",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
			{
				type = "spacing",
			},
			{
				type = "header_text",
				settings = {
					localize = true,
					text = "menu_store_dlc_title_including",
				},
			},
			{
				id = "dlc_feature_7",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_07_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_07",
				},
			},
			{
				id = "dlc_feature_6",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_06_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_06",
				},
			},
			{
				id = "dlc_feature_4",
				type = "dlc_feature_vertical",
				settings = {
					localize = true,
					text = "dlc_premium_edition_slate_04_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_04",
				},
			},
			{
				type = "spacing",
			},
			{
				id = "dlc_feature_3",
				type = "dlc_feature_vertical_long",
				settings = {
					alignment = "center",
					localize = true,
					text = "dlc_premium_edition_slate_03_description",
					texture_package = "resource_packages/store/dlc_icons/premium/store_dlc_icons_premium",
					texture_path = "gui/1080p/single_textures/dlc_store/premium/slate_premium_03",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "body_text",
				settings = {
					localize = true,
					text = "dlc_premium_edition_additional_information",
				},
			},
			{
				type = "spacing",
			},
			{
				type = "divider_horizontal",
			},
		},
	},
}
StoreDlcSettingsByName = {}

for _, settings in ipairs(StoreDlcSettings) do
	local available_platforms = settings.available_platforms

	if not available_platforms or table.find(available_platforms, PLATFORM) then
		StoreDlcSettingsByName[settings.dlc_name] = settings
	end
end
