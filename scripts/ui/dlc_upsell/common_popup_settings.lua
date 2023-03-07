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
	title_text = "upsell_popup_new_career_title",
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
	title_text = "upsell_popup_new_career_title",
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
CommonPopupSettings.woods = {
	body_text = "upsell_popup_woods_body",
	title_text = "upsell_popup_new_career_title",
	ok_button_text = "menu_close",
	button_text = "upsell_popup_woods_button",
	popup_type = "upsell",
	class_name = "UpsellPopup",
	background_texture = "woods_upsell_popup_bg",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				input_action = "confirm",
				priority = 1,
				description_text = "upsell_popup_woods_button"
			}
		}
	}
}
CommonPopupSettings.bless = {
	body_text = "upsell_popup_bless_body",
	title_text = "upsell_popup_new_career_title",
	ok_button_text = "menu_close",
	button_text = "upsell_popup_bless_button",
	popup_type = "upsell",
	class_name = "UpsellPopup",
	background_texture = "priest_upsell_popup_bg",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				input_action = "confirm",
				priority = 1,
				description_text = "upsell_popup_bless_button"
			}
		}
	}
}
CommonPopupSettings.belakor = {
	popup_type = "reminder",
	button_text = "menu_accept",
	body_text = "belakor_upsell_popup",
	class_name = "UnlockReminderPopup",
	background_texture = "upsell_image_keyart",
	definitions = local_require("scripts/ui/dlc_upsell/alterantive_reminder_popup_definitions"),
	top_detail_texture = {
		texture = "upsell_image_logo",
		size = {
			431,
			247
		},
		offset = {
			-190.5,
			-123.5
		}
	},
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
