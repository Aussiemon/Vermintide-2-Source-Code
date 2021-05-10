CommonPopupSettings = CommonPopupSettings or {}
CommonPopupSettings.morris = {
	popup_type = "reminder",
	button_text = "menu_accept",
	body_text = "first_time_popup_morris",
	class_name = "UnlockReminderPopup",
	background_texture = "deus_popup_background",
	definitions = local_require("scripts/ui/dlc_upsell/unlock_reminder_popup_definitions"),
	input_desc = {
		actions = {
			{
				input_action = "confirm",
				priority = 1,
				description_text = "menu_accept"
			}
		}
	}
}
CommonPopupSettings.scorpion = {
	body_text = "menu_weave_area_no_wom_body",
	title_text = "menu_weave_area_no_wom_title",
	ok_button_text = "menu_close",
	button_text = "menu_weave_area_no_wom_button",
	popup_type = "upsell",
	class_name = "UpsellPopup",
	background_texture = "wom_upsell_popup_bg",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				input_action = "confirm",
				priority = 1,
				description_text = "menu_weave_area_no_wom_button"
			}
		}
	}
}
CommonPopupSettings.lake = {
	body_text = "upsell_popup_lake_body",
	title_text = "upsell_popup_lake_title",
	ok_button_text = "menu_close",
	button_text = "menu_weave_area_no_lake_button",
	popup_type = "upsell",
	class_name = "UpsellPopup",
	background_texture = "lake_upsell_popup_bg",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				input_action = "confirm",
				priority = 1,
				description_text = "menu_weave_area_no_lake_button"
			}
		}
	}
}
CommonPopupSettings.cog = {
	body_text = "upsell_popup_cog_body",
	title_text = "upsell_popup_cog_title",
	ok_button_text = "menu_close",
	button_text = "upsell_popup_cog_button",
	popup_type = "upsell",
	class_name = "UpsellPopup",
	background_texture = "cog_upsell_popup_bg",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				input_action = "confirm",
				priority = 1,
				description_text = "upsell_popup_cog_button"
			}
		}
	}
}

return
