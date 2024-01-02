local settings = DLCSettings.gotwf
settings.store_state_filenames = {
	"scripts/ui/views/hero_view/windows/hero_window_gotwf_overview",
	"scripts/ui/views/hero_view/windows/hero_window_gotwf_panel",
	"scripts/ui/views/hero_view/windows/hero_window_gotwf_item_preview",
	"scripts/ui/views/hero_view/windows/hero_window_gotwf_background"
}
settings.store_windows = {
	gotwf_overview = {
		class_name = "HeroWindowGotwfOverview",
		name = "gotwf_overview"
	},
	gotwf_background = {
		ignore_alignment = true,
		name = "gotwf_background",
		class_name = "HeroWindowGotwfBackground"
	},
	gotwf_panel = {
		ignore_alignment = true,
		name = "panel",
		class_name = "HeroWindowGotwfPanel"
	},
	gotwf_item_preview = {
		ignore_alignment = true,
		name = "gotwf_item_preview",
		class_name = "HeroWindowGotwfItemPreview"
	}
}
settings.store_window_layouts = {
	{
		sound_event_enter = "Play_hud_gotwf_open",
		name = "gotwf_overview",
		sound_event_exit = "play_gui_equipment_close",
		close_on_exit = false,
		windows = {
			gotwf_overview = 2,
			gotwf_background = 1,
			gotwf_item_preview = 4,
			gotwf_panel = 3
		}
	}
}
settings.store_layout = {
	pages = {
		sound_event_enter = "Play_hud_store_kruber",
		layout = "category",
		display_name = "inventory_discounts",
		item_filter = "discounted_items",
		sort_order = 6,
		category_button_texture = "store_category_icon_kruber_mercenary"
	}
}
