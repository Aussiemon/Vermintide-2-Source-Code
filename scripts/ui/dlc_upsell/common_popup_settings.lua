-- chunkname: @scripts/ui/dlc_upsell/common_popup_settings.lua

CommonPopupSettings = CommonPopupSettings or {}
CommonPopupSettings.scorpion = {
	background_texture = "wom_upsell_popup_bg",
	body_text = "menu_weave_area_no_wom_body",
	button_text = "menu_weave_area_no_wom_button",
	class_name = "UpsellPopup",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "menu_weave_area_no_wom_title",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				description_text = "menu_weave_area_no_wom_button",
				input_action = "confirm",
				priority = 1,
			},
		},
	},
}
CommonPopupSettings.lake = {
	background_texture = "lake_upsell_popup_bg",
	body_text = "upsell_popup_lake_body",
	button_text = "menu_weave_area_no_lake_button",
	class_name = "UpsellPopup",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				description_text = "menu_weave_area_no_lake_button",
				input_action = "confirm",
				priority = 1,
			},
		},
	},
}
CommonPopupSettings.cog = {
	background_texture = "cog_upsell_popup_bg",
	body_text = "upsell_popup_cog_body",
	button_text = "upsell_popup_cog_button",
	class_name = "UpsellPopup",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				description_text = "upsell_popup_cog_button",
				input_action = "confirm",
				priority = 1,
			},
		},
	},
}
CommonPopupSettings.woods = {
	background_texture = "woods_upsell_popup_bg",
	body_text = "upsell_popup_woods_body",
	button_text = "upsell_popup_woods_button",
	class_name = "UpsellPopup",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				description_text = "upsell_popup_woods_button",
				input_action = "confirm",
				priority = 1,
			},
		},
	},
}
CommonPopupSettings.bless = {
	background_texture = "priest_upsell_popup_bg",
	body_text = "upsell_popup_bless_body",
	button_text = "upsell_popup_bless_button",
	class_name = "UpsellPopup",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				description_text = "upsell_popup_bless_button",
				input_action = "confirm",
				priority = 1,
			},
		},
	},
}
CommonPopupSettings.shovel = {
	background_texture = "shovel_upsell_popup_bg",
	body_text = "upsell_popup_shovel_body",
	button_text = "upsell_popup_shovel_button",
	class_name = "UpsellPopup",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
	definitions = local_require("scripts/ui/dlc_upsell/upsell_popup_definitions"),
	input_desc = {
		actions = {
			{
				description_text = "upsell_popup_shovel_button",
				input_action = "confirm",
				priority = 1,
			},
		},
	},
}
