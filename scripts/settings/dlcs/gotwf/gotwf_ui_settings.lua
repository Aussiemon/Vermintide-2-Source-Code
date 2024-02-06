-- chunkname: @scripts/settings/dlcs/gotwf/gotwf_ui_settings.lua

local settings = DLCSettings.gotwf

settings.store_state_filenames = {
	"scripts/ui/views/hero_view/windows/hero_window_gotwf_overview",
	"scripts/ui/views/hero_view/windows/hero_window_gotwf_panel",
	"scripts/ui/views/hero_view/windows/hero_window_gotwf_item_preview",
	"scripts/ui/views/hero_view/windows/hero_window_gotwf_background",
}
settings.store_windows = {
	gotwf_overview = {
		class_name = "HeroWindowGotwfOverview",
		name = "gotwf_overview",
	},
	gotwf_background = {
		class_name = "HeroWindowGotwfBackground",
		ignore_alignment = true,
		name = "gotwf_background",
	},
	gotwf_panel = {
		class_name = "HeroWindowGotwfPanel",
		ignore_alignment = true,
		name = "panel",
	},
	gotwf_item_preview = {
		class_name = "HeroWindowGotwfItemPreview",
		ignore_alignment = true,
		name = "gotwf_item_preview",
	},
}
settings.store_window_layouts = {
	{
		close_on_exit = false,
		name = "gotwf_overview",
		sound_event_enter = "Play_hud_gotwf_open",
		sound_event_exit = "play_gui_equipment_close",
		windows = {
			gotwf_background = 1,
			gotwf_item_preview = 4,
			gotwf_overview = 2,
			gotwf_panel = 3,
		},
	},
}
settings.store_layout = {
	pages = {
		category_button_texture = "store_category_icon_kruber_mercenary",
		display_name = "inventory_discounts",
		item_filter = "discounted_items",
		layout = "category",
		sort_order = 6,
		sound_event_enter = "Play_hud_store_kruber",
	},
}
