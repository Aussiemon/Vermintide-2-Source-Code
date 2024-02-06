-- chunkname: @scripts/settings/dlcs/bless/bless_ui_settings.lua

require("scripts/utils/colors")

local settings = DLCSettings.bless

settings.ingame_hud_components = {
	{
		class_name = "PriestResourceBarUI",
		filename = "scripts/settings/dlcs/bless/priest_resource_bar_ui",
		use_hud_scale = true,
		visibility_groups = {
			"alive",
		},
	},
}
settings.gamepad_ability_ui_data = {
	wh_priest = {
		ability_effect = "gamepad_ability_effect_priest",
		ability_top_texture_id = "ability_glow_priest",
		always_show_activated_ability_input = false,
		lit_frame_id = false,
	},
}
settings.hud_inventory_panel_data = {
	wh_priest = {
		texture_id = "hud_inventory_panel_priest",
		texture_size = {
			624,
			111,
		},
	},
}
