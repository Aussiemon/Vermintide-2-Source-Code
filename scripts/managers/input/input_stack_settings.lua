-- chunkname: @scripts/managers/input/input_stack_settings.lua

DEFAULT_INPUT_GROUP = "GLOBAL"
InputStackSettings = {
	{
		group_name = "imgui",
		services = {
			"imgui",
		},
	},
	{
		group_name = "input",
		services = {
			"text_input",
		},
	},
	{
		group_name = "chat",
		services = {
			"chat_input",
		},
	},
	{
		group_name = "main_popups",
		services = {
			"popup",
		},
	},
	{
		group_name = "game_popups",
		services = {
			"weave_tutorial",
			"rewards_popups",
			"common_popup",
		},
	},
	{
		group_name = "network_popups",
		services = {
			"mission_voting",
			"popup_profile_picker",
		},
	},
	{
		group_name = "ui",
		services = {
			"Text",
			"dark_pact_selection",
		},
	},
	{
		group_name = "options",
		services = {
			"options_menu",
		},
	},
	{
		group_name = "ingame_ui",
		services = {
			"ingame_menu",
			"hero_view",
		},
	},
	{
		group_name = "cutscene",
		services = {
			"cutscene",
		},
	},
	{
		group_name = "console_friends_view",
		services = {
			"console_friends_view",
		},
	},
	{
		group_name = "hud_player_list",
		services = {
			"player_list_input",
		},
	},
	{
		group_name = "deus_shop",
		services = {
			"deus_shop_view",
		},
	},
	{
		group_name = "deus_map_view",
		services = {
			"deus_map_input_service_name",
		},
	},
}
InputServiceToGroupMap = {}

for group_id = 1, #InputStackSettings do
	local group_services = InputStackSettings[group_id].services

	for service_id = 1, #group_services do
		local service_name = group_services[service_id]

		InputServiceToGroupMap[service_name] = group_id
	end
end
