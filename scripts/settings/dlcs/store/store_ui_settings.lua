-- chunkname: @scripts/settings/dlcs/store/store_ui_settings.lua

local settings = DLCSettings.store

settings.hero_view = {
	store = {
		filename = "scripts/ui/views/hero_view/states/hero_view_state_store",
	},
}
settings.hero_view_settings_by_screen = {
	{
		draw_background_world = false,
		hotkey_disabled = false,
		name = "store",
		state_name = "HeroViewStateStore",
		camera_position = {
			0,
			0,
			0,
		},
		camera_rotation = {
			0,
			0,
			0,
		},
	},
}
settings.controller_settings = {
	IngameMenuKeymaps = {
		win32 = {
			hotkey_store = {
				"keyboard",
				"p",
				"pressed",
			},
		},
	},
}
settings.hotkey_mapping = {
	hotkey_store = {
		error_message = "matchmaking_ready_interaction_message_store",
		in_transition = "hero_view_force",
		in_transition_menu = "hero_view",
		transition_state = "store",
		view = "hero_view",
		disable_for_mechanism = {
			adventure = {
				matchmaking = false,
				matchmaking_ready = true,
				not_matchmaking = false,
			},
			versus = {
				matchmaking = false,
				matchmaking_ready = true,
				not_matchmaking = false,
			},
			deus = {
				matchmaking = false,
				matchmaking_ready = true,
				not_matchmaking = false,
			},
		},
	},
}
settings.store_state_filenames = {
	"scripts/ui/ui_widgets_store",
	"scripts/settings/store_dlc_settings",
	"scripts/settings/store_bundle_layouts",
	"scripts/settings/store_bundle_featured_settings",
	"scripts/settings/store_layout",
	"scripts/ui/views/store_welcome_popup",
	"scripts/ui/views/store_item_purchase_popup",
	"scripts/ui/views/store_login_rewards_popup",
	"scripts/ui/views/hero_view/states/store_window_layout",
	"scripts/ui/views/hero_view/windows/store/store_window_item_list",
	"scripts/ui/views/hero_view/windows/store/store_window_panel",
	"scripts/ui/views/hero_view/windows/store/store_window_background",
	"scripts/ui/views/hero_view/windows/store/store_window_category_list",
	"scripts/ui/views/hero_view/windows/store/store_window_item_preview",
	"scripts/ui/views/hero_view/windows/store/store_window_path_title",
	"scripts/ui/views/hero_view/windows/store/store_window_featured",
	"scripts/ui/views/hero_view/windows/store/store_window_item_details",
	"scripts/ui/views/hero_view/windows/store/store_window_category_item_list",
}
settings.ui_materials_in_inn = {
	"materials/ui/ui_1080p_store_menu",
}
settings.ui_texture_settings = {
	filenames = {
		"scripts/ui/atlas_settings/gui_store_menu_atlas",
	},
	atlas_settings = {
		store_menu_atlas = {
			masked_material_name = "gui_store_menu_atlas_masked",
			masked_offscreen_material_name = "gui_store_menu_atlas_masked_offscreen",
			masked_point_sample_material_name = "gui_store_menu_atlas_point_sample_masked",
			masked_point_sample_offscreen_material_name = "gui_store_menu_atlas_point_sample_masked_offscreen",
			masked_saturated_material_name = "gui_store_menu_atlas_masked_saturated",
			material_name = "gui_store_menu_atlas",
			offscreen_material_name = "gui_store_menu_atlas_offscreen",
			point_sample_material_name = "gui_store_menu_atlas_point_sample",
			point_sample_offscreen_material_name = "gui_store_menu_atlas_point_sample_offscreen",
			saturated_material_name = "gui_store_menu_atlas_saturated",
			saturated_offscreen_material_name = "gui_store_menu_atlas_saturated",
		},
	},
	single_textures = {
		"dlc_store_banner_bogenhafen",
		"dlc_store_banner_premium",
		"dlc_store_banner_holly",
		"dlc_store_banner_wom",
	},
}
settings.currency_ui_settings = {
	SM = {
		currency_type = "SM",
		frame = "button_frame_01_gold",
		icon_big = "store_icon_currency_ingame_big",
		icon_small = "store_icon_currency_ingame",
		name = "menu_store_panel_currency_tooltip_title",
		tooltip_description = "menu_store_panel_currency_tooltip_desc",
		tooltip_input = "menu_store_panel_currency_tooltip_obtain_desc",
		tooltip_title = "menu_store_panel_currency_tooltip_title",
		background_ui_settings = {
			texture = "menu_frame_bg_07",
			size = {
				512,
				256,
			},
		},
	},
	VS = {
		currency_type = "VS",
		frame = "button_frame_01_gold",
		icon_big = "store_icon_currency_versus_coin_big",
		icon_small = "store_icon_currency_versus_coin",
		max_amount = 999,
		name = "menu_store_panel_versus_currency_tooltip_title",
		tooltip_description = "menu_store_panel_versus_currency_tooltip_desc",
		tooltip_input = "menu_store_panel_versus_currency_tooltip_obtain_desc",
		tooltip_title = "menu_store_versus_panel_currency_tooltip_title",
		background_ui_settings = {
			texture = "menu_frame_bg_07",
			size = {
				512,
				256,
			},
		},
	},
}
settings.allowed_store_item_types = {
	chips = true,
	frame = true,
	hat = true,
	skin = true,
	weapon_pose = true,
	weapon_pose_bundle = true,
	weapon_skin = true,
}
settings.currency_types = {
	[1] = "SM",
	[2] = "VS",
}
