local start_onboarding = 0
local before_first_weave = 4
local after_first_weave = 7
local after_second_weave = 9
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

return