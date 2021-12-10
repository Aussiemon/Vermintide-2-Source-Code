local settings = DLCSettings.store
settings.hero_view = {
	store = {
		filename = "scripts/ui/views/hero_view/states/hero_view_state_store"
	}
}
settings.hero_view_settings_by_screen = {
	{
		name = "store",
		hotkey_disabled = false,
		state_name = "HeroViewStateStore",
		draw_background_world = false,
		camera_position = {
			0,
			0,
			0
		},
		camera_rotation = {
			0,
			0,
			0
		}
	}
}
settings.controller_settings = {
	IngameMenuKeymaps = {
		win32 = {
			hotkey_store = {
				"keyboard",
				"p",
				"pressed"
			}
		}
	}
}
settings.hotkey_mapping = {
	hotkey_store = {
		in_transition = "hero_view_force",
		error_message = "matchmaking_ready_interaction_message_store",
		view = "hero_view",
		transition_state = "store",
		disable_when_matchmaking_ready = true,
		in_transition_menu = "hero_view"
	}
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
	"scripts/ui/views/hero_view/windows/store/store_window_category_item_list"
}
settings.ui_materials_in_inn = {
	"materials/ui/ui_1080p_store_menu"
}
settings.ui_texture_settings = {
	filenames = {
		"scripts/ui/atlas_settings/gui_store_menu_atlas"
	},
	atlas_settings = {
		store_menu_atlas = {
			offscreen_material_name = "gui_store_menu_atlas_offscreen",
			masked_point_sample_material_name = "gui_store_menu_atlas_point_sample_masked",
			masked_offscreen_material_name = "gui_store_menu_atlas_masked_offscreen",
			point_sample_offscreen_material_name = "gui_store_menu_atlas_point_sample_offscreen",
			saturated_material_name = "gui_store_menu_atlas_saturated",
			masked_material_name = "gui_store_menu_atlas_masked",
			point_sample_material_name = "gui_store_menu_atlas_point_sample",
			masked_saturated_material_name = "gui_store_menu_atlas_masked_saturated",
			saturated_offscreen_material_name = "gui_store_menu_atlas_saturated",
			masked_point_sample_offscreen_material_name = "gui_store_menu_atlas_point_sample_masked_offscreen",
			material_name = "gui_store_menu_atlas"
		}
	},
	single_textures = {
		"dlc_store_banner_bogenhafen",
		"dlc_store_banner_premium",
		"dlc_store_banner_holly",
		"dlc_store_banner_wom"
	}
}

return
