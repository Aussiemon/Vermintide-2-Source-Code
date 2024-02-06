-- chunkname: @scripts/ui/weave_tutorial/weave_ui_tutorials.lua

local start_onboarding = 0
local before_first_weave = 4
local after_first_weave = 7
local after_second_weave = 9

require("scripts/ui/weave_tutorial/custom_popups/new_ui_popup")

WeaveUITutorials = WeaveUITutorials or {}
WeaveUITutorials.forge_initial = {
	popup_body = "menu_weave_tutorial_athanor_01_body",
	popup_sub_title = "menu_weave_tutorial_athanor_01_subtitle",
	popup_title = "menu_weave_tutorial_athanor_01_title",
	ui_onboarding_bit = 1,
	onboarding_step = start_onboarding,
}
WeaveUITutorials.book_initial = {
	popup_body = "menu_weave_tutorial_weave_selection_01_body",
	popup_sub_title = "menu_weave_tutorial_weave_selection_01_subtitle",
	popup_title = "menu_weave_tutorial_weave_selection_01_title",
	ui_onboarding_bit = 2,
	onboarding_step = start_onboarding,
}
WeaveUITutorials.forge_weapon = {
	popup_body = "menu_weave_tutorial_weapon_selection_01_body",
	popup_sub_title = "menu_weave_tutorial_weapon_selection_01_subtitle",
	popup_title = "menu_weave_tutorial_weapon_selection_01_title",
	ui_onboarding_bit = 4,
	onboarding_step = start_onboarding,
}
WeaveUITutorials.equip_weapon = {
	delay = 1,
	popup_body = "menu_weave_tutorial_weapon_selection_02_body",
	popup_sub_title = "menu_weave_tutorial_weapon_selection_02_subtitle",
	popup_title = "menu_weave_tutorial_weapon_selection_02_title",
	ui_onboarding_bit = 8,
	onboarding_step = start_onboarding,
}
WeaveUITutorials.amulet = {
	popup_body = "menu_weave_tutorial_athanor_02_body",
	popup_sub_title = "menu_weave_tutorial_athanor_02_subtitle",
	popup_title = "menu_weave_tutorial_athanor_02_title",
	ui_onboarding_bit = 16,
	onboarding_step = after_first_weave,
}
WeaveUITutorials.temper_item = {
	delay = 1,
	popup_body = "menu_weave_tutorial_item_01_body",
	popup_sub_title = "menu_weave_tutorial_item_01_subtitle",
	popup_title = "menu_weave_tutorial_item_01_title",
	ui_onboarding_bit = 32,
	onboarding_step = after_first_weave,
}
WeaveUITutorials.mastery = {
	delay = 1,
	popup_body = "menu_weave_tutorial_item_02_body",
	popup_sub_title = "menu_weave_tutorial_item_02_subtitle",
	popup_title = "menu_weave_tutorial_item_02_title",
	ui_onboarding_bit = 64,
	onboarding_step = after_first_weave,
}
WeaveUITutorials.upgrade_forge = {
	popup_body = "menu_weave_tutorial_athanor_03_body",
	popup_sub_title = "menu_weave_tutorial_athanor_03_subtitle",
	popup_title = "menu_weave_tutorial_athanor_03_title",
	ui_onboarding_bit = 128,
	onboarding_step = after_second_weave,
}
WeaveUITutorials.forge_upgrade = {
	ui_onboarding_bit = 256,
	onboarding_step = after_second_weave,
}
WeaveUITutorials.requirements_not_met = {
	onboarding_step = 0,
	popup_body = "menu_weave_area_locked_body",
	popup_title = "menu_weave_area_locked_title",
	ui_onboarding_bit = 0,
}
WeaveUITutorials.twitch_not_supported_for_weaves = {
	onboarding_step = 0,
	optional_button_2 = "input_description_disconnect",
	popup_body = "menu_weave_area_locked_twitch_body",
	popup_title = "menu_weave_play_title",
	ui_onboarding_bit = 0,
	optional_button_2_func = function (self)
		local twitch_connection = Managers.twitch and (Managers.twitch:is_connected() or Managers.twitch:is_activated())

		if twitch_connection then
			Managers.twitch:disconnect()
		end
	end,
	optional_button_2_input_actions = {
		actions = {
			{
				description_text = "input_description_disconnect",
				input_action = "special_1",
				priority = 1,
			},
		},
	},
}
WeaveUITutorials.twitch_not_supported_for_weaves_client = {
	onboarding_step = 0,
	popup_body = "menu_weave_area_locked_twitch_client_body",
	popup_title = "menu_weave_play_title",
	ui_onboarding_bit = 0,
}
WeaveUITutorials.chat_info = {
	onboarding_step = 0,
	popup_body = "menu_chat_info_descripttion",
	popup_title = "menu_chat_info_title",
	ui_onboarding_bit = 0,
}
WeaveUITutorials.weave_quickplay_desc = {
	onboarding_step = 0,
	popup_body = "menu_weave_quick_play_body",
	popup_title = "start_game_window_weave_quickplay_title",
	ui_onboarding_bit = 0,
}
WeaveUITutorials.ranked_weave_desc = {
	onboarding_step = 0,
	popup_body = "menu_ranked_weaves_body",
	popup_title = "start_game_window_ranked_weave_title",
	ui_onboarding_bit = 0,
}
WeaveUITutorials.new_ui_disclaimer = {
	custom_popup = "NewUIPopup",
	onboarding_step = 0,
	ui_onboarding_bit = 0,
}
