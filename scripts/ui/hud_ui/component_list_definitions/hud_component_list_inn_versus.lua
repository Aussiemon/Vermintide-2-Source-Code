-- chunkname: @scripts/ui/hud_ui/component_list_definitions/hud_component_list_inn_versus.lua

local adventure_settings = local_require("scripts/ui/hud_ui/component_list_definitions/hud_component_list_adventure")
local components = {}

table.append(components, adventure_settings.components)

local visibility_groups = {}

table.append(visibility_groups, adventure_settings.visibility_groups)

return {
	components = components,
	visibility_groups = visibility_groups,
}
