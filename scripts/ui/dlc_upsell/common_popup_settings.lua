-- chunkname: @scripts/ui/dlc_upsell/common_popup_settings.lua

CommonPopupSettings = CommonPopupSettings or {}
CommonPopupSettings.scorpion = {
	background_texture = "wom_upsell_popup_bg",
	body_text = "menu_weave_area_no_wom_body",
	button_text = "menu_weave_area_no_wom_button",
	class_name = "UpsellPopup",
	definitions_path = "scripts/ui/dlc_upsell/upsell_popup_definitions",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "menu_weave_area_no_wom_title",
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
	definitions_path = "scripts/ui/dlc_upsell/upsell_popup_definitions",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
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
	definitions_path = "scripts/ui/dlc_upsell/upsell_popup_definitions",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
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
	definitions_path = "scripts/ui/dlc_upsell/upsell_popup_definitions",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
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
	definitions_path = "scripts/ui/dlc_upsell/upsell_popup_definitions",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
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
	definitions_path = "scripts/ui/dlc_upsell/upsell_popup_definitions",
	ok_button_text = "menu_close",
	popup_type = "upsell",
	title_text = "upsell_popup_new_career_title",
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
CommonPopupSettings.anniversary = {
	background_texture = "event_upsell_anniversary",
	body_text = "popup_active_event_flavour_text",
	button_text = "menu_close",
	class_name = "ActiveEventPopup",
	definitions_path = "scripts/ui/active_event/active_event_popup_definitions",
	event_name = "Anniversary",
	popup_type = "active_event",
	action_buttons = {
		{
			button_text = "popup_button_open_store_event_tab",
			on_pressed = function ()
				Managers.ui:handle_transition("hero_view_force", {
					menu_state_name = "store",
					use_fade = true,
					menu_sub_state_name = {
						"cosmetics",
						"event",
					},
				})
			end,
		},
		{
			button_text = "popup_button_open_weekly_challenges",
			on_pressed = function ()
				Managers.ui:handle_transition("hero_view_force", {
					menu_state_name = "achievements",
					use_fade = true,
					menu_sub_state_name = {
						{
							layout_name = "quest",
						},
						{
							tab_index = 3,
						},
					},
				})
			end,
		},
		{
			button_text = "popup_button_open_mission_selection_event_tab",
			on_pressed = function ()
				Managers.ui:handle_transition("start_game_view_force", {
					menu_state_name = "play",
					menu_sub_state_name = "event",
					use_fade = true,
				})
			end,
		},
	},
	input_desc = {
		actions = {
			{
				description_text = "menu_close",
				input_action = "back",
				priority = 1,
			},
		},
	},
}
CommonPopupSettings.default_event = {
	background_texture = "event_upsell_default",
	body_text = "popup_weekly_event_flavour_text",
	button_text = "menu_close",
	class_name = "ActiveEventPopup",
	definitions_path = "scripts/ui/active_event/active_event_popup_definitions",
	popup_type = "active_event",
	action_buttons = {
		{
			button_text = "popup_button_open_mission_selection_event_tab",
			on_pressed = function ()
				Managers.ui:handle_transition("start_game_view_force", {
					menu_state_name = "play",
					menu_sub_state_name = "event",
					use_fade = true,
				})
			end,
		},
	},
	input_desc = {
		actions = {
			{
				description_text = "menu_close",
				input_action = "back",
				priority = 1,
			},
		},
	},
}
CommonPopupSettings.skulls = {
	background_texture = "event_upsell_skulls",
	body_text = "popup_active_event_flavour_text",
	button_text = "menu_close",
	class_name = "ActiveEventPopup",
	definitions_path = "scripts/ui/active_event/active_event_popup_definitions",
	event_name = "Skulls",
	popup_type = "active_event",
	action_buttons = {
		{
			button_text = "popup_button_open_store_event_tab",
			on_pressed = function ()
				Managers.ui:handle_transition("hero_view_force", {
					menu_state_name = "store",
					use_fade = true,
					menu_sub_state_name = {
						"cosmetics",
						"event",
					},
				})
			end,
		},
		{
			button_text = "popup_button_open_weekly_challenges",
			on_pressed = function ()
				Managers.ui:handle_transition("hero_view_force", {
					menu_state_name = "achievements",
					use_fade = true,
					menu_sub_state_name = {
						{
							layout_name = "quest",
						},
						{
							tab_index = 3,
						},
					},
				})
			end,
		},
		{
			button_text = "lb_game_type_quick_play",
			on_pressed = function ()
				Managers.ui:handle_transition("start_game_view_force", {
					menu_state_name = "play",
					menu_sub_state_name = "adventure",
					use_fade = true,
				})
			end,
		},
	},
	input_desc = {
		actions = {
			{
				description_text = "menu_close",
				input_action = "back",
				priority = 1,
			},
		},
	},
}

require("scripts/settings/handbook_settings")

for popup_id, popup_settings in pairs(HandbookSettings.popups) do
	CommonPopupSettings[popup_id] = {
		class_name = "HandbookPopup",
		definitions_path = "scripts/ui/dlc_upsell/handbook_popup_definitions",
		popup_type = "handbook",
		pages = popup_settings.pages,
	}
end
