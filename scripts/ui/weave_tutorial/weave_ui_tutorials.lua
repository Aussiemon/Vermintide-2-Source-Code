local start_onboarding = 0
local before_first_weave = 4
local after_first_weave = 7
local after_second_weave = 9

require("scripts/ui/weave_tutorial/custom_popups/new_ui_popup")

WeaveUITutorials = WeaveUITutorials or {}
WeaveUITutorials.forge_initial = {
	ui_onboarding_bit = 1,
	popup_title = "menu_weave_tutorial_athanor_01_title",
	popup_sub_title = "menu_weave_tutorial_athanor_01_subtitle",
	popup_body = "menu_weave_tutorial_athanor_01_body",
	onboarding_step = start_onboarding
}
WeaveUITutorials.book_initial = {
	ui_onboarding_bit = 2,
	popup_title = "menu_weave_tutorial_weave_selection_01_title",
	popup_sub_title = "menu_weave_tutorial_weave_selection_01_subtitle",
	popup_body = "menu_weave_tutorial_weave_selection_01_body",
	onboarding_step = start_onboarding
}
WeaveUITutorials.forge_weapon = {
	ui_onboarding_bit = 4,
	popup_title = "menu_weave_tutorial_weapon_selection_01_title",
	popup_sub_title = "menu_weave_tutorial_weapon_selection_01_subtitle",
	popup_body = "menu_weave_tutorial_weapon_selection_01_body",
	onboarding_step = start_onboarding
}
WeaveUITutorials.equip_weapon = {
	popup_sub_title = "menu_weave_tutorial_weapon_selection_02_subtitle",
	ui_onboarding_bit = 8,
	popup_title = "menu_weave_tutorial_weapon_selection_02_title",
	delay = 1,
	popup_body = "menu_weave_tutorial_weapon_selection_02_body",
	onboarding_step = start_onboarding
}
WeaveUITutorials.amulet = {
	ui_onboarding_bit = 16,
	popup_title = "menu_weave_tutorial_athanor_02_title",
	popup_sub_title = "menu_weave_tutorial_athanor_02_subtitle",
	popup_body = "menu_weave_tutorial_athanor_02_body",
	onboarding_step = after_first_weave
}
WeaveUITutorials.temper_item = {
	popup_sub_title = "menu_weave_tutorial_item_01_subtitle",
	ui_onboarding_bit = 32,
	popup_title = "menu_weave_tutorial_item_01_title",
	delay = 1,
	popup_body = "menu_weave_tutorial_item_01_body",
	onboarding_step = after_first_weave
}
WeaveUITutorials.mastery = {
	popup_sub_title = "menu_weave_tutorial_item_02_subtitle",
	ui_onboarding_bit = 64,
	popup_title = "menu_weave_tutorial_item_02_title",
	delay = 1,
	popup_body = "menu_weave_tutorial_item_02_body",
	onboarding_step = after_first_weave
}
WeaveUITutorials.upgrade_forge = {
	ui_onboarding_bit = 128,
	popup_title = "menu_weave_tutorial_athanor_03_title",
	popup_sub_title = "menu_weave_tutorial_athanor_03_subtitle",
	popup_body = "menu_weave_tutorial_athanor_03_body",
	onboarding_step = after_second_weave
}
WeaveUITutorials.forge_upgrade = {
	ui_onboarding_bit = 256,
	onboarding_step = after_second_weave
}
WeaveUITutorials.requirements_not_met = {
	ui_onboarding_bit = 0,
	onboarding_step = 0,
	popup_title = "menu_weave_area_locked_title",
	popup_body = "menu_weave_area_locked_body"
}
WeaveUITutorials.twitch_not_supported_for_weaves = {
	ui_onboarding_bit = 0,
	popup_title = "menu_weave_play_title",
	optional_button_2 = "input_description_disconnect",
	onboarding_step = 0,
	popup_body = "menu_weave_area_locked_twitch_body",
	optional_button_2_func = function (self)
		local twitch_connection = Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated())

		if twitch_connection then
			Managers.twitch:disconnect()
		end
	end,
	optional_button_2_input_actions = {
		actions = {
			{
				input_action = "special_1",
				priority = 1,
				description_text = "input_description_disconnect"
			}
		}
	}
}
WeaveUITutorials.twitch_not_supported_for_weaves_client = {
	ui_onboarding_bit = 0,
	onboarding_step = 0,
	popup_title = "menu_weave_play_title",
	popup_body = "menu_weave_area_locked_twitch_client_body"
}
WeaveUITutorials.chat_info = {
	ui_onboarding_bit = 0,
	onboarding_step = 0,
	popup_title = "menu_chat_info_title",
	popup_body = "menu_chat_info_descripttion"
}
WeaveUITutorials.weave_quickplay_desc = {
	ui_onboarding_bit = 0,
	onboarding_step = 0,
	popup_title = "start_game_window_weave_quickplay_title",
	popup_body = "menu_weave_quick_play_body"
}
WeaveUITutorials.ranked_weave_desc = {
	ui_onboarding_bit = 0,
	onboarding_step = 0,
	popup_title = "start_game_window_ranked_weave_title",
	popup_body = "menu_ranked_weaves_body"
}
WeaveUITutorials.new_ui_disclaimer = {
	ui_onboarding_bit = 0,
	onboarding_step = 0,
	custom_popup = "NewUIPopup"
}
