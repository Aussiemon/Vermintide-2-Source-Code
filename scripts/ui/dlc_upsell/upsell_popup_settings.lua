UpsellPopupSettings = UpsellPopupSettings or {}
UpsellPopupSettings.scorpion = {
	body_text = "menu_weave_area_no_wom_body",
	title_text = "menu_weave_area_no_wom_title",
	button_text = "menu_weave_area_no_wom_button",
	class_name = "UpsellPopup",
	background_texture = "wom_upsell_popup_bg",
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
UpsellPopupSettings.lake = {
	body_text = "upsell_popup_lake_body",
	title_text = "upsell_popup_lake_title",
	button_text = "menu_weave_area_no_lake_button",
	class_name = "UpsellPopup",
	background_texture = "lake_upsell_popup_bg",
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
UpsellPopupSettings.cog = {
	body_text = "upsell_popup_cog_body",
	title_text = "upsell_popup_cog_title",
	button_text = "upsell_popup_cog_button",
	class_name = "UpsellPopup",
	background_texture = "cog_upsell_popup_bg",
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
