local adventure_settings = local_require("scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure")
local common_settings = require("scripts/ui/hud_ui/component_list_definitions/hud_component_list_deus_common")
local deus_components = {
	{
		use_hud_scale = true,
		class_name = "DeusCurseUI",
		filename = "scripts/ui/hud_ui/deus_curse_ui",
		visibility_groups = {
			"alive"
		}
	},
	{
		use_hud_scale = true,
		class_name = "DeusRunStatsView",
		filename = "scripts/ui/views/deus_menu/deus_run_stats_view",
		visibility_groups = {
			"deus_run_stats",
			"game_mode_disable_hud",
			"dead",
			"alive"
		}
	}
}
local components = {}

table.append(components, adventure_settings.components)
table.append(components, common_settings.components)
table.append(components, deus_components)

local visibility_groups = {}

table.append(visibility_groups, common_settings.visibility_groups)
table.append(visibility_groups, adventure_settings.visibility_groups)

for i = 1, #deus_components do
	require(deus_components[i].filename)
end

return {
	components = components,
	visibility_groups = visibility_groups
}
