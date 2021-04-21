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
	popup_type = "upsell",
	title_text = "menu_weave_area_no_wom_title",
	button_text = "menu_weave_area_no_wom_button",
	body_text = "menu_weave_area_no_wom_body",
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
	popup_type = "upsell",
	title_text = "upsell_popup_lake_title",
	button_text = "menu_weave_area_no_lake_button",
	body_text = "upsell_popup_lake_body",
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
	popup_type = "upsell",
	title_text = "upsell_popup_cog_title",
	button_text = "upsell_popup_cog_button",
	body_text = "upsell_popup_cog_body",
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
